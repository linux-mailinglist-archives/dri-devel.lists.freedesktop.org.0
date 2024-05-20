Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4E8C9AB6
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC5910E4CB;
	Mon, 20 May 2024 09:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="T0evZWkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A87710E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716198518;
 bh=thi7surURGed3HD6kvRIjW8Ud8uvGfTlOLEu6z0HL5s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T0evZWkNvuwzG7GkhUyvVpjzu/Tp912PHnbjefH66ew2QMMzjB9P/iT/4flVzku6y
 2LKPBcWyk6wYtH6Sj+TdO2Kpa8ZNGRdbfgog1//5nrNv/wAfM4nuGOPQsbL80ybf4t
 ZzlM7hPeY7X6BjUZogGHHpGluirIU7sp4kMreEu8AMQICt8JYnZ+8j9/Ic5oZFlHzl
 tBv5s/jLEaJqWBC4YjgwChwAT00VpDfsfBrJztCnGW2RTsxHgD53TY06SMGquvnbv+
 AMNklmv6wk/uTm7pZp/9gRv1P+kNNawvzCNlNzmJSHyxTNBRRtsDDLGLPUWQRyLsyu
 1hS8bBAGKlPEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82FCA37820CD;
 Mon, 20 May 2024 09:48:37 +0000 (UTC)
Message-ID: <3efcc6c1-054c-444e-abd1-230124964307@collabora.com>
Date: Mon, 20 May 2024 11:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/panel: boe-tv101wum-nl6: Check for errors on the
 NOP in prepare()
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Shuijing Li <shuijing.li@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Xinlei Lee
 <xinlei.lee@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.3.Ibffbaa5b4999ac0e55f43bf353144433b099d727@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240517143643.3.Ibffbaa5b4999ac0e55f43bf353144433b099d727@changeid>
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

Il 17/05/24 23:36, Douglas Anderson ha scritto:
> The mipi_dsi_dcs_nop() function returns an error but we weren't
> checking it in boe_panel_prepare(). Add a check. This is highly
> unlikely to matter in practice. If the NOP failed then likely later
> MIPI commands would fail too.
> 
> Found by code inspection.
> 
> Fixes: 812562b8d881 ("drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


