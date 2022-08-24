Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17959FF48
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEA2BA490;
	Wed, 24 Aug 2022 16:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14719B9FBB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661357617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=bVQijYKGkGPqFmKsF0QqFV1gOX2KkTaRDQdJb0IEzZhzNJ4ifJNKS/uApWOHKLtrAFWK/V
 DiYlwz3a/lt2hCyeqTWXwfMBU9vTERJWoM0zX1eter1CnTMX5q+fAAUpIGlkR0M4+AHK7I
 chTriMOpWB3VCeUDzufKvXrq5gb38Rs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-tlDqaBz2Nv2QMkENSTdYJA-1; Wed, 24 Aug 2022 12:13:36 -0400
X-MC-Unique: tlDqaBz2Nv2QMkENSTdYJA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd6-20020a1709076e0600b0073315809fb5so5363488ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=kbC0nauzaD/pUqzBFfE4suNJz0+665ttVjOBg1AiXPVFN5joRjC32Q+0Jg5JcrwXi1
 9+cLYS36lAexh/7xP/ZPTw5W3x0F0D8voTkuQjYRtTeJoEedM/QFgCr8vPHzLjrfG0rZ
 s7ca/QcKolhckcvPiVH0C2tU5WFYNXmGDlpdugi4a8OxG4PJnM1zDPaV4oeLTZZAK5SH
 V5deVkFDujVJ5PIECdnOkVkXvO+Fsh3aw1C1B2kiU9tsiG0RyJsXxPAmm9jigzFLtkdD
 +dPO8KE7pvAA3ZIpKqTexANK4GdAH4jAzpY3PTBghv77qqDP63lw3jN6euk3+VzOZb7p
 9dvA==
X-Gm-Message-State: ACgBeo3UgLo+loXTXQosZHzEoTWU91VumZVbyg/47dhVC6zhN6zbqrJ2
 2uRVeGAHE59/oC8xOINxShCjoCgWsNq6e5Jx/Ps46hUFzaV4/VHnDYDdtdWnWWvjNoZA2Al64lr
 pgycPNEt7cTdM7sp6PtymiwY6A5NE
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr3454487ejc.64.1661357615194; 
 Wed, 24 Aug 2022 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Mb+JsUJPSZ781aWuV8ZoottRuEPEwvAH6ZrSbdG24VdAHADDW9+L0oDsP/xOp2REIksyfBg==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr3454478ejc.64.1661357615040; 
 Wed, 24 Aug 2022 09:13:35 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b004478fdbe190sm791536edb.10.2022.08.24.09.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:13:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v3 1/4] drm/vc4: hdmi: unlock mutex when device
 is unplugged
Date: Wed, 24 Aug 2022 18:13:24 +0200
Message-Id: <20220824161327.330627-2-dakr@redhat.com>
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

In vc4_hdmi_encoder_{pre,post}_crtc_enable() commit cd00ed5187bf
("drm/vc4: hdmi: Protect device resources after removal") missed to
unlock the mutex before returning due to drm_dev_enter() indicating the
device being unplugged.

Fixes: cd00ed5187bf ("drm/vc4: hdmi: Protect device resources after removal")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 84e5a91c2ea7..4d3ff51ad2a8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1425,7 +1425,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	mutex_lock(&vc4_hdmi->mutex);
 
 	if (!drm_dev_enter(drm, &idx))
-		return;
+		goto out;
 
 	if (vc4_hdmi->variant->csc_setup)
 		vc4_hdmi->variant->csc_setup(vc4_hdmi, conn_state, mode);
@@ -1436,6 +1436,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 
 	drm_dev_exit(idx);
 
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1455,7 +1456,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	mutex_lock(&vc4_hdmi->mutex);
 
 	if (!drm_dev_enter(drm, &idx))
-		return;
+		goto out;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1516,6 +1517,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	vc4_hdmi_enable_scrambling(encoder);
 
 	drm_dev_exit(idx);
+
+out:
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-- 
2.37.2

