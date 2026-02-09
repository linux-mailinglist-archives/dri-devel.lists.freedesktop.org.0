Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OKpImr/iWluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29330111F77
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B053E10E41B;
	Mon,  9 Feb 2026 15:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="qILKP/e8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF310E41A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:38:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-483487335c2so5392935e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 07:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651490; x=1771256290;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
 b=qILKP/e8Ja3PqxmhO7Wg1kIqxYi8k6wCCDPcPODxZWXFSkUoq/7FuBCkf592xiv7zi
 m/+N9vo0rxJhsrhqrEPgVrIT47/X0aIuNA6p6C1PDt+frq3UTyenISIcYiKPLd9cG6Lu
 JYWYaTTcVzo8kqq1qRwoyc9Ggjw9upavuw0PV1drbRMgGpDSfCRl2MJdbVSKhnkxY565
 2k2wXh/Wzqqda9Vyxth0a4RqIJu9TVNRDblMStnsYSDj2/WSCloR5FS6Uvy8IA7Fso5H
 KIJ/XYMSccNHQI4kNzDzhhhTeD4Ivn0BGRdaDyoTuszcP+03MPNyNPjSCOHniUQ6hAYg
 lk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770651490; x=1771256290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiucukKgd6A5IEwlte0sQaw8GOuaez4s0BdPuzMpI0U=;
 b=VsZkmmoVHMB80bdCia9/tdc67mmduJXXCEKtAW77MtwHxtZZc6qfb1TS9AJFm/WG6p
 42VzlD9m3wQU2Nz4uVz4cNMlLPXcKNBNS4M12zrsTAHI8aKzpHNQfTzyVNLk6m53LbUX
 l0m/7xdYaCtSt3mfFu9y2VzEN91xcNhFTHbD8FdQwLX7cxiNiFenwZ8YDfGK25W35guq
 RWPbysmTcLfHxotDzFEZGzuio8Mgn0D8oIyx+RBANZmpHE8MFRwA+bem8aXDcVsFnjVO
 GcFdiXtso5Lg9Jiu6D+o5xd1CKDd6QVI/4CBxrW5JPxwBYHcrBCGQn5pPYfN0a1QrucM
 qMHw==
X-Gm-Message-State: AOJu0YxWomoGINXZvB63G5v1v1Orfrx84r6u9zV/6RzPAmYmRFjqEKZM
 Gw/mdxoNcRq3ai76RqNQpyvu44isHmrUAZrbLblnYEK6d6rdAUyC0Hh3QaybixP9yF1EoUuUB7+
 YdIe0
X-Gm-Gg: AZuq6aJLhFm8D5RZlFBwY8KeYfQV24eTE8Y3QTu1RStg36EH6KK8V5nHbNnLQjMbO7Y
 k3bs3yQPUJePXO0BKecDcfmAvof3FRhGaA/J6fVtXqdabw6IaRWeSRYE0mN2oO/nbefuX3IcJ2c
 H+u+2tYLLI3D/z+KojaWJYhQINHu7W7gLDmQS00LAf0ILxn9ujyEjINcRvlvoIp5xFm+AdepnY2
 yKLBBwl/p5V9WFYJoDuq1ZEqIL7syQeXTqDiK6JvsRDZJEHwptd5tXWWc5r9hHBZybS6/FRfZmV
 pSmiHeBoujQl278Xx1T8m8BcMG7SU/A17lMA9fQK95Md/WWURFbKKyNmDlU1SQuNzModEAImY8B
 pbMkgiKMQsQUS5XHa3oNPBQCfVy54FkbF8kTY8uXJHlfdqhiHmpDzBg6DgX1YFzaQk9jQjxX3vP
 mOWrdqBWaM2/qC
X-Received: by 2002:a05:600c:621a:b0:480:6852:8d94 with SMTP id
 5b1f17b1804b1-4832097e2b0mr178535855e9.27.1770651490292; 
 Mon, 09 Feb 2026 07:38:10 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d8341csm329338275e9.13.2026.02.09.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 07:38:09 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: [PATCH 0/5] dma-buf: heaps: system: add an option to allocate
 explicitly decrypted memory
Date: Mon,  9 Feb 2026 16:38:04 +0100
Message-ID: <20260209153809.250835-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 29330111F77
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
run with encrypted/protected memory which creates a challenge
for devices that do not support DMA to it (no TDISP support).

For kernel-only DMA operations, swiotlb bounce buffering provides a
transparent solution by copying data through decrypted memory.
However, the only way to get this memory into userspace is via the DMA
API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
the use of the memory to a single DMA device, and is incompatible with
pin_user_pages().

These limitations are particularly problematic for the RDMA subsystem
which makes heavy use of pin_user_pages() and expects flexible memory
usage between many different DMA devices.

This patch series enables userspace to explicitly request decrypted
(shared) memory allocations from the dma-buf system heap.
Userspace can mmap this memory and pass the dma-buf fd to other
existing importers such as RDMA or DRM devices to access the
memory. The DMA API is improved to allow the dma heap exporter to DMA
map the shared memory to each importing device.

Jiri Pirko (5):
  dma-mapping: avoid random addr value print out on error path
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: use designated initializer for exp_info
  dma-buf: heaps: allow heap to specify valid heap flags
  dma-buf: heaps: system: add an option to allocate explicitly decrypted
    memory

 drivers/dma-buf/dma-heap.c          |  5 +-
 drivers/dma-buf/heaps/cma_heap.c    |  7 ++-
 drivers/dma-buf/heaps/system_heap.c | 96 ++++++++++++++++++++++++++---
 include/linux/dma-heap.h            |  3 +
 include/linux/dma-mapping.h         |  7 +++
 include/trace/events/dma.h          |  3 +-
 include/uapi/linux/dma-heap.h       | 12 +++-
 kernel/dma/direct.h                 | 14 ++++-
 8 files changed, 128 insertions(+), 19 deletions(-)

-- 
2.51.1

