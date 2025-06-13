Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC72AD8BDA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 14:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F74B10E1EC;
	Fri, 13 Jun 2025 12:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WbghprG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8310E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 12:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXxDeY757yw6m5RWfc4vZe2SpAgGPRQrEs1r8bY11RD6aYR/fE6cvIuMdfhcZ2aalNU4JTE8iVVfEGNBS0r6oaKt2m80rLJN0zLFx/ftO41Ea/23ZJGZoGi+fhz4nwpHRPqJtYhlcYPRfPvyRHM9kXQmQT+boTqH000IZV9wd1BRbtwN64N80dYXSr5aj3H143nXINXK6dUo6HZ2hCJ3oIJrSvHR+LGk60YJJZ2ir2ZhQrqrBh6o78FeKhNqQXlHYgfVar4bHNci8ayDueWskspxIr9A6n9UiWBzQRgLK1dPLJKOybvJWKjEO5j18jfZrnktc5XVM7THnlChNVtJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBFOAc71USthPh2C0FrXNPhUHeJ9eATskiSaBxF4XXY=;
 b=RNWgyiTY4ESW2ADlRcMNNGcmb8JdzObW5VTp5gRwhTdFixWfgd3LV/VjDO/v1xVrQWf767hDPbrIvPFSPoEl2Filre8eDLV8UqhHPm0VX8LxXPdzOy/2ihch9sYQajlHx/hUBpUnhNJcaHLOu7A3HI9DUE5NDRMeIJAvqzYpcsXrJYyg8LuMoPMvVx6qrRXSQcCnl4i3LJZ4C7hBRHfrb1Q/pY1YdFvSU4GSMeMVVyT4fOhxRs7z7HKU/59bgMK917RQCaj6n+pU7vzPT63uE7JuV9Em3Kx1f2njjpbYVQDaTj4CscmNWd2LCg/jQF1R5KA7zYm6y43ZhZ4TQSvGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBFOAc71USthPh2C0FrXNPhUHeJ9eATskiSaBxF4XXY=;
 b=WbghprG4DTRY1PqcAEmrXL7Dn/XflxVKBL7lkhLTR7N15oqLczxbsU1j7QHro1dlFKEjfEVCddWfP/3B+b37NOnIOq5CG2IBYraT5ZQfONj6nfEZ8ky4Ko4YntC67a7EdE3IiPZH7DvQC6/oCGxnmHcFVzUKqR3iwNkBNHgfS78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 12:15:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 12:15:37 +0000
Message-ID: <362e5fc8-8cb9-4bfb-940c-555514e51912@amd.com>
Date: Fri, 13 Jun 2025 14:15:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
To: "Saarinen, Jani" <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local> <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
 <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: a37de8c1-1eca-487b-9a37-08ddaa740158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVFzZjV1MWtaNmViRzhwNVpzbkJwMHlzNTUxTFcxMUJKRUdPQlE0YmtMZGIr?=
 =?utf-8?B?VDdDczlWV3dxR1MyZUEvZXlWTmxzRnlpaTNMSVZRWXd5eUxxYUxCWkNvVTkw?=
 =?utf-8?B?aVFXTkIxblF1MDRXUy9wajZUMlNwK1JFS1dxTGVIcE9YNDZlRkl0NEtZU2xw?=
 =?utf-8?B?MUVRZlUzVnpiVHNIZ3pTamN4QnY0QWNKZk42QTg0bno2SG12ZS85eVlsUklI?=
 =?utf-8?B?aHFLRzdUQXEzb0pDd1h4dGQrV29ma3Q4NmwrcHlWVUllejdtK3ZwaGVUL2to?=
 =?utf-8?B?THQrT0d4Mk5VQkFYSTk0VWNGNlVleTFvakxrbE1USjVVWFQzNEpQc1IwRkxv?=
 =?utf-8?B?YzdraGZoamZ2aVBlUzY4QnI2WFZRZU1FdFU0ajlJSWN6Rmp1K2JXci8yZG1a?=
 =?utf-8?B?ZHZ2MExlQXBuZktZNWpUM1g2UHJyQzlxT3VJWlB2VWJrQ2dvTXkxb1lwMWxm?=
 =?utf-8?B?RVphSHpHYWVEYlFDRytpN1k2RHRGWElRWmR2WVo4WnVqMllua3FoMVJzYUNX?=
 =?utf-8?B?cWwxZ3lRck92b3BySFgrTEtTRWlUdFowVkxKeHZwWFhpNy9BUWpWZzQ4b0Zm?=
 =?utf-8?B?OHJIeFVOdHUyS1V2L1lvTXA3ZkJPQzIzNVhFbWdDaTMySmxOWXBtU0FUTXR5?=
 =?utf-8?B?Sk8zZ0NEUWhHMEJKdlUwWXZQanRsbFZnUFQzVkx5RXdlVFFwTnorb2ZaeTZ6?=
 =?utf-8?B?K0habHl3TmpldWFYUGUyV1FJQStDdWJhNjNRRzBTVU5zL1hTbWp4TVFPU3VY?=
 =?utf-8?B?c0hjMHA5bnlvblVOZXQ0d1lLZXEvMnl6ZUZHRFJ4akdQVTdtOEh3MUtyZWJh?=
 =?utf-8?B?L2RCQUhWZzNjYWpCc09Md1RvYnVYM28xZVZaS2l6NE1aNUhjWFpCbUhzNVN1?=
 =?utf-8?B?YkszZExjSk40VlBYSXR1ZjlFZEh0RjViVldUaW9OY25ZZWxaNHBCdFZRbjRK?=
 =?utf-8?B?MXlSSTU4TFdRR1ZmT20zTGRsQmY5cjh4UDlybkszNjJMeTJnSFhrRmVwYmh0?=
 =?utf-8?B?dUd3TXlabkZ2aWFlY05lZ0x0eWJzMUEyVzl2Y0FEd0t0U040Wmg1WWRwS0U0?=
 =?utf-8?B?T3JiQ2l1bEwrekh6WWV2U3VEaEZEV1NmVUxZMDNpbytnQVhpQlp0Q2Q2M2Er?=
 =?utf-8?B?TS9LbUxFeC84L21JY3loeGZxUGVmOTc0Sm5YMjhTVytEQ3c1VVdpUkd5dm5w?=
 =?utf-8?B?ZDM0NlZUVmFLeXYwMUcrTUwwYmpVTVl0RWRORlR1WkZKRUxBSzcyczhIVWl4?=
 =?utf-8?B?Qk5yS3pOUGtPandMZ3VIYk5xWW9XZjAyTUZlWEFPVGRUcFg3bDljWEdxNVg2?=
 =?utf-8?B?U0ZLSDhzN2tkOFlKV2tPbCtQSkM5ZVI3RmZLeGpMS1Ywa3FoUS90SUJqYmNO?=
 =?utf-8?B?UTZtM1ptTWRMYmI3WUFOcXZVY2NHYllKNmNQYTVxREZMcVR0ZS9OdjlOQW55?=
 =?utf-8?B?S1oyZzJsT0pTSm1tTCtUVnV2dTE5cXdwU3hBazFYZ1psWUp4RkZ2RUtYMVhI?=
 =?utf-8?B?YjZJVGtUMHRXeVM4ME5UZUkxUlhtQnVIK1pmSFhlOUxQWmF6RzBsamJBYXNB?=
 =?utf-8?B?YU1DY1dqZHZmWHdYaytYSmI4dHd5bTgwc2l4ZXZ4Wlh1Z0o5b1NNTzF5ZDZ6?=
 =?utf-8?B?cHZyMnRzcUxZY1ErVzNJa3l2ZkJkS0pLdHVTTXBzTms1VFdpd1I0UmJmZVBU?=
 =?utf-8?B?bXV1TXpnY2duQk5uZWNKZVljR08wNlBwY0htVHJVY3IvS0dvNDIxeTZURDdB?=
 =?utf-8?B?QjlBdlVWUHJIcW1MTjhtaUF5RGdtN0N2bnZBVDFscm9rbkxWcEo1eVBGbUl2?=
 =?utf-8?Q?xz6D8Q23/LlyrldvCQ1c0+CAs1eOpPExc1H/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3R3V2JTMnFYSTNEbEZ6RXR2NGZWNEZ6Y3hSR0pWMFhPZndtM05mTCsrMFVO?=
 =?utf-8?B?OXFjUHdkRFFGbTlEWm5wTVZLa21yOG4xblBFSjBqUG5BeDJNby92VVllYi9i?=
 =?utf-8?B?T01FRzVrNHV3WW03K05OSXpKMkhFbWYxZkpKWU10dGxPOTBQNC8rQmNlZjE1?=
 =?utf-8?B?bGMwZ0VMT3N6VUM1c1V1U2o1VmhXUHoxVnhUTjFyY3NkVWFTK3hkbktMcVJj?=
 =?utf-8?B?WlErNzIzM2tyclFUVTh2c2pFM3pBSnZyUUMwN2JjT24vOG1sNFBIT3VRL0tJ?=
 =?utf-8?B?RnREdUlGdi9rRHFVOXNFVUFWb0JSTTJ6TGRQOTJoY0ovQ3lEMmZJWjJqK2dp?=
 =?utf-8?B?aFQ0VWNtcGFENUtXL0lrRnRoWUtqY002VXRIWU92ZGgzUlVJRkMxZjBOb1Fl?=
 =?utf-8?B?TFZPS1pEbW9VU2hiWmFrOW9HamJWWk5WL0o2c25tSW9BOTlhVVlweXZiMWZt?=
 =?utf-8?B?RFhveDhPSnNjOGV4WlQwcW1sV1lGWVNnSnM0djFyb25CQUJhUnEyN3hRbkc4?=
 =?utf-8?B?aFRDNUJwNTFIb3d5RDJmMWJzOHU3Y0hpT1pYdVY5RTVJNzJxWEZzRkkyc0FE?=
 =?utf-8?B?b1VKVUpDaDREZ3RVU1RLZ0t6Nlc1WkhkRG1ZS0lWYmQwczZhN3hmODR1ektX?=
 =?utf-8?B?enptL2VKZTQyNktKeG0xSXFHVVRhelhOemZnQVQ4eDZRSkFya08wcWZIUzZS?=
 =?utf-8?B?clpaMDN6WEd4NEFpVkFNb3hldGZ1LzVpbDdDM0pCZWsrendqdm1yL3FaeUxx?=
 =?utf-8?B?RldoOWwyeERYLzBEcWVsYjRYTkRJZERQTHpGMkZwZkJLcmpEdzJSOVVtMWdH?=
 =?utf-8?B?WTd1czMxSk1JNXBFVFZnM2JkQjA3aUU2TWZqQklPcjRuWm9aT2ZHWFptaU03?=
 =?utf-8?B?M3I2RWpxSEhKRlBScVVlc3h5YVozSElwTm0yRy9UMi9PMXEzMDNyK2JhbElE?=
 =?utf-8?B?R1FFYlFpUWkvOHRyVzE2bUo4Y1FRdWxYa0l6S1ZqWElIdjNJZzE0eG1oQ2xE?=
 =?utf-8?B?QXBlbnExcjJqVk42U3VwQjJPd2RKTzFpVzg0dW94OXJrdytJV3czRXVLejEr?=
 =?utf-8?B?T2hjcG5UU1VqaGZWL3FqdkVodFhNRUtNZU56czFsVk9qUjNlbXpQUTZWZnlh?=
 =?utf-8?B?TFV0cDlGTGM2S2Q5M21GNGJ3NE83dVY5OGYvMFpGWmNRMTRJQkR1OWk5QXIv?=
 =?utf-8?B?citBWWQwVWpqLzJOaGtXOHBteHB2YThRekxHems4elpuNDl5WmpvUU02T3ZL?=
 =?utf-8?B?MnBBUUVqN3o1M1JuQWxzTzQ4QVIyQmNyWVVFT2ZyY1d6MHQ3MGp0VktiNnBD?=
 =?utf-8?B?eUxrdklDK1dyUjFYNEw5UEk5ZkszM0ZWRnhsWVA5cUNKL2lNUFRHRVRoYVo4?=
 =?utf-8?B?aVNGYVgxaGs0R3c3dEhvSWdZOGd0dHBqNzBLd0p4ODdxbXBvQUREeHk5OSt4?=
 =?utf-8?B?Uy8xbnliWVBNNC9pY09YTWhCcEN4RllWMzFKWjRTQ2JEd0k1cmNJa1lpaHdx?=
 =?utf-8?B?aW0vbzRLZVFDK3JWaFlqRjkzMC9zY2R1dEt0MlBOK3FxVEpaNERZaWV4Q2hs?=
 =?utf-8?B?cXlMM3M1cHFEbzNTQ3JJY1dOclE5dUo1SU0vZjhLWEliUkZ4b3BXWUN2bi94?=
 =?utf-8?B?N1FCUk9sUWdFcTNXVmx6czFQMlJhOVZtSTRnREZBNU02TTYyVFVmVzE2U2JU?=
 =?utf-8?B?YkZHRHBGeWFGTFE4aWhGa05PeGdlNU9nQ2Q5RjlocmpxYWQ2KzRzK2QzRFcx?=
 =?utf-8?B?L1hrRko4MGhsanNHSGVsQ21ZOVVmc2Qrako4dHBpZGtxV1YrV1VXRlE3WHB6?=
 =?utf-8?B?TklFNjRxV1UzNXYzSmVHZ0ZLcDNvZ3NwNzlnZjlzZ0QraEpFbGRTNmhQYWdF?=
 =?utf-8?B?blhVZDB0U0dtUEtIc25nQ2R1NWtpaVRCbnVOOFZzNitvcnltdldDZVNDTnRP?=
 =?utf-8?B?WXpHbDIwNGtqcmtWVzljRUgrL0lKdTNiQm1qSjhpaXprM2pydU5TSUxrcFY0?=
 =?utf-8?B?TUJiVVZwdmpDMGZkVElxRVpPYjlwZFlRKzRCNXBuMlNmdmNnb3Z2RWJ1RDF6?=
 =?utf-8?B?NHF4WG5OQmdLT0NTQWdOWGVTMnlSa0wyTlo1VU44K2loYlloVzEzdlZZTm1z?=
 =?utf-8?Q?ceP9yL/Jn2O5r7OSOG+c/C+XE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37de8c1-1eca-487b-9a37-08ddaa740158
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 12:15:37.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQuC7STu1KcUjLs/BsORUl3zmxK6SWLi5y4k+fXMIOx0DHpxCt4TImBphHPjzGyT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056
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

On 6/13/25 14:11, Saarinen, Jani wrote:
> Hi, 
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: Friday, 13 June 2025 14.02
>> To: Tvrtko Ursulin <tursulin@ursulin.net>; Simona Vetter
>> <simona.vetter@ffwll.ch>; Christian König
>> <ckoenig.leichtzumerken@gmail.com>
>> Cc: tzimmermann@suse.de; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
>>
>> On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>> On 13/06/2025 11:09, Jani Nikula wrote:
>>>> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>>>>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
>>>> This regressed one of our CI IGT tests [1].
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
>>>
>>> It also explodes even more trivially when logging into a KDE Wayland
>>> session:
>>
>> Smells like a revert, and back to the drawing board, perhaps?

Potentially, but any idea what's going wrong? Sounds like I missed something, but I don't see what.

Regards,
Christian.

> I would say so. Looks like this on our CI https://intel-gfx-ci.01.org/tree/drm-tip/igt@prime_self_import@basic-with_one_bo.html 
> And systems stop testing anything after (see eg https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt_runner0.txt ) when aborts happens. 
> 
>>
>>
>> BR,
>> Jani.
> 
> Br
> Other Jani
>>
>>
>> --
>> Jani Nikula, Intel

