Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJGAIuZcWngJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:29:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD56156E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23910E0A5;
	Thu, 22 Jan 2026 03:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="vvQxzJcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A010E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:29:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so557869b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 19:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1769052551; x=1769657351; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jZXL3egoMSu2/z4g3pUZE19pcBHqxEb6HlHbLjP3gv4=;
 b=vvQxzJcZnJAH6te1KmAjf7PySaUjoLgbCPHK/Op5c08zsbzrztJmg2I+P6Gsoa2sPC
 U8Sqpe3rpBaNSvrk7Pb75U+2A6E/zybf44IP62VgEifT3SUj8mt2288BzLeKJRqKsU9L
 /9C73C3iFdwZz9cehjvbh3M3NJhrwvdf0Y8ioKvVi+KhOeJvpMuZiDMONUIhEk3JIH6Y
 L18x5p3DwY7Rlk4He3hKZvVKeWAQVp7/YzZLClE4nWB3kW7qJ6HOOCpHwTiAQwepyPeY
 gC9li+02qhzJl6d7UJQ8+2olMnoRbtPBDvoYwZv949zNdGQaCnGurkVuYhxYqatNMo09
 JwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769052551; x=1769657351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZXL3egoMSu2/z4g3pUZE19pcBHqxEb6HlHbLjP3gv4=;
 b=xQIafFvJdjlmmCCrtKFH9VBqMiJXWFCKAh3vF4XYZZ/HJHgZpwrWU++FXJu2r3wz/7
 nzfSbYkDV2wtWYjwX01HuqFEnKOiWgSsW1nPHmb605u9EYzJaodLCiHxtRbIgYgA6TPT
 o2TaoNuuLVouPnae9Wd1f5p6C3hQSu/a+L7JIY6Vr6t6pWBGK18UWSMK96p5/0bnbr1w
 Git8Mb2KM+mJtuFYep9jOVHxsZrfYnwVgSavaMO5zIr1fp/ewDNqrybQJ2Q0jC4xFPtJ
 D4eEybMjCL1lczh00irofAEwGdK+Iowh21zNtx/TD+i//W4ZlPy01GZVFGEVpNZbXn76
 l5jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYNzW5AgGzccXeE8qR1AFpd9FhZ/A/4MOwtlulPBLE+7Pwe77TcT3d61k7XgIaec1LYMxJU6ikKsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYgKzmkE0Hftj035WmrmSasw3xquh3dX2H1s5tqxt9WHBQEBqI
 Ctv/9dmJMYtFWfJbMUy1gTYJm9xWWY89QDPVx6Vm2oA9rt31ZRwI0DKaybd4sxweplY=
X-Gm-Gg: AZuq6aIM51+hUg9kCdBZZZm7AyekT85aHYHe6kXULRppPP8/O3nXerT2ihh1ZvWa+ir
 ZrE0xfdMHtHQSoU6akk3rVga88d5ncm1tTmr3a03i54waEIfc1H/2xZymF1xDPsThdBkyceeIYX
 flmjnM+IXGCaiBZooEzIc5BmQJWC4IGy8JvYNHmg40TTCnfxGo0Dv5DLwdDIZcChGRw5fVQLnWK
 HNGWdA1idde3HnapSJGJaOc0VkryzcknCDV0IWQv1MbpfRkEt/zUfBf7LDEF2V9gxLOmfwZLSLJ
 OAj/7Ykp43cUQmsfMRT93m6wT49UtTLqlPoa2c+AeYi6C51bfD9Gjim1zx+Ptn9P9ZDM1wrQXfR
 ojyXsg/I84/uy73FHeIqDlaH+3lqTOnOCQ1qO7LskTqnDC9vxZnQxsY8BG37icLjdd73oqXFphE
 W0pUlMtBIVRQLxmc616iifdIDXSZ4DoavxpfKrXuU+EWD7uyv+KvNlhBc/hRj9t6m7rlhf7Wdxm
 UdRP5QYisVGfAEiKRsXxFJ+
X-Received: by 2002:a05:6a20:9c8f:b0:38c:792:56af with SMTP id
 adf61e73a8af0-38e45d0c23amr7002792637.2.1769052550868; 
 Wed, 21 Jan 2026 19:29:10 -0800 (PST)
Received: from terryhsiao-Latitude-5490.. (61-219-175-100.hinet-ip.hinet.net.
 [61.219.175.100]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf249fcbsm16466459a12.12.2026.01.21.19.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 19:29:10 -0800 (PST)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v3] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
Date: Thu, 22 Jan 2026 11:29:04 +0800
Message-Id: <20260122032904.3933-1-terry_hsiao@compal.corp-partner.google.com>
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
X-Spamd-Result: default: False [2.69 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[compal-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,compal.corp-partner.google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:terry_hsiao@compal.corp-partner.google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[terry_hsiao@compal.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[terry_hsiao@compal.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[compal-corp-partner-google-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[compal.corp-partner.google.com:mid,compal-corp-partner-google-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 45CD56156E
X-Rspamd-Action: no action

Add support for the AUO - B116XAT04.1 (HW: 1A) panel.
This panel is used on MT8186 Chromebooks

The raw EDID:
00 ff ff ff ff ff ff 00 06 af ba 89 00 00 00 00
0c 23 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 21

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
Changes in v3:
- Fixed the Signed-off-by name format.
Changes in v2:
- Added missing Signed-off-by tag.
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 679f4af5246d..108569490ed5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x89ba, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e50, "B140UAN08.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
-- 
2.34.1

