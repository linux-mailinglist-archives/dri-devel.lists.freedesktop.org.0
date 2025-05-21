Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FFCABED28
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66B310E69F;
	Wed, 21 May 2025 07:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1BSd2bJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2210E69F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 07:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFAgb/D2WpohGnljE22aT+nlBXF5FzpNs/q5ZTfT38u0Ebt+maK3Bl6V0IOGVqQAxKtT4eDwnbqbqiG6wnl7TbQcd5E5e+rGLay1Ccmke5XkMXI24CzsOBjYmF26KvnSkwL4/krn4wErtB06BmlNB8/b+Deh7HbPY6VkXauBnCvFhdra/BVroTtxvrcJaJ+YGQW9xNPxtW/a+ng9nBcJRDPzT9jUTFYytEv9LQqoQIJNnlHJPBpSaXff3+Vn7KDy8u1S7+nfDte2LEX0RSjOMVs/s5G01vQmpG2oO0yFQzxvV1Vx1ITQGCNECaIRH28EV17WJhndaXPdTZcgETdDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVayEbzVGL9QmUYMLfp6Ko64LfvzLHI4s2Ill8mpCmo=;
 b=pJze0SfWXW/9ig8D7NLVw38ACEjwxZdvl7XaLCDzPoZj5d7fGZcAb9Io7S/g2bfzp2bwL0fkLixExlsyF85dmLKKknQrNriiJRXcis2fi/G5QsCh4izorwhJTsFP8PX8TPlqCHTCsv/3kka8D+hgkyhEY70SjLqr3nr6oIoOusKeHkrcAL33M2DPz5FDCzqhj8ORiWM/gI6zypLyA1mCD41OiD0E/6Zm0JqgsKmj1S69+SuzZnontEChM7MiWzdLA9Azi96LWQrcDDw0H+9uAONT6GaetgNi0srV2JLn6Jr66tycjgy08RMKcJRUMZR0DQvxSvEmtBX1PFwInDlP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVayEbzVGL9QmUYMLfp6Ko64LfvzLHI4s2Ill8mpCmo=;
 b=1BSd2bJpUwKrDKz+ZW30sYhcmVE+SUmo+nOyWPloINdkhtFGFPwbMnFSOSiP0skEqM3VBPssqj26X6Y9FR5tk+FfUxz8Hwne16mabm2PZPLPHneqae6LS2dv6vGpspv+gj7gxOmiGN1imbTmv43uXM8aEZANVAPiSMMThypcN6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 07:35:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:35:43 +0000
Message-ID: <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
Date: Wed, 21 May 2025 09:35:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
 <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
 <7198873a044143c7be12f727b469649b@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7198873a044143c7be12f727b469649b@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 76806982-49ad-4a1c-c838-08dd983a17e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFN6SEhvRnpxRTJGMWVTTDgrS3pBQ3VNVlhzR2x1NEJQVEE0UzRmYkVhQWsw?=
 =?utf-8?B?aUljTjVOcWpmL0ZGbFVVV3JMWGp0dnBHaFRKZ2gxWkJVWVVPekFsUktxZ1k2?=
 =?utf-8?B?NndlNmlSZ2dLVXhqRE5KUFJnNTh2SGZrRlh0QkdWL3VnZFV1TnhPQ2wyN1lK?=
 =?utf-8?B?WEFxaFZsOGZsTS9lbG5XSnhUTXYzeEZKSnljY3ArbWwvck1NblQ1MWp1eHZX?=
 =?utf-8?B?b3U0NjdBazg0UTBSNll0U3I4SHJtaS9ndU5zUDFUQlZVbHdESWU3MXNJWkEv?=
 =?utf-8?B?MXJhejl2T0t4cXFKQ0pSSkJuNmZqcEdqaHUzcldCcndqQzNKWVVielpjV3J1?=
 =?utf-8?B?WWlOY3c1ektOMVZDdFJIOUFvSFUwNHNKVFBidlRJTS9SNW5MMENBSmYrMGlo?=
 =?utf-8?B?KytocEI0T25aLzNkUkZYbVhGOUl3eG5jbTlGUktLVVlCeHdlL3RheXV2YURH?=
 =?utf-8?B?UTBnbGgzZ3ppSHBCaUJmVi9QWDdyV0JGd3pteHY0R3BmODcyN2RRZ2c5NGQv?=
 =?utf-8?B?SUZUa2tUWmkySHBjd1gxM2RzUVRYaGZLLytSSDdlZ2JlcVlBMGVjL0dpV1Vt?=
 =?utf-8?B?cURCUVQzTExuSVU2VWJySVgvWldBR1g5ZkhvenRmdG54MXdBSDJuaHBGKzEy?=
 =?utf-8?B?ZDB6ZW45c0E5Z3NZTisxNDQ4V0w0cmxsVm1qb2M1NWVnM3FEWC9VdlEzNEJU?=
 =?utf-8?B?blhFWWF4TW1UK3lOTXRyZkkxb3pRM2FtdG51eW9maVRtRUNId0ExMElZZCtR?=
 =?utf-8?B?YWUwRkpvMDdzaVNsYUFMcUJkSWd4ZUhUYlZ1aHBhZUxnV2IvcjhaQVJxaG81?=
 =?utf-8?B?OUJmY3RHY0JLVFUxM1VERzVrZTNCcUZRZzJ4dFhHT0JNWGF3aGUvZGJZL3BW?=
 =?utf-8?B?YUtMeUpPRlRDMXF1K1VtOGVqaVQ1ZFRwcjhoTWxlc250Ni9yMVN1VnQzc1cr?=
 =?utf-8?B?bldDVkZTMk1UaHE4eVdObktHNmlIZy9weUYxa1VySDlrYUVSamNNWUkwQk5R?=
 =?utf-8?B?UE55Y2N2Sm1FNVcrN3F3T3drcUw2VjVFTm9LVUwwYjE5VnBkUnVEU1l0ZVow?=
 =?utf-8?B?NzFIWmJYTWR3ZjdtR2dqWEZYS1RiVEZJS0l2UFNoNW1Qejh3cmdDNUJBTHBz?=
 =?utf-8?B?ZE9JcnB6b0Q3Vko5K2cyanl0S21mdEkrdkc0cWtBYitKTEgzQTFhWSt2VHYw?=
 =?utf-8?B?bTFLeHFEcjVkcjMrRjNNZXFhL3FCS3BQWGh4VkI0b2JkcEhtWm5OK05XNTVX?=
 =?utf-8?B?dDl6Ym80YXBtbjA5aG5TLy9UWVVjb1BWMWlyY3ROZ2ZOVnZja3VtNGFuN2V4?=
 =?utf-8?B?OEw5MGs3Y2VORVBob3VMaGVGK2U0TFovaEo3ajAxRU1UcEJPVzA5eVV4bGs0?=
 =?utf-8?B?NFpXa2Q4dkdzQWo5b2g0am0vRnh6aDVlc3Y4WE0wdWRWSXJSSHo1Z2p0RjZw?=
 =?utf-8?B?U2V1bGNtN1h4VndWcVhVbGQ1WXg2TlJweEVKVEl2M1pHaVVpajByZGM0SEph?=
 =?utf-8?B?QjZpZHRuOFVkVDBSaTZ6eVdvS2RMUTZvS213eHFxYTh0TXBoQlIrNUVKZU1i?=
 =?utf-8?B?alFyMTJTNzk0UDV0TVRQSkRtaldZWWtYelF5ZGFMa0xoZ2I0ZmowNVNHZS9n?=
 =?utf-8?B?Ry8rcTBxd2JFUndhVkdDdlV4eHM2bzVNeXNkaFkzVDZRc2JyRGJwaUh0YkdO?=
 =?utf-8?B?VUN3UW1SbDJBbmUybjBCdHAwZmF6R1dBYS9kRzJFQVA0c1JrVEpvdkUxNUVE?=
 =?utf-8?B?bWJ2SFkxNVc5NjVYNGJ5a2d4cWJWaGN4amZLakhPU3RlSlVpTDlYOFQwbnha?=
 =?utf-8?B?OGNmTXJMUjB5RXRXWmtJK2QraTJna3IxOGMyUGZMTWQxMkFxNUNWQ0Nsb290?=
 =?utf-8?B?dGVpV1RhOEZLc2lodmNISytVTFRROE5BU0RHS2NZY1BDczNwRVhVQklsNWFD?=
 =?utf-8?Q?rr7dmZOpCng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFaeU1NZnFIYWtwZlVUbnBBV2dadnE5c3ZvTEtBdS9lWEVaSXhFMjVDcDBN?=
 =?utf-8?B?V1Rsc3BWZmlDVHFwdy9MY3A4NnFpeG5NOFBWakhsS1FNcXBtY2Rmb2t3TjRS?=
 =?utf-8?B?dTgxWmY4eWJuWjFHRmlEaWl3cUxDUXJUYlZDYnd5dVFCd29HYlE5RVdIaita?=
 =?utf-8?B?ZTFsaUV4NjJVbTR1bzJqbUlFc2xITGNmdEZwclN0L2dCOTc4bTBMMmRrTDJD?=
 =?utf-8?B?UmJzZ3RZdm5pblUzeFdKVEd6ekh6azBrbmh2ZzJXS2JRQW1XUkVrOGU0YmNo?=
 =?utf-8?B?UnB6Mkt0K3ozOWI2MUliMUZUNnJ1Rzk3cm51VHFZL0VFNi9BcjBsUFdQUktr?=
 =?utf-8?B?SDdZSXlOckkxbnVRa2h4VlluTjBoaVN3eGRtaVhRODEzREwyOXdETk1ycWV4?=
 =?utf-8?B?R2xIblVqWTZqQjkwNzdxZVpFMzVmcXNyNTByY2UvWndnenRhL25jVWc5M2Ex?=
 =?utf-8?B?MGFwYnd4dnVsdzM0VVVmTWJTZ29zZnNTT3BCb1VqbmhFKzc5VG5Fd1JreUpF?=
 =?utf-8?B?QTJpRkNTd0ZlSjFvSDhvMUlheWd3bU9raTIycFFoT3hoWFdhN09Wa211anJk?=
 =?utf-8?B?VStPcy9XQ2xZVGFydzZtYkp5VC9ZWlZVUDhiTTRmVm5NSElLbVpxall4cUpG?=
 =?utf-8?B?RjJJcTBlQzVHL01XNzRhRDkrQlhrL3d3a2RBaVBMRUVQTmx6b0tzMms2cU5H?=
 =?utf-8?B?NGd3Z3FFcG1qL3RsRlYwV09qN2dzMzN5bWw5eWtiR3d4V1Rwb0RxNWc2MHJz?=
 =?utf-8?B?bFZ5MUdRbnRZWlpaQ2ZXZUIwNHJFOTBUaEVXSVU3elNBRlJKU3pGREJKU3J5?=
 =?utf-8?B?dzZWcnBPUVlqVW92cytKbC8waHJEeXRMVEpNRVo0Z25BY3ZLU2NkUnVRSUh0?=
 =?utf-8?B?Z2xVSUNNVmZXOEpoY3JrbnIvNDJoQmxwckZmMkhBbXREbXVkZUVtVjVaRitx?=
 =?utf-8?B?OXNseTd5SDJxN0JNdUNSYWRGdGJkdFhYcUhKd0xrZzhUbDVyM3hMT0QrdjJ4?=
 =?utf-8?B?Qi8yYS9xcXE2QTVZc0ZpU3lIbFdrd2F5cWZJNE9rK0xaSDZ6b09iMkNtKytF?=
 =?utf-8?B?dm44QWhrd3FNcW5HTXRZSU9hKy9hVk1BMXdSdDRMQkhWYzJuNzhOL3Rza1BY?=
 =?utf-8?B?UlJqenBZNy9FejZpUGJGSkdpOGhwUC9xcTlXdHBVTjVBNm4wMmlBV1ZzVGhC?=
 =?utf-8?B?Q0oxYTNBeTdmdGtiakhObUU3NThEUkcxRTlnSDUzaTJNRTJvSGJOSGpibmY0?=
 =?utf-8?B?cEtFamRnUkFHZXY5ZUtRRVNpNVVkblhOMVdlM00vNDdUTTVJa0V0MktqK1gr?=
 =?utf-8?B?YmliV2wwbTZDQnBhalR0UDVDaUNqV0JEbURQaENQZEdQaUJBSHVVaFZ2akhE?=
 =?utf-8?B?WWRiUUd6aFZKVkx4OFVGTnBuSXRwdG4xQVExV3FvQ3lyT21tUUtSaGhSdEto?=
 =?utf-8?B?TmpwTnZsZ1B0N20wZkRzM2NrRG13VUZSd0k5YzZLRjdpOEF4SUVJS0NSL2R3?=
 =?utf-8?B?dUVLSUFUT2RYYlpMcDgyTnAwK0d1M3RmL1RIWHFSZlozTHpZOXl6dkYvL3RI?=
 =?utf-8?B?MlBaZ251eE1RQ0R1TU9ZZ041eS9COFhKc0pHVFQyYkR1dWl3OXdnMDJnamtQ?=
 =?utf-8?B?K1hoM2U5YkZUSldVeTRkTFo2V2oyb0NZVzVNUkhCWVRLbVhtRFdGaDU1RVVu?=
 =?utf-8?B?TDV4cjZYR1E1dFZHblhWV1JEOGRnK2VvMUlCVHA5S2FFc29ZTW9iVTF4eE9a?=
 =?utf-8?B?UVBkTmhxV1JZWkVBVm1TOTUwdlcydXRHa0FsaTNYelFJTkxJRGZnNXdlRHFw?=
 =?utf-8?B?VkJYUndSNjlaR2ZYVGxOSDFudE5OVmNzWFFFN2Q5d28zZFl3ZGZLOU5FVXpD?=
 =?utf-8?B?K002eWxQZW5CVGtaTlhiNmU0d045NTZkZCtFQStVc05uRXk5Q0VVM1FRNXQx?=
 =?utf-8?B?TzJZR0k0QzVtZllicUFLV2U1NjMvVWxpUVlOd3BtTkRSL0NxL3J4K2xKMUhr?=
 =?utf-8?B?cm5sbWVweHBjRkpXaFN3Sno0VHJhb1A3cXhhVURhV0ltSFdnYWVFei9XSnB1?=
 =?utf-8?B?S0d0SkRsbHh0aWR6OVNwTkI1V1JXUzRieXJ3TVhVbXhXaFVySU5WUjdKTW1a?=
 =?utf-8?Q?CuwUd2wUY4pw0lpQFXu4eCtDJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76806982-49ad-4a1c-c838-08dd983a17e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:35:43.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3aorFQWZy4m2slOVITzeScrC5NJdeHnV13gqle6T1qoW926WcB12u1YNAGLNEPg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319
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

On 5/21/25 06:17, wangtao wrote:
>>> Reducing CPU overhead/power consumption is critical for mobile devices.
>>> We need simpler and more efficient dmabuf direct I/O support.
>>>
>>> As Christian evaluated sendfile performance based on your data, could
>>> you confirm whether the cache was cleared? If not, please share the
>>> post-cache-clearing test data. Thank you for your support.
>>
>> Yes sorry, I was out yesterday riding motorcycles. I did not clear the cache for
>> the buffered reads, I didn't realize you had. The IO plus the copy certainly
>> explains the difference.
>>
>> Your point about the unlikelihood of any of that data being in the cache also
>> makes sense.
> [wangtao] Thank you for testing and clarifying.
> 
>>
>> I'm not sure it changes anything about the ioctl approach though.
>> Another way to do this would be to move the (optional) support for direct IO
>> into the exporter via dma_buf_fops and dma_buf_ops. Then normal read()
>> syscalls would just work for buffers that support them.
>> I know that's more complicated, but at least it doesn't require inventing new
>> uapi to do it.
>>
> [wangtao] Thank you for the discussion. I fully support any method that enables
> dmabuf direct I/O.
> 
> I understand using sendfile/splice with regular files for dmabuf
> adds an extra CPU copy, preventing zero-copy. For example:
> sendfile path: [DISK] → DMA → [page cache] → CPU copy → [memory file].

Yeah, but why can't you work on improving that?

> The read() syscall can't pass regular file fd parameters, so I added
> an ioctl command.
> While copy_file_range() supports two fds (fd_in/fd_out), it blocks cross-fs use.
> Even without this restriction, file_out->f_op->copy_file_range
> only enables dmabuf direct reads from regular files, not writes.
> 
> Since dmabuf's direct I/O limitation comes from its unique
> attachment/map/fence model and lacks suitable syscalls, adding
> an ioctl seems necessary.

I absolutely don't see that. Both splice and sendfile can take two regular file descriptors.

That the underlying fops currently can't do that is not a valid argument for adding new uAPI. It just means that you need to work on improving those fops.

As long as nobody proves to me that the existing uAPI isn't sufficient for this use case I will systematically reject any approach to adding new one.

Regards,
Christian.

> When system exporters return a duplicated sg_table via map_dma_buf
> (used exclusively like a pages array), they should retain control
> over it.
> 
> I welcome all solutions to achieve dmabuf direct I/O! Your feedback
> is greatly appreciated.
>  
>> 1G from ext4 on 6.12.20 | read/sendfile (ms) w/ 3 > drop_caches
>> ------------------------|-------------------
>> udmabuf buffer read     | 1210
>> udmabuf direct read     | 671
>> udmabuf buffer sendfile | 1096
>> udmabuf direct sendfile | 2340
>>
>>
>>
>>>
>>>>>
>>>>>>> dmabuf buffer read     | 51         | 1068      | 1118
>>>>>>> dmabuf direct read     | 52         | 297       | 349
>>>>>>>
>>>>>>> udmabuf sendfile test steps:
>>>>>>> 1. Open data file(1024MB), get back_fd 2. Create memfd(32MB) #
>>>>>>> Loop steps 2-6 3. Allocate udmabuf with memfd 4. Call
>>>>>>> sendfile(memfd,
>>>>>>> back_fd) 5. Close memfd after sendfile 6. Close udmabuf 7.
>>>>>>> Close back_fd
>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>
>>>>>>
>>>

