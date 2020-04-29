Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AB1BD745
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9536ECE3;
	Wed, 29 Apr 2020 08:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DB6ECE3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588148922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=307isNnvbFBLVIHqWZVI02AT/E09cU5NkzO3QxAC0lI=;
 b=M9OcU9Unhp4Gve3yeLhAKkzbd8BsWhj8Q/56tXF7aJ/nXVcIGm0vHN2mhyoLER16woQctH
 wMnGMqrSdf2FRF4vk5yAOD4SCdz1k0vJLsDpRSsppLWst7pwCdtGHqt6rloY2eTcnopiU4
 MmbTwCfFWX2RNd3UwghNz0TbDCRc7MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-ETodXgd1OBKAK3jUQcuNEw-1; Wed, 29 Apr 2020 04:28:41 -0400
X-MC-Unique: ETodXgd1OBKAK3jUQcuNEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81BFD45F;
 Wed, 29 Apr 2020 08:28:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B6F5D9E5;
 Wed, 29 Apr 2020 08:28:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFF5E1753B; Wed, 29 Apr 2020 10:28:37 +0200 (CEST)
Date: Wed, 29 Apr 2020 10:28:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the
 order in which resources are rele
Message-ID: <20200429082837.uedcapxmennuc5a2@sirius.home.kraxel.org>
References: <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

  Hi,

> > The only way I see for this to happen is that the guest is preempted
> > between qxl_push_{cursor,command}_ring_release() and
> > qxl_release_fence_buffer_objects() calls.  The host can complete the qxl
> > command then, signal the guest, and the IRQ handler calls
> > qxl_release_free_list() before qxl_release_fence_buffer_objects() runs.
> 
> We think the same: qxl_release was freed by garbage collector before
> original thread had called qxl_release_fence_buffer_objects().

Ok, nice, I think we can consider the issue being analyzed then ;)

> > Looking through the code I think it should be safe to simply swap the
> > qxl_release_fence_buffer_objects() +
> > qxl_push_{cursor,command}_ring_release() calls to close that race
> > window.  Can you try that and see if it fixes the bug for you?
> 
> I'm going to prepare and test such patch but I have one question here:
> qxl_push_*_ring_release can be called with  interruptible=true and fail
> How to correctly handle this case? Is the hunk below correct from your POV?

Oh, right, the error code path will be quite different, checking ...

> --- a/drivers/gpu/drm/qxl/qxl_ioctl.c
> +++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
> @@ -261,12 +261,8 @@ static int qxl_process_single_command(struct qxl_device *qdev,
>                         apply_surf_reloc(qdev, &reloc_info[i]);
>         }
>  
> +       qxl_release_fence_buffer_objects(release);
>         ret = qxl_push_command_ring_release(qdev, release, cmd->type, true);
> -       if (ret)
> -               qxl_release_backoff_reserve_list(release);  <<<< ????
> -       else
> -               qxl_release_fence_buffer_objects(release);
> -
>  out_free_bos:
>  out_free_release:
	if (ret)
		qxl_release_free(qdev, release);

[ code context added ]

qxl_release_free() checks whenever a release is fenced and signals the
fence in case it is so it doesn't wait for the signal forever.  So, yes,
I think qxl_release_free() should cleanup the release properly in any
case and the patch chunk should be correct.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
