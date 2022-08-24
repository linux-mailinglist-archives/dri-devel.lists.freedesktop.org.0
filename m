Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE13859FF44
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F13BA3A3;
	Wed, 24 Aug 2022 16:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44725BA04A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661357626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeNvcv3iZHDY3QjzCkS4zy97GwENP8IMr7bik18mtU0=;
 b=eoJA7KfOSBM8kk9kj8eiNFFAJjttaHxXMuyeMpXY3U0AxI5xN2Z4DxD2l/Ke3pPS8J8qk2
 cd5AJKjL9nL6nkbB8X6ZfAu1kkj0PFfwI3ORRJxpERVo9XoXAYuXUe+Dy1eb1ATDU6nF31
 ZtNZFNw+QkIQYdqRr4KOVUa6ykeu4ms=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-Uw9xkqvXNAmRfVNf_IpUug-1; Wed, 24 Aug 2022 12:13:45 -0400
X-MC-Unique: Uw9xkqvXNAmRfVNf_IpUug-1
Received: by mail-ej1-f72.google.com with SMTP id
 qa35-20020a17090786a300b0073d4026a97dso4254597ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xeNvcv3iZHDY3QjzCkS4zy97GwENP8IMr7bik18mtU0=;
 b=WHOdpmMB7OUhnWF2V3ZAYIcDeZdFsm3HmyQRrc+kM/PTtH06516h+r9Ebf6rHHGt8F
 fiVmUf3ZW++OYcOU1tnLomXyjxqTVqhGJVK1arq60IdGESnSZZpV3blb1H9u3AfOIChd
 cVKfTtde75CsJQ+Zo7CP/FswiqiC5irUCmPlXRKBYVEciHAedduuK2nxWuh1mFPJCphZ
 bvAwSHgfA85+tdEjaqznEA8+8ayCLwpIKUvLGywbSKMs5zBqux8jxd6qQjE/oaDcY4Wj
 fWdxDKbkIQuk95SDBrpnJTQgIu/CmNz6SVuucdepvntRLa51a2ama3+6MX1/pzFq3rD/
 QtIw==
X-Gm-Message-State: ACgBeo32ry5VuOZGdDyWEHsvS3JQMtg6PgwfVNHEBilkbEM1sqA8xSTS
 gg2U/3GCG82VStn+le333lrqic4VxXYifdmaXfZrE/QKnZYZYMzBJG5aovDBnen2A+tV6Tj+0Ui
 g63jqGmIYlto7tW2F1cza1BeGJ8Vi
X-Received: by 2002:a17:907:75f9:b0:73d:6285:4c94 with SMTP id
 jz25-20020a17090775f900b0073d62854c94mr3284820ejc.698.1661357624194; 
 Wed, 24 Aug 2022 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR42pUAoJZIfv+Mz3pexbh+1Dso9JV7rlJIRNC0EIEP7SQm5xsOetB8XyvkV6EeX7//wS1zU/g==
X-Received: by 2002:a17:907:75f9:b0:73d:6285:4c94 with SMTP id
 jz25-20020a17090775f900b0073d62854c94mr3284812ejc.698.1661357624000; 
 Wed, 24 Aug 2022 09:13:44 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709063f8900b0072aa009aa68sm1350511ejj.36.2022.08.24.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:13:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v3 4/4] drm/vc4: hvs: protect
 drm_print_regset32()
Date: Wed, 24 Aug 2022 18:13:27 +0200
Message-Id: <20220824161327.330627-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824161327.330627-1-dakr@redhat.com>
References: <20220824161327.330627-1-dakr@redhat.com>
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

In vc4_hvs_dump_state() potentially freed resources are protected from
being accessed with drm_dev_enter()/drm_dev_exit().

Also include drm_print_regset32() in the protected section, since
drm_print_regset32() does access memory that is typically mapped via
devm_* calls.

Fixes: 969cfae1f01d ("drm/vc4: hvs: Protect device resources after removal")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 9e823e0de197..4ac9f5a2d5f9 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -71,11 +71,11 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 	struct drm_printer p = drm_info_printer(&hvs->pdev->dev);
 	int idx, i;
 
-	drm_print_regset32(&p, &hvs->regset);
-
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
+	drm_print_regset32(&p, &hvs->regset);
+
 	DRM_INFO("HVS ctx:\n");
 	for (i = 0; i < 64; i += 4) {
 		DRM_INFO("0x%08x (%s): 0x%08x 0x%08x 0x%08x 0x%08x\n",
-- 
2.37.2

