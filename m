Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21843B37B85
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5D710E724;
	Wed, 27 Aug 2025 07:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="PrLTcrFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8735010E648;
 Tue, 26 Aug 2025 12:29:49 +0000 (UTC)
Message-ID: <b7cb3882-b04a-4f1e-a849-956a4df6ff6b@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1756211388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEfvanppTrxEsqSn0RrWuJbP/yMWdRGbToB8V5ydIGg=;
 b=PrLTcrFFlEFV41vGbnVZRMznQyrAOhvzJo7cEudTI1814MU5SkfediNE9+7fIn/eTn/mv1
 osU5LsVO54sj1WPp2ggS2gXSaxmr//xhdmwxyAd/stOmeT/SYhzvLvaaRjmcHxJSjjo6wV
 8+U7td5a3QtL/BjxW89VuxUh6TavRrou1XK4qIzxlb2OaE8R+D/jicn6CchyleiAJj2eGC
 1xR/bPw5CghWoobZhVgVq25FVzF7NZR06fRsgpqvcC3eUwSh0lA+7D5o8bJH0pnL5ta8bH
 SWi92MOGP6gZpRuUmaKS6xJ2/EfBIbSDOI5qEN7zfnRdJy8wqx8voIzJtiEjzA==
Date: Tue, 26 Aug 2025 14:29:47 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/5] drm: panel-backlight-quirks: Add secondary DMI
 match
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-4-lkml@antheas.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20250824200202.1744335-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

On 8/24/25 22:02, Antheas Kapenekakis wrote:
> Using a single DMI match only allows matching per manufacturer.
> Introduce a second optional match to allow matching make/model.
> In addition, make DMI optional to allow matching only by EDID.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/gpu/drm/drm_panel_backlight_quirks.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index 702726c20ccc..3d386a96e50e 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -8,11 +8,14 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_utils.h>
>   
> +struct drm_panel_match {
> +	enum dmi_field field;
> +	const char * const value;
> +};
> +
>   struct drm_get_panel_backlight_quirk {
> -	struct {
> -		enum dmi_field field;
> -		const char * const value;
> -	} dmi_match;
> +	struct drm_panel_match dmi_match;
> +	struct drm_panel_match dmi_match_other;
>   	struct drm_edid_ident ident;
>   	struct drm_panel_backlight_quirk quirk;
>   };
> @@ -48,7 +51,13 @@ static bool drm_panel_min_backlight_quirk_matches(
>   	const struct drm_get_panel_backlight_quirk *quirk,
>   	const struct drm_edid *edid)
>   {
> -	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> +	if (quirk->dmi_match.field &&
> +	    !dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> +		return false;
> +
> +	if (quirk->dmi_match_other.field &&
> +	    !dmi_match(quirk->dmi_match_other.field,
> +		       quirk->dmi_match_other.value))
>   		return false;
>   
>   	if (quirk->ident.panel_id && !drm_edid_match(edid, &quirk->ident))

Tested-by: Philip Müller <philm@manjaro.org>
