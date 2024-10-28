Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342299B3CC1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 22:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D5C10E385;
	Mon, 28 Oct 2024 21:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EpaWWSuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADDC10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 21:33:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so158220839f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730151203; x=1730756003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFZKIzMwJccmjbRWz8hr4dF1BDbSPdCqeQ+MDKxNuD8=;
 b=EpaWWSuNcTDbDh4mvkpxAk0Vtf3uIL2cvaBDiw2HMhmhw3cxhnKQIeZu/gH7TWNdCS
 B4UEQn6QVuBv5szyocaHdl3dj0PCZWMsl5swN0w4chUycIj3iEeskSu3xmXgwXntEzRI
 PDNB+NuAzvxAk5IExAuWxk3hpjgVj/hNC6WaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730151203; x=1730756003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFZKIzMwJccmjbRWz8hr4dF1BDbSPdCqeQ+MDKxNuD8=;
 b=J8pDRNIY3e3++24padzWgmDTWFsIMxK6fZSeXAPN6bVtZ2OenZpG9owOYoL7rfAD4c
 Ju+CGtsj/hX2ufk7+fNal+6GMx903PqOdDkNag3G55aaMl69nQXEWaaq2Nzec1GzK6sh
 ICLzI5fbHW2Ch3tX+PVPS7I1PDsk7z5p95rqmrex1RhHsIYioH6hMWofIwN6w9Y6ffz4
 GrWQI2UW4gKPtZZiHU/eg8XFuQ2pN1oI49ozDNdgp3oZ7O9vFC8sCVeUAumHnvqvsKkd
 /dY95zX4SPYqvkRCfr4EUr9xAy7dZuYZisRu7lljMZkX3JZoZSrnhEMlA7Sbj0adWwUk
 Cqkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGFK2RfRz/DLNYNx4BT94DFCyGJkz2jITPLOgr2yNqWrcxkpFKe8URLxdqx6zAevw8ntgPxsyru9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwGzaMNNdYNHCkwQ+8Kov7QG8+tYAtBPKwx99B7nyKKOGrqF2B
 LDikdL3EoV6whDg7LuyA19I8drEW1f/oIqXW7IQvXgIftiH0GMKzifQUV/ce5qDrk0EfhOfvdSe
 L9vWw0HnfojzAQiRYorTW+OjabT4az+n28Ksd
X-Google-Smtp-Source: AGHT+IFRf7Qdfzoq2U9A+NIDwOGbIKY7nZWXffb09QD8AJkz3xy2j34ROShaH6Jj6HGBK3DfHA78bcGG4mf4sL65r5o=
X-Received: by 2002:a05:6602:1686:b0:82a:2a67:9429 with SMTP id
 ca18e2360f4ac-83b1c3e7abemr939673139f.5.1730151203568; Mon, 28 Oct 2024
 14:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240827181717.187245-1-robdclark@gmail.com>
 <Zx97PU7cUEVCnpPl@google.com>
In-Reply-To: <Zx97PU7cUEVCnpPl@google.com>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 28 Oct 2024 14:33:12 -0700
Message-ID: <CAJs_Fx6EB=0GMqe4cZVdxptFSV3b63HHybfTOgiYVBudgAafsA@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
To: Mostafa Saleh <smostafa@google.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Joao Martins <joao.m.martins@oracle.com>, Kevin Tian <kevin.tian@intel.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>
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

On Mon, Oct 28, 2024 at 4:53=E2=80=AFAM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> Hi Rob,
>
> On Tue, Aug 27, 2024 at 11:17:08AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> >
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> >
> > v2: Fix an armv7/32b build error in the last patch
> > v3: Incorperate Will Deacon's suggestion to make the interface
> >     callback based.
> > v4: Actually wire up the callback
> > v5: Drop the callback approach
> > v6: Make walk-data struct pgtable specific and rename
> >     io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7: Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> > v8: Pass pte pointer to callback so it can modify the actual pte
> > v9: Fix selftests_running case
> >
> > Rob Clark (4):
> >   iommu/io-pgtable-arm: Make pgtable walker more generic
> >   iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
> >   iommu/io-pgtable-arm: Add way to debug pgtable walk
> >   drm/msm: Extend gpu devcore dumps with pgtbl info
>
> Do you have plans to post another version of this series, as I am
> working on some patches, that would use some of the common page walk
> logic, so it would be more convenient to have them upstream.
> Otherwise, I can have your series as a dependency.

Sorry, this had dropped off my radar, I'll post an updated iteration
in a couple minutes.

BR,
-R

> Thanks,
> Mostafa
>
>
> >
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  10 ++
> >  drivers/gpu/drm/msm/msm_gpu.c           |   9 ++
> >  drivers/gpu/drm/msm/msm_gpu.h           |   8 ++
> >  drivers/gpu/drm/msm/msm_iommu.c         |  22 ++++
> >  drivers/gpu/drm/msm/msm_mmu.h           |   3 +-
> >  drivers/iommu/io-pgtable-arm.c          | 149 +++++++++++++++---------
> >  include/linux/io-pgtable.h              |  15 +++
> >  7 files changed, 160 insertions(+), 56 deletions(-)
> >
> > --
> > 2.46.0
> >
