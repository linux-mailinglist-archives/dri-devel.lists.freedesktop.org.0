Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC653A5D88F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 09:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE53510E731;
	Wed, 12 Mar 2025 08:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbuUHukI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E12210E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:47:05 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so480731766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741769224; x=1742374024; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cboWh7VbAPzsBQYxskHVNAVDvc1UvB0tBOUhT10tT7k=;
 b=lbuUHukIKDifitEt9+O9qvr93DD0gXkNu9BoPY2ylNMvd0BjKp0NKS74BXXNC6ODIb
 ldOkjbRejLG1eCbfzZ+grplI9mB2VOI5Z+pp7HeU8Qb34MZJ4328ErU9NuAgTQSQfUym
 Nm297ofH2R4CDigxZwsQ8S01Gw8SfP/geaya5gTLgV3gUojJK47w1VwUSJmIEj1yAVSN
 O4DvR89HH3MbkAsQYQEmF156w7pfGH0kYDVjj2p82fuj5pNKplCcIPnd5mvJ14/0vy+l
 ANxqjt4frv1Ly1plgMm95+um9u9CZ3l1CdVkz1gPGIRLekEwgJIc4IpiKHH7v3sFKAx6
 Y5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741769224; x=1742374024;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cboWh7VbAPzsBQYxskHVNAVDvc1UvB0tBOUhT10tT7k=;
 b=kopqsUAWBfWgl1hRa3V/r1wYrJ3wXajQ99bjc+EB8naEbcszeJxDRpGzGnYQoMgKh1
 kd5aw8yTEXGAZKoAHZ/w//q1r9yFdVj9TNWUm3Q4SOCvSjJub2n4wdz7eC7hpYoV1Kai
 omk5WdMEb121LJMVj/lQodJe7vROmCBIJebfLHGJezSnMj5Wg9ozkWkBUai0P9juei3y
 cWYz60cMgnZn8fPdOWJ//aV8wg1UdFwMKQyiIztdNT/YYFtM0quLUuOjBncuqC0dFNmw
 8FA6lpfWHYxwNx0KhT2wSUHXRZfSFKMZt67qDEsEeGPJcBh1cWpCsa55AyHrAswrmCBS
 U/iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv6tBIs5uvN8DPhZqhEnERfiWq/LwqwLbFKA37mp+wo2AG+jDEjdYez66x13wXJPdPWLPWlxcL048=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUTDLTybtsRAdhnNQjKiqkmw1ptehVvGuOFtHCa9FpiM4Lw0A8
 WKO5+ZdHwh7HmrZlZzPBe4kBYZZdyAsVEa8v4evM7MaXRLRxaxrF
X-Gm-Gg: ASbGncuvswAeL+rggfS43cwQGfZOSfDUv9RFqO1M6DRFEID+mVyKHl4Cwu7BqwgLKl4
 NjFE2b3AnILUAvZFylgQ8003qGZLiJgnpADSmbzi1koHkNyvvIvKGB7r1pfklbRqZ0w3+WrFkPC
 6OgMaPjibxzfFTO5/RTHhMB8j9iUJwu69stxI9KTI/te9ZKaLFYWd/fy9OPoxeXg7vUXXzS+05s
 R8egxBbZDm81UEm72HCW30LP3RI9RuIZJ/rdhvBoMtwgjWUiHpHhZ/CALluoAeJmk0ih1/F2foG
 /wHjS8yfKnQlCbqbzX6NHO4fcjttUrDgFTd2/1IyZacBasYqnSSLdIFQptUNNv6DqYNtlUcRmKs
 uirb40MMRj5pVKfI2vNWHB8FCNw==
X-Google-Smtp-Source: AGHT+IEAytC6C4YIEA0wGggBQ8yJVqTmWPsicgMCpcYRy5dK3ShRtq/kfhiIN8zCf2YzKqtUcKA+Bg==
X-Received: by 2002:a17:907:97ca:b0:abf:5fa3:cf94 with SMTP id
 a640c23a62f3a-ac25263c78bmr366389066b.22.1741769223745; 
 Wed, 12 Mar 2025 01:47:03 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2865fd7fasm609864366b.29.2025.03.12.01.47.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:47:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] drm/rockchip: vop2: Fix interface enable/mux setting of
 DP1 on rk3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250312064218.524143-1-andyshrk@163.com>
Date: Wed, 12 Mar 2025 09:46:51 +0100
Cc: heiko@sntech.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <695656A7-BF2A-4031-A9BE-659C27F311DE@gmail.com>
References: <20250312064218.524143-1-andyshrk@163.com>
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
12 mar 2025, o godz. 07:42:
>=20
> copy-paste error, which affects DP1 usage


Andy,

Great finding.
Now i see nice screen on rock5itx on dpi1 out :-)

With this: my users are politely asking: when we wili have audio (and =
cec) support on dpi1?=20


