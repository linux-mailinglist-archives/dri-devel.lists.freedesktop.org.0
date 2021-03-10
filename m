Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C53349D0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E846EA62;
	Wed, 10 Mar 2021 21:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332236EA62
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 21:26:12 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d23so5925285plq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lBkH4s9QIFi/iOfDbo7D41TknrqRaGZVMWrDUMYokQ=;
 b=HHQeZE4sWnCtGdS6Anh8yKHYAb1wL5ym/xjWD1rb7A07HSChExtdsjq/vSYEJBgYhg
 amEFkPjgP2abhcZ2npZ7b6UuLafOG2Rq2JnDrEK/Lb5+ct6EISbzTX7bTqjOhPeDXoFk
 RuK9+NpItzK/feIOBr0JfIDN/koNKRtE0gDCRoEZqdVeFaYckb5YwlB2ezBWe80k6aeh
 v+tJDUpjJ01Yl5q7UYQEdHEafLtsN850/43EB+Lyq2cvdxlzpPcEfoxfC+KDwIBRCToQ
 kErBgZLkJzrGEBosjnG1DhV+MyLvlzHPnO1M9rP3F8cyBw6yE2/ahoPQkIkBlhJIohtD
 aVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lBkH4s9QIFi/iOfDbo7D41TknrqRaGZVMWrDUMYokQ=;
 b=GDyxpAC3UYsA9CJeSu7+dACVojB1WxJ184M0L8gWDDtOgR67VlNZbPSr3K/vds9vMA
 FjuToOtnMhiBQrzB2Yt1aiYJkQcB4wNAh6RUfNMRR+9eAe+ynDIKrnied2pENSHqbPa6
 CD1OuPvN3XsZ2PM2+BT8SaQIky58JS8xw9zRA/csUj8qpT3r71iFjdQYyODqMfvsojur
 1haMebPuq6pvOku5LBCa+Z1vc036AGvvBY5U25yLRe2xc+ljUMKQPebrgiwQ1MAkmTFp
 T1niyns+sBcxqcZ6GNFao6sVF/bW0W7u16zQ7XSvbDRMiPiFHA9g6pLknOCWnU1gAygK
 YY3w==
X-Gm-Message-State: AOAM530xGr+HAq3Sv6fVrC6C4pPZK1/a6M+Mdy8YDvuR/zbTBMqCmxxA
 hPEIkGXkRAEIh3Me3TaNq9IIwA==
X-Google-Smtp-Source: ABdhPJxefkypTUPBPBlNN3jdgUzaQb0GT689vmn3Ky4H3bMndfkSB6hEpai8+laPqEIaHIBpE+1xlQ==
X-Received: by 2002:a17:90a:6c22:: with SMTP id
 x31mr5597440pjj.213.1615411571594; 
 Wed, 10 Mar 2021 13:26:11 -0800 (PST)
Received: from omlet.lan (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id h6sm371585pfb.157.2021.03.10.13.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:26:11 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] i915: Drop relocation support on all new hardware
Date: Wed, 10 Mar 2021 15:26:06 -0600
Message-Id: <20210310212606.766121-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20200507153600.314454-1-jason@jlekstrand.net>
References: <20200507153600.314454-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Vulkan driver in Mesa for Intel hardware never uses relocations if
it's running on a version of i915 that supports at least softpin which
all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
only supported by iris which never uses relocations.  The older i965
driver in Mesa does use relocations but it only supports Intel hardware
through Gen11 and has been deprecated for all hardware Gen9+.  The
compute driver also never uses relocations.  This only leaves the media
driver which is supposed to be switching to softpin going forward.
Making softpin a requirement for all future hardware seems reasonable.

Rejecting relocations starting with Gen12 has the benefit that we don't
have to bother supporting it on platforms with local memory.  Given how
much CPU touching of memory is required for relocations, not having to
do so on platforms where not all memory is directly CPU-accessible
carries significant advantages.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 99772f37bff60..de093acb7721c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
 	return err;
 }
 
-static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
+static int check_relocations(const struct i915_execbuffer *eb,
+			     const struct drm_i915_gem_exec_object2 *entry)
 {
 	const char __user *addr, *end;
 	unsigned long size;
@@ -1774,6 +1775,13 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
 	if (size == 0)
 		return 0;
 
+	/* Relocations are disallowed for all platforms after TGL-LP */
+	if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+		return -EINVAL;
+
+	/* All discrete memory platforms are Gen12 or above */
+	BUG_ON(HAS_LMEM(eb->i915));
+
 	if (size > N_RELOC(ULONG_MAX))
 		return -EINVAL;
 
@@ -1807,7 +1815,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		if (nreloc == 0)
 			continue;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			goto err;
 
@@ -1880,7 +1888,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
 	for (i = 0; i < count; i++) {
 		int err;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			return err;
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
