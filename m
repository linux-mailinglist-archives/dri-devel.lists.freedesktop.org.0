Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE27B5A395
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF69410E78F;
	Tue, 16 Sep 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAuK0QNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115F110E78F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:35 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b522fd4d855so4629653a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056914; x=1758661714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m2+AVyP8cdYBqUaKkF99fDBOfCpjrDMFd2oAZFqPACM=;
 b=mAuK0QNPxla/fNmddlv+1b5YCUYtS6UY9aWu3kxpr47Lv5GRmr921tDlBzkR+mdnTb
 WZSVlmHYIdy3v3e0Nst4Dt1G642KN5+dDFzvJAjKjpiieVLX1B8sqxyWqkjOnOHgx2fb
 cxn4ClfzilHFb68x0Ry6hCvALUP55iDxE7sdXaYk3XNbELmdqfx03AeXXZfbEx7XJVEi
 T6CqKlqHKKxOwKtBxkJ6q8lsYdbpCMCtPiRhfrD5f8nsoSWgi9+KHzY6xJCvY88x1g5i
 4IbR0WgEZwBpgzQHVQNoEpIH4IwnTcyGEtX1gHeTZa5Dc5egbL+uXU5xklQ6gLz+Wc4d
 htjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056914; x=1758661714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2+AVyP8cdYBqUaKkF99fDBOfCpjrDMFd2oAZFqPACM=;
 b=GcXnS1dKZMFrkMZ20KNGglGrTsVdR58gHCS/EM7o/hSpgH3f0hp7D2XFO+ZFiNGhbd
 59ierwGj8A2yuSRjU2JGgF/3sYXvGCo4L7S2JI2FJyljhk1tCFnQJgrAgIx6T6J+Cid/
 JQc1W3cGDgGr/VbAkNC31PNOGQ9YNIy93r9RS9xj0kJBWg9UhTBfG+hWFENBVlYgBoJd
 5derxs0PV0qabfdZ82jtROTt9RD4a1xkua+0967moNEGQ78hwioaEVkl0fDDvP/w4cN9
 60zR9W3qBKPspbmNZyiY+0v25bJahwpKfVZq86gP1Yxa0IXR63AwWjYJ729jxT6yLjt9
 nyQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyaxbmAVE9fqNHQR3DqlyrIN3a9wyzXyK9jxStY+WvP3xGqulp9NYAMcAYQD5gu6SI39IJdqDmwk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTAcnsHw6xWIPcuKYReM9uQ7oWwTJgSSZBBqPrH1tr1enjxpbM
 1o2rB/2VQBBhhRPjNUctqp+ycIw4L+tVOzWMLaTquoeGK5sGsfEtA+O9
X-Gm-Gg: ASbGncu/x3zqqY9cNBo8IQUxdUQu/ZO+Akrtl+b3UEkr2yn9qbnqstfTOevL96L6h/w
 in1cus6fcXykB0LmtxT6SW+UMCGBRZn8N3zTCSO6yZe2ap0sttwE+iOCyPpdNZbfgEbJBpLS1yt
 ASIw4XmFKsoJnXSsZOFnq9kSexswaxC7/pAgOdNrBtvQ/4sOOMcQn6psBR8/e14KAbDvx5Go8fP
 5JXuNJ+NF0EYWoq1eXAPYMRt21P7bkDRAmGD9My/71VaxYKoKzOCpZBxSD49FuKkpdXneZzkXkp
 QVdYKGWAndYtybtQBZAg4vv5rkHsZz4jIkCEq43ZymbTWstcq9i8koUCqX6QtjFT8sLnGBR4Y7r
 fer9+3G/TyyD8TbKYspnGxoZtTnezYnMpX2BCIy94D2kLSbWrd/rO6JKFL/5Jj8ag8A/rUprn0f
 81LWKCm3q4Tg==
X-Google-Smtp-Source: AGHT+IE30vWEscVxco130cSQzQXEWjfzODa+kIkYNIPjO8BENCWK1VbimiHaV06bj4bFJuwZm56sfQ==
X-Received: by 2002:a17:90b:1649:b0:32e:1b1c:f8b8 with SMTP id
 98e67ed59e1d1-32e1b1cfc95mr15610484a91.26.1758056914499; 
 Tue, 16 Sep 2025 14:08:34 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-32ed2705f71sm475216a91.28.2025.09.16.14.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:34 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] drm/panthor: add mmu_hw_cmd_unlock
Date: Tue, 16 Sep 2025 14:08:16 -0700
Message-ID: <20250916210823.4033529-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

Add a simple helper for the UNLOCK command.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 8600d98842345..953348f9afdb8 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -588,6 +588,19 @@ static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+/**
+ * mmu_hw_cmd_unlock() - Issue an UNLOCK command
+ * @ptdev: Device.
+ * @as_nr: AS to issue command to.
+ *
+ * Issue an UNLOCK command to unblock transactions for a locked region. The
+ * region is implied by the last mmu_hw_cmd_lock call.
+ */
+static void mmu_hw_cmd_unlock(struct panthor_device *ptdev, u32 as_nr)
+{
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -633,7 +646,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	 * at the end of the GPU_CONTROL cache flush command, unlike
 	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
 	 */
-	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+	mmu_hw_cmd_unlock(ptdev, as_nr);
 
 	/* Wait for the unlock command to complete */
 	return mmu_hw_wait_ready(ptdev, as_nr);
-- 
2.51.0.384.g4c02a37b29-goog

