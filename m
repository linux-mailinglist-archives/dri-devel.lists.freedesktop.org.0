Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CC5874A8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 02:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E798910E3BE;
	Tue,  2 Aug 2022 00:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEDC10E28E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659398661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6SzF5bzrdmxIOn5tTpulDRO8riGmWkL+mC1UkjRs+s=;
 b=BYtLNrT0dByASAMc8vv7gc3u8PFCNW9NeiEeEF0vdHZJjb3ybXQTyh6efxMLRP9f6zWEuW
 +f1cHPGG3DD4CrQUos9ldX6+3yDdnbwumfaPUo7NBMcfEaWNMk2ddWo/fotMFDdkL+BYZw
 OJ1oQuXT4gw6/uTh+yde0i5Eq1DjgyQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-06h0vXYSNLihUW0ArrRbrA-1; Mon, 01 Aug 2022 20:04:20 -0400
X-MC-Unique: 06h0vXYSNLihUW0ArrRbrA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w5-20020a05640234c500b0043dda025648so1225346edc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 17:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=U6SzF5bzrdmxIOn5tTpulDRO8riGmWkL+mC1UkjRs+s=;
 b=5HZ5Vo4D8fjIOhh5KpqpcgGYSkjWPWyR65AoE0sHHB2xhBMfCTfEDOGEnvcDcxDM1Z
 WgSwsCzhPtA59D2f8V8CvFRmkXLoLhLjabLqmEdvDnGRImmQ91tgOrNIJLFmkEwQ7l+7
 itiF25Cq+5pMMpP0td+GY1tqdys6vOqW/nkj5pWxHN6eBhZd8m0HAooYcw3R7Cn6meUY
 smvAGeytrbyhvIga5jCUvaEk3Oli4s33zGbByVcLC1Ce43wML7M8GBY6QrrdPqd99CrM
 P32EKLqU5nHwEDd2Q5x6otmxCWHUALEM8Y5KdbyxfPXtPTEJwQBAXAUFGfgHVLuwDKZv
 J0dw==
X-Gm-Message-State: ACgBeo0GsqxtrhGDJUXcJfX/wjwF163XpwgLLCgaxdnsfEs5AjdbGpYD
 R2naAnVa1kN38asGzNFl4FwCzkiQ2hwVtCHkgRAK0WFVwvTifE/5+l8SqLbcYMdJ6MIoqPIFJwP
 r+InzJqU9hvnab44ukeU7w3prGDzJ
X-Received: by 2002:a17:907:3e20:b0:730:7528:d7d7 with SMTP id
 hp32-20020a1709073e2000b007307528d7d7mr6521266ejc.136.1659398659621; 
 Mon, 01 Aug 2022 17:04:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6thFS7LA8ACR06UD7XqVrl7c5feAQorB6NJrtwmpPXzDw1vuirxz8o3tTHC8XQS8w9dnrsLg==
X-Received: by 2002:a17:907:3e20:b0:730:7528:d7d7 with SMTP id
 hp32-20020a1709073e2000b007307528d7d7mr6521253ejc.136.1659398659502; 
 Mon, 01 Aug 2022 17:04:19 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056402036400b0043cbdb16fbbsm7461686edw.24.2022.08.01.17.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 17:04:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org, sam@ravnborg.org
Subject: [PATCH drm-misc-next v7 5/5] drm/todo: remove task to rename CMA
 helpers
Date: Tue,  2 Aug 2022 02:04:05 +0200
Message-Id: <20220802000405.949236-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220802000405.949236-1-dakr@redhat.com>
References: <20220802000405.949236-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
hence the task can be removed.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/todo.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index de226ccc2c54..7634c27ac562 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -331,19 +331,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Rename CMA helpers to DMA helpers
----------------------------------
-
-CMA (standing for contiguous memory allocator) is really a bit an accident of
-what these were used for first, a much better name would be DMA helpers. In the
-text these should even be called coherent DMA memory helpers (so maybe CDM, but
-no one knows what that means) since underneath they just use dma_alloc_coherent.
-
-Contact: Laurent Pinchart, Daniel Vetter
-
-Level: Intermediate (mostly because it is a huge tasks without good partial
-milestones, not technically itself that challenging)
-
 connector register/unregister fixes
 -----------------------------------
 
-- 
2.37.1

