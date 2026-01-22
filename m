Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wImRM1lncmmrjwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 19:07:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BA6BFA9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 19:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717D10EA3D;
	Thu, 22 Jan 2026 18:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c4MgO7ir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520D10EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 18:07:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A57C2600C3;
 Thu, 22 Jan 2026 18:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341C7C116D0;
 Thu, 22 Jan 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769105235;
 bh=wN9ZCmjUsgfm4qkKjFTDF64YeJA5BNp7YAJTNuGgBb4=;
 h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
 b=c4MgO7irYFYpWutLr0jQKY0uG14Vqd4Y/5+kkzg9eaGXtd56moCVDxGqPKiepWBth
 QKKK5QmGYbs7p1OgqhKnF1tCMz8p9C3Y9m/jDkESZoIh+8C5H1KXSA4tOK7dYDPpwO
 +eNOn+ODS83WwbgX+ofyDqd35rV7WfjoddjsUz0hJa/6YHobjeC1/fm1xWJSDBt8LS
 /tN278Ak1fBKL8azaz3kyPlindBX+8nxnipLvX0aw4YASoMIoyjl4lSE2FE/gsZe7K
 KFJIXjZp7X+DfcW3A0f5H3fyk3U0Vbo0XRh0bJ75o1nyA15lU6Nwx99NfFJ0PlyW6K
 L/nW7xTaA2aTQ==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 12:07:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 David Hildenbrand <david@redhat.com>, 
 "T . J . Mercier" <tjmercier@google.com>, David Airlie <airlied@gmail.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linaro-mm-sig@lists.linaro.org, 
 Sumit Garg <sumit.garg@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-tegra@vger.kernel.org, linux-mm@kvack.org, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 John Stultz <jstultz@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260122161009.3865888-1-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
Message-Id: <176910484137.3006995.3850336645613910946.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] dma-bug: heaps: Add Tegra VPR support
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,ffwll.ch,linux-foundation.org,lists.freedesktop.org,vger.kernel.org,redhat.com,google.com,gmail.com,arm.com,lists.linaro.org,linaro.org,kvack.org,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:conor+dt@kernel.org,m:simona@ffwll.ch,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:devicetree@vger.kernel.org,m:david@redhat.com,m:tjmercier@google.com,m:airlied@gmail.com,m:Brian.Starkey@arm.com,m:krzk+dt@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:sumit.garg@kernel.org,m:sumit.semwal@linaro.org,m:linux-tegra@vger.kernel.org,m:linux-mm@kvack.org,m:benjamin.gaignard@collabora.com,m:jstultz@google.com,m:thierry.reding@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.236.52.192:email,0.234.17.224:email,0.105.73.32:email,0.53.182.0:email,1.3.102.64:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.152];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url,nvidia.com:email,31e0000:email,31c0000:email,6a00000:email,0.103.194.128:email]
X-Rspamd-Queue-Id: 118BA6BFA9
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:09:59 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> This series adds support for the video protection region (VPR) used on
> Tegra SoC devices. It's a special region of memory that is protected
> from accesses by the CPU and used to store DRM protected content (both
> decrypted stream data as well as decoded video frames).
> 
> Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
> to the list of memory-region items for display and host1x.
> 
> Patch 3 adds bitmap_allocate(), which is like bitmap_allocate_region()
> but works on sizes that are not a power of two.
> 
> Patch 4 introduces new APIs needed by the Tegra VPR implementation that
> allow CMA areas to be dynamically created at runtime rather than using
> the fixed, system-wide list. This is used in this driver specifically
> because it can use an arbitrary number of these areas (though they are
> currently limited to 4).
> 
> Patch 5 adds some infrastructure for DMA heap implementations to provide
> information through debugfs.
> 
> The Tegra VPR implementation is added in patch 6. See its commit message
> for more details about the specifics of this implementation.
> 
> Finally, patches 7-10 add the VPR placeholder node on Tegra234 and hook
> it up to the host1x and GPU nodes so that they can make use of this
> region.
> 
> Changes in v2:
> - Tegra VPR implementation is now more optimized to reduce the number of
>   (very slow) resize operations, and allows cross-chunk allocations
> - dynamic CMA areas are now trackd separately from static ones, but the
>   global number of CMA pages accounts for all areas
> 
> Thierry
> 
> Thierry Reding (10):
>   dt-bindings: reserved-memory: Document Tegra VPR
>   dt-bindings: display: tegra: Document memory regions
>   bitmap: Add bitmap_allocate() function
>   mm/cma: Allow dynamically creating CMA areas
>   dma-buf: heaps: Add debugfs support
>   dma-buf: heaps: Add support for Tegra VPR
>   arm64: tegra: Add VPR placeholder node on Tegra234
>   arm64: tegra: Add GPU node on Tegra234
>   arm64: tegra: Hook up VPR to host1x
>   arm64: tegra: Hook up VPR to the GPU
> 
>  .../display/tegra/nvidia,tegra186-dc.yaml     |   10 +
>  .../display/tegra/nvidia,tegra20-dc.yaml      |   10 +-
>  .../display/tegra/nvidia,tegra20-host1x.yaml  |    7 +
>  .../nvidia,tegra-video-protection-region.yaml |   55 +
>  arch/arm/mm/dma-mapping.c                     |    2 +-
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   60 +
>  arch/s390/mm/init.c                           |    2 +-
>  drivers/dma-buf/dma-heap.c                    |   56 +
>  drivers/dma-buf/heaps/Kconfig                 |    7 +
>  drivers/dma-buf/heaps/Makefile                |    1 +
>  drivers/dma-buf/heaps/cma_heap.c              |    2 +-
>  drivers/dma-buf/heaps/tegra-vpr.c             | 1265 +++++++++++++++++
>  include/linux/bitmap.h                        |   25 +-
>  include/linux/cma.h                           |    7 +-
>  include/linux/dma-heap.h                      |    2 +
>  include/trace/events/tegra_vpr.h              |   57 +
>  mm/cma.c                                      |  187 ++-
>  mm/cma.h                                      |    5 +-
>  18 files changed, 1713 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
>  create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
>  create mode 100644 include/trace/events/tegra_vpr.h
> 
> --
> 2.52.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20260122161009.3865888-1-thierry.reding@kernel.org:

arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 263, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 248, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 260, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['reusable']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} should not be valid under {'required': ['no-map']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['size']}, {'required': ['reg']}
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): 'oneOf' conditional failed, one must be fixed:
		'iommu-addresses' is a required property
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: video-protection-region@0 (nvidia,tegra-video-protection-region): {'compatible': ['nvidia,tegra-video-protection-region'], 'status': ['disabled'], 'no-map': True, 'reg': [[0, 0, 0, 0]], 'size': 1879048192, 'alignment': 1048576, 'reusable': True, 'phandle': 272, '$nodename': ['video-protection-region@0']} is valid under each of {'required': ['compatible', 'size']}, {'required': ['compatible', 'reg']}
	from schema $id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bus@0/i2c@31c0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /bus@0/i2c@31e0000/audio-codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb2-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-0: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: padctl@3520000 (nvidia,tegra234-xusb-padctl): ports:usb3-1: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6800000 (nvidia,tegra234-mgbe): phy-mode: ['10gbase-r'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6900000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: ethernet@6a00000 (nvidia,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: vic@15340000 (nvidia,tegra234-vic): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra124-vic.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: nvdec@15480000 (nvidia,tegra234-nvdec): 'memory-region', 'memory-region-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,ga10b']





