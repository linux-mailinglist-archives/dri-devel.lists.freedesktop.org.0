Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98269A74D0A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7D010EA61;
	Fri, 28 Mar 2025 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YGHjYwng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A0310E1E7;
 Fri, 28 Mar 2025 14:45:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00EBC5C6470;
 Fri, 28 Mar 2025 14:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B64C4CEE4;
 Fri, 28 Mar 2025 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743173135;
 bh=7qGrXEoUERdDE37I+v3l/CeEtOIhffhKARqqG2bFKTg=;
 h=Date:From:To:Cc:Subject:From;
 b=YGHjYwngkfoyxnQor0tqAGGqzrL1qZP6Y8DipI/P3wXV0okkGj+rV1pBOJ4y0uslY
 EPUGbFfFqqqFgVv56h+ztrJZ+5Mq9Vksy5ZPLfXFtfTpFveGDGi4hU8zFqynvxpnpL
 MWL/zLNmUu4or5WkVj3NuFr842EYQUm6tXZDRbZ7bDwGjqM2T7cVYbMyzdhekaa9b1
 /uVS7eiK51z71h/RkRrEdhqNvebahTxhRgI02Me6Q5BSMv3+knSro6ef3qHTM1tan6
 RG3rJ8tm33elXoTdvYPhoA72WtxIrvs64QG+qmx9jdw2rgUk6p2bMGl0XiDgF+e22N
 Y37qbE260PYSw==
Date: Fri, 28 Mar 2025 08:45:32 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/outp: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <Z-a2DAQmcsHHlyci@kspp>
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
 drivers/gpu/drm/nouveau/nvif/outp.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 6daeb7f0b09b..403cf16d5e84 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -195,20 +195,18 @@ nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
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
+	if (WARN_ON(size > 128))
 		return -EINVAL;
 
-	args.mthd.version = 0;
-	args.mthd.head = head;
+	mthd->version = 0;
+	mthd->head = head;
 
-	memcpy(args.data, data, size);
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, &args, sizeof(args.mthd) + size);
+	memcpy(mthd->data, data, size);
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, mthd,
+			__struct_size(mthd) + size);
 	NVIF_ERRON(ret, &outp->object, "[HDA_ELD head:%d size:%d]", head, size);
 	return ret;
 }
-- 
2.43.0

