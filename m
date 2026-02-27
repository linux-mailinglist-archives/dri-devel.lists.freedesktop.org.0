Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN/HExGzomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E361C1A19
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6610E24B;
	Sat, 28 Feb 2026 09:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CgUJiBDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294510EAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 09:57:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2aadc18f230so12235675ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772186268; x=1772791068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7k7Krg43fqr0O/qL5plo5lVAc8TPlY5swC/VeSBhiq4=;
 b=CgUJiBDnYop6lm0PnzpOv49mgeS30/8UQsx5OU39J6NCdqqrrPRitNoFI/EXzeEXPu
 1PtTUkamOuCnDO1aB4z7rt7kWAcR3BG5HaWr6R7gCkDcYGSRne7gW4GwXo4P5SU0ONvv
 oWNHdALNnICz+3ZqTrLOfpRKQ2FJPZNV726Zhsvd5J0J8JcpkpU0MDw1y4ZziKlcVN3J
 qTJXzm7gz9fov7UaFRQOsg7QcmKQjaE5dBEnASGbJUEefuEszNzrgozp1/dWih9Ac0tV
 yTwwJ6OigQJGZclYoVrVFollkH5IffFj+sq3OXQnAR6fxqFc7Ch/7jrkzLNRnQUdpvdT
 8pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772186268; x=1772791068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7k7Krg43fqr0O/qL5plo5lVAc8TPlY5swC/VeSBhiq4=;
 b=WF11MDXvciA8FA0LdNtmdKEDTwC9Fbi5QD1+VvBKjkA54wpV7x3WpxDk1XjUBkFjiO
 9D1QNmgYjtzfccTvdz6ojEL2jaii+MQT23m/RBxDje6rWREQ83talsUHZuhow+PV/78L
 wBPDZvI+ytFbcjNmhmqVsLMepOUaLtWGVMfL/788Km4q5Ket9VCa3WMEjmr9QrWaupP0
 xWG6JYU4SHTe0yfSExEfng5o9b+6CF/WhA6F05fo+WPuy85cGkCeXwFEM659duveaFy6
 i8u9i3ueaXc60T2OATSZQRI9Rs3L/vrUdsHo7qwz/JIcQhuvsNp+3QIc+jNBfSyerQpQ
 APWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEAiPFgc2MmTJw7c1wDsowdXAPAFUu0HBNqV2e8nzxtD1Ih5Vb7tWTp6BfCkndsh7mlV8EszTeTJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvTvzcBHVHFwWQKjvwNNvfUsuBW4hXDBj2UZGmMi7HSQMg+aJV
 P8jpieIS3PUuCVTM+GF9lAIofYZECxeuAMNoUfTw7xtceIs0+c3I+qHz
X-Gm-Gg: ATEYQzxFKvN9p/EF/rEXL0+hGvB5dduYk6RVIvMS+pe08NaiADUuBfDgqbDwCwakoRR
 vb5cb0r6PoV9PQ3PLETAr+yBvKjTMIPatjpMmcLBUV1Uq6R29pHW4k38mBezbk+iYG+hEbujeHb
 neRhmq+SeBEYR5jQWqSjY8+3PwZEfI8HAkjcf1f0AkbR1xkwJ4s1Wjz+FZ4H330YMXOKSRoc7Lb
 dK6MwvgtBzzfSUE527ZTxb3+9gqI4UWBDZ9tSQ12RJZ/o3QuV2ndnIKhPc4ufQBijETBwlhpNK7
 7rJ0B9+8azTq6TLUNUit20S/A7wDf4Kk1HuJ3ETXfCnSqqyDLY3vykzp6WujXpBsi8ZebjZ4BX7
 nMoI2WOJ/T71As5OBRnm9FiTZdbAWeXrNP+bFrtdKveyL73Mef1igBivWStYSC2DhIMoVfTdtH8
 qSZgRq47a4F22Id+WLBNFDANkKs40K9A5KS6EOUpkhQZH5vpZfla/uNg+yRhuYXkb5gERL/b2np
 zlpbQ==
X-Received: by 2002:a17:903:1a28:b0:2ad:bd4c:b0 with SMTP id
 d9443c01a7336-2ae2e3cd0b5mr21806505ad.7.1772186268441; 
 Fri, 27 Feb 2026 01:57:48 -0800 (PST)
Received: from localhost.localdomain ([14.160.25.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d4d826sm4640439b3a.10.2026.02.27.01.57.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Feb 2026 01:57:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: geert@linux-m68k.org
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, phucduc.bui@gmail.com, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
Date: Fri, 27 Feb 2026 16:57:42 +0700
Message-Id: <20260227095742.4449-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
References: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:airlied@gmail.com,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:phucduc.bui@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,youtu.be:url]
X-Rspamd-Queue-Id: E7E361C1A19
X-Rspamd-Action: no action

Hi Geert,

> Thanks for your patch!

> What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
> the same as s2idle, and the LCD works fine after resume from s2ram on
> my Amadillo, with and without your patch,

> What am I missing?
> Thanks!

Thank you for your feedback.

To clarify the "deep sleep" context, I have tested both s2idle and deep 
states using:
- echo freeze > /sys/power/state
- echo mem > /sys/power/state

On my hardware, the issue is consistently reproducible in both cases, 
resulting in a completely white screen after resume.

Testing on Stable and Upstream:
I have verified this behavior on both the stable and latest upstream 
kernels. While the patch was originally developed on a stable branch, I 
have confirmed that it applies cleanly to the current upstream tree and 
successfully resolves the issue there as well.

Context and Environment Difference:
I first tested several Armadillo-800 EVA boards more than 10 years ago, 
and this specific resume failure was already a known, persistent 
issue back then. After 10 years, I am returning to this platform and 
testing with my current hardware, and I can confirm the behavior 
remains exactly the same.

Regarding why it works on your side: I cannot be certain about the 
specific differences in our hardware configurations. However, on my 
setup, the debug traces clearly confirm that the LDSA1R register is 
reset to 0 after resume.

Video demonstration:
I have recorded a short video demonstrating the bug (white screen after 
pressing "Switch 3" to resume):

https://youtu.be/0n9NHeZ7MWU

Detailed Logs and Configuration:
I have uploaded the kernel config and dmesg logs (including debug 
traces for LDSA1R) to this Gist:

https://gist.github.com/BuiDucPhuc/b31fc7ee784e65d192b2f49a406c3326

Technical Analysis:
I focused my debug traces on the LDSA1R register. The logs confirm that 
during resume, LDSA1R is reset to 0. When the driver updates the 
registers:
1. It writes the correct address to Side B (Mirror).
2. However, according to Figure 38.13 ("Two-set register switching 
timing") in the R8A7740 Group Hardware Manual, the transfer from Side B 
to Side A requires a Frame End interrupt.
3. Since the controller is currently stopped (DO=0), no frame is 
processed and no Frame End pulse is generated. Consequently, Side A 
remains 0x00000000, leading to the DMA fetch error and white screen.

This priming patch ensures Side A is explicitly initialized while the 
switching logic is idle, making the driver robust against register 
context loss.

Best regards,
Bui Duc Phuc
