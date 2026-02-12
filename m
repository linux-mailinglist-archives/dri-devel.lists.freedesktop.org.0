Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBCGAJwbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8C1288D7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB3010E6AB;
	Thu, 12 Feb 2026 00:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cnJoUCtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5432510E69F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:16 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-4094b31a037so4225137fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855315; x=1771460115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gm7ZntNZuFGxPMk6flCONQAODwq8mEhCsGyERxkKRys=;
 b=cnJoUCtbU+39koaad5wrsKyZOB5Dj6AEgrfPrbPHdcJTXTQsFeMarZqAGHp2eRSn3G
 sYo8Nh62wpB5H+TiBvyh4B5RIzRTw1vQq3ZDygZhKgirKYhDiUgfx/u0XSVsQCiYhY3Q
 EEsAwcDVX2/p7pvp4TpNrrQgUBUYGXUdvLkBw/P5Dz4AIYUs/5CPucI78Fk2hFUyJyp/
 rbeG2WVHHTxCI7fM8gYhQHM1p6W8sJCkpuZcEiNZLVlXc8rJYNoGUHoIgzQx/XtMvXAS
 09Nelr/C13FmI+i5qSvpBwDqFvccQo4M7E9kZ0aqC2ZWCQ4CSTSxAzg1bZjm3NcpSt/t
 2XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855315; x=1771460115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gm7ZntNZuFGxPMk6flCONQAODwq8mEhCsGyERxkKRys=;
 b=LVuqk+AZ245DX9iGSVuzr/c8MGCP27AUFAakVh+Ws0kGhWOKhluVJnNclv6Esjjmnx
 diNyKRPZcxYgLEfYt1FQopJxTukH2fi74cNn8KkDblA2JqRGhLNN1FKCh58GDQ8EXd1X
 2Xq2EZE7JWphXvmnU8yzrUPyTdg2w/eXXHN/obvBAw3uyVrCkRPOEeRUwGbXmQHfgJ+K
 dbK4f3JGwtmBkyYEJRIs4fX4gZX61MW/O6jJhPRwCkOQE+gXWxdl/7NUF4wFq+MqIigE
 urxX7Jb9/RYydSzJ2RC2LkIkSde5e4A8rybB77dgPcnPtOHfreJaoZxHN7LPsAUSAIg5
 CD5A==
X-Gm-Message-State: AOJu0YwyzsSUb5WPYa2qXjgBM8/dgYbMuseUE1dMqoqeEMoH/hc4OZOw
 Qr3K56ptpJaK3pew07OPo62AugvVbDwdEH7dPI9+7wcy/dOJZB/KmXiDeO0S2g==
X-Gm-Gg: AZuq6aLKlUQgwNlndQ2E4pO42aVxy/Gnmu0KbHyDsjPFfXPojG8l4Wb/sT5OCu58oVv
 kazHm++GP41xmxK08IR8ORS8fnT6mjdxDy04qzIEj5/XT2pnyje/zNk5FcNKzut1ldKGAlis4mX
 lKKD8H/Imj+Feb4IloEDiP05q69TfryBlhuq+ZhLL2yhd156xmrgYO0eMvBeZ70+7rwAWjIMRDK
 k+KAEiSmxajzsr5XqgqUuBUJfcUbzkJLFNYTJYFUM4mYq9GprSfaW1/QY5975oFYZPTZl7DVOFM
 0i2LnAnOqCa/j+KLtvbocgGQcD+UqNt/LmFV7RXfmi2wUxwokosm0uTtgL1/s/5uU5lB70NVqzN
 wRhDctX55po/kuufc33NDkcqbU/CF8+dxgzh3zNFB31oHydScxpuo9HJLaDGADAKM1FKR5P0EBT
 qNTu8+q4207BkasEXh0B0nyM/5f4+Ne0xv4EOCdkkMhbGu7g4/N+Vv
X-Received: by 2002:a05:6870:3809:b0:3f5:4172:23 with SMTP id
 586e51a60fabf-40ec733b830mr540815fac.56.1770855315321; 
 Wed, 11 Feb 2026 16:15:15 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 59/61] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Wed, 11 Feb 2026 17:13:56 -0700
Message-ID: <20260212001359.97296-62-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-61-jim.cromie@gmail.com>
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
 <20260212001359.97296-47-jim.cromie@gmail.com>
 <20260212001359.97296-48-jim.cromie@gmail.com>
 <20260212001359.97296-49-jim.cromie@gmail.com>
 <20260212001359.97296-50-jim.cromie@gmail.com>
 <20260212001359.97296-51-jim.cromie@gmail.com>
 <20260212001359.97296-52-jim.cromie@gmail.com>
 <20260212001359.97296-53-jim.cromie@gmail.com>
 <20260212001359.97296-54-jim.cromie@gmail.com>
 <20260212001359.97296-55-jim.cromie@gmail.com>
 <20260212001359.97296-56-jim.cromie@gmail.com>
 <20260212001359.97296-57-jim.cromie@gmail.com>
 <20260212001359.97296-58-jim.cromie@gmail.com>
 <20260212001359.97296-59-jim.cromie@gmail.com>
 <20260212001359.97296-60-jim.cromie@gmail.com>
 <20260212001359.97296-61-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: A6E8C1288D7
X-Rspamd-Action: no action

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 05dc43c0b8c5..6c83b1276870 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.53.0

