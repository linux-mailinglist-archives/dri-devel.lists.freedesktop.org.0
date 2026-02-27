Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Me1MsxvoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:19:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F71B5EEE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518BE10EAEB;
	Fri, 27 Feb 2026 10:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XNT15p4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012066.outbound.protection.outlook.com
 [40.93.195.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245C10EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/F8iAHU5kHXrIO/LMdsHDFBxKd5Q95Nq7YhTWBqU2poxHG6h77RZdrjH9e1870aAAesS2uYK6FreQOKn2iAU0a7mby/dJ2aK6ruGC6zw/hx63S0t0QWGY0Uz4ZrNesbAWDyjNEtXBcNKDwnxotqGFo7xulUyBngECrLxWM589d8cG7kf3iWxOV2cPlThzIlOez6vMO6AYZ0PdosQOiycJL3eRt4qlTkm5waAG7D68VbrwtDg6YnZTTCBIPw5Ui3KWkxVJigHdwhGJg7UAsKKBZX0OfZXRQtqOuIuEc2HoqAryE/VNaSpAa6X9cOKP8qBa9uar20s/8gPBqLaTL5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEVlchxHYL1DzO3wEhL/fKTc4i0ry9J2HHAC1njVkTU=;
 b=UEwkOYGkKzOrBoRZ7h2ozFQuSMZucXjFGDjm78bqLRfryPU01ci4vLjj+IqWgGw9kLv2IVATSUZKrUWiLlIjYOE4ulVHcRO1wPq81J6JKRm0dnF2HUP2smtAiGaFUqcekSCQfIrmE2ReWUMRqcRTv2M1M4mFPl931vhAVoXBrDF8HcDbvD61PerxWM0VrX16KqFdRYDdQP1BCgXOfMBgywZd4GGfIwygDv84diXBW88x2KHTyR+Hl9gt702nJf470suY/RxcivKu/3eF9BCcctf4OIqs1fgk9oXHy2aa/3TsdIdCm+jJFWfo2h49hN4Mafw4cj5OumwbO7DR0fPHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEVlchxHYL1DzO3wEhL/fKTc4i0ry9J2HHAC1njVkTU=;
 b=XNT15p4Jxf+8qk8HRP98CytQzRhpr+csd9rpnu8bMakgW+7r+IYwWwIh9LmaTSbnLyuvAFhkPlAsyXDmLoB6oAdbNMi20fcwekTayiIu2iZjKnvJC0J8LCWDhkU/fIktoKHATPjM/732jKxWYPiaHIz08rKThzs+v/F5czhspPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPF4D923B935.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bcd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 27 Feb
 2026 10:19:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 10:19:47 +0000
Message-ID: <000e4bd9-4b01-415e-b4ea-7a1244432047@amd.com>
Date: Fri, 27 Feb 2026 11:19:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: Matthew Brost <matthew.brost@intel.com>, Yicong Hui <yiconghui@gmail.com>
Cc: michel.daenzer@mailbox.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <20260225124609.968505-2-yiconghui@gmail.com>
 <aaDkEQcycghQBmD2@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aaDkEQcycghQBmD2@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPF4D923B935:EE_
X-MS-Office365-Filtering-Correlation-Id: 169dbc1f-0cd7-439d-7254-08de75e9bbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: ejSSbXp9jTodRC5CmK69upSx/wKWRWBL6FYvF4GxZN9x+e9aJXEnzOJeBNSbohV0WRRnw1+ddUOm5r9gw/qpee6H86szby/NymdEVE8huNSk+7Ylwcq8Gin/mMTn4LnHiuTDaD8IyxEgDLq+7Twl8MSfqyRCISz1s99+KS8fIxYL2krlX4C4Zg6yezOhov+zRvfle9Hc6n+0fbL4+Y6v3jWYyIZ310UHWYiFZ8ofPo/d6xsu+f/TedukyOyznBgwjaq2FpM1w9zT4lLVyxPeR7zPDScG+qmKvABmdp46+1wX01AbgBKFG+zLXW8Xp1LiV5GrYuMwZ7f2+mNoI+gzYLS1lJbK6YJxG/KEWkuoofIAzFvSdg1d+ZLRNp5KmkdZBgYsH3YIesHD+R6tEngT1xSFP/VcOXF8r9WOuplIvdI3n9/Zt37SGESU6EJBqrkRwgXye21A/M4HJp4IqYesKEAZ2bOaJ05Hng3sA2x+q9JMoutYfWSxLaiGM79DtAtKsGE6U8RJyxG2W3nkpxaln5et9+khNWEGVoaMEIR1nGFnZyNwbOIroq+b8Oysvw5bgGPtRz4J0pOX+XksHralWNZYRIArzoPqYRMREJdD9UqCP5sKA5+En+G29aFE16eZ9ydlEDRnjYykHCyt+g4j7KYeHv3gYe8nDCmGXzllw8uzYX/VUr8iAlkBwqSwgwD4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDF5elVGN0E3U1ArNjF6Rm1vcHVtTkEvbGgxaUt4TlR5N3AzK2JTVC94WkIv?=
 =?utf-8?B?dDhRSWpQMnVzSUQzcytoWEtINTJtTklxSEdGL0hLUXc4QytqR2RpL25iNXhh?=
 =?utf-8?B?c2kvRUoyeEN3d2l2Vkw1OGlwZ0lPa29EcUlsc1hzNmFUNHJjUStLQ3FrV0Jx?=
 =?utf-8?B?bVZKUVErMWVIOG1GYlVjYkRPaXBWMDdwUmZuWjB6NlRsaEVqY1krYktqNC9H?=
 =?utf-8?B?TEd2VEgrLzZ4bW9vVVJzZERwSVFhZmY4b1VIZ0NJbEtBV1lpZUxZL25WSi8x?=
 =?utf-8?B?ZndyZ0QreUVINXhzbjIzbmdVTkZMWlRrNFgwYWtBWGFON0cySVlsV29DeHFs?=
 =?utf-8?B?cmNjeUh3Q0l0SWh6ZVdmc1Ura1gwNmNaM3RXYjd3cUYxcE1JYTlOZGM2cEVo?=
 =?utf-8?B?dlBZZjIvMGRISUllZkp4QzZmZjdHS29WY3hRSXI3dkhFdlUreFV3cGdrRlJp?=
 =?utf-8?B?YUdwNVp5TGFoeXRHYkFTRW5rODhmTWl3OUZyNTJyOFA0Q1B5eTZHUzYrcU4y?=
 =?utf-8?B?RzJrbkI4TTBSZWMwU1JiQ2thcGtOdmZNUExaWXRodkx2WnlCYXlaZUxlRDJo?=
 =?utf-8?B?aFNHZHJTbkpmMVlxKzRPVjFGazRGMkZRMnVpSEdnK2xWR2RxMDM5QllQT2dU?=
 =?utf-8?B?V1dJZkF2azVwUktWMXlnbllNUnZmT3VsMTg5N1c3d2ZxMmxkVnoxeTRZMkZU?=
 =?utf-8?B?alJhUW9CUzVQbDUrK3pVcnVoaXFFTGUxWXh0QVpQcUp2YzdWYzBQTmpBR0V6?=
 =?utf-8?B?cXJQbDdWZ3lhaUpDU282QmZmWEJiSlU0THE5Y3B2dEtPaEpVR0FWNmhodlJQ?=
 =?utf-8?B?U202K3RVeGYvK3BRdlBLWTBERzJYaWlnUitncGsvME16SU93NlBhSjBmMFly?=
 =?utf-8?B?MVQvUDFSNVR0TnBOc3FsN25kNnVrdzNIQWJhVEt4Y1dVU0c3Z1hyU2d1UkFT?=
 =?utf-8?B?cTZiaWlFMnhmNWFSSkVlaFZoSlVBeG94OUppeTBmSVN5cFM0QWRzV3dtMkt2?=
 =?utf-8?B?WmNQcXBMbDNTeGF1bGhVYkhSWnY5djRDQ0FVOFNueWhXclZDUG5nSUlneHFx?=
 =?utf-8?B?ZllRbHVveThlbWI4YTN3M3BpK09ocVBNbE8yTGFRUWtjYTVKeFdjdHRwUFF1?=
 =?utf-8?B?engzcytHZHBKK2R2SFNLNWFRTjZ2eS9sNE4vZzZwSWRpK3VSVUcwWk0rRGZO?=
 =?utf-8?B?M0xlejltNDFaemVjZVJyUjdyQXV6YlpJejl0bmZBYkVvRC9zdTVkNSt3RElw?=
 =?utf-8?B?MkloaFZQUVU2MU9DWDZ3ZGgrc0ZzZEptWERqdjY2VFhkUS9LMjJCRnV1amlt?=
 =?utf-8?B?WkZIZ244ZU4zOENPcFJHVW1ad0xCQXR4VXZlWTBidlArc1ZxM1doZjZqTnJl?=
 =?utf-8?B?S1lRQmUzM3NYL09OQXhpZ0FLMjIzajJYMmJ2NTAvZ1NEYUFSTlpvVHpETmli?=
 =?utf-8?B?TFVYeEg3RnZUNzhIbTlUQXJvZWhiL1pSSjhXWEV2emZZNUsyRkg3dFdDM0xa?=
 =?utf-8?B?QitTL012R0podVpZT21XUXRxaXFhZXprejl4bjF2alF0cmZMNzFKaEtVQytQ?=
 =?utf-8?B?R2l6Uit2OXdCbERjQ0RHTHJKNEZCOTZCaUVJS2FRdUhmV3hSZEZDZ0RoZm5m?=
 =?utf-8?B?dC81N0UrMlZKOW5tVFV6NThlTWdPemtjbm5Na0N2SGZTSkwyb0xFWDRaWFRV?=
 =?utf-8?B?dWk4RnVHTWNZZXo5NzFsR0ozdVovbjRzU09aa3ZGS3BGR25YVmlkUUFKdEJB?=
 =?utf-8?B?V0xqVzhWNjBYZGVEYWZLckZiS21NL2NQaE91MUlqS09zRWt5Q2ZiN0RESmRh?=
 =?utf-8?B?cUlVUXhDUEQrR1NBdVIvWUVmMTlPRUs2VFdVREVrNzg4S3YvcWwvaW9paCtK?=
 =?utf-8?B?ZUM0QWJEMFBUcmkxdUp1eWFsalBIS3pvZlpvUVNzZnpGWmdNbmNWdjZ0d0NT?=
 =?utf-8?B?ZVVrQ2RXalRLZ3JjTk44N0Mybkp3Z0hCK3ZNaDdwbzIrQnBZcDJEVmVjdzhL?=
 =?utf-8?B?UDdJVXNPeno2YmRCWDhnZGt1Q29LcWMxQ2tYRWJReEdYdVlxbk5jSDd1bEo0?=
 =?utf-8?B?Skhwbk1lWTQwRTJ0VG5ETkU4a2pSOGl5MHlZUjcvZ2xjZnRRS291SGIrdG9F?=
 =?utf-8?B?TkhKaEg3VUFoQUR0U0NkKzBPWEVXMkhOcy9PYUdYbFg1SjVBc2t2VzZvWGFQ?=
 =?utf-8?B?QytBeHpJTXMvaHNIcjBNd2h1WVo4ZHNxOWJSWVcxRnhCNG9ZemprZW1CMWhB?=
 =?utf-8?B?cis2Q3NBUFFTQ2t6QXEwdHJsSjZWSVRLSXZqeVVRSXkyb2RoU29Ebys2Tno4?=
 =?utf-8?B?NjlwMEZkZm10blZVWGhlMHFkVjZhMkpFSi8ybmVXMmxzaUZndStJZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169dbc1f-0cd7-439d-7254-08de75e9bbcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:19:47.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAx+GnXnEzEnmEWMHDUy7FSsu/u3YPMBysi6f5NAU/2XZRgPWWL3afG/bG3zGb1y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF4D923B935
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.969];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2D2F71B5EEE
X-Rspamd-Action: no action

On 2/27/26 01:23, Matthew Brost wrote:
...
>> @@ -1702,16 +1708,28 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>  				point = dma_fence_is_signaled(last_signaled) ?
>>  					last_signaled->seqno :
>>  					to_dma_fence_chain(last_signaled)->prev_seqno;
>> +
>> +				error = dma_fence_get_status(last_signaled);
>>  			}
>>  			dma_fence_put(last_signaled);
>>  		} else {
>>  			point = 0;
>> +			error = fence ? dma_fence_get_status(fence) : 0;
> 
> dma_fence_get_status returns 0 (unsignaled), 1 (signaled with no error),
> or fence->error (signaled with error != 0).
> 
> Is it intentional to return 1 to user space for a signaled fence? What
> if a driver sets fence->error to 1?
> 
> Side note: the fence error kernel doc says fence->error is only valid if
> < 0, but dma_fence_get_status doesn’t enforce that.

dma_fence_get_status() enforces this with a WARN_ON().

> Also, returning fence->error directly to user space seems like a massive
> problem. Right now, drivers can set fence->error to whatever they want,
> but now this gets reported to user space and suddenly has meaning. Does
> user space take certain actions based on the specific error code (e.g.,
> -ECANCELED, -ETIME, etc.)? It certainly can’t, because we have no
> internal kernel standards for what fence->error actually means. Two
> different drivers could assign the same error code but mean entirely
> different things—or the opposite could be true.

That is not even remotely true. fence->error is already used in the UAPI for syncfiles for like 10years or so. Android is massively relying on that.

There is also documentation on what values drivers should use: https://elixir.bootlin.com/linux/v6.19.3/source/include/linux/dma-fence.h#L565

The error reporting was just missing from drm_syncobj and only implemented for syncfiles and that's what this patch set here is fixing.

Regards,
Christian.

> 
> Thus, without some standardization plus fixing every single driver, I
> really think the best we can report in a generic mechanism like a
> syncobj is simply “error” or “no error."
> 
> Matt
> 
>>  		}
>>  		dma_fence_put(fence);
>> +
>>  		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
>>  		ret = ret ? -EFAULT : 0;
>>  		if (ret)
>>  			break;
>> +
>> +		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {
>> +			ret = copy_to_user(&handles[i], &error, sizeof(*handles));
>> +
>> +			ret = ret ? -EFAULT : 0;
>> +			if (ret)
>> +				break;
>> +		}
>>  	}
>>  	drm_syncobj_array_free(syncobjs, args->count_handles);
>>  
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 27cc159c1d27..213b4dc9b612 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1044,6 +1044,11 @@ struct drm_syncobj_array {
>>  };
>>  
>>  #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
>> +/*
>> + * Copy the status of the fence as output into the handles array.
>> + * The handles array is overwritten by that.
>> + */
>> +#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1)
>>  struct drm_syncobj_timeline_array {
>>  	__u64 handles;
>>  	__u64 points;
>> -- 
>> 2.53.0
>>

