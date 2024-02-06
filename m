Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0284BC7B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552010F264;
	Tue,  6 Feb 2024 17:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LSC2ZY0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C3B10F264
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:48:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40fe32fcbdaso7310785e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 09:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707241717; x=1707846517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BTtEBYn5HMxfoNFDDbyP4zpk1ZUKqPIq9B1e4+8nGHE=;
 b=LSC2ZY0Gtgb6H4uZu00alh1W6oHmN81bCEBtjncKoMbyW3v5FQEa4Bdv1qqjPkkIqC
 02o2Y0EpCq3kVYDiJRTpV2VIJiTHCMw09bXZhyoUjvfQQJYpt7LXcmcy/KEY67pY+OWV
 e9q0wEWMhfnDmNVwLgnE/77349mvzRpdDWdtWwCGThDQq5dY6Ev8YhFWY45Yxudl1IJG
 jdmBsQT3zwAbRLIcqEVwxJmIezajGNlgHZBBhRrob/9/Csjd3F9owOfOwku5sDXTfYZB
 Rwnwt/fIzw74Rp88DptcKdxRX7rucMGhNTJjg1s918TG1acBB5U94ekonsROaWJm/VLq
 BGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241717; x=1707846517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTtEBYn5HMxfoNFDDbyP4zpk1ZUKqPIq9B1e4+8nGHE=;
 b=K2OfngR/mWRPBNQbEYGl/hdZxILMAz7kdG2UptpVf9ZDX4Mk3VviCcjF0U93/SyaN6
 x2BiQ7OwgvMj0Sh62rF2cxre5034NgfYGz0IjnMA1q8dD/bZhXotoPqM6NGLVAikPDv0
 JVZ+9gZPsY/0q6FzhVCV8wGDPapIpv/xUjo72LpSOGYjEbbIMrcxlZZIoXmtu8T88ZH0
 4bPth9lTjadqmFyYNxMXxnPA6v5DVkognVNHgE/6MUwxA7wTTzvyrDGyL1htedEw1IHe
 AGTLG9A8dH7Uc7qziBdrxymWGEZg1pxQs3SbJ0lcku0R8dphEyAEbcD+QhbJbkMAfOWt
 VTSQ==
X-Gm-Message-State: AOJu0YzP8JDvZilcQc1QDjK7BhPOJvI4DcaexTW2Cg6rg9zF3H4oKGC2
 mKu4uuhxf6ec1H5rHt+WNMEOkDZYu3EH1160DzR10Xr1DlU0aeRE
X-Google-Smtp-Source: AGHT+IGOnCyT6CBuMAN3BVwvf9J0QHYMBB9K1MogSD8lzJNn9y3SV+aiYmuCQulFXmj2KgBEPaPtWg==
X-Received: by 2002:a05:600c:4f15:b0:40f:e4d6:7ef6 with SMTP id
 l21-20020a05600c4f1500b0040fe4d67ef6mr1276507wmq.23.1707241716697; 
 Tue, 06 Feb 2024 09:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWdx42vPGXJ/UEcn9lXXuP+0jw/EUKC2rpCpUtPkQ4Fiwux+9S/V1KU1MI2bX8wdgVppO//VyQkqtrjdMKXi4s6WvbjdAOC1ZZixK8yOt78/+MMj+DnG0sVRYj2LJ3L9dFKYwzmwslBzyYE/43phc247FZXJCzG6dCgU6j3I01lxNQ0lKvah6lLudHCAvafWniUcwv5SNDIfcFvhoV9KLM50G7BuOZtIvPTgi002AHSqaO7RTcMLY9eaxWf2crnQk81B8w7W7tk/N+NMOU9+oHEeVmQxDW0lx5bXSGYjx5NiuXT3WsqLEdNwR2UOxpvoO2MpydAdczy3IPD14PWJStA2BokxP8jpDF0I+kaHCp8bXNYRxyoyIk+cfvtusUoESNzqbNafajLKpGCsXtFiIoj+7rW3B35EBtsJEIh13DaTkN3zSB1vjk3QRl0fKUImNqa3B3A8e0eaJKWfp6C4sDuEP6jDbG7oAu6BYCdnPfhmLfm1q6vgeKQUV86ycihD6JBoRbxD0nFPuel+OBULxMc1+ToOo9nDeIW6Fwv261ehn4nlwUWMh4aN0HTM73B6TRMKeluIrUSVWcnV+O6b2VcSFon4z43UTsF0xhDP5eYEozSy0BeeIseemxTXx9fBx8xqTIXlW+2hcBcCEMikn4uOuFHit98KI/LR8Ier6jDA0aP4HwbIZ2ftD0cpVO2OOjg6sUXsiCV1F1Z+FYAFwgbTXvqsYd7Dwee0EDTro6KPMuwdaFwvvChv9hyke/RjMJk4MpJNAwRPw==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0040fcaec04b8sm2676064wmb.22.2024.02.06.09.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:48:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2 2/6] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's
 n/m ratio and parent rate
Date: Tue, 06 Feb 2024 18:48:34 +0100
Message-ID: <2922005.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-2-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-2-96a46a2d8c9b@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Dne ponedeljek, 05. februar 2024 ob 16:22:25 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N <= 3
>  - (PLL_VIDEO0)/M >= 24MHz
> 
> Use these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


