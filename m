Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50124A6EB31
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66A10E500;
	Tue, 25 Mar 2025 08:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzanieoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AEF10E009;
 Tue, 25 Mar 2025 01:49:22 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c54b651310so774729285a.0; 
 Mon, 24 Mar 2025 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742867361; x=1743472161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LZary7lJCr9leLHUqm0+3bcbUqSzuAUJ+0Co/QGHNJw=;
 b=UzanieoLxBASiXtweFL62CwlGURJ9bvp0cI/4gyFwtLru8WYSKJtsEskoEh27r0MIj
 a5PaKQJXM+LweRpbOosllAk2KBdHHcm6TS584k2ULNU5v//Vn5SVY9NMXlxtV/Hv13Vh
 uuGvhjzQxwjzAfg2Gva8/1bfhc+etsyEcD87akArtsDUbJl6vHidnZCnFNjizcP49nKW
 x51J3GfjSdyDfJc32Id7TLxdGlCoyY7pID1toDX8EKpri83y+AddMoe9gYxUX8legKT2
 i77kw6GcpHwNn413xvUxOePX0fvqINRI0Vd9JesBywciIbd+ivvGsi2bjH+hFfYGLf4Z
 0j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742867361; x=1743472161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZary7lJCr9leLHUqm0+3bcbUqSzuAUJ+0Co/QGHNJw=;
 b=btEVasJYtgh+H8i5MYHpcrE8C/1BLGt646j5cJUNRD62Eo4X4T/1gxAkrIpOaxfExl
 eDOlRDnrpEF9eRe6VE0JQCArCSAN61KLOYnNLJiWKmFrAubqfEacOQhjyJuN4XurzVeu
 12sLsDzlLzzTfmM4PILfx5QxfKNGJhKT/Ula/aihFYo0gtysKKa7wSClRooh4edOll8G
 Z2/+yaRnYI2oBP28p9GQLmoKrDzTpEje7e8NDwd8N09E7lnpWEd3W66uR9vYPFY53Wjb
 Y5xwT734HynRqPZQlbuRFY99srcofQyrk5G9ljPOp/WWFOhvsQP8OAjYuSrnGdxhXNPn
 oXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmIErvD2U/+w7pXxAJ1kNutnNQ+bDZ7NyHFv4XnPkNOi44SQddQVUIuDF02693VTbORVfDkzAVNZmF@lists.freedesktop.org,
 AJvYcCUsEAf5AbVtbTgD5l4U0NI0S7/Lj0Fn5LBYTKTM9An31fzrELGU+KAeOImRRbFtDYINMG5syMP2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz41LzafporAWni/1QYLcMgMcgCqSkN/PgA3GnFoyGhpt4j1NRd
 Ebr1DQGwo34QrsMgAwFuVSKQHqr5zAw0TjkG0l1ORZ+unv8evw0F
X-Gm-Gg: ASbGncuRY5AD5rMugn9e31IgaCkx6vcnNMk85EVZl4ATDJ+oKqmGHs/gC5X1oHlRXXr
 WvXiAvmuzC/ZDBwez2MkgjusFHydWHMYfGhaHREudzntsTRqXtymSHRXCK8v/LGaBLyDM53Vc6/
 WYVE0MbGi2+5ZapPXhI3ANjYnlpYjgeQ7HH4BC3YCaK04VfL5DISLoIEFi2zkx15ascE57ZUUSA
 1iXabhGZSblZGSsvwVMgL/R/giQ5oo7cKj4xVmvEvEin7PWrDq4NxiJShxg4Azfg/etovmaSXDC
 AqRt3UHFoHsDMeyrxvbUotnl8C1AIqkpMThhfP389mYSTQsYL2LipyNP
X-Google-Smtp-Source: AGHT+IHbDJw6pwBUtJBgbGPD+yF8WaYHrUpLpKHYBRK8TacmFZ8qNmPR4PIiaqNqGMSQA2IUpO0BYg==
X-Received: by 2002:a05:620a:2a11:b0:7c5:55f9:4bc8 with SMTP id
 af79cd13be357-7c5ba139e5amr2310475585a.8.1742867361400; 
 Mon, 24 Mar 2025 18:49:21 -0700 (PDT)
Received: from zerochan.hsd1.va.comcast.net ([2601:5cf:4180:270::68c4])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c5b92d4e27sm581171985a.33.2025.03.24.18.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 18:49:20 -0700 (PDT)
From: AnantaSrikar <srikarananta01@gmail.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Jack.Xiao@amd.com, sunil.khatri@amd.com, Hawking.Zhang@amd.com,
 shaoyun.liu@amd.com, Jiadong.Zhu@amd.com, chongli2@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ananta Srikar <srikarananta01@gmail.com>
Subject: [PATCH] drm/amd/amdgpu: Fix typo
Date: Mon, 24 Mar 2025 21:49:12 -0400
Message-ID: <20250325014912.23911-1-srikarananta01@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Mar 2025 08:12:54 +0000
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

From: Ananta Srikar <srikarananta01@gmail.com>

Fixes a typo in the word "version" in an error message.

Signed-off-by: Ananta Srikar <srikarananta01@gmail.com>

---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index f9a4d08eef92..fccf6e255b82 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -646,7 +646,7 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
 		break;
 	case MES_MISC_OP_CHANGE_CONFIG:
 		if ((mes->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) < 0x63) {
-			dev_err(mes->adev->dev, "MES FW versoin must be larger than 0x63 to support limit single process feature.\n");
+			dev_err(mes->adev->dev, "MES FW version must be larger than 0x63 to support limit single process feature.\n");
 			return -EINVAL;
 		}
 		misc_pkt.opcode = MESAPI_MISC__CHANGE_CONFIG;
-- 
2.49.0

