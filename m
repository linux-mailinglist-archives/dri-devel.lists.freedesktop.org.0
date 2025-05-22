Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C638CAC1485
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA1E10E2CE;
	Thu, 22 May 2025 19:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GYODLncd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C887110E173
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
 b=GYODLncdemVuOK2N2H6V+nXjAkoDLEq5ShXSj9FtrE5PNJSCHYqSXQd9MK+X2jBnZJ8VTV
 iZ+RC1/AgWmisqdY2IOGqG0h5BxBbkOjTy1R4CuF/Okki6u5Dgnzx6GGKZJImPio/9sEAL
 BiPTtAEHkPYymNBcNYiI6ePmPYTN75Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-z5RcPIQNPPqM5NGKFdeeow-1; Thu, 22 May 2025 15:14:46 -0400
X-MC-Unique: z5RcPIQNPPqM5NGKFdeeow-1
X-Mimecast-MFC-AGG-ID: z5RcPIQNPPqM5NGKFdeeow_1747941286
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8e7b78eebso75047966d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941286; x=1748546086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
 b=ANimZYwmGReMjmHULr3qNyD1k6jSR2Orb9uSLV4197Z/ITe5uOGtyovbBAliaHLwh5
 DOgby1a25aXTcuhy172WcBzOYYxuob9+CKj4FU4cpoK3dAlshcRkFYUOKuM/x8CzUham
 Ws7wtA1FE/EHkLKMxJQ6PLgQJEvskeKerYd/Yx3MyjlGeWjNyw7KkLqxaXwQnHYOOYIV
 1lvybJZuq2hdbuBDAQehbi0m5u4idGPZVGmZ+Q+23gzTvnLf56rDsmq1lTsGJmBKjK+U
 wzy0KCEu76uQKehNGtObw7HI9ZMAco2rlq1+C/EbIL2hPNFmbTque0zZpFyyb4ptX8XO
 U36Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZXMRIVwO229FLDJNoQ7AasI2eH6QEJ8Y3Yy+0QbLuAhiVZoNz1At8eXPoKpOBRP+QioUNHrHuBLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlp2QnxmrZb3Bbm8CUbVDTgX79ZqzOpo/iFmp/V+c/eHswfq38
 A+SZSOwUHJJz+KmWaxqRdc8DaBHnYx5uNYm864lUZYDiJMZdNtreUMXLJ7vfBA0T4LUIVrkUCCF
 PuWhmyNgWcBW7AgEPByUKyS6bQ0Bx6cz1zQhRgsN+tvPurgDRITCM3dNdkIng6RJf81OJhw==
X-Gm-Gg: ASbGncu2UhVVa4uZovD56rR8pOikWyCBzY/YNzhEU/XLeWLfOciyrMxyA5BqUqToFTN
 8xWu1YcvoHuBpvAsZ6IFHDD+TzPvR94n2hCIYp6GT6lDdrJc5V3dJQJPNTo4mXaJeZTFy6lM1nY
 /KGfSE5+V9IfT9vZvIzNpc61zXeJTtz3BfihU4mAi3YISwfaES1TMidVp6SDUfvQIKz3BGtJ9MI
 0FHnNrZTOXg1E4qBZHrEV50D1RhkqFn/9XfiFnMinQwMSD0j9BMdM9Ctmldlu6KUrU8F0YUjS/+
 WgFcDufgmfxvKsoEQ5aTe7yhX+ZWEPYdWYGiAbmx1oo=
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id
 6a1803df08f44-6f8b2c7b117mr370336366d6.20.1747941286056; 
 Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnvP93RgtHFU3/OIdPk/sEAnUG6j69VFPbMwWobtaNerAwoUt+hZltUAYDKdgFPSEjENLeGA==
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id
 6a1803df08f44-6f8b2c7b117mr370335926d6.20.1747941285457; 
 Thu, 22 May 2025 12:14:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:14:45 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Thu, 22 May 2025 12:14:15 -0700
Message-ID: <20250522191418.442390-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BDnOaP7_La2XmPtTjJ-h9ILtjIra6gGgYYM3zDA7yBU_1747941286
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

