Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE3NOTAjnGkCAAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:51:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6E1743B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50D10E033;
	Mon, 23 Feb 2026 09:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Bss6ulNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F045710E033
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:51:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so32467655e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771840298; x=1772445098;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
 b=Bss6ulNd2FjAmiwNuRTm9NoRfvhiKGnjmutl9Y8Iw3WMGsvcOKeCKEE1IuUzyDycyQ
 efW+C4Ivbodw+DtcAGx9RpHDWDnKEUivds1upEt3tw07RsCExlZUayKGMk4A79auP6Wl
 7niKG4m2A0qbWqG2Fu43ChaNkJoegFCy6ntyQbiFQVM6aEfxuB2lurlEhS3c9Kxhc46H
 AOio48BkLEOlkml+YBOehnNvuu7JsqzEtJ5VqtyLBC+1bZiER/dRgPmFp3n26ez05OmA
 yHKY6Xi08PVyl1mqgwa+XKxKoEALUMo3sw2Zl06qOcBD1646CuMXXuCRzUnw3DaO9DA+
 K/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840298; x=1772445098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9P/hiUK/l/iV+NBMdNBP19LQ/+lioTm29Bruktj9zQ=;
 b=Nnr3TEKj/QXre9fr/Oz5wns/yNOAaw2ZsSjbyVP9aVeXi2HDozb81a6WfUHWGpLU7c
 wQvrvoxQgvan1kB59dZBYpaURXFzjM7VQ53lPInMJ9dmMgWmFBIBaCSnkbNu/Molnr9R
 xtTPx8H5U+bXS4SMxxfTVle0jixC5d+pqFJT2i+uV1+B/uHH2/IeReFykznQ6PqvEmNo
 911oRvCmOu9+/1SqNcCIfUaPP109hsQw2Gr8HcxJCufxyd8lNiQsZUx++uVsqWJqtMgT
 JHYHZQCJTmcek8h4V53uunnbmTISP10zPJBJFhKsWFE05io2EI9dOpPOQB2p+asISSMX
 IYsQ==
X-Gm-Message-State: AOJu0YxDI4sHS0U8nz0L2QhKZbBlqcuFFV2Lj83kG9Ip+KGL48Jp+LEw
 wBqsTH3lj52fzrfKtmjAjAzJOFVPjbq+5Mm49VpwgOaZGQOK9oV4CSuNkpZPDUpfpZm5pSFijJT
 8P0n4
X-Gm-Gg: AZuq6aLgo1PtrIMwYRDIFGn+2q7crjXssqUuDPDGAlFIsc3VKz8EZDU2ZHNY3HzrFND
 kAgGtp5R3Ps4PFNUkFxq4Q3XjRRsZjEuCaWijD0K82s+WeLCJfGxPXLZB0rrx21U0glBfTp3E8O
 7MVy1AGIsAq548jIe4S4rRJUGqJRb0o2mJ8O7ibk20fv1K4jU964eoAt1LZh9+JnGC+FGOjRGZ5
 WDdYyeV0ahzTtDj0cDAhQJN2EGmHZU6OB6Kf3gmQM3le00Dn3iVVLwpeW33W87LoNnQT6aT+a7y
 92vR3iAu0u38P28L/44+uDvMzGDtcKQB3DVx6wNKxvTdfbkssJ/5nshpQjUkAKS1QDa3qVC7Dls
 wg9cHXkByJ4c83/X/N1+PBTDvUcIQXIYgjHyk/MnKTrsJV2X7AaKhfXoH62OmHJBbUAIbtsfXCu
 Etrk1pV2OXN1aiMA==
X-Received: by 2002:a05:600c:8b5b:b0:483:a352:b4e4 with SMTP id
 5b1f17b1804b1-483a949e600mr141861245e9.6.1771840297668; 
 Mon, 23 Feb 2026 01:51:37 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9caadedsm152601835e9.10.2026.02.23.01.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:51:37 -0800 (PST)
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
Subject: [PATCH v2 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly decrypted memory
Date: Mon, 23 Feb 2026 10:51:34 +0100
Message-ID: <20260223095136.225277-1-jiri@resnulli.us>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
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
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 52A6E1743B7
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

---
v1->v2:
 patch1:
  - rebased on top of recent dma-mapping-fixes
 patch2:
  - fixed build errors on s390 by including mem_encrypt.h
  - converted system heap flag implementation to a separate heap

Based on dma-mapping-fixes HEAD d5b5e8149af0f5efed58653cbebf1cb3258ce49a

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-heap.h            |   1 +
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 include/uapi/linux/dma-heap.h       |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 6 files changed, 119 insertions(+), 11 deletions(-)

-- 
2.51.1

