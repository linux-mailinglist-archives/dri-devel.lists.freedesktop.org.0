Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16196A50121
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34C10E294;
	Wed,  5 Mar 2025 13:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IOLF4Fpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A326B10E294
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:56:27 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so155152366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741182986; x=1741787786; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tKVO1/yFtKo8AxMa+9eBPIXNrWvUam3daAFVJ/GPxo=;
 b=IOLF4Fpwmk+w8ydSB9qGL7oN4dXEzDRLB6HvyxuPG2W1Tz8+nipjLuJzep0EXDnO2I
 GY8+1nkSgukTlC+qgA4sXN8eEWK44uezo7lF9BO6gLIgxHp/IiiYj0pSWLG8NKWj8Boa
 xqeUueG4qYAGllFfhd/jFGE0p3HXEj0spl1fSciG2U2A6L7RQVkoOD7+ukE5EpNCUXMH
 s1hLvOwBhCCQY/SuEtW9OyWbk7OGz2XuQ7RsP62LS+EmLS1BwOCy0D9+8ViNQvqw+bgu
 FoxDdiB42Qt1HtxCcYvnKBjxyOQ0CSw6P4Y62M63EdYC+V71petoMDw+lvjirx2R5f/l
 cd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741182986; x=1741787786;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7tKVO1/yFtKo8AxMa+9eBPIXNrWvUam3daAFVJ/GPxo=;
 b=MLEPsZoN6TiQ0DtSr0+3rwuG7iJ0aFPRv1NO/YO9daFTo66pdkDQsrVaXWE/JCx8Ay
 qBetl909u7MmQ1ogS9CHb2/0n+1kbfmjTdyxaajdltvhgBxXIFgwqXDwizd/5/pzoqkF
 OBMyRudSaw64e90UGJzMhOCSJT4s+luhA0A6PcOZpe9aXy0dHxz8pQ7SRAN0vER3A0Og
 q7kPgBghjfXmwHfTq4EB6PuuxJSfyvf4COejgctZckge9JGCwFum7ukrl5e7lQg/Rt6N
 Uzf4Y5ymhUPE79bKRj26FsfqPMWmVbhlGeZYTExFYceEHuQeG/YKDMjLzVzMXRsNM9rL
 E0lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvUKSM1EyMqV2tITwU8VWGqNacS0XjiqSl/OdJzLZlgLp1ZrkT0H9EN4L5B4cO8HXD/EepauqAv4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Mki1ZjLtBEGbT33miAR0D9RckfeIVMKBE32HurH8jEQop/2u
 l0OQG60yMqxJZaE53cv/eb3Hyp14ylIfTKdJVhr15hQkP5MaEmZx
X-Gm-Gg: ASbGnctSI5UaK00MgqVKJtojcyr87Lupi1vNxhm/wSkI2jFvpm0rWpl+KAiWQgcDkUa
 cxYouSrqvXdfg+IvGxvFktt0DCZ6opSrUPeZxloDq+2lCHeuS4S0t4zpFfIiXRecvjT+3CJVuKN
 ZNooi8MBviaoUtPFidopYI4yGAmOmbcWnI5SV5iPJ8kDp2FA5S2vp9OC4yl36kMfZY8uPx2F5to
 sHz053VPKM2oLhlcbtj5LqO/9WrXZamEevJJvlDmwIncRWxgg+F+ibbiBW/cUr5xXOcNrNLYWg+
 5U764QVNv8ZgBM+eSE6K00aMQKlS9MvIvPgOA2L0O50Kzl7KTrxlVvy4hLa13UqyEAEPyOp/MGx
 jhoMNWYTSZ//2yYsCdOmzHmlLrg==
X-Google-Smtp-Source: AGHT+IFPKwZUivV9o2egwM9HtqA1X+Wqp5ZNIRNxx/29F/9iRwcSuupsGjgksk9DPk6Csl6LQmklyQ==
X-Received: by 2002:a17:907:7216:b0:abf:6951:4bc2 with SMTP id
 a640c23a62f3a-ac1f0edc6b9mr612346766b.7.1741182985565; 
 Wed, 05 Mar 2025 05:56:25 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf7663b935sm550196266b.150.2025.03.05.05.56.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:56:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
Date: Wed, 5 Mar 2025 14:56:12 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
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
5 mar 2025, o godz. 03:30:
>=20
>>=20
>=20
> I only see the HDMI connector from your dri/state ; so it appears the =
DP driver hasn't been successfully
> initialized=EF=BC=88I think kernel dmesg can tell that=EF=BC=89.=20
> Have you enabled CONFIG_ROCKCHIP_DW_DP ? This is needed.
>=20


Andy,

Do you mean CONFIG_ROCKCHIP_DW_DP or CONFIG_DRM_DW_DP ?

If CONFIG_DRM_DW_DP - then yes - i have it: =
https://github.com/warpme/minimyth2/blob/2e267842b1033bbc4c2c5d80c1756a142=
e347cc5/script/kernel/linux-6.14/files/linux-6.14-arm64-armv8.config#L5024=


Kernel dmesg: https://termbin.com/uiup



