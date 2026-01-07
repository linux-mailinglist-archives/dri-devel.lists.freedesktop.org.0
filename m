Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CBCFCAC9
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 09:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC1B10E0C8;
	Wed,  7 Jan 2026 08:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J1kmIXUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1765C10E08D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 08:49:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-59b25acdffbso1583243e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767775791; x=1768380591; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FSoaLhIuH1Zi1XVYK4RuIJm0c576Z9PwEYpKMgsWAtA=;
 b=J1kmIXUggiBpc302Jt1uNPMSknh602CT+1RoPG4qobYtLCsdHfg5dTfAO/Iv/2jCQa
 WdsDb8MDtPsT0sdz9PNdPuUv6980ewWRCdG6rH4T1ov57IRqj+nRUemZeWFJ0oLL9Fyc
 VHd0D0Y0c/jXuFbyl9wvGkqbwaX35rchDrf74nzxJwh33LYseR+J7E+h3Q2bWM6pOTPh
 TQtO8YaChQ2G2AfDWguV0MEh7LRkM7NAycwDtaIQaDmtJZ+0+Uk7X2wltMFDRDZWQEsj
 D7RoahI5GL/sjW99ETVlnO5nj8GU2jYOY/BxJDHt2mlhRVLaiYQl7MHejlOCAI86nz26
 KjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767775791; x=1768380591;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FSoaLhIuH1Zi1XVYK4RuIJm0c576Z9PwEYpKMgsWAtA=;
 b=lLBETtcaOadnNvvJvlqPn3Ppc5+BYKqpp/TqqyHgVbXBD7pS4PMg8vx64+iQ+RuPhV
 JGx2hZo7yy2Lj2apXmhtozDnVlNsLVxmdN3wdFg9eChu4XFK4/5383xcf0x3OXBHZfMe
 FiUcvqTxMyJ04CSnG56OSH+kr0VZVSByjPHYpk8cHxTJVA44XpAdBvmjsxDJTPDoX2h8
 S0nOT9fQnJsEUDLpR+2c4duxsVhSBhwAMt2xh+iTkMuIMjTSnM13WJIxKQprXsMacB3d
 NVOoMhoInM04Yio2BexEAvlbjVs5WZKxVmNGU6Gcxfr6RzqNNeEa3ID84ksTEObRQJbl
 zXsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjJK3bOHYWY/aMMf3Ezne+EKjxJ9StwRi4bbXk0gMnQn7EphqIFUhl7ssnDBn6+VxVRAkM3Jm+gjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt8DQzeWQqqqntbmMK1stYZOMqYDBTOBisdJPzXCOzqUW28pwG
 8JmGzy9FEFAGfDTk6MXFn2o2aF2mMa9BwA2mU6F+GsxTVb+PmYq8dcgXTLJR2hGCOCw=
X-Gm-Gg: AY/fxX7GmAYg4R8xJAimxIRRF9JGpfUT6ZJLjGkE/jOl/iYJBH8g9CjA/7C+sJ//5IO
 9CUTv55At8g/NTCmxEU+aZqBCX6NEdsfTCvNcWUB+PcnQg/id1uMTcwXfzwu/4An950ARnSGzUY
 j1xwfIoSWxShGZ1sR/tvJHD6MPSzHQuxaUQWsX+Nhbs/7T3qQQSq22Z4/yabBdXBDwrK7Vw9/MJ
 ZlyILFUtRgA6ArSELyEGexiyGOSLAp5EwICjMKrCk3SBL4WCsfhQR3/ORXz89dfB7D52LX4a3/F
 frPO7HK01W+ktRrR59B5m3qK6/L7LUk7y1V/diENEOAClwrRM5FTgm5YJ3z3qWP+4SxZPcasNkT
 wCzo3bvUeyYEwO/YBq8PcA6VN+3+JQqSWQofp/0Frz40D0KdG1ndMA9A63sygG6KcIDQXj9LMkX
 grKuRNThHl9D75E5+LS03HwCR/wP9lbEsdxtami00a626qf1Lh2jVQYhE=
X-Google-Smtp-Source: AGHT+IHBRlwXMZFBuxQXKLXYYbkgbRfzLpPmGOcIsytMeFZO2+c0XT3T+QaaepM7xLEpCuNQUQL4eg==
X-Received: by 2002:a05:6512:3c88:b0:598:ef90:3e87 with SMTP id
 2adb3069b0e04-59b6ef0c18dmr524880e87.18.1767775791133; 
 Wed, 07 Jan 2026 00:49:51 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65cea814sm1176668e87.12.2026.01.07.00.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 00:49:50 -0800 (PST)
Date: Wed, 7 Jan 2026 10:49:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aV4eLJfqeNqnDVxn@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska> <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
 <aV4SsKZ5eiayh18n@nuoska>
 <e53eeee6-8c6a-4ab7-b62f-2491efe19aeb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e53eeee6-8c6a-4ab7-b62f-2491efe19aeb@suse.de>
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

Hi,

On Wed, Jan 07, 2026 at 09:32:28AM +0100, Thomas Zimmermann wrote:
> Am 07.01.26 um 09:00 schrieb Mikko Rapeli:
> > On Tue, Jan 06, 2026 at 10:29:37AM +0200, Tomi Valkeinen wrote:
> > > On 06/01/2026 09:41, Thomas Zimmermann wrote:
> > > > Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
> > > > > On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> > > > > > On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> > > > > > > On 05/12/2025 14:37, Mikko Rapeli wrote:
> > > > > > > > Currently on default yocto images Xorg fails to start on AMD KV260
> > > > > > > > because 24/32 color depth gets detected but does not actually work.
> > > > > > > > 
> > > > > > > > These two patches fix the issue and now 16 bpp gets detected
> > > > > > > > and Xorg starts and draws on external HDMI display using
> > > > > > > > kernel.org based linux-yocto kernel.
> > > > > > > > 
> > > > > > > > Anatoliy Klymenko (1):
> > > > > > > >     drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > > > > > > > 
> > > > > > > > Mikko Rapeli (1):
> > > > > > > >     drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > > > > > > > 
> > > > > > > >    drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> > > > > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > Did you notice the few already sent serieses on the list where the
> > > > > > > topic
> > > > > > > has been discussed?
> > > > > > > [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> > > > > > > [PATCH 0/3] drm: zynqmp: Make the video plane primary
> > > > > > Oh I wasn't aware of these.
> > > > > > 
> > > > > > > Or is there something else on KV260 that messes up the 24 bit color?
> > > > > > These look very similar and likely fix the X11 startup. I will give them
> > > > > > a try.
> > > > > Right, now I've tested:
> > > > > 
> > > > >    * these patches from Anatoliy and me to help X11 use 16bpp mode by
> > > > > default
> > > > >      and removes the need to manually setup Xorg for 16bpp
> > > > >    * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
> > > > > the X11 default
> > > > >      24bpp to work, no need to set Xorg config to 16bpp
> > > > >    * "drm: zynqmp: Make the video plane primary" which also fixes the
> > > > > X11 default
> > > > >      24bpp to work, no need to set Xorg config to 16bpp
> > > > > 
> > > > > All of these fix HDMI graphics output on AMD KV260 board with yocto
> > > > > genericarm64 machine
> > > > > and core-image-sato image which includes Xorg. The graphics rendering
> > > > > is still
> > > > > very slow but I think that is a different problem.
> > > > > 
> > > > > I guess the last series from Sean Anderson is moving forward so I'll
> > > > > reply to that thread separately.
> > > > Just want to say that the series here improves xlnx and makes it a
> > > > 'better' driver. IMHO the changes should be merged independently from
> > > > what happens with the other series.
> > > I might be missing something, but I don't think I fully agree. Yes, the
> > > userspace doesn't seem to be able to cope with the current upstream
> > > driver behavior (even if it's not wrong as such, afaics), so in that
> > > sense this series is better. But I don't think (almost) anyone really
> > > wants to use RGB565 if XRGB8888 is an option? And that's what the other
> > > series is trying to achieve, and that series conflicts with this one.
> > > 
> > > So I'd rather try to get a conclusion on Sean's series (or the other one
> > > from Mike). If that effort fails, we could go with this series as a backup.
> > I did testing of all three different patch series'es on AMD KV260 and
> > did not find any performance difference between them. The Xorg
> > rendering is still very slow to an external HDMI display.
> > 
> > I don't have an opinion on the graphics formats but just want something
> > out to a display by default. I think there is a lot more to fix to get
> > the performance into usable state.
> 
> I briefly looked through the xlnx driver and found several things to try.
> 
> * The update code in [1] appears to always update the whole buffer. Setting
> drm_plane_enable_fb_damage_clips() for the planes will enable damage
> handling. Then flushing only the damaged areas might improve performance.
> 
> * The driver could set drm_device.mode_config.prefer_shadow to make Xorg use
> a shadow buffer in user space. This often works for devices with discrete
> VRAM.  IDK if non-X compositors also benefit from this.
> 
> * If the hardware supports it, setting non-coherent DMA mappings could
> enable caching on the memory buffers. The driver would then have to enable
> damage clips and flush caches by itself where necessary.
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.18.3/source/drivers/gpu/drm/xlnx/zynqmp_disp.c#L1109

There is also the official AMD/Xilinx kernel tree with a lot more patches
which have not been upstreamed yet:

https://github.com/Xilinx/linux-xlnx/commits/master/drivers/gpu/drm/xlnx

I wasn't sure which of these changes fix the X11 startup issues but came up
with the 16bit patches since they are so simple and avoid doing the same
in Xorg config file.

Would be nice to get these AMD patches upstreamed, for example one subsystem
at a time.

Cheers,

-Mikko
