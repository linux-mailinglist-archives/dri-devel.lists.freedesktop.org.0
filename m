Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFNpGQKYrmnRGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:50:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7832368A9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4810E4C2;
	Mon,  9 Mar 2026 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mb9Ersib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD310E4C2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773049854; x=1804585854;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9n/F+GNIb3KTb/ZvF65w06h0z0MbkqMuh1R2ftODjWk=;
 b=Mb9ErsibibKuUQEf/QW+0EHgu2utrBCN1VyV9/dEvVrrFyVrHsrgt9R5
 yjsapJw8RffiV7zw/OUaZxx6DGi/m4nsn/s4r0Xgc5cE/V14tiXI0GCKb
 bn7UMwctxsqJ/ycmlUviavmeuwDKp30O+E3ZKLo8i4akUmjL0WlPW5aTa
 B6yDsxzW7GZ61mUXofEdfiMMoMJxIgnVRyQWt7BS9pwLtQ9R/5cSrcMsH
 JCKU5qIC8cBs6YSUUBivWghAgOa6Cpg1Jz1o87zf7tWS0bjGD2yUfYjNz
 qyfPVWyxdZ9GVY33ntAlfDyvAs1C3VyLUs55DHgeV7l9I4LGwxOa3Gwxa Q==;
X-CSE-ConnectionGUID: kMahJY88Rk+jFrbiaT/C2Q==
X-CSE-MsgGUID: dxBpe1usTIOQK5TF1DAX8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73985054"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73985054"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:50:54 -0700
X-CSE-ConnectionGUID: 0mWk/eckSXqcBf5YSl1l2w==
X-CSE-MsgGUID: Slx1mPLcQh+zA0O8MGJFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250169852"
Received: from unknown (HELO [10.102.88.20]) ([10.102.88.20])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:50:52 -0700
Message-ID: <00f31e8e-8a60-424f-a4c2-8e78854f7226@linux.intel.com>
Date: Mon, 9 Mar 2026 10:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 andrzej.kacprowski@linux.intel.com
References: <20260309092755.3165130-1-karol.wachowski@linux.intel.com>
 <4111369f-f090-4061-91d6-69b6462af86f@suse.de>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4111369f-f090-4061-91d6-69b6462af86f@suse.de>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: AB7832368A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:andrzej.kacprowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.intel.com:mid,suse.de:email]
X-Rspamd-Action: no action

On 3/9/2026 10:39 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.03.26 um 10:27 schrieb Karol Wachowski:
>> Instead of testing import_attach for imported GEM buffers, invoke
>> drm_gem_is_imported() to do the test. The test itself does not change.
> 
> Thanks a lot!
> 
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thank you, applied to drm-misc-next.

> 
>> ---
>>   drivers/accel/ivpu/ivpu_gem.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/
>> ivpu_gem.c
>> index 98b9ce26962b..8009965286e0 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -48,7 +48,7 @@ static struct sg_table
>> *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct
>>   {
>>       struct sg_table *sgt;
>>   -    drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
>> +    drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base));
>>         ivpu_bo_lock(bo);
>>   @@ -157,7 +157,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo
>> *bo)
>>       }
>>         if (bo->base.sgt) {
>> -        if (bo->base.base.import_attach) {
>> +        if (drm_gem_is_imported(&bo->base.base)) {
>>               dma_buf_unmap_attachment(bo->base.base.import_attach,
>>                            bo->base.sgt, DMA_BIDIRECTIONAL);
>>           } else {
> 
Karol
