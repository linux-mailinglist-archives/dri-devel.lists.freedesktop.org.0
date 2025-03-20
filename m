Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87BA6ADB0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE1110E6C3;
	Thu, 20 Mar 2025 18:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eprbrChU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8ED10E6A3;
 Thu, 20 Mar 2025 18:53:48 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-85e15dc801aso94064039f.2; 
 Thu, 20 Mar 2025 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496827; x=1743101627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//eNVK5QvyJuFs0uWvNcaJY74v2ESo+w6BQZ02tQwac=;
 b=eprbrChU6Q28hJx1Nhrj9F8BSZkJ8x8aU3S4UNQjZPw+rBim4yzOYLKd2e57OFa/dE
 HQbRJPySFK6OrdbOTIMXus2kSWkjufIRrPZVIEZtgC2ZFJkvnGX9tLjAIkUq0sNrDZoC
 jPIw6lmUq/ZiJaoXqJF4AVboyBRLE2GipBdhy7//Lh+fkqrsYDQUqvStz2qF0p4+z7JZ
 eOA/hhMpXGtuXl+uCcKMyxPbwNUZnC7HCrw2YY7ib3j3oAw0Gc8jBfgqzuBjE1//Cg95
 etwnJioYzAOLrxihqRZQLHUF117A3Fdl/rK05JUFYuFDZUJlx9rdNYI+kF+/SDmkTVuJ
 hqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496827; x=1743101627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//eNVK5QvyJuFs0uWvNcaJY74v2ESo+w6BQZ02tQwac=;
 b=SRJ+B75MPDDMIG7RK3V/a1XbIHfIDGg5PWCuwXUMkH55WKPCN3KQ61/Gnn/D95VPep
 EA0m4kjzpt3OtoS7JZO2Py0ctHxO8YuTgrHIEeAFDkOzsH9myPIk7Aip4FsPksdOG1IH
 ccde5UBpZ7f8qc4+EFb9Sq00yI0I+Sp54TKnaDhjXXKxZnqwsQO2qfIhDARdiHt/PGGh
 t5Orw2JqV/0OdUfiCTP5KrlbBGQDV8O4EfLX2A1cs9Ce675eiO9RJVKekfbpmtjsNOyR
 yY5Jr7RfGris0H/v5jE91d9ZTaT0GM33kXl0LdWuhQ9fQs5S8nBiHKwiAaEl7Qbo+6rG
 gNlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Y9sS8Kj9jvj/cFAGixABL2B2BpSyrwqRzjQsWGCLM3UH2eCxnkCn2VKo/ZAqs8ScM1Ci4L7aS9JT@lists.freedesktop.org,
 AJvYcCW+6UnaN8PYkorG8KqdafneXvKXkTWZIqj0AGAbdiQmVvkKSylh/IvLLZic9MeYWHZ0JWFES7YY@lists.freedesktop.org,
 AJvYcCWkfEhwr9LpHYYu4q3zkoaSjHoM+JJeBXX55BgqUVg0wHbCH5HeYrW/kwD1r/jFOQTaxHfdHJOAU84KYNGNBdbEGg==@lists.freedesktop.org,
 AJvYcCXXTXBG+KbAejr+jIKlJkXxiqD9I8TH11vMy2WXvWYz1nHlI34HT7uWgzqZ8rFtgl74HJ9LG14rD0kiVoAlYw==@lists.freedesktop.org,
 AJvYcCXuD8dkeyhmNH/jacPy9I7X8ZuQ3VMVTdvjLWNbUU8T2FlC/4YKdgvxCFGLDLHsBB6uF0I8NN2pWMt4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB0OZTEzMJcds6Snjk0Mh2++eGobfmlTpBavH5SVD3lUrLMwlL
 UCR8+fRB1d1/JY1sL9N8tcKZatQK+rfUXgrM8OIZ6BxWRUMzejr0
X-Gm-Gg: ASbGncsGJE6ZABXk2rv/Q7DaxHlfl9owrmCCloyWwhHxo/KBP/sIWJVcP3OAvJN0N0D
 ZRVSRvu8CoPXh+HkKXjZTNM90puh+oRIhM8h8dAn6SdfosovChMv0B5IRDvv7t0HS7dZ40d1zVD
 nlR4i0f3e0QUgUr3efuuioI4QQQuoDUIqLeE0/oqOHdRzMtJlx6Kj/fMusQ9E5DR7PRlaioGD5n
 1NJX5r/vvnBZHKWpUzcteYupDVr9y/0keIwWgAqv3Yo1b9NToVWo4KhPJ4LeTY7o/A8FJ9WFBi3
 5yNBAXmx4mh1baOgAyqF1g2UNZ/BOyfAZ4uFsyDnF5sI6RgEVlUII1xWwATc88r/IuYDdIsV/w9
 4A+U8SbRk9xgX
X-Google-Smtp-Source: AGHT+IFFpgYTl7JZFiyS9WTpaidYWi/5SdS6fsq/viN+YEp3rM9RCo7TNcLP3VJ/VtmR/8cq2dJk2A==
X-Received: by 2002:a05:6602:3e89:b0:85d:f316:fabc with SMTP id
 ca18e2360f4ac-85e2caa92d7mr44469839f.8.1742496827493; 
 Thu, 20 Mar 2025 11:53:47 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 38/59] drm-print: fix config-dependent unused variable
Date: Thu, 20 Mar 2025 12:52:16 -0600
Message-ID: <20250320185238.447458-39-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe30204..41ad11247b48 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.49.0

