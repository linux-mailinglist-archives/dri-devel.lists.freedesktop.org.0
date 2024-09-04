Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D427496B35B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842810E6AD;
	Wed,  4 Sep 2024 07:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sNDBnJGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957B10E6AD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCwJnvy292FeloALMU/i++3JSKv1Gvp7xwW3HUaaKRUSZR9+wrjXrwJE7C3nlpIVHMTbjUwYkJzC3faAgWMHEXkh+yYunvSecjYe90Zo/WFzfwsDJffVSUhXRYAN09oXJmc7Kw/DOEiutCJkd5VyJyFMlynigq41nUDQhUmCD5z7bpfhl4Fvs263+BtDGQsh304yvVUXRSO5RaUgAbmuKDWStDvGZlSQhmEdD50HL+O+ccjlFkuIZOR87NyeZVCVs7QAo0oZibv3X14QCCjQbU1KCl6RB+s1NEsZamKJcLxquPPMzWJ7IGd4RVUwCVAxI8ckNKNL0VVP8Q3US9Flcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eETfzP/dRZiCNTOQPdvPEJiPN44AbnM/ZoRe65VOMc=;
 b=qCHorE4dGWmbLROZhMVh43l/HNMb3zuQqAP4plTw+hHZBwvEsHcVU/7TwbV0o0evi8gpI022Xl+kjPgE2Awwk4LCkm9uoQowko7X675vLaBpckF3HUYcp+PfPTC8cy85Q+rnFys5EqzH4DabnhRttFJSv92nw/xQIMe+oa1NiPqpVa9P62nSk938zcFjpPZI4fuKNrEkQAOvI4GuA2HvdpaWyrH0X+HRAYLJGgTKZrDJQcBE6r4niDsEiOX9ybTjerOdmVb0zqRFYLQ04QyH4lToS8gB6qnVIflbJnZKUcMpFf1qCpP72amN7o8K6FnBjPjXZViy8aYJlTCJccVjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eETfzP/dRZiCNTOQPdvPEJiPN44AbnM/ZoRe65VOMc=;
 b=sNDBnJGZ+++Uso+mXAjosOz/JorZgmShgs2s9wZOJgrHyl6kAr3ShKxIDvROpvDi//X/G+NunqVd3OMz7iJSULuMYwIHByt3tTx6nBoWO2X1jvM6j37XLn9bXaPBkd+vcJlQQulF6W6tyum/EcC3cCEvTxhDPqVZ/N3stapUbDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 07:49:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:49:51 +0000
Message-ID: <090ae980-a944-4c00-a26e-d95434414417@amd.com>
Date: Wed, 4 Sep 2024 09:49:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0b74cd-3793-470c-0540-08dcccb6287b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGdJQUY5V2FHNVV6Rzg0eHBBWHdIM0UvSVlGM3JBRmh0dEpoQ041Vy9POG50?=
 =?utf-8?B?VnhnNEd4bDFMejh4YVRWL3FPYlB3OWl0RWF3cDU5bTBWSG5XQVV4WjYySi8x?=
 =?utf-8?B?MHZOOHRhdkhZRm1ETmc3akJhK292QzhPdER5bHdMZWVtZ0FVNlVqd053VWkw?=
 =?utf-8?B?dTg4RTU0OVlaMDFIcHFrMGlvdXpWVkFzMVkxajdUWEFMU09PQXltZlpNemZ2?=
 =?utf-8?B?ODN5T2VGdzJ2R0ZYUktIUzY1TDlqVmt2ZjJOSU1mL011UmtnTWpURG9raGRU?=
 =?utf-8?B?M052VDhTR0llTThCRUJQRUtZWHJrN2hvenI2OThabEMwYStJKzY5bGdIU3NT?=
 =?utf-8?B?bGtsVVlOSzRHQTcvbmhrSy9kTFZIMHNiVWFMcXFSSXhJaDhIR1lpbnFhNHBk?=
 =?utf-8?B?Rnp0RUhCMTRYZmRmMWdvemw5WUF3dS9qV1RvNk9odWhmQm1hVWl3akVKL1E2?=
 =?utf-8?B?NVp6TitHNjZmeGhlVkZxa3kyNWJ6TCtTRDFJTU4wOS93dUVwNzRoR1R1bjRB?=
 =?utf-8?B?Y05mWHhGRGFFUXVCajBXSzVIdFhXMVlGS1B3dStacS9FbnRKU0N0blc4YkNF?=
 =?utf-8?B?dXRSWWNrdE0ycjh5Tm1pNm9xbmxybWxKTG1MRVpzN0xhY3F4Rm9lUCttVjF4?=
 =?utf-8?B?TXF0Wks1eXFJTXhKUk1vZXhXNTRKdXVJY2ZCekVZaEc4ek1IRjZPUmdRS2J2?=
 =?utf-8?B?S0E0SjhHTFVkR09jVHVFS1p5MHRGUHdrTWlDL3R4cnZ3cEwzYWNaM2drTURz?=
 =?utf-8?B?VkZZSUdROGFTMEhreHN3N1l5ZVJZNnVLT2J4RHRTYzdGa2FmRytRd2lCbVNL?=
 =?utf-8?B?ZmlkVDdtWnZXemNkbXlVbzJhVWozUFlpcDJadzk5bUV1cG5RM2pCRGVHYlJp?=
 =?utf-8?B?NE56d1ZjTVoreW9PWHJHc0E2VE5oSytJSktzU1NhMThidll3YUVnc2tLRmxm?=
 =?utf-8?B?cGNSbWJ0NWdiTDc2a0xTcU5SbTVQUllvb1pBSGE1TlNRWHJnbTRqa0hjNytS?=
 =?utf-8?B?UFVFb2dFRGdWdjVHMnBORnFucERrdU1yejkyQWpOYlUrZjNMdEJmT1V1Z3ZL?=
 =?utf-8?B?cEsvUU1zdkhZb3h0aFFaTG9YR0tTdzZQeXlpMmdaOWN0NlhYS1RuQzZhZklR?=
 =?utf-8?B?VVdSK3NYLzZaSWJFUmRudHlMRjJmMGxMTlQwKzlGMFhLbFFLVDV2bTlPb2ZX?=
 =?utf-8?B?dXVYV0V3TmgyREppR0ZJRkg4SHl5NVFmZjJGK3ZzOWJQMjErK3ZtZWQxTDVw?=
 =?utf-8?B?bDN1S1lYcEFnV3VEcmtMWmxxWEJuV3d1WHJKTjQ5Q29Jd0R6Mlhwblc4WWcz?=
 =?utf-8?B?U0p6eDU2bERhZm5qeUhSRDVUd3F4MW03aVlKOGg2M0JtUTZKM0M1ekMxdndT?=
 =?utf-8?B?aEFwWnZURDFlOE8vcmdXSHlvZnRQbnA1VHdPZ01ocmhmMUhZNDJEZ1FhbXAy?=
 =?utf-8?B?NTVEQmNCcCtmL1RsMyt5MVl2Z054ZDFaT0ErZk9oNkZZcDZWTFJ5WmRlOWlx?=
 =?utf-8?B?Yk9qUWFwQXpLYzRzb0lUZXRSaHlGUXlhS3Y1Tk04SmxOZGJ3V003eW1tSGFz?=
 =?utf-8?B?eVNDbWloVmt5M2Q3S3B4TFRlSWdlbkFtdXlwM0doSXNMdnc4ZldydGx5S0ZQ?=
 =?utf-8?B?ZW1ZaEYrR3ZVQjBPanRINGNsa2NoNEdMTmlTZlFIeTRmNE1ZbEtOYlloUEdx?=
 =?utf-8?B?Y1VmVzFpUndIVXp0MzlrQitveVlVNzF6VThtbVlDQnVNZ2VDNVNEWU5RRDU4?=
 =?utf-8?B?cTc1V0tmNTF0eXVqVGtwRmR1SFFqMlBwZzN4YWo3cG5LWXB2QVBNMlJMSndW?=
 =?utf-8?Q?NlvA0GvklFPEED7zVDraU1wqubT/e+nI/megw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VhQWcyMklwaGlmNHNWZXNMMlhSNGxDQUZuTGduSkpiQnBib1QzNlFFejdS?=
 =?utf-8?B?QTFnT1AzNVgrRTVZNFVRNllud0JSSGl6QVVxS0RENmU4KzR3S0ovU3N0K0ZC?=
 =?utf-8?B?Qm5Kb3NjSVlGcjFRSGRMYnJXVjNlc2xhU2dwbk80YVp3eUdQR1lUd3lLZ3V2?=
 =?utf-8?B?c1ZGdkxRMS96S20vWS9lUnBpcUFtS2JrVjhSclFiNFBrY1UwTlVjZHpmeFF3?=
 =?utf-8?B?empkSlhJdm9mMnd4eVNQSUc2RlpyT1BucmVXQmF0SXM3SkgrM3hKSmMyRlBJ?=
 =?utf-8?B?b1ZBZjg1QjFwUHdIVVRBa0xvUGFaUEQwNTRkZFBQbEpPemJJSzZ2dlVjRExn?=
 =?utf-8?B?WktybGl1SEgrb0hUNXRZL1p4aXZiV1RXSVoydkxOREdXYTV3Z0pGVDV4RVd1?=
 =?utf-8?B?QTV3Qjd4S1MrVzNhOXp3Rm1ENjRmS2p4SUlPeHNRV1dmeFNDYVNCVlBkWnZZ?=
 =?utf-8?B?eHdJVXg1M1UybkRjUkhwOHFjQ0toRFhqbjdnRkUzWU1WYlpIU0tPRGZ1MURW?=
 =?utf-8?B?WjdGRTYrZ3NqcldFd2FKVk53Tk9GMlRyb0ZuYjdyd3lYYWhjTTVReldWcGNj?=
 =?utf-8?B?eFhMeEFQNGR6UXlGbEFuOHlxeEg3UzRHTmpvOFJMMnNoNys5ZHpzVWl1TEFr?=
 =?utf-8?B?MGZPcHFMb0p1bjlkd0FKVU5SNFNTeGNMc3k1b1NwMlgvUFk0Wkh0cU5IZktu?=
 =?utf-8?B?N2pDTGtSTDBPNk9rdUMwWXpyTXhkeklLdXBoNjYvWmdwczNlcW4zQjdQWDdW?=
 =?utf-8?B?elIyZnBBdVIxYXdQOVkrMDMrdDJnY3pxSUwxejhYclBCNVNUK1RJbGZNaFVt?=
 =?utf-8?B?UHpraDNRNThucmNPVm5XLzEvQnppWWMxRU1DbHAwbDVvei9XK1JDL3FKT2Na?=
 =?utf-8?B?elo0a3hkSkl1bGZiN0h1RThyYU5KTzhTNjYrdmFUcmthUTRXUTZ5SnNJUXFy?=
 =?utf-8?B?ZVptRThjdjY0SnZqcm1vbnh3QUR1L1pxb0JlRVBsOG9aamV2V2t2NHBRUTZU?=
 =?utf-8?B?NzN6NFpVTGFGVmRFRjVkZ2FDZ0F4OHdFaWRtb3hyODV0MTdDRjhReVdxaEk3?=
 =?utf-8?B?VDFFcmwxS08yVzVRK1NQT2tXUVFvL240VloxZHJvUG9KUFloTXVlNFdOakV6?=
 =?utf-8?B?U2ovSGEyM2lMY1Vvazd1Q0dod3FUanBVMC9WcThsQUpkcUVmSDFhVXYwZGx3?=
 =?utf-8?B?K2RMbStSNGVZS3IvcUJGRHd0eG02RkZ1VzFYYVBRMFpxQnlhQ2ptNkZTcjN0?=
 =?utf-8?B?c1FtM2NEWHk0L2p4ZFFhUVcwZXdZZkE3TnRiVkJScWVIY2Noem1MZmtBQ2tY?=
 =?utf-8?B?L0lUUnpPR2ZmOFp5MU9XRzBzYXBKWU1JZ05obG5MbkdaQVJZZ2xuQnRibTE5?=
 =?utf-8?B?bWxLVEtvTDhITVB2aVo3RlVVOHBRazJySmtMcEltU01JdjRvMVExMjlITGNV?=
 =?utf-8?B?MUtRRld0eXliVkh1RW12UVNXSGtjWlhNSFpvWm53VHMxQmROOFhhQlZ6a1RR?=
 =?utf-8?B?aXJRMUNtcjhXSlhHYXliYmRWM1ZOUG83WUZyOHo5cVF1QURyNVVvUTVMWGR3?=
 =?utf-8?B?WHRxYm9BQ2phWFpSTkp3V1dmbUNWS1V4MVlmUG44bHMwUHlKQXk1QjAyc0ww?=
 =?utf-8?B?aFBpQ1dKbDNUN2hhb2FBR0dIUXUyeDNWckVFQ2g2a0RVN0s0VE1wY2l3VEtI?=
 =?utf-8?B?Yk8vWHpPeFlxQm54a24rYnIrcjhydDZwWXpJdTRwdnZPWWQwNm9obW8xYTBr?=
 =?utf-8?B?SmVHL0UxN1V2Tm9lYzVQMDhVb1llZk14VjBQbXJmNDR6dGNvcnlFbGpUSWN6?=
 =?utf-8?B?bk4xTFA4YXZJUjE4LzRSN0RaczVGMVFEQkpOa2pDcW1LNGZLVDArQTRWL1d3?=
 =?utf-8?B?ZSs1TThua0lDc0N5eGdRTWdHcjdKdVVMRFZRZTc4ZzJwZVJOZTIxeHV4cDU2?=
 =?utf-8?B?bHYyejNzdDgyNDd3RURvcWVIdWxuRFFoWm9sUXVKaXFOU25xWW5RcjBSSllK?=
 =?utf-8?B?TWd1UFpQZzU1MDhEOERNQjNlVE4rcHVTTXlDNkZueDdhL2l3ZElwdGEvYVRh?=
 =?utf-8?B?V2RPR05Yb3I2ejZvOG8wbnU5RlVUcGk3U080L3p4TWJ0R3lvZGl6NVVNaE5D?=
 =?utf-8?Q?Jg9hnLVPgZ4WRm4/bV1sgve/H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0b74cd-3793-470c-0540-08dcccb6287b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 07:49:51.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRNugvx7/rCtp8bKXc3KA2bUEfUJHIRzrZ2mRhy6DatMuIsrWZJlhw8lOL9OAvD/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798
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

Am 03.09.24 um 23:11 schrieb Simona Vetter:
> On Tue, Sep 03, 2024 at 03:46:43PM +0200, Christian König wrote:
>> Hi Steven,
>>
>> Am 29.08.24 um 15:37 schrieb Steven Price:
>>> Hi Christian,
>>>
>>> Mihail should be able to give more definitive answers, but I think I can
>>> answer your questions.
>>>
>>> On 29/08/2024 10:40, Christian König wrote:
>>>> Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
>>>>> Hello all,
>>>>>
>>>>> This series implements a mechanism to expose Mali CSF GPUs' queue
>>>>> ringbuffers directly to userspace, along with paraphernalia to allow
>>>>> userspace to control job synchronisation between the CPU and GPU.
>>>>>
>>>>> The goal of these changes is to allow userspace to control work
>>>>> submission to the FW/HW directly without kernel intervention in the
>>>>> common case, thereby reducing context switching overhead. It also allows
>>>>> for greater flexibility in the way work is enqueued in the ringbufs.
>>>>> For example, the current kernel submit path only supports indirect
>>>>> calls, which is inefficient for small command buffers. Userspace can
>>>>> also skip unnecessary sync operations.
>>>> Question is how do you guarantee forward progress for fence signaling?
>>> A timeout. Although looking at it I think it's probably set too high
>>> currently:
>>>
>>>> +#define JOB_TIMEOUT_MS				5000
>>> But basically the XGS queue is a DRM scheduler just like a normal GPU
>>> queue and the jobs have a timeout. If the timeout is hit then any fences
>>> will be signalled (with an error).
>> Mhm, that is unfortunately exactly what I feared.
>>
>>>> E.g. when are fences created and published? How do they signal?
>>>>
>>>> How are dependencies handled? How can the kernel suspend an userspace
>>>> queue?
>>> The actual userspace queue can be suspended. This is actually a
>>> combination of firmware and kernel driver, and this functionality is
>>> already present without the user submission. The firmware will multiplex
>>> multiple 'groups' onto the hardware, and if there are too many for the
>>> firmware then the kernel multiplexes the extra groups onto the ones the
>>> firmware supports.
>> How do you guarantee forward progress and that resuming of suspended queues
>> doesn't end up in a circle dependency?
>>
>>> I haven't studied Mihail's series in detail yet, but if I understand
>>> correctly, the XGS queues are handled separately and are not suspended
>>> when the hardware queues are suspended. I guess this might be an area
>>> for improvement and might explain the currently very high timeout (to
>>> deal with the case where the actual GPU work has been suspended).
>>>
>>>> How does memory management work in this case?
>>> I'm not entirely sure what you mean here. If you are referring to the
>>> potential memory issues with signalling path then this should be handled
>>> by the timeout - although I haven't studied the code to check for bugs here.
>> You might have misunderstood my question (and I might misunderstand the
>> code), but on first glance it strongly sounds like the current approach will
>> be NAKed.
>>
>>> The actual new XGS queues don't allocate/free memory during the queue
>>> execution - so it's just the memory usage related to fences (and the
>>> other work which could be blocked on the fence).
>> But the kernel and the hardware could suspend the queues, right?
>>
>>> In terms of memory management for the GPU work itself, this is handled
>>> the same as before. The VM_BIND mechanism allows dependencies to be
>>> created between syncobjs and VM operations, with XGS these can then be
>>> tied to GPU HW events.
>> I don't know the details, but that again strongly sounds like that won't
>> work.
>>
>> What you need is to somehow guarantee that work doesn't run into memory
>> management deadlocks which are resolved by timeouts.
>>
>> Please read up here on why that stuff isn't allowed: https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> panthor doesn't yet have a shrinker, so all memory is pinned, which means
> memory management easy mode.

Ok, that at least makes things work for the moment.

> But also this means there might be an uapi design bug in here, and we
> really don't want to commit to that. My stance is that panthor should gain
> a proper shrinker first, which means there will be some changes here too.
> And then we can properly evaluate this. As-is it's a bit too much on the
> toy end of things.

I wouldn't say toy end, it looks rather fleshed out to me.

But I agree that the people who design the UAPI needs to be aware of the 
restrictions.

>
> That aside, I've thought this all through with tons of people, and I do
> think it's all possible.

It's certainly possible, we have user queue patches for amdgpu in the 
pipeline as well.

It's just really really really hard to get right without creating some 
circle dependencies and deadlocks in between.

If I would get free beer every time somebody came up with a broken 
dma_fence design I would probably end up as alcoholic without spending a 
single penny.

Christian.

> -Sima
>
>> Regards,
>> Christian.
>>
>>>
>>> Fundamentally (modulo bugs) there is little change compared to kernel
>>> submission - it's already fairly trivial to write GPU job which will
>>> make no forward progress (a 'while (1)' equivalent job). The only
>>> difference here is that XGS makes this 'easy' and doesn't involve the
>>> GPU spinning. Either way we rely on a timeout to recover from these
>>> situations.
>>>
>>> Thanks,
>>> Steve
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> This is still a work-in-progress, there's an outstanding issue with
>>>>> multiple processes using different submission flows triggering
>>>>> scheduling bugs (e.g. the same group getting scheduled twice), but we'd
>>>>> love to gather some feedback on the suitability of the approach in
>>>>> general and see if there's a clear path to merging something like this
>>>>> eventually.
>>>>>
>>>>> I've also CCd AMD maintainers because they have in the past done
>>>>> something similar[1], in case they want to chime in.
>>>>>
>>>>> There are two uses of this new uAPI in Mesa, one in gallium/panfrost
>>>>> (link TBD), and one in panvk [2].
>>>>>
>>>>> The Gallium implementation is a naïve change just to switch the
>>>>> submission model and exercise the new kernel code, and we don't plan
>>>>> on pursuing this at this time.
>>>>>
>>>>> The panvk driver changes are, however, a better representation of the
>>>>> intent behind this new uAPI, so please consider that as the reference
>>>>> userspace. It is still very much also a work in progress.
>>>>>
>>>>>     * patch 1 adds all the uAPI changes;
>>>>>     * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
>>>>>       the required objects to userspace;
>>>>>     * patch 3 maps the doorbell pages, similarly to how the user I/O
>>>>> page is
>>>>>       mapped;
>>>>>     * patch 4 implements GROUP_KICK, which lets userspace request an
>>>>>       inactive group to be scheduled on the GPU;
>>>>>     * patches 5 & 6 implement XGS queues, a way for userspace to
>>>>>       synchronise GPU queue progress with DRM syncobjs;
>>>>>     * patches 7 & 8 add notification mechanisms for user & kernel to signal
>>>>>       changes to native GPU syncobjs.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
>>>>> [2]
>>>>> https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
>>>>>
>>>>> Ketil Johnsen (7):
>>>>>      drm/panthor: Add uAPI to submit from user space
>>>>>      drm/panthor: Extend GROUP_CREATE for user submission
>>>>>      drm/panthor: Map doorbell pages
>>>>>      drm/panthor: Add GROUP_KICK ioctl
>>>>>      drm/panthor: Factor out syncobj handling
>>>>>      drm/panthor: Implement XGS queues
>>>>>      drm/panthor: Add SYNC_UPDATE ioctl
>>>>>
>>>>> Mihail Atanassov (1):
>>>>>      drm/panthor: Add sync_update eventfd handling
>>>>>
>>>>>     drivers/gpu/drm/panthor/Makefile          |   4 +-
>>>>>     drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
>>>>>     drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
>>>>>     drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
>>>>>     drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
>>>>>     drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
>>>>>     drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
>>>>>     drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
>>>>>     drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
>>>>>     drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
>>>>>     drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
>>>>>     include/uapi/drm/panthor_drm.h            | 243 +++++++-
>>>>>     12 files changed, 1696 insertions(+), 177 deletions(-)
>>>>>     create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
>>>>>     create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
>>>>>     create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
>>>>>     create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
>>>>>

