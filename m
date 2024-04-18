Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5A8A94D1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9291138FC;
	Thu, 18 Apr 2024 08:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqVUSOhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421921138FC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713428531; x=1744964531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uT+KdUnZ26t/GM0TW+0l88PHH46OjauwUUmdO5AlzSM=;
 b=HqVUSOhVrqp5OdnSrW1Ld3nR9/zqz4leRyhX2pVgIKA5B+ntVHK7c2fc
 wnF+ExJG+kpntGFZBhjil920WTKkVYsHf8lv7+JCXt2mkYROLawoVRoKz
 qgi+hcjtW1G90fRBPBTWrG84sryGVgzmGaII2apZisAHymLE4BL1sgiXL
 Fjr9sfG3mxxxWHNuwrrTZPWlY3tDPuMIIKuRArVTjuO4Duq2N/Cr+raYG
 mMO9w0O6R6fO6pKEMUPcc0F26/q4ibhxDXImXsLRKCi9DtT7U4DP+JujS
 Yo/WJtcj2JsOYTPnTn3Lnic3HUJJ4yqI6ppe2+eL8Fkx1CrmrYvOvf4CP A==;
X-CSE-ConnectionGUID: nJapz8owT1+xTrFnQ6VdhA==
X-CSE-MsgGUID: A71pJdtkQyW4Wt1aZTfsrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8834065"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="8834065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 01:22:10 -0700
X-CSE-ConnectionGUID: MLb3OC/mSByZ/72IAWuUfA==
X-CSE-MsgGUID: AqlQQfT8SV2YwMzTYvqhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53841473"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 01:22:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 01:22:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 01:22:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 01:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4fOpEzXkafdorJNm6eqnSLAjNQFDOihZk6nD/qk3XRO5eU/61Zm3D3V7pOd8R9HZBRb9P2eommvik7hJj//d95Sy2XKVLc/RWXLRuxEJR8yM3DHh8DoAUnCR3lt2vCpsHNCOWa8ioyf/46y1YnQXi9lqOcF+Lt2jRDiEuKyEvAtvPEfw8RHo6kPVXT8qsKKyX1rQq/VO5ueswwj/aFzM4nyS+m6k+M5kizNbl9C0AKgMTGOUVqYzbBBGZ1nImBpcuwnKjfLGMolVvEuCEkJtIinbsBYOQXIcSLxmhteZ/yDQ1uS4L9mbGbNyaDopJcfkCc5zE4OCSR5YPkvjEH0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+xIzqz0KEkI+sY5HGyaBBe9u/xVge7OBjYD5oHZEJU=;
 b=JUDQgGnr2cBRuk4HcOeYaoOmwOR5qVeRFSmFbuK1W0CLaM5TqUEksOU6W4E6tVV5jWvRFec09pcbxWI+mBO1EW0Mj7rCXirVdYcquSQVV+ReHPAhZdPhtPg0jv1chFGoK1HvRPP8wA5Y64aX/dNDjhrJU9DNTNgJxkQdDDgYiN9k+0yzFXOcXSi4RW+2Add2BaNHDXgKCt7wefZbqIjix01RUIICJ9xPEB9QQusExhQn0ExSTRkmJbHow5fdYAvLvfoYC5yfXLhZswdFHJJWCRmWw76ud3fIgc0Ru7uiZukkZIY6AOOA4iKtuuKqsNCQYIh5LY3wVEcHPrhe9qTbxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 18 Apr
 2024 08:22:05 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7472.025; Thu, 18 Apr 2024
 08:22:05 +0000
Message-ID: <1d2d3dd6-e683-443c-ae6d-a0a864239ebb@intel.com>
Date: Thu, 18 Apr 2024 10:21:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/10] drm/ttm/tests: Fix a warning in
 ttm_bo_unreserve_bulk
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Amaranath Somalapuram
 <asomalap@amd.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
 <4b5a19219e4a1313fd438d52431b57cb7b77b34a.1713357042.git.karolina.stolarek@intel.com>
 <2cdbb374-c4e7-4b2f-8ede-459ecc0224b9@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2cdbb374-c4e7-4b2f-8ede-459ecc0224b9@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: c418d647-a662-4369-9464-08dc5f80a171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xr7GABifmgzDssvMgvznlVnf6CpUwzB3MLaMrGW7vosQlPW5aMwlW3nlTpKRF2BTfezGBOL7rM8kij40JwPfn/TZoIXPof+amca1oqMH+iRUx+hkkvMbl69l8R3/bNOFrppIZTzxkwf30t407hy1TkvNtH+mlv5Qvisxx6OquTuUJtJvMpSX1ZeFcDzZ/lleU8kOrhY8OGHtnMxlKThE+S0Qios/gCq4LDsT2sFdNwW3M3STXH/zPiXrxdwCfdOf5vGwqEM4wmp4CmjJI6p5+iNbL9Huola1GmSQsb7XPSAEp4j8edZVz9e0sBozAV09Z/c0r5/dB5mlDA27eQsCaQlsig5Hu6LzGF/jGD4R0fJn5xyn9DMOVHbY3Y3R7oRT8ZIC7uVE2ISIy/GJ8bV3vYH4rGibeu6w6qD/UfDVZuc8rAo0iNWXrakmqh8xoshmLoPglT7bRcu5Eux26D0YNAiunGWU05QYCMAJIP/1kuuz68dVgiGrYCx6XEAeFB3tYIZu7I0tEqQVeu6E1L4Ur7Ke8N0phZTqiZGp7zeCKjb0OPLN4J9NiWj4m6uYjHWs6+WUiXmqKaaRjAdrlOIMnIPqExAaVPhHC58ELSIkY9h4wNKAuxaoExGx9y4701e4aLpusfeZebXtHPcYpKM1LvqsJzQFUd8/dJ4n8L6OKLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCt3b1VoRldZQ0ZOdmZBUWdYeFhQbmhoSHQzSkUwbzhWOU5BUFVhWkVncm9m?=
 =?utf-8?B?NXFmbVViOGVUMm1WN1YrSEQ3YUVsYzRVN0dxakczYnp1Unp1aWZxYmpiOXZV?=
 =?utf-8?B?R3lmVnRuemRoR2NkckVLU0ZQbDFkdHBiWFo3QndzMHpDRVpYdFE0MDlpSFVW?=
 =?utf-8?B?ZFZ6bHdkS1EvaUVZY1NjNFZQWTc2TW5OVXBmS0ZxY2ZWUVc0WkZ4SU1IMTh2?=
 =?utf-8?B?aWFzaitEcVZoZ2JVNFQ1N3JRZjJkWDJqZHF1aGw3Snhybzd4Z3lrRThBQXZN?=
 =?utf-8?B?d0cvQlRma3pGbEtFQkpTempuZTNlaGV5eG44L1RaaHdTNGRmc2JZN1YvZVRp?=
 =?utf-8?B?dmU3cVc2cmZPYzJFMExjNkVNZ1ZtZU1HcFdWUHJoWmJUVytjQUJqOUNBQWF3?=
 =?utf-8?B?UHlqbnU4dlFxTUVRRU5OT2pZSno3WS9GYlBKSkVSOXJMQ0NJVkpMZEU4SE02?=
 =?utf-8?B?R1I4eXkxbG5jV3RJcnBpN1A5czB2Q0Z1MXVtN0F1c3U2SXd4U3dvMHZabnpQ?=
 =?utf-8?B?WENZaVIzWCtoYzJjRUtaZXJTREw3UHVKalRSUjEyeHh2L0VBMU11SmQ0MEt1?=
 =?utf-8?B?d0ZaZldFUlBYRWJPa3gzU3Z6Wm5MTjJ2aHRBM1BKODJpNENTbmNubjIvUlZ5?=
 =?utf-8?B?dUNQN3JsZE9rc0l0STVLMlVmR3BlMnFDMC9EZDM1NlljVjdsNDJSVWpCMVhj?=
 =?utf-8?B?VkZudFR2QUdBVGlHWmlGOHZ1UlAzZUIwWWtiWkUvR2hzeGVDODdyVEJ1c0Jo?=
 =?utf-8?B?cHh4WldaRmpsaVdKMUR0ak9INWR5MTRaL29YaGhaNEtUOGg0S2dGVUkwQ3du?=
 =?utf-8?B?RVdaelo3TlJ1T0duamxWY1NsOHlnQTZxRVVFc0h5bDNsekxmMnNQaWo3eXZU?=
 =?utf-8?B?NWlBMmZ3Y3MvekkvTGNaZzFoejlKQTFtNS9OL21PYnRMYmdXdWl5RnB1MUkw?=
 =?utf-8?B?SDVqSjh4bVlFdlFvdVorVm02VGNhaDB4WFAwMDlQcGFvYWMrUFh4Yi9QNStZ?=
 =?utf-8?B?UGdXSEVaMUlqUmRaMVFub2hVTlRjYVZNMlZ6Y1RUOVRDZmRsUy9jSUN5Wmxs?=
 =?utf-8?B?MS9uR3A0QXRSSHpvRFhTWUlJeTQweGV4NjVMbVowdVN4bm12eEFha1VHR2VE?=
 =?utf-8?B?QXQ3S0VvYXpCSEcwOEZEQVpjRWFqMTk2Vjc4YUxhRmFqQjNtbzRHRFh1eWNp?=
 =?utf-8?B?dmsxUGpvQk40U3BqVTl1Z2pQM3ZsTTJYSTRySHI2NEdhVFI4UXk4dlM3RktI?=
 =?utf-8?B?SnpZU2NnWjZhYUdOVWVBbGpwSmhVbHIrU1FPZyt5cDkwYTNUV2hDYThpUzY0?=
 =?utf-8?B?cmNHTTRSU01kQkYwRmNHTmVuRkx1ZXdxZVlTRWJrb3dYYlVpaTVyN0VtRmt4?=
 =?utf-8?B?OVQzam94UEJvUXV5VnV0RzZhUHgxSW5ycXNaOGZTMDBGV2NhekwwODVvUW9r?=
 =?utf-8?B?Y3ZRZndEWG5INndyTWEwdy82Z0JjeTY5UjV5dVlkWVZaMWRueEhjRlhmak9E?=
 =?utf-8?B?UE5sbVJhSVZaMWdXcENDbkxuT2ptU0lBUXpmRmtEb1czNS9aMGZSZ1liZEpx?=
 =?utf-8?B?aGRaeVg3aDlxcm9tbGMxRi9wRHAxRmRaWU5xK1Ftclo4S0dsLy9LaDJUd1Zz?=
 =?utf-8?B?NUE1UFJkUDA4aE5OMGh5VHJCdkNoMlZGTDM5Ym5RZlZCVHNRaGgzQjMxUXBN?=
 =?utf-8?B?dUNDaVk4WW16M01CZFlSZ3FlYlBUQWNnaEZFWjY2TFhTQWx6YWNCMTRSUDFh?=
 =?utf-8?B?Y2I5UjgvdER4ZEFmSVFvdWpLeTV3a0l0eXZkYnNNa0kyRTJqRE9pUURvRHF6?=
 =?utf-8?B?bFkzK3JoQytFS2F6NFR2b1Z1RTFwTFFKZERhQXZQSi9xdkNtUUgwcDJyS1d6?=
 =?utf-8?B?aW0xSlRReW9KUy9rMGwzN3czQVB2STdkWHprNW5DYUVrcmFsa1grZUJXSDlE?=
 =?utf-8?B?L005eXRHdjEvRVlaSWpjRUduKzlmNk9sOXhkV1lBVzU4Z21FckVIUjNPY0xa?=
 =?utf-8?B?Y0s0ZFp5cTNWSEY0Nk1XTVphcjQ1WXo4N0hRSE9XN0xoKzlrenM1VmwwckRT?=
 =?utf-8?B?UjdaeFJ1MmQ5NWtOZEN6Mis4bnZJMmpxZ25BSUViV044dkNld2dDQVJuK25X?=
 =?utf-8?B?N3F6WGVlYTZGcEpUcERNVjNlRmNLRE5oM042VWVQTElwNklMUS9hTS9SSllZ?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c418d647-a662-4369-9464-08dc5f80a171
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 08:22:05.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4J5lQPDaKBif4rvSOIGWA7sRwRJjN4dqlQXWY23/DFOINXtHEDX2RXBwe55A6C6gG9+l5KPcQcnwXwsKKgbyGSgBBfHmVl90eV2lwBILSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
X-OriginatorOrg: intel.com
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

On 18.04.2024 10:15, Christian König wrote:
> Am 17.04.24 um 15:03 schrieb Karolina Stolarek:
>> BOs in a bulk move have to share the same reservation object. That is
>> not the case in the ttm_bo_unreserve_bulk subtest. Share bo2's resv
>> object with bo1 to fix the issue.
>>
>> Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> index 1f8a4f8adc92..632306adc4a1 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> @@ -339,6 +339,9 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>>       bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>>       bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
>> +    /* Share the reservation object in the same bulk move */
>> +    bo1->base.resv = bo2->base.resv;
>> +
> 
> In a real world driver that would be illegal because it is racy for the 
> UAPI. It might work in the test case, but it could leak any fence 
> storage allocate for the bo1 reservation object.
> 
> We should probably avoid that and I would rather modify 
> ttm_bo_kunit_init() so that it gets the reservation object which should 
> be used for the newly created BO with the default behavior if the 
> parameter is NULL.

Thanks for providing the context, makes sense. I'll extend that helper.

All the best,
Karolina
