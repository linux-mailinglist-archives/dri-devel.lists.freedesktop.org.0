Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8E937040
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 23:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6410EB34;
	Thu, 18 Jul 2024 21:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zE/D1j2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6AD10EB34
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 21:47:53 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso1014301e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721339272; x=1721944072; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mpMLX3kfs8/bfyK2ait4QZAXJJhBDNKyleclQhXZDdA=;
 b=zE/D1j2O6CdS3uytzecoFBHl9OJTY5V9zPX1EDXVsb5bMseHPwje6PizLICvzROeHE
 1+J2ar19q8eVRuXMbMbeteWedp0Meqr61uOX6YmnW4J39TzVfRRDbQ20ObEqg7JoEH6M
 rTBQlZbMKGJOIYZDoFZ30fwqxcwsqqclgTgvWZPWZN8kGfXxzRZCxZcxSD1bMDbyuPs8
 iXBS3YLiy6W12XurIsOogDjJRwi2Y24B7J4L487NpwVlWNOAkbahktWOJMqIPWScndV6
 X5jhoHkn0CHOk80VRymX5BtYKohFJ4Iz9rGlbRWQfNLPi0tnnGFZPW4UJDTl0leXEoUl
 jnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721339272; x=1721944072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpMLX3kfs8/bfyK2ait4QZAXJJhBDNKyleclQhXZDdA=;
 b=l4pZQ5Ga7aSp1JnDLN+QSMNoPRpZKXzlbq0ppG2LDobEfjWYf264FvS74cxk1DbFI5
 ry7yO5pE49Rwq42eJFquQU8dAVmKhAfgrJ61+kk6h7FqZFHsub32DdaIQSv/FkcYJtul
 9xZnnUI5L3dcbJMtCNPpS2RAvWrVLTQg4c76v8GeT5vYetM4V5TJ+rHnhFZCMikJzSCq
 +0Thq/NTWBBZu02Mq4ocbr88200sY8ba/gSSabuP5OcVCk1VUzNz966uCNtJaSjImkeg
 liEdvmycw44ncuggoevv5+VkdY5xLZtUBiG6cxXW1AwInP/kJUUhNcW/b3IUWmCCF7gG
 rJYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKqaLQro/m+7c9YZY6oD99/vuNt602Zr+byvJRbnxmLpuiTyvgWb67UsR1AWmK4Ndv8i9VAUn15WfqNeKCxdDC4htTZRIGa6CdGGwSVTuR
X-Gm-Message-State: AOJu0YySWzJBO4Y60EWcBBEfylj+ogyi+58NGStJqO7LW4BHCpvgZS5W
 7sRcT5ggNbG/fKS364nzMpm6+ec2i9kQW+dp038vJpEXTZSMNa+CQqrxc2xjI48=
X-Google-Smtp-Source: AGHT+IHblCKnDA5X9aLd7Di/A53K4ImLa7YtSeAHvDZw3KfD4za5bxapeD5LaXRZlyMqLAGzfMTH5g==
X-Received: by 2002:a05:6512:3c97:b0:52b:bd90:29c8 with SMTP id
 2adb3069b0e04-52ee5428b13mr3546662e87.60.1721339271758; 
 Thu, 18 Jul 2024 14:47:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef556ad17sm20e87.166.2024.07.18.14.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:47:51 -0700 (PDT)
Date: Fri, 19 Jul 2024 00:47:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <7csq4ml5hm53gqwrs4z6pc2vtokxsadzqmyc3yj57zcxz56766@asuk4vt2z43f>
References: <20240520125551.11534-1-linux@treblig.org>
 <g4nwb5cgcg2wff4qogzayhdrj3omneeusfjqmdupghy6zlji5m@kp55dmkbj6k3>
 <ZplVoj6xAAaMnisJ@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZplVoj6xAAaMnisJ@gallifrey>
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

On Thu, Jul 18, 2024 at 05:49:22PM GMT, Dr. David Alan Gilbert wrote:
> * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > On Mon, May 20, 2024 at 01:55:51PM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > > has dropped all the users of the struct bridge_init from the
> > > exynos_dp_core, while retaining unused structure definition.
> > > Later on the driver was reworked and the definition migrated
> > > to the analogix_dp driver. Remove unused struct bridge_init definition.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Hi Dmitry,
>   Do you know who is likely to pick this one up?  I think all
> my other drm patches have found their way into -next.

Applied and pushed.

-- 
With best wishes
Dmitry
