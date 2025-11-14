Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54912C5C463
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 10:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882210EA1F;
	Fri, 14 Nov 2025 09:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VSFKmqJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142A010EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 09:31:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4710022571cso16830415e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763112658; x=1763717458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uG1ndTGu7u+afhv3ORckpwAAuy9xCYDjJCa9P3afHXY=;
 b=VSFKmqJofgns78ltpmS1ASkWeNV2mSgOaGzuWxvQPhyM+xlVciPBRqiOMfkw4z6Eaa
 spUpBDdGPVfJm34vDxwFSZif4Haig3WVIAYO3VKy1f+D/gNYfxqkM7gCwVpbDG0E2Xtk
 DkF3RlWUCq2EcPfmV6K8bmP3UJaBWgkJRBHq6wX7TR5Nc33cAqcsbD3KMlVwLNevgt9m
 4QEYXTbiGBchjCadWlgKeBUowt0l4CWdr3GA7rubp/AbHUpMrBzluazbbv8J2hppng68
 7hZvunXcqdfhGymxj82eQaYpQFlR1azaCsnzKyxO0Vc4S2d8Z3P1F/VTLcvJOptwOn8D
 mLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763112658; x=1763717458;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uG1ndTGu7u+afhv3ORckpwAAuy9xCYDjJCa9P3afHXY=;
 b=Y9BU5Pd9CMFue0aqCv5MhW0CFdFkfsqrYl2xbMYw97CDbUNIwP1H0CQBBJuvTktnX3
 rn1pUE/jI6Q8qPLSMPXXjlKXpmoIJJpcZtZZ3oyV0lYIWCxdNWIHhL4uBvl8fODXGgaO
 Zptf6iyPiBGDf+sL6zP4kZwWZ6WYnQGD5eTrDansu8MQLsaBwuCrvHt+xDlnD3QWCcWb
 fkSSRbHRWUIWeN9u1CODsMY6wIrdD1vU/dJjzmgYtfo9w0Xtdq80yNtDI8BwkwFhdFzi
 EDlV4pb8d3J7o24TNb0pqxw2hNEVoyGWiyI4+qYu356q5xu8WRjY5VZKth5/3rAr/ivg
 tElw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3IjJUM4ony80oH/kAIhJ/kz40eqaDv79lDaWbmFyfQdkpyGO5NgVXqQ6jQYF2OEXFydlVZInEWLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJtPdcrriW3AiXGnD0Lqenym378HgDusx+znAfMsDUvBNpNMvn
 nfvfzx5eM4uVDQcIwtSQgsmTDYSluJoRqrQHzCRAdFPNGiJtC1+tGptyKywYwg42YJI=
X-Gm-Gg: ASbGncuv3QCAuG2TfcOhpFOJ2uL5z/FLn91KanqKAxJhIde0m78I7Z0SF3RkJTqM/uo
 qhpTkZHSfuA8ynAYDfpyei30Xlj+Ed5F/2+p70o5x6u06UPqtniBIv2BEdBtqNAQ3KIaZRRWkH/
 iTxGeHSlYMXJo8iUKqKkTM8dSljBZHozFMtmjPTF1zAaXnP/1tuZ4Cp8MgeDSkkEpFroqPEhvCK
 XsZjP9Cjuwoj9eMXYtdXfNOLiom0cU5PkY6JubzOE+qs9jmTT2bNYMGtcgJ40IT5LuIpAvKcJqP
 3m5oTYA5oeiP9YawGc5t33/zYNnRZTcgMTeJrGzZMxr15iQdoizf+25CG6HsWcXwe6cfz1EK+ID
 LRdZ+14UL2Impvr5XvIt8LowyQ1cZtns2qCf/KL9mII1bG3h5F58kPa1PNmyd6IUzZeiutnodcy
 ME
X-Google-Smtp-Source: AGHT+IFJ0DG17bS7Bpxic+Ik1NHnlwSocVb3TsoIa+Uww+ltuZjndP90MdsbrAR2R5TWE+X80Slu9A==
X-Received: by 2002:a05:600c:4706:b0:471:9b5:6fd3 with SMTP id
 5b1f17b1804b1-4778fe0e0a9mr20589695e9.0.1763112658371; 
 Fri, 14 Nov 2025 01:30:58 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778c897bb8sm77561695e9.12.2025.11.14.01.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 01:30:57 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DBD265F820;
 Fri, 14 Nov 2025 09:30:56 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>,  Lucas De Marchi
 <lucas.demarchi@intel.com>,  Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org,  Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,  Jani
 Nikula <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  linux-pci@vger.kernel.org,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Simona Vetter <simona@ffwll.ch>,  Tvrtko
 Ursulin <tursulin@ursulin.net>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 00/11] PCI: BAR resizing fix/rework
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Thu, 13 Nov 2025 18:26:17
 +0200")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 09:30:56 +0000
Message-ID: <87pl9lot9r.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> Hi all,
>
> Thanks to issue reports from Simon Richter and Alex Benn=C3=A9e, I
> discovered BAR resize rollback can corrupt the resource tree. As fixing
> corruption requires avoiding overlapping resource assignments, the
> correct fix can unfortunately results in worse user experience, what
> appeared to be "working" previously might no longer do so. Thus, I had
> to do a larger rework to pci_resize_resource() in order to properly
> restore resource states as it was prior to BAR resize.
>
> This rework has been on my TODO list anyway but it wasn't the highest
> prio item until pci_resize_resource() started to cause regressions due
> to other resource assignment algorithm changes.

Thanks I'll have a look.

Where does this apply? At least v6.17 doesn't seem to have
pbus_reassign_bridge_resources which 4/11 is trying to tweak.

>
> BAR resize rollback does not always restore BAR resources as they were
> before the resize operation was started. Currently, when
> pci_resize_resource() call is made by a driver, the driver must release
> device resource prior to the call. This is a design flaw in
> pci_resize_resource() API as PCI core cannot then save the state of
> those resources from what it was prior to release so it could restore
> them later if the BAR size change has to be rolled back.
>
> PCI core's BAR resize operation doesn't even attempt to restore the
> device resources currently when rolling back BAR resize operation. If
> the normal resource assignment algorithm assigned those resources, then
> device resources might be assigned after pci_resize_resource() call but
> that could also trigger the resource tree corruption issue so what
> appeared to an user as "working" might be a corrupted state.
>
> With the new pci_resize_resource() interface, the driver calling
> pci_resize_resource() should no longer release the device resources.
>
> I've added WARN_ON_ONCE() to pick up similar bugs that cause resource
> tree corruption. At least in my tests all looked clear on that front
> after this series.
>
> It would still be nice if the reporters could test these changes
> resolve the claim conflicts (while I've tested the series to some extent,
> I don't have such conflicts here).
>
> This series will likely conflict with some drm changes from Lucas (will
> make them partially obsolete by removing the need to release dev's
> resources on the driver side).
>
> I'll soon submit refresh of pci/rebar series on top of this series as
> there are some conflicts with them.
>
> v2:
> - Add exclude_bars parameter to pci_resize_resource()
> - Add Link tags
> - Add kerneldoc patch
> - Add patch to release pci_bus_sem earlier.
> - Fix to uninitialized var warnings.
> - Don't use guard() as goto from before it triggers error with clang.
>
> Ilpo J=C3=A4rvinen (11):
>   PCI: Prevent resource tree corruption when BAR resize fails
>   PCI/IOV: Adjust ->barsz[] when changing BAR size
>   PCI: Change pci_dev variable from 'bridge' to 'dev'
>   PCI: Try BAR resize even when no window was released
>   PCI: Freeing saved list does not require holding pci_bus_sem
>   PCI: Fix restoring BARs on BAR resize rollback path
>   PCI: Add kerneldoc for pci_resize_resource()
>   drm/xe: Remove driver side BAR release before resize
>   drm/i915: Remove driver side BAR release before resize
>   drm/amdgpu: Remove driver side BAR release before resize
>   PCI: Prevent restoring assigned resources
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  10 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  14 +--
>  drivers/gpu/drm/xe/xe_vram.c                |   5 +-
>  drivers/pci/iov.c                           |  15 +--
>  drivers/pci/pci-sysfs.c                     |  17 +--
>  drivers/pci/pci.c                           |   4 +
>  drivers/pci/pci.h                           |   9 +-
>  drivers/pci/setup-bus.c                     | 126 ++++++++++++++------
>  drivers/pci/setup-res.c                     |  52 ++++----
>  include/linux/pci.h                         |   3 +-
>  10 files changed, 142 insertions(+), 113 deletions(-)
>
>
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
