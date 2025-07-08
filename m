Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAEAFD04B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490EF10E6D3;
	Tue,  8 Jul 2025 16:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iuF3ZUvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8C910E6B9;
 Tue,  8 Jul 2025 16:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xra2pm1G/e72enVfTm+PIAaw+3PNIqwIkKGXraXjUCaphmx+ycj7pLMtLZxf1kHp0/fCrFXc1pHsDXJCaE4mHWjP0+2kg6nKBSROkDgZE/OMbULZD6ObzH2ylCnD69X9b1aaHHtpitspuAPkqJUCPsUlRiVM9TA2QKHSY7hB09CMa2OFDTmXnYSvlgfzVehwn0aEnegH4kNdpUQ8sVuJzyNcbXlJQCZsBAx1NUXyo453gJUQEIo5qnrYEFbfLb59vAtZ0Jm2J8Y170753+vCjwjejMCQuaX9b/30FQeiioMas6pBmqFrl0UE4s1Lmox9cjG4QHzz98+agfBYLMzr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz6w+2qWKfte71jy2FksElEWsHyV+eE3vfnTwyBMtM0=;
 b=UjJtvVpEr9bn1YzTSpGYoVRMmTEE8MY21N4xTsaknaMeDMJPGpuRbOjnJylM8cE1ZtPHjxbnulPDcIIDsFxCsqDWi+IvRvGq+B2l/5HmM5nD0Chkx41wzbKmh1LIV7VWsBsfC7ZrFuAD6HGbnSqTCzfE4IcxESxYeG1q0vaHWAGfkAbgduDvFf7tCWKOOq5cjmBzrbwAoEJTt3Kw3T3SiTjak6f4olB8qk41RzsHczS/+my6P5lL2KlmxbeuKGLQraspr+IQilQy/iEANmpmF0aYUhU5W6jBruBgjY9HCLVfuKmoKukcRFyzYNyDMNt2zfi09icVv2yKR0NrByd9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz6w+2qWKfte71jy2FksElEWsHyV+eE3vfnTwyBMtM0=;
 b=iuF3ZUvz4xQbNCCGD6nId9WAtCsQPZd/ew6efo8BC7BHOmzk3bcEYmxnYmUX+pgHSg3f1RIo0oAVky7j2+xi1ajyG2iXwGEy3I0R/ewJxLsBtlzKBglb3jrhlV94gNTIAaDyLmWqWcur42PPSHWRx5R2jvfRz66ugDjVGUzLZo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL3PR12MB6427.namprd12.prod.outlook.com (2603:10b6:208:3b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 16:11:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 16:11:53 +0000
Message-ID: <8d94eeaf-73b3-4e8a-988f-8e7d42a55277@amd.com>
Date: Tue, 8 Jul 2025 12:11:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-6-guoqing.zhang@amd.com>
 <a23ee023-3e70-4d49-8f11-7d5798ca7576@amd.com>
 <1214642e-73d6-4916-8578-8cb40b846d42@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <1214642e-73d6-4916-8578-8cb40b846d42@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0055.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL3PR12MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: da6791b1-c013-43a7-b749-08ddbe3a2763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUlBOE1nY2tyL2xDaklKYitiY3VFbGVWYm52cURERlNOb05janRieG5xZVVp?=
 =?utf-8?B?eXQ4c2I1UFdYbnJVYXlZU0F3R05kVUFJYXZVTGs3T0lsRGFnSWtkMC9zZ1pU?=
 =?utf-8?B?ZjcyNjZVVC9OTzRHQmNnWEdKeHdTaWNGUlNId3BJTStod2x5N24yU0N4aUNh?=
 =?utf-8?B?Z0VzbXBKUWVHaWVpdVJ2WTV5Y0Y5QVZySWh5aFhxTXFlb1NMU1FJU2tjWEpK?=
 =?utf-8?B?QXh6SVZxdlNlUTB5Tk9WY1JUSjNpUE9ZWk1McityNCtZZFZsS3FsWVUrWFVJ?=
 =?utf-8?B?TUpNeEtPd05rRW1Uc1hoQmRqdzZlbm0waXpxSE44WTAvRklaM2FyREkxbWxD?=
 =?utf-8?B?ODZ3cEx1QkhmSWRlWmh4YlZVc25WU0FBQkY2aWIvdjBqYWYwdHNGV3F5aXhC?=
 =?utf-8?B?c2l2REN4VW5UeUFhK1IwaVdGU3VHeCtRYUdML0xiUXNJRWhnSTZvd2gzMzFR?=
 =?utf-8?B?bzk3Ykl6ZkV4ditkeFVuY3FEOSttZGJEWkIyZk5RT0QwcWFieWhDU2cwRmRa?=
 =?utf-8?B?ZTNjT3ZYNkc2UEVyODl5bTEydzZ2cWs1QzdOODVQM2JlRUxHQjVYUnlxSFRn?=
 =?utf-8?B?ZGRnb0I3NGliajNlV3BaamdTbkhVY1FpRjF0M0k1L3BPN3A3ZU9TRjZINXFE?=
 =?utf-8?B?aHJ2MEU2OGpMd3NwNVZTSG94NHUwT0kvbUNaWWxWZ1R3Z2RwWUZ2TnBLcFEw?=
 =?utf-8?B?YkxOU21xd1JwdEQzK3JJZnNwdVNtWmd2UDBuV21yblN4MFlrY2VqZjB0OWNl?=
 =?utf-8?B?TWRrUHJRNGo0T2tPUlVxWnIxdlRBcVIweXd4RjZLbDU0TzJleE1RQ0lTejRZ?=
 =?utf-8?B?aFlxRzVpUjJTcjludlVEQ1hxUldjdmswZ3JKMTdrRG5GSTg5UHJOYWJGampX?=
 =?utf-8?B?SFNtRXpoWktkTlQ0WnlnVkhkMWlSbUhsbVFsaXV3a0tLbmROZit2cXBiWHRE?=
 =?utf-8?B?dlFldVAyeVJmNlhVeXJPQloyaWwwRHhEUWlGVnpZd1VYWG1nL0lpMll4bUVJ?=
 =?utf-8?B?KzE2RmMvdENEaVVOQzhJME9pMVBmSVUzZEFJSFBLOGVPKzNWSGo3c2VaR0wy?=
 =?utf-8?B?aGZpZ1pUWUNXRytBYlF4WHIwZVkxRkxiT1puWXBVdUlmRTFjdEtDQlFnZEVR?=
 =?utf-8?B?WVZsaTJ5WXdsbnFXVi9wOElNQ3RSUjdZangyM2ZkQ3F6MWNMdVdTZE9VS0hR?=
 =?utf-8?B?OXBzTHFkT2lmQUQ1K2krdEVLWHJtdDJtZC9sNkxSQVlzbklUNGZxQTFZa1Nw?=
 =?utf-8?B?akUrTncwZXJ0b0JITUkvNGhnU3QrTmxZcTZWc0JzelFCSGk5eWU2OTh1aUdp?=
 =?utf-8?B?ZGZ0MFIvTXpHZ1UxNjFTUmJDOUI0LytuRGd3UTJTcmduV1dJamlka01UQi9X?=
 =?utf-8?B?Q2d6cldXeDFsclVkL04rWEVwYzhvbGhaMU82clNSdVVwK0NzdFhnVnpZa3Nu?=
 =?utf-8?B?OFl4ZjU2UVI1c2ZEOUVOdks3ZkQrNWtEOVFOVVV5ZkUyUDdkZkJKLzhVamdu?=
 =?utf-8?B?Y094aXIycmk0STF4ZUo0OXFMMlAyZUNIQW1jeGZiMm93eVlEK0FWKzdjdkpr?=
 =?utf-8?B?M2F1TTlGbksvbWpEbnFzQTg0cTBoL2x4Q20ySXl3azdIUCtLZFl3enF4MlBw?=
 =?utf-8?B?RmFmYTAwZ04zRjJqV0VyaW5sbXp2UGZSVXJjTFNLNUg4MzVSRWFpeGhyMkpY?=
 =?utf-8?B?bS9aSEU1WlFTTTZTTVpqdnhJVk9nT2NZdU5jazEwRUVHbzJCOXg2T0h6Vy8v?=
 =?utf-8?B?bDRHZ0FmNThyWUt3UTMyWVlRS1VjdlNWazNSb2RUcXkzcGhoMk9yZ1JYSzBn?=
 =?utf-8?B?Nk5PcUt1UjRsZGpZYW14cE1jLzJnUUhJZW5FZVdHdG92Z0Zucml1T05ZR0l3?=
 =?utf-8?B?Z0R4QjVob21HVTdJQ1JnMWVPS1ZFcVZDdVkvWTNyOStHalZIR0JJeHVPOCsz?=
 =?utf-8?B?NGdNL1VoY1pEc3RmMFhkeXY5NWVrSzhCUGp5Q2pZckNMZmxYeUdGTWdGOUhq?=
 =?utf-8?B?Ukh6V25uZitBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skd0TUpWVUhyVEo3UkFDS2pLcEU3VzhSYVE3b3czcUxlTnBueGNnM01LSmdv?=
 =?utf-8?B?Y3ovWE1yNXI4ZFhpeUMyNkZjWlZhbmFvZTJldWhyZzlOcDZCK3lqMjUwbXB3?=
 =?utf-8?B?ZER0S01ERzNSV3BuVE1JYVZuOUJMQ2FJVndLMjlaNHhnWDl2cXZuRkswS3hi?=
 =?utf-8?B?SXBTYjBYSWpQcnNRVDRDUzYxVzV2Z0dNM1JDZTY3MDU4ZnQ3cnVpdUFYLzZD?=
 =?utf-8?B?b2NIdGZ1N29EOE9FM1d1WTZ4V0oyZm5taURjanhESDAzczlRaTV6NGhMbGts?=
 =?utf-8?B?c2puMHIxUHBRbmpZV1gyaE5kRVM1T3F2bDg5L1loQ3N4aWRCcmRFQXRmWlZ5?=
 =?utf-8?B?b1UyRkJOL1RJWmxoS0ZGNXI1elRwZkpXYmFzSTh6eTR1NzJCdjRHTFFLcWlF?=
 =?utf-8?B?Z204d211anlXcEI5akxYV1poUkQ5SFh2VXNqUlNxTUNaSmVKTzQ3emhJZ00z?=
 =?utf-8?B?QlRmUkltMjQzSlhEbkJqNXFKR1hmN2hpTm1WWnRhSzIweEoxZlJPVUlQVnE4?=
 =?utf-8?B?N1h3SG5kNGNUNXB3Y3YwUGdxeEk4M1BpZVVUNE1ESzhIYUozNCtSTUYxYjhY?=
 =?utf-8?B?eGhqWkRCKzZWa2F6SzhFQ1FXU25xQW5JeTd4ZWQ0RHg2TXFqRnB6Um96U2U2?=
 =?utf-8?B?VzhRd2dQYVpCVk00ZHFtb3JsZWpWUnBacHRJUnBrTFc2Y1FKL2hUVTROV0RI?=
 =?utf-8?B?ektwRGhHOUlQcFY0STVXM2FMT1pVc21IMGx4SGRxdVVnMVdUNWNodEVFcXBo?=
 =?utf-8?B?NFZsYVIydy8wdkJ6VDExeFpFdGo0SnhmUElmekZGZkxRQno1STZsd2kwd3Fu?=
 =?utf-8?B?M3VBdDFGQzlpL0dYTnRMNGtWQ3Q2YWFObkpsOXFqQjhVQ2k0YWhUazFCOVFK?=
 =?utf-8?B?VUN0Q0o5RlV4UzM5Mld3L1NYTkdaQXZTWHp6dVdtRzBqVERrdVN6eElRdkZ0?=
 =?utf-8?B?Q3d0OEJ2dVlXRGJqSmpZQXdVN1JPV0t0LytMK1BsVzFDM3ZLb2dwdmlLMUds?=
 =?utf-8?B?MjdEckJxT21ZUW4xbTlUQXNJNU1zbUVzNWFSVWQxaklGdGcwYUxtMU9wNURQ?=
 =?utf-8?B?UWl3TWlOWjNkTThFV2NJQUFyM3lYRVBhSmRaQkk5OUszUDBHWmswZy80c1Rm?=
 =?utf-8?B?azhiZSt4WXBpNy9RclpNVTlUVEdUU2xKZFZVa3Q4RHhXbU5ZMHdxZ3gxelBo?=
 =?utf-8?B?Q05sQ2dZcXg5WU9lV3czQzZ5K3NjMUN6QVpXOXJmTzhQRUdDbmdIUjF1U3Uy?=
 =?utf-8?B?aHpnaTBhL2RGZzROZTd2VkxKSU9jWVZpNnRKRW1Kazk1YzhyaDRWdE9DV21U?=
 =?utf-8?B?S2M5T05heXhVajJNMzRNc3ZJK0xvTmcyM2ZNY0d6YUV1anIxeGpQdDNTVDQ5?=
 =?utf-8?B?WDIySVpkYkVOUGVIRlVYUkVxZ3BQekF1NUNrS1FjMGtmeVFQNFBtWlZ5cWFO?=
 =?utf-8?B?S0tCQWpnLytsenlOMHJEeDMzZ09BL3ZkUjVUVFNHN09SYzJ6K05waVdvRlQv?=
 =?utf-8?B?aWdUVElJWWdOSHBmOVpCcFpHRGZNNEpacWxndWp4aVY4QTBvNEJNYjNvblJt?=
 =?utf-8?B?UU1pUDJDNHZhakdOWURIRGlHb2RQUVVJdEgvS0Y1SVFHdzZRK2lteUZmZUx6?=
 =?utf-8?B?dUEweVJkSFBTTWg0ZVRDS2NZSkVEcEV3SDhXV3JmZnlRYjZ1V3ZTd3c3WGg1?=
 =?utf-8?B?b2o5L3RhaW5tcHpFSXp0RUNjUGg2Q2wxUkgyRzMxYlpLTnVNU3Nnbm93TCto?=
 =?utf-8?B?ZTBFdEgzVWZZTWhVU3VHSlpEdEU3NThxMk5EeXJ2TWxVUTA5MnZPWUx4S0l5?=
 =?utf-8?B?RUlDTkZiMllLQ0ZlUkZzWW9GSFlQYU1tcnJIOXlHb1ZRY25RbEJ5YWJScmRQ?=
 =?utf-8?B?Z1JsdjR4SVdXVHhqb0w0WXlxL3hnSVpQVUhJVjQyNmhYYUhyZ0ZqM1dvNm91?=
 =?utf-8?B?MGxOQzVEeFhtaDJoS05PRVRuVU9SaDJzOEM0RFhUZWpDRGdrNUJETDJNUTZh?=
 =?utf-8?B?Z05oc0pDMW9seVFJTkJRaGxXOURBUzBiV1RYYVc0aWNIeU4vbTQ0SmpmQ2JO?=
 =?utf-8?B?L08yT2s5V0pkWlVFMDNZY3RrckZOeDh6aTVQS1ZTUWo1b1BVaUtnbW56Z01T?=
 =?utf-8?Q?TjybMvTGSlvP9UVHZWX8N2pAp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6791b1-c013-43a7-b749-08ddbe3a2763
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:11:53.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYBZa5EWRlknWNkAPp0IoJZuG/vhkuajAH32rcg2ux4mUq2/Zh4ideTb32LlorLEitRmeVE62yWusWuy6LpOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6427
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

On 7/8/2025 12:08 PM, Zhang, GuoQing (Sam) wrote:
> 
> On 2025/7/8 22:40, Mario Limonciello wrote:
>> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
>>> For normal hibernation, GPU do not need to be resumed in thaw since 
>>> it is
>>> not involved in writing the hibernation image. Skip resume in this case
>>> can reduce the hibernation time.
>>>
>>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>>> this can save 50 minutes.
>>
>> If I'm not mistaken this will also have the side effect that display 
>> is not resumed in the "normal case" too, right?
> 
> 
> Yes, I believe so.
> 
> 
>>
>> I know the GPU you used doesn't have a display, but I'm just thinking 
>> about the callpaths and implications.
>>
>> Would you be able to test this series specifically on an APU with a 
>> display connected to eDP and no compositor running (so no DRM master) 
>> to make sure it works as intended?
> 
> 
> Sorry, Mario. I don't have such APU environment to test this behavior.
> 

OK, let me see if I can get someone to test this for you.  Will let you 
know any problems.

> Regards
> Sam
> 
> 
>>
>>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/ 
>>> drm/amd/amdgpu/amdgpu_drv.c
>>> index 4f8632737574..10827becf855 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>>       if (amdgpu_ras_intr_triggered())
>>>           return;
>>>   +    /* device maybe not resumed here, return immediately in this 
>>> case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return;
>>> +
>>>       /* if we are running in a VM, make sure the device
>>>        * torn down properly on reboot/shutdown.
>>>        * unfortunately we can't detect certain
>>> @@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device 
>>> *dev)
>>>   static int amdgpu_pmops_thaw(struct device *dev)
>>>   {
>>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>> +    int event = pm_transition_event();
>>>   -    return amdgpu_device_resume(drm_dev, true);
>>> +    switch (event) {
>>> +    case PM_EVENT_THAW: /* normal case */
>>> +        return 0;
>>> +    case PM_EVENT_RECOVER: /* error case */
>>> +        return amdgpu_device_resume(drm_dev, true);
>>> +    default:
>>> +        pr_err("unknown pm_transition_event %d\n", event);
>>> +        return -EOPNOTSUPP;
>>> +    }
>>>   }
>>>     static int amdgpu_pmops_poweroff(struct device *dev)
>>

