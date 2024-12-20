Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E6C9F99A9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42C010E013;
	Fri, 20 Dec 2024 18:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0vlha5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05D610E013;
 Fri, 20 Dec 2024 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720012; x=1766256012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NjfXsO9MVseFFowQyNMWn+xFEBm0LK4Jmd58L5Z4u80=;
 b=U0vlha5nlj0u/IPzPdLE4c0YfCoZshRaSUeJtX3QujMHjw2jViT4rcKk
 UXqmSSr94/oyEn1chz2tslQ8yQ2IFLMVMFYaxTgh9Fd6Mcje1L4MkFC9L
 bhTWyBJQaLanNQG+g32lywviur6aHspnnsUWjzKTRJup1HYtVAdZUmM9s
 YEeUKzb8lA7jS4G5xhaEEI47F9DlGWTUKq3HzrJwcZ8YSlgq1neXQ1AQ4
 W3u1oVCHBN+/sptYnNOHxft/cvy16IqcNCk5QIYRgj8cwepaX2+0Y9toR
 rYBCQeHEr/VjITLpawNZG8EXmi7nUoaAXdVZZxE7HUpP/HdyV2V7Hoj/r w==;
X-CSE-ConnectionGUID: EBWMXTAKRyiuw3+6m/7mcQ==
X-CSE-MsgGUID: b2Fyjz3bR0CpFsLJQ3x31g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35399757"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35399757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:40:11 -0800
X-CSE-ConnectionGUID: mCHOKKo2QmeYQklleRN4zg==
X-CSE-MsgGUID: fqxBzlEjTsOaVH5pxD4hDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99423442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:40:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:40:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:40:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRXYjynL73Y89nDF3YEKtNPZ7a7tvGvTYZrleZFDMIXF99YKgz3qOLw9eDFjgwS5I4wX96cWID4hLJwokTzdXWniQYk5KWJW6eJ1WsVNyO1a/gsTaacgpXu97nsVsVFGhL/sI6FMtX/T/fjIOvPpWCD4nPcdgQ4jtxVcfgG+zOv7L5ToGMgN7jy3MHkmershwjgFq6Frg46Fl2wZjRliutQU3RGwSjbWSznS1ZtySqY7DP3GerVnmIpyikFnr6uAcKx7Tyu8Oz0SwyfHEr9FKIKxFNuzEVhxlq12wFOh2cXOCU37rXsYg/PrLwOw9e8aiYKf/oB/FBLW/OvjS8PL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvJXdnOrawXwyKuycPPTKMURQqu9AZNel7jXVJQ2xsc=;
 b=XKLC9PsdcAyPsbhea1zfh3M7ED/FQy5f8qB2D1IOjgqoBXEKTrhqgeFKENjgv5KaT4+ncKeL955IvLtJdXu6yVpGbqzv15BI78kMIPMNOEroNM8HJX1tkIYKhrsDk+gfbVQsOzXIKStc1qUqWzjrISzbhblWnjO0UsR5DRGEH4prj78m3Z0DB02EG4MT1cDEQG9z1PGl5uYBAB3zOd5TopdZm4I/uIziu1fEOLkG5v+UizMQ4HAUOTesGZE6ofQqu3qZQ2lRlfgpqFCm7MoTTH5rcwZ+qhep/y8qP3bnm/g2ap4bxFd4pDDJF3MDw98hNSjtQjsskKfYACgDcRPuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4576.namprd11.prod.outlook.com (2603:10b6:806:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 18:40:03 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:40:03 +0000
Message-ID: <b28530af-ea5e-4297-98d8-174d473e1d84@intel.com>
Date: Sat, 21 Dec 2024 00:09:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/30] drm/xe: Add SVM device memory mirroring
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-20-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241217233348.3519726-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c38eeb-2c3b-40fe-f021-08dd2125b7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UER3RFBEaU9LU0ptWG43VWlpbDVuTDFhQkUwNWxyTTYyN0tHK3Q3NmQ0Sno5?=
 =?utf-8?B?K1kzK1ZhKzNWc09WdjZlZTJVOERrNGRLbU9pTnhJRTV2ZjRJZkFrTGk4bVVQ?=
 =?utf-8?B?K2tXY0wxQWNhMEVTc3E1MFlsNXlWU242a0RIeEl6bTRsYi91WjMvS3ZaZVdC?=
 =?utf-8?B?eFZHUExJeTlCamY4YkFFRFNFMGI1VlRuamhseGx5c05XaXJobE1Bb2NVOXJ5?=
 =?utf-8?B?U001THZmUFQ3cWxlYXVpQkdmejNhbzh1cG9ib3hlek9ZNlBXVjl0emJuMm1U?=
 =?utf-8?B?SWJHQkJ2TVZNWkJaWDl5Qkd3WXdlYitWSjNLWXdGZ1RMdm8wR2p2MVlYNGpj?=
 =?utf-8?B?N0xod0JlM2wvbjF1RW4xMWo5OFliOFdMSjlBWUxrdTdoQXN5NTZwd0d2VHdl?=
 =?utf-8?B?ZHlCUlAxL0dhajZzNFlieS92eC8yTytuODFzRTk0c3BQSXlVUUhJakNtRVdP?=
 =?utf-8?B?TytIajJGdXRtb0plUGh0d0ZQYTNwV3U2Q1UwQk4wbFh2Nm8zRTZrQnlRNVc2?=
 =?utf-8?B?SkxpcE5IWTZ4YkRKNjd0QjZtVkJSaGRyMURIblhwb0ZXYVlsVFdvZnFsTVRk?=
 =?utf-8?B?WXRPdFduY3kxQmlYUm10aGxQRnMxN0NSOFFVZjBXa25VOXpGTWJLbFU1ZkVK?=
 =?utf-8?B?T1JUVVFtdmFpMUZURVZ1cWtaZ0ZlclRPVnBpZEpkbGdieCtOOVczNmxwN2lF?=
 =?utf-8?B?eEU3ckx2aFdEeU5mM0tuOWdyeHptUDV0WmxPb2tEcmUzMGNXVUhnRGJnbmhU?=
 =?utf-8?B?bFh5NUN0VndTcUd3Rng5OGJMWEplRmVHNjE4WlRVbFVYL05BK25mRmN3djJO?=
 =?utf-8?B?ekVSVnVnT1lWeSthVzc4RnVmQVdONWZVbU1OekNiTkUxSGlhbHYyMWxjOHRD?=
 =?utf-8?B?WnpXZWpQY2s5TWk4ODhsNDRRV25TTTJRMHJDRGloc1hPLzNibmJLOGZxV1Jj?=
 =?utf-8?B?NGYxS2dvYUZJNjFhZXBDRkxBS1dEZWYzUmcrQnhEVXpETlBjaFF6d2twZVRv?=
 =?utf-8?B?VGgzRVhTbGQ4QXVQT3ZDTlFHb2VMVUhCbTBxZDVuK2srZGozYkpmeEpFbUJw?=
 =?utf-8?B?eGtqTzRxSFRVUWVlVEdmajRuSnhITXp2ZHN6WlFuUlZSZ2diWDF2cEF4cUdl?=
 =?utf-8?B?WDlPeGdxVXV2R2t2NFhpNWpJclBTTHZFVk1YcTRPdEpxS2Rjd3FLN0ZHdDdY?=
 =?utf-8?B?RHIvaDVQOExGeXdHbWtVYzloeHVwbWg4R0V1QTZEVVU3clFNU1pBV2NyZHRC?=
 =?utf-8?B?TE1HeEtkOEtvTHRsU0dOVkJaR3JFM200M0tseGJEbzRDZm1kUXlxSE01bnBV?=
 =?utf-8?B?YVBKaWNhZDBqQUNzaG9RRGdaSDFLVmR2ZjE5NDc4OGwrV2dLOS9BekRPLzlS?=
 =?utf-8?B?K2JJOUlqd1R1UjFrSjh3Rnp1cVZBenZnbXQrc3RlWjc3TjVsMDZHajlNdXRL?=
 =?utf-8?B?ZEtnWDF3Zm9DaElPVkFhYS9DWTF4RWh3T2JkTjhNRWFUdmdMVHd5ZEZJaWhR?=
 =?utf-8?B?NmdHU1hRcnp6dTBkNmJSYWx2UkdnMnR6dWh5WS9PY1hVVk1ybmJqdlcyemlv?=
 =?utf-8?B?YlR2QzZaVEphNDVNbUlST0hRYTUyT1BEaDdjNFpPSXZHWUF4OWkyQWVqenVL?=
 =?utf-8?B?MzErR0JrNTFET1ZVd2RhVUEramNWZXc5ZVA5L2pvMFcwRytqMkFDK21rSkNv?=
 =?utf-8?B?WkdMeEJMejlWTXMxRHZZYWVwN0lnb0IxRGlKTUxxNjRTRXF3YjhPazJhMkZr?=
 =?utf-8?B?MG5zRW5YSkY0bEtGZ0Z1ZXBqb1lGWS9mSks1MmdNMjVaN2dxL3pEUDFXNXNh?=
 =?utf-8?B?eUE1QkdHYmxsK0cvcXFsaTdoSG5NQjFMMHBCNDdpVUFaeFlJWXpoRkZFcHFO?=
 =?utf-8?Q?XqwY6iI35tOC2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk1ML3lNeHF3STFVWDRnNEs5Y0pLbUVpSkNtUGJXNUpXMjJoaEl6ZE9oc2NL?=
 =?utf-8?B?RVI1SEc1VWtHMHRnYkd5azJuVFRqMmg1RjJnQVhTSW92VVBMcHZCTkVwZ0tr?=
 =?utf-8?B?UEdLR0ZrL043UGR4U0Z3S1JodHRrWlpOcGdobGsyZTZUQ1ZPY2czL2gwRGdC?=
 =?utf-8?B?TkR6U1UvVHVnS2NMQkJCODJQSTFUSTR0QkRKcDY0bXJFQjBkQjByTHk3K1B6?=
 =?utf-8?B?dG9QZnd6ZzNURXd1ODhOK1IwZ2taemlGNjFkZjF2NWpqUnowaU4zMEp5eS9F?=
 =?utf-8?B?ck1mdEcyOEhKbDhyMlhhTW8zUjVNa2MydityV0w2M0gvTlc0T2FpV3UvYnNR?=
 =?utf-8?B?ZUVmVENRMnVvUzMzcW0zQVFqd2dQMW9oWVkxZ0ZXaVdsZllWNFhuelZ2dzk2?=
 =?utf-8?B?TEd0QzR6bFMrandRcklJY01NSnQwRzQ4NUpISDE4aENYcmFmcXhiOHJuajJT?=
 =?utf-8?B?clhPZytkMEFqUVZNckdkWE1xaDRSQTRLWmR5MERXS1ZzaWRteVovSzVkZ1lU?=
 =?utf-8?B?cTFHV2ZXYTI2OGlyR0NUMFlwTU9BUnpVRHhyWWo0RVhRd1ZTQktyWHlhVkF2?=
 =?utf-8?B?b2lTeUFFQjdhVE95WjVLa29aOTVKUVVQRVdXQ241dHhHSEdNTlYwLzhvcHJU?=
 =?utf-8?B?ajI0YmJMU2gxTnFKa3g2aXJnd0tPSWR6eEZxejBBVDY1VTFKMGtjRUI3eWI2?=
 =?utf-8?B?czhrUUZCS25BK1JNYkFqM1JTRUFsMXg3ZXFLRTlRUWN3ZUJxQTk3SWN0S3dU?=
 =?utf-8?B?cWJudlJ6WFdSdGV3b3BnMVZCN3M1MjI1ajVYZUdPVWZkdzVVWDhvVTFHcmRF?=
 =?utf-8?B?VUwwNFdmQndoUEVBUmhLaVhLNEFpbXpZdzlNWUVlbjRFNUZJN0NHVmtzYXNQ?=
 =?utf-8?B?M1BKMFVEa0Z3NmZ6MXpnVEdKWUtwczJjaHE0cE9LcjM2bVQ5WEEwZWdBWDBF?=
 =?utf-8?B?OS9ER1lJb05oeUV6bVdBR2t6dHQ2VGxWdjhabGprUWcxT0pPOFJhOHY5ekIz?=
 =?utf-8?B?TlY4Z3pMWXJCelE2eFdKeEZHamZQb2VFcDkzWnNtaG8wVkdsdjFvay9yaVM0?=
 =?utf-8?B?ZzlPTSs0TUx0UHpOVGdGWXlkdGdpanhZWkY4cFdUMCs3Q0doSzdwUjBlanBE?=
 =?utf-8?B?aUpvdWsrSkl0MlYxS05wd2FaNGxGMjFsVXdOTnBCdXNLc2hseDczdW50M0FG?=
 =?utf-8?B?aFd1NHhhS2xwemVzMVN4WXV2aUM1cE5yVGZsS1UzdDhNNW53MlZCSzhrZG1w?=
 =?utf-8?B?WUlqTW9RdWFZT3dFUFRPQW9IY2VmejdHeVVNZ0pxekZLTmNicCthTXl5Mmo5?=
 =?utf-8?B?algvUjE0NC9uNytuVWFZS0NKQXJzTFVmTGxXakg5d3RJMkVyUmtNTUJaZUIv?=
 =?utf-8?B?WEJERVJiSHp6RCtJaWc4aGZ5OHNFL1U4dGJQc2VsOTdCa0NUVE9VbUM3U1I4?=
 =?utf-8?B?N05mRHVOWUNMQmE3Q1k0QmFwMjY4My8rR0EwUXJYUURrUjNTOUx0ZkZSQmpv?=
 =?utf-8?B?dzdjdmUwcHBWek9lMjVuU2xGSWpZcU1MZnNhSk90K0tWQmRBOHhBdjRQZjFt?=
 =?utf-8?B?ekQ0TE9ISW56YTk1N3EzQUxpYU8rRElGL3h4OWRtdCszTHlnUEtlWHV3T29o?=
 =?utf-8?B?MUhsdzcwOXV3SFhwL3RUZUVYZlNNY0U4clRXbUJseWs1OUF0R1ZYbjZNdUxY?=
 =?utf-8?B?VWNVRXU3Y2R1ekhoZjVGd2J0T2ZIRzBLbE8rd3dlQ1VPbExDTUd1TTVjc3Vt?=
 =?utf-8?B?aTBTQVRURUJ4b0ZiTXBjTDkvVVl6aFJ0Vm5ZOFhJVVB0RUo4eXJrU0dGcDQ1?=
 =?utf-8?B?dmtjNEJmV05PdkpxSm1Lb3NKOXBUTGJUVnpQNjUvOHZ6RVNBNUdJemFvMlNa?=
 =?utf-8?B?YVJxQTNtYmtSdXVXcHFVV0Z3T3BHdE5mMytNQnlDeHFlOXAxVEtQVU1naW16?=
 =?utf-8?B?TENRZVU0dzJWSzdBbXlYUE9IdklOaEVkTVB5WlJVLzZDTHp6Q2lhOGR6SFpB?=
 =?utf-8?B?dkNxVXVGMFowSFdVVEI5MTgrb0gzSWZwTnQ4NndPZzhUaVpvU1Axb2xSVlpV?=
 =?utf-8?B?eG4rdlkydmRVQ1JJNmFGekMyVHRPVkhqVTZuLzIvMVVjcU45VXJqUFc5RHRk?=
 =?utf-8?B?aWU2TlBNRGNLdGdwLzlPVm5DMEJxelB5Y3RFU1NuNE9yVmdtOEU4YXAzdTlm?=
 =?utf-8?Q?1lzolUVrb7vZJNuHumQNXS8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c38eeb-2c3b-40fe-f021-08dd2125b7a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:40:03.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGl2QuCSIiYQl7gsNgWYvr3LOPewAs+MefAwTih3vDr6qW+ZGgc5ZEfNBaoMDsZquwcBpm8ms7czVacdsg7TeBm1b/gmcITz+pxZtURORd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4576
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



On 18-12-2024 05:03, Matthew Brost wrote:
> Add SVM device memory mirroring which enables device pages for
> migration. Enabled via CONFIG_XE_DEVMEM_MIRROR Kconfig. Kconfig option
> defaults to enabled. If not enabled, SVM will work sans migration and
> KMD memory footprint will be less.
> 
> v3:
>   - Add CONFIG_XE_DEVMEM_MIRROR
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig           |  9 ++++
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
>   drivers/gpu/drm/xe/xe_svm.c          | 62 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_svm.h          |  3 ++
>   drivers/gpu/drm/xe/xe_tile.c         |  5 +++
>   5 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 3a08e16bfada..1989c99a9f5a 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -60,6 +60,15 @@ config DRM_XE_DISPLAY
>   	help
>   	  Disable this option only if you want to compile out display support.
>   
> +config CONFIG_XE_DEVMEM_MIRROR


%s/CONFIG_XE_DEVMEM_MIRROR/XE_DEVMEM_MIRROR


> +	bool "Enable device memory mirror"
> +	depends on DRM_XE
> +	select CONFIG_GET_FREE_REGION
> +	default y
> +	help
> +	  Disable this option only if you want to compile out without device
> +	  memory mirror. Will reduce KMD memory footprint when disabled.
> +
>   config DRM_XE_FORCE_PROBE
>   	string "Force probe xe for selected Intel hardware IDs"
>   	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..b949a960cebb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -102,6 +102,14 @@ struct xe_mem_region {
>   	resource_size_t actual_physical_size;
>   	/** @mapping: pointer to VRAM mappable space */
>   	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 3cbf29732249..2860e54bb035 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -19,6 +19,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
>   	return gpusvm_to_vm(r->gpusvm);
>   }
>   
> +static void *xe_svm_devm_owner(struct xe_device *xe)
> +{
> +	return xe;
> +}
> +
>   static struct drm_gpusvm_range *
>   xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>   {
> @@ -306,8 +311,8 @@ int xe_svm_init(struct xe_vm *vm)
>   		  xe_svm_garbage_collector_work_func);
>   
>   	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> -			      current->mm, NULL, 0, vm->size,
> -			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> +			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> +			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
>   			      ARRAY_SIZE(fault_chunk_sizes));
>   	if (err)
>   		return err;
> @@ -442,3 +447,56 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>   {
>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>   }
> +
> +#if IS_ENABLED(CONFIG_XE_DEVMEM_MIRROR)
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region belongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> +	mr->pagemap.owner = xe_svm_devm_owner(xe);
> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
> +#else
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index ddce1069ba1e..85832e6ed3f5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
>   
>   #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>   
> +struct xe_mem_region;
>   struct xe_tile;
>   struct xe_vm;
>   struct xe_vma;
> @@ -36,6 +37,8 @@ struct xe_svm_range {
>   	u8 tile_invalidated;
>   };
>   
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> +
>   int xe_svm_init(struct xe_vm *vm);
>   
>   void xe_svm_fini(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 07cf7cfe4abd..bbb430392dfb 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,6 +13,7 @@
>   #include "xe_migrate.h"
>   #include "xe_pcode.h"
>   #include "xe_sa.h"
> +#include "xe_svm.h"
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
>   #include "xe_ttm_vram_mgr.h"
> @@ -164,6 +165,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>    */
>   int xe_tile_init_noalloc(struct xe_tile *tile)
>   {
> +	struct xe_device *xe = tile_to_xe(tile);
>   	int err;
>   
>   	err = tile_ttm_mgr_init(tile);
> @@ -176,6 +178,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   
>   	xe_wa_apply_tile_workarounds(tile);
>   
> +	if (xe->info.has_usm && IS_DGFX(xe))
> +		xe_devm_add(tile, &tile->mem.vram);
> +
>   	err = xe_tile_sysfs_init(tile);
>   
>   	return 0;

