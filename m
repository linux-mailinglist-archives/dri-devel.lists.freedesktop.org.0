Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD8A16A00
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 10:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED810E384;
	Mon, 20 Jan 2025 09:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2Ciwl1qB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC3410E384
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 09:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNAjIN8P/at/uQ3XSAdWX5mkUmEOL+8CbFgLFwl+aR75HbMuAOg2p1hks0gjuTICBcnxXMAp0Zl0qFMatcqkHHnCrKbL/ZnjO3ofqsqcFBzPwnoIUdPmHE4EOXfTWs1SZvnb9gKXjFKZxZgMFyeWw+CEio44QbBXyt47Duzx4RiYANlDDeKDq1/PGQd6z0FCq+bQ/TboZreWldcMcLdrTdtsOlUido8zKZ5ZXO5qYuVMkgfijpVAYSIe99YgTBVBbFKb2EhntcmtB8W0ov55IXdHPZfqibuvfZXpbo89Sc4hmHLKDgco4T13cGB3AUe8Ju3QNlTrOUBIc0/Mkw2uOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLcIXoZ1ALw+UBSrTCxj3CBCe0EDx3cq3w25yzaaAuY=;
 b=yqr0YDrfG6AbOYkPsI+JTbvxeRPDNx8nRtAEODHwqAj+LFP2hztuDI3Jr9zVMAzCcpvWJrEpozlRJUUR+rulObZztCUMD9Pgfphhj4VxjrpC1CgpgI0Xlw4eTEPJKo0qTpLpprWAmj+3HjDSemYz3JbzC14aSSE7XWfbKYWDeoCXb8DD4wQ7gpSIJ4LMnTDQlO/bNTK1jyDyNhe9bUEoN9t9zxaFo1hIBbdPpkQ/Z8uDsCmmO2jO0X5Pudi4r/NCTFkwCfPvMmjmnHCYekRqRJBz1Bwk5CW3E//vhmfs4QQ5qerWXWe2j+KjX6vFjVLOldoAae21oiAD0/1Y3Bo9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLcIXoZ1ALw+UBSrTCxj3CBCe0EDx3cq3w25yzaaAuY=;
 b=2Ciwl1qBV2+ubYW3D4WsCSoB7M+L41kVTQPc9DyO8X7SG9Q77TI6pFXqxANiNFMNLMBZACGXIVdENk4Ys7nZ3Yj82RZSFG/DBR/WjIBQBasGmTRWYbhLEX0N7TSM1OvfxfjcI8ybZjSW83YDrX430OF2Od61ywYX3kChojFRhF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Mon, 20 Jan
 2025 09:54:18 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:54:18 +0000
Message-ID: <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
Date: Mon, 20 Jan 2025 17:54:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
Content-Language: en-US
In-Reply-To: <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2f8d56-a824-41b3-1446-08dd393867bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCtBdGkvbmtPZi9XTVRTN1FpcjFpak40Q0pkRlpNVUxoNjFLdkxWc2V2NTVa?=
 =?utf-8?B?N28rR2lSbUZRTU9SdGJGejlpcytCb25JbG10VXEwdVFmZ3ZUWkVEdmcxZ29i?=
 =?utf-8?B?SnZhWVBqNCsxYmZ4YU1qYWxjcVdmc1pRTHRnMkg0UW0vL3VyS1UyZjhyOXA0?=
 =?utf-8?B?UUkrdFpVd00vcEIvQVpOSS9haTUreXRjekNRYStYQUgveUkyRitCM3o4YVJW?=
 =?utf-8?B?Q3JjUXI3UFZQcDdJdGJab1ROSWhSQ25LZ2M0L3A3WTcvc3FKUTA0U3BDblp4?=
 =?utf-8?B?WTAvYjA5NU13a1BpbFNZdXhBNXVwOEQ0MkJzYmFVamR2OUtYY3kxSW5ac3E1?=
 =?utf-8?B?RE1KVENJNmRIWGllaENVd2M5L0ZEeGtCOHF6dlp0MVVRZVhudUpqUDJsYUNB?=
 =?utf-8?B?NGY1QXFEaVlIeWduQ0o1WUxydFFISlJtSHFJM3FhVnJ3eUVPeDlqQXFZb0ZU?=
 =?utf-8?B?WkRUbzlpamdseEEydU1vWHlRQjNZbWZzL1BES1hLdmxFTmVUdGZCbS9RblZF?=
 =?utf-8?B?N0FCaXkwczBrcGNhTnVxbjZ5MjNLcWpXUDB5SldzUlFqTDhDQ25nTitNUmNx?=
 =?utf-8?B?cUo3bHhnbVN2RXhJR3RmZFlQZWt1bDhRUHI0OTI0K0FtdzRDMG1iK0VVSDFa?=
 =?utf-8?B?RkVJK0dvM2krdllCUFpTMnNBV1M2N1VLVnNCYklONUdyQXpLamY5Z2VpZTI4?=
 =?utf-8?B?VTZIU0ZVRG5DTklPQWF4aStLejhMRlg4L2RiRHBYNVMrckplbndBV1hZUEpK?=
 =?utf-8?B?czN3dnUrUjV3a0gvWGFQMUlMdGVGWXZOZGtHVG9lcmovQ1oyS3VEYkhvTnp6?=
 =?utf-8?B?dHNNVDlCNjFzd0NpdnQ4eGZCRGZnNXpKY0UrWGFFK3lWaUxmTWlOS1lualNm?=
 =?utf-8?B?WHduQ0ZYTkhyRXQ3UERXUk5vWEtIR0xQWi8zMmlVanlYOWZiT1h1S3ovZ3M1?=
 =?utf-8?B?TlNzMjJPWXBUY0hsUUFNT051MmMzaEVmWDRqSTF1bzFyVkFVbXNwT0tBWFpj?=
 =?utf-8?B?dHlYdkluV3cvM1VzUmJZam84RlhQa050YW1BTUpZVXp0ZGM5cEtHcXlaN3d2?=
 =?utf-8?B?WmNUM0RSUHNIL0Y1RUVQelZPc24zb251eGNrUGNYcVh0Mlk1ZW4rZGhqOEdY?=
 =?utf-8?B?dzVIN3ZsdXlabGZlbkZSRjlpM3lvUjFWYmExUUxpcU9YSTE0RzVMV0UzbGhJ?=
 =?utf-8?B?bDRYL1BTUVNkOEI1YVpFYW1MRFY0RXM3bWlpN1pxL1dWUS9jYXlQNWV5MHFj?=
 =?utf-8?B?STB0UDNCUWxRZU9GbTU0WmJHeVNtb2h4Vk9rWG0wY1lBQjl5U2JMaEtNamxj?=
 =?utf-8?B?Wm1ENnBwSlB0TnYwUzU0MFZOTW81SmxoRHRHRUppaWF2clFVYkVqNzVqb0FI?=
 =?utf-8?B?bUdXWjkxdGttMStNaTZ6aWp3eFA0aktWMjVQYVZNUzFkMm9RQ2JxbThXbFgx?=
 =?utf-8?B?MFNkbUs3Z2ZKRVJUUkV0b2RxUCtxZ1VIT1J5M1VyS1hPelExMHo3L2owdjJK?=
 =?utf-8?B?TUtYQjd5eUZEcUFyeG1rUGkzWmlsOGdpNVFkbHFya1FkRCtOdkNDdElMNk1V?=
 =?utf-8?B?ZTlqY21RTjNpWGIrZTFQNG8zR1pLQW9GeHBWTWpIczlxdWtIQlkwM0pBUGZx?=
 =?utf-8?B?SHFDb1F1ay9jTFRMaUZ5WTludkJjQ05xNWp6Yjk3STV2cWdSemdGWlpBMjdq?=
 =?utf-8?B?MTVnVWRSYWY1MU9SZFRjbllGYnVDelNETkd4N3VNMDBwUS9ZWHZ2UXFyZHFI?=
 =?utf-8?B?YnZ6djdWNGIyMXQ5Nkh6WEFnRXZOMUZxcVFQZzl4RkNEL1A5bjBzRzZJNXlp?=
 =?utf-8?B?OXZEMHBsSUI3RkZacWFOS3NEMWpQWTBrVDQrckZCTGNZVTZBOHFGQjI0Uzlq?=
 =?utf-8?Q?q9C/31wySwUiZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVtdDBBRkNyS25UbSsvTlR2cWhnZGtEV21MQjlJYkpPdE0rSGpMOTdSU3hX?=
 =?utf-8?B?SmlUTElqbXZabURvMlhjT2thbHlxdnljdkg2aTE4Nnh5RDNISUxkNXpYNkFD?=
 =?utf-8?B?LytZMGR0eG90M3ZjZWJpbncrNng1R2MxN213ekVLeURhMUFPR2RRV0dnNnAw?=
 =?utf-8?B?bmNkS0FsUG9PaFZuVWdTT0tqYmd3dk1ObTd2MzhMRE5TNWZnRk9oYW9XZ0xL?=
 =?utf-8?B?WTRFSWppcXRHVVRiQjd2ZlUwMGJKcDZ3enVVMEpsR2s2U2h6UEZCYitBV0hU?=
 =?utf-8?B?OWRZMFdmOTd5N1hjbW1pOThxSVVGUTRLY05XVVdncDI0d3JLVkdCNDBEWGl5?=
 =?utf-8?B?ZVM3Z3BxUGM1aDNTTkNwaFo4MW44ajkxamFUM0YzbHU5NWpEUDVBbHJnalNQ?=
 =?utf-8?B?TXVUZWZOU0F2WjhoZ1YzblFQVSs0QmdQYWlXclJVSGlEbTE5ZFlVYmw0YThx?=
 =?utf-8?B?L3NDVWN5RmcwaUVZSDFScFhreTJZeHFYc2F4SmhaalFoRitRU01jOS9xR085?=
 =?utf-8?B?ZTVGUkJlVWovMG9ubHMwVWxWUWsybWUxenptVkRyOG5hRnBMaHdsSTNmMEs0?=
 =?utf-8?B?bDltZG9saGdVRk9iQTBNM2E1SkluSW5oNE9CenFTb3JjMlpYaE1ybWtGeDlu?=
 =?utf-8?B?THY2NzNXa3FlSExReGNXdmVHc2VJWVVFRkdSaEdtSTNibG5YS2Q0TVc2THBr?=
 =?utf-8?B?SkZ0SU5YaHNYVkZpenovQ2NaaW1MRjVaR2pIOUpPbjJlVjhqOUZ0S0I2UDJU?=
 =?utf-8?B?cFFDYXlwK2x3dk9RdWs2RVdnR3kzZmFoS0FScDE0bm5JK2NUZXp0aUZiTEd6?=
 =?utf-8?B?ZEFYZ1BjNWc1Y0ViRDNRa2p1SEN1Y0gzKzNWVW5iVHJtYnBETm5ocHZOM1RB?=
 =?utf-8?B?YkZDL3VKbkE4ZXBLYU5tN0NzTk5QejltTk1uWjBqSzhiME13ektKZlh2c0Zq?=
 =?utf-8?B?QzUvUTlVVEU4dUdPWk5LSEVkSlNsWk4zNk9wc2sxQ0FaaUtzc2ZLVk1Pa29M?=
 =?utf-8?B?dmQ4TFpRaTBza2poYkFQMG1UOG93amhMMUs5QzJvVS91VUkxL3UxRStxT0Vw?=
 =?utf-8?B?QjU3OUlEVXNrZ3NlVmdZWmxncDU0S2ZRS21GbnVQN3kxSzRMYng2RW9iNDFp?=
 =?utf-8?B?dDlKOVVjQWQ2UHJ5MmhKdzZIcGoyWWxWeUM4d1NzMDRLS2NZbEY3RUoyNkts?=
 =?utf-8?B?U3RPV2NjMmVpMVBaUVFNdG5NRzk4VGJhRStUd3dXVTRYL1dNQVlFa21LWDdk?=
 =?utf-8?B?YnJ2WFZJZ2xJSHh2RFRRVENqM1dkK3VyNXZoR1BxOHdSY3VOcFozK3N5eU1i?=
 =?utf-8?B?a3F0VHJqQmpDN1M3T3UrbnJ6U1NkbUlpZk5BY011eXVsVlA4K1BVb2xDdjRR?=
 =?utf-8?B?US92NCtad0lJU2Ziemg1OXI5cE9CU0pLK0lLL3JPVDRFYlhjelE1N2RvcXNV?=
 =?utf-8?B?MXlFQjFWWDBEcDVSQXhwMElodEg5Z0RFbTJidXhmMGhVemRsekFFYjVqdEF3?=
 =?utf-8?B?MGNwdHZUeWlXR0pCZ0hOaFRvYmpNVHF0MFdnRTVBY2EveGZoQ3Brd1ZjVktC?=
 =?utf-8?B?M245dEQwdU56RHg3emFkVkdEU1lSWjE2cHk4Yjl5Rk4yUlBvMDFZNFNYaTN6?=
 =?utf-8?B?Mko0SldPVTIwcWo1WXF2YmZlMlFDdmpwUTZiVm95aTNKc3NWakdzUkVkRjN2?=
 =?utf-8?B?cmgwSEVyUXFJOHNJVHJMUnV1WC9uZlFGaTBkWm9taG9DdHZ5QVowaUNQZjBV?=
 =?utf-8?B?VXJSNlpTQmx4dXN4aEFpaHhzSERVOUVzdDlOMmN6UGlpOXZrQjlnWUVpR0Rl?=
 =?utf-8?B?L3FaelRRQ1VvSzIxWmhnVnhNRlJaWmdPeXFKQ2pOTlYwNjd4SHBBWHRrOS81?=
 =?utf-8?B?bTB6dE1BczNxR1NFYjhWb09hVVNnT3FjTDdMOFVGekFXNHlySm9nYnVQeUc3?=
 =?utf-8?B?SFFsNmNIekxRT3phWGg1M0VHR042aG9QQjdMc1hlaXA4UmltUHNkbCtkeDdC?=
 =?utf-8?B?U05MMWppU2pJVy9VY2lRVXppcTFsNythbXFDNHpldFZkUkxUTCtoZ0V5N1h1?=
 =?utf-8?B?emRac2ZwaWlsKzMwOE5SRzhNRlc3WkRwcnFVNGhrcXh3Ri9vUlFJZWJrR1B0?=
 =?utf-8?Q?N8SiDpm5RO3+JNBamt0zIWUZJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2f8d56-a824-41b3-1446-08dd393867bc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:54:18.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnRUVZF57RKKoLs+vRInU/wfkhfYuIFslLtBdbiytqYG5yFYNW/lXY3JAUQCVBLoG90B8n8W8k2Uslf5ALt/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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

On 2024/12/27 10:02, Huang, Honglei1 wrote:
> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>> From: Honglei Huang<Honglei1.Huang@amd.com>
>>>>
>>>> A virtio-gpu userptr is based on HMM notifier.
>>>> Used for let host access guest userspace memory and
>>>> notice the change of userspace memory.
>>>> This series patches are in very beginning state,
>>>> User space are pinned currently to ensure the host
>>>> device memory operations are correct.
>>>> The free and unmap operations for userspace can be
>>>> handled by MMU notifier this is a simple and basice
>>>> SVM feature for this series patches.
>>>> The physical PFNS update operations is splited into
>>>> two OPs in here. The evicted memories won't be used
>>>> anymore but remap into host again to achieve same
>>>> effect with hmm_rang_fault.
>>> So in my opinion there are two ways to implement userptr that make sense:
>>>
>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>    notifier
>>>
>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>    page references or page pins at all, for full SVM integration. This
>>>    should use hmm_range_fault ideally, since that's the version that
>>>    doesn't ever grab any page reference pins.
>>>
>>> All the in-between variants are imo really bad hacks, whether they hold a
>>> page reference or a temporary page pin (which seems to be what you're
>>> doing here). In much older kernels there was some justification for them,
>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>> now all sorted out. So there's really only fully pinned, or true svm left
>>> as clean design choices imo.
>>>
>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>> you?
>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>> host having to take action in response to guest memory reclaim requests.
>> This avoids additional complexity (and thus attack surface) on the host side.
>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>> about supporting systems that require swappable GPU VRAM.
> Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I 
> will add it in next version. And for the first pin variants 
> implementation, the MMU notifier is also needed I think.
> Cause the userptr feature in UMD generally used like this: the 
> registering of userptr
> always is explicitly invoked by user code like 
> "registerMemoryToGPU(userptrAddr, ...)",
> but for the userptr release/free, there is no explicit API for it, at 
> least in hsakmt/KFD stack.
> User just need call system call "free(userptrAddr)", thenkernel driver 
> will release the userptr
> by MMU notifier callback.Virtio-GPU has no other way to know if user has 
> been free the userptr
> except for MMU notifior.And in UMD theres is no way to get the free() 
> operation is invoked by user.
> the only way is use MMU notifierin virtio-GPU driver and free the 
> corresponding data in host
> by some virtio CMDs as far as I can see.
> And for the second way that is use hmm_range_fault, there is a 
> predictable issues as far as I can see, at least in hsakmt/KFD stack. 
> That is the memory may migrate when GPU/device is working. In bare 
> metal, when memory is migrating KFD driver will pause the compute work 
> of the device in mmap_wirte_lock then use hmm_range_fault to remap the 
> migrated/evicted memories to GPU then restore the compute work of device 
> to ensure the correction of the data. But in virtio-GPU driver the 
> migration happen in guest kernel, the evict mmu notifier callback 
> happens in guest, a virtio CMD can be used for notify host but as lack 
> of mmap_write_lock protection in host kernel, host will hold invalid 
> data for a short period of time, this may lead to some issues. And it is 
> hard to fix as far as I can see.
> Finally I will extract some APIs into helper according to your request, 
> and I will refactor the whole userptr
> implementation, use some callbacks in page getting path, let the pin 
> method and hmm_range_fault can be choiced
> in this series patches.
> 
> Regards,
> Honglei

Hi Sima,

I modified the code, remove all the MMU nitifior and use 
pin_user_pages_fast only. Under this implementation userptr fully
managed by UMD. We did a performance test, it decreased by 30% in
OpenCL stack in Geekbench6 benmark.
We use AMD V2000 for test:
use MMU notifior + pin_user_pages:
near 13000 score: https://browser.geekbench.com/v6/compute/3257793

use pin_user_pages only:
near 10000 socre: https://browser.geekbench.com/v6/compute/3496228

The code is under clean up, I will send out later.

And I found a another thing, it seems like in intel i915 userptr
implementation, the pin_user_pages is also used in MMU notifior.
Code path is: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gem/i915_gem_userptr.c?h=v6.13#:~:text=ret%20%3D%20pin_user_pages_fast(obj%2D%3Euserptr.ptr%20%2B%20pinned%20*%20PAGE_SIZE%2C

Patch set: 
https://lore.kernel.org/all/159353552439.22701.14005121342739071590@emeril.freedesktop.org/T/
https://patchwork.kernel.org/project/intel-gfx/patch/20210323155059.628690-17-maarten.lankhorst@linux.intel.com/#24064663

And I didn't find the hmm_range_fault code path, maybe I missed it?

Regards,
Honglei

