Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BBA3C637
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A20210E357;
	Wed, 19 Feb 2025 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MOwTvO85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8D810E357
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:28:48 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30a29f4bd43so163971fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739986127; x=1740590927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zCXULtz+TfbEIUzv+aPcSIYu9fSixmaT70fYxAi2ec0=;
 b=MOwTvO85qPXraM9tj2WnDDjFEn1LcS7ZueryMHqnS+zQtDxJO0ojIxX7ixue+Ce/y2
 DFTn8mFWgqacZBR6/28P75Ea9LRq/uxcOJTdsn1y8OPSjorf4ezK3aNkvl1pgaQn2iN0
 DaKpiuz5ohSlT9zukp8F7BhNU/3VBbhKt9oH4xAE27OoaLPWvjTf7JrkKGAeCXOzPv40
 aFs3uRV68CykMEhmahg8ewHYYQIRwHJaMXi5k9dKOE+x6uJdRm3fjB9Su0FQ9PNRsgEh
 RY/Xnxh6Llb47M8WcphvKvHdBN/i/3Uz3e53JT5QMpE/OINN/ZirM2Tq63nBLgxOZ0Yk
 kaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739986127; x=1740590927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCXULtz+TfbEIUzv+aPcSIYu9fSixmaT70fYxAi2ec0=;
 b=PfMcFGY4LOcpwcBP7lyMsNScyNW71VXmwGfC2GKEDCZ3blYI54juXB1gSAaD4aJ26X
 XlsOFQuQ3Sd3S7DY+LwYU7nug9Th9Y1ahX40tJqphTRanvpbFymJgzo5DuxYi/eNawX8
 dmf5I9oDuDoEQJNSemQyS9sRKVT+qnF9woR4XlBPkGEU9l5qZYBED9sAn55gltYnBKFM
 YyfwlqVzuAinn4qbioEy7pdmNAz2nmRmqnidiHAG0QVgUpTZPgjdRGOnJi6S5gF5g4Y/
 0WAQJwelM5T/ZIgf6UeVqFJGb24kSu0m27jw7J4qn14YLfWXX8LK31wMD1sHWENN/pfW
 ld2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyZdnObJ6aYYVEhXqD4e30A0+Bwy1JFGZCPiBct2LHJ7EUrciW4D8UZihxeBgrJZ1GG7kJBIQ+IY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwRz7qh8u+f587rf8IAP38nCr9OCE4AYCZEBwVHQLqYbMz6ZBu
 dhcldzfrTODeLnMPulYFwlBfw8VIdyHe2wGZLG85yn6/own84/W1FCwM3ntpt7c=
X-Gm-Gg: ASbGncvDUdFlBIpEbmVfGje0mDwJatj99T5YWX0iBU8iEBT2ljlCKMovRiNLdYRxnJH
 uUJbLW8VDhs8TyGtLuj2mufpMP6+Yuu6/iE7pWqi9zZKYXLWNCm7LfDLUaajBiZvwgge+MRzOy7
 HsBpz0wLiYtRRomDPcR6IKRZGprrsFzmDsJ050GVIoeDi+zipGfAe/gXiz1HxHpxQ7HvgUJIxE6
 dVUWfm1nJ4m58QQ5LeB/FgYI6o3kMhJYkb8IJ1iQLhJwQ/dZujZQkFWjUapYkJtz54HRBwcaOrU
 gRfmb0DZEVSEuBnUZ4wK33jjAloOZQLf20Roa8y6RbL/4zEEwi/H0HVzI4fcBQkftHrlvno=
X-Google-Smtp-Source: AGHT+IESuJWqXNXUiZl0M/R+WM8qXHx9smX+DwiL2S6QGonn1pTBFk2AxnVmvzXppPQRcAtEABXWIw==
X-Received: by 2002:a2e:9b0c:0:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-30a4502608bmr15251471fa.28.1739986127105; 
 Wed, 19 Feb 2025 09:28:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309216aa863sm19168511fa.98.2025.02.19.09.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:28:45 -0800 (PST)
Date: Wed, 19 Feb 2025 19:28:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <gkqq3c6pew5etfmjqqzgxtddlu7h3tbscrijkbymls524vfrrz@uy7qysfecrjk>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
 <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
 <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
 <20250219150840.GA31825@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219150840.GA31825@pendragon.ideasonboard.com>
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

On Wed, Feb 19, 2025 at 05:08:40PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 19, 2025 at 04:47:26PM +0200, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 18/02/2025 05:26, Dmitry Baryshkov wrote:
> > > On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> > >> Hi,
> > >>
> > >> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> > >>> On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> > >>>> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> > >>>> container.
> > >>>
> > >>> Is there a more common name for this format? Otherwise googling for it
> > >>> reveals only your series.
> > >>
> > >> In the cover letter I mention the gstreamer names where available (this
> > >> particular format is not in gstreamer). AMD has these in their zynqmp
> > >> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> > >>
> > >> XVUY2101010 is YUV444_10BPC in AMD docs.
> > >>
> > >> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> > >>
> > >> I'm not sure you'll have much more luck googling with those names, though
> > >> =).
> > > 
> > > I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
> > > waiver: GL, Vulkan or other open standards. Otherwise normal
> > > requirements apply and it's required to have an open-source usespace
> > > implementation, etc.
> > 
> > I can drop DRM_FORMAT_XVUY2101010 until we get it to gstreamer. I just 
> > had it ready, so I thought it's better to include it than leave out.
> > 
> > Is the current gstreamer support enough for the other formats to fulfill 
> > the userspace requirement?
> 
> We've received a green light in the past to add formats to drm_fourcc.h
> that would be used by cameras only. There's no open formal standard there, but
> we have libcamera as a de-facto standard. I would assume GStreamer to be
> enough for a scanout format.

Thanks for the clarification!

-- 
With best wishes
Dmitry
