Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680117B7EE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED316EC7B;
	Fri,  6 Mar 2020 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467789DED;
 Thu,  5 Mar 2020 13:25:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a132so6303559wme.1;
 Thu, 05 Mar 2020 05:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHh2XovPyX/BvR8zXQnoEBn2BLqmrZNJbq5eph3/YOs=;
 b=W3sq30PSsv72CW4h5CN6mZgFrfMo0JgQ9WRPqwLnZ01JfhWFOClkqg5hGoo2xZHSAb
 pW2mZruv9MdMllZfmXgdn0P3c/KrNiW5pJANSAJORnYyuvN85R920biRUxxiC813ga11
 //yZBLzxrz3GvQ7j5MxTJPhb408CMFDG/+rRA1ZnQhDYBWsIC67bF+McyOlTzHJEDX1K
 5rleM8uUE1QUK2CK2Tgi4LQADAkAN2fO2rWRTKomPnKAES9gnB0RsgY4hS6yKtP89IQI
 m5lBjn4M/AeewxpqbBrOB9MJZBmv+GX3ZQQdbacqXga7wSafOFZqjRMQPu1n8tggaugc
 5MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHh2XovPyX/BvR8zXQnoEBn2BLqmrZNJbq5eph3/YOs=;
 b=NY64JE3AnmiYe1m8YcQhMP8hcsDgeh+DkFUwCpdEaoJD1UeeBZA0WC0LT3fR1MnqYp
 V2nWHPvlp7q9lJb+trIujgxksneSQ17XtozZ0+Gw07JcCfnZZ8AMh5V8SPPlGmlaeOaa
 yfVEiCNk5+7KopnwBAXEH++i19papU/TMn9+VyNo4NACTBrffPYmrPzXzswtL3hupTez
 D6fQalX5WMHZsYTv7hebwBPfEPD8iajHT5eGeAzHiOlgPMN3QdHGmupbfSv+/AuM6rO6
 Xj2ieLz+9V7uWy7iv1ovDkp1j05ztmueyEcfb9E0p/49N+aeuGnRezfUOi4F9FQZ0t9S
 QaAQ==
X-Gm-Message-State: ANhLgQ0Q4SbuafYp9KrKu2RYV2kkjAWl316h+R57CCws6Ekpp0eKc7cl
 AWHf3Bvw+rwqAWIOPIQ53e4lwVwfK1CSOA==
X-Google-Smtp-Source: ADFU+vsOPx4rIGpdmcABIFmnpsBorWzdV/O59dvsArq2BWHNb8sR290Bfhi9uqGso1fryx+KAuCaMA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr5454551wmm.91.1583414757944; 
 Thu, 05 Mar 2020 05:25:57 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:57 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset v2
Date: Thu,  5 Mar 2020 14:29:09 +0100
Message-Id: <20200305132910.17515-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200305132910.17515-1-nirmoy.das@amd.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch over to GEM VRAM's implementation to retrieve bo->offset.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 8066d7d370d5..18d2ec34534d 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -29,16 +29,21 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			       struct drm_plane_state *state)
 {
 	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;

 	if (!state->fb || !bochs->stride)
 		return;

 	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+	if (WARN_ON_ONCE(gpu_addr < 0))
+		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+
 	bochs_hw_setbase(bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] + gpu_addr);
 	bochs_hw_setformat(bochs, state->fb->format);
 }

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
