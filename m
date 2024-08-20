Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1895880D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D5E10E7D6;
	Tue, 20 Aug 2024 13:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pf2eeRZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8765910E134;
 Tue, 20 Aug 2024 13:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/aA9tsqn7c8Pi6DYNw8kN/IB4oqWkLmLFhwM1DKEic9oz9fwJvx9JZPwLv+bSjnob0rjwmKFWhCCA1bbinYv5If2uqPnleSWtCBS0JE9KloHZZRiTPFFIVSGI1irC05dja/oelVagizUrQZinpGNX8+Qa+cqlEoAl3i0ZYDsxZx7iR/d8InMsT3HWlSuFok6gDQTIqpwf5OMhj3zlZvDSK8xcVTRak1jDDV0MD3+qkS/WfGXjvYyCAZVoBH5UIv9w06apLRUzMM0r1DcRVrMxleIZsMXOLMMKKTNCfR9FoPcBmQrzg8lhFKUwnk5lEFtHB8F09wtj2DWPm2uAnVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c6doQQmd2gyUsnRe41Z/s9NyFilM9ckwk9GQ4/zIEw=;
 b=Sh28Y0h7Y5JU1Pvrp4hRrpAlU8olDgfW5dd679/eMJvCPJNjsH+X/5iWibzz8OmCN+G3olx7ztYK6AwV5kxy0qfB4WHMmAbEpve3/6OeikE+aRQKToI/sUphxsJn+3AxvNTF1FeBjjga3+0fReukHadJZcZxBSLptdJKMHiIq730WC2gEkmhlcinP70aE/wIFGkDDpvWdS7mJ29QxGfH/TjdPh84hHCLDjBliZzJoSTi+UxA4XDKwMF4QNNOt2o5TbvvB3K5H8uISgTbNItQ2Np+P6Wkrbq8YBOUYohybh6w/Mh14IFsmp6FrHQGpGiXUZ++YjskFniVnnnvXZkAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c6doQQmd2gyUsnRe41Z/s9NyFilM9ckwk9GQ4/zIEw=;
 b=Pf2eeRZKliXGLnDBL403xENqSGbSk7/9Qfj3cLS7hllTjxCE4fccMpWcJr/5GGJae+WTsMDUoWxvJkWn+lyr+ISwTqhPS2eR7n9pJmAJfgvficYfn+XJDsWzdQV+1qkWrbRG6Hc+cUn7Jc0DB38KoF0amvk22el7oPGCE+33aAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 13:36:24 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 13:36:24 +0000
Message-ID: <b80e6935-70c8-4e3e-96af-339ff376900b@amd.com>
Date: Tue, 20 Aug 2024 15:36:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
 <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef63056-43d7-410a-1aab-08dcc11d15df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azZLVnhRb0lNc0c0K0w4ejFJR0xucmk0dE5tb29Ga0R4cjFVc0pHRGZKUGpE?=
 =?utf-8?B?NE93NFhTQnhiS0kwYUN6Ynl2MHBNVURzYXJKTDFYTTM2aHN3QmFuS092aitP?=
 =?utf-8?B?WUdsc3dmR0tnMXRldzNJZGVJdytJR3JQRit4SVE5ZkpwQ09FVGRoREtETnJ5?=
 =?utf-8?B?WmljNS8wNEx0WHpuUFd0ZUJ4dnhucFYwY0Qwck5zODVVNDNIeXFzS3ZqNjZV?=
 =?utf-8?B?eTlLN3NTKzVLcjJ5S0VsQ1BDRVUvcXc2Wjcya1RqekFBN2pqRi9sNnlxOG5h?=
 =?utf-8?B?aENrWkdIT25DS3RMczBucEVMZmVrWnhEOGhxNnZwTFdoQjZuT2ZrQVBRSjJY?=
 =?utf-8?B?T2psTnFXaFI0K2FZM0RpaWlUd0JBbmVzYmphS0oxZnRyb0VqMFRETklCWlJs?=
 =?utf-8?B?eU05UVVFNXdVYVY0QWF2YTAyWXZEWU1FeTVYQkF3SWtNT2Z2V0NxcWZXSC9Y?=
 =?utf-8?B?b3orN01ZLzVpRmNIcVJGWlJVbFQvVGROdjdxZHpHQzNtRUZsMGpjcnVrS1BB?=
 =?utf-8?B?NU9sb1Bra1RUVkdQTmMxcVRqV0I1Smk3UHFsdXJXUzdCYjZpRXFsYThwdmli?=
 =?utf-8?B?bS9RZ2VrLzBBUGQ2RVJvZVBqZmVvek9Lb091ZXFYSU5oQmtHb0RPeG5EcUky?=
 =?utf-8?B?TkZLcjd6UzVmRkl3VzFqSjZLVFRWZGk0Vk5QTlU5dTNxQVREYTlPZUYyQjRS?=
 =?utf-8?B?ZXpMbVBWaDRZQytZWktDYlJzb2ZUTTFKajJwQTE5SnRlaWxYOGErbHN5cnBp?=
 =?utf-8?B?VTRTVzVsRDN5MVNGWno5dURMVGtQcEpJSWZBUC93N2F2LzJDS04zbTduV1d2?=
 =?utf-8?B?cEJEM2hIb0N2MGtNaVNialprVFlkSDN0Zm1CamxIRDhJVWo4cXFLQllhSXJM?=
 =?utf-8?B?NXhZVlEyUEVkWm0vODZWUWdQM1Y0eVUvMVdsdTJETDFGbnBta2ExbTl0MFVr?=
 =?utf-8?B?K29xeGVNWHcwdjd6V2ZCMDJOd0Q0dGdaYnBuekMyZXBmQldZNEhyOGIyWTZG?=
 =?utf-8?B?V013ODV4dmtqL3ZjUi9jVkN2Zmo3M0JFUngxMW8vVDgxVmtEUkJUM0VZeXht?=
 =?utf-8?B?VS9Wb2gxK2ZqRXl3L29iNmtVZ0RvT1V4bXlUN1NxMklyRHRRT1NSVzdRa2Nr?=
 =?utf-8?B?c1Z0ZEFNTTFHRjFNald3M3MzM08vMHBmZ1M2VHZzaWdpcnUyYlNXWnNxZ05o?=
 =?utf-8?B?TnpBUWVVS0t0bWhuOU5VZ2MvZ1NIUEhuQ00rN0FHQlhzSkN6VmRBc3lvbExt?=
 =?utf-8?B?RC9NMWRsWlFRRVErNW1aQm10NWxSNFk5czNDYThyRUxUclVzZ3FoYmYxZ01D?=
 =?utf-8?B?alNOa1NJS3FGNUtBbE5ZSzNSNzdIWkx0Z3NyK0dheVFkK3hDcEQvd1VFTSt6?=
 =?utf-8?B?eXp0THRSOEZNNmVVL3EvNDRCbURkaDE1RjJ1NHBBb0VOWVhHbWdWYVFKUTFL?=
 =?utf-8?B?U21helg2TnRpVnJjd2ZQUzhzbVoybmlBd25mQi9waEljMTd5WkxOd21kSlpu?=
 =?utf-8?B?aXphZDJ0OE94bXZIQTJsVVRweHU4eHJxQVdTemxYRWZqMnczRy9wN0hHRUZB?=
 =?utf-8?B?RXBOK1diMjNCdHpOT1R4RGhJVWtJSUh6QVV2NVAyVksrWnJCYUlpWmVpVXFy?=
 =?utf-8?B?Tkg0Q21qaExKcHlNaWhVejgwWEZkdnVqa1BBUEgya2k0RkUxOWhDc0hRTWh1?=
 =?utf-8?B?Rm9pSFdQQkxkL0twY296OXVMZFBscnJ1N21mMEhRTUxpMUdHSTdZaHhCNSt2?=
 =?utf-8?Q?8YKk9RwvFRD/Wz7mNWPG94W2fkACGBtrHb5h0xj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFBME4raTgrSHByR25jRWZWeUQ5RnpvdXk3VjlDOUtnYnRUU3g5NU1Id1RP?=
 =?utf-8?B?V2cyN0kyRmZkMFFlT3c1ZFlXT2YweU1IU05nYkFuVDJ0dUNQT1JYRUNINmE4?=
 =?utf-8?B?NUpHQU9MYWxhVVVkWkYyaWdoZ1pnUi9SUFVsVUVDdVpHaU1nSUJoM2w2WlQr?=
 =?utf-8?B?MTFHd1VjMnNpcStxYXlrSTN3a2VMY1dlR1VnU1l4MWhvOHNPbnBVMWF1LzJj?=
 =?utf-8?B?cXZKT0hIU09jWWxsczFTc2hhZEtMRkRuNHpZQ0EwUm05UEFQTXJPWHFLWE5v?=
 =?utf-8?B?UWNuSklHekxCSlZ3Y1pGRDBFeXh2WmZpOU9MQVlHdXBSdUpqNFZwZ2llM295?=
 =?utf-8?B?QUUyMmtuaW03YXFVaFQyOThoWVB2ZjR4SFdZYUN0aVpEOGtnNUJZL1dKa2ky?=
 =?utf-8?B?bnUwMkdnNlYxdHJBN0ZvTUNBeHVGRnhMMUZDWTE0VTAxSmtYZHgvbHI2dThk?=
 =?utf-8?B?M3dRMFY2YU9yZ1NPUGZwTTRUcEZ5NUgrUVBMU0o5bDBrM2JXSmVPYXRWVkgz?=
 =?utf-8?B?OFlXZ01SRHptMTlZcVFYNFlBS0FhclFMRm13cEI3S0RCNEF6RHc0bTVCMTV0?=
 =?utf-8?B?RWxtblFmN1FQWlBqN0VLaWQ1ZG5NY0hlcGN2bWFZSHVpd2hWMXAxRHNVYmJU?=
 =?utf-8?B?OGZpeEZsTjVQUDd5YzNqNlJPajZLL3pZbEl4WE5RQ2QzaWRQVHI5dWpXNGpQ?=
 =?utf-8?B?Wk5na2FreTh0WURSTyt2SVdhNlloejVQN0JWR0lXcjQxL3ljWkFPYnlCVTA4?=
 =?utf-8?B?ODFrWUVnRVExR0VreFpwRU1ya05qVjlFVmJxZ3V2NlFLQk9weUZsa3ByZlhm?=
 =?utf-8?B?WUpYZk1penVyV3dGb3htQVMydFc4VFFJMlJhMjdHM0FwQlZSQStubFVSdTRk?=
 =?utf-8?B?N3VvdU42cWI4a1pKSXJHbWVLV3dweXpYNlFuOVUrYWFGUVBuM2t0TDZESFc3?=
 =?utf-8?B?WjM1V0pJbmw2Tmg0QllWeXZiNG9WU0hGRmNRejZDRFQrTXNHOXBoZ0tDZDlX?=
 =?utf-8?B?V1hpRGNPekNySTBTRUdLUSsrVUhEbVNZMjI1d3VaTHN5Y3ZLdjhNVkl1ckNq?=
 =?utf-8?B?cmpmQXl2MXpmYlVJdTh5VEltTmNweklUaUFtcVNGVlMyL2V1RGsrY3JZRERt?=
 =?utf-8?B?Zi8wZ2hrSjJwbVFqTTR1bTZ6T0RubUpoUFQ5NVhtMjcxQktacFVNdzgxU3Bk?=
 =?utf-8?B?Y29ldTZOckFvRVBiaHlVQ0hNTHgrSzdnWG91UUV3Z1k3QWVIdEd5ZC83YTBt?=
 =?utf-8?B?Qi9QTWJSc3NUbG1JQmZxdnArVDErNGdaSEFnYy9HS045Z1l6YU1wT2wrWHZO?=
 =?utf-8?B?K00zbWdrYTc3eW1HczhWQUlpQkg0cGhZaDMrVng5cDJIcU9VYnQ0SGpSUFgw?=
 =?utf-8?B?eU0zcldNOWJYMmhaNG9OSWNvVU1Ub1ZxdEgrRGhNd1d0eWUyTmk0TWtsRlVK?=
 =?utf-8?B?NnNuU3F4ZU9ZQld6Zy9VV1hLRlBEeGt6dTgrUGdlbkwveEIxN1lEdXdmenNQ?=
 =?utf-8?B?bnFtK0o5c3pVVS9iOUg0UjRDTU41bks5TU1aR05OazB0alA4bHNoRDBoYWlT?=
 =?utf-8?B?NW5EbGlUWUNaZEY0M1RBTi96SzJhMHc3eDE4bHJadmtFVUlwQzVWT2F2RnI4?=
 =?utf-8?B?NEZ4bVQwVU1aQ2RqQVZnVU5GT25qT1pYbWxSc0tGQVJ0aTlOanExeVhBVWcv?=
 =?utf-8?B?c01ncDNXcUhiS211TXZCZUx6VDJNSlU1S09uS29lWXdFc3lIeHJkRFRzei9J?=
 =?utf-8?B?ekd2Z1E3ck1XNjBYYmhYMkZsVTlzR1NkZFVKRndrRTBXOVdIcVhpbkV1bFQy?=
 =?utf-8?B?VlQrK3BkTjhXeVZOM1BnZWo2SXA5ZGFUT0RkRFFLbmVlUHZnbGZBRjhFYzZ2?=
 =?utf-8?B?NlRtRHJyNVZ4dVYvTlBPZjlsV0RrMzBkV3dLWHZZWU04NXV2L3prc1ZRbWhM?=
 =?utf-8?B?V1dOVGlMOGJRbVJEVVF5NHpXa1k2d1UwRWJMaWd2TnhGMkxUeW9oQmhlYmJX?=
 =?utf-8?B?TVhXSTd5TVh6SVRkZENwaTl0aW82cnZkeEsxVERYd0t1ajViaVBiN0NPWDFE?=
 =?utf-8?B?cXpiWW55a0dYcFRDOXVTc3I1QWNUczIrMCtDdkRhWnYwMlBCbTZHZ1ByeURr?=
 =?utf-8?Q?gFe8jUCmnZu2NaUZsm5U0BDJJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef63056-43d7-410a-1aab-08dcc11d15df
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 13:36:24.7781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvAPnR5V/bdPKiSTiQOWi6bK4Yc/PfYWPUgoBPVP5T7aT0dRSwFlByAh4/9ERg1H7KC94mons9Rw0kCRmMpqyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
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

Hey Christian,

On 19/08/2024 13:21, Christian König wrote:
> Am 19.08.24 um 09:21 schrieb Friedrich Vock:
>> In Vulkan, it is the application's responsibility to perform adequate
>> synchronization before a sparse unmap, replace or BO destroy operation.
>> This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
>> that happens on sparse unmap or replace operations.
>>
>> This has seen a significant improvement in stutter in Forza Horizon 5
>> and Forza Horizon 4. (As games that had significant issues in sparse
>> binding related stutter).
>
> Looks pretty good, I have Shashank and his team working on the similar 
> patches ever since Bas initially came up with it since we need it for 
> user queues as well.
>
> Shashank can you take a look at the UAPI? Of hand looks pretty similar 
> to what we have done as well, doesn't it?
>
I had a quick look and yes it does look very similar to what we have 
done in VM_IOCTL for UQ BO sync.

- Shashank

> For the internal implementation in the VM I'm currently working on a 
> bug fix for the KFD team, so this is subject to change anyway. Going 
> to keep this requirement here in mind while doing that, whatever 
> implementation we end up with we probably need to re-base it anyway.
>
> Regards,
> Christian.
>
>>
>> Userspace changes for this new version can be found at [1][2], and a 
>> kernel
>> branch containing these patches can be found at [3].
>>
>> [1] 
>> https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-explicit-sync
>> [2] 
>> https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-explicit-sync
>> [3] 
>> https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/amdgpu-vm-explicit-sync
>>
>> v3 changes:
>> - Rebased onto current amd-staging-drm-next
>> - Added option to wait for drm_syncobjs instead of executing immediately
>>
>> Tatsuyuki Ishi (3):
>>    drm/amdgpu: Don't implicit sync PRT maps.
>>    drm/amdgpu: Add optional explicit sync fences for GEM operations.
>>    drm/amdgpu: Bump amdgpu driver version.
>>
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76 ++++++++++++++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
>>   include/uapi/drm/amdgpu_drm.h                 |  7 ++
>>   14 files changed, 194 insertions(+), 66 deletions(-)
>>
>> -- 
>> 2.46.0
>>
>
