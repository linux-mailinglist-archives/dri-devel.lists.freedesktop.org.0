Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386EAA5E60
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD34310E03E;
	Thu,  1 May 2025 12:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="DP6jfear";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763F10E03E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=qY7jMh2s1Q1/dxv6yXIZWQpJJC7k3Ol85coLC/4oDNs=; b=DP6jfear58qpqLih8qEWeAKnQQ
 Am4/8PcoygDS5o6wPyNNnUy0zvYj8bbVtlYNpg61LXGX1j5zZiBO6wRVUpDJo4xruDni7GlGyBNwh
 LHIErPoNjgMhjuckkR12zUAxifgvdKGpG+iSS5oJ1V6jDs8j0BlWxt4a95QJESN7zVWCHoQXS4AH5
 2FQ30Io/ZM48p3VvhJI13Y4JuD8QHc8/a6c/S82IuzkqnasGqhW6pJAcgCQSLPQIMNs1zsu7gzF+2
 4vsbA3V8ZZUmEvUz6AKIjH/yiTq1mC0Vav2HgilyjKGiCzv2GUYC76ElZZOiR9XB89XTHXIdF4fRW
 WuOP+l+g==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uAT2A-000129-Qn; Thu, 01 May 2025 14:28:58 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Alex Bee <knaerzche@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Thu, 01 May 2025 14:28:57 +0200
Message-ID: <3554727.QJadu78ljV@diego>
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
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

Hi Alex,

Am Dienstag, 22. April 2025, 09:04:39 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
>=20
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
>=20
> 2. The signal is unstable. When running the glmark2 test on the screen,
>    there is a small probability of seeing some screen flickering.
>    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>    by GRF. This part is missing in the current driver.
>=20
> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> missing part in driver and dts.
> PATCH 7 converts the curren driver to drm bridge mode.

this looks all pretty okay to me, but could you check that your rk3128
keeps working and maybe provide a Tested-by?

Thanks a lot
Heiko


