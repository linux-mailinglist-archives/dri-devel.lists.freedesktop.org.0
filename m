Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4B70D6DE
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956410E3F4;
	Tue, 23 May 2023 08:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CD610E35F;
 Mon, 22 May 2023 15:52:32 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3318baede4cso15419015ab.1; 
 Mon, 22 May 2023 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770751; x=1687362751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FGZB0BLWCtOoXyFqMRziafXS39k9XZRqjcukX9G4FJY=;
 b=FaHtcdzkdup+GumaJ45Fo02SZy1fX3GJRn633/fLcAmnpNi5q6NOU3nSUZSdnnA03n
 2CMLwJoMaosxKnGgH/agh0HqXPkdeIgCSrXBYuOUCFPzv07teBhZ3zTzDOn4+6fzO7uH
 bpkkPs2OGkn6ZEm6/nRQe0FDxmwzyEBDf9ve9CT8aYHPHApi9NxH0QxpfImEfkdGALwF
 ajUs/tM/rExv3923dLsNLbfbbx/SkAzcxDoqT9j+StG5sMK5OOZCMkGJyMISGX4h0Yvd
 2m/nNqhPiUTt3Rv7Pk4ohNaBqOVlzwktKa8GH5tmC+3ApFxo/1aRNIU7oInSObuLoJi1
 d4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770751; x=1687362751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGZB0BLWCtOoXyFqMRziafXS39k9XZRqjcukX9G4FJY=;
 b=aBdkjftQzoyVHHVrVZjj5KnD8MXPWmDjwX5gdrlnx8tm4AjvSF+5CEfJsNkagCxH8Q
 32iOUSSseoopNU7re7ZBXXHauLW3c9Q0ljoR7jzOGj9cSjLT68ectLXgLf65n2BArK2G
 ob7HNspOKLtYsdRw4ayujWSBFJ3nXkae0VLY3TuHo1tamqBqS8MPXDHNWoAhb55BXOUZ
 +56d19Lj3eRg/dapGKDOrBPpeTUGq8iWhk0gI9ZPbpgeXS3uAD0/U8gVUNnOTsSJ10oC
 G+xDMg/mDWdYTckjh92QrpVgZPKChC5j1MEliJm7OkgyFm3DHbIZ1Q1HUPbniUtrQpfx
 Wyig==
X-Gm-Message-State: AC+VfDysbqTLY3blEVN7gq/SVqErUFLo2vqyC0BKa0TlQ1wEmY4aqgrb
 iVaCrG4clExDK3f8mij/4qA=
X-Google-Smtp-Source: ACHHUZ7G3O5lakPrrnpKk0CJuz9qBmBLohQbjDmp+MjXW8RFKkaDO1ZAw0Er7zfh0B+IPVnZl2wqCA==
X-Received: by 2002:a92:603:0:b0:32e:41ce:e521 with SMTP id
 x3-20020a920603000000b0032e41cee521mr7113138ilg.8.1684770751296; 
 Mon, 22 May 2023 08:52:31 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a02b397000000b00411bc1340c0sm1799779jan.8.2023.05.22.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:52:30 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:52:28 +0000
Message-ID: <20230522155228.2336755-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-hardening@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/i915/selftests/i915_perf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 24dde5531423..d4608b220123 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -28,7 +28,7 @@ alloc_empty_config(struct i915_perf *perf)
 	oa_config->perf = perf;
 	kref_init(&oa_config->ref);
 
-	strlcpy(oa_config->uuid, TEST_OA_CONFIG_UUID, sizeof(oa_config->uuid));
+	strscpy(oa_config->uuid, TEST_OA_CONFIG_UUID, sizeof(oa_config->uuid));
 
 	mutex_lock(&perf->metrics_lock);
 

