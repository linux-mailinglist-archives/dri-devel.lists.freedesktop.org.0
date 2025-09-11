Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96378B53561
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001C310EB4E;
	Thu, 11 Sep 2025 14:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fLqTDN2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36A10EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSB36nP5daFZyWtXprrLaj8a0uQ5GAy4ds5f86m5a9MetF7CzRJbOYMdyUIs4PT5Pajea5a3hKUUwP2wktsAxUp1LdEuNn8gTfTqvWPFrJfYmz5hn0dPFxvULroJY3bK7LmHVNcEWNxxec3BmuabKRpuoTQEDln9GCUvkTTCoSdyqACi045AzbpQemISM3fpTPajg0NqebF7RPQ9MkYbQjSMZhH7vd0INc9yhjEXh2ut+tzvWvDgliAXLjjQ27oS7v2XabriamNCMsxJsSzjSENL87t92Re/apVI/gqWFUPVekSijBW64zMAJoL2ncwXhfMuWgIP6Nlt2YidXdEHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbMVnIMIAR6VxhJtbbvVdKdzjVsHUmXghJlrFZiQJ60=;
 b=hjYAuBdqFzlNgwsC5JAjq3pSDpbq4ovTQrX63qjAJXdPXm0jfu+k6Je5WcykMjrT4Dq0ZQcLOCaBOX92x4bYx70ej8wAflR+lfZnubg1eCJ3ofzlBiePwn2LxtBCcgSVIlhh63R8qFgDu97AtEJOsZe9IlvisYKkNpvzR2Wb4/jQLtXDCvl+dtz4vU/Z7tJ38cAOMvWGIQROc+4/TPgOcpqa+UbTewhhhVL49yIFuYryX20oCEHDRyceJNlR0bYRPpYXUgitMIsd3tOaGSfG9R1JH5jvBR89imWjf8nKNUsf249CSR/febJVWSku6K+KYs/tPYiZkg31MD9sqEUKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbMVnIMIAR6VxhJtbbvVdKdzjVsHUmXghJlrFZiQJ60=;
 b=fLqTDN2ojmDwWZGYrOfrOJpldroBkZXnWMwAnxKpAzL/sGQrRJoi0aDoKqZDP3Fr/n9ni1cdfaQcQJ2I7Ds3xv+E5vWG+FBLDj0o+XmSd9oMGhOAg/bLNO/AAa4KvmJAwK0Dx/XHEw4rgT0BuEq0dTtZa81aVXjdvo1/OX1msO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:31:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:31:36 +0000
Message-ID: <3227b440-5dbf-433d-8658-f37f9561554a@amd.com>
Date: Thu, 11 Sep 2025 16:31:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ttm: do not direct reclaim when allocating high
 order pages
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
 <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
 <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
 <262a176a-4c80-40de-96e0-c97f50c20fe6@mailbox.org>
 <b7c57dc3-ed0e-402f-8a3c-f832357f8763@amd.com>
 <c6cbaa8d-cb90-45d5-b3b6-279196f958ce@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c6cbaa8d-cb90-45d5-b3b6-279196f958ce@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:208:c0::44) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: e47a5785-2cfe-4b98-94b9-08ddf13fe9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDlZZFVSQlNLL2EwWkFlVjNXUkRMNlMwdTFIMllYd1c3a3V3TFh4ZUdKdS9V?=
 =?utf-8?B?UzZSSGRpZ0NXYytJVG1pUzI0dzQ2blQ4emRXYWNaZTJib3VreEZFN2ZRQ2k4?=
 =?utf-8?B?aGVLeEtMcFduK21HY3Exa3Q3em8vNDcyeEtQeGFnbk9taENSbTR5ajBvbzJR?=
 =?utf-8?B?WG5UZ0ZQSlJGTDBjTGt3OTZqZG96enNyWWpCejQvN2NPSTJqOVdMZ2JjOWRI?=
 =?utf-8?B?aERUTFFWNXVsV0p0cUErY29tdmJJYXM1a3pEY05QT1hNZjU3dzVITEFsQWtv?=
 =?utf-8?B?NUtyaDA0STQwdkJxQ1FJcVhnY2NkL21kbndJS2EwemNzaExUbXZsVlhwM0NU?=
 =?utf-8?B?TnIzUkVLV1M1c0ZEY1AwNzB3T205ci9qSlVWYnlrWVpmMGwrSEtXbTFra2NC?=
 =?utf-8?B?NTNFY2JRWUtNWEtGaWo3MDRkZnVKWTZyTUNsYXd3RFJsZlI3YStvQk9wRCtL?=
 =?utf-8?B?dllrR1JIek8vbGwrQ2c5UURKOFBwaGE0UUl2ZnhyOUtWY3FidlBwUk9sMlVW?=
 =?utf-8?B?bUJ3UjdQTk8rSEJVcDRCak1tZHIvVDljZFN5V1RodlgzMy83NFArMW1sdlB2?=
 =?utf-8?B?SGIwS2Y4T2lJek0yc1d5Mk9FTXZrMkZoRy9aSzlnQUxvcmw3bVdJbGI1enJ1?=
 =?utf-8?B?YWEvYXBVdktEZlZJS0VTTWZCRE5ycVFtTjErMFRVUkpkckRlMnpIM0dUTkNo?=
 =?utf-8?B?N1k4ZGFFdjVzVEM2em4vTmQrUWRjWlhhRSs5V3pqNlZMMjlGMDBEQUhrdFla?=
 =?utf-8?B?T040VDgxaHNoZHR0S0JFdEV1dHcvWDFiZkFNZjJmWnU1YW1FbVQxNzY2ZXFn?=
 =?utf-8?B?WmdJRlowTnkvUTBZYlpXK21EVFYrWnVNR0pFZmFhczdKbWY4QU1IVlVKTVRy?=
 =?utf-8?B?aUY0ZFVmQW80Sm5Db3hWS2c0MmFGYVFyKzdrQXBFWkFFMDFFSFh1WnhDaFZn?=
 =?utf-8?B?SXhQRTl6RVJWUGlndVM3WHlzRDBlbHY2YVdoMWs1ZGZOdHQzdWYxUHNwYmJR?=
 =?utf-8?B?OGJQbmE2L0UwS3JIZ1RodDFyTTdRMDY2aFowQVdZam1qSE1iTmNGeFdpcXZB?=
 =?utf-8?B?bkRHTHgzZkxibEZRTnhaYmhqZzBGWGNha0RSaCtPcUJEZHFBdUpwRmNETXJo?=
 =?utf-8?B?NXNibUNXQUhkdGkxYjNPNVRwdmlBbUZ3elBpTDRmRHRSbllOeCtBY2cvaUlv?=
 =?utf-8?B?S0FhczBWNjAydjk1M1JHYmZrSU9abWNuYjF0M1ZsQlFOMmNRQnNyWk5QNk1S?=
 =?utf-8?B?MHpHdkxkazV0VGFxWXhlWHhYcGtEbGtjcTNtNmhEWWs3cTVUNTM3VkdqVjdy?=
 =?utf-8?B?VkJXaUNwUEV1VmFkUThuNnNpNmxqS29nTXhhVlMwN0Ixc1ZIYXFOYTdhZzVC?=
 =?utf-8?B?UUMwRHZXcmxmTVVCa29Fcm5xRXpqM0QvenBRVC9oWEtRZUprODhMMzJ2WjdB?=
 =?utf-8?B?bW9RY0U2SkJvYkxib01QQkVRb3gxU3I3RkxNRThVanUzenA1M3Fhc0UvRW5w?=
 =?utf-8?B?Zk1OejhXM0d3Q1p6S1pIYVJlV0dRVEhjN3hCc3Y5YUEvUmtVcDZLc0RoR0lZ?=
 =?utf-8?B?MkltZ210WjNTMUpwZFVreFBJVkVUY2k3RUtDT0ErcXJxRzF0Ym9iTEdiSzN4?=
 =?utf-8?B?UkRSY0l2TVpmY0g1a0tkRkVWUHRpQmlUOGJ6aXlPOXlaU1M5RURrOWVzTnFP?=
 =?utf-8?B?RFRVOEdpdityRmVKZjQ4T0toV1ZTRCtESzFLeUtaNzdCb3FCcUN5RU9qQ2Vn?=
 =?utf-8?B?L24yYU4zRVlQTHdTYlB6WFRyckRoMmh1cTBOWHJxYUY3dGdqck5XYnRyZlVo?=
 =?utf-8?B?ZHlsWVF3cTJ3dGUxVlZDTnZ3SitXbFRUYTJOcFB6R2FTN3cwV29YRXl1ZGpa?=
 =?utf-8?B?VzU5OENjelRZNmJhNVd4NU1tR3QzNm05UXZuNkg3TEU5a3NCRVdyWWNudVhU?=
 =?utf-8?Q?SCtdf1j0UrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFd3dUtVWDdNTVdTM1FQSUxwZElVRmltTnpiTVdBSXhEUmRuN0VPYW9xbmd6?=
 =?utf-8?B?TC81VlZORzlXdWRiQmdTMXFvZHhmT0N3Q2hiY295ZDU2aXMwRkxaNlFsb005?=
 =?utf-8?B?eFpubWY3TGhDZGtzQVN0SXo1WTBWK3NyTkpseE5leGdMSWp0Tk03YlF6Rmk3?=
 =?utf-8?B?aTFHVzBuNTJTNWkyNWFIWHNBb1g5WTF1cnVxSVU2a3VWbktQRERKcFRucTdn?=
 =?utf-8?B?N1daQm54RnpvYTRxOVN0RGFzY0F2ZnBEMnM2Q1pCOEhoa1FtR0E3bUxhNGNn?=
 =?utf-8?B?T1gvZHZDdnhva2wxZFVjbGI0Tk9kZmVTOTJ4SnhiZjhlQUNRQjBhVDFDcVl5?=
 =?utf-8?B?MDc2ZkxCWUovRWZIUms5ZS9MRzlIY0Z5UEQ0NjJQYXhtQ0hDOTUzd29tQXNI?=
 =?utf-8?B?SzcrN09rRnR3M25rVjZ3U29lMEZHcXpwamJ0cUNJaCszbTN4Tm0vSERibmgy?=
 =?utf-8?B?VkNMWVYyUmtZalRGTnQvUlZlTUNCckdXb3lEZ3Q5ekoySjZqdWcvYkQ4dUFE?=
 =?utf-8?B?SVlUTk9Ma1pLemhFWHg3QWFGekZwQ3p5UWg0c0JPVERIdmphQlNidUNoMkVZ?=
 =?utf-8?B?REFXQmhwR1VkR3NMa1FicWFVTThyTXNibFM3czhZOTJxanZWUUFMMEo2SUps?=
 =?utf-8?B?Ym9valI4bi9qUXhOL05waStySVhMVVlzWDY0NW1WQ3JFTkZSZDVFdjQxRUZB?=
 =?utf-8?B?L1lzT29NbnFOYS9JZHIrOTRieVd2NkVIMW1WaVNudEVRNlRLQkRWSGV1MUlk?=
 =?utf-8?B?b29tM0hBcHVUY3R0NmZuc0xwSDhmeUZkUUszaGFzU3VUYUkvUXg2QVFGVzNQ?=
 =?utf-8?B?MERDNlNXN1RoMGxiVVdQV2c1ckU5Z0ZONnV3TWxMZUUwbGpucEcxSXAyRXd0?=
 =?utf-8?B?QUw2VDFkWDZ2RUNoS3Q1ekxGSUgyb04zQ2pjZFhaYVVYazdXdmVzS1VHRjFQ?=
 =?utf-8?B?R1VBcnNNRmgvTytsaURMYmdEYVNZYzVidjFkNUhJZCtBRFZnMVRyanBuQU9X?=
 =?utf-8?B?dU9NSTZvNFhUb096VzBvamJwYm91YkZCYW02Q0dBVmV5b1ZKTXl5cVd0YUtS?=
 =?utf-8?B?ODdoblgvbHlhUE4yVWRhK052WllXejdPS09RQ1lEb0VhV3BvclQ2d2tML25P?=
 =?utf-8?B?dE14MTJjcU5FTFlZblZvOTRUelE3cFd5cC9aY2tqMk5HZ0htSEkvZGs3M2py?=
 =?utf-8?B?QWlwMzNQWmdkVFR4QUc2U3crdG10Y2VDaDhTbEN3eUxaMlY0dWNvSUlXVS9k?=
 =?utf-8?B?SzVwWVVEZWtxTjFVZU0wWEZsVC9Gb2FyVDgydnZ0eGpuQ0xXN3VkT1NkOEpK?=
 =?utf-8?B?amtmeTRIVHJ1NUdEUkk0Vm8wWGlXT2ZnSnVUajJQOGlyWTd5bzdDSmpmbEVw?=
 =?utf-8?B?WG5va3ZlUzJFZHRERC9zTWVhNENXYUM3SXB0SG9TYmQvWlZNYTJyYS9hVVIy?=
 =?utf-8?B?eTZtOFlINnl1YVIzVndqL2taUUxSMkpPR3RxYVVsSklZWDQvRS9NWWN4dkRJ?=
 =?utf-8?B?Vy9yUlM5TXlBUTJXbU5kNlVjSWtZa2ZwQStocE1tU3N3ZERubTlXWXh5b2dC?=
 =?utf-8?B?YU5LMzFIZHJYdjJCZGJ1YVhseFJNSnoramFzbmY3TlYxZjQ4ZWxHeEdLMlRH?=
 =?utf-8?B?a2NGcFVlSTZRYUgyK0J3RFBwNmx5TklWV29kK3BuMVh6TU42TUFNM0MyWXZ4?=
 =?utf-8?B?aDFNMmMzSm1IUUZoeTIzMDR6YkpGTlVIUnVaMzNicHdSNTlpd2Fab3JKRzhE?=
 =?utf-8?B?TjJQRjV3ak91TURrak5jcTF2elpIK2p1M3Y5Zm13QUZyVjdpMjYvVzROLy9B?=
 =?utf-8?B?cTNkc0N3ZVR6cmlYVWpETEhlTGhlZVc2OG1RejVZVHhoSVJZVmp1ZUxJbGFa?=
 =?utf-8?B?U1hONVp0WVlzSk1NTmt5TEd6VDV5cG1TOG9WMFpnZW5rTHpsQWRXYzUrVVpz?=
 =?utf-8?B?QThyUTA0elQzd3VVV3oxTGlHRjhTOVlwTEFiZjYrUjlaV1p2RGkzL043NUdW?=
 =?utf-8?B?N0t6OE5YV1A0TVl2TFpESmszeXc1emswREk5OXBrVGhibm1KLy9ESE03SWM2?=
 =?utf-8?B?R0dDdGw0aEtWOTZ0NUVxT1lKdkxsSG10V05nUkJDYU1ZK0d4eDl6SCsveC80?=
 =?utf-8?Q?sgczo+cclpoZTqgcEVlkorpzo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47a5785-2cfe-4b98-94b9-08ddf13fe9cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 14:31:36.7164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWC132J46WzzOpDFxA44zTz50aVrqXfRYQ0FeFf29pi+FOHbvmy8PjwcvC9g45xD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481
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

On 11.09.25 14:49, Michel Dänzer wrote:
>>>> What we are seeing here is on a low memory (4GiB) single node system with
>>>> an APU, that it will have lots of latencies trying to allocate memory by
>>>> doing direct reclaim trying to allocate order-10 pages, which will fail and
>>>> down it goes until it gets to order-4 or order-3. With this change, we
>>>> don't see those latencies anymore and memory pressure goes down as well.
>>> That reminds me of the scenario I described in the 00862edba135 ("drm/ttm: Use GFP_TRANSHUGE_LIGHT for allocating huge pages") commit log, where taking a filesystem backup could cause Firefox to freeze for on the order of a minute.
>>>
>>> Something like that can't just be ignored as "not a problem" for a potential 30% performance gain.
>>
>> Well using 2MiB is actually a must have for certain HW features and we have quite a lot of people pushing to always using them.
> 
> Latency can't just be ignored though. Interactive apps intermittently freezing because this code desperately tries to reclaim huge pages while the system is under memory pressure isn't acceptable.

Why should that not be acceptable?

The purpose of the fallback is to allow displaying messages like "Your system is low on memory, please close some application!" instead of triggering the OOM killer directly.

In that situation latency is not really a priority any more, but rather functionality.

> Maybe there could be some kind of mechanism which periodically scans BOs for sub-optimal page orders and tries migrating their storage to more optimal pages.

Well the problem usually happens because automatic page de-fragmentation is turned off, we had quite a number of bug reports for that.

So you are basically suggesting to implement something on the BO level which the system administrator has previously turned off on the page level.

On the other hand in this particular case it could be that the system just doesn't has not enough memory for the particular use case.

>> So that TTM still falls back to lower order allocations is just a compromise to not trigger the OOM killer.
>>
>> What we could do is to remove the fallback, but then Cascardos use case wouldn't be working any more at all.
> 
> Surely the issue is direct reclaim, not the fallback.

I would rather say the issue is that fallback makes people think that direct reclaim isn't mandatory.

Regards,
Christian.
