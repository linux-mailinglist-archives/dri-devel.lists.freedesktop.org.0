Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E996ACAA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 01:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE42410E623;
	Tue,  3 Sep 2024 23:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wkU249GA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5F10E622;
 Tue,  3 Sep 2024 23:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyqfA0WOtRzwUZLukDYrQ2V4ZVUw9gOMb31TulGYP3M1y1Kq6ocTyZsb75kKokhnNpD5hpnQDGbIOmZu2rhM+c2xEOMdRuJ7wFmE49LsIA1vRMbwaRUiOzNXMLRTCwuuuyC0c55vQu186K+TiWnHSCVF+z+7APJI3VHmo2CX1TiA73kcK68TpH9QYvAEAsXJ8wPWZf3lPABN86FxeJfnBS4OgwuieaMAotkIT0ipqXm4f3qGa77DaHeIjXDzk2e8O+r83OkWij8ePZRN2LTc/ajblOumo+dvAdoOaIevP2YWc323froZRGa0kHKk4bVkLUvCH9YAhIxG/U6XCGfuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qrJUJVkIJKV6C1Ebp+MTAiBBfiwzvDBoyH2atPuYws=;
 b=JzRpZWgDSYh/qIC6srXsRjp8/gwpPC2MdSgsw5lQ+I2QTTMAC0z+lActsPtfwYLTnH9DZPE2aFKxEX7EhhgIgtJ/6C5k4AMb0BAXTiblekqD5jOSwX8Cj6K8MO4/KfFWSww43R3eAG9QwqgAbNrJpgHUi4nk7GkVklhNzLuqadsKKNpiXwdIQtb5KOiY/mWKpELRfJsDRo6SdOdrMM+lnTPSS6rMqA8gRPBt+msR/xZEwfqsQFeaW0UZcTa8aLPRWNwVNwcg5uS2333ZmNSg/nidmSgbRiTK8ear82mLiWS8ROjjIf7882nq/JYz1unfSIsLKa/fbF4TXaF5mT1McQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qrJUJVkIJKV6C1Ebp+MTAiBBfiwzvDBoyH2atPuYws=;
 b=wkU249GAiKTbWuvkVvTG0jc4aP4c5WwucnccpbV7q9gBci7najJSrsKY3P56aVEF27yVTVOeHFwPuaS94mVttB1ijQpbT1k/PCtjpxW9WqzsG9OXEGpM01lnNl3yh25wdc/AMV1Fzzly7kY81BXzLeAcMDZ/D6VmQrYx4VovzL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 23:15:30 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 23:15:30 +0000
Message-ID: <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
Date: Tue, 3 Sep 2024 19:15:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com,
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::31) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fc01da-32a4-4167-a751-08dccc6e4d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEs3NTRZSU9nNHhYc0JXd3ZpOENuYnVJRGdwZUZaa2tBY0xSUHAwK2ptUTdO?=
 =?utf-8?B?WGRSVnpGemJ3cXZTT3J4cUVGVzF3RjdHbHRjNGx3dTYrMGYvOWJRWTFMN0xn?=
 =?utf-8?B?dGc5c0J3dUJjNzZaOEVjRVVYUVFyMG91WFI1NWRsRkRyL3lkWWhycGtCbU1z?=
 =?utf-8?B?RDlwN01zaThEckVBRFlsQVc0ZjJWUGQ2TkcydWVWMVFVaFlZakYyUitqdTJK?=
 =?utf-8?B?aDBRMVhva1JPTG91MytxaForMXh1ZU84b3BzUUdIOUZ2TnRROWk0Y2QyeXh3?=
 =?utf-8?B?eCtHVTJqOGs0YTdlbTB1Tmw3L0VYaitZMTBSNEdRTGoxMzhLRUZzZFJFOCs5?=
 =?utf-8?B?VE5Oc1J2ZDdTTGhyQktaWUgxV3dDdzNZd3pwZVY3ZGtoZkJyTHU2YllhdXZv?=
 =?utf-8?B?TWlPWUQyUElIN2x6Y2YyUUJydVBVV1lhazYrSEdwd25OS0NpWFJJZUpyNExP?=
 =?utf-8?B?WHFTRm9DT29MWXUrOUFJRStnSVpIbEV4WnBlL240VnB3ZXZiaHRnNVkxR2ls?=
 =?utf-8?B?VTFjb1gyWTVTUktWRzBUZnRlSnYvKytqbTZiM0sxbEhOQzNBdEorL25XSkJa?=
 =?utf-8?B?VTR5bkE5ektjanhtdUFtSWMvNjR0MlNWUlBVTEx5bk1BT2ZyWkd2clBYZEJ6?=
 =?utf-8?B?UmhFbHowWXROdUhVMzZuRzIrZjE4VEo3U3JmalRRRjBub2xTQnUvbmp1bG5E?=
 =?utf-8?B?WWxnK01oYndTQzJiT09FZWJCOUlBVlhZWHloak05Tm90VldqM3hlU3ozMjMz?=
 =?utf-8?B?Q3lyUDJ5WmRyV2RIcE16dElkeVZxK2xPNWN4U0RONFk1cEZhVy9udmZQNnRT?=
 =?utf-8?B?dnJORFdTY1F0OEZ3WVluRFZnNVgwekc5Y0lzb3VGZG5YbTVBNUxQU0wvVFpz?=
 =?utf-8?B?V2RLaG01R2RTWHRLcHlWS3AvVkJDODdFQnFoNEE5dHhNUVBxR0VKYkJIaytI?=
 =?utf-8?B?VnR3U2NGUE81SGNRQlRCTk9TYmtrSUlKTnp1MUdLUTZlWWw4a0JhL2V0aVRC?=
 =?utf-8?B?UG1mZmgxQ0cyTjd6OERSNGdKLy9hcHFFTDU0Skc1OVhhczQ2LytQN3VscE9Q?=
 =?utf-8?B?K1g3VlE0MnlEZmhSWmFQNzJ3a3dnUlB6MXIwZmFuWVVYSHRqQ1l2QUZsZi9T?=
 =?utf-8?B?OGFHN2ZoVXNkcWNjOFhSODV1ZkhSNitRS0tCZiszemJQTXpTcDhybjU0UU8r?=
 =?utf-8?B?UDVFTDZNUHpvaTdCY25CemNZR0MwNlN0Qk5neDFMR1hkS0FxU1U4TjdQaW9M?=
 =?utf-8?B?d2taNnRhK1M2QlMvckc3dDZPUVRRQmtsdzFwRS8wdTk5eDkyQTUyTWJnM2Vj?=
 =?utf-8?B?b21FMkJWaHFPNzlsSUw2OVJFQU9STEM2ajJKUFpWMU5yUTcybUhQRmxHN0Jm?=
 =?utf-8?B?TGRCQUc0ODFjaTJwQWFjWkdOTVBDbnVQZ0s2bGRDNzJkdEZFOGpQeGlyV1BO?=
 =?utf-8?B?QXE0cVFIaTV5RFc3cmpxbVJTMmU1YnllR0E3NG1KekdDNG94QTlKamg2b0th?=
 =?utf-8?B?c25la2lVTTZVcUVCWlcva2h6Vm5TMCtjWDJveDRrNXB4NE9tVFNxVjdWSnFh?=
 =?utf-8?B?dEUzVU9NOVA1bDJRZkxVMnlYR3hkV3BnWEFyc0JERlFrQjhWZkt0Tld4ZWR4?=
 =?utf-8?B?d1E5VCs1MGxDTE9CdHpYWjdQbmZ3ZXZPQUJqb25ZSXVNRXdVUlZBOU5FZ0hR?=
 =?utf-8?B?TzhHNkgyTEV0aExuRkYwK1gzVktGUVZPOFZRVm9DSTRDR05zbmlKeXY5K3VF?=
 =?utf-8?B?RTd4d0d0eVhBL1dZNU4vcmJkbjh1eVJjd1N0RDRneXB1bi9CWTF4cEdnUWxl?=
 =?utf-8?Q?/1nL3Y50ksVVME8H4tL6ahesDCH1M69CzMq84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdrVHoxV3hFK3NEemExU0QzRDBGWGk1Qm96RkVCMnRpQkJsZDVBWFBFc0Zr?=
 =?utf-8?B?dmJsU3R4WEVsdWpqYTFJb0l3azMzS2JNT1hQQnBlRm9NaWtQaXFLS1VBb1Fm?=
 =?utf-8?B?OHlLWmYvUnJUV2hFZFNoZHJRalJoMXhZVEdwMlBtKzRRSU5DU0hxQXgzS1Mv?=
 =?utf-8?B?YWRNK0RkcmxMMkRTY2M0OUdONjFOSVNOVXFQZTg1WUFEd2w1cTdId0dNa05n?=
 =?utf-8?B?L2hOeHJ5K0UyeTJac1FhMFNhVXdvN1JoTTlhVGhKRkEzK0pmWDUrWTcwYmpy?=
 =?utf-8?B?VHlTWG5TT3d6dkpzWE13S3o3VytmZkoxVkpZT3F1dDJCOVR4S01IYXdxZHhG?=
 =?utf-8?B?eUF0dU1ma1NSM2xiSy9ZT1Y5NngrNFFxcHBVT3VPb3ljSXc1WFBjeE1RNkJs?=
 =?utf-8?B?ZTJaR0VmZ2dicmZtbzg3V0NOcUF0YXdKcUxFdENybWtydDkvOG94MUFkY1cw?=
 =?utf-8?B?eFlhSnoxcWNUNnExU0dnSjlDVFBIYnRWRDU4R0k1OEpLcVBFeHo0MlF1WDhp?=
 =?utf-8?B?VFdJR0FrZmF5N3l2UEhyd0paVFhueGJHN0VwNDRrV0NQbHV3YVI0UWpXODVp?=
 =?utf-8?B?dVZxMitCUjBPMXg0cVFqM3E3MmhZNVlvcjJhOHJLVTE4U3R4VzFiMDdwb1A4?=
 =?utf-8?B?Q2wzTXdLcW01aVlzQU50ekJYR0Jva3JpM2lSMy9tdzZOWFAvc0krTWV4YVJn?=
 =?utf-8?B?SE8rZk9mNHZXajZHOEp0NjNmUnpPZXUrSmZGWHp5d2IvTkNtR1RDbWsvNms0?=
 =?utf-8?B?bElvTElwRnBENkNqR1M1UmYwaFl1M3B2d2NFQS8wRHEwOEU3MVBlMzV5Nmg0?=
 =?utf-8?B?TDhjdHZQOE5zaktadWI5eFF4T1BEQUIyRGc0aUhheWYyTUFKWHhyOVYxZGN4?=
 =?utf-8?B?ZWZlMGIxQ0hFM3FFeHVQZkdBZU5wZTBiUFB5K3RNeCsrOERJWEE1b3NpcjdU?=
 =?utf-8?B?ZTRKTnJWejVLRG93VWtkQ1NiM2VaR1RoWStmTnhORTUycDhrNHVkV0xISDND?=
 =?utf-8?B?RlZkekZlK1dHVGRDZXpNczZJYWVydEF2eHNIS3o5VDZFODJ2ZjM0Vk5WdnBN?=
 =?utf-8?B?d0E2dTk5MTNwUDd5U2lLc0hhZGlHNkJITTQ5eko2K1FYcEZta0JvQXhRdGg1?=
 =?utf-8?B?OGs1Q3kwVHpWd0JENUNNSVRQeFpoMlFRM2ZSZGV6L2NCQXVpSFNmTnNjSmhS?=
 =?utf-8?B?OTNiY0lSWWtId2g2UVljdjFzT1RYS2hiazJ4V1piRndBRHlseGVTZHNKSXp1?=
 =?utf-8?B?azlxdGZCT3o0YWdsbVc4Y1VmNUdTZ1FkOFpqSkV5cSs2Wm1pOUU3VGF4U0dp?=
 =?utf-8?B?Qkw2cHRsLzQvcm1vTUM1eEZzdGhyRjFXczJyUy9zWGY0S0VLYklsMmp6aW1N?=
 =?utf-8?B?bWJEdVBLWGJBQW1yRC9EU0pYQVk2bDVkeFlEWUE5cTRwMmZWYUZaR2F5QUlk?=
 =?utf-8?B?WTcrR21PMnFxVzJFNWNoSGFZbnV6OE52dm5jd21iVUJ1T2FydmxVLzNMU05W?=
 =?utf-8?B?ZDkwcFl1YzVaUlA2WEphVGVvQStqUUdDZ2VrTTlGTmJCVFpxTVpTdHRRcUJG?=
 =?utf-8?B?V2pNcFNlN0U1ZXcxTGltajlZV0FTZ0hLQmZEaUdIbUZEWjBZWWlxamo1WjNE?=
 =?utf-8?B?eTdqN2xUNldJbzVmdnIraXhCSnNjS3VFVzloTXlJa0M1TFZGZlZJVG5rOHcr?=
 =?utf-8?B?SXMybk1qZzkyZ3BaQzhwb1NxMjIwVng3d0tvRHVlYWhBaUQzeGpma2wvNThJ?=
 =?utf-8?B?RFNXeHRLR25CZ2FUUTlzNCt4Q0NuSWJVQ3padXpqWG1aSnRnbUUra2xiUmsz?=
 =?utf-8?B?R2diOEZVYnpRMWpFSmU5N0E3endOTjJudlV4LzduZm1yVUlPU2R1bFcyMmZD?=
 =?utf-8?B?Nnp3U21yUEh2V2toMWlVZVFvRjdqVVgzVW13ck5zZ1ZZODM2VmlqOVJLZlR6?=
 =?utf-8?B?UVVUOGoxVkZDU2lCK3ZhNHVKblF0bnpMVVZMazljajkxU2FLSllLMEp6ZkNm?=
 =?utf-8?B?T0dvQ1o0Y2lnaG40M3lkeWVobWFuOFNRak5xSWVtOUJ4UUhGK0dvc2c0MFpY?=
 =?utf-8?B?NU54cWVMcitwb3F5NjF2bWdlNHloWUVFNTJRd0crek1MTjdzTTI4UWdRMTNZ?=
 =?utf-8?Q?Rt1pl8OADhSvKvsVB7iiKTtHU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fc01da-32a4-4167-a751-08dccc6e4d70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 23:15:30.1316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KrM29wbzqoxyw/7sWTcTkRzgne/uB8PvHMNxebZgOPKtpCzmXK7GX4CJtue5862
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246
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




On 2024-09-03 02:35, Mikhail Gavrilov wrote:
> On Sun, Aug 25, 2024 at 2:12 AM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
>>
>> Hi,
>> Is anyone trying to look into it?
>> I continue to reproduce this issue on fresh kernel builds 6.11-rc4+.
>> In addition to the RenPy engine, the problem also reproduces on games
>> from Ubisoft, such as Far Cry 4.
>> A very important note that I missed in the first message.
>> To reproduce the problem, you need to enable scaling in Gnome for
>> HiDPI monitors.
>> I am using 4K resolution with 200% of fractional scaling.
> 
> Sorry for persistence, but I'm afraid there's no time left to fix this
> regression.
> There's a week left until the release.
> A month later, no one has looked at what the problem is.
> 

Hi Mike,

Super sorry for the ridiculous wait. Your first two emails slipped by my inbox,
which is really silly, given I'm first in the to field...

Thanks for bisecting and finding a free game to reproduce it on. I did not have
luck reproducing this today, but I am on sway and not gnome. While I get gnome
set up, will you be able to test which one of these reverts fixes the hang for
you? Whether just 1/2 is enough, or both 1/2 and 2/2 is required?

I applied them on top of Linus's v6.11-rc6 tag, so hopefully they'll git am
cleanly for you:

1/2:
https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0001-revert-drm-amd-display-move-primary-plane-zpos-highe-patch
2/2:
https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0002-revert-drm-amd-display-introduce-overlay-cursor-mode-patch

Thanks,
Leo
