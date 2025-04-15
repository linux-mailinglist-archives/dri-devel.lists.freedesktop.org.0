Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F0A8980C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160F10E6AA;
	Tue, 15 Apr 2025 09:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sWMTzr1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F96C10E6AA;
 Tue, 15 Apr 2025 09:32:41 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZcJpm55mjz9sJ3;
 Tue, 15 Apr 2025 11:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1744709552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkLaV+wna+R3r1dEfBy/+Q0elkhFh9agygOw1TEFt5E=;
 b=sWMTzr1WoWV3J/kim3TsP6hH518lIU7JFO+X1PnFHwyZDIDV7OsTSwdoNb2OWpc9XsDkmr
 mWrFhTYFjE5mPmQuMxVVEVh59fZhTWMKfnWAiE5ecGuAqTqXNulQkYgwjnSwAhWoXu+2Ct
 gLNgPJzTo+o0DQo3F85TwW4l3iwpOEsUsdI8XYN4EeacRpkwZM843e1cLKBVQCPT96eEJV
 c11usoI+58J+dxeH8LEhKnXa1lQdr9V3kC/WvRs5f58/5vOCGIxLkKgJFd/44ZMO77tTmh
 +RkVyeDcj+/lhJLv5CFHXx8XPcKrCm9VDkw5D+P7NqU8numN2nI5qP/Rtja2/A==
Message-ID: <1df5b916-b24d-4b56-87e4-2d7075cfb5b5@mailbox.org>
Date: Tue, 15 Apr 2025 11:32:26 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-3-mwen@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <20250411201333.151335-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ca1a6137b21b666a62e
X-MBO-RS-META: d5ouj7tihucm3pr1by7mq7txdahqmdwu
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

On 2025-04-11 22:08, Melissa Wen wrote:
> Since [1], we can use drm_edid_product_id to get debug info from
> drm_edid instead of directly parsing EDID.
> 
> Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 62954b351ebd..e93adb7e48a5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> [...]
> @@ -122,13 +124,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  	if (!drm_edid_is_valid(edid_buf))
>  		result = EDID_BAD_CHECKSUM;
>  
> -	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
> -					((uint16_t) edid_buf->mfg_id[1])<<8;
> -	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
> -					((uint16_t) edid_buf->prod_code[1])<<8;
> -	edid_caps->serial_number = edid_buf->serial;
> -	edid_caps->manufacture_week = edid_buf->mfg_week;
> -	edid_caps->manufacture_year = edid_buf->mfg_year;
> +	drm_edid_get_product_id(drm_edid, &product_id);
> +
> +	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);

struct drm_edid_product_id has

	__be16 manufacturer_name;

so shouldn't this use be16_to_cpu? (Though I see that would be a change in behaviour from the existing code...)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
