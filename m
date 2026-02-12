Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKTRG6cbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A4128934
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3487810E6BA;
	Thu, 12 Feb 2026 00:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kEjwhP2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com
 [209.85.160.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0546410E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:10 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id
 586e51a60fabf-40427db1300so4333911fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855309; x=1771460109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0fGu4QGMPOVZOkUPWUZRMEmyQSc15u7Feu/5vlGeWs=;
 b=kEjwhP2wXwpfb+579/EeAoKEG7FrlzfyiLTn+oiPLVcYvT5kMRWslsKxE1PGDhVFX7
 jq65R1jra5eV5HBtg0MaZxh2bHWQbMcr3QcE4uzD5ibjRk0f1D8pSue7sr8ln7RsvREO
 djRcXFKeKD7rwhQvCeCi3ecYYR3fM46TGl+2IF/yBAMYMbWSK4FU5bYBI/20CEczjau5
 bd60oH3bOsUFDP8aet7whwaSyjJxdt6iHaOK/idlK4gY/xyua6IiFOIo0vxPzdXmOMHt
 I/U9pgFL5SGDpx0XTOMJbBkpEpt4Y98bMgtA1plpLCZ2SnUuenhsSbwwqbwKgqBUUYoh
 KSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855309; x=1771460109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l0fGu4QGMPOVZOkUPWUZRMEmyQSc15u7Feu/5vlGeWs=;
 b=QSRJBU8WOrSqxaOMF6xY/lKs2C+7zIYApmgNMo3SjI0okoDBBCJm0+N6Fe6OMl/jIq
 squgNDg1j4X7G8dM/yZ9yqD5ullc23VlrsSHHBpo3KDGq3o/SMMB8kZ6eS6ww0NyAkhq
 xg3V8/WGawn40DZ4KC5GNgP54q0Bvyco7ka5cAT1WuPexBKqJcRzAswVUxKtDn5yZa7i
 tyiojTYIvPceW628AX6X2X5dfS1H6aD9g1uwavar3a+9XrZ3CVWSLXShCy8lH1SXl6cI
 APg/aqBqFq9sC+kdWLZusOVLFkpJ7GH/mhWzb1CtnhpFxlJ9oPxwqUTqxsKjn5JIzzMT
 H7aQ==
X-Gm-Message-State: AOJu0Yx6OtMl7aOB72XFe8ZDBJchBii6RndiHk3xxtqk3mulWbg6S6Rv
 zvSkJlY2RsVzhtpW9wooO0fb00AKQTT0tWz5ff4CVO4lUdJ6upY+bD2z2E+6/ixe
X-Gm-Gg: AZuq6aIs0DOwNe68RSJ3eZ20huAp/XBpTvyBX/FOhcqWsIJujG4VPzVLmkWtMDbutm6
 6EForC7XyMCAxTSevUbxqXnY4lW43mOEfWnKK9wQpjseTZz9REOvwp/w7e7b+kWAHMP6GWqBz8d
 inSxjzm2i0zOHVM8V2tQ90U7f86kfAijR/i291dh8rV5jzqflwuALoaQOCNaNtPfN5SJ7LT4rRi
 9uPgoWEfHTctcXZpmQt1AcALrLl+j/geWtOEjdw8XNkLqLrbq0pAxPBpfbVcDER7m8q22DXXdyO
 ETDY9uUATHT+fI6yJUoOVXKPGSuyqw41ySt7a0jpIBl63BOeO0yqfhJbdFEJO6N5j/i5LzRrJx/
 kPgsg4xY0vgFlqUl9R0QwLksEl/Ge2ku/fjrRHInQP2RrctTqnCr7SiofJLuLcbIfA5pH7PI8LP
 TtXSyM86pizU6BdBAcPWvW367BeTKmtzGymSHy1W5hI0y4V9Roov00
X-Received: by 2002:a05:6871:4527:b0:3fa:966:a859 with SMTP id
 586e51a60fabf-40ec71af3d9mr559437fac.42.1770855309092; 
 Wed, 11 Feb 2026 16:15:09 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:08 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 54/61] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Wed, 11 Feb 2026 17:13:49 -0700
Message-ID: <20260212001359.97296-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-54-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 228A4128934
X-Rspamd-Action: no action

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 42135a48d92e..b36565c7856c 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.53.0

