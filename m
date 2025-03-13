Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF7A5F121
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913AB10E085;
	Thu, 13 Mar 2025 10:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O6Busg8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD48F10E085
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:43:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so1403457a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741862588; x=1742467388; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/wMjl7Q/J6WQRlQUTRmWAqcrf0d7pU34h1ehg31lfI=;
 b=O6Busg8mWxlMA7MpR7kGtoHN1n2Eaa4BXvp3BODUgwA5K897LN7JWXqPCbKZFvap+H
 7YjXYSN2IIt/7TKdmDaQTSZt9B7kNRtuNTkDHhXDlopVLQOQYtjf1L2JFwsLIdxihlFg
 jDT4HmYwLG6l/n2ox3wjeJBjEKDI+Pf/tS5z5mGoj4EUCq9APWkIHcPEbwBWmCVJhAjK
 K9sMR/UdM681BwVE4lJYxwBBKtCG8fZI0Z0isxU85Z6jDeMpeRLq4+uG//l3oWKMp258
 U1jcddLdrKq00El3g7QJDrHk//Ir+FOlfeO2ao65GZhLvSQ8pHVIrkAZEBiLGV1ql/ym
 e2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741862588; x=1742467388;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/wMjl7Q/J6WQRlQUTRmWAqcrf0d7pU34h1ehg31lfI=;
 b=UmbOL0O5Vc3QQeyYytbIR4LkNF3Eb5OPEzJ2qqrTtQRqXli9Htz2ao4TRoEZcmWSvv
 tjgDlRaJzt3C6Cx2yKOw0Ox7qoAaBPbgZwnVzAnsvFf7PyICXsLLGJAMtZzvHOJvd5Fo
 Ljvlr5+kh59gWYfCFwfttn6Q+qKX9wgk2mDAQ980oO6PiyPBxkMJ1C+JznQo0TNDPe+3
 sWTvn4a/S6UntGbThuTfgCUjanq91w/x53fVTdj/m3D5kBzQxtBRikMZ0/K3KRLznZ1D
 6y1Gc5OLyYlyA6See7TCyzgV9Mhb8E2luR0bRhrIt/mxSeU7l3ZWWfWs+Vvc/+xWQQYj
 eH1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjnt1TzB3/XhXm3y0ppSXa2rbtmTtX7Zjj4Rh2db/kG67ssFPtJQbY2h7kWxWMACdycdh6FcQLISM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqGceZ7UiErRgCxn2GNRqotCdyfg1jI3Gvx9T8oAJjrLpjNdRR
 DpLBwJu/g8vBUheJyzn6d76caNPlnsHu3kX5GEDPRfTbPHI+9PDc
X-Gm-Gg: ASbGnctU6xCe1Q3ESIDZNZsyvpAgcBoLEjWaibQbxoZo4M4BInfbPYnyx/zAeA3wgTO
 YJuc/DnzZydERueb5hqhAf/nzMrGLGY/kul2HJ/7ijsw3UL4P+Yd4GjjhEdOtQWu3XfK/T2ggTt
 Xfwfc7l5wSpBlwOFbTrO2Fj4g0csNhRCWLxRAo3Qzian+chm/Rb5gIAHjtm8O1orVo3awWMh4eu
 ynNHsPS/Q/IFi+TvKjA8O2QTqlrr2/1SuH/X69NfwqAAAkIUj+QYdyZmdduAah0BRFvPG0rfFDB
 1/sqVL07bD1FCpQdlK09jB2JMVAuc0JcRTprUV2xOa9/QyIZ0B26GG1f05ShNg/H5931bWz00ft
 UIqowcWYfCF4rp/qo+yZ16KMeNg==
X-Google-Smtp-Source: AGHT+IHlgJ/0Zq8LGAbC0JM1shbR97v6kXIu61cyy2+LFvXoplbiFx6QsyXJl8Y+G3l47+Ic+J7RIw==
X-Received: by 2002:a05:6402:2347:b0:5e7:c42e:3cc0 with SMTP id
 4fb4d7f45d1cf-5e7c42e3d2fmr6212085a12.9.1741862588162; 
 Thu, 13 Mar 2025 03:43:08 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afdfd0sm598994a12.75.2025.03.13.03.43.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:43:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v2 2/7] drm/bridge: synopsys: Add DW DPTX Controller
 support library
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <381bbdeb.342.1958ce2b7f8.Coremail.andyshrk@163.com>
Date: Thu, 13 Mar 2025 11:42:54 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, lumag@kernel.org,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE66F347-431A-45E1-8764-06767B7FC74E@gmail.com>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-3-andyshrk@163.com>
 <61E9B36C-8568-4C0E-A9A7-07FF612912AA@gmail.com>
 <381bbdeb.342.1958ce2b7f8.Coremail.andyshrk@163.com>
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
13 mar 2025, o godz. 01:23:
>=20
>=20
> Hi Piotr,
> =E5=9C=A8 2025-03-12 22:23:15=EF=BC=8C"Piotr Oniszczuk" =
<piotr.oniszczuk@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> This series still  based on Linux 6.14 rc4.
>=20
> Did you apply the three dependency patch mentioned in my cover letter?

Thx!
I noticed =
https://lore.kernel.org/linux-rockchip/20250302115257.188774-1-andyshrk@16=
3.com/ was missing
Sorry for false alarm.
Now v2 works ok for me on rock5a and rock5itx
=20=
