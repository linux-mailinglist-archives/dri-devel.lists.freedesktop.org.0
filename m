Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ22Af4+g2kPkQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:43:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB01E5F28
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48DB10E2B8;
	Wed,  4 Feb 2026 12:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="pfY+Vqjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4395110E2B8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 12:43:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso1104246566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1770209015; x=1770813815; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Hw/EHkOMjiTCq0DNxVt/NvivymNYuYn7LwzqRJ3S5k=;
 b=pfY+VqjsydIZPl9xeGESCQsh4hrdNcd99re72rsiJevMoZhvL3pNgkfBPnv4mH9XJ0
 qH64kznamxHAQbAQMs7qqgVJC3b190LvgCDC36TuYM9JGURHSEMlpfiIe2dJbf0OUtOM
 iSTfG6R2wgRxz1BCN5ePm0hE4ia4K0SoYBdzfq0NNz1qUMzpSzJBWi0o/WqxSeJG9JML
 WQIVXkVfAR2gGEwGnACeVwvuq5wxpd62Sm8JLt4vv2ivRoxqWPXlu+CGHr22t5EmnMAS
 JFns2daHkQ7btrA4wFJF8J2Iuzw1xAVxqTpbJ7GVTYByY9q8xZWuY4e8p0rS1JKjpJbs
 9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770209015; x=1770813815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Hw/EHkOMjiTCq0DNxVt/NvivymNYuYn7LwzqRJ3S5k=;
 b=AnB80zDKKhdPYSm172khZ6dBfUbaWQ0s8/DKmnmGIZLtvbWxcG0OukSRdYLugCdXJv
 jQyUlkQ9YDZUseakAwsOg1FV/8UU67sFCL6p8431rLsfmbes82O1ZJ/mQxuJVT7bnqw7
 vphZl6Wx/JeKwHrLxuljNszzm8Y2jwaSOMSFTtXKylETZNqjz2l+DVTyXEyDyUXM58RG
 x6dFROLLo26dcNym36tPM1RK4lT3CofsosrfsfOmyb05kwCwTk6pcRnWz64hB4KIzJqA
 UCFuMkEctx00dgi8zjgz8mwCI+wwhaZkpNkCQ2YbcaJytzef/EkLsUWb33nVqu1Tmfb0
 HgwA==
X-Gm-Message-State: AOJu0YzCxyL5Ak+B/sAhAx8xhUMEQ/6HOpYkorT6r1uig68C8nsgK1bc
 PhiNveHwkvD52i91c+lN3/l4nCr0n9s6Jt3KCh+3JKfBMrEz5U7ZXI4iKwIhrgIgQ8k8nRdQQgF
 VOFAb
X-Gm-Gg: AZuq6aLVKy15IY96C1r+lPYfn3WHTF50zYTtb07nQ0tv0qEyTAVsI5gYwD4pDTM+WR+
 Y6jdXIKibTixu1Tqyq0dYUz/FNrI7kFYbYQc01hZ3z1slyw0BiFr/auZCZI3wxJC2DCKs4U77p0
 PHbqtzEXJSf2sAL65LvTsAz7rPwfQ3M9ZZ5NtPeSMOfcygVpUfPS/jT1STwSxBbTlf+Y4zYcW1d
 z7KneDNMSrDSmZCvTaJuvUmRfLOgZ65KTVfVOH1/MGsllRVgyzYjn725LX2/UC7NXdAHNz/9h0W
 pi/3Hb0YDln6pv+HtoV+CCK7IXXoRDH88ohXFzD5S3OMZGj4T7CLOhDvCLuNaysrYTPJo+tYCFu
 bCeAphcJVxTfLmV9nceSruxnyRNsyj8IAlPBEcPcfp6JQ6ECHRzK45qDjwdbQoczGh4ZUHqn4H6
 aDkIger9zHBQqNa5wiUNxcExOlzG54/vs9uGeWu/GT04KlL3a7U54FhdPERA3TErw=
X-Received: by 2002:a17:907:7b82:b0:b87:1c20:7c63 with SMTP id
 a640c23a62f3a-b8e9f070f41mr221257466b.20.1770209015209; 
 Wed, 04 Feb 2026 04:43:35 -0800 (PST)
Received: from caroline (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fd0a2b6sm122244066b.18.2026.02.04.04.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 04:43:34 -0800 (PST)
Date: Wed, 4 Feb 2026 13:43:32 +0100
From: Mary Guillemard <mary@mary.zone>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 0/3] nouveau/vmm: fix switching between small and large
 PTEs (series v2)
Message-ID: <aYM-9GzXxbExyiVi@caroline>
References: <20260204030208.2313241-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204030208.2313241-1-airlied@gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[mary.zone:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[mary.zone];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mary@mary.zone,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mary.zone:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mary@mary.zone,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mary.zone:email,mary.zone:dkim]
X-Rspamd-Queue-Id: 5EB01E5F28
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 01:00:04PM +1000, Dave Airlie wrote:
> [This is a repost with a fix for a bug noticed in patch 2 from yesterday.]
> 
> The nouveau page table has dual page tables with special states for
> tracking small vs large pages at the bottom level. However the current
> code isn't designed with the higher level large page support in mind.
> 
> The nouveau_uvmm/gpuvm code can cause unrefs to get delayed, so things
> like ref SPT, map SPT, unmap SPT, ref LPT, map LPT, unref SPT can happen.
> 
> unrefs can end up quite delayed and it shouldn't matter as unref should
> just affect reference counts.
> 
> However at least the SPT unref path was overwriting the LPT value when
> all SPT were unreffed even if an LPT was referenced in between.
> 
> This series refactors the code to use a union, then increases the size
> as I think even with the current code there was enough ref counts for SPTE.
> The last patch adds LPTE tracking.
> 
> Dave.
>

I extensively tested this today (on GA107 and AD107) with compression
reenabled on mesa side, everything is working as expected and the MMU
faults are gone.

Reviewed-by: Mary Guillemard <mary@mary.zone>
Tested-by: Mary Guillemard <mary@mary.zone>

Regards,
Mary
