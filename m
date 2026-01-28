Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I+nKKlDemmr4wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:13:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B0A69DC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6980D10E738;
	Wed, 28 Jan 2026 17:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/bzLYNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA24910E740
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 17:13:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29f102b013fso28185ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769620388; x=1770225188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=W/bzLYNkZaGXe2fQOalrGHWUZ5pXMK3sQUHLvNWiRTKmP0E7dJAPhyfZHLsJ+2mujJ
 oJYoDp8a610x5ZVT8u+0FCLhrL2gikFeQ9Dn1M2kDx539nCpijstJWgRLNKd/fV8MAX3
 vRxkjACd+V35Al3xOQCcwwgQJZot/IfWSdUUpqqJFAIK7F7SxuxHWWTn0+xIWp0KBE0a
 JyY+CKXCnAezAu218Z1JQEVu7RssjDEvBgRBS7mjdhbkiZgCcRCld/Zhrp+MrlJt1eGA
 hCECrGxL4D59P7kZsSkkYQT/QMJD/U3tgnvlpLuEdMQ24pWO83caJGIsIuMB66UTuPuM
 LpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769620388; x=1770225188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=D1UQK3e9L2sqxS7mSiXXAc1X2FYTnilufJNBRZb0KcJyC/Vn8t0voJOcwLnKB/I8Tw
 NTdeKcvSu5Muw/qsycYAqmXZ4P8LNMPVKeSBkunZNUnxbZJ/HicoPHSYVdLwqEM9Kb4Z
 D+rpxH6JEldfqU895//915/t4UY5rDTbC8plHNHkhK9xotrvLpMtwuq4y4QECQSr+FLV
 NQ96TxwmRmSFUwqDxXLvCZi+/2hNv6Hk4fMmSBE8/BiN8hTRLQFSgmP9tA2ucRO3duaD
 TSD/fz6n6/JZI0DoEin9DkLC2WXfR21U+ax6wYk+TCkaC2b07RGyPPLMWKA4+BnO3dto
 ZD3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNzq0/LyrbzczQYJ/1z9w/Z7uu2d0psp3oCFMfJ36UBOCD/kW8Z0EXUpycp1hatK51+oPYsehvnPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxPSHXdTzyOsnZ+0wmYqrMMGB7Nzr0IVomY+ZzwJ4XPyFIhLSB
 mRb7rnG9e3mmmlQgfxjIvZYvBkAS9jS5oPTG3ldPnh9YXbkFfobmFdk=
X-Gm-Gg: AZuq6aIxOnK6w/rIXE+vtflbY1jU77O+L7C07csAhhi5tRgP/tivIM0/96OOPQCSGAy
 BJnjD52eSx2ZbkPCi+jKjjfMAozG6ncZ/FaEZUITdoJvi7r+N87DEJh+poTr7rVZbg/a0JVsp8k
 yEw9BRD7m3fxxGMlJcXcpEXIzvLbIuQL1e2ueMQwpKT3PC4xuWTB0pGmmGvmaveEIvsQFjb3DyC
 t0UxvwHP808wtJDMjzrD5c6+Ejb6DGz6d88lBotoFW7PUj14WE2l9FEZZ6pU1IU/IinJIDU0Ukd
 LVkTuZrl4MkG637OzmWxl3aDW58gMYOrQUkyYE1FgeKQ+Jobx8oSexIgnvlcypcLA35MyK0O8dH
 4XK59XHlKSGV3dyb5Nvsgz6Y71lPVxkHJFze1g9wO1hUU4HLotlI2d4BP1dtDJjh9ibt/E0nZwG
 wnXfSLACWmIxyd
X-Received: by 2002:a17:903:1a88:b0:2a7:afb2:ce1c with SMTP id
 d9443c01a7336-2a870e18dfdmr60392705ad.61.1769620388192; 
 Wed, 28 Jan 2026 09:13:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8bd74e9bbsm85105ad.95.2026.01.28.09.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:13:07 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, mingo@kernel.org,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Date: Wed, 28 Jan 2026 17:12:58 +0000
Message-ID: <20260128171258.1081-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXoxpWFE0rByjS-y@wunner.de>
References: <aXoxpWFE0rByjS-y@wunner.de>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,linux.intel.com,redhat.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:airlied@gmail.com,m:ardb@kernel.org,m:atharvatiwarilinuxdev@gmail.com,m:francescopompo2@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:javierm@redhat.com,m:joonas.lahtinen@linux.intel.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lszubowi@redhat.com,m:mingo@kernel.org,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 044B0A69DC
X-Rspamd-Action: no action

> It's possible that the iMac has a multiplexer built-in which can
> switch between the iGPU and dGPU at runtime.  Please ensure that
> you have set CONFIG_APPLE_GMUX=y in your .config, the gmux driver
> should bind to the multiplexer if there is one.
> 
> If there is a multiplexer built-in, then disabling the iGPU is the
> wrong approach.

I was using apple-gmux even before this patch, and runtime GPU switching
does not work on either macOS or Linux.
On macOS, the iGPU does not even appear in System Information.
However, the iGPU is present in IORegistry, and Apple appears to use it
only for acceleration, not for display output. This can be seen from
the following IORegistry entry:

    | |   | +-o AppleIntelFramebufferController  <class AppleIntelFramebufferController, id 0x100000556, registered, matched, active, busy 0 (230 ms), retain 8>
    | |   | | |   "IOClass" = "AppleIntelFramebufferController"
    | |   | | |   "IOPersonalityPublisher" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifierKernel" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifier" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "IOMatchCategory" = "IOFramebuffer"
    | |   | | |   "NumFrameBuffer" = <00>

NumFrameBuffer=0 says that iGPU isint handling any dispaly atm.
