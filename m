Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9389A08A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041D10ECE6;
	Fri,  5 Apr 2024 15:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Jfn/soBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F42510ECDB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:03:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e2bfac15c2so13523965ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712329396; x=1712934196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DS0VVZvbIZOzvgJdpngFNsbKnS413GQYGLPC1MauL3k=;
 b=Jfn/soBHnHvo+yXmxI0DDTRCJ64vEQ/HyAh4WRfx56lQjSfofmQROzr+NILO2wU6oA
 /zPw552se2sspJnoN1kK0TGvKDXt/EgWuR/yJ6XjQOL1e2OWuAj6lxdnCJ0BmMGjoeql
 svsT0v4gKLdCtvKecmG4CdvtoFjb2iNhy5Im0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712329396; x=1712934196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DS0VVZvbIZOzvgJdpngFNsbKnS413GQYGLPC1MauL3k=;
 b=krQmseDUXBceTh+7iW75n9B0/oNgjQsdmQH7YKl2sIt8ZJBMuMgdI96z7Fme2Ob3hG
 OOjO6rDld+ysT7aX04SHtfqoeGeTLB3/vtCEdBMksreCSP5DCW8PmpD2W+eJ9fHouFkC
 RJnG9HlPZfUaoFl/rOSShO/Ve3uhuBi9RO1CgprdRFV+8IEm4/0CB/jJa7ObEQHRXv6e
 DZ66KG2VCMVaPT+AboPkUoQsoA6kwJyd/v/0G6hrCMRkesXJoEsEV3dhiaxnH95hfYDD
 duNN63AFxY+Q7I0D99hVkqMctecWoA+XWQYZ8/rsjYxscvYV9R/tYXjd5yWMDU/P57qf
 zJSg==
X-Gm-Message-State: AOJu0Yx5W5ZsZKpGY9w7P+AczdW6Q0PDMhttMvix53bcK3+fGVyVPc4i
 dqRq4y9rafQHul9aJD2KiWx2Qvrwk9gl206+/I882yHb7fG/cMIv3YQo7aaxLCK8a1mzXRHESif
 09mWsK+3qDppqc4MmmY9znZmn6oWHe7xd6AIP5wvtDAiXD5sXdLsnfsvt393T4XkE1chPqF/GeH
 6f1IMbf650lTq99cEsUE1cD4BuAu/Dn4F9KuTGbUtCHZQz0b9V60cHe70=
X-Google-Smtp-Source: AGHT+IEm1RWL5J3li8ZFIxACZ9U9J1josIzuaLBcG7JV6BAY3xX+NEe5ik8qvLJPXlpPs+7xjqv2Gg==
X-Received: by 2002:a17:902:f706:b0:1e3:c32c:a0fe with SMTP id
 h6-20020a170902f70600b001e3c32ca0femr2137102plo.36.1712329396490; 
 Fri, 05 Apr 2024 08:03:16 -0700 (PDT)
Received: from localhost (99-151-34-247.lightspeed.austtx.sbcglobal.net.
 [99.151.34.247]) by smtp.gmail.com with ESMTPSA id
 f17-20020a170902ce9100b001e219142f18sm1189888plg.114.2024.04.05.08.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:03:16 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/vmwgfx: Don't memcmp equivalent pointers
Date: Fri,  5 Apr 2024 10:02:45 -0500
Message-Id: <20240405150245.1797-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328190716.27367-1-ian.forbes@broadcom.com>
References: <20240328190716.27367-1-ian.forbes@broadcom.com>
MIME-Version: 1.0
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

These pointers are frequently the same and memcmp does not compare the
pointers before comparing their contents so this was wasting cycles
comparing 16 KiB of memory which will always be equal.

Fixes: bb6780aa5a1d ("drm/vmwgfx: Diff cursors when using cmds")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
v2: Fix code and commit message formatting.
--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index cd4925346ed4..ef0af10c4968 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -216,7 +216,7 @@ static bool vmw_du_cursor_plane_has_changed(struct vmw_plane_state *old_vps,
 	new_image = vmw_du_cursor_plane_acquire_image(new_vps);
 
 	changed = false;
-	if (old_image && new_image)
+	if (old_image && new_image && old_image != new_image)
 		changed = memcmp(old_image, new_image, size) != 0;
 
 	return changed;
-- 
2.34.1

