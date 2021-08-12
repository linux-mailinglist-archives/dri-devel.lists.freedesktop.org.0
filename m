Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313B3EA203
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 11:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D816E3AA;
	Thu, 12 Aug 2021 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id A41CB6E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id D23AC20201B;
 Thu, 12 Aug 2021 11:26:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TkZ1FcLJEcwf; Thu, 12 Aug 2021 11:26:30 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 5295820201A;
 Thu, 12 Aug 2021 11:26:30 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mE6yq-0001ax-Tb; Thu, 12 Aug 2021 11:26:28 +0200
To: Mark Yacoub <markyacoub@chromium.org>, seanpaul@chromium.org,
 abhinavk@codeaurora.org, robdclark@chromium.org, irlied@linux.ie,
 dri-devel@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>
References: <20210811175525.2125964-1-markyacoub@chromium.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm: Copy drm_wait_vblank request and copy_to_user before
 return.
Message-ID: <de7e8dc0-b73d-f6c2-e017-121b5dc0df83@daenzer.net>
Date: Thu, 12 Aug 2021 11:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811175525.2125964-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-11 7:55 p.m., Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Userspace should get back a copy of the request that's been modified
> even when drm_wait_vblank_ioctl returns a failure.
> 
> Rationale:
> drm_wait_vblank_ioctl modifies the request and expects the user to read
> back. When the type is RELATIVE, it modifies it to ABSOLUTE and updates
> the sequence to become current_vblank_count + sequence (which was
> relative), not it becomes absolute.
> drmWaitVBlank (in libdrm), expects this to be the case as it modifies
> the request to be Absolute as it expects the sequence to would have been
> updated.
> 
> The change is in compat_drm_wait_vblank, which is called by
> drm_compat_ioctl. This change of copying the data back regardless of the
> return number makes it en par with drm_ioctl, which always copies the
> data before returning.
> 
> [How]
> Copy the drm_wait_vblank request.
> Return from the function after everything has been copied to user.
> 
> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> Tested on ChromeOS Trogdor(msm)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_ioc32.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index d29907955ff79..275b860df8fbe 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -855,17 +855,19 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
>  	req.request.sequence = req32.request.sequence;
>  	req.request.signal = req32.request.signal;
>  	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
> -	if (err)
> -		return err;
>  
>  	req32.reply.type = req.reply.type;
>  	req32.reply.sequence = req.reply.sequence;
>  	req32.reply.tval_sec = req.reply.tval_sec;
>  	req32.reply.tval_usec = req.reply.tval_usec;
> +	/* drm_wait_vblank_ioctl modifies Request, update their values here as well. */
> +	req32.request.type = req.request.type;
> +	req32.request.sequence = req.request.sequence;
> +	req32.request.signal = req.request.signal;

The added assignments are superfluous, since req32.reply and req32.request are members of the same union.


>  	if (copy_to_user(argp, &req32, sizeof(req32)))
>  		return -EFAULT;
>  
> -	return 0;
> +	return err;
>  }

The other changes look correct.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
