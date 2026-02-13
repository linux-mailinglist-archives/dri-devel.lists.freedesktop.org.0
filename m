Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BWFOFMUj2mqHwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55E135F2F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 13:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226810E7DA;
	Fri, 13 Feb 2026 12:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D1FK25yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3510E7DA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 12:08:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so5109885e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770984526; x=1771589326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJzdbyANzV6mkPuqznRpgXIWmGCXzKevIL9GAIcIe3k=;
 b=D1FK25ySO5q+9I8fQoXxei3gvYfX9sjzG6egfF78+MkJQELK3/ZO93yHTXv9VWY5Jt
 h3i63bQWgLp/rvh0nb8TRNS1uPRzri+sw22AB4CjL47xiE0GWrO3aXV8QyhfJvng+VkQ
 f1yK38UTeU06e6WlitGy+JDyvvZgRFZICTPr7f1OtotmKnMKhUJtXHZjii3zMtYfn5xt
 0V48NBm8R8aMAMarvuHlbQS7LZV+/M9hSxPhPzDnbuLPc42wWSlZa23ATltNuAXnuDX5
 aNRBg72XHbq9EDL8/VB2AwcSqOg6cjeEMp+kMfBuCWT8ZastHjELWWgVu+r6knkr3o6l
 p/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770984526; x=1771589326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lJzdbyANzV6mkPuqznRpgXIWmGCXzKevIL9GAIcIe3k=;
 b=N6WbZGCleUxkh340OIdp5oPrKKu2JUCR4ZjZbSWktDmPXxFZftFq5ZGoEh7bHBaXRl
 KC1fXf9dZOb5IRqZKd/EuNpq95fsBticAMHvU5NVdnIuLbwsR+hIzr/0H66ilhP52p0O
 g6y/Zlf7qIiq+V1Xj7sSLWYm4AxhLwNQJrd52sjcVryRhvBAa3frs1uZafM0OXCD6NMU
 WMBWjFemUePDwqFhYPOFm3lL6bu6Wyyk0gDxltVh4NUGP+mTwCtZNVaNu5w2qemghrEe
 fkA2IgOkR16p7PJnRM1mDzabV7089r7ADSXJL4GCghSXJTyS8hy7pOQtY9/eOjB92YgY
 jaOw==
X-Gm-Message-State: AOJu0Yy3koFcOjR2RhRsQakNW8RLfajwYn+llHY66xl6N95q+QBuY5/Y
 gidztVh6sDl2wfzlWI95CkDt9WARfyh09e77lQa9Z4caLYE/kJDOfR86
X-Gm-Gg: AZuq6aLZcg+LKHEHG1MQOW/KxcMyo+dXgO/I9Nx2KLACvdhK6rWqS9e+aP/b+knHz/q
 oFlMNN71OlBWqf1cbx9RVs1T/HyIKlENRm+zndtb9UT08upS/8JEmT9TT6UPXSFmyFGnJi1z5tV
 NK+YjfwwrBlkNDXZz/ErKGkRMgLynMX4lp2pq9P1h+LqJs06LbFpL9+4YI/5wyYSCnTYih6nVip
 ZdUZ2oNCdaGqzqnjZiR9XtKKuu/9Q/bdkXW0ZY/tnFSXfafwctSN00oCN7+zWXpKRCE08aZnJ1a
 wExXNAHWT8ZNLZ9ynmWH9H6QDXGlgtbxx34ioXW88VR9rjMt+PUYBgy+XXPVIKzOk3MY+CeH460
 3vulHPmCp9HIM25ckHdHIzVQGp9PcSXhK+R096L8QEApOJZDJSrvlh8GUfcH9ItQOhzT4V0ZOqH
 Q8gl0duWGqTAIl9DTcvGlFE/NmSGFMlrLmdjbYQyo/6Tfmg7ybAgVjsmjaBKj6SuDxDIkI
X-Received: by 2002:a05:600c:8b32:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-483739fc64fmr27276625e9.7.1770984526212; 
 Fri, 13 Feb 2026 04:08:46 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99497asm289274955e9.6.2026.02.13.04.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 04:08:46 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v1 2/2] drm/syncobj/doc: Remove starter task from todo list
Date: Fri, 13 Feb 2026 12:08:35 +0000
Message-ID: <20260213120836.81283-3-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213120836.81283-1-yiconghui@gmail.com>
References: <20260213120836.81283-1-yiconghui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7A55E135F2F
X-Rspamd-Action: no action

Remove the starter task for adding DRM_IOCTL_SYNCOBJ_QUERY_ERROR
ioctl.

Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 Documentation/gpu/todo.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..8dcb1901142e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -878,22 +878,6 @@ Contact: Javier Martinez Canillas <javierm@redhat.com>
 
 Level: Advanced
 
-Querying errors from drm_syncobj
-================================
-
-The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
-
-One minor feature still missing is a generic DRM IOCTL to query the error
-status of binary and timeline drm_syncobj.
-
-This should probably be improved by implementing the necessary kernel interface
-and adding support for that in the userspace stack.
-
-Contact: Christian König
-
-Level: Starter
-
 DRM GPU Scheduler
 =================
 
-- 
2.53.0

