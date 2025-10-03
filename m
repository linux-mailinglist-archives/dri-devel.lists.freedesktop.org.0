Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B18BB839B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 23:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DBD10E0C5;
	Fri,  3 Oct 2025 21:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2TSmVV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A6910E0C5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 21:42:33 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-71d60110772so28928517b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759527752; x=1760132552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qb4Wu82O8H4woRuNaXSp6qi7XmoH0H5VI5tHbH7Spug=;
 b=B2TSmVV05ldXX6PlTNyu/XWpwew+lkd3WO1R1N3mZkW8PWrJSIUalRZxMf+xcrsPq9
 FwLUYgzuaYpZIHIJQ74q9y2YUF/3SH5cKnc/Ldij4tE5SrjCV138e4S9wxgUtrHC/s+5
 T4Fx8cL4P2ln+Zdt30juNpB6iB1ckbMogHf3CId/dZVMK26ykQECdmNWOAU7YDAjMrc6
 ogEenid88CsprakGUCsEExYcrekXnYlSqIN4bxNmKD9bxgnGwLde5WJbfRU50RUu8Ph7
 xG0mlAk3q8BHi6ABX9sq+ENecbS0uzZpC8e96PNp0wbtB2lt7x+U2xfajor9QgiCQ0L8
 DVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759527752; x=1760132552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qb4Wu82O8H4woRuNaXSp6qi7XmoH0H5VI5tHbH7Spug=;
 b=TN3/tIo+eZ0Eio6kzptoS9uAxatxzE0YKXInvccXIQ5RTrGUWwQ1g2JZo6/Pkz9+ww
 OuKyYo22PFSPQGJxx91mFcg3EiCLIZT0FhVE30+NZToQP9UTwY4jB12RQOg7EP9WaiUo
 tYon2fjnziA6kN0ne22WlQzgm1Oqh/0iRAVsn97V2zT5tVO16A/dWgPZe1B15M14BGnI
 SArWdlB9Q+5tnmOOdi1Wo39vMYBOgJ8E0kxFkOaTrLOaAg182gWZh8zDD0u4gqj4LtxH
 HvWVX3BXWTQgIzhvLmlFQp1Qjpe11aCrvSNrAjFTjmqyCOfkpo7wESJuydILBPN/rKU2
 NawA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeUkuMLDheYbG6gbuCutYdUVWiBrEARk3IiQgDv59YSynF+Jxn2wYm13h2qDgmxOAh1lFslaHpAZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywugt0uwi8t01Kc8DQAhexAPeHGRIdmNRFBmiWQ9YVN96vg7W14
 hMagJaz93qTTuFo4B5Vo7Rfmtjk/kVlIUGlw1eZT9E4Bg6oJ4LEtzkcA5QimtV4389QIHDvMJC2
 7BT/6JvN0eX8VbN939h+1HL8Z4ErUzQw=
X-Gm-Gg: ASbGncv7WdeRmcmdbWf7muiX51VvE7XD4mO6+TRlWW+r3nIMVUerFPW3+I5cltng4Sp
 BVJ9pe7LeDRzTZB7AON6hoDqEyc3cW9eYFZInSLVUw/uNatq0dV6Vv9KuOhc5JfhGgfgJnIYM1s
 34orkrH3OnmGViFBwMQ8Pc1h6F8lXEYnwtuXMkmdYgiAMlCk0urlKvqdTXDhmoupY8/BLkFgrZ8
 WBAhBF23D7MD05vo+RevJhyeAS5FwJZ+sxAsLx/zACxDhPNz8hEqnj+Z3aGuE0fuXvLig2PXL7R
 f2zwKEy3tP2ZUFUtnd6kEQ==
X-Google-Smtp-Source: AGHT+IFpa62J3F001fD6gEmxASZM+7hprfmJdW+U2IPWM14bwbGqXpUXslnfVMopKEr/h/JVkCYbZZaxq7ZVg2GVzCI=
X-Received: by 2002:a05:690c:6085:b0:726:37ae:95a0 with SMTP id
 00721157ae682-77f947377dbmr63264647b3.47.1759527752486; Fri, 03 Oct 2025
 14:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com>
 <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
In-Reply-To: <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 14:42:21 -0700
X-Gm-Features: AS18NWBXV7Dg7kjMsva2cG1ZX6ySiRudcCipxqw2a3pxKBvNUjFKzkOnT-TXcr4
Message-ID: <CAPaKu7SK=st9FkU+i25MOwBnBPQYpiBxS7-1nnerdBCiPnHy3A@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 3, 2025 at 2:41=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> > by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> > integration silicon is required to power on the GPU.
> >
> > This glue silicon is in the form of an embedded microcontroller running
> > special-purpose firmware, which autonomously adjusts clocks and
> > regulators.
> >
> > Implement a driver, modelled as a pmdomain driver with a
> > set_performance_state operation, to support these SoCs.
> I like this model a lot. Thanks!
>
> panthor might potentially need to interact with this driver beyond
> what pmdomain provides. I am thinking about querying
> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
> Have you considered moving this to drivers/soc/mediatek such that we
> can provide include/linux/mtk-mfg.h to panthor?
I meant to say include/linux/soc/mediatek/mtk-mfg.h.
