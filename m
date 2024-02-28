Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D840A86B8DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7255610E342;
	Wed, 28 Feb 2024 20:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dwGk4vt4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2F410E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709151147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lt7Z2bfGFfZb7GW+qc4A0EHIW+vtSShzIyaaG+Gg6bc=;
 b=dwGk4vt4yIhChNEjvNEtA+6HTyJqXoUMCMLZB/wjHvNWk8GvGkXFaNI8EXS9pPE9kjHRKI
 Sa8h1ye/1nT3p9oNsNbsP6R4hqRmAYX1E79nY3Y7vqubqpECCdLURaOC2uhL8BsiVosrEt
 sAYdcyUYT1xeFKuGSjS3OQqzZOVcldU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-wLTB_7eFPLqs9Lq2nQJVEQ-1; Wed, 28 Feb 2024 15:12:23 -0500
X-MC-Unique: wLTB_7eFPLqs9Lq2nQJVEQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-787ca6e2f28so19218685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709151143; x=1709755943;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lt7Z2bfGFfZb7GW+qc4A0EHIW+vtSShzIyaaG+Gg6bc=;
 b=A8OXVwBAzgjkJDUPw/fXgOxC7Ll1lY8ZRjsN7I4CViK9HpcBPi6ZGPT9oPuEQM8W03
 cuO1kFHHkx60gq+GWXTZQzNMdhLBFLHwb5TLBRtUmxUK8oYyMCVkEt47b3aLlsjRGOqF
 3RjG+cz8VrA5EGm27zaL+0RqjrsmtYomiy2IQTrPjMDhqOqhOWglurfzI9qmuadGFFAD
 QhINihhiw5YMBK+BbvoNHb7v48PXTFP/vOLzzZqF4vXKpG0WoYY0e2LpYbe/yOzyB/kc
 uzTHdRoF+dJ49IlO7mFDjqKLYKR6zzRoAR4aKVSY9JTs2TjIcsqvpeb2G7F+hBvr4Hcw
 uTfg==
X-Gm-Message-State: AOJu0YxwNu9LlovJnMRMv1BQ8JIoEsh1ZyD607PSzPe46RwOs4+0fY3F
 WAYuJ6Y5VZvv9XdFgTFsn3ysEp/WKRPhe/qlkcEDuah8fdS82O18Vk6JA+SJTJ9KFtl3izYn2hd
 hz8vVspkdWHu0+f822tgi0lyHSr+knpwlz7saLtvRvC4jLbcmy5S5Qfo/zvQiGB/MXg==
X-Received: by 2002:a05:620a:1108:b0:787:f452:df60 with SMTP id
 o8-20020a05620a110800b00787f452df60mr97199qkk.47.1709151143433; 
 Wed, 28 Feb 2024 12:12:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzEM8vE6Yv8kYQAtA9/PNJt641WNB+vw1kTd4a6fUV85b8yyNH9nKk+KexNqOg1WQLFei8Cw==
X-Received: by 2002:a05:620a:1108:b0:787:f452:df60 with SMTP id
 o8-20020a05620a110800b00787f452df60mr97173qkk.47.1709151143120; 
 Wed, 28 Feb 2024 12:12:23 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 z1-20020ae9e601000000b007873213b29csm122762qkf.49.2024.02.28.12.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 12:12:22 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Wed, 28 Feb 2024 14:12:06 -0600
Subject: [PATCH] drm/tidss: Use dev_err_probe() over dev_dbg() when failing
 to probe the port
MIME-Version: 1.0
Message-Id: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
X-B4-Tracking: v=1; b=H4sIAJWT32UC/x3MPQqAMAxA4atIZgM1+H8VcVCbahaVRIog3t3i+
 A3vPWCswgZ99oByFJNjTyjyDJZt2ldG8clAjkpH1OIl3gw9R2RVPPWYGcNUF2F2VeOog1SeykH
 u/zqM7/sBYg+Xc2UAAAA=
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Enric Balletbo <eballetb@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This gets logged out to /sys/kernel/debug/devices_deferred in the
-EPROBE_DEFER case and as an error otherwise. The message here provides
useful information to the user when troubleshooting why their display is
not working in either case, so let's make it output appropriately.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
There's definitely more spots in this driver that could be upgraded from
dev_dbg() to something more appropriate, but this one burned me today so
I thought I'd send a patch for it specifically before I forget.
---
 drivers/gpu/drm/tidss/tidss_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index a0e494c806a96..f371518f86971 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -135,8 +135,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			dev_dbg(dev, "no panel/bridge for port %d\n", i);
 			continue;
 		} else if (ret) {
-			dev_dbg(dev, "port %d probe returned %d\n", i, ret);
-			return ret;
+			return dev_err_probe(dev, ret, "port %d probe failed\n", i);
 		}
 
 		if (panel) {

---
base-commit: 22ba90670a51a18c6b36d285fddf92b9887c0bc3
change-id: 20240228-tidss-dev-err-probe-fa61fb057029

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

