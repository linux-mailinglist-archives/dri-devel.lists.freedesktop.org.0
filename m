Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK/EKpmGrWky4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72333230ACF
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2190810E44E;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hxpC6AI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15A110E04F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:29:37 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b935b8dcab7so1419973066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789376; x=1773394176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLeEDEhf9GDxufVHFP+D7orc27n/ELYDA5X3/DN5+c0=;
 b=hxpC6AI1fxYYjYqWJpfM6SZguA5FMdcuab/cHR8IQ358hw/6GoGVmIZUZrrnDqhEzE
 LVEZATx7x+phWgIcwJoJA1tc1u3FJZIYQAca6Qsp6QP9e0tubLHGu8kXw8JqgYYKTa7y
 5mLb4P4l9wFboKPHg1pQyzrBh6Gt7+rV+uLZ+k0JHExuP3PzqFzeo6ofDihhddj+1MOg
 Nkt0mGnIWJ0IvaEG9h13zPK8YQvNlAlEuksOfV9ZZDdEtBvK0njNF4xsvT6W+3v6BP2u
 WAeZeasrD0NDTA2Ez07gKOIozXMNGaCgVg9kB9XcR6KlhzDWULRxJlHfjj4OuzR2QyTB
 nSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789376; x=1773394176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BLeEDEhf9GDxufVHFP+D7orc27n/ELYDA5X3/DN5+c0=;
 b=hoMM/ZKjLnhcX/ecEJBQGDe4NdRaEAhb2C+TM7+cvAFUPAS2fFh61JZESIguerVsXd
 F1KCLZblgHPGOBUcydKb8uaICWznuiwM+OM2pi884WxBu8WxdIfOAjFs8IPg8UIyzZHB
 LHvot4zVyJlm36Fhi+OOyXd8bqWucQWlxdMe4rR5qU1K5E0jmyct1Uy+JWCjhgWUra3T
 rCksR7V/uwAqwyy+ThbBSjcdUTY1atojw+Myx+3qYjsMvd4JJ2pnzQDJSbJH6MwLPszB
 bUtCCnJcxnn5s1wgk1I+lqTHANidpaz4KxgeSiNmxnZLT4z92XY2kMOr4RKCZfz8Wwm9
 Y97w==
X-Gm-Message-State: AOJu0Yy8j1FdHFbci77NQtSBGf9/4k6/XHHtZ5bP5whqenDQzDSKIjJX
 OjXdnRsg70be/CyW2+P66iEvZWKWN3mpa7Y8Z+h4xgD9odobiVMAiApC
X-Gm-Gg: ATEYQzwXEhUjvz1gleQLgNs56MJsgwjcI2k8lkPf0012m3EAFsRj8S72BFOKjie5C0P
 buBBc6e33LGBMFvLGPpa9jwEIa/aWas+bs38l7t0VIDZMufL5NF2zGO54zl2KOeGBJqj+03rK+k
 yr7IMZGA450c7avWolhK+yySE2O4YwgFd4BSyTsot7tidD+Dqk8r7efBMQfCo7asCmAndmhdQqh
 yFbfSlDy88b1/54M5U7npGyFaudieMGBoz9IMSE23Vg0Rh5+4PBWoAyJX2Koac2xE71e67618J6
 PsWlfv0jTF7m85vH5McMtaioCbdPKSD7gleS0DXyBYn/ZRw/BFWxMVerp4p4qyNsMEYCEzT55pA
 6MnHG4nrX/7YMEVPECtfjYpI3xRgzf/JaxjDnhQY67UzTEJjQZcta/3cY6b21KdjMcqV5Km6b4x
 AME8qJFkJHYlV7vzpGWehMPOd0+jRQF7dtDUZFjoDJE/6ffWYk7MbmzSS354aSa3HlJwklp5k0I
 6g49IlrZlRcJ/9gpCupU2GxzU6XgGbgPUVlrGPrFOAsMfmR4NEtl+gQHw==
X-Received: by 2002:a17:907:d09:b0:b8f:f070:8c30 with SMTP id
 a640c23a62f3a-b942df8ad63mr78594766b.49.1772789375925; 
 Fri, 06 Mar 2026 01:29:35 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl.
 [84.24.131.219]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Mar 2026 01:29:35 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 2/3] docs/gpu: fix typo 'implementions' -> 'implementations'
 in todo.rst
Date: Fri,  6 Mar 2026 10:28:21 +0100
Message-ID: <20260306092822.48393-2-mrrothig@gmail.com>
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
X-Rspamd-Queue-Id: 72333230ACF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[52];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrrothig@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 33678b669339..4de61d19ecc6 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
-- 
2.49.0

