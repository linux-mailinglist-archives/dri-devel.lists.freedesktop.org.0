Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C9AAF4A8
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 09:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988E610E8CD;
	Thu,  8 May 2025 07:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GkNHnhZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9A810E8CD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 07:28:29 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZtNyy4NRGz9vGF;
 Thu,  8 May 2025 09:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746689306; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th42e0V2ht7wWzlls9LEqZEPNIgI3073avmm+6Mo5To=;
 b=GkNHnhZkTpQWAu4nZCGnLEHyFXjdv4dC5nh56Z0JuU5Kcr3GWddvEdZwVuyvPJY4R6lRPb
 S4EteOvVlGHh2tTblp3YquBDjpNRmOB/7bZ6ixZFS2bzpWrywGsdvK4QdEfVQXpjeGVOt0
 PCyOZAHXuZwBTw/rrJ73I+bfopLQGcX9Y1su9A/Ir548eADIugi/IcU2qc4oHMBFPzAD+L
 nYXshW6NupKONiEc8qwUR/UZ0m+lmA1B2qAH2i/g7wf/eXUQgkqLUYjI1ZmxuzcAjWUdO/
 F5ztDDwK0jdqj5rJAvJOr1qHDVVgXGLb8rDp9VwpFDMFTc2EN6/nwghs+6vLZA==
Message-ID: <edacd01c1a2a78e72b869c2dbc32bd5932cb95c9.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
From: Philipp Stanner <phasta@mailbox.org>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Date: Thu, 08 May 2025 09:28:22 +0200
In-Reply-To: <BL1PR12MB575348104DD79E9FE8FE7D629388A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417102430.2828552-1-sunil.khatri@amd.com>
 <BL1PR12MB57534AEE3F7D3352F68B2A4493802@BL1PR12MB5753.namprd12.prod.outlook.com>
 <32cf322c-b23f-4127-b1f7-5cbe8894a007@amd.com>
 <BL1PR12MB575348104DD79E9FE8FE7D629388A@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: s6sjh55zwd1765ahg4ettkzie85wbnei
X-MBO-RS-ID: 24c5c4ae1baea70d628
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-05-07 at 06:27 +0000, Khatri, Sunil wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
> Ping ?

Hello,

sry, I was out for a few days.

>=20
> Not picked yet while patches raised before this are merged.
>=20
> Regards
> Sunil Khatri
>=20
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, April 29, 2025 12:49 PM
> To: Khatri, Sunil <Sunil.Khatri@amd.com>;
> dri-devel@lists.freedesktop.org; Danilo Krummrich <dakr@kernel.org>;
> Philipp Stanner <phasta@kernel.org>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Tvrtko Ursulin
> <tvrtko.ursulin@igalia.com>; Pelloux-Prayer, Pierre-Eric
> <Pierre-eric.Pelloux-prayer@amd.com>
> Subject: Re: [PATCH v2] drm/sched: fix the warning in
> drm_sched_job_done

Call it "docu warning" please

>=20
> Adding Danilo and Philipp.
>=20
> Christian.
>=20
> On 4/29/25 08:36, Khatri, Sunil wrote:
> > [AMD Official Use Only - AMD Internal Distribution Only]
> >=20
> > Ping ?
> >=20
> > -----Original Message-----
> > From: Sunil Khatri <sunil.khatri@amd.com>
> > Sent: Thursday, April 17, 2025 3:55 PM
> > To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
> > Christian <Christian.Koenig@amd.com>; Tvrtko Ursulin
> > <tvrtko.ursulin@igalia.com>; Pelloux-Prayer, Pierre-Eric
> > <Pierre-eric.Pelloux-prayer@amd.com>; Khatri, Sunil
> > <Sunil.Khatri@amd.com>
> > Subject: [PATCH v2] drm/sched: fix the warning in
> > drm_sched_job_done
> >=20
> > Fix the below warning.
> > scheduler/sched_main.c:397: warning: Function parameter or struct
> > member 'result' not described in 'drm_sched_job_done'
> >=20
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index bfea608a7106..5cd29e92b133 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0/**
> > =C2=A0 * drm_sched_job_done - complete a job
> > =C2=A0 * @s_job: pointer to the job which is done
> > + * @result: error code for dma fence for scheduler

s/dma fence/dma_fence


Besides, all good of course. Thank you.

P.

> > =C2=A0 *
> > =C2=A0 * Finish the job's fence and wake up the worker thread.
> > =C2=A0 */
> > --
> > 2.34.1
> >=20
>=20

