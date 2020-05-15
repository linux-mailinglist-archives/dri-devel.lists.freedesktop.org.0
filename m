Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00621D4A11
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746946EC51;
	Fri, 15 May 2020 09:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D56EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so2826383wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2hpR5BlKVrSL8pXvdb6OTJd7fNOfL1/0b/Uy+6KfHds=;
 b=lvxjbktC3EgRszLqHdH/mNl+iP9qoI5NFi5aMNpTEVQ0GxK0LYfpDX2kM7aBbtu3p5
 w9ZypiEW1GISvhKxADZ+y+w02gav8WCewdeqdRbfxz5Eo03NPrnZ+lCKZ+o5EWTLWcwm
 BteM0sZjnTDNEyW0rQY9KnOC2hPh83HtE45btFJhgJ8TahFzqlNlZeN+/5SV67fyov0A
 lJ6lnH8SB8UlyRbtyr9H3M5qi1E64O0qNHTcldvAbK6IqqJ2SNuXt2fosoDkXTRr4DOE
 cYIvsHCVy/rfYPrEI0s1s4lpWnlw8G0YcZq41V7tr5nfNeKVo3nZMMD9Cg6PsghNGTBa
 aktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hpR5BlKVrSL8pXvdb6OTJd7fNOfL1/0b/Uy+6KfHds=;
 b=k6xMJTx4zdkUwRZn+rkrTExuY/yumWf/8m9UOHvrbQuTK99W6YBlJcAibDO4ywpZll
 whbsWqU2E/1AyrSHakZRU4mEfxqEK9MUfgzEy+0n81653B4VHh6rr65G49Dz5rlqJmCL
 bObVhc9fn2mJ2qJDRlcoMaCF79sNDc8zXx3M8JmXlXuZDXdlnCusoII4lpMPEXl8Uoo7
 H7A2Pl7FaCCTObUlkrqEHsyHYg7l5j/MPP7nfi9LDEf9qfQ43chiKfVRpMpyL1qu26r9
 zrZNpr6CaKjEJv4+nBYOPUwtbVoZoet4GW8I8HDomsSI0Db7uFLikFJ9fBWkG/HvwBvF
 V6jQ==
X-Gm-Message-State: AOAM533/K/+beDgY7w1B+GCaxdoEhJoPUpCpKwF1cJipyVds7rtzQ5F2
 qmQHhq+6HmEitaE+NhJl5GD/MVeQ
X-Google-Smtp-Source: ABdhPJytT/2e/Em5GeNTfM0XvZuqegJyjKmxCZCclpU0YfIGJ3hzFS4F1z2XxLmaNEMVUx2T/c4OGA==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr3237375wrs.181.1589536485817; 
 Fri, 15 May 2020 02:54:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 38/38] drm: remove transient drm_object_put_unlocked()
Date: Fri, 15 May 2020 10:51:18 +0100
Message-Id: <20200515095118.2743122-39-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

As of last commit, all the drivers have been updated away from the
_unlocked helper. As such we can now remove the transient #define.

v2: keep sed and #define removal separate

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
---
 include/drm/drm_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 10c5d561eb18..52173abdf500 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -375,8 +375,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
 	kref_put(&obj->refcount, drm_gem_object_free);
 }
 
-#define drm_gem_object_put_unlocked drm_gem_object_put
-
 void drm_gem_object_put_locked(struct drm_gem_object *obj);
 
 int drm_gem_handle_create(struct drm_file *file_priv,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
