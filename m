Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE339D8CAC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 20:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E7510E6F1;
	Mon, 25 Nov 2024 19:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="IF/Jhwkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD1110E6F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 19:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732561891; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AQ+fK8pZBszsVDlx+Z/SHz8j4YYA07x0lFPi3/F8soKU7jQx0AcUWZFkrJuLnOfETzFH8xDYXsU23BCxNsBXnvukMDO0i7CqNcSQn9f0Tm2Vhni+8xlsxaJhzqA0soMGsDGokQtTgKGGdck2d0mQakbjhlOECX2GvZcTvx0fpTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732561891;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VI6iB72IM9pOeXA3Ahtpe9ntVlB4bLMrZkLxC+m0GCo=; 
 b=ZqaReYXI3yMlq/kG/24NrDsk5UiAPogcX+U98S2vKtl3OmnyR/BmgSULaNR6oyxZSBcI31uDQMuecdYdM+ZqjhIFMO32zzCnpGaM9jG0dGlAW7I6OHFChVA11PJHYvXtJytmDTarzfAPM5oEHknoSdhWhOS1UpirhhPiUcm9sI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732561891; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=VI6iB72IM9pOeXA3Ahtpe9ntVlB4bLMrZkLxC+m0GCo=;
 b=IF/JhwkdPjvuzgIS8SskNCIgBqz8pLJ9CLo/iWplRZZCy7mPF4ZRPjEZWXnzrU6n
 3OPBSf9YeaXaGYcMZ3NkawBA6zCPkrU45xhqfTaMmAMUjoOcgiYIbXkuZj9Yw1TYEXy
 gLSWpVVddBG9VuFDgc8aMbKNRMWDM+1+ol7ybMFk=
Received: by mx.zohomail.com with SMTPS id 1732561888245996.3404772030888;
 Mon, 25 Nov 2024 11:11:28 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v4 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Mon, 25 Nov 2024 14:11:26 -0500
Message-ID: <12567182.O9o76ZdvQC@bootstrap>
In-Reply-To: <3e8f91fa.8700.1936251b29e.Coremail.andyshrk@163.com>
References: <20241115162120.83990-1-detlev.casanova@collabora.com>
 <3e8f91fa.8700.1936251b29e.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hi Andy,

Yes, the issue can be reproduced with the details in patch 2/3 [1].

[1]: https://lore.kernel.org/linux-arm-kernel/20241115162120.83990-3-detlev.casanova@collabora.com/T/#m82b38f4a83c4793bb82919bf736b2f6bd804a283

Detlev.

On Monday, 25 November 2024 02:55:41 EST Andy Yan wrote:
> Hello Detlev,
> 
> At 2024-11-16 00:20:39, "Detlev Casanova" <detlev.casanova@collabora.com> 
wrote:
> >The clock reset must be used when the VOP is configured. Skipping it can
> >put the VOP in an unknown state where the HDMI signal is either lost or
> >not matching the selected mode.
> 
> Can you provide some detail about how to reproduce this issue ?
> If we can reproduce this issue, we might be able to do a more deep analysis.
> >This adds support for rk3588(s) based SoCs.
> >
> >Changes since v3:
> >- Rebased on drm-misc-next
> >- Reword first patch subject
> >- Reorder commits for different trees
> >
> >Changes since v2:
> >- Rebase on latest master
> >- Add details on how to reproduce the issue
> >
> >Changes since v1:
> >- Add AXI and AHB clock resets
> >- Set maxItems for !rk3588 in vop2 bindings
> >
> >Detlev Casanova (3):
> >  dt-bindings: display: vop2: Add VP clock resets
> >  drm/rockchip: vop2: Add clock resets support
> >  arm64: dts: rockchip: Add VOP clock resets for rk3588s
> > 
> > .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
> > arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++
> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 30 ++++++++++++++
> > 3 files changed, 82 insertions(+)




