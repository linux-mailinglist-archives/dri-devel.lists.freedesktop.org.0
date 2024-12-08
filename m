Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470A9E84F8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 13:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7E10E318;
	Sun,  8 Dec 2024 12:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="EdKPHgJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E3D10E26E;
 Sun,  8 Dec 2024 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1733660136; x=1734264936; i=friedrich.vock@gmx.de;
 bh=BLAbvkpLslpLzb0lubH4OtDMnvi3SfW5XkcUzyWKVW4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EdKPHgJwS5oEAs0DAmTwgWExnkDV5Fyrkrfdr3HuVZRRQ4ipNlKrXM683f54O279
 lg4oKYcyFlZj1wAro+5mYBUskrd6bgpm4HmRCP3AKEs3zwk69mOEtle59yU5D9o1l
 9YL45oRUXhtxpeI6ZQnjydmQ3lWwYOwCe5g9OU8o5QD0h1EBrZoc7Adz3skxPrac8
 47ZYSs0RqVg1g4uCdZ9uLsIzyZj6dsGoIjXogGNqx944VxQrLV2/rUg691Od1mGXN
 wB8ec3e7zrKQM4ale9+vbW9UgQEsy/YOSIO7dPDh2wmRtG8TFnvj42ZjGQygMcA5L
 v0BILk4yK1/8jgGcLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1t2B5C1wYg-00W7PB; Sun, 08
 Dec 2024 13:15:36 +0100
Message-ID: <29a71119-04de-4c76-a98a-d0fcb906390f@gmx.de>
Date: Sun, 8 Dec 2024 13:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
To: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w7dNuTyuZ4TNQ5hpfnJCIfhCruXm3YA39650Wbp2o5G6DWCPayq
 sCwH/Q8UJcrIfs3y6+NDLqeid9rkeIEahxaG1ltE49BO7ujXuBXCwKwLwq+NCLasDjS5NRi
 IE2VsH5P2rOXkUlkIxtLeeSZcX0KhPODBYfGFFuXGjWwTnDgtNbOn3ex0XCa7ulELX8KyvN
 3HgPrbl0Jo4hXtdv1cOWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9AqCQq5rpO0=;GNb/YoPjSN5jUZMfQmXl+Q8muWw
 YCQilh65p8v4u4FtDBZBA/ZJKBkeZjc7k0GEYS0gUa7alSHCINprxzUASsKjfGYudWSYEV919
 5mmvR7nQUa/A9+chPJp/SKgvj6GlErKyVTtZnl9gMKKA9R06LL/3EEsTvtKIJ+lrwg6bfu7qb
 C4QTFXg3BCZhT/Fl+fJVLOgGGtFJwFXHCfnRXtkFBqiahb/jtSqd4sasTBFNJmxqyfwN281mK
 0Hu5Jvd0Uggj3usvC3+WFZUMTIFu2qWVf2IcNV1eVlb/0ZhVuf6YQwXOWFtFYKVcDKewLbVa1
 Un7fE62Phs282W9TzCeEnMog0IM+nI8oXi2sh/5ecHxQW0cnvluhrTLZ4iZ5jXXbugyVRE0yp
 90hcBXzOcNGH8QQsfsxamh3a9LBiHFMzh9KLoKAGKUNgywSwIFWfYWH02Yeipmvq/IaHO9eK7
 uTytnvA7D9866hkwqGWTVdrXgfrGfLyNkiwRFoqO4zCz+fk+J27fqKdIEHZbvbLak8HbtyImn
 KIlbZUJOab3cqMmXdc7tNGFoEtGN6wvS5QR+xuyMFACkurMe47MQrWQ24v3BOk/Pyd5YPlW4w
 YdGLQAfAqA4j3zIHEZzcMc/5tQp+mvJE0guUuLLLaJ2rexsQM13nM6N20pjKFblV5L/FtRcln
 99QH35FHhhbV3DY9odCK6sMCXEjlgEbnN9pUvNol8GYQKTU2Fc//m94RApjgq4iWZUiVa251P
 5CF3tD1YxdvDzKoJts9pA6D367FSv2o1Zvgwi45MvyoU4tBN1JAe1qcBq99rEpSlznErWiig3
 9JYtUrsEWI1+Hr4hywoiRFI0F73EO9CFylWlUIZq7fNZd24uN9Jv3ad3u1INVf5Y58AOwX9Dw
 fOHvCLY0CNGTw1PxAIFEsnIzAX/X0m2iulXrTaukhFaFmynO7gQvncdy/ajPETytpCd5wWtYh
 Fbf9E+5QsDPHFUGuGNJeeZoWI+AUzQL88jFMoj1AT63Qwdc2tsUiE7jORxC+6pbtlIOfWY9F0
 YvGmGIFcuIyYVS7xIoLL8lohTEns6FT6wNGIavEUBywKHpCfs1ZWQWirJdMkr6PpPlENlzQvW
 o5ozclGn3Q+LK5M6jf7AINUSTIcmFN
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

On 04.12.24 14:44, Maarten Lankhorst wrote:
> New update. Instead of calling it the 'dev' cgroup, it's now the 'dmem' =
cgroup.

Thanks! I think this version looks pretty good.

>
> Because it only deals with memory regions, the UAPI has been updated to =
use dmem.min/low/max/current, and to make the API cleaner, the names are c=
hanged too.
>
> dmem.current could contain a line like:
> "drm/0000:03:00.0/vram0 1073741824"
>
> But I think using "drm/card0/vram0" instead of PCIID would perhaps be go=
od too. I'm open to changing it to that based on feedback.

Agree, allowing userspace to reference DRM devices via "cardN" syntax
sounds good. What about other subsystems potentially using dmem cgroups?
I'm not familiar with the media subsystem, but I imagine we might be
dealing with things like USB devices there? Is something like a
"deviceN" possible there as well, or would device IDs look completely
different?

Regards,
Friedrich

>
> I've created an IGT test for min and max, and found the changes
> from Friedrich Vock sent as feedback were needed.
> I've integrated those into the first patch.
>
> Maarten Lankhorst (5):
>    kernel/cgroup: Add "dmem" memory accounting cgroup
>    drm/ttm: Handle cgroup based eviction in TTM
>    drm/xe: Implement cgroup for vram
>    drm/amdgpu: Add cgroups implementation
>    drm/xe: Hack to test with mapped pages instead of vram.
>
> Maxime Ripard (2):
>    drm/drv: Add drmm managed registration helper for dmem cgroups.
>    drm/gem: Add cgroup memory accounting for VRAM helper.
>
>   Documentation/admin-guide/cgroup-v2.rst       |  58 +-
>   Documentation/core-api/cgroup.rst             |   9 +
>   Documentation/core-api/index.rst              |   1 +
>   Documentation/gpu/drm-compute.rst             |  54 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   4 +
>   drivers/gpu/drm/drm_drv.c                     |  32 +
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  15 +-
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  18 +-
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   4 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                  |  54 +-
>   drivers/gpu/drm/ttm/ttm_resource.c            |  23 +-
>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   8 +
>   include/drm/drm_drv.h                         |   5 +
>   include/drm/ttm/ttm_resource.h                |  12 +-
>   include/linux/cgroup_dmem.h                   |  67 ++
>   include/linux/cgroup_subsys.h                 |   4 +
>   include/linux/page_counter.h                  |   2 +-
>   init/Kconfig                                  |  10 +
>   kernel/cgroup/Makefile                        |   1 +
>   kernel/cgroup/dmem.c                          | 861 ++++++++++++++++++
>   mm/page_counter.c                             |   4 +-
>   23 files changed, 1219 insertions(+), 34 deletions(-)
>   create mode 100644 Documentation/core-api/cgroup.rst
>   create mode 100644 Documentation/gpu/drm-compute.rst
>   create mode 100644 include/linux/cgroup_dmem.h
>   create mode 100644 kernel/cgroup/dmem.c
>

