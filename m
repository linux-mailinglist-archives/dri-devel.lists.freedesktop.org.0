Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1FCB8B44D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 23:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AC610EA98;
	Fri, 19 Sep 2025 21:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R/emiGbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C9110EA98;
 Fri, 19 Sep 2025 21:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNGYCM74yk9zMKLZv5Jt9Ul7t2M+3hg7+tuZDRsuDPMpmh2U44GRc2MEoK3qZW4eECamG7v03f+dhLAirdlbHkzwusXiMiCkDkdzZSwlyFCsJDTiWXIJIATl9txgUM/8apLN1H/aStXcbgx1UaXOMkCQbElAA6vKcLJJr5QNAXqi1m8GX2cyLY95TvHbFDbGHTccZe6Ra4zVrDFB1p//2sTO+b9Zna8rTk+o736DaSaDTX9jbus3MuXtuN8uP5/7LN268xTIk+YqUumJ4YOTdrkEglP0Fav7di3Ee+0O851yFExFNkXk2U2H3BERVdPJ05/4Yl5ZUd5zHCcbR1uuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FifQmE2d9p2tua4P82JP5kS70foFsEGl3Q30vBhmT0c=;
 b=BB0HJxv5QtPXxyX/2nnP2bz7c8EC8fx0+1htj0RpwDrdaw2K2daYvB08j3rXyqWu2gXz6VOi7+IEmeanqExwutmJpnX3PToGaO8zxzy6WFY9vFqX3lD6DRP7ZGYcarQCT56u4f0/zEf+zGN9Uhq9FJBbNOi1/n+lBqZvdNyXDjShz8GLjqULVrqzepKnRG6wRmNwkxjIBLTrFHdijPl1ezmg28eNOiMtT6vsL7RP2IPJ9aUF366P73VeQPW3ltP30YkZ4eJ9MphQI1C4OYLyzqSXeawEFA0O3ZeCiIzKrbAI9RbvpP0xSBGJ/uDt17MxZKbnj334tFe1Hah53l4A7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FifQmE2d9p2tua4P82JP5kS70foFsEGl3Q30vBhmT0c=;
 b=R/emiGbb/nae+qxj6uhx/v53UUzExWWg7Mi/zlT/nEg87OnnyhwWIp3jVs3xfMkynyMceG5bLsWfahHUSe1+koJ4PGXgoi1HgQFTw0fhUeR8D7VPDcU/cO6SiN0tf3UCyezA7UuQgfxlglRFYDJPP6k6RT2YuPDQaTMcbv/JPbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 21:04:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 21:04:40 +0000
Message-ID: <6bb25d6e-5d16-45c8-a524-f37ede86703f@amd.com>
Date: Fri, 19 Sep 2025 17:04:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd/display: change dc stream color settings
 only in atomic commit
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Cc: Xaver Hugl <xaver.hugl@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Christopher Snowhill <kode54@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250911173101.1960156-1-mwen@igalia.com>
 <20250911173101.1960156-3-mwen@igalia.com>
 <3532996f-757a-4a75-b33d-e1d9aebe879d@amd.com>
 <c6ae7793-358c-446d-b7a8-38440b3883fe@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <c6ae7793-358c-446d-b7a8-38440b3883fe@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0238.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6c4b20-9ce1-4536-088e-08ddf7c02603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U21OVzdQSHJkdFBBQlRaMWFYcTBvMkZ4UkZZNkdhTFFGTTAvY2xoT2xOU28y?=
 =?utf-8?B?YTJNZnlIcjFxdGtTcmhqTzBlSWpQSTdma292ZThrME5rcldQY0UxUktHY1lu?=
 =?utf-8?B?c0R4bHNRNHl1VEgwNm02YklQR2tCMkhZOW1JRUFORmQzRHcyeGs0ZUhKTTBB?=
 =?utf-8?B?ejVKdUoxYlhhUEc2WFVjZm9wdStPeHVWREJpVlVxZHhvdE5LVDZyMjRxcFFJ?=
 =?utf-8?B?S3hEcStsZ3dEWGJnUGxVYnJqTXZRZVc3ZEN6WmVpTzl0UTBhNU5nQmRIUmk2?=
 =?utf-8?B?YjlTditPdkxZMzNObXBoa1JLN2FHUzBrN05qVkpqN3JBQi9kVXJMczgzWEFF?=
 =?utf-8?B?cnhQTHNBMFlwaW9oN1dPVnoxd0p4bWNybDFQMFZzcjRNSFFRaS9mL3pNM3RN?=
 =?utf-8?B?eFZudGZ0eHl5SDFNa2tTRkNFVEdncG1lN29jZUxaL2N0dFRsazFCMEFZaWt5?=
 =?utf-8?B?T2xoK0lQKzVtZFRoaTZQZVNiamt3dE44MXdWRmNCRmc3MmlBSUdzODlzZm4v?=
 =?utf-8?B?NW83K2dsWHhmV2JadXRLMmhQQTdtRkRoK1lvV0VVOTI1ZWk4ejlzQisyUzVL?=
 =?utf-8?B?MlI2RzM5Rnc5bHJmaW4vbnIyWjZBRTh4TlR6bFhoTGQvK1JPdSt5bjAvb2th?=
 =?utf-8?B?anZHTkNWbTBYWTlTdDV4YTZBSllGRThQQUFSaDdHNklxOFNvc2s4NUs4ZDl3?=
 =?utf-8?B?ODB4YzdWaC9iSU5WYnNhd3lFdGxlYms3VlVlUndFSzJIU2FvT3pCOHY4Um9P?=
 =?utf-8?B?M1FuNkNMWk5BeC9uM0pud3B6dkJzYTdNbkJlS1grUEFSWjZkQ0NQVUV1WnFI?=
 =?utf-8?B?WCtYZnFEZ0VGbDEzbS9RS3lKZk1YMmh6TVU0RUo3SnpXVFVHek9qMEZtbWxH?=
 =?utf-8?B?c0NDQng4U1c5bmpiajI1QUVLWGwvY3o0WWdHT1Y2UzQyeW1KOE1PcWd1SEZB?=
 =?utf-8?B?Ri9PNVQrVjZwU0xKU3NJNGVQZ09IQ0g0a3NZSmpEL3dkbE5EbW0xQmRpT3Vk?=
 =?utf-8?B?MWhNL3N0SFU2cWc5TTMzeVFnbTc2NGFqaUhKMStFS0xzVExFc1V2STBUSmxo?=
 =?utf-8?B?NjJtamt5YmpRajBzeE8xaTgyWENNcnFkQmlNb0pkd215Yk1QRURydUhrelRD?=
 =?utf-8?B?TjEybDVTOENIcDV5QzkvOTh3T1NWcW05TXFrdzdsNlRaR2s3YkliUld1bWJU?=
 =?utf-8?B?Yk90MjZwOXFCbXVCcUVMQWlZVHZEUEQzbHpaMUxrQ2hRUkM1cCtYV293TUpS?=
 =?utf-8?B?K0tPOUpvem83QStwdEcrSC9KNEpaalpOenZqRk9Ec1c2b2hraUVxMzJWS2VP?=
 =?utf-8?B?MHd0NTc3dTZZdmVkWkgwKzJNcGFWcm5MUHJpRTRhVEc5R1hORUNxam4ranJu?=
 =?utf-8?B?VGVKc1VGL1JqUjhKc0lZVHlTMFNhM1NPTnNWK0NwRXdRcklUZ2xzZkxoMkN5?=
 =?utf-8?B?S1E3ZTlXN0FPMTBkaGJwNTZjbWdSNksrNGNtU0pLSnE4Qm41cmlMVmxuTG9K?=
 =?utf-8?B?eHNZNEdMRTJjNHpNaUJadWRuQ280SHFwenF5ZWxNRU1mN1NEWDN0endNdldO?=
 =?utf-8?B?SXhSVXp6OWhSRVJMSHdra2VoVTh5aHhheDRvZVJRWWdjNkpNczBjcVZ3c1JW?=
 =?utf-8?B?T2ZjaUwySmtvRTdLcENETjJGQk1QSDZBeDU2Z3VWdlNFRHY0Q24wY0JobFJV?=
 =?utf-8?B?eks1UUwzVmcvOStGdkJnTTl2QWFIbFVxRmRDdktLdzlSNSt4STk0VHNmWkts?=
 =?utf-8?B?T2ZySDBOcFVwd3kxZnMzdWlwcTRESVp3SjFRMnpoRGlEWGU1N3BvSkw2eVAx?=
 =?utf-8?Q?21CDY3h7+MJcwIjDPt5HcZcnmmmRc0dCqMsog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cy94eUN3YmRZSXhRTmkrSmVlUEc2T0s3THNKOUdxNk1Fb1JjSDBOMW1JVEVM?=
 =?utf-8?B?UGNQUXNES3p4Q2dOb2QwQ1ZyMzBCbnVHOUVqaHprZnNPR0l1UEFrYUpCbTVL?=
 =?utf-8?B?eDlNU3FXeVdxMGRZVURxRVEvL01ISXI3QldaV2tWMW0rSzZESUNBRDN5VStV?=
 =?utf-8?B?WVlPRzNsTWRSWHBoZ3RmeHYzN05WcTZVWGtHNk1nam50Vm1vN2F0dFQvOVl5?=
 =?utf-8?B?NHExZ1dLZkNxaHVZY2l2TFBYV3FpVFJxQXJXaHdZMkJlUURuZjNPUk5GWWsx?=
 =?utf-8?B?OFVDdGRuejY0cFk2cGVldjJSY3MyM29icmc5S0E0R0IydVJBMTgvYytMM3Ev?=
 =?utf-8?B?dTY4YWYyT1dDTVcyZTNVNnlXZkErSWlCc0t4UHBidVdRRjRtalRSNE5yTGNJ?=
 =?utf-8?B?aHJJLzlsZ2dpK2xSaHBWN1c4anZGTDVPKy9uM1hjeURBdlVyUEJQbzFNdUY3?=
 =?utf-8?B?a1UxMGIwWnBISTBaNWxvcENWR0tIOXo2cU5aUUtOZ2p4MkNGc09MYnZyRVR5?=
 =?utf-8?B?OGJUZEIvSmhPYjBSRlVyU2NCZUowb2Y5VlBxSWtmM0ordE41UitxNkdkWUxo?=
 =?utf-8?B?c0trbXAyaEVIWEg2MGI1cXQrNnI4YlNlYnhQVjZwZFRvbjh3WmROdGIyeVll?=
 =?utf-8?B?ckNiL3MvNWFiZUVnUVhkeUg1akVMbllTMEF1UjVJVjNkaHlWcEdZOWZPbVpF?=
 =?utf-8?B?WndXZjNRd0tKQmZZUHpkOU41eFhUc1gvVFcxUkZwalF2R1E2SXdkTlB0M2ll?=
 =?utf-8?B?SGt5SmdvdlJoTlpSVHRaY2M3WmVLY3ovVTZMM2E2OFdVQktpQ1VhM3M3QXph?=
 =?utf-8?B?eDRSektqZ25GVmhBNXZySmxjVGNrVXc3Tm9PVkxlclR2SzFJSlRKejZhZkhP?=
 =?utf-8?B?WUFicVdCWmEwdDRvUnZGejRsTis3M1NoZEdia0tZamFPWS81eDViT3FWUDFP?=
 =?utf-8?B?QWJBZS9iMHRaelU1QkxCMENmdWVZcjZBZm0vMkNZVjJBSlRkYjlxRWV4aVRo?=
 =?utf-8?B?T2srNWIxenpRc3lIT3FtSFoycmV0cWNISXBuYlM4YzhmOWlyc1ZzQTVjVVJ0?=
 =?utf-8?B?WGtzejdXK3pqTm5pZTVrQmtzbTBrY3dEZEI0VHI4U2VCTEh2MmtuT3RIayty?=
 =?utf-8?B?WUtGUXNVZTBjU0VhNTd2N1VHWUVYb3Yzdzg3ZXhQM1hKZVRZZER2VGxzNXc1?=
 =?utf-8?B?QWI4N2lEbE9VYzVmKzdXOW1zOHZJbEhNRUJEdmJmZForZW8remZjUnJ6ZFds?=
 =?utf-8?B?dkp1ZzVRL1pJcCtVdTN4NlYrMGJSNlJ3Z0RFbTlnMlg3MVhreHcyS20rTkJU?=
 =?utf-8?B?UE45NStBcFRSaFc5NUliaHB5b1NLaHBRWUYreGh1b2pOU3VQMjJkdS9tcGlh?=
 =?utf-8?B?Z0VZanVSVERWeXJERnVaWnk1VGJuRTBJVFBxbDhpVldEN0VjZlAvck1zNElY?=
 =?utf-8?B?elZWYlEydityMlBqNzRwNlRQdUxBd1Y4bXB2MVdzVW1IeWZ5WHhHWXQ0TlF5?=
 =?utf-8?B?cXh5cWpubnJSazJhZGEzRGN3SlliSGFaellHY0doRHhhcEtRUzVxbTFmNU9p?=
 =?utf-8?B?djI2SFJHeFpSbHphZEtORWsrWUhGaVhLT1VWNlBZc3VCSlV0eHlFc0lPSVlz?=
 =?utf-8?B?MHRoaTRRaTcwc1dxdHVYRUc5eG1wRjF2WERVUWlvTzduRDE3Y0hJeURPemU5?=
 =?utf-8?B?dktqakpRTndWWFdEbEJBSXl6Qm1MMDRxU2NtQWt2d0NneDZnUGpuQStudVVZ?=
 =?utf-8?B?RWh3aHR6N0hmMlo4Zi9mN0xwNDhVaThTVlVicHA4NktkS0hMSUpsR0VScjhG?=
 =?utf-8?B?c0V1S1FEZWh4VlorWU5aNjZVbUp6MXhqcmtvalRDSllqdGMwaGdhV0xiNXlX?=
 =?utf-8?B?ZS9wSno4NnVSSXZzb3hRdkZCUEhkK1k0L3ViNlhTY2lkQkJCc0FzWm1nNzJu?=
 =?utf-8?B?bTgwYkJJNGlmc2Z2M2tuUlluZHo4TnFibzVkTFVKZFdZS1pZR0dpNUJkTmdj?=
 =?utf-8?B?S3pvZFFCbXUxZTQvbUJVbDJrRzltaldHbjIzS1lvOEJSeDI5Q3BsdVpPSC9l?=
 =?utf-8?B?Z3RDSHljNGhiMDZBQ3JNU3BNS2NQN0dqSjhwQTZ3Y3cxanhlSkdRb2dLSG0z?=
 =?utf-8?Q?7jrLuuvwEI32fWXAZFBgm9je/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6c4b20-9ce1-4536-088e-08ddf7c02603
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 21:04:40.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nzgw//D82FmjMpre7Hwe/owubGsHBEw1KZmCPhLP3TFWDv6AAm/QiZvvf56ey2kYmthIqODWIEx+jOa6nZLjzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454
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



On 2025-09-17 15:49, Melissa Wen wrote:
> 
> 
> On 12/09/2025 15:50, Harry Wentland wrote:
>>
>> On 2025-09-11 13:21, Melissa Wen wrote:
>>> Don't update DC stream color components during atomic check. The driver
>>> will continue validating the new CRTC color state but will not change DC
>>> stream color components. The DC stream color state will only be
>>> programmed at commit time in the `atomic_setup_commit` stage.
>>>
>>> It fixes gamma LUT loss reported by KDE users when changing brightness
>>> quickly or changing Display settings (such as overscan) with nightlight
>>> on and HDR. As KWin can do a test commit with color settings different
>>> from those that should be applied in a non-test-only commit, if the
>>> driver changes DC stream color state in atomic check, this state can be
>>> eventually HW programmed in commit tail, instead of the respective state
>>> set by the non-blocking commit.
> Hello,
> 
> I'm not sure if this series was already applied somewhere. I don't see it in asdn.
> 

Applied. It should land soon after going through our CI pipeline.

Harry

> Can someone double check?
> 
> Thanks,
> 
> Melissa
> 
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
>>> Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v2
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 ++++++++++++++-----
>>>   3 files changed, 66 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index f6462ff7251f..50b3bd0e32dd 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -11118,7 +11118,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>>>       if (dm_new_crtc_state->base.color_mgmt_changed ||
>>>           dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
>>>           drm_atomic_crtc_needs_modeset(new_crtc_state)) {
>>> -        ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
>>> +        ret = amdgpu_dm_check_crtc_color_mgmt(dm_new_crtc_state, true);
>>>           if (ret)
>>>               goto fail;
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index ce74125c713e..69125c3f08d5 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -1041,6 +1041,8 @@ void amdgpu_dm_init_color_mod(void);
>>>   int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
>>>   int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>>>   int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
>>> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
>>> +                    bool check_only);
>>>   int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>                         struct drm_plane_state *plane_state,
>>>                         struct dc_plane_state *dc_plane_state);
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index c7387af725d6..427bf8877df7 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -566,12 +566,11 @@ static int __set_output_tf(struct dc_transfer_func *func,
>>>       return res ? 0 : -ENOMEM;
>>>   }
>>>   -static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>>> +static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
>>>                       const struct drm_color_lut *regamma_lut,
>>>                       uint32_t regamma_size, bool has_rom,
>>>                       enum dc_transfer_func_predefined tf)
>>>   {
>>> -    struct dc_transfer_func *out_tf = &stream->out_transfer_func;
>>>       int ret = 0;
>>>         if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
>>> @@ -885,33 +884,33 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>>>   }
>>>     /**
>>> - * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
>>> + * amdgpu_dm_check_crtc_color_mgmt: Check if DRM color props are programmable by DC.
>>>    * @crtc: amdgpu_dm crtc state
>>> + * @check_only: only check color state without update dc stream
>>>    *
>>> - * With no plane level color management properties we're free to use any
>>> - * of the HW blocks as long as the CRTC CTM always comes before the
>>> - * CRTC RGM and after the CRTC DGM.
>>> - *
>>> - * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
>>> - * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
>>> - * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>>> + * This function just verifies CRTC LUT sizes, if there is enough space for
>>> + * output transfer function and if its parameters can be calculated by AMD
>>> + * color module. It also adjusts some settings for programming CRTC degamma at
>>> + * plane stage, using plane DGM block.
>>>    *
>>>    * The RGM block is typically more fully featured and accurate across
>>>    * all ASICs - DCE can't support a custom non-linear CRTC DGM.
>>>    *
>>>    * For supporting both plane level color management and CRTC level color
>>> - * management at once we have to either restrict the usage of CRTC properties
>>> - * or blend adjustments together.
>>> + * management at once we have to either restrict the usage of some CRTC
>>> + * properties or blend adjustments together.
>>>    *
>>>    * Returns:
>>> - * 0 on success. Error code if setup fails.
>>> + * 0 on success. Error code if validation fails.
>>>    */
>>> -int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>> +
>>> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
>>> +                    bool check_only)
>>>   {
>>>       struct dc_stream_state *stream = crtc->stream;
>>>       struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>>>       bool has_rom = adev->asic_type <= CHIP_RAVEN;
>>> -    struct drm_color_ctm *ctm = NULL;
>>> +    struct dc_transfer_func *out_tf;
>>>       const struct drm_color_lut *degamma_lut, *regamma_lut;
>>>       uint32_t degamma_size, regamma_size;
>>>       bool has_regamma, has_degamma;
>>> @@ -940,6 +939,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>       crtc->cm_has_degamma = false;
>>>       crtc->cm_is_degamma_srgb = false;
>>>   +    if (check_only) {
>>> +        out_tf = kvzalloc(sizeof(*out_tf), GFP_KERNEL);
>>> +        if (!out_tf)
>>> +            return -ENOMEM;
>>> +    } else {
>>> +        out_tf = &stream->out_transfer_func;
>>> +    }
>>> +
>>>       /* Setup regamma and degamma. */
>>>       if (is_legacy) {
>>>           /*
>>> @@ -954,8 +961,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>            * inverse color ramp in legacy userspace.
>>>            */
>>>           crtc->cm_is_degamma_srgb = true;
>>> -        stream->out_transfer_func.type = TF_TYPE_DISTRIBUTED_POINTS;
>>> -        stream->out_transfer_func.tf = TRANSFER_FUNCTION_SRGB;
>>> +        out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>>> +        out_tf->tf = TRANSFER_FUNCTION_SRGB;
>>>           /*
>>>            * Note: although we pass has_rom as parameter here, we never
>>>            * actually use ROM because the color module only takes the ROM
>>> @@ -963,16 +970,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>            *
>>>            * See more in mod_color_calculate_regamma_params()
>>>            */
>>> -        r = __set_legacy_tf(&stream->out_transfer_func, regamma_lut,
>>> +        r = __set_legacy_tf(out_tf, regamma_lut,
>>>                       regamma_size, has_rom);
>>> -        if (r)
>>> -            return r;
>>>       } else {
>>>           regamma_size = has_regamma ? regamma_size : 0;
>>> -        r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
>>> +        r = amdgpu_dm_set_atomic_regamma(out_tf, regamma_lut,
>>>                            regamma_size, has_rom, tf);
>>> -        if (r)
>>> -            return r;
>>>       }
>>>         /*
>>> @@ -981,6 +984,43 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>        * have to place the CTM in the OCSC in that case.
>>>        */
>>>       crtc->cm_has_degamma = has_degamma;
>>> +    if (check_only)
>>> +        kvfree(out_tf);
>>> +
>>> +    return r;
>>> +}
>>> +
>>> +/**
>>> + * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
>>> + * @crtc: amdgpu_dm crtc state
>>> + *
>>> + * With no plane level color management properties we're free to use any
>>> + * of the HW blocks as long as the CRTC CTM always comes before the
>>> + * CRTC RGM and after the CRTC DGM.
>>> + *
>>> + * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
>>> + * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
>>> + * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>>> + *
>>> + * The RGM block is typically more fully featured and accurate across
>>> + * all ASICs - DCE can't support a custom non-linear CRTC DGM.
>>> + *
>>> + * For supporting both plane level color management and CRTC level color
>>> + * management at once we have to either restrict the usage of CRTC properties
>>> + * or blend adjustments together.
>>> + *
>>> + * Returns:
>>> + * 0 on success. Error code if setup fails.
>>> + */
>>> +int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>> +{
>>> +    struct dc_stream_state *stream = crtc->stream;
>>> +    struct drm_color_ctm *ctm = NULL;
>>> +    int ret;
>>> +
>>> +    ret = amdgpu_dm_check_crtc_color_mgmt(crtc, false);
>>> +    if (ret)
>>> +        return ret;
>> Thanks. I like it.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Harry
>>
>>>         /* Setup CRTC CTM. */
>>>       if (crtc->base.ctm) {
> 

