Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOUhI2nGl2lg8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0678D1643E8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F49010E76D;
	Fri, 20 Feb 2026 02:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XKcsrv8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FDE10E768
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:26:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso12373295e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771554405; x=1772159205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEQpxCeDm90fLB/aP08V3YF/uMR2wnZvQmEsrQgnh/8=;
 b=XKcsrv8NHlwpFnHRZItAushFhtHR+tRPNMeOpe9LPmyiAbwCcgmstAYT6ZMx5Ku9Xe
 i49a4DKfra1BqisDxDuYgwjKWaojgIx0O8AGuAsJhMt0wh8nhiKWPYTUjVgK1JvfmXty
 mNVDMvMyGS3GwoNzxmjJN0vSfsqcEzcLyUgcF9KPzZP6nEovkLWCPm6f0laQrX6aQbVk
 kRTgBGpurBXhuoo+FJrrSIStZFnJMrNbDrfvnm1M1HnfmKgby9pYHVmza8y8oBESlXGE
 U/GAT3ZwYr2/rCli0gOR+mfMT8sRMdbK2edzBcpy4TxsHDKB68fn3Jh2Te8I6l4iudfz
 WMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771554405; x=1772159205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEQpxCeDm90fLB/aP08V3YF/uMR2wnZvQmEsrQgnh/8=;
 b=V4zT3284sMYa2cvvabHMz1Tpv+fAD0dEwqSzd8iP1asaravBp6xx15aKDJyvh6DIKc
 /ajSUIkI+wlGh6RBJx/HfcM+D9oMPHGNSo1Ihx0tZUOjTQ2oyBcWZ7Nq8+kDpIPZKEAi
 BCP3XP1BMkpraC9nvNn3hjZBvkqMeG4aeL6vJ5O2jtzfnYDgpUnyPPXRL46tlX5YNIx1
 913tkCmqrMzd4xiKHXJJEn09srMiZ5iko3ZS/WbvW23NtCWQuiHo6Lx18wmrs5Vj2zkE
 0Ouj1SxPA175xerbcqD0ENM7MNT8XCPTnPjgBrWziCDRFSb4tKNRfY3pb/+ksLfoZKUi
 7yBg==
X-Gm-Message-State: AOJu0YxfulUOq0gFnRX1l43OfD1D0FcQI4za+HjrQvd+KiwGMr+XOoi6
 GgpSpirsW4oZnIQpjml3qnbjBUV2ArFxKzQGscOt26ymEko6Gkj3h1XH
X-Gm-Gg: AZuq6aJhOSRFAxWmKMXOAOxKRw+DY2ZCWpeA7wUksb48wVObuevqnE/Jn3TqRazLshh
 /NpoLqXaNkCqDo0BfylJMS0TnIIcgBthSPF7sTuSQnCy5I64DKwMZK3KU8u35yoYbYi/yIx9evd
 trBCTuZdUtFYZTLI8TWVvJq5Otni8mK3mulRutktJqTpacOTDMBPk09ig3YK+hpJcwA8yBBtxqJ
 MfdLbAQ0/59myDye/aRJwsqy8qg7bop/Gh50PmK6CtLlHK5C5CaSACB8Rvru92QX2FgJcEJ9zHH
 RJh+8gfrazpLqQnL4w7OEjZgMaaFQAl6WDErl5yKOaM17dYOecbdnR0fnnsKD6zPo0x6jQVb+Di
 aF0gwc03fKfF8WPc15w/u1EmGlcl7uk7OPXsxf46jsuUNrcn+QWX6wQSYAdY8cT9ZTx5ZVbcEk1
 IZeevu8lSZIa6Mmk+o3w8JjrG9xz8111MOoyswW8jZh29bdbfv4gxwCGS0h9n97dJj/hYPJqmOM
 72FSwQ=
X-Received: by 2002:a05:6000:2482:b0:432:586f:2a9d with SMTP id
 ffacd0b85a97d-43958e3bdffmr14148383f8f.32.1771554404499; 
 Thu, 19 Feb 2026 18:26:44 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad0166sm53446975f8f.35.2026.02.19.18.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 18:26:44 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v2 0/3] Querying errors from drm_syncobj
Date: Fri, 20 Feb 2026 02:26:25 +0000
Message-ID: <20260220022631.2205037-1-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gnome.org:url]
X-Rspamd-Queue-Id: 0678D1643E8
X-Rspamd-Action: no action

This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
codes from multiple syncobjs and abort early upon error of any of them.

Based on discussions from Michel Dänzer and Christian König, and a
starter task from the DRM todo documentation.

See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
on userspace implementation.


---
Changes:
v2:
* Went from adding a new ioctl to implementing flags for existing ones.

v1: https://lore.kernel.org/all/20260213120836.81283-1-yiconghui@gmail.com/T/#mfdbc7f97e91ca5731b51b69c8cf8173cb0b2fb3e

Yicong Hui (3):
  drm/syncobj: Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
  drm/syncobj: Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
  drm/syncobj/doc: Remove starter task from todo list

 Documentation/gpu/todo.rst        | 16 ----------
 drivers/dma-buf/dma-fence-chain.c | 52 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_syncobj.c     | 46 ++++++++++++++++++++++++---
 include/linux/dma-fence-chain.h   |  1 +
 include/uapi/drm/drm.h            |  2 ++
 5 files changed, 96 insertions(+), 21 deletions(-)

-- 
2.53.0

