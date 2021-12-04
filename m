Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469F46935C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16EE73EAA;
	Mon,  6 Dec 2021 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9E56E8A0;
 Sat,  4 Dec 2021 10:55:44 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 13so11089697ljj.11;
 Sat, 04 Dec 2021 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KpJG+dZIKMWfHUy9cRIbi/fWUlXgNegU2DlqIwxqCCg=;
 b=XSuEd/aztjZTNFkVTdND9ThEpZC8tfRUibgQ0FbuO+Y9pTS9AIFhjcM59HnI1TMibt
 pkLkC8Tu/km/G3bs+gRczOpS1fyIWVtvknfTft6mcrbTqn+17snNs+zzedOGKanu6wnS
 oG0YyYqtaj5WYteewkMioSabHEek0sCxzA0OtKvE9YO1Xi8cmsYFpc/iR2uPiVxKJK/m
 iQ8TQWTC7H8+R5ooTzd8OWTRMkR9/2PkwlqGI67c37kb9weU4u4HQCadsLDAVMKb2ro1
 2BK3mq8F/8bqRxwE1zLa4+Spy8m0VJ9VfYRfHs3wTu9QOC75X9Uojny3U3ytkV9LRWJh
 Qlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpJG+dZIKMWfHUy9cRIbi/fWUlXgNegU2DlqIwxqCCg=;
 b=jq2hvK6YIe+Mm7GqXOnBJ9IBv/tJ29+95v3WdHzfA663YTz69jC7tIYIlkpGx9nt3l
 S+JkFjQUDBGWwDada0TSvE1JBvYckeQmT6yIe21iaZY5qvguCWhK0Wd3DdQ6IrCcd2eJ
 UNRAu8THdFLWir0BU1cUWnJJciGc2Y41Ky9G8xIGsVXoekmEr90BER91Z7we3NNcl2M4
 DgpkefV041Lba2GjP8FL97xTLqQvWgli79JiCD8f9Mu3vyzv5dWI2tKif9omXtjA0pH6
 K/D+HgFW48L43jAgH9BjxWHE5OaOAakbbz6eduMkfFlMDkmQUPpSkuul1sqIgOguGmWU
 gyVA==
X-Gm-Message-State: AOAM531ksI3alEArejxNvv9Q1udGm1SL4E/8uWxgtNU2aE8nw5ig61Pn
 JF/bGmrzVFwFXpM+3mCRSGkbkoEK5HmOTQ==
X-Google-Smtp-Source: ABdhPJwR00P/dErhD2wD/pyjqENrBh+9h5sjMb5T9+VNLzmG+b3L31NMSBiUlvXBCEk8Sxocwb3p+A==
X-Received: by 2002:a2e:a482:: with SMTP id h2mr23375178lji.87.1638615342575; 
 Sat, 04 Dec 2021 02:55:42 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:42 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 8/9] drm/i915/gvt: Constify gtt_type_table_entry
Date: Sat,  4 Dec 2021 11:55:26 +0100
Message-Id: <20211204105527.15741-9-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is never modified, so make it const to allow the compiler to put it
in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index c8cd6bf28ea8..614156856f16 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -185,7 +185,7 @@ struct gtt_type_table_entry {
 		.pse_entry_type = pse_type, \
 	}
 
-static struct gtt_type_table_entry gtt_type_table[] = {
+static const struct gtt_type_table_entry gtt_type_table[] = {
 	GTT_TYPE_TABLE_ENTRY(GTT_TYPE_PPGTT_ROOT_L4_ENTRY,
 			GTT_TYPE_PPGTT_ROOT_L4_ENTRY,
 			GTT_TYPE_INVALID,
-- 
2.34.1

