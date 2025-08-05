Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD403B1BB81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 22:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3AF10E0A1;
	Tue,  5 Aug 2025 20:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iBQu7+Og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457110E0A1;
 Tue,  5 Aug 2025 20:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjIq9aJ53x8xqBwjGTrCxP7Tljh1H3n4NEKXGdguLPQ+SWILzwxvfNpWLdHz50UvqrQ0J+kzcSibv0zAm/hX7hvbzl95GhFI199M2YOKchNTSVS/riKaRcOg2YF8tSlaqSDEj6KqAXjVQbveJSQmkiCrZVKvRpOEN+RJAYB6Y+a0glNh1awaQ9+PWQ3d8m1L23oPieuJ5a4vApohUVE4S3TqAmPDjLClwXd4zfmhahAYt9Mf5e4o5lko9Gf04I4hyP4ZZCfS9APiAsrs9XnErsLNsnJMKqrB4BDmYYuB/oHtthYbJNNqJ7NDgSPvL90TAtsLg3AU/1otYv8Hpjk9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P10MeWNSIk7uAdOEVvaokzcz3eLh4g+AFw2GN+D0Ha8=;
 b=jXT/N/sMbqGggYyaUbqwFTfTqk5KJnPKBo2TnTj/OHVja1Wol4us92K+CGilhbOyk7gGImPmkmZLstQx29Gj1GYbojaT6moY5D3zGo0SAgfa6qOzNCwj5Z6XZM8moIOxrC5p8v+sDvXhdTu3G3w4JEjMs7ZLyps4vjdCXd8SWHbobkMuVbZCffSbM5SUBCpxYnwQ8HMb/BRMYViptEePUUeWgTEQuQpIGFzjntPDuuhkYINej/OG7tPV0TcRSXY2OMISBtxkoG1x36Djg7PpHwVVER9td4XDDqIg2vSZ4dw+qOsOCprxjgC7vAKNYSib+Ty1QCWa5EncvZ3AbepltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P10MeWNSIk7uAdOEVvaokzcz3eLh4g+AFw2GN+D0Ha8=;
 b=iBQu7+Og+n1IuaJF+pAyGZo+7gWTVs4UwirN1MHqjLxX15VdLTWx8FQ67OqU/dRQo+oxU4bKBVj2XE1VY12aVDKXM+BiObolGEOIHWKGaSrqdrg/keVLqwTXimdUJsLneUBbCp/+LS84jcZLuAgB3/eom+flhcpUcT8IEQkxuwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW6PR12MB9000.namprd12.prod.outlook.com (2603:10b6:303:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 20:41:20 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 20:41:20 +0000
Message-ID: <c19bfa2b-12a4-4545-b6d5-1ab0c8b829b3@amd.com>
Date: Tue, 5 Aug 2025 16:41:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "McRae, Geoffrey" <Geoffrey.McRae@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
 <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
 <103de0a1-22bd-4389-9f5b-c1283497387c@amd.com>
 <d9ccf4e8-afed-4206-8f5e-b9e2bc02dae0@amd.com>
 <BL1PR12MB51449F87DEA24FCA2F225859F722A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <BL1PR12MB51449F87DEA24FCA2F225859F722A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW6PR12MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e9c4d8-dd0f-4ee6-7adf-08ddd4606eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0Fpb2VBV0k4VW9SOHg2bGJvMUsrbHY4R1JydXRIUnN5eUdjQnJWU0lOZEtO?=
 =?utf-8?B?b0Z4OTE2RDVMMUMyR3BwemJobkl1L1hPa2QzUkhPTHFjbnhjVVZNalhyQnYy?=
 =?utf-8?B?Z1hRNFcwQmdyRmRqY0RFQXNhMHRvemVlY2NyYTdXcWZVaHRmUEVPRS85K0FL?=
 =?utf-8?B?UzBMeGMrcCtrbUN3VXRGY1dNUCtrYWdtK1EwWFBVampyL2ZVL09tT0ExQ2hh?=
 =?utf-8?B?Tk5tbUppTTEzMU9jWkFLM2pCdkN6cjlJeU9QV1RtZXlxNnZvMlQ3MU82WjVa?=
 =?utf-8?B?SFJxTVI5R0FrZ2I5UWJiaVEzNjRvc2QwOVcwOWFHSFh0Q0tvVGdkMkx0Zjlm?=
 =?utf-8?B?cHZZaERkV2tLNUdScGNYN3dIVWV6dW5aaG5Pay8wZDI4K0pqSXFub2NvZmZW?=
 =?utf-8?B?Y2UxdDBQNUxBQlpEcGI4RXl4bmZtbURZeWwxRjd3aE1HcmFPV0RxUTVZYlp0?=
 =?utf-8?B?aHFZWjdBdHJQb2tmTVd3elBQa2FVL2M0Ym4rYm5TcG94U2NkM1ZrV3RCZ1I2?=
 =?utf-8?B?bnhoVGYyc1NkU3dHM0QwVEU2dGV5VXdXaDlrYW12bW1TTld3YWMrOHFqNnQ0?=
 =?utf-8?B?OW1IUzA5a09TYi93WWpEaGNnT3Uza1hsR3U1bEdXVUhrejZQWDhzaWpnbndU?=
 =?utf-8?B?cXMvTk9ZS0dNcnFyOU00N05aWm1YQmFrVVI3VjA3SHc0NTZ0Tkt3NHBxNnI2?=
 =?utf-8?B?K2hQQlZXck9wMUV0QmZGUW1lSCtSUDRPMlc5MmdDSnNicUZUUVhaV3NRMkNj?=
 =?utf-8?B?b1dtenZQcWJoQ3M3elE0bHpzcEJVR3pEQVUxOG1yL2FxWHhFQ0s2QWJ2SDQ0?=
 =?utf-8?B?dTVVcko0dUk3WDJYeHFRZExLYis3Szlpam9NaVRoYTJOZGwveEFtZHpNZGxr?=
 =?utf-8?B?L2RpeHY4c0tJa3FVeS9GYnQyS3pKdFpIWlVVZC9UV2ZLNmwvb0UvUExhbWdE?=
 =?utf-8?B?bFJmWVk4WWJ6dWxzYTltWHFCa3VsSEw1NFFVaVMyaVhHU0phWHRVK1BWZjlE?=
 =?utf-8?B?cWp6NzdxUlhPOHpFZ0hLUGZkSXlzKzM5OFZxWkxsVjJkdWF1bXZubHN1MDVa?=
 =?utf-8?B?aERacUZJSXFqZUVDdXBCaFlQWlBreDRBZWJ6VFBpOFRVdnJ5Y3lLNi9UL1Rp?=
 =?utf-8?B?bURpbFNFUmxhNmgvZkFTSVVjV0FxUEYzZFdsUVBpZG1SUkY3d1dhcjhjTnRw?=
 =?utf-8?B?RCtLd08vREQwOFkwRTh0OXdTcmEyQXRYSjR6MW9qQlNQRkxGbEtmSXI1cTVV?=
 =?utf-8?B?S3ZLRUZBZVc0MDFHc3B2TFM1Uzk3NVJtRlRXVk81T0lsWGVOcVowcHVhVzVm?=
 =?utf-8?B?UkJxMHJGT0JpZlZyaFFNT0dDRWdGQjBwY0krTzN6UDdwZEExTGExUUhSU0dC?=
 =?utf-8?B?T056Mkh0ZThYSmt2WURHZXRWQTZkdjhxZG10Q3EwZFJIM21XZEpVS3M1UHcr?=
 =?utf-8?B?VGtockhHTXNqczlTZGttdnRUdWE2YnpJN2YvVVRCUisxYUVQcTFpbG5kdlRt?=
 =?utf-8?B?OFRBVklMQ0xscGMvRUJhU094VTFPUlQvL2tJcUwwV1dhaEYvdUZlaXRtdUFa?=
 =?utf-8?B?Qm9Sc21EVG1HZnh2R1RZbWlwQU9LcGxKdEg4WXVxMUR2R2lLMlZTV2dxN3VB?=
 =?utf-8?B?TFdTTDZZT3JNbWVFN2JpTjQ1Umx0UllNN3lWaGhPdHI2S3ZNRnArMjVGUXhT?=
 =?utf-8?B?dGI5clB5UlBVZnczVFZiOHpCZ1VqcUQyOHlVblI5NXpTV3E0dXUxSWY1aEdI?=
 =?utf-8?B?dW42bGFMOWM5MHJILzl2RGRhYkFZRGhNdGtwR296SzlrM0ppcEV4ZmU4aXJn?=
 =?utf-8?Q?qHsGWziybPcCagTVncCn60sfvOChEZ4ghQyxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhFTWJJaHpHYmRFY09RalYraWt0M3owODRVUWUvWWpYUVJkaUJEbld0c1BC?=
 =?utf-8?B?TzFRRjc0REhVazVxK0ZRdGtsLzBCWWpNcjVBRjhyd3hwcWp4TWlmblByNjJY?=
 =?utf-8?B?NGw1UTRlSm5FdVd6eW9nYXlXcUp0TStJVzhBM282OWdQRkdkTGlETklQb3dU?=
 =?utf-8?B?aHFncmg2RjhNQTdOb3o1Wm4zckpBcU5sL25QNU9LMTlyWmsxOXNCM1dodUph?=
 =?utf-8?B?YjQ1MGg1TjdOZEhTK0JIR0VQMURxdjV5OWZWM1FIMURBMDcvc3kyaHZIZ1Jt?=
 =?utf-8?B?Y0wydDVIWDdTNHVFOFpNcktWT2JiUmF0ZU5rU295Qzh5VGtJbVJnSjhhb3Bu?=
 =?utf-8?B?Ni9Ia1loRFpWSXVjY1BtNTYwSVc5cGVlRFQyZmZnbnZ4RDdHRVRhUmxzS1Nk?=
 =?utf-8?B?Ui9BZnU4YUpwRkZ6czJnTE5oc2kzaXpFYnUzOUVIY3ZnT2F1citKWGNkRVFD?=
 =?utf-8?B?UUd2MFVPZHA5WVpaV09VNWZ6YkloNGprK1UwL0xXSGY3WmtaT3NiTHlsa1lp?=
 =?utf-8?B?TXdpUEVYR1FJU0FZZzVuS2k5Z0JIVXlHM0xMdDUxVmNVSDBHc1BhZk1LaG8r?=
 =?utf-8?B?a2NIWjUwUmt2ZS9nY052YmlmY0d3UU1oWENOSWdlZUNCMUk0Vi8vVzJDaE80?=
 =?utf-8?B?THgxeURYUUc2VTBCeWovZnRyaytrbVRxbHdJK2UrcUcrakFDSUZZeTk4TE5X?=
 =?utf-8?B?U1hOdVNnbnFoK2JtWFZKcENVa0N5SzNQMTBJZXBwd29KR0lDdktOUlB5NTls?=
 =?utf-8?B?WDFENE9jaGlqNldUVUxHTlZmemdSMFdmelBGUTRmWlBFTFYrcnBKeHByM3hy?=
 =?utf-8?B?ZUt4Rm1KbXVvYlFQNFJaSm1tdU5IQnJ5bU8xbWdEUitGdmJBVE42Tkh3TTZ6?=
 =?utf-8?B?bFV6NlVIdDMwNG9RQVp0RldLRnVVVGhYNmhuNnFTTUdzdGh3R3ZnOCsybzdp?=
 =?utf-8?B?OGZJL1VVUnZMd0M1VXdZUVY3WXY4RUUxT1MwSVJ5WW9NNHY3WEpmOUNZcnkz?=
 =?utf-8?B?VUNLYkYvcHhEV0FUQTB1Rm9NUDdqcUlSN3NCMVFZNkREeVRONWhKUC8wcXgv?=
 =?utf-8?B?eVpaWlN2NXFQWUx6b0Y2NXZib1daRWtycEdnQWNwb1ZzR0VFYTJFd1VDdXZh?=
 =?utf-8?B?VDBLdmZNdGZtWVpMMlN1bENaWitiYy83aGNaSTJuNVlMMzFaSGFVSG5LVktN?=
 =?utf-8?B?V1hQNGdUazRKQWJSaG51c0JTT0VzdVVBZWNMbkJXMmJEVmZVTmhnUmNEYnFa?=
 =?utf-8?B?d0xPb0xESFhrb3FJdWFMczU3TTRCZlIxYVVaOVNoN21oYzZPVVdFUVc3cnJR?=
 =?utf-8?B?UWt4R1lJVmEveTRub3pteitxdFV6aGpKMHhBOUNPcDFIdzVUR09oSkFuZ284?=
 =?utf-8?B?QW1ybEVRQXVRU3NjdjRaMmdZT2RuZEFIdncwaHVRdjZMQjN3azMxcjdoandC?=
 =?utf-8?B?ZmwzdlpleHc1NWlxZVJ0djFPT0duc0w5elVtSkEyOXdpL3hCYTYzYndGVWJK?=
 =?utf-8?B?SmpTZEVLQ1JXM1NRQ0JPUWhhS2YrZThRU2hFZmhYM0VRM0E2L2VzNGFmTld6?=
 =?utf-8?B?VVBUVjdRdEpWOHdSMzNOWk1JY1labHVtWFJENGpmMmU2MlNBdVJLNkZwUnBo?=
 =?utf-8?B?dEV6Tmd5SUx4TllpQ2tsdnF5eld0WXBJR3puMlBsQlF3UnZIQitRRVJLNVM1?=
 =?utf-8?B?V2gwYUU1TFIrdXhrT25MaTZZTVNLS2ppQTlJMm5zdlVhRFVHUURFVUR1MDhu?=
 =?utf-8?B?aHdISmlvbTBSV1ZJeHlnTk9HenM5aVVPOCtEbFZiV3JxTHlheDRtOU9naGtk?=
 =?utf-8?B?NzVTTzVQcU5RZXl0VnphNjhLcWRESWV6SVpZMU12dzJNS1hFeW9nTnJndGpG?=
 =?utf-8?B?N1l5Q1RMT3F4dGp5c0lYYmdDanZlQzRtclF4OSs5NzBWeDFVaGdmdHBpTFRy?=
 =?utf-8?B?Rks5aWtXdFlCVWxyaVN0NU14LzRjanF0V1cwRythUktNQ0VoZW04QjZoZ0R4?=
 =?utf-8?B?Qnp0YmFHc1hxaFkvYk1yekp1SERINDE4NUpJWlA1ZUwxYk9XQlppUHNtL2hS?=
 =?utf-8?B?ZDM4TDNEbm9pZVVwLzdZaHcvMmJSR0tQQis5clhjWUFYbVRKOStPWnBpV1VH?=
 =?utf-8?Q?Z0WgVgmDKYKR4ijxaUO0HKocm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e9c4d8-dd0f-4ee6-7adf-08ddd4606eed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:41:20.2453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGSmmh1HWIaDbeq+jBygNy4mpC05cZzgyPJORgcdaEFc3kKDjz/J0Z7ZjSaovvRy9r104+kMIxPzNFFsmgjYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9000
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

On 2025-08-05 15:56, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>> Sent: Wednesday, July 9, 2025 5:02 AM
>> To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; McRae, Geoffrey
>> <Geoffrey.McRae@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
>> IOCTLs
>>
>>
>>
>> On 7/9/2025 2:09 PM, Christian König wrote:
>>> On 09.07.25 06:56, Lazar, Lijo wrote:
>>>> On 7/8/2025 8:40 PM, Deucher, Alexander wrote:
>>>>> [Public]
>>>>>
>>>>>
>>>>> I seem to recall -ENOTSUPP being frowned upon for IOCTLs.
>>>>>
>>>>>
>>>> Going by documentation -
>>>> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html
>>>>
>>> Good point.
>>>
>>>> EOPNOTSUPP:
>>>> Feature (like PRIME, modesetting, GEM) is not supported by the driver.
>>>>
>>>> "Note that ENOTTY has the slightly unintuitive meaning of “this IOCTL
>>>> does not exist”, and is used exactly as such in DRM"
>>>>
>>>> Since KFD ioctls could eventually be supported in drm node,
>>> That's certainly not going to happen.
>>>
>>> We are currently in the process of deprecating the KFD IOCTLs and either using
>> the existing DRM render node ones or coming up with new IOCTL/additions to the
>> existing ones.
>> I really meant to convey this to justify using drm documentation as the background
>> for picking error codes for KFD ones also. At least for any new error code returns,
>> definitions will remain consistent across both.
> In this case, I think -ENOTTY makes sense per the documentation.  Patch is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

I agree.

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


>
>
>> Thanks,
>> Lijo
>>
>>> Background is that some of the KFD IOCTLs have design flaws which are unfix
>> able.
>>> Regards,
>>> Christian.
>>>
>>>> it seems
>>>> better to go with ENOTTY.
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>>
>>>>> *From:*McRae, Geoffrey <Geoffrey.McRae@amd.com>
>>>>> *Sent:* Tuesday, July 8, 2025 5:13 AM
>>>>> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix
>>>>> <Felix.Kuehling@amd.com>
>>>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
>>>>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for
>>>>> unsupported IOCTLs
>>>>>
>>>>>
>>>>>
>>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>>
>>>>>
>>>>>
>>>>> I am happy to use EOPNOTSUPP but I must point out that this is not
>>>>> the pattern used across the kernel, the standard is to use ENOTTY,
>>>>> which is also the default that fs/ioctl.c returns when no handler is present.
>>>>> Userspace tooling such as strace and glibc specifically expectect
>>>>> ENOTTY to indicate invalid or unsupported IOCTL.
>>>>>
>>>>> --------------------------------------------------------------------
>>>>> ----
>>>>>
>>>>> *From:*Koenig, Christian <Christian.Koenig@amd.com
>>>>> <mailto:Christian.Koenig@amd.com>>
>>>>> *Sent:* Tuesday, 8 July 2025 5:01 PM
>>>>> *To:* McRae, Geoffrey <Geoffrey.McRae@amd.com
>>>>> <mailto:Geoffrey.McRae@amd.com>>; Kuehling, Felix
>>>>> <Felix.Kuehling@amd.com <mailto:Felix.Kuehling@amd.com>>
>>>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
>>>>> <mailto:Alexander.Deucher@amd.com>>; amd-gfx@lists.freedesktop.org
>>>>> <mailto:amd-gfx@lists.freedesktop.org>
>>>>> <amd-gfx@lists.freedesktop.org
>>>>> <mailto:amd-gfx@lists.freedesktop.org>>;
>>>>> dri-devel@lists.freedesktop.org
>>>>> <mailto:dri-devel@lists.freedesktop.org> <dri-
>>>>> devel@lists.freedesktop.org
>>>>> <mailto:dri-devel@lists.freedesktop.org>>
>>>>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for
>>>>> unsupported IOCTLs
>>>>>
>>>>>
>>>>>
>>>>> On 08.07.25 06:22, Geoffrey McRae wrote:
>>>>>> Some kfd ioctls may not be available depending on the kernel
>>>>>> version the user is running, as such we need to report -ENOTTY so
>>>>>> userland can determine the cause of the ioctl failure.
>>>>> In general sounds like a good idea, but ENOTTY is potentially a bit
>>>>> misleading.
>>>>>
>>>>> We usually use EOPNOTSUPP for that even if its not the original
>>>>> meaning of that error code.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com
>>>>>> <mailto:geoffrey.mcrae@amd.com>>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>>>> index a2149afa5803..36396b7318e7 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>>>> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep,
>>>>>> unsigned int cmd, unsigned long arg)
>>>>>>         int retcode = -EINVAL;
>>>>>>         bool ptrace_attached = false;
>>>>>>
>>>>>> -     if (nr >= AMDKFD_CORE_IOCTL_COUNT)
>>>>>> +     if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
>>>>>> +             retcode = -ENOTTY;
>>>>>>                 goto err_i1;
>>>>>> +     }
>>>>>>
>>>>>>         if ((nr >= AMDKFD_COMMAND_START) && (nr <
>>>>>> AMDKFD_COMMAND_END)) {
>>>>>>                 u32 amdkfd_size;
>>>>>> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep,
>>>>>> unsigned int cmd, unsigned long arg)
>>>>>>                         asize = amdkfd_size;
>>>>>>
>>>>>>                 cmd = ioctl->cmd;
>>>>>> -     } else
>>>>>> +     } else {
>>>>>> +             retcode = -ENOTTY;
>>>>>>                 goto err_i1;
>>>>>> +     }
>>>>>>
>>>>>>         dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n",
>>>>>> cmd, nr, arg);
>>>>>>
