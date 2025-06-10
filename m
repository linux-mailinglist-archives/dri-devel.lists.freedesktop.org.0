Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD1AD386F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FE110E54E;
	Tue, 10 Jun 2025 13:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dLX5Fx1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A189010E547
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749561167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
 b=dLX5Fx1s3tIntSvBxvp7y90snBsOPhjPThvgecrTng1b2bB25opyb3y0tVpOVdmIfdKY4P
 6MaReDeo6VnUqyHFmChCrV5K2iGJb9AAOjWrHIQyvw33g7dUi7pkAD+8VToVT8CUg6vHH0
 0jcUmSG4fjdzdZu1AtgTUh40wrXoQ1M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-MwNDZ27-NvyBApcRA6cZiA-1; Tue, 10 Jun 2025 09:12:46 -0400
X-MC-Unique: MwNDZ27-NvyBApcRA6cZiA-1
X-Mimecast-MFC-AGG-ID: MwNDZ27-NvyBApcRA6cZiA_1749561166
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0aa9cdecdso502419185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561166; x=1750165966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
 b=unc2iZ09LVVp+klPwD6CcXf3yz/7SgZMrL4pEu21PjVTsXUJdn0Fj1/11ArQVpz7z4
 GvH2Bdomoqc+yeFpqVTHStLhfz1SpHBSMxOEcQIgDHTxdqgjEHx/dBo5FIemj2/n1iV0
 zw9Ch9evuCWivirQ1Qt561gjyRLXT9ENEoIK0x8XA1Oslan1G9/i7BkXT3220+NibGXb
 xDFmY52YIdA7yQwygqjLDNJnxuNoFNEH9gnyPuRR8amIcBbZExAmjAwTFrGITQfVT1/u
 ggokobKf/Az4LImCvhf+WcFcxq6JNAz66aKNGyy6nSwFOFNTg2XpwnQYzStV+qtb7ZR/
 QPSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiAhJEeXNohvD1Ii9i8G5Pn+toc/rc+GjhD4dprV2/X6xWnmk6kcB55BLp7uWlqGaafqOmDj1l9dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGT+BxFEaeAgZUoNsJaOeCdcoTjhFolVJuCxto9Qx9MDN58WdC
 C9gW1gQwdFeCKRS7XitOsaBnbOkafcu0vClzXK2Do6FigOEhBAHz3dYAFYGPD422putV6KJAGxO
 O+x6sSyayYwnUZIr2WaAAX1UF6S8Zj7faviouWXp52JVDVvVNy/ANewxGAi3fvqQPBlo3dg==
X-Gm-Gg: ASbGncuMXwse+wpTOLqg33ONTrA8+EsmvkIXV0IQ4hsNKaJcvYMY12VStSA7jy09jlP
 j2tj1ZE5sx2AMsZghOhJO84sA4UZ/P1BSPgwLd+hWi3enGaIlvY+PNPuh5LclOeejccQIF2WOwm
 gXFhWnv2/D3Bx0T87aWDNBwg+XUCpehHqX7pbiO5PUT28Uec9xJx6sFqT6XMK0IrWo6/srN4R/k
 jmKJp0velW374wsmUTI4WhEaXVgSn7qmf1xW16q9gnbkHFHLFOxXgRO4APWVirjC3pc+p++93a2
 yCSZRzKhJYDMZbxiYac1748V5e9aE1HhrGGZb0/G0z9a40IIjHNaqw==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id
 af79cd13be357-7d22995ec82mr2171099085a.15.1749561165965; 
 Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrYOJLYnD20Za7bwTGNM2Zhi1hWiuol78eHZNm8ukeun1kZlhQxetU40CFKtTARDHt7p13cw==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id
 af79cd13be357-7d22995ec82mr2171094985a.15.1749561165513; 
 Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 10 Jun 2025 06:12:28 -0700
Message-ID: <20250610131231.1724627-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 50p04dPd3ZWvDK3apbuQ_mn53CdKSRFRGbFQWrvIvMU_1749561166
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Changelog:

v4:
  - Fix ERR_PTR() usage for negative return value.

v3:
  - Extract documentation markup fix to separate patch.
  - Adjust DEFAULT_CMA_NAME per discussion in [2].
  - Warn if the legacy heap name and the default heap name are the same.
  - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
  - Touch up commit log wording.

v2:
  - Use tabs instead of spaces for large vertical alignment.

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
[2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Jared Kangas (3):
  Documentation: dma-buf: heaps: Fix code markup
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
 drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.49.0

