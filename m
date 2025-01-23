Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974BA1A5CC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 15:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4ED10E821;
	Thu, 23 Jan 2025 14:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRPY3nKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A82910E820
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 14:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnaR4yns7O2eU5LQcJewPQJdZjEnysyNjalxRO0mTfOifEJaA8Hhmq/58Hj+EfIFY/AX6ii4rM1zf/SZhW/OfjmBIYVcdELmn/jVX4JwLyb9TSXR+KHoWXrCxZPMkYM7lAt4aH4hnU0mdcGBcl73y/BI7ezoyxmUs/6w19pxHZ6vMUndZp/cfYLxn6ZoX0bboNtXtfHtdqG+7KociPhXSwPB2VBB6fdMueCrTH0nHRIpuJEk64K2B4L3CRkpD9a71UKJqOgV3D1Wa6VAlKlwl3u/qsssHg/durJgJGOfUC5p+RwRBeZ3tiFDD8konJdaGJPmrgUXBjMcWDe7SXMqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBU2asAspSaoQz2L4KkCEgrslSn8uS/IBFrvCiixtz8=;
 b=zVI65BbpuJBbgClojf2FSlDJsf5CpCKvrf42eMujbrDicbQp8QKAfH3od15iSY+vfpFCHvc877t+D/5+u2zAs+JLoHk2kUwWNrxJjT3UoAjvZZ9nVJbJ1iz7EWy+oR9yTfv11h3On42eooHIys+MelFxszb1U+eu2Lq+pC+ZkmvDnZC8jKYh/eQM8F4aNf4+VwsuDCA4c5QWiY0iMLGQF/mjrJCpEb5/F4YgvI4Jq/OrOnpK5r1H6m4uLTX6AIsKbLurCvtIRTP9ofYP/SYm3k0vndAKrt1LXNFTAMMBbT5v2IBot0XmP5PUa2TgY2LRUMlB9NVi/pClfm7900FO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBU2asAspSaoQz2L4KkCEgrslSn8uS/IBFrvCiixtz8=;
 b=WRPY3nKagUFoc8qQj6E3jiDtqUIOPG/UpcRDd4ngLtWRbpg6g3EZknxtUOFsCX9LrHrSL28KRQMs+TZhqSv6XsaI79L5u96p1tuNRRuZylNgLmvvcQDboKRO93lnmaSZcIVWJjWHoEm+4+DAWOt6aMYLOBQvEvtIjzpaukF0/gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 23 Jan
 2025 14:35:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 14:35:29 +0000
Message-ID: <97db03be-df86-440d-be4a-082f94934ddf@amd.com>
Date: Thu, 23 Jan 2025 15:35:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com> <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com> <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com> <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
 <20250122143744.GF5556@nvidia.com>
 <827315b0-23b6-4a39-88eb-34e756298d67@amd.com>
 <20250123135946.GQ5556@nvidia.com>
 <9a36fba5-2dee-46fd-9f51-47c5f0ffc1d4@amd.com>
Content-Language: en-US
In-Reply-To: <9a36fba5-2dee-46fd-9f51-47c5f0ffc1d4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e05991-b5c6-4494-6b46-08dd3bbb2f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdIbzFiYmFEbXA5VnV2NHM4emlOeTNjaGtXK1VKZ0hNT3VsODlidThlRUN4?=
 =?utf-8?B?QXFSRGVmaFRuN3NMRjA2QWdacmdxWlBWVzNRbENEYkNBb0Q0c3g4STRYN0N2?=
 =?utf-8?B?U3YvQmdmdUpMWnRWamVCUGw3SkZxTEM1LytvNXFOajdZZGRwNHRIbTlPK1Zs?=
 =?utf-8?B?OGgxckM2U0o3Vm9Gc3N6V1BOTTgzN0dBMk0xKy9HVmd0OThOSVZWenh2cHNE?=
 =?utf-8?B?ZzRYYmxoUjF6K3cvdHNiWE50WEc2clJDSXptSFRBRTQxeGpHeUoxK3dmcm41?=
 =?utf-8?B?VWF5MnZzZTV3NWpLUEhlYVUyQ2t0Ukw5WGhwVjljdkt4NlpuQWRveElIdytE?=
 =?utf-8?B?SUJLQ1UwK0FLczRlWllXVnhmKzJGK2Zzd1ZOMFkzT3o3S2xMaWNjY3pCVTdX?=
 =?utf-8?B?TnRDeXE1K044TGhUdnZhTTJKOXJJZ0Vpd0M0aWFYUWNDRUdKS0tFVkoxNkZv?=
 =?utf-8?B?NVlIMFZyekxIZlpSZFNpUDk5R3IvUVVIMG1md3BKKzlFYVlSTTQzRExtSjZh?=
 =?utf-8?B?UnYrNVljK3VyUDA2L0pwL1FuczBCRDd4ZVZ5N25uaXRMYU9uOHl5N1EvVVZz?=
 =?utf-8?B?dHJMNWMrQXJLbk5ZSTN5Mlh5WlJVemo5MVRlKzNzSkRyTDV6SC9XS1lQU09t?=
 =?utf-8?B?M3BuaGRCYXlYZ2hXcGg5TmliTG5mTDVwSUU0WFFPUDFkODdNMk44U0s0ZnNw?=
 =?utf-8?B?MG5CZk9Vd3hPUERlWmVDaEhaUnRzWU1PaHM3Z2NEVUUxZUkwZnF3NzgyMWFC?=
 =?utf-8?B?alVoekEzakZncVEwaFV2Nll1VjNnV25yemNmUitvYjM1am5HdXhFaE5lNmhX?=
 =?utf-8?B?SGR3eHNpYm01RTRHQXpQcUFndTlrNW1mV1dYUjlNaUY1WTlDVjMxTW5yOG5C?=
 =?utf-8?B?ZHBRNWMvbXJFdlVGa3pmQ2R5OEJxN0l6Z0YrQnNQcENibGMxVWFPZzR2RUZJ?=
 =?utf-8?B?T0F2V3VoUVFJU0ZQREgxNWNXNWtzcFdVWlVhbmlXWVNIQTI3cGtpeGZ4dW1n?=
 =?utf-8?B?RWpNZmNMeVpLWDlzL0hobEFlaXM3aDVLc3k1S2NTOVpGMVA3cmZNM0VMOHIy?=
 =?utf-8?B?alZYaVRtUDczZ2VKbmdGem9UTk1zeUVyNjJ6N0NFbitzN1lpdHBDOGZ3bE9u?=
 =?utf-8?B?UUlXemJnVWJtY1JxMWdVaEVFZVhUOEkwYjY2ZTBGL2NzZzJ2UXFkaHpoTVcy?=
 =?utf-8?B?UEdWSVo4UWJxK1dDVEN6NUJrb0VCK3lmVDBET0d4bHQzdDc3YlBYM0taNXln?=
 =?utf-8?B?d25nM3Z3Z3cwRWh0U1ZRVnhDbHpZSmRwWENLVExVYnYya3RId1d4Mkx3dHd1?=
 =?utf-8?B?eTQxMzdjdjErTnBGUG9YajdoN3F4NzJveHlnM00vci8rQ0F6SXA4YVZLU2lD?=
 =?utf-8?B?RnB5RnV4Vks5VGdlUE5kUXlOWFo3a1JtRWZubVJrS3Z4VU9DZTdIL3RkRHdm?=
 =?utf-8?B?b1h5dHAyeWcwM1podktOU1NXZVJpSnR3Y1JJUkpzNG5MMXlEVVl6SlRBOEpr?=
 =?utf-8?B?R1VnVW83RFVHRWZRSVgzQ05nbUxjM1ZOOXpGWHZ0am4wQWNWQkpSVTE0MzZ6?=
 =?utf-8?B?b2wrTUFlMGlJbE11RnpaQ212L1lZbTRmVGc3eUZ2dGR0dHpneEtLblY4dDJT?=
 =?utf-8?B?RWkrbzkyMGQvS0xSY3dsY1ZZZjd2OXUwOG1uUUZWZVlmK01pczJXQjFSSFNy?=
 =?utf-8?B?QjFJaEtuYm82VVh2dFlCNFZCWHNpcVhkemlFekV3dnduQjRkdDh0Y01WZFBW?=
 =?utf-8?B?V0laRENlRVN4SnltTzUyWk1yeVQ1UXdyQWdvSXhydW55cVBTTUc0V2VCakpK?=
 =?utf-8?B?RlN2VEJSSU9xU0FZamJiTVpwMHBGNi92Y29vWEhMSzFMSzd0Yzh6QzQ0d3Y1?=
 =?utf-8?Q?oz9zSZ5grnQBz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHdickVXKzBvdHhkSHFEbFFydVlvRW9nd2c2dTF3aHdpeHVPcmpPZkNybzVM?=
 =?utf-8?B?b1psNitxbXZubHIrcFN4QkdnOHcvaWxEZ3I3bEtJNjVLZ2Yxblpjc0dNem1u?=
 =?utf-8?B?MFNocUlFSXVpQTZieUQ1ajFyeTg1OEVMNE8wajRGc1JGUzdoaUlCNFJCNWlP?=
 =?utf-8?B?VGdKbk0yT3RNTHAyL1JDOHE1cUk5bmNES3JIeWxpUjQvNG1RUTd3S1YwM0xF?=
 =?utf-8?B?VHE4NWU5YXNIUUgxZDdiL0FCbUtFaWJvbU51MHVKMDdRR2pUUzN0NnNzMTZ2?=
 =?utf-8?B?TmRnd0NoaG1ydzRTb2RsN0RQdjFFZnNYVWNwQm51V1VQSGIyZmNDcUdiZDNC?=
 =?utf-8?B?bmxvUnB0ZnFMUjNxMEcrbkZXUFNadlhHVklxd1ZlUEVObDUvM3EwOEdqSGhW?=
 =?utf-8?B?QUpRaXRMNjFzdUsvV2hsSUdIbGs1a0drbGRvTjRwcU9zT1l2QjB2MW50SXcr?=
 =?utf-8?B?ZW1heHJocGtib2lGRmNLaTJhT3BXZ1RKMEp2WXUvdGtvbUsrcmxYV3loUnM2?=
 =?utf-8?B?WHF2eTlRU1hNams4VXN3bXVRNzZOWHBKZzdkR1JCUHd1a1Nudmlxc3U3dlB2?=
 =?utf-8?B?aGlGbHBrdThBVEt2QmtMTDdmM0ZrcWR4ZEVyYlU3Q255eU5wZDlvZGRJbjVl?=
 =?utf-8?B?STdUdlQ1VXR3RWVHZlRmVnNNbVB1ZGpzYldwUzFQT1EyOXpDdG1zMVpRSExY?=
 =?utf-8?B?aXFHODJJeUhocW1EY0hqR3IyMDhOWGxyaU14T096Tkg0ckhXNlBvekhYbGRn?=
 =?utf-8?B?OVFrczdVaVlZYkN1QWg5S1dTZGtUWUg5bjR1V1lXeWdlSDR1b2FiL3Zmb3pi?=
 =?utf-8?B?QU0vL0tHeWozTVp3WVBuWUlOQklBbXhuek5tWGxObVpBZEl3MVkwY2hVTXZL?=
 =?utf-8?B?RTNoREtQUWtpQkNkcXRlMnorVk96b0Q1cGhXZkErU1c5eUc1SmNwVHBiVWdl?=
 =?utf-8?B?eUZOMHEyRC8ra0piZ2R6VnVYbDFxT05JYVczRUZYVGM0cGV6N1Q4T2Z6OUZq?=
 =?utf-8?B?U2Z0ZmJoYTNNc010cHhuYTY5aS9RM1hYSi9CTWVTbVE4OXRMUDJVWlRtN2lR?=
 =?utf-8?B?QjM2L0xrenRpNmFrTWJra0tEWVBsVm1tWEFsUGtvVFV0ejd2a3RoY25SbEwz?=
 =?utf-8?B?UFlYa1NaenlUQjJDMHRyUjdQTWFLZXNpYk1CdmVXc3YybTlDQ2Z3czd1V29j?=
 =?utf-8?B?ZlU2eDBPNlFhR0ZpbUwweUpWRXl5YnpMMHlQZng3T2lhY2hTZ3NoZDNQMzVz?=
 =?utf-8?B?N1loY3A0QjFFdWljejl4Ly80dnBBcHJDTWdhMm5hZkx4SGY2YXBFTHJMN3dK?=
 =?utf-8?B?YVJEUTMxT1RKM2M2RTVhWHRSeDJBQ1l2MnFvd2JmaFZGQm1DWTlrSjZPbVRl?=
 =?utf-8?B?SFIwcVhWMlVHWHpMOHNTM2NyMENnVHJtVFNERzlMUlFtZVU4dmJHbWI1ZUdn?=
 =?utf-8?B?VFhNT3phVEdTSUEraUVVR0VveGxWSW9VZVNCRW1BVmhZb0h0L2hHemZQcHo2?=
 =?utf-8?B?Mll6K0YwcVBESFdJblR3eTNPZTcxekZPWWhjOWZOL09Gb3Q2bkYyWTNjcTBQ?=
 =?utf-8?B?UEhpZ25yY29jcW5VaFBuK0RrSThEM2NHT0dXV0lvSnRBS2IySGRtNE10azg3?=
 =?utf-8?B?c2pyUzlSczdldlg5alRadi90SVJFcklMNVJpRlFMbzZ2STF5UW4zZk50ajgx?=
 =?utf-8?B?QjZVZVo0Z3planpMZmhRUDF3N3lKQ3RKL25ud3FkakE5YTFoU0hDQ0NjbjZ0?=
 =?utf-8?B?VmQ3eGdpWE4yazN5STlXejFGaVAzWndvY1VlVjFGckpNbnVJbGF1emI0Rm84?=
 =?utf-8?B?cnI4aUt4MXZuTDJPS2t6TDVNV2FyTzNEcmpPeCtsb3RuMlVPYUxJYUprRkls?=
 =?utf-8?B?MVZMWVNmTFFjay9wS01KNkRiZk1WT0dpZmppSFJCQmlhNUJJVnEwQ28rTjdu?=
 =?utf-8?B?UEpkWG1lU1JCZXZzMW1UakEyVXFZK0Y4bmdGVTF5L2Z0TlJzVzJIY2NTdTU2?=
 =?utf-8?B?L2UvV1NhZVA2bkd0dmp3Z3lrblBIeWg3enJJdmpzWUxDUEplNG42Zm8wN3lS?=
 =?utf-8?B?NkFtTGg3c3ZVR1JTS0pYdmNFY2pjbWJrY3prN3RtV1Z6L3YyaWRLQzV5M21J?=
 =?utf-8?Q?PrcqUxF8+rVZpFfHGIjb1tv30?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e05991-b5c6-4494-6b46-08dd3bbb2f20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 14:35:29.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0K5xjnb49a6qhjzDq+ngxjRsSFMoLxCMqgyfkvIYHha76eFjaTOgI68jOsAY3SO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
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

Sending it as text mail once more.

Am 23.01.25 um 15:32 schrieb Christian König:
> Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:
>> On Wed, Jan 22, 2025 at 03:59:11PM +0100, Christian König wrote:
>>>>> For example we have cases with multiple devices are in the same IOMMU domain
>>>>> and re-using their DMA address mappings.
>>>> IMHO this is just another flavour of "private" address flow between
>>>> two cooperating drivers.
>>> Well that's the point. The inporter is not cooperating here.
>> If the private address relies on a shared iommu_domain controlled by
>> the driver, then yes, the importer MUST be cooperating. For instance,
>> if you send the same private address into RDMA it will explode because
>> it doesn't have any notion of shared iommu_domain mappings, and it
>> certainly doesn't setup any such shared domains.
>
> Hui? Why the heck should a driver own it's iommu domain?
>
> The domain is owned and assigned by the PCI subsystem under Linux.
>
>>> The importer doesn't have the slightest idea that he is sharing it's DMA
>>> addresses with the exporter.
>> Of course it does. The importer driver would have had to explicitly
>> set this up! The normal kernel behavior is that all drivers get
>> private iommu_domains controled by the DMA API. If your driver is
>> doing something else *it did it deliberately*.
>
> As far as I know that is simply not correct. Currently IOMMU 
> domains/groups are usually shared between devices.
>
> Especially multi function devices get only a single IOMMU domain.
>
>> Some of that mess in tegra host1x around this area is not well
>> structured, it should not be implicitly setting up domains for
>> drivers. It is old code that hasn't been updated to use the new iommu
>> subsystem approach for driver controled non-DMA API domains.
>>
>> The new iommu architecture has the probing driver disable the DMA API
>> and can then manipulate its iommu domain however it likes, safely. Ie
>> the probing driver is aware and particiapting in disabling the DMA
>> API.
>
> Why the heck should we do this?
>
> That drivers manage all of that on their own sounds like a massive 
> step in the wrong direction.
>
>> Again, either you are using the DMA API and you work in generic ways
>> with generic devices or it is "private" and only co-operating drivers
>> can interwork with private addresses. A private address must not ever
>> be sent to a DMA API using driver and vice versa.
>>
>> IMHO this is an important architecture point and why Christoph was
>> frowning on abusing dma_addr_t to represent things that did NOT come
>> out of the DMA API.
>>
>>> We have a very limited number of exporters and a lot of different importers.
>>> So having complexity in the exporter instead of the importer is absolutely
>>> beneficial.
>> Isn't every DRM driver both an importer and exporter? That is what I
>> was expecting at least..
>>
>>> I still strongly think that the exporter should talk with the DMA API to
>>> setup the access path for the importer and *not* the importer directly.
>> It is contrary to the design of the new API which wants to co-optimize
>> mapping and HW setup together as one unit.
>
> Yeah and I'm really questioning this design goal. That sounds like 
> totally going into the wrong direction just because of the RDMA drivers.
>
>> For instance in RDMA we want to hint and control the way the IOMMU
>> mapping works in the DMA API to optimize the RDMA HW side. I can't do
>> those optimizations if I'm not in control of the mapping.
>
> Why? What is the technical background here?
>
>> The same is probably true on the GPU side too, you want IOVAs that
>> have tidy alignment with your PTE structure, but only the importer
>> understands its own HW to make the correct hints to the DMA API.
>
> Yeah but then express those as requirements to the DMA API and not 
> move all the important decisions into the driver where they are 
> implemented over and over again and potentially broken halve the time.
>
> See drivers are supposed to be simple, small and stupid. They should 
> be controlled by the core OS and not allowed to do whatever they want.
>
> Driver developers are not trust able to always get everything right if 
> you make it as complicated as this.
>
> Regards,
> Christian.
>
>> Jason
>

