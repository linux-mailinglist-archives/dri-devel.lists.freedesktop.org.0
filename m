Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD729DFEAD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A110E6AC;
	Mon,  2 Dec 2024 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kmhsd5qN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFEF10E1E7;
 Mon,  2 Dec 2024 10:19:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90CA45C4BDF;
 Mon,  2 Dec 2024 10:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1B3C4CED1;
 Mon,  2 Dec 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733134784;
 bh=0nLS4J9qXeFv/L92DDeQg9+azIKURqKYfy9mdnxjm3k=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=kmhsd5qNP8PjnFw7JW1cgOBNkW9mQLZPH4pXX5/8dwKvqwnJuyfirt1aqyztIlDdV
 IH1fjkg7XyFypJst+r31tBHNAEr7/qTjDQF2oM/8PA2tPcxtUxuYqdYsN77yJxxDxE
 D49bbL44XFfS1wbpfVfBn5YTyxG+t99wmK43EiWT1WvygzcP6G28C/zlIKWPnlzfCe
 zAxLiPTwPN1zh6Klz9GCZ0auLZ+9TcEQ0RsSi8QLjmsaMREjCrwaybirjM8aDu7HJp
 PiDC4e0R7txSroxQpjqcg7C7CBbHK/g+gMX1VhGs3ZGwVqMxES1G+5DNd4QBX8vEir
 0VvpMFIv5dbLw==
Message-ID: <77545786331df8bfaf5fdcb309437358@kernel.org>
Date: Mon, 02 Dec 2024 10:19:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alain Volmat" <alain.volmat@foss.st.com>,
 "Alex
 Deucher" <alexander.deucher@amd.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Harry
 Wentland" <harry.wentland@amd.com>, "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo Li" <sunpeng.li@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Sean
 Paul" <sean@poorly.run>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, "Xinhui Pan" <Xinhui.Pan@amd.com>
Content-Transfer-Encoding: 7bit
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

On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
