Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGDlHopZc2nruwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 12:20:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3015574F00
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 12:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725FE10EAC6;
	Fri, 23 Jan 2026 11:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWrWApMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8AA10EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 11:20:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so21239545e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769167236; x=1769772036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+I0tLnCW0GptpxTH+Hd4lO3qhepn+XYRWxHDF8cKq3Y=;
 b=mWrWApMp7RYmxEyHLuOwq1BdpvKOpa3DoCwX6ywU3DlK6UKwFTwfxC5NFCE5mUtPn3
 Kdfwl3SjMNwXrMfOfDC79xE+nAskmbXMmtAptcXz/UTyN3wq1p9gR1ia0ef8fPvJ9gVg
 lh4v95B89YbJlhgXNrvUTyc2ut3OW+JMlWH1e5N96g5kgwdxummCVBQv0ajgxpkb9ScI
 ibegtpXTwdBkK+iKtCnWY9RkzRtUxI6++b9GcHsuc9X10Ln/qqwOmAb3hM/KPmIWXGqJ
 kgsxmgSV/ymlgQ+EHuRwwWtv3YLFDL9PhcVbDTp84MPmrhkVilz5Nj/cbBPcEy6TptTS
 5vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769167236; x=1769772036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+I0tLnCW0GptpxTH+Hd4lO3qhepn+XYRWxHDF8cKq3Y=;
 b=M+nhiFXhu/F3jLDwe+ngaI3vJjPdPoEoo+Tt0N3JWF8nt898RGIrBaUGU/68sgGc7L
 53Zbu8rPscq6YPxj7gXM+2r4lDKfe9mmWz2axI1pUd1UD5ZuyreJD8+eFEqEOdMjojjZ
 4WxhbcGO81NentWqIa4UMbj947t+B39OHPBu+258Axy4tANYa6+0rDUIcnngGWRsrNqP
 SkeA37HihnVSl2zK2BPakHE387jUJ9MmcNBGTsD7mEEEI5RNShUud/CCuu3zMKVfQ8/X
 JkGAw7mh6JEZPiUjwGOxDhc2zgrQVZtBGFeKmTwZq5gKa0DkQui0u/8k5smS3I9M/eKg
 JaTw==
X-Gm-Message-State: AOJu0YxbcK+jNGZ44VDLTIl08xO/L5Cr+z+iHfAY0OYj/ggQFFQKM135
 1xhjZJMbXimSeMHMWOE7L4txpPARgmnS3o7j/WWzs1PYQSJvoPfM/7ApQl756Mq7
X-Gm-Gg: AZuq6aIq37A1Ch9vujNUOvMLux8i2HCZUVMSNiEdQSzSZS1hyQ1BRA23qQuP/MkURQK
 diHKxNMhveJap/amb8kMNscvplJ5U5mp+CwhRnU8x1YH3RQAr7JiFHMijhSwAKnLN6s78RpShHt
 bboOC9O5/jsrk3EvRJDfpjffgAOH7Po9JjThULvY6ppdvkSaxGPmlzwWcqqbwGvDEbB43GEwWWo
 dpf5X1JDEwX+Gjexg3lMXslkGuaqOZJjXzK8/POOt7xUz88AYwPc8VExXeEWot4YqS9uAPsJsRg
 YsCeiwZGDIzKb4EVSXmD6QURIf4vMpsbjWtJ/sLNHzv0Qs15xkwooAzAR6DvWyOZz3xs3kKFV3x
 yGHRWS/rPAo6eSwrEpT+3d1xaQ6r2bj1gqrAn8J8dU8D3T66kGw4BA+OubdAJ0Bccl5X/1dXyOF
 hh1KPMPQHAUT0gcypzMkJY4W5FhZDEJ0X7GCkGDFpAB7mqvwJ23T1Maxb1Hw==
X-Received: by 2002:a05:600c:40c8:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-4805067fadcmr16578755e9.24.1769167235975; 
 Fri, 23 Jan 2026 03:20:35 -0800 (PST)
Received: from timur-hyperion.localnet (54001FF2.dsl.pool.telekom.hu.
 [84.0.31.242]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm191404245e9.2.2026.01.23.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 03:20:32 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <someguy@effective-light.com>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ce Sun <cesun102@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
Date: Fri, 23 Jan 2026 12:20:30 +0100
Message-ID: <10030872.eNJFYEL58v@timur-hyperion>
In-Reply-To: <20260123000537.2450496-2-someguy@effective-light.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <20260123000537.2450496-2-someguy@effective-light.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[effective-light.com,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3015574F00
X-Rspamd-Action: no action

On Friday, January 23, 2026 1:05:28=E2=80=AFAM Central European Standard Ti=
me Hamza=20
Mahfooz wrote:
> We now have a means to respond to page flip timeouts. So, hook up
> support for the new page_flip_timeout() callback.
>=20
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> Hi,
>=20
> I have tested this on 7940HS system and it appears even a MODE2 reset
> will reset display firmware, so I don't think we need to force a full
> reset here.
> ---

MODE2 reset _is_ a full reset on APUs, it resets everything but just doesn'=
t=20
lose the RAM contents. Also note that MODE2 reset is not supported on=20
dedicated GPUs, so this will likely trigger a full reset for those.

Can you say how you tested this? I'd be happy to test it myself too.

>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c      |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h      |  1 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c index
> 28c4ad62f50e..bd63f0345984 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -343,6 +343,8 @@ void amdgpu_reset_get_desc(struct amdgpu_reset_context
> *rst_ctxt, char *buf, case AMDGPU_RESET_SRC_USERQ:
>  		strscpy(buf, "user queue trigger", len);
>  		break;
> +	case AMDGPU_RESET_SRC_DISPLAY:
> +		strscpy(buf, "display hang", len);
>  	default:
>  		strscpy(buf, "unknown", len);
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h index
> 07b4d37f1db6..53b577062b11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -44,6 +44,7 @@ enum AMDGPU_RESET_SRCS {
>  	AMDGPU_RESET_SRC_HWS,
>  	AMDGPU_RESET_SRC_USER,
>  	AMDGPU_RESET_SRC_USERQ,
> +	AMDGPU_RESET_SRC_DISPLAY,
>  };
>=20
>  struct amdgpu_reset_context {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c index
> 697e232acebf..2233e5b3b6a2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -28,6 +28,7 @@
>=20
>  #include "dc.h"
>  #include "amdgpu.h"
> +#include "amdgpu_reset.h"
>  #include "amdgpu_dm_psr.h"
>  #include "amdgpu_dm_replay.h"
>  #include "amdgpu_dm_crtc.h"
> @@ -578,12 +579,29 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc
> *crtc, }
>  #endif
>=20
> +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> +{
> +	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> +	struct amdgpu_reset_context reset_context =3D {0};
> +
> +	if (amdgpu_device_should_recover_gpu(adev)) {
> +		memset(&reset_context, 0, sizeof(reset_context));
> +
> +		reset_context.method =3D AMD_RESET_METHOD_NONE;
> +		reset_context.reset_req_dev =3D adev;
> +		reset_context.src =3D AMDGPU_RESET_SRC_DISPLAY;
> +
> +		amdgpu_device_gpu_recover(adev, NULL, &reset_context);
> +	}
> +}
> +
>  /* Implemented only the options currently available for the driver */
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
>  	.reset =3D amdgpu_dm_crtc_reset_state,
>  	.destroy =3D amdgpu_dm_crtc_destroy,
>  	.set_config =3D drm_atomic_helper_set_config,
>  	.page_flip =3D drm_atomic_helper_page_flip,
> +	.page_flip_timeout =3D amdgpu_dm_crtc_handle_timeout,
>  	.atomic_duplicate_state =3D amdgpu_dm_crtc_duplicate_state,
>  	.atomic_destroy_state =3D amdgpu_dm_crtc_destroy_state,
>  	.set_crc_source =3D amdgpu_dm_crtc_set_crc_source,




