Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE4C4E39D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F110E155;
	Tue, 11 Nov 2025 13:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LXsoOk01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF8D10E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 13:47:02 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-429c7e438a8so3689879f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 05:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762868821; x=1763473621; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lqp3H7Hh0ahbpm5asw7hSYjR5fyabNxukpQSjLLjqfI=;
 b=LXsoOk01bcgJNcB6RG1z+spbwtjS3C/q8qdi5jQrEu0ZAyVxgIrd8v92kf6a+D0lQu
 ZR84zMW8XzVoTfUWWQWOIypVT4xMaY29qIYstaKwipFnHwb4fhPrrIrucXKQs5egz94R
 KVrEjMJHVNmMCb3mYPOxNDNT0lDDuIFrzDJGv9Z6TE5tr1htBElzlidBCBw6k5tqu3r4
 wiKIqYlHa3bQpNks0Gvl56SXCsFpTHq7WLT/LA2VySJw55aZUGhwWAQkkUtJfZIa4wlQ
 vBjwWWM6PpEj7bN6Hz6xYcGteDch5QkUk2lpzhxJ07MeTTaF6ZLfC3tsr8Wm+u2sV99Q
 UjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762868821; x=1763473621;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lqp3H7Hh0ahbpm5asw7hSYjR5fyabNxukpQSjLLjqfI=;
 b=k+aHfPuupFG8Xr8swzaiZFnJ858bQSn1MIZokUfKcNMfz7aOa6zkOgx0kt9fi0J+CA
 A6v4NfyqQJXY1VYxOFqLSTY57XM+te2x5mjMavLr02wh94HSwl7h8jmpwVNzF9r6JKND
 a3U4BzKihwiL4GwRGvNRaAFP4KNyN6CuKm944gPVKqR/euXR/M0kSeTu6zDHr85wgOQn
 7ZOiWtAh6k3f9PEu+41isf+Dw50TxtCmOVhTQyaHnDfBgtmeIgLQEayrb/C4JIxVkP81
 YPS/ussZEczHzbGyaToqzU37gav+eFDtDc/+OhxeYnLpcCIYNi1B7ox/KWOE8hALC2Vs
 /V0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdZMKGL+QTXhD6ulyEyW4Stf0dXTkfiDr5uAjCaw2mrVQaHFHH/DGUwuEoC2l0yU7Fq4OqNcKhMAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzKRN8mwzaFviaDh+rTsdO6H5B34tF9vmRdVEpVhcfVQRCFZE/
 DfhyfNADZXtaX5ow8qFuoAvaTbw1uhT/ne8JVvCce1+UQA0O3kElOnjh
X-Gm-Gg: ASbGnctOMYwe7gVkj6vphlGdVryjZtu9n0XcTsI40e9Kgpy8pbuv4+T3+mVht6bRRBE
 q0VUyy9WBj8e50tTbjHaqJcUfe0TvHcbghkZbtHcRfry+qKQMSO01feVWzlhzUbiWygGFy/LJ0Z
 efptF3GIj70AnQ696jowQkkuNG20g8KcEzwjq866flgRsNSmKHiEsqH0GW6hwYP57SFQZ9O8Je5
 exnwtP3xMR8aKQruJ9aCOKOZCukL1XwX44fslGEQDxAiZdb1GqnCG+1cVO6Cbn+1DhWrwdVJdaO
 JJ6jM7rO7zgmRK1Kkl5K4QIuqln1hVxax9/ytdhAhbcdNVJ8UfagXrJWVym3pNiS+pWXuL2nWyn
 DDU+/KJBwyhDoYhMOd9jvSNTgaeYV/3jVBZ1G6fKkAmP29ME2dHGkNgRQzKzjIhE0mkp7+W7BbT
 prHxDoa5D55R+iQmL0Qas0/kTT1cdi04KV9JQUu3YlZBLFXnboVO4e
X-Google-Smtp-Source: AGHT+IHagdKxC9CDq9Z5KrnivvzwMC1LqsmSwImIzBnIdoRYO8w7pjRNA08g73rvSt+TxQnf33h8Gw==
X-Received: by 2002:a05:6000:2107:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42b2dc12cfamr8200062f8f.12.1762868820773; 
 Tue, 11 Nov 2025 05:47:00 -0800 (PST)
Received: from ?IPv6:2001:4c4e:24e1:af00:ca8b:1d2c:125:e560?
 ([2001:4c4e:24e1:af00:ca8b:1d2c:125:e560])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2f7a0512sm21076633f8f.18.2025.11.11.05.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 05:47:00 -0800 (PST)
Message-ID: <614c1ff4a998c140b2ed812b9a707839339cb94a.camel@gmail.com>
Subject: Re: [PATCH v7 06/15] drm/amd/display: get panel id with drm_edid
 helper
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Rodrigo Siqueira	 <siqueira@igalia.com>,
 airlied@gmail.com, alexander.deucher@amd.com, 	andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, 	jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, 	maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, 	rfoss@kernel.org,
 simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 11 Nov 2025 14:46:57 +0100
In-Reply-To: <20251106165536.161662-7-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-7-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
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

On Thu, 2025-11-06 at 13:49 -0300, Melissa Wen wrote:
> Instead of using driver-specific code, use DRM helpers.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

> ---
> =C2=A0.../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++++-------=
-
> --
> =C2=A01 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 632cf2a32a4e..c055841c3a8f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -49,16 +49,11 @@
> =C2=A0#include "ddc_service_types.h"
> =C2=A0#include "clk_mgr.h"
> =C2=A0
> -static u32 edid_extract_panel_id(struct edid *edid)
> +static void apply_edid_quirks(struct drm_device *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_edid *drm_edid,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dc_edid_caps *edid_caps)
> =C2=A0{
> -	return (u32)edid->mfg_id[0] << 24=C2=A0=C2=A0 |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)edid->mfg_id[1] << 16=C2=A0=
=C2=A0 |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (u32)EDID_PRODUCT_ID(edid);
> -}
> -
> -static void apply_edid_quirks(struct drm_device *dev, struct edid
> *edid, struct dc_edid_caps *edid_caps)
> -{
> -	uint32_t panel_id =3D edid_extract_panel_id(edid);
> +	uint32_t panel_id =3D drm_edid_get_panel_id(drm_edid);
> =C2=A0
> =C2=A0	switch (panel_id) {
> =C2=A0	/* Workaround for monitors that need a delay after detecting
> the link */
> @@ -143,7 +138,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0
> =C2=A0	edid_caps->edid_hdmi =3D connector->display_info.is_hdmi;
> =C2=A0
> -	apply_edid_quirks(dev, edid_buf, edid_caps);
> +	apply_edid_quirks(dev, drm_edid, edid_caps);
> =C2=A0
> =C2=A0	sad_count =3D drm_edid_to_sad((struct edid *) edid->raw_edid,
> &sads);
> =C2=A0	if (sad_count <=3D 0) {
