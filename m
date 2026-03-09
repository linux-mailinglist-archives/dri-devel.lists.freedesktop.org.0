Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPe9NeGSrml0GQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:29:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200223628D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B50710E4B7;
	Mon,  9 Mar 2026 09:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ronp3cB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264DC10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048542; x=1804584542;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ZQjD6ZOVykB7A5MJCwgp3g/Bg29OKGa1X02T1DDqyxg=;
 b=Ronp3cB3FYz30QLVXlr8vQ0/WdBZ3szf0dQCkN1T1O21ynig3p5Qr0jS
 vUlYGjhcmjSkYnNLCNH6byQv2dcSAM34hM2+mqyu6GgeCV/cnEivFZx6U
 TzsF8lWfQ8eS/AN6c24g8chQtGr0oaJ5Jg3Are8vWQBP114XQhHkVmzfV
 VUAw9O3Rj+gJNzD/LQ2+UCGOc46Qgwci5bxVBfwZTieqgJ1l97evczRjB
 K66kQfw4Pfa4hsTOCpJ7xUUugCExWyAjAesIm4g9g8biypnmZ8y7FzG2P
 DhQ++xJqpS7+c7daOS/+A4Zdmw7qwfPF+dpYg8VVMfX5IPzZ2pkOlcblB w==;
X-CSE-ConnectionGUID: IAo/5CKFQ5W9GHG8/pO9kw==
X-CSE-MsgGUID: VEEklRN+QdCQpo8tc+Bl1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99535595"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99535595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:29:02 -0700
X-CSE-ConnectionGUID: YYoCx/aATxyUPjSC0ZBKxQ==
X-CSE-MsgGUID: yywyNF2HTZqO4y6cEXbsBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250163878"
Received: from unknown (HELO [10.102.88.20]) ([10.102.88.20])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:29:00 -0700
Message-ID: <f8d12007-ae11-4995-bba2-832c1208ca1e@linux.intel.com>
Date: Mon, 9 Mar 2026 10:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20260227133113.235940-1-tzimmermann@suse.de>
 <acb789e6-d7ca-42db-ae2d-8618a8c3feb2@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <acb789e6-d7ca-42db-ae2d-8618a8c3feb2@linux.intel.com>
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
X-Rspamd-Queue-Id: 0200223628D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maciej.falkowski@linux.intel.com,m:ogabbay@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Action: no action

On 2/27/2026 2:54 PM, Karol Wachowski wrote:
> On 2/27/2026 2:31 PM, Thomas Zimmermann wrote:
>> Instead of testing import_attach for imported GEM buffers, invoke
>> drm_gem_is_imported() to do the test. The test itself does not change.
> 
> Thank you for spotting this.
> 
> There's also another place in drivers/accel/ivpu/ivpu_gem.c:51
> drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
> 
> We will push a patch for that.

I've sent a patch that covers both cases in a single commit. Thanks.
Karol


> 
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> ---
>>  drivers/accel/ivpu/ivpu_gem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 98b9ce26962b..9e2f1b60f632 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -157,7 +157,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>  	}
>>  
>>  	if (bo->base.sgt) {
>> -		if (bo->base.base.import_attach) {
>> +		if (drm_gem_is_imported(&bo->base.base)) {
>>  			dma_buf_unmap_attachment(bo->base.base.import_attach,
>>  						 bo->base.sgt, DMA_BIDIRECTIONAL);
>>  		} else {
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

