Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A29AFF85
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 12:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CAA10EA64;
	Fri, 25 Oct 2024 10:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cFBFUF+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA57110EA64
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729850817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLWF1XI1IRMUF9kLoHorE6VU6nobmlHGWPnEZ9LtnxM=;
 b=cFBFUF+h/ydIIkQ9IUjG8Zheuhc5mR9QppSu3Ea0rYIrpIueYboMtQN7/dbdPLYtSDAY3R
 GB2ogrp/WS6TMTuq7DgKtlijyHZSHlfJF1H8SQKmixtOv0zpoPGLaE7hnlgJIa9+BEwLju
 DdqRNXVFcckB3cOQFEQtOBm0TXe0QYc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-ukiaRGidM1CvVG_mCLic8A-1; Fri, 25 Oct 2024 06:06:55 -0400
X-MC-Unique: ukiaRGidM1CvVG_mCLic8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43157cff1d1so13499345e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 03:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729850814; x=1730455614;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zy9d6cD2pxsXmiDYe52XZxncVOlsF2DUWlmfP7V1zlc=;
 b=B3vt/nsterWJHTKRR6DeWVEabmiETzTaRdWjXZEY02IDuDtUhIjWgpjDq878+cyW2q
 ghLI15oPZn23JFnJfHWpVDxe2X8buYk4jEhqzw3EUsbKxt+ziEDy0rqfGB0iNZtMjdmV
 tLBHn0iQBewJavanWZ/0zepHr7SDW1ehKhYv4HxdcRTa3IN4+kqgIiK75hxHVoPbZP0s
 19G1iX9VSDahv7OFoZZmpuC6aImpPVQq0Og8t57j2FFMKpYqsPjulKUhAOR1PS8XAxrT
 oa2XscOb3JquTDQ1ujRHj7N1Wl6gkZr5AZXHUAJVCRxwsxS6+Jug8DKrgZJmI5rR8OPl
 5YOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaW6RfLSAmBSDpXDc7NH7ZLtP9emdfvPtipxwdyAtUIULO59tDdsnkdcUwW6PQIrCHtbTRs8sD7Cw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz/g5Rh1Bld1ST8I9WQDxmr2gVZUGJLhLum8rR1LUUGi9lLyOD
 69nLdnO/ngFS8G8dHgKbX0w4aSOJgNS8iPZ2bWrgBoemgf9XpsVRKb3wPpOasgrTVklZk5o1890
 A42Z98LHGtZ1kHfgXlO1SNrk75RZXy8J81yAVPLsD7P6p7K28VjwmOot0s05UHuStrg==
X-Received: by 2002:a05:600c:1d99:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-4318415f41fmr69264125e9.15.1729850814507; 
 Fri, 25 Oct 2024 03:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2nTQwQklAfpLsEicMD9X70tr5FanBA8x8M5m/2RYtiWItp61RQimiawap8ngTujHhoMExZQ==
X-Received: by 2002:a05:600c:1d99:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-4318415f41fmr69263955e9.15.1729850814153; 
 Fri, 25 Oct 2024 03:06:54 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de.
 [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4317dde7b70sm93585205e9.1.2024.10.25.03.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 03:06:53 -0700 (PDT)
Message-ID: <7da525c6870619301e226e4830e8355d1419a3e1.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, ltuikov89@gmail.com
Date: Fri, 25 Oct 2024 12:06:53 +0200
In-Reply-To: <ZxpsAogpxOjU+58p@DUT025-TGLU.fm.intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
 <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
 <ZxpsAogpxOjU+58p@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-10-24 at 15:47 +0000, Matthew Brost wrote:
> On Thu, Oct 24, 2024 at 05:35:47PM +0200, Philipp Stanner wrote:
> > On Wed, 2024-10-23 at 16:59 -0700, Matthew Brost wrote:
> > > drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in
> > > the
> > > path
> > > of dma-fences, and dma-fences are in the path of reclaim. Mark
> > > scheduler
> > > work queue with WQ_MEM_RECLAIM to ensure forward progress during
> > > reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> > > progress during reclaim.
> > >=20
> > > v2:
> > > =C2=A0- Fixes tags (Philipp)
> > > =C2=A0- Reword commit message (Philipp)
> > >=20
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > Cc: stable@vger.kernel.org
> > > Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for
> > > submit_wq")
> > > Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a
> > > work
> > > queue rather than kthread")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> > > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 540231e6bac6..df0a5abb1400 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1283,10 +1283,11 @@ int drm_sched_init(struct
> > > drm_gpu_scheduler
> > > *sched,
> > > =C2=A0=09=09sched->own_submit_wq =3D false;
> > > =C2=A0=09} else {
> > > =C2=A0#ifdef CONFIG_LOCKDEP
> > > -=09=09sched->submit_wq =3D
> > > alloc_ordered_workqueue_lockdep_map(name, 0,
> > > +=09=09sched->submit_wq =3D
> > > alloc_ordered_workqueue_lockdep_map(name,
> > > +=09=09=09=09=09=09=09=09=C2=A0
> > > =C2=A0=C2=A0=C2=A0
> > > =C2=A0=C2=A0 WQ_MEM_RECLAIM,
> > > =C2=A0=09=09=09=09=09=09=09=09=C2=A0
> > > =C2=A0=C2=A0=C2=A0
> > > =C2=A0=C2=A0 &drm_sched_lockdep_map);
> > > =C2=A0#else
> > > -=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> > > 0);
> > > +=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> > > WQ_MEM_RECLAIM);
> > > =C2=A0#endif
> > > =C2=A0=09=09if (!sched->submit_wq)
> > > =C2=A0=09=09=09return -ENOMEM;
> >=20
> >=20
> > Cool, thx =E2=80=93 looks good from my POV.
> >=20
>=20
> Can I get a RB?

Oh, sure:

Reviewed-by: Philipp Stanner <pstanner@redhat.com>

>=20
> > Since you now sent this patch as a single one, what would be the
> > preferred merge plan for this? Your XE-Series doesn't depend on
> > this
> > IIUC, so should we take this patch here separately into drm-misc-
> > next?
> >=20
>=20
> Merge this one to drm-misc and we will backport into drm-xe-next.

OK =E2=80=93 feel free to apply it yourself if you want, then we wouldn't n=
eed
to synchronize

Philipp

>=20
> Matt
>=20
> >=20
> > Regards,
> > P.
> >=20
>=20

