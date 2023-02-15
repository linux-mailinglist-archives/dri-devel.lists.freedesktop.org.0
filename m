Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33B6990C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD5E10ECE4;
	Thu, 16 Feb 2023 10:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA7610E119
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 17:15:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n20so8528978edy.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeWRyuFleO3KJb/h2GJE0oBEJSU8MTaTLYVWy9KfUOo=;
 b=MA5jkvllzwLf/q9wufokoK6xLsdQdp99/0SfHl1GmEntzIlfg1JJuOR9hhkoQVxn8S
 G7JLLT6txnudsMQMxIzGGH6eR9vZ2vke1GF5hssjevc+jcFSIA3nNXj54W4waCikKup6
 DSKLvuov8en1c7C4fPA3bC0u/2sULBoz/XhclqO/fwcBTuFkcN/WHJRqezoXfCPKs5uw
 8A/0gEL6ld3k0KmBDvNRjMHLQBrf3zQ0B4xhmHbphtTEsdKdm0MsinDfLnEPsQDQ6526
 O9618T2u6mtgWWBHHc0rtzJuCh0mCd5V5C7Yx0PHk2hRWhR4wiq+5vwXmD6o6XwhldXx
 Gc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeWRyuFleO3KJb/h2GJE0oBEJSU8MTaTLYVWy9KfUOo=;
 b=FCyOSv6HSFOl4YP9DHyn6NrVqof4Qcv5NjLxFVPjBY97eg3zSpSsYpWh5myw14fDbV
 W45Rwh3XzzdW/WyKOh7vby5kRT0nKgG1cSsF+lqY/y1K0hSo+Uq+OsRa8nFpPUnEGDlU
 mKhEeVaIEWyu0dmQbMZViZ7PUWu+FNYRHLonEx8BKR4QiVWNRbSmUfv077SOIskHyBaF
 paNRqPwvdPlKRbaEu1//5QJdiMFZozw0TM3gtXOz+VzrRxFalfBe8i2oudcmpIdLYnEO
 QCAWb2SrQtGi31/xJDkzOVDnC9zpSjZSls4sLkozp/HrGnl6gYXLVALS3ezrpsf6NYY3
 rx0Q==
X-Gm-Message-State: AO0yUKU9eFIOloki7fdtQ81WBVNVQMOe9BemzD2IqM5Tbj4LSNe4c1qR
 nqnY3yGA0SIRW7JswtsFIyFfgXgqEoud79Mf
X-Google-Smtp-Source: AK7set8S2sHQX/04ttSLge2J2bfBtu0qw81RTYOPWF+CDkB/jXDpM0eYORUQp25j6FguTj6Xh10pdg==
X-Received: by 2002:a17:907:9801:b0:8aa:c261:f2a5 with SMTP id
 ji1-20020a170907980100b008aac261f2a5mr180497ejc.12.1676481352918; 
 Wed, 15 Feb 2023 09:15:52 -0800 (PST)
Received: from alsp.securitycode.ru ([2a02:2168:8bf8:8b00:45ad:97c9:5be5:8b8e])
 by smtp.googlemail.com with ESMTPSA id
 y25-20020a1709064b1900b008b05b21e8aesm7045063eju.172.2023.02.15.09.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:15:52 -0800 (PST)
From: Alexander Sapozhnikov <alsp705@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] gpu-drm-tiny-cirrus: Add NULL check of pointer
 pipe->plane.state->fb in cirrus_pipe_update()
Date: Wed, 15 Feb 2023 20:15:49 +0300
Message-Id: <20230215171549.16305-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Feb 2023 10:11:15 +0000
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
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexandr Sapozhnikov <alsp705@gmail.com>

After having been compared to NULL value at cirrus.c:455, pointer 'pipe->plane.state->fb' is passed as
1st parameter in call to function 'cirrus_fb_blit_rect' at cirrus.c:461, where it is dereferenced at cirrus.c:316.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/tiny/cirrus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 678c2ef..ffa7e61 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -455,7 +455,7 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (state->fb && cirrus->cpp != cirrus_cpp(state->fb))
 		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
+	if (state->fb && drm_atomic_helper_damage_merged(old_state, state, &rect))
 		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-- 
2.5.3

