Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1EC9AB11
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69710E5BC;
	Tue,  2 Dec 2025 08:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z5oUBVUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8263C10E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764664324;
 bh=OZJS3ILTZWe85ywFv8vKGi3R+n3CZ4EBdAlwqahEk3Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z5oUBVUP6xEdpPFdG5GcwX44Cch7S6xuWbXGdJQRZ9GLiGfmlV2kUZR+aCSyR4dl6
 QrkyXWoHD6P1aFEarLVKnLlisdae7bAng61yPLE79OsGhrq+S1GPebYWoci5HG0LsY
 DuErKjdTL+4a15c3Pxd6u4diER4zLzar4sGeuiwXPTcHuckzgGI9BXpErHHWX4DJ1r
 jPRnIipUUK9Pe2tgF/FowD1FzbT1ZLvzXRbcm4N1OLYyFXchFTYCsHuBNU1OE4DmJh
 bdKIHdyKbnwbtEaAxn7GXJmmMf3l1FS1N7AgJUhslqoDzO7bJvsLaeqO9L1pOhCdHy
 AbpGEY/iGMSPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B45A17E1149;
 Tue,  2 Dec 2025 09:32:04 +0100 (CET)
Message-ID: <c15adbf1-ec19-4592-a241-2332d836a3f6@collabora.com>
Date: Tue, 2 Dec 2025 09:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>
References: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 30/11/25 23:40, Marijn Suijten ha scritto:
> The DSI host must be enabled before our prepare function can run, which
> has to send its init sequence over DSI.  Without enabling the host first
> the panel will not probe.
> 
> Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


