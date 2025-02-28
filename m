Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A58A4A448
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 21:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA4410E021;
	Fri, 28 Feb 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ImF/qPUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AFD10E021
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 20:30:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e4d3f92250so2707521a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740774647; x=1741379447; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXgIwUFfcnXRTfKL18xxHQyr5xsRYovfLqKmpOqaIBU=;
 b=ImF/qPUcovfEWSNhrYGFXvn+H2LJFGgX6pXN/Vso9rm9C7t8X+lRxXxae6j5FSSePk
 u1zBf9Y9xDiTAcl96hAFTuEGm0gBvB4IaDucXs0q4rL1g2L7URMOQfHXrrIxtKMq/p4L
 yWteI0qE+EjMuXkUu9ji8lWMImjJ8JlPC71m3i+Cs42KTy7/F4isgKVbCnYuqW1m+fsn
 iV5UJtIqA63lExH+eUpQXtnLRt9TajWocgecZLvizuGEWBHXEg8joH7FadJ0yYZH8l15
 XnDYYTgZn4wlWSklglsbPDfrsUgybif4EmH8Z7kk9E4Xl/T1vi6j8+H1vdVW6SAoEI6r
 LTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740774647; x=1741379447;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXgIwUFfcnXRTfKL18xxHQyr5xsRYovfLqKmpOqaIBU=;
 b=M3FNMg4O66DUIHTrEfjuCvSDIwOyC/maPlJ/B82VQFMl5/wZo6xHnzy982Iar1IrHr
 5RzC1ec7pEfsGKivvWSSX1e9Z7+1BzSwLMrfv0K6Tz62E9rOHKvy8s26eDciVlwvMrEh
 pXD7pfAGE6qNuk/zT93qPknyPq8Otk0GFrZLCPLCx0SSwasUrtZDVyi418Aehg54JAde
 LgzVIlRQWRWrcl6qwMuMvShBQpzgyVQ5qaSxPR8fcWmOJb3gJXvDOynTVi/GxtcTpmiP
 1a28KIW9EyPibX1DNNhRNYVg417jd90nxhvfYm99SNN7JupE4YnqXt/zwFFgiP2WavvS
 A7qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbmjK7nFORUNIeY4PJsDN4h1l93MFR5gaINA2rAJ6Ux93bDTl3WCXhJVXzr5+Y/RD1dKHMgZVXHdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkQYmUuo77rNSnCd/oFcWLiufsvWJwAsEO8GWXFoRuSkyU61FI
 u4dTd6E8jm0YEz2IjLOKfDS0vgj+DoZFzEBVkdqQY7KNCPL3+Vs+
X-Gm-Gg: ASbGncv5JsO++uMBWAmDT1QORlKREPpu4u3Fj8hQ8phtKypbZ1SHVswmkRRUkeetx6R
 cc9wvlHU05oIX2FZDUS+JrjFEZgPaNkBvqTgMVVL/NYZ61peWaqCb0BxNIoqq3ZqObG2JX0hGGk
 sZG0KZGXeOVcMAKA7SlSLkMV4k8SVC+I0A0oDpe5ucpUxaTeXeW3lUzkjgk3IwBek+R0MTGLC5t
 xyuYkUWjGJ4nWsNRf2SNi78U5+wko9DYAtK4xRAN2dzohZ8FR0EFzOUuMsyoeaGE760D/yl356b
 tQM1MyW/OHjTwJc5epPNb/ilvr8SGt32IzXjklWc7Vmi7AfhzkvXEDPv9m/EbkA3tCCojS6QIBF
 fyLsL48g=
X-Google-Smtp-Source: AGHT+IG2W1DgzC5HFOlMxfquiHOJsjopf4V1IKQfO3ADcRZT8QfnlN9j9L7rrPBIsVSyavnVTfhblA==
X-Received: by 2002:a17:907:9716:b0:abe:e1b3:78d with SMTP id
 a640c23a62f3a-abf261fba01mr544156566b.8.1740774646893; 
 Fri, 28 Feb 2025 12:30:46 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf508f2288sm890766b.2.2025.02.28.12.30.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Feb 2025 12:30:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250223113036.74252-1-andyshrk@163.com>
Date: Fri, 28 Feb 2025 21:30:33 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
References: <20250223113036.74252-1-andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
23 lut 2025, o godz. 12:30:
>=20
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
>=20
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
>=20
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> *=EF=81=AEType-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
>=20
> The current version of this patch series only supports basic display =
outputs.
> I conducted tests in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C =
mode
> hasn't been tested yet, but I suspect it will likely work. HDCP and =
audio
> features remain unimplemented. For RK3588, it's only support SST, =
while in
> the upcoming RK3576, it can support MST output.
>=20

Andy,

Is tis series enough to get usbc1/dp1 working as video output ?
(assuming i will add necessary code in dt)=20

rock5-itx has second hdmi port using usbc1/dp1 lanes 2,3 to ra620 =
dp->hdmi converter

is it worth to play with this or it is too early?
=20
