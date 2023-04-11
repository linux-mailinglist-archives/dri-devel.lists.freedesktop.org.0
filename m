Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C36DDD29
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525BA10E327;
	Tue, 11 Apr 2023 14:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8686310E327
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681221816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CIGXauWS2Wr91Jq5IW+UgW4CSynzPp3COFUoOkdMkhA=;
 b=FzydlkumLHMVM9OsUFfK4os7M9gci/UOqBNKCFWI/oBe4fAJ70u6zmwCz+hDctx+Yj33jy
 gwmozQIwKYzbvaaYquyViJplWxuEuwnOxpk+x1hgdheohiGJxfjiv2FmQaiiVUa2K52TTT
 CzAFcqTk+mRIM5JF9c+k8FXArWLdRNQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-MUVXAd_VNwaGV2TUXaKSVg-1; Tue, 11 Apr 2023 10:03:29 -0400
X-MC-Unique: MUVXAd_VNwaGV2TUXaKSVg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso15918422wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681221808;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIGXauWS2Wr91Jq5IW+UgW4CSynzPp3COFUoOkdMkhA=;
 b=oIWKbvz+WgH1rkyyZgUZw42O5qubQN4iOfJq/DiBs0rjFIJMOSA9O2INR3T0Jznxyy
 IS5s+CNDDme4+/m3eLHabV8XoBP0eeBB7muuKZw7Te6/h1uHy/I2weQFGJdiR/Pxl5YZ
 oIMaJpt2SzE7dj8+9h58WousR2rcukBgvEUeU5XB5R2EgJg60cM72kDhk0IRy1d6Fep7
 afi/kFSUuAdsl29+WC0+vfRm1rMfSl09+WRU8eDvYGf6rVfCYDwEwTKQ9uSobUr+SpM6
 3gW73lhHQZ2o2kMkyLmxOg1IDZJxBJ7F7HuSHyK7ypTPUVVMZkEA2R/j3DSVyqQ+SkkS
 HmmQ==
X-Gm-Message-State: AAQBX9d0Adj8A2xwqaZ6yCa3nwmiSncdpGkURw1jAZ+sypFQ6JIf7NJN
 AqqHy+JL9nnChuhcuoSIvMM/1wDM+3vHvOIXIw6z0nvjVVu7cmTCz3kWA+lb7z81Ex+QfLhiWA+
 lQi/o8f6VsVV/bMzmej8agDDbhIfs
X-Received: by 2002:a05:600c:246:b0:3ef:62c6:9930 with SMTP id
 6-20020a05600c024600b003ef62c69930mr2272902wmj.3.1681221808152; 
 Tue, 11 Apr 2023 07:03:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350aKiEZG2/eTE3qgJobPobJFBtpp/GDgmMcutPCUe6o6pFTDe6EfUfpz+ooaKEyqriEN7AUpYw==
X-Received: by 2002:a05:600c:246:b0:3ef:62c6:9930 with SMTP id
 6-20020a05600c024600b003ef62c69930mr2272867wmj.3.1681221807826; 
 Tue, 11 Apr 2023 07:03:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003ee443bf0c7sm20919284wms.16.2023.04.11.07.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:03:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
In-Reply-To: <20230404193934.472457-1-daniel.vetter@ffwll.ch>
References: <20230404193934.472457-1-daniel.vetter@ffwll.ch>
Date: Tue, 11 Apr 2023 16:03:24 +0200
Message-ID: <874jpmtt1v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Shigeru Yoshida <syoshida@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>, shlomo@fastmail.com,
 Nathan Chancellor <natechancellor@gmail.com>, stable@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Peter Rosin <peda@axentia.se>,
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> This is an oversight from dc5bdb68b5b3 ("drm/fb-helper: Fix vt
> restore") - I failed to realize that nasty userspace could set this.
>
> It's not pretty to mix up kernel-internal and userspace uapi flags
> like this, but since the entire fb_var_screeninfo structure is uapi
> we'd need to either add a new parameter to the ->fb_set_par callback
> and fb_set_par() function, which has a _lot_ of users. Or some other
> fairly ugly side-channel int fb_info. Neither is a pretty prospect.
>
> Instead just correct the issue at hand by filtering out this
> kernel-internal flag in the ioctl handling code.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Fixes: dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore")

[..]

> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 875541ff185b..3fd95a79e4c3 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1116,6 +1116,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  	case FBIOPUT_VSCREENINFO:
>  		if (copy_from_user(&var, argp, sizeof(var)))
>  			return -EFAULT;
> +		/* only for kernel-internal use */
> +		var.activate &= ~FB_ACTIVATE_KD_TEXT;
>  		console_lock();

I don't have a better idea on how to fix this and as you said the whole
struct fb_var_screeninfo is an uAPI anyways...

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

