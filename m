Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMibKPIrl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:27:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F01601E4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7020810E6FB;
	Thu, 19 Feb 2026 15:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNKTkB3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08DC10E6F6;
 Thu, 19 Feb 2026 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771514862; x=1803050862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AzwJ0y3cotmSQbMWIw9ka7MglEsUv4QqOrA/zDesEwM=;
 b=HNKTkB3fxgGEcLimLlrNUTsnQBl96RsdqnHoZtAC1gbRH9UABghwARWc
 mv9F2CDDocjHobs4/MXDfAiKSYEZ68mly+Yckv6uG0RaDd8GKLfoRfdJ2
 nT4UH77bBX7+uh0BBz7UR3Q3cfJCeJOavvl0lNk68+ImWGCmHiAzYyWo1
 nq0/xb6Payy60fpvlzyrctMCIIfNmPv/tJsYAp0uSMw8Oelsje2RwNTjX
 glo+7bAb31IzNEIk78UAbAR18vqHkpfFSXdaJH7OqAhwnrczuAVXVYBuB
 Ms1VKA9Qqqn+y20SLeMuudVMKhfCNGluMZmw2quQ7FF7XKHOBrcitVMZf w==;
X-CSE-ConnectionGUID: GCCUVlEwQs6UQk7uZuRj8w==
X-CSE-MsgGUID: YrM2hexmSfq9x1OnEVChhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83708728"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83708728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:27:41 -0800
X-CSE-ConnectionGUID: Q7mWfs7YS5SBNngYOferDA==
X-CSE-MsgGUID: gcsWP/TcTuCUvJ9bnj99YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214400464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:27:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:27:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 07:27:41 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:27:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0bz+U3UfoDi+O2m4bDcGbf0UYCyUQ2/Ewh64cL6fCrNFionahivGErJBGPCwcp5HC5bpBv1yP1WhV0nswofZvgIOyvqNkjOvozXLqF+V9ShGZDlMV0yXZY04J4rUHJjb4/ngg2aYCT7lm9ZSQDHqcZhJqkTIDAByOEZq+jtbTJXv7VQE2n/F5euB6Oo4qARhruqQ4LSOT6TGnXHlZ/3X8W2CwQ0Zv3VEISYcxqN0O09xJnORYvY4BO/VjAlHaHvcdp61RtAK17UGeaE5C7GBjfor1FgVJ1K3BilkjKWi4NF6sq/PUnOYtcDeuqEujYn4Fksi68lTeDm9+Jb6hq/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3BCJRH3FalO+YmFsaB32+jyTYEibIzW9kgebgyU40Y=;
 b=Gtjji9M1kXlsXE99kLB3g6UL43pk5aakvutb+3BgsXxaZLQjsOStcf8q1dKXDuRfWRgaDLNcZq1PCKNvLvrwH5o6uTt7GnguTDNwuwPaf6JFs2tnNQK6g8G1HRaG5V7kPMNPK/edcR/x4/6I8iWDh/tUJvgPXH64uv7Mb12gzg+lY8GegscNagnVNb1Tq6hKWjrDukbqKdX5z9SB4zkXaQFSBTrjoXXP9us1vmgemIWqTyXpCuQki+Eb9Aixvp3cOTi7r1BrE9G4nb1IFxLBH+BWyhjpEyAVL70x/W8N/NblDJpI0UHABkqpfMnHf0n8o4Lw3e+xzkb6MhMy2YSvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 15:27:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 15:27:38 +0000
Message-ID: <1402832c-6714-48ba-b515-2c71233eb305@intel.com>
Date: Thu, 19 Feb 2026 20:57:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260218121904.157295-7-riana.tauro@intel.com>
 <20260218121904.157295-10-riana.tauro@intel.com>
 <aZbD-YapPK7nACyX@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aZbD-YapPK7nACyX@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: f567a292-4ae3-4861-50b5-08de6fcb699a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b096NFFFSVV2SVRGTTY4dDNMVlFBdVo3eW53WjBlYWo0TVFUb1c3YUgzVm5S?=
 =?utf-8?B?dzNvcFUyb3RWYWJ2bTdHMzY5RkMyV0VQbHBvSnpxMWk5ejdxSFN3RU9GbWlW?=
 =?utf-8?B?ZVdCU3R5VkxjT0pVd0hWUnl0MXhFekcwK2Fnc2FFSnlVK29zM0xyRXRNY2Iv?=
 =?utf-8?B?SU1EWnhNNm8zR1NCeDNrTFljWU51b0MwQ0JPNTNZeC9oMWwvdE1PZ0Jqc3ph?=
 =?utf-8?B?dURzd2dBUXR3cml2UXhkNTcydGhRRGMrVHVCQklvUXVqQVdFMDZ2YkNVZWFa?=
 =?utf-8?B?S0IyMU8yY2I5eFBRRDdId2NhY3FNTmpyRU5FSTlZWFBKc2RKd0h3RkdDbmVM?=
 =?utf-8?B?MkQxNFY3N3NSYkk5alBlZTd1aGxCd0xHZHVwd1ZjSWVmcEo3aWdCcGgwdm9x?=
 =?utf-8?B?b0xRYjltN2NzbTFBamN5enRSRVMwampoUDI2NTg5M24vTE5VUXNKUExmUWFM?=
 =?utf-8?B?RkFkS0NmZWZJZnhkV1RUUlBpTVlrcG9OK2RVWDNNZGpKQktOUXVQL1pEUGls?=
 =?utf-8?B?OTRzbjBFSENQdXNIZ3BtUi82MkVVRmJ4dmVVdmE0MXI1bmJsbFBFN1BibnNu?=
 =?utf-8?B?QnJ0WjZsOTNzY255Ukd1ZXpkTDNRQVlrYUdPdlh1MlpVTFUrblFrakF3UDV5?=
 =?utf-8?B?ZmROMlRnT2ZFQXJiRGJMQzJZc0VIR1BhRS9kdW4xQTErQU01SUJSandOQlNn?=
 =?utf-8?B?WVMxYnY1NDNZZE1WWllOTGJFQ1YxVUxZOS9iUUVFT2xNbms5Unc1enQ5MlRY?=
 =?utf-8?B?MFpGMnhXVVhEVzBzbjBqR1dtWFRIeDFJSlhGNDNWY2NNV0xNMnUvazZPZnYz?=
 =?utf-8?B?MXFqTVNCL3U0VnBhRU5UUFgwQ3A4QkJnc2oxb1ZIMWh3Sklja1NqSlY5Zk1O?=
 =?utf-8?B?MVJGUkY5Wkp4bUs0bXBwVnhSSlZqeDNjNHVFd2I3ZVpwc3ZWWG94bVRQVFNy?=
 =?utf-8?B?dU5LUUNxbkhCenNvaXV3SDFBYXdPczN4YTh4cTNKSURWTUR0Z0lrZFIzWC9V?=
 =?utf-8?B?eC8xMW1YYzhZS3BqK1JaYk0vYTB5d1VoN1RCeENQYWh3akZ5OEtRS2xZSDkz?=
 =?utf-8?B?dkM5bmUzVzJPSzRRdlRyeGZyeFQxTEFLQVVJOHM3NkNHZmZKd0JiRkkyNUg0?=
 =?utf-8?B?bnhMUE9xVGhCVy9qcUdVYlB6U05DVkVyTHg2M2lpSGU4eXMzOHo3bmdQU1Bj?=
 =?utf-8?B?WDViczFNNkQrS01ZYXFjdGQ3b01jU1ZjQkpLQkZvTmVRblZHMFA0QUVZZ09N?=
 =?utf-8?B?b3E4YzVzTUtmMU9DdkJqcDUvUHFvaFVhd2o1SENRS1dQK1NyWWYwNUpERHl3?=
 =?utf-8?B?UHpvczZJMUxKNEdzcGRzM3FxcjhNVjE2b2lianNUZk1WOG9nU0ZrdUo2bldC?=
 =?utf-8?B?bG1xWDNmU1BFVWpDN0o2Z3Vzd2laSWQ0QnlIKy93UmNFNC9rWUQvVUVlZGFk?=
 =?utf-8?B?ZXVVRTBGdnE3bm9tOEh6MGNTR3YzTTZMMGtEbEJuQjJ4bHBZWENMcjRFOXJR?=
 =?utf-8?B?L1VxQVlTZk1GeG5pbllwaUpmVDJuWmV1OTZuNGhCb2pZczdmbGVqblN6c2M4?=
 =?utf-8?B?UG9hSlJPM2FySDVmUytjQzFObnFiU3MyRlNXQ1F3YlozbWtCSDdaWUM2cnd0?=
 =?utf-8?B?NmN6K05GdHV4TXBxT2t4elBJNlJYK3RQZGFIYnNOa3NiTWc2bEo5RzhISm1z?=
 =?utf-8?B?UWlhQmoyMVhWdWRpVldyS2VCeUZPbC9QR3dVZ0lUV1VCbzM2TGtwYVBTVGs3?=
 =?utf-8?B?dm1PbnBSR1BYWGRWTEdyR2pMamJYR1NHYmpWaFJVQVJKdjNmVmpIcEJXY1Ri?=
 =?utf-8?B?N2duR0sycXd0a2pGWmEyOWFFcVYvRk1JQm5nemQwQ3JvMFQrb1JBRy80Q2c3?=
 =?utf-8?B?VTc0SERIQ0Nhd1BEMkZqUnQ1a3ZaaXRiTXRNRjNXRkh1L09hdGpaMm5MYmFq?=
 =?utf-8?B?QXVIUVdpR0s0eURtblg3UGNXcU9QVU80SHdRd28rOGZmczFTUGsyVVh4Y082?=
 =?utf-8?B?SHQ2TzUyZDhwcmE2NGZoVGZDSkQyK2VGMU45ZlREUHBUZklNVGs2Ulo5dTZo?=
 =?utf-8?B?Zm8xZGZLY3FlaEZ3VHNLUlZ4Rm5lOEZ1Y3hOQzNUOUxrNDJ4eUoxUFVmOGNl?=
 =?utf-8?Q?Sgac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEUzTm1La3oxVzhoc0xpK0hKajRubE9qZCtKd05mMEplVWJMRGRHSU0yOEhN?=
 =?utf-8?B?ZkdJU2k2VjBUUzJjNTVMcjNWdzNKRHZ6RWxmU25EVDcvTDZFYnEyeW9xOVZF?=
 =?utf-8?B?T1REdHRIODBqSWlRWmJwRm0vZzhWQkF6WUVUcndqWCtzVXhQS2V4aGhLK3Jp?=
 =?utf-8?B?bEErSXNBMU9rb3JOS2txV2pONGdBa2FRRC82ZDJiVHZtaFZ2TWgxTlpzNTN6?=
 =?utf-8?B?WkZoWG9IMXhzR0JxdmRxYnlkNFpZMU5EU3ZPb3NwcnJPUWs1VDlxT1NWbkg5?=
 =?utf-8?B?TDh3YWw1SmRSb2lZdlpTRzRYSjByMUVtN1Ywd2hCenlRRmZRS2dRb01ZcFdu?=
 =?utf-8?B?dkx5QnVVWHk5WDV4YWVuN1RzaTVvMUhWblVKT2VpbVRIR3VtWkJPN2c1M2xC?=
 =?utf-8?B?OXJ6cDVndjlPa0o5STVRbU81TytzOEVhTWhNQU5OSHFyZ1pRVEFMejkzRVpo?=
 =?utf-8?B?RW9ET0hZVGliUzRGd0Y3dDVpWFErSTZRS05DUFo4VXA1QjNTa1czeDdjOFBX?=
 =?utf-8?B?UG01UnVvdDluOFlFL1JsKzczOUZKbmxuTWNvVHZKbEVzbHpFSFAxQlBjK3dX?=
 =?utf-8?B?Um1NSG5UZFBwZWdEZkNpNU1ZVDc0OU5DSjZHT05WbFpEVGFWNmdsS1pDL0RW?=
 =?utf-8?B?ZGVacm56Zi9aajZGeFozMjIwb1NjMFBFUytvV2pQUXV0YWpVUVZWdFJPYVBz?=
 =?utf-8?B?MC9lbmNodWplWFlGWUNicHZaSXZOTEdBU09ZSUJvVW0wd3lYRnA1bGJRWWpY?=
 =?utf-8?B?QjQ0QS9rMzV1WGMvT0ovcEIzN3FqRG9PdE51V3ZYc2FMYi9wMERtdmk0bi9z?=
 =?utf-8?B?NzhsbS9uTmVGLzJLZHMyaE1VTHBUclNKc0s4QkhCVmV6cFhuQ0UycXQ0VHMr?=
 =?utf-8?B?TE1WRFhBSm1IVjFmYkxhMXVuZUZvRGhuV1hEbzNvWjZaWnpxMTdKTjBDamFs?=
 =?utf-8?B?RzMyVmFQTlRqS3dISHVVRnhzVlc0cUdKMUY2dm5oeTBxZnhucWpiY3FpZDdY?=
 =?utf-8?B?WHpObk16bjh5eUFoUmRrTXc3TnArSW1oenI3WGdQUld1UGV3NjB2UXd6WFlC?=
 =?utf-8?B?Q3BzT2cwZDJrbnQwYzA5M2pvaFlLc2ZMOCtEM2VGMTdCVTZPdWc2WVRFVlZU?=
 =?utf-8?B?ZktXVTl2bWdhaXhUaklHV1hjNWJzVHVPN1FyR2JzZ3hsR3ZKR05BQUlMaFZW?=
 =?utf-8?B?eEJDQ0o2YXNZQ3NPbUttSitxQko2RjhwM25mL29tWWJhNzVGTFZlKzU0TlZy?=
 =?utf-8?B?R1U1bVV2L29wMytSMS85YkZQU0NhbllpZjh4SS84RW9NWHVSMGEyVHl2YUdP?=
 =?utf-8?B?aFpQenJWekQyWXNlTUtoRSt2emFmUlN2LzU0aWJ5NmgzNWRxTkx5U0V3UTd0?=
 =?utf-8?B?ZjRQaW9oSTJ1NHBjNGhhdHN3cWllUEljTmwvRkczdGJwb05Bb3JxZlNldm4z?=
 =?utf-8?B?RFBGSDRKb0hyTVRkalZMTG15bHZCNkZLclRlUENUeXlwazlrS1Z1bk14VFhR?=
 =?utf-8?B?a2hwdGpiVmh3NTlRNjFCMndUTHY3eTFoS1pVcG03Y0tvektXYVczOGJhejhP?=
 =?utf-8?B?NGVQZ2oxU1djN1JwNWgzL1IvTkdEQnN5eDRZQStab0tEbXJESkt2ZW96NFFx?=
 =?utf-8?B?QUhjWUUvNk4zVFM5Ulc3YWJiM3ExTElWTFg2U2NiNnlWUWNPU0tIUEJzZ2Zh?=
 =?utf-8?B?b0l2QkxLdm44eTk4R3NlcDB5UUZKVzJCZGxQUVh4ZGtqQUFhVUtwS04zRndP?=
 =?utf-8?B?V0NxMVl0aUdtMTJPZjdKNUw2Qll1SDRjR0RJNEx2K2RmdWxzMFE3NWFaZHpV?=
 =?utf-8?B?SXJvQVlNR2JjV3g4MEk5Wnk2YWxPMUttcjE5bzdzOXFnWElkMlhuMGlhcWFY?=
 =?utf-8?B?aWRCYnNWa3d5eXVycWFqcmk0OU5OZG9sMGVBTlBJcFBuM1lsNGlobmhjVmxj?=
 =?utf-8?B?Qncxc0NRUVlQRVVKMjVhdGJaOHV2cEVhZ3NjRWEwUTYwbXFSdUNOOXBrb3VO?=
 =?utf-8?B?UHhEZVd3UFRCL2ZiYXYza3dJNTFqMzVRYzNyUm5MRHdMU21idllDV3dLMkR3?=
 =?utf-8?B?ajZUSEpTNGNmbFZqZm5id1FZczFFVWpqN2QrTThoL1NMOWFlWXBpRWJKcjk0?=
 =?utf-8?B?Vk9JRXpqUVpJVjJiMVAwLzBZa2Nwd1QyOURhUU5kTUpwcGliN0cycEZNYVRX?=
 =?utf-8?B?cU45QldRenpiUlpycHdHRGZ3L1Y2WE1iRis0R0s3elNkVlhaWWRvNDY5d3dJ?=
 =?utf-8?B?ZGlOdGx0WmgwcVdoRDUyTURaNWpHNDJKaytqOXRLQlhGU2JGek1FdXpSek9R?=
 =?utf-8?B?SXBFeVVsL3k0ZEVtT0VJcnJaVUxST2E1ZGlnemhueGlnYzVlbDJKZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f567a292-4ae3-4861-50b5-08de6fcb699a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:27:37.8031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yuk3xazsTwCuvUzHIh2u0M81xiM79jOFY2yVSpoADpfCxoyjlwL6XHlgFhnw18mmJklF0cW54ewx0wuqwaWldg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0F8F01601E4
X-Rspamd-Action: no action



On 2/19/2026 1:34 PM, Raag Jadav wrote:
> On Wed, Feb 18, 2026 at 05:49:05PM +0530, Riana Tauro wrote:
>> Initialize DRM RAS in hw error init. Map the UAPI error severities
>> with the hardware error severities and refactor file.
> 
> ...
> 
>> +static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)
> 
> Missing const, but can be done as a follow up.

I will be sending a new rev. Will fix this

Thank you
Riana

> 
> Raag

