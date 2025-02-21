Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF3A3FE59
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 19:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C4110EB1D;
	Fri, 21 Feb 2025 18:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CG3KqcrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B1710EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 18:11:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so15625145e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740161477; x=1740766277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
 b=CG3KqcrBpfQX8ZX3jTQ+Fpiy9k9JNzK83ycKXfHHf+kGkj5OjAPUviUSTjT/XCSH5U
 Zro2NlBITFqTVgpZATaRk+knpLBBbJxWgq6JYQ2c8cYK5cRWvMsIFg02WRLF0yCSLQQW
 GdakLXZ1UoXXqjb80DgzmYTRnoUl85auzvMHVyPZYP5irMKkZvXqOZbUHF3/+M6WgzCu
 +Tat52MN9j6CRWz+TEPSQ/XgfO76MxKQ17jYFOzis+ElaihB0qn3fw3lcfPkSmCntqcd
 TD29aNCLtY+3hTpHiDWOmvn9/l3E2tldmp945EAtN1WiTZjeK4Qp/iUQG8KykyEF/sGe
 vARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740161477; x=1740766277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
 b=ZMQjo/Uu08v7N4E4H/AaawCiw7WhfguYXWPUONTbxTo063AYNE4N5pZQJ+qOYbOzIq
 UQUxAfPnQXSfjUbnlc5S+xH/u+RrD/PKgE5D6/XUVIiZaSR7l8lwkVev1CPBJB3Uvkoh
 XaIfJiLcuEazibKDXzkD4swhBDo/V4IUFWy6vAEqc7XBNNSwNkCSlPrm/L4HZopNIFpd
 mw23pDVl17m5rQxLxZEVn7hFEYV0OrQPY6WGJyTLhmsxFMCE4WZJmR6RBTiPrRwW+k0i
 FfEKUR4FRksTh6HayRFGwqwJiwoq6Pedw+z4RDJ/x7Zg/BinwunlhY0mrY4KZPmr4Uw2
 5ggQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI2NxwiOhvvX8sDDjbdnuDOqyntTfgH7eRG2+T30Vuegd3eZBcbPoVLn0Zmd6mok/rhdGG0gCLkdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSZe/hjUilvDBwLuoUD818Bdw9QwFP4gDpgquCRD9LFo0lMi8b
 y0kdnJb43xtYkGKXG++ObyzN3mQok8GJoK45NsuIpomvhJeah4Qq
X-Gm-Gg: ASbGncvU3ST69Nk44ksZtmbDBmx5alxoku+PUg0JVMBEOH8xnjL5DNxVaLaePdmOPmD
 QxLYW6B12ZbrGADFQwELUZpBtlw+oaCgXFQp2h6v5UoXY3zQ4KvTpYxdL1JPFBcBoeAth6/Ta6n
 HpLUXXeLsvMwhzwNN/xuBfKVlLUmLCIcpFi+B6mWZ2zK6wOkBLJcltePr0FlW6fSwDEsEP30eUU
 CDrRGka9VHY9Y9R7uCSAnHVdnwxAIUq1ngp+uUGMTfq5+LYgl35uRvelprA4OJMQYG3g6TcGwig
 wW17tqmy/NW8PC0yUDuik/4xxiKtWFPwQ6/X5Dpefii8Vr02ChRlxmfg15LlTW8hTN2YVglhtpJ
 DIw==
X-Google-Smtp-Source: AGHT+IHF/tsnTWTEpF4H0kg8q1A+TidSDULFwV9+aTYXkyTCuSdYjLeHagAev7Ne5ELDSe/ppYbBWg==
X-Received: by 2002:a05:600c:1ca0:b0:439:9e8b:228d with SMTP id
 5b1f17b1804b1-439ae218a14mr35556225e9.19.1740161476437; 
 Fri, 21 Feb 2025 10:11:16 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dcf08sm24356178f8f.36.2025.02.21.10.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 10:11:16 -0800 (PST)
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
Subject: Re: [PATCH 3/5] dt-bindings: gpu: mali-bifrost: Add Allwinner H616
 compatible
Date: Fri, 21 Feb 2025 19:11:14 +0100
Message-ID: <2356358.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250221005802.11001-4-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-4-andre.przywara@arm.com>
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

Dne petek, 21. februar 2025 ob 01:58:00 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC has a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family.
> Add the SoC specific compatible string and pair it with the bifrost
> fallback compatible.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



