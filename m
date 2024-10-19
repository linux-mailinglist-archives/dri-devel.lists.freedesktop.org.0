Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E9A4EA6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E721A10E362;
	Sat, 19 Oct 2024 14:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BTEuXN77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1C710E2A5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:31:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539fe76e802so3555670e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729348260; x=1729953060; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v1OZg2lit8ojUrZI5PFtcsvJA55BRZgPzGoX56nWOWU=;
 b=BTEuXN770obBdumTF5RaoU+diXSWW1H1OZ75lVGhRAUVjW/0WvsvQBvSJMdyH7xACb
 LZDKeh1UsLgJ7IA0pyQj+BRjEq3zJdfMkJR/YbmcOH8vfKdcxgI15CuitjsJ7sWcHxzR
 XJhiDrtjoPv9kwLI12we1y/qzQfKunugez68QUzKdCAErFY1+LMTivgKKw8obrrnrezJ
 bO+i8uGTcJIXMp/qP8IwugrbW5/p/sTRjy16pnUs+BZS+BhWrlTCPj0cvBK+m7e8dlW1
 Mw8y3sR76pEOfclXbKKs/7TFKZ9ELsrZVRRmEn7EINuaAYk8G/IeaXkasrICwlqEM3d7
 czeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729348260; x=1729953060;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1OZg2lit8ojUrZI5PFtcsvJA55BRZgPzGoX56nWOWU=;
 b=VenLPiqzNajRbros289MQaiBOaM48iSEuLfbMOHmBeTF/8LeEwhGjODdalk+PvjnwO
 dE6xZQvXni/8UsZmwCNELbhZjl8dtRo5Lzx2cSargjRcXIpFELDv8+YnqHnqv40B12Jp
 qw8OXnIgLPbiO6dYgCzqVwe8RLtE7Fx9Pvt481mtAFQk9S7Ex0P+V8IYYjvRZizvdN0k
 03TszOBVnvNF9atgYaF4RlVBFuqht9qQH8n//XpuE1e9PbkiRxTlKYaKgCkFAfPpaINI
 z/iV4SEgZxIs7ZVf5y30pWOtXXFnZQVkcJWX2ZPenffvzjzd300t8593AdH2hlX8GybQ
 nFCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVW2981Wuyq1iWcv6bxVLoV9FfL/AX617gg99bRPO26Spk8e6wS7JNy8zcZYpmRZFJKD1CnSAenDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5uF6B9YizRjZIFc5eiJduRxFMNaOefwXcnYCbw/uaIDRl5wTE
 XMG2+WJ6L/ZCUdrIe1+e4QalW/IlKxJhe6sUGDxaRSsxrgbm8qUdJmTJfX52osw=
X-Google-Smtp-Source: AGHT+IEN3EZQT9uQn9oZnEUWGdt0rQ6BiPDob8tepon8ZdjaPQoA3NoiyC4bQ5Ivan7fSfYkwlvodA==
X-Received: by 2002:a05:6512:691:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-53a15459cefmr3394100e87.14.1729348260129; 
 Sat, 19 Oct 2024 07:31:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15214e95sm538762e87.287.2024.10.19.07.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:30:59 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:30:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Message-ID: <mbgd2mjqjhlytvpkljrvlcva7qzahex4qcrfusy2vijz6ysq7a@6baliilco6ab>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
 <2754373.mvXUDI8C0e@steina-w>
 <ovzeljss5uv6rymlbdfjolnjox3dklcv3v2km73gqnh6vejxvg@afhyhfwmt3nf>
 <2007957.usQuhbGJ8B@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2007957.usQuhbGJ8B@steina-w>
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

On Thu, Oct 17, 2024 at 08:50:43AM +0200, Alexander Stein wrote:
> Hi everyone,
> 
> Am Freitag, 27. September 2024, 01:13:57 CEST schrieb Dmitry Baryshkov:
> > On Thu, Sep 26, 2024 at 04:09:03PM GMT, Alexander Stein wrote:
> > > Hi Dmitry,
> > > 
> > > Am Donnerstag, 26. September 2024, 08:05:56 CEST schrieb Dmitry Baryshkov:
> > > > On Thu, Sep 26, 2024 at 07:55:51AM GMT, Alexander Stein wrote:
> > > > > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > > > > 
> > > > > The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> > > > > registers, or the access will hang. For simplicity, the PIXCLK is enabled
> > > > > unconditionally, resulting in increased power consumption.
> > > > 
> > > > By this description it looks like a fix. What is the first broken
> > > > commit? It needs to be mentioned in the Fixes: tag. Or is it hat
> > > > existing devices have been enabling SCFG in some other way?
> > > 
> > > We discussed this internally and it seems this never worked, unless PIXCLK
> > > was already enabled in SCFG by a different way, e.g. firmware, etc.
> > 
> > My bet was on the firmware, but I never touched Layerscape platforms.
> > Anyway,
> > 
> > Fixes: 109eee2f2a18 ("drm/layerscape: Add Freescale DCU DRM driver")
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Any additional feedback?

No response from Stefan and Alison for nearly a month...

-- 
With best wishes
Dmitry
