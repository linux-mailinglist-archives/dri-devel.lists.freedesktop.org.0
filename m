Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFFA65425
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF1B10E413;
	Mon, 17 Mar 2025 14:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AjGyE9Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CACA10E411;
 Mon, 17 Mar 2025 14:46:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so19371255e9.0; 
 Mon, 17 Mar 2025 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742222803; x=1742827603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HEE7cJguboNfIM/ImN+bEQAuxRuRsoshNhnvPdF6CRk=;
 b=AjGyE9HcMQKZAwNLHxPNkfBnhSVdHuXZ8gCPAdXVH6RJdn/gfiBSCOlAJTCzSj8RIp
 sePsy5ApPMUyEubhGCOL9b0UhyIKB0xqRhc6mbHKKocXAwdobMcHNPVoNJTJcQ2QLtpw
 6PqRAY9PFGNtzdpg59O5rjRwPwwgSoswo1/altU+FXX+eksOTab9MShq88rYy1MH/6dq
 qU3zZh+sItjsiMmmnadJBmyU5MGsBX1oi7ydPbuBrEki8u8ARZjxMU8yEc9SJMJFkg+M
 RS8RU8EBEZiOWARB3nzrwfGa7THZj9OgMVIRXjSIdtuIutdAqJtecrZuF3uG+W73mgNQ
 H5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742222803; x=1742827603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HEE7cJguboNfIM/ImN+bEQAuxRuRsoshNhnvPdF6CRk=;
 b=CVHoXuLnwOm8vJnKz0tn3mT0MJlwguwM/KRBvpY4ryXelGKFFvtAEQPSNRkOs8xnsU
 JqsuCcJz6FdhmbEtNWnWdfMaW49kQAZPWBhtZda0ZXwYaHHrbTncpS34Gqet+HIfETfB
 pyBUttOwS1spQxGeVXAE6BF6MqtLVSvITU/PdRg4+8MsI2H8eouSOzlVThN3BH3HQJWi
 z+X0/XmljL26cOelvqfyuhHxx+FVq8DVpOZ4OX3KqVyauLaWgOjoQqUBHcoFw2msaDNB
 01fh51hJ1LOqSP/Qy5OLaPdZhV/YXrArNPmLkhbhkt8/qW05qgH3KjWvXstCW1GQRImS
 pV8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAPR0g4hjROckhb1jdFeSgbOZiWgPBLQPyBbOGlmB0Hle4tO36iJz28bfF3uhsGKdboG/uPvc+Nsg=@lists.freedesktop.org,
 AJvYcCWqrzxTykRfmJ1Q5FaAnD5icmBZFpQjF0LU7ZdMmK4Tx7JDIzGE8/s0Pqp/Ta7pHUryb579aWa9LuNl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4MJ+El3L1GH+4LCnAF3OW6AZFxlaEUJvsjF0NVOIOgAfLCQV7
 TorOOoP84iCsmqDZYSaaGs3c4w2HXL/zm37+gvhdSw+bGTb9DoNT
X-Gm-Gg: ASbGncu2egqDxLLiVTg2JZeCs0zV/lZ4Hp8eHijzAMsdEqApbPkdBxdTcyU63yD8mYw
 9HPu8g494Mmv6J2N4H2YQLJ7+1KKfQm5nG3sciPIXFGpMyukPgPFatU2n1pABukbmS6eUqHr33I
 umBUWx2j9/drpTGhOeJKFOuhBsdWV4f7Z0rdKhonVmDYTMfgCQ3jBbXUuqDc2NpVBASrA6Mah9y
 F03W5dXp9AMrI+n6AFFBsAnn4ft5TWvhdncvtOH2IoFpAxmWKeWm8DXIL3qHNpyyTg+pivFiaok
 Det+rK/2wODtXQavk/dgEH8w94z6qH1HOHvfMxYM8vfR6w==
X-Google-Smtp-Source: AGHT+IFivRZ2EUR5/RimYhdOCuEzRooY6An887/W/KkgBBJttW2RvsoNsxmtBckobWqWYaquB0gK1w==
X-Received: by 2002:a05:6000:18ae:b0:391:40bd:621e with SMTP id
 ffacd0b85a97d-39720398fe7mr13511129f8f.44.1742222802524; 
 Mon, 17 Mar 2025 07:46:42 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb7ec14bsm15130948f8f.100.2025.03.17.07.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:46:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ice: make const read-only array dflt_rules static
Date: Mon, 17 Mar 2025 14:46:06 +0000
Message-ID: <20250317144606.478431-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the const read-only array dflt_rules on the stack at run
time, instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c        | 2 +-
 drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index d40ee1b42110..7f4102edc75b 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -62,7 +62,7 @@ static int iopagetest(struct intel_memory_region *mem,
 		      resource_size_t offset,
 		      const void *caller)
 {
-	const u8 val[] = { 0x0, 0xa5, 0xc3, 0xf0 };
+	static const u8 val[] = { 0x0, 0xa5, 0xc3, 0xf0 };
 	void __iomem *va;
 	int err;
 	int i;
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
index 1d118171de37..aceec184e89b 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
@@ -1605,7 +1605,7 @@ void ice_fdir_replay_fltrs(struct ice_pf *pf)
  */
 int ice_fdir_create_dflt_rules(struct ice_pf *pf)
 {
-	const enum ice_fltr_ptype dflt_rules[] = {
+	static const enum ice_fltr_ptype dflt_rules[] = {
 		ICE_FLTR_PTYPE_NONF_IPV4_TCP, ICE_FLTR_PTYPE_NONF_IPV4_UDP,
 		ICE_FLTR_PTYPE_NONF_IPV6_TCP, ICE_FLTR_PTYPE_NONF_IPV6_UDP,
 	};
-- 
2.47.2

