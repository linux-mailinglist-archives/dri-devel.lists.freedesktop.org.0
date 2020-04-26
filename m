Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7C1B8FDD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A66E2A5;
	Sun, 26 Apr 2020 12:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1952 seconds by postgrey-1.36 at gabe;
 Sun, 26 Apr 2020 08:24:24 UTC
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6989FDB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 08:24:24 +0000 (UTC)
Received: from vvs-ws.sw.ru ([172.16.24.21])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vvs@virtuozzo.com>)
 id 1jSc4V-0002AX-S7; Sun, 26 Apr 2020 10:51:28 +0300
Subject: Re: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the
 order in which resources are released
To: Caicai <caizhaopeng@uniontech.com>, Dave Airlie <airlied@redhat.com>
References: <20200418063917.26278-1-caizhaopeng () uniontech ! com>
From: Vasily Averin <vvs@virtuozzo.com>
Message-ID: <5488290f-fe60-874e-2b18-0327e877fdbc@virtuozzo.com>
Date: Sun, 26 Apr 2020 10:51:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418063917.26278-1-caizhaopeng () uniontech ! com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Zhangyueqian <zhangyueqian@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/20 9:39 AM, Caicai wrote:
> When a qxl resource is released, the list that needs to be released is
> fetched from the linked list ring and cleared. When you empty the list,
> instead of trying to determine whether the ttm buffer object for each
> qxl in the list is locked, you release the qxl object and remove the
> element from the list until the list is empty. It was found that the
> linked list was cleared first, and that the lock on the corresponding
> ttm Bo for the QXL had not been released, so that the new qxl could not
> be locked when it used the TTM. By adding an additional mutex to ensure
> timing, qxl elements are not allowed to be removed from the list until
> ttm Bo's lock is released

> @@ -241,7 +243,11 @@ int qxl_garbage_collect(struct qxl_device *qdev)
>  			}
>  			id = next_id;
>  
> +			mutex_lock(&release->async_release_mutex);
> +
>  			qxl_release_free(qdev, release);
> +
> +			mutex_unlock(&release->async_release_mutex);
It does not work,
release was freed inside qxl_release_free() so you cannot access here any its fields

>  			++i;
>  		}
>  	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
