Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9349D5CFE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148B10EB42;
	Fri, 22 Nov 2024 10:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bstTRQ8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F8810EB3D;
 Fri, 22 Nov 2024 10:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3+Rchij1OzsNfD1HRZXvoKFytVlH46k+MTgEYiQ07F4+cTLSQzjqac7XTXDDzG6C5IIHWLM0pNIc5lboeN26hd1w3QnvgHFXckSmoGDklOX7AP5Epku9mCvYbWUDnYRKqG+ePhOsk6X8ExZr6Ez+ikCPZTBsmWhO+T/aPe3S3Rafst97Zlu+i6d1qXmdpBsPVtOgu86qG7GNNAS6ualzzvgpHAlmfsNF42anUeJWfIgYDjKf/a0i+1/grlGWkcbmjyosRZsEmrSat+05xAEp65lmXYpI0v3ahn0SeQlCSWoZWobGOUVw3nXI0ILZIKMCahZ2FwY4UrlAdjqa2YXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+HV5izDiTCPHjP2gT6rD7NmHReRrJhyEaaAiiXRyl0=;
 b=Hs+NsIlPWIZPHtkYVPRbwlG+iv4/eQYKfOhcO2eYTZswRGBbnTvIfapZaAiuK3qoV1w/y415e8c+qBKCkdkT8/fq6zePUVTGqJW9r831bHekBY6vO5d2wj64yGy8e4G55VLZCYF7uLJ6rwL9MkV91V6clBY1Qzr9BGQJWg+dvP19nXM7YOgHVTU4YOmgqL9xivncJbyH2L9/0Donns8IPzz0eKsOV7gsb2dRl9bHVDT28TCV6u4d9UqW5NSsDabP9xzhd16+Bc5WBLI6Bs38Xq4QNPA9SmVw/Cf8NPQM8ApGsTo9vTnS+8w5t9eDIFZdAh1yj9ObOl3NSljORdotQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+HV5izDiTCPHjP2gT6rD7NmHReRrJhyEaaAiiXRyl0=;
 b=bstTRQ8iruRAJ9YzT/jOKpjXoX/aM+dUlC27+iCgu70WPTaGPRAZ4fvmiuqnSrmmumrmxAcpEDGXdfX7ggBdzDh/u+TpVvCFEOt3zQnifc3qsUHUPaCHHhPVZyqOyUYHdeqUvd1g9nOFBL5xTfWQW7sGCE/+2UXk8rBSNz2b9ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 10:09:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Fri, 22 Nov 2024
 10:09:41 +0000
Message-ID: <3644d364-6021-46fe-b3a2-689821551984@amd.com>
Date: Fri, 22 Nov 2024 11:09:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-2-raag.jadav@intel.com>
 <8c7292c3-8459-4ddc-a899-b56b1d93076f@linux.intel.com>
 <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0Atv3Zw1d0N8hvv@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 73660363-59ee-4d3e-1d80-08dd0addc7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStidGExNGlsaldDcE8zRnd3N3hwVHZuajRldFFrNFM2dy9PcHJQdWFhR3Av?=
 =?utf-8?B?eEgwSmFROCsxNXBvM3dVd2N0SGxXblVPVCtSL2lQQkJzRUV0dC9pN09hemlH?=
 =?utf-8?B?Q2F3U3dOWUNoTlBNRXRxUkRCRzV3d1VOOWRiRkhXdHJnSmhGS0J0SE1kTGJs?=
 =?utf-8?B?by9zRldqSlAyZ1dMZHRzOGh1TTZaWnE2a3NYUDVRSEhpQ09pRVUxSVIyUVV4?=
 =?utf-8?B?MTB3OHF5dVB5OGUyUjBra2lTcmY1OXZwcnFBZUg1aUpyLzMyMnlnaEdmQVBi?=
 =?utf-8?B?ekMxN211U0Q0NGxKdDVYU1RpeTNpVHZxb1kxekE1Qm9oUHA1emQyTDF1SUJa?=
 =?utf-8?B?NkpkVDVsb0RxVC9iVm5qdzhZQ3o2RlY1a1ZqaXprek5WY0M4eS9STGoySlli?=
 =?utf-8?B?ZjZmUDRvTmF4ZHF0ZmdQSWpqOGVabTRPOStGbDVObDBGWStvbWpEVkRObEhH?=
 =?utf-8?B?OHBPM0xEU0pXcUJYdy9CRC93YytmK3dITDFldk4rNjZjNVhCNlVtUW9QOG5y?=
 =?utf-8?B?S0hhd0pNME5OSVd1Tk91SGZVZkFqZ1U4VklvMXNYYjA0UnhCNEdkdE9QdWxM?=
 =?utf-8?B?aUtrR1pJdkVyR2pPeVZRS2g2cGNSUDZWeVUvSU9VN1JIL2hYb083SlJHbUlt?=
 =?utf-8?B?cGhKYUdJU1d6dGZhdC83TkJrdis5V0xUdUdMTEpHUHpBRFpsTnVGenRDUXJW?=
 =?utf-8?B?ZVNyQVZ0blNTTm9KTGJTZVlOOG9maW9NYTBQWkNJMzNYdHpCSFBIR2F4Mlk2?=
 =?utf-8?B?ZVkzTU80bnYzZFBBSi9EZTFlZHdTNndML0VRWElRcFRzVE4wMVA5YWUxRlky?=
 =?utf-8?B?OTZFU2VOWVptRUJoVXI0c0hYbmJ3ZDlRVER5S01SektqNDFkOHVHOUxNN0xy?=
 =?utf-8?B?a050ZThseEpKelhEWlY4QXdMVzhzL2NkVDI0eHk4V2NZQVljaEVneUwrQ1RH?=
 =?utf-8?B?Y08vM1ZMRE13aURCODN3SDRyZmh2TnFkeUZ2MFRXbTUyQ3pnVm9Bb1hhbmVw?=
 =?utf-8?B?WFI1L2FDNkIrc1FhcnIzSm1YWjk3SlIvUEhuNWhQZFZWS3J5bnRMckp1VWtD?=
 =?utf-8?B?L3JJRjB4WnVoTWZGRXJiRy8waE9QdjdCVEFQUUcwelVZdmhhRDNVR0Jzcmd4?=
 =?utf-8?B?cm9BNGlRVHF4M0JPaVZqRENkL3d4RUVlemFacnI3VUdERFljVTNWNkxrV29Z?=
 =?utf-8?B?bWtEZnd1NmcrQ0c3aHhyNFY3UzZRcnA5RWhVYWY1clNvQmJOQjNSQzBuVXY5?=
 =?utf-8?B?L1BpeVNhcVlJVzZPaEtjL3JwMGErSGdTRE92ZGxVd3B5S29oVVZMSjFTdDdM?=
 =?utf-8?B?MSs1enYvNXFrM2VxZlM4SHdKSXBVUG92ZExxNE92ciszc3JHWG1CUjhwckYv?=
 =?utf-8?B?cXh4NlBIRWV1UG1ROWQ4UDkrWVFPamNMMW9xbkd0azYxazk3UVBtcG5JN2NX?=
 =?utf-8?B?SGlpWjJkbXI0Ti9nekw5WTNRaG1JSE4vWml3M3pCWkYwS05lcmVNZEJvb1Y4?=
 =?utf-8?B?RHFXODZDaHkwVlBPeUZib25HVi9XZEQ5VmNEdWdJaUxvU2JGcUxDVmZTMzJX?=
 =?utf-8?B?OG1CeXErbVlxSURIMjMxYlZxbEZndXpXNTU2OWx3ZTF3czJ4ZGZYeWpZS2tJ?=
 =?utf-8?B?M2l3d0QxRmtidkxYV2JBM2RRWG9vSnZ3QVAxVS9DTTdzbDRjU0MyeEc3RFgw?=
 =?utf-8?B?N21xZ2M1TUpWUjlQeERHWjhCMUluK2xERUlYR0M0aWtndWJvekR6bitFNk5P?=
 =?utf-8?B?cUk0YXdockNEVDRma1pqR0l6MVcyVnQwZDUzb2RjNFRHc1d6MGpDVEp5L00z?=
 =?utf-8?B?U2tHT05XUDJaczFCb0NRUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FQRXZHaFN0WUJ5UlRVV0FoTGc1dmtqeSt6K2Fwb3JwYnpsZ3NIZER5Zld1?=
 =?utf-8?B?bjdDbjJuWlJmRVdxR1hvaGtDcHYyNTFYSUdtZjdOTy9kTjJBTTJjUHNISHlF?=
 =?utf-8?B?VkZzOCtGVXFnUWxSY0lKaWowdGh0RUZiYXZUVlc2YW1jbkZPcTNNVnQwRXI1?=
 =?utf-8?B?Y3ZETmp2bWFjNVBEUTFYZkdqbWNlR1JPR2ZweEhEbVl0NXZObjNYOWJkT2hu?=
 =?utf-8?B?QXNTdmxlWHRwaThUL09WYktVZERnSWd3S2I4NWpkVmZOOFZ5cWJsQ1lxQWVZ?=
 =?utf-8?B?WVBVc1I1cmpEM0hKZEsrUFJKcWY2MW9VYmN4T1ZIVk5ZQ2Q1aGpkYlRLSzQx?=
 =?utf-8?B?T1hQYklvUzc2VEtRNG5FWEFFK3pLdUpoc0lqYnZDTXBpUG1VcjhRT3JKQWlC?=
 =?utf-8?B?TkNEZjFuc01BVGJNMWV3NFd5c1lNRW9ubGxrYmtBNm84d1JJOEFKbzd3QXd2?=
 =?utf-8?B?c1ZVaG9nUnI5K2VCWnpvZjlwS1F0c1VQTnkrWnN6Ync4dm5LZ0U4SVdsc2Rv?=
 =?utf-8?B?Tkc0R0hBV2M5U2RVeDhZU2tQa3VtdEYrQnY0a240QXJ6NGI0RUNySXJBSnpa?=
 =?utf-8?B?YXlOb2xydmZVUktHdzU2SllxRGg1NHNkZUVkU0ZUWUwyWXJFWE9COCticU5N?=
 =?utf-8?B?MVZQNGdTYVFGY2lqQnlOWFNzdzYrOTRjb1FnZVdUdmtId3JXRldnMENkYlIr?=
 =?utf-8?B?NUROZm15eUxBTUs1ZGJZdWxWSzN6NGFCTDVaaU94OTh0Ty9nNmJjaGdZMnhW?=
 =?utf-8?B?bmFDamh2blFoWFVCSFZ1Yzhpakh5TC8vUkRRa0NjVGV1MTdHSUVpWUdpQ1Fq?=
 =?utf-8?B?S1V5MFVWQ0pXWlVUaURKLytvaEpKV2dTU2l2Z21DUE1xRUlhcEltenhzSlBt?=
 =?utf-8?B?cUp4TmJoaTFGWERUOGpGdFprQXcxRUhpMzVlRDBsUXZobTl2ZWhWRHZuRUpF?=
 =?utf-8?B?NURQQkpZT0VIN0pPVDVtUFhIT0V2UWJXd3JrWjVQRjdwNTdSRExva21zR1dl?=
 =?utf-8?B?OVhXU2dQWFA5V2JhMlkxMHVSWm92Nk5PSnRBMHRmQTNuRUlJQkZxamZCeURi?=
 =?utf-8?B?YkNNMzBnYVpUN0JGZGtXWUhhUmgwRXF0WXNXckcxNFJFQVJPM0gxZkJCdlpF?=
 =?utf-8?B?UjQxd0lZR1dDR2dzUi85RWthYndYb1BjSjdKM3laSDRkZXRtc21pWUplRENV?=
 =?utf-8?B?RDdsN0kySGZRcjlTK1daSTZpY0Y3Nk8zTjhTOFNKMUgzVmx5cHEyMCtDeWM3?=
 =?utf-8?B?OE9SMkZicDIzdFJNaHcweXBWZmJwNWJqUkZqeldiQ1FoQWh3enpxMExndGor?=
 =?utf-8?B?ZEtwL05BTlVlSUs0cTM1K2pPVFBDalpjeFFxa1dBckhPd1Z5V09TTURvRE0x?=
 =?utf-8?B?S1BiMUVHdytMckNDWHFsZHJpVWNSUFVjeWJIQVZPc0MyczMxbEhteVcyemJm?=
 =?utf-8?B?K3JBb1VMODNLbXJSNU01YllrWkRDSENJM1laUWhHRGg0UlB0ZTg4RUkzWTdi?=
 =?utf-8?B?OXhoWGd0TjZ3UFdacXBxR2s4VHJKU1czeWE0M0hMUHROS080c1RTMDVSekI0?=
 =?utf-8?B?VzZFN1ZWNWhJNTlIdm45VzRqc1haUCtPakg3UnBQejlXYVVFZ0pRS1FIc0N0?=
 =?utf-8?B?RzNiSUtpRVRzbURFbUdJYkZiVU8rSjUyWlBubU45TXFWbHJwU3JNbFFZYkda?=
 =?utf-8?B?Z0xvVWt4Ri9hZmo3WXVCS0pXMDdPV0NiNjBuQkxscjBDTDcrbDlIZXE2T3pt?=
 =?utf-8?B?L3d1YUZLeitFc2pHZUpTdkg2ZTFVY0ZHdlAzaWgrWHg2ZEpjS3ZaYUlURjJp?=
 =?utf-8?B?eXNXSzJpL0JMNm1FcUxCVkNhdE05Q01QUnE5eGZUUEpvL1Bwb1JEdmlaMXpr?=
 =?utf-8?B?cUs0QlB2M0c1M1B1Vy9aUVBJMGtqUXdjMmNsNE92OGZ3NzhEcElsQjJxejVn?=
 =?utf-8?B?anIxMElhK0lTZWFsLzJMNkZMWGwrcndESTdiYzRtR1V4bnBuYWM4WHNmNDZS?=
 =?utf-8?B?eFBlVG5Wb1djYWMxbnQvaEpxOW1iVWhRRnhCUHhML3FZK0pnSTVOMW9ESHli?=
 =?utf-8?B?SCtEMzVydmZVSis1SC81ZTl4V0QrZUFUeVNwOUp4QVBwYlVsY3B3alN3MXU3?=
 =?utf-8?Q?ViF0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73660363-59ee-4d3e-1d80-08dd0addc7ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:09:41.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVKkwreERBAFroJkoIwYhtEs2exi7ae0qtQJgOqRsAmRD9KPJVRHbNZRsPxijJ1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
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

Am 22.11.24 um 08:07 schrieb Raag Jadav:
> On Mon, Nov 18, 2024 at 08:26:37PM +0530, Aravind Iddamsetty wrote:
>> On 15/11/24 10:37, Raag Jadav wrote:
>>> Introduce device wedged event, which notifies userspace of 'wedged'
>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>> useful especially in cases where the device is no longer operating as
>>> expected and has become unrecoverable from driver context. Purpose of
>>> this implementation is to provide drivers a generic way to recover with
>>> the help of userspace intervention without taking any drastic measures
>>> in the driver.
>>>
>>> A 'wedged' device is basically a dead device that needs attention. The
>>> uevent is the notification that is sent to userspace along with a hint
>>> about what could possibly be attempted to recover the device and bring
>>> it back to usable state. Different drivers may have different ideas of
>>> a 'wedged' device depending on their hardware implementation, and hence
>>> the vendor agnostic nature of the event. It is up to the drivers to
>>> decide when they see the need for recovery and how they want to recover
>>> from the available methods.
>>>
>>> Prerequisites
>>> -------------
>>>
>>> The driver, before opting for recovery, needs to make sure that the
>>> 'wedged' device doesn't harm the system as a whole by taking care of the
>>> prerequisites. Necessary actions must include disabling DMA to system
>>> memory as well as any communication channels with other devices. Further,
>>> the driver must ensure that all dma_fences are signalled and any device
>>> state that the core kernel might depend on are cleaned up. Once the event
>>> is sent, the device must be kept in 'wedged' state until the recovery is
>>> performed. New accesses to the device (IOCTLs) should be blocked,
>>> preferably with an error code that resembles the type of failure the
>>> device has encountered. This will signify the reason for wegeding which
>>> can be reported to the application if needed.
>> should we even drop the mmaps we created?
> Whatever is required for a clean recovery, yes.
>
> Although how would this play out? Do we risk loosing display?
> Or any other possible side-effects?

Before sending a wedge event all DMA transfers of the device have to be 
blocked.

So yes, all display, mmap() and file descriptor connections you had with 
the device would need to be re-created.

Regards,
Christian.

>
> Raag

