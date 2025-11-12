Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3227C52312
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFDC10E703;
	Wed, 12 Nov 2025 12:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UEIB9+0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4A10E6FA;
 Wed, 12 Nov 2025 12:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WME0bLcLsbBydbJ10heOt1Wbg0qJRXSSwhuLFI9r4KZSGyWTwNIrrlIYlcvMvpV5jInkHiPrMfBGN+EUxAEdDkjOzd235TUKSRUOGjyMicB31+xpraLJqt8JIuodQKUYyx/x7cseocLY6dxm52oWAkBJ2ncYZeLOvwmIKFUbnT0/QD7oMml0HfWChDXu+tw83JccMau2xhaMopqPnlztdWkShXcU5ecq+OpXVuqNh51cqx+8nuw1DC7Ad6ZByQVb9YQSkyg6adfVMCrWHR5dAUHeEJnYSwPNWrqWwcBe6mxrqqgQcy1Q9QiBHOgQlq8iqPMwmREzKwWWU7vIo4trZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IHXztvXWdsrNuUi9MrgCOZrY15pt6/eUZegbexVljc=;
 b=TessT+ri4IyaRSGtIOBctTdNYEMBznYgHHL+nQ6NRf9gAjD2KxV4VCrxBuijyaDeHcjt0Z79GgXQkOv/hdvP458XLlFfzXTRR0U5QE0FVTNDClkhIp/3MbabExmUYcTfydmeYB7D6OMz8qTrUEOwFMdvzBoCSjDbQOkywG0mqeyPVqzECqfBJANzqj45FG6ELkRDyG7B26kcMhlpILUDiXbv3FlzrX/jnoazH5c8+CpEvXXBOvzT6miQ2CKv59ueDJ/2PYP+LbNDuyE6NJScvv5hpRF9gDK+OFgZz/qauIS5zmRCabomd1hbMWuIb40oPNE+bICwTmNUNivsgik2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IHXztvXWdsrNuUi9MrgCOZrY15pt6/eUZegbexVljc=;
 b=UEIB9+0X8YuEDKgFJmY65jMLMC740xWqLMZQ1U2lsBeX8OaaE96q3VfFYV45lUMzjFQSe9dsyfkD0I3Wk/S3VGOEIEcXgDnMEme/5AqvcPIGU6njBHIUFY2mBMo2WX4hzBLy5Ne0/B+huI2ynrJ3tiDdhPbdDQB/3sIrdqXEhqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 12:11:10 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%3]) with mapi id 15.20.9275.015; Wed, 12 Nov 2025
 12:11:07 +0000
Message-ID: <03b8be5c-64e0-4577-b4f0-0d505eff04bf@amd.com>
Date: Wed, 12 Nov 2025 20:10:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] drm/amdkfd: Add batch SVM range registration
 support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, Ray.Huang@amd.com,
 dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
 <32a918b6-37bc-4d83-ae72-35010d4f1a8d@amd.com>
Content-Language: en-US
From: "Honglei1.Huang@amd.com" <honghuan@amd.com>
In-Reply-To: <32a918b6-37bc-4d83-ae72-35010d4f1a8d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::33) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ae8518-f09c-451c-59aa-08de21e48f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkV3WllBbEpqQzNFeFUrUnRhMjlHVU1kTjVueDBDV25yR2FxSFduZVkvNFFO?=
 =?utf-8?B?N28yYVZDc2lFb09FbEZsR3VwcWRRazJNWFg4QnNkemd1dy9raGN6OWRVUVZz?=
 =?utf-8?B?U0RGQkt0THA5NDNJTktYK29KZzhUSDh1RlpBYUdUaXVBT2tiMy8yNkJUd3Vy?=
 =?utf-8?B?ZTJRMmE5RkljSG5PMUtGN3BqZlAvTHphWENMajlVRXBoL0srOGFKT1JqOTdO?=
 =?utf-8?B?WjM2eklEZnJUYmdVTVJmanJ3UjBpVTJDeDBrNmdiZnhray9xQ1VpRjVqdm1o?=
 =?utf-8?B?R1Q1c29PekVrbDhydnhLeXIxKzFmaGp5bldHMjhza0xoT2ZIaWdod2VCQnNJ?=
 =?utf-8?B?TTIzOURmQ3lBNG1OS20waUErWlBQeXNJWmQ1Uy9lWU42QXFqTDdvRysyQWx4?=
 =?utf-8?B?ZmRPMUsrRWZhZzd2aTNhcnduMkQyRE41MVZGdFRraE9kM3BUcjBoTXhtTVhj?=
 =?utf-8?B?MzZMVGhqTjBYd0Q1ZjlvMDVHeHNJbUhYTi9Mc1F6VVdXeFBFVDQ4ZW9maHJL?=
 =?utf-8?B?ZVB5cnpVeUVvekJ1aEJVc1c0WlVtcjQwT1N1ZUpFMlBvK2hkeFp6KzBMT1hs?=
 =?utf-8?B?T3h1TFVaNmVqRU5GVkhxd3BtNjZzWVliVVJlU1ptb0o4NEdXclFUcGhVbHBY?=
 =?utf-8?B?L1BOVlEySTZnelgwRGVkUU9MWFplYkhZcERleG0waTBZSVBVSmF6RTQrODlH?=
 =?utf-8?B?VG5SSmJBU3NiYmoyb0ZFM0xuMnYrSjFVRG91U1Y2eXV3cVFjWElzUmpaWEVp?=
 =?utf-8?B?Rk1XUGRqdm9PbVFyZklsRzllSmU5cVdnT1Bhd1IyRHFrNTljS3RVWGora1hN?=
 =?utf-8?B?ckhKRkEyN0t3dkRwMGRuRVFLM2ZKRzhkSm54QStHR0ZseHNYUStnN2R2UTk5?=
 =?utf-8?B?YjE1cElLS2QwdVhiTGpRMHFXMXg1eTJ1aEltdTBZdlNCQ2FsYmpqNFdDSjdz?=
 =?utf-8?B?YWcwbkpVS2VsWGhmMkg4MVRBSS92TXhiRDhDZ2RIWUVxSy8wRXQvTVNoS1BS?=
 =?utf-8?B?QTJEQ054TmhDTG5NZnU5dXNxZmN3TW1qb2x2Y28vNlgvUUdPUTdaZXdRbzdy?=
 =?utf-8?B?cjNXWEtSQVJqU3hXN2txSVFxLzlBMUZrdU4zZUsvQkJ5b2JrUG9VQ1VNUXha?=
 =?utf-8?B?TzBEdnZXbjF0Vm1neDA3WkN5T1BlNkxLaWlseUloUDRpc3UxcitCVy92QjVZ?=
 =?utf-8?B?bFpMM3YrYmJhZWZ0cndKMjY5bTdLbWYrUU5CSmIxV2RQMnExWUFKRnYwckta?=
 =?utf-8?B?VDlrNzlya0ZiOVo4RWp0cVhpcmNFQWRKN2tybndjK2hDYWZvL0FtVjRuNTlL?=
 =?utf-8?B?K3hlZU9MVTlpdlQzMk9JSGU5NWVSRWpuOVpBK2FpSktUNnppNlFSemRScHB3?=
 =?utf-8?B?blkxbWdPemVSV3pzZklLRWFvYWU3VXN5Myt2QkFmeFlrZVhpSndLREMxSG42?=
 =?utf-8?B?RHo4Uzl2bll2eC9XMVd2blFWNEhRL1RDL1E2T2tjU0psL29OcnU4OGhnL2VF?=
 =?utf-8?B?TTAvcllUSzRPK2c5SXd4NG1oVit1ZTJ3YVRZcERhby9LWlI3MzMxWFcwUjJu?=
 =?utf-8?B?SW1HWHlmQVNxaFI2MzBsVFlobTRiTHEzSWJ2bXJJK1RpNU5KVTBIQ1JxRmpE?=
 =?utf-8?B?bGZMM3MvZWZqS29oczVydGRkUWZsdURyOURHRTBDcUpleFlrdmR1V010blZG?=
 =?utf-8?B?UGlBY0dvQXFtbWprYnlMMzVjNWRwaDFrdHkvTnorMXMwaWsxaUVUWXBBeFhv?=
 =?utf-8?B?OEw1THQ1bDRUZ0JmbithemxKZE1pSHcyRUxWaFVOVlZMR3lYd1cyNmVOMDQ1?=
 =?utf-8?B?cU5uYXVOMWtXVnZxYXd1WHAvK1FkbFBzOERqMG11eU5ReU5HR2F6OUZHNnc3?=
 =?utf-8?B?NEwxd0hZVmRMaThJYVN0RTJYOXRjaEtkeEVwNmpSVWdTL08vYUJTQnM4VUtj?=
 =?utf-8?B?UlhZdktiTDdyOGVYUnZwTGFvT0ZnYmNNa0Zad3k2MGpub3BTWUswYlNSSTFC?=
 =?utf-8?B?VkxITUc0UFVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUt3Y3o0RFROUFlCYWxPVWVyU0F5MmlueUQrSnR6R2xqelpHcWswS01rSGpZ?=
 =?utf-8?B?cXRwSk1QQVVVVHkxWlk2L1B2b085MXVUQ0c3Y28wZTFheUtxdlZVVFZacWdM?=
 =?utf-8?B?a1ZOSWQ3L0ovZWdVdmJGbU83UnhJZS9QQ3d5OG92V2dmeXZvYWdNRWFReHhw?=
 =?utf-8?B?d0d2ZW9aVUZ5WUlkV3A1a0JTSCtWV05oY0xLRTZIcHlDd2FOdFdVU0M1UXpJ?=
 =?utf-8?B?UEM3anQxUS85UW9QNjF2K1lUS0psWWRzYU5FRTJRdlRUd1F6VzlYVXR0VWg1?=
 =?utf-8?B?NFdiV29jakNNdVNVMUNzbTREaW1hSzJocEdxVFY3QVNlRitZMENvYkN6U2VO?=
 =?utf-8?B?dEhhRGdDS2g0UTM3Q0tvbDVzUTNMQXJ5OHdsb09IbEtlVURKbTgvejlQeHh2?=
 =?utf-8?B?Ums0NzBidVJsZVl4dmRtV0taOGhWMm0zT3dTWk9jWno5N2dPRXBOYjNBWXRU?=
 =?utf-8?B?Q2JGeVRyUVdsckxjem9YRE85akhydnEzc3ptOHdGN04vR25ydXJLSEg2Q2V3?=
 =?utf-8?B?SE5NdUhOUlY0c2VBSDFzVUNIakp6WG82TklCaU1GVTBUOERhR3hWMFhlZ0RE?=
 =?utf-8?B?N3JmamtWVVdSU2FVeUdQaWJodVNaNjV1R0lFdFZHOWNtR3kvOFZzUlVEVGlM?=
 =?utf-8?B?ZE9IbkJEd2xRbHBsK2x1ZUhTdjY0L0hjeHdyWmJZYXVaY2I4QkQ5RXhpUnc1?=
 =?utf-8?B?Vy9XN0U0Yi81bUpYalJUNFl4cGpyR1F2MFlFUGdHb0daY1RNWkVlSU5CVmp1?=
 =?utf-8?B?c1cvZ2RwSmFIMXBGdkpBSWtwcDh5YkZPVWx6TWFwS3lqZzdmd1JwRmxiaHJD?=
 =?utf-8?B?bWgrNW9oWmdEcFhYV0lHWlJLb0lySVhUbVFIL1BpZndHMjFkUXZoMHZEMVEx?=
 =?utf-8?B?aHBRd2lLMFlvT2JUSFJnUW9SRlNNaVZsT3FVUGVISGlJdjYrZ01WU2p0SEFr?=
 =?utf-8?B?RXdzQ0E2aGluTk5PLzdRbklzZ3ZjL0NpUzlyWDA2YVFlK3NhRk1BSFVIclRy?=
 =?utf-8?B?cWdyQ1BKMVV1ajRUOGtud0Zya1FOV1hVVDhyTmZLYjRRU1pHK3RxRlk4cCtx?=
 =?utf-8?B?MUxMRUVRazJHVEpUTDNvUnR6MWVPWTlaR1huNkNMNFkzR3JMMzJKblNCQjdD?=
 =?utf-8?B?SWVma3B1Ny8rMzJKRWFWVGN5ODFsWjR2ZVZiVWFjMmRpUGNHQ0hPRUpEaTd1?=
 =?utf-8?B?RUE5NXRKQ3B6ZjkrY1ZLL2dXMHdXdDg5ZE90ZnRJNUlmR1pWUVVTcE1DazV2?=
 =?utf-8?B?aGs1L0dMS2VJVk5FWDN6ZC9nUXlYRzVtYlBCVTVFTjN5M3R5MXFqWEhJRzRP?=
 =?utf-8?B?SThsWjNaZ0EwL3Q0MWtHSzFMRzJSa2t5TlNFRm4zUTc0S1ltN2p4VkRzS3Mz?=
 =?utf-8?B?elRqb0Z2ZWlaRkNUQmZFNnZUL0VmSDI5V0p0c2ExRnhFZGZqTnliamV6RU5I?=
 =?utf-8?B?RnhweTdmSDlZY3hSdFczbWh1c3dFMWZ6QndDVS9qaDhROFNVTFlWMmptRHEy?=
 =?utf-8?B?TnFZdERvUklNMjAvNUxPcUpBdTdGbFI3TlE3QXBWL1NRd3RuVHF5MFJKc3Nm?=
 =?utf-8?B?d01sOXZxV1VFUTNUdGZwVjFEbkQ1cEN3eW16WGdEUGlLZTM5YW5LYzBHQyta?=
 =?utf-8?B?WkdpU0RkZXljRWRyV2ZJUWNPZjVDQXZ3RmQzY0tvdXZ1c0ZtQ1BWTDFuSDJN?=
 =?utf-8?B?N25QQ0RvbWdiTjJ5Q0Y2MEI2aGdKbUI5Tm1hS0Z2Ly9SNVduTlJWQkpjL2V3?=
 =?utf-8?B?c1RndzRQdHVkWGtPTVNsM3lGbVFXcWVBcmRiMmQvMGxKbXg1WEpTdWtlN01I?=
 =?utf-8?B?eEdhSVNuNTRDUGgxRi9oOWtndEZzTkc2T3ViYnpQNDJKaVowL0FNbFVGRVFX?=
 =?utf-8?B?Q0g2U2hESWpYaUtzK0NvVXc0cisyL3dLNS9kdWUwWWFpcDk4ZDRwSHVRZ01r?=
 =?utf-8?B?N0ZpSS9vWHl1NWNUWVdpR3dtcG9CcFEvdGRqWTZRSmx5UUdqSkJhOW9kTDNX?=
 =?utf-8?B?M2xhTmlwUnVaWmdmWU1yWFloWk95YW9YZmtSWUxtc1c1K1Q5YmNSL295QTBG?=
 =?utf-8?B?WWxBTnFVVWM0eWN0RUZrMXJkRXRiRlh6cVVNTUx2Njg0TmN0UmxheVRDTWwy?=
 =?utf-8?Q?+NAAqxU8hU+469BqHg03RKjCm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ae8518-f09c-451c-59aa-08de21e48f76
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:11:07.7536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjRpD5/sl9+zpvUrSVfEBsz0hg334Pm9WWIlSrIGAyvaIejjj9usrbwROgyuH8PhWe91t6jLODNBdjw92Qxzqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184
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

Hi Christian,

Really thanks for the detailed feedback and insights. Your comments are 
incredibly helpful and clear.

On 2025/11/12 16:34, Christian König wrote:
> Hi,
> 
> On 11/12/25 08:29, Honglei Huang wrote:
>> Hi all,
>>
>> This RFC patch series introduces a new mechanism for batch registration of
>> multiple non-contiguous SVM (Shared Virtual Memory) ranges in a single ioctl
>> call. The primary goal of this series is to start a discussion about the best
>> approach to handle scattered user memory allocations in GPU workloads.
>>
>> Background and Motivation
>> ==========================
>>
>> Current applications using ROCm/HSA often need to register many scattered
>> memory buffers (e.g., multiple malloc() allocations) for GPU access. With the
>> existing AMDKFD_IOC_SVM ioctl, each range must be registered individually,
>> leading to:
>> - Blocking issue in some special use cases with many memory ranges
>> - High system call overhead when dealing with dozens or hundreds of ranges
>> - Inefficient resource management
>> - Complexity in userspace applications
>>
>> Use Case Example
>> ================
>>
>> Consider a typical ML/HPC workload that allocates 100+ small buffers across
>> different parts of the address space. Currently, this requires 100+ separate
>> ioctl calls. The proposed batch interface reduces this to a single call.
> 
> Yeah, that's an intentional limitation.
> 
> In an IOCTL interface you usually need to guarantee that the operation either completes or fails in a transactional manner.
> 
> It is possible to implement this, but usually rather tricky if you do multiple operations in a single IOCTL. So you really need a good use case to justify the added complexity.
> 

You're absolutely right about the transactional complexity. This 
operation indeed requires proper rollback mechanisms and error handling 
to maintain atomicity.


>> Paravirtualized environments exacerbate this issue, as KVM's memory backing
>> is often non-contiguous at the host level. In virtualized environments, guest
>> physical memory appears contiguous to the VM but is actually scattered across
>> host memory pages. This fragmentation means that what appears as a single
>> large allocation in the guest may require multiple discrete SVM registrations
>> to properly handle the underlying host memory layout, further multiplying the
>> number of required ioctl calls.
> SVM with dynamic migration under KVM is most likely a dead end to begin with.
> 
> The only possibility to implement it is with memory pinning which is basically userptr.
> 
> Or a rather slow client side IOMMU emulation to catch concurrent DMA transfers to get the necessary information onto the host side.
> 
> Intel calls this approach colIOMMU: https://www.usenix.org/system/files/atc20-paper236-slides-tian.pdf
> 

This is very helpful context.Your confirmation that memory pinning 
(userptr-style) is the practical approach helps me understand that what 
I initially saw as a "workaround" is actually the intended solution for 
this use case.
For colIOMMU, I'll study it to better understand the alternatives and 
their trade-offs.

>> Current Implementation - A Workaround Approach
>> ===============================================
>>
>> This patch series implements a WORKAROUND solution that pins user pages in
>> memory to enable batch registration. While functional, this approach has
>> several significant limitations:
>>
>> **Major Concern: Memory Pinning**
>> - The implementation uses pin_user_pages_fast() to lock pages in RAM
>> - This defeats the purpose of SVM's on-demand paging mechanism
>> - Prevents memory oversubscription and dynamic migration
>> - May cause memory pressure on systems with limited RAM
>> - Goes against the fundamental design philosophy of HMM-based SVM
> 
> That again is perfectly intentional. Any other mode doesn't really make sense with KVM.
> 
>> **Known Limitations:**
>> 1. Increased memory footprint due to pinned pages
>> 2. Potential for memory fragmentation
>> 3. No support for transparent huge pages in pinned regions
>> 4. Limited interaction with memory cgroups and resource controls
>> 5. Complexity in handling VMA operations and lifecycle management
>> 6. May interfere with NUMA optimization and page migration
>>
>> Why Submit This RFC?
>> ====================
>>
>> Despite the limitations above, I am submitting this series to:
>>
>> 1. **Start the Discussion**: I want community feedback on whether batch
>>     registration is a useful feature worth pursuing.
>>
>> 2. **Explore Better Alternatives**: Is there a way to achieve batch
>>     registration without pinning? Could I extend HMM to better support
>>     this use case?
> 
> There is an ongoing unification project between KFD and KGD, we are currently looking into the SVM part on a weekly basis.
> 
> Saying that we probably need a really good justification to add new features to the KFD interfaces cause this is going to delay the unification.
> 
> Regards,
> Christian.

Thank you for sharing this critical information. Is there a public 
discussion forum or mailing list for the KFD/KGD unification where I 
could follow progress and understand the design direction?

Regarding the use case justification: I need to be honest here - the
primary driver for this feature is indeed KVM/virtualized environments.
The scattered allocation problem exists in native environments too, but
the overhead is tolerable there. However, I do want to raise one 
consideration for the unified interface design:

GPU computing in virtualized/cloud environments is growing rapidly, 
major cloud providers (AWS, Azure) now offer GPU instances ROCm in 
containers/VMs is becoming more common.So while my current use case is 
specific to KVM, the virtualized GPU workload pattern may become more 
prevalent.

So during the unified interface design, please keep the door open for 
batch-style operations if they don't complicate the core design.

I really appreciate your time and guidance on this.

Regards,
Honglei



> 
>>
>> 3. **Understand Trade-offs**: For some workloads, the performance benefit
>>     of batch registration might outweigh the drawbacks of pinning. I'd
>>     like to understand where the balance lies.
>>
>> Questions for the Community
>> ============================
>>
>> 1. Are there existing mechanisms in HMM or mm that could support batch
>>     operations without pinning?
>>
>> 2. Would a different approach (e.g., async registration, delayed validation)
>>     be more acceptable?
>>
>> Alternative Approaches Considered
>> ==================================
>>
>> I've considered several alternatives:
>>
>> A) **Pure HMM approach**: Register ranges without pinning, rely entirely on
>>
>> B) **Userspace batching library**: Hide multiple ioctls behind a library.
>>
>> Patch Series Overview
>> =====================
>>
>> Patch 1: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute type
>> Patch 2: Define data structures for batch SVM range registration
>> Patch 3: Add new AMDKFD_IOC_SVM_RANGES ioctl command
>> Patch 4: Implement page pinning mechanism for scattered ranges
>> Patch 5: Wire up the ioctl handler and attribute processing
>>
>> Testing
>> =======
>>
>> The series has been tested with:
>> - Multiple scattered malloc() allocations (2-2000+ ranges)
>> - Various allocation sizes (4KB to 1G+)
>> - GPU compute workloads using the registered ranges
>> - Memory pressure scenarios
>> - OpecnCL CTS in KVM guest environment
>> - HIP catch tests in KVM guest environment
>> - Some AI applications like Stable Diffusion, ComfyUI, 3B LLM models based
>>    on HuggingFace transformers
>>
>> I understand this approach is not ideal and are committed to working on a
>> better solution based on community feedback. This RFC is the starting point
>> for that discussion.
>>
>> Thank you for your time and consideration.
>>
>> Best regards,
>> Honglei Huang
>>
>> ---
>>
>> Honglei Huang (5):
>>    drm/amdkfd: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute
>>    drm/amdkfd: Add SVM ranges data structures
>>    drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
>>    drm/amdkfd: Add support for pinned user pages in SVM ranges
>>    drm/amdkfd: Wire up SVM ranges ioctl handler
>>
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  67 +++++++++++
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 232 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +
>>   include/uapi/linux/kfd_ioctl.h           |  52 +++++++-
>>   4 files changed, 348 insertions(+), 6 deletions(-)
> 

