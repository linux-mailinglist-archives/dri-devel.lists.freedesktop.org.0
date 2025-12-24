Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A9CDC947
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B28510F998;
	Wed, 24 Dec 2025 14:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Nz7gFCXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959FA10F995
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:51:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59911cb8c3cso6548782e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587885; x=1767192685; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxr2cZdW7U6KS8mkdkGaBkN400rH3Ne5CoZQlpRK7uU=;
 b=Nz7gFCXfBIYXBx1+AStvAtxSPQ6UlZbD8JgexbW9kzpxvSl3HphVKYqf5zcroTSmNP
 kVpS/zCzZH+1gydqVp8eNpxltwjdhDl3LOgpuJObXlGqQrPX6zl+NAp7OirpnrR6MBzG
 T0jQyehDqw/7wmfPrdPvqeiqsmGP48ALzgRI14SIrW7HuSRWO+O6ByD0rRwpxEtQwSDH
 61QVYGJkt6ZoxHelaDhQwWk/XPddZh7yKdix5HLkVxmx3kE1TKBCH9wz+5DLhk/QIWvU
 6vzZGIuMLl2vO1VDQIrYucdp1tt+jQyFs72VT6dMoOtx9qwXEa5CzujJ/mFzv6VYFQDc
 G3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587885; x=1767192685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kxr2cZdW7U6KS8mkdkGaBkN400rH3Ne5CoZQlpRK7uU=;
 b=qSgXzMD1IEqqJ8qYBB+cAs1ee9EGi5+7ZFWUNCsR5mRe6QYOBV2EJRVv5SbbFKlEls
 Fdx4AZk+kJFv51od0+JTo99o8LX46qrVrWN7JObdoCDs4k4hovcF33nSVevm9ukkKk/d
 EukDT8NyKvfIbbeBDAkoeZaEQskLctKTqMmd0TdOyacd4sBKZ1gLnnin0XKCsvrFZVAx
 a+BaSLf/MRyPS0BmQtx1muubM/2Wn4AOspgwk5elMSqQJV5PbB8cud1tFUx1i2GBEvr5
 YTWVGuIztW1H4hxaQc29ROFOUEtrdbw4FHycS96qqIYXzvvzCvIwrR3RE/vuMWkq+idE
 sSvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuUR1O4GexoG7CF0uvT8EPTpjtdL6uCUfnnqduBlXyZ3jnxcrpHunaDYp9TTB1a8+/oYYP12JWgMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv66txerVATezCQu0plIIhlxDu+2/+2/KimBuSeoWS8hha+dGz
 Gz70U7nMLqgSN1GmJ8ZZcIhkuHd1RMHz71gCqZhp0N3WrHap5ihNXItaBcf2kReL6uRyeuP4SfH
 1PatpUDCh0cTOW6JPzTSnQSNShQdfa3lMlDzo2UfiAg==
X-Gm-Gg: AY/fxX7raa4NayL5bQ77iU6Rb4p7nJ3nRjiSUxN6+OHZwqfWb67u65pdEH1V04Fqyvj
 15W/+keTehSSwYsqRknBrBN0G28ookde/DTU3dSy11WcWpJKGPFSi1eu6Yg3JaIhk1uv/p/j8Eq
 KcQ27VW07PbPBvqVTCh0X7Cl7N95BzJpjZrX/P0C4bNJ0HDfWuY2+0GuXOFECUV0AWoRK34pGwt
 HvOgtoRGXcoDkfGycNmgt2Lh359EHKw1VbaX+voDt1OHz/91WPv20nYO48/h13Ob5XqzkGNOVq/
 j3TjMZKdKBbqlSn7hGjdEMhzNn78
X-Google-Smtp-Source: AGHT+IEl/QNlZZaMQEAf3YxHXh3Y+CyJmitXojmaV+VL+Ta+NTbUIhDyFmwEx5+MdpJRq6BFVQ+NW1T93QqqIhCPZw8=
X-Received: by 2002:a05:6512:3ba2:b0:598:f262:165e with SMTP id
 2adb3069b0e04-59a17d5d8d3mr5174044e87.36.1766587884814; Wed, 24 Dec 2025
 06:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20251103170604.310895-1-marco.crivellari@suse.com>
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:51:13 +0100
X-Gm-Features: AQt7F2pVF-NnAJRiRtNG-cXmNGhirOhYoFnruFanKmretqN0UW3n8ltwjDlGj7A
Message-ID: <CAAofZF7nsTNxHcCxRTkEBQh5FChmpA05720DuNpuhdfM_ENYpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Mon, Nov 3, 2025 at 6:06=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/xe: replace use of system_unbound_wq with system_dfl_wq
>   drm/xe: add WQ_PERCPU to alloc_workqueue users
>
>  drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
>  drivers/gpu/drm/xe/xe_device.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
>  drivers/gpu/drm/xe/xe_oa.c              | 2 +-
>  drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
>  9 files changed, 13 insertions(+), 12 deletions(-)
>

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
