Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F9C4E376
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD1310E5D2;
	Tue, 11 Nov 2025 13:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HzhHVUEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788310E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 13:44:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42b3c965df5so1123469f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 05:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762868688; x=1763473488; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Sn99SqPbNDKwwBMwSYGqkDAo7zw2QYrYZqdD7IgwsCk=;
 b=HzhHVUEc83AFvtgdTlPTKVKwtxhM4dDK0hqKTwBItzt1rVeoSQC/6JqaivpKCkKhnl
 HmcRdixFe4SDylLJopHPkQLVaf6u9bkfL7JhPrdZ/F75cQRdoy16P0l2W0/x6jfCXhi4
 IAn4NVxc7vkJ7DL0CcPD/iNO0W008GmSkehn0vT83kMsgN5AAScrH9lhVFaNZdM0FFtz
 iQ0CTyJHoR22g1E2ZhoRaGwB2WpI3gCqg6iX3w8mVrEwLIgVGJTYxHBSLXA40IX2PhEU
 Cvr6Zh1wiJBXm62HnmLK3IFw+SoYKGLjeagLBVV2aiA85PxEXpn4nRLcrBUbJwgkQXsr
 tINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762868688; x=1763473488;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sn99SqPbNDKwwBMwSYGqkDAo7zw2QYrYZqdD7IgwsCk=;
 b=JXykh+SEOVFUWLagVD9fqi64UuXl2sf6GDlLu4rKROcsgeEHXwXWaJ+b/maKC3a1dq
 tg58xQP6vqVvIMGiXwDaS7AevGtALf6giGD2K+rMp6NQ37z/C91h0DcXLTlVrmbYYlOG
 eYEnrmJnrHSY6f5HIfZaxQwwkJIsQw7skLDj3WQDBchrEnCu4mg8jiCUfNhDiUbSMi0d
 xcNEp8otLdugBBmEmpnHiec5IqBcGPcaDvMio+hgBoIRP+kcwuQNw4gR8E7yz15fbjjB
 GpK6IgOL846f7klePcJ0J33szP5L0GTKZSgL+3d8crV67Lt3OENzn7QQu3XG10UIs2Vd
 WDTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVipqiP4rkA3ltd0zNl/RyODyUGMOM9HuDYUkbC357l+CQC8kT/4r3YxT6uqXKRSgxh6E30M5JzS2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweBlIRLpVHcwgIVysUjR0RkVOyAOtohffFGcBpcaNOoEXHpkiX
 zZmZouRxQo1mrBHKnPxUfKbnBveZkHgnmpi65P9wIwgyvnRtD8cVFkk1
X-Gm-Gg: ASbGnctmhcMCnIjrsgLy6uE7q0qYY9RccgRCCLyeKh9LSCLXBAOdxLQhc84thqyLMD+
 5g1flKINdQrrUtkFSUn1nwdZ4iP/IkEUy610nb3qmsfZXG7ALqSRPDAoimhVFVObsidNAOf/2sk
 klCh9dX3NZbFfxpkqWVnfEBYZSV2aIq5xD8Sk3/KUZEYTIH158C/sYp2cZX/H4wW5NyKmTO8Z+A
 9jF4vzvwTwgwFinnmNU3PhVVo/31ceY3iepyca3QEAY7G2X4Spi4nPAC1F67RI9ZyEQ0uXhud54
 JYhyHDw5K4K4Teskh8iEyqsgFrayBwtc2ZOpCbzvJOEvJtjsSwxdzTuKhGYJsM0th5M42LhU/Ca
 DvuX0dS6u97+1eI4RqhngwLVYgy7vfZ54nrNZNiHuc/1J2h/zXiT9+cVYChjYuQbya9QrKT5Ve5
 bqsh4GMOmzqnGvliov0V3f0YeaxK3J1eX/RLn015PdGNGQSOjOPgaXTA5zlP082uY=
X-Google-Smtp-Source: AGHT+IEz1ZevkiYZDDXqpa5uQOZqmkDDNYCnGC873ZSQb+WZwJWLnco89x5FdRVzNacZFPIH5IMCDg==
X-Received: by 2002:a05:6000:2188:b0:42b:324a:b9c8 with SMTP id
 ffacd0b85a97d-42b324abe44mr10363065f8f.3.1762868687679; 
 Tue, 11 Nov 2025 05:44:47 -0800 (PST)
Received: from ?IPv6:2001:4c4e:24e1:af00:ca8b:1d2c:125:e560?
 ([2001:4c4e:24e1:af00:ca8b:1d2c:125:e560])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62b23csm27733570f8f.10.2025.11.11.05.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 05:44:47 -0800 (PST)
Message-ID: <9f517c3a65d410d4ac169e375cd7ecacbea2dfb3.camel@gmail.com>
Subject: Re: [PATCH v7 14/15] drm/amd/display: add drm_edid to dc_sink
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
Date: Tue, 11 Nov 2025 14:44:44 +0100
In-Reply-To: <20251106165536.161662-15-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-15-mwen@igalia.com>
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
> Add Linux opaque object to dc_sink for storing EDID data cross
> driver,
> drm_edid. Also include the Linux call to free this object, the
> drm_edid_free()
>=20
> v7:
> - put new edid-related helpers in dm_helpers (Harry)
>=20
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 5 +++++
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc_sink.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/gpu/drm/amd/display/dc/dc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/amd/display/dc/dm_helpers.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A04 files changed, 9 insertions(+)
>=20
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index a7ad93c2eb5f..419852dfc237 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1007,6 +1007,11 @@ void dm_helpers_copy_edid_to_dc(struct dc_sink
> *dc_sink,
> =C2=A0	dc_sink->dc_edid.length =3D len;
> =C2=A0}
> =C2=A0
> +void dm_helpers_sink_edid_free(struct dc_sink *sink)
> +{
> +	drm_edid_free(sink->drm_edid);
> +}
> +
> =C2=A0enum dc_edid_status dm_helpers_read_local_edid(
> =C2=A0		struct dc_context *ctx,
> =C2=A0		struct dc_link *link,
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> index 455fa5dd1420..a5b9081879e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> @@ -65,6 +65,8 @@ void dc_sink_retain(struct dc_sink *sink)
> =C2=A0static void dc_sink_free(struct kref *kref)
> =C2=A0{
> =C2=A0	struct dc_sink *sink =3D container_of(kref, struct dc_sink,
> refcount);
> +
> +	dm_helpers_sink_edid_free(sink);
> =C2=A0	kfree(sink->dc_container_id);
> =C2=A0	kfree(sink);
> =C2=A0}
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h
> b/drivers/gpu/drm/amd/display/dc/dc.h
> index 2efb9add13ff..3cf7507d11fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -2576,6 +2576,7 @@ struct scdc_caps {
> =C2=A0struct dc_sink {
> =C2=A0	enum signal_type sink_signal;
> =C2=A0	struct dc_edid dc_edid; /* raw edid */
> +	const struct drm_edid *drm_edid; /* Linux DRM EDID */

If we want DC to be platform-agnostic, I don't think we should use
pointers to DRM structures here. I am not an expert, but I assume that
DC needs an EDID on other platforms as well.
How about something like this?

const void *platform_edid; /* Pointer to platform specific EDID struct */

Then, on Linux this can be the drm_edid and on other platforms
it can be an equivalent struct.

> =C2=A0	struct dc_edid_caps edid_caps; /* parse display caps */
> =C2=A0	struct dc_container_id *dc_container_id;
> =C2=A0	uint32_t dongle_max_pix_clk;
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 0415cb50fe32..e23204fdd3f5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -68,6 +68,7 @@ bool dm_helpers_is_same_edid(struct dc_sink
> *prev_sink,
> =C2=A0void dm_helpers_copy_edid_to_dc(struct dc_sink *dc_sink,
> =C2=A0				const void *edid, int len);
> =C2=A0
> +void dm_helpers_sink_edid_free(struct dc_sink *sink);
> =C2=A0
> =C2=A0/*
> =C2=A0 * Update DP branch info
