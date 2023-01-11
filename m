Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449EA665F7A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B8610E77F;
	Wed, 11 Jan 2023 15:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977F210E76E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso8174024wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJcVjf8pDC4yO+skqSU0XKC89Tk1zxOfzlV0lRIff7c=;
 b=aZrY9NQHD2THbetIXlgCj7dIm+IHrmHhq7F17hc477mP1n6APHub6Ck2CJ3DzdinLT
 ElgTJWC47fGty6V4ACS9w2xVnnEuSz4Z9Kz+uIPLYWQdsKohf8UMi7KQUG29Hent2GEo
 Jqem0opQMtn8iekTGOrnsTul/w0T9hALDGZaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJcVjf8pDC4yO+skqSU0XKC89Tk1zxOfzlV0lRIff7c=;
 b=rUtslrF4tI8tfhLMvOFwf7o2ysqYOK595cbwV8z6gQHzRsPsxDs6rxDBFvpDEvhbCm
 mT/Bg4xDn7NrVX61co6b0Sfgr/AEqsELwYPsEMaRnoi29cFNBN64K/z2e7+PwouC1Cdy
 38dxxTUtARUpzBAWZokTNUNiT8/r0aw/I3aYJLj7iHSkdIf28Uh/hDgcu5GtrV1wpUC6
 EGvqpFsJGw+RIBUoWO20jU1M40IfOL2mmo8vRd0AnS5Gu6iBPI4IX1D5DQ4385QFB3E0
 kO0Sxb/VQGIc6fGeHkuCwJaP/FoSxXtPyhEXOAbiWsm6V2i7RJFMK22NRqluh4HmbhQ5
 129g==
X-Gm-Message-State: AFqh2krHkSffxbbYNiBGtMzIBYSjfOXzzKHCfbMceF2ONCXz1OLFBRqk
 F4ixbVd4koWOAoW4fuXnWfLDUpbQKm0GL98T
X-Google-Smtp-Source: AMrXdXtLjz41DgbsTgGEKg48S+bFLaYgDm0CS1oQOQdxAw8CZ2RXHl0aiRV2ZxkGGAbOj+J7AcqZ2Q==
X-Received: by 2002:a05:600c:1d8a:b0:3d9:ebab:ccff with SMTP id
 p10-20020a05600c1d8a00b003d9ebabccffmr10800367wms.33.1673451687083; 
 Wed, 11 Jan 2023 07:41:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/11] video/aperture: Only kick vgacon when the pdev is
 decoding vga
Date: Wed, 11 Jan 2023 16:41:06 +0100
Message-Id: <20230111154112.90575-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise it's bit silly, and we might throw out the driver for the
screen the user is actually looking at. I haven't found a bug report
for this case yet, but we did get bug reports for the analog case
where we're throwing out the efifb driver.

References: https://bugzilla.kernel.org/show_bug.cgi?id=216303
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/aperture.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 3d8c925c7365..6f351a58f6c6 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -341,6 +341,9 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 			return ret;
 	}
 
+	if (!primary)
+		return 0;
+
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
 	 * otherwise the vga fbdev driver falls over.
-- 
2.39.0

