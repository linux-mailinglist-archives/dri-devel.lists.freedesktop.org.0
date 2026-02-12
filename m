Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPI2CWEbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F3F128782
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBF610E676;
	Thu, 12 Feb 2026 00:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jTnaw/Vu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14C110E674
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:21 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-662fe3ff6f6so3791232eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855261; x=1771460061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4prZoq+o67W5OQsgLrKexlAzQC80y9w+24uEfnXM5Y=;
 b=jTnaw/Vu1BABBid1QpBpO/eugJgAfreXg8eYP5E9F96uwPjdp5lpSigz8AJFvLg9DV
 8SxsVFyC+t4Kv1d+jkXNIBIPXCG7LPx1NIityy+zGqOt0L/9Ual9K7qmvp6Imz7nRRTx
 lKe4QrC8JCZgMzEha0nvgAIJ/OqIFLHFRJF4nsOPuCmHhw474ILrJDGy73yD+TmZ0i9I
 ri+58SL0Dz0Gjf8yO69CyaOyhTG6TUk4RTU4AuNMzkaq3AdhEVtMQvgKAyyyBeWWP3Xb
 3aJTta6kT8tEr7qTwXSjpf+ZlYKuelZ6USukXOi8mMfJbQxI42Agqx2t9RLeMzEBP9px
 pxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855261; x=1771460061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q4prZoq+o67W5OQsgLrKexlAzQC80y9w+24uEfnXM5Y=;
 b=skECcCTX1lQAD1N8eC6atjGrgVIKF/lcxuN7D/PJhAtJ6Ty65NSQjH1VrilcB4l0ZR
 P/pztGoIskox+UC6S/ZWMSDZyOsuELtZV4QIS8E34MhlDog47ml4czw/ZNFDwZziLbAK
 ITqyK2J1IdaLUbjEKu0647D1sjSnQVNG5FHUSRjIwyuegdugI5I/zfmhx6DdsEpXPFVP
 3Qqc7nuxh+4Y7+PkM2kd9oT0iBrNI7Y9Wqou9ACkmfY0BjWdGWahWALWIsACffJP5GKc
 3wwZixPp0ypVvdiOx5XV8QViVGb0DpqVysEsrqtdjjrz/qUtYdvSX4UPRfMtFwtmEqMR
 J67Q==
X-Gm-Message-State: AOJu0YzvOwHTnFLG7YKZWKtJ/bCxTyos0HixFqWACM0ZAMt4ONHTc4XH
 i2KW9lKISatJbkuH6X+r4K+0KnDOefsc57LLKkYiwDBBhqUqReH0PnJJNXMT8Q==
X-Gm-Gg: AZuq6aJC3deS6DuNCO82TfaONTcU1qFJgXonEK5UZ8rdE9l6njEckwwT8whn0uXu/Rc
 4MQpiK7jvrk1dKq9Vo/NRBY5Z06HEkwkIaliU/WrqNbTcxu4ioFeuHhmV4JJMduTLvGFQ7UO9fE
 Xvwm3o5s+ZpeSLumCysT4Nho4NowExkPwdJRvM2NA7HJ3wZuEBpdl6/wdv4Q8+Yo9j+IeTsAfXj
 naOJNBZAXQ1CZX+sC97p8upRBZwOJyY0r5LBFFqO4mftrTL4gAAgQ5g2+wrn5ytqWqWBYz6mNy3
 tfcw6eFDXHbYC0Y3kYkNrvaKgFfbC2BRtnzJ8yiCIKLWzX7A6uYxFsU5pPigsdqYiTHSkXezM8P
 QPVJ65rU0DIGC35GeQ6xkiASr4VH96fO3mSnq5aI3lYxMRgBrwn03VwU6wywFv/lK01d459Sw9V
 jmr+FicKpQfEV9KWTCZ9TzWY0sG2FwD6U1e4xGKtq/IhKr3P8gOyHOKV2QWIoOv4s=
X-Received: by 2002:a05:6820:4688:b0:669:fb20:e9f0 with SMTP id
 006d021491bc7-6759a559c94mr437333eaf.50.1770855260924; 
 Wed, 11 Feb 2026 16:14:20 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 09/61] dyndbg: drop NUM_TYPE_ARRAY
Date: Wed, 11 Feb 2026 17:13:04 -0700
Message-ID: <20260212001359.97296-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-9-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: C8F3F128782
X-Rspamd-Action: no action

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.53.0

