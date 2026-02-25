Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMXJMiTvnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7C1978E7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F91710E35B;
	Wed, 25 Feb 2026 12:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GyDxpfkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2033E10E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:46:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so31463295e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772023577; x=1772628377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i143R6oTYaMRVTgVRJMuG7Fi9AjA6YkMNWJRTVzxJWI=;
 b=GyDxpfkZ1b+tZNJVvLRrYvB00A2XEqk0G8MN1XHROYDCU+nZ7dr2ZdTHhJ+X6m7syG
 o0Q3cHVOBmaPWsdiy8MJC0bZGIT5F+JMpFkpE6u9Knb/EM4R2M+LXMNhn1uWkNsEYmob
 1ERbWp6c7k2216Bck20FJn1bmqzG3YFtqynuw5kATHB99kCEH4iHHbF7LhWZ7H5QbxyL
 c68ZGdBGrYcpBqoR+K0P78IRkGDVRwX7LPZJsYC05mWfcmcOl5YVnHg1piji8Z3pjQhn
 jNox9TU33qNac4sDFJ6wnR8376QoFBS0ztWFQnCZnaHgjKf6b1SHeQ9ryb2m/3PNFrTJ
 ZbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772023577; x=1772628377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i143R6oTYaMRVTgVRJMuG7Fi9AjA6YkMNWJRTVzxJWI=;
 b=Kq9/L4R4dGm+j8WHHSAXYk15D1+030uDgGhYaQbi9/+sVDZFBhH3qOi9lkqOAdtTGD
 eozGqmZvixbb+XK2Mv9EnrTwqIXxne5jiFFOJ2pd+qKtE+7UvMhHaTxC7ifO5bKE3SNf
 2EG1+ZRDNeJS4+m7gfYraCIKSOKMzyuoPlvlzqsnJ0T/l+VZbAlVAqZin7XWoOmv33iU
 7MybZYMb+Q3j64vkRhwnUPgQZ3S47opNS8bmM5ZF1RZiaj0ma+H76YO1YR1B16pLp3CL
 tARFJ37VvG82hS1/p8wujNZUNPKyVAOJv3k5uUkSyhgJdD27EduQjsKBaAAAyFulGGHN
 oiIA==
X-Gm-Message-State: AOJu0Ywb0xu1Q3h0YT6Od00j9SiuzMJnZUbXTMPwwa+abtX/DThIP+rc
 Ui644fBh1vO5i4FpUmPKfbFT3hV1IB1cn5bl1HKjVGrLgsgVW0HsPkK9
X-Gm-Gg: ATEYQzwu+SqcvfAGNFj18LLLvizDTKjXMaakJ4mRJjNgbF+3uEodr2bem3Ypxd6dfCi
 0jNGIv0cNDU8I5keNi6gyf9TU8/Vqa7UIqI/0ycrNv2pUNWBwkWa+2QKKeIzpYfw8fGAKUgxo0o
 TAnHjKJj9h6lSzLbHrZBG6ZlK8cR6O03Ldwk93M90yX29bIJfQqTfi6H0YtgwGJl7DhuWh5GAQc
 WiL2owTyl6E9cOr/PcziuP38dL7bnzv0DyflcUOq05eMpOR8dAPwa5CNgoLLBndDHRFNZ0RFycw
 eE2l3mS8UOtM05Ob2/ZWGpXgBHO8fm5Mpws2KPKTz9lRzcnhRNNS9oRb2MYTCQFIuaxw+A+Zu2A
 XWYaa0MvZ2A9mz7czJYKdyoKkcwf+Ejq2FaQUNPoWPSGPhP1/++KaZDgb9Ch8R6dW6GzABvlmGL
 5mw9rrvRRJjSap32d/xQRu8Do5claxyCsOyJpFnCWOcSIwUBUrv3wYF9bivKH/hwYYskO5
X-Received: by 2002:a05:600c:4e94:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-483a95b4b3cmr259672175e9.4.1772023576564; 
 Wed, 25 Feb 2026 04:46:16 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb9b97sm18419995e9.7.2026.02.25.04.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:46:16 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v3 3/3] drm/syncobj/doc: Remove starter task from todo list
Date: Wed, 25 Feb 2026 12:46:09 +0000
Message-ID: <20260225124609.968505-4-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225124609.968505-1-yiconghui@gmail.com>
References: <20260225124609.968505-1-yiconghui@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7DC7C1978E7
X-Rspamd-Action: no action

Remove the starter task for adding a way to query syncobjs error codes
through an ioctl.

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

