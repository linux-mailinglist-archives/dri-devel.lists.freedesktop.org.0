Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659DF601379
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7710EC9F;
	Mon, 17 Oct 2022 16:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA7510ECE0;
 Mon, 17 Oct 2022 16:30:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D30611CF;
 Mon, 17 Oct 2022 16:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAF4C433D6;
 Mon, 17 Oct 2022 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666024238;
 bh=+SpiEDORkFBcvtJuSwSmQI53qufwZDro1hFbAgXXJlI=;
 h=From:To:Cc:Subject:Date:From;
 b=kIkJ65OoOuimfHE5lgKCTOr8YaTCINpC3k58nZUWbk0O1LxvnvJgVqN0zACazN+In
 l5PUBY9PStBYwqmM931aMeGvJdKrTIDQsTXZ+DtnJrE7F6r3MlarzC+G/OCKxGcIBW
 HWQ4lH24oQ1QwHa7WItQyjzSCGmXEXdT8Q51sngHB+uY/deraJQgPd+dwFmhPPVgfF
 fUbCS2G5m+odKPakxZC4ww8EhTprc1bN6GPvpIgJ9F4KEU6X1jAcJm+MU/P0dH0fob
 P64pWnQHb9UNw8loB62Yc1dVmgA1S2kMR37TvV5q1NDnwKKidf/WY+l2/64R9NVHuL
 srkY1nzun/+3A==
From: Nathan Chancellor <nathan@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amdkfd: Fix type of reset_type parameter in hqd_destroy()
 callback
Date: Mon, 17 Oct 2022 09:28:38 -0700
Message-Id: <20221017162837.3698-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.0
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When booting a kernel compiled with CONFIG_CFI_CLANG on a machine with
an RX 6700 XT, there is a CFI failure in kfd_destroy_mqd_cp():

  [   12.894543] CFI failure at kfd_destroy_mqd_cp+0x2a/0x40 [amdgpu] (target: hqd_destroy_v10_3+0x0/0x260 [amdgpu]; expected type: 0x8594d794)

Clang's kernel Control Flow Integrity (kCFI) makes sure that all
indirect call targets have a type that exactly matches the function
pointer prototype. In this case, hqd_destroy()'s third parameter,
reset_type, should have a type of 'uint32_t' but every implementation of
this callback has a third parameter type of 'enum kfd_preempt_type'.

Update the function pointer prototype to match reality so that there is
no more CFI violation.

Link: https://github.com/ClangBuiltLinux/linux/issues/1738
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

No Fixes tag, as I could not pin down exactly when this started. I
suspect it is

Fixes: 70539bd79500 ("drm/amd: Update MEC HQD loading code for KFD")

but I did not want to add that without a second look. Feel free to add
it during patch application if it makes sense.

 drivers/gpu/drm/amd/include/kgd_kfd_interface.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index e85364dff4e0..5cb3e8634739 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -262,8 +262,9 @@ struct kfd2kgd_calls {
 				uint32_t queue_id);
 
 	int (*hqd_destroy)(struct amdgpu_device *adev, void *mqd,
-				uint32_t reset_type, unsigned int timeout,
-				uint32_t pipe_id, uint32_t queue_id);
+				enum kfd_preempt_type reset_type,
+				unsigned int timeout, uint32_t pipe_id,
+				uint32_t queue_id);
 
 	bool (*hqd_sdma_is_occupied)(struct amdgpu_device *adev, void *mqd);
 

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.38.0

