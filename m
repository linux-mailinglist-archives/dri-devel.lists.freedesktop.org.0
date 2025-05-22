Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6DCAC0B72
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5F710EC13;
	Thu, 22 May 2025 12:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JmU/gxR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858010EC13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 183E1A4DFD3;
 Thu, 22 May 2025 12:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876FEC4CEE4;
 Thu, 22 May 2025 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747916202;
 bh=janGegacipRDwPFRgry5bht/UiVsUU8rf1hprM7kBWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JmU/gxR74WvXbSu+bOhy1qYNicRMEwtrvSuhMzYVKoRQnLi0Rozhh2dm9jiM1Yxzk
 QWdD/d6klPn+xdjglaqvz73pTLsoJ/EipbUbYwAG9kwZhpzYFkI5SSzuFuRazec1hA
 gIzZDHLb/yuxCB+wXFo8gUc3Pu8YGBu48jThkKMn1xfg1SMhmnhz5h9CvWB54OnVvy
 E3DDvskbZX40AA3rTnNT4Xe7b5YyC3VLpbfypvUhTQT/zngu8S/mWjfYHpZT+4hdo9
 PtMQ04s9OOHwcOUOD6sAVFxrEiDm6hPnqonbGPu97N5RiChSfYQlZ3bofxQ8+YSzTW
 SlPz9RdvPZBmQ==
Date: Thu, 22 May 2025 07:16:40 -0500
From: Rob Herring <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Message-ID: <20250522121640.GA2192083-robh@kernel.org>
References: <20250520024718.142-1-kernel@airkyi.com>
 <20250520024718.142-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520024718.142-3-kernel@airkyi.com>
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

On Tue, May 20, 2025 at 10:47:18AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert cdn-dp-rockchip.txt to yaml.
> 
> Add new "port@1" property which represents the CDN DP output to keep
> the same style as the other display interfaces.
> 
> This patch also changes the constraints for "phys" and "extcon". For
> the original binding, only one phy and the corresponding extcon can
> be specified. In the new binding, one or two phys can be specified.
> Since the RK3399 has two DP-USB PHYs, specifying one allows output
> via the corresponding PHY, while specifying two lets the driver
> choose one PHY for output. This rule also applies to extcon, which
> provides the cable state for the corresponding PHY.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---

Fixed up the typos and applied, thanks.

Rob
