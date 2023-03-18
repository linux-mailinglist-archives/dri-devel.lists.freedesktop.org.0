Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE86BFA4B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004610E0C6;
	Sat, 18 Mar 2023 13:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E8510E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679146802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GsfqRJutAPaYkw+mcXHB2f4v7VoNn3nM+/TXvQ7dbeI=;
 b=JkExFvj/F5GdTMaeK1tW+a66oHLSfeEYaPNX2mnwtYFP8oiaRhpwi1rW2CGkpqEfbGbEIA
 wG8GZl2mQYOz6eFdMppneO3bfTKXT9hhe3A0SgEAwoiaSfsn/1oGhtxLYLRZ27GLXCSw7d
 O4qLknOJE6Pa1GscsSqJjrxx6ZGJrD4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-2pfzxwSKMa-r864JRC9z-Q-1; Sat, 18 Mar 2023 09:39:56 -0400
X-MC-Unique: 2pfzxwSKMa-r864JRC9z-Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 l16-20020a05622a175000b003d7d7b8136bso4039926qtk.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GsfqRJutAPaYkw+mcXHB2f4v7VoNn3nM+/TXvQ7dbeI=;
 b=XvUqVDkBPqUIdZHA+axAcxuFkGvZ0iXPQjdPbMC3f8HFg+qvgGJhvNCMhTGsYTELAE
 vL/x3APlM4NpVmdNrH3I3EdPPIrd9YgACFkbhRahfLslFUWeAhvCM7vGA5qC6d0lW5iG
 GXs0+s5X+4HFvhAshrXv/a8rvc+8MNjrYcpYYXzGu2PFW2iJjg+Eia8cznMcMe53jH1K
 ieDSAGOzaK+Jdbe1AdiUB3Qo5/r0QhFzkgHGQvgE+1bN/d0HMiStAk7U7wkqVOa3J5bT
 QVHuVkWICfdRk8R7z51EWs82cvvZKLiWCTldIMKO2/PtekbGXkez9/SDpJjYjkwyh8a4
 Z/sA==
X-Gm-Message-State: AO0yUKWCAXyNEyBJ7S4tZqa1ay/a6nj/756jsSKab6zSGWfMMJVjqf+c
 ke2Rub1/HkdpVCaaW9YtQ/IBpui2EBFvK3kCidrn+ci4qDpOtCWF3eDNFUS0NBVIrHxJ+SM+4M4
 h2k/xYD8e/KLgfpobvM4ruMW+a0CV
X-Received: by 2002:ac8:570d:0:b0:3b8:58d0:b4e4 with SMTP id
 13-20020ac8570d000000b003b858d0b4e4mr18584489qtw.33.1679146795860; 
 Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8QQWnniMY6gnEIBdfGqTMXXT0qbM1AvQtynJRRUJeJmWSu8y4ycgxOaezT+v9XSCpBKj4WQ==
X-Received: by 2002:ac8:570d:0:b0:3b8:58d0:b4e4 with SMTP id
 13-20020ac8570d000000b003b858d0b4e4mr18584464qtw.33.1679146795558; 
 Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ac86990000000b003bf9f9f1844sm2999664qtq.71.2023.03.18.06.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/kmb: remove unused set_test_mode_src_osc_freq_target_low,
 hi_bits functions
Date: Sat, 18 Mar 2023 09:39:52 -0400
Message-Id: <20230318133952.1684907-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/kmb/kmb_dsi.c:822:2: error: unused function
  'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
        ^
drivers/gpu/drm/kmb/kmb_dsi.c:834:2: error: unused function
  'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
        ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..ed99b14375aa 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -818,34 +818,6 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, u32 dphy_no,
 	}
 }
 
-static inline void
-	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
-						   u32 dphy_no,
-						   u32 freq)
-{
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[7:0]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
-		       (freq & 0x7f));
-}
-
-static inline void
-	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
-						  u32 dphy_no,
-						  u32 freq)
-{
-	u32 data;
-
-	/* Flag this as high nibble */
-	data = ((freq >> 6) & 0x1f) | (1 << 7);
-
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[11:7]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
-}
-
 static void mipi_tx_get_vco_params(struct vco_params *vco)
 {
 	int i;
-- 
2.27.0

