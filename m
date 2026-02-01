Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEA4LGPif2mzzQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 00:31:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC3C78E5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 00:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719E10E1CC;
	Sun,  1 Feb 2026 23:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="kkqn15ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337CA10E1CC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 23:31:42 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8c713a6a6f8so419537785a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1769988701;
 x=1770593501; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iIofYPxgXj265mORIxh/vbsy7xn+n/1xep48PVrEtbo=;
 b=kkqn15nyfaHVQqjE+KKr1T0xqJ/sPVyzS6zWvcVVj2hK+IampEomn1lMs+hV7PRLdb
 fc6rW8DXOPBYo78Zfxtg+nwHf7t8bE3Zs4acNuSGVbHuf2O5pA+7h3ISOCE1XasVoldQ
 V+buAfidlo4k7iGZ7sEYEvDd20QyLYoA3QjOgFPKoEaO+lVQlpGgSfZa5zyOVTi3Wg00
 jPOml7F6UqwIC/JZIcMc62f2HZRsi+wGGQmKsAoOYvjNQS5wKlCLKFIfCvCyubR0EGH+
 eHY1GlHPAfpQg8JMzrDG8fH0oC5/C1mGQWKpxIjtexdwlDqPGjGD64riHVS5TkLOqkVG
 t1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769988701; x=1770593501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iIofYPxgXj265mORIxh/vbsy7xn+n/1xep48PVrEtbo=;
 b=sfOEcQHB+krsThjTkAFKMxb/uMJnPUKEypJXoLZ3SYrJkzCzyvDho3j8d9zG2Pj7k2
 nybg5a7GAhAymjcWCG+ujarCnDoqm10LvLPv8UZApM3fPzZEYpWOur4u9O3VqrpD2iAs
 KcOJGh8yaPS9FKX6ESCJBWP7NhUHxmLNKdutWwGkbGZzLcJHj0FXzkxkdjA7bLjn/UFs
 o+dcVBhvKqLWM/mLxqtflnkTsmVWKQPVr0u/4o2JGYEP4s9e8XkG6/vOcePo6piIAKFi
 Y0yjjHazU6xFzLMjJtf1zfV9eF9J/mJY+Gpe0Z3NJsc58CoBQAvf1Q7dmylyrZ7I7loL
 nVnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV476nOWV6q+gzmg0YzaqnRV0LTOPU8Txf7N4b9I19DIx7v6czAnph2TrsDyWYtKGGJOv9+esPSLdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIaNEFAfn51AbV71TOryTxnZbEEhQxJmm5y4QZfO6iRmgKDmhv
 ZNrfJUTaTUnMf2jbOlZv8JA9I5A+uzAyn8yxymbIGKbepgQpJnPPoIMT0xBqztwb6w==
X-Gm-Gg: AZuq6aLXGsLG+kxRY6So0MpWbbGlBjuRGyk/bNFq0AX7felULYL8UnNfZN17GUjQNwX
 5nGrT1Gypntr+8pD0PRKfQ4WTTJGrzhsj/HrqXFT2PF/4sfrPbGewLwzE2UyDJ01JsV65zVMemX
 +BVDtuCShCdn0ZB4AcB3RDXhC1tNDdTe/i+HZ//JBuQAFkLw5hOUxUcVmSthzvAFsVbIgbTEvAz
 rymTeSHiT5QEtAX8Hp+jPB9cXGvL6FBmd6uqFAiJHETz7zKjfsnRmthz4XnUK2HgQtbD/9MmG8w
 t8OFka6Z+cbsr91GP/xiPcENodT/Enbq4EvcSIPYpSBMAq50SsRhF4MABr/oQlBMX/Cv5zcYbAE
 A9qxaBZ/vTlVsXe32MhFFwliVbIdvIZTvdpc4HFgm+d7rdmFXCEZp6ivCH5bEs+TD20xlcj+xgK
 Q3GMFrCswfPkwBVWwuDMyPe6ehakLbwe85KwonwOyjU0UtfgeY7RZLLPc/s/kowWm/AuwXmKG/o
 /rd
X-Received: by 2002:a05:620a:2914:b0:883:647b:6dec with SMTP id
 af79cd13be357-8c9ebd3b04bmr1009950185a.3.1769988701031; 
 Sun, 01 Feb 2026 15:31:41 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711d2ab53sm1107489885a.26.2026.02.01.15.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 15:31:40 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm: panel-backlight-quirks: Add Minisforum V3 SE
Date: Sun,  1 Feb 2026 18:31:37 -0500
Message-ID: <20260201233137.1661172-1-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[dionne-riel-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:samuel@dionne-riel.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[dionne-riel.com];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[samuel@dionne-riel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[samuel@dionne-riel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[dionne-riel-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dionne-riel.com:mid,dionne-riel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0BCC3C78E5
X-Rspamd-Action: no action

Exactly the same situation as with the Framework 13. Value from
ATIF is 12, which is quite bright as a minimum.

Additionally, disabling the custom curve produces a much more granular
control, especially at lower brightness values. For now this can be done
by the end-user by using `amdgpu.dcdebugmask=0x40000`.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
Originally sent as: https://lore.kernel.org/dri-devel/20251221185608.2718273-3-samuel@dionne-riel.com/

I have not resent the sibling patch sets, which implement further
backlight quirks and handling to improve the experience with the device.
I can resend them, but seeing that they are likely to incurr at least
one round-trip of work, that seems a tad excessive.

Sibling patch sets:
 - https://lore.kernel.org/dri-devel/20251221192422.2726883-1-samuel@dionne-riel.com/
 - https://lore.kernel.org/dri-devel/20251221200434.2735218-2-samuel@dionne-riel.com/

Thank you all for your time!

 drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 537dc6dd05343..64a1c1f7abe76 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -60,6 +60,14 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match_other.value = "Galileo",
 		.quirk = { .min_brightness = 1, },
 	},
+	/* Minisforum V3 SE */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Shenzhen Meigao Electronic Equipment Co.,Ltd",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "V3 SE",
+		.quirk = { .min_brightness = 1, },
+	},
 	/* Have OLED Panels with brightness issue when last byte is 0/1 */
 	{
 		.dmi_match.field = DMI_SYS_VENDOR,

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.51.0

