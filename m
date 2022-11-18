Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CAA62FF34
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 22:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3910E7D7;
	Fri, 18 Nov 2022 21:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8729210E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 21:12:11 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y203so6025342pfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NZy40ckMJK9PstrSORSMVw9LuD5M42HuElen5aK+uEs=;
 b=YsibLVMHY4zS47SGC2k6c12KtYewhksNOs+sYyriWf5/rkBDw8uC3HDs/f2Wj2L3Gj
 BVm78lwkUPik7ocGkhAa3Kl4tsNM2qjas5VtByHPDLiqfCZ7H6xt+RUmd0nfLpgVFGa+
 TGWDzas1X6ndUC9LeJnozesYDmetjh/aAn8Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZy40ckMJK9PstrSORSMVw9LuD5M42HuElen5aK+uEs=;
 b=7syJHH0H4BWYUiETs5uJsepsgE/ko6dDzO7we5fJ9uiNFFHRb4M8QEA1bDnqYofv3L
 iDsSaX8bxARKVYOUBCRdPGxSJI0HYdl179/Ze5JnM6aSgzvRRnxTws/KMR9pXnDWxOnL
 xCR+pXD4FdXNP0fcb+sqEMg7Sbm3AoOb1bOsWoX9LM3MHBeQxawoOSr3MZfYIehkZSBa
 da4PVcpJQOK/rvqAskxTv0llJov7J/I5qMO+osxg5hDyZbbXgL//KzgL8awxNQAz4ryO
 uN7+diKlJj/JoBOcIJHP8P74BQt/G/HmNWSl/uDTCM4o3NDeNMnDkg2ezxa4NT6U5FWU
 iYMw==
X-Gm-Message-State: ANoB5pkczzLaT+gPAKSzTZtRk0xwVrIynbpqQZEU9XTgJWsBXmKVWZlz
 LKSKN80jZs6ZR4SAx34MfpPHpA==
X-Google-Smtp-Source: AA0mqf7K8L+3ggQrBqjW5sllCMvwU8TlFsM8+MyfYc4TYEHJRKBuT3Ac3K/jUbWeUkf/xTrdlksb6Q==
X-Received: by 2002:a63:5c59:0:b0:440:3cc0:c062 with SMTP id
 n25-20020a635c59000000b004403cc0c062mr8308527pgm.10.1668805930887; 
 Fri, 18 Nov 2022 13:12:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a170902d4ce00b00186a437f4d7sm4218924plg.147.2022.11.18.13.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 13:12:10 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau/fb/ga102: Replace zero-length array of trailing
 structs with flex-array
Date: Fri, 18 Nov 2022 13:12:08 -0800
Message-Id: <20221118211207.never.039-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; h=from:subject:message-id;
 bh=X9HCxkhxMUKHNvL3i6xwv+DIq3QBR7MiLcT0RJeQqIY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjd/UoT/JDrfBTo/vcofpBixe5bpHWDrFyzZ1EdUlt
 Es/j9QSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY3f1KAAKCRCJcvTf3G3AJhAtEA
 CYWhughNKE0OapwIXiefhx+jOiRBDaUC8hfzPm33xTb1ARxGJxY9kRrmeToWC8sE1VDug0m8vukcy5
 QgKz72Po6nwKPbCqifUHhkVlNVW1c4PZxpf03G50RR3ly2UCPVXjBtKPilwvXblNyMMzOLM6aZ2+Uo
 Y7B+ZnxNP7RDoPiEk6EDqeBuXW0eFpjan4RIoURtXVRTj8cnh5GvN24iwWJiU07GKNSb7rUSMnyc+e
 TfTLqSbV7JrEuCQ5rtVUG5x+lbqlxzBURXXlz0P6+qZ9YbK+t2cc67oQJNi267V48nMO2KK3pT3rjz
 wAuqSiMoJAxtvJSd2O5qlCNiMTPE07V0aAecujkq+mm26kIvR9Enpvh5ZxDPUUy35TQeezQmq6jn/i
 F4CtMYWFkfD5lS40SBlR+47zlf9gvQHLkTJ9APICVfRmI2OurXDqtsz0OEoXv9hlsGEopLnYW39TWZ
 CYF0mAo/DMBgUMx6PnJ7SGyfsPnqjD4vhebC/RwGvx8KpDlfpfL58/PNMuO0PBe58TV97WjBDuhd7L
 3pTrWdpxtaojtEUyLi+5Cya2YUt2Id8kn3VHa10utEc7F/jrEzFYHH8sgKuRR9d7Vv8Ql/Ucl3MOOP
 tqfaieDGKT4+2+1/nRGn5/zf4FLvKPJRW24HNWPRMJBkDXu9JgdzMkE4vLnA==
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
 linux-hardening@vger.kernel.org, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zero-length arrays are deprecated[1] and are being replaced with
flexible array members in support of the ongoing efforts to tighten the
FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.

Replace zero-length array with flexible-array member.

This results in no differences in binary output.

[1] https://github.com/KSPP/linux/issues/78

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gourav Samaiya <gsamaiya@nvidia.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
index 8c4cd08a7b5f..8b58b668fc0c 100644
--- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
+++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
@@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
 	struct {
 		u32 offset;
 		u32 size;
-	} app[0];
+	} app[];
 };
 
 const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
-- 
2.34.1

