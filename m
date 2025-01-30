Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7583A2348C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 20:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F2610E032;
	Thu, 30 Jan 2025 19:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vJ5olkEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059110E032;
 Thu, 30 Jan 2025 19:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqK1LsO0+sicK4EN6YjkwxA/Df5PxM1z2VH86yOXeiQAlCwZlogNeWj/aAsRUz1JBR/urem4YozIETlNIg78qLzk/LH1U2BUplVfmMRPmppM0A+lWV0wMYYC8aoA3VOuZwNuXtsDOdD+C1CjwygdGZbQ/AVt/AjOGFGY/NjQoh/NVriWoYc/yb0B5ogf0W/77Cs7hRENOmxlzniBWRpfdAfhmi+QbzCRqyCpCu7FeJsspqAu6Yhgauj7LxovjH/TVQnF/LDg+iGEG+ruL+O5AgZoB3Egai4av9ykORl/RV92aK1wepSWSnN+WpaSln9ojjZoFQZLelySkSwxfTk9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziaLN93CvV7iwvnovWzzUEsBXnPc0RJm1JkGlLLnIrA=;
 b=cWkWsAnUJBGDA2neuuX4e44FKQNTdTztBuANkcl48lP1GW7nkPJPD5favgwlVAv13RFY827MkRVT6E0t0fhfYuL+d55tNZkd0PEGhs03KztMtjJi69FcO1pxSkf5DpFnatvqsKkdqNTXN7t65kalBxaPeSzb7YefWq4GUrJXpbpfwD7IMjlyjyYRmunhPwXTgil8v7mQpjoqAu6UbhCkRRPRHbz2Ry4N8Qba2ZCkeHjXR7z6jrzKiKLb1k8vhfvwJ1mFREo2KRrshslNIsFeJpPqxLK4t77tJlzftUvsSBhRwOoTpTGi7mMao8PKU61QOu+pWZz1+VAfInu3IsaUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziaLN93CvV7iwvnovWzzUEsBXnPc0RJm1JkGlLLnIrA=;
 b=vJ5olkEH3FvHMu1C5QWOUl7AFq1UEnu558B9X8rNswuYnAoILrsT3ejTbPqP2Anj1oKIvc74/4/tdw1ydbg/BEoN98bnGpL7fXPs1xemrHM5Has+seh5+x1GZw1DhTB2tOISZV6/iYxQK6CgtvudHYPC6kSSFSWmxfNKQCqCRwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 19:16:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 19:16:30 +0000
Message-ID: <b1c960e3-6663-434c-9b01-a94175c153b5@amd.com>
Date: Thu, 30 Jan 2025 14:16:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Increase sanitizer frame larger than
 limit when compile testing with clang
To: Nathan Chancellor <nathan@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
 <CADnq5_Pun+zN1=B0eFMw1w8k_oD3fw626SdaEug24YRg8aOLKw@mail.gmail.com>
 <2025013058-fasting-gibberish-9718@gregkh>
 <2025013003-audience-opposing-7f95@gregkh>
 <5d1cfcee-b575-4e01-8ec0-dd1bcbba9bc0@amd.com>
 <20250130175103.GA3394637@ax162>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250130175103.GA3394637@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 56348ee9-6092-4ede-d2f5-08dd416299f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0hCK1dXbDc3TVp3K1dJbXVHOUo2ckdSS0QrTEhFb3YxanNJZTNMZzhrUFND?=
 =?utf-8?B?dlBXMXFiZkczbFNDdDhPMFBpVENYb1JHYXhrWEltcSt4dk9lcFlVMUp5YmVU?=
 =?utf-8?B?aVBKdTZzWElHVlMvY0ZUcEk3ZGNsb0FJT1BUeFFZSzJKY1dmN3lEZVZ4ZGY0?=
 =?utf-8?B?bHUvZmRXWTludiswekoxUXJuY1NJbnlYOXFQQUNMTEZtSGRwSWlnMndUWFFK?=
 =?utf-8?B?OGFkcU56cHYzQVBoa29XUGcyVzdGRk9hczhSa1FHRlBKY0dqSktQZCs3eGZ3?=
 =?utf-8?B?a2lNRXBEOXdpalh4MWtqTzd1QUM5MzAvRGdma0NaMURPQ1VUVkdKVUVqbmRx?=
 =?utf-8?B?LytqWjJTSEpISEpsSklScWFhOUwzZE5ON1RPSVBLbUMzSURjYUc1a0kybWdy?=
 =?utf-8?B?cjlHNC9uMVk0SnU5OFkweDh2ZnhKQm1RSTE2TTdKMCtRUHg3MnR5bStTbi9k?=
 =?utf-8?B?VUV2S3BrYmJxeXhtOTNidUhDRjAvUnBqOGFRQjF4S0I3TDMwR2k2NmdMbmRD?=
 =?utf-8?B?elFOUzQ2b1hGSVl3aFpLcWlTUWRHQlpuKzlONDRrM0RMSGx2MDR6WEc4WXdW?=
 =?utf-8?B?bFppOVdYUThETGNObWdNdzBjTm1tdklmK0VmWmxCVVYwYWs1QUlwZnZHbWJ5?=
 =?utf-8?B?VlhJRVpmNDZCNmdyN2tvcytCYTFwODBObC9nV0s1aDUxR2ZYQXdkN1luZTZW?=
 =?utf-8?B?ZkxhY0VRdUlUS29uelJHR3Iwc0g1aDhaU3RldGpGV2hKeVNUeGRBVlBIRldK?=
 =?utf-8?B?RW5hbHRFN2EyU3MwdHprMnViTjNkYTFnck50RWhrNm9NNm03aDhITkp2QWRl?=
 =?utf-8?B?UEJVcmNlYUxTeFRtMVZzL1ZpcXJlODRpNENQMy93WjdTNTRYWXlTcE1uZFpB?=
 =?utf-8?B?ZitBTFQxL2R2RzZLY25IL3gwVTFCZC9DaGNRZUxxUkNLQUtpU1VqQWFjSVRr?=
 =?utf-8?B?clY1S2VaTDJaQkt4UDArZklsV2NZUDVvc0dFcVlxdTlwanJDTTJTZlFaa0E3?=
 =?utf-8?B?WFk3V24rMVpVQ1grT1A3c3JxTGVTN1RMdTRDWDV5cGpJT3VoaHVrYXpwdzNp?=
 =?utf-8?B?dnBtWWNMdTB4MHRrSkwzcE9vWGdtREJNSXJqdURyQlJydU5MWklEUzFoMUQ0?=
 =?utf-8?B?MHROSElIaHlmVXVhRTViWm42SUh4L3BsUFBjdW5VWnBZbE81UmJrM1JUL3dx?=
 =?utf-8?B?bEUxZzcwcXh5N0pQazM1VzA5RUJNN0d4ZGV3VFZaNkV1RmRKUmNhY3FuNFdO?=
 =?utf-8?B?YWhjUUh4RVplTWMzekQ0UjB1cXdid09vSmFPaEFCU1puQ0RrcmV4ZytQQVpG?=
 =?utf-8?B?ZjdFeUVienRESkZlRm14VmI0QjdWTzdla2hBV1RmK1FUa1lIZWl4bFR3Yld6?=
 =?utf-8?B?NVZrS08xVUxxVnlRWDE5L3JDYjRzZzAyUWo1enZwb1B2Rms4M3g4a2VtcVpL?=
 =?utf-8?B?ekE2UEhCK05QVXU1dDc3UWRveExsQ051dDQxMUFwQm9vbWw5ZVdEVERqeE13?=
 =?utf-8?B?WkpYT3hIaFI4dkxNSkdBTHRGdUNMam1lcGVvZCs0ei9jb05jVmlnMDNCSXdh?=
 =?utf-8?B?RXQ5aVlwT2xZcllFY2xING9rUjM4MklqQi94emEwdHFnbmY2bTluaUs2Kzhx?=
 =?utf-8?B?R2tzbVlsSHlTSGZua1NOZ1JsMjJnRGhDdCtaUFJGR1NQQUREajFJQ01UUENN?=
 =?utf-8?B?TEFOSXhPaWRjRnhiWWN0YWdzNmFHWnc0ZkhoR2U5YVV1c05GWG0zQUN5TjJR?=
 =?utf-8?B?YWc4VlZIaGNWOGpXUXd3SlN4bGZKbFpqNStMRXdsempQSHhBem1CbHErREV4?=
 =?utf-8?B?YlRLQktLQ1UxcENZU2hTbFZxZmhzWTVPYTVhazROZXV6bnJTNjlrYmxNcTVt?=
 =?utf-8?Q?1XUbNqw/h8eS5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStybjB4b2VxMUxJNWFBZ212WlVJdStvQU93VHZEYUdXWjVVTFlsT1dFSWk3?=
 =?utf-8?B?SXArS1pNREQxa2Z3OEE2aTkxZXJ3Q0RoZHR3aVV3UjFpUmdhanZNTzhudTZz?=
 =?utf-8?B?aFFRZTVlaGhMZWZSMGEyekIrNUdYM21wQldMTVNrL1E4bkhwQWIvWUZlNlVB?=
 =?utf-8?B?TjQ4dTRJY3FXemoxSjlvSTM2OVk5N2Z4R1ZwZHVqaityRDcvRGduRm1VMmt1?=
 =?utf-8?B?UURBZkljQ0c0akpERXljdnFoalBmZmNwQlJYVUZWam4xK2dEZVRocTFobXc4?=
 =?utf-8?B?QTBaYU5FbnJJMTF3T0NEOURQQ0FZc3Q5Q0cwUEl6OFZSajA2dnhWMkFxSnRr?=
 =?utf-8?B?M2kwT1g4bFFrWG0zeE5jT2NXR2xtUUYzWHdQMk8yL04zQS83SkNQb3FvNExy?=
 =?utf-8?B?MmhjN09hK05wUkxQTGtJcVZ2SE8vNjk2QUsyQTJ5OFdZMThlMVEwbmVzaHZi?=
 =?utf-8?B?aEpiRm5OSHJoa1I3NlBkRGw0VGR1YVhMQWlFbUFkYmoyclAraEVIMmM0c1Q2?=
 =?utf-8?B?OWI0UlNEajY1a2JwMFJoN3NRTTVqeUN1aXp0b3RJY3JSa1NOcy9YZ2x5b0Ew?=
 =?utf-8?B?QU8yejBzdi9vclFuOXhNaFBmSnJ1Nnp5cDFWUlBxaHV4S0tqNDRBRWlXTVdo?=
 =?utf-8?B?K2FwalovWjFockxZTVpINTNJR0pVaU9lY2pjM0ZINXRRSzhRUVpkSncxUENu?=
 =?utf-8?B?WEF4djBXTzh4UFk3VGhNTXNmWDRzYlQ1M2wxMWdqY09Uc3BBYU9McHF5WmN1?=
 =?utf-8?B?R0x6TkFVRmlJRmtrUEJaczAzRmo5RDErMlI5WWhicDl1cEFjc2FaZWpidUd0?=
 =?utf-8?B?VExyNlpSS0Fwa0ZHdjREbU9EVTNoYUhSN2x5VU5OanEvWExKWHJZbnhVT1oz?=
 =?utf-8?B?MGNSUTFpa3JtM3N6cHozRzRUVmYzaVI5ZTN4V2VxOEl4SXZFNGloTVE0N003?=
 =?utf-8?B?cm9oZ3Bwb00rR3dSMXFuUUVwZVUxRWZhdFBjRzAwaG82N3ZrcytsemdubmJ2?=
 =?utf-8?B?NDJNSEowZVBjVm5wL0pIMTBHV0MweHN0dTJaNG56N3lNbWZsVVRoeEVockw2?=
 =?utf-8?B?QkJBa3hwYnc2R2pSU2VsTU1UMjYxbUNkdWEyR1RVbzZGYXdDaEhwRlI3Z2tX?=
 =?utf-8?B?SHFCUEZMRmZtVEhmcG4wTzUxaGE0c2czOG1uSEJGcDU5b3hUQTNsSmdBS204?=
 =?utf-8?B?VWx3NVFWTzBNVDcyYXZXSGl0Z3BCa2FQMUlndTVqTEhJZVRLcUdMTVBLdElL?=
 =?utf-8?B?allBa2hlaUZucFhyMkg4YjU1ejJnR0t3bmp3ZU5YamlMdmFUak82SGhNUGcv?=
 =?utf-8?B?Nm5JeHdYMGdUMUdwMm9GQ2hxdlluK3NhUEU4QzRmRHNDWXBpQllEUzZ2cVdU?=
 =?utf-8?B?d05Ga0xBUG9HcTdFZlRCTjlIakJJNlFEaTNqWlJxTlJudnpkbWtnNGRkaVQy?=
 =?utf-8?B?N09yMnhVWTJLT3VpSFBiWW0wRVhUMVJrNmNOOUpDTS8wZU1QTk9QLzQ2NnVQ?=
 =?utf-8?B?ZEppQllQbVEwZmxxWTNWaHVNUi9EOUZJYjJCZ0RRazlmbTJ3Ty9TbzM1NW1h?=
 =?utf-8?B?bXBsSHpQWG1lb1JoU0lGeFE5UWFwblhnVDNJTllHMjE3YnJMM0J3Q04wTUtO?=
 =?utf-8?B?VE8zbnpxR1lhVkUyRjl1SngxdHlZN290b0diMVEvMzM3aE8vYUU5UTlVYTVL?=
 =?utf-8?B?b0pCQko1eEt0V25wVUFHYXZLVmpELzNHSmtXQ1dDdE8rY3Bra05pVittbGtq?=
 =?utf-8?B?M1h5ejRJVDh1eXVTdlhuc2hiN3hkdHlKWC9QTGhCQmlERFZWYWU1aE1oaEhw?=
 =?utf-8?B?UUlUZU1SUE95NzU1VENYdi84SWtCSDdhRDBqeWdYQ3RnNHg0OWtzc3pmTUNo?=
 =?utf-8?B?cDA5d2hFeDVJb29NbFBkNWdtYkIrM3RVWnNYZUhVaFVjL1VkS1pNcXdnWExo?=
 =?utf-8?B?bDlURTRkTXFQb2tPK01pUDUzRGs0VFhUMmxPazdNcnI2bkN4UTBMbnMrV1JE?=
 =?utf-8?B?b0pPOXREb2xoTVNOdThJOEZSMTA0MWJUR1ViSG9xNVo4RjV0eXhrR1hldUk1?=
 =?utf-8?B?TkkxMTB1azZDQWoxR25OMlFmbFR2UTJHVng1dDkzSlhzclJhN0szSStmZjhV?=
 =?utf-8?Q?an1PPULVcP7KKHUEDF65ogASX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56348ee9-6092-4ede-d2f5-08dd416299f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:16:30.3786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1r5xCcR64i6/bNBXfuCyJ4SQZkNrQ2ul9yOnORAJJkJ8GR853e7pS3B4q/t0s5Z2Zr2I1JDGYHYEM/fDAK7ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278
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



On 2025-01-30 12:51, Nathan Chancellor wrote:
> Hey Greg and Harry,
> 

[snip]

>> A more robust solution would be to do a greater-than check here
>> (for all the cases) and only set -Wframe-larger-than if the value
>> is greater than the one defined by CONFIG_FRAME_WARN. There are
>> a few "-gt" uses in other Makefiles, so I would think it's fine
>> to use that.
>>
>> I'm no Makefile expert but if this seems like a reasonable course
>> of action I can take a stab at it.
> 
> Something like this would work I think? I added indentation because it
> was getting a little gnarly. I am happy to write a formal patch and send
> it off if this looks acceptable.

Thanks. That's exactly what I was thinking of. If you send a formal
patch I'll be happy to give my RB.

Harry

> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 46f9c05de16e..e1d500633dfa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -29,11 +29,15 @@ dml_ccflags := $(CC_FLAGS_FPU)
>  dml_rcflags := $(CC_FLAGS_NO_FPU)
>  
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -frame_warn_flag := -Wframe-larger-than=3072
> -else
> -frame_warn_flag := -Wframe-larger-than=2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        frame_warn_limit := 3072
> +    else
> +        frame_warn_limit := 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
> +    endif
>  endif
>  
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index 91c4f3b4bd5f..21fd466dba26 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -28,15 +28,19 @@ dml2_ccflags := $(CC_FLAGS_FPU)
>  dml2_rcflags := $(CC_FLAGS_NO_FPU)
>  
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> -frame_warn_flag := -Wframe-larger-than=4096
> -else
> -frame_warn_flag := -Wframe-larger-than=3072
> -endif
> -else
> -frame_warn_flag := -Wframe-larger-than=2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> +            frame_warn_limit := 4096
> +        else
> +            frame_warn_limit := 3072
> +        endif
> +    else
> +        frame_warn_limit := 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
> +    endif
>  endif
>  
>  subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2

