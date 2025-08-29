Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A60B3BC93
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929110EBB5;
	Fri, 29 Aug 2025 13:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF52210EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 13:41:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 130B415A1;
 Fri, 29 Aug 2025 06:40:56 -0700 (PDT)
Received: from [10.1.29.20] (unknown [10.1.29.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10A813F738;
 Fri, 29 Aug 2025 06:41:00 -0700 (PDT)
Message-ID: <ac4838eb-7613-4642-a007-577a9f665984@arm.com>
Date: Fri, 29 Aug 2025 14:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/panthor: add custom ASN hash support
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828201806.3541261-1-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250828201806.3541261-1-olvaffe@gmail.com>
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

On 28/08/2025 21:18, Chia-I Wu wrote:
> Some socs such as mt8196 require custom ASN hash.

I don't know the full details of this, but I'm puzzled by the "require"
here.

AIUI the "custom ASN hash support" (or L2C_SLICE_HASH as it was renamed)
affects the efficiency of the L2 caches in the GPU. It basically
determines how addresses are striped over the individual caches.

So (unless there is a specific errata) not setting a custom hash will
work just fine, but the performance might be slightly reduced.

kbase provides both a DT option and a module parameter which can be used
to override the defaults (although the parameter descriptions say "for
testing" which I think is somewhat telling).

How we should describe this somewhat depends on whether this is a
specific workaround for a SoC - in which case Boris's suggestion of
using a different compatible string and panthor_soc_data seems like a
good choice. Or if this is exposed as a general "tuning" parameter, in
which case this might be appropriate.

I believe the tuning is related to more than just a SoC (the external
memory system has an impact). So I guess a DT level knob makes most
sense here.

Steve

> Chia-I Wu (2):
>   dt-bindings: gpu: mali-valhall-csf: add asn-hash
>   drm/panthor: add asn-hash support
> 
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  8 ++++++
>  drivers/gpu/drm/panthor/panthor_device.c      | 28 +++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h      |  6 ++++
>  drivers/gpu/drm/panthor/panthor_gpu.c         | 17 +++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
>  5 files changed, 63 insertions(+)
> 

