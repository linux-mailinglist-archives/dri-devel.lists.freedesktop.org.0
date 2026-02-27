Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NDyG2B3oWnJtQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:52:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E9B1B636B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36710E10A;
	Fri, 27 Feb 2026 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ab6FFE0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0798610E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:52:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6026B60054;
 Fri, 27 Feb 2026 10:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBA3C19423;
 Fri, 27 Feb 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772189532;
 bh=oxis6bPpAw8F90HyQ6ESP964pEfNPunDrliJR2brkpM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ab6FFE0L9d0fHWQgKC5KVa4iO++sdqpBe8k4cqxzbxBFLLk1a2inronksiUtZ26wH
 onXbpeVGy7e0EPv6yUMDspfLSU9yblsy9i+r4hMRY8Ry7Yd3ucGraNtCvg2sJN/Qhs
 LkPTcfV91+JN+QT4wAhFL9eLYv5GL69iBxOqGSndSOKS+oe1GItYeWrk5VsMSyn2qG
 YugpPuMN0zmhACKSjS/MBKDHHvB6fBSlZQhzPcJgD/Ik9try/t7OoBzbFOJTClqybO
 H85sekoeDGXW9ZFNEUO7uWDZ8vT66vY4qdS0+6iX2V4gMW2n8ttWqK8Q5uy9ByESlX
 VB0t3qiZR/1CA==
Message-ID: <dc4826d5-30b8-4597-97e1-cb686b7137e0@kernel.org>
Date: Fri, 27 Feb 2026 11:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Speed up some unit tests
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Maxime Ripard <mripard@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20260227100025.173-1-tvrtko.ursulin@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260227100025.173-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:mripard@kernel.org,m:phasta@kernel.org,m:matthew.brost@intel.com,m:ckoenig.leichtzumerken@gmail.com,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,igalia.com,kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3E9B1B636B
X-Rspamd-Action: no action

(Cc: Matt, Christian)

Please send scheduler patches to all scheduler maintainers (and reviewers).

On 2/27/26 11:00 AM, Tvrtko Ursulin wrote:
> Some tests are on right on the limit of targetting a one second runtime,

s/targetting/targeting/

> and some of those have recently been correctly marked as slow. Lets
> instead make them a bit quicker, by either reducing the amount of
> submitted jobs or waiting a bit less. For the latter a comment is added to
> explain why that should be fine, and for the former, they are tests which
> aim to hit races via stress testing, so reducing the runtime is also fine
> since the main thing is the number of test runs over time and machines.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reported-by: Maxime Ripard <mripard@kernel.org>

Should be followed by Closes:, but since the other patch resolved the issue
already by flagging the tests, I think this should just be dropped.

> +	/*
> +	 * Advance the timeline and make sure the second job gets scheduled and
> +	 * completed.
> +	 */

A bit unrelated to the patch, and I'm also not sure it adds much value, let's
drop the comment.

With that,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
