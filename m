Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F99EE863
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 15:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FDC10EDE8;
	Thu, 12 Dec 2024 14:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eknGFAeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EC610EDE8;
 Thu, 12 Dec 2024 14:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVqoYUe9Yr1xzt9Ir6YzDf6dUt4ifX8vwDiyktYlBKJdKXg8kPUZfOyLGQgnAnWR+0cPXL0jEeUYalxpw1Yqn9KftvlzZp4sSbmyTeoXXeh3PpU8wMP3lfJDX8bS64CgCZu/jZuwVzOmvUPK9yOg2PmFNoXqO9/aYDWuxNkhFOKaEgN3wmmYLolYsMjTLqaMz1Ta8xNVn8pFXYe/QiRWEJlBaGaJgJupfwAEpiAddXmBz7bbhFCcHLHj8M9TN9qutpGSO/jATcJDKh9/mJx61jS5QARqzg2EpRp/Z9g4tQMwQZCP9j9sGdun+lfX/Ya845Kk0ktY4sFmwXUptVzLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWcEK6z5Qv1WCN+VmTiP+c3gzpDy4L4R4/b/Oe96rbg=;
 b=GuF8C03VfUzgt267hA0y+ZjQSRoeRj6nokXtNSWpGvOrokSsbG+8Cihg3Ua5cdl2E4g3fakt2UfxlhbhIL/pOu+29NaHwGZwS9LBb6ihzpUW39grM1cxyqrajuDSTBxLBLfbiCgdMQbwuhlhUMAH357oFtWtMy9M0aIwhKonaVb+OVBzbaEM3AUnfyiqSIOJs/ZgxVkG71x85TkbIIabLGmdqZfGHs1i6pejLuRIdohe3sFYnlux9jnDM9jbcunv+eIjRdrpXXQrrIAS7paW/iX8i3KyOuvm3CPEZ+lgv0SXeRuTev3ZxNUJSXcwIwLjWiKQk4cVGTxCvFmuFrhvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWcEK6z5Qv1WCN+VmTiP+c3gzpDy4L4R4/b/Oe96rbg=;
 b=eknGFAeNc+yWGn8ez2f5BsQmH7f0NxIyXtjUyDYuVKwqXmM1lCDuYhx2XdkFL46Xo4N0VWLanxOZUrzx/6Cs7JdkyINHDvQuDKIC8aHtbDIZb0meFUBv1KPw5iUQBFu1K1mIuAMpJvpId/AQR0MKl4KfolBKfhb7wqP+X8+kozg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6976.namprd12.prod.outlook.com (2603:10b6:303:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:08:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 14:08:26 +0000
Message-ID: <6da5ea82-0c46-47ef-910a-6eabc26d798b@amd.com>
Date: Thu, 12 Dec 2024 15:08:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
 <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
 <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
 <SA1PR12MB8599C134256BC6E17AD66070ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <b402ba4a-fc8b-43c9-aabb-b6e482565331@amd.com>
 <SA1PR12MB8599790B4D062F061684CB92ED3F2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB8599790B4D062F061684CB92ED3F2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 03700b91-3d77-4885-edde-08dd1ab67281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3NFdlA5YkhrL3pGbXFsVmxBV0w2NFZoekdGSkpPZUlZMHRFbGxLSnJRekhr?=
 =?utf-8?B?Y0krb3Zjdm92ZXB1dUx2MEN1QWR6b2pzMStSTWQwSmtkUTFMbE92WWdRTnhU?=
 =?utf-8?B?cUFQVDNSRkNXSGtnR2xzUW82ZDEzZHNUeG5BRUFPMFdHRU5JYzBLdVBiV2lO?=
 =?utf-8?B?UzljcFpZTjJxUWl2NkZnMGZZNlJqNkpPMTFlMEtUUXU3L29sOTZnNTEwVm81?=
 =?utf-8?B?WEdsQmgyd3J6TVhxNTFHeWwzWlpJcTZJZ1YrNzVFbzdqWGl3RnEwaDZqNk95?=
 =?utf-8?B?RFl2SUhGb0tpem1qWGZmdFBPdEo2d0RtUGhOczJvcUkvSTZQSGNiWForM1lP?=
 =?utf-8?B?MnZsTkE2VngxRGdjQWkxbHFTOTJMN29GbC80MGUrZm1uRWNKZFhCSmJBM1RR?=
 =?utf-8?B?L0ZKVVB6ZVdSQ0FLR215TUdBWmNvNjBERDl1TitBb0tXam5nS0tXV2orRVd4?=
 =?utf-8?B?bnNKYUpERGxncGJKYndwVXI4VTJxZUN4UFlyTVZ2YkFNSWtaUzRlWGdvMUdJ?=
 =?utf-8?B?ZU5UYnlSYXV0OGhSVXhCNzI3cnVuV1pPbzNsL3pKbXQyUVlCWWRxWmRMenB1?=
 =?utf-8?B?ZUJRNzMvYngzcS8va0I3WVM2c1Ixd2w2ZUZsVkc1ZDBpbC9MdWdDSmVuNEdK?=
 =?utf-8?B?N0hWTEFaODlIajdkaVhHQTNtT1NWb2p0end6andQd0k1WUpCZmlpZ1JsVzBQ?=
 =?utf-8?B?bjVvZG14OUNWTjVZbVJQSFdoN05jbG5LQ2l6ZnBoTUpsSEw1WVpmbGc2Rk8r?=
 =?utf-8?B?U1NqTFhMNUhQM09BdVl3em9naDdnNnFWblNCV3c3cE9XQU9WNUpXcllBREoz?=
 =?utf-8?B?a1ZMaFhFbGNRQTF1bzArTDFzZzNzeGFyMWwzZGhvVFRSNURXYWhwRTZ4MEsv?=
 =?utf-8?B?UWIxVkd0YXpoQnRRYXVta0RsbnA3M3hBRkYrZlN6UXBlbzFISUtRS3J4VWhS?=
 =?utf-8?B?aENjTHJNNjVGQkoyTlBqMHJPMnRZOGdWZ2s1VzI0TzJEUmVCZW40cjJQZm1L?=
 =?utf-8?B?bERzUjJaUjJPQldzSmd2Zk9RSGRjVkhuMDc5S0lLdVIraTd2NUFVbkpMQW9E?=
 =?utf-8?B?bEJuTDhDczdFSlZ5WjJMWCtrQVd3eU8vTjFONWd1U1gva0tKL2QwS3cybkha?=
 =?utf-8?B?RFJrY3FMS1dWRzBSOXZOdzdMSmwzMWwrSHZCdnd2VnhXZkYza1JOQzQ3T2ZX?=
 =?utf-8?B?N21UM1orNUtwVlhFU083T0cyaWZPUW1IdHRzZSsxR2tlT0dKbkFFUlZIVloz?=
 =?utf-8?B?dFlWdkFSSU05U2tDN1B3c0tNUDRvVXplMGtHbnpnWHJwdHU1dVV0bjQ5Wm93?=
 =?utf-8?B?L2VER0hxSVM1cVZEV0VBU3pXT01JK0dvQU9obFNjQiszQVpGc1dUdFJzbkg4?=
 =?utf-8?B?c291ckRObjlDV2hrV2FXNkFacWEvWm1uVHIyT01MZ296TlpBa1dZQVFlNEtD?=
 =?utf-8?B?RTlsbGd6QXI5aUVTZm02Y1p5SFhMTVdOVkhxNXpLaGpwQjg4b2FIcXBNTFNq?=
 =?utf-8?B?OXl5N0hPS2tFMEVrWUFtSnhnZTN6YkdYUTE0UU1BZGFCMVZhQWQvUGlrTUVU?=
 =?utf-8?B?aEFXa0dOL1BPMHZ6VGNDR1NiM3BpNkc0UEF4bWFPcFdGTURTVUtIOEJzNVBx?=
 =?utf-8?B?YngxN0xkZmtlN2F1eEhOYjByd2lBZE1ZTjJhV2ViaUdlUEFsSVdOc3lVZVhT?=
 =?utf-8?B?dTZmSzNXRGgwU1d5NEpoSUhBVU5UTFFISTExVERMTWErQ2JLRHl0SFY5UmNq?=
 =?utf-8?B?MmF4cnQ1dkJjVDNEbzhNN3hjVVRKOWd4eS93ZC90d3ZuREE5Z3ZJV1M2b095?=
 =?utf-8?B?ODJxUk13TGJES1VMaldFQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVGeWRhb3BXWEVGbXN0aXkxRGlzWGdEZTFiTm52U0FLZklXNHZPMVpjd3pY?=
 =?utf-8?B?QnB6cS9vMFYwbEswOHBpVk0yY0xxQjJNbzJaUmUxclNteCtJOGZVWjh6QTB6?=
 =?utf-8?B?d2lJZndVQVdIS1R2Q21HN2pRWXdFL0xqL2ZtMjlJV1BtZTM3SlN1RjAyUnpG?=
 =?utf-8?B?TVF4WitGVDk0clEzaW1xejVtYU40NUFwQ3VIbHI3bnNkZndiNXFVYTUxbXVr?=
 =?utf-8?B?enBrVEd3UVYwUTZmNkUvZHhpQjU0YWNkMFdXcHNLejUxY2toV2hOcDM1Q0ZQ?=
 =?utf-8?B?Q3V3ZGRUZlcxcWxVbnhmVWRjUmxzZ0JCTjN2VEx6aFM5OUVhbnJrbThPSlJo?=
 =?utf-8?B?ZzZldGJEVlEzT2Z3dHBJSTQzblRpVWhJWWswejVZZVBBM2JlYjRsekNYbjRi?=
 =?utf-8?B?R0pFN2tWY0hGam5Ld3RXdUswTWJOWDJGeXd2SVBkNXMydmFOUmVjck1qeWd3?=
 =?utf-8?B?NEVYR0JMMmliUVg1M3Q3WUJCS3J3WGNpeEMxM1pseUZSUVdJbGx2MDB5TUxU?=
 =?utf-8?B?ZmpWa3Y4UTVwWk51VHc5MHd1ZTZBcFI0S1FoVXcxMWt2bmpSSDh1MjF3TFFV?=
 =?utf-8?B?SUUya01JL1ArT0tHWU5BZ3RtZEpWM2JuRy9HMEFGY1h2SmtzQm1PMS9VRnVH?=
 =?utf-8?B?YUlHQnJGVjdQOGFmRzJMa2ptR1ZZSGFKVnBPd0hhenFFVU1jMTNIVFZUREwr?=
 =?utf-8?B?ZklQV3g3QTlZUFFvY2NIcjFYbW85bkRrOUF2aFpyTGRpWE05RUhueCtpMjNm?=
 =?utf-8?B?cmtxTFJYNFhKL3pBK1dabzBTL2t1Njh3UnA4NXAvU0NDTW0xaGRLRWVkK2s5?=
 =?utf-8?B?em9ySmVXSXR3WGQvYVREd3h1bEV2UDRMZFNFVUFmb29DTVJueDRndlBwQm02?=
 =?utf-8?B?WUYxamdzQnZLd1J2Mk1JSElMdi9kL2xlYk9iNU5xUkwxYllwd2Fva21la1Bw?=
 =?utf-8?B?aGF0VWNXQm9xTTdCd3p1R3Y1RE9mZ09tSGx6Q1JURVNKRS9YYi9HU01KNEZF?=
 =?utf-8?B?Qm5vVDNxVW9KZjlhNGV3Z3drcExySTlSOFd0TE55SHJNSFVGQzZnZkoybE1a?=
 =?utf-8?B?eUQxVnk5eStmVERRcTdTbTU5REJ5cyswWTdHamJBV3lGNytCNlpuYWNDU0tE?=
 =?utf-8?B?ZWhOQWFRVWd0VVA1enNkUmVmNy90MmlMR2U2MGxtSFZFRXp4S3VOVHk1YWhu?=
 =?utf-8?B?R3dBb0MwTm5jUkpvd2Z0TmIvUE93bkdmdmZyV1IvNmNSd3NTSXo3TlNEZEtG?=
 =?utf-8?B?K25CR2lSWHZONnRtelJlU1Bva0NyQkZiMXNpL09tU1hxRWNhK3dZcThpSmxU?=
 =?utf-8?B?aGJobmNOVmc2aDUrd0szdHdsOEl4SXJXYzFrU0lQcERGSFJVSlFtTFhUVHFm?=
 =?utf-8?B?eGVoc0FzQ3VKWEtRV2VHR0VENXh4MitLd3ZKalExNWF2RTFUcjRnK3gyU21a?=
 =?utf-8?B?MHVJWFh3NkdqOWRJQTZEOWNXUUd2cXZvRWpxRWtCUDZIaE53dkE3VTRoRjEx?=
 =?utf-8?B?UzZLVXFaUitZa1I3dmEyT0VJdkJKWFFkTDFoM3k1ZzlnMDRRcml6RXd5UUk2?=
 =?utf-8?B?MTU0cFcxL1dxWEFOSURWdFBvenFsMGZJTlB6Q0pNaEtkbFZhN1NQMnAwSXZ6?=
 =?utf-8?B?QlZldDdvNC93cnM1SUk0WmhmZUUzL2JkVXBkWjE0c2dJZEsvQmJkNU9SbVE0?=
 =?utf-8?B?eEZIcVJLNzhMck1RK1lmY0RVUzJwWHVKVW9TOVdwY3pidFhhRWFkUytobnVY?=
 =?utf-8?B?Q0pGLzNXaTdWd0dYUHQ2S25tcDgxaitHTzRIaWRIcUFPdlhGQ1ZzUjVjNG8x?=
 =?utf-8?B?ZG1JY1RuTXorY0c1aDIvaHZBSGFkUEMxR2pqMnRGN1J6NHNsYThrcURhdFVw?=
 =?utf-8?B?S1ZWa3VFTlROeWFJa2IxMUt3NERSaXMzSTNNQ0dWc0ZOZzliazRQb0R4S1dl?=
 =?utf-8?B?MUR2Qjd2QmU4YmVNQzFSQno5VE1QM1ZMcUcxaVRvYWs3NUV1SkhXdU5MY0Jo?=
 =?utf-8?B?VjJ0OWxRdUFVcjdlUVNMb2ZsRHdUZ2lySExQdkJrdS9ubkJHMUNYSS82SU9a?=
 =?utf-8?B?UDVpTTdxS214bWVSbmh1REFwYkNiMjVzTTRFMHZxQmRXUVpjR0dKbFRMVVpL?=
 =?utf-8?Q?spUFOJzGJgd6lFZ5K0ckAds/G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03700b91-3d77-4885-edde-08dd1ab67281
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:08:26.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOAhmfzDx5rZH60cz03vkzEuuShFIQKdfa1ILF9BM6eX/ND1zy69HN2liZJYihsB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6976
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

Am 12.12.24 um 15:04 schrieb Li, Yunxiang (Teddy):
> [Public]
>
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Thursday, December 12, 2024 4:25
>> Am 11.12.24 um 17:14 schrieb Li, Yunxiang (Teddy):
>>> [Public]
>>>
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Wednesday, December 11, 2024 10:03 Am 11.12.24 um 15:02 schrieb
>>>> Li, Yunxiang (Teddy):
>>>>> [Public]
>>>>>
>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>> Sent: Wednesday, December 11, 2024 3:16 Am 10.12.24 um 18:59
>>>>>> schrieb Yunxiang Li:
>>>>>>> Tracking the state of a GEM object for shared stats is quite
>>>>>>> difficult since the handle_count is managed behind driver's back.
>>>>>>> So instead considers GEM object shared the moment it is exported with flink
>> ioctl.
>>>>>>> This makes it work the same to the dma_buf case. Add a callback
>>>>>>> for drivers to get notified when GEM object is being shared.
>>>>>> First of all GEM flink is pretty much deprecated, we only have it
>>>>>> for compatibility reasons. So please don't change anything here.
>>>>>>
>>>>>> Then flink is not the only way to create multiple handles for a GEM
>>>>>> object. So this here won't handle all cases.
>>>>>>
>>>>>> And finally we already have the .open and .close callbacks, which
>>>>>> are called whenever a handle for a GEM object is created/destroyed.
>>>>>> So it shouldn't be necessary in the first place.
>>>>> For the importing VM the shared stats is automatically correct by
>>>>> open and close,
>>>> but for the exporting VM we need to update the shared stat when the
>>>> buffer gets shared, since it is already counted as private there. As
>>>> far as I could find, seems like flink ioctl is the only place where
>>>> the global name is assigned? The importing side have multiple places
>>>> to get the global name, but the exporter always needs to first call
>>>> flink to allocate the number right? So hooking into flink and dma-buf should cover
>> the bases?
>>>> It's irrelevant where the global name is assigned. The problem is
>>>> that there are more ways to create a new handle for a GEM object than just flink
>> and DMA-buf.
>>>> For example you can just ask a framebuffer to give you a GEM handle
>>>> for the currently displayed buffer. See the call to
>>>> drm_gem_handle_create() in drm_mode_getfb2_ioctl().
>>>>
>>>> When you make this change here then those GEM handles are not
>>>> considered shared any more even if they are and you sooner or later
>>>> run into warnings on VM destruction.
>>>>
>>>>> I could probably make handle_count work somehow, but it looks like
>>>>> it's read in a
>>>> lot of places without locks so I'm not sure if there will be some race conditions.
>>>>
>>>> The handle count is protected by the object_name_lock of the device.
>>>> The
>>>> drm_gem_object_is_shared_for_memory_stats() function is pretty much
>>>> the only case where we read the value without holding the lock since
>>>> that is used only opportunistically.
>>>>
>>>> What you could do is to hook into amdgpu_gem_object_open() and
>>>> amdgpu_gem_object_close(), call
>>>> drm_gem_object_is_shared_for_memory_stats() and go over all the VMs
>>>> the BO belongs to. (See how amdgpu_vm_bo_find() and amdgpu_vm_bo_add
>> are used).
>>>> Then have an additional flag inside amdgpu_bo_va who tells you if a
>>>> BO was previously considered shared or private and update the stats
>>>> accordingly when that status changes.
>>> But the open and close functions are called outside the object_name_lock right,
>> so do I regrab the lock in the amdgpu_* functions or I could move the callback into
>> the lock?
>>
>> You don't need the object_name_lock for this, the update is just opportunistically.
>>
>> E.g. you go over all the VMs a BO belongs to and grab the VM spinlock to update
>> the status in the amdgpu_bo_va structure.
>>
>> It can in theory be that a concurrent process modifies handle_count at the same
>> time you update the VM status, but that doesn't matter since this modification will
>> update the status once more again.
> Wouldn't there be an ordering concern? Say the handle count goes to 2 in one thread and another thread drop it down to 1 right after, the two loops run concurrently. Wouldn't it be possible that some VM get updated by the second thread first and then the first thread and be left in the "shared" state?

No, because the update always updates to the current state. E.g. it's 
irrelevant if open or close calls the update, key point is that we grab 
the current state and update to that one.

What in theory can happen is that the current state isn't up to date 
because of missing CPU barriers, but since we are protecting the update 
with a spinlock that should be irrelevant.

Christian.

>
> Teddy
>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>>>>>>
>>>>>>> CC: dri-devel@lists.freedesktop.org
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/drm_gem.c   |  3 +++
>>>>>>>      drivers/gpu/drm/drm_prime.c |  3 +++
>>>>>>>      include/drm/drm_gem.h       | 12 +++++++++++-
>>>>>>>      3 files changed, 17 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>> index d4bbc5d109c8b..1ead11de31f6b 100644
>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>> @@ -854,6 +854,9 @@ drm_gem_flink_ioctl(struct drm_device *dev,
>>>>>>> void
>>>> *data,
>>>>>>>                        goto err;
>>>>>>>
>>>>>>>                obj->name = ret;
>>>>>>> +
>>>>>>> +           if (obj->funcs->shared)
>>>>>>> +                   obj->funcs->shared(obj);
>>>>>>>        }
>>>>>>>
>>>>>>>        args->name = (uint64_t) obj->name; diff --git
>>>>>>> a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c index
>>>>>>> 0e3f8adf162f6..336d982d69807 100644
>>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>>> @@ -406,6 +406,9 @@ static struct dma_buf
>>>>>>> *export_and_register_object(struct
>>>>>> drm_device *dev,
>>>>>>>        obj->dma_buf = dmabuf;
>>>>>>>        get_dma_buf(obj->dma_buf);
>>>>>>>
>>>>>>> +   if (obj->funcs->shared)
>>>>>>> +           obj->funcs->shared(obj);
>>>>>>> +
>>>>>>>        return dmabuf;
>>>>>>>      }
>>>>>>>
>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h index
>>>>>>> da11c16e212aa..8c5ffcd485752 100644
>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>> @@ -122,6 +122,16 @@ struct drm_gem_object_funcs {
>>>>>>>         */
>>>>>>>        struct dma_buf *(*export)(struct drm_gem_object *obj, int
>>>>>>> flags);
>>>>>>>
>>>>>>> +   /**
>>>>>>> +    * @shared:
>>>>>>> +    *
>>>>>>> +    * Callback when GEM object becomes shared, see also
>>>>>>> +    * drm_gem_object_is_shared_for_memory_stats
>>>>>>> +    *
>>>>>>> +    * This callback is optional.
>>>>>>> +    */
>>>>>>> +   void (*shared)(struct drm_gem_object *obj);
>>>>>>> +
>>>>>>>        /**
>>>>>>>         * @pin:
>>>>>>>         *
>>>>>>> @@ -568,7 +578,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>>>>>>       */
>>>>>>>      static inline bool
>>>>>>> drm_gem_object_is_shared_for_memory_stats(struct
>>>>>> drm_gem_object *obj)
>>>>>>>      {
>>>>>>> -   return (obj->handle_count > 1) || obj->dma_buf;
>>>>>>> +   return obj->name || obj->dma_buf;
>>>>>>>      }
>>>>>>>
>>>>>>>      #ifdef CONFIG_LOCKDEP

