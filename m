Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FAB1E401
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8C310E8D0;
	Fri,  8 Aug 2025 08:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdNeqGVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F090310E8D0;
 Fri,  8 Aug 2025 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754640186; x=1786176186;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uXH0QSHJip4NSs25LXBtBBm4DBay2dibGzQ8SQ+2vRQ=;
 b=VdNeqGVYCtOFRzWv6a+yohlCCpIroxnvCc4fYzTcFtXoUEhxD3Zs7O6a
 MRUXF1JuvwTVGtutWQdKSHBtds4vKf7FCwwXYTunpB+ePARkCL43Rdhwe
 S4o4LuGn4u4wfXuyH3AgP17u2hGD2B1dViTla32wA/XyBo3vPK5T1yi1f
 uahPRLFP5JbszRQNQ7fdVLgvRKvb+XatCdMZlgaKiF/XwW3btlwdGpw94
 V+0SZKtMjsdGWlh9F9e0sTnJAJlPXMRukNclrdwVTRVQwBT5QtotfNIIh
 tFELWB24fxx+P3H/zMa3zhDPrrNk5p/Oe9bxFByEoOdV5yDtom1PJVIzU g==;
X-CSE-ConnectionGUID: pj3HDDgMQ5u3wAdd6/9vXw==
X-CSE-MsgGUID: VJKEwh46Q/qqIQ8pmnFP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67577269"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67577269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 01:03:06 -0700
X-CSE-ConnectionGUID: ww10At3lQyCWouhDLCvr1g==
X-CSE-MsgGUID: LGfurvHrSDuDEFc4fjbTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196099811"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 01:03:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 01:03:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 01:03:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 01:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgABAqUQoK4Aa3nAM25EOaqX0eg5bLBjDFCQTrhOWAO+OZEPrM7zCZpKryaTnOkUjRybts0dzW01Zd3t5zXSnMLT0Fg4Kr8q8OoS+0875yiUS+5/xe9NgbVDvwfiB/r5RKd3eBeHZ29jJg2m/5Po/fR0kOe52AagJBFTLsPydY3jh8D+gsLR8xgrRQHH5JiUMs35TZPOpulFPL3kLH5pqLs3F+m4x13ldz9WtMa4K9xiJd9A6QphUVF5VThz/fde/0U2tJ4U4pMRWJKy45EQ0sAqnODgkRrDDPVrz/rw/wRe4LvOZOJLzCJ44T2gbh2ly0Mc+evCDN+673O/4x2byA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oab+EbyDN0q1a7CTDA76xic1nJHlVjIVh19JopkI5DA=;
 b=Re2LIxpESkpePbQeBJrfUZBi4tGSiU2b5rBEpk4QowKPPkJk65FhOXlIO2fXD0zgbJtLeYuPj+Vb9fJtSLf2uIS2etXPfU9J8vk9Jxmo1upZe0c5yIa0dNgBzV9SK260t82dbXDC9rx4BVOBOVAhX8L0g8oWwO4Vh+PuSi6wdcwtCgxHJ9fBuoqJ7j11+v/qPodeUG15UzF93Xf9bzA893VLMvM9lS4d1X1+jl/6cTANKgPUqctRGGhy2YSuh2haaJJBP2kvgxmicgifJlbrPZu5nBWgWdRDWK1aKde7uq2h6bqU2f+raPAN0w2KuKAjICqUjMckQ5eBefc8mBJk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Fri, 8 Aug
 2025 08:03:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:03:02 +0000
Message-ID: <d9b5d82e-9260-4cbc-ac7c-5b2606abfd3c@intel.com>
Date: Fri, 8 Aug 2025 13:32:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
To: Maxime Ripard <mripard@kernel.org>, <simona.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com> <aJIb1NbxmxKbUT5U@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aJIb1NbxmxKbUT5U@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e76562-58a1-47da-0645-08ddd651ff04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmRkeFZGbXkvaWpCelo4eUtJOWFTNlVuKy9UemNRSExYOUdTVDNJS01CVG5T?=
 =?utf-8?B?L0NyR3JQc0hMTDhpb1Z4dXh1a2lZaklNeW8rWUF2RFJQWVBYclJQZm9VMzlB?=
 =?utf-8?B?V0xzaURqOVQ4dG1TUmhCM0tyNktRZHVuR1lRZ1MxN1JHSEtpRDVDRHROMXVU?=
 =?utf-8?B?dUpOL1JNbGNERWoyOURKWThWdFlkNUVWWWpUT2NobEtsR3hKam9QRUY1c1VK?=
 =?utf-8?B?YVBSRTF0TnQ2eHNBUkVMQ01ja0hSSkNPbndOU0puMitlMjRYWHpRd2p0R29J?=
 =?utf-8?B?ekRLM1R1dld3SllIRHcwUjdodk0rcTNoZ0xGb2FGMGo1NmpBbG5VVzB3cERS?=
 =?utf-8?B?MGtJTmZNUU5PTHUxMWFBTGE3WnB5dEpnOVI3NnloOU42QzU3c2FHT0JleVZj?=
 =?utf-8?B?ajk0Q0JFQkNpMlJEekdHR09HbXppMWJoNEJyU0h6enRlaThmL2NnVkcvTE0y?=
 =?utf-8?B?cmsxN244NVZvNHNLZEVuUFJMeXJSZkhSeHI0OXo1MW9kZzltSWlMai9wWS80?=
 =?utf-8?B?WW9iR0hnQ1libU11MERGRjVUeE1VSU1MQmNrRElBNStIa3Q2eElwR2ZNZGhP?=
 =?utf-8?B?MlZUTGF3T0J3THFrODdMWTBJTnRwOXdMdjg4TiswRFB3cC85dDh5VWVoYVF6?=
 =?utf-8?B?THlXb2trMWUrenNhS2Y2V0FjNDBGK3BnUFNYVkZ0bFZvNjUvN2N6OW9IMng2?=
 =?utf-8?B?cml4ZXhicUE1Ymk1UDRPd3NZN2U3TW4xWEY0MTA1NkNhays1bGtpZHB5TTZS?=
 =?utf-8?B?Y1lGTGwxWWttUUc1blVZanFMWUpEdHRaZW80QjF1SHhBSmVWUzJMRmw1RHU2?=
 =?utf-8?B?MzZTRFJacy9Zb2VpTzgvcE40WmpMVjdvNFdFb2t1Rk0zNVVSWkpnaVh2czEx?=
 =?utf-8?B?OGhUV2ZadEJjMXMxd0N4bjYrSVpaeGk3N3kxcUJQZ21TOXVLR2w0MG1xVHFS?=
 =?utf-8?B?SXBuamI2dFhnN216U3MrVzVudkNlTnV0WDR0VDJIZFpuKzYzVTJRVDVHZXZo?=
 =?utf-8?B?SndnTzcwTmpIaXNUV0RRWEdjVEtZQWtpYkE2aEM3cjFoVzA0NElLZnlpN05N?=
 =?utf-8?B?WVk3bzh4bTE2MFcveUJUQUp2Qm9zUDJXcDFMY3c4VzJBSU9PMXJpSGI1aXVP?=
 =?utf-8?B?bnVhQWR3Y09WcDB3b3dOakZ3anArNmFtUXNtT2ZLdEgvanVsbnpSSTBKZlZB?=
 =?utf-8?B?bXYyVWk2bitLTzcwbzVxVWYveEh4ZHc1eTVHaU9uNzdNR05TUGt6V25aZkhn?=
 =?utf-8?B?b3AzTW9VSVJXc0JNRG50d1gydFFmQnpPOTRNQ1N2YmlWWGF3TVJNMVhTVklP?=
 =?utf-8?B?dHhyWVR2QUFpQWZDYm85U1pjNjkxdUNwSW9qa1Y2Mkt0SHVSbzJGVnNtWmJT?=
 =?utf-8?B?cjdjVC8xRSszc0xQR0poRStSWlhjN2VUSXUza0lndW1SREtmbDEwRjRPVWE2?=
 =?utf-8?B?cXhlL0RlaHRHUXA4TkpLUTRXeUxUcGRPd2orMHJIOWlTdGs0ang0dlZWN2cw?=
 =?utf-8?B?MVZ5Tlpub3R4ekQ3T3hRcTdkV1ZLcC9JSDJxSmpueTZyc20rYkxoWEp0R2FR?=
 =?utf-8?B?aGZkSkZPdTFZenV3L3g3dzdicTZiSFhFbzFTSEV4S0tHdUFwZVZZNGZua2hI?=
 =?utf-8?B?Q2dINGVydzlYbGVMeHB4UXAyZDMwZDVjK0xOa3RyemhCZ2dhalF2bjZmeUJl?=
 =?utf-8?B?a0dQRFVkT244S2l4N0c3TytSd0hESzQvdDcxVW5WTzZ5VXVCbW9UYjVrKy9E?=
 =?utf-8?B?NFpqUktEcDAzNnEybXlXMEFnSU9USUZKN1ZkdDhZeGZ6allxN3U0ZHdHbmJT?=
 =?utf-8?B?aDI1SVB6eWZ0VEY5TDBuZm9HcFAzOVVHazZCNEJqc1RpaE9IZWR0aG1waDZj?=
 =?utf-8?B?RGFHU1ovamgzSGtkMk1hREFiMHg3R21GMjJ2UmFaV3hGWkgrOXF1R3JWOEFz?=
 =?utf-8?Q?WLEcAsuiQh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJVaUc0TGVtMFZieC9WVlUwSXd0VERCajNNVmlMSEdlVDhvQVpoenUvUUpu?=
 =?utf-8?B?VlB5ZDJSRDVodnBSUVoybWVDN203NExOaUJudXR3ZGJSRk5pbUliUVFrRWhs?=
 =?utf-8?B?WEltZE4vK2l2ZnUwZFhJVE5KdlBkVFR2d1dIcU00TkZqNnloZ2d5V25WWWcr?=
 =?utf-8?B?WEN3RUtMRC9lc2xIRHZEM29jYUZjR09XVkxvWWdUdW5TTG4zeVU3eWFVZXhI?=
 =?utf-8?B?T3VXTFRQRVFSaGtTelBTTWpoNENRMy9QUGJEVE0weFVtemxoNjIrZUxRNHFl?=
 =?utf-8?B?UWlLUk5QNlhNdSs4NE96aWdxN2xUSXpMK0dBMkFFNXZ3b0hHVjQ1dzNydTZG?=
 =?utf-8?B?TWszZ3NDSTJnU0hYcVRJOHFVMnhqUUNRWXM5SVdWU0tDeGJiSzFOSmkxWkVD?=
 =?utf-8?B?aHp6Y3dKNkRtNHE5QWdFU2NqRE54cGx3YVIyWERuTXNGOXJvMEE3N0dyN1Yz?=
 =?utf-8?B?Mkh6V252c3hXbGRuTFVZSElmVFo0bG9jNitZUUk5R2VySWFKSVBIaTBTS1B3?=
 =?utf-8?B?ejZyVnhtZTlkQnpybC8vQlBTTHBib3puKzJjaE43VG9haDh0Y1dFV3VZZmxL?=
 =?utf-8?B?aEhvSzJmdzZwL1dBcFp1Wkd3c2FHMjdzZUU4amVsd0UrWXJCdnJzQXI5UGFv?=
 =?utf-8?B?aWkzRC9QY2tVcDQ4TDJ2TVRwQ0VWTUpKUmVpbnIveXNaNUJxcWg1UGtnKy9B?=
 =?utf-8?B?WkZjb2JXZnhSM3N3TWIrNTQrZTFZOWNFOGY4b1RqeEZUZ0M5MUptZUVuVThk?=
 =?utf-8?B?WmhtbXlFOVl1VHZLcjYzd05VRVFxYkVzbERCb3NPMFFaeC9WbC9rT0dXTEYv?=
 =?utf-8?B?TUFQem9JdnZudnl1Y2NBVHFSTFgvS0tnNUpsNG5MeFJ4S0c0R3ROdnFoREVx?=
 =?utf-8?B?cmI4bmttVmpDODZXc2x6SnRsTVV5bitmVVN3SG5NSE5lYnc2NFVaeThDb3dK?=
 =?utf-8?B?NHhjNTh4emFNdndSL0pacVg2Y1ZtUnFNVXdXNEdrY2xVK1dHSUpoQktPSk5i?=
 =?utf-8?B?eThDYzI1TXcyWmtnMFFOb0RHQ1FSNW9JS2dKaUhGcmE5NkFUemI4SFRORXhu?=
 =?utf-8?B?OEZmSWo0cHNLZEFXNXJHRGJaTEJMTnNUK2pUeVJLakE3cVpVNW5WZVlNTi9s?=
 =?utf-8?B?NXpOaHkrcHBGNlZsWDRXZldJV0pJUUEyZ0lzQ3pLNGFpd0lqRWt4bjVuTDVQ?=
 =?utf-8?B?dTVsN0d2eEpXaXBnQmt2QXhrSlc4U0VxcEFmMWdXY1A3T2pPd2RXNW5uOXdt?=
 =?utf-8?B?RG5Wb0NPd0xJQkxURHBNT09xdk1Id0UxRkwraCtvSDkvQkxoR2FWRHZ0VVk4?=
 =?utf-8?B?TW9qV0VNTEQ2ZGNCbkVleW16S09jbGRpalY0VG9lOFhWODdVczFNL3FNeEoz?=
 =?utf-8?B?MjlodktjQlZqbUdZaGo2aDAwZHNtZmUrd05ySURPenBiemdYanlaWStKSHV2?=
 =?utf-8?B?aG15WEhrTzBrT1hKM0x3M0x2VEZCNXhQeWl6dFNtRG5MVEtVcEpKSy9EaGo4?=
 =?utf-8?B?c0NYWUtTL2FDM2ZET2NiR2JrOTBoTDhKaG5ObHBtMjZsb0tHZEQyVjZzeXpD?=
 =?utf-8?B?WGlpdjE3YW5tZ2FnM0pONm5zc0tLRWZ6b0pLdWdWOW9VMmxsb2VqYVBMMHhM?=
 =?utf-8?B?azlHeW1WUVIwS2pidktqSlFVcEhjZ3pXVHE1V0dkTlE3czBPRlprS2xyNEQ2?=
 =?utf-8?B?VlBOa3hjSzZQNGFtT05vTkZWV0lhUitzN2hYd2djTXMzZURzZGIrVG5DZUxy?=
 =?utf-8?B?cG05RkswcHB4bXl6bWpMNnUxa2xEMTJwS0lGbjFGUmRjU2pQY0k0WU9tb2Zv?=
 =?utf-8?B?Und0MXM3eEFEK0xwakp5MFhlRjNUTFFrV3ZMZFBkUVptMnVjUXdWZTZBdDBl?=
 =?utf-8?B?bFlaV0UvYUNjU1d1RXdjdm1wVlZ6SHlNM3E5ek13eThmVGJLV3krYjJQK1Y0?=
 =?utf-8?B?VGp1R05rZ3JDcEJ5dzZmL2s4SHVBU1B3UXNVU3p0V3FBV2doS0RVR2RLaUZm?=
 =?utf-8?B?anBDMVhJTTh4OUx3UEtIT1lwL05EUTRwVDhxQjdZOFh2MzRWZnRQeXAwT0tz?=
 =?utf-8?B?QjBrdUs4Uk56amZ5NmdKVjl1cVQrR1dCRERrYjBoUlp0cTZyQlZxSDQwUUpG?=
 =?utf-8?Q?LXi8+/kGM0ChxsVxGiXK6Q6Tb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e76562-58a1-47da-0645-08ddd651ff04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:01.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcziXU+BShtdhvgiBbqV+SU42vIn3Q4GCZLox+FPj5KjneDMUetnnpeKIcUA5fPvDwfDN61bx5sgbAmmwRpSUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

Hi Maxime/Sima

On 8/5/2025 8:27 PM, Rodrigo Vivi wrote:
> On Mon, Jul 28, 2025 at 03:57:51PM +0530, Riana Tauro wrote:
>> Address the need for a recovery method (firmware flash on Firmware errors)
>> introduced in the later patches of Xe KMD.
>> Whenever XE KMD detects a firmware error, a firmware flash is required to
>> recover the device to normal operation.
>>
>> The initial proposal to use 'firmware-flash' as a recovery method was
>> not applicable to other drivers and could cause multiple recovery
>> methods specific to vendors to be added.
>> To address this a more generic 'vendor-specific' method is introduced,
>> guiding users to refer to vendor specific documentation and system logs
>> for detailed vendor specific recovery procedure.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors.
>> Vendors must provide additional recovery documentation if this method
>> is used.
>>
>> It is the responsibility of the consumer to refer to the correct vendor
>> specific documentation and usecase before attempting a recovery.
>>
>> For example: If driver is XE KMD, the consumer must refer
>> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
>>
>> Recovery script contributed by Raag.
>>
>> v2: fix documentation (Raag)
>> v3: add more details to commit message (Sima, Rodrigo, Raag)
>>      add an example script to the documentation (Raag)
>> v4: use consistent naming (Raag)
>> v5: fix commit message
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> 
>> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>>   drivers/gpu/drm/drm_drv.c      |  2 ++
>>   include/drm/drm_device.h       |  4 ++++
>>   3 files changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 843facf01b2d..5691b29acde3 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -418,13 +418,15 @@ needed.
>>   Recovery
>>   --------
>>   
>> -Current implementation defines three recovery methods, out of which, drivers
>> +Current implementation defines four recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>> -more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +more side-effects. If recovery method is specific to vendor
>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>> +specific documentation for the recovery procedure. As an example if the driver
>> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
>> +referred for the recovery procedure. If driver is unsure about recovery or
>> +method is unknown, ``WEDGED=unknown`` will be sent instead.
> 
> What if instead of this we do something like:
> 
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -441,6 +441,29 @@ following expectations.
>       unknown         consumer policy
>       =============== ========================================
>   
> +Vendor-Specific Recovery
> +++++++++++++++++++++++++
> +
> +When ``WEDGED=vendor-specific`` is emitted, it indicates that the device requires a
> +recovery method that is *not standardized* and is specific to the hardware vendor.
> +
> +In this case, the vendor driver must provide detailed documentation describing
> +every single recovery possibilities and its processes. It needs to include:
> +
> +- Hints: Which of the following will be used to identify the
> +  specific device, and guide the administrator:
> +  + Sysfs, debugfs, tracepoints, or kernel logs (e.g., ``dmesg``)
> +- Explicit guidance: for any admin or userspace tools and scripts necessary
> +  to carry out recovery.
> +
> +**Example**:
> +    If the device uses the ``Xe`` driver, then administrators should consult the
> +    *"Device Wedging"* section of the Xe driver's documentation to determine
> +    the proper steps for recovery.
> +
> +Notes
> ++++++
> +
>   The only exception to this is ``WEDGED=none``, which signifies that the device
> 
> ----------------------
> 
> Maxime, is it any better?

Is the documentation suggested by Rodrigo okay? Any suggestions ?

Thanks
Riana
> 
> Thanks,
> Rodrigo.
> 
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +437,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>>   be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>>   device of all user context beforehand and set the stage for a clean recovery.
>>   
>> -Example
>> --------
>> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
>> +consumer to check the driver documentation and the usecase before attempting
>> +a recovery.
>> +
>> +Example - rebind
>> +----------------
>>   
>>   Udev rule::
>>   
>> @@ -491,6 +498,27 @@ Recovery script::
>>       echo -n $DEVICE > $DRIVER/unbind
>>       echo -n $DEVICE > $DRIVER/bind
>>   
>> +Example - vendor-specific
>> +-------------------------
>> +
>> +Udev rule::
>> +
>> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
>> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
>> +
>> +Recovery script::
>> +
>> +    #!/bin/sh
>> +
>> +    DEVPATH=$(readlink -f /sys/$1/device)
>> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
>> +    DRIVER=$(basename $DRIVERPATH)
>> +
>> +    if [ "$DRIVER" = "xe" ]; then
>> +        # Refer XE documentation and check usecase and recovery procedure
>> +    fi
>> +
>> +
>>   Customization
>>   -------------
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index cdd591b11488..0ac723a46a91 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index a33aedd5e9ec..59fd3f4d5995 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>    * Recovery methods for wedged device in order of less to more side-effects.
>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>    * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>> + * details.
>>    */
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>

