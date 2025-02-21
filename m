Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959EDA3FE82
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580D310EB1C;
	Fri, 21 Feb 2025 18:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMqz/53+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C0710EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 18:14:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso21460675e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740161668; x=1740766468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
 b=PMqz/53+dz71znLaOBV1ZrcA3dVolOK6VvpeoPOhCBa3l0awRxbMWts1ylG/Rh3dr4
 sM0dPqAGwB4N3/DAJ2Y1jjGn2G+f752olv+Ou3atd/edLTlQvPcACA0/mi1ZYLK1DuE5
 yBGI093zOh7OreeBfBClmQcCQBDNivvTjUauh7VXni06PcYe2g3RqUouM+M1VqBP3/Wa
 9944EPeLjs7gp+tVEiNUfPtqOJXD46MupnUHYkwuWOEK/wcaNbGWFQQJMTwXMQ06chgL
 ZCwP5uwmvw+y5LDPOmwZT10Cm2A63UPh4rqohlUrPnkTvoYg1ZUHdHFoiEIm89/uTy78
 zVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740161668; x=1740766468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
 b=u+MnlyKR3XuL1OeX0Re0EcP6m0aqTDlqbi2NuJ4vMUQ9t5k1QbZqaiF+9nlbXlVK/R
 pzFRqr5wgxAQhaMvZAUbbEJs5ouICrn72Sdf+VBHFrra+eODXSLkyRISkAd5lMichTtt
 RwOU+wRR6YjB5fHcLDNb7LCKWBD/KEyVI+78zbu9FwOS3phl8bUDJJkieljOkeSgyzQy
 4tGRDp16XkmGj1+wFmm907jRUOnavpdyjcUnTsnj20yIRmyEfOrCjCiJkuIn3tkNIDBd
 LFTO/+WgMsH6LIuDjgIZYk80OSYBsPNdybsdZ26oMbsuAl3cxCikLgt2NM7ly+FCygDk
 wMzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3F5tIA/sB4L50sJH+3ffTCU+HfqUK+Ksirt2BdrPTuptkNnD5JBU5dgfzb5nsU009QSZu81D0RMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo2QFhw/Bgasf3GK20iYeDRKsE5atEdN5TXtv/x30ySmQtCavW
 bbbbCZNsrzdGUgNBGxfQJnPcWmtNhMmWz+FJfhEiUA6JnWRcP7WB
X-Gm-Gg: ASbGncsJgN//tN2D7MchvUmm+vOuJZqkgkYIdip200XlkZ5VSuWayu0wG5XSvjRyJxx
 PgcKP69TmhHQSKSgXX2U9FK4y2jMIunAYTVJTvFscT9hTHJ7LHeeEf8jtH7NxeHYAR07h0OuIzh
 4CSoOuamldXW8TM1gktVrMQDOmPcA6fZ6d5kG8IfdecDY5sRR6lbAU+S7hJnuoV4A4YOM8rZa+k
 RjU86u3ExGQ5eJcnX9W/goIvJ2V0tn/hAQgkL6v4FEQRYJDkVNNtSmm0WhAeDhMlDnWbKhsSH2y
 nu2JZgN99KtTkevGaArLoEDD8Z8aS+/s7bUVN9PUKExtnkgJqKllLhk7AsLqWc8SAURaJVZy/ut
 j/Q==
X-Google-Smtp-Source: AGHT+IFTozi1CVAZhzesUHKfQ2k63P/tS7KXhTKQwhP11mPloHJVn0P3vCQGwTQrLHtArYDTD3nLVQ==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id
 5b1f17b1804b1-439ae1d877dmr40268755e9.4.1740161667381; 
 Fri, 21 Feb 2025 10:14:27 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm24430595e9.30.2025.02.21.10.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 10:14:27 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: h616: Add Mali GPU node
Date: Fri, 21 Feb 2025 19:14:25 +0100
Message-ID: <1911773.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250221005802.11001-5-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne petek, 21. februar 2025 ob 01:58:01 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC contains a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family. There is a power domain specifically for that GPU, which
> needs to be enabled to make use of the it.
>=20
> Add the DT nodes for those two devices, and link them together through
> the "power-domains" property.
> Any board wishing to use the GPU would need to enable the GPU node and
> specify the "mali-supply" regulator.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


