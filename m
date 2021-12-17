Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F213647818A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3389E10E268;
	Fri, 17 Dec 2021 00:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C4810E246
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsfI+d16ZHT7U20YgR9uB50qmdKHn5s4Pa/859D20hE=;
 b=dKCmGP9gEz7uqkYxSk94rtxYt8ykdmTL4WZGGSzGN7HrL4vIL7KHOYhbGXJ3354YxM5N+k
 iL6j2hPvYA9Pan0I3FQOPqWsuDTKJdKRC8QjqVFwZLv3mCpZA05gUO8T7EJ/1JUr30kFVp
 0xG1jf2E6m15S6FM0otg43Cqq/A2XHE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-RBChL6U_PQS9w3Q-yx-K2Q-1; Thu, 16 Dec 2021 19:38:17 -0500
X-MC-Unique: RBChL6U_PQS9w3Q-yx-K2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so146217wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FsfI+d16ZHT7U20YgR9uB50qmdKHn5s4Pa/859D20hE=;
 b=0pp854JygUwKSlfBVgvBVKsML/vQozh8rEs8CTxeYxwH43E8Lupk8aPSlxImx8332E
 CVPr9tyFxDEo7HK3GzyuVyHssk2YQYZOPddemuGoN41qRRc3+xeBTyKLDCqTOSJlJa8i
 37HncXsEMUcd7KQ+dzHr8EhxqwqGx1OSzRUrPFMntO1USrOVkIdsIj9KVv4nOhE3FfQ5
 +zkeddUKDbh3FkvjAHuGinQrXsjdlYkn0v95GT7kcH4dN/uAeB4F0+b7L0nJV6qPxvKi
 tRs4nnTR60WVdvUjPabgpWBeBDwMZDJ0MmnEG2ndD6ejX0kJ8xzwd3AY0aPbyJOxIVFq
 bO/Q==
X-Gm-Message-State: AOAM532thnGDeqLkPrydt0AhwMXD+6msGh9BT/PvON5YwoLb4iM4FAfq
 OKxt5kTNhFNwJxo19R1rkmC0kPIjquCQdZWpZ42ylYx/XnEZNgodE1pUYNyHnJiZZOKpH0cJ+bb
 KlslW94ee2gwqSNVTByYv4BBjvZi9
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr381242wmq.60.1639701496351; 
 Thu, 16 Dec 2021 16:38:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa21ig9FvI3AJDxyhoutl00Tdje+5AV6C8F9kikVcdCfU1ZAZ7AXOdQDQlpDwvwqi1nM2JQA==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr381233wmq.60.1639701496201; 
 Thu, 16 Dec 2021 16:38:16 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/37] drm/arc: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:33 +0100
Message-Id: <20211217003752.3946210-19-javierm@redhat.com>
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
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index f8531c50a072..42c5a7137a47 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -427,7 +427,7 @@ static struct platform_driver arcpgu_platform_driver = {
 		   },
 };
 
-module_platform_driver(arcpgu_platform_driver);
+drm_module_platform_driver(arcpgu_platform_driver);
 
 MODULE_AUTHOR("Carlos Palminha <palminha@synopsys.com>");
 MODULE_DESCRIPTION("ARC PGU DRM driver");
-- 
2.33.1

