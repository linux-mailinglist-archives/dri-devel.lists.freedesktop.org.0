Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD049A1E4E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7310E1E8;
	Thu, 17 Oct 2024 09:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2TYB6CUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523A610E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 09:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QajYG7Tti5ArtpLOKOXBq/ymgHIcOVFCd1RkHqYISLSxM/zxU//6EcJ6/sASsLQ5NUgtIiKUxLOi0vsDiQFYvi1rOVZXonQQB/SdbUadIMhiZUHaByklRNzuVCQEsdrxew7cQcSfjiHG66oker+4fU4/ANq8eOQ7c0eDyqU0F+FwN7unR6V+qkqGbLNOTrDtr9HKAhhhGgfvyFMI76vObtuC7XdbVE8h+XSpmh5dyCBQ3PXqeCiCw4H48eyC4MRJgvYZI2tnJdwja4OJRZ85wuj8nvn203fPL5XxsGjyhO5YCn2yh05TzzQU998dZes/bHDfQoHTjRX4CCwOjH0nUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moRSRK7DAnTH+lLWca7IiYnpG+qE45XwHDiIBTjr1F4=;
 b=EVwk3fz61ueDPHDcVX7Oks6rP9pwKwxnWcbOS/mRlAtf4FtbUk8XGhvgtOBWsd895+Ln2nUmoM5bXmvvuLQdEuOS5loerM/10cO6wU23tfE5pUlHJa7VOGAlP/7YDVeC4jXtbrZhx0HzRKxF2Nrw1sRLzcc93YBpk2SRR/axp3GZVkEKL2BllK2cR7vX+O762Ztj+Ya1GLuBY62FnX04+P6UYmMvATK7wChYO9wZKrWdhrRsQG7E0QYzF9roP2yEBpvy8NL6Y924I8PeDJiE3UrWLlpFMibs/scAGk2O6/XTQxtts/DMHVyMwbPuEHgZZ1n6ZrBNYrbCIt7XjEUdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moRSRK7DAnTH+lLWca7IiYnpG+qE45XwHDiIBTjr1F4=;
 b=2TYB6CUGwwaQriYRNWShFTHrCJK/EuCPiSuT2G0LH9Nx+JC5esvZQMIJKJbhCSWkOcq7QIfRys3s/8o5K+VSJlQe7zpXF/5PgITKizaBMv1nuQjkN25y3HQl41gcuJ++5oeO1UGaxiZrhJzoMg72WgBkG1pM0w0yPubadc+DV0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Thu, 17 Oct
 2024 09:27:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.020; Thu, 17 Oct 2024
 09:27:26 +0000
Message-ID: <51315b7a-02a7-415f-b69b-3a7919e921f6@amd.com>
Date: Thu, 17 Oct 2024 11:27:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/panfrost: Explicitly clean up panfrost fence
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241014233758.994861-1-adrian.larumbe@collabora.com>
 <20241014233758.994861-9-adrian.larumbe@collabora.com>
 <94be6c2a-47fd-4157-b5d8-307040eaa3b7@amd.com>
 <3mkdo37kvulmticy7g5siwk3skvbg33fnrioolcgofgbakbnph@3dyq77kiotig>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3mkdo37kvulmticy7g5siwk3skvbg33fnrioolcgofgbakbnph@3dyq77kiotig>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: b4de4565-19f4-4b3c-bd50-08dcee8de9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG0vWHlPYVFSdjRscmpBb2djaTN4UWI1MTR3RnBaVnpodC9mbUJ0WFdMaEx5?=
 =?utf-8?B?Zk5yYW9HT041UmtSN1JTQjdMM2praXRyZ055N1BuTHNac0hieVVEQ1FmRTg0?=
 =?utf-8?B?VjcyYk5OUjN5dGZJWVczODBNTDNGQmxIODJ1eWY1UVZxN2FDWGV1OHVWNkVq?=
 =?utf-8?B?VDU0MFNlOEZKdjNTdVFQVUJBRGhPQk14am1EZHZpOG5JZERmUFhneFRBOHpn?=
 =?utf-8?B?bVpZSFNudUVSeGtWenlCdWVQSmFFbkZEOExIbUtmWFJ4L2lydjluUXZlSHhV?=
 =?utf-8?B?aTE4L1pIREV1bUU3K0xQS2tNWGR2YTR5MnV4b2dMMHpTWlYrTzc2VnlpM0du?=
 =?utf-8?B?SWZKR3dIUm5WMm9uQWcyU1VuMnJFdWJtdmRGYXhTMGVqTyt6Mk9xUThsN2ht?=
 =?utf-8?B?a0NacWNCaEFUNWwxbCtPY2dFdC80TitORGNzV2MxTTR1c25pUEdjMS85YkZD?=
 =?utf-8?B?ZzQxR3JmOTVINzNDNG9FVEx5emQ1QmhHZUd5ZkNGMG42cjZSN085Q0ZtWTM4?=
 =?utf-8?B?WFUzTEJ1TzlKMHB3TnladUZoRlVJTW05am1TdmtOenErZEwvRVNzTFpaVGpQ?=
 =?utf-8?B?YzlQTmpKdFVYMVFUVmxJSGc0b1lUWnNnc3dGMVlqOFprbkYrUEZicmF6R0ty?=
 =?utf-8?B?WmlZdW1JNXhFYlJPL1VXL2o4a2czWWlBMnRXeUJDZTREcnRlY3dIL1YyWEE4?=
 =?utf-8?B?NnRGaE01UGdvWS85dy9od2dvbWxIWGRPelVrUVBuQXI0MGE1VHZ2T3pZZGNj?=
 =?utf-8?B?MW5DQ0pDQlZKUjVsQzYyekE4UGtMcG5RUXpQcjVEMXR4TmhGQjlGWVcyVGpm?=
 =?utf-8?B?aUpZR0FOZUFYdjZxc0JCb2djMlMzbitpOTZnUHlBUXVBemY5T1o0VU8zaWV3?=
 =?utf-8?B?RmI1LzVvaUZSSWxyM1h4ZlppMW9Gekhka2haZ3UyTDdrYlpqTTFDaVd3VTlO?=
 =?utf-8?B?Sk1oWVpNeE95bCthK3ltUThQRE51SlpvYmVqUFpTWHlDYWNKMHZHSHZaa0dr?=
 =?utf-8?B?aWRML0k2VkdYRXdvdDE1L085MVg2Zk9ZVDBYdFlaNzRQeXRKWFdyVUFDL0Ju?=
 =?utf-8?B?SFNaUSt0dytKVXh6TmFHb1VNUlNDYWk3SHFNN1IreWtjTURPTHpxN08wOGJN?=
 =?utf-8?B?VjFHb1d5eWt5SVE2eHA4dTdwTzlpZzVpNWhTV3ZnZFlGRHhvTUlCa2VSL0Zy?=
 =?utf-8?B?T2hIN1RYTk5VVjlpakFQZlBPMXM0NFNiTjZzS0YweG4xbGp2N0ZaR3JUaXo1?=
 =?utf-8?B?NmlKMDNrMWQxcDJIQjRVdnkxelA2Y05rOWJBY3p3dElmVktZV3VQOXJGU0tU?=
 =?utf-8?B?ZmxQWVJIeTZLQlFNY2tKdFU1MGtxWEN0RnFldncwK2pzYnBGSytlWll3V2Y3?=
 =?utf-8?B?YkpEQXpmdDJSMDBlcnZkUkRGckJVc21NL0tGNzZ6VHoreTRFMS9mdDFYa0Z6?=
 =?utf-8?B?ZS83V1V2Ri9qelQwZXVPV1JIL2puanNxZE1EM1Y4LzFRWWk1UzlaVisxaXVE?=
 =?utf-8?B?eUZsMUlDWGpVV3MzbVNpU0t3R0xoOGdaOHU4ZHNPWDdmcU5lcTh1eFRITDds?=
 =?utf-8?B?ZTd6SlBIZXlQTE1iSWllaWovTFVDd2RTRy9RWlErd1BZMW9LcjVjS3dMTy9Q?=
 =?utf-8?B?QkFhcXhrdHpmQm9md2NSMlNrZTFXa25HYUJCaDNSZnJvMjB4VldPeUd1MzMv?=
 =?utf-8?B?UkpyYm9rak1jKythVUw1YklhTytMREZDb2w3MFkrQzVSb2djK2JwLzhhZnJ5?=
 =?utf-8?Q?aqe7CExUcaztguAFkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJUZDRBeDNORDg3N2ovRFBsY1JpZVAwTkdSVU1pWUMzN2tRdjdwRStQRkpl?=
 =?utf-8?B?SmdTeCtHd3lucFJSWjBhd1FldXd2ejhDek1NWUJpZjYvdTZWcDlwdTMzVXFo?=
 =?utf-8?B?N0pzMU5ZazlGWHJvcE9PUTRMUE9BeDdYTHpRZVBqc0JJN0E0elZXTCt0bW0r?=
 =?utf-8?B?ekhwaGhRUVBnMG84K3Z5Z0c2K2tEbTN3RXQ4RXdrZnE0VWNSV09Vb0lsT1JZ?=
 =?utf-8?B?SzBWLytMNlRSTkhrK3M1Q3JRdk5NOHhOdFlFcmg1VWp1dDhRL2lsT0QvUHA3?=
 =?utf-8?B?NnNuYkVkNGZpQXV1czYyNjcrSFBoRHNIdk9JNjYrQzRaSHNPYWdWVVdlWU50?=
 =?utf-8?B?aWZYd2toRi9tRWdpNUJlMG5wcEdVS0NRdHdteEl2bTZudTlUQmZ1UHNXTFI0?=
 =?utf-8?B?ZThLWW1ZRjhBaFFaQUovM3dSdkJKRmNoWVEwYm5KbWlmUnVRZW1ldEFkaEtu?=
 =?utf-8?B?LzJQSjM2dXUyRzczdHR6NFBBZEVYVjdnRHlqUWRoTndMZWRXSUJUdjR5SUhm?=
 =?utf-8?B?cW1kc1NHR3hvNFpVaGVGby9lTEdWZ1dWRzVNVGtVNkhIUUM4Ynp0MTNFMW1V?=
 =?utf-8?B?bVY2cnQ0MmJVZzhtaUJtS3NRZ2lXSHJ2OExQWWdrRGk3M0tFcTZLa3JURXps?=
 =?utf-8?B?c3hMdmxpYkVab2RVZFQ5ei9rcDJYaWNubWZIeGZVVGdLWXB0ZDg4K0VSSmRV?=
 =?utf-8?B?MCtFMytCOFg1dGZDcWZHYUxRZkhrdERRblA3bENnMkl6WWczcnNRc3lncVRQ?=
 =?utf-8?B?Z1EvcHVwYlVpdkJsZDBWdG5qT0ZxNXdDQlVMUmdjY1B5NEdQTDNqNTJFdjBE?=
 =?utf-8?B?RHhsOHpTcFE5dHdGc3VxeTY0bksyMmR3ZXJjRlZiS1RlRU56d3Q3T3ZxY1ZR?=
 =?utf-8?B?VVB1UWd6TC9kaGdKWXVYaGtXU2VTb1pDK1RSUDN3LzhxK1JuUDF3V056dWZS?=
 =?utf-8?B?VCsxNzFqRlJkM0lhRG9QTmd5a0R3d1ZWN2RwZUlLWnRRazJzajE1Ukh6bmVV?=
 =?utf-8?B?d1lFVW9CRXRjMXZTTVU5OXM5ZnNCOHRHck9rRUJVc3lNVnNLQ3pNb3dsazEz?=
 =?utf-8?B?WDBXcGRsbVNYbVZlSW52ZGI0RlBsQk1xekl6YkdkcGlZK1JtWkM2OXVjOGkx?=
 =?utf-8?B?akZ4Zlh4Q0x0ZEFSTGdSeTYzc1ZtZEdEa1YyekoyZlN0MHRqTVc4NDhtODNz?=
 =?utf-8?B?OEZiWTQvejM1ZExQZEN6U0ZGOHA5V054aUxkZXZhZEVzQ3FxZE1Edzg1ZDR0?=
 =?utf-8?B?cWdSWTBDejZNdmRwNEZJY0tiRDBsQ1JsWWVxZHRyYUZ0ejV6SCtQeEllWXFn?=
 =?utf-8?B?ZEpqelR3RkdYSXROdGdVRmJmbDBjOW5oRTZOK0dGMll5RDZiS2lQNUE5WmlK?=
 =?utf-8?B?WGNvclY2TWJlbWNSa3RMWjFhMXpWU3pzdVV0L0VIRDZBZEYydjJEVFlsLzJI?=
 =?utf-8?B?a3Qxa2FueWx1LzYrUXF0N3FXY0pKV1kvVlc3eTdhc0NBSHVQZTVGVVp2K09C?=
 =?utf-8?B?MU9UbTFBSjJDN1R4aWFPSXhUMXFadjVtODlBQy9SRkVtRXR3SmVBQ3orY0RL?=
 =?utf-8?B?RmZhMFhuYmFMc3h6S2JNMlhZcFZQR0RrRVNadWxhNnVsMDhEcUw3eWYzL1JO?=
 =?utf-8?B?ZDZjbWlyOEZrMWxMaVZscjRHbDdyNUt5cmI0NWN6YWV6UGJtZXE2K0xSdGky?=
 =?utf-8?B?Z05wUTlmUHJWRDg5Nk52bXpWR1ZsVHFxalRadjdTVnRvdEZJMWxUcGVNbDFR?=
 =?utf-8?B?MGpBc2YrYldmNiszd3ZPMVZrMGVkNVZ6VHZnRVFWc3Qxa1UzSGpESUpCOFZv?=
 =?utf-8?B?L0J6VEg1Z05QVks4eSswV2orVkRuOXZ5Nk02Qi82OWs1WVU3allYRG5GbGg2?=
 =?utf-8?B?ZmltNGN5VDBUQW15VG9ROCt0R2V0RCtHaTllVkF2OXFRL1hIc1RQSituTFl1?=
 =?utf-8?B?b2EvYzBJT0JqSlZOVDMvWjZxZVAzWFdqSU15L0xqZ0c1TXdDWVlvbVg4dGJN?=
 =?utf-8?B?M2FUdUh0MUR1WCtvcnRXL1cxMTFseWErSHJYUFJQVklVRWYvdEZwaDdxVFRH?=
 =?utf-8?B?KzZEa09FZDRLYnJyVkVEWkJObis3YzErTUVXUmQzMGZHYjhCakViT2Z6RWZp?=
 =?utf-8?Q?8b3M6dtp1fmyxP3WUmCDO55+H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4de4565-19f4-4b3c-bd50-08dcee8de9de
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:27:26.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /98wCsnHT7coiXiu+9ecX29Yxg+kNH9any02MKj6WVwtzio/D9hgfMtmVMt4qakA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794
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

Am 16.10.24 um 18:43 schrieb Adrián Larumbe:
> On 16.10.2024 15:12, Christian König wrote:
>> Am 15.10.24 um 01:31 schrieb Adrián Larumbe:
>>> Doesn't make any functional difference because generic dma_fence is the
>>> first panfrost_fence structure member, but I guess it doesn't hurt either.
>> As discussed with Sima we want to push into the exactly opposite direction
>> because that requires that the panfrost module stays loaded as long as fences
>> are around.
> Does that mean in future commits the struct dma_fence_ops' .release pointer will be
> done with altogether?

Yes, exactly that's the idea.

As a first step I'm preparing patches right now to enforce using kmalloc 
instead of driver brewed approaches for dma_fence handling.

Regards,
Christian.

>
>> So clearly a NAK to this one here. Rather document on the structure that the
>> dma_fence structure must be the first member.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 5d83c6a148ec..fa219f719bdc 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -85,9 +85,15 @@ static const char *panfrost_fence_get_timeline_name(struct dma_fence *fence)
>>>    	}
>>>    }
>>> +static void panfrost_fence_release(struct dma_fence *fence)
>>> +{
>>> +	kfree(to_panfrost_fence(fence));
>>> +}
>>> +
>>>    static const struct dma_fence_ops panfrost_fence_ops = {
>>>    	.get_driver_name = panfrost_fence_get_driver_name,
>>>    	.get_timeline_name = panfrost_fence_get_timeline_name,
>>> +	.release = panfrost_fence_release,
>>>    };
>>>    static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, int js_num)

