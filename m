Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMzpJON4qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:36:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44053211C6A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B23910E2A1;
	Thu,  5 Mar 2026 12:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="z4YxDD2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D9910E295
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 12:36:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-439baf33150so3385256f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714203; x=1773319003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
 b=z4YxDD2QfNhxjM4CVb0uwsHTAPVhP/VvU61OuzaT4fLoV8jEyd7dH/arQ1WhBnHReK
 aNOeFIC8fLMTYWcRVWNQQXm++1CmoWI31nF+93orFQCGjVu/NiHS38guGnWzmxiFUS/z
 2tSfVUyARIEDMKpvaw2eAMtO+TajMphDe5rWL9TGifr0VuRaTM80LmrIC0NDI0/1afeP
 bAcoFQpHOPNigXU057LhXBueVh0mCV2LkTWRQ7Yy+mXvqtReXLRpbdrWQ63HqiiHeyhN
 GisXgPcOS+dHTB0AcAF28kY0piAJMmdSOrVTYNgydNNsugIPC3HJ5uqESTaXk18c6b7Y
 dOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772714203; x=1773319003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3f86hD8zd8MmrDtQjkoOiWVtBZ+fmRfNZDECEzXgGc=;
 b=FXQpZEnLLqAzGcXODV9+AYfpezKZZaEdKnfPE8bSbTR/FFTYv28nE2kuY0qRpDGvG0
 SfDjeW5K/eWvn1AKxTGPOVh0MTkEYnettPwXR6qW3KrfLoezOAF5pmG0sR6N5kb8Zfs9
 DsG0i+qXl4M3sVlSQDt3NhCAOYdTRaFccC+rABtelbHkeh9W5KmO/LBfKm6bCTm5USOm
 BbJVRVlF11ZB8ceYLg6XxRNmcoHRVaQ05ja/SCd7LyIGqA4geCmfZKvccbo3STEMOd3b
 LchEheu65QkZxcIOogOchl3p2fwgSl65eSAThYTD5xom9szoeAj1qVsso557QFsTiFkn
 UOdQ==
X-Gm-Message-State: AOJu0YyHn8OHByyMmWIz528GHFgmuOIRXq2RnWXBLa/NzJzhV7/AJ2mL
 DiXi3uVcvPEgAuFKIDzF384/iKRHX6wLx0FCattYN3Nqtj6722sM8mx4e/gPQDfJpGtlSa7IEKj
 vjCrhjd+r8Q==
X-Gm-Gg: ATEYQzzDBdtQ1fhx6WY3XodbO18L5Lg+7D/hr47FJWbbFQ8Aicxv1uM4PUV56H5B4hq
 9Tdry4I2+7lBgt+BjRRs1IppuGjV6YKSmSvNcBbu6QYowm2peK63jET0XqOjpFBAwcTItpzlmcb
 o5C5PKkQyA9SNdslCUKlzr3j9wkFdfm/WYN8o18T8dt+S3z2rfsrS/z8RI79ubxA8dVjdFhaizj
 HLIEqsIGcqDKJXhN+ZnOacHgkdk36ITTF1xNzEZjfaifxrcaq8ZQkAefHs9UUNFDMMUu+kMeslN
 hzUAuo4zjzYhB1GT5aek1FDgO1BleeUT5bEsOoMOaf6LNQJ3egzroMrhpOvelRxRvp7PxDK19jj
 W5XoxceQqEZt0wg0Kle4+kzMM4vSGATe2Pt5fkmCr8UDP0MX9qdeG67v5CWj2wggZqni2J6Htc5
 jg40K9UTtl43q2vQ==
X-Received: by 2002:a05:6000:1845:b0:439:afc5:dd0d with SMTP id
 ffacd0b85a97d-439cfd76cf6mr3945058f8f.25.1772714202770; 
 Thu, 05 Mar 2026 04:36:42 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439af926c53sm43701820f8f.8.2026.03.05.04.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:36:42 -0800 (PST)
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
Subject: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Date: Thu,  5 Mar 2026 13:36:39 +0100
Message-ID: <20260305123641.164164-1-jiri@resnulli.us>
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
X-Rspamd-Queue-Id: 44053211C6A
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

Jiri Pirko (2):
  dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
  dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
    decrypted memory

 drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
 include/linux/dma-mapping.h         |   6 ++
 include/trace/events/dma.h          |   3 +-
 kernel/dma/direct.h                 |  14 +++-
 4 files changed, 117 insertions(+), 9 deletions(-)

-- 
2.51.1

