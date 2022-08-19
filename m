Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5045991BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 02:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14E610E497;
	Fri, 19 Aug 2022 00:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1DE10E497
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660868955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=F0PZBhESAXU5ec7zYb6EO9HojUmSlABIlBRvowO+y4I1Zs7EPX16OQcMLK5ErVNuqBvOZW
 /J+gI0FjkU+LCgxKIqZ/wKKqt58cFSR5FMNNDDC66xMCVMoZv92tiHcpOiPeQ/R6EfbHU+
 wr8rvbEGMKL2G3dmVnp+kuQV8tXlY8Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-ZMh94aPoOwOt6OjmpjqNfw-1; Thu, 18 Aug 2022 20:29:13 -0400
X-MC-Unique: ZMh94aPoOwOt6OjmpjqNfw-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc31-20020a1709078a1f00b0073096c2b4e1so1092642ejc.22
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=LtrtZ+txbVWz1XcyTJwF+9vLYq0zX+Znme4VqTy7ANbsUo0PHEhQ+KOuG+t9dbKnkf
 9QZ77DebPrROjd33sNWnJ62fsxtQSV0pQT/VI/lE3XVG3/rT22j6rem3r0cZQKHYZrub
 h/A3j4hB7ZlW+tobp6MvR248lPaMV9JwIURDYlZ0c0B38Ve6O9It3dV0F+xQGiA1Ksts
 9EkFhizaRwTJsIehsxSwwP4VAF2wuHwNbwlj8AixqRShzRhxhYmL4fkHz94zHiDONqFS
 Nyuw9m23Ti80upLmbWnk79kCJmdqn7/Eh2/Ib74M7Z5CXr55EJmwOF00IrIexMtrShfT
 Zeig==
X-Gm-Message-State: ACgBeo2cQ/laA2kcSx9DdnufMisAGSUUteQNqnADZbSpP3mB8rxy822U
 B+u2GadN0gsmkJA3p2vMqsdSsb5zEOtPEMFX5K5bG07VYdbOHdeZgWPLYpVaBEfxPNXMA85cwGI
 uoybdoUIwKHIj+wGGUekwfkFk9oMR
X-Received: by 2002:a05:6402:554:b0:446:1013:c898 with SMTP id
 i20-20020a056402055400b004461013c898mr3898707edx.269.1660868951859; 
 Thu, 18 Aug 2022 17:29:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vEVnE89EQFAzGx7Rjk8MdzgcItMbGIbKShh9H17mhg7mQ2H1lZaOWswF7giUus2phpUqZew==
X-Received: by 2002:a05:6402:554:b0:446:1013:c898 with SMTP id
 i20-20020a056402055400b004461013c898mr3898697edx.269.1660868951704; 
 Thu, 18 Aug 2022 17:29:11 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7cd1a000000b004460b020ffdsm2027913edw.83.2022.08.18.17.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 17:29:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next 1/3] drm/vc4: hdmi: unlock mutex when device is
 unplugged
Date: Fri, 19 Aug 2022 02:29:03 +0200
Message-Id: <20220819002905.82095-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819002905.82095-1-dakr@redhat.com>
References: <20220819002905.82095-1-dakr@redhat.com>
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

