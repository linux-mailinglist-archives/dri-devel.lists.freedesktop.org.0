Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAF83795F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA210F1BF;
	Tue, 23 Jan 2024 00:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4DD10F19E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:37:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1d74678df08so8710535ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705970175; x=1706574975;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQ7xzZ4X+f3NMzxQv1jPrp9LwmGb/TMGKf+Qoe38F3w=;
 b=jlsP/qc0A3uVQM77vCpCfUNwLuEXrKBYzgarlyPq1ASik1K2tBBvb2GgNbce9wTpoY
 PkzoZnIY7D0LvT/InKA8cdE0OkHUkJ3brPXipyrkUW4qjVA4378zGjItJ4WS/azhxaDB
 M71K5xWxNE0aMvw0X+M5Y1dv7xSIBHXNOJkoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705970175; x=1706574975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQ7xzZ4X+f3NMzxQv1jPrp9LwmGb/TMGKf+Qoe38F3w=;
 b=vD59/iRgx8IDy69x4ZHnDMHxoC3FCIXQNJh0csMD1qzAcXLcD8jkOH0FazYi68M6j1
 NpPdPMWMprsAkMMshyWDjvWZmO4IAYP5JG04yA8tFgj8+ON48WGyhsLymlw0KpkAFhN1
 z4uJXOycLdFU0/Zn6U3XTlms8PRVQYxQWftuRb85M0wVczLvQlaFUYymifEPk53x+ex2
 tgxarqLm+tnczfilhKgD8VvaN/Le3vaF4h4rr3aIoVYkyCr22xLwuaikSBqjW3Q0OGsq
 ZmwL7lTB+t1w/kXOJ9HHrZD8ijDDEZEVPRv5J6QKi/0/HR5S75b6b6G95adRwBlnbxDw
 SAbg==
X-Gm-Message-State: AOJu0Yyq0c6LxcnwfFFowhmEHyyPyIzIzVOAB1shbH99YQqeL1g00jWw
 Lk0DT2jNmv4fni8RUzdXHMLXIogX0rNlCWQRS++o+/Sf0b8oWgero8A2JGC530W9ZkeAb2kjV9o
 =
X-Google-Smtp-Source: AGHT+IGexDA3GyNiC5HHivGPyYUFrDZgx/vvv3FbvTr4ymfT6W6OqPvq3tmWlk5gIBMYJDFDEGWKhQ==
X-Received: by 2002:a17:903:2b0e:b0:1d7:2f55:c8a2 with SMTP id
 mc14-20020a1709032b0e00b001d72f55c8a2mr2946552plb.11.1705970175230; 
 Mon, 22 Jan 2024 16:36:15 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902784600b001d70125ebcdsm8018696pln.277.2024.01.22.16.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:36:09 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 16/82] drm/nouveau/mmu: Refactor intentional wrap-around
 calculation
Date: Mon, 22 Jan 2024 16:26:51 -0800
Message-Id: <20240123002814.1396804-16-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2914; i=keescook@chromium.org; 
 h=from:subject;
 bh=GfYx3pgFmjHNgd1GYzBGO0bWTMyDF98VVZ9Uwwibr6I=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgF0R3cMIb0bEJahqxzDH8aYuSuLtzDbLBcK
 MwJi5ln/oiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8IBQAKCRCJcvTf3G3A
 JiWKD/9QgeDTjHor+aVubrm/891iXDAk7jazHlj5v3/F2SnXTi+bmLLP4OtopjBdUMsPCx2UIAX
 2Op2QtDm8HkUK+QQ6zmG4KUaapZRcdeqnGmu9M0qvSuxvVVcJJI7xJUumjx7Q6vhbwjQGSQ5PHx
 tw7o/vHgfuo8HqWcIQlyDVJeim5ZIIs6Qsa/2lGfMnyEf6ggYmPPgDdwi3q8gy/Z2R5EmQXitFZ
 02jYxw8yJtqK7iQMIw/+DdCmJga+zhFwFiajePglGFS280vfynresbsR/Ab5I9K/mF6hoaW5Nzj
 /9JADfxQJ+B/7RwcqVQt9//klWcituWydCxmm2pAJKa5qB1+5bM1cNbZfS+7Gqg7d5DQbpkhWvR
 FCz4RotvOZUU11+L/g0NMZhLFyUrsoS3XnWMJPQKLzLuqMIEwYdpUHTsgp2fGFgbJo6v8zILL3/
 K7cq5u/axld11AryCmtQE6Xcl/NUaROikBH/clnZ621DMh6R2SgfHqHLq8LeFb+PV40D1lpjTUv
 KfPtyyrZh7N+9mj3AvF1kzruNYxNyozqGbZnhobgBHDiUh3Nc49GDnZWn5rot0j/cj4bNCHrvDK
 mkRTpRNTiSCzx1W+apGBT6IE6vC71q+Jq/tE64KklEKJ7L0Jq24pax9Z2T6UMrnNYMaRk8d5pT9
 b0LSPqP/mgvSy0A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Jiang Jian <jiangjian@cdjrlc.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Bill Wendling <morbo@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded unsigned wrap-around addition test to use
check_add_overflow(), retaining the result for later usage (which removes
the redundant open-coded addition). This paves the way to enabling the
wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jiang Jian <jiangjian@cdjrlc.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..6ca1a82ccbc1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1149,13 +1149,15 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 	vmm->root = RB_ROOT;
 
 	if (managed) {
+		u64 sum;
+
 		/* Address-space will be managed by the client for the most
 		 * part, except for a specified area where NVKM allocations
 		 * are allowed to be placed.
 		 */
 		vmm->start = 0;
 		vmm->limit = 1ULL << bits;
-		if (addr + size < addr || addr + size > vmm->limit)
+		if (check_add_overflow(addr, size, &sum) || sum > vmm->limit)
 			return -EINVAL;
 
 		/* Client-managed area before the NVKM-managed area. */
@@ -1174,7 +1176,7 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
 		}
 
 		/* Client-managed area after the NVKM-managed area. */
-		addr = addr + size;
+		addr = sum;
 		size = vmm->limit - addr;
 		if (size && (ret = nvkm_vmm_ctor_managed(vmm, addr, size)))
 			return ret;
-- 
2.34.1

