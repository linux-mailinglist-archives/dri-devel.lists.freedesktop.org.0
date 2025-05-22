Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790DAC1483
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEF10E173;
	Thu, 22 May 2025 19:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fWvtLJFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D310E2CE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
 b=fWvtLJFhYGAXh05X89OXJiZYPjkJM3pvQMgIuXM84pyCeRxin1SMrIqrp1KO2uvHZDr8Kt
 BnXTdhiaYDHNCRQLVaLzftugh0BGxsrmM5PO/bzTYLORyWP1oPemzf+aNsgSMl0LjPd7t5
 REzVsFkzIb+tnTgMI8TRCi8BH3TtFtM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-5m0owdslMQmrV3s72gt7bA-1; Thu, 22 May 2025 15:14:48 -0400
X-MC-Unique: 5m0owdslMQmrV3s72gt7bA-1
X-Mimecast-MFC-AGG-ID: 5m0owdslMQmrV3s72gt7bA_1747941288
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8bdefcb39so3567386d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941288; x=1748546088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
 b=dNLUZqX6WC8y0QFZohgb7uuaKmaXnVBSGABoUHksQWJjyfk/m/wGrLnoe7HXhuLIhT
 K07A4JXRBDEz1/YBLFlE7sySQa9yMfSSJkUc1ilnTgHk5H8+SOUoWNXViMv+PfccMISZ
 59xi4p3uhi+BkAsSsH8UrNXOliCNCw3afS2EO10AMW4y7QFlL04rJGxRrmWGWPCALv57
 dx5dDqUTznjCNrexWnfS/WloUSjUVnhdKht1sQVhUKn/I5DfAhhY3o9y2UaGpj0bIJjE
 qflsCtA2FFtcWdI2LpIijELNOmo8NiDY7Vrf7fckTMBIc5f8aoy5ufMieBhE+50LeAfo
 a8vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUhomr4YIqSXWVk8awABOQRdYWEtFMW2ngGzA5N4vq9tSj5wJ7gvvPjc7NB4/W+yf4mG3e/POdSNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBkFrE+vvk3DpyVZkZfstlU8r1wDoMhBiqqSPh7Q9Z1jz+3P3h
 +/KbOXSABIGTv94SHqV5GPRPHPcdIozClmA5f0rOX6laltrfmwrdZI6JRwksaWQ/efZpqp2RrSf
 QT09843pliPJ81CkU7fXxmYsOoVQABNG3EPCkKJSav3j/I3yixgLJWb2iZ3ro3VjnO+FiKQ==
X-Gm-Gg: ASbGncteSK6zDxNeITNpVjK+1DI0l+Ql0MFltTz55ne6hfDYbJOu+tIT3cyTldIYcMn
 j3Nwv9DJb31W7recysvZ4W4szBn7+X+rkImwnjnlnZglHYaXguf+aZVojX+6xL0QP+sCN7Pc7vB
 pL9wM/vmYrWZyayCvL96Lkwq4ZBsqz04uoKFvU1ACSEQd2IoeyutKQ7aaQYdq/yr4TFU0eEt1a7
 F/vPFxcduIYMS3VbVCo3V1H9ptk0GLyVYFVyhfgbRV21FZB7RrvAmrUZ5lIou/DE6QQp8pAcgXm
 2XWG5jC6spkVwVhnl5JV/Ztj1sliy8idf8dyu/c00S8=
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id
 6a1803df08f44-6fa9359ba0amr9188016d6.5.1747941287827; 
 Thu, 22 May 2025 12:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXDudy5Pg6bUCPRtP0KahbCyP3R5ipmAB0kn6jEZFdIdpWn2q6/ZPEaqhoAbgeWBZfIF4h6Q==
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id
 6a1803df08f44-6fa9359ba0amr9187686d6.5.1747941287499; 
 Thu, 22 May 2025 12:14:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:14:47 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Thu, 22 May 2025 12:14:16 -0700
Message-ID: <20250522191418.442390-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IvtUO0aqNjJXzXaeZuFxvFlK6oMEkdzuAJc7eApTmMk_1747941288
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

Code snippets should be wrapped in double backticks to follow
reStructuredText semantics; the use of single backticks uses the
:title-reference: role by default, which isn't quite what we want.
Add double backticks to code snippets to fix this.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..23bd0bd7b0654 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,7 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
-- 
2.49.0

