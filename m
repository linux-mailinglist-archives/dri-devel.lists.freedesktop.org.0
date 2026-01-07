Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0DCFC7B3
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 09:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B632210E1F6;
	Wed,  7 Jan 2026 08:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YZ1bCxkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFCE10E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 08:00:53 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-59b6f267721so493276e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 00:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767772852; x=1768377652; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VhnBpr7196+FOJUvDq4alYkgMDcX0xTE5ToCjAvUb4M=;
 b=YZ1bCxknfFypS6aPD6HLyAltHAHae280jqFdIAJXFFeG9JTMak0tEnMxNI/Z1D2TIg
 cVnMyV17b88uNuATtLzKZe/10c8iou0iJUli40qPE4teg+QCl/8Q2Xv+KIet5Xkiik3I
 sn+bFJ5ehWYN/WwzAfYzvdk1Xfaii+Tlw28YfubJkOs1BD20fU8O7XQzKO3dniCBaP8u
 ccE2a6SDj4zZ4jj2FS4kB3xfYJgQmGkhCrNnoLbcVOdSIkCo70kPX9NrSoI214flxGCR
 +0pbijGA3t+D8iWT6GoNC80qKVWi9XiF0BNpDq+74jEIM34/VLz2HW86rg8KBbvIRUtm
 nZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767772852; x=1768377652;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhnBpr7196+FOJUvDq4alYkgMDcX0xTE5ToCjAvUb4M=;
 b=KPa1EL0P8SHvN+FuYuKxRbK/8lURhJWbflsGgznfxcxYohnn9enQJo9hgWJP6SCVri
 ts/eYxvTiFsFWlEa8yEAVJAlCvHN62gG1RNI51ZujRO6tBMVbOV2BwM4jLtBBJrXBO6D
 6L+LTqUrHh+5CZi0BLK+jBLfn+f+S8ZggdElVASzBu02CGVh3PF+R+64Vy9YeakDZ1dt
 ssA17MoP0g+N1odmjGysMEBa3YFT9WRQhS7VlOl5yU4U7D3531c8LLhVwtaBqVnkQW2o
 +Nf1bjQLVOCiwAFFJq0d4lu8YnQjERp5LvEM9UpMEFSFCPq9yzn2T4I7fWtg0LtHDD4H
 xuLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVED4M8mpnvdbnuYFoatIYctirSmWilczflXcphx+Z0rGZPuAs3S4KQKWx/n/a0S0fYXIm7fi97VjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuanpCihNVYx7Mh0bIrXPqGO7LYjZe8eDBqoBeTsELRG+JbkG2
 qSHe1T4ZBZ8kCdjrqBrB6pu3g4xPFBfgUgmHP9dC+Gutr77LbFrrSMGG8eyA9CTyaus=
X-Gm-Gg: AY/fxX5gPZlq2xhV5b6sV+yUCO1z+xyLAVw2jO/cTjrbmvXogEGUkcOObHZFR8h/mC0
 np3LNdmfBMRajUbKP4USQOTk/Z3G5065EerUQkYwyWeQRZ20viSoDWgKiqobBIkDfBuTsL5TX6X
 pwF7171t1EycGMxU7MorLr2CNKh4AVZxaAYGhdgR7r0a2q25QX6DX+j9VJ/TQKaEqByKgDF5I0d
 EQBedxczxc9Ob5xtwYdstVFX8XoMJWSZD9/85udZKb2gDSbB+HbRxwuSHJb1KTTZKoAjAQyudAq
 RVs+FJlQnw0YACkfbWnygIv+8UqhXT5hjTHA3G+PVsmAxMBpLwBrWqphAG83jk7goeqKLmIIaoA
 ghvjeifhvCGQRQ97j7RQQ1txVE9uEyenGUQ8zRLLVzxozk8SYNPUc1svnRatWQbDnfcVhrmuL+8
 CYJrIuQctjuG7+T9Z3XSHylQjnBv57MOhYgU+ffsqRn4LjxiFltrFgBIY=
X-Google-Smtp-Source: AGHT+IGP9An1nYsAtOO925vmyDQ8zlULnKIWzpU5EiZN7i69pmtbFARTzBugqgf6PV60tIxYNMlI5A==
X-Received: by 2002:a05:6512:131e:b0:59b:2670:aa5 with SMTP id
 2adb3069b0e04-59b6f0420c0mr461240e87.37.1767772851534; 
 Wed, 07 Jan 2026 00:00:51 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65cea814sm1150596e87.12.2026.01.07.00.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 00:00:50 -0800 (PST)
Date: Wed, 7 Jan 2026 10:00:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aV4SsKZ5eiayh18n@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska> <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
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

On Tue, Jan 06, 2026 at 10:29:37AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/01/2026 09:41, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
> >> Hi,
> >>
> >> On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> >>> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> >>>> On 05/12/2025 14:37, Mikko Rapeli wrote:
> >>>>> Currently on default yocto images Xorg fails to start on AMD KV260
> >>>>> because 24/32 color depth gets detected but does not actually work.
> >>>>>
> >>>>> These two patches fix the issue and now 16 bpp gets detected
> >>>>> and Xorg starts and draws on external HDMI display using
> >>>>> kernel.org based linux-yocto kernel.
> >>>>>
> >>>>> Anatoliy Klymenko (1):
> >>>>>    drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> >>>>>
> >>>>> Mikko Rapeli (1):
> >>>>>    drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> >>>>>
> >>>>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> >>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>
> >>>> Did you notice the few already sent serieses on the list where the
> >>>> topic
> >>>> has been discussed?
> >>>> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> >>>> [PATCH 0/3] drm: zynqmp: Make the video plane primary
> >>> Oh I wasn't aware of these.
> >>>
> >>>> Or is there something else on KV260 that messes up the 24 bit color?
> >>> These look very similar and likely fix the X11 startup. I will give them
> >>> a try.
> >> Right, now I've tested:
> >>
> >>   * these patches from Anatoliy and me to help X11 use 16bpp mode by
> >> default
> >>     and removes the need to manually setup Xorg for 16bpp
> >>   * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
> >> the X11 default
> >>     24bpp to work, no need to set Xorg config to 16bpp
> >>   * "drm: zynqmp: Make the video plane primary" which also fixes the
> >> X11 default
> >>     24bpp to work, no need to set Xorg config to 16bpp
> >>
> >> All of these fix HDMI graphics output on AMD KV260 board with yocto
> >> genericarm64 machine
> >> and core-image-sato image which includes Xorg. The graphics rendering
> >> is still
> >> very slow but I think that is a different problem.
> >>
> >> I guess the last series from Sean Anderson is moving forward so I'll
> >> reply to that thread separately.
> > 
> > Just want to say that the series here improves xlnx and makes it a
> > 'better' driver. IMHO the changes should be merged independently from
> > what happens with the other series.
> I might be missing something, but I don't think I fully agree. Yes, the
> userspace doesn't seem to be able to cope with the current upstream
> driver behavior (even if it's not wrong as such, afaics), so in that
> sense this series is better. But I don't think (almost) anyone really
> wants to use RGB565 if XRGB8888 is an option? And that's what the other
> series is trying to achieve, and that series conflicts with this one.
> 
> So I'd rather try to get a conclusion on Sean's series (or the other one
> from Mike). If that effort fails, we could go with this series as a backup.

I did testing of all three different patch series'es on AMD KV260 and
did not find any performance difference between them. The Xorg
rendering is still very slow to an external HDMI display.

I don't have an opinion on the graphics formats but just want something
out to a display by default. I think there is a lot more to fix to get
the performance into usable state.

Cheers,

-Mikko
