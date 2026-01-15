Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE5D25CC2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22E10E7AB;
	Thu, 15 Jan 2026 16:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ajgs/5uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452F210E7A0;
 Thu, 15 Jan 2026 16:40:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 425D460128;
 Thu, 15 Jan 2026 16:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE65FC116D0;
 Thu, 15 Jan 2026 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768495201;
 bh=m/Qx1m1mblaNipkWax3IZgERtuZ8Zkg6ma1HJe/Md/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ajgs/5uVyXu7H8VC4ngrms4uARgCVFYOon/i7wj+tn1w72j7H9T4CM/BxlZwd5lfS
 ArM+/+rYU3rKnLV6+pVVvz2xEyrpoFlBKWFw0boo3efTETsCmzQu/ZE0OeVtl0dB+f
 OsIA6BVINFZuD/IWhl5QhJw7xQ/V3+KuhWleDmm2Uu0LE4mBpC5uY2z5TWKQR60521
 okmZ3GiKI4O0OQKRcKN8BhBRretfYIV+o+nSHwdJyyofS2pOTXfPpeZVnq7A8/4fqQ
 5muGt/pK+Fzt9ilSvbB4X7VBJVKErM24M547oE1T0H0ecZk5Yym+Nzm5jURgtti7jE
 zgal0OGtjOvSg==
Message-ID: <c78e9794-e63f-47f9-a4cb-e3b5625ab828@kernel.org>
Date: Thu, 15 Jan 2026 10:39:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin
 <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Ard Biesheuvel <ardb@kernel.org>, Ce Sun <cesun102@amd.com>,
 Chia-I Wu <olvaffe@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
 <9058636d-cc18-4c8f-92cf-782fd8f771af@amd.com> <aWkDYO1o9T1BhvXj@intel.com>
 <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aWkWSnJ7Xn6ukW-b@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1/15/26 10:36 AM, Gerd Hoffmann wrote:
>    Hi,
> 
>>> At least for AMD GPUs remove_conflicting_devices() really early is
>>> necessary because otherwise some operations just result in a
>>> spontaneous system reboot.	
> 
>> It's similar for Intel. For us VGA emulation won't be used for EFI
>> boot, but we still can't have the previous driver poking around in
>> memory while the real driver is initializing. The entire memory layout
>> may get completely shuffled so there's no telling where such memory
>> accesses would land.
> 
> Can you do stuff like checking which firmware is needed and whenever
> that can be loaded from the filesystem before calling
> remove_conflicting_devices() ?
> 

That's something that I did in amdgpu a few years back.

I pushed the identification and ability to load firmware into early init 
stages.  It means that if you have a brand new GPU and run a modern 
kernel with an older linux-firmware snapshot amdgpu will fail probe and 
your framebuffer from EFI keeps working.
