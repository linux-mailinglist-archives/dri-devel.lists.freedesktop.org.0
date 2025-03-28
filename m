Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D68A74E1E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94C10EA5D;
	Fri, 28 Mar 2025 15:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UGrNwJmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F25E10EA68;
 Fri, 28 Mar 2025 15:52:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4B8B614C7;
 Fri, 28 Mar 2025 15:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAC6C4CEE4;
 Fri, 28 Mar 2025 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743177141;
 bh=hWPtfCT2RZ3uXjDp2XjKOX8XZgOg8+h81uSQUsXVRGM=;
 h=Date:From:To:Cc:Subject:From;
 b=UGrNwJmAL3N4qVVLbKdLXJVyd3sm9Dj7fcV3n4faUx8ckNskXAGYAs4FriaW60Vcy
 2DUeBlENs/DGKQPywQNNY51KNma1/rMNRHJbDaE79xujwz/Md+vJ3aOlWD/wyB2UwV
 nLfWQyC4azcHJWT6QeFhpeoVVtRdZEv/bBBaq5hTDQ+n3hiKgPwSPXG/SsVfl0Cp3L
 Ti/a7JDWsd6QgdYLpJmV5VNyTOfnXxsOe/zS02cMQdI4KUmZKW9dA4MdeLLaMBVujv
 h96prW5wI/X1C60yA93CM8nhTdT8AJbhZWthlT3y6tg+IuN75qRNebxWlDrthXaQwZ
 vS24cYZ5RrlwQ==
Date: Fri, 28 Mar 2025 09:52:18 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] drm/nouveau/outp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-bFsmWjr5yZy6c6@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/gpu/drm/nouveau/nvif/outp.c:199:45: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Avoid using magic number in if statement. (Danilo)
 - Use sizeof() instead of __struct_size().

v1:
 - Link: https://lore.kernel.org/linux-hardening/Z-a2DAQmcsHHlyci@kspp/

 drivers/gpu/drm/nouveau/nvif/outp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 6daeb7f0b09b..1ea20b2bdd29 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -195,20 +195,17 @@ nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 int
 nvif_outp_hda_eld(struct nvif_outp *outp, int head, void *data, u32 size)
 {
-	struct {
-		struct nvif_outp_hda_eld_v0 mthd;
-		u8 data[128];
-	} args;
+	DEFINE_RAW_FLEX(struct nvif_outp_hda_eld_v0, mthd, data, 128);
 	int ret;
 
-	if (WARN_ON(size > ARRAY_SIZE(args.data)))
+	if (WARN_ON(size > (__struct_size(mthd) - sizeof(*mthd))))
 		return -EINVAL;
 
-	args.mthd.version = 0;
-	args.mthd.head = head;
+	mthd->version = 0;
+	mthd->head = head;
 
-	memcpy(args.data, data, size);
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, &args, sizeof(args.mthd) + size);
+	memcpy(mthd->data, data, size);
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, mthd, sizeof(*mthd) + size);
 	NVIF_ERRON(ret, &outp->object, "[HDA_ELD head:%d size:%d]", head, size);
 	return ret;
 }
-- 
2.43.0

