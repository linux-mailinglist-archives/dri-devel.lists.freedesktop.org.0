Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788319D81B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DA66EB92;
	Fri,  3 Apr 2020 13:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1F16EB92
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 65so8675861wrl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lc/sgnabcKULNHN5SyY5HLhgJ7dwDqC9G556yDcKuII=;
 b=QFvWAeWHCWeMaCis2AkgD3OUyDeP9Bc+MgMkpQW65Wca1WrGU+YYKAfOFCfGZ/lEMV
 aUHiSqEAQqzcaMEwWzwlRAj/oy3HnE2R/iSnxWCYV0R5sPGo9GjfKi5mpCMkUsMF3XgA
 cF6zWCnWbMqGdXdtPfvrVwQNZ/Eiyh4GH+k/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lc/sgnabcKULNHN5SyY5HLhgJ7dwDqC9G556yDcKuII=;
 b=kNaWY5a+5xOBomgTWvflnzLZbvl7I0bDmYBe3ygjnMcXK0heD8JRXw3WqPwK5J/AYS
 UXmxHr23qCIjxtB+NYCxket6w2Eqo1Xmd58dmI6Ar79+z8ZKfRgX8yEm191RzCPeF+Mw
 SuzojZeNXZdTzOdgeYf5hAKZhcpfAsOxcVUIuXWV6SotgLQ/OixW03MZEJZUrn3hzdo7
 Qvd3UdV0KCikzU8qm5uvx+a9xdExyCma1TBadK+M7yLpnLk2T4bryBMtf2tu3mZc25cc
 CMOpHsYOA7HZ5aW/9MEcxY2MhH1LcMiQBwsviVQ7A29RZdHse460i9z77f03GzL6Q0hc
 9QYg==
X-Gm-Message-State: AGi0Pub2dDwyJzU7HLDLdP47AiOzCqLz8BZ+Lx2SzNVJ++mq/1bm1o/z
 In9Q2ro0rlUcs92lJekdpKKi6gLA5U6YVA==
X-Google-Smtp-Source: APiQypKklM6HZV0jy8+ehhTEOe8B2phhWwljtsKMapWpMraHkoHgSNlv+OBBtf1han2toy/phPynig==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr9771699wro.342.1585922318633; 
 Fri, 03 Apr 2020 06:58:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/44] drm/device: Deprecate dev_private harder
Date: Fri,  3 Apr 2020 15:57:47 +0200
Message-Id: <20200403135828.2542770-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had lots of conversions to embeddeding, but didn't stop using
->dev_private. Which defeats the point of this.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/drm/drm_device.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index d39132b477dd..a55874db9dd4 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -88,9 +88,12 @@ struct drm_device {
 	/**
 	 * @dev_private:
 	 *
-	 * DRM driver private data. Instead of using this pointer it is
-	 * recommended that drivers use drm_dev_init() and embed struct
-	 * &drm_device in their larger per-device structure.
+	 * DRM driver private data. This is deprecated and should be left set to
+	 * NULL.
+	 *
+	 * Instead of using this pointer it is recommended that drivers use
+	 * drm_dev_init() and embed struct &drm_device in their larger
+	 * per-device structure.
 	 */
 	void *dev_private;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
