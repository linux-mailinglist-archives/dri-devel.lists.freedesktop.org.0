Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A89B39F1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 20:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345010E521;
	Mon, 28 Oct 2024 19:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="deWSFmns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0318D10E520;
 Mon, 28 Oct 2024 19:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kzus8Pb+F5ZFXx9sHHrer27L0ptwljA6onLgYCSchQkzXlTyUD48hhSp1PheVtPhJypOaSAVOEY6uR+06RYqCiRhkaIA+8asUfV8MyAg66//fkWHlxjbDJRWVhzrV5uGsuntbrhr61fZk1koVo74J6QaD4bGhqhgJ/6XUUkM4WduOzm1tOln1clN6d37jLUOIA+7S4QkvBjesgqRXf0al3hD4zjql6YM40nDazpjTNhKJajMUngZEmMCtTpQjh0bAA2+YxLB2CXqhcJXRTxkm1vCNgTYd1xvwhpAxqReawdR93jfyuAucS6CLnuOss/KsbFc+sXYML5zxZ/ZzqcXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQeFC2LMXzVk5dmTHM+ZFXEv7/ykwzXSbGdCdKDMwX0=;
 b=h5R+S98isu5riOTmSIps0wJ3inrj+VGTiBiLC9Y2cP5Bh+XKPyFuLdCI/dBZ5lq1spdncc0Vej11sMxQbELU8G5LBw3o/nlz0iC7eo28gqsfXSpoCTXpfQQQ+fVz2KvbQ4fDYFEH8cSYo9/7GOyd/dsp91HyO8K/y2KoB4a7nD+T3cF7lof7WX6FDJRlPExuldYdUYSXE5Om5JJVi75HXUUjhM+gPwntkoKMpV9/3EupOGrNEPuEMCShE8+p3WVuPHq4iOhzMQGP2cdNmKPXVieIFG/JPsz02Lr/hg6qpF+fQOnOaE5smqZSpY43lTGO6PFPQWsdtZSxj2OLzXEWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQeFC2LMXzVk5dmTHM+ZFXEv7/ykwzXSbGdCdKDMwX0=;
 b=deWSFmnss6OIzurtxUJjjAqXrTQ2bgEDIBkCn8097THqSVcsXya8RKhPkqDdwVm1G6Nev8s//MU5XGk44JF9wPIt5KZtMhLq5E1neUTAiDHwNi+18gX3u0V+MRpUM5FoT0I7WhUYA+bPi0fHDw8qoZ4eZuVW9D64mm9Kyqf3AD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Mon, 28 Oct
 2024 19:04:59 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 19:04:59 +0000
Message-ID: <fc596eeb-0d46-4f9e-93a3-d4ef87e736c5@amd.com>
Date: Mon, 28 Oct 2024 15:04:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] SWDEV476969 - dm: Fail dm_atomic_check if cursor
 overlay is required at MAX_SURFACES
To: Melissa Wen <mwen@igalia.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com
References: <20241025193727.765195-1-zaeem.mohamed@amd.com>
 <20241025193727.765195-2-zaeem.mohamed@amd.com>
 <575d66c7-e77d-42ea-acbf-412d6e508a0b@igalia.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <575d66c7-e77d-42ea-acbf-412d6e508a0b@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::30) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 057bbd88-03ec-4c35-0648-08dcf7836b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWtIeTVsZmtLdmlVVTgzY3BZNUMrNk9TeGpvV2RzMG51VWF4anIxeUJ1RXVK?=
 =?utf-8?B?dHQvdnRycS9NQ3VkRE9vcDA2dkMzNFMyazZFYzB3Z0VGcU4wVDlkRXp5cXpB?=
 =?utf-8?B?NDJtOWMzM0hZcWR4RXZRY0h4NEs5OXZvejdkb0ZwdUh3Njdsd0lWOENzZ0RO?=
 =?utf-8?B?OFFIV1lwbThaMkNoR1BuSkhVeWU5RnhDQ1FPNHl3N3NrMGtWZFpmMU9PMkdN?=
 =?utf-8?B?UWdxc0IwVjhiRzFGSnF1MVM1ZnZRMmZURGRaalFuMkZFdWwrd3h5aGhxQTQ3?=
 =?utf-8?B?TmxXeHgzdzlIQUVId1FQbnBQY2JkYWNpeUFMUFJXcXo4RjJaeUJGTEpNQ1BY?=
 =?utf-8?B?aHV0angrZ2JDbVh4ZEVSeDRFV0h1VWZac2VXZ1VVK3piTmNtaDc5SU1PSnFk?=
 =?utf-8?B?Z0FBSTZaaG1HT2VQRkU1b1hZaS9SVDFCTDJ4RTNlWDloZTBRUlZVd2YrMW5v?=
 =?utf-8?B?cFlXZktLUDJ4ZU80WXVlR05oc1R4a0NBWlBUSXM2TUttSG5ERXdxQVVvTlBm?=
 =?utf-8?B?S1JSZGZKMDJEL1c1UTJ1UTQwdHI3eXRJZ3daamdoN3hrcEd1THZoZU80QTlM?=
 =?utf-8?B?SHIyR0s3OG5qV2F4K3I2WkpkU0xldTlqS1JwZjN6ZTF1bGQwNGtmd1RNL1hs?=
 =?utf-8?B?NjJZQnV2REJGSEMxbEdEUjd6cjhDQ2dYU2JvNFRUTjdlSHNGUzRrOWZUK2hU?=
 =?utf-8?B?b1ptTkIwekhPbEtNaHAyMDd3UlFuYTEvbzNScHBPOXZXaHBnVmhrNjFqWkFY?=
 =?utf-8?B?QVVxdlB6dk93ZE9KMGNZR1pPSXBaUHl4Mkx2eGhpWXBoSW5pRjJTWTl4Mkp5?=
 =?utf-8?B?d1RCZ1c3SlF1RUQ2U1VFYXYvcldxWUZPVkpveTNmV0RHeVVaQkJndGREczlv?=
 =?utf-8?B?a0FtTXRFVkFLT09aeTJrSXRFZ2FyUlRtaTVEd0hxOXBsVkErNmZjQUtkd2Nh?=
 =?utf-8?B?WXdQWGZ5cHgwNE5TZDk1RzEvci9ZRzAvN0NUNTIwQjdwRWhscysxd1ZHM2F1?=
 =?utf-8?B?QllFYkpTYmRkdk0wbm5scWVBL01WcTlTeVdOSFRCRUpPUVdRRmZpRmhvRjJY?=
 =?utf-8?B?NWNYeUxORGhoYU92UXBWbytXQWpEUmdLQnBqaWhicVZkZmVVUllXNG85MUIv?=
 =?utf-8?B?NzdGOWNXaGVBMFo1ZWJSc09uSXkvWFZBWFdoQmxDN1B0VVozUkloVDJLQk9w?=
 =?utf-8?B?cGloYWRtK3lCOEhiczdhM0szdTh3Uk80dlV0bStaRGZWeDhjN2QvSG9NeXhD?=
 =?utf-8?B?cnNqYVB2Q0Qwdi9GdlZvWXNIazNYc0xWMktqNCtFbUNMY1FJckFqTkZQVE0r?=
 =?utf-8?B?SmVlZVNrd3YrRk9uQlB0RkcvRXd0NkJiVkxSL2lqUFdOall1Z3czYlkxeW1w?=
 =?utf-8?B?cWVqTUtJcE9yQ0FhOVU4YUdwenBaSEZZRUdVNjQ2OWNlYlNTMVphaUhoenJT?=
 =?utf-8?B?NmlRaWd4QXBTcWF2Y0owSEk3MkdKU2c4c096eHJxL25YRGRpbnhJc29FSU04?=
 =?utf-8?B?MHJuRU1NQ0dtd0xKV0RWajVyQ0VzdEdrRkNUeHljdW1UdERjdW1hVHRTb1ZG?=
 =?utf-8?B?OHFkQjBtelF2YkErbC9Hc3ZHUTF4VEVTT2ZwaUM2aHJZTWMydXNaV3NXbWdu?=
 =?utf-8?B?ajNqRXV3NGdjTGxFaHM0TVdSRllPK1BETnZIdStqQUY2ak93dGFPUjBWTFhi?=
 =?utf-8?B?elpNajYzVVZEa2dWOTVvZDhVNzhsK1NPU1ZQa1JCdFBLVFl5TmpHNGJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JXVmFzREs2YVI2dnhaZU82VkRCY2IzcTNZdEcxSmNFRG5sWitjSlJER2NQ?=
 =?utf-8?B?SUV3L21WL1RwcDZmUmVWcnIyQ1YzTm5BM3ZHdU9aenlleWtSaEZPT3ozQWpM?=
 =?utf-8?B?ejkxU24xRFovQ1FOZG9MS0VrK2ZpaFJDRkZtUkV2WkxFVnUwZHlZcHdmWExM?=
 =?utf-8?B?V05PVTBLSElHQTc0U2tTWnBQeGs0bC9QTE9RTjJFK3cwTDRCR0VOZkZNWFdN?=
 =?utf-8?B?b2V0dk5kNUhhSkMydmVrMXFTb0Q5NUNXQ2taVUxwTlM4S1RUK1Jna3NMQTRz?=
 =?utf-8?B?Rm5BY1VkVlFiVmNPeTg0MTJFcjJ4WkhYWDVUZXRtR3NsMi9pbWdQMm8zOEF0?=
 =?utf-8?B?TDNBS1ZMYWxHQ1BJaGRJSjNUMWFWandMc1FEVnpXVDhnNCtMSEZHNXhBYVox?=
 =?utf-8?B?YTAvZU81NFBBTjdGaUdpbW1zUFNHdTdZZUtOM2hTT3MrZjZ6UUpuTXo3Qk82?=
 =?utf-8?B?dUtKOW9raGJIRjVLOG5aV3QwdVVnb0FYak42WW92U1BDY1dFMjlwVzQ2N0dC?=
 =?utf-8?B?eGpRcnlVeHhMMTJrcUNjejJpRWNwa3c4bk1lcHBRa0FnQTZGN0JvVXhPMjF0?=
 =?utf-8?B?clNLTW1TZFBwbTVNOWE4SGdXQ0F5eENzdHlEZGp1THhlZ0U1dUowR2wzYlAr?=
 =?utf-8?B?MTYxVjc3dDVsbWR6bFBYb0llaXlHalRWRExGZHFsM1cvR2g0S3BIdjJGL1pD?=
 =?utf-8?B?NzZveUN5WElwbkdaV05FTk90TnFxOEhUQWhGb1VrM3kwcmozUFA1aW54UWlh?=
 =?utf-8?B?MDl2UXZPRXhPL0haeFZFbkZuNzY0VzhvQ3k2dHNGUitHajZUem5UQmF6S1Z2?=
 =?utf-8?B?bkl3WXlUbXRTVnBUYlBGVm5HOTcyamhGb3pSV25QL2xub0tsUk5PM3RFMmZu?=
 =?utf-8?B?OTYrWXhVYy9Wek4zaXFrV0ZpcnB5UGl4Z1gwL3R0bmpaQnpDOEFmVGluWmNI?=
 =?utf-8?B?MXliMER4R242ZnVBaFc0eUVGSjdjTkdZdU1FRjNoeEdoWFNDZkRZZmhEci9u?=
 =?utf-8?B?cXowTTB6aEtjMW5rWEhXV2JwWlZZQi90TWVmZDBZWTI5ZzdzN2xDOXBoMVZU?=
 =?utf-8?B?dENiK0lraFpwT3pJTDR3dE9mMThJNGx1LzEyTDkxK3JIYjFrQ2VJVVNmejJ3?=
 =?utf-8?B?aFBQSDB1UjhLTmVWeFp3TzBXRU00QXdyNjFpbDV3UndHNUVKYlNyTG9KbG1M?=
 =?utf-8?B?cFZaZkJabWN1SUh2UGxkRUpPWHhXZDJiS2ozcFRiSEJoOWZZS2hUZ3E0NU0r?=
 =?utf-8?B?WXVxSEhydHRkaHRFOEoyL3g3VDc0V2ZCdnlxamZCZnQzK1N2cFRzbXI2R2Fr?=
 =?utf-8?B?WjQzUTZ3aVZOZ0U5RHFQQlBYbFR0b3NNTU5BZFZqeFFwQ3FyVjVvZU0rdGtB?=
 =?utf-8?B?NmhCMFNLZXZaYWtIQ1lYV1p6SHlVSWQrdVhzRXpNTDViZitsYzdGdGtpM25Y?=
 =?utf-8?B?V2F2NUNlQ2Mrb0FHMzRzMGN2T0JaRUowZ0ZPcFh2eDhXZG9vRUZNRlh2Zi80?=
 =?utf-8?B?UlZLdjlHbUdFcmlKUXRXWWpBdlQwZWhHMkdhZDRJYkh3eUhRVGN4OG1jUEd5?=
 =?utf-8?B?bEZwY3JnOVN2OExyMEI3V0p2T1FqOUNHUzRHN2V4aVdQL3JDV1ZzOTdmajdT?=
 =?utf-8?B?Wk03MVdBRDRvWE0xZGZSZ2NYQXVhUTE0TVQrUHFvT1VQdVM1TTBtSDB3dWc1?=
 =?utf-8?B?TGpCUHNjK2U5OEcyellFTk9PTFlUenlrMnBHTGhpZHJURjJPUDE4aGlJU3k0?=
 =?utf-8?B?emtSWWs1dWh3TUNGcllvT2JEWG4zd0hLLzhZcHN3aCs2OVpDUFFGYjdjUGxz?=
 =?utf-8?B?V0tmZTlnOG1BZnNxU3doV0o3Z2hKTUFPc1I3eHR4a0JVaEI5S1E2MnMwTDhq?=
 =?utf-8?B?T0RxQTQyRnE1Q0I0Y2JuR25hbEtzZ2d0c0JwcnVUUmkzdHU0MHFGbCtNUG1y?=
 =?utf-8?B?R1RUQXg0dmdyMitiTDdCbGg5UmV4WG9nR1RyNHlDUy83OUp2ZEZrZWNQcFIy?=
 =?utf-8?B?V0xLMWU3VmxyMU5vTzJmTDFnLzdsWjl4MlErOE9qeVJ6WTFtbFNFTFp6bkdW?=
 =?utf-8?B?cDVobmpmYjNXMUFPTG9kcmt0dXNhUFU0RTlQTGRQTkdKMUxabWVOWERvUjNm?=
 =?utf-8?Q?fKliVosEXmFuhIVQKDM+/IZM0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057bbd88-03ec-4c35-0648-08dcf7836b10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:04:59.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OpHxw8HLnUw1Hd+7L9bMgEm4JqmkZmWCfo1XQ5oKKOYXivh1rRwc9tEHFvLbUx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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




On 2024-10-25 22:01, Melissa Wen wrote:
> 
> 
> 
> On 25/10/2024 16:37, Zaeem Mohamed wrote:
>> [why]
>> Prevent index-out-of-bounds due to requiring cursor overlay when
>> plane_count is MAX_SURFACES.
> Hi Zaeem,
> 
> Thanks for working on this fix.
>>
>> [how]
>> Bounds check on plane_count when requiring overlay cursor.
> I agree. Atomic check makes sense.
> 
> 1) Since the native cursor mode was previously the unique mode avaliable, I
> wonder if the driver should fall to native cursor mode in favor of the overlay
> planes advertised. I.e. if driver says it supports two overlay planes and
> the userspace requested both, cursor overlay mode should not be available or
> should switch to native cursor mode, as before the introduction of cursor
> overlay mode.

Hey Melissa,

The overlay cursor implementation today should still do native cursor in all
cases, except for when it is not possible: if there is a underlying scaled or
YUV plane.

In such cases, we previously rejected the atomic commit, since the hw won't be
able to produce the rendering intent. Now, we try to accommodate it by using a
dedicated overlay plane. IOW, fallback to native here is equivalent to an atomic
reject.

> 
> 2) Then my second question: can we increase the number of surfaces to 4 first to
> accommodate more than one active overlay plane with cursor overly mode enabled.
> If four is still possible, this increase can reduce the number of commit
> failure scenarios and mitigate current userspace issues first. After addressing
> current array-out-of-bounds, follow-up patches can do the proper changes and
> checks.
> 

My initial thought was to merge the proper fix first to address the current
issues. But if increasing MAX_SURFACES->4 also helps, I don't have a strong
opinion about it :)

I think Zaeem is working on MAX_SURFACES->4 as well, but there's some detangling
work required in DC to accommodate another OS that dc supports. I have a feeling
this fix may land earlier than the ->4 patch. (see my patch comments below)

> 3) IMHO, the incoherence between MAX_SURFACE_NUM and MAX_SURFACE should be
> addressed before adding debugging points. For example, there are part of the
> DC code using MAX_SURFACE_NUM == MAX_PLANE == 6 to allocate dc_surface_update
> arrays, instead of using MAX_SURFACE value. You can find one of this case here:
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/ 
> gpu/drm/amd/display/dc/core/dc.c#L4507
> It doesn't make sense to me and it can contribute to an incomplete solution.

Right, also see below

> 
> Also, please add the references of bugs reported in the amd tracker, so far:
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
>> Co-developed-by: Melissa Wen <mwen@igalia.com>
> I don't think I contributed enough to your code to get any credits.
> Thanks, but you can remove my co-dev-by :)
> 
> Best Regards,
> 
> Melissa
>> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
>> ---
>>   amdgpu_dm/amdgpu_dm.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/amdgpu_dm/amdgpu_dm.c b/amdgpu_dm/amdgpu_dm.c
>> index df83e7b42b..c2595efb74 100644
>> --- a/amdgpu_dm/amdgpu_dm.c
>> +++ b/amdgpu_dm/amdgpu_dm.c
>> @@ -11676,6 +11676,12 @@ static int amdgpu_dm_atomic_check(struct drm_device 
>> *dev,
>>            * need to be added for DC to not disable a plane by mistake
>>            */
>>           if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE) {
>> +            if(dc->current_state->stream_status->plane_count >= MAX_SURFACES){
>> +                drm_dbg_driver(crtc->dev,
>> +                       "Can't enable cursor plane with %d planes\n", 
>> MAX_SURFACES);
>> +                ret = -EINVAL;
>> +                goto fail;
>> +            }

Hey Zaeem,

I took a tour through DC, and it seems to me that MAX_SURFACE_NUM can be made
equal to MAX_SURFACES in all cases. I wonder, if we simply replace
MAX_SURFACE_NUM with MAX_SURFACES = 3, will we still need these explicit fails?
FWICT, `dc_state_add_plane` should fail for us.

Thanks,
Leo

>>               ret = drm_atomic_add_affected_planes(state, crtc);
>>               if (ret)
>>                   goto fail;
>> @@ -11769,8 +11775,16 @@ static int amdgpu_dm_atomic_check(struct drm_device 
>> *dev,
>>           /* Overlay cusor not subject to native cursor restrictions */
>>           dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>> -        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>> +        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE){
>> +            if(dc->current_state->stream_status->plane_count > MAX_SURFACES){
>> +                drm_dbg_driver(crtc->dev,
>> +                       "Can't enable cursor plane with %d planes\n", 
>> MAX_SURFACES);
>> +                ret = -EINVAL;
>> +                goto fail;
>> +            }
>> +
>>               continue;
>> +        }
>>           /* Check if rotation or scaling is enabled on DCN401 */
>>           if ((drm_plane_mask(crtc->cursor) & new_crtc_state->plane_mask) &&
> 

