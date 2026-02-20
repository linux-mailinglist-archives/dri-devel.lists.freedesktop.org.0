Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJHuAW3Gl2lg8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC541643EF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6D10E768;
	Fri, 20 Feb 2026 02:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KoBb6NT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922E710E768
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:26:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43767807da6so1169127f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771554407; x=1772159207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i143R6oTYaMRVTgVRJMuG7Fi9AjA6YkMNWJRTVzxJWI=;
 b=KoBb6NT9nv6IqIPkCsAkxZ8rtmMJ/gE3fSMje/4x9IIejTmdG7tzYB85Ftm1SB3xis
 e/dAoND71ObFwgkKL+L5GL5a8rDA6yfFd01mD4NlEta9Ljr1oq/ZsYov3Qg3DQyXj59+
 kV4xDyQYoJZqvaX9tw5VyaQHxavWNBG/as6qM6NMDRIBe0+36hZgKOKSONTcUiPoaB28
 cHytkBzZnA9anHz/L4y0lpmqubvQFudcGKwXkpPYAQYJADj4ATyik8UoQAk6rsACN0Uh
 ZMKp6rP/UXj4sYwCK3aeogILR+MyqLi6Zkws9vKIBpTUTKQFnldSdwyZ4JNAEYhRsZX6
 WnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771554407; x=1772159207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i143R6oTYaMRVTgVRJMuG7Fi9AjA6YkMNWJRTVzxJWI=;
 b=MrKHSlCuiJLIzxpD8p9olfZmuIY8P37AKD5QN9gJLWg743MfNHyWkzsIi3MWAV2aTW
 6IAi2pgsyBc4BXZBQSJWmnzDwctySTwIkDc2NsJKpLce811vXHBDLPBs7Ha5wxN8gqbk
 zpMtuSe5JARm/Qik/m0dwgFOuL6d1aj5RUHFLLaEIhgsO35x7ZnkbqkzJmYd/HLB3mxX
 rZlcz6ytmyB5c9lsBvCgX4WWrSZ+NvFNAQRjrTiDwBgEu/9lHNY5xEBS+AvjQZ/wNl2H
 1iEKuY22qJBWCsvVlEFQBP+kOjmrC5MijBt3KLLXa61x6hkW7ZnSW64OgtLJtDpQ7oqv
 QeYg==
X-Gm-Message-State: AOJu0YyKNsr+5KFzJb8+AfWPtQea7c+6s1htWIZ4yLCDsOlLYgNxe/Th
 G4DKEaDxOLoBqTtdbJPBVeSgbj4NobokjGgbAsb+fTVICfuB6wqQakYI
X-Gm-Gg: AZuq6aILTzKWeH+CAONVgjl8S/qQg8lHZgeTwsxCVx3Hxx/ukLiJFwZIeq96dfNXNDo
 ctAUIEfhtzs7F725yy+wsvYEM0C1u8HxZs9o5Y0uYgddV3PWr5wr6lPV2fQI/qCiveVrTPbjn6n
 Lk0mvHWQUpmslfoFY5fv3Q6+IUFeG3WHvRbg2EklgJ/OohhAkqSd9iJDT33R4Prl2Jps5/KHDpV
 gbcnZ1hNzUHVhIzzujH4h+s/pHUDOvNEsWohBTfRnsIwS15F/bpmvuh+1tsboNPRQqFiLOM5Ab5
 KzbqjYsisixYXL7H2ucws0DX4ZHHzPLWSZw5WqgU7PvSX1f366eAhvZvKBso360VaAyTEcuM0Gw
 2abmoOZxNt1L0GtX/k3qRhRUcwav+Mtr9EbzvpKEsoV7fwXqpYYG4apBIhR2HEi9hvuVnb72nNl
 cizdJeSgH4Ip5jxxtFCbp0gZ+XVyCPHr8keH+bHHV+V2GNrRrYKM/NSzGjFwgfalhzWJng
X-Received: by 2002:a05:6000:22c9:b0:437:707e:9f57 with SMTP id
 ffacd0b85a97d-43958d55f30mr12299521f8f.0.1771554407038; 
 Thu, 19 Feb 2026 18:26:47 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm53446975f8f.35.2026.02.19.18.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 18:26:46 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v2 3/3] drm/syncobj/doc: Remove starter task from todo list
Date: Fri, 20 Feb 2026 02:26:28 +0000
Message-ID: <20260220022631.2205037-4-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220022631.2205037-1-yiconghui@gmail.com>
References: <20260220022631.2205037-1-yiconghui@gmail.com>
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
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 8DC541643EF
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

