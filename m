Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059C9F490C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89B10E2E8;
	Tue, 17 Dec 2024 10:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EVR9qSIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BC410E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734431976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMoi6hrzlbzWnwnDcGni50osmHnkK+9+1ai8xMdGgxg=;
 b=EVR9qSIRCm5qDOie1DILCcsgtaqqBG2NFNimFb35mOMLXbncjKFcknwIWWzPoebrADmBGT
 TZ5+jnIlbyg1yPge71lrZdBbM+IVzbyYgON5W7KtbTEet9gLcWXyse2ubroi6d2Ho6RTO+
 nw/9ufIaGpn4EonGldHLyb64vPKMHEk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-7RXdR3sYMeywb8TWLSvxCA-1; Tue, 17 Dec 2024 05:39:34 -0500
X-MC-Unique: 7RXdR3sYMeywb8TWLSvxCA-1
X-Mimecast-MFC-AGG-ID: 7RXdR3sYMeywb8TWLSvxCA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385e1fd40acso2972661f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734431973; x=1735036773;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EAhqXekStZLW/RVUK6Cn2kQz4T1FsFdb2Ctzh50D66Q=;
 b=lXUR7q9PZTgkWpFxQfls/aADFYbHsNUoTVTiplZvIHd1uz86MkA94Y8SPKE1u3cbVi
 d6ZWyaD5bgmVG/D+Go3HuikSO9VITzs3s+slRj4Ww/JEq999KZIgb6ZceSUGne4LUtgA
 Ic/oJGHilRdLjeeSb9vLSMrBui/TkZ3GBe69EadwL+liAhJRXkzsLGGc5mnjzACItOtL
 DpZ33rf4xBuv+JTO8LszyNRHkYGkGhiBQf1MxJ2CPNsmwc5/2dbT2vooL9AYAF2F6CqG
 w4DnUfsr7r18ls0MWz6tGgFiintQdbE3rtwUPdj15CNWc1bGWceAMoMnL71oyTw9HbzW
 o8uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4XLYf+jVrHrAilSP2K8dMH2z23tPDPDOO7GcClLIzttM2vKtKDaRcFDnBWcVH7Zx4Hskzp7C+tB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUfoj0Pz/g1O1RxMFrIMEVzjUNTkwrkFxnPyRp/iUn6wKp3U67
 blYfqtN4fFAkHcjw7pqo1eJxvAfBbFFyazdItbanZRWJTOuurxnYdheHGaptM3DMXRRnKIA1X3A
 08vE2E5eFbqZvKz+Vrg0sKdE1e4VAz53O63Hli5aRM0lBc/MtuYlZJDeuBc3cMmUe+g==
X-Gm-Gg: ASbGnctGR6e6DCh+3UHx0v0Q/OgdmPMXAVyVB0jOBzkewfbTPhZRs0uWtyg2MmIBtDy
 zWiW3enyVidvwrX0roBuurqieUMMZ0QhJJVhSHYeZR1eunL31JWtH5vBnOcETrr9uGcoewsOpzK
 hp3bDJVRgt8ybZvYqal8UEdomZr9nk32Ngf8FtujAk0IEUnL8iUQW6LW2FvKqt+FkQ+I0jq0PN8
 NaO63XJDptJfUo1N7NOY3F8lFUYmbgijk42aEvAM+SKtfk/G9HPUcbGq8uvHWzfZGSIBl52cmN2
 Ane9gH8=
X-Received: by 2002:a05:6000:4716:b0:386:3a8e:64c1 with SMTP id
 ffacd0b85a97d-38880acda3emr11768494f8f.19.1734431973559; 
 Tue, 17 Dec 2024 02:39:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDWpTSANouY9f/p66qX2YasuCynxUZ2pre4ezk5mGcNOMj159D3nD9EXVG1Ms9mE2tLc1YmA==
X-Received: by 2002:a05:6000:4716:b0:386:3a8e:64c1 with SMTP id
 ffacd0b85a97d-38880acda3emr11768471f8f.19.1734431973180; 
 Tue, 17 Dec 2024 02:39:33 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046f8bsm10670302f8f.68.2024.12.17.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:39:32 -0800 (PST)
Message-ID: <637b5d0b19ce90d6b94c937be8055977c62bd158.camel@redhat.com>
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Date: Tue, 17 Dec 2024 11:39:31 +0100
In-Reply-To: <20241113134838.52608-1-tursulin@igalia.com>
References: <20241113134838.52608-1-tursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fv-9lWrC5cQVnJPWvllQeL49L5Ven6odSxFr6cyVEuE_1734431974
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

[+cc Krzysztof, who I think witnessed a possibly related Kernel crash
in the wild]

P.

On Wed, 2024-11-13 at 13:48 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> As commit 746ae46c1113 ("drm/sched: Mark scheduler work queues with
> WQ_MEM_RECLAIM")
> points out, ever since
> a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue
> rather than kthread"),
> any workqueue flushing done from the job submission path must only
> involve memory reclaim safe workqueues to be safe against reclaim
> deadlocks.
>=20
> This is also pointed out by workqueue sanity checks:
>=20
> =C2=A0[ ] workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work
> [gpu_sched] is flushing !WQ_MEM_RECLAIM
> events:amdgpu_device_delay_enable_gfx_off [amdgpu]
> ...
> =C2=A0[ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> ...
> =C2=A0[ ] Call Trace:
> =C2=A0[ ]=C2=A0 <TASK>
> ...
> =C2=A0[ ]=C2=A0 ? check_flush_dependency+0xf5/0x110
> ...
> =C2=A0[ ]=C2=A0 cancel_delayed_work_sync+0x6e/0x80
> =C2=A0[ ]=C2=A0 amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
> =C2=A0[ ]=C2=A0 amdgpu_ring_alloc+0x40/0x50 [amdgpu]
> =C2=A0[ ]=C2=A0 amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
> =C2=A0[ ]=C2=A0 ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
> =C2=A0[ ]=C2=A0 amdgpu_job_run+0xaa/0x1f0 [amdgpu]
> =C2=A0[ ]=C2=A0 drm_sched_run_job_work+0x257/0x430 [gpu_sched]
> =C2=A0[ ]=C2=A0 process_one_work+0x217/0x720
> ...
> =C2=A0[ ]=C2=A0 </TASK>
>=20
> Fix this by creating a memory reclaim safe driver workqueue and make
> the
> submission path use it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: 746ae46c1113 ("drm/sched: Mark scheduler work queues with
> WQ_MEM_RECLAIM")
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work
> queue rather than kthread")
> Cc: stable@vger.kernel.org
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 ++
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25
> +++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |=C2=A0 5 +++--
> =C2=A03 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 7645e498faa4..a6aad687537e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
> =C2=A0
> =C2=A0extern int amdgpu_wbrf;
> =C2=A0
> +extern struct workqueue_struct *amdgpu_reclaim_wq;
> +
> =C2=A0#define AMDGPU_VM_MAX_NUM_CTX=09=09=094096
> =C2=A0#define AMDGPU_SG_THRESHOLD=09=09=09(256*1024*1024)
> =C2=A0#define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS=09=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 3000
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 38686203bea6..f5b7172e8042 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer
> amdgpu_watchdog_timer =3D {
> =C2=A0=09.period =3D 0x0, /* default to 0x0 (timeout disable) */
> =C2=A0};
> =C2=A0
> +struct workqueue_struct *amdgpu_reclaim_wq;
> +
> =C2=A0/**
> =C2=A0 * DOC: vramlimit (int)
> =C2=A0 * Restrict the total amount of VRAM in MiB for testing.=C2=A0 The
> default is 0 (Use full VRAM).
> @@ -2971,6 +2973,21 @@ static struct pci_driver amdgpu_kms_pci_driver
> =3D {
> =C2=A0=09.dev_groups =3D amdgpu_sysfs_groups,
> =C2=A0};
> =C2=A0
> +static int amdgpu_wq_init(void)
> +{
> +=09amdgpu_reclaim_wq =3D
> +=09=09alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM,
> 0);
> +=09if (!amdgpu_reclaim_wq)
> +=09=09return -ENOMEM;
> +
> +=09return 0;
> +}
> +
> +static void amdgpu_wq_fini(void)
> +{
> +=09destroy_workqueue(amdgpu_reclaim_wq);
> +}
> +
> =C2=A0static int __init amdgpu_init(void)
> =C2=A0{
> =C2=A0=09int r;
> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
> =C2=A0=09if (drm_firmware_drivers_only())
> =C2=A0=09=09return -EINVAL;
> =C2=A0
> +=09r =3D amdgpu_wq_init();
> +=09if (r)
> +=09=09goto error_wq;
> +
> =C2=A0=09r =3D amdgpu_sync_init();
> =C2=A0=09if (r)
> =C2=A0=09=09goto error_sync;
> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
> =C2=A0=09amdgpu_sync_fini();
> =C2=A0
> =C2=A0error_sync:
> +=09amdgpu_wq_fini();
> +
> +error_wq:
> =C2=A0=09return r;
> =C2=A0}
> =C2=A0
> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
> =C2=A0=09amdgpu_acpi_release();
> =C2=A0=09amdgpu_sync_fini();
> =C2=A0=09amdgpu_fence_slab_fini();
> +=09amdgpu_wq_fini();
> =C2=A0=09mmu_notifier_synchronize();
> =C2=A0=09amdgpu_xcp_drv_release();
> =C2=A0}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 2f3f09dfb1fd..f8fd71d9382f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device
> *adev, bool enable)
> =C2=A0=09=09=09=09=09=09AMD_IP_BLOCK_TYPE_GF
> X, true))
> =C2=A0=09=09=09=09=09adev->gfx.gfx_off_state =3D
> true;
> =C2=A0=09=09=09} else {
> -=09=09=09=09schedule_delayed_work(&adev-
> >gfx.gfx_off_delay_work,
> -=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 delay);
> +=09=09=09=09queue_delayed_work(amdgpu_reclaim_wq
> ,
> +=09=09=09=09=09=09=C2=A0=C2=A0 &adev-
> >gfx.gfx_off_delay_work,
> +=09=09=09=09=09=09=C2=A0=C2=A0 delay);
> =C2=A0=09=09=09}
> =C2=A0=09=09}
> =C2=A0=09} else {

