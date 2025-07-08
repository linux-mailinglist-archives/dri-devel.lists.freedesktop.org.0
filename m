Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BFAFCD9E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9B610E664;
	Tue,  8 Jul 2025 14:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KoQMuPz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D873710E663;
 Tue,  8 Jul 2025 14:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkTtCjvMhCJ8LLEVVz4dOluKuhDgd1a6N2E8UuJNuEgBdVKFJqKiPsIM5bKcsVYNh0jGWcm5dyHV/s47SqZW711kIIWMDzgNRKJ6g2aJXn6+LcE3Ukh59RrJ1oqv5PrSPX5/vWrzcyzKlAvdZCpb07LnzRD6nYK4paj88D5fJV5k+L2VoGpcPc0c6mDeWNNBeZ6MeP+MAawHMYAH2+UgqtxWZq4wWBtjjF25q3uRO3/Jk9zWalXSuQU/ZjbD1VIcpLDpBdPw9sJt6j1Dla2dAslVUlJ1OM65J3ttDVFddjfAPQF+nDj7xvUhyI43BrYyrfKl6YifyppbQbFxbXBWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ao7EqSujX1oXnKB8CL8ma1yl8coxNIywgCv8+xmxQ4=;
 b=pIDPGc1FUByp4okjT+KLR2uHuTgjbV1zs9MpaaYQiie/x3epfy/C9/t/V+FernUOlkRWbWTGQmhNKW/yjS29bMqmGNEas0fyrNVPsooYO7X24Jl0aatHBBT6o0Hb71Ad+S480P3LH+Io5dRllFhLxanZNWe4nTTTrkJpCqEExNjqirpbR7y8V5TNefavNMETX5P0c6wuE9RGEF6GaJVwQWz1zBmqtYf0LBhjm4UFD6hu0t0CgAcjSK3SXU4wseH5tkHX6E4a9RRX4K5SRVmLwILzncRtZ9kCS/inrvoz4qAOtwm1A4NKrDpALO8OKmHgATC3AN3xcsCUNn47Lpldyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ao7EqSujX1oXnKB8CL8ma1yl8coxNIywgCv8+xmxQ4=;
 b=KoQMuPz3CumZUL8Fl+inwvDGgCYcZooVswQYdQeZ+o7iRESMsntAdLwosh36dMzP8HSKEALCSaW0BZoxtOB02RVIJGBfksjV8BFQ0hMullPsZiHBjNbP5aVUUVmj9HzubP3rqWA2IwJ0nmZRkl7ipfLu39u6F7vHnBRaoc7OWoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 14:31:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:31:03 +0000
Message-ID: <6758cecc-d324-4ed5-b38e-2a4384a34d60@amd.com>
Date: Tue, 8 Jul 2025 10:31:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] reduce system memory requirement for hibernation
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Samuel Zhang <guoqing.zhang@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250708074248.1674924-1-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f03d260-aef6-448a-2976-08ddbe2c1119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ditQanNBMS8wbDdwNUlHbmNuaWhEZ3RkeUk4UHlsOXUzNWN5bmFTUlIzakJD?=
 =?utf-8?B?RXF3UTEvQmFNNFNiT0wvWjJGaUN6eG1FMG1KYWc3YWdIcTl1V0gwUTdiTnVO?=
 =?utf-8?B?T09Ddk5iMk1hMHZpRkJFOWVwTm9xNXBhUmxuOUtjSEdvZ0dDRFNhd205QTR2?=
 =?utf-8?B?TitiYnNlWEUxVlBBK0VUZHJaK09wejJSMVFiMVR5NnpjS2t0dWRlK1U1dDh0?=
 =?utf-8?B?QnFxcmtVOVdpL3JXUFRGMmlRWDFFSEpnYndWVXZ4UVhvSEU4UFZ6Q2krZ3lG?=
 =?utf-8?B?cTZrZllCelJIUis2VzVzT0JNaG9EenRXU2NlM2ZSSE9Pd3lkWC91Rjh4WlZR?=
 =?utf-8?B?UjNxWEcwWGYzL1psNStFVWRwQ1FGY0tydjg5MzdTLzk4TTlHUjV1a3U0aURv?=
 =?utf-8?B?S3FSRDdKUTBWNW5KVHVRYkdkaW4weStTMFFGUzY0ZmxQQ0l4cHE5WVdHb2JN?=
 =?utf-8?B?MlZzMlUxS0wrWkg0SFJLTnhmYVpkRWR2RUZPcXNHT1I2NVJ5UGdQVWpzOXZZ?=
 =?utf-8?B?ZGRGNTB2dnhzVVBsYTNPazFUTE9GcldEZW82OCsyVW5GNG1xanhkWDdoTEF4?=
 =?utf-8?B?bGtCTWhzaFVONWFPUzFpam8vbDRqY2hlVGJLQXozaWVEdGx6eWVmVG9BeEk1?=
 =?utf-8?B?MWxNTkdDdFIzaldUa1pxc1RQSE1lZlErOHM4dWQxQ2s4WkxsUGlQM25HSHA5?=
 =?utf-8?B?TG5BMG5EUGtmTVQ3OHNydDdKdndGV0c4Sy92UnlSdS9qck9OWXB3ZVRjMnR6?=
 =?utf-8?B?cWIydEFKbXlrMWJiRHh1QXNVUTVUZVNzNTFtN3dnWi9kQzY1WnRrTDByWDQz?=
 =?utf-8?B?K3huQkFxL0hyeUlra0dnRkthM3RjaVpiSmJvelhBNDlsRHZiUUZrVDdWNnRh?=
 =?utf-8?B?ejdPb2lpVnhxNHBKYU1vR092bE91NTFWaDV0L2xoUkpsd05XWDFhdUFXN1Zy?=
 =?utf-8?B?RXJ1cnNqWTBid1d3NFU2bVJDem9OSEFsc1E0NnNzZU12L3VXWk9SWnJCUjhi?=
 =?utf-8?B?TDZCOFpaRVlodlJoUXA5bTJRdzBaN2ErSmRyYmRZNmZUZWFuMzZqUUpreERS?=
 =?utf-8?B?dmxXQ0g4VnRUTHZPZ284OFNyR3c2L2Jod2ZraEdmNzNCUzBZMFJsKzhuUGZY?=
 =?utf-8?B?YmlYSWIvbXI0TzlOR0hHRkJ2cmc5RTNMRldmaXpqeDdFNTE2Q01SRkhkbzFp?=
 =?utf-8?B?bmVTdk9hTzYrbi9EZWFzQk9OcW11UXUrelgvL2hvZk4zM1hHOVhXd2xiTGVB?=
 =?utf-8?B?UUdJTUVXZUlQS3F6ZmlPeTFtMENZUGlUVEhhUnU0RHRTNDJhaGphVTI2VE5y?=
 =?utf-8?B?YkFCVkk0TFM5SmxCTEpYenZidzRNWGhaUDEyOXlMQ3NHUWRhclVpOWwvRG4w?=
 =?utf-8?B?eklvSGtvdkJBMFoxRHJxWk1KYkFoUHFhSTVIeGFzZFVLR2ltbTZFaER5TlZ3?=
 =?utf-8?B?NkFNUU94M3UzYnlSSzJyRmZzSVQyUmppN3ozdWRDZUgrdXFKNGdqQ1N1VmJv?=
 =?utf-8?B?TFFtd1IwWks0Ny9UNFcvQ3FiRkZ2dS9BSUN3UVFCL3I2b1FiK3RFVXBkVFhw?=
 =?utf-8?B?N1FHeWpXVzB0cDN0VWlSa0tZQytVMEVqZU1HT2hPSHVSZGxtWjdPYklUUDky?=
 =?utf-8?B?N1lMbnRWTVRZb0pPQ0NwZlF1czRFWWM1MkdYQ3UvTjNZTSsxSHdua1ZBelVv?=
 =?utf-8?B?MW5kd1JSN0xMRXpNcDFJc0EwVWtmMFVQb29CWmlOVmFXUzEyZHdmSGYvUTlo?=
 =?utf-8?B?d2IvR1QzK2Vsc2pzS1ZlQ3pxVkVFVkUxTFdNaTlQTmxtK0FsSzl6Vk9yVzJI?=
 =?utf-8?B?Z0w3ZzM5emlrY3UxN3VnejZ6ZDlkVW9hcFJCaHB6RThrK3FxaTFVTnlBRGxq?=
 =?utf-8?B?ZjJuLzN0bGhXZkJlTVhWS292cnpyL2txTDZvOVhwNEVpaDYyVlVYcDQvQUNk?=
 =?utf-8?Q?3w8SAVVI85w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JjZ091T2hna0VzZExPSGxBYjBDb0FLUTZvM3hEMjE4STNsYmZJNG85ZEVP?=
 =?utf-8?B?VDh3ZldwUGZWWC9OaFEwdjF3ZFdZdmRXcldzRXlYYlRNM0VOSWQzNVIyS25q?=
 =?utf-8?B?djFWVTN3dXdFWnVnWkVMTEp3WUdXUitUVjBjWlA0WEhQWTByWVpzVWZmaHhs?=
 =?utf-8?B?bE40VEpxUUE1VXV0VVdxK3NlU1AzbzY3T1pBZHVTSXYzNmZHYjloeXVLVEF2?=
 =?utf-8?B?SVN3bGUrWEhMV0NmTHg2a0RIbVVwZG5KNlpNTWZ2a1g4Y3ArKy9KUjRQdVVR?=
 =?utf-8?B?ZzV5WS8zaEIxL3g2NEJnUG9wbTY4K214V2lrZUtRa3JDeUpyaFhKa0tnY1Zi?=
 =?utf-8?B?ejdNQjJZUlhHaGZrejVaUHdTQkdXcFVkelBYcHpxaG9ieXBhcGpLM05hbS9S?=
 =?utf-8?B?ZGt2bDVURlNUbUpNbzA3ekZxSE1jbEMrQWRRL0RDUUFEYllRN1FpWTdDSHpN?=
 =?utf-8?B?QkFBZ09OejV0cTQ3T0krVndmT1pkazkyd1ZSS0tvdXNSVE5hTWl3ek52cFJv?=
 =?utf-8?B?Q1ZDcnNPcDdUbUM0d2huMkNXSGtieEJaQ1J3TDIxajBFZE85TDFMZ21uQlZk?=
 =?utf-8?B?VDRzZ01tWVUyNFBtcHBoMWxISTJCWnR6MVF0VGdSQ1VCSjhablZvRmRXRXlh?=
 =?utf-8?B?dzk2YUtEa1Q1VHFvMUIxL0s0TlFhT2lsV21QeGlmcmhkSEEybW90WGJnM2Qy?=
 =?utf-8?B?R1Q4RW9zd2c4VU1MNWdaQS8yTW01TnJoNG40bVhCaFBNcEhBSFpnMU54WXNm?=
 =?utf-8?B?L3FXbFpTQVBSNFpCUTVWdFo4TzRsd3ZYUUM2RVhnMkVoS292d2RocDFaenZt?=
 =?utf-8?B?aHhtaUpBTmtTWkpIVVhRZlhLVVlLYzVsNzE2bVA4L3N4K1RzT2pxcVU4OHFQ?=
 =?utf-8?B?RnVlNkwvS3BWSFNLQU5lMnR3d2J4MFZYOG05ZXpEVzBPNVpwZlRUVm9RUXFv?=
 =?utf-8?B?aHloV1FidkhXQ1p0bGFCYVN3WStQVTZ0NGd1dUZqM09GMVRIbmdKRmNrcVVn?=
 =?utf-8?B?bUhSeHVhNklHbWFSWTcxdEJYRkRYMkYxZ2s2QzV6d1oyTzdPb25xVDVBQTlX?=
 =?utf-8?B?N2JmeVdDUHNnS25aTXB5di8vMkVyVE0yb1hTdWVsYTRSclVSZkJnZXlTeXJU?=
 =?utf-8?B?YXZNS01NUmxBa0VubENXVElKckhvcWFjNHNvYWJHUUc4cFNwaXNJdGNWczZL?=
 =?utf-8?B?SmpLTStFd20yR3MrRFFyUk5sNmFacVRkU0NkNWYzWHNiM3NSVEk1cXJGbi9i?=
 =?utf-8?B?bStGY3E3QlNtNVZkL0Q3bnJLcm4vN3VzdU1BNEJjV21qMENRZlg3aG5ibmJL?=
 =?utf-8?B?clp2SkVIclVmdWJINlZqZ3ZvR2JZU093WEtIbVlVcnVES0EyOTk1UWFHZUxR?=
 =?utf-8?B?Q0kyY0JIbFhSVVhrQUsvN2tsOHZiL1dMTUhHOUZhdm1TWWhhY2V5QlQzamlY?=
 =?utf-8?B?TXdrNFNQYXl6U1VLVWs0dVg1aDgzTHR0VXNRVGRMK3RGQTEyZmZRM1N5RVdC?=
 =?utf-8?B?cjJMMm1xT0UyeFd3c3JZdDJTQ3RJUzRqOFFmRFpsQmp5M1dTbVhseTVmdVRQ?=
 =?utf-8?B?UDZGcDJXd3k2RWNzZ3RyUDVMa1VncUxqNElvSEhaOU1sWEJzY2Z1eVBsTFp3?=
 =?utf-8?B?UHhYQ08ySEJUbEJydU9HNHdnYVRzRWhMcjNLNXFiVGRKZnNhQU4zQzlIYXNy?=
 =?utf-8?B?b1ZrNXhtLy8zeHp4aDY2cVpsM3ZXc2I0ci9oaGRtQkpxMk5sclJibFVCSGI2?=
 =?utf-8?B?ZVdSWkY4aUVCOGNMS2cxT1Urc1A2MFRubnIwREt1dkM2MlNxaWU5dTdMb1A1?=
 =?utf-8?B?UnFIQnlmQ1FDQjNDZGtOb2RVd3lkeVRQRG5IQWJ6aXZiZkNhVkxMVU8wRm51?=
 =?utf-8?B?dDIwK2RVOXBQejlSNlNGbitSVHhXWkRyV0pCakViNkdxSVd3MVhOTmo1SzhR?=
 =?utf-8?B?MFJpczlQVEtCVDk1QnlkZFFIbGlYZlgrMk5GaGZRSTVVbFUvZ0ZpK2p1THgw?=
 =?utf-8?B?NXp3TW9vVnJabkZua3pVamlwRW1zS2QvazVUNXJETXYvU1V1cTJ4ZEYrdTRU?=
 =?utf-8?B?WHhhOU1ZT1NaY0dLSlNNSnZJR0lOcm9NVTJUZWpmWWsxWWRCczZsdEhhM0dO?=
 =?utf-8?Q?XFlQgzvccwQwTtGkk1ylbDJ64?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f03d260-aef6-448a-2976-08ddbe2c1119
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:31:03.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njPzWpc239Qy05+NG898nMOlCVCeVS/0lPZK26IjSRnC4UqGzTJkvNFGjarQrXDMgX+eOiBk+dLdR3emNHM9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417
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

On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> Modern data center dGPUs are usually equipped with very large VRAM. On
> server with such dGPUs(192GB VRAM * 8) and 2TB system memory, hibernate
> will fail due to no enough free memory.
> 
> The root cause is that during hibernation all VRAM memory get evicted to
> GTT or shmem. In both case, it is in system memory and kernel will try to
> copy the pages to hibernation image. In the worst case, this causes 2
> copies of VRAM memory in system memory, 2TB is not enough for the
> hibernation image. 192GB * 8 * 2 = 3TB > 2TB.
> 
> The fix includes following changes. With these changes, there's much less
> pages needed to be copied to hibernate image and hibernation can succeed.
> * patch 1 and 2: move GTT to shmem after evicting VRAM. so that the GTT
>    pages can be freed.
> * patch 3: force write shmem pages to swap disk and free shmem pages.
> 
> After swapout GTT to shmem in hibernation prepare stage, the GPU will be
> resumed again in thaw stage. The swapin and restore BOs of resume takes
> lots of time (50 mintues observed for 8 dGPUs). And it's unnecessary since
> writing hibernation image do not need GPU for hibernate successful case.
> * patch 4 and 5: skip resume of device in thaw stage for successful
>    hibernation case to reduce the hibernation time.
> 
> v2:
> * split first patch to 2 patches, 1 for ttm, 1 for amdgpu
> * refined the new ttm api
> * add more comments for shrink_shmem_memory() and its callsite
> * export variable pm_transition in kernel
> * skip resume in thaw() for successful hibernation case
> v3:
> * refined ttm_device_prepare_hibernation() to accept device argument
> * use guard(mutex) to replace mutex_lock and mutex_unlock
> * move ttm_device_prepare_hibernation call to amdgpu_device_evict_resources()
> * add pm_transition_event(), instead of exporting pm_transition variable
> * refined amdgpu_pmops_thaw(), use switch-case for more clarity
> 
> Samuel Zhang (5):
> 1. drm/ttm: add ttm_device_prepare_hibernation() api
> 2. drm/amdgpu: move GTT to shmem after eviction for hibernation
> 3. PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
> 4. PM: hibernate: add new api pm_transition_event()
> 5. drm/amdgpu: do not resume device in thaw for normal hibernation
> 
>   drivers/base/power/main.c                  |  5 +++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 15 ++++++++++++-
>   drivers/gpu/drm/ttm/ttm_device.c           | 23 +++++++++++++++++++
>   include/drm/ttm/ttm_device.h               |  1 +
>   include/linux/pm.h                         | 16 +++++++++++++
>   kernel/power/hibernate.c                   | 26 ++++++++++++++++++++++
>   7 files changed, 94 insertions(+), 2 deletions(-)
> 

As there isn't a mention of intent on how to merge when this is fully 
reviewed, I wanted to ask Rafael what he thinks.

The options are either:
* the linux-pm changes go to linux-pm and an immutable branch for drm to 
merge
* everything goes through amd-staging-drm-next (and an amdgpu PR to drm 
later)
* everything goes through drm-misc-next

I think everything through drm-misc-next makes most sense if everyone is 
amenable.

