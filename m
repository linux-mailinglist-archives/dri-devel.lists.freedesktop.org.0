Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F654599A6C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D771C10EB07;
	Fri, 19 Aug 2022 11:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32F10E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660907341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeNvcv3iZHDY3QjzCkS4zy97GwENP8IMr7bik18mtU0=;
 b=io1ydV+tmvVrO3hRGCOUjLnw7WVSP2TVaHBOlTUA9xexC4EZBD+dfQzUmSoJ26Rk/EDtKM
 eoviFVzX660hOhG7kMVCJ/TvQ4SCkLf1gZhM5944pUudJn3LJdJFia9/rX+f7iClIu3Wxf
 C40GWIX3KEylw3CNKEDD8CsVywp+FmI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-LUSwZ_M6OCKW3nOcBlze5g-1; Fri, 19 Aug 2022 07:09:00 -0400
X-MC-Unique: LUSwZ_M6OCKW3nOcBlze5g-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b0043e50334109so2653321edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xeNvcv3iZHDY3QjzCkS4zy97GwENP8IMr7bik18mtU0=;
 b=IbMQoC2ETqF0sLol1GcKt5tVOo6ZfylfR1QTnBPJ5k/9gOcQCkE/kA3RBFcUvLGXYD
 rdSFX/on5X/N7jpxJwpZ6rdTRi08X/wfIX7Z4qe0v/ZAdTsczJuW1HDWlaVVwo5PnGOS
 Cb0re+0OpqkFyMd7XQm5abu5A3nKzgRFud+fTnBtbWFrbgIQ13MLLcdTaOCD3XubOlx5
 MtHbxwk3c5FBJdSLxwlXcepWonb8k6DPGQJg2VHHC92mWyljqW0KPSo1PEgkt/F0/UVi
 9xPHjaXptWkX6GkhCDGOEcxMULtd4O6dKP3XcfDpRHXfMQujvvEtgLep7wqdvBGOipxf
 qgZA==
X-Gm-Message-State: ACgBeo3z73hTqFg4JBVdlW4e3gVmsD0u90GM6frOzMQzIurWcfpGdyBP
 QaBKtFm8s5hu8XOUKTYhm8afJ3KsRSVzXXVh4XwuNaT18ATen8JauEMX0WToUzcYZY53ifEuJbk
 RZF3cAf83GRzxmEOgFDalqn/yOSUD
X-Received: by 2002:a05:6402:1603:b0:446:5617:55dd with SMTP id
 f3-20020a056402160300b00446561755ddmr537916edv.170.1660907338840; 
 Fri, 19 Aug 2022 04:08:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JCMLkkgfrx66zUb5RMS4kd93el/Xb9OFRWhrYuzNFFkdMFyxj+rXOpo1fErhN9Ev0M+lasA==
X-Received: by 2002:a05:6402:1603:b0:446:5617:55dd with SMTP id
 f3-20020a056402160300b00446561755ddmr537899edv.170.1660907338647; 
 Fri, 19 Aug 2022 04:08:58 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b007308fab3eb7sm2167827ejh.195.2022.08.19.04.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:08:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v2 4/4] drm/vc4: hvs: protect
 drm_print_regset32()
Date: Fri, 19 Aug 2022 13:08:49 +0200
Message-Id: <20220819110849.192037-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819110849.192037-1-dakr@redhat.com>
References: <20220819110849.192037-1-dakr@redhat.com>
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

