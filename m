Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2A249805E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753B10EC3A;
	Mon, 24 Jan 2022 13:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091EE10E7DE;
 Mon, 24 Jan 2022 13:03:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i2so13460694wrb.12;
 Mon, 24 Jan 2022 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
 b=cIOzXEE5EC1Tz/fcrcFHUYHyr8c5+b40bPRHwMMP2zwfimRbd06SzhWeuAvbXXWQiV
 qaOSfP7s6l0uvcT288WJAtX3RszY8F8V8NjwczrE4i3Wv2dsts6PxATUp0WNOBaFxHzu
 ysnIIP5kbx0Hx+5o7Z8ZSIFYbauc3yub3Fo/07RhHiEBMKOokPgibzZGgOibEybM3wyz
 6dftEXuh2bT+xTwSn0QSp2HJU1kUby32Uja1rHbE2MpF2CU3Z9neXAlDgeEGR6hYiFIl
 uPXoBoGtSL6xE99G+KaXbQ557khAFyezO+3OFF6tfkQ3tkBSD2yrvxpgMRdfAZXQihF8
 bnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
 b=rCMmiymjWa9VDFiirbZEkw81vjwG6ViS72jrH8ESBaZkRW/nM720uz+4d2TOSTQ+s1
 7vC3znwxhlGQK+VzyHP0kdOn0naECnsAbmHEU5DyfeBUBXpWLWtj9ejoHbckurpPB0bv
 fmaM0j8FaUWmMvRah49za7Fd8WALvQKOW1bRHZ+/Z/gPX7/fzfxb2rVtcIEgYWxO7RgR
 eeR/4gZ1hdDHs7soJiInZyvon8HQ/R7vjzoFhQZe6CxkngF5am/QTm1lMa/Mf3NQ4khB
 UhhWXx12KGfTJ1eEskAhQe8qL1EEWLOhKqj6Lk6lAXAOoxtuZ2Ru++wWtVgqVhST6vNw
 EGpw==
X-Gm-Message-State: AOAM533+bdUHMrhH0Q/zF65RKkqwXpNxwsukSWlbe5NKE3U7oXTyc6IH
 qeY996PdklWiP9q/AsPV+dl28ipYUWM=
X-Google-Smtp-Source: ABdhPJz8YMGjZC/90UmA7yXibWlmpeoAiaU+31DFIQQPY6Fglc75a7vxcse0ZoigED2XGmkMLF5cQg==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr11949849wrt.681.1643029415677; 
 Mon, 24 Jan 2022 05:03:35 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] dma-buf: warn about dma_fence_array container rules v2
Date: Mon, 24 Jan 2022 14:03:21 +0100
Message-Id: <20220124130328.2376-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

v2: fix comment style and typo in the warning pointed out by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..cb1bacb5a42b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/*
+	 * dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (num_fences--)
+		WARN_ON(dma_fence_is_container(fences[num_fences]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

