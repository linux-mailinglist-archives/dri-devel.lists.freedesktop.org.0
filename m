Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD44B3FC9E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3C710E65C;
	Tue,  2 Sep 2025 10:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ikK1cpfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FDE10E1CE;
 Tue,  2 Sep 2025 10:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWHIDY1xTNZJpC3/2LssjvtxxWrvNKXh5j4bKj4eA5k4wCSozhaVig7//wz/Ri4eC6tUB4zOGx9pnuQj+tsKRMQhZoS2HBBOYTjPZhZsTtN1b3970sDS4nCmYLhBEYXVxhiRxOqsvLIHJTzmgrbJP8UA0nr0KMwVaItYde+tN33hb9VfCWRgQcrMwSMMROybufzngRBMYE15kHoxuPI0OgL17QqpPuvGy3tqsFMW/daavzU3/SqaFYWAY0+jFxAw37eht5+FSEfRE4IJe8iuFTUUysZ4R7qEDboeFSyLoxkZujZPay+IS3e6lpsXaQdwxjCPd1idcl0d/WSHm+UMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5wLon03QuMUjgartJclxVKJZVFf/LNEziiV4IpLQjo=;
 b=bSw9IbPz1Uhye/INkeeVHn6FGj/a/7+dOaXFiOlv8IgdMo8o702V04DOA3Yq4YKmmgflK4KM1CmZOU7KaV76TLs9/pA/NcMA4qK9tTvrmJY0puv8HWm15x9yy54wCtynNj3LKwg+NaZyk0SbAjmPbdAh25L8/CDI+7U0jiJGb17D4fSqJO/RfnawtKQtonJmuCiP3Z/LMRKHcFaUes3LPIR9oYJfz8KssCelzhr1xCCHAYl2yP+2FodaT6U29XiOoBNNDHae0qjxi/7en+jxRTLV8w64xPX22Bg/+ojdofX5jxAeMmqQ6/0oBgrrBq0k19wR/5I/k6IwoGV/1ZKSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5wLon03QuMUjgartJclxVKJZVFf/LNEziiV4IpLQjo=;
 b=ikK1cpfof/eBVgMjhIJ36DJN/p872fTobR8+tu+r9B9YHPPkjQvKtkJevetdE9F83vrLHNbKcwhXLQCHYzYPSpm26BaAKlOmm3RknyKS4CaBeru+JAPD5w2uJA1dz9iTH3mD9vRdSR4d2c6Dv1c/vYCphmFAFoO7z0dz8jtwIKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 10:35:50 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 10:35:50 +0000
Message-ID: <091729c2-dc64-49d1-9f41-32e67509ade6@amd.com>
Date: Tue, 2 Sep 2025 16:05:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, christian.koenig@amd.com,
 matthew.auld@intel.com, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: alexander.deucher@amd.com
References: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
 <23142157adbc54a6e2f03a2ebaf209c9bd89439e@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <23142157adbc54a6e2f03a2ebaf209c9bd89439e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::30) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: caca17f0-0007-41ea-483a-08ddea0c7bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZSRUZTV1RyVEEwKzFjSmNQcWxDOUs0Q2pKVFFNVlJyYmJqTTR1UGNKcEll?=
 =?utf-8?B?a01jTlRQaWFGQW5hMnJaeHF3U3haZlMwTzJDN2JWRTBnbERpRkg2cGpiMXl1?=
 =?utf-8?B?SEJyR0s2Q1lqempudHJJK0V2clVjRTBvdFg2S2lzaFlZRnVZUWFiRVNQYnpK?=
 =?utf-8?B?T3pFQ0hOUzhZWmp3RGJ3SmgybGFJdldFZTZ6TkRUTUFJVXJpa0htMmhtdnhR?=
 =?utf-8?B?R2RkdzdXZXNqc01sZFBDV0NWVUowSG8zM3VNcXVpakdXZTBERnE2NWhXRFc5?=
 =?utf-8?B?alNtSHlZYmZBb2VVL3pFdUZCNkRuMDBNM3J5a0lwMVhlZVBGWTUyRHlERFpM?=
 =?utf-8?B?azFQZlpRYzlMc2FCSE45dG9nekJHQXJLNlYyUGpaa3BXdndvdnhEZ2NJMTM3?=
 =?utf-8?B?QjIyRnZFaXlUKzdHeWdzSG5ldXlCZ3dJL1BSNnVpeE01bUlRbDVwaTFzVkdC?=
 =?utf-8?B?ek42MWhOc2FRb0pOMkdkQkZacDlZTW1mMmVhK1U5SXBkWnE1eG1VMGRDc1cv?=
 =?utf-8?B?WWdNQSt3UXpGZDBFTFRYakE0UlZKcTNlREhFcStacUR1d25yNDNOMmMxd2FC?=
 =?utf-8?B?VS9ScGhSdUJHTXBKS3g1UDd3UDNjcjR1YXZKQmVkS2VOM2t3UWhoSzRFMUZM?=
 =?utf-8?B?N2RhU0ZkWE1EU3VYYmwvaGNCcTFHaWFZT05xQ2pIYkZUY3RwMjYxMS9sL2pt?=
 =?utf-8?B?YXRuUUlEaDNKZUpuZTFJcTcyWms3dGhHSlBKN0t3RFA5MjhMeXpXYXZvcWw1?=
 =?utf-8?B?clh4UlBabUFHQjdQdkI0YXJmNmVBMFQyaHd0dUMvZ2l0TnBFWi85eW1hNmVy?=
 =?utf-8?B?RTBsVkxGbnJxeTR0R0pDSEFLbUUwM1hjYW9lSHptRlpSZHNhY0dHNisrQ3FU?=
 =?utf-8?B?OHRoaFB4clJOVVJDMkFYUFQ5OUVLa0ZPNTc3OER3Z2w4a0tQcEZWVGljc2h5?=
 =?utf-8?B?cHpGSWpxOWVtaWNvRFJmOU5YNWpPakhoVEtMZzhPTUdFUlhqUXR6Zzd3cU5R?=
 =?utf-8?B?U296dDZ6S2psZVdYRmd5RnlvU0oyakMvcjhwT3JxeUNOeXB6WHJuVDJmU3lR?=
 =?utf-8?B?KzVpTkF0bG1RNUFLb0FPQXZFYmJIR2k2R296ck1neUU0Vld1dlpSakljb3NJ?=
 =?utf-8?B?UnZUZzdyUXVMMFdBSkdON3pYU0VkQzh3MWVPM294ZEw3aW5kUVRSZmpqRnEy?=
 =?utf-8?B?bWp6Q3FRSUpBYllaMmhNQ0pSMlMzRWorcmszSHdwM01yK3kxZTEwUG5RN2p1?=
 =?utf-8?B?MXJGK3pYM0xRMHBYV3hYZzVuR2pmTGdPMXVmTjR1ZVBzQmxQSmhRbE91Sm94?=
 =?utf-8?B?VzdKeEVPVll3S0ZMTzF0V3VYUndyVkg4RmRPaFg4N1h5SEduekFwLy9wZkVk?=
 =?utf-8?B?ZzdGWURsazhvT2U5UTZTY05OSmJISkZuYy9aU1RYeURFYzRZRVltS2NUc0dD?=
 =?utf-8?B?aUo4VnRyMVhOWTR2MFpYYzdUc0dmbUFxQWVoMmpuZ0YyZWp1eVJCR3ptbUFi?=
 =?utf-8?B?aTBjc0xWZitvL0F2SDJHUzQ4YjNQN291dHRHSzJORlZ3ZHRPMGhVR2ZEVUdK?=
 =?utf-8?B?bTVZVzgxYzl6bnFGUmdra2NVQnlVdmdRL3JzNy9ycWt2b21hMmtnRnM5MUxl?=
 =?utf-8?B?NU9LUVpSMlJCRkJiV1I0N1RHMzVUQWtXcVJJeWQyOWRQYlVUU2Q4bW1sMWlR?=
 =?utf-8?B?UTJwWlUrTThPOEJ3Vlhoalc1b2JCK3BYWG1SL0RJSVRyWXZFdVJCRFFQU1ZX?=
 =?utf-8?B?dnRSTUZ2Ty9hTFZKTXZuaXp3VU1janRuaTMzV3B2a3VMVW93M0NDVWFIRDgv?=
 =?utf-8?B?YU1DWmh2bGlXcTc3VkVTbnlLeVkvcE14WGFqN2x6YkJoYVp5QW5BemJ4cHNT?=
 =?utf-8?B?VC9XVmt6ZldKY0EySm93dTUvQStVaitXck5vRDVza0RrckZJZkpWZWl5UzR6?=
 =?utf-8?B?THp0WUpubG5WZGg5VE55SVBXLzA1U1JpM0lqWm1iRURheW0wOFZFUncwdVdQ?=
 =?utf-8?B?SVpoK2FNUVFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmsrVFE4YUtBTkx0R2lkalhmRVY3WU1tWUZxYWF0RmJVNkJmSWs4UG0rSUt3?=
 =?utf-8?B?ZlBQdUJsc2QzQ0hzSFJLcnl0LzljaHVaTlE4dEJFM0xKNmJxV013V0JzTnBa?=
 =?utf-8?B?VHhESG5mSXNjS3hjSW9OYkFxUFl6c0dTZ21RTkxEZXpDTDdsZm5qQlErL3hs?=
 =?utf-8?B?N2IzQXNSVXRlenNRWFNuclpWTEZzL244V2thYnZlT1NNUkg4YlB0Znc5Q2h4?=
 =?utf-8?B?b1p2OGh2Wkl0MUpZR1kxWlpCNTlyUkRQekxvTHlEMGhKNmc5bnlVNVh0dXJy?=
 =?utf-8?B?TXM3dWxEd29JVTliNTZUTnM0UTNnanRlSzhDVlovMWx0SVdnUVNHZ0t4YThy?=
 =?utf-8?B?VFQ3alBNR0xBU1dqbFFycEdFbk5FcStaVXErWE9KZ1Zwd0txa1hBUGRtRDRQ?=
 =?utf-8?B?ZUk1aWVEeHh6T1cvd2ZScEZYdVp5NUdQcENFdzN2QXVTUURHMlo0U3p0RzVq?=
 =?utf-8?B?UE5aT3ljM0lOT1NXMmt4b3FBck1yTzVQdno4ZktSTHdCU3FSSFRWWmRYZEpv?=
 =?utf-8?B?NDJYMjZaOURrMjZoVWNFN2VFUnBPMnFhUzhLcEFsdHdnWjQ1WmRVVXcyakp1?=
 =?utf-8?B?OExVVU5qcEYybmhoR2pDNVlteGk0UFFaTTJwZ29xd1FlSldVSnF1cU1sSS9V?=
 =?utf-8?B?U0VMcDdOWEthdTNuZk5KT2UyTzBuYnhBMk5pMzdBbGw3ZDhENmljQW83aGJD?=
 =?utf-8?B?SW9YWkdNQWI4OWE4N1luN0orZ0d4Q1NCZlFLdDFlR2s2ZHNqYWRCK3NTazhV?=
 =?utf-8?B?MGhnMEE0c0VOVjZJeklFVURTZm5jS0tLT0xjWHQxOXZ0MGNHS2J6c2d2NDM0?=
 =?utf-8?B?YmVEd1UwUXUvT3IyWFFnMjM3djhPdCszblF3U1dvc0xNSnhidEx5VmlBb1JZ?=
 =?utf-8?B?TFZSM0R5SUZGaG5sN3JnaE9yWUxvcXgvdTJyTlVySE5kUmdPa21PU2piMlJo?=
 =?utf-8?B?bzRwa0tCN3QzYTVLN2txVWN3dGI0S0RDZlNEdXE4TWlaV1pkTExNRitXb0My?=
 =?utf-8?B?WkI2elRaUFhCNVJMY1ZoRE9UTC91UlVFRVVYenZwd0Y3TmlBOEpOU2ZvNGdN?=
 =?utf-8?B?RDhIZndTazNaREtNUThVdzlKaUVXVG1JRm5WRWIwN3JHWHRTQ2dxSTduc1hu?=
 =?utf-8?B?elpEWi91dVRCbE0vdzg4a2FYTjFYa3hIVSszdVZLaG8yQjFDcGxCKzgycWRW?=
 =?utf-8?B?UklrNTRxTWNDUkNkNzlwMVBpZWxBcUUyTGF1aENKN01iL0V2RDRhVDRXS1d4?=
 =?utf-8?B?amJrS3ptQW82b0tBTlNzWkNvQmxBU0ZGT28xRHVVaGhCV25qQUZCcVhJU3NE?=
 =?utf-8?B?Qkhwb2xnOEZiVGFkSmRKZmNsM3Voamxhc1NIdDRDTG1VUVBQRnZidC9MS0hh?=
 =?utf-8?B?Q043ZGtocjU1NlVkMzAzSDgvUE9LQnRUaTRMVEQyUUlteFJpRGpqdFc5YkZV?=
 =?utf-8?B?dlcrUkxPRGowQW9UdDE1R0QyY3lxTGJrQ0wxUzllWlFkc2VpN1QrWDhUdTN6?=
 =?utf-8?B?VnJ4c1FxQldFZUE3Q3JLUGRwd2FhcnVNY0JaK2Qxd3I5WmxLSk5YN1FHR2lF?=
 =?utf-8?B?M0VBYWoxOGk2REtjcTh0WlR5QWl5ZWRqQkN0N0JnUHQvZnRmZU5NRDM5SWRt?=
 =?utf-8?B?bTZoQkdrWFNTRmtRemhMMXFzMDFTWlZNeVZPVDZ2M0t2dVhrUVBCaTIvdklt?=
 =?utf-8?B?Nkp2dU9TZzMrTm8veFNJejZIRG5BWGtMakN5S21PaTN4L1o2UmRkNVZhYkRJ?=
 =?utf-8?B?Zk14azNidWRFWUd0b09tQW1yTkI3d0JxSHB3MGZGd2Mzdys0U3lFSnNKNnFX?=
 =?utf-8?B?RE1BRFZsRUxhSW9EaXNTWCttZU9yTllpKzZJK1Z5cWg0Z1VFNHJEdGltVHRK?=
 =?utf-8?B?SnlYdDU0azd6bnpNWENUQkJUN2NYM01CQUNGQnU3ZkROVzRKWGx3QjNza0NW?=
 =?utf-8?B?Y09KYkVXNFZsQXJBMlRKNjNmWGo4QmpnYmhHU3BEZ1BkK0hVWnpwdkg3cXFX?=
 =?utf-8?B?TEhjSHRYOWE3VzJ6OTZWdlhQZ01EVzVrcCtXWG9LaWpUS2RTb3M1TElBVjJL?=
 =?utf-8?B?Qk5tV2hYdEs2anhqaDF6ZlltOWlUZ0xpcjBTS211QTdVdWc1MXNTUnJVeUhy?=
 =?utf-8?Q?sFxHE6vM1aIjdPQSYiHWehyCn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caca17f0-0007-41ea-483a-08ddea0c7bed
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 10:35:50.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /apMs1CMAvPa6MoybgOSL/yLQRrMdAtONl1zzV7XAX2zyjhEmQ18SqblZ8I3ISwws6O4kn2ZsoOghUVbTwIBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
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



On 9/2/2025 3:53 PM, Jani Nikula wrote:
> On Tue, 02 Sep 2025, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
>> Replace the freelist (O(n)) used for free block management with a
>> red-black tree, providing more efficient O(log n) search, insert,
>> and delete operations. This improves scalability and performance
>> when managing large numbers of free blocks per order (e.g., hundreds
>> or thousands).
>>
>> In the VK-CTS memory stress subtest, the buddy manager merges
>> fragmented memory and inserts freed blocks into the freelist. Since
>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
>> with the freelist, compared to just 0.03% with the RB tree
>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>
>> This also improves performance in heavily fragmented workloads,
>> such as games or graphics tests that stress memory.
>>
>> v3(Matthew):
>>    - Remove RB_EMPTY_NODE check in force_merge function.
>>    - Rename rb for loop macros to have less generic names and move to
>>      .c file.
>>    - Make the rb node rb and link field as union.
>>
>> v4(Jani Nikula):
>>    - The kernel-doc comment should be "/**"
>>    - Move all the rbtree macros to rbtree.h and add parens to ensure
>>      correct precedence.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 142 ++++++++++++++++++++++--------------
>>   include/drm/drm_buddy.h     |   9 ++-
>>   include/linux/rbtree.h      |  56 ++++++++++++++
>>   3 files changed, 152 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a94061f373de..978cabfbcf0f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
> ...
>
>> +static inline struct drm_buddy_block *
>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> Drive-by reminder that "inline" in a .c file is, in absense of evidence
> to the contrary, superfluous. Please just let the compiler do its job.
Ah, I missed taking out the inline. Thanks for catching that.

Thanks,
Arun.
>
> BR,
> Jani.
>
>

