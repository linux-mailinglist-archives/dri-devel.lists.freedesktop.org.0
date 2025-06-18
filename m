Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A22ADEE91
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B398F10E83E;
	Wed, 18 Jun 2025 13:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dIPbOaQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1310E83E;
 Wed, 18 Jun 2025 13:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTd4Jj+kknyJrCFgk0bm01fP/h6D9aKAwA1FyrUmZ/JaxJFSoYoJ+Sls4ZTGIqJwZhEXrTx4dl+rxvjaWeqeXO7sI7YIztW+ol1qfqs53lLEU9xOsqIO1vEoC0xcKMAppMzAflGmbdektFGeMwdLlg6agCyZWAb0M4LoxyBfVLw8ytCVciZT53u5cs836eV1HPnpA7xOxpusc1qCZkjCCus9vbZniYYnmsnHEORRnHQZkIgzDURQMlipwiJ/twAE3IGA5HI9o2M7pPkg9Voitkkts23Dazu9uHGn7eT9e5M8Z+m4XHM3m7OtH/7C/buzT0fCEkFIh97B5Ain6vx12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujlqi084Abajt2dYjhW8/uYeVbtQZ3Zo6ZXUDO0T2jk=;
 b=gGpCFI/OdEAcL9K7ZRRQlQNq/kg5jS49AoqFp4yC/goKDUwx84a+4YMg/F5/LYvNwb4VYuikZQ4KzNfbEL8BC0qaSKW9awEOI3eTGoAR+8A7Uj0U/pMHeDR8FvqifTMm8z7VFyLmKWC8V+UcdulCNdexmIMsNFTQ+viLAb9w/jxk2Dfu2Ms9DhXQgsFFZI4iMW0gfkMerdzLNZJH7hcKt80kzd3wEH2UTnZfcyCap3946EeJkrAUoOQ16EZ9xOI/MTDk4gfVdfheeQLmJ9pyYN7K+hPUOYGVHzNikik2yn8/CfJFBrNRuCUX2VDHNUhy5+58HrhUhu0Xiea8ZNt8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujlqi084Abajt2dYjhW8/uYeVbtQZ3Zo6ZXUDO0T2jk=;
 b=dIPbOaQI3iK2zTBYDchkBKG4ME6CRE/NVSvI46npoEZ10Ogzk/SDKAtSHU+jzFQXWjVC0w/ABerJda1PRrhDBV0MuN+YXRBlVe9kCocQTcHDXmXtlhPyQ1E3dS0F+jR3RZKfGelXhrFDoFZcoRCmcnYZoCmhfQ4DGgMNPFjWeHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 18 Jun
 2025 13:55:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 18 Jun 2025
 13:55:35 +0000
Message-ID: <c44f4194-69e5-41bf-bbc6-2e399be2b627@amd.com>
Date: Wed, 18 Jun 2025 15:55:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] drm/ttm: Add ttm_bo_kmap_try_from_panic()
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-6-jfalempe@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250618094011.238154-6-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e64cceb-13ec-4b89-1dff-08ddae6fcc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW1QMU4zTkFMU0RrdnIwci9IeGk1VGNGWWVFQUhYejBVRmxYUVlYSGxQRkdP?=
 =?utf-8?B?a0xlU0JuS0xDd244RFRvQXN5UTdCcWszejVJUVNZdHN1aEdjSEtZVUFnd1ZE?=
 =?utf-8?B?WnNtYTExQTZXVDJJMVZTWTB2RWxQbUtJVDJMSW1kU3JWZnh1bm1NTUVieHRI?=
 =?utf-8?B?ODJBZTlNbDhZeDlEd1kraWd6NVBaYXNoYzdNS1hNOUlibEFsblUvTlZSS0Vy?=
 =?utf-8?B?TkNhaktnYVZVd2phYW92ZTBhQXlHbmU5cXptSml5eGhKNnNzQkFaRkNCc0pH?=
 =?utf-8?B?OUQraEw0MWN1WVlPR01kc1lFaEkvdFdwUFVGdjhTZCtCMWJUSU1kWWJqcUtq?=
 =?utf-8?B?RXNBVERUR3ZIcEFUaGhFWldtbXIwY2ZBbHQ3TXFORjMraTNyN2hob1dwZWdw?=
 =?utf-8?B?cXhhM1dwYmc4dmJzckNGRVdiV3c1aFRxazBvMVVYWFE2OUxsSU9EMmxXSmVK?=
 =?utf-8?B?akQwSG1uendSWUU2eVVLQTdJYjlobm02Y1Jtc1IzemZ6TEVLamgyTTVRcjZ2?=
 =?utf-8?B?cTkxb1ZQeTNoYjZzRFg5YWRsblNKenZnMW1IbTVmUmQvQnNIV1YwOFhUeVdr?=
 =?utf-8?B?dzJ6Q29wbnZ4aE1JbzloT1dDRlh1RWtnZ1huTWNWcUxERUZwOWpFekhLZjRr?=
 =?utf-8?B?dU9LUWsvMVo3ZTRsTU44ZDV3TW93UkQxTEFtZFZhN1l0KzZRV2tlWEZJRldq?=
 =?utf-8?B?VnA4bktBTWxqNDdyZU1NWlBrOURvRDRaUG1EQ1BNYXRTUi9QSnV0T3ZPeERO?=
 =?utf-8?B?SVV3dG03YmlQbDZPN2xVejJKUm1LaEtJenhyVEF5SmprbjB5akc0ejZuQkcv?=
 =?utf-8?B?WEs1RkR6MXF0ejhnd0FHRE96amhLejBXOFltdkJhMGtIaDdTSXF5Q1BXa0tG?=
 =?utf-8?B?RGw2SCtabzA1U1Z4SlVPYlZRR0NTUG9naEdWNHdqSFFFcHVsQ0FlZmY1VUwr?=
 =?utf-8?B?LzgyTGw4OWt5cUYxUENIcWJCT0dnVi9taENESjNVWko3amVmWG15anYzczNs?=
 =?utf-8?B?ZXlhbzVGTkF6Y3pIanRvS2o5MzFBbk9Eb0tsSUF1QXdNdGp0L2x2N0kyNlVV?=
 =?utf-8?B?SEQ1S0J5SHZGSTZvdmIyZktDdjFxNTRaTUJJNEtpVFlnQU5ZcklVcjJhT2Rs?=
 =?utf-8?B?WXdvTTF5N0pZZ3hVL29VR0ZKeVkvd3R2MzltdHNTaTZZWXNQVGtrbFVYeVJQ?=
 =?utf-8?B?dG1DclJYM0FDVDJpUldVN0N1bHhDajIrUEFTVTc1QjBJeG5kQ201enVXc3ZP?=
 =?utf-8?B?b1FSMzlSbVA2WW9yd3gwQm8vcEdzaVRCQURQWWpQNG41dk5jY1BVdGUzdC93?=
 =?utf-8?B?ejZacG96SDBXb1dYd2NMMHNoQ3V0R3k4QWc1Z01NZWxXOVYwcSszMVRhQnUy?=
 =?utf-8?B?NmdSRlhuLzhVQlp2cjVLQkFiUWpicVR3dVRib3BkcVgvQXo1TVVCT0Y2aDdv?=
 =?utf-8?B?TTlneUp3T1Z6SWhaNzhUL3hRSUhQVFkxQlFuMVdXTlgwKyt4MGFoNXN1OHgr?=
 =?utf-8?B?WkFES24xRUt4bzdUM01xRGZqK004cnB1N2poVk9XUHRFc2dmamNYcVJQc0FG?=
 =?utf-8?B?UnlhMlBKUk5XejNNRVFFemRhVmVwQmYzWmw2dkhNcHhjZTQ1eDRmemFLTjUy?=
 =?utf-8?B?QXcxdmNnTSt1MGNNTExJa05kVTJlUEhIb0tvNTd6RmpRcmZwam1ZQ05naFg2?=
 =?utf-8?B?WmpIR2RxY205S0haWnA5cE04Q3pXNktiRU1BUWxFczdIUFhBSDM5cFU5MGxt?=
 =?utf-8?B?YkRoSTg5WUE5eUNHY1FjUFpSbitYSGtvdTNXSEpYcUhaWThPYXJmMnJiMnYv?=
 =?utf-8?B?RlM3Y3gyNER3Ry80T3BMeXBabFVVbmFzcHJtbDJGVU45eS9JUnJyZ256S2h3?=
 =?utf-8?B?MGhaa0o3RUxmRjZOMzc4YklOYmpJbExqREpkYm9xMlcyckVtS1c5RktCcFRF?=
 =?utf-8?B?RG1uTDhqNm5LcVJhYUhMa28yM044bGRmbVc4elFDYTAzZTdiVHR1TVh5RnBM?=
 =?utf-8?B?NVJVT2pBazBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZnS2pWTDVjdHZ3U05DQWU1UDVjZ0NWQjlmbWhXRkMwWjdjbVhlSnE5VnY5?=
 =?utf-8?B?R3FHVjRlU0I0T0trVnRQS0RuTlRwUVl4TTBQV0o2YzIxaGhRVll3OFNCR2lM?=
 =?utf-8?B?d1ViTUNMQllnYnV2R0NIbHdwODlvdDM5aUgxeWhEV0E0azdzYndVNzZGVUVI?=
 =?utf-8?B?KzJYUEdNU3JLQWhFdUlqVWxWT2RwWFJFeTQzYnhMdW1VNEVoYzFsbXNZU0FE?=
 =?utf-8?B?SSt0OXZjQmM1a3prZnpaLzZ5c3BKemVqQmd1QVJXakttTHFNZU9NNU40aGNC?=
 =?utf-8?B?OTZUeG55TlpTblBuTng5SEYxeU9kd1BzalI1U082TDZHSW1EcXYraUpORzFv?=
 =?utf-8?B?NndIRm1BUUE5WnhpWTQwdE5veEdyWHVlYlA3V2E5TFVWVitOR2VxT0lqWEdh?=
 =?utf-8?B?bElCb2loZ1VRdTJ4Wm11WW1pUWk4dDFWMkZDQnlOM1VwREFSRC9vTGpORUQr?=
 =?utf-8?B?c0NBOTIyZGJLeVFsRmtUWlJFM1dRZVNHKzZ1eGxWN1lKalZ6ZWpodCtFQ09S?=
 =?utf-8?B?M2FiYmVlbytEcVZJalZBQ2lrSHZyM1dWMVlSa3llWm9JQjRNVTd4dGZxbm4z?=
 =?utf-8?B?aDJPY2xIVHFHMXo0U2FMQ2NLTzFrdlk3KzQySTVZOG5QOTgwNW9KN0NYOFFZ?=
 =?utf-8?B?b1E5SWZPZ1RVMUQ3WGVxcld4YStxd25kZjVOaXJuZUtTSzR5NGFuZFR5czhH?=
 =?utf-8?B?QnFPejE3Y1dhdkFtVTU2dVhpN0pSc0FNaW5LazBpdUJjTmNYOTg5TkgvazBt?=
 =?utf-8?B?Ulk3bkJkaFREdFZHYys3aWIyOGVUUW9oeThUWDhZUW1UTFQ2QWRDY0xEYlNS?=
 =?utf-8?B?MlpGdTlkRmpCQnNkTGtzOWdQclcwclFMc0hocnVrcGVxL2xnOFh0THo2dkNv?=
 =?utf-8?B?TlNKVGlSYnE1YVQ1VWJCc0xkTkM1U1d1UG95aTdVb3J6QUpsL3JURkM1WDVC?=
 =?utf-8?B?NzdoUEIybml2SEd1STMvV0RLckxZMEVkcUpSMmNlVlNsSkVsc1FBRlM0bzZv?=
 =?utf-8?B?M0V5N1ZWSFZrTFpBSWRwMG0wSncwZXFONHBaSXB1aUhVK1d0M0J3MW5mTmJ1?=
 =?utf-8?B?MERTYjN2MWhMTlEyNXlIQ2NFM0szYUlPcVgrVUJiZW5yeTJITWlDOVI2MFd0?=
 =?utf-8?B?cHY0ZFZyTUlQTFpRR1Jtdk02YUtqdVJaTDF5bVNrZ0c1RTY5aDY4bG1HdWZV?=
 =?utf-8?B?ZE5HRTh6aVpJb215eUZaSG9adUFrb2pKV2ZzSFR1SFpGMXQ1eXRITC80RldH?=
 =?utf-8?B?MlNnbmIyVHFRdEtQNTV6RWdVRURsVG5UVG4zMVk4cmFPYWt4OFp4VjBvajc2?=
 =?utf-8?B?a1JRSXpoNU5XbHZoVlFJYXBON1JwcnNvdElFOHJ5WXRTdmJhVDZ0K0k3RVU3?=
 =?utf-8?B?RStmWWRaY0RmOTh1cHdid2tBdW5RQ0dIV3JmU1VwTXFFaHUyT2RUMEdlTE9m?=
 =?utf-8?B?d1lJNnVWa2syTFJtQWpOYnNzeWE3cFVRVWhUSkcyY0FhMUcvZU1hLzg5OG9R?=
 =?utf-8?B?N1M1YlBlbFJsRFhLQXFhUjJOUW1abXpFWm5QVHFORmd6U0liVjdYWEg4WnZC?=
 =?utf-8?B?WThoSTdjTmhCcytZNTZndUdGQmpna1M5U2NuMElPc3N6RXhoZVpka1UvZExF?=
 =?utf-8?B?aFc3dUt0UFZWNkI3WEIzWEpJNmJZSUdGUGx0QXVHaUxaMk94eS91YzZ4T3hu?=
 =?utf-8?B?b1Z3bzdObm9PRFN0Q1ZYS0YwYnB2dHNQWlZEM2NtTEoyZ0RyMythdUdGOENK?=
 =?utf-8?B?OFpIQTFaR205akdaZW40aXU3S3RkY0FZZ1p6Z0dOQVdvVTAxZE5tdDVZOUl5?=
 =?utf-8?B?T09iOCtMSjQ0TVAvMVRCYjNYeUJ1UGEweFJ1THhCL1Q3NmdhQjlDUXNUbFA3?=
 =?utf-8?B?djJlY2JxTVcvMzBsSzZTSGtaNTJDTVIybEFjZTRwSFVsNlJJUVpJR0lobHNw?=
 =?utf-8?B?UUdKUzY5RWFid3MyRXljQ2tLZHRSVzFiNURiMTFZR3BEWjcyQVBZUzdibGNT?=
 =?utf-8?B?MndkU05McXpjbDd4YkhTK0pOKzQ1dnNGbFc5MllRUWVya0dmVkc0cGhMWUM1?=
 =?utf-8?B?b1FFcG5JdjFiWVEvanNrc2hGZEtUQXhETFNkMHpqSmM0Vlo1Ty9rbGQ5SFRJ?=
 =?utf-8?Q?7XfIPAxM6SfQbQXdSj4MXTEtL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e64cceb-13ec-4b89-1dff-08ddae6fcc65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:55:35.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+ebL5Fb+FySYTabMyaXJ84+Iwe12zBTvMEBFKPU18Bw9lMQiGyucCbSPfycz2OD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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



On 6/18/25 11:31, Jocelyn Falempe wrote:
> If the ttm bo is backed by pages, then it's possible to safely kmap
> one page at a time, using kmap_try_from_panic().
> Unfortunately there is no way to do the same with ioremap, so it
> only supports the kmap case.
> This is needed for proper drm_panic support with xe driver.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Preferred through drm-misc-next, but feel free to merge it through every branch you want if it makes thinks easier for you.

Regards,
Christian.

> ---
> 
> v8:
>  * Added in v8
> 
> v9:
>  * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>    from the panic handler (Christian König)
> 
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h          |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 15cab9bda17f..6912e6dfda25 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  	return (!map->virtual) ? -ENOMEM : 0;
>  }
>  
> +/**
> + *
> + * ttm_bo_kmap_try_from_panic
> + *
> + * @bo: The buffer object
> + * @page: The page to map
> + *
> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
> + * This should only be called from the panic handler, if you make sure the bo
> + * is the one being displayed, so is properly allocated, and protected.
> + *
> + * Returns the vaddr, that you can use to write to the bo, and that you should
> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
> + * is in iomem.
> + */
> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
> +{
> +	if (page + 1 > PFN_UP(bo->resource->size))
> +		return NULL;
> +
> +	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
> +		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
> +
>  /**
>   * ttm_bo_kmap
>   *
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index cf027558b6db..8c0ce3fa077f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>  int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>  		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>  void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>  int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);

