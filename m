Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OHOFo4bjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE112887C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494D10E697;
	Thu, 12 Feb 2026 00:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FWNGyIFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB5410E689
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:05 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id
 46e09a7af769-7cfd9b898cdso1633965a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855304; x=1771460104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=FWNGyIFRDh5QVG7sTO8bx6FQoCvgI+xsZ7Lk/J96Gpflxj5eMifXSDCOVn15IoQ2PY
 YgXAxgSIny4Y8TJOhhXyAO3ufEFvKJD+i9Ajkpw08AQqbbOsMDz6G3SHXFP9fziSjlNe
 AKhg0cd5GdIIdeC4/ZZRSI2pIf8Y4Jnsd3M4NbM9LAtdCDMsiV2PT6CMg5QJTmXfEyBW
 tiwMeFdfQbpVgTCBTm5JdR2P7SU3fdvSOJDru91unrxQotYSNQtxqhijYhM4Dm0gCYI/
 cpbrJyCGzbkin9w1+RHMralFDq3gnXvzbIAqPrHeGoC+ZQZ9QjXDvW8Io3d8QxdC/7tl
 XxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855304; x=1771460104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QeA7b49GNmqPBpy8bbweHTxpApMcFe3iFgz41hqVwCU=;
 b=hYQRw76G0jVzZHgJqofztm7TCFs+lqKitPAMQRiz4LCxbclw7yd3Gii9Jv2KFPzYZU
 wTPVTYngc8aPoE6cNzFyntPzWcUBqjOTqEbgJJTVwdrTs2G/Gbu/eO9svIsKqZh/81d3
 ElYHh0aJ+04Xc5isSaExV27n60HRZERMYzI63Mw48NaXTkibWAeTfhyqGlBJlvVJLNT6
 Foqvn3EDEVu42Y/v7FR5PoZc0hE5Zsxa6v1lLa5YYxUsAm6tUOXy267sKH+xNbK1F21/
 qp1owJw1JkLOSTchTa2fW164xWEp7RjC/83M+NMUXwXd3VlieroSITfMkN+WsE9Knbbe
 wrBw==
X-Gm-Message-State: AOJu0YzgKgsmoBoW1wk2uJWTuKuTCy9QdJG7p0lJ8hMIyhYnHkG5ZbOm
 YDDuARTK+9dmQ2m0QkIPZQUkYc/xn9klAIHBtDtv7RzL4mqDaevrKvxMXMyzn/oc
X-Gm-Gg: AZuq6aKs/86h3ODXXAXJm3BIESS53Hkuo7/BKef4LO7SAgLZGy0sruXmzPj280qKGZ6
 9EOJi24/YBCVLE2LkuHmUv1gR5AIY0a7W1uvDyUZbqLzxrv57HzO70e1Vp2SyHdE+mBV0mijdeG
 N4inhDqONAmV52VuZ793xC3ZPGWua0v3h8TrNwPWOTSi+hk5Eu7S/A44Znc5gH3rUxKR8hKsB8/
 6ez3hE56vpZ9sSIeMsiymV7rcSrE7EE9PRuvwf8+mrRyuPVzUxndv0wO/atDUFglolK7XvRijRO
 1E14+FeE0b3xfO5kjEMZHTkhg0rI+D68R0UNgUqROfTQiP+ZLZhmR+Wkbnu6XyB+dkr2pPSOZVs
 dgyvKV4Wd883k0QtXIncjsZKkSCot0ZpogAZ4ortWwEjzkt/EJrspb36iGP8fH8+8guMpEhxSX3
 IxXEG5egskOldDzIVgUH4tSrRreruGWZy9vYTAs+DBvkcAqqgYHo9l
X-Received: by 2002:a05:6820:2103:b0:66e:bf20:28f2 with SMTP id
 006d021491bc7-675dae6796emr151513eaf.15.1770855304157; 
 Wed, 11 Feb 2026 16:15:04 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:15:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 49/61] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Wed, 11 Feb 2026 17:13:44 -0700
Message-ID: <20260212001359.97296-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-49-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 0CBE112887C
X-Rspamd-Action: no action

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 87fd6255c114..a7133fb6377d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -254,6 +254,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static bool radeon_support_enabled(struct device *dev,
-- 
2.53.0

