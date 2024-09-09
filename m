Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAC97127D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 10:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839610E335;
	Mon,  9 Sep 2024 08:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CmmvlXBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3560410E334
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725871660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REa2YtSNPKEgV+iVjb5MY20wP/9OgvEiBZOC+QtDWWk=;
 b=CmmvlXByHvVmDRW5vlj/UrqQlGXyMd0ilI4jiwpS46sTZSeym33RZdzzlHMzoqN9maYVZx
 V0DMnqlXTZG7Qar8OMbsMyXSuFl4r0zPIsb5apvXAu/uTlhuBUiViEXKbXduvf1lxqtXec
 cq69T2JV/AmPWWcqk6cfwr0YgQ6AFms=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-p35YAryvMcWuvBA1H0y8yQ-1; Mon, 09 Sep 2024 04:47:39 -0400
X-MC-Unique: p35YAryvMcWuvBA1H0y8yQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb89fbb8bso4457935e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 01:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725871658; x=1726476458;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=REa2YtSNPKEgV+iVjb5MY20wP/9OgvEiBZOC+QtDWWk=;
 b=ZO1yiTBfI3YNcDlpTPxg8HRq9Df2ROEUUama2A3kCTlw5/lljhidzbZzkIzauWDus3
 V5dc3g0C6gu7HUA6oYy8GVYnSVpMjmFj+VRbpdt5OON/dkURivJUQyo2UOsEJa2zZwcx
 yQNZWEb2/78SS97syneM3IdYbmNvPwQDDFjJTHFIf+/5udwNFErdhcdPRc7USteU6Bd/
 riwva6Js2HxGgVbH5wvHRVAixD9L+NglrR3Zfwv4CEZUMRdcETQ2TPVkqIZFgg8cr+yM
 Du7xteHCKJyaxrJ3aQm4pXLiWY43bg5dG992uhDtCrv9gGpZJbQ0iWu00dnHhTxSMqjY
 wh7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWgzEsLcYPsqNaj5609yDLSHbmmkse+bHYZru/jIqAd/YeJvuEm0zEhTg4m3bksVg2BHL1eYLjgFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1eis/GTa8bUfe9fPfAUCjJPO4BMFPu0djjLvboEECdlnPJZKr
 MyWhbzILt+riNHSjWK+JZt57nK44Rl+ZKq3TR7ervPks5lN9EG+ZhpDZeREjSsGA0i8IoIFTd8Y
 uQMHoWjY7Xys1dFvvITJRmH2Hcjppp1GCqHBLWKbG7iqzgVn0AtAfaoweZLdK/DiOYw==
X-Received: by 2002:a05:6000:1286:b0:374:ba83:8d73 with SMTP id
 ffacd0b85a97d-378949ef80cmr3454465f8f.8.1725871657819; 
 Mon, 09 Sep 2024 01:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+fB8HpSRCfOtGoLKTf8mOFAvUUP4CCL5WFFcwiDUp/9hyyGQV+hgsu8BPBsxMUQBquLTCVw==
X-Received: by 2002:a05:6000:1286:b0:374:ba83:8d73 with SMTP id
 ffacd0b85a97d-378949ef80cmr3454450f8f.8.1725871657248; 
 Mon, 09 Sep 2024 01:47:37 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb0e30249sm53528075e9.1.2024.09.09.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 01:47:36 -0700 (PDT)
Message-ID: <3d9450d3a7334da47b0d3dd7b902be7dd9051a2d.camel@redhat.com>
Subject: Re: [RFC 0/4] DRM scheduler fixes, or not, or incorrect kind
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Mon, 09 Sep 2024 10:47:35 +0200
In-Reply-To: <20240906180618.12180-1-tursulin@igalia.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

Hi,

On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> In a recent conversation with Christian there was a thought that
> drm_sched_entity_modify_sched() should start using the entity-
> >rq_lock to be
> safe against job submission and simultaneous priority changes.

There are also FIXMEs in gpu_scheduler.h that might be related.

>=20
> The kerneldoc accompanying that function however is a bit unclear to
> me. For
> instance is amdgpu simply doing it wrongly by not serializing the two
> in the
> driver? Or is the comment referring to some other race condition than
> which is
> of concern in this series?
>=20
> To cut the long story short, first three patches try to fix this race
> in three
> places I *think* can manifest in different ways.
>=20
> Last patch is a trivial optimisation I spotted can be easily done.

I took a look and at least to me it doesn't appear to be that trivial,
mostly because it takes two locks.

Would you mind branching that out as a separate patch so that the
series would 100% address bugs?

P.=09

>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Tvrtko Ursulin (4):
> =C2=A0 drm/sched: Add locking to drm_sched_entity_modify_sched
> =C2=A0 drm/sched: Always wake up correct scheduler in
> =C2=A0=C2=A0=C2=A0 drm_sched_entity_push_job
> =C2=A0 drm/sched: Always increment correct scheduler score
> =C2=A0 drm/sched: Optimise drm_sched_entity_push_job
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 17 ++++++++++++-----
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 21 +++++++++++=
+++-------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A03 files changed, 27 insertions(+), 12 deletions(-)
>=20

