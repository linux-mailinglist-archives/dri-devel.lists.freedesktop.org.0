Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE2962B98
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5003710E57B;
	Wed, 28 Aug 2024 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UgIU1TJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79B310E57B;
 Wed, 28 Aug 2024 15:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CStJUbrj3uRkpfGtPj0w6evb5D1xA3fJOLZP6Pi6JqxbKFCPd9dEIi7YP0UkQcaIRRiTBXAs6R1N9lGp7Xo07UVfbWYjQC6xBtHM3qnjW/hBfhRHgpZzuhSSaYW2DCgvgSkT0V5LesUnZNqIt0ODZB4BFkps0aBCAgHO7KlNMKLUvctP5IyBBOfGCpeVzBJPQHrLQw7ckWFQPBXTIQYi3vAVf14kid2jwdYUIVbe7gIdzJK5K9cKMC2uswC+bALb9c2uJKkCNW/VJFxUSZB+QMtV7q9+lLBsHBod7aplvSx1NhjPmICcOO8YHKItaEu+k0TH2Co2JeokU8kXj+hjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1GjcBLYsFuJs9wR80p0kFAvlZ/BWZTscW7EB4iG/5E=;
 b=JtUJFE/Zm+4gIPNOq7cpI4RyFH0qCq+ZGI83l7m0aG7DCtzjb6bIKoi8Bf6dDjtCaMY09PRrCbPRexI91k1ZqwZJN0QGW2gPDfQvwDhUtrclmjq00MkW/cfYVo2+05gUNf+JfJfiZrzxVBgVDxh49nvEiR3z8p8nOwQ7tXXIwp0K01nZTpI9YisaUunI5/mzj7ro1yey4ZStu8O6fXGzNHwNgXtOl350rREW7sOVxmCDJPrTUgRCbEC1mGpvrchPFzSPCbzXlO0Jqw9M2g9mJjB5EnGk4ZDH9rUDwSjjvrhM0d9dabNkvcYkSqbj5hoMuk2yhDN/CcoUEmrTxTT01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1GjcBLYsFuJs9wR80p0kFAvlZ/BWZTscW7EB4iG/5E=;
 b=UgIU1TJ4yH83FaSF54Az8TFhsV1cCisHPu4xXFgpNuUWAP7o7cea7/0mSLlzjD9ZrHdPTyoXcmVAvqEkDUk4y4tsWRAp44xFJI0wm80+qqHGkRWeBBZ1JEfpROSL4G4BM2ZbUrMIYZS0v2z3jakbp5KjD4kvkgPunH3G8Ca72xU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 15:13:09 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 15:13:09 +0000
Message-ID: <6de5372a-e0f5-4b85-8f13-e3788919010a@amd.com>
Date: Wed, 28 Aug 2024 11:13:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <dac8f408-6f13-4ee7-a54c-342d51ba88d1@amd.com> <87mskwyc6p.fsf@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <87mskwyc6p.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::37) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c6f86-994e-478d-67d4-08dcc773ed54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bElkKzhYc25tWXhzeHBVc0gyVnYwU1dlOWkzQXd0QjZVSUxSOFlGREJ6ZDJ3?=
 =?utf-8?B?MTE1N20vZmtpcndpV2d5ODZvbnQ1bmFtOGZDQ3ViZWVrMGlLZi9NcUpiYm1U?=
 =?utf-8?B?WWE1clVjTktkWVNwYUc4dHhhSWt0OEtrakhqTkVyZ1JEekZmay90dHYxZHZZ?=
 =?utf-8?B?QUhiaVk0M1UrUS92c296UExLcDBKT1Z1emhaZzN1R2loY29zUk4rOFB5Q2Ja?=
 =?utf-8?B?TGliNlZMb04zSm15YU9kT1VZSlc1SWdJcTVBNHA3RzNpSWQrWVFiaW1USmQy?=
 =?utf-8?B?TjNqSmRUSk9wdndDd2Z2ZWRJVVhoS1hQM2xlbTgxU1dyTlI4SVRIWlhmcDBp?=
 =?utf-8?B?MEdkeDE1bjdsaDNEeThRWjB0N3R5SWlVYWJsSUNTM1BacW5wZE5MZTBnL3dV?=
 =?utf-8?B?RElmT3pUdS9XM0lZNnZUdkpyRjZQYzJxS0RPaE9hRzBpODJwcjB0c01hTUkv?=
 =?utf-8?B?NVFCVG14TEJJZW1WN21DRHVrTkozaGplLzdzUXcxSmpyK2FqQVBkMXp0M3Z4?=
 =?utf-8?B?SUNkWHgvajNFQU9yODg3Mkx2djUzSkRBMU5Dek9FMG5tWXZzUWtybzNoSVpS?=
 =?utf-8?B?bmNMbllLWTNBRXgxR3JYb0wzM3NmdVcwK3A4MjFsazNIMklTSFB3YXZCaTNm?=
 =?utf-8?B?UnVqWU1XQ2xFNWdUOHBvTnRSSkMzMXhmUnBCYnJlaUwxUWpaZG9CQ1NXekhy?=
 =?utf-8?B?U1dyMDNMUU9jTXFNdTBRQXVmSk1aZHZOdmQ1V2V4RkFYMGdEMitmWWRpZUhW?=
 =?utf-8?B?Z255NXhiUURMWUQvLzdNVFZyRElIb2RaV0hYUXNwZjJmZFNUNThkOWlhOHEy?=
 =?utf-8?B?aEtOQWUreWpsMW9lL3NxWkJYZ1MweSsydWRuTGtoT3d1aS9uMXUrTlQyTEsr?=
 =?utf-8?B?OVh4OUFlQi9WVDJMbzFUMm1ka2krTVFyTkxLcHJHa2dNWTNlOVVHMVQ5VEsx?=
 =?utf-8?B?L1krMCtMQTRoUC9qUXNkOXpFM1N2RUN3N2F1MzZ1NUFJOTh5UDlwMmdudVdl?=
 =?utf-8?B?SEo1SFhCUnVTcGRHMm1la3JSdnVIdUNJREVhd3dORU05eXlydS9sbXhGTWVm?=
 =?utf-8?B?VlFYMjQ0aGExVlI0Z0VzTmd5Q1QyWlQwWGNtWjFnd2s0TjV1MWVUbFJGcGEv?=
 =?utf-8?B?Q0ZsMEJvZm1IRkdabys3c3FjT3dBT29xUmFKWWhjZXE1dXByclNTVDhuYnhk?=
 =?utf-8?B?YmN3VnFWOGxidm5kdXFnNDUxakZKUG5paDdXYkNUaUlBcldXY255dlhueHFp?=
 =?utf-8?B?ZGNOYWtlYnVjMVFtVXpRNU8rZVViQklES01mcTZ6TkFNeG41eThtNWtqUzM0?=
 =?utf-8?B?bHltekVadG91NGljVUVjNlVzK1YzV0x3WlRMcjRrZlZ3TkdoeWtUTVlvekpC?=
 =?utf-8?B?SVA4eDRvb003alcyNmFmOU12TWtMQ0hjTlVDcmpJeElEelU3SFZZc0RYcFd1?=
 =?utf-8?B?RS9pZGhFUVZtd0Rtd3RrNUtHbXY3L3ZneEszNklhNWtmUVdpMWNGMXg5OGND?=
 =?utf-8?B?RUI3VzBnNEsxdURuSXhqOVdaQ1hhTEVLbzJNQ2ltU09nM1U1U1ZLZnFha0Ez?=
 =?utf-8?B?UUpRNFVzVFFoa2hnZjhFeEpRNU9QQzlqL0NDZk5Fa0NrZ21HOG01WmoxY213?=
 =?utf-8?B?N2FIOENUZE1jT0VqNGNCK2tXcExycFFTOTJWYmxaaXhMRVV2QXErOGw1cnBv?=
 =?utf-8?B?UGdFUVhFQjZYRlp1U2RWSERSQVo1RjgzZ1p3bEl1dTZ2NlllWDdjZFdQUzNI?=
 =?utf-8?B?c3d3S0syWkdYOUVsLzdZTWwvRVlGeC9mVlR6b05ETDUwWXZUZUxiQ1RWS2Nh?=
 =?utf-8?B?VTVySG5xOEtrMm1Cb0E5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lJTUxhTHNTL0NLaFVTQmRQdjNWZXllYlI5UWJ6ZTRTanVWbktEUU5DVFJT?=
 =?utf-8?B?VGtzYmdPOFkrMTVJbHVkQXZIcWwrVDljWC9sTVNpUURwMmFBM213Tm1wUTVv?=
 =?utf-8?B?bzdmc0EyOG05UVRSanFkOW4wbnY3OXJLYlpjd1ZXbTlUYVFKTVBSdEk2OGdO?=
 =?utf-8?B?alNGNGtCMHE3N1RxZkFwWmVPUTZ0MkR1SEYyZW5RTTJrVFBrbHJPRlk0a2tB?=
 =?utf-8?B?RW00eE1udE85VkxreTY4L2NwNHE4aUhwVWJvWTBCVXhRY25DNXhqUFlyUkZi?=
 =?utf-8?B?VnM1UUEwOG9nalMyL25QRG5FcXFpL3pOalRCVzBya1NaTDliZVI4RlFHQWFT?=
 =?utf-8?B?NmpSb2kzc2VXWWM0cVZscEVwWTdPdGx0VGV3c1BHeUI5NE5WVktvUHp3a3Ix?=
 =?utf-8?B?Slp0YzBkZWYxZW5PbTdGNlZIWFlydGMxMFIyd2lNbENpMzN2d2kvdnVVeUtk?=
 =?utf-8?B?aXZEbU1xU0tVV2MvN2FnakM1UEp6NmJqRGt5ay9GRnlKL29mUTBTMWVBNlB6?=
 =?utf-8?B?M0JDdnBLbzJaK3ZZNUR1TFkyRUZMdXMzWVpXZjVlY2UvU3IwektVeGpCam8r?=
 =?utf-8?B?eWZ1TkFUS2FYR0M4NmlBYXNqbG50a3JzbXowNXpQVjdSdXlkc2EvdkVBVGhK?=
 =?utf-8?B?NzJoVkl1MFk4RFdiaW1nZDUxc29oQmMrTjNGVVJTdVpvRWxqRjFQdm9sTlkx?=
 =?utf-8?B?dnJVVFlUcmNSQ0ZQd0g2Zmh5Z25IRzBvR3MrZ2hrZXIrRHF1emh6L3V1ck9Z?=
 =?utf-8?B?T3d4eE1OUGNGZ0Y3RDV4SHpPdnBmbzVUSkU1K0Jod3RkL2xibW5VaDQwOXdL?=
 =?utf-8?B?Y25TRWRCZ0N5cjVvNk1VcWtXZEtqMzU4V3Zwb0ZxV2E5Sk1UVmNUUVc4aFRE?=
 =?utf-8?B?L05yUkE4RXNaTDVzNXcySk5Nb3FDT2FVTEJuNXl0ZTJOUmlncWNqN0hTY3lF?=
 =?utf-8?B?Sk4wNjlZdXlCWGdzQUhkKzZFZ0JRR201alltdGVBWEZwUFhOQy93YnpjZzJt?=
 =?utf-8?B?dG9HdDZReTNrdUdTTFI3MGhEZXlxNTJkN0NHQXR0blZNRUgwZnRwZ2pJdUJM?=
 =?utf-8?B?Q3VVamNRZjE5MHlsNnlhVGd3Yzl3RWRNcGtSbDQvL2RRNGtMWFljeVUyYk5Z?=
 =?utf-8?B?Y2ZFYTBwbEliVElncFhybndqcUVmdk1zZGNGdXVZSXhTMml1djVqemU1K2Vz?=
 =?utf-8?B?MGpSMmpkYkw4YWlNWjJyWDgvNVROaEhaTXNZbTFFLzRDa255WGdNRU56Wng3?=
 =?utf-8?B?c3VsODlXZWU5R2R5U0Vqa25raU1QdVY0aUJFV1d0a1o4VjVzSGxCN05tdTEx?=
 =?utf-8?B?T3hpNDVqc3FUZWxmYWVWRDdaVUE5cE1tQ1ZtNXhybFJLaHZsV21NMlBNVFdK?=
 =?utf-8?B?SXRxVGNwcWVhdzAxUUtrTHlBaStCZTUvc004dGd6cUdFSEZjNG1uQlcwZExN?=
 =?utf-8?B?WlN0Z2ZBcjZEVk44MTcxeTJDTXlmS2dSV0JiQjZDNi83Y2lqUmF6dEJNVFZK?=
 =?utf-8?B?YXNtVk94bzZyMEp4TEtOT1AxYmxUa005SjIzVDAyRTJVTGZXbndGTEtsSWl3?=
 =?utf-8?B?SDg5QXVlSDVodkVnMlhyVWF6Yk9ZTEVyNzc4V3diNFdKaWxtdHh2RnBtR0Jy?=
 =?utf-8?B?dUdPZ3pSRkNKb2pQL1pNWklMUjUxNmNXNThpcW1lRGZRZ21SY1phd05wSU5K?=
 =?utf-8?B?SkpzdzliUU9RaTJrb0FyZjVjL1A3eCtOb3JpTVFSVkZKSy9XMmh6cGl0Y01p?=
 =?utf-8?B?R0NvVnluTUs1QU9IcFVHN2hsZTZNRU1SZTE2ZHU1aEJETGNCbS9aZmp4QVE2?=
 =?utf-8?B?TzEvOWo2SnNVTlE1TDdTVW5NcmJQTWsxTm1OSEJRWGNFZ3M1Uy84VEV2K25k?=
 =?utf-8?B?RHdQL1ZlU1FUYXhlbThnQmwxYUlud0YxcHVJa1NYRUdPT2VROXBqU3krUjRS?=
 =?utf-8?B?RTdUM0VKNVBmOUhoTFEyeUtaSkdtbE9NUjlhN3RDWFRBNXZsQ25BTVVkbk11?=
 =?utf-8?B?aTVQbjFWODZVZ1liUzZSYm13SDJOdUZ1dVZNc2ZkSjAxd1NJendXRXppSHRB?=
 =?utf-8?B?K0R0N0lyc1V3RXB6dDJGd3J5K1pQeC9kY2kyZDZFcU5IMkFuenF5RGcrb3hL?=
 =?utf-8?Q?m9MHqZnRDy2pfBxv9/hg27UNF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c6f86-994e-478d-67d4-08dcc773ed54
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 15:13:09.7933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nm46VFiZFXWRRPP9EfEBG5eKDZDy9jVweffd4TM0pUYr4/9Dq5qqTu5vRjAE7IcwF1FE2ZtMnSKceAGdb5RXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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

On 8/28/24 10:06, Jani Nikula wrote:
> On Wed, 28 Aug 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>> On 8/12/24 08:23, Jani Nikula wrote:
>>> Instead of just smashing jiffies into a GUID, use guid_gen() to generate
>>> RFC 4122 compliant GUIDs.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> ---
>>
>> Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>
>> I would prefer to take this series through the amdgpu tree though,
>> assuming nobody minds.
> 
> How long is it going to take for that to get synced back to
> drm-misc-next though?

It might take awhile, so it's probably best to merge it through
drm-misc-next.

> 
> BR,
> Jani.
> 
> 
>>
>>>
>>> Side note, it baffles me why amdgpu has a copy of this instead of
>>> plumbing it into drm mst code.
>>> ---
>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
>>>    1 file changed, 12 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 72c10fc2c890..ce05e7e2a383 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
>>>    
>>>    static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>>    {
>>> +	u8 buf[UUID_SIZE];
>>> +	guid_t guid;
>>>    	int ret;
>>> -	u8 guid[16];
>>> -	u64 tmp64;
>>>    
>>>    	mutex_lock(&mgr->lock);
>>>    	if (!mgr->mst_primary)
>>> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
>>>    	}
>>>    
>>>    	/* Some hubs forget their guids after they resume */
>>> -	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
>>> -	if (ret != 16) {
>>> +	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
>>> +	if (ret != sizeof(buf)) {
>>>    		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
>>>    		goto out_fail;
>>>    	}
>>>    
>>> -	if (memchr_inv(guid, 0, 16) == NULL) {
>>> -		tmp64 = get_jiffies_64();
>>> -		memcpy(&guid[0], &tmp64, sizeof(u64));
>>> -		memcpy(&guid[8], &tmp64, sizeof(u64));
>>> +	import_guid(&guid, buf);
>>>    
>>> -		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
>>> +	if (guid_is_null(&guid)) {
>>> +		guid_gen(&guid);
>>> +		export_guid(buf, &guid);
>>>    
>>> -		if (ret != 16) {
>>> +		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(buf));
>>> +
>>> +		if (ret != sizeof(buf)) {
>>>    			drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
>>>    			goto out_fail;
>>>    		}
>>>    	}
>>>    
>>> -	import_guid(&mgr->mst_primary->guid, guid);
>>> +	guid_copy(&mgr->mst_primary->guid, &guid);
>>>    
>>>    out_fail:
>>>    	mutex_unlock(&mgr->lock);
> 
-- 
Hamza

