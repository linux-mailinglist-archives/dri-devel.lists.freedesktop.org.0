Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EFC3CCF6
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8F10E995;
	Thu,  6 Nov 2025 17:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p206WZD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11E710E98F;
 Thu,  6 Nov 2025 17:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAUelYwAU7JzEQzIfVfkcX9HSKHZR30fdszjTkbjC01mRsxc2JHRfe7dLLaJ2PdCYVY6M5Q3A3UZrEg92WmiOZwZYFNAf7UJaDV61LMCya8Ag2+HJcbg8Y/7G9trcOGYnYsbCW66s6rkZ/oMy8ziIHYqNvB/c1KZ4m4lBCu75Es5VT4fu/zkNC70t4RhpcAVtg61oMWaexeSbnBmOEwZHMHf4x1UYts1CRv+5pUXoyL5aSgMrjMYfJtrIHdFT+VUqduClQo3zz6auBO4Ip5h4dxbeWheOl+JTetjqPXDO0PbzFVDvLRcbm50gMjKPWGknj7QGp0nlB323i1rCECYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcdUYjSsZ56SKXOyr/wwzfedBIMoAqohwQd+5lmkzY0=;
 b=Op7Th9fTzcfnTk/A6X4LGGMiQkXpbx8muomjDSEOra1sStdDVHC6UUQwz1Yuf2wxwkvdPOuU5pfL48rvamVGyl4xZx+03ZqJaonAPnS+9y8wHPL1VnN7QyHye6Qq/w6RBBRJHP0WFPbyjxKNTFAZKx7OsrUQjpT8Oh6JnSDJ4Pt8hcq8dkxvRZlENc5ejJu2OeJVjacXWJSKoApcBAIeqyg+avjHB/+3OQagyQ7PCLfTfJ1ouz6sRS2gRilkBSA8eh9OCbXcO4wCF+hDLmfxGZ0gSufL4d4Mr6szcy/JNohfkhL+eJrRmEP8WvNlhY+JGkox3+BpzLHfeSolpqdQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcdUYjSsZ56SKXOyr/wwzfedBIMoAqohwQd+5lmkzY0=;
 b=p206WZD0G4WOGk8wXSPPcDoNEsN0zXmXt3Xxoti/BYeKziFf9TX4+GcAfY0z0mm9sSuDELpMP+C8IHPUh57GJg7YV+w4SFBdpJUt+EUM6+Jbl5ZuujyPudFmpgbbd5TwnfvbDyuoGM2DLmw9mjCRk5lUhTKEhcJ1vD/ks4mm+vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7426.namprd12.prod.outlook.com (2603:10b6:510:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 6 Nov
 2025 17:25:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:25:29 +0000
Message-ID: <2715246b-42a5-443a-b4e8-9a67920f5fec@amd.com>
Date: Thu, 6 Nov 2025 12:25:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
 <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
 <887de3dc-f6a8-46c7-baef-862fe1acaf02@amd.com>
 <9484fec0-ca36-4968-9edc-ca517825fe68@amd.com>
 <5ddb1da4-84e6-48f6-a9d4-10560f58ab90@amd.com>
 <a01fa221-401f-4548-80d8-5d687e93dbee@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <a01fa221-401f-4548-80d8-5d687e93dbee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 36373768-bcd1-48a1-6dbf-08de1d597b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFpPaTBZMlg1emxNKzNRdVEybVlBMzVGZzFFaUFBZlZZVmUrUTMrRWtQc3JF?=
 =?utf-8?B?dm5jcXdOYUE0TW5aRU9EVVpYZWVWTXM4RUhEL1dtOStPUHMrK3RaUFBlZ1Zi?=
 =?utf-8?B?QWdUMmxGWlNIN1FpQUJVSXhFeml4MkE4ZnJMM0JDSDlyaVF1R3ZrT2ZTUkxV?=
 =?utf-8?B?T09RbUM5UzNsNUxRZ1FrV1Q1UWxMQWFyTXV5Q2RhSEcwc0NRL2kyaVE1MkU0?=
 =?utf-8?B?Rm9DeTh4djlSMXlnelhNeFZxcEo0enhMNHZIZzRTRmdPaktYN0xNTW45YlYx?=
 =?utf-8?B?RW9KVDk1VkF2MnMzUWRaWEY4SVdyZC9BbmVGeEpNYmtVbzhMVXA0dVhNWFN5?=
 =?utf-8?B?NVVlMWZFUk5vdCtSQ29yemx6SHhZd0pPMDFXdzhwV3ZHcFhlY2JzT3lYL3Y5?=
 =?utf-8?B?YXRYdWRUQ2tsTWduYUFKSEpuNTMybUY3TGVOSDB3bjlVUjBpZUV1ZlFtNi9Q?=
 =?utf-8?B?SHhvUGNsQjE2QmNpckJnV3p3UDJ1NG1TRENlOTJXbFJDM2t2ajhuTmpLcUxU?=
 =?utf-8?B?cE5tMzRNdE5QQVJNYy95K1gzdzZFZ1JmMzBmZWdFZnFFODd2Z3l2ME9hWTRW?=
 =?utf-8?B?VkNvSnVtVk1ISGZXVEZhZ1VtejUwTXJiWEs4MjVnUjEvSDFZTnNRdGpZZndZ?=
 =?utf-8?B?WVIzVVc0WWtQWGJSWjJ3eVVPcHNpOW1ETFJqZ21WZjdLVGYwZEtGbkxjME9u?=
 =?utf-8?B?VXc2c2JZazM3aWlacGFDL1NtcFljeXNUdVFPUFlubnlHTHF0RmNlK0lCcXZq?=
 =?utf-8?B?bnB6MVNMaGFBTktmbm9raVB5Tkp6Q0lDMFg5b3Exb3QyYk8xdlFyVWtudm93?=
 =?utf-8?B?OStqd0Y0SVVUR09DZzV0YW02UW1XSy81L1R0eUJRN203N2ovRjQvVUlTSGdj?=
 =?utf-8?B?cm56WWVIK2JPN0FTZDdkWlhYZGt4bEFtRm14dXczRnZHUjU2eGk0ZSsvUk8r?=
 =?utf-8?B?NHFVUjZXdWRXbnVBaG9QVFYveVZKZFlRUG1jNFFFMittZkwrdFJoSU1zYnNX?=
 =?utf-8?B?UFpTTFVsY1FSVWRvMWt1VUJuUkdQRWJIZmRBSEpWMjc5UDVzMGh6dUZZenBU?=
 =?utf-8?B?aHdpYVJsMHV3dnBIUkI0Q012MUhWT21CL3duT1NvVzVSQ3ZSeVhBZVF0b1Jt?=
 =?utf-8?B?NU5Wdm5hcCtFL0pkbStYRmV0akpEWWpEaG91VVo2SE1EQnhsVlc5M25uOHRG?=
 =?utf-8?B?UmpHZXVVNmxBcUhoUElWVGhueHZ6Zm9uY3pRZWtPVzhZWEVNVnNjZlo3ZHJn?=
 =?utf-8?B?RHA0Sk1razE5OUhVTUsrMEh1ZTdYbm1XeTlHSnRjOU1RTVdOdXVsbFE5K0Nm?=
 =?utf-8?B?MXp0WThBQzZQcFozK28zekNHcHhkdEFTSlprWGxZU2lkR2JWV3puQTBtRmFz?=
 =?utf-8?B?c3FwMTl3NXdVazZuS0YvSGYxNjJSTDM1M1NsWEZpQW56SFVvSGRwMmxjTUgv?=
 =?utf-8?B?TktMVUl5V2owYmJnRzZkbUlIZkdxL09sejlhbldvKy9UQS9zYmovQnBSUDdl?=
 =?utf-8?B?YnFBaEtRZkxjUHhwbzBTQnM1aHdsME91L3F6V1pBYnZ5dG9oWlJtS1ZSVkFE?=
 =?utf-8?B?VVBCdEErcHYvb0ZzY2djblZ2Y0U3T0ZBdU9MUERlQ25MZHhidVZMZEtmMWZD?=
 =?utf-8?B?NWtpZWF5Um55TXU4YVBjVDdHbFBaaWxlbTB2a2Y5Q2tqOEZMdnB2bUZxZVZz?=
 =?utf-8?B?YWxFTWNkcHVuekpLdmduYVJiN2N3d3VXbUVXdlV6aWNaVi95MERtZUQ3aFZ1?=
 =?utf-8?B?dXR6ekJwVEhjME5VbjZXSXo2dld1UlVjcm95U3lQbDEvUjRPL3RnWUFoMG9V?=
 =?utf-8?B?akc2ZU9uU29FSWVKSGhySnZXRDdwM2xObnJqMWRRUVJRZDVIUDJCbWJzTEwv?=
 =?utf-8?B?SEx5VEtua1A1UTBOQ0JuUTY3Q3pmWWVpd3R2Z1l3aXN5MkJCNXhXTjFob096?=
 =?utf-8?Q?blH5GQ8mnEI73EteMqoG8eBgykaDpQNH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJsNTU4YjJPWHVzTTFuNDRORTl3VHBuR1R1emNKZ1pIVXMrVmExMk9xeS90?=
 =?utf-8?B?eDIxajg4K1drenp3WmxJNDFFbUphcnZ1SHIxbXR1dng3RmkzSnI5ZVVCM0N2?=
 =?utf-8?B?YzgzTHFRQ1Z3dUdqSTg5NmtDSWY4S0phSlVUVFFHdUlHZkVCTjJ6TEUxaEZT?=
 =?utf-8?B?VDV5NXNSVnFFdXFKSFJJMk9wRmJsL3FiTkhwazRndFVVU2hKdkxHVWlBUFZB?=
 =?utf-8?B?Z0ZmbS9iVWtDVTlFa0Q4UkhEc29uUjA2blZJOXRCVUd4Mk5RMkFMVGhpRG5R?=
 =?utf-8?B?U2Y2UVZLRTFEYXBiMHk1d05sQ1d0SEJqTW01dXlsY1NNOWlQNkJNditwQjN0?=
 =?utf-8?B?bW9KOHdmTEZKTHVFSnZGY2VzaFM2dWRtZzhTcmNBa2dTbTVJVWRjZ1ZkV3dI?=
 =?utf-8?B?RTJkZzBSN3crZXpuTXpMQk9OSUFYbTJreE9ucXJjSytHMm55aUV5Rk1FdjRI?=
 =?utf-8?B?SUU3dVkvUm13dWVKMkthelBuTTgxRVBXY0s5R3pKMmU3ZTB5WExqVy9HellX?=
 =?utf-8?B?R2N4eng1WHFVcHNITWpXU3FUQythYmp3aElSdkNWUHNOeU4wOGd0bVgrTGQ0?=
 =?utf-8?B?VWYvcFVhYUwvcUVRbjdyNkltQ1VrNGJKWTF2ekljODRXUk9qMzRFdVRpQ0pP?=
 =?utf-8?B?anBQdDUzN2lqclB4eXd4SXpiTmhlTUhtRHpuTjNTdlEzWDBTSGQxR1VITWp0?=
 =?utf-8?B?dUh3NXNnNnJsWjJFS3dFZ2x1aWk0QmViblEzR1A1MUtvZjNiZktKVUdFS0hR?=
 =?utf-8?B?N2RVSkRjOXhaOWVhVEk5YlREY0FDeUZoVmJuNWY2RjdYU1l1a1dJcmxKc2RE?=
 =?utf-8?B?cmZrUldUSm03K3U0b3F0ZndrS1o1aVR2VlZsaDVkRnAyQ2kyZlVkYWFsQ2xG?=
 =?utf-8?B?RmpsRXB0WDBsOGFINXA4K3pYV3BuZjdTR0FrdkNpRWtPSG9SQWFBZTN3Mzc0?=
 =?utf-8?B?VkZXL1NUQjd5ejVhaUFtREkvWmNYU2tCK1l1OFI2clIvYjVKazNETWNHZk10?=
 =?utf-8?B?QWg2SWMyTTlGcHBuZWdzeS8wK0tGUGFBclpnUGJEMVNYZC8rckdQRjdxeHQz?=
 =?utf-8?B?bU9CVmhWQWdmak5qbkNQUjcvTGRhYU83UkVSNkl0dUxybVlLRDdzK1BtdzdN?=
 =?utf-8?B?dS8zRWFVNThISk93dlphR1dvN005bTk4UjB4MzMzOXVtV3JLbFZuUGdRa09h?=
 =?utf-8?B?UHM0bEZMczdlbStuQ3laQ2V4aFo4aWZ4NDUwS0orK3JIREtyRE5tZyt0eTZL?=
 =?utf-8?B?aEdxOWphVjVMQXFQTnI5alpGdmJuZ0RsNmRWcUhBblRpbnJ5ZWlsa3JSbk8w?=
 =?utf-8?B?dTgzQnBVSHpkNDg0NXNGQmZKRllqWVBwdVJEbXlSWjNqY28wcitXOGtNL1FD?=
 =?utf-8?B?MjlvdnA4a2ZPOGQvTWR5L3plNWx0ZTRaU0FVYkMveFlqWGdMMWI3SHY0aGxj?=
 =?utf-8?B?KzFVR1pISUdVSC8yS3hxaUJMVTNVa1FEME1IbFQ5TFRyQktTWEFvUTluSjRn?=
 =?utf-8?B?elUrNjlZWUU3WnNxR0w5M0dvYVQ0WDlQR0p0V3R3TkszQk4rN0JjNzJ3RnZk?=
 =?utf-8?B?Nkd4MHQwemwyOGx4OUQvcUE5eGtvam84QTZGYkd6ZFNLY3ZIT3F6eFhVMFoy?=
 =?utf-8?B?RXFBT29ZMTF1SDhHYk5Cd2ZISWVHOWVWV2cyU2FsVytjaHBkZUU0b0ZyNXBy?=
 =?utf-8?B?ZGo3RCszWmoxdkRoOWEwTlE5Sk5jNkZtSUlmVjg2Y0FmRFoxdVM3SHhKcGRV?=
 =?utf-8?B?cTR0R0lQdXpkckZlSm1qbzE3eFB6Y2d5UVJxY0ZzbDY4WmxLZmpDTy83ejha?=
 =?utf-8?B?WXFqcnljdnRCc1lhUGVLdEg4cWFGUHY3dW5UbVhqQlg4R0xMNGZ6c3c3TGNY?=
 =?utf-8?B?cUdHOXJzRFRwR2JJcHJhSmNMNDRVNVNVc00vV2ljOHBVd3ZFK1NCTDlLbmdV?=
 =?utf-8?B?em0zdDR3dE41Yy9VSDJsaGJVTS9yZFk1TDBoTUtER1BBTzhpdVd3dWVJZjVL?=
 =?utf-8?B?Nk5HY2xLSkNtOFo1UkhDVkRzV0RzMStLdVhhclJhTDZCNnp5ZjY2Q1lXNThE?=
 =?utf-8?B?Z3FwdnVUeWRvYm1aczdaYzl5NUhWWWZCc2lrQ1JyVlhhL0RhZ2xMY055eHMv?=
 =?utf-8?Q?ssEK9dblo3xLsSDav10TzN+6Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36373768-bcd1-48a1-6dbf-08de1d597b5a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:25:29.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1wPgdtASxCBdYW7yE4xTyw+2D/wQUNstSASbYy9/jVePHrP6+EidwHkriF0X26brvSrOrTE5QeW1O5JUxZqmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7426
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


On 2025-11-06 12:09, Christian König wrote:
>
> On 11/6/25 18:07, Kuehling, Felix wrote:
>> On 2025-11-06 11:46, Christian König wrote:
>>> On 11/6/25 17:37, Kuehling, Felix wrote:
>>>> On 2025-11-06 08:43, Christian König wrote:
>>>>> On 11/4/25 17:28, Philipp Stanner wrote:
>>>>>> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>>>>>>> Calling dma_fence_is_signaled() here is illegal!
>>>>>> The series was sent as a v2. But is this still an RFC?
>>>>> I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.
>>>>>
>>>>>> If not, more detailed commit messages are a desirable thing.
>>>>> Good point, how about:
>>>>>
>>>>> The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.
>>>> I guess we could use dma_fence_is_signaled_locked instead. That said, it only tries to take the lock (in dma_fence_signal) if fence->ops->signal is set, which isn't the case for these fences. That's why this has never caused a problem up till now.
>>> But when fence->ops->signal isn't set then why are we calling this?
>> There is no need to enable-signaling (and trigger a preemption), if the eviction fence has already signaled.
> But when the evicted fence has already been signaled then enable_signaling is not called in the first place:
>
>          if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>                  return false;
>
>          if (!was_set && fence->ops->enable_signaling) {
>                  trace_dma_fence_enable_signal(fence);
>
>                  if (!fence->ops->enable_signaling(fence)) {
> ...
>
> So the extra check is actually completely superfluous as far as I can see.

Thanks. I agree.

Regards,
   Felix


>
> Regards,
> Christian.
>
>> Regards,
>>    Felix
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>>> Thanks,
>>>>> Christian.
>>>>>
>>>>>> P.
>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>>>>>>     1 file changed, 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>> index 1ef758ac5076..09c919f72b6c 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>>>>>>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>>>>>>> dma_fence *f)
>>>>>>>     {
>>>>>>>         struct amdgpu_amdkfd_fence *fence =
>>>>>>> to_amdgpu_amdkfd_fence(f);
>>>>>>>     -    if (!fence)
>>>>>>> -        return false;
>>>>>>> -
>>>>>>> -    if (dma_fence_is_signaled(f))
>>>>>>> -        return true;
>>>>>>> -
>>>>>>>         if (!fence->svm_bo) {
>>>>>>>             if
>>>>>>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>>>>>>                 return true;
>
