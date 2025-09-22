Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E46B91807
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00A310E1C4;
	Mon, 22 Sep 2025 13:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VG6l8Rhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010041.outbound.protection.outlook.com
 [52.101.193.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AEF10E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 13:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hexio57yi4ropUddHgaUx835xixeR4dB8yxQwD9ixnYjPZVgY6AMySPXdtaEVT1hDyxJnJyObsm565h/jJBFeEPLRwyhLWzqTIybH30MRKXoTFzZ4MuFMsPDrW+LHpmMh3dYZyNAMZpMXvjatc2puJVijUHurp3BLvgsnJYROLumJVVqEjtZ9CyC1dAa9V15zfFvOKXJ/RSQ7b6G94OxwovzdrgtRUp3yD+fdZxNtn4CR6aPfc06GL5/DkCGvmDcSTgtJqiAJDtcpukVMuS/GcevthVCKxxVqHNgGuEl4TlyyyVOygOJdAXmbyEQMt54WGD2XSQpd6L5KnW/AaZ0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uX/GGE7iuXegMZxLB8sTLUhtT97XZfS4PNMRcybgVig=;
 b=mo9i8WCbtHuZg+uG9+e5EOHE/MOdNiBjXMSwaOikobUMNt7J0uRvoC4HFgk7Ya2UXdutRkvXlysuovIDdgGAtRzT71qk1slWHE8n+0h7mB8U3PuC7ZRq+Rx58SCvOb7iIQ24Dk8w5ErB1hDE6rmu+OtWUPUFUyD9A5j3tF63l5xXqZeb/qvwjit/z7ZB1WYyohgY6JOHT5h3x1wy0rJrXJAMDwei6X5VwW2mCO6dIsvbyEOj/Q1Xt8izeX8U16Gn67afSKacuH9NugkacyVwpnCCpRx1IHPAP4PLqaQP31Dgj8BR2vhp+ztH6kU9IUYqk1Qlqy8QZ3BV41b7H41U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uX/GGE7iuXegMZxLB8sTLUhtT97XZfS4PNMRcybgVig=;
 b=VG6l8RhjzfnQGEyzAUB+2EalgTWQ2YZGSwf1dbA9wHdDlSyXrhe4vGl+Spi8xAuUtc0+9757LD6QtjKNvG6X7wJf6AMersEa7ymmKh3fITUfm2N72SoOzswk/Ho4bIVGrlOxp5Ksw5PZVVCyHRf+MyHPJlb8NMcuhDdRwu9P9Eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:47:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:47:11 +0000
Message-ID: <94bc32b2-f563-4e56-baea-cf461ed29829@amd.com>
Date: Mon, 22 Sep 2025 15:47:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/sw-sync: Hide the feature by default
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>,
 Eric Engestrom <eric.engestrom@imgtec.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250922132837.1504441-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250922132837.1504441-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ced996-0bf7-47ad-a258-08ddf9de87f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlRaL0prbTk5a2tNZ3RUVUplUXFXQ2RpeVRVeWZpWWZ2TlBDMkJqaTVET0VJ?=
 =?utf-8?B?ZGRTOFpTd1dmWkRaZXI4enYzT0NoaUtjZVUvOE1JYW5yeWxOeU1qZGZvQzVH?=
 =?utf-8?B?SmJIbW9MZkpwWGlIWlVZd2lYWHh1ZVpVR01yRC9BbmJOYWRvb0NTd1kxTzlH?=
 =?utf-8?B?aDVYYlRSSEhjaUFoODhqNEJRN3ZoK3FkMTkzVmV4V0ZlVFJ2RHVWU1FZRGtR?=
 =?utf-8?B?UnorMlJ6RHhPVThtanp2VXU2bDRuR21YL1ZwbTl2UmhxWk5tVkdDRitkZnJr?=
 =?utf-8?B?Vm5meFRKVVljZjJjK3ErOE16dVR1TmVIaWVPcy9ydzU1STZKakhKRkFSbmN5?=
 =?utf-8?B?WU84bitaYmI0SUhGRHJIdUhWb1RWNStDQjRtcWpsRE8wTXM4WHhWbDl3NTJF?=
 =?utf-8?B?K3lBZnRSUGd5cHFzYzcrLzk2Y2t5SFcvMzBsZXhZT3U0c09XdTA0V3duQlE1?=
 =?utf-8?B?R2FCZ1hxOVVDRXBnZnkwYmxMM1NSazJmTktIMU9BeXdHd2RHdUZ1ajFyR3NR?=
 =?utf-8?B?eFdzWXhSSG14Zy9XbmkzRjZ3eGpmRXkxQ1F1T3ZSSkc1NzBKK2cwNDEybDFQ?=
 =?utf-8?B?WnZUZnJobzd0OHZuK3RtNVBpSTJoUUw1dDltNjNlYzdGTEUxM3BkTVJPQmZ3?=
 =?utf-8?B?RE1IWmxZQWFoWXVXYU5pQW1nejR1N2NEMDhQaFRhWnR5blBETmxpMTlJdUt4?=
 =?utf-8?B?S0wyZmN6SVhUOXdMbGgyWmZPbmRuUWMxQ2ltTnNyc1FuRVROSXI5RGNHZVdL?=
 =?utf-8?B?dVlyaS8ramFlRCtLYXowTG41OE9TNDJjODFMWFI3L3B4YXlUZVRrTjVpV1M0?=
 =?utf-8?B?M1JWak8yNVR5ampkMVk0RlBwN2tuM3RtMitUcVpjbnBEUmpZNkMxVzJPaGNr?=
 =?utf-8?B?ZytnMVJGRVA0VktReTF0VnRxT2lWU2RMYXVWTEZuREk3eXZlczhXc21rQVlQ?=
 =?utf-8?B?OE13bHZ0bVhBaDRZaWloMXlVZVd2OXFqRmNNc3hCMlhJTWFvc1ZVWHZLeG4r?=
 =?utf-8?B?RlpIV2JHaVd1QW1WektIdzloWkRUeTc5NGhLZlBxRFZtUjFsQmxGb2pNa05L?=
 =?utf-8?B?UjdlR2xIeGIrNjgraWdlWXo0ZW53WGdZSUFHR080RDk5U3hHRXpUVTdXbmVF?=
 =?utf-8?B?Nm1ZZGk0TW03UnV2V0ZmQ2piNjErWTA2ZHZkcEFlUmtVRUZHT1JCb0FRVEo4?=
 =?utf-8?B?OVI2bC95OWZ0am8wL2trN1daeXRjblM0ZXlsNUNLZ1Qyc3F0S0NobW4yNkFw?=
 =?utf-8?B?OFNJTkd1MXRDeVZjbS95d1JzYmZNMXRJclFrN2p3K0xpVk4vVTBhcTBBeCtR?=
 =?utf-8?B?Z2N0bW1McEQzZXptYU1SQmkxdWxWY2JKNGQ5SGU1bnNMbUFseVJuOCszR2ZR?=
 =?utf-8?B?SDZSdkxacGZQV0xpK1ZtTHBGL1MvY3E2WG9ON09kTFRjZDdaVm5JSHAvZFNw?=
 =?utf-8?B?TUdDRVhvZDhKMXhjRGJoZDhBWmdFUm9pMHFhSk1lQmVoMDlmWWdzaHYzR1Zn?=
 =?utf-8?B?WmFYUXhwN3AxQk9XTDB4b3FXRHZ2SVdsZ0ZLTk02M0krWUJvSmhIejFZRi93?=
 =?utf-8?B?ay8rWGc0RG1taEI0VVEwMXNSQ2g1S0xweGlpNTNjTlNHVCtpWkp5MzB3bnBh?=
 =?utf-8?B?MzgrUEtOS2lQdkIvT3UySVh1SzFRMkYzRkkycitVZ1VoV0Rnd29BYlByWUVZ?=
 =?utf-8?B?VUI0MGJnYng4SXlMbWM1KzdOczFYbWZwRWxRcjR0VElEa2tsVm9pS0h6SFVp?=
 =?utf-8?B?cHRYeW1jNnIxR0U4N1hpZStKSGZvSWp1V3lhV0ZYV2hXRm40ZVhoLzRIVnE2?=
 =?utf-8?Q?rYPzG1R+7DV5k6V9JxPlgcl6pYD5jOdOV7k4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG1CWUpvN2tuTno3cG9IQm41VlNXcVF4L2VIV1FuQ3oxT1RaSGpVZHIvZm96?=
 =?utf-8?B?RHEvdFpneUx4bUJRQm1IaXNWVXZxYS9LVGlNWkw2QThBalQwYWRIVmFEWDVS?=
 =?utf-8?B?Q0N0SHpINkcxSFpwT2xDNVZrVm9WZkM0dlozd3FQSms4V21EaWc0TnVLRlZT?=
 =?utf-8?B?MmtLcW5mUXFQTWhwa3VJbC9EOW8zU1p3aVAxUFhGWXM4RTY0SkxGby9WN2xL?=
 =?utf-8?B?WE5UUUlmcXBoNkhPQlJ5enF6Z2lobjlJaEprSTNHYVhndlI1ZDk4UmJLRzJQ?=
 =?utf-8?B?MGxTVFQxOTZtQytsWmpMbkQ2eWQzSjJlVkw5NkswbGJDU002c21rQ2t0dzF5?=
 =?utf-8?B?L0NhZHJUYURuaXhqSExTSStWN2RWRVlFYXd6ajBBQ0pneUo3VzhZSldtNDhS?=
 =?utf-8?B?LzlIWk1aVXY3SlBocys0ZlRyODhURU92bkUxVVhBTlMzVTFKbEVEVW5DbFZT?=
 =?utf-8?B?L2FTQmxnV3hMQ3hyM0FvdWYzQjMwdmN5Y3hzczNEQ3pJTzhIU25TWDd4QVNY?=
 =?utf-8?B?bDFIZmxieDBMRnRsVWVyZmExdWFZMjEvOVA4d2NsZ2lCcWJsSUk4aEdjMFZr?=
 =?utf-8?B?SVB4OUNJelpQenRsbk5Bc3k4VWpDUHJvWnVJYm52MWZDUUJnbkxVRzU2YWRW?=
 =?utf-8?B?TFU5S2d6M1lwVytFSWhWSmtyaGpOOE5ma1NTS1VkMGd0T1hPcmlvWVBkQStp?=
 =?utf-8?B?dk5Ia3VzVWNva05MTm9rWWwwMTdYd0VUTGhmOWU4aTNHd3JGdHhDRmhYaDIr?=
 =?utf-8?B?YUdpdjhHdnIrZ2lieE5jYml2UWQ5UFJHbDJvQmhEN2pDMkZwb3kwMDdyNVNy?=
 =?utf-8?B?R1h2MURFMm90YUR2elVvUlBDaUZ0aFczdC9pWnY1L1d5cjNmY1daZkFTQW9W?=
 =?utf-8?B?RFR3VlBqMU1BakRIaVR4ODhWd3Fvbk5McWVrSURQdDdLM0c3d3Y1NGM3WlR4?=
 =?utf-8?B?LzRRR2s5aW9IVEJJcFJkMVpxaUtjVmZtZ0NYN0YzR1l3TGIxei8yL2Q0TWY1?=
 =?utf-8?B?bmprT2FaenNtNmpKSXRSSDB2d0t3NTRHNnB3MmMrR2FmVXZUK0RPWCt4RWNx?=
 =?utf-8?B?STZteUF4TW92elowTTllWFhGYUlGYk53YVdOSysyeWk2UE5iWWVUdmJFakJx?=
 =?utf-8?B?cjM2aEFYVFRhVlJWTEcyL3ZQVzlVWTM1R2hoT2VscWhsMUZqamFmR25SczVi?=
 =?utf-8?B?U3phbkIxTHc4aktDNEFlK3B1MUFFeTU1K055aE9mekxwdThUcEFEZ3B2cXdT?=
 =?utf-8?B?MmJZMTZCQURkM08rbFFCVEw4U0FBZUozckFuU0tIRDRqdUZPOEpub1JIK2ZH?=
 =?utf-8?B?Y01zMUhIVlQvVTdnSks2NTBhNUd6ZDFaL3BZQnFMOTZLYnI1bllrQTlLaFdz?=
 =?utf-8?B?enFyVGJZOXJ0ekFtQnV5c1paSnkza0VUeUgwWXRNaHRHVmhiWDFETHVUVGFS?=
 =?utf-8?B?OUNPWTQ1QjFvbXRWb2RyUU1aN05zU3R2TzNRQXFUMkxlcUJYUUxON0plbjJQ?=
 =?utf-8?B?eXJMTWlCdThwR1kvWm9PcStDdU5Db3d0N2VsTVpqZy80dTZ3OTZ0bGE2YkFq?=
 =?utf-8?B?ZGpmRXR4VnQzaGhKdDBVYlY2ZUF4MzF6Z0oyOU9VS2doUVFHRDJjSWFzcE12?=
 =?utf-8?B?Y3JZcm5ISGtDZ3Q0VnRjbzI0bzMvejNyMWlNQy9FaVIrU2Q4ekhzaGV2MGZO?=
 =?utf-8?B?TUdvYWFVbmZKVjBJSFBFWmUvNmhkYW1XYy8waWF2MEFKcGoxNVhCK0M2LzJx?=
 =?utf-8?B?Z09iM1VJUlR0Q1hYYkU2Q3lvZmxsS1V3UVVXNnJKVk14ZnBPb2pBNUNVN3RD?=
 =?utf-8?B?bWVqQWRIR0RrQVpic0hRM2o3YnNuMG12UGdsSjJRaFBnYWJ6REkxa3pNY0E4?=
 =?utf-8?B?bEh0NmE3ejlkUmc1QnkwdG53WFFpQTVvQzNFTXBieG1yWXd5V3FBMkQyL0Ex?=
 =?utf-8?B?WEJKUFRSdThWV2N6M0I0RWQ2Zm54T0VnT0FmVGhHaFU0amUyK05KQjM4bmFn?=
 =?utf-8?B?UGJ0eWNEUFU3cjRJV3VwZmhnRjRhdHh6SjlRcDVGSVZoUmxZU0xDaWhoZ050?=
 =?utf-8?B?djJJbVptT01pbm1STkRxaG1sSnFDY2NrRmU1eVU0Snh6cUxUZHg4d2U1Yzhi?=
 =?utf-8?Q?4EWFQIiEwoIlD7Cmc7m8SOT3P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ced996-0bf7-47ad-a258-08ddf9de87f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:47:11.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pew/nO3apc9XrEucwhojUnvMN/o8YYel0+1w4qwgGWNPzy170+fxAPuUcKv9uVcx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558
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

On 22.09.25 15:24, Janusz Krzysztofik wrote:
> When multiple fences of an sw_sync timeline are signaled via
> sw_sync_ioctl_inc(), we now disable interrupts and keep them disabled
> while signaling all requested fences of the timeline in a loop.  Since
> user space may set up an arbitrary long timeline of fences with
> arbitrarily expensive callbacks added to each fence, we may end up running
> with interrupts disabled for too long, longer than NMI watchdog limit.
> That potentially risky scenario has been demonstrated on Intel DRM CI
> trybot[1], on a low end machine fi-pnv-d510, with one of new IGT subtests
> that tried to reimplement wait_* test cases of a dma_fence_chain selftest
> in user space.
> 
> [141.993704] [IGT] syncobj_timeline: starting subtest stress-enable-all-signal-all-forward
> [164.964389] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 3
> [164.964407] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore i915 prime_numbers ttm drm_buddy drm_display_helper cec rc_core i2c_algo_bit video wmi overlay at24 ppdev gpio_ich binfmt_misc nls_iso8859_1 coretemp i2c_i801 i2c_mux i2c_smbus r8169 lpc_ich realtek parport_pc parport nvme_fabrics dm_multipath fuse msr efi_pstore nfnetlink autofs4
> [164.964569] irq event stamp: 1002206
> [164.964575] hardirqs last  enabled at (1002205): [<ffffffff82898ac7>] _raw_spin_unlock_irq+0x27/0x70
> [164.964599] hardirqs last disabled at (1002206): [<ffffffff8287d021>] sysvec_irq_work+0x11/0xc0
> [164.964616] softirqs last  enabled at (1002138): [<ffffffff81341bc5>] fpu_clone+0xb5/0x270
> [164.964631] softirqs last disabled at (1002136): [<ffffffff81341b97>] fpu_clone+0x87/0x270
> [164.964650] CPU: 3 UID: 0 PID: 1515 Comm: syncobj_timelin Tainted: G     U              6.17.0-rc6-Trybot_154715v1-gc1b827f32471+ #1 PREEMPT(voluntary)
> [164.964662] Tainted: [U]=USER
> [164.964665] Hardware name:  /D510MO, BIOS MOPNV10J.86A.0311.2010.0802.2346 08/02/2010
> [164.964669] RIP: 0010:lock_release+0x13d/0x2a0
> [164.964680] Code: c2 01 48 8d 4d c8 44 89 f6 4c 89 ef e8 bc fc ff ff 0b 05 96 ca 42 06 0f 84 fc 00 00 00 b8 ff ff ff ff 65 0f c1 05 0b 71 a9 02 <83> f8 01 0f 85 2f 01 00 00 48 f7 45 c0 00 02 00 00 74 06 fb 0f 1f
> [164.964686] RSP: 0018:ffffc90000170e70 EFLAGS: 00000057
> [164.964693] RAX: 0000000000000001 RBX: ffffffff83595520 RCX: 0000000000000000
> [164.964698] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [164.964701] RBP: ffffc90000170eb0 R08: 0000000000000000 R09: 0000000000000000
> [164.964706] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8226a948
> [164.964710] R13: ffff88802423b340 R14: 0000000000000001 R15: ffff88802423c238
> [164.964714] FS:  0000729f4d972940(0000) GS:ffff8880f8e77000(0000) knlGS:0000000000000000
> [164.964720] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [164.964725] CR2: 0000729f4d92e720 CR3: 000000003afe4000 CR4: 00000000000006f0
> [164.964729] Call Trace:
> [164.964734]  <IRQ>
> [164.964750]  dma_fence_chain_get_prev+0x13d/0x240
> [164.964769]  dma_fence_chain_walk+0xbd/0x200
> [164.964784]  dma_fence_chain_enable_signaling+0xb2/0x280
> [164.964803]  dma_fence_chain_irq_work+0x1b/0x80
> [164.964816]  irq_work_single+0x75/0xa0
> [164.964834]  irq_work_run_list+0x33/0x60
> [164.964846]  irq_work_run+0x18/0x40
> [164.964856]  __sysvec_irq_work+0x35/0x170
> [164.964868]  sysvec_irq_work+0x9b/0xc0
> [164.964879]  </IRQ>
> [164.964882]  <TASK>
> [164.964890]  asm_sysvec_irq_work+0x1b/0x20
> [164.964900] RIP: 0010:_raw_spin_unlock_irq+0x2d/0x70
> [164.964907] Code: 00 00 55 48 89 e5 53 48 89 fb 48 83 c7 18 48 8b 75 08 e8 06 63 bf fe 48 89 df e8 be 98 bf fe e8 59 ee d3 fe fb 0f 1f 44 00 00 <65> ff 0d 5c 85 68 01 74 14 48 8b 5d f8 c9 31 c0 31 d2 31 c9 31 f6
> [164.964913] RSP: 0018:ffffc9000070fca0 EFLAGS: 00000246
> [164.964919] RAX: 0000000000000000 RBX: ffff88800c2d8b10 RCX: 0000000000000000
> [164.964923] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [164.964927] RBP: ffffc9000070fca8 R08: 0000000000000000 R09: 0000000000000000
> [164.964931] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88800c2d8ac0
> [164.964934] R13: ffffc9000070fcc8 R14: ffff88800c2d8ac0 R15: 00000000ffffffff
> [164.964967]  sync_timeline_signal+0x153/0x2c0
> [164.964989]  sw_sync_ioctl+0x98/0x580
> [164.965017]  __x64_sys_ioctl+0xa2/0x100
> [164.965034]  x64_sys_call+0x1226/0x2680
> [164.965046]  do_syscall_64+0x93/0x980
> [164.965057]  ? do_syscall_64+0x1b7/0x980
> [164.965070]  ? lock_release+0xce/0x2a0
> [164.965082]  ? __might_fault+0x53/0xb0
> [164.965096]  ? __might_fault+0x89/0xb0
> [164.965104]  ? __might_fault+0x53/0xb0
> [164.965116]  ? _copy_to_user+0x53/0x70
> [164.965131]  ? __x64_sys_rt_sigprocmask+0x8f/0xe0
> [164.965152]  ? do_syscall_64+0x1b7/0x980
> [164.965169]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [164.965176] RIP: 0033:0x729f4fb24ded
> [164.965188] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [164.965193] RSP: 002b:00007ffdc36220e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [164.965200] RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000729f4fb24ded
> [164.965205] RDX: 00007ffdc3622174 RSI: 0000000040045701 RDI: 0000000000000007
> [164.965209] RBP: 00007ffdc3622130 R08: 0000000000000000 R09: 0000000000000000
> [164.965213] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdc3622174
> [164.965217] R13: 0000000040045701 R14: 0000000000000007 R15: 0000000000000003
> [164.965248]  </TASK>
> [166.952984] perf: interrupt took too long (11861 > 6217), lowering kernel.perf_event_max_sample_rate to 16000
> [166.953134] clocksource: Long readout interval, skipping watchdog check: cs_nsec: 13036276804 wd_nsec: 13036274445
> 
> As explained by Christian Köenig[2], "The purpose of the sw-sync is to
> test what happens if drivers exposing dma-fences doesn't behave well.  So
> being able to trigger the NMI watchdog for example is part of why that
> functionality exists in the first place. ... You can actually use the
> functionality to intentionally deadlock drivers and even the core memory
> management."
> 
> Let the feature show up only if EXPERT is selected.
> 
> [1] https://patchwork.freedesktop.org/series/154715/
> [2] https://patchwork.freedesktop.org/patch/675579/#comment_1239269
> 
> Fixes: 35538d7822e86 ("dma-buf/sw_sync: de-stage SW_SYNC")
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Good idea, we have previously discussed to taint the kernel if sw_sync is used but that is also a clearly step in the right direction.

Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index b46eb8a552d7b..e726948b64f67 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -18,7 +18,7 @@ config SYNC_FILE
>  	  Documentation/driver-api/sync_file.rst.
>  
>  config SW_SYNC
> -	bool "Sync File Validation Framework"
> +	bool "Sync File Validation Framework" if EXPERT
>  	default n
>  	depends on SYNC_FILE
>  	depends on DEBUG_FS

