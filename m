Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B2B37686
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 03:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EB110E165;
	Wed, 27 Aug 2025 01:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Clhn9Y9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2C10E165
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:09:29 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-76e2e6038cfso7072821b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756256969; x=1756861769; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
 b=Clhn9Y9pKkLsl7d87lRDf5MUAc43bpPEmhteylv/qnluI/i6+rCh7WOADpOvAeBXom
 xOQI1u+SzZpKDjDELqgtGoN8t+Ip9wEtyuGzSRdApL27LANF8FeOnJmGxU5GF1qtOxqv
 qGpZJYMg9nB1OqCYLOJ0xLqkffeC832n5CeG0+7RiSHgkjXAnGmhhEev/w5+E3TJ5Sj6
 SVaUWARbIAmTel6xyDWnI2cMB9AlyNVub7M6uNgcb582YFPfTawF8h46G9xb/TwWVzxD
 3tzneyv5rnVSSKOe3FXuOW/gIHTzb/P84PU4++v5UY+4TooKP5CJ2rOVCxdt62pcy2vl
 vccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256969; x=1756861769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
 b=tJLa3LU371OTqa540fCdfx4XiuB1Q0kqJTX9xNO1xzoFAFDfbFvCRCveXtS0kSjKEa
 9i6lTW6LMqwKuKDfGe5yKKX+8yKU+bzEfVWF38B5yy3KANYML8lALp+ngNOaTwXRMjv2
 tB87GynC4tW0xGxRhtI79rqhBGHNlnyh+c70M5n8JBQbuRXSkHQW8hpJpC0XPQlNdveM
 +/jcUjYoRRmqxbmvwXzra/q4GWLOPdmahBnaFHeERXlQXOm44EKieJOIRQHclDH6Ajoo
 qb0NG/8Lfu4zHrfnGkowJLl860+wQunaH0rdo7rkoh6tTKVFQRdBcbDE4KnOr5tHdFh4
 Qu1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMbExFhkiPkQWIVJoqhnEmMYxwRmcSkdgfRMdWH5pDvCwybTOfD7lkJl7fBo9+c6u959RnRfuFUh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnzVSnoW/TomnZTXUxIhWlBdLI455qQc20kwdtviKb/3u6Np+r
 vaqv8HqMY52ujvB/tU4r3uVxyYoLkaLsNeIB30t3Svb/vOPu6R1XFAMg
X-Gm-Gg: ASbGncsHxiW6do5fFohMqGdPLbfDrUMNS43xsPqE4d3MoTvV4YLdFxRG2ud2Kc+1aF2
 M5+fZ99YTR3x+Za9qEsSs6oXhPJja5fnTJTS14+XvMPxWV29FDhNO3L5IRZT+UF129QIJioYaTY
 RpUpEh/xcwJir2wP7HTq3cKhZpg4CZtMvS75HhSNA0h+k/pADVNULSw/3gjeA5DkRrQ9lB03hX8
 B9bVOWTEaP/lMTTB4ouBZfCsAqJD06rfnmUS2W+D+Gkgoq2MdXfNFFvQdPVAcckTxz/hoy0HYSl
 PaP86W64iillXrmeHVtQb5hqtrB+CpwgS70p5uMf+JiG1T3+uKg/e0HLDe6GgMIjwWpiVXq6v9W
 aWNxRuNKHynbTsjeWyDhQZC9+vcqQhY6s
X-Google-Smtp-Source: AGHT+IHkfsVuZ+4qDUB9kGWXKNs3ixhtdzwAG20w+Ik2IkMK7IqkqBUunACMn5yLzf65+cgJRTumCw==
X-Received: by 2002:a05:6a20:7286:b0:240:d7a:9591 with SMTP id
 adf61e73a8af0-24340d1c50amr25873828637.46.1756256969084; 
 Tue, 26 Aug 2025 18:09:29 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4a8b7b301csm6847632a12.35.2025.08.26.18.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:09:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:09:26 -0400
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
Message-ID: <aK5aujavDc4PvvjO@yury>
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

Hi Nicolas,

Thanks for the work!

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
> 
> Left out of conversion:
>  - drivers/mmc/host/sdhci-of-arasan.c: mask is non-constant.

+ Michal Simek <michal.simek@amd.com>

>  - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
>    non-constant likely by way of runtime pointer dereferencing, even if
>    struct and members are made const.

+ Vinod Koul <vkoul@kernel.org> (already in the list)

>  - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
>    masks in the context of an initializer.

+ Heiko Stuebner <heiko@sntech.de> (already in the list)

Guys, can you please take a look? Would be nice to finish the
consolidation.

--

I'll take #1 and the acknowledged (or at least reviewed) per-driver
fixes in bitmap-for-next in 2-3 weeks before the end of cycle.
Everyone, please send your tags!

Nicolas, please ping me if I forget. For the rest of the series, in
case of no feedback from maintainers, let's wait for one more merge
window, and then move everything altogether.

Thanks,
Yury
