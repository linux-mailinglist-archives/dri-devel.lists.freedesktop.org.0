Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPGEGeUffGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:05:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5FB6B19
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DBE10E353;
	Fri, 30 Jan 2026 03:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Jr2DjMRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7936210E353
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:05:05 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c65822dead7so586979a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 19:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1769742305; x=1770347105; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oEURg7WwL2YrmTk3m+t4901sI744EiBH75OpucFP6iU=;
 b=Jr2DjMRfsBXRg7/MVO9/IVtILK+fHleh9oTTwsVtM2yg2C6Y2HAm/BY8gF2sTf4OCC
 47OKnSSct38RGmg1Ct1roUYDuQoJ+5BfaZYzKIFWSKg+vj/ksBCGi/aISriuqxf6nQIM
 sUIUG3usgQYztrXAOx0oRIBrkHjXh2f5HF7dmhq4KnDG3zb66JHtlUqYcjp7gjpvahTJ
 vTwO2gZU7HnHlk5itIbh38wnySz2uy5Hb7IWCSbcHdkInnY9loPl6/IXDbFO7ke6gnlJ
 1MnkWbb6lzv/nahR6sEio6MVam3mMR6ffUE+G5pLRKa8gSvSR545WKJ1Kpqk20yZr2st
 6VEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769742305; x=1770347105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEURg7WwL2YrmTk3m+t4901sI744EiBH75OpucFP6iU=;
 b=iAbyTE1Z9dCH/YLLDPs0nsAkzC+PjXNnXXC01pWvchhTP0iF48cStfQzGjCvINZlRi
 Mv6Q3bcyvaRsABx4VAUCOMmAQrxYOvAhPv6M1TnrhbBsggKBmsBMD7U+zypaqR7n6qE6
 t3++lTBhrTrBWEvIEBONN5V/Nl8LBS7ZeFkfMD52guKIC52xRGEGRqf/tRl5KXDaUstg
 uBzkn29ZPLxuE//gK5NIqmF0EaWIg8A4PGyAMuFCkrwsEIPxp0vHGShbmdHgSt3kIjIO
 sf0BqcfkYoQt+4ypp5ETyxQkSocnxL6/rWuhsRncU83CzcZMWnhIWJ4c4B5GpX+6CoA/
 8hVw==
X-Gm-Message-State: AOJu0Yyx9wN72Z4JyjP9Me4cssxuB1nTJ+1dJD6b0zVaSqyCSTa/k2p4
 svWpmB57U/dNsBzVxllUhZgCmMlFquHZlKqABd/2fhc5Cl42A18XoV5ODgeJ+dhfqqQ=
X-Gm-Gg: AZuq6aKz3qvWArYr9oGZcZCmuLib1iYblwmH2WL+IArmMwjT6JvStcu4U/GplzNNOPi
 pkUXYHULEPJshePdAc82UKyNBZ8FkTuJEV94fBorqiSZyOCQvwvRU3VD+fkNjfSNwzmr2CfxvCT
 jgaQoORG4xv0YoEopufKqX8/R02uabPtvFpHkK4ZI/Owstl3TJBDsch740GEoe5lxkD5VlZ7gvJ
 QnV108Mcr6THFGL0sL3816cuDNF9/oBOAfV8DlBwqzLEE2RH7fJ0aD+dxMy5gwuX2e2UkR2ZEHu
 wjw93TO6mUF4PHFpNFpltlPk7QO1TLd7uKIZLlC6EzsMOO8KhYsjYsiMjHTp5mFJWs9FdO56KXp
 bi2mdiSsWWyaEur0jeG3XKweON0V/Rxg5qxclFn8c9trVOdOCu2X8lgR/9EIXtl3yadmYcZERnb
 OQ0/gTQjf5MGax6vWGa4+P8AvXFmy1UrrInFV9tmkM
X-Received: by 2002:a17:902:ce83:b0:2a7:7e00:6a96 with SMTP id
 d9443c01a7336-2a8d7edda5emr16859865ad.25.1769742304748; 
 Thu, 29 Jan 2026 19:05:04 -0800 (PST)
Received: from yc.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b3eecb7sm60715885ad.1.2026.01.29.19.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 19:05:04 -0800 (PST)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, dianders@chromium.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH V2] drm/panel-edp: Add CMN N116BCL-EAK (C2)
Date: Fri, 30 Jan 2026 11:04:56 +0800
Message-Id: <20260130030456.2080748-1-yangcong5@huaqin.corp-partner.google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:treapking@chromium.org,m:linux-kernel@vger.kernel.org,m:yangcong5@huaqin.corp-partner.google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yangcong5@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AEF5FB6B19
X-Rspamd-Action: no action

Add support for the CMN N116BCL-EAK (C2) panel, pleace the EDID here for
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
Chage since V1:

- Change string "N116BCL-EAK-c2" to "N116BCL-EAK".

V1: https://lore.kernel.org/all/CAD=FV=V2HzOYcOgeY94h+Pk33=niJrQzzZF0hLE+VH8Jacbfvw@mail.gmail.com
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 108569490ed5..c9eacfffd5b2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2014,6 +2014,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N116BCJ-EAK"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x117a, &delay_200_500_e80_d50, "N116BCL-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x124c, &delay_200_500_e80_d50, "N122JCA-ENK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
-- 
2.25.1

