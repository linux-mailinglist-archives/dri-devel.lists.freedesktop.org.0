Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1148235666
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5D6E0D6;
	Sun,  2 Aug 2020 11:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB736E0D0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so36730811ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6N46LpxOxVN6dAnm9F7KtaktSmWE/xBhpj2MxaGLjI=;
 b=XOTYNuxmvR/tnD0W5idQ3uzdSm6UGDVWkKcrJTTvF0lSxDOVljNJMUAO0rNu6Y0iPO
 epgbdz5C6zXmFkTCfcOtxR3xTfJZPa8itWyOGhOapK6Q1zmu//ys9sSjyX6Tbme1/wtM
 kdqZnyldmeiIw37dfmXShp4HXWXPdMeJZbtmzVST1/pjPw2KbedARgt9Ctk1NSbEYffy
 ocheOzLTFaEyuoq4cEtPqZNZyBzCgFzucyMgeklHUkmHbhtpSyAIIZM0hlEDMNTmbpG7
 fqwTPeC114qLjazKYQ5EctkAeCOixJJq/GAFope+B0GIpD0WPkOWlY8qZDDLXCGwUhfn
 Lk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N6N46LpxOxVN6dAnm9F7KtaktSmWE/xBhpj2MxaGLjI=;
 b=aMYwZfi7ZlOZ3Xdxgqjz2Y8WmPK5QOFc2Axb9DL2rtKIdSycijwR+VInZ5J2Ltrodc
 1Jq+O6+sBIwpNUOv2VRbYc2U/UzXRodQ8MDE2DmPJjYfMWPs27J2VmY35Uok+idJF8/G
 R2nl9k470vtn+D2UVJYFfK9mQUAgdBi4VZ3y8rW+xzCEZEQf9Nq/vsyFInbnuNEzoplF
 cIC5WTOrxrAzRYiPQ5umgIzTJFrLgTqokGCnKycM89jt7ZGbG+4kZeKr4rzoUE6iaYif
 aigS1qViePEExPFDZlfWfgnzniFa489+cjr0el9gnt78HUwW15CAzTnwM28k2JEAwNdj
 dhQw==
X-Gm-Message-State: AOAM532EFGtGrWUFiEq0tNfi0YIKxUbuC4Gfx/YqyPW96kr652nfraxh
 +5SpqVgqrD/3R1rEj9XdgiOgfr5MndA=
X-Google-Smtp-Source: ABdhPJweQZA0b3cyMvjKG6b71zKlMHPgsZyhZtl/0MSATopfH9rop/4peQ6GnrUvk4fLRdkw1HHLtw==
X-Received: by 2002:a2e:8087:: with SMTP id i7mr5434385ljg.98.1596366433803;
 Sun, 02 Aug 2020 04:07:13 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 01/22] backlight: Silently fail backlight_update_status()
 if no device
Date: Sun,  2 Aug 2020 13:06:15 +0200
Message-Id: <20200802110636.1018743-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_update_status() may be called from code that does not have
any valid backlight device. To avoid ifdeffery and too much conditionals
silently fail if the backlight_device is NULL.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a..190963ffb7fc 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -348,6 +348,9 @@ static inline int backlight_update_status(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
 
+	if (!bd)
+		return 0;
+
 	mutex_lock(&bd->update_lock);
 	if (bd->ops && bd->ops->update_status)
 		ret = bd->ops->update_status(bd);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
