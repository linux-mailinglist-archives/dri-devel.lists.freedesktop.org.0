Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGZLLMHQd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:38:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009018D24D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4044410E490;
	Mon, 26 Jan 2026 20:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OdhGN+3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DECF10E490
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 20:38:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so49246365e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769459898; x=1770064698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6z4xoEpihhro/o4qh/O8qRrlctdYIYONRKVUWA7Hps=;
 b=OdhGN+3oPRIW9Xt/YjDbbXtPIpiwCsjwe5xm7A5NiFYIHqt9HAu/FpRn9K6en2geX2
 qZlXMdh0ByZT4+QTWjqQYgOqf0ATLZYHixxxoYt51dnDY0t3XaMcOgIon9+VZi3aRTO2
 OTVXBkr0tXJ4o6OLE9+Ql4yMcMTve9bB9y8kNg0Qxt4AggCvwgyoZYaD8U3VYOPjqcNv
 +AdZuK9mbbfdmxKOtmqnSzstnIR0cnRo7oGhtdNKtMoVEiYhvreJ46yjxNJypCaQwC3I
 QspPt5Knakw4O1haHZWN2A8hDSto8OyWIeflLWj4An1XlwzMXn+js1jqnQYI+rKchbGf
 NidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769459898; x=1770064698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O6z4xoEpihhro/o4qh/O8qRrlctdYIYONRKVUWA7Hps=;
 b=cIQTHSjI4mlu1fLc4AiOTIxSPuPrTCNAxWdB9ZB8ZrCGm9Pe2heS8CdBO1ayg0I+tx
 YuQKjEJ1ldktjnRem5yqrItRgsp8wCzgpfJEeJwqRRKrXrhpx8IeX2ocxwaYYYt/nwxG
 NCKRfmtzUsHAbBgBGmDWBRJ6ntFNfOyiZ4i2H/qqb3cEKylqgKymu+EuXbFA1NwQUZWM
 gWsFfiYGEkAi2aWBMvjIA2N8vyLUhfnSHNo7bwqke5kMAKCWGoqxkX+LwaxJ9axF5cud
 V5pVw/As8t6XWlKIOl2yzVuXym84MJ1xtnVChBq+NO2B92jKvBkY3nF1Pbq/HkAU7gd9
 SHXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvh+tcqW+8IYOn7+2qhd2M7F5mLUM9GCzRqb+G5QQD1hwfY3u5azB9KLbs4FUAVO/U9Vq02C4h3Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrWQ0m5k/iHnpHVHowOvVX1hMxPtO0wvEVTw6W/21/ihuKNaWE
 1vLnzclkOmX0TCrVjz42JBMhtEaV6qi00crP+usGb2ThRJCVn5d8H3xT
X-Gm-Gg: AZuq6aL763f1eeKqyQd0Hxd9d8Iq7ZGFi1oKJLTGhoeDAo5c9S9MBZQFjwm5tU+Sk/a
 FBacAojGJ/U7vjngGbFggglGy0vRkP9p//OaNCSnbx86Hn05c/+GSt/NeF4lMWMcYuGGZWps6cy
 aUXi2egd/7RyrKltKDrwUZRjrHwdbTCcS3h3Pz3GBqUwiSgIE59DdHovFryena6a+vYdCHvF7hY
 P9vvAQtI1MtxvY5qscFwb2o62qUMJWbwhzpZKYhXdwdfrPAErHJjYEIDVxvFTMMv+P1t3zVBQwq
 6m7FSbcA5zqYPFuJYjg8sVlfgUkDz+pF77NF41x1X4M6K0cPIQPqTEOMxG3OWssSgdquTzETsLH
 6vetJGoVJFU6e3aCvpWQ8iCUXzd+oKMJB4Gb0vNT3CJB9crHHRNQAFqRP1tDIW6++SpfGvxsu0S
 +KvPjJgIC5VGSRRs99SCoOMl23wHV3cDB3PzSdWg==
X-Received: by 2002:a05:6000:288c:b0:430:fbad:687a with SMTP id
 ffacd0b85a97d-435ca0e291fmr8983071f8f.13.1769459897573; 
 Mon, 26 Jan 2026 12:38:17 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:c30b:500:c472:222f:bc60:d893])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e716b6sm32591742f8f.27.2026.01.26.12.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:38:17 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: alexdeucher@gmail.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org,
 sunlightlinux@gmail.com, superm1@kernel.org
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Mon, 26 Jan 2026 22:37:50 +0200
Message-ID: <20260126203749.16389-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
References: <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org,gmail.com,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:christian.koenig@amd.com,m:ionut_n2001@yahoo.com,m:linux-kernel@vger.kernel.org,m:sunlightlinux@gmail.com,m:superm1@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 009018D24D
X-Rspamd-Action: no action

Hi Alex,

Thank you for the feedback and for taking the time to review this issue.

I'll add debug code to capture the full stack trace when the TLB flush
failures occur. I'll test this on my AMD Cezanne system over the next
few days when I have more time available, and will send you the complete
call chain information.

Regarding the hibernation limitations you mentioned - I understand the
challenges with secure boot compatibility and VRAM eviction. In my case,
I'm not using secure boot, and my system has sufficient RAM and swap
space to handle the VRAM backup, so those particular issues shouldn't
affect my setup.

I'll follow up with the stack traces and additional debugging information
in the next few days.

Thanks again,
Ionut
