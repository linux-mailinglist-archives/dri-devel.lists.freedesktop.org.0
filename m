Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAW/OZgbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE681288C2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2293210E6A0;
	Thu, 12 Feb 2026 00:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rf7Hd0ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D0310E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id
 5614622812f47-45ca17ef16eso2095757b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855300; x=1771460100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=Rf7Hd0ixWdnvxxbMLqe/1RsZy0onprjunKNzqixP3hE1EXH7f5TnjqtSQIGmWSQcAN
 Jh6+mQIMtKDiivWqMgMueYHMBj6OLz0SCRvWp2kpJKmN4aQTYhofMHfV30Q/jneNIz7a
 apHAgBrjKURNGTnmwgflAElBvxpLg1KFvFAQ+t+73jX4qXtHqRdL+51GM3mFOI5Ut+OC
 EJwLX+iW5QHxfq9eqMQZ0IkPcrJsPyAY+TdasVnawB+blBnPX84hFrIS5y+Wf+rEyfSB
 wQ8v5lM7OzycZTyFXtlV7y010ADu1N8mqDVznfJsWCn62l2g9Gp+/ydPOdVq8eQX8heR
 MbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855300; x=1771460100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4Ts/LFRGubV+qE5nUbczy5fsPH9e9tt1w1L0GvmpB2A=;
 b=i+30bbxiQlN7BmtKsJaoOB6LVRI+/yvBOVwTrRD6aza6kpsI8TFRKTpKOQCcLbePI2
 Z81CQH+RdI0zBVBMcNdOjG6w83VCSeMezpAoXUOhcNwgwiAF+bwOm+VvsM8BM1SweUPt
 9ABVhCkZUiw72MV/kjgU9ObHHjzPx1RLBcMB97tbyzORbPLyXgPRxU+0bvb79Hpw6lK+
 YSu4YGYTB20iXxH6PqtQQEY0Sz9iE4hjl52QnWt9jEQ0VX2H9vV7P5YEa92Jt/Bbx81/
 i80qFomofN9ZFXFaTk81P2x/7viYlBF8LE3dTnNejXZWySmJaboP1T9QXhd5nystaXGp
 NMMQ==
X-Gm-Message-State: AOJu0YyR4bOiePaNge8UsSvEbTeGPzflI0/3ZMFO5kyF8VosmwwJk+G6
 ry/K59ml856NeN5bDDZUrRiEzWDh4Ctbp0ftCG7SxrGEzW9+Y2mHdddEROYDC3ib
X-Gm-Gg: AZuq6aIGEzi36b90trlthS+KSbvDMjII2qFLvdj+swo9OYPMLefW4yiDv6Zyc7RGspl
 6/PwUdaxwF5zqIKeCdGflzWYiQ5wmeaSWNfNZ0lG0V5tY/PqgkV5JskOigeXUoQDWtzpxPYwtcM
 oLQEfWV8D51LnCY67xw1ESDRcVY7TLqUFjkDDzbnC0QMKMggkdOoDenghBC5BtSRClKs/at0llG
 oESRvNHoCfb1/uEZog7U7SjNVTPwRASfoEYPxGo8IBe+PsdzHKadYin/VNIOUGcU3+fVHghk9HV
 fABOwLUAPf9+C12kLKnztfB1W1dvMveUGd4fr1PzxH4m/bgqg4jTSQ3ms2FFy54QtqLV6yynsWl
 hd+Mc/CZfuvYS73jck2omqpofXuxPx4gh3FQBEal5zoyybkoObzK+HvxOPMQ9FH5CzWJ40Tt/1b
 2cSFSl4AEVh9KEMhoxDGE6Kd0+ZHyWK/vbGd/Ea0joPZaZFY2GSLKifk27kLr2DuU=
X-Received: by 2002:a05:6808:c14a:b0:45f:13ad:83c1 with SMTP id
 5614622812f47-4637b8cad03mr647721b6e.51.1770855300593; 
 Wed, 11 Feb 2026 16:15:00 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:00 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 45/61] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Wed, 11 Feb 2026 17:13:40 -0700
Message-ID: <20260212001359.97296-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-45-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
 <20260212001359.97296-45-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9EE681288C2
X-Rspamd-Action: no action

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 7a95d2dacd9d..8958e115abc1 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -35,6 +35,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.53.0

