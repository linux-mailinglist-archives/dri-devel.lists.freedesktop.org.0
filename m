Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MtRC5MbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70C128891
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDFA10E68A;
	Thu, 12 Feb 2026 00:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKKU5Ddy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com
 [209.85.160.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B03910E689
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:02 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id
 586e51a60fabf-40438a46d7cso4152256fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855301; x=1771460101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=fKKU5DdyMnNyNLOuqyMF9wZmBhLV8K4BgUC3suhtGZMNyji945BoJBVnBCACipSP+K
 9An8Eevds4eRS2cJmxrY4mTBqoO4VnP5b6c+rnldSMdXKHJefOakP0JnTyhy3jOYE15w
 XAIaLnUB/yj0C2wd4CMgmvqvg2pprJKij8TrXA5yGrJidRLgrSEeq/ZeWKhyhc4r5qMa
 ZizoaT8nsi+YKpb202qJzPqoUDZ4kgMCoiP/8UnJwI360bjUCKRpXW+HI5WMb1D5UHTF
 qANPWwMi6u324guW1Eyar4SdLFaTrCDDsf9CQhYiLHTXX+GOub9gx63G7ehlSVdYrOd2
 l6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855301; x=1771460101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v7n8LRPhTnKwHNdLKddxIC02c+MckVOPZFH0J7I21NQ=;
 b=oujDB/SiAxlt/ZAa+Whwo/I7ySncDR63H/vPpFuFIqp/+11Ig6MUxMRCbrFCS1krHh
 fXJMG3MKIDBZsMWtEO3Jbst/GIZxP/2+CVZoPU68D6PgRbInTeAQavFJsCyehyliZQ19
 oe5ZoP/t43osKROPdXUJRxKcnph7jEch60YFYAFIuQDpTOiUSffC/Eh4rGF/wjY8J5m0
 0k74O70UzL8rWd7BllTOjC2jNnpO0gA80c+fiGMD16PpAlFM6yBJjCzQNLRr1z5Dy4Fz
 mPeVnajyAvn+TmY0F1YKoHOLoLas9egJIAn9d702Jqg16fFR0TceTe/V/s6B8hZehMUQ
 Z4gA==
X-Gm-Message-State: AOJu0Ywn1D+S36KLYR6J34UcIxMjFTkcvXBMU5O/mlYk5woGsnzcRfOl
 9ZsmHAUgCNJ2MJmuNqpXFUSTvP5d0j0bti4zqM1UIG+/sVs8Wbk5L6omwTa2ltdl
X-Gm-Gg: AZuq6aK8vogFuK0onfjRQeXtz2hbZSZoYT3JU/t+E/lPJYy+frYMh8V2Iv6XOMfEzKg
 Zp+KpXcQuKxPoczhrXqMF8KgZE/Ik+tRziOy0looUSA1x3Mv8tsr1HICArglCIEWtUHrkRbj3bv
 U5+x+yAOj9Cs9tZyhMAz74Q6AMrUxnzdJo1uEmMhILIHK3lGrfCMSnaSGiLKckA4KVB0fURi083
 Ysdr8RzPx4kw++O2N3JKaRvK0PqniSlThHIKqBxLDgWYekhkm+Y0rCsKOOE7lYtr9ESi+f0984o
 xDEvJhf3kJlyEJHuVUWah4ktM1ZTHEACOK1pX6Giv9MqA0N/GrI9ICfS4dPsUk+3WCu4GKEDt7Q
 RmOLnSc0aGOf+IiDkvSR3VTThunW7BPfMR1I+MyoSmj7n2cnRTwo76tlacWQ/AU7Bxt+5VuAS2O
 fSekwdlxRDpUYhX2y5WH0Ll62nFvPaxANps3iWc1vjQcq/L9NRbTzm
X-Received: by 2002:a05:6820:210c:b0:663:813:ef7 with SMTP id
 006d021491bc7-6759bc9ffc7mr459419eaf.81.1770855301426; 
 Wed, 11 Feb 2026 16:15:01 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 46/61] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Wed, 11 Feb 2026 17:13:41 -0700
Message-ID: <20260212001359.97296-47-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-46-jim.cromie@gmail.com>
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
 <20260212001359.97296-46-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: CA70C128891
X-Rspamd-Action: no action

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 222e4ae1abbd..8f04666e7def 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -63,6 +63,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.53.0

