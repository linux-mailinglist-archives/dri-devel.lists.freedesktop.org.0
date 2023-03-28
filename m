Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78B6CD371
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AF610E027;
	Wed, 29 Mar 2023 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6910E309;
 Tue, 28 Mar 2023 09:36:37 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-62810466cccso571380b3a.1; 
 Tue, 28 Mar 2023 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679996197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8E4/REgp9ODotbn96PHap4rQOEyKET0fJwvNul5gBUU=;
 b=kcvEiLGcR7zycIQCd+7hOL4Mu8tar4WGIXDOhiTgEDa/iJ7d3OTT/k7PJ0fgfWXXCw
 0Qq/dQKNTMaRMovY+LFbJBFqk783Piejk6LlnJgvCJkowblsEMf6bgOnT8dYx7Slw5O3
 c4lwNAvDbXUy5ygcBsdUeliCWfCxdOMKo27IY84kWK2qw/b0T49UH0Li1xW2/nchWR0t
 jDwDlT6m0GVLjhrPmlh/QEBK8+BHVf+/MjEkdmHbFXEZuIHdiyntAaCkzJqTyNvjBiUp
 JSeDsk6aHCZqZWq2bC4Mid7Y9N+hPtf9IlJTldxhpCsnlASBl52AVIkvKAQv8fZiazyn
 oe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679996197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8E4/REgp9ODotbn96PHap4rQOEyKET0fJwvNul5gBUU=;
 b=BVLbl3AiheHEt3Ubpw4rinUy3E8Ymf2wV55L44AVPClQiHRigp9GaQblf8mU//I/+1
 GmMLwnSwBq741NMDvPi4Paku3nc51DfEpIg2iEGL9LpMtxLgtl/Nl2zmtcoA2MNkchWg
 YB93RueD2e1ZIdwQCqfjagCy3SFTF79O8auhrRxRcncBMvTbwN9zhFffQ4dwDvDqJDHA
 NwLVrEab7mM9JpT5h5bMlMsKRD5qBGamYRx1GDsNlLvBCH0QOo59ceIAUzc/MmMb6KVd
 UmJiPoTb7tHAmuxMa4Vzvhy4Dzev5YVbd6QFfj5wyu2s4wsX5dflZeYUX4eEbN+KuQxd
 GJYg==
X-Gm-Message-State: AAQBX9fEz41WXynfl5IJNSbXF9tMVx6CfnDv3PwLEuwQSlXQ+Qk/olZ+
 z2E0AJ/mLXkehIvy9piitdQ=
X-Google-Smtp-Source: AKy350YleEYd7R05h2kxGvupb45hdhpsCF5j3upr5y4AS+OoezqifsjZF3EWhW3l3a7qAH1honoqMw==
X-Received: by 2002:a05:6a00:3002:b0:627:e180:ac04 with SMTP id
 ay2-20020a056a00300200b00627e180ac04mr12763467pfb.0.1679996196817; 
 Tue, 28 Mar 2023 02:36:36 -0700 (PDT)
Received: from ubuntu.localdomain ([183.208.21.231])
 by smtp.gmail.com with ESMTPSA id
 i10-20020aa78b4a000000b0062619a002f6sm20512150pfd.187.2023.03.28.02.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 02:36:36 -0700 (PDT)
From: Min Li <lm0963hack@gmail.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH 1/1] drm/i915: fix race condition UAF in
 i915_perf_add_config_ioctl
Date: Tue, 28 Mar 2023 17:36:27 +0800
Message-Id: <20230328093627.5067-1-lm0963hack@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 29 Mar 2023 07:40:06 +0000
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can guess the id value and try to race oa_config object creation
with config remove, resulting in a use-after-free if we dereference the
object after unlocking the metrics_lock.  For that reason, unlocking the
metrics_lock must be done after we are done dereferencing the object.

Signed-off-by: Min Li <lm0963hack@gmail.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 824a34ec0b83..93748ca2c5da 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4634,13 +4634,13 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
 		err = oa_config->id;
 		goto sysfs_err;
 	}
-
-	mutex_unlock(&perf->metrics_lock);
+	id = oa_config->id;
 
 	drm_dbg(&perf->i915->drm,
 		"Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+	mutex_unlock(&perf->metrics_lock);
 
-	return oa_config->id;
+	return id;
 
 sysfs_err:
 	mutex_unlock(&perf->metrics_lock);
-- 
2.25.1

