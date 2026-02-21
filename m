Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JuKLK71gmWnCTQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:37:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7A16C614
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19B10E044;
	Sat, 21 Feb 2026 07:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jW1rf9ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F6210E044
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 07:37:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso22684065e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 23:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771659447; x=1772264247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcSiEB2h+wSCIY10t8E7R/Khte+t349F76jiCfSqhKE=;
 b=jW1rf9yePjbryV87/SeyY2jgfQR0DYpzfjsBE3WUJBQ/gLCGgVNEvsP93eOHwl2rax
 +E9oMQgoc26TA0WMvLvNIm3byxgRhnjXL5k3UDuOIQXdEUgv/62jbVCkLKoJvyO4Yrar
 7st+pz82/cH1mz/x2hXoZFF6bXEtRlYtpz/mROWygfYjuNrGv7KiIde4MEqeYqQoTC9w
 UEuah2HCXFLtlyWvILWkSiE0M6C4FX3yXSCgL2WS9mpgyjHK602Gz+uS+4kRdYOumgPm
 VuBrYAfNq2hKtmALGEnFV0l5Fx9l8Kz0nF4JAH8Zk9vkoaYLYkODAXENzoSKtyDh9LrS
 0WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771659447; x=1772264247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YcSiEB2h+wSCIY10t8E7R/Khte+t349F76jiCfSqhKE=;
 b=mGMH3EKjcKjDi9cv30+1Rbdo9MmHW56RmBbSAgRA8Z8ikt4qfVGP73zuc+Y/ouoGnz
 L0A8t7V7N6kA0zoiSAlg0ndes2BWxkjsf9KS97p5u97Gx3DALKPsXgy4UB0X/ActchZZ
 J4vXNIpck/xQV+ud+0U5NJLGklgksg7cKbZIdNNhrATz3lHOrvzVR/JBU9+HY+pXKKZ7
 MfROQ7QSz5Ig7EQiGtFAqQM/TIsiUX1Q/87nrjztYqEGsNYS3YiZdy/T6vvslGC6Vbnz
 r2WcKrEUdWL9nGeNeKRalNw5YocXZ4QC+ZGGMXcUioHpJCHkO5SKwxAfEhZNMTEG56q0
 s0aQ==
X-Gm-Message-State: AOJu0YzPhwwXx7O+nglVpFsYW8mTrI9fFqb8XLtTM7+LpUYEhSCwv78A
 RyZRM29+cRVcJCqel3iq5RaoUQpvjZdVJII78/RZwqW9piPJicQz1Wad
X-Gm-Gg: AZuq6aJze0rO+LjHFcVk+8JC8AnxY/uW4OECTthMW9KrGo5iWYemfJZCNmVEKeyC0uk
 4HXnCuflI0vLu3XgV/69fNP0zUG6R1VHsKSBK69gTqaZ34nnDr50cDgt4Nv2t3EgCIRCJRleAQn
 6H9VUmlaE9uUAPSgtXWSNSI6WLbWBbumn3u1kOKx4pOVfdreFcOCSWJvexiaRc6zR996kXrgtkH
 4bYbv7pzFq8nU0L+D6TGhWvLrCPKMePxfu5mRVcfjE4uOeDfEuw9PNvUaqTQx7Pdg/kw05qXcOG
 AX8jFySsk62Ee+cUd8iig3xpZg3mIdGNVPXrMzYqdr2b/70CDk3gVHAqjp6GExfXJCKpxW5pxoe
 ZtG0rsM5gLJrtjgpWyuoRLF6mnDXk7b0wRuzBt7bX1QUEPIPtv2tRHqU7hQ987qTs94uN6uClTv
 6rgf8USugmQzuFeoSqobSynX7z7nAz7sm2xyd5c9i95lafTbeRUw6+QklVQw==
X-Received: by 2002:a05:600c:8b66:b0:483:6f7c:19f4 with SMTP id
 5b1f17b1804b1-483a95ed6f3mr30448685e9.30.1771659446514; 
 Fri, 20 Feb 2026 23:37:26 -0800 (PST)
Received: from JTOLLET-M-FKW7 (130.64.3.89.rev.sfr.net. [89.3.64.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc0e3sm109732405e9.5.2026.02.20.23.37.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Feb 2026 23:37:26 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
X-Google-Original-From: Jerome Tollet <jtollet@cisco.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Sat, 21 Feb 2026 08:37:24 +0100
Message-ID: <20260221073724.85291-1-jtollet@cisco.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <[email protected]>
References: <[email protected]>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jerometollet@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerometollet@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,cisco.com:mid,60hz:email]
X-Rspamd-Queue-Id: 2DC7A16C614
X-Rspamd-Action: no action

Hi Ankit,

I've completed isolated testing and can confirm the SCDC polling patch works perfectly.

Test results:
- Kernel: 6.19.2
- Hardware: Intel Alder Lake-N (N100) with integrated UHD Graphics
- Display: Cisco Desk Pro (CS-DESKPRO-2) 4K@60Hz via HDMI 2.0
- Status: 4K@60Hz (3840x2160@60Hz) working correctly
- Result: Stable display, no corruption, works across reboots

The SCDC polling approach is also more consistent with other implementations
like Windows, which performs similar SCDC polling after port enable.

Relevant dmesg output:
[    5.491988] i915: loading out-of-tree module taints kernel.
[    6.104904] i915 0000:00:02.0: [drm] Found alderlake_p/alderlake_n (device ID 46d1) integrated display version 13.00 stepping D0
[    6.218551] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/tgl_guc_70.bin version 70.49.4
[    6.268439] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 1
[    6.691347] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device

Thanks,
Jerome
