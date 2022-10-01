Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371445F1D12
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3110E639;
	Sat,  1 Oct 2022 14:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D810E63A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/3Usn0qxo83EKXGxCer0F1RKa2ZQEkOpzpL2CjOlas=;
 b=FwVth9/NwbeNz0KnIYJ8EyUdV4o091Dq6oCaeF1S87NDC+i52wvlusQ0jeL9cyo/U+ZQoA
 Bjnt2x/D3pjJgg2k7H4xfHqirOsrPr714xitmFUSgoKZt5UlCYQ2QKPPUjmBv6NQAflbDZ
 yDoDIf4I/96Bl5GIEEMRV+IJx4pzyjc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-Qmxj-6kGMVy9SotbP2yTTA-1; Sat, 01 Oct 2022 10:58:38 -0400
X-MC-Unique: Qmxj-6kGMVy9SotbP2yTTA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h11-20020a05640250cb00b004580ee86ca8so5522556edb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V/3Usn0qxo83EKXGxCer0F1RKa2ZQEkOpzpL2CjOlas=;
 b=Lb9bywiGAr7ctosLYeAITQ7k0A129tUpzjEhC9l0j6F8UzUkMYmif7iKw3Y/fkGW2y
 xbz1VUzL4IsFCU9pR2FeCdFJcudkW+NhIuxTaQPfaWtNIxRANuZcvqk/k3ztt5VODdIv
 3GP9Zy2jZVdR5Svu5LGdgBu/yYCfPoXFtj2ZI95wsYoft1mRXlXUEevVosMJ1/OHE4yP
 f/zjQ268SyxG4bHlUf7c5XC1w/qR1Y3F/S9tdZ54SWep4uYeo29qfm7ujbppiQyk1K6i
 nZVz4W8Otj16hAKjSkJVt0+YrnQQMPMXauHAvXm6U9ldSxYaYKoApwBhU08Quha0GG1r
 fb5g==
X-Gm-Message-State: ACrzQf2IRPHVn1vu6HPTsxiCGsI/uNW2ufE7rOcKiG+nexIdHgDoGzUv
 1kZ24ferJaoUTL/TcvF30RYKh/h62iyBSNl99OAANLTzQxtwA00EXzapAugutqIg/p1XdJUUutC
 bnqC5doUJW0wAE/QVxC3T7y1CsX2Z
X-Received: by 2002:a17:907:1b1c:b0:72f:9aac:ee41 with SMTP id
 mp28-20020a1709071b1c00b0072f9aacee41mr9815147ejc.56.1664636317149; 
 Sat, 01 Oct 2022 07:58:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46nLpKvPd5A48MwRU0YYtpmobTJ4KvgIEBc3OFsMZ1VMWEAONqeJWMYiLUogbRofwIWzwDfQ==
X-Received: by 2002:a17:907:1b1c:b0:72f:9aac:ee41 with SMTP id
 mp28-20020a1709071b1c00b0072f9aacee41mr9815139ejc.56.1664636316950; 
 Sat, 01 Oct 2022 07:58:36 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b007803083a36asm2805616ejz.115.2022.10.01.07.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 8/9] drm/fsl-dcu: remove trailing return
 statements
Date: Sat,  1 Oct 2022 16:58:01 +0200
Message-Id: <20221001145802.515916-9-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
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

Remove the trailing return statements at the end of void functions.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  | 1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index c77df9b7893f..23687551c831 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -147,7 +147,6 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		     DCU_THRESHOLD_OUT_BUF_LOW(BUF_MIN_VAL));
 
 	drm_dev_exit(idx);
-	return;
 }
 
 static const struct drm_crtc_helper_funcs fsl_dcu_drm_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index b1305f0af9d5..b95dca47de3e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -174,7 +174,6 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 
 out:
 	drm_dev_exit(idx);
-	return;
 }
 
 static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
-- 
2.37.3

