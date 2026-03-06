Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO0EABiErWkx3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064F2308E4
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8159610E178;
	Sun,  8 Mar 2026 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GzWKegi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97F310E04F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:29:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-660fc3f30c1so3856221a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789380; x=1773394180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=seZ2v6Zztz5cdfyw5k6l6tZogyzOdhCkgzc4DJO4PEE=;
 b=GzWKegi1TuVYBCu5cgjSBP6fSnJRBT+xdv/fE96skgTN9vANgTo4TUj/69Sj5Ipu/a
 vouf2l3AiBKXE6e6zd9tz+Em+x5+KiIkBys7w0ROEV0d/mQQzjOVfH46diNljcWBUMUH
 nZ3QBaacRH8enQ5Y3KV+pPeZwxMOHK0WKgGxXK0u7eaw7Gt5BQ96BcCcPeWF0MJ0dibW
 xRoz94b63dJxokD/qYkyJ2dj+BM5hC+6eSJggzUlMA0Aohc/P1K/vfNsXugkZJqVDXTR
 H3SppuGBMDmgNW5y2u6mmKJW0voVaf3h4h0JqzpS+/IA9xX9uOkPKncjqLrihVdaE4Qs
 BY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789380; x=1773394180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=seZ2v6Zztz5cdfyw5k6l6tZogyzOdhCkgzc4DJO4PEE=;
 b=s+L/7E1DYwq3wHbyHhOCVMO4GCvFbqBV1TKgYiHSQIR67NuhOVhc7pN4Z1MPp7HEYR
 1ckxRcWh4lrpX5bTUT1AynGIsN9z471eeUVTlIBRc3ApQefEAtRh7/CNJHq6o/LVQm8c
 sbfgw/bK1V0+IXtvqG6ogcLxz8X2kuhlEB/mMpTMW80G5O1tdhpKsDe/NP2d64PkcxlI
 SIRPRkCWn3Z5gCcZ6e30lBXlgviUGc9NSWbFAuqiri38M9fbLWQTXqcNyStSEsFsObli
 DolfyoinKttZNOeZyj4E5P9UcSGnGggm2j12DQrxLIvMqNsX2E5dV5Oq7M9Ak/Xl0xuF
 JBhw==
X-Gm-Message-State: AOJu0YylQO2TaQDmFv80PO9fXhk4azvI1XZVIjWql+F4MGN3td6la/wc
 tjFuRa/1tJ7C3LIeCkshphwqHLE0/XMRBBK2hhvAx9b5w2FxGe2EIUTc
X-Gm-Gg: ATEYQzz3HQHHF1dSvrhpYCgTYVq4Xzs6Fof4xKBXCwWORPiT0jj0CIAPMO74sGNEuPZ
 sOch36uQiMd33HwTmswYecfxzQ+0rG5DpQOdmNhjRH/qJNwSZvxliEDZOYBzdDL/dACGg/2O/s9
 kJNPmcy42EfX50cfz3pu2YRX+/W2GheFl5WEB93zvF7QFRIGjzBag5edJxAoBgklVQjGUd7zkqf
 VQMZqP1N30fpkJi9FluWODnJQWduKWz3SA5VqAFYUNzCQKDtFWqsuz/WT8elEsmIQFHE6cAjiIW
 5quElVhOEAbkEB1QVplMFfGxd6XlfZStLDW7ZFWuU0A0omdKWbb2KKMUlgbN/6TR9+a1/l94Cm6
 LZbFV9b8Sw7XzLTrODeEPW2/dU7QSDAJnHVsoE0wNwVnzE6zyR9qEfM0kpq9lmnEoS5FiVCyi9N
 K+byuw3+TY9jGEuNAAnvrmow3pZXpGZN10U/rLsUsBrUr1ePPcN0qK2Cx4xoSMsqZDdkixQY5zk
 RMB6OA3ZuGrkgi/C7QmrmtkP7JVZ7PB1oz8D6B0U8Pd/XyCqPZNG5xWkQ==
X-Received: by 2002:a05:6402:5209:b0:65c:2377:3344 with SMTP id
 4fb4d7f45d1cf-6619d54b1a1mr755276a12.25.1772789379944; 
 Fri, 06 Mar 2026 01:29:39 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl.
 [84.24.131.219]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Mar 2026 01:29:39 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 3/3] docs/gpu: fix typo 'complection' -> 'completion' in
 todo.rst
Date: Fri,  6 Mar 2026 10:28:22 +0100
Message-ID: <20260306092822.48393-3-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260306092822.48393-1-mrrothig@gmail.com>
References: <20260306092822.48393-1-mrrothig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 8064F2308E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	DATE_IN_PAST(1.00)[52];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrrothig@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 4de61d19ecc6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0

