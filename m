Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F01BD4E6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38936ECAF;
	Wed, 29 Apr 2020 06:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788956EC84
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 06:13:10 +0000 (UTC)
Received: from vvs-ws.sw.ru ([172.16.24.21])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vvs@virtuozzo.com>)
 id 1jTfxf-0005DQ-K4; Wed, 29 Apr 2020 09:12:47 +0300
Subject: Re: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the
 order in which resources are rele
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200421084300.zggroiptwbrblzqy () sirius ! home ! kraxel ! org>
From: Vasily Averin <vvs@virtuozzo.com>
Message-ID: <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
Date: Wed, 29 Apr 2020 09:12:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421084300.zggroiptwbrblzqy () sirius ! home ! kraxel ! org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "Denis V. Lunev" <den@virtuozzo.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org\"" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Zhangyueqian <zhangyueqian@uniontech.com>, Dave Airlie <airlied@redhat.com>,
 Caicai <caizhaopeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/21/20 11:43 AM, Gerd Hoffmann wrote:
> On Sat, Apr 18, 2020 at 02:39:17PM +0800, Caicai wrote:
>> When a qxl resource is released, the list that needs to be released is
>> fetched from the linked list ring and cleared. When you empty the list,
>> instead of trying to determine whether the ttm buffer object for each
>> qxl in the list is locked, you release the qxl object and remove the
>> element from the list until the list is empty. It was found that the
>> linked list was cleared first, and that the lock on the corresponding
>> ttm Bo for the QXL had not been released, so that the new qxl could not
>> be locked when it used the TTM.
> 
> So the dma_resv_reserve_shared() call in qxl_release_validate_bo() is
> unbalanced?  Because the dma_resv_unlock() call in
> qxl_release_fence_buffer_objects() never happens due to
> qxl_release_free_list() clearing the list beforehand?  Is that correct?

we observe similar issue: RHEL7 guests crashes in 
qxl_draw_opaque_fb()
 qxl_release_fence_buffer_objects() 

crashdump investigation shows that qlx_object was freed and reused,
so its original content was re-written.

At the same time qxl_device have empty release_idr,
ant there are no allocated qxl_bo_list entries.
i.e. qxl_release_free was really called.

> The only way I see for this to happen is that the guest is preempted
> between qxl_push_{cursor,command}_ring_release() and
> qxl_release_fence_buffer_objects() calls.  The host can complete the qxl
> command then, signal the guest, and the IRQ handler calls
> qxl_release_free_list() before qxl_release_fence_buffer_objects() runs.

We think the same: qxl_release was freed by garbage collector before
original thread had called qxl_release_fence_buffer_objects().

> Looking through the code I think it should be safe to simply swap the
> qxl_release_fence_buffer_objects() +
> qxl_push_{cursor,command}_ring_release() calls to close that race
> window.  Can you try that and see if it fixes the bug for you?

I'm going to prepare and test such patch but I have one question here:
qxl_push_*_ring_release can be called with  interruptible=true and fail
How to correctly handle this case? Is the hunk below correct from your POV?

--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -261,12 +261,8 @@ static int qxl_process_single_command(struct qxl_device *qdev,
                        apply_surf_reloc(qdev, &reloc_info[i]);
        }
 
+       qxl_release_fence_buffer_objects(release);
        ret = qxl_push_command_ring_release(qdev, release, cmd->type, true);
-       if (ret)
-               qxl_release_backoff_reserve_list(release);  <<<< ????
-       else
-               qxl_release_fence_buffer_objects(release);
-
 out_free_bos:
 out_free_release:


Thank you,
	Vasily Averin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
