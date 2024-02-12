Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B1851233
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 12:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D2E10EBB8;
	Mon, 12 Feb 2024 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G4r9VQZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B9810EBB8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 11:26:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 61884CE10C2;
 Mon, 12 Feb 2024 11:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267C7C433C7;
 Mon, 12 Feb 2024 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707737204;
 bh=K3N8ZPAAOKo0KZHQ34c8vMe/Mid0bAJ1+AspKF2Ta2E=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=G4r9VQZBjq2Ug7fVbtqc1J2XD24jen1ATbmQqVGMxsRqcBujjXcbqtoIbCsMkG7HT
 VP06Z4eDclY3lVzoSAlb/lKUwuUC5ue2Ts1jG5tWmUisOPd65RSNxwj46nzLDhb6pO
 moaMQdqnzuVwFwzn0TJ/ul5HPW2VTEM7+/8Pis0743uvHVPaenBQ9zrAe1Mbmml94j
 godjMfQ/ZRx+CMzPK7MDLHAV5wIlxWRnhtuRtxKhSI56nsKiDjztOmInBPJiULfUrc
 PNsCU/IzaIwUGt1E45ouVNzL/XafWJh2GAhh4FD7Rz5I9W0VCOmXypgSOXCuva5dv0
 bHSleyO3mCP/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Feb 2024 12:26:32 +0100
Message-Id: <CZ32B7Z5AD1C.15PCL5XYCYOP7@kernel.org>
Subject: Re: [PATCH v3 10/10] drm/bridge: tc358775: Configure hs_rate and
 lp_rate
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tony Lindgren" <tony@atomide.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Simha BN" <simhavcs@gmail.com>, "Sam Ravnborg" <sam@ravnborg.org>
X-Mailer: aerc 0.16.0
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-11-tony@atomide.com>
In-Reply-To: <20240211095144.2589-11-tony@atomide.com>
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

On Sun Feb 11, 2024 at 10:51 AM CET, Tony Lindgren wrote:
> The hs_rate and lp_rate may be used by the dsi host for timing
> calculations. The tc358775 has a maximum bit rate of 1 Gbps/lane,
> tc358765 has maximurate of 800 Mbps per lane.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael
