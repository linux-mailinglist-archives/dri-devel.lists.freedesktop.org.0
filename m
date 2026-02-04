Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNtoAO4Ng2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:14:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71C9E3A24
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90F610E58C;
	Wed,  4 Feb 2026 09:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA7W7k2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960310E599;
 Wed,  4 Feb 2026 09:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770196456; x=1801732456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uWFc3cCq7nvgonjkWV9CXlG3ak0iloScDgH4XwXi1og=;
 b=eA7W7k2Q45OxPoRtIl4TM9/wwAyFgUS8FJd155dAeM5qKW3Wz9p/5tpu
 PJ0pxT12zhDBlCUim3Rb1Anxyk08pttY7ZICuGNXGs7uRn8D9ibLTEMfU
 ohzI6/LkLSQKJtpHIK3dkG+3XWWhHj+5lqN+rycCvrLT/8C+BY7+V1u2c
 pLyqJqFcz3Bd4NFf8wpEYdb12kIbjgfGjGEmh3f0OXVLdriMReYnsB+PL
 YV6csPC7aAmtYUH8haey1f6nWvm/MJ6tOSlNdQ2N+4KSpbOj64d7icKA1
 s4n65KhWVuZFr0QI8y/0Qa93u6vnx0F6nK6bamaMrNnXmnU7yHlCYM5YV w==;
X-CSE-ConnectionGUID: H+j056cQQcmPfmxpk6wJbQ==
X-CSE-MsgGUID: 8xVVkCFGQ8SXaiOJiVEf2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75230385"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75230385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:14:16 -0800
X-CSE-ConnectionGUID: 2skSiKnGR+upiIjAzys1xQ==
X-CSE-MsgGUID: rZDQ3aCPSp63PrxXSlN9LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214276632"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.209])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:14:14 -0800
Date: Wed, 4 Feb 2026 10:14:11 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <aYMN4xHcqNqcI2CL@ashyti-mobl2.lan>
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashyti-mobl2.lan:mid,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C71C9E3A24
X-Rspamd-Action: no action

Hi Krzysztof,

On Mon, Jan 19, 2026 at 10:16:02AM +0000, Krzysztof Karas wrote:
> IGT mmap testing in i915 uses current task's address space to
> allocate new userspace mapping, without registering real user
> for that address space in mm_struct.
> 
> It was observed that mm->mm_users would occasionally drop to 0
> during tests, which reaped userspace mappings, further leading
> to failures upon reading from userland memory.
> 
> Prevent this by artificially increasing mm_users counter for the
> duration of the test.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Can you please rebase this patch on top of the current trees?

> +	/*
> +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> +	 * and ensure the kernel does not try to clean up the userspace mappings
> +	 * of the current task during the test.
> +	 */
> +	mmget_not_zero(current->mm);

why mmget_not_zero() and not just mmget()?

Overall the patch looks fine to me, I'd like to hear what's
Janusz real concern here.

Thanks,
Andi
