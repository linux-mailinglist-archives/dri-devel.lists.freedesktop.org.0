Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E36AD8EE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8F10E9E3;
	Fri, 13 Jun 2025 14:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0JkySIUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EFD10E9DE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6SQm/F64cP8QTUlYDHAJ8wSC8dwT4qWRLqID0MBM/9WEOWO6lBSSzfjogAqFTYgrsXGHnoZfaebtSPgwTxQ6f4h/5L1Y+720E1XafZvexriAhuBnrRxPNENkAHM/Y4QEp9fuX8ndPMY/MPmSylr+0KVwOzp8aauEsuj4mDhwy+3dr1XfxfVOBQA+SG0Xvkb28y4JzcYkLsM2FKUORDOHxU5mqUM5nBqKJyRh75r53VWiUZFiuhZ1zRbpev1+bVm+YNiZNtTlYC0miY0/mcQKPvZnxrHXkTYFS/xuyBlrwmAjVhrZCCqUwsdsKB1/9E6+k3VRaqA/RcfpAzQubSShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFvkBkWTBf42m3D8Wq9gyvMlKnm+xCxUzanQscopbqA=;
 b=lrb0tymhS9bRFT+nIXwfDakdKDvMsYk6feUyqFSONNbT1r8Gn5iA/GT4VyzaLHRluJGQsruERoMkUq9VYPMxpJFqxZNd4HGXwyPJattYZUYD2lzXUZaOYbbGFeKY1gueoPRm4eWomDO6hAqy4IHkySj8GUfwkIbkwaRuznLTMgKkAdO5m04ZjC1e6w4ZtzuLmAbYuL8BwzeuG9hXckRXTWelThMOIW+xfXIGJZ5nzzDLpfj7NIGI3xZB3RIDyA8l0IIt3NTYalpl8K0v8z6KqXgV5tctKvMGi3Zyig37OjmoTtdWO3/lp3H2eJ25cvGpP1iGRfzS8fNE5L7ZuRENPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFvkBkWTBf42m3D8Wq9gyvMlKnm+xCxUzanQscopbqA=;
 b=0JkySIUOFi6jP0kWgJl10JDGGy/+AjJXs8aPc5m0TDvaZh9GtcOqWj5etxmIVsUJP4ETzukTWmfgKq/uKxOPFFNPMttqS8uHJ3BXXXGW5l6C5JYuA5vYBmbQ8lxlsuep78y7Icw/7hmr4ZE2QnzZOYuSNSsYj8il/nJSIkaHCi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 14:12:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 14:12:51 +0000
Message-ID: <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
Date: Fri, 13 Jun 2025 16:12:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: d4261cf7-adf1-4c66-1da5-08ddaa8461be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1ZrOExJZU5DSlFCTm00clBXWVZ1VkswWWJicHdyY1NRQmRxYWQyZHh4L0xj?=
 =?utf-8?B?ZHl6dFNnVlkvYmRIRXI5QTlqdW11SUUyemsvWnlEYnBiSzVpbEtEVkhLRUFR?=
 =?utf-8?B?QWFBTUlRdHhHN25FcUxxc3JsMEZsNm9nSHZTbDJSZ3c4MmtyWFpxS2lWaXlr?=
 =?utf-8?B?dnd2WmdGTUtOMFc1UllNWXNUVXZBVk5PandmUlhJUU1MbTc3bkNtcWVTZlFz?=
 =?utf-8?B?QUxTVXdERTJUV2JnUTE5N0FGU2dyaXdXcUs3L3pIdk10WmZqblltSk0rdEEr?=
 =?utf-8?B?dGdyR0ZJMURBcnM3T1p3U0xmcjJ0aDhhWHRjOVVhUlJKdGlRajdpODJvY3hN?=
 =?utf-8?B?dktwRUlvVTdEMXFLQ0ZGa2dkTDhidEM5RDhFeWkxLzl0Tm1KTTdQRFM1SVNE?=
 =?utf-8?B?QVk4dFhST0ZDeDFXSG1hcU1ILzZHY2h1Z0J2TGF1VjdjaVJodnFNdjBkWTFq?=
 =?utf-8?B?RUVaOUh4cVFmY2JzTVYzR2tFNWRuM01icDQrMDMzcjJ4ZU50eHRtQmFmU2hv?=
 =?utf-8?B?ZXJWZ0RoWmgxQWVBMURVRndtajBjUWplRzA2TFdpU3dnbUlxR1JJUEFoM01U?=
 =?utf-8?B?VklLY2JpLzByNHFTNnovY2liV3p5OHNpWkhCeHB5eDlhYzNMUFVDdENQbVA2?=
 =?utf-8?B?R0crRDJ5U21KWW5LMEhVNzY3UW1hMFdTVlc3dU9wZjNIamIxa25qWTFHTDF1?=
 =?utf-8?B?ZVlLWlVDRmlheklpYmJUNE9rbDRGMDRXSHZUWFUyeWQ4SXVDY29PampISjVP?=
 =?utf-8?B?L29yQUgzaUp2WXpSZ1dzZkJZclplZlZnZ0lCc3ZoMFY0VjhqdWVvRnN4RDUz?=
 =?utf-8?B?UUVoSnZzZEQ0OStYZUdKY3k2RDMvNVY0NzBCdTEydzBuL1dvbGhuRVJ5Mm5V?=
 =?utf-8?B?dW45RDVCVXUyR3FTS3FpYVhCT2h6K2luL0JyMm9vWGIxR1BJd0RKVVFKSlNk?=
 =?utf-8?B?WFlBajNiR0t5OW1RSVVLbWZxUjZ1alo1L2w4UEcwcEsrMkxZcDRQYlNzT05y?=
 =?utf-8?B?Uzl5Q2tLUzlESnNwTm0wTzluNjYrTHBWYWFDRXFBWjRkU2wvTTkwbjFKcXZL?=
 =?utf-8?B?bFBmbE5BekpoWDcxdnNqSlNKSnVSRkZ0amFaQ001cnZ4Q1F4Tk1YRUNmZDl3?=
 =?utf-8?B?US9qSjJET1dBV1JuK2FmTHdnVndubjYvWlo5cm9TdmVIL3ZRNWZuOGU5WlEv?=
 =?utf-8?B?QUZqTzF3bUJSWkhlV1NyMHpLWERINjlOQWprTFBZdkdLM0hLQXUxRUhXQjNI?=
 =?utf-8?B?WlpERTUzUUMvODlkNVc4UHl0YWlJMDFnVTRyTHI0Rkc5dHdKT3JZaEM4eUNE?=
 =?utf-8?B?Yk1IZ05hT2kySU9TOG5rczQ0THZNd2d4UWFWTmRiMW4yVlcxU0NjMDNJVGxu?=
 =?utf-8?B?TG14ZVBXN0l4UUNybCsxZjdLQVNnSzIvWGRtQW1CQUh5QmZhVUs1eWJ4OFBq?=
 =?utf-8?B?TzErQUNCVzhXQ3pVRlVoQm84UjZvekEyY0JLM09DU2hPWHpzSnEyKzFMM3hY?=
 =?utf-8?B?enFxZWs3dExuQUN2RFIxWHFucXBjbktWZ3BjQzZ5OUtNblVQdGZ3bXl4NUVL?=
 =?utf-8?B?d09Fa1h6YjZwQUExYzRUUFRTbjRaV2hGMkVGTmdlWVlaNVl3dWxSU0RTbTZC?=
 =?utf-8?B?V1Y4V0RMLytFQWZWVmx0dEd5eG9RNnQ0T04yYkFpaVl1OXJXNUhCSkJJWFNC?=
 =?utf-8?B?OGR6K2FqMWJ0V09SWmZ3aEp3Z2RoWGs3WTY2VytJWHdHaW5Reko3dEIvRm1y?=
 =?utf-8?B?Qmc1RWRnaWJtOHVObmxxeUc3SVlCR0RFZk9iejJ6ckJtNVkwUjVRWDI4Y2E4?=
 =?utf-8?B?Q01OMVdybGtBYVJFOFRDUDNwVVBQekQvTVhEbGVzeDAyaWlrV1dZY1Z6dkxu?=
 =?utf-8?B?NHVHWXo0WWEwWmMyMW1GUmE1RlJCWnNoM283Ui8zSXZDVFNEV3QvdHlKSUtD?=
 =?utf-8?Q?dMp3Yt+L338=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFYejlXZjZMLzg2K1A1NkdwQ3JtaERPaUFjQkdNazhDYThxdHBiRnNvMGVR?=
 =?utf-8?B?b2tmcHRDcWpIUmllaDJzS1dqTVVsR21rRjB3aEZGcURJUit1c1A3alNnK1Vj?=
 =?utf-8?B?ODNCZTd6TGhLd2VtRmI2SVVESXhQdU5Nc1k3S3lCdHlKcXpFeE5pbzM1Nkcv?=
 =?utf-8?B?Y3gvb3dTSGhtYlBHaHJWb2NsN28wb3Y1TDFPWTVVL09pdUduemlFN2hMdTdT?=
 =?utf-8?B?cU8xcjh6bll1bWdMWUgremNLTXlXYmRuU3pSUFdVdHNqSTJvdFFoOTFucW9k?=
 =?utf-8?B?L0tZZ0VObFRIZ0pLTzlkdXE3OHlxSjIvYkZ1UzY0NDhMdVNkdjFQR083b2M0?=
 =?utf-8?B?K3FhNldzMEgwUjE0Y2lNY2JQRFJYYVZseWlqNVAzdExZc0hvdlNybzJBc1RK?=
 =?utf-8?B?MWcwNm1VZU90UnZUUlg2WnNxWFpUVzMxOHpXM3JJZm56RFhGU1F2QkowY3Zl?=
 =?utf-8?B?cjdMRmpHb0FTN3BBVkdiNGhuL3dsWXJuVTZUay9KR0dja3NockJ2aXRDd3RQ?=
 =?utf-8?B?dW0yOENTYXVEYysrRFY2T2hla0Q0ellhMk51WXNjOVFRa1o4dGZyV0JqQVhh?=
 =?utf-8?B?ZnFsZk82Y3VtRkZrTlB2Q1YxMmpkWm9OZU8yU2tSVlRlakxVWVJQZDE0aVVn?=
 =?utf-8?B?a09MdlAzVTlnamNQVlQrUVNFR1M1MjNwOW9jY1ZUQTlVRlNMSzRmN0tQOXVK?=
 =?utf-8?B?L1ZnREJXODY4YzdPdzVMUWN5SkZXZjcwdGJVL1NlQnRGdVcweGhxb3JPcWli?=
 =?utf-8?B?V0tNY1Qra1ZlRjV6SXJyR2NnTG00UVJsZVdRN2hUSUs4anBiWEJTU2dDb3Iz?=
 =?utf-8?B?NGhJb2RBeFRzNHpud3VVUmYyOFJPcnNkQUxuL0llNDJvNzRZWnJaMk1CMjZP?=
 =?utf-8?B?UElDYWVhNXl6UnpUNk51OE0yTVdoWnVaLzQ2aEdONnY0NmNPRHp1SWJEczZn?=
 =?utf-8?B?VERaR2VTNmZ3bnNCL0VYU3lhaUYxT1NwdWFiN1RqYkVBZlpXeHczRmVMbDRM?=
 =?utf-8?B?VGt3NVZobldUL2c4YlRDRXdQWTBFRVRkRDU2Y0EyWmw0dEd4akdlZkQ3cnds?=
 =?utf-8?B?a2ZaMXQ3Rllnd29mcVpuakFKSlF2aW00aTdhL0tPQU1ZcEt0aHdXN1lyYVFN?=
 =?utf-8?B?YlY1b3hJa1pwc3NhUWxOcVB2WlVsQnQ2VmcyU2pYdXRETW9HQjIyWTlDNVMx?=
 =?utf-8?B?QWthamZsMjBkRVd1YW16NVV0a3V5L0VuZ0N5Nk5iWXpjU0JvekZYdTQ2aEt4?=
 =?utf-8?B?VzVFUkp2Kzh3SzdJU0pNYlExLytzVGNyLzc5bE9UdHdOZ0VtS3lwY0M0S1c1?=
 =?utf-8?B?QW1admMwSDZXMWRHUVNOeDFGOHN4dk1Dbm54ZlR4YXhUcXVzWnB4cTc3NU91?=
 =?utf-8?B?TE9CVCtuMFVZLzdMZlR3REYzeFJCVGNLdElFYWRGU2kvQW9DNnA0a0htTi8y?=
 =?utf-8?B?ZVllT0xsVjhTcEVwVU5YejhZcEQzUFJaakltdUNGTEI5Wkw3VzZDd1hJNG5m?=
 =?utf-8?B?SlhuVE81bEJ3L3hCbndMRkkvaEZobmh3czRKS3NJQVRyRVFBQW1qNEpHSFg3?=
 =?utf-8?B?T2laU2plYmF5d1FZOVZmNCtDV0dVcER2aXBCdi9xQzJnNXFQclVTZEsrU0VS?=
 =?utf-8?B?bjNJQjFBeTNhNjN5WGMweTRpYzhYRUIyd0hpZE13UFJNMEh2bXVEL2pwUUNB?=
 =?utf-8?B?ZkFFY0hlRGtuWmo4R3ZJZS9mQVJxTG1MUldCN3R1YlJvS3krd2NhRUpTSGtR?=
 =?utf-8?B?bjA1MnRjeUxKYnhDc3ZqWm5jTFpSY28rKzhUSTVncnRnZVlRYi95bTRMaGlI?=
 =?utf-8?B?ZUp0UXF3RzFDZFJuQWNIRnRmZ2VBa05kdnhUaThuYkw2V0JhT0U2R0IzOSt4?=
 =?utf-8?B?RVRiUjBXb3FBSWdGN2hNWTlMaG9BL21TUnVKcXhJMVJ4L1d6bjFobExWeTVx?=
 =?utf-8?B?WERoQWhWM0NneE56Wlh5aEUxcHorOWhRUTV3bnROeU1oc25IbmsyNDlYSUVS?=
 =?utf-8?B?NkJDQlpqSXJ4cE9USS9FS3VCQytFcUN2YkZBUU12OXFCQXBhMnBqalB6NDIr?=
 =?utf-8?B?eE9ib2loamw4TGtUMzgzcCtmYklBZzVVeEN3aWtVa2NxdnlHVTNUakVjU1ho?=
 =?utf-8?Q?HcyGaFe5SxQWn5uhPJqSVqoki?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4261cf7-adf1-4c66-1da5-08ddaa8461be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:12:51.2980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNjdQShd5qSb9hZFN034lhJcgRvX8TZCq71XTnCwUPILqtQF9irF7XlzS1GOFtFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

On 6/13/25 16:04, Simona Vetter wrote:
> On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
>> It is possible through flink or IOCTLs like MODE_GETFB2 to create
>> multiple handles for the same underlying GEM object.
>>
>> But in prime we explicitely don't want to have multiple handles for the
>> same DMA-buf. So just ignore it if a DMA-buf is exported with another
>> handle.
>>
>> This was made obvious by removing the extra check in
>> drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
>> find it in the housekeeping structures.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 1d93b44c00c4..f5f30d947b61 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>>  
>>  		rb = *p;
>>  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>> +
>> +		/*
>> +		 * Just ignore the new handle if we already have an handle for
>> +		 * this DMA-buf.
>> +		 */
>> +		if (dma_buf == pos->dma_buf) {
>> +			dma_buf_put(dma_buf);
>> +			kfree(member);
>> +			return 0;
> 
> This feels a bit brittle, because this case should only be possible when
> called from drm_gem_prime_handle_to_dmabuf and not from
> drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> hence bug in our code).
> 
> I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 
> 
> Otherwise yes this is the functional change that I've missed :-/ Note that
> there's no race in the original code, because it's all protected by the
> file_priv->prime.lock. Which means I think you're claim that you've only
> widened the race with your patch is wrong.

Yeah, agree. I'm always confused that there are two locks to protect the data structures.

But there is indeed a problem in the existing code. What happens if a GEM handle duplicate is exported with drm_prime_add_buf_handle()? E.g. something created by GETFB2? 

IIRC AMD once had a test case which exercised exactly that. I'm not 100% sure what would happen here, but it looks not correct to me.

Regards,
Christian.

> 
> Cheers, Sima
> 
>> +
>> +		}
>>  		if (dma_buf > pos->dma_buf)
>>  			p = &rb->rb_right;
>>  		else
>> -- 
>> 2.34.1
>>
> 

