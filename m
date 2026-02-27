Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKvfFVmZoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:17:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6F1B784A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4236E10EB35;
	Fri, 27 Feb 2026 13:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OPHc/xzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD3510EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:17:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso17776775e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 05:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772198228; x=1772803028; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JlP/Hf+1uXINfgamN2q52Ag3USsQOeX8HbMEe6aI5w=;
 b=OPHc/xzuJhRFojeYZe3HCcBMMdx04uklX3IjF9U9zI6WjlqW9tsFs24aTSP0Ii+jT6
 eY2qd9WRVVyU1V5pTx7ks5Qer8Lz/H+KDBCSs2WyBc/ctSMhkWU3JKMR8iPU6biYj3D/
 P3+MIi4Nl+DjUq8JiEmMpYmHV97SIJAtYOSRDC7jGlLMc62bTAXMNzy0f5POxYPe1aBc
 YOyXpf5ic8Gz9sx+0mzzQ1hv/CftWOFoX5sZDE6scKyEcFunjWXDaY35NKx1t/3FkNpd
 xxGyE4qdaEtl/mxA/KpBtjeXFf2Qs7XYbUSXE9VWgAte5p8gE12PUNr/FhCD0yzyNwnQ
 ItqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772198228; x=1772803028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1JlP/Hf+1uXINfgamN2q52Ag3USsQOeX8HbMEe6aI5w=;
 b=GoWGoFQotR4U1d80Ve8ONyVs504Tl8wGZz+e6FGZh49u0yhTHcEWWLorNKGNhB0fom
 o2XoN/DGyqCr16Qghp8Pi7tyRsiw2u3Y4QIFy+ouR1jtPjxhsTI+VYOCu4NUxgJLn/Pt
 +3II8xCAbbGJksAdQMpZ3hP2077WZDl31ZYLS0qC8iWvD4RIptozMzvEM9spYMIsjCmn
 tz9Y3PruQbbFzsLG/mjOsEsL5fQlVb/SiuYtRd+HiffMmOmeL8uF/p6OGwpOix301ZC2
 UAKMF7scYA0ePH7/eYozj70N+PxD/wsTa+Lu7leyhDkus7cGYpNxG3fNeXvU4e/CJ5He
 F+Ag==
X-Gm-Message-State: AOJu0YzdmPNm7dgvJr2P7NWDbxR8hCfFfocDuD38QfIDCp+HrEApCixp
 zcM1zS1wagEROPlT24TGBF5rYN+ut8taldJTsuOMNU5jsprt5O5bIfe9
X-Gm-Gg: ATEYQzxeOtRXw+uxvqvv5TjZEOquKy9CGfJkWVmiCSYvbAsdip4ACbsFyAnt5NzMmH7
 ZecPrAAitgeKOJVnqUsbxRyr3THgdFARNdJeBUqd7hmaiOuBA0Ncu7IsRDezsUGUBFJHnUy9BqF
 zg5MC71hhszY89vSxF8Dg2FGQnVOQGq4mfsWVrHWHU6YOhgvzspushz31z3lcxiewGleR9vPXsr
 Ij/hqTrV00oC43R1/7x1IcKjvYHpRm+gpa4DKmjaAmtMXmPoT5Cw8gd1iBmAAYywba9JN0U++DZ
 zMKjEJiy/O8i2AMNtASzY3pEWpfk65vq9hl8muzK1CAU0V2L5miRiGTS5ol/OigHAylbgdFqau8
 RL9Sg6Wywzz7D12l9f43fN4vZ9sFWOygQ6U5bw79oupY7DuRwck88WLkYB0BtUhzqYCL4fu87sk
 o18ELey2Kj4QEzwLzY21592srZsa11LXBY/7D6kWCKSMXKJ6F1+PmZY6tAW37iqyKOWuRVWGTMV
 A==
X-Received: by 2002:a05:600c:3106:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-483c9ba6165mr46831075e9.5.1772198228112; 
 Fri, 27 Feb 2026 05:17:08 -0800 (PST)
Received: from JTOLLET-M-FKW7 (90.64.3.89.rev.sfr.net. [89.3.64.90])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb77abdsm59354005e9.2.2026.02.27.05.17.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Feb 2026 05:17:07 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com, Jerome Tollet <jerome.tollet@gmail.com>
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Fri, 27 Feb 2026 14:16:38 +0100
Message-ID: <20260227131638.33167-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com>
References: <20260113143107.1446909-1-ankit.k.nautiyal@intel.com>
 <Z1MfXyv5_ORAVj3z@intel.com> <73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:intel-gfx@lists.freedesktop.org,m:ankit.k.nautiyal@intel.com,m:ville.syrjala@linux.intel.com,m:jerome.tollet@gmail.com,m:jerometollet@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jerometollet@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,intel.com,linux.intel.com,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[jerometollet@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 14C6F1B784A
X-Rspamd-Action: no action

Hi Ankit, Ville,

Gentle ping on this patch series. As confirmed in my previous testing
(Feb 21), the SCDC polling patch works perfectly on kernel 6.19.2 with
my Alder Lake-N (N100) + Cisco Desk Pro (CS-DESKPRO-2) setup.

The isolated testing showed that the SCDC polling approach alone
resolves the 4K@60Hz HDMI issue, which aligns with both the HDMI 2.0
spec requirements and Windows driver behavior.

Is there anything else needed from my side to help move this forward?

Thanks,
Jerome
