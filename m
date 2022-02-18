Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7E4BB3B3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1210EA7D;
	Fri, 18 Feb 2022 07:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A22F10EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 07:58:03 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2d6bca75aa2so14408797b3.18
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=7R2K/W8nkggK1CJfPpQftpPmnn35SzGH4U6ga+9D7QQ=;
 b=V+xlF6qh6PP/HMyXbXzf7qS3SXtT2e2Zoo2s9HHCNL5egQM9rIMawyFSb8Ck3LfwA5
 X2PDtPb4B41RUBMfC53NXkmR01khgouCtY7ufZ8nImmPIdsQeCYpJScdMsdiL67euac7
 qeL1eOg1Ft+dXUhi7ilG7/B94k93I+51LINTfDl0LEdOed7L+X/iTVGsv4gBykmKduLH
 zfc9gPYFlLKcTC+N1/G8sBoai9qpugRP5wp2kS2Z0qjBAHrwCGGvICeoI1wCj0/sYzx4
 I/Xk9CutaMf0v7CcxiLDDdxBmur+yOzVl42FB7lj1RA7MFHPAP5lxjz0Q4EeFFyYLtPk
 7C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=7R2K/W8nkggK1CJfPpQftpPmnn35SzGH4U6ga+9D7QQ=;
 b=jx4fkdoUCYASu44p4UNTwsLEdhEL3g/VxhgJtwdZMcR2Ke2tpRR1C+YI+PzY6OQPKJ
 4yFendYU4k04Jut87ZlVDlYrosHYDNLx50PuxEB5nDy1SDnoYVnhj+jYW9ce6cmTh5WT
 hRpSbeixg0EltPgDtBTcfEQYChXFzGiEocKrjzBmzhQUbnxbw+t9ehWq6Y36I31UQO9Y
 ngjWVuk/JeSege9bSPb52LrBLPHuUcNqlcCjeMy8n4PEQevrmXWocaS1mYf4nVoxar7C
 pNf/XATuykqFFOlfp4px6LWochYUcsR/vDrQsZZDoGKvHq5z0EqiNb++NrpDWTQx300D
 YZSA==
X-Gm-Message-State: AOAM531iOqBV71f9Dj7DcBgZS5VDqXzoSh41ap3x6m6FIgA6Ql3A1Ml6
 rvqVCxZisOvdz75tiS5BqH5WwoFcmEobzA==
X-Google-Smtp-Source: ABdhPJwRyBr1QVgpmKaKId2Xs4Ti+wE4zEnLnzEuBxqhMYKF29LS22m3wSG1jSe6jV4DAclduKLzF34NZOIuaQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:690c:9e:b0:2d6:c96d:bf01 with SMTP id
 be30-20020a05690c009e00b002d6c96dbf01mr767575ywb.421.1645171082793; Thu, 17
 Feb 2022 23:58:02 -0800 (PST)
Date: Fri, 18 Feb 2022 15:57:25 +0800
In-Reply-To: <20220218075727.2737623-1-davidgow@google.com>
Message-Id: <20220218075727.2737623-3-davidgow@google.com>
Mime-Version: 1.0
References: <20220218075727.2737623-1-davidgow@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 2/4] drm/amdgpu: Make smu7_hwmgr build on UML
From: David Gow <davidgow@google.com>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Gow <davidgow@google.com>, linux-rdma@vger.kernel.org,
 felix.kuehling@amd.com, x86@kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The User-Mode-Linux architecture (with the x86_64 subarch) defines
CONFIG_X86_64, but doesn't expose the cpuinfo_x86 struct (instead
there's a cpuinfo_um struct).

In order to allow UML to build with allyesconfig, only check cpuinfo_x86
on non-UML architectures.

Fixes: b3dc549986 ("mdgpu: Disable PCIE_DPM on Intel RKL Platform")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index a1e11037831a..a162552f7845 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -1738,7 +1738,7 @@ static int smu7_disable_dpm_tasks(struct pp_hwmgr *hwmgr)
 
 static bool intel_core_rkl_chk(void)
 {
-#if IS_ENABLED(CONFIG_X86_64)
+#if IS_ENABLED(CONFIG_X86_64) && !defined(CONFIG_UML)
 	struct cpuinfo_x86 *c = &cpu_data(0);
 
 	return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ROCKETLAKE);
-- 
2.35.1.265.g69c8d7142f-goog

