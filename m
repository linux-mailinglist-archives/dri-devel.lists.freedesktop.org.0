Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81D1621BF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326F76E15C;
	Tue, 18 Feb 2020 07:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B11A6E978;
 Mon, 17 Feb 2020 15:02:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n10so18176232wrm.1;
 Mon, 17 Feb 2020 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Quwm0G/LPRvhYcMVajShysZzepUfBcFiZH554x5CIA=;
 b=ZIoKyYsyis5oKCP8oNupoyeCO7/eAm/cAVvfyyV3jHBo3E0EHe3b/DsdcxG/hbybPx
 0yJyp6frpqPLEtF/8wwN6MNVEULKBaSHiC9ggJMSeN1R5Ty5JRiX2fXHSJ5mggib9AbB
 Ab2wmyLZBN/Vbd7oEFIWURSI0NNXkYCrI/LGRmvrKFp5blTkuBONNVTRLqoMJnCb3M9W
 ozNRqFzWhbZanva4KuXdJO1TYHi8Gjev5CJUmEPzUcx5QQr/c3UwyzlgC+I+TKqaW2Mk
 mS6MVI1rF2n+yOtJd9Ekp8KTGAxLDZ0SsPSJhTggx23Ih2ssq/a9aw/QcVTPEQFtNGUy
 zrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Quwm0G/LPRvhYcMVajShysZzepUfBcFiZH554x5CIA=;
 b=qm+mLmitP1zAnslTvKLJIEWOV9Kc3C227bf8iMIvxp+bRrVoPe0JI+NjjwSbLwsTbI
 x/Dugyk/UMg06+S68FTUtIZjTJl0TbPs0mBnV6eVCoeg4teuulhN66X35YPIteYQVFVk
 7ix0dzn4pLzY1R1X21+S50WHML2TADQ1pDNDhX6lj38oSW2Hze0NDAb1OccENG1g8Uqr
 Pu97mnxcMl291/upXJ41zlJKMYo7xJtqZ3T81bJwv6fJgzwgG5X/9sNgQ81T1m2SEjh1
 kZxIZQbB/RlJHQQywx/TQyew7xBglI7bTDi/l96rKEha+i2Z4DJwCq8aBCiD6ohSx0CY
 d9/Q==
X-Gm-Message-State: APjAAAVDtTV0WnZyV1QW06azExxNBBrKPK0PUa5M+eLgj1CffFonP+WF
 6Q5TLVuvubaB71wjaGl6jvH1a71f4+CpZg==
X-Google-Smtp-Source: APXvYqxFiLz+/s1//DSQkf1mgFI5VxAUe1/eIIpMK8gpKPQB/EVGTKYEcunByvS2bcSBzEOS1RCQ2Q==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr22323875wrv.414.1581951733662; 
 Mon, 17 Feb 2020 07:02:13 -0800 (PST)
Received: from brihaspati.fritz.box (pD9566D64.dip0.t-ipconnect.de.
 [217.86.109.100])
 by smtp.gmail.com with ESMTPSA id j15sm1441099wrp.9.2020.02.17.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:02:13 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset
Date: Mon, 17 Feb 2020 16:04:25 +0100
Message-Id: <20200217150427.49994-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217150427.49994-1-nirmoy.das@amd.com>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate GPU offset within vram-helper without depending on
bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..e7ef4cd8116d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -214,7 +214,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return gbo->bo.mem.start << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
