Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260834781A5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2A510E30D;
	Fri, 17 Dec 2021 00:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43810E1C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8Q6E31CvRdgFQjI6r+opNRluhu+1AsXEHVhyYbhi9U=;
 b=XDPw/9hgHo7Mb0WYXXSLs0gfXjfHVQtv9/lbNPLdGWrNV3MHzqDhehkaYVpimuv5Psu+4o
 rt0yB1u0dart0vv4LYZQeb7wk7JC0+mxoa3IikY1CfJOAfmHI5ykBGBzdlvQtT+ahVrTMp
 BMi4IuBXrorIYyW73iw+KoAjacBz1PU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-hpkPITQpNJW8rP6cAVkTdw-1; Thu, 16 Dec 2021 19:38:14 -0500
X-MC-Unique: hpkPITQpNJW8rP6cAVkTdw-1
Received: by mail-wr1-f69.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso137340wra.23
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C8Q6E31CvRdgFQjI6r+opNRluhu+1AsXEHVhyYbhi9U=;
 b=JgdIj03Eaqq6YnKiZ/3XCIiH1QxfCCIY3UhYxz4hmtuqU1UzAWqJlW8RAOXbwxLsNx
 moreL8j7GxXcibL3eikst1P7VBQ7cqhVX34fRuLyvVR1c/KKv+wfZykf/WLqh+gkGoQa
 VrWnlTwJErovsFB6XETGejcgL9CiEh/ZII1jfpIQ19O1grSya+UNwtKz6IDQAjFrDCSn
 eyOqCfTaMrF5Xq66dVtSbG8ZyMupFFgVZlVrWks5+os50Wi6dh9T5S04Cc6oxfCBBHqq
 8hwnD5oP0Ke4NUv+ZH4bulbL1EoLCO5kKd5CJibgnYCXgSMnB9I1uZFxpBnZsThM3mzI
 UudQ==
X-Gm-Message-State: AOAM530oBXoxS2J7qWu3yMxGB+SSpo85KX+KeQMvehUC861NRIsCjjDm
 VOfdqPI83CCSqY8ut+Uq/X4pQAfTuPH9O7tq7XrS5uOAbGOlJ6mbxAJ1NWPtcp9nFGfdEfs15mF
 k2YgBJfYzB+q82ysRhtl0me1w/UTP
X-Received: by 2002:a05:600c:b42:: with SMTP id k2mr377641wmr.6.1639701493480; 
 Thu, 16 Dec 2021 16:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMFw6g6irhLxPXJNgVKK8Lxu5pyTbKsmFvkdUXt9719H31xcpVTOILpNIB58naQJ4SO6dTmQ==
X-Received: by 2002:a05:600c:b42:: with SMTP id k2mr377632wmr.6.1639701493312; 
 Thu, 16 Dec 2021 16:38:13 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/37] drm/stm: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:30 +0100
Message-Id: <20211217003752.3946210-16-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/stm/drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 222869b232ae..143b508b68db 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -236,7 +236,7 @@ static struct platform_driver stm_drm_platform_driver = {
 	},
 };
 
-module_platform_driver(stm_drm_platform_driver);
+drm_module_platform_driver(stm_drm_platform_driver);
 
 MODULE_AUTHOR("Philippe Cornu <philippe.cornu@st.com>");
 MODULE_AUTHOR("Yannick Fertre <yannick.fertre@st.com>");
-- 
2.33.1

