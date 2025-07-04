Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12EBAF922A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6751A10EA05;
	Fri,  4 Jul 2025 12:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D1WXEN4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88F10EA05
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 12:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiGufOrWT6ZA9srFuHJ9ZlznoR2pNl/RrsIgccOat3+r14mDI28c1I3pZ4zXgMIaTyCqXTcWGinRThYKs05tHAz3j7b11I655P4RdhG9lBLbYsc71zZiRAY0TNOpvv6j28qYq/Oh1GRr9GqohzAT6GN1wuniV1kHuoTSZ9ZtaGlbXbHNdtxznze9SDFH6dgfMxgpzoRN+Px8TtzNajigPB8dSELPSUF8WcxTOZb/KHPrdWrsvbJbCNmGSFy7rrhBvMDSInSirQOQdZ6UAX2SGr8P1Gt0wH+dR3m2X3QEmjSKsmhCaVOGPgxWfKRV+ns/B2vFmWrBQYKsVZQqIyEtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JdH4IffkWs0W6+u3nfHz0kCrulEXc1alRcmTdjBeRM=;
 b=TVXgj34ug8ksYp1j9DB0HDwKOdoFcJuBEyWwO/WTMHM+UNskXpcyk/e/ZxW1Y0wl865o4VvFG6b6S61iDuVmpozZ4AGsIRhg5EibYMnSUZiLJsIgk3sjwv3JuY6BXxyD2t6dqYc3Aj9n2EeaV8xDOxz+8B3DeCuEvtMSg9zNm0IEi0EmXHks5il15VaEhn5HRkFqgTv3jthiyO+oMX2fUBrJZsTGxaGI66dAeUi4KcZq85lMn9foElxED2Gu/SVeiglBFzrYG5KBx4XBJVstLsanawFRDAeSirUMGVIBh5gCn4Fxwi37NYtlnd9O8JK67u3Rg2IhAegLahi0ShvQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JdH4IffkWs0W6+u3nfHz0kCrulEXc1alRcmTdjBeRM=;
 b=D1WXEN4v6DWX8QcW3Dfl2e8LS+ZnapCGv4l4slHuAdpqvq+LeQOKafNeFUuwXls0+/EZX4pzvsaKn79bAOflgBbeOp3G8qIo2ArMaBxC6zrjx5Ds90wchU1stiB9sZlLVc46VXBaL7ePRXJ6vKwgNyRU25uwpNHaDAIQ75Q05Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 12:06:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 12:06:12 +0000
Message-ID: <2be81e33-91f3-49f2-9293-231d48af381c@amd.com>
Date: Fri, 4 Jul 2025 14:06:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/framebuffer: Acquire internal references on GEM
 handles
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org, Bert Karwatzki <spasswolf@web.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250704085541.28165-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250704085541.28165-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: aebae409-f17f-409c-5746-08ddbaf32b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em1sYmZ2djhuZlpqZzgzc2FPTy92UWVBL3QzVksvZXBPMzgvYWZLdEloWVVR?=
 =?utf-8?B?OTNBWndLQWJhUEpKNkV2ZHp0UXF3dFhGMEc2eXVNeTJuQVlnTmFnRUdDNW1s?=
 =?utf-8?B?aTFVYWJIblI4TkNSV3pkNzd0Nmg3b0d1Q3ZFMmVoSDRJYkM1OXhUYTdZenNG?=
 =?utf-8?B?dk9KNVhOWEk1emlGVUNyTXV2R1grUlorcTVTR3ptYTFPdWk0WWN0UC9GT2dL?=
 =?utf-8?B?Q1laR3NGNHB2YXc1SjZZV1RzQ0cwd0htc1BMcHBodnpJNkt3NnRDUnZhbUZE?=
 =?utf-8?B?NzErZm4yZWw0Rk8xQTJpSkhEYlRUMmozWFRYblIzNGZ6eVB3S3ZTbjAzNDJP?=
 =?utf-8?B?a1VsQXc1OWN3NjVRbGZwZUE1aUhRODdSUlFYUjZ0dmtJanFqZ3VZbmtmVUVl?=
 =?utf-8?B?YlpkbUxSSUl1c2lxdnNrVkZ0T0R5NDFrSmdWTVgzb2Q5VSsyNWVnb2YvOFB1?=
 =?utf-8?B?RURpcUh4Y0FwanJkakFlRHRlRlRFbFc5ZEhiRlJzTDh6cVBsRGhQdkxORVNh?=
 =?utf-8?B?N0RWMzJiMG42aW9UTS9BU2UyeEt1dUJKZTdVaW9jeTA5WFUxK0ZWR0paZFo2?=
 =?utf-8?B?RTlFSlBXRnUrVGF1bk95UU8vK2NIOVUvSzNWUnRENHZwcTFlV1pVMm1sVVhM?=
 =?utf-8?B?c1pWditNVjJBMmFNWDI3RDNHM2tLeUExNVF5YXNxaXdwbkhCeGx6eUk1UWJZ?=
 =?utf-8?B?cDNVaGdrMTFmZVorc3JwMGZ5QlNGeUZiWTlNeWtKTm5UQ0dHTzkycUtKSmFa?=
 =?utf-8?B?emdXdkRmRE1xQklmL2hkQ2xobWNQZnErTk5KbHNxallVUTZlUmRMR2FEcXcy?=
 =?utf-8?B?WjZhSXh2VUd4RmVqWXhUM1JvYS83NldONW1RL3lDZHR5ZEVETFBPQ3ExNlZY?=
 =?utf-8?B?V25LL21ISHN5VTNPNG00UXdBbWpyZitpZHVQU3MxRnRMOWl3RnFBM05Sam10?=
 =?utf-8?B?aCtSbTNyTjVLNUZ0N2RTQ0cwK1RVa1duQitLTW5lV3B3ejBWWWF1cU1pL0lI?=
 =?utf-8?B?ZnkrTlM1MWxVekJPMWNRSXgyajlLNGh2SGxzeGVma2V6RW9xaXJjWDBETlpq?=
 =?utf-8?B?Nms1M2xqSFNZN0trNU90NWI5d1BRaTU3T09UcU1adzVHc1JWNFZETSt3RjY4?=
 =?utf-8?B?NjRsTEV0MlYvdHFxOC90dFQxSi83clJrVGUxMnNZRnRRa3lxVnNCd2drK3ht?=
 =?utf-8?B?YU4vV2FQelV3dC9OZzRGWnUrZjVWZkpKbnhWTmR2Y1o0aW5XaW9CaDNNb2lj?=
 =?utf-8?B?TTZ2ZVRnWVZselFnTWFudTFBdUFwYnQ3VG5mL2tnb0Q3STFPMktYeDBQQ3d2?=
 =?utf-8?B?bnQrb05mZ2xBYWVlYk4rUnV4dVJnbTk0alB6MjNQSG5uT0JxRXVSMUxzdWZL?=
 =?utf-8?B?bDBCcDYyNlVtVVZTazhPVWlmZE1JRW02WC92WkM4b2hDMnJiMEUrUDlCRkcz?=
 =?utf-8?B?YlQrYmNQTnE4YURNWGJ4T0tHUGVCcXpOS0VReUZTVmVROXpuZk9wL0g3RnFk?=
 =?utf-8?B?bFBIY3gwbS9RbEYyTUNLNng2dVgrT211K0pSNTZFS0dkOWpJZ2p5N1pDNUI5?=
 =?utf-8?B?NXB2eHFINjJFME9Wek5pRi9FNkpmZzhMZGVuVGpUL3BGK2hxL2RRUzRacjkx?=
 =?utf-8?B?TWRCQ2lHKzdBR1hoSHpsVzhzTGhpYzdHd0FRbHVkREJtWEpjWCtvajJYQk1n?=
 =?utf-8?B?Ny9YSHl5WjhybDN5N0trblRBWHhncVRKNlJ2WjBscHBiZy9GVDRXK2IxY0lS?=
 =?utf-8?B?cmo1WGd0NWJNZTgraFo1SDMwV1JOdGtnallPQ2lOR1d0V1ZmSUliQWxvMUFG?=
 =?utf-8?B?djBxeFdmcWZzYUZqb1lIbDV6aThCaDY0NEtPcEhTSVFaYnc1QmxjT2JtUUZU?=
 =?utf-8?B?S2ZLajNLYldkQXk2SXVHRmF5cENJYk93TENxSld0S2NNMnUwM2pnZVVuZzJ2?=
 =?utf-8?Q?0H5rHUQVRQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJyVUFpMEdBSEFQcUIvdDVIb3dEK0VFVFBMNzc3R0pDalhPS2NxOHRLYm9F?=
 =?utf-8?B?TXZGdFJPM2JUd1BaeFJxQnluSVVlKzRpalpHVUpRYmhLclR6MUUzSkZvSmha?=
 =?utf-8?B?NDdPVHBRMHJzUHhLSm5uWUVTN2RDOGkxZ0VUbjZDNnBzbERZaUxWc3lxMUla?=
 =?utf-8?B?aXNwWXFhbE5tcjVxRXBCNFZBRElRUDZlLzhKOW40TFJ3Mm12VitHMkt3cnJG?=
 =?utf-8?B?cjZ1Zk1TUmdWKy9nYXFwWWhZMlZGZGtWNDJVRjJvZDhHYmtiTUNkckFkVXpT?=
 =?utf-8?B?Y2tPNWFQY1RsdmpoTlJrOEg2VVpjMEh4REVmY05pc1R2aHVPc1VLWlRIMjg5?=
 =?utf-8?B?YjBHVWNESGYvUWN0T1VYd0hhT0daU3VFdjBOSFZtQUt0OGxqY1VNSG5OOUtF?=
 =?utf-8?B?VnNFYzRJV3Zob09xQm1adjVDeWFZak9aYkZlSG5yTUs5d0toRWtOK0FMNjlp?=
 =?utf-8?B?ZXFiM0NORDJ0cHUwZm1zODYxNFRvODNNZUlZVW11aTFvMnhRalR3LzNPNlFO?=
 =?utf-8?B?MmUydVd0OTMvN3kxTGJYSHFpVWdMTFJWYXdhcGlSYU9NY0V4T0Fyb21Ja3NB?=
 =?utf-8?B?S0pKaVRWbkZmTnRGSFN5T1ZNN2wwNExVMHN6ZkJqK2JIMXZmalhldTdrTDc5?=
 =?utf-8?B?UkVCODc5OUloNU55ZXRzWG81QS94TG1DVEczclU0aXV2R3ZYdURMUjJHaUVw?=
 =?utf-8?B?bmZxaktqbC9HdDNzYm1jbGkyWENmL3Z2WVRaeWgyVjFpT0xLNWE3cTJOZ2NX?=
 =?utf-8?B?WXhvSXdVSnF6c1hZUzdTTHBFdk5XYUxFNjdyN2U2TEtxRFk3L1NvOUUvVk1u?=
 =?utf-8?B?VVFmTFJ2UEVoMHIyMExhMGhhS2hoTzdLQVpsVi9lSFFxRFVUWGN5QkxGNTlv?=
 =?utf-8?B?dGdjdHV1MlVmdmNXaG1kcnZwY1dDTGN0V0dNcUtkM0ZhdnptY2hFYnU3Q0Rz?=
 =?utf-8?B?VzFsOEQvOUgyejIzNXRLNmh2Ung1ZGVmem1sRnhxSHg3SWVBUnBEYi9lQWRR?=
 =?utf-8?B?cjRSM0VZbi8wRUhaRkNsZTFhRFlpbWEya0lxNHZsK2dQbVh3bjl2Ym9pZTBK?=
 =?utf-8?B?SkZSc0k4R1phL2p4dXBRaWNsZXNsdE5HZTk2bDJDM0FteEl3c2h6NlNKNDkw?=
 =?utf-8?B?dEsvVGZKa2RhaVk1Nm5hRHozaTZTRmp5eC93d09kcHRIN0gvUUJVR0VKZXV5?=
 =?utf-8?B?cjVTTW4vdnZma1FBRE1QdFpuUmt1dnh2aHZmazk2ZUtYUFlCT3ZGOTBQVGVw?=
 =?utf-8?B?TmVIak5INmZpb09MVnA0RzIyd1N1RVRJaEZkYlAyOXMveGhNeDdTd3FZUHRI?=
 =?utf-8?B?czVVdXV4L25rOCs1OXUwY0tBSG9RWGRrOU9WQW9OT25ybUdZVFA0YmlHZ3JB?=
 =?utf-8?B?R1BVU1B1YVgyVGNHQ1djQU95eVlvbTZUd05TR0NNSnZvNDJZdVRjL3NaMEdv?=
 =?utf-8?B?QjBrUFQvYzVRajJTeTN6OEcxUVpyWTY4c3hlbEU3bmlYQTdHYm45NWpPYzA0?=
 =?utf-8?B?WFcybEFxYVJsUVQ5YnJ3dU55dGt6bDZ5UGhoQUdXekNwckQ4amU0cTBtcCtR?=
 =?utf-8?B?OGx2ZUEwNEhQQk9OcUZIcnpJYm85UEkrdEZXTW0vTFIyU0RJWWVqTmVPdVk5?=
 =?utf-8?B?ZVU3RlpsRWQ3OWZ4bXhZUFpDK1BXazRvQ2VZUnRyMFNwUGZyL2NqTUdmOWpx?=
 =?utf-8?B?S0djR2RPN051L0hIQUFCeUJlUGhCYktPejB0WVhvL0VsWjREL3NUbURBUldy?=
 =?utf-8?B?UXd4Mm9hc1pnZEZNb3ZibG53blpIdXlvWEE5V3FFTEdHeTFKN25ObDNDUm05?=
 =?utf-8?B?MXNrN2xjRkxvTEFTQWhyaUVvR1A0aklwNXoxdUpSZktLc21sZU42NHZFNDRE?=
 =?utf-8?B?cDJlMjRvTnVIcTZIY2paZ2ticzhoM3VFUnBuQnRWbXZRMzhkSU81cFVlL2JQ?=
 =?utf-8?B?R0tjdTdRRExSYm5acVFnbEJRemdsNkVPQzFUZ2xZSmVPU1U5a3U2dXpzY1Nm?=
 =?utf-8?B?RVBVL3Nzc0k4V1o4ZXpEd3FMbU5WTHdpSjBUaFlVaEJXWnR0L1NQUE1WYmRl?=
 =?utf-8?B?N0tHVm1iQVVsZTYrZXRvY2t2THJ1bUl2LzJmbnVUVWtjOStUK3JoTU1qRFFZ?=
 =?utf-8?Q?3vwc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebae409-f17f-409c-5746-08ddbaf32b3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:06:12.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 749xHPjIUNVCn/hE3gnZcTxtr/Hg27UJtZNCy52OOoEOANoF8/1+OTbHr2pjUqv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022
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

On 04.07.25 10:53, Thomas Zimmermann wrote:
> Acquire GEM handles in drm_framebuffer_init() and release them in
> the corresponding drm_framebuffer_cleanup(). Ties the handle's
> lifetime to the framebuffer. Not all GEM buffer objects have GEM
> handles. If not set, no refcounting takes place. This is the case
> for some fbdev emulation. This is not a problem as these GEM objects
> do not use dma-bufs and drivers will not release them while fbdev
> emulation is running.
> 
> As all drivers use drm_framebuffer_init(), they will now all hold
> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
> references on GEM handles for framebuffers").
> 
> In the GEM framebuffer helpers, restore the original ref counting
> on buffer objects. As the helpers for handle refcounting are now
> no longer called from outside the DRM core, unexport the symbols.
> 
> Gma500 (unnecessarily) clears the framebuffer's GEM-object pointer
> before calling drm_framebuffer_cleanup(). Remove these lines to
> make it consistent with the rest of the drivers. It's one of the
> fbdev emulations with no GEM handle on their buffers. The change
> to gma500 is therefore rather cosmetic.

Could we separate that change out? I mean we want to backport the patch.

> 
> Tested on i915, amdgpu (by Bert) and gma500. Also tested on i915
> plus udl for the original problem with dma-buf sharing.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
> Tested-by: Bert Karwatzki <spasswolf@web.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/drm_framebuffer.c            | 23 +++++++-
>  drivers/gpu/drm/drm_gem.c                    | 59 +++++++++++++-------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++---
>  drivers/gpu/drm/drm_internal.h               |  4 +-
>  drivers/gpu/drm/gma500/fbdev.c               |  2 -
>  5 files changed, 69 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index b781601946db..e4a10dd053fc 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -862,11 +862,17 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>  int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  			 const struct drm_framebuffer_funcs *funcs)
>  {
> +	unsigned int i;
>  	int ret;
>  
>  	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>  		return -EINVAL;
>  
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->obj[i])
> +			drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
> +	}
> +
>  	INIT_LIST_HEAD(&fb->filp_head);
>  
>  	fb->funcs = funcs;
> @@ -875,7 +881,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>  				    false, drm_framebuffer_free);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	dev->mode_config.num_fb++;
> @@ -883,7 +889,14 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	mutex_unlock(&dev->mode_config.fb_lock);
>  
>  	drm_mode_object_register(dev, &fb->base);
> -out:
> +
> +	return 0;
> +
> +err:
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->obj[i])
> +			drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_framebuffer_init);
> @@ -960,6 +973,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>  void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>  {
>  	struct drm_device *dev = fb->dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		if (fb->obj[i])
> +			drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
> +	}

That goes boom as soon as somebody grabs a GEM handle for the FB used for fbdev emulation (which is perfectly possible with the UAPI but not done currently as far as I know).

It's probably ok for a bug fix we are going to backport, but a more robust long term solution is really desired here I think.

Regards,
Christian.

>  
>  	mutex_lock(&dev->mode_config.fb_lock);
>  	list_del(&fb->head);
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bc505d938b3e..9d8b9e6b7d25 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -224,23 +224,27 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>   * @obj: GEM object
>   *
> - * Acquires a reference on the GEM buffer object's handle. Required
> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> - * to release the reference.
> + * Acquires a reference on the GEM buffer object's handle. Required to keep
> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
> + * to release the reference. Does nothing if the buffer object has no handle.
>   */
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  
>  	guard(mutex)(&dev->object_name_lock);
>  
> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> -	drm_gem_object_handle_get(obj);
> +	/*
> +	 * First ref taken during GEM object creation, if any. Some
> +	 * drivers set up internal framebuffers with GEM objects that
> +	 * do not have a GEM handle. Hence, this counter can be zero.
> +	 */
> +	if (obj->handle_count)
> +		drm_gem_object_handle_get(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>  
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
> @@ -272,21 +276,11 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  	}
>  }
>  
> -/**
> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> - * @obj: GEM object
> - *
> - * Releases a reference on the GEM buffer object's handle. Possibly releases
> - * the GEM buffer object and associated dma-buf objects.
> - */
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +static void drm_gem_object_handle_put_unlocked_tail(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
>  
> -	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
> -		return;
> -
>  	/*
>  	* Must bump handle count first as this may be the last
>  	* ref, in which case the object would disappear before we
> @@ -304,7 +298,32 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
> +
> +static void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
> +		return;
> +
> +	drm_gem_object_handle_put_unlocked_tail(obj);
> +}
> +
> +/**
> + * drm_gem_object_handle_put_if_exists_unlocked - releases reference on user-space handle, if any
> + * @obj: GEM object
> + *
> + * Releases a reference on the GEM buffer object's handle. Possibly releases
> + * the GEM buffer object and associated dma-buf objects. Does nothing if the
> + * buffer object has no handle.
> + */
> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj)
> +{
> +	if (!obj->handle_count)
> +		return;
> +
> +	drm_gem_object_handle_put_unlocked_tail(obj);
> +}
>  
>  /*
>   * Called at device or object close to release the file's
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index c60d0044d036..618ce725cd75 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
> -		drm_gem_object_handle_get_unlocked(objs[i]);
> -		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_handle_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_handle_put_unlocked;
> +		goto err_gem_object_put;
>  
>  	return 0;
>  
> -err_gem_object_handle_put_unlocked:
> +err_gem_object_put:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_handle_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f7b414a813ae..9233019f54a8 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,8 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> index 8edefea2ef59..afd252108cfa 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -121,7 +121,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>  	drm_fb_helper_fini(fb_helper);
>  
>  	drm_framebuffer_unregister_private(fb);
> -	fb->obj[0] = NULL;
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
>  
> @@ -243,7 +242,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>  
>  err_drm_framebuffer_unregister_private:
>  	drm_framebuffer_unregister_private(fb);
> -	fb->obj[0] = NULL;
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
>  err_drm_gem_object_put:

