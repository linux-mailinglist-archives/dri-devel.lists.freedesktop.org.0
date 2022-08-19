Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31E599A69
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB8210E8F4;
	Fri, 19 Aug 2022 11:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7710E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660907337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=K+WN+qzzwHMfiIw87U5M/GSZZupwrl8tmKZt59kq99+Wg8zA8C3BWJpm9gd6hHm+mxycBw
 fvoL92KwvilZdBksRl6GaNLa4AFukxJoF5qOOlNLthvm85hiLv5HgwrU+UCWj6lJa/u99s
 nJFkJi9UxelUnZRs939E9Z8GmAJuxYY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-SJOytq5sOjGsuKrIXahKUQ-1; Fri, 19 Aug 2022 07:08:55 -0400
X-MC-Unique: SJOytq5sOjGsuKrIXahKUQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw34-20020a1709066a2200b00730ca5a94bfso1383193ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 04:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZdQAnurZVFdXXS4WbKVSyp7TafzRJAbZ0GKKLX98Mwk=;
 b=OBdYU0j07NvjEI5ODEzx5EJYZE/ItKqAi4q/ng2P8M5lURzAd/3cy94UhemzURN1Fs
 ssq4vTOn9dCzdZhdH7HNZ2VIn8qYleDIanWfp8aIpRsqou4/NoR/ltJc4Da+UEMwQhKv
 UeFyFxmkqy0AuVNLSRE4A8xE7X98FtNc1mx6KJLxvZp3mr1notHUkYHBy4xpLbzZJ2qt
 GhbBI7uWnRo7VP+TD0PzAaaMtugxhPPXzinIk7lr3/1xGX/SJrMiVgcB32Ch7SoM7Nky
 eUwEeZ7Lyt/2u1bKGaDOsbyInkqZzpLVivwJTSbVupEPVHt/qDaHqWEnjaDdcGeV529r
 qyMA==
X-Gm-Message-State: ACgBeo1S+9jquF7OwKtmL2yIBFZ+vasiDb3VLs0imCTSRot42CAjwN3d
 YeJy5xQH6/1vyx+NO78CPGUCkToftvM+8PDfu9/n4Qj73nRNJvvf9inQiw5bcb+crNR1FMjhoeP
 0LuLZxLTg8vMhfdI+mSQ1Ea1cWRR8
X-Received: by 2002:a17:907:c10:b0:731:58aa:7783 with SMTP id
 ga16-20020a1709070c1000b0073158aa7783mr4727748ejc.19.1660907334721; 
 Fri, 19 Aug 2022 04:08:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WDs6mnNC4SmZKIMC1pcP1UBsEQ2H0aHnmJU1kPSrf3TZKof2KEiTrd1TmPeGkr3GplEZ4xg==
X-Received: by 2002:a17:907:c10:b0:731:58aa:7783 with SMTP id
 ga16-20020a1709070c1000b0073158aa7783mr4727734ejc.19.1660907334571; 
 Fri, 19 Aug 2022 04:08:54 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b007308fab3eb7sm2167827ejh.195.2022.08.19.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:08:54 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v2 1/4] drm/vc4: hdmi: unlock mutex when device
 is unplugged
Date: Fri, 19 Aug 2022 13:08:46 +0200
Message-Id: <20220819110849.192037-2-dakr@redhat.com>
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

