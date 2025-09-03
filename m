Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB8B41157
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 02:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D00310E08E;
	Wed,  3 Sep 2025 00:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fz9aF5pO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC41F10E08E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 00:30:33 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-327ae052173so3717281a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 17:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756859433; x=1757464233; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
 b=Fz9aF5pO1tkxd5EAGhiAu+XB/r0zgDBYIcMaYsgSRib6LFXDYOCeRhIc3a2BY66SWt
 npCu6t/XBYmqVb1w4bqlu3dTc8pDVon2aXgc3tyaFTxH6owVcSXoehO8nWkqd17Jj1h5
 kgVpw2ftMDxw+c5hsLscy2O7NUFnN696AmkkbPVUJCFHmXxsxqSGa8Zz3ZVm2b2wfNGG
 JBoeZcelyjxe+lvwRRkurp2HVgRCMnvkYDhu2V3kYEgvNZNN/N4kAD4kAh4GrmWYHNqi
 hCnTVguide3/5gSo9W7ocj/Ptoc1WyD/WfdBQmJHxF4onwnyKz9jHi8s42er0bIzkqMI
 9b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756859433; x=1757464233;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmMfbXYYghLau518ZkBS9EQ6iyJ6tyWuJVdbkNRuMJc=;
 b=JlU/vpSguiRVjSSyeb6GwTsctcH1xV/oIKoB62KfR31hF+sacUYw9y+0WxCsjVsxQH
 uKE08lCHAUMKoquK7T1/7SQ8LpaU2pqPQChu66Ife6tna3JmMP5OeB9QoBnYIT5r7MQe
 bc4LCySn9cJAV6zqsCsMG5UtapH3cYpCJzpNGNIBtppXJiwaAoghNuhW+GgAYa/QSIVa
 KnUhBt+o2fCE2GeIEA3vb/tQ/JGOmA+/m3SjvjEDWhn8QKPQ9aB4qBgHCM0z2RSe4Ixn
 I6HKWJ78UMx+nrar6ZB3sgOonwK5LVeoStH67ZlGfBkMmF984eKYnz7jd+WgFZi8srHQ
 +7Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRAyP/MTAp9ebNEkgCIN8sWnEhbVBFWaCaeE391JfkKNh2t1lAGUn/QxuvNNQlp2Wnwl19ZR5NLFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD3B0dcB4zY7gC16yiTVQ+yHE39KoJ9HsplhtCSjQ3ndCruybE
 8+xYjDEsJtX4q+pRF8a2afaUvHh0pomKbo81sBrlDL9tarZRjHY8uqf2
X-Gm-Gg: ASbGncvv7OUSBpnwHo1QHbZio5lmYTz6Z2GMXhK3/iXe589Ck/ZVWEOmcO5t5E2vbFg
 ekHVveRjbp2V3X4uSP9nSmWdp06LhqQS1u2XlqJ6xlJeEwI4CrkUI5CURq8rzm4sReBZu0u3wwc
 nQCOZuLFWrGlJjMJeTFAwQXiDRabnV5anQyXmAspqz0x1mXrr6RTxzKqe1cmCccM5v71LA0FooX
 t3bO65aU9eY7x/B+bRYgIDn2sUJMSaD1jFD9lJ5/d/gD1U1yoXrxk2Cq9VvQTUV225YDXkpXJOa
 pruphjxBHrWVjBOGRbMbLgmZZeQzieUSoLWtf4o1pmRyqeUp2m3BZAVbEkhFdlP6HGd0E5Mxw9v
 wnMNB/OovW/HHACwrrA2Kxw==
X-Google-Smtp-Source: AGHT+IHKuGow4ZFuttu6aoYR+s2VkdzBbs1o2jEf8YSpdi38rlMbKdEgFtFxfdUZ56XgWRNUklItiw==
X-Received: by 2002:a17:90b:1b12:b0:323:7e80:8818 with SMTP id
 98e67ed59e1d1-328156e5627mr18724374a91.37.1756859433210; 
 Tue, 02 Sep 2025 17:30:33 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e23858ecsm3480217a91.14.2025.09.02.17.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 17:30:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:30:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE
 macros
Message-ID: <aLeMJjfhisYSIEph@yury>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
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

On Mon, Aug 25, 2025 at 10:28:20AM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.
> 
> The first patch of the series introduces a new header file,
> hw_bitfield.h, which contains two new macros: FIELD_PREP_WM16 and
> FIELD_PREP_WM16_CONST. The latter can be used in initializers.
> 
> I've cheekily added the hw_bitfield.h header to the BITMAP API section
> of the MAINTAINERS file.
> 
> This macro definition checks that the mask fits, and that the value fits
> in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
> so turning off a bit does not require using the mask as a value. Masks
> are also required to be contiguous, like with FIELD_PREP.
> 
> For each definition of such a macro, the driver(s) that used it were
> evaluated for three different treatments:
>  - full conversion to the new macro, for cases where replacing the
>    implementation of the old macro wouldn't have worked, or where the
>    conversion was trivial. These are the most complex patches in this
>    series, as they sometimes have to pull apart definitions of masks
>    and values due to the new semantics, which require a contiguous
>    mask and shift the value for us.
>  - replacing the implementation of the old macro with an instance of the
>    new macro, done where I felt it made the patch much easier to review
>    because I didn't want to drop a big diff on people.
>  - skipping conversion entirely, usually because the mask is
>    non-constant and it's not trivial to make it constant. Sometimes an
>    added complication is that said non-constant mask is either used in a
>    path where runtime overhead may not be desirable, or in an
>    initializer.

Applied in bitmap-for-next for testing.

Thanks,
Yury
