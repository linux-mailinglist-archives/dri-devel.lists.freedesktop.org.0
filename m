Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F7AFFE44
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 11:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E011A10E04A;
	Thu, 10 Jul 2025 09:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZhDYi9tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DDD10E04A;
 Thu, 10 Jul 2025 09:37:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwxBXltQF3CmzuT2udlrl1olorIWtc1mhHwVqG+s5R08LeUUDAEsBVg3ZgBWB8c4V5ESvL9BP4i/sDOvfd6/c9X728CxH9f/M1vOvOk/rDIuv1deMCq/On3Ekbo39mYrBMRJN0sWHhwmXPTem/ArTGqJWKp5m7kDUx6n2EHSZJvFBKWQJfPGQ4Q1++xcsfBa14vG+HC19VgEFdOQmlPtOFfwc7ESfbJwaJYELtm+10GefUInxtAmg4h1tFMYKdQ44MHRds9JR/S8lgr10e2JDjLIoagNNXhdYNN2O8OBjPBLv5vAMGQF7eqLacE05p6LdZh4oiA2mKa3eZ2RNv82Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u98IDitrMRAEjoRCIMXaQUBEn5nWaEQ7L/FCY2sJFcQ=;
 b=mZebYfwm4KL/5ysQ3cIWuAOznBwMvSQHrKMRec/rZc5MDFYoRilTubJCcysT7t9l4pXvMo2Sux2Lyk/oT5LN2X3NJd510ghRmqPbsljUzSHrC7hK/S4jRnbn1fwHsuiy9JnNva4VRu1vIs4at3c2upzehHsFJLxt3byM15rMESlm2IVL9njyAlJPOC/FLAAI/TZx0OW645tMIXufgi2Gnn4rKGseQwNJKagaNQNfy28aNMcIbcQmQJwOJkxZ4UBk6fd9tPNZjSmO+BmVG6P239fvphPcq7tkZmgawdnrPBLDcSMcMO4UqU++6m41+HLmw9NdfVRN1UbplgeJcyQHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u98IDitrMRAEjoRCIMXaQUBEn5nWaEQ7L/FCY2sJFcQ=;
 b=ZhDYi9tBjHEXWWt6vJS/Vhf8/BCrhcZ+56kjTVy+OXaDduaWxZwuewfZIQnkZZcdfJ8zsZDx1h+hcHRk8NNbZ1Q7s4ldPAdsAKnY9eDFpDD6I/FBY+9L9fo0MXNvwuPonxPtis80wYYqY+VDHIHkSvnJBHsYEfC0sjqt8i47kAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 09:37:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 09:37:20 +0000
Message-ID: <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
Date: Thu, 10 Jul 2025 11:37:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: e52daab2-a88d-4a04-6a58-08ddbf955d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R01HaXNoT0xlWENVMlExc1NsSUtzY0NMSjhZUGJER0Nab080eERzUTNmb0JT?=
 =?utf-8?B?RU9EVkJEdlRDdHFHL1hka0ZkVHllQklhYW16WmtvckZVakNDSVJZM1dROGlK?=
 =?utf-8?B?TlZBQTdWVGVEQ251a3N6MG0rU2JMajNWOUZVU0ZDbytSaENrenJzNEczTDYr?=
 =?utf-8?B?TjdDQ0FTTDNGUVFPSE1EcE9pUjlHSVVobkQxK2V6LzB0a2NjdW1MZi9rSTBZ?=
 =?utf-8?B?dit0bVNyMXdMa1VhdnZjMlBCV2QzaStTZCtpL3NMbktUSjNqNXlacEtMbktM?=
 =?utf-8?B?NjFPL0pPYjhkdmRjMzZJVnpNSEZnYU00R1J6QVZRQm9OS3IvQzJ3RXh1SWU3?=
 =?utf-8?B?T2ZmV0doQk0xWFNDY2NBQjF2alZNT1V5NHZKemZvNWxsVWZFRmo0TWM5TUdY?=
 =?utf-8?B?KytwbmpCRS9MQkJuNlVURnVvM3BiV3RXUjBlM1RnS01wY2pGV2plWmV6NmJx?=
 =?utf-8?B?YVJlUUsvVXdpQU1xQitGZTNLOVloK25XamRnamRRSXY1THpQVnRkMjRZN01I?=
 =?utf-8?B?WlUrS0RyMTJWQzRTL1hwcEdySUdGSkFtS2hTVVlDcnB5RGJMMHlEcmpsbjhm?=
 =?utf-8?B?cmtnVllVRjJ2S0RCVHJxeStCMjkvVWFHSjAycFFrb01iVUVpdW1JM3l6TXBG?=
 =?utf-8?B?Q0I0MVY4TFB5Tnc3ODBYazU1dHMzZnp0N1Yvb2dzWUxsSDREY3BIUGJiL2Ny?=
 =?utf-8?B?Y2J3SVVjNzB5b3VhQXJmcXo1djZnMGF6WE5hbmhrb29uSURIL0YrK2pLMkFQ?=
 =?utf-8?B?OEREcVJBbTFsaXZqMCtEYUloanlVOUw0NXZhbWJzdEQvQTBROThJL09MenR1?=
 =?utf-8?B?ZU1xMFZ4MllVbEJOQktoVkxlWEZIOU5LTU5TbHc4OUg1SlV1TXJWNkg4SjFP?=
 =?utf-8?B?c3lYSmRHUGdEUGROUmNVL05RZU53cHVydjUxbjdxUGI5OVNGZ2FyN21PUEdy?=
 =?utf-8?B?d01xbkpaek9ZZ1dKdFFPMEU2clkvR2VHQnpjY0MxSmNyS29ZRnlrMWlBdkVY?=
 =?utf-8?B?OGlGSjVjdkF2M2xBKytzQ25Mb0NueG9aTTNvOTJlWWM2ZFdVSmxoWFczaGdT?=
 =?utf-8?B?N1RhL0NYcS9OWDk2QmdCcWlKT2c0cy9WSkFoejhrL1Z3Ujl6ZG1TQXhOaUtw?=
 =?utf-8?B?MnBxYzRGVG9YVFQ2YVgxSC9oMncrOEJLbE1pSXRXRU9tOVpVUHlsNGdYKzdB?=
 =?utf-8?B?ZVdTZFpiV0xMdy9YRFJRNy9udDJISnBQUk04SGVOMVBqS285TlA1aFBFcVBC?=
 =?utf-8?B?UkVzRXNSWmQ0b3pGZzhNYUY0MXdyRkM0WWpZdXlpM3hxbmZiQ01aT2JLUTBm?=
 =?utf-8?B?T2dVT3JhdDJiZXRYNTZveU9kaDRsVVZQclRwV0RHZkVGUGZkSVd2UVk2VHIx?=
 =?utf-8?B?aFF3UkFCd2hBVjZvbk5IZUw1SmdqTkxWL29QMXRkLzI2VHRzTzU3N1gzV2xP?=
 =?utf-8?B?Kzd4dkNrLzJXV1M5ZVV0VXo2dE9LaUxuVkVQS0M0NEQxVy9OaFNzeDJCZnBE?=
 =?utf-8?B?dDgxaW4wNzQvVlc3ZVZvVE1oVGswWkEyZ2k5aUtVaXFERDlRa0Q0SkVzVUQy?=
 =?utf-8?B?THRCVHFoVURyVklPbzcvRmt2QllEQTA2VWFUR29HSXV1ZW1ETVRwTC8rZUlq?=
 =?utf-8?B?WVJaRFoydnVzcjJydGY5cjFBelUzaEtlcXp3QXpHc2ZHdVRTdHFiejZmQkkx?=
 =?utf-8?B?TmZpOG81R1dLa3pqV0xkTW9ERUVMdU9hV1lTT09DMzlZM0x6U2hLK1ZRRWlt?=
 =?utf-8?B?dzYwcm1xMGlzZzRVVENTL3dDQjN4SFVaUjFWMWdOdHhwaVQycmptQ2U3ZkZQ?=
 =?utf-8?B?VTlHa0kwZkZMQkVIYnVvRjZ2Q2xPcTB0WkFUbTRjTUxJZmdpRTg0dnNFUk9F?=
 =?utf-8?B?aVVacE1rL0VZOTdjZHlSTERmZURtMlV5cjRxdVVPTmNzZlJYVTNVeUdOSGEx?=
 =?utf-8?Q?FVRL65yM/io=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFZMMFJ0bW0yOU5pZmZ4M1FZeExCK2NIVnR5OXU3M3QyREJSRXNXMW5HbjFL?=
 =?utf-8?B?Zk1jNlFabGUzS0NocGRiOW5KWXc3ekxhRDRCeTJ6NzRLRmlrakhWb3ZIV2VV?=
 =?utf-8?B?Z213ZmRMTkxlTEdtRXRYWE13VlJ6RnJFbko3ckpKVlh3Z1p3UkV1bDN0ZGQv?=
 =?utf-8?B?bGl2Z0kxZXVEN2srYUhyLytGR25DL2JQeUVmeUNMMkt4VEEwTy93WVJIa1E1?=
 =?utf-8?B?OWxrNytSNkdESGdlNnJzQTA5T2ltNy9nU3pudTJBa3F5bnphb1plcEZoREpr?=
 =?utf-8?B?REJkNzdCY1Ywdmh0ODZyano5TXpuaUVHWGc2WGdCRzArVkVuVlBBMk84aGd0?=
 =?utf-8?B?WUxQOFB1VmR0aEN1WGlGZ2hEbGZoN2xhQ2pqNXFyZnJYU292UzRZTnVFWmFG?=
 =?utf-8?B?d1M5T1BjVUFab01ZblhyQXFqemRVNnpUSnErb2UzZUl0MEI5cEVCdjJnbDhW?=
 =?utf-8?B?dTZZKzVTUGNiaWlyZVlvUWxVZ1ViYUY1anhJcC9hMktxZEdOdXo5RkhzWHky?=
 =?utf-8?B?dnRsRUU1UEM1eVZYL29SWSs2NDlEMWlDbnZUNCtqdXZWanNOOFNHVExaT0Ra?=
 =?utf-8?B?am8rcm5hOUc3QUVaejZ2QVRtZzgvU0YxVmYzMld5Nnl2YnJRTms1NXdvM05s?=
 =?utf-8?B?dFRPNHJaTHY2MkVaYUE2eXhQd0VSVk1KT2VDNG5kRERKenQzZWdtcDh1MTR5?=
 =?utf-8?B?TVRYeThoYlBhc1dNRUR0L3JPREphWHRYYlpDZ1VmL0JPeTlDc09kTG9tc3dG?=
 =?utf-8?B?ZDhCZWlORjQrcm9HNUZHczFHeDFVRExrVTIwNkRGdlIxVXd0VzlxWnlTNXdY?=
 =?utf-8?B?ZHdSMmlycGZ6NmlyQVYxWXJqVE1hTEpSYXJMQlp1MCsveVZLWi9zVnBoNDdB?=
 =?utf-8?B?M1lHb2JvMXhnTUU3bDNCM1duYi9QaDBkbTlpM3prbE1YZzZDSkY5aDZCMXNs?=
 =?utf-8?B?MWl2SGRPV0NvWWFPK1lOOEM5SUwwQ1dPVnJnT3JXci9TL09iQ2JrV2l2NzJZ?=
 =?utf-8?B?VmV4aHZEQTh1UitEQlNpMlBwdHBWcU9xZm90YXo1SlhOVG1CTzQ0UUZSTTR4?=
 =?utf-8?B?RlZhVTZlUXh4RWJTMXBocVU4K0tLemJTVkIwcTdNNlVWeUwyRCszSzZvWXBN?=
 =?utf-8?B?K0p2S2pPV3NmYTFFdG90eFJKVWdvTmVUMzJDNyszZTIvd1lRWGVuTnJYMGlJ?=
 =?utf-8?B?cllLMW9NVlZsVGpvNHRidnRoU1VmU1NXTnhGK0F4dThsZjdFcTkvdDhHcFBB?=
 =?utf-8?B?QS8xZUx3dzVxOEwxazNpbFFGek9FWStYS3NBUHdJN05aaHord2JDK3dqZThI?=
 =?utf-8?B?ZHUzNCs0N1FQTXFvd3R0WnFLcStPQWNXSnJGUkxEUitJRW9wbFM0UWF3bU5L?=
 =?utf-8?B?YWNDbUxvc0xManVKODZ1L3hFUSttZzR6RDVWOWNRbTJpQUZaT0tCams4elZC?=
 =?utf-8?B?c2dQNHJ3M0c5VzNUa2FnaERWWlNiQk5UeFhqZFhNYnE5RW1Ud1R3UFhhMmk0?=
 =?utf-8?B?cFZsOWJ2eTBUaGl4NHZGZEdYcjJxYVRUcCtHTm5pYUY4cXJLOHdBOUhkdk02?=
 =?utf-8?B?c0wzUVNZWUMrZmRrSmN6K2tNbGpXc2MrU2o1YzZWS2p2aVo4TWxwSDZWMFdL?=
 =?utf-8?B?OFdnUjNqTkVCWmdNUE0yK2NnWVFMa0wzaGZzbll6d0pEL2pHVW5aa0s1T1VD?=
 =?utf-8?B?bXVBOW9zNmxrb3k3SDJ2YzZWTEhSMWZsZFdRTkllRWphQmVDRWkzQXBOdzZv?=
 =?utf-8?B?TGt3bEFicExhYm1CWUdyenBCMlA1d0p2R0gwSVQ0QjN5Qi90S0ZlcWpZemhq?=
 =?utf-8?B?NDBpZWtNdkwzYWVnMHNrcVZaNE5aL21EMitnb1pmL3lYbG92R1NPK09jYTVN?=
 =?utf-8?B?UnNEajZPMUZseXVWbFhMODU4Yi90SXA4Tk9JNXAzQ2xSbkIzM1JIVy8wcFYv?=
 =?utf-8?B?NmFYdk5wbnJnWGZwb1BQMENJR2h4ZU1ES0oxTzZjaGNkS0ppQ25GTjY5ckJY?=
 =?utf-8?B?SXppN09DaDQ3QkRGUFFFOENVLzlIVEJTaC9aZHoxMXRSdzl6a0Z1ODJpdFZx?=
 =?utf-8?B?YjdYUjNaZmxpeklVeEZLNWtIaUJ2ZGVLYW5IRkhPcnJ3MlpUODNkQ2tkcnM5?=
 =?utf-8?Q?vorZMAF9LUYM75NAccwaR9JFR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52daab2-a88d-4a04-6a58-08ddbf955d9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 09:37:20.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRTM5jIKmHG03gofHeUKYPO1ebm1hukPqZ4oj92r9c+YJk6C4/F6Zxd39PyrxnNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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

On 10.07.25 11:01, Simona Vetter wrote:
> On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
>> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
>>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
>>>> On 09.07.25 15:41, Simona Vetter wrote:
>>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
>>>>>> Certain errors can cause the device to be wedged and may
>>>>>> require a vendor specific recovery method to restore normal
>>>>>> operation.
>>>>>>
>>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>>>>>> must provide additional recovery documentation if this method
>>>>>> is used.
>>>>>>
>>>>>> v2: fix documentation (Raag)
>>>>>>
>>>>>> Cc: André Almeida <andrealmeid@igalia.com>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>
>>>>> I'm not really understanding what this is useful for, maybe concrete
>>>>> example in the form of driver code that uses this, and some tool or
>>>>> documentation steps that should be taken for recovery?
>>
>> The case here is when FW underneath identified something badly corrupted on
>> FW land and decided that only a firmware-flashing could solve the day and
>> raise interrupt to the driver. At that point we want to wedge, but immediately
>> hint the admin the recommended action.
>>
>>>>
>>>> The recovery method for this particular case is to flash in a new firmware.
>>>>
>>>>> The issues I'm seeing here is that eventually we'll get different
>>>>> vendor-specific recovery steps, and maybe even on the same device, and
>>>>> that leads us to an enumeration issue. Since it's just a string and an
>>>>> enum I think it'd be better to just allocate a new one every time there's
>>>>> a new strange recovery method instead of this opaque approach.
>>>>
>>>> That is exactly the opposite of what we discussed so far.
> 
> Sorry, I missed that context.
> 
>>>> The original idea was to add a firmware-flush recovery method which
>>>> looked a bit wage since it didn't give any information on what to do
>>>> exactly.
>>>>
>>>> That's why I suggested to add a more generic vendor-specific event
>>>> with refers to the documentation and system log to see what actually
>>>> needs to be done.
>>>>
>>>> Otherwise we would end up with events like firmware-flash, update FW
>>>> image A, update FW image B, FW version mismatch etc....
> 
> Yeah, that's kinda what I expect to happen, and we have enough numbers for
> this all to not be an issue.
> 
>>> Agree. Any newly allocated method that is specific to a vendor is going to
>>> be opaque anyway, since it can't be generic for all drivers. This just helps
>>> reduce the noise in DRM core.
>>>
>>> And yes, there could be different vendor-specific cases for the same driver
>>> and the driver should be able to provide the means to distinguish between
>>> them.
>>
>> Sim, what's your take on this then?
>>
>> Should we get back to the original idea of firmware-flash?
> 
> Maybe intel-firmware-flash or something, meaning prefix with the vendor?
> 
> The reason I think it should be specific is because I'm assuming you want
> to script this. And if you have a big fleet with different vendors, then
> "vendor-specific" doesn't tell you enough. But if it's something like
> $vendor-$magic_step then it does become scriptable, and we do have have a
> place to put some documentation on what you should do instead.
> 
> If the point of this interface isn't that it's scriptable, then I'm not
> sure why it needs to be an uevent?

You should probably read up on the previous discussion, cause that is exactly what I asked as well :)

And no, it should *not* be scripted. That would be a bit brave for a firmware update where you should absolutely not power down the system for example.

In my understanding the new value "vendor-specific" basically means it is a known issue with a documented solution, while "unknown" means the driver has no idea how to solve it.

Regards,
Christian.

> I guess if you all want to stick with vendor-specific then I think that's
> ok with me too, but the docs should at least explain how to figure out
> from the uevent which vendor you're on with a small example. What I'm
> worried is that if we have this on multiple drivers userspace will
> otherwise make a complete mess and might want to run the wrong recovery
> steps.
> 
> I think ideally, no matter what, we'd have a concrete driver patch which
> then also comes with the documentation for what exactly you're supposed to
> do as something you can script. And not just this stand-alone patch here.
> 
> Cheers, Sima
>>
>>>
>>> Raag
>>>
>>>>>> ---
>>>>>>  Documentation/gpu/drm-uapi.rst | 9 +++++----
>>>>>>  drivers/gpu/drm/drm_drv.c      | 2 ++
>>>>>>  include/drm/drm_device.h       | 4 ++++
>>>>>>  3 files changed, 11 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>>>> index 263e5a97c080..c33070bdb347 100644
>>>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>>>> @@ -421,10 +421,10 @@ Recovery
>>>>>>  Current implementation defines three recovery methods, out of which, drivers
>>>>>>  can use any one, multiple or none. Method(s) of choice will be sent in the
>>>>>>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
>>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>>>>> -will be sent instead.
>>>>>> +more side-effects. If recovery method is specific to vendor
>>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>>>>>> +specific documentation for further recovery steps. If driver is unsure about
>>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>>>>>>  
>>>>>>  Userspace consumers can parse this event and attempt recovery as per the
>>>>>>  following expectations.
>>>>>> @@ -435,6 +435,7 @@ following expectations.
>>>>>>      none            optional telemetry collection
>>>>>>      rebind          unbind + bind driver
>>>>>>      bus-reset       unbind + bus reset/re-enumeration + bind
>>>>>> +    vendor-specific vendor specific recovery method
>>>>>>      unknown         consumer policy
>>>>>>      =============== ========================================
>>>>>>  
>>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>>> index cdd591b11488..0ac723a46a91 100644
>>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>>>>>  		return "rebind";
>>>>>>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>>>>>  		return "bus-reset";
>>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>>>>>> +		return "vendor-specific";
>>>>>>  	default:
>>>>>>  		return NULL;
>>>>>>  	}
>>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>>> index 08b3b2467c4c..08a087f149ff 100644
>>>>>> --- a/include/drm/drm_device.h
>>>>>> +++ b/include/drm/drm_device.h
>>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
>>>>>>   * Recovery methods for wedged device in order of less to more side-effects.
>>>>>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>>>>>   * use any one, multiple (or'd) or none depending on their needs.
>>>>>> + *
>>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>>>>>> + * details.
>>>>>>   */
>>>>>>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>>>>>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>>>>>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>>>>>  
>>>>>>  /**
>>>>>>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>>>>>> -- 
>>>>>> 2.47.1
>>>>>>
>>>>>
>>>>
> 

