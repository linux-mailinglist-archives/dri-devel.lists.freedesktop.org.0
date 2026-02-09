Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKGYD7yliWkhAQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:15:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9127210D689
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9DD10E35A;
	Mon,  9 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="zQtO64l7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEF310E134
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 09:15:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so4635123b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770628535; x=1771233335; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uzRq34MjMHjmNuJekfYZ0C5Yepr0yqm/km8XPEg6KcA=;
 b=zQtO64l78Gzwv5nFreqW/pZuju0Xz21OFTaSou9lviQideqp53lSkd+QPdTYehKN7e
 cdVdFUZ9kTnzcMucDN6n/VeK30Bf1GAs69b+tlnQxwuDjL6hK/YH9BMQCJIbDQpep73Q
 OQT8BfW/BZXXyCdPwW1Pri+rQ9hnwo460GnbV1iimUvc8grbbCOtDUZdFkBOQQQ0bg31
 KL9Fu08hsTFs0OrH3hingPu2cvvkDWPwkpYNqn8ZGlzb23m+LkRBFNPeFy4ZICHOFwcr
 0r9rK/tw7xi36vV06m1BbzGGnKJgzSw+m3ZMAYR9eMtDyH2vBgoMSYeOZn7Cik9xQ/p2
 T1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770628535; x=1771233335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzRq34MjMHjmNuJekfYZ0C5Yepr0yqm/km8XPEg6KcA=;
 b=aMDo8P0ZJEm9GvhCUeotJy+Vnt9DWwsx1ZPnsGkCPJjOJJlHvdX/p0KObeKTXJjrEi
 3fMVurd4FI5mktAxgV5CeAANfUZIWvwa4JFeuA3RSZCLfgGqG85bXynMDS1US2ADxXI1
 mAFzwpqViFF+B6faX0bJOAgzMfmWQgMcufuD9YOYIybRIVir1++Zn1DegOdgxNhpGZT7
 vyKU7i2XfzXaOIUS6w3UUawLun4uwwIpEtV5x6k2OlJdeNgco8bwT1aG+D5eHgc4Icd5
 b1Eqai5sYq7FybTaQThqAm9l7CugdvtuUe8vSfFrWdjw82DuirrxoORZTlN6mSK7MH4G
 zDUg==
X-Gm-Message-State: AOJu0YyXTfyI60sP2G11ehCholOyEbJPCdKLadjtZiK1POXcuetLu4lJ
 DVw0Yj2T23lz8k0wRpZ0aOevIhv2Pr7R2Jsu4gLyHCVi8dAtPLFlTRHT6DEtDVQ6/z4IcMIQCf6
 2Qax2OYI=
X-Gm-Gg: AZuq6aKlr9t8D41yU2vm65UrpjOuamk8zBe3BQTu7/eaGmafV+im4CmmcRoNKcaVyLY
 VNG0cztmUCKtcRhmKDTJ0ScsRJnGMciyG58FIoqGgItYtj+zzsNP6qjH4HBStgOpiNuezfzDyiP
 auPu/XptCpnhguUimy6e3qDsMrlEk2qGJmgZIHl53YWrnf8Kv3k+WZrASCxTnbNvqJJLWgApODk
 KU+0AsgDdmJEKWJo6P+r30BjbuvoedA/Xmb+QR9EJeMmnkV0z8UI8xiz0WkeQlfqxFHK3Q/Oit9
 Vu1ktvMcyMXdNCN1UWh/c9RQ6kcjJlV8uXVd96mHXNfB0cnKMhl7J9MFVlSzmxbfEaVsVwiG2lj
 YU7ckjUlcYSq4s3Y/SkDryUt8OO0NaGy7sJhFOnxk0WyiwiiOuIKe17u3waZ6EVbQkH2YMtXCNb
 TXb98e/eh61goJrh6dXZPuVGIvxthHWNK04YQ1PJRcAYd+9Fo8rG5VPrUBBg==
X-Received: by 2002:a17:902:e5c3:b0:2aa:daf9:697e with SMTP id
 d9443c01a7336-2aadaf9706bmr45455185ad.48.1770628087650; 
 Mon, 09 Feb 2026 01:08:07 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a95220c4e9sm101132815ad.83.2026.02.09.01.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 01:08:07 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: ilitek-ili9882t: Fine-tune HFP for tianma,
 tl121bvms07-00
Date: Mon,  9 Feb 2026 17:07:59 +0800
Message-Id: <20260209090759.3952404-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:yelangyan@huaqin.corp-partner.google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9127210D689
X-Rspamd-Action: no action

The measured refresh rate is around 120.4Hz, which does not meet the
requirements of the stylus and causes it to malfunction.

After the adjustment, the refresh rate is measured at 120Hz, which meets
the requirements for proper stylus operation.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 370424ddfc80..6f9d4a4198a9 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -689,9 +689,9 @@ static const struct drm_display_mode starry_ili9882t_default_mode = {
 static const struct drm_display_mode tianma_il79900a_default_mode = {
 	.clock = 543850,
 	.hdisplay = 1600,
-	.hsync_start = 1600 + 20,
-	.hsync_end = 1600 + 20 + 2,
-	.htotal = 1600 + 20 + 2 + 20,
+	.hsync_start = 1600 + 18,
+	.hsync_end = 1600 + 18 + 2,
+	.htotal = 1600 + 18 + 2 + 20,
 	.vdisplay = 2560,
 	.vsync_start = 2560 + 62,
 	.vsync_end = 2560 + 62 + 2,
-- 
2.34.1

