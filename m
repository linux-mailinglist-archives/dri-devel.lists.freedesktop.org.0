Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C537B6ECDE6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 15:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF91810E503;
	Mon, 24 Apr 2023 13:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA32610E095;
 Mon, 24 Apr 2023 05:59:20 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1a920d484bdso33953675ad.1; 
 Sun, 23 Apr 2023 22:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315960; x=1684907960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZ2SfSlApMPG0JQkvL0AAuqyfaSDxsc4TPleUHWHX54=;
 b=JQ4Plr0mbmBIELUs1MmeOhriN51b4lngv+ZMqWIi3OVZG2hFu9cwbPeyb6hDeNfVjG
 9mKXLS1sO5qQwHvMB+Yz4c3v79FD3BmNxw1FyL+wAwReBc4yyLBtxX33PPFKuCiKE7rD
 IPvYsXAmVatq04h6O6tNEao3Cz4bEztuOszMpXu+XBhL0GbYmyfzKO9stGO/b67BkANb
 Bc0pjHu+UW4Jq0qa0QUqwIuk8H6y7RFPhRlD76vi2bFipAu+6mxF/+qh9Ku50ZXpZEU0
 4WXcV7zDg+QWOm2C0Cdql0tbkTpy2ZdumFulInnf8dG2asm78oIgR90gb1kYkAbujW/d
 bKXA==
X-Gm-Message-State: AAQBX9dN8pNRrugT8sx4WfbaFKWOgLAyjsvt1OVrOhYXToXAVziT91R3
 U3fIDhIBJL/iMVukcoLDnGo=
X-Google-Smtp-Source: AKy350bZL1arZEunooIRRXsnKZi0bPLlYztinlCxzZ/LrCosNr+NxtGmjW+3SAzNg1ES3iuKdejZ3A==
X-Received: by 2002:a17:903:30c3:b0:1a6:f1f3:e475 with SMTP id
 s3-20020a17090330c300b001a6f1f3e475mr10319987plc.55.1682315960069; 
 Sun, 23 Apr 2023 22:59:20 -0700 (PDT)
Received: from dev-linux.lan (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a170902d64700b001a979121444sm850808plh.207.2023.04.23.22.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:59:19 -0700 (PDT)
From: Sukrut Bellary <sukrut.bellary@linux.com>
To: daniel@ffwll.ch, airlied@gmail.com, sumit.semwal@linaro.org,
 Hawking.Zhang@amd.com, Julia.Lawall@inria.fr,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm:amd:amdgpu: Fix missing bo unlock in failure path
Date: Sun, 23 Apr 2023 22:59:10 -0700
Message-Id: <20230424055910.15683-1-sukrut.bellary@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Apr 2023 13:27:52 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Sukrut Bellary <sukrut.bellary@linux.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch warning - inconsistent handling of buffer object reserve
and unreserve.

Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 278416acf060..5de44d7e92de 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4686,8 +4686,10 @@ static int gfx_v8_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, &ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v8_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
-- 
2.34.1

