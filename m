Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20441A18D8E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E3310E199;
	Wed, 22 Jan 2025 08:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FP2zlS8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BD810E199
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737534219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVGSHSfPlnas+VY5S2g7YHsLUR35+wqex29yMzLsqw0=;
 b=FP2zlS8Zi2T2pERHFuecwCHhJPZq7u96sUCaLgryC/RllO8MEyb/KRhq/Ac5tqhStQnEHF
 sYi/42az9uwPdaLEQC+MCeNpNtuz5o3kLdIFZyScylqVymvhhjPMC9xleqnbzsTaElHf2c
 uMryhuRcXCHAn83MCiCRfJYj124pwyA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-EuniYPYqNjWfCfN5XlAFGg-1; Wed, 22 Jan 2025 03:23:38 -0500
X-MC-Unique: EuniYPYqNjWfCfN5XlAFGg-1
X-Mimecast-MFC-AGG-ID: EuniYPYqNjWfCfN5XlAFGg
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ef7fbd99a6so12291152a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 00:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737534217; x=1738139017;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PVGSHSfPlnas+VY5S2g7YHsLUR35+wqex29yMzLsqw0=;
 b=bl9kghQ1Z5JGdj56xrMzjskupS2eLgY5Kvk0Ugg5YY8qtiKRiMdGhFUv1Ckt61ifKb
 Mh1m8pPclB9YuHtLTp7AjI0jincnzl5jMkdyZmCHedkPJMKn4Yx060qib13ea2ik8P/Q
 Qg7uZd2EEFKIxkvpnoRzsWoROb2pX4tIApwha2ornPGBSQa371MtP24hP4+Cdy3mxleH
 VURzz5g3WG4xGUepCYN6R6EW+Ia/0wVxnWxSGQDg0IrBgJHcIFNHlbt+Gny+/UTbd4HL
 nDCvkT1uQJaK/y73PmXCibzknXUXGZ/YAaLjT114VwJcWQrUYwys4DPSySSK1F8fLwH0
 /uGg==
X-Gm-Message-State: AOJu0YybNKfyEccI6LbuM6IuyE8TubpNOWLRu64jJSO5uN4JxqzrdRp+
 S+M18UhAj3J8pO3QyS+j47qh2j8BgiZ0b90cODgff7Tz/hv/uWCgY3rTuat1pkn1N8zMhlY8K6R
 30DKTqBD0tz02bGcZMciT5o5qydk4qYJjmljzxBI4iwOxnInJFVzUtYTGMAEifKngYw==
X-Gm-Gg: ASbGncuCgDUwSD3PmGBDVMGzLDNCeV0y/XaeDjYFCSuVmMiBkOLUfOtisTHJGcKoY0m
 IQQGAfve4m+l+dFgUXq0AVtyNl3RetZuOIM7BdhM93bdt0iDvQEoi9lpgsCpGinDF7S8nXKHJuU
 cjoMjZhzIIzF2VguhMPd03XXSgPAWTJX3IAe2qCKa7d2LCGJdDf96jizVduQFX5hPCxEKBmHxvW
 2Fy+A+rhZX4KPG0MPLy+B+jXhk8QtksrQ6Z5y7/xXcphtxrzWlq3gKyIuqoozsWE2jTd0GlYlW1
 TIDhykuwQOanNanAgnGq
X-Received: by 2002:a05:6a00:1813:b0:729:cc5:fa42 with SMTP id
 d2e1a72fcca58-72dafbaa1c1mr31265260b3a.20.1737534216905; 
 Wed, 22 Jan 2025 00:23:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtQffHib0TFRrC5PxTtGere1N52BNH4TNwO/Y7PEoMr4v6BhKhGRaCupmrztVvUK6BJxfN7g==
X-Received: by 2002:a05:6a00:1813:b0:729:cc5:fa42 with SMTP id
 d2e1a72fcca58-72dafbaa1c1mr31265233b3a.20.1737534216564; 
 Wed, 22 Jan 2025 00:23:36 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dabaa8948sm10413476b3a.164.2025.01.22.00.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 00:23:36 -0800 (PST)
Message-ID: <9329836ce71a24360abc568498dc7e4ea059cd87.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/sched: Documentation and refcount improvements
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 22 Jan 2025 09:23:23 +0100
In-Reply-To: <20250121151544.44949-2-phasta@kernel.org>
References: <20250121151544.44949-2-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qzceDvGJfD2WqcNXNRJ-TLA0N1MoCuB6FWasY3HjKQc_1737534217
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

On Tue, 2025-01-21 at 16:15 +0100, Philipp Stanner wrote:
> Changes in v2:
> =C2=A0 - Document what run_job() is allowed to return. (Tvrtko)
> =C2=A0 - Delete confusing comment about putting the fence. (Danilo)
> =C2=A0 - Apply Danilo's RB to patch 1.
> =C2=A0 - Delete info about job recovery for entities in patch 3. (Danilo,
> me)
> =C2=A0 - Set the term "ring" as fix term for both HW rings and FW rings. =
A
> =C2=A0=C2=A0=C2=A0 ring shall always be the thingy on the CPU ;) (Danilo)

s/CPU/GPU

obviously.

P.


> =C2=A0 - Many (all) other comments improvements in patch 3. (Danilo)
>=20
> This is as series succeeding my previous patch [1].
>=20
> I recognized that we are still referring to a non-existing function
> and
> a deprecated one in the callback docu. We should probably also point
> out
> the important distinction between hardware and firmware schedulers
> more
> cleanly.
>=20
> Please give me feedback, especially on the RFC comments in patch3.
>=20
> (This series still fires docu-build-warnings. I want to gather
> feedback
> on the opion questions first and will solve them in v2.)
>=20
> Thank you,
> Philipp
>=20
> [1]
> https://lore.kernel.org/all/20241220124515.93169-2-phasta@kernel.org/
>=20
> Philipp Stanner (3):
> =C2=A0 drm/sched: Document run_job() refcount hazard
> =C2=A0 drm/sched: Adjust outdated docu for run_job()
> =C2=A0 drm/sched: Update timedout_job()'s documentation
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c |=C2=A0=C2=A0 5 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 106 ++++++++++++++++-------
> --
> =C2=A02 files changed, 71 insertions(+), 40 deletions(-)
>=20

