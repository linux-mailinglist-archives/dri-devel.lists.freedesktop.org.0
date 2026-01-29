Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NxQI2nUemlX+wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:30:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A42AB72C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 04:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6CF10E301;
	Thu, 29 Jan 2026 03:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="OpqwRBfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7C810E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 03:30:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8230f8f27cfso264767b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 19:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1769657443; x=1770262243; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mgy9faw71GwmUFuz/2FNz4cVvVPkiBCcNdsR6NNnOJo=;
 b=OpqwRBfDqBb28j8JWt85Vy4g42uwQIPklA5nVCNWIJGE6PXcF076enzkJTnJymUnaJ
 EQAwI7fPrJ6vJN+yw/sUJ1ZSDjbLJLBk30rw8ZEoGyeiXtKO7W4lprZnYKAO3n30vBn1
 jXsBdhpndStAnduXkHijlTsRSIU10V5I/r/JgSZCApmtjnAU7xgGbgwCphmnE9MTNGm/
 d6HxjY6Ni8tWnLKpEniY4Rn7bhd5EOLb+DSe4UmwgIgyjZg9aNe7n6JFetTCOnlbDXs+
 1ORldNWr1ZqpCfAcibm8LpdwPy9rhbasTVJGjhdQbQBFyFii8xsVfa+Wv8zL6Zfb1NF6
 Xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769657443; x=1770262243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mgy9faw71GwmUFuz/2FNz4cVvVPkiBCcNdsR6NNnOJo=;
 b=KMo/qIIfAv2q9IgM74xUwq7YV6LRh5PK5jUX3IaFx13fci+Hq1rGELVUAAY0jnMd9t
 OxxZWCE13SW9W9vhjtdpYbqDNlBzpY/yzNgE+mwd2BD97WMJCSqj4ltyKTBkh9ufp6oF
 rh15fqurrbR4+m1bcOs7KYQ0MqrvgxnimICJIhYIjp9r4Q84Deu2u0U1GaIqcyHXsIbK
 xI9YB1OznBUyepXSlZOl95A+w/0VRtHQArBRKoK1KQ+OBk0VP4cynK3yr+6gLOOJA6dx
 JjHV5GktkXoabP7TV9u/hTiTWz+Q186afIM5sK9jTNgfjDXvifRZ0lzgKdcUVswMWVCU
 Crrg==
X-Gm-Message-State: AOJu0Yzx74JYcbc7NS6R6Lj0O6iw0IDT3cAdnjw23a536c21cKlNaiM8
 mLfJ45Wvf/9uTwAdsWQNXO+6IJAUhRUfp3vsptT6aZ5G9+FmgQXQYqDM0WZku3JXOvw=
X-Gm-Gg: AZuq6aIZDhPEppme+drBqK0KhQ5nhdFFzvkZZ3Lfy4OUmO4ttdi1HLSYNXPpBficUi/
 L+p4UHKnnVsEAn9i6fDmfdlg2WzflJqunTXerLrWH+3YACrpfBTzktnkHsucFhrhVULXV4uboLE
 CWEUvrmWzdGXHpY2yhB/ES40G+g2Lq1G4pETBUnBpm0guBjXj5ha/nw3HFhwAREBQDu+cozjF5z
 TGe80cTMKtry4pl3mR6fB6RQdtNlDOe2CyKM2mPsTX771/+GShcyzc0PrFZhSOAMrrogEd/iLhn
 LdhpJ8AdXovPtNYeX9vVCXpdXBsW05A95mjWdLzdFfz/bze+WmgABqUeX7K61IdICevlG51pCkr
 d2eCYXsF+fweWVOoU9KVsfS+qM4h5zF5umV8/zBHrKIwSUIhQ18RpL3kVE1nBWmD9eLHzlilGsU
 P3eOX8eHpyLJBI3pS/XmqDQ1BveGh/fUfMJv/ZXvn6
X-Received: by 2002:a05:6a00:4b05:b0:822:30e:d15f with SMTP id
 d2e1a72fcca58-8236915f09amr7112144b3a.6.1769657442919; 
 Wed, 28 Jan 2026 19:30:42 -0800 (PST)
Received: from yc.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b1bc68sm4025267b3a.2.2026.01.28.19.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 19:30:42 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, dianders@chromium.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CMN N116BCL-EAK-c2
Date: Thu, 29 Jan 2026 11:30:33 +0800
Message-Id: <20260129033033.2046228-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:treapking@chromium.org,m:linux-kernel@vger.kernel.org,m:yangcong5@huaqin.corp-partner.google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[yangcong5@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yangcong5@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: A7A42AB72C
X-Rspamd-Action: no action

Add support for the CMN N116BCL-EAK-c2, pleace the EDID here for
subsequent reference.

edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 7a 11 00 00 00 00
08 22 01 04 95 1a 0e 78 03 46 a5 9c 5b 53 8b 24
1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 e6 1e 56 e2 50 00 3c 30 30 20
a6 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 32
32 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 4e 31 31 36 42 43 4c 2d 45 41 4b 0a 20 01 80

70 20 79 02 00 25 01 09 fc 34 01 fc 34 01 28 3c
80 81 00 10 72 1a 00 00 03 01 28 3c 00 00 00 00
00 00 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 2f 90

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 108569490ed5..54c73bba1c14 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2014,6 +2014,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N116BCJ-EAK"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x117a, &delay_200_500_e80_d50, "N116BCL-EAK-c2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x124c, &delay_200_500_e80_d50, "N122JCA-ENK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
-- 
2.25.1

