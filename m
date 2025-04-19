Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A14A9487A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182510E036;
	Sun, 20 Apr 2025 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mw8woiHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E11410E127;
 Sat, 19 Apr 2025 17:47:27 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72ec926e828so797848a34.0; 
 Sat, 19 Apr 2025 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745084846; x=1745689646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l9p/9GPno78DZ3qtYAcJxFBAogUfeTY9SwXa+83U50I=;
 b=mw8woiHWQHz95USCEEf8SjQvbBJUXhnf7y0gVuNut9sh4PNqFfEVkMJhbiXpd2R1Vb
 HXAaxrT7v3uqwRGX0zyztOwnIJKlo54HjDB7LjijXXfxd9y/C1jFpeO4UaeCU2RQPiDW
 AxFw0PFa5+V4uEcpCf7H3EjubiU0qz5yIpdwxuH0xCqBJESBE1CuliOUV+yE+8kvLvf/
 SDPyGIu2UxwH83yKW0TPc42MtA8dPoyv/4dDq9ok8Q0rZy6F+njz0NH6k4YGyHWVqL3Y
 wOGN6xH42HnIbScvh/V4NHC+RKZH8AYPRfV6BmjiSi8Rhs8RNiyRC/WeiUKqxhTvqpWT
 0BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745084846; x=1745689646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9p/9GPno78DZ3qtYAcJxFBAogUfeTY9SwXa+83U50I=;
 b=SqiYm53IXbIEw45PGXCCxIb3+6onYE2S6I/y5vZaPoUjJzy5saqLLw5rXx7DV5ULrc
 ts8WEojGKMiCk9oXpz2BHRHz5ezoAf379POCqJDvPsyL3sb8sgsLFSX/M45OuaO+bxi2
 lm2OGgJS2l1BA5J38fDYHJ3LBT8cUXbBycrZMYfr53/0VlPsJsDj0QCVpL+8jHwymfe/
 BDt6KN4YUEh+5Hp5/HvYzRLnR+PR4Hy0slHLg38w/A/s1uITJv4ZM+1yye1Jpzhmix+p
 F87Ky8/s/WzxLpmlnTaZ5+m/4DFwsw9TXUtIJ5gM6+BE72BriXRAmEJ6aeFZqzaEran3
 Kegg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvSEDzHYyq/RW++6BEFS47xGguh00nBJTcEB4zSemCjMdr3kzvKGJMZAEG7/1SHZPZYjwY66Hgqpio@lists.freedesktop.org,
 AJvYcCWRA/eu5rcY1vTsHaHJ6m0mB/uJ9tCE+xc8QePv5WcMRake2vOc5DObPHFqkb/AVzX9pOGVlazV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqhIFFrJEvvl0R3/Wz/hUIBSQC3RVmqVaC+5pSfWkYQyF/eXfX
 AFz15ckmU71+OHJTQeKxSGipi5pZqBILLTV3cvglDvYzbFrM0I0Q
X-Gm-Gg: ASbGncsWshwLuyNYfQT+t0IKUCxcNqAxW72J4uaQnRvApwZT/Fxa2fgSnDg+3Tkxgm+
 i2JZBaOtAKPZwUji8mYa09GKP8CZ/NB152TMKZScK6GKS+5vVRNpCf5/oScD3A5tKN2U82SIy8V
 aFirSBdmf1/MXqUccoQ+92geFlqIV19BRnFOCe5vfuSNLibPQLXuOsf66BEE3XOyPat2dA7hAzZ
 vVIxl+UsozWTS37E8+ZTOMdmh7ZZn/QFpx4MgB3iZ//VoS4a2cFZKQY+vHj036NYlrHT0HUiS9e
 5mATvwMfakOp8p0I1fFj4OP3FaD1bPvZiMEcu1/WNf6XpVSbb4PijvJfC8xsO8tq3w==
X-Google-Smtp-Source: AGHT+IH7fN/A8iC5n1j7ocQhspXTJ6+h7siteXgS4p4hgqZk5bAH4bdltKLh7cf5EfIBHx46fSjAIg==
X-Received: by 2002:a05:6830:3696:b0:72a:327:eed3 with SMTP id
 46e09a7af769-730061fb6d7mr4115147a34.5.1745084846232; 
 Sat, 19 Apr 2025 10:47:26 -0700 (PDT)
Received: from c65201v1.fyre.ibm.com ([170.225.223.22])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-730047af85bsm773268a34.19.2025.04.19.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Apr 2025 10:47:25 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, mario.limonciello@amd.com,
 aurabindo.pillai@amd.com
Cc: boyuan.zhang@amd.com, sunpeng.li@amd.com, dominik.kaszewski@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drm: Fix for kernel doc warning
Date: Sat, 19 Apr 2025 10:46:08 -0700
Message-ID: <20250419174608.20993-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

Added colon in kernel-doc comment to fix the warning.

drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.43.0

