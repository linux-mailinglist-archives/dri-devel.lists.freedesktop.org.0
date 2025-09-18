Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDAB83F85
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 12:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9598210E6C6;
	Thu, 18 Sep 2025 10:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a1wVObU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7C310E6C2;
 Thu, 18 Sep 2025 10:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3xsMnyPzSy66dDseOBW1vPaRbGEXH5RWDpcR1Eqp1LKjdKEpePkNN7OX//eR7+id/kkxaQ7/hzv1+1HftgSG1nV70We6GRYI598ACgvBEKNHWlLBXnVIsAVrQ6oUDUaQB2qkVUm3r5C9Kamkq39ES+y8+yylukRS21NORYo+H2H30E2Ao99hfhpMMPeinbCdlEXdSAvPpEH7N5fQpsnx6JLsdzFWqfMTAdAM/sHaqvWJx2ML717N8FUi5kZyGy0aRdIdWj4cSfE49EcQuc2yMR4xrL770GI3UQf8eFLVZHWjly3ycN6q3DT/gdnYtQBylh08GHQS7Kro5Bg2npL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJxeu6NWSalr1wFdBhWaXhaa+G94rWVAhAZkPgwXoJI=;
 b=Ju6+NwwcYTCnmJ0XEaVenF0B6GHd4/C/wncxAEj/PdW2srJYRtuaMGwHvUo6WrZHwoKevd1lrTieapfkL7S4mhfjVc+5GLVOYOrtq8zlwosj700qhkToQTJrgnaLA1WJWLnxdnRSHQIrjh6dEN5mN7yfFJn/1y9Y8rVXA2KEqHPK110WtfMVzKX3Mu4QWIknb6gWxvX1Doi7Z3TEEYaxE/xX4XuAKT7BgYd4EL2h9N75eksCrjCIUpQ+geuKVzQZSsUBydpkC28T29vKeL7sBdljsbMgwH9xIm8HS2J96dHP0YQdM9kk1iZoJthJ6whnXDsjz+VNqlvGpkf+m+qwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJxeu6NWSalr1wFdBhWaXhaa+G94rWVAhAZkPgwXoJI=;
 b=a1wVObU04djjwEa51nrNLmMgF5/oahJ+nJuL8xYZQqW9KghqmyNRE9ARnYmHUSbWSQJaAg0qEwcP7g3iNd+lcb83/GzzOBDyDXegfTlASZDRmO7G8bTNdOR7AU+vPVcX4GuZiAuhneRMIcVlKMoWuxKmMrQhTNUKw0YP3Waz5VM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 10:10:06 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 10:10:06 +0000
Message-ID: <3c8a04e7-c17b-4579-8d6d-4e9aa97ba607@amd.com>
Date: Thu, 18 Sep 2025 12:10:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/syncobj_timeline: Exercise signaling of
 awaited points
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250916095707.918819-2-janusz.krzysztofik@linux.intel.com>
 <b1897f06-bac3-4677-aa38-c959dedb6c39@amd.com>
 <3568023.QJadu78ljV@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3568023.QJadu78ljV@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::26) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: b767e424-c15c-4478-5871-08ddf69b8aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1pOeUYrRjFieWFEeUVvS2t0YU9ySW85RWs3S2hPMkhYUVhiVFVZUTFMd2dn?=
 =?utf-8?B?dXgwTm5OUE81OG1hNEw4eEpadmIvQTZ6ZnY0ejlsOXU1by9PTksrenVBU3RO?=
 =?utf-8?B?cVg1TzRJN2R1MXJobE13eTFlQkdUYjJUS0ZMSndKMXlZeXFuN2RKVFd0SnRq?=
 =?utf-8?B?Z2Z4bFZrSDBiL2d3aFRtZzQxRTlRai90ZkZnZ3RrczRydGQzQWdzQjkyOUxs?=
 =?utf-8?B?Q3R0UGJlUVhKQ1lRMml2cFBJYUlrSGZuakZTRk9ld0xsOUdKQ0hOdlhvckt6?=
 =?utf-8?B?YjN5TzA3U0o1VCtJSjN0LzdtWG9neDJkWjBDOENuenVsS3c5Y3MvWWxuNE14?=
 =?utf-8?B?M2FkZ0xpVjZXZnJKTExlaHlZK3BocC8vUVBpQjBwK0MxNnhZT3BkMWFmRCt0?=
 =?utf-8?B?SVNyNHFTVUhpRGc2ZzFRWG82dzk4OGNzTGRTL0RRUnVnTU1OTzZIM2V4Rytz?=
 =?utf-8?B?QXpod1g4MTd3NkhmOHFhVHA4a0liczVsWXNkSnZvMm9TSEFEV2NZZVd6QytD?=
 =?utf-8?B?TlRDNjYzVlZYL2FkNHVFQkNBcjNTTVFaRU5mM2lYL3c2akh5NlAxSFZxYU14?=
 =?utf-8?B?VXNORXdGK0JNVnQ5a1NESW9PbEZRZkVGbnpyQU8xVkhESG93clQrTmJUNWNZ?=
 =?utf-8?B?UkE1Y2JRSnNJb2NxSU55WmU3VG9BY1cyRGlOeXJlbGNxckdZWHlqYVBhTThP?=
 =?utf-8?B?TURUYTNIWmtnMXg0ZWJDbFBHUmJTd091MzF1VWxnZDN4YmpiSmpUb3Zqb3N4?=
 =?utf-8?B?WFZvQ044SmJFSks5TUxtcms3ODkwMGhaYkd4SWM0TDRDRDREVWxBb0JqMWlJ?=
 =?utf-8?B?TDBjQ0RDd2tFejd1cGxzQ1EyR09KODJBZTRPcndyOTAwYTlzWGsyWDhvR1E2?=
 =?utf-8?B?a2tyMkg2dkZwc0tuSlk2TmNUMGhEMjlmQ3U1OFBMSVZUaE5IQUZSWkEvUXll?=
 =?utf-8?B?WUZGMzZSODVuNGVPaU82TFkxTWVjcGdXNVA5NktQTDBCZmdtR3pvalFKRHN5?=
 =?utf-8?B?dlNMMzI0T0gxZnJZNGpqNk9qSnNmckY3cjE4azk2aDE4RFpCWkF3ajltbWZE?=
 =?utf-8?B?eFUzZithbUxIdmpqQkFySWUrUU95VEZ4VzJVbzR5dmw3VDNQQWxSa3ZheWtU?=
 =?utf-8?B?RGlQdTFSWDBhTzVkZVNGQ2Uzc0I4L0duWnJSZzJWME5VekNlZE9PMm1Wb0hm?=
 =?utf-8?B?S1dmdzk3SnkrcmU0RTkxZnMwMlBoc0NFOUJaRlZISDd4N252bFlxbHJrV3pu?=
 =?utf-8?B?NUlLVWxJMDJGU3hoVU5QbldicUhlWXNQSUoyamNrdHVPNzFzOTl5Z1V1ZTNj?=
 =?utf-8?B?RnpPZ1pGRm9kdlF4eUhQQnV6ZXJaN0xVOUZOVnladk5keWNWUzJXdllhaHJZ?=
 =?utf-8?B?UkNNcGRaVnZqOXdqUTRzUi9MSUw2QUtQMUtwUm1Yclc5Tm5EVFIxVjVDMVBK?=
 =?utf-8?B?ZHJyWS9TNWdCS2h1eTJsSUJ4WEJqb0FNZXYzMjF3RTRmeVF0d0xZQTQ1WGJq?=
 =?utf-8?B?Sys3TENBNG1RQnBreDdTMnVWVXJzaXZ0MmNOcFEvWktqM3hkakhid0RuWUNP?=
 =?utf-8?B?aEpLVEw1eWhDek1BZ0wwRm9uaDBIY3FYQUxuWnRzSms2Y21DZ09ENlk3Y3VU?=
 =?utf-8?B?NjFLVUUzdUwrS0tGR2VYTnFIbWkxVWNaNTdUcTQ2ZWlyb1FoNWZTT1pVaU9D?=
 =?utf-8?B?ZWdVbVJWZ3d0UjNLT3ZNeHkwWVV0THZodlh0bEtxblFwYUJVUWxFalJnbVhW?=
 =?utf-8?B?YWpZdHhOS01DK0M1b2hzU0o4U0RJMm92QndXdDQ1aEZ5VDdrOWJEbTR5Qmkw?=
 =?utf-8?B?Q0pkaEx1SVUwbzRqQkVEa29SK1l2ZzlsOS9ob1lqQjFMbWJiVWZlQjM3eW92?=
 =?utf-8?B?WlVnY0pqdWpGd0VGWUlENjc3RitUNmhHSzJhVEJZR1VnNXZsZ3NVRjJzMzU4?=
 =?utf-8?Q?kPi9syT7h1c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9tdXBYYjBXVHZPTHF0UlVoNWkvaXhwVHdGVHJOSVBYL2FmS3NvTDl6RWNs?=
 =?utf-8?B?UVZyL2VUbGVYNmc3NThQR1Nvb1pPQWdQQkJtSG5lTnNHckpkSFFnNWlhMkhq?=
 =?utf-8?B?aEQ2ekNUQUNpYklTM3NaaENQOUR4OFUvU1RZRzVjNEdrNUVObzdUQ1ROVWQx?=
 =?utf-8?B?WGYwNEFFWmdCSzhteUlyajVBbVNjS1g3ckcxSXVpMW5pNlQ0ZTVRSXpoUEUr?=
 =?utf-8?B?UW41WXFPRkJIcEY2V3JVdG1XRVQweUpxQ1ExZFhMMzBnRTFIeko4dWUxcTBR?=
 =?utf-8?B?dlVPaEhSRDYzTGY5OHVoWTQvcVROT2hUSzIrcEcyZmg4NmJGVHd6SG5Wdy8z?=
 =?utf-8?B?ejBneG9WaWhzcjFRT1VKUFFTdWRXUE9WMTRDNHFUbWpJeWNWR0JrdFIxSy83?=
 =?utf-8?B?QXZ1bHhrZFZ0eTVDQnBPMzJ1NHVmdGw0VUFuVlVNZjhKUEkwMUdYaVRDQlBw?=
 =?utf-8?B?a1hML1I3b1QybmV1WGt0ZVMzVjBlazdJM3BObFgwa0NKV2JlaGZFdW40ZWNT?=
 =?utf-8?B?ZS9oQVJnSnkxRDdtN0F2U21vV2VDdVpFRVY1M1ZMVk1OSnZhRUhIK1ZJbGFU?=
 =?utf-8?B?MzA2TFdsZ1FVTEpwK2FXRWdVU3U3M0ZkYjUrR0VPb1BiUk01bndGbDJRdk0x?=
 =?utf-8?B?ZTRtUzA3MmdwNW5tSTZreGJ5WC80aEg4MzBQNnEwTkZKYnlkc3pZRVVzZkMr?=
 =?utf-8?B?L3lrMzd1eG82cGpYNFZMbTB3TGM1VVU3YzJRV2VKcGpwWHB2am45UjRBUHJJ?=
 =?utf-8?B?SUZiOGNUZFNYeWhIZmUxU0tYZ3F5MEYxMS81aG04YTNOMHlFZnpBR3UvaHBF?=
 =?utf-8?B?cyt6MHRxQjRVY2lXSTVoQzAvU2lFaFVDK3c3QjB2Vm1XYnB6bjMvV21WQkJP?=
 =?utf-8?B?a2V5ei9CejhMUEJpQXpvNnNXNzJrOVQ3U0xaa3VWTkNoZmtDa0JHL2tTSm9t?=
 =?utf-8?B?bHhCQjBpRVR4bzc1cjUrTEFLUldxZVd3Q1RCVDFESzRTQUNyZXZpeHBZSllq?=
 =?utf-8?B?NEJxVVpqeCtxN0NJd3JVNmUzMHJWdUhYcWVPUkxRQXZSdEQ0cEw1UmQ1UVVE?=
 =?utf-8?B?R01iVzRIT2dLS1hCbzdsSHYyZTUvc3lsbjlmYUJEdXN5Znp1MUdHWG5ybFI3?=
 =?utf-8?B?S2VuYVN6dVYvdWdiVHhHWkdjRmFXdEZvWUljQkdMNmhEbUxxTEdHMW5kQjRn?=
 =?utf-8?B?T2g0dldKNW9HeE0zUVVLNjRoNk1vRmJ0U3dlUFdjVUpFSlRZQytVVk5sSG1q?=
 =?utf-8?B?VS9DWjhVYVpZOHFaNGQ3L0Y0dGhUdy9MNUlkaTJybHBWOXFpMkl3dUdzN0Z0?=
 =?utf-8?B?a3pCQ0pCZ3lmemY0QVRrdEUzQkJoNG8wZWVjSXpoOXMzdE4yVGVRaW1LalNk?=
 =?utf-8?B?ajhkOU1yQmdrdi9yWThzVTkxNDA2eHNBbkN2WDg5NnEzZXA0M0xzSFVEUGFY?=
 =?utf-8?B?ZnZFbVVDaGFxekFhVzdseDY2NThMOEN4dk50WU9TQzlObTRMU21yQVc0NE1N?=
 =?utf-8?B?bWpQaEYvMFZFTGFkeEhnSUk5M2VKQnY2QVFYL0lhd0FlUHJPeFljMzhNZ2NQ?=
 =?utf-8?B?Y2REMW9qSCtuWUFjbWRkTGg2dk5CNTBJTktNSnVSb0hLYTA0RTBHV3psN3Ar?=
 =?utf-8?B?WEpFWVYwSXdXZkR6L0FNTmh5Z0ZVVmk5TndlenJsZFhCcXhwSDBwSmFWS0Iy?=
 =?utf-8?B?YkFCOUgrSi9hbXN1UVNEQXlwNGRSOFNuc21JMFVMM3lIdkZmeFh3ZUZzS2tS?=
 =?utf-8?B?RjFxUmtoWFpVeFAxeXFRRmRmcVRvckxrdkVwS2JYajlVVGozUVhBellWcmNW?=
 =?utf-8?B?c21QT1oycFhtbDlRL2pSemtiTW1hSDBxcS9MaGN0bVFVREd2a3VNM0o4emRX?=
 =?utf-8?B?bXR5ZktuYXN0UW80OGZoK3JXM04yOE5wREdkNUJ1T0szTE0rQWd2Znp4aGZP?=
 =?utf-8?B?Q0I1THZkd2dPOWdxTktXRU82WCtsTlQ5RDFZcXZ5RDFndlN0THI3dXlYV0ZJ?=
 =?utf-8?B?bEhIZkkxMm5UUDB0RHNCVUN0S3N4Umxaajhwc2xCYjRpSkduR2ZVSDNPd2RV?=
 =?utf-8?B?K1hoMS9qNk40RjBiemZmV3E3S1hjbm5pM0g2Uk1XdHQ1anVETlVRWjUrWk1r?=
 =?utf-8?Q?ZjKHK2L1u0qPLsYlfoVAmdnDO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b767e424-c15c-4478-5871-08ddf69b8aa0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:10:06.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E19CicBP3aPjwJMlG4xyKUvmVoZiUdCBMrNlmDJjf1cZeJwOlKQgx7My7+LucifY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694
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

On 17.09.25 20:32, Janusz Krzysztofik wrote:
> Hi Christian,
> 
> On Tuesday, 16 September 2025 12:58:22 CEST Christian König wrote:
>>
>> On 16.09.25 11:55, Janusz Krzysztofik wrote:
>>> CI reports kernel soft lockups when running a wait_backward test case of
>>> igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
>>> A kernel fix has been developed that has proven to resolve the issue, but
>>> it hasn't been accepted upstream, with a recommendation for dropping that
>>> test case as a "nonsense".
>>>
>>> Before we decide to take that path, try to implement the problematic test
>>> case in user space as an IGT subtest.  Since no kernel uAPIs have been
>>> found that allow strict reimplementation of exact algorithm of the
>>> problematic test case, where every link of a dma-fence chain is signaled
>>> one by one from a loop running in kernel space, provide two approximate
>>> variants, one that signals each fence with an individual system call, and
>>> one that signals them all in one shot with one system call.
>>
>> Those tests are unrealistic outside of the syncobj framework.
>>
>> E.g. a test which exercises signaling each fence individually would require 
> HW which would do that to happen in reality.
> 
> I've been trying to understand what you meant but I've failed.  If a user 
> submits a number of DRM exec requests, each with an out fence, then HW will 
> signal each of those fences when its corresponding request completes, won't 
> it?

Correct, but the design of the dma_fences is that multiple fences from the same context always signal in order.

So you actually can't have that many submissions in flight inside the kernel or we would run into much more trouble.

> But anyway, some of those subtests, e.g. stress-enable-all-signal-all-forward 
> or stress-enable-all-signal-all-backward, can trigger hard lockups.  Shouldn't 
> we care?

Yeah, exactly that isn't possible in practice.

See to signal all backward for example you would need multiple engines independently from each other signal fences in reverse submission order.

Maybe some HW scheduler could construct that somehow, but it should just never happen in practice.

On the other hand, what do you mean with hard lockups?

It's perfectly valid if the IOCTLs eat a lot of CPU cycles in corner cases, but it should just never segfault or overwrite the kernel stack etc...

Regards,
Christian.


> 
> Thanks,
> Janusz
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> For more comprehensive testing, also implement the _forward and _random
>>> scenarios from the original selftest, as well as simplified variants that
>>> don't enable signaling on each link of the dma-fence chain, and yet others
>>> that not only enable but also wait on every link of the chain.
>>>
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>> ---
>>>  tests/syncobj_timeline.c | 289 +++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 289 insertions(+)
>>>
>>> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
>>> index a77896ec1d..80c5970687 100644
>>> --- a/tests/syncobj_timeline.c
>>> +++ b/tests/syncobj_timeline.c
>>> @@ -427,6 +427,61 @@
>>>   *
>>>   * SUBTEST: wait-zero-handles
>>>   * Description: Verifies that waiting on an empty list of syncobj handles 
> is accepted
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-forward
>>> + * Description: Signals each fence of a large timeline while another 
> thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-backward
>>> + * Description: Signals each fence of a large timeline in reverse order 
> while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-random
>>> + * Description: Signals each fence of a large timeline in random order 
> while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-all-forward
>>> + * Description: Signals all fences of a large timeline while another 
> thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-all-backward
>>> + * Description: Signals all fences of a large reverse ordered timeline 
> while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-wait-last-signal-all-random
>>> + * Description: Signals all fences of a large randomly ordered timeline 
> while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-forward
>>> + * Description: Signals each fence of a large timeline with signaling 
> enabled on each point while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-backward
>>> + * Description: Signals each fence of a large timeline in reversed order 
> with signaling enabled on each point while another thread is waiting on that 
> timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-random
>>> + * Description: Signals each fence of a large timeline in random order 
> with signaling enabled on each point while another thread is waiting on that 
> timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-all-forward
>>> + * Description: Signals all fences of a large timeline with signaling 
> enabled on each point while another thread is waiting on that timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-all-backward
>>> + * Description: Signals all fences of a large reversed ordered timeline 
> with signaling enabled on each point while another thread is waiting on that 
> timeline
>>> + *
>>> + * SUBTEST: stress-enable-all-signal-all-random
>>> + * Description: Signals all fences of a large randomly ordered timeline 
> with signaling enabled on each point while another thread is waiting on that 
> timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-forward
>>> + * Description: Signals each fence of a large timeline while another 
> thread is waiting on each point of that timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-backward
>>> + * Description: Signals each fence of a large timeline in reversed order 
> while another thread is waiting on each point of that timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-random
>>> + * Description: Signals each fence of a large timeline in random order 
> while another thread is waiting on each point of that timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-all-forward
>>> + * Description: Signals all fences of a large timeline while another 
> thread is waiting on each point of that timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-all-backward
>>> + * Description: Signals all fences of a large reversed ordered timeline 
> while another thread is waiting on each point of that timeline
>>> + *
>>> + * SUBTEST: stress-wait-all-signal-all-random
>>> + * Description: Signals all fences of a large randomly ordered timeline 
> while another thread is waiting on each point of that timeline
>>> + *
>>>   */
>>>  
>>>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
>>> @@ -1675,6 +1730,217 @@ test_32bits_limit(int fd)
>>>  	close(timeline);
>>>  }
>>>  
>>> +#define STRESS_FLAGS_WAIT_ALL		
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL
>>> +#define STRESS_FLAGS_ENABLE_ALL		(STRESS_FLAGS_WAIT_ALL << 
> 1)
>>> +#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL << 
> 1)
>>> +#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL << 
> 1)
>>> +#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
>>> +
>>> +const char *stress_descriptions[] = {
>>> +	/* stress-wait-last-signal-forward */
>>> +	[0] =
>>> +		"Signals each fence of a large timeline while another 
> thread is waiting on that timeline",
>>> +	/* stress-wait-last-signal-backward */
>>> +	[STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals each fence of a large timeline in reverse order 
> while another thread is waiting on that timeline",
>>> +	/* stress-wait-last-signal-random */
>>> +	[STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals each fence of a large timeline in random order 
> while another thread is waiting on that timeline",
>>> +	/* stress-wait-last-signal-all-forward */
>>> +	[STRESS_FLAGS_SIGNAL_ALL] =
>>> +		"Signals all fences of a large timeline while another 
> thread is waiting on that timeline",
>>> +	/* stress-wait-last-signal-all-backward */
>>> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals all fences of a large reverse ordered timeline 
> while another thread is waiting on that timeline",
>>> +	/* stress-wait-last-signal-all-random */
>>> +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals all fences of a large randomly ordered timeline 
> while another thread is waiting on that timeline",
>>> +	/* stress-enable-all-signal-forward */
>>> +	[STRESS_FLAGS_ENABLE_ALL] =
>>> +		"Signals each fence of a large timeline with signaling 
> enabled on each point while another thread is waiting on that timeline",
>>> +	/* stress-enable-all-signal-backward */
>>> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals each fence of a large timeline in reversed order 
> with signaling enabled on each point while another thread is waiting on that 
> timeline",
>>> +	/* stress-enable-all-signal-random */
>>> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals each fence of a large timeline in random order 
> with signaling enabled on each point while another thread is waiting on that 
> timeline",
>>> +	/* stress-enable-all-signal-all-forward */
>>> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =
>>> +		"Signals all fences of a large timeline with signaling 
> enabled on each point while another thread is waiting on that timeline",
>>> +	/* stress-enable-all-signal-all-backward */
>>> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | 
> STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals all fences of a large reversed ordered timeline 
> with signaling enabled on each point while another thread is waiting on that 
> timeline",
>>> +	/* stress-enable-all-signal-all-random */
>>> +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL | 
> STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals all fences of a large randomly ordered timeline 
> with signaling enabled on each point while another thread is waiting on that 
> timeline",
>>> +	/* stress-wait-all-signal-forward */
>>> +	[STRESS_FLAGS_WAIT_ALL] =
>>> +		"Signals each fence of a large timeline while another 
> thread is waiting on each point of that timeline",
>>> +	/* stress-wait-all-signal-backward */
>>> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals each fence of a large timeline in reversed order 
> while another thread is waiting on each point of that timeline",
>>> +	/* stress-wait-all-signal-random */
>>> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals each fence of a large timeline in random order 
> while another thread is waiting on each point of that timeline",
>>> +	/* stress-wait-all-signal-all-forward */
>>> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL] =
>>> +		"Signals all fences of a large timeline while another 
> thread is waiting on each point of that timeline",
>>> +	/* stress-wait-all-signal-all-backward */
>>> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | 
> STRESS_FLAGS_SIGNAL_BACKWARD] =
>>> +		"Signals all fences of a large reversed ordered timeline 
> while another thread is waiting on each point of that timeline",
>>> +	/* stress-wait-all-signal-all-random */
>>> +	[STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL | 
> STRESS_FLAGS_SIGNAL_RANDOM] =
>>> +		"Signals all fences of a large randomly ordered timeline 
> while another thread is waiting on each point of that timeline",
>>> +};
>>> +
>>> +#define TL_LENGTH 4096
>>> +
>>> +struct stress_timeline {
>>> +	int fd;
>>> +	int swsync;
>>> +	uint32_t syncobj;
>>> +	int tmp_fence;
>>> +	uint32_t *syncobjs;
>>> +	uint64_t *points;
>>> +	unsigned int length;
>>> +	unsigned int flags;
>>> +	pthread_t thread;
>>> +	int retval;
>>> +};
>>> +
>>> +static void stress_init(int fd, struct stress_timeline **timeline, 
> unsigned int flags)
>>> +{
>>> +	struct stress_timeline *tl;
>>> +	uint64_t point;
>>> +	int i;
>>> +
>>> +	tl = calloc(TL_LENGTH, sizeof(*tl));
>>> +	igt_assert(tl);
>>> +	*timeline = tl;
>>> +
>>> +	tl->fd = fd;
>>> +	tl->tmp_fence = -1;
>>> +	tl->length = TL_LENGTH;
>>> +	tl->flags = flags;
>>> +
>>> +	tl->swsync = sw_sync_timeline_create();
>>> +	tl->syncobj = syncobj_create(fd, 0);
>>> +
>>> +	tl->syncobjs = calloc(tl->length, sizeof(*tl->syncobjs));
>>> +	igt_assert(tl->syncobjs);
>>> +
>>> +	tl->points = calloc(tl->length, sizeof(*tl->points));
>>> +	igt_assert(tl->points);
>>> +
>>> +	for (i = 0; i < tl->length; i++)
>>> +		tl->points[i] = (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? 
> tl->length - 1 : i + 1;
>>> +	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
>>> +		igt_permute_array(tl->points, tl->length, 
> igt_exchange_int64);
>>> +
>>> +	for (i = 0; i < tl->length; i++) {
>>> +		tl->tmp_fence = sw_sync_timeline_create_fence(tl->swsync, 
> tl->points[i]);
>>> +		tl->syncobjs[i] = syncobj_create(fd, 0);
>>> +
>>> +		syncobj_import_sync_file(fd, tl->syncobjs[i], tl-
>> tmp_fence);
>>> +		close(tl->tmp_fence);
>>> +		tl->tmp_fence = -1;
>>> +
>>> +		syncobj_binary_to_timeline(fd, tl->syncobj, i + 1, tl-
>> syncobjs[i]);
>>> +		syncobj_destroy(fd, tl->syncobjs[i]);
>>> +
>>> +		tl->syncobjs[i] = tl->syncobj;
>>> +		tl->points[i] = i + 1;
>>> +	}
>>> +
>>> +	if (flags & STRESS_FLAGS_ENABLE_ALL)
>>> +		igt_assert_eq(syncobj_timeline_wait_err(tl->fd, tl-
>> syncobjs,
>>> +							tl-
>> points, tl->length, 0,
>>> +							
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL), -ETIME);
>>> +
>>> +	syncobj_timeline_query(fd, &tl->syncobj, &point, 1);
>>> +	igt_assert_eq(point, 0);
>>> +}
>>> +
>>> +static void *stress_wait_syncobj_thread_func(void *data)
>>> +{
>>> +	struct stress_timeline *tl = data;
>>> +	unsigned int count = (tl->flags & STRESS_FLAGS_WAIT_ALL) ? tl-
>> length : 1;
>>> +	uint64_t *points = &tl->points[tl->length - count];
>>> +
>>> +	tl->retval = -EINPROGRESS;
>>> +
>>> +	/* Wait for the timeline signaled */
>>> +	tl->retval = syncobj_timeline_wait_err(tl->fd, tl->syncobjs, points, 
> count,
>>> +					       gettime_ns() + 600 * 
> NSECS_PER_SEC,
>>> +					       tl->flags & 
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL);
>>> +
>>> +	return &tl->retval;
>>> +}
>>> +
>>> +static void test_stress_enable_wait_signal(int fd, struct stress_timeline 
> **timeline,
>>> +					   unsigned int flags)
>>> +{
>>> +	struct stress_timeline *tl;
>>> +	int64_t dt;
>>> +	int i;
>>> +
>>> +	stress_init(fd, timeline, flags);
>>> +	tl = *timeline;
>>> +
>>> +	tl->retval = 0;
>>> +	igt_assert_eq(pthread_create(&tl->thread, NULL,
>>> +				     stress_wait_syncobj_thread_func, 
> tl), 0);
>>> +	igt_assert_eq(sched_yield(), 0);
>>> +	while (READ_ONCE(tl->retval) != -EINPROGRESS)
>>> +		;
>>> +	igt_assert_eq(sched_yield(), 0);
>>> +
>>> +	dt = -gettime_ns();
>>> +	if (flags & STRESS_FLAGS_SIGNAL_ALL)
>>> +		sw_sync_timeline_inc(tl->swsync, tl->length);
>>> +	else
>>> +		for (i = 0; i < tl->length; i++)
>>> +			sw_sync_timeline_inc(tl->swsync, 1);
>>> +	dt += gettime_ns();
>>> +	igt_info("%s: %d signals in %ld ns\n", __func__, tl->length, dt);
>>> +
>>> +	igt_assert_eq(pthread_join(tl->thread, NULL), 0);
>>> +	tl->thread = 0;
>>> +	igt_assert_eq(tl->retval, 0);
>>> +}
>>> +
>>> +static void stress_cleanup(struct stress_timeline *timeline)
>>> +{
>>> +	if (!timeline)
>>> +		return;
>>> +
>>> +	if (timeline->thread)
>>> +		igt_warn_on(pthread_join(timeline->thread, NULL));
>>> +
>>> +	if (timeline->points)
>>> +		free(timeline->points);
>>> +
>>> +	if (timeline->syncobjs) {
>>> +		int i;
>>> +
>>> +		for (i = 0; i < timeline->length; i++)
>>> +			if (timeline->syncobjs && timeline->syncobjs[i] 
> != timeline->syncobj)
>>> +				syncobj_destroy(timeline->fd, 
> timeline->syncobjs[i]);
>>> +		free(timeline->syncobjs);
>>> +	}
>>> +
>>> +	if (timeline->tmp_fence >= 0)
>>> +		igt_warn_on(close(timeline->tmp_fence));
>>> +
>>> +	if (timeline->syncobj)
>>> +		syncobj_destroy(timeline->fd, timeline->syncobj);
>>> +
>>> +	if (timeline->swsync >= 0)
>>> +		igt_warn_on(close(timeline->swsync));
>>> +
>>> +	free(timeline);
>>> +}
>>> +
>>>  static bool
>>>  has_syncobj_timeline_wait(int fd)
>>>  {
>>> @@ -1934,6 +2200,29 @@ igt_main
>>>  	igt_subtest("32bits-limit")
>>>  		test_32bits_limit(fd);
>>>  
>>> +	for (unsigned int flags = 0;
>>> +	     flags < (STRESS_FLAGS_WAIT_ALL | STRESS_FLAGS_SIGNAL_ALL |
>>> +		      STRESS_FLAGS_ENABLE_ALL | 
> STRESS_FLAGS_SIGNAL_RANDOM);
>>> +	     flags++) {
>>> +		struct stress_timeline *timeline = NULL;
>>> +
>>> +		if (flags & STRESS_FLAGS_ENABLE_ALL && flags & 
> STRESS_FLAGS_WAIT_ALL)
>>> +			continue;
>>> +
>>> +		igt_describe(stress_descriptions[flags]);
>>> +		igt_subtest_f("stress-%s-%s-signal%s-%s",
>>> +			      (flags & STRESS_FLAGS_ENABLE_ALL) ? 
> "enable" : "wait",
>>> +			      (flags & (STRESS_FLAGS_WAIT_ALL | 
> STRESS_FLAGS_ENABLE_ALL)) ? "all" :
>>> +								
> 			    "last",
>>> +			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all" 
> : "",
>>> +			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ? 
> "random" :
>>> +			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ? 
> "backward" : "forward")
>>> +			test_stress_enable_wait_signal(fd, &timeline, 
> flags);
>>> +
>>> +		igt_fixture
>>> +			stress_cleanup(READ_ONCE(timeline));
>>> +	}
>>> +
>>>  	igt_fixture {
>>>  		drm_close_driver(fd);
>>>  	}
>>
>>
> 
> 
> 
> 

