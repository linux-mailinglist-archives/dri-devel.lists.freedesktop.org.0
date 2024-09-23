Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3E97EB68
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5D610E24C;
	Mon, 23 Sep 2024 12:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eCNKlYEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2EF10E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:16:32 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso4813142e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727093791; x=1727698591; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsNBpuLZI/6vBi0+2mpLKJCoxD+TiNDtjW2xHsUYLc8=;
 b=eCNKlYEkMO3txeGMPc64gf0sGTycqwggkcOZIYVQVBOGfxrwVP3m0oC5OGO1ckBIi7
 wB9KbWtZdRJeq8V8rssvxW4J9PwhFJKN93GqHBFt0al+0rD6gVw9LFCKR/sfkPow67nt
 MRmDCiDfYBg6xLgeBhUtYmKCB5llHGGpKBc0jvyCevYbTS8Ljih7neSn/U5f/Kw3A/6+
 kfRhM8oQup+I4LueqkebuoN0tBzoHUBzCAukBM/mF9vOQkNj9F2cGYOO1ZZFTPRbOd/n
 kmSB5BFwnQQo+LqyJLQvxwUMcUPE8Q1N07rcT2sNJDo/SdVcM9ezX/L+LvdwE083E5TT
 3+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727093791; x=1727698591;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VsNBpuLZI/6vBi0+2mpLKJCoxD+TiNDtjW2xHsUYLc8=;
 b=wGm0GLBa+HQe7JI4lNoerGAYrAPyd3syvfyijFKydAKwNssjqW0tFgfv3Jw9nUWx0h
 W6MQ0WTx6btkj1A3Bjj6xAvpzUlVMJAWv6tQO9mRT/bL3m3XAkavEKSbLFP6Tz47JCaN
 zneE3otF2KGSJh73a+KDN9z4AQ7FjvVGYZqelNR/m/NlkrJgYiMPP4bbQpd67x1T9KtG
 RMZShqqlavTD/g914locLSYeUAAHh/5gLVkAAypdfc/xwczEcxjOTRgY/ViRqGNCbyJc
 yJex+uIQVRVRGHArsVTxpkbNbqOADBpZmXV66EXLtVGVt+pxPsv7Ncz8d6l4dqBjSjjV
 caUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrKsgWGlxQS8ffereG2/F3qB/toxIDz4UJMIgC589XLJeHYLWJOM90HB0zW0NbrZpAA1bld+D6DWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0MnzYXjIz+LDpGfiabO41k6hdIzaQIQBbkZBrBEKI/C0SgtH+
 RVeXoCv0PShjgDUjp3JS5gDFmc9FpBjydlijC6SEdo+aQW06VPx89/f41PgmJ0s=
X-Google-Smtp-Source: AGHT+IEll20m0+xUonHMNXt2UPq8NyfIxK3UGL/wK3GxwtrfstaIDlQYm8uP3dzRZ3/adfrLdF/6UQ==
X-Received: by 2002:a05:6512:3d0e:b0:535:6baa:8c5d with SMTP id
 2adb3069b0e04-536ac2e5a42mr7093911e87.20.1727093790835; 
 Mon, 23 Sep 2024 05:16:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704660esm3269744e87.15.2024.09.23.05.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:16:29 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:16:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 jani.nikula@linux.intel.com, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: writeback: Introduce drm managed helpers
Message-ID: <5sufhgtqempg56b57ocg45ah4ip5ykhaz6thphctcupk5lortz@fmkxzzzdwd3i>
References: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
 <rz3xk3kwwsfstjrqffp4vfkm7mvn5sdviwjzb5dodmsnb5v2fz@vuamquxmvt4r>
 <ZvE68e95dwLqjVuW@2a02-8440-b157-69df-aafc-5046-a3b3-4ce9.rev.sfr.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvE68e95dwLqjVuW@2a02-8440-b157-69df-aafc-5046-a3b3-4ce9.rev.sfr.net>
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

On Mon, Sep 23, 2024 at 11:54:57AM GMT, Louis Chauvet wrote:
> Le 22/09/24 - 18:31, Dmitry Baryshkov a écrit :
> > On Fri, Sep 06, 2024 at 07:28:17PM GMT, Louis Chauvet wrote:
> > > Currently drm_writeback_connector are created by
> > > drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> > > Both of the function uses drm_connector_init and drm_encoder_init, but
> > > there is no way to properly clean those structure from outside. By using
> > > drm managed variants, we can ensure that the writeback connector is
> > > properly cleaned.
> > > 
> > > This patch introduce drmm_writeback_connector_init, an helper to initialize
> > > a writeback connector using drm managed helpers. This function allows the
> > > caller to use its own encoder.
> > 
> > Also it introduces drm_writeback_connector_cleanup(). Ideally that
> > should be a separate commit with a proper description.
> 
> Will do for the v2.
> 
> > You should also
> > document that existing users should call that function (and maybe add a
> > WARN_ON that can check if the function wasn't called).
> 
> It was my initial implementation [2] (usage in [3]), but Maxime suggested 
> switching to drmm. If I make it non-static, this will be a new API with no 
> user.
> 
> I don't know how to add a warning if this function is not called. Do you 
> have an example somewhere where a warning is emitted after everything has 
> been cleaned up?

Add boolean wariable to drm_connector, make
drm_writeback_connector_cleanup set it, WARN_ON(!set &&
connector->connctor_type == DRM_MODE_CONNECTOR_WRITEBACK).

Or maybe even better, make this function being called from
drm_connector_cleanup() if it is a writeback connector.

> 
> > Last, but not least, please don't add API without a user. Please switch
> > at least one driver into using this API.
> 
> The user will be VKMS, see [1].

Usage should come with the API in the same patchset. Otherwise it's
impossible to judge whether the pieces fit together or not.

> 
> [1]:https://lore.kernel.org/all/20240912-google-vkms-managed-v3-4-7708d6ad262d@bootlin.com/
> [2]:https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com/
> [3]:https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-12-6e179abf9fd4@bootlin.com/
> 
> Thanks,
> Louis Chauvet
> 
> > > 
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > > Hi Maxime, Jani,
> > > 
> > > I tried with this commit to implement the drm-managed version of writeback 
> > > connector initialization. I tested with the current vkms driver, and it 
> > > seems to works (at least no crash/warns).
> > > 
> > > As suggested by Jani, I only created one function, which takes a 
> > > NULL-able pointer for encoder/encoder functions/possible_crtc. What do you 
> > > think about it?
> > > 
> > > Regarding the documentation, I think I repeated too much, can I simply add 
> > > comments like "see documentation of @... for the details / requirements"?
> > > 
> > > Good weekend,
> > > Louis Chauvet
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 224 ++++++++++++++++++++++++++++++++++------
> > >  include/drm/drm_writeback.h     |   7 ++
> > >  2 files changed, 201 insertions(+), 30 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
