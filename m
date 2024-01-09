Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4AE8286F9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C687E10E441;
	Tue,  9 Jan 2024 13:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFDA10E441
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:22:08 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a28cfca3c45so74957566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 05:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704806526; x=1705411326; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8nyMGssowFI2DlaMmQ3Tpss+UtDdR+faxTS8hNAvao=;
 b=bYCNvRQhBzZ5HshXmK1MFUh9zjdR3n32CimOUjHpH8IUHkICI+eLRWm7L1+TT0s93U
 ox/iTFSAEsKFgjqBkzDamEG/XM8jNAhuoGRbp74BQ2Ii/qLEW8V2ldnEBbs/UQYVN6QA
 wHkBcT12ufJKzJU+wwfsIEx0Tx+Obas2tZKMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704806526; x=1705411326;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8nyMGssowFI2DlaMmQ3Tpss+UtDdR+faxTS8hNAvao=;
 b=MJjmOWTgSyKB60Vd3S/YW36aIqrnaKglBBauz7G6+X9fXzABQkEJ+0Vd/f856rIju3
 23QoXuIoNaQ//VJZDqaW6vrO9kS2Wz4cgccAmXS/Vzp1yoK9NVHYp2t6Nq883HrHgs6Y
 nHtoK3keWbUgl0X1vdgML6W4l9+v2wv/EExOxYL8eGooz+Vl3XrT6EF8JkHGrD1CVZpZ
 f1TJetbapySsuqOdCQfLigZJGnCdVPdNNZoxeWyz19ku/zx0rCMJ1fKtm8dK7G70cjPe
 8l/tYIFu80S4PSBbp/aTIgEm5obBTqqwlwgwfc+hvOmTOdcI3Cbm7NAryUmzE35i3a/l
 pPbQ==
X-Gm-Message-State: AOJu0YxYf7FnDoJAQkO3TNf/Tj/JPYXUnfFVF6PZwcRCU3nbvK5G/TAp
 KfThrmIaPAKhhaej1+ax7u16RhTJcTjvVA==
X-Google-Smtp-Source: AGHT+IFi7RfzXVRLPVWIVsSbvJo+89aCiOIdxE8Is6w6/5ECdWmo4tLla9mz3sECM1F7viqHnFP/0w==
X-Received: by 2002:a17:907:9282:b0:a26:a4e8:5454 with SMTP id
 bw2-20020a170907928200b00a26a4e85454mr4655999ejc.0.1704806526503; 
 Tue, 09 Jan 2024 05:22:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a170906455700b00a27a32e6502sm1026398ejq.117.2024.01.09.05.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 05:22:05 -0800 (PST)
Date: Tue, 9 Jan 2024 14:22:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/imagination: Defer probe if requested firmware is
 not available
Message-ID: <ZZ1IellMvvyFlQaF@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240109120604.603700-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109120604.603700-1-javierm@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 01:05:59PM +0100, Javier Martinez Canillas wrote:
> The device is initialized in the driver's probe callback and as part of
> that initialization, the required firmware is loaded. But this fails if
> the driver is built-in and the firmware isn't present in the initramfs:
> 
> $ dmesg | grep powervr
> [    2.969757] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
> [    2.979727] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
> [    2.989885] powervr: probe of fd00000.gpu failed with error -2
> 
> $ ls -lh /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz
> -rw-r--r-- 1 root root 51K Dec 12 19:00 /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz
> 
> To prevent the probe to fail for this case, let's defer the probe if the
> firmware isn't available. That way, the driver core can retry it and get
> the probe to eventually succeed once the root filesystem has been mounted.
> 
> If the firmware is also not present in the root filesystem, then the probe
> will never succeed and the reason listed in the debugfs devices_deferred:
> 
> $ cat /sys/kernel/debug/devices_deferred
> fd00000.gpu     powervr: failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-517)
> 
> Fixes: f99f5f3ea7ef ("drm/imagination: Add GPU ID parsing and firmware loading")
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Uh that doesn't work.

Probe is for "I'm missing a struct device" and _only_ that. You can't
assume that probe deferral will defer enough until the initrd shows up.

You need to fix this by fixing the initrd to include the required
firmwares. This is what MODULE_FIRMWARE is for, and if your initrd fails
to observe that it's just broken.

Yes I know as long as you have enough stuff built as module so that there
will be _any_ kind of device probe after the root fs is mounted, this
works, because that triggers a re-probe of everything. But that's the most
kind of fragile fix there is.

If you want to change that then I think that needs an official blessing
from Greg KH/device core folks.

Cheers, Sima

> ---
> 
>  drivers/gpu/drm/imagination/pvr_device.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> index 1704c0268589..6eda25366431 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -295,8 +295,16 @@ pvr_request_firmware(struct pvr_device *pvr_dev)
>  	 */
>  	err = request_firmware(&fw, filename, pvr_dev->base.dev);
>  	if (err) {
> -		drm_err(drm_dev, "failed to load firmware %s (err=%d)\n",
> -			filename, err);
> +		/*
> +		 * Defer probe if the firmware is not available yet (e.g: the driver
> +		 * is built-in and the firmware not present in the initramfs image).
> +		 */
> +		if (err == -ENOENT)
> +			err = -EPROBE_DEFER;
> +
> +		dev_err_probe(drm_dev->dev, err, "failed to load firmware %s (err=%d)\n",
> +			      filename, err);
> +
>  		goto err_free_filename;
>  	}
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
