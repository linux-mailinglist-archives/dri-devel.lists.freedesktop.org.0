Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FCC4E3A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E191A10E5D1;
	Tue, 11 Nov 2025 13:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q98ujS9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EC610E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 13:47:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so1350542f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 05:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762868839; x=1763473639; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ly63k+uQ36PRYVBBMUEsolHGJhhPruNEH5O585g5cVs=;
 b=Q98ujS9q6HDYigmjPdr+TBnOcq/w7C+XQBvUeQa7ctkuugvOQaNF6rncNSQ9O0HLFq
 qrAU5b3mSEYUleSLGRPZh8r28+wZqMH+ZXj+r9Nqx9VVWu3nbvVLkn2SlgZml9WsnUwa
 npM+jt01RLf9F1eonVf7aBuaoXSOl0EdJuiNHGE16Df9xlwH/WSS642p9snpgYC0axx8
 3NsHEUGXVGNcGN2O9hDh4EpMY79ejBWZGO4lc+nmGTsYab8Az31DoL0zLki4F0a6lB07
 RTZe11ZUz384fruqzaU8LyPu++i/oldbxUXj1fQrCav22V+SeovDGcSVooy2EwmhcQPU
 5Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762868839; x=1763473639;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ly63k+uQ36PRYVBBMUEsolHGJhhPruNEH5O585g5cVs=;
 b=tegNvYWSB39zOZpWTaknjPsMUrnign9QnLa/rBjvCwPyyEuecsV53VA3Hkhf5XsV1/
 ssTcfX4MSlUemE0Iwc/jMlaVscH6dxKViUtdKqmiaUeENZ25+YiUaq1ZIf5W6EEhPv/w
 H9/8bCuE+JfcJ4np/mKIq5pkKigNEsZdY+xMVHEYRJGJnCvWC2mnC9WU4DvSjKvVEsMc
 3Qu1b6iDfmaub+133ZRAkDP0FrxOdcSEP/f3gWofgXOkAOhbcxa3h9q2naX5t4+69ac4
 ILMjADkIw3qSOY78jBu8WVvKWgxvZXpDNmp0pNkj4hpcN4j3Sb4dyCh1z2HEMCNQ2dip
 1+sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosvo0qSHMKnfddPYOdphwbftvaynDjPjWrOhXCfmqCT53e3zj4se24f7myXJU27c+gJABsZZnj30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJeHrTvXoFd6fRhiaICcsDEc9vY7rCB6ejEPUW3Q3Otyg+qoWL
 icR8wqb7Yp5GqoIekeBImX18vL9elcoWy4o7oElgvdvoQ62FcDtcQPVb
X-Gm-Gg: ASbGnctfuMX9ZKjit65eHbsrN6xCOH/+Ff6mbZDPUzFdocoCCrSo4rWkb2AdlFzyX1h
 G7qwppDYPJL6q6V9ZxeIbEzObcAfS7MabGsJoLYdcuVpi809BUQjEk/OUZB5uRbSCvbj5fpbQVe
 3yU7OpWyBWZbrt+tJisQj3rHEkhYUNxriMPaFdGWyToNQHSAoc/ljjc60vVWrB8U7OJ+YRwt33i
 C0N5gzywi5Fmn4eaQtTYjXOnZEl+A3gwsrq3xGxrBUUXBwozJ9+zcEcPX2k7Oy+HOWGDiN6G4WI
 Rsf9OZMCYjJZ68S/lCFRRZDkKYprgUcWbfzDIkUu7BP3pRcQ8n2hWS7hOPlgKgjJkw5aBSSiVXC
 FpcRL1gZ9oWYrvyNsHzslT3jBHOT2mcuQMCkF8XFMszwX8TWRGu/m29VsvVEpKx2O77TFDvvl8a
 DyDAJCIjgQc7pPxc1jMNEmmZ+89aQNHMB7zxYl3vfOr/rnORD9KFKx
X-Google-Smtp-Source: AGHT+IEaHVbovSzAk2lICJIM9e+6Qh2XrQ7YBl8vD/liOcYKJlhB97hC6Mu5CZwVI181Skv5+W7Ytg==
X-Received: by 2002:adf:9c82:0:b0:42b:3090:2683 with SMTP id
 ffacd0b85a97d-42b3090289amr7696308f8f.53.1762868839072; 
 Tue, 11 Nov 2025 05:47:19 -0800 (PST)
Received: from ?IPv6:2001:4c4e:24e1:af00:ca8b:1d2c:125:e560?
 ([2001:4c4e:24e1:af00:ca8b:1d2c:125:e560])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e9644fbsm20357500f8f.25.2025.11.11.05.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 05:47:18 -0800 (PST)
Message-ID: <34b8e7bdc34003cf82c1d660ad949abb8901f99a.camel@gmail.com>
Subject: Re: [PATCH v7 07/15] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
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
Date: Tue, 11 Nov 2025 14:47:15 +0100
In-Reply-To: <20251106165536.161662-8-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-8-mwen@igalia.com>
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
> drm_edid_connector_update() updates display info, filling ELD with
> audio
> info from Short-Audio Descriptors in the last step of
> update_dislay_info(). Our goal is stopping using raw edid, so we can
> extract SAD from drm_eld instead of access raw edid to get audio
> caps.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

> ---
> =C2=A0.../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++------=
-
> --
> =C2=A01 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index c055841c3a8f..4333b02dc552 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -34,6 +34,7 @@
> =C2=A0#include <drm/drm_probe_helper.h>
> =C2=A0#include <drm/amdgpu_drm.h>
> =C2=A0#include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
> =C2=A0#include <drm/drm_fixed.h>
> =C2=A0
> =C2=A0#include "dm_services.h"
> @@ -107,9 +108,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0	struct edid *edid_buf =3D edid ? (struct edid *) edid-
> >raw_edid : NULL;
> =C2=A0	const struct drm_edid *drm_edid;
> =C2=A0	struct drm_edid_product_id product_id;
> -	struct cea_sad *sads;
> -	int sad_count =3D -1;
> -	int sadb_count =3D -1;
> +	int sad_count, sadb_count;
> =C2=A0	int i =3D 0;
> =C2=A0	uint8_t *sadb =3D NULL;
> =C2=A0	enum dc_edid_status result =3D EDID_OK;
> @@ -123,6 +122,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0	if (!drm_edid_valid(drm_edid))
> =C2=A0		result =3D EDID_BAD_CHECKSUM;
> =C2=A0
> +	drm_edid_connector_update(connector, drm_edid);
> =C2=A0	drm_edid_get_product_id(drm_edid, &product_id);
> =C2=A0
> =C2=A0	edid_caps->manufacturer_id =3D product_id.manufacturer_name;
> @@ -140,7 +140,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0
> =C2=A0	apply_edid_quirks(dev, drm_edid, edid_caps);
> =C2=A0
> -	sad_count =3D drm_edid_to_sad((struct edid *) edid->raw_edid,
> &sads);
> +	sad_count =3D drm_eld_sad_count(connector->eld);
> =C2=A0	if (sad_count <=3D 0) {
> =C2=A0		drm_edid_free(drm_edid);
> =C2=A0		return result;
> @@ -148,12 +148,15 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0
> =C2=A0	edid_caps->audio_mode_count =3D min(sad_count,
> DC_MAX_AUDIO_DESC_COUNT);
> =C2=A0	for (i =3D 0; i < edid_caps->audio_mode_count; ++i) {
> -		struct cea_sad *sad =3D &sads[i];
> +		struct cea_sad sad;
> =C2=A0
> -		edid_caps->audio_modes[i].format_code =3D sad->format;
> -		edid_caps->audio_modes[i].channel_count =3D sad-
> >channels + 1;
> -		edid_caps->audio_modes[i].sample_rate =3D sad->freq;
> -		edid_caps->audio_modes[i].sample_size =3D sad->byte2;
> +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
> +			continue;
> +
> +		edid_caps->audio_modes[i].format_code =3D sad.format;
> +		edid_caps->audio_modes[i].channel_count =3D
> sad.channels + 1;
> +		edid_caps->audio_modes[i].sample_rate =3D sad.freq;
> +		edid_caps->audio_modes[i].sample_size =3D sad.byte2;
> =C2=A0	}
> =C2=A0
> =C2=A0	sadb_count =3D drm_edid_to_speaker_allocation((struct edid *)
> edid->raw_edid, &sadb);
> @@ -168,7 +171,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> =C2=A0	else
> =C2=A0		edid_caps->speaker_flags =3D DEFAULT_SPEAKER_LOCATION;
> =C2=A0
> -	kfree(sads);
> =C2=A0	kfree(sadb);
> =C2=A0	drm_edid_free(drm_edid);
> =C2=A0
