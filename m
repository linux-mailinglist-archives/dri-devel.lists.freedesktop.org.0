Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936D50CD56
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 22:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080CD10E174;
	Sat, 23 Apr 2022 20:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53A910E32D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650744126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TmI4HuYyRoxvHL+vw/EIwCgtYuWPzs344Ybx3U2pVv8=;
 b=OyieoyHuQbjMyCFGG4UwDwj/f391pV/30PgVAF2pFiUdon+CZPrpc+eNYQ51lVK12qqEuT
 WSjBT8MW6wxLgHQe09rKzPwBW/HbhZWJpI4X/P0LZ2T+Lbdq5OJRNvkCC7+agu26FcGL9V
 go45nFA1sLCkEZBCWUl3o1Cwa1sHcCo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-J0-OPd_SMJe4oCKc1FW-MA-1; Sat, 23 Apr 2022 16:02:03 -0400
X-MC-Unique: J0-OPd_SMJe4oCKc1FW-MA-1
Received: by mail-qv1-f72.google.com with SMTP id
 kl12-20020a056214518c00b0044f7a146482so5746612qvb.14
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 13:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmI4HuYyRoxvHL+vw/EIwCgtYuWPzs344Ybx3U2pVv8=;
 b=xSy6EZNhPPms0jkKitgmybd2qteKW6LSQ/uaZCxHwm7FUsdqayJUcsTYMJRB5wr1Pn
 sLrcjl48yhiSsO1nZcM2CK8N6qX+hrICjcDkxzVASSABVuu7sSbes9Bm0kT9SvuDgPDG
 r5PsCy4GptWW58kOtjUQ4/Eu7oZ61wNyMCX60etKkEbHtLjQ43HSdd6FW9+7JzBunztc
 MyuEVXsUp3HMBueZP4Aw1i92gn3uuuIUOLEyiZKuA2caXuzyuVjK/2U/wJ55Jc35qbo7
 f53l1h9RpKDPOViqOHl69XFbf//qx/UDoJdZ5tqPrbApNIEesunwfIWggqlqeTnyfXoI
 mvRw==
X-Gm-Message-State: AOAM5313or8PkPooyLfI6btZg8ydcjOaxBY70i4KNRLlFjhucPwUXRcK
 YrqQ1L8j0pVQlkXXGTp8DGHLB/pwRoKCwUqtr223+1Th/Vj/G8JG7S5TBYqJD3eN4XiwEY+ycJv
 bWo02hjQeNzdPoNaKNxWLpjn85+cT
X-Received: by 2002:a05:622a:1b91:b0:2f3:45f0:d9fb with SMTP id
 bp17-20020a05622a1b9100b002f345f0d9fbmr7608105qtb.147.1650744122388; 
 Sat, 23 Apr 2022 13:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmfh+uSxEWKmvVX8l/LATjWvc9VwFZNJueNhicXlKtCgy74l29do1f86Ksx39bNBVQ+S9p3w==
X-Received: by 2002:a05:622a:1b91:b0:2f3:45f0:d9fb with SMTP id
 bp17-20020a05622a1b9100b002f345f0d9fbmr7608083qtb.147.1650744122071; 
 Sat, 23 Apr 2022 13:02:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 e26-20020ac84b5a000000b002f35d11c5dfsm2348748qts.65.2022.04.23.13.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:02:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: change cac_weights_* to static
Date: Sat, 23 Apr 2022 16:01:55 -0400
Message-Id: <20220423200155.1735336-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports these issues
si_dpm.c:332:26: warning: symbol 'cac_weights_pitcairn' was not declared. Should it be static?
si_dpm.c:1088:26: warning: symbol 'cac_weights_oland' was not declared. Should it be static?

Both of these variables are only used in si_dpm.c.  Single file variables
should be static, so change their storage-class specifiers to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/si_dpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index 3add39c1a689..fbf968e3f6d7 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -329,7 +329,7 @@ static const struct si_dte_data dte_data_malta =
 	true
 };
 
-struct si_cac_config_reg cac_weights_pitcairn[] =
+static struct si_cac_config_reg cac_weights_pitcairn[] =
 {
 	{ 0x0, 0x0000ffff, 0, 0x8a, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x0, SISLANDS_CACCONFIG_CGIND },
@@ -1085,7 +1085,7 @@ static const struct si_dte_data dte_data_venus_pro =
 	true
 };
 
-struct si_cac_config_reg cac_weights_oland[] =
+static struct si_cac_config_reg cac_weights_oland[] =
 {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
-- 
2.27.0

