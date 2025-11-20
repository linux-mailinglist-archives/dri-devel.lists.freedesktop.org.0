Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F342C74B4B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5FE10E76A;
	Thu, 20 Nov 2025 15:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMwI9sFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C78A10E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:00:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so1518124a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763650822; x=1764255622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KW+kRzBEHA4jKkrkR9ZLwv6sirYslh2oCRpUNEgLzxs=;
 b=dMwI9sFJAIuD+BnHz+rdpWGDa1Wlzg0oPLsWA9KA9hBwHLfiKhWPtZhzvBXQhTpcZp
 1ZCy4CgQB/expNcyYJWVmtKbUASFKLF3rI3+TpSQwikNYqKQJ0EaNYffJbBcO/3iaDoF
 8m4HjV93cZqhSM1CbWej9Ju0n2gGFaHLy8CDUBBpb0dFl5G33kwQZzQAR6k12Hi+4Eqg
 HJnAlgj9vETM749A8U31ljg6QsYhDX2yRnCWZYGRw5hxRVYef6UKuLw06ADKmsutYvBg
 SUaenQzCpkBmVPCIhdadcAzP9LCorvEtoa/orw60aTHHhgksdEhhznvfOsr618okUs4K
 tBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650822; x=1764255622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KW+kRzBEHA4jKkrkR9ZLwv6sirYslh2oCRpUNEgLzxs=;
 b=h2N7DCn1xrTeBrP3JMbnPa6iM50MSnYrxE3ifDzq02/HZ3c/y6UNXSIXBCAiHZrh7O
 ne0brvlNkhnMU2L/LXmUm0GwkWmHx159A72ISlyUdFSrdoiykQDzl5HhHQsgHIbr1ffO
 XCTyvVo8n8rv0+9xtRmkmTocjNkVqOtfBEYDhIbotKv7FjZy+BP7EbR8IHvSR4ivN7ai
 h+q7Hx13L4IdNVpUJ9fLy+qKn6JD69Yqi1LsT3N7KDG1pwmaYoO/im7D6qGo4skSMgIU
 2M053PMk7IBUCOwW8oJ0zBJ6DDEXUErKt6vcFm5rjVf1vU+znelnV3UoxNJE1+xk7PfU
 WrTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV31WyO641Er9fOyW87/V2KfqJ5WAkEWMoMvz0KkZZbR7Bezvu4ZkVtBM10YMsJXJrNBhgP7OM21M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh53SyIw0M7XHGJDpOGIdWgLym9QattMkgSXIpZbbG/XmqmUoq
 mnDI5jdBLr7F3R01C9D61fwYSAvxjsG1KwW0P/gyAuonCAwcyXKLKqSG
X-Gm-Gg: ASbGncsGrTg60LMBSNYLc4+aY4VRv9U3dabW+w/eB1TqPLXKWnR9+Poh/TU03uMHEQ/
 5UyECt+GhNQp5Gg06MMWJo7GfdRVkiZkgaQ56GvPqebTU7k1f3bWjswt0DFWxavxS4qJFV9Lvt6
 GQ6Mh0razG2ELHXcU9nWr7xsv+Xrr7CFEojI3EeHmDh4Ta3bnWHHNgM5quclUvS6aBcOecfXDsT
 hZXAD7K6zKnUve3DK7eFEbDnETpeG+YXhY+YF5/2CWMpNKiHYADCSvbQwXnWJzjQjSBn11QNiu5
 3mk9sSYNc0nFDdEZ4rA3cpheXwzAPi5CE4IPt46HBQB4/4swxxnEt3qIxg2uBWqkzN6XmflqybI
 3UKIT9gH8btg4igUrsoaqWw+bBmTsZEsyNom3s4+otcD1PSutS8Yw51DuA3fc63411vH/CNw6OY
 IfsQG226UzgRJS6WdnEg0peUM7ha39eTU88rY=
X-Google-Smtp-Source: AGHT+IE6prXF8s/y7WhNH087a0LGD4PggM53BQrC7EcC+xM7xmoqpQMJoNG0KtFEZd2Ox+C7TxsuKQ==
X-Received: by 2002:a05:6402:5406:b0:640:a7bc:30c5 with SMTP id
 4fb4d7f45d1cf-6453647ba22mr3201568a12.28.1763650822418; 
 Thu, 20 Nov 2025 07:00:22 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154c:c900:7aba:c4b7:a402:3cd2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453645f2easm2205878a12.33.2025.11.20.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 07:00:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] dma-buf/fence: give some reasonable maximum signaling
 timeout
Date: Thu, 20 Nov 2025 15:41:07 +0100
Message-ID: <20251120150018.27385-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120150018.27385-1-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a define implementations can use as reasonable maximum signaling
timeout. Document that if this timeout is exceeded by config options
implementations should taint the kernel.

Tainting the kernel is important for bug reports to detect that end
users might be using a problematic configuration.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..b31dfa501c84 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -28,6 +28,20 @@ struct dma_fence_ops;
 struct dma_fence_cb;
 struct seq_file;
 
+/**
+ * define DMA_FENCE_MAX_REASONABLE_TIMEOUT - max reasonable signaling timeout
+ *
+ * The dma_fence object has a deep inter dependency with core memory
+ * management, for a detailed explanation see section DMA Fences under
+ * Documentation/driver-api/dma-buf.rst.
+ *
+ * Because of this all dma_fence implementations must guarantee that each fence
+ * completes in a finite time. This define here now gives a reasonable value for
+ * the timeout to use. It is possible to use a longer timeout in an
+ * implementation but that should taint the kernel.
+ */
+#define DMA_FENCE_MAX_REASONABLE_TIMEOUT (2*HZ)
+
 /**
  * struct dma_fence - software synchronization primitive
  * @refcount: refcount for this fence
-- 
2.43.0

