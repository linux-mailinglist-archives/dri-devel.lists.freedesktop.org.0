Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019279CDCF3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D910E84C;
	Fri, 15 Nov 2024 10:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZMQgjlTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A41410E857
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731667614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8V56KBRMpEinKBSBG0YIFk6gG8e4S/eGVZhy8X9rmE=;
 b=ZMQgjlTKfohu7ydc7ZPRFIeLKTaQgWudTxBiX5r5wn3ld6Av3FqEfGSQ74vhf+fZXqoE63
 K1MMbAp4/Bwft3uLV3a8ahC4vCo1Sywn/gaEp7t7dULWaguStZ+qnLbGCG/pdUDEBOu2MU
 tF4bc7ZOU5VciQhfDF2YaGFJPpPp5i8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-cn_TogPOM2qn_liBKaQ1ww-1; Fri, 15 Nov 2024 05:46:52 -0500
X-MC-Unique: cn_TogPOM2qn_liBKaQ1ww-1
X-Mimecast-MFC-AGG-ID: cn_TogPOM2qn_liBKaQ1ww
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-53da4f32b6aso465376e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 02:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731667611; x=1732272411;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H8V56KBRMpEinKBSBG0YIFk6gG8e4S/eGVZhy8X9rmE=;
 b=gXB7mKGXn8CbzQZ9FzDSyuTCl/M9kzYoJLEOCUMEjpqzhWURX/BybN9TPbyn73O5gT
 3FO2nusTXNuwMaNG6E122ob7QZNFH8+C6timQJaohlUPOE1ivs9cbIuAmvZR61FDUrWy
 JLW+paFxUrIxy27YqGKiajqmumVQi3OBse+HfugTy/qc0MAVslTgut8qXScdPFwrrhNi
 rYNr6D45GxLNq22jti3/yWQGEM7QZgNOY/3cBpr4UlLeH0aPiPlzzEYVvvCvCFY6Pb+6
 O78Fhk/uo25SsiF8BTGd3CLrpSjDpA5zENCqaGNKWXUtY3vqcQ9OiWFYMid79EkR98/i
 c7Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+PU8QFFOWdZpAM+zpVdTi1jADt/5JeYSOD4aOEjkS7mDyDLs/fXQ/bGyqt1cM+MM+jSp+6OQTdg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypXs7adXZCoFlYH8m7cYHT8IeEwqo+drJrk2xFcXBXpIKKFVfe
 zRqM9cHlnybbU2Xs94GXqg6VXJ63pJ+C+QfTYrgR/YgTxfNYAE57uHuS6fEWR8BgL4/cKGsYsds
 DwiHxYLeWve3LiBW3HTcZQOyg1mM38YzPxWLPpBmQct/SVT946t/9hp9boWEGe9BelA==
X-Received: by 2002:ac2:538a:0:b0:53d:abc3:82a7 with SMTP id
 2adb3069b0e04-53dabc38311mr713526e87.9.1731667610558; 
 Fri, 15 Nov 2024 02:46:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzqisEWWIzmd3EyqvsCurornw+rweYoGIW4r6ioD+lTC0QSuv/hPEVwAURyUuhxv9HvKumWg==
X-Received: by 2002:ac2:538a:0:b0:53d:abc3:82a7 with SMTP id
 2adb3069b0e04-53dabc38311mr713493e87.9.1731667610078; 
 Fri, 15 Nov 2024 02:46:50 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab72141sm49871075e9.1.2024.11.15.02.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 02:46:49 -0800 (PST)
Message-ID: <83e76cb6b546fad48809f36373b3c78c9f855bff.camel@redhat.com>
Subject: Re: [PATCH v6 0/7] Improve gpu_scheduler trace events + uAPI
From: Philipp Stanner <pstanner@redhat.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 l.stach@pengutronix.de, matt.coster@imgtec.com,  frank.binns@imgtec.com,
 yuq825@gmail.com, robdclark@gmail.com, kherbst@redhat.com, 
 lyude@redhat.com, boris.brezillon@collabora.com, steven.price@arm.com, 
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com, 
 tvrtko.ursulin@igalia.com
Date: Fri, 15 Nov 2024 11:46:48 +0100
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sgH5OIRLrzL8Om_-mH3jcdePwGXf74HLjwmeHhnft9g_1731667611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
>=20

Hi,

I have only just discovered this thread; Danilo and I (we're
maintainers of the scheduler since early October) seem to miss on CC.
Do you use scripts/get_maintainer?

I'll look into this series soonish.

Regards,
P.

> The initial goal of this series was to improve the drm and amdgpu
> trace events to be able to expose more of the inner workings of
> the scheduler and drivers to developers via tools.
>=20
> Then, the series evolved to become focused only on gpu_scheduler.
> The changes around vblank events will be part of a different
> series, as well as the amdgpu ones.
>=20
> Moreover Sima suggested to make some trace events stable uAPI,
> so tools can rely on them long term.
>=20
> The first patches extend and cleanup the gpu scheduler events.
>=20
> The last one adds a documentation entry in drm-uapi.rst.
>=20
> Changes since v5:
> * Addressed Christian, Ma=C3=ADra and Lucas' comments.
> * Added patch 1, 2, 6 to include drm_client_id to the events. This
> =C2=A0 is required when a single app uses multiple fds for the same
> device.
> * Validated that the patches don't break gpuvis
>=20
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v5:
> https://lists.freedesktop.org/archives/dri-devel/2024-June/457827.html
>=20
>=20
> Pierre-Eric Pelloux-Prayer (7):
> =C2=A0 drm/debugfs: output client_id in in drm_clients_info
> =C2=A0 drm/sched: store the drm client_id in drm_sched_fence
> =C2=A0 drm/sched: add device name to the drm_sched_process_job event
> =C2=A0 drm/sched: cleanup gpu_scheduler trace events
> =C2=A0 drm/sched: trace dependencies for gpu jobs
> =C2=A0 drm/sched: add the drm_client_id to the drm_sched_run/exec_job
> events
> =C2=A0 drm/doc: document some tracepoints as uAPI
>=20
> =C2=A0Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/drm_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c=C2=A0 |=C2=A0=C2=A0 2 =
+-
> =C2=A0drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 121 +++++=
+++++++++--
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 +-
> =C2=A023 files changed, 181 insertions(+), 57 deletions(-)
>=20

