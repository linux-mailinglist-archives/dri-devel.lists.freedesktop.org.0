Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C6B32818
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 12:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6193110E1BE;
	Sat, 23 Aug 2025 10:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ag2B1jKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5C910E1BE;
 Sat, 23 Aug 2025 09:28:58 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3254abaf13dso496713a91.2; 
 Sat, 23 Aug 2025 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755941338; x=1756546138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=clYk2rcWxM2aiZ2rBZGHZQJ9PUsfPdIZw87dXlv1eP4=;
 b=ag2B1jKiRUiqUwOp64BexasdUXJulKpvxxrLY4gznU3PqtidMnoo3DJyP+Vmfr3Ie9
 ouHsfc0Zq0p7hJZZ1Ux0mG7iplCYI6D34u1yQXJbwB1oe8Q5lmtALxQNcZuAGWUY+Ymb
 YOGFZZ4LDLeVlmN3N8PJ1rslo5YjOkBcio6c2oFoYGNXRODBh3rXRaz31DJA434NuG7g
 daz786V/4T61ntAkmjQsRJMkeegfilkgiGakwmbHJ1+tYBEsxxcHCCH9EDTVbLAc1jHk
 IEY3PUUYJmpOE7nVMy4j0DF46deQywu79aHDFXnx4JAHxdNfI8nGV5uEr5uAcnBbeFWw
 KpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755941338; x=1756546138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clYk2rcWxM2aiZ2rBZGHZQJ9PUsfPdIZw87dXlv1eP4=;
 b=Z+fuLLxaFp3TNiQyXLl0ZNt1+1V9EBHJCrh7N4fOsxyhbRySfTSO7FDPPQiv8AVQcW
 C6ysCgrKKFZC2xMOKE4Mu2/luGscCOwVNR3J1A2g7u7pf+SuKudt4XAYu1lvdLczz8Rj
 dsHsViVOAybQqVEsqtMn9muVdT6SHHrygY96brIDgg6EdQq97J+Wu1gBR6ky9tAZsjDS
 j2x3ujIyFZw4FbB+kEy8gSHRIUbd8BWLlYXuM35fYpabJLc0cabuFbOMt7aQN3xQ/O+u
 NUKiqXCREGztckloaFQWUchuaPhh2WeCVxdXYj/S6khBh7cqtUgI06lQJOxnSWouiscM
 Ebpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHlhHw8w99jxPUqepdfGxsuvTe4jG7b7TjY2PxCQitnOyXarqDhxHoNHHLk0ghJMiHKSp1Qqk9@lists.freedesktop.org,
 AJvYcCXT1kun84nnrZlwssie7vSeHPYNkuASAX0C/Vhp2bhcIR87J6XY1BmINc/XzfSVxoQJXcj5fbtd2Uy3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypFqTTuk6iic91Fixpva6nJXWVi/EIP+aRQ0TDOgoYyLhupq/M
 R88NurGqZWZUNyU4fTpV9/ylJxtJWz2Hv7QmDoDiJtDRpcfGcqqIDdz4
X-Gm-Gg: ASbGnctE4w565z1koNz3aKMc9tvQ8lj4zmGe1TycuxhN2kdjnnrbP5PfS9g0oANuqtP
 BPba0yjYtDj3/rNQ/9mpqayzUXNyasZMU+iVLKv9NLJmzoPl602xVlnfaOiPSsCEYS3ppn9qF28
 PGY5ptnwud+QPKG3osYRwNZXsLo3yoagbCgTZXzcGpbhsN4nVp0LdEqu1Ff/EInnYSLD88HdEc4
 1oGsaJWP2aaJwrg3IIx4FIhq4tpEKNzjEgv75ysDuTAUAGK9Kx47p90gYk1QgzP5KgmrkNz1wcw
 j9i31txsCrOokd9Dzjt1MdFXXf2YSX3JtXBe66dcPfnEFPiFKFXbpyJyKRoJufoS4nWTZDkPaMA
 UGJAeNFJeYqfllBF2J1BHEGbsMUbmxCl6PhMA/NXKhyzlbSGjg66h1MIUCSE=
X-Google-Smtp-Source: AGHT+IFbdmB4ufECA28jr0BbdHbDeThrDWfYx88tyZDXeND12WomMShWFSN6ekn8OmcS9z4QIPyL/Q==
X-Received: by 2002:a17:90b:17c4:b0:31e:6f0a:6a1a with SMTP id
 98e67ed59e1d1-32515e12e55mr7616828a91.3.1755941337792; 
 Sat, 23 Aug 2025 02:28:57 -0700 (PDT)
Received: from vicky-pop-os.. ([2401:4900:8fcf:2a2b:b058:4b01:1a76:84f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3254b9f3a06sm1766630a91.28.2025.08.23.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 02:28:57 -0700 (PDT)
From: ally heev <allyheev@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, aric.cyr@amd.com,
 aurabindo.pillai@amd.com, Syed.Hassan@amd.com
Cc: ally heev <allyheev@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: amd/display: add num_rmcm_3dluts param description in
 dc.h
Date: Sat, 23 Aug 2025 14:58:47 +0530
Message-Id: <20250823092847.53330-1-allyheev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Aug 2025 10:03:57 +0000
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

Signed-off-by: ally heev <allyheev@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 59c07756130d..87d323cd79db 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -234,6 +234,7 @@ struct lut3d_caps {
  * @ogam_ram: programmable out gamma LUT
  * @ocsc: output color space conversion matrix
  * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
+ * @num_rmcm_3dluts: number of RMCM 3D LUTs
  * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
  * instance
  * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
-- 
2.34.1

