Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A64AB9991
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648010EA26;
	Fri, 16 May 2025 09:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="KyESI/2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B95410EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=QVfxvrCQXv1stWTNGX4NXG+vcy75UugbfRcy9FAUof4=; b=KyESI/2J9ezWNblBEXm8WCY5Vx
 N0U6K8cowUXXXmvRS21Yz3CFNQF01H2tUlXEnlpnSymSWijOPM4wuA18OBysE8g3XQMj4yFYRJTBs
 VJ6WcqCkCQK2BXggU71M67bIiMNvzg//sKECW9IUOuIFZUkbzkZWfB3XyM4iG4H+RPlX0Yw12AXFi
 VAZkVGylkbqpe+685ZOX7YOaL+MSIrvGMk95uxNPsNxtRG18D3YZ+a5Z/HFWL1yQI+BDxJmln1pl/
 Mtk/ViNcfB4w0c47ve5aE54sxZ+w9iBxM0roTDImQ4HzIYBlmWBVfBcx1S7RreM67pjt4/poXXeBG
 ZqDNxL9w==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uFrpU-00016q-Dg; Fri, 16 May 2025 11:58:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: long.yunjian@zte.com.cn, hjc@rock-chips.com,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn,
 ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
Date: Fri, 16 May 2025 11:58:11 +0200
Message-ID: <2022996.jZfb76A358@diego>
In-Reply-To: <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
References: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
 <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
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

Am Donnerstag, 15. Mai 2025, 17:54:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On 15/05/2025 14:35, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> >=20
> > In the probe path, dev_err() can be replaced with dev_err_probe()
>=20
> That's not probe path. I am not sure if you really understand this code.

I think that is somewhat debateable.

dw_hdmi_rockchip_bind() is part of the rockchip-drm component device,
so part of its probe-path. Also I think just the presence of EPROBE_DEFER
which causes the device to re-try probing later is a nice indicator that the
code in question is _a_ probe path. (and usage of EPROBE_DEFER is an
established pattern to make that component device re-try probing later)

And the parse_dt function itself is part of that path too.


> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> >=20
> > Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Incomplete chain.

Yep, the patch needs a 2nd Signed-off-by line from
long.yunjian@zte.com.cn please.


Heiko


