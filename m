Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPsBGDHolmmNqwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:38:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE615DE99
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2CB10E684;
	Thu, 19 Feb 2026 10:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAk3sBpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C2010E291;
 Thu, 19 Feb 2026 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771497516; x=1803033516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=erLTMihpXf8Te8g2St5eJe/onTSho7qBtPXjCKLifRU=;
 b=eAk3sBpWmFF4MmnPc7eQD+g1rLF0wNsLEuhxv2MlhvE11aBEAelKoqz5
 MpbIZ8rNne1EMOVYPxpO2/fk7hUA+fV4QRVDBY3ZlIpJODjiMr5E+ZG4L
 AaGgWTDRtOB1AowM+37nup7kfJEUXNM8PAi6EUzNUSTLQC2a2AefIZMmw
 +1NoaOWNAfoGI5wKZAVsm0Zg7Qj14tiwgQc0sneJP078J2cKCP/Td+qv5
 YP0nJgsJUvnNwxcCH3/OS2gMf/B6fEg7UzOOfkxR/KjBRnGkGfqfF7lTz
 XrWY4YHtAzV7PfeJP6jPYeaOLH6Ox/FARsBmUqlbYfC2Bg2D+AKK278RD A==;
X-CSE-ConnectionGUID: RrxCGhRuRaiWGjYRn9+R4A==
X-CSE-MsgGUID: YfEKkTbCRn24dMWMl7w3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72676004"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72676004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:38:36 -0800
X-CSE-ConnectionGUID: BtPjZQsuS26ELaHF3syIBQ==
X-CSE-MsgGUID: Kvcfp8ULT1Wd0OxcfN6UkQ==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.167])
 ([10.245.244.167])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:38:32 -0800
Message-ID: <318f1dcc-bc95-473e-bdb3-7ea03708395c@intel.com>
Date: Thu, 19 Feb 2026 10:38:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
To: Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
 <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DGIUZHKY84DC.W1UXLGE5HDIS@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,nvidia.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: DFDE615DE99
X-Rspamd-Action: no action

On 19/02/2026 10:16, Danilo Krummrich wrote:
> On Mon Feb 16, 2026 at 12:19 PM CET, Koen Koning wrote:
>> Use subsys_initcall instead of module_init for the GPU buddy allocator,
>> so its initialization code runs before any gpu drivers.
>> Otherwise, a built-in driver that tries to use the buddy allocator will
>> run into a kernel NULL pointer dereference because slab_blocks is
>> uninitialized.
>>
>> Specifically, this fixes drm/xe (as built-in) running into a kernel
>> panic during boot, because it uses buddy during device probe.
> 
> I just noticed that this patch was sent twice, and I posted my feedback on [1]
> -- pasting it here as well.
> 
>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
> 
> This Fixes: tag seems wrong. How is this code move related to this problem?

This popped up as a very recent regression for us internally. It looks 
like it worked before since link order ensured drm_buddy came before all 
the driver code. With above commit the link order changed and became 
drm/ and then buddy. See [1] also, which is maybe clearer to see this.

[1] 
https://lore.kernel.org/intel-xe/20260213152047.179628-1-koen.koning@linux.intel.com/

> 
> This should rather be:
> 
> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common drm")
> 
> Also, please add:
> 
> Cc: stable@vger.kernel.org
> 
>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> 
> [1] https://lore.kernel.org/all/DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org/

