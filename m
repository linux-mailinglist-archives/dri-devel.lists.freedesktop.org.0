Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96783B2FDA2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A987D10E9CE;
	Thu, 21 Aug 2025 15:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A174610E9CD;
 Thu, 21 Aug 2025 15:02:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6539152B;
 Thu, 21 Aug 2025 08:02:07 -0700 (PDT)
Received: from [10.1.36.29] (e122027.cambridge.arm.com [10.1.36.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1591A3F59E;
 Thu, 21 Aug 2025 08:02:10 -0700 (PDT)
Message-ID: <9445754d-28d2-4c95-a2f8-b850032b99d1@arm.com>
Date: Thu, 21 Aug 2025 16:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com> <2813151.QOukoFCf94@xps>
 <2434159.cojqenx9y0@xps> <0108b3cd-dfdd-4e4c-a2d8-157458e26f77@arm.com>
 <20250821135127.2827abfb@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250821135127.2827abfb@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 21/08/2025 12:51, Boris Brezillon wrote:
> On Wed, 16 Jul 2025 16:43:24 +0100
> Steven Price <steven.price@arm.com> wrote:
[...]
>> Although in general I'm a bit wary of relying on the whole lock region
>> feature - previous GPUs have an errata. But maybe I'm being over
>> cautious there.
> 
> We're heavily relying on it already to allow updates of the VM while
> the GPU is executing stuff. If that's problematic on v10+, I'd rather
> know early :D.

I think I'm just scarred by my experiences over a decade ago... ;)

I'm not aware of any issues with the modern[1] GPUs. The issue used to
be that the lock region could get accidentally unlocked by a cache flush
from another source - specifically the cache flush on job start flag.

It's also not a major issue if you keep the page tables consistent, the
lock region in theory allows a region to be in an inconsistent state -
but generally there's no need for that. AFAIK we mostly keep the tables
consistent anyway.

Thanks,
Steve

[1] Which in this context means well over a decade - it's somewhat scary
how long I've been doing this!

> Regards,
> 
> Boris

