Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A8CB1405
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 22:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106810E219;
	Tue,  9 Dec 2025 21:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aX5pnGfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D944310E214
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 21:57:09 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7ae1c96ece1so471552b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 13:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765317429; x=1765922229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rX+wN9QFogObW9mM6K67XIhoFb2N+khXMzC674vCr8Y=;
 b=aX5pnGfeY9b/mjCvAqVFj8JgKuPcAeb/mo3Au3LeUyyRbBmkJs9ynGnQft6IVSnZQs
 zIwh5vzyiZRtnh6UldlQJny06gIt4vv155XsGvt4SbynAQ/p9yARw5DIb9/HwH9xk75b
 igvWiR0rUM+dGUupPiG9TAJN3jweMjC/Ym5N/rFGEZyjbCjzFZZGlfnXmFjHTaVay39B
 1VGcqcVrFIxaaG1IJveVO2gK4lT0CTDwPivK5hBWK85zwVITeFfbJJYbnOHoGsLfcI7c
 L5LwrBRYAwxQAqmtH1+iFetaLjUEd2uMUZOyhqgOQuT6tcCCfZMzQEyBXz9o6b46QlIM
 PeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765317429; x=1765922229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rX+wN9QFogObW9mM6K67XIhoFb2N+khXMzC674vCr8Y=;
 b=TOIOuW8JCTcxpfE8rmH3f5Na9LhLUj40EEYWAJCMOryH6/UcZCi5+CmBHTcZLszRae
 0EahlaSpXL36JW/m6Ti5CV8oP68KAuwrw0dtsChKq8LXQheylBsxWhrbLzZCjHJutDWN
 BYbHeMK0zaScs76IhxmXUPxTIKJ8gANYkq2zZj+XhqOhpSYibELXt/s85IRtKJhCxBrZ
 eLCWDw3LiBnG3qDFl8mqcBUn4Wlg6rv/Q9jrzka9e+6KgI9NYHc8J9skxqKj0UdUfNR0
 M1d8IfXsMm0Tg6kWqm4MV46Kw7DXmuQXUD5VIBdWLmwBy/hX1oCBpMASdBsyjeOV8/oB
 j2mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdo6ayLjWXqUAL7jPwTqF30VVPCZdDV3GDoKFgwjNGoJVBqHqTodLOD6xDDxbE6BeAnPWPs9hI7kg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+pTXXuVwkEaLJ5/AcWaLvVvO2VdnB9yN1P/18Xgq3vCSs+9iV
 d777s5juW4T2USqbe8oBRhLC2V+x+SWPv47XsVVs1D/SqOKWjlt4LshN7wrfj57s2nBQ40Vo5rl
 hGjXJg7CCDKJNy/XQdcZh1QUZuVHnPzs=
X-Gm-Gg: ASbGncsqxnVIduYm6xjOVs3jBo0bqVrpxIpXzg7mWPR+EU4OntKB2uOsE9GdB8UW8rp
 FFCa4JeNhvzGd4/6apfzxlfL1jT/8l4mSDxQjY2rHlVNWzOkLfa67f3uI6i3zlkoriwT9fjbKdo
 eYucXoC1rdcQOE9Gw1ysa9Kvg+X/YCkj1N+2ZQZgSUmlAO62zAq/pSUWL+l2h44okEruOV/gz6t
 ObFmRtyP5NBjlP2x8KNgI5Iy2gwHDTWivAaxpD+YjJea7q0kJ/yIfBjP8xN7+nw5Y0zpL309v1j
 YCAUNQ==
X-Google-Smtp-Source: AGHT+IHII9D83D9B/BqGeUZIF7jvP+2QEGFlvAirMNzmIalQpo7195q7ToyoRQ9oqeI7d3G2KScatkwc1poRwQSSwLo=
X-Received: by 2002:a05:7022:2384:b0:11a:5cb2:24a0 with SMTP id
 a92af1059eb24-11f2966a707mr68575c88.1.1765317428882; Tue, 09 Dec 2025
 13:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20251205083934.3602030-6-riana.tauro@intel.com>
In-Reply-To: <20251205083934.3602030-6-riana.tauro@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Dec 2025 16:56:57 -0500
X-Gm-Features: AQt7F2oV5qVpxXbneq_-0cZzGn0SnKZPKQknZi65mhBUpzRoQqkHTme441oL53A
Message-ID: <CADnq5_NJgcnJaZhzF14O+sQkV6nWEx94aO59EfMdf5X=oYTydA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introduce DRM_RAS using generic netlink for RAS
To: Riana Tauro <riana.tauro@intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de, 
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com, 
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com, 
 shubham.kumar@intel.com
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

+ Hawking, Lijo to help review.

On Fri, Dec 5, 2025 at 3:19=E2=80=AFAM Riana Tauro <riana.tauro@intel.com> =
wrote:
>
> This work is a continuation of the great work started by Aravind ([1] and=
 [2])
> in order to fulfill the RAS requirements and proposal as previously discu=
ssed
> and agreed in the Linux Plumbers accelerator's bof of 2022 [3].
>
> [1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.i=
ddamsetty@linux.intel.com/
> [2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@lin=
ux.intel.com/
> [3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summa=
ry.html
>
> During the past review round, Lukas pointed out that netlink had evolved
> in parallel during these years and that now, any new usage of netlink fam=
ilies
> would require the usage of the YAML description and scripts.
>
> With this new requirement in place, the family name is hardcoded in the y=
aml file,
> so we are forced to have a single family name for the entire drm, and the=
n we now
> we are forced to have a registration.
>
> So, while doing the registration, we now created the concept of drm-ras-n=
ode.
> For now the only node type supported is the agreed error-counter. But tha=
t could
> be expanded for other cases like telemetry, requested by Zack for the qua=
lcomm accel
> driver.
>
> In this first version, only querying counter is supported. But also this =
is expandable
> to future introduction of multicast notification and also clearing the co=
unters.
>
> This design with multiple nodes per device is already flexible enough for=
 driver
> to decide if it wants to handle error per device, or per IP block, or per=
 error
> category. I believe this fully attend to the requested AMD feedback in th=
e earlier
> reviews.
>
> So, my proposal is to start simple with this case as is, and then iterate=
 over
> with the drm-ras in tree so we evolve together according to various drive=
r's RAS
> needs.
>
> I have provided a documentation and the first Xe implementation of the co=
unter
> as reference.
>
> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool tha=
t entirely
> exercises this new API, hence I hope this can be the reference code for t=
he uAPI
> usage, while we continue with the plan of introducing IGT tests and tools=
 for this
> and adjusting the internal vendor tools to open with open source developm=
ents and
> changing them to support these flows.
>
> Example:
>
> $ sudo ynl --family drm_ras  --dump list-nodes
> [{'device-name': '0000:03:00.0',
>   'node-id': 0,
>   'node-name': 'correctable-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 1,
>   'node-name': 'nonfatal-errors',
>   'node-type': 'error-counter'},
>  {'device-name': '0000:03:00.0',
>   'node-id': 2,
>   'node-name': 'fatal-errors',
>   'node-type': 'error-counter'}]
>
> $ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id"=
:1}'
> [{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]
>
> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":=
1, "error-id":1}'
> {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
>
> IGT : https://patchwork.freedesktop.org/patch/689729/?series=3D157409&rev=
=3D3
>
> Rev2: Fix review comments
>       Add support for GT and SOC errors
>
> Rev3: Add uAPI for errors and nodes
>       Update documentation
>
>
> Riana Tauro (3):
>   drm/xe/xe_drm_ras: Add support for drm ras
>   drm/xe/xe_hw_error: Add support for GT hardware errors
>   drm/xe/xe_hw_error: Add support for PVC SOC errors
>
> Rodrigo Vivi (1):
>   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
>
>  Documentation/gpu/drm-ras.rst              | 109 +++++
>  Documentation/gpu/index.rst                |   1 +
>  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++
>  drivers/gpu/drm/Kconfig                    |   9 +
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_drv.c                  |   6 +
>  drivers/gpu/drm/drm_ras.c                  | 351 ++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c      |  42 ++
>  drivers/gpu/drm/drm_ras_nl.c               |  54 +++
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  68 ++++
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_drm_ras.c            | 199 +++++++++
>  drivers/gpu/drm/xe/xe_drm_ras.h            |  12 +
>  drivers/gpu/drm/xe/xe_drm_ras_types.h      |  40 ++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 444 +++++++++++++++++++--
>  include/drm/drm_ras.h                      |  76 ++++
>  include/drm/drm_ras_genl_family.h          |  17 +
>  include/drm/drm_ras_nl.h                   |  24 ++
>  include/uapi/drm/drm_ras.h                 |  49 +++
>  include/uapi/drm/xe_drm.h                  |  82 ++++
>  21 files changed, 1682 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/gpu/drm-ras.rst
>  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c
>  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h
>  create mode 100644 include/drm/drm_ras.h
>  create mode 100644 include/drm/drm_ras_genl_family.h
>  create mode 100644 include/drm/drm_ras_nl.h
>  create mode 100644 include/uapi/drm/drm_ras.h
>
> --
> 2.47.1
>
