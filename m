Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915CB2C5EE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AEF10E1A6;
	Tue, 19 Aug 2025 13:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ih5KrQAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4ED10E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:43:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A609F61428;
 Tue, 19 Aug 2025 13:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9335DC113CF;
 Tue, 19 Aug 2025 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755611012;
 bh=26yGzcpoEMSGrmdlxNcFoAgjBUvz7SP8XHQo/OesNlU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ih5KrQAghMQipKwCv3CPpu9ILPwXk74370NIfZ4Xw6s2a0G2Ve2ctgh/nohKO5S8P
 r1p5B1mjnbqsVFjyS8cTMqUhnjHQvjyTcOD9q6woTvJoiBXAjjyvKrLecdB56dApKg
 3cACFEapvKWVlL+K8DYJnQ3KCPqb8sDYKjjVjsSR4KDohjL38uAFiRm0REpkwkULXH
 5DLb2QD/2c7cC+sCrQHzT1fOrCUkH2glqgsuC43yEhaVWer0v78tQwJ1E43mtFDbB7
 H5oFTSuPzpPSwzDlk1ZQRzP6y7JGKpUnkVMeNcIk1BFXc2lS/hBmO44KBdYlYlSrHP
 Z6794vLZioVfQ==
Message-ID: <d50ed50aa1f09f27421fa7bf8d0e84c2@kernel.org>
Date: Tue, 19 Aug 2025 13:43:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/9] drm/display: bridge-connector: use
 scope-specific variable for the bridge pointer
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-1-edb6ee81edf1@bootlin.com>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-1-edb6ee81edf1@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Bill Wendling" <morbo@google.com>, "Chaoyi
 Chen" <chaoyi.chen@rock-chips.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Justin
 Stitt" <justinstitt@google.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 8 Aug 2025 16:49:08 +0200, Luca Ceresoli wrote:
> Currently drm_bridge_connector_init() reuses the 'bridge' variable, first
> as a loop variable in the long drm_for_each_bridge_in_chain() and then in
> the HDMI-specific code as a shortcut to bridge_connector->bridge_cec.
>=20
> We are about to remove the 'bridge' loop variable for
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
