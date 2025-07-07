Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E266AFBA77
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5EF10E09C;
	Mon,  7 Jul 2025 18:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NR9nM3fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A1610E09C;
 Mon,  7 Jul 2025 18:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xudCv8T82hU9WdZhqJ++UiDQQh7Ey4Kx2lv1fW0ZB1kB/4/lq1+yEVmNEv0S9piGoNa4U4P1V10hGtpxE2TmTLdgVBtDwO30/qiGghIxTL8/tlaKkvjrAK8cL0XC1EC6/1/j4h5fUy/s5byqyy3F6AAjelXf25+1amloiDbWA36Gma4y1vN+FVo5Uo6nvvM4rWWuajkgNeCrGOdM4UGpVebzzJ0PEsTRUGvPtgfXyyTmCbeAt+snlU5HXZzVfi/EixF47AbMpboaG0FjUxneKbQGZG4ndzeYBU+D0Smk5xXZmbAisS8QtAXMvoA7YhP5mQy/VlvNe7DvJXnEIWilng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfC6RXCD8q4pAJdanGl1VwzzfwhMFERO7/qvP+eQwhA=;
 b=TbG6G2rt5BWc0bFDnXNqxJW7OKLJPAVJGFfubk6eZIOUv7zdcdWKphMvMXT0QLf90lbg6KLj41+fnZf2mPi49CAsSjB/3NfgilcfqA7/tjwiNWpIPc4a33LhljGaGm2ggs1E2+uaQUPodBHpRAtMInbHWsJMpWiJ/CN9z9ZtenCKjnNVXo3AnT7pMT//r8WDpVkAHQEg1VLPeKJkTem+7W0yfifpDkGTN7KdeQGs/3X+0Ko0125HpUHwCyBAnyIqpZPhVrJGFA2yhcpK4jp6n/XVH7NPKtOCcbzEsK99nBpbEDT8nedannZaGDk7w2SeV2TV50VgYIz9eneEGWJZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfC6RXCD8q4pAJdanGl1VwzzfwhMFERO7/qvP+eQwhA=;
 b=NR9nM3fgySw7kVYgzT7088oXx0BVue2pUCJLtZMSoQ41fm8eweIRNQxl29ragoLuxS6oaOzzqHjWnCbIGca8W40OoQ2W2AWQlq/XjWjZNT2WsvMTXLzi/eRgJcdTt+sbWFbzaSL6BZjJTYHRxd0niWhomu7WXFHofOcNwRxM1mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 18:16:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 18:16:14 +0000
Message-ID: <147f8f31-cac3-41b0-86dd-28850c0b2e10@amd.com>
Date: Mon, 7 Jul 2025 20:16:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: rename ttm_bo_put to _fini
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250702110028.2521-1-christian.koenig@amd.com>
 <20250702110028.2521-2-christian.koenig@amd.com>
 <aGWsVBA45EVO/yhM@lstrano-desk.jf.intel.com>
 <4a115c5b-8e91-4ce9-88c7-cf3f3f9d3aa4@amd.com>
 <aGv0+LabWlFujT9w@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aGv0+LabWlFujT9w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c1667c-f888-410b-9e79-08ddbd825bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDVQaUpVclJ6Mi9Fck5oMngxNXNoVkFLVWsxbmMrY1NqK3RvV0Uzc29odWp4?=
 =?utf-8?B?MGxYWkxJZGppOWZjbTZtTFl4SHJmNkI2b3hPbnBzNm9scFpUV3QwSHpETDlY?=
 =?utf-8?B?QlNBL0lHMmhnbkxhdFQ0UDRlZ0dBNmtwVFprYS9ZNGNnVDV1Smc0SkN0Snp4?=
 =?utf-8?B?bVJ5L2N1NU84Zk40MEtBeVJRSGMvb2VidXpKN09IaVRKRCtDUnFzWFRISXFR?=
 =?utf-8?B?M1JpcGlLTnpiZ3FSL3h4NUpVdlJZMmNWNFhDMDg4bzU3WXB0OHI4TEVoN2Q1?=
 =?utf-8?B?N0VpKzYwM1UvZlMwUC9Qa3poalBSQ2Myc3Z6YUN5bUt2aEJJOE5tRDR5OUNN?=
 =?utf-8?B?bHRtMS9yZXhQS0ZvWVc4R0tFeGFnTzVodGNRZGVEcW5kM0tuOTJERjV6ejJh?=
 =?utf-8?B?SkU2TFp3Q3BnQ3labW9iWmlRWEFtOUQ4c2FBclE1aUdXVFl6TmxZaUQ3SzZK?=
 =?utf-8?B?Y3JZbXU5djM1QWEvZjBQUEszTFlSbnFITjFsSkVZeVhUeThEREt3SlBSQ0NB?=
 =?utf-8?B?RFY5Z1NiL0hmRjVaVzFrWVlTb3FxZm1WZVlKRDRTRUFTRkI1cWR4MzB2QjlS?=
 =?utf-8?B?dXlyTkRnZE1EN25xcE9XelkrekpzRHU3ci9MSm5Lb29MSUVORTgzM0NBQnc1?=
 =?utf-8?B?eTNVS0FtY0QveFJrMi8wbmxCQkFLSk5ROEFvWENURStZMXNVUjRTOUpmY2Nx?=
 =?utf-8?B?YlZITEhpOVBMbU42b1RieXZPOTdXSU1VWkhmK3I2U1ZSVHdIcjEzSms5d2dZ?=
 =?utf-8?B?TTlsMFlENCs0amVDdzZaMVBadkZEVzFYQVNFdXpDUzFFeU9sQ21VR2ZSdWxG?=
 =?utf-8?B?dVhwN0lodkEwME9RL3RjY293dXlYOTJwNjB6YllyenpJZCsxVFl3d21LMkJB?=
 =?utf-8?B?NEdTYlZUZ0NYQ3VsWUpJZ2tuL2xnbktzR0RBd1piOVN3K3ZHcFNUTm5VRFAx?=
 =?utf-8?B?dHZ3cDgvZXNiQkxvM0M1a1o3VGNqczdka3dyVVpMbmlQWmJBTnNjTkVKTmgr?=
 =?utf-8?B?V0pNYUdkcUt3TnF5L2Z1OVZnTG9YVnpPdVZ3cU91R3NFVGZPYys2R2JBRVdP?=
 =?utf-8?B?L1JOZU4yOEFVWlVIUzYvZjBLM1lRTHd3SElNRE5HSmZSZGMvMmlmNzVPUG9w?=
 =?utf-8?B?VGkycjRNWEdVejQvbHQzRWc1NDR5d1R6NzUwTnNmSGNuelgrK0M2bG55NzJY?=
 =?utf-8?B?bU5peDh6RXN0RVNDeHNEb0hMdXlibHNRbi95Q1duVndCdFRRU1BrQ1pCaTN4?=
 =?utf-8?B?YUlHVlBRa2gveTRTV0cvbm8zUHBqWlFscUJMczBRN25EcXJ4TjNiT28xUHk0?=
 =?utf-8?B?WC9jSzFiM0R0UkZzMVlMMk1aT2FwTytaTmhtZUhiaFZndTlTc2l4NFJJZW9q?=
 =?utf-8?B?VDNhZytpK0E0TVZITmJzUVlZRnJtRXZzY2JiRGhkd05UUmFRZWFlTVRhbHV2?=
 =?utf-8?B?WTN0eXk2eUNBbXlKMUhBemJUVis1dGFGNVhld2x5bmdzZlR4eDk5d2o0MWV1?=
 =?utf-8?B?QVB5ZXV2bVpBL0NxVzNlWndRbzB2TmU2d2kxK2hOSTZUNXJWVkFQendrbEVv?=
 =?utf-8?B?eTVhQm5SR2M0ekd6Vm44dUZ4WVNjYmlYeWRnSWYweWQyWDJkRTJPVVlWTlNQ?=
 =?utf-8?B?RGlZN0VaeUVyaUhwcStZUHBCbzVsSTNxSGkvVGJSc0hsTTM3d3lMNVFmaVFu?=
 =?utf-8?B?QUR6SjIxcVhObFZTR09LMzBaKzROUVM1Q1IwOG1kb2NsRzgyS0o0L1kxMUp2?=
 =?utf-8?B?MnZ5MGFNVE1aSTZyNXFFdFV0UW5zeUpjL3dGdGFGcVdtdEMyTmt2OU5GcXVQ?=
 =?utf-8?B?RldmZUtaREdIWE0yWHRudGpqUlVVelhCeng5aHUyT2R6Mnh6RDg1NHRudzdj?=
 =?utf-8?B?UDRvQUxsNUJQbFJOeDEzckJDbVV2MzFtM3laTE1XWjZYOG1MYTlyYmpvZnUw?=
 =?utf-8?Q?/WRFxe4LBl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHROQzlwWDhJN09Vd1VySHVRT1Nncm5rMEtrVkp3RDJYNVlqK3Eydkp2YlQx?=
 =?utf-8?B?ZkdYc21EMHdTSHpSY09aN2k2UVY0L3FmaHpOamU0cVZjb1NsVXpkZzdHYTVr?=
 =?utf-8?B?OWdaUXRLa2M0Qmp1WGlGUUFtZ3dQWm93MU51Q01IbU1yK3JHQnczaDNKcUpG?=
 =?utf-8?B?WnNjUzl2NjlMenhzaEJJUG9oeFFUWHRqYVFzZ3hPdm44TXlyVEJoQTA4eHNQ?=
 =?utf-8?B?R2ZiTjNCN0ZmdmVzazdmdG5QdXExME5xbURTVmUvNTNsR241eVhyVEdoZ2pK?=
 =?utf-8?B?bG5sUDJSWm53S3hZa0F1WlEyU3gvZm5oaVN4SWVabVlIcG04dGtsa3B6Kys0?=
 =?utf-8?B?RHJyZDdIRENXWnU0VjZkaTNwZmUveUV3ZHJkczEvQ2NPcVNnOHRzMXZpZjcz?=
 =?utf-8?B?dTEralBNSGRtOEg4Wi9nOGN3b1V4L2RkeGI3K3llaE1JTFhZNStXK3RPUFJW?=
 =?utf-8?B?VGRKOW01SWVKY24yOXk2cWNJRWwrSjBDbzZSeWQram14TnUrdkI0aGZSRWlM?=
 =?utf-8?B?U2pLRFhLem1SNTFoOGR3VFZ3c2xmU0xrZllwWFl3eUF2aVVTTVM5WGVSSlFn?=
 =?utf-8?B?bHdubHlCZk4wVWRYNms2WG85akd5SStMZ0ZycElzdm1MTk9McFpyNXd0bDd0?=
 =?utf-8?B?S2RSNUV1Z0NPRFZnNUtWdjNzYmpQajBZU2dxUWpuMmZSWWl2MEJaZmdCSmdR?=
 =?utf-8?B?ZXp6ZnRSQm93ZUZ5cloyTThBdE4yYnA4TCtsK0c0LzVFeFY3OWR2VnJZZnls?=
 =?utf-8?B?UW5LdWQzWkhPeXA3d25hdzYrelFDc0svL2trNjZiV3htbU1pTlRJSC9FZmxy?=
 =?utf-8?B?aXBxbHRuZUlOM3BVMCtmb0xtV2tNUXhNTThmbmVoaVhiZWowQXp3TDkrM2Fo?=
 =?utf-8?B?dDQ4U2dETFJUR040aFU5ZUhmWUZIdHZOZ05Lc01LT0F5TCsvMytSaTZTYWFm?=
 =?utf-8?B?ZHdrS1Vyc3ZwcW5zZGd5a3FaTUM2Nkg1enJUcHB4a3h5RmkwTi9sTVpYL0dj?=
 =?utf-8?B?bkNGcmtqcVg3RUdFOGVzWWtUSnhvcmNPeUFwQUlmNS9nQ2NZUnNVQ0s5em1K?=
 =?utf-8?B?OEE1U3MxcXBLTjBxQ09rS2JVazV6alNqOGpENkNXTmUxY1p0ZmZtMEJKbmdj?=
 =?utf-8?B?RU0zNFBvTGhtOXdFTUtJWlBJNkthaFFXOU1yVWpkbGhTUG5IRW5adW40Q1VM?=
 =?utf-8?B?SkZxY2dTT3dORkFYOUQyZGo1TWh2MUJuRS81bkZNcWFwbnRTamFDVHk0eG5R?=
 =?utf-8?B?cFd5WkJvRU9rTFBSaGJMZ25YMmxaaXpGUGVSVTIwYm9HVnN3MU1uRnpBbTFr?=
 =?utf-8?B?NFBXLzRSYk9GdmJmMDVIMWpNaWM1R3ZENlZlNU5iczU0UUMrZnZ5V1dMa1RO?=
 =?utf-8?B?SG93YndhTTlkRThYOG1JNlZ0NzhwT0tYOTFwdkdEMlB1S0dLSVJON1ByTS9x?=
 =?utf-8?B?dkw5UFBPeWM5QmVKc3gvbldDeFVDR25yQ1FoOGtzOE5acm5XYVovb1U4eUNy?=
 =?utf-8?B?TkNPSHdNcnVxUVpCdFN3cDF2ajFXT0xrZ3ZBYVJicjhsT0E2bjhyQ2JaNnlq?=
 =?utf-8?B?WGRoSGRLaWZjc0o5ZjdoVXNGdTJOUFl2NXFialpoRlJtY2l5N2daRFphYzY0?=
 =?utf-8?B?bXp5Wms2NElOM0laMXRoTHo1VlhDbnMxajdJS3BrUGhWT3hoQytxbE0raklr?=
 =?utf-8?B?KzFvcGdiV1Yxa0FYalBDWGZISzR6enZrSHJDaWdWaXBKd2ROV2NHdHYwc2g3?=
 =?utf-8?B?K2p4dWpVbFUxZVFiRnNDTXQvUlFUQ2h1dVgya0NNdTkvTVcwZ2xoL3UxcVFP?=
 =?utf-8?B?MW5xSGZuQ1phdlU4bVk5T0ZpSE9QQUtrMTZjL2FrRCtNdjZHZUc1SlBEWTV2?=
 =?utf-8?B?UzIyb2owbjhyU3NicTJCa0hmenAyL3dIeGxPdlQvOXc4a2FlTm44SDlhd0Vp?=
 =?utf-8?B?NU9ZUmVQWUlaaG5WbDQyUTFtbGk2L3pRaThyVTNtR0tXVWNCcXZMS2xpU0FE?=
 =?utf-8?B?VFZvRmJPVUh1R3g3WWtFenhySG01cVBBV1pCbW1VVDZpNCtKNmRlMWlaVlVP?=
 =?utf-8?B?cldQTnMvVks1UEVKamszdllGMWhuOFNvOHRCWHJUSENMZmVKYWZiZXlvU3BY?=
 =?utf-8?Q?KmRr+SDIs8IjIDQFqzxafSvg0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c1667c-f888-410b-9e79-08ddbd825bd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:16:14.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYpYOiseVoGUT84Dc8SC31mhtvHqTBLk0MJoJHkkgUkBEM1DfIqVwDDlH2Wo4A/1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
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

On 07.07.25 18:25, Matthew Brost wrote:
> On Mon, Jul 07, 2025 at 02:38:07PM +0200, Christian König wrote:
>> On 03.07.25 00:01, Matthew Brost wrote:
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>> index 6c77550c51af..5426b435f702 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>>>>  	dma_resv_fini(resv);
>>>>  }
>>>>  
>>>> -static void ttm_bo_put_basic(struct kunit *test)
>>>> +static void ttm_bo_fini_basic(struct kunit *test)
>>>>  {
>>>>  	struct ttm_test_devices *priv = test->priv;
>>>>  	struct ttm_buffer_object *bo;
>>>> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
>>>>  	dma_resv_unlock(bo->base.resv);
>>>>  	KUNIT_EXPECT_EQ(test, err, 0);
>>>>  
>>>> -	ttm_bo_put(bo);
>>>> +	ttm_bo_fini(bo);
>>>
>>> Intel's CI [1], see Kunit tab, is indicating an issue with the
>>> selftests.
>>
>> Even without any change the ttm_bo_validate subtest is crashing for me and I was about to disable those crashing tests.
>>
>> My guess is that the test never worked 100% reliable and relies on some incorrect assumptions.
>>
> 
> Hmm, this seems to work in our CI pretty reliably but in general I am
> not a fan of selftests, particularly ones so fragile that any small
> change of behavior breaks the tests. If this is indeed one of cases
> (testing really specific behavior), fine with disabling it.

The ttm_bo_validate_test is crashing 100% reliable on my build box.

Skimming over the code I've found at least one incorrect use of locks, but that doesn't seem to fix it.

Going to take a closer look tomorrow.

Regards,
Christian.

> 
>>> Unsure if this suggestion would fix the kunit failure, but
>>> would it not be better to just ref count gem BOs in the kunit tests and
>>> create a mock drm_gem_object_funcs ops in in which free calls
>>> ttm_bo_fini? Then in selftests replace ttm_bo_fini with
>>> drm_gem_object_put?
>>
>> Yeah that is one possible solution I had in mind as well, but I thought about disabling the failed test first and then discussion with Thomas what to do about it.
>>
> 
> See above. Yea it Intel's main (IGTs) CI work, I'd say there is about
> 99% confidence that the changes you are making haven't broke anything.
> 
> Matt
>  
>> Christian.
>>
>>>
>>> Matt 

