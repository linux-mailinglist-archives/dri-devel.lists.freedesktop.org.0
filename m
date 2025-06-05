Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710FACF463
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC44010E9CE;
	Thu,  5 Jun 2025 16:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="iJpVZ24Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93D10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:32:22 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e8134dee405so1316654276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749141139;
 x=1749745939; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
 b=iJpVZ24YCP/nDvBparEvvOs+XnRV5RjmfEAuWzBy9SvcXeArXM8TGr57xNKG5/+8K7
 J9dqqPqsLuYibpkcVm8QyVnpa+FRN6WYxTzN+IPaVAiyu5t5NZvSE0RHeoN9WyWbcI+n
 Ab91gFzd8fQ/cmof+vDqFaevtRttVeCbZ/3NcTFRsRXQJVdT0SARVs4vnhNh8qMSEXRO
 GZgAqf2jdiDpkOgX62OrwMmYTisP6+YcI7XVl8cmAcvx9ZHLOFXIZPf7vBuiW69D8zfI
 Y2BiUtTVCoXIwcxK/sAW7WkLSu6nbBF9MgYgKaCSfiI4jnsG64qdqakC/Qybn393/8DH
 oW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749141139; x=1749745939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
 b=hX/jUC3PoSy7HDSqZTBqFGo0m+cu+XUK/NQaI2eFTciatfHFTUv8toDATMpPvsEuqV
 izGEWfnyBJvCb1VZ3CK7p58nO7xoSBtC7SCD10Ui4Gnej+pKazrKT6ZalgvhARoyUY6h
 sOWXg5zehZqmz+gXFC8GTVqstH8etE6zhZiydm9RJuZHZ4qcsP07fK7UU7fGs9fHy2j9
 /2/BGgtw9TATiflNpJ/xi/Dg9coe2qt0ia88GNgIakVtyQQFhcoy6FINb5AhmFp3SvXm
 YyMfdb/uou9ceRghlByVjTYAtYyke+84TyVfwKGN1LS7LI2OwZ/Xus9WwFnVD6d6v2GO
 dkCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVig5ZS5Y6nURzAn4y7zqVzSinkS8TD3Bq+GooBNu294e10Kd6h8ixohMzMoNRPj12hft0+KYzCubI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpiGxXMKZe36MnJS4ECcWtW9Jq+4B4/BMGGCGd81dCwQHDZyXb
 W2gLJGufUUQuHwyeE4JQTYGwKmR2cvPA7pVEjy8QShvm/iTpB8hEkl/WgH/V2bIuNjQIO8lOE4e
 d9yr0z4QFpQ==
X-Gm-Gg: ASbGncv/6rCD615aslZdpx/AZ2txYwBqiAVh8Ko2GFZNV63ZHQO2FSGInVTqa6u+c1M
 n2l635XyaflfUMAmFhjISUkNWGj8ifx0sEBioqU+IuTmjkX5L3CW/w4dD7rGFnl0D7NTq1nyyu/
 LjvOuWn/3AncS7/L/ouB1pYamzXF0J/5l7M16yMjRI8dQsjRrColCadaT6UGF9D4RrH3wsqYfX2
 fwe1e/NttXp4HCZJ6pK+cucbqDrSoUoHT5kSHGqT0zcnG4qr3a0nYMZhQ7aJIyw5zu6K/v/swpj
 BuOLQf5SrFfc+OYQcxPmddgwsFhaqxdMugaMOa541AMbupjPDsOfZxvCUTuYzx571sxB79UhSx+
 yeBRpIeSf1T4XczdtqPc=
X-Google-Smtp-Source: AGHT+IEWlEv7GZb8Dar2Y1amr8eU2AxRsYSToZ5bAAEbxpNnb4AYRplqoSZli0Enf6s5YpUOpj13HQ==
X-Received: by 2002:a05:6902:1603:b0:e81:891e:9636 with SMTP id
 3f1490d57ef6-e81a20f7645mr588845276.18.1749141139136; 
 Thu, 05 Jun 2025 09:32:19 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7f734ff139sm3753449276.44.2025.06.05.09.32.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 09:32:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e8134dee405so1316601276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 09:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFLfk+Iz1hdRG04MJ3SsxUEHU7y0FrYFHz1JnzaRTPxkmH03q+HB1QUZx4vZ7AgeDXvpjPP8IcJuk=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2d05:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e81a21fbac2mr580525276.44.1749141137124; Thu, 05 Jun 2025
 09:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
In-Reply-To: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 18:32:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
X-Gm-Features: AX0GCFsWffXR5BsCRkmesm8xllL45jWGaGp3TKLEXqW1VbkssrelSRfCs4YLano
Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
> [...]
> >> In fact this is precisely the usage model I would suggest for this sor=
t
> >> of thing, and IIRC I had a similar conversation with the Ethos driver
> >> folks a few years back. Running your own IOMMU domain is no biggie, se=
e
> >> several other DRM drivers (including rockchip). As long as you have a
> >> separate struct device per NPU core then indeed it should be perfectly
> >> straightforward to maintain distinct IOMMU domains per job, and
> >> attach/detach them as part of scheduling the jobs on and off the cores=
.
> >> Looks like rockchip-iommu supports cross-instance attach, so if
> >> necessary you should already be OK to have multiple cores working on t=
he
> >> same job at once, without needing extra work at the IOMMU end.
> >
> > Ok, so if I understood it correctly, the plan would be for each DRM
> > client to have one IOMMU domain per each core (each core has its own
> > IOMMU), and map all its buffers in all these domains.
> >
> > Then when a job is about to be scheduled on a given core, make sure
> > that the IOMMU for that core uses the domain for the client that
> > submitted the job.
> >
> > Did I get that right?
>
> It should only need a single IOMMU domain per DRM client, so no faffing
> about replicating mappings. iommu_paging_domain_alloc() does need *an*
> appropriate target device so it can identify the right IOMMU driver, but
> that in itself doesn't preclude attaching other devices to the resulting
> domain as well as (or even instead of) the nominal one. In general, not
> all IOMMU drivers support cross-instance attach so it may fail with
> -EINVAL, and *that*'s when you might need to fall back to allocating
> multiple per-instance domains - but as I say since this is a
> Rockchip-specific driver where the IOMMU *is* intended to support this
> already, you don't need to bother.

Ok, I did just that and it's working great in my testing:

I create a domain when the client opens the DRM connection and map all
its BOs to it. Then when a job is about to start, I detach whatever
domain was attached to the core's group and attach that client's
domain.

Will send a v7 with it in a couple of days.

Thanks!

Tomeu
