Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A543AAB0849
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F5B10E046;
	Fri,  9 May 2025 03:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BjqpG/ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15B610E037
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 03:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXmFcoGXIt96+QLsz3rc00D4xzvfJqikdVfNA5ikWdHxACqIv/++TMPGTbyAbolmFkZ1YzU94+wxpJOPPwTUrO185ylSe9Y2pc0fRE79m+4TSKSyn3tweVUSeB6wE8VJX9ZfGPMD3I9qqO9YyLZpfNYQ6ymyRHbMYmtPB31ldF/auuXWELgymlvLvaxVnEeqoQ1/8tONONvCkvzETMSWCWRhy2ZudVSS/qf/qGgBm1V/ktRMX2Bb9CnPjlATnEbs8RUHm/X8QgdvGviMIBH2NneErmyY9+nyHan8aWxr9ZgShnFUasw6BbUMTYeBafzrqiYMCkZxOGfo6g0Tmdm4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6D9m6gYVJw1Jh0St1UBZhuYgcmXVN4N5nvF4MBx1RA=;
 b=MQd48K2pLZJLzCmNZmqZ+kvotbJW0PaUyNZ6C+N67DMLkKeWX0Q6rSck0+wsUVKCUpQw5iDEZgE7yM3CcyjjvJxjBnGw8j7VDimlgry5uJZ4pC+9r6DPjRnIQP9l+/ykspcGwenqUYeNULiq/7fHJHOarifEeWz/EUSg2T4FfA77kvOFOdzTcE94raggUWeNZgbchza+WTaf24vMQetrhJjYzjQ4TP66jR0m4oXhSF39OUFB2VjDvUnpL/kwkXO3uJ5uwGg5rrNk+NGQ3GUuhSo4HPRZ6UU5xqpHBJH1V/OGB8xrz/wQ6/DBEzK+SZvVxK91xpathOqvYHqsgT9Pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6D9m6gYVJw1Jh0St1UBZhuYgcmXVN4N5nvF4MBx1RA=;
 b=BjqpG/nsJKGUAHAnpqD8rzOZBs577o49RBj0PzNox6zFDGaCTRf7M7odCssNaw405IarqFCzT5tuMvnjtYg3bPA75nGG0YHoCebxRlfo48s9qh4dKPa1g3uem5u2z7Pa5uCPmzQap5KViUxttscNbceE1vjgoxkQj14ViujFMf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 03:05:08 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 03:05:07 +0000
Message-ID: <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
Date: Fri, 9 May 2025 13:04:58 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
From: Alexey Kardashevskiy <aik@amd.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, jgg@nvidia.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com
Cc: yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
Content-Language: en-US
In-Reply-To: <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYBPR01CA0094.ausprd01.prod.outlook.com
 (2603:10c6:10:3::34) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: cc87f1de-4a9a-4991-1781-08dd8ea64da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmtYUkNjYjJzNWlRenFpQ1dXdVpDZHRYMXB3Tm5HRjYwTXNTQzU3OXZMRjBk?=
 =?utf-8?B?bklRTnBTVVExOUtvWkp1WVg3ajUxdUJaQlRTd2RuTGFsOWRLbVgxUXNrVmhq?=
 =?utf-8?B?dDYxY2doeVdqV0lXREErcXhrcFpGN2ltL2JxTW45ZUNya3VwR083KzVGdlBW?=
 =?utf-8?B?VzdHbVA1WDlPekU5d2xWb3RWRHBlZHZBMHhvdTM4dkpsK0lNQVFvTlA5aFFK?=
 =?utf-8?B?ZDhHZXJXbnRHNHRyTFc5aUk1V0YvdFA2RDUrYmtvV1JGQ1FVTm1tekdzWDZw?=
 =?utf-8?B?R3VyL2hhTFgxVExDVHd0dWliZTNISjJZUGFUdW5nek9DSWZSczJ4NExvd2g5?=
 =?utf-8?B?ZDBkbUF0M0NuelZNRlpTWXVUeVVtcElUS0pBeTk3NEluREx2eXlaNmEvalNI?=
 =?utf-8?B?d1RsVkIzcjFheVE4N3p0MTIwNzNJRFlmNThVcGIwZXFoNzBSMm1pOThOcFhj?=
 =?utf-8?B?d0U5V2I2a2pGYzFWRDJCbDA2V1dnaTM1RitWcHd1aW9CdGwvbmp5SnF4VVE1?=
 =?utf-8?B?cGFJc3NiRllleW4wTElBUm9nZDlNSVJtYjk1em1HSGs2NWMvd0pPaFJCTmJY?=
 =?utf-8?B?MGpFODhMVVBUWStBSEF0c29aR21RQ2RxakFrQ0wvNmcwNXlhaEVJWkZ5dWxJ?=
 =?utf-8?B?a3d3VWxQVmtPRmpFcERYVlFyeTBLRnVpWGJmc1lzR1JSQ1FORzVlanluTFRt?=
 =?utf-8?B?VHFsMGJCeUh0UWV3NEN5UmYzZFo3dEYzcGZKU3k5dmNIaVlPTS9waVdlcVFz?=
 =?utf-8?B?aXNNZTFOaUY1bFBVWjBYZlBoWENTK3pLM0U2RjMrSHg0Tm5TRnhIQVJxeWVW?=
 =?utf-8?B?UFYxZXo5VVZYeXdRSjk1T0tsWnhkR2FoVENKMEU2YWVwQjRFOWhUVXNlZjM1?=
 =?utf-8?B?NU9VTDhvOFRZd3NpVExpY3c3YmRETTdibm5Xb255S2V4UDFrM2YrWGh5a3Zk?=
 =?utf-8?B?blcxeVBYNHJGQ2pBUzBSSVBDcXQ0RHFueUNVTC9nQ1A1Mk5VdFVsMGIzWDJN?=
 =?utf-8?B?dTI1TFBvUEJqVzUzQkJTUEhjK1c1RXFoVnRMZU85ZU0xVHp2djNjWFVPcVJW?=
 =?utf-8?B?WlU5eFJiRFBwMGgwUzRSUVd3NWRpajBhOGxydnJIcHliMklJU01BcmRSNFNy?=
 =?utf-8?B?bmVCSnVOYkRQQURMWGp4a1o5cGlQVGJXOUJoWGNEaEJyY2E0THVBbS9EM2ha?=
 =?utf-8?B?TFdYVUIyTzl4WUFEQ2ZJbGMrU3c2YWJYVFNMMnM3NmIxdzJabUhiTDFLN21U?=
 =?utf-8?B?TmduN1Z4TUR6V0JzVGpHejJWeElvRDFjbWxhbnBLVVJYcUYrempaYU5pakQ3?=
 =?utf-8?B?WkhIOFJJZXhORXVXNHRHZGpoTE5HSitKZ0hqT2ZBRjZVMFZ4R2Q1cGFqYVpE?=
 =?utf-8?B?WGprUW1xM0pNMnRibkxXVzQydTUzUlIwY2RMYVV1MlRic1hJWTdvOThMbHdn?=
 =?utf-8?B?NDVYUzhWRTRON3htQWY3VnlXSlVpckhTV2lPeHhSSzhueTRienJBQjhWQlZx?=
 =?utf-8?B?cnM3L3d2bmxrUW8vTjRRSmJFWUpKR2tmYVRya0dMb0NXc0pvZEJkUGJVVkJy?=
 =?utf-8?B?UTdEU2lnR3BVZDRoOTNKU3Z0Ykl2Zm5sMkk1WnI3YnYzQVZiaFdNS3ZaNzRq?=
 =?utf-8?B?eUVLSVVsam40L1Zmc1hnUmlvMG1MTXUzQXYvSDB2Ymhxb2tCYlVDZVltc2h5?=
 =?utf-8?B?bFA5dHc1WjltTml1ZFkyVGxpelB3UE1ZMzdqbm5mNG9SWWpiZGUyTDIybm1P?=
 =?utf-8?B?ZnY4S0xaaEFNK3ZKZzdIeU1XMlNCVnE1aVlMcm5kRVpYdXhkV3JGUnpwOUNT?=
 =?utf-8?B?YVVoNmw2SHZNemRTTFpQMW1URkU2WXd3KzlFQkp5d2FmYXJ1a2crejhHd0lI?=
 =?utf-8?B?RXFYSDUvQUJWZGdiN0JIbzNrTUYwN3lhY0tRc09SVUlDMlljb1R6UFRWQVpE?=
 =?utf-8?B?SkNQY2g2a21DWjZJVmhyNDRET0pBT2haU1hKZUF2VlppdGFVU1c5RmhyUnNh?=
 =?utf-8?Q?fjbQ7axZCqkg+hq2QqtdLMAECF8jZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29BQnZWdzh5OEx3OEpDZzcrbjVTcVR6QUl6dStsM0dtbEdsSGVCZEV5elFJ?=
 =?utf-8?B?ZCt3bWNoVnhNcWkxT3lteU5LVWlpWUFxTjB2U1RTSWFrc1dDYVQ1SHRwOURJ?=
 =?utf-8?B?YUhTdTNJNCsxZ29yN3BrMW16QkovMFgyU1VQN2VKNHFKNnZvZEwyNTgvQkdw?=
 =?utf-8?B?QXN2aEk4aWwrbm96TFlieDlIOFZTcVdiOHBPZ2IxVDNwWFRQVzhBbGpFTCt2?=
 =?utf-8?B?VmF6cGRkNDUvR1ZCNWh1SldyZHpHUGhrZXhFS0dSa2R2UGd1WTJ0bVZlZWZ1?=
 =?utf-8?B?c0dRQ3YvOHphL0RVdnB3b3RpYjcyYTZxNmFqcFRjUzc4eFV6SGVLSDk0L3Qw?=
 =?utf-8?B?MlhtZ1lNS0N5VGd4TCs5TkZRQWJnZmhBTTlnb2l3ZjNTOG9TZHlFYmt5Rmdi?=
 =?utf-8?B?Nmp3UUpWbjFoZCtFZ002ZlhlLzJCMTdVZ2hOa241Y0pKY09KYms2c3FxZVpz?=
 =?utf-8?B?eS90MStYUTJSb2RYNm1lcVFiZklJVUZRQ3pZTUFYY1RGOWNKcHhVemV1cjhO?=
 =?utf-8?B?aHBZelJMV3dkRHF4ZzRob0hjNmMyY3prcE5OdzBhTW10YzJ0Y1hjNkdMd2Qw?=
 =?utf-8?B?V28wZ01aS3NiOHYrOHRoc0ZDbzRlVENLNEhOZzdRWW9uekFuYk1IT0dFVjNM?=
 =?utf-8?B?VjY0ZVBUWGl3eW9aS1k3LzA2OXVMcWNZQkdEd2ZmU2l6aGlCYW55RHkxc1JG?=
 =?utf-8?B?MncydUZaNnBOYWxnZEFUbTJRdndEUkFlay9kWUIwdGpnRHVxbzhaU0kyOVFF?=
 =?utf-8?B?a3ozLzJpbXlhMkJtMnRsOUFuTmVRemlFdlpJOVBjRHlmWHNmSHE5RXl3emUx?=
 =?utf-8?B?blZMdThiZ01EZ1VIRUJDSGpMSmZ2dzdyRkdnb01jbGNXN0cyZ0FseG1NaWtq?=
 =?utf-8?B?WGVSOTBFc0tHb0tvZ2YxQVhoNmF1Ty9mNWkyRVdUbGRpRVhreFhCMCtkanBB?=
 =?utf-8?B?MkQ4TFlZb0dzYXcrRG10V3MrT0FDOEM2a1BieGNmZ2NyazdlZGZwck9BeTc5?=
 =?utf-8?B?WUw3NmdtUFl0ZUNjQkdKeGtVSmxhZkJCdktRN0RPWlNYRThCT3Z3a2RYVXgz?=
 =?utf-8?B?WFd1Wk5Fb2hvL2QzNm55ZXVQcVFta0MvZWxoNUhJODZEaGxDbjh4MjNYT2w3?=
 =?utf-8?B?MitBdnhlWDJCMENYNzdLblF1Yk11cWd2TEFWdHplM2lPZ3ZMSlI2ck14OUNE?=
 =?utf-8?B?Q0dIaS9hdE5wREUwRGVrRG1TeW1CUE40aWkrMjlWSmxSR2hvS1NEQ2pDd1BP?=
 =?utf-8?B?TExTV1RTNGZTZzduNkx4ditadytyekFJNjY5azkrR0oxRnN0Q0FJTGNLWWE4?=
 =?utf-8?B?K2F2ZC9tN3VxZVViOUZCQVMrQXdiMVk0REwyZm8vWXhIZGlZUWRxUzRka25o?=
 =?utf-8?B?YzRXRXpiei91REsvTUZMRDdIUDNZY3VBaUZhVU1RQWlMUkdBYlNQVUNJaHJT?=
 =?utf-8?B?b01TRGl3WWE0MUs5K3lFZGFXeDNyWDZKdUdrYWNnT0NVOVdrVldiTG45cGNH?=
 =?utf-8?B?S21mb3dIUkNXZTkyd2gwZXVzaWVmbXphRkNTQTZVL05pQUdPMmhCeE5uV1F4?=
 =?utf-8?B?U1pLWWlycm5mNmZpek83MFRsd0ZrRTdHTHRYeEs5MmthU2tDZHZmVmpHOE10?=
 =?utf-8?B?LzFLaWd0SW1HTTBtdC9DdmsxRzMrOVZ4S25vNU5RbTd4dC83QVdPSUNsVzZ4?=
 =?utf-8?B?N3ZBNXNjZlovK0hPbW9rZVhXdXVOR0hIOHdxUWJaSFBGdWwrTkFRRW5lVEx0?=
 =?utf-8?B?SFowenRFdkxoeXhRN0NOM1Z5cHdtclJoZU9kMFpaRzJjWno2Yldab01pdFRs?=
 =?utf-8?B?NTlySmczZXFYWnIrMXU5MzRUb1VzcTdjRC9GNmJvSUcvTG1kcTdxZm5WMDdY?=
 =?utf-8?B?MmMySUwvaW0yUWFQdkdjY0s0YkUvOU4vdGJ5WmIyd1dYRzFqclBUN0V3SlRq?=
 =?utf-8?B?R3hkODk2cXdCd1lxY1hKQktZUFBCRDhXSGtLR3ZzdDRIMXlmVG1PWjA1U0c2?=
 =?utf-8?B?OGJmTmtjalgzcFl1MWhxMVBqT0ZWQ3NWT0dYT2NiZkdYRWtxQ3FyVUdWeWty?=
 =?utf-8?B?ZDhMQlRuYTUySDc3dURUdENDVk92MmlOQVJjWjdoMGN0V1UycDV3WnNBcnE3?=
 =?utf-8?Q?DQ6KTkIny1qb1DzwJDwL8PKhZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc87f1de-4a9a-4991-1781-08dd8ea64da8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:05:07.8139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsC1U9eQOfSwnXQ1lg+YEF5n/rS5oLXzWf/LENWLApeunS3YS+tv/REgP63f6Ft8FMjFAjq4sSulnafVCzdmhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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

Ping?
Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,


On 29/4/25 17:50, Alexey Kardashevskiy wrote:
> 
> 
> On 29/4/25 16:48, Alexey Kardashevskiy wrote:
>> On 8/1/25 01:27, Xu Yilun wrote:
>>> This series is based on an earlier kvm-coco-queue version (v6.12-rc2)
>>
>> Has this been pushed somewhere public? The patchset does not apply on top of v6.12-rc2, for example (I fixed locally).
>> Also, is there somewhere a QEMU tree using this? I am trying to use this new DMA_BUF feature and this require quite some not so obvious plumbing. Thanks,
> 
> 
> More to the point, to make it work, QEMU needs to register VFIO MMIO BAR with KVM_SET_USER_MEMORY_REGION2 which passes slot->guest_memfd to KVM which essentially comes from VFIORegion->mmaps[0].mem->ram_block->guest_memfd. But since you disabled mmap for private MMIO, there is no MR which QEMU would even try registering as KVM memslot and there are many ways to fix it. I took a shortcut and reenabled mmap() but wonder what exactly you did. Makes sense? Thanks,

> 
> 
>>
>>> which includes all basic TDX patches.
>>>
>>> The series is to start the early stage discussion of the private MMIO
>>> handling for Coco-VM, which is part of the Private Device
>>> Assignment (aka TEE-IO, TIO) enabling. There are already some
>>> disscusion about the context of TIO:
>>>
>>> https://lore.kernel.org/linux-coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-xfh.jf.intel.com/
>>> https://lore.kernel.org/all/20240823132137.336874-1-aik@amd.com/
>>>
>>> Private MMIOs are resources owned by Private assigned devices. Like
>>> private memory, they are also not intended to be accessed by host, only
>>> accessible by Coco-VM via some secondary MMUs (e.g. Secure EPT). This
>>> series is for KVM to map these MMIO resources without firstly mapping
>>> into the host. For this purpose, This series uses the FD based MMIO
>>> resources for secure mapping, and the dma-buf is chosen as the FD based
>>> backend, just like guest_memfd for private memory. Patch 6 in this
>>> series has more detailed description.
>>>
>>>
>>> Patch 1 changes dma-buf core, expose a new kAPI for importers to get
>>> dma-buf's PFN without DMA mapping. KVM could use this kAPI to build
>>> GPA -> HPA mapping in KVM MMU.
>>>
>>> Patch 2-4 are from Jason & Vivek, allow vfio-pci to export MMIO
>>> resources as dma-buf. The original series are for native P2P DMA and
>>> focus on p2p DMA mapping opens. I removed these p2p DMA mapping code
>>> just to focus the early stage discussion of private MMIO. The original
>>> series:
>>>
>>> https://lore.kernel.org/all/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
>>> https://lore.kernel.org/kvm/20240624065552.1572580-1-vivek.kasireddy@intel.com/
>>>
>>> Patch 5 is the implementation of get_pfn() callback for vfio dma-buf
>>> exporter.
>>>
>>> Patch 6-7 is about KVM supports the private MMIO memory slot backed by
>>> vfio dma-buf.
>>>
>>> Patch 8-10 is about how KVM verifies the user provided dma-buf fd
>>> eligible for private MMIO slot.
>>>
>>> Patch 11-12 is the example of how KVM TDX setup the Secure EPT for
>>> private MMIO.
>>>
>>>
>>> TODOs:
>>>
>>> - Follow up the evolving of original VFIO dma-buf series.
>>> - Follow up the evolving of basic TDX patches.
>>>
>>>
>>> Vivek Kasireddy (3):
>>>    vfio: Export vfio device get and put registration helpers
>>>    vfio/pci: Share the core device pointer while invoking feature
>>>      functions
>>>    vfio/pci: Allow MMIO regions to be exported through dma-buf
>>>
>>> Xu Yilun (9):
>>>    dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
>>>    vfio/pci: Support get_pfn() callback for dma-buf
>>>    KVM: Support vfio_dmabuf backed MMIO region
>>>    KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
>>>    vfio/pci: Create host unaccessible dma-buf for private device
>>>    vfio/pci: Export vfio dma-buf specific info for importers
>>>    KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
>>>    KVM: x86/mmu: Export kvm_is_mmio_pfn()
>>>    KVM: TDX: Implement TDX specific private MMIO map/unmap for SEPT
>>>
>>>   Documentation/virt/kvm/api.rst     |   7 +
>>>   arch/x86/include/asm/tdx.h         |   3 +
>>>   arch/x86/kvm/mmu.h                 |   1 +
>>>   arch/x86/kvm/mmu/mmu.c             |  25 ++-
>>>   arch/x86/kvm/mmu/spte.c            |   3 +-
>>>   arch/x86/kvm/vmx/tdx.c             |  57 +++++-
>>>   arch/x86/virt/vmx/tdx/tdx.c        |  52 ++++++
>>>   arch/x86/virt/vmx/tdx/tdx.h        |   3 +
>>>   drivers/dma-buf/dma-buf.c          |  90 ++++++++--
>>>   drivers/vfio/device_cdev.c         |   9 +-
>>>   drivers/vfio/pci/Makefile          |   1 +
>>>   drivers/vfio/pci/dma_buf.c         | 273 +++++++++++++++++++++++++++++
>>>   drivers/vfio/pci/vfio_pci_config.c |  22 ++-
>>>   drivers/vfio/pci/vfio_pci_core.c   |  64 +++++--
>>>   drivers/vfio/pci/vfio_pci_priv.h   |  27 +++
>>>   drivers/vfio/pci/vfio_pci_rdwr.c   |   3 +
>>>   drivers/vfio/vfio_main.c           |   2 +
>>>   include/linux/dma-buf.h            |  13 ++
>>>   include/linux/kvm_host.h           |  25 ++-
>>>   include/linux/vfio.h               |  22 +++
>>>   include/linux/vfio_pci_core.h      |   1 +
>>>   include/uapi/linux/kvm.h           |   1 +
>>>   include/uapi/linux/vfio.h          |  34 +++-
>>>   virt/kvm/Kconfig                   |   6 +
>>>   virt/kvm/Makefile.kvm              |   1 +
>>>   virt/kvm/kvm_main.c                |  32 +++-
>>>   virt/kvm/kvm_mm.h                  |  19 ++
>>>   virt/kvm/vfio_dmabuf.c             | 151 ++++++++++++++++
>>>   28 files changed, 896 insertions(+), 51 deletions(-)
>>>   create mode 100644 drivers/vfio/pci/dma_buf.c
>>>   create mode 100644 virt/kvm/vfio_dmabuf.c
>>>
>>
> 

-- 
Alexey

