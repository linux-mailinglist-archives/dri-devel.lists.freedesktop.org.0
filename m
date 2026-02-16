Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAZPHDvxkmlA0QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:28:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DD142572
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D00610E220;
	Mon, 16 Feb 2026 10:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOjZpmUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F3D10E220;
 Mon, 16 Feb 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771237688; x=1802773688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7BPZZX1a0vWZQpA3GDvT9q2vm3Wj7jWqIzohjFPB8GY=;
 b=BOjZpmUsWFq2HL2IOdeOl/aRezH0DprAsHFC8G7LLne0rT/4MfIsx8IZ
 JSmvgRv78doDy/1UwUWjMXRCgPdPRsJcwZYLKmcn0SABGlH86X0usdJ8h
 R9otNgOpxSlKQFEqBCxPmQhyvaMDqBgpU7O1Jh5kiJ6tRnMzCPKUtc2Gg
 TsiaofkDHjuHWvOU9Sf5ZAIAXAiYAoQHmWBGhem3EVbUAdXIClnTcLZyX
 JmsxtWYEHzXAdJ9lHJwZo6a72ismUV7WW0qPuRiaF0455hZ0M2QcAj3tb
 arvuz40M63FVkEUrJsZORiSEAA8zwXG5sEOBqs7h1mLj4Jh7yTrptHKtO A==;
X-CSE-ConnectionGUID: kipuUDbhSY6jtH00INxGIg==
X-CSE-MsgGUID: h+YmnerLRnuSWRa70n/2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83753504"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83753504"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:28:07 -0800
X-CSE-ConnectionGUID: fM0UaXf0T4iYKZv/TL1rfg==
X-CSE-MsgGUID: lsR9qRCRSA6AMIDWmfVNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212563946"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.239])
 ([10.245.244.239])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:28:06 -0800
Message-ID: <9ed1ed4f-5942-4e59-ad68-c038cb83c755@intel.com>
Date: Mon, 16 Feb 2026 10:28:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Fix uninitialized buddy for built-in drivers
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <77fc0550-cbb4-4796-85ea-c552e12125c1@nvidia.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <77fc0550-cbb4-4796-85ea-c552e12125c1@nvidia.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,nvidia.com:email];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E31DD142572
X-Rspamd-Action: no action

On 13/02/2026 17:27, Joel Fernandes wrote:
> On 2/13/2026 10:20 AM, Koen Koning wrote:
>> Move buddy to the start of the link order, so its __init runs before any
>> other built-in drivers that may depend on it. Otherwise, a built-in
>> driver that tries to use the buddy allocator will run into a kernel NULL
>> pointer dereference because slab_blocks is uninitialized.
>>
>> Specifically, this fixes drm/xe (as built-in) running into a kernel
>> panic during boot, because it uses buddy during device probe.
>>
>> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
>> ---
>>   drivers/gpu/Makefile | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
>> index 5cd54d06e262..b4e5e338efa2 100644
>> --- a/drivers/gpu/Makefile
>> +++ b/drivers/gpu/Makefile
>> @@ -2,8 +2,9 @@
>>   # drm/tegra depends on host1x, so if both drivers are built-in care must be
>>   # taken to initialize them in the correct order. Link order is the only way
>>   # to ensure this currently.
>> +# Similarly, buddy must come first since it is used by other drivers.
>> +obj-$(CONFIG_GPU_BUDDY)	+= buddy.o
> 
> Rather than relying on fragile link ordering, would it be better to use an
> earlier initcall level for the buddy allocator?

Ok, makes sense. Should we go with something like 
subsys_initcall(gpu_buddy_module_init) here?

> 
> Thanks,
> 

