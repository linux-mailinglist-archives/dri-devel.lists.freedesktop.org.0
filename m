Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C054EA83F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656610F112;
	Tue, 29 Mar 2022 07:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CFB10F112;
 Tue, 29 Mar 2022 07:00:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x34so19530986ede.8;
 Tue, 29 Mar 2022 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dfQADiC3SkhSpWiX7t32pPZIKom+fqM6C8ez0L8fdtk=;
 b=hXRlg+OY/KFL9cqLeqJvoC2sGQvHE5xTtCNjtPDKgWLr65aOTHptN3wyod8Pz0b8Lu
 mQtXgAnyqoAhvOkUpJeneZSu561r8ex/Jhzr1128NlTiUnUXRJ96C1mmo4c7MJxKI4Vl
 2wLcdh/q80uZYq/ZdDCs3yD3Ga096jU0L0FTB3iLTEKYEcPISZASbLUHSjyjw/EOYrMn
 2uq7wg9SqtRSvB5Eiy1yumrFrCGTYV9kqxTx6bvZ1cLXYpK+2AtaplXjpUo/ahDEgO0o
 bsx7sNU/6oThzEcNxULMyK/OfftSuk6DmLHEnevG6oCTf31AdKb5TEeD53y0+m34MVZM
 Ek5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dfQADiC3SkhSpWiX7t32pPZIKom+fqM6C8ez0L8fdtk=;
 b=ieTuaFygrGAxJpn66NENi04sxTIc2pkeMv+hWNDywmq/grxewQWMSeSJee3FOUfHUL
 Fh9wWn1hHsGNPVtGA0x23Ob5Qf2XZNX2ClsENdHmNKMQxOggcVLVqIvm9M5wAJmotb6b
 sThFWBIeOe4G+uyC/Obz6i0jUIwKnUp3Us/lAjf+Gh3rO9Ua43KORh+iOPpK64xN8Wmc
 yAX3tIJpsDgLz6fbOtGfRFPpA4HWx7gwtY+4ktA2qH5AeN40fVtQL87u4c3nQxrqyZFi
 q2kHBvjNI4XzN0bKijOEKC6SQClkSsuPnL23Wrm7h7sQ7/TS8VCwACVL5Z3hrx3XEOG7
 L+kw==
X-Gm-Message-State: AOAM5320AkJG8YBwLWQ/awNo3/1iLTWUqnVuA+2zBwnaZTziz/tBjkuy
 vtjWOnYYdDHSyCBsc12BBzpaJF0mQsQ=
X-Google-Smtp-Source: ABdhPJxZys/k7C91gqwRakOcXoRfj8Dei6X9emGlvQ/rA5KyjiSrAjYJmv9BnrJjzK1G+BTm/kZSDw==
X-Received: by 2002:a50:eb8b:0:b0:419:a11c:8676 with SMTP id
 y11-20020a50eb8b000000b00419a11c8676mr2589983edr.267.1648537205019; 
 Tue, 29 Mar 2022 00:00:05 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm6593250ejb.162.2022.03.29.00.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:00:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ville.syrjala@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Date: Tue, 29 Mar 2022 09:00:01 +0200
Message-Id: <20220329070001.134180-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
References: <20220329070001.134180-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A bug inside the new sync-file merge code created empty dma_fence_array instances.

Warn about that and handle those without crashing.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 52b85d292383..5c8a7084577b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
 
+	WARN_ON(!num_fences || !fences);
+
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
 	array = kzalloc(size, GFP_KERNEL);
@@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
 	if (!array)
 		return head;
 
+	if (!array->num_fences)
+		return NULL;
+
 	return array->fences[0];
 }
 EXPORT_SYMBOL(dma_fence_array_first);
-- 
2.25.1

