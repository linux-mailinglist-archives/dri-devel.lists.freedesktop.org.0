Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C203AB2FE0B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFAC10E37B;
	Thu, 21 Aug 2025 15:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neKX2ymM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD6D10E37B;
 Thu, 21 Aug 2025 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755789445; x=1787325445;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+5PLUiaCmjkDvhZ+kOkqZ8ygAYCcS745FbrzzZfZHCg=;
 b=neKX2ymMWmUlYyHFz5UB7mFG4t0Fhv1K8N2tejmtSo/7C6mP8zDLtKFd
 2hP7Oe3Bh05aVbLA17c1kYA2DaR2QTS4W/OQt3PVvRkVr5/W6gF57P3Qp
 jPjd182essMv0IuuM+/+z2Lht3AhaVr3HsSBuoDAblPmlxin8Sas7rpaC
 dH2JTJP1A+UPI8MC9mQTx23AZZv44Ss9civ3fFzyfkOdW27xJ9BCxMBFm
 MnPzzhFkoWOTcE7nEzpDpxuB8rFnH231pBAmUfu/p6S5Phb1MUmB5Bmp7
 QOYxjy/NiHqbjbDmplNOwO/UpNwwOlM+c/Zs4p4aI+tRPHT79SmNd/SkO g==;
X-CSE-ConnectionGUID: Rfjoz0MjQr+dfMeZm9pPww==
X-CSE-MsgGUID: atfoZMylTc6qRjQSdTcPYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58150024"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58150024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:17:24 -0700
X-CSE-ConnectionGUID: Vdh9Sf8nQ5eI6NnKTb7dLQ==
X-CSE-MsgGUID: 4YoClGZtQ0iW3V+1UZWiZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168671211"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:17:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 08:17:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 08:17:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 08:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7VNr5jh7BN/zx9R/SLBeAGg1KxXrmjImxY2eBZdr6ZQX2hUIoWcCDZoYzx/bb2hbRzcLb5BqBeWTSzBcNGu7sEweEk7DPZislpDfB1BGrH0uR0wdCv5JYjRTU5VKGjil5hDjyedh7fDhvvcSrPsig0MmD3clrFV5RAwndnS/b+VwDosGfB4CuRNGQsbokkwxj1HrvtpGSk+cVJHJlVEA2KOrR+YcnOP8o3ADthOdeh7JmdQJokRCjRlF+5uj/1xUqKN9nfMih7t/HEe6LRuUdnMKOh0iDdqq9l298rwGZ6q7h3nd+BySf4/kxIC/mTIhJIyzyBmtio7n8k2EYcbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY6AE93FlEL8nILxw52irIgkyOQyiYpUeAns/LNbVWw=;
 b=FuTCJ7kpX0bDO6exQJK6nzZ+BN81Bvbapn0RnLTA+vCqC2+yhKAXwc9pBjUPsyN5rnQ8ScGEoXQYNcayoS7UBVVqOc0FeAe/Yl5K7St3CxCJ0MBv1lTLtMZO9UqdFNvt6mCrEm6VCWKjBJPW4jQSptduSeh5DP1Ghq0HTTnkeOHSkOn6qFogLp5eGzc9lT7cQru84CERcdAc/lsWwjiNikE8/EMv4/OBF0KUk9tF5icvtbcbPziPn56eD3hf4+yTK/bY17VqvgG66v3jjvBqhdFsUOakR6AQR10h7qR3apWT563c2H1FUmZM7OQkkSVlF+C0cDJXEk2WaFiuVuwGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:17:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:17:19 +0000
Date: Thu, 21 Aug 2025 11:17:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Maxime Ripard <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>,
 <simona.vetter@ffwll.ch>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v8 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
Message-ID: <aKc4eSmYqhSWgwMI@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
 <20250814121448.3380784-3-riana.tauro@intel.com>
 <aKICgFd9IfSRGbYq@intel.com>
 <20ee25be-90cf-4a00-8ffa-0b22c7a1b493@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ee25be-90cf-4a00-8ffa-0b22c7a1b493@intel.com>
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4ad0da-608d-47d7-74ca-08dde0c5d203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cH3n1X/PIOhVAq9+0jyrQJLoyARiQdkzor22K8GMVm0VV2qkKLoaW+5qTd?=
 =?iso-8859-1?Q?SMYTKFH0deVMPkpB4TllnTOdRbWIEacJSvM/U9mdA63nulRBw2iO6dunQk?=
 =?iso-8859-1?Q?WDtUWdBi049sA0hrXF3YOjc/L9+Fp1PjcBGaUw0pk0NzjfvVXQ7OB9ecJx?=
 =?iso-8859-1?Q?O4o3JM5EETOu2KM62SawCZd1vAsw2Rr3oxWGwUxxqblMQyf6OzOzEDGMqX?=
 =?iso-8859-1?Q?nz/1xuxImY1rhcHYhnmHv9DtXKK4fMfPwBFLDGT+4JuB0mcOerp4ZBy7Ly?=
 =?iso-8859-1?Q?csie6iMpCs4baxXZmDCVQiLOJGBmJu9k3VgnYbhZUGuhnlQSddPvhou2mx?=
 =?iso-8859-1?Q?ZUW+zdFWEu5GKRkG3adFgyKeG8wg90pYHHjmeOM6aET+GpGzT05zFFIm7b?=
 =?iso-8859-1?Q?3u7i29cjfVtHmhg6OOv3MCIjYOxsKN56wH7EyvpgoYLJlitsZyqcUD1Y/F?=
 =?iso-8859-1?Q?Lx/CRiogUskeWJ6WWqdUkwxqwZSwKVV3nf+OE37CYnfzCg9k/GZPN3Dg5E?=
 =?iso-8859-1?Q?Tn59OhMU9uLm0WPfA3mMEq3x7mpRAbr3fiSJvSUfdZPSjMEIbyDVKCucr9?=
 =?iso-8859-1?Q?4nY1dU8arrFGUdwykC9WR97Oe9JVGXgyjdgu+E7MsHT6X+aU/ZPIv2EyqI?=
 =?iso-8859-1?Q?jRmHRhRBrcv6AW4QIZyRAvkiAvoOrVPOl/7b3LxJPfgY8S+2QvW77Yqrer?=
 =?iso-8859-1?Q?X+hTyzUxLBagBsq9a01RV2uXRXlWR04fRIs1CxYp04jZdIvVU8bLhhOvuv?=
 =?iso-8859-1?Q?onJKzvpthYEZBv0I5eC4C1l/P5cQ05xxd3BmSUutnvNGh4ZmLdVjwe6NnK?=
 =?iso-8859-1?Q?7nNlyfPRWkZDuz7sneWnPt0h8aEANolmcW2uOjSOPpd95ieUeh9aAPkDeN?=
 =?iso-8859-1?Q?1Lt4YQqpGUqGDrgCfa8Z6T73cGvBVPXqGQh7H8Gryjx+iFtNJAwP+JWwWj?=
 =?iso-8859-1?Q?Z3PHv6LvnErp2y0nAT1IYHo2PYMtOF8W80GOVr4dArxZhJuy0I+yTBEB/Q?=
 =?iso-8859-1?Q?3ING7VP1B359qxuTQkSIhEamQDWsUx+9eSD/y5Maz4KDH6iP0541rjU7mm?=
 =?iso-8859-1?Q?SZdQEiyyGeXj0Tl0S3L1Gdyoxq+rnDJtw9zR5WzgkzyeK7FG7RoUPX+j68?=
 =?iso-8859-1?Q?AwFuQDewo7Rzre4v1mEHGw+719peeFnoBxs5nae2K81NjfC5ja2ptJJvP5?=
 =?iso-8859-1?Q?VPCc665y/hgHOYtoMpkTeuqQz3bwGtGsQ1too8zwKynBHyhBjmEQ9N/h5e?=
 =?iso-8859-1?Q?tCWYNStWrN2i2tpvFNtaqF2AGO/r98WhOgXR7c5urhc095NlDzcf1JT6GP?=
 =?iso-8859-1?Q?bdcnd80qP/9mryRhA8f/CuDE9n693ciDC34YJmzATnx4vPR0Ti8GF/OYF4?=
 =?iso-8859-1?Q?7D9/GbQLP2hqyLQzU/UyjVttEi0Rabyc62U2E3jv31qNdTrccaUmd1ZCZ4?=
 =?iso-8859-1?Q?HEAb4v+AxdSbKQUziAZ25zy6ruPa+o82gGeItWogAtcas17GMl+Xt36awt?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7MGcd90uzoNtXOh/OsXwye37Pz5fb3bSpIt3blEph6knn1p7KSQJlqPAH4?=
 =?iso-8859-1?Q?2F/6Y/Aws0bZNJQCrdxleVIlsshkwVuEM5LZF6bm52djaf8YM3o+L8dGrO?=
 =?iso-8859-1?Q?rLo+ag+O1Ug1+WwYvlh7xv5CQ8PNcY1t/QBRYRqxxRUknHGWYnDWrq9BXh?=
 =?iso-8859-1?Q?YelyaKTmTQ0qfMsbn2Y5xOCT2DBTUOvTg0PqHy6JL/JoKNLmgSLlvl1mvr?=
 =?iso-8859-1?Q?a/XQmLwbRJji5SRUC/ADBIkd0mPYk5V8nvzPT0Uci54mednWEIVyPv8UjQ?=
 =?iso-8859-1?Q?bZ1E7PMjmT0sd5+CGXPAQzAsCnrOaeRksyNdeFZ3ITz5BqsEvv2qW5hI/Q?=
 =?iso-8859-1?Q?so8S0zpk3HE31k08XO7EMEf2Nc8P3b3bP0wMiGZTFHlKLH7L/uoDRgMmhd?=
 =?iso-8859-1?Q?TTRm7p9+3R+LcsOI95EZajALMm2kPUiTu/50qkFb1B16uT4jEsvoPf48E2?=
 =?iso-8859-1?Q?lyX6oK9PUDa59U9etDxPwdHpWTks+kb+YKg7d4TYPs1REW8Wrah7NJnvrF?=
 =?iso-8859-1?Q?lMAgiYSt1FD3vW7vGCzkt9ucrp+pwWbf/KsXRFf8rgy4qMkml3gdeMAiaa?=
 =?iso-8859-1?Q?enugzw9x1btdV8iILEYYzr9o5I1ve4L9ygNcdiOzQUyToqGMoVx/vLV2rV?=
 =?iso-8859-1?Q?J9lLkcn0vHHHEesAEDGn313F4C7SpSWjcQP6/kkyx85Z/bynUNEhaky9ah?=
 =?iso-8859-1?Q?iIQx03oiA3iOSMp402DWOwxxWlTBJfeBTAJQCMtoIVbzABKjCmVC90eCky?=
 =?iso-8859-1?Q?WP4ro0tPp9W4I+NQkDK3JvPwiAwYB2/Wl2TWpCPYip9We5UAgVQjgZJRdP?=
 =?iso-8859-1?Q?XJRvC7f07VWFKBoO9b0iaRewivWzI24l/Vl6taYCuTwbn8q955oJmU77tN?=
 =?iso-8859-1?Q?YypYKc1vWcLmy9eqBq8fUem76IyvpT7y9M8R0obUxZCcjLgfT3cuKF5itn?=
 =?iso-8859-1?Q?8I4rDokUj2t9uAAHWAgR4iFhrkMpJzQOe7ILxwifRuVEdfAWjA6X/NCDvO?=
 =?iso-8859-1?Q?tF9LDirCjbvT5srIsdcUqr6SIiUue8k7Ol6a5XXBPiAo1h2viuHHVWEVOk?=
 =?iso-8859-1?Q?YAsAKR5GfoisLfHulMaIUw6NLIaz/1QYDsRr3V/ZCNOy3UBJIGe5Vh3Ix2?=
 =?iso-8859-1?Q?EpCRP3iaqWZ3COC4qwZ+wjZghyLcuy3YcOuraE6HbLXZKVHZhdwiRKNJW6?=
 =?iso-8859-1?Q?YH7A16RqBP/bpC4/+pPwLHzWoX5uVNBgSac5icnlaM900akbFRkLH1RJFK?=
 =?iso-8859-1?Q?0oZHZfbMsCR4Ef+kXSG1wui06Tr1tMp2DXAV+1ucZIrQm4AqKZF2Tvl2GY?=
 =?iso-8859-1?Q?bGjhALxe3N4TK3yQfYb50YOKpzeH1uxmls9E/Q2P8AiP3eywV6s3Jkvqie?=
 =?iso-8859-1?Q?G+SqwHrE1deReZiULuD0jmRilSS1rr1PA35HQvNJJGV55dC6veX/sF6VI6?=
 =?iso-8859-1?Q?6jWkp1A+bG0qw712K3wV1xljftI58LmaUuRDSujNsDQs2RNNlwoy8iqII8?=
 =?iso-8859-1?Q?qtF3mM2OvR9FTpY6qFS4NH7wwq+DoggrTJzMbtW6ysx2H9NXj7jTtDC7LI?=
 =?iso-8859-1?Q?JOfxB0U333RXTY90hRWuP7Zl0QG29XwhHRH+/P5y+nDJfthfolYEvxAxr4?=
 =?iso-8859-1?Q?TtdL8nfYuTpvIO2+BGcf/xG+nAgip9jRIK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4ad0da-608d-47d7-74ca-08dde0c5d203
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:17:19.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqmJ3WYSZCTECRITWZpUVnWVro3+9JqqjutATTqOsPvizQUwS0+RhCXQpf0RnB+sHxC6LHNkYAn6ZIzUNASetw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

On Thu, Aug 21, 2025 at 08:01:39PM +0530, Riana Tauro wrote:
> Hi Maxime
> 
> This patch has the changes suggested wrt to documentation in v7. Have added
> whatever Rodrigo suggested in the doc. Please let us know if the changes are
> okay and if the patch can be merged.

Maxime already told he is okay with the changes:
https://lore.kernel.org/dri-devel/5hkngbuzoryldvjrtjwalxhosdhtweeinpjpyguzltjmee7mpu@vw44iwczytw5/

> 
> This needs a drm-misc maintainer ack to go ahead.

But we still need some formal ack here to move ahead with this patch indeed.

> 
> Thanks
> Riana
> 
> On 8/17/2025 9:55 PM, Rodrigo Vivi wrote:
> > On Thu, Aug 14, 2025 at 05:44:32PM +0530, Riana Tauro wrote:
> > > Address the need for a recovery method (firmware flash on Firmware errors)
> > > introduced in the later patches of Xe KMD.
> > > Whenever XE KMD detects a firmware error, a firmware flash is required to
> > > recover the device to normal operation.
> > > 
> > > The initial proposal to use 'firmware-flash' as a recovery method was
> > > not applicable to other drivers and could cause multiple recovery
> > > methods specific to vendors to be added.
> > > To address this a more generic 'vendor-specific' method is introduced,
> > > guiding users to refer to vendor specific documentation and system logs
> > > for detailed vendor specific recovery procedure.
> > > 
> > > Add a recovery method 'WEDGED=vendor-specific' for such errors.
> > > Vendors must provide additional recovery documentation if this method
> > > is used.
> > > 
> > > It is the responsibility of the consumer to refer to the correct vendor
> > > specific documentation and usecase before attempting a recovery.
> > > 
> > > For example: If driver is XE KMD, the consumer must refer
> > > to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> > > 
> > > v2: fix documentation (Raag)
> > > v3: add more details to commit message (Sima, Rodrigo, Raag)
> > >      add an example script to the documentation (Raag)
> > > v4: use consistent naming (Raag)
> > > v5: fix commit message
> > > v6: add more documentation
> > > 
> > > Cc: André Almeida <andrealmeid@igalia.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > 
> > Cc: Maxime Ripard <mripard@kernel.org>
> > 
> > Folks, is it clear now? can we move ahead and get this through drm-xe-next?
> > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   Documentation/gpu/drm-uapi.rst | 47 +++++++++++++++++++++++++++++-----
> > >   drivers/gpu/drm/drm_drv.c      |  2 ++
> > >   include/drm/drm_device.h       |  4 +++
> > >   3 files changed, 46 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > index 843facf01b2d..669a6b9da0b2 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -418,13 +418,12 @@ needed.
> > >   Recovery
> > >   --------
> > > -Current implementation defines three recovery methods, out of which, drivers
> > > +Current implementation defines four recovery methods, out of which, drivers
> > >   can use any one, multiple or none. Method(s) of choice will be sent in the
> > >   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > > -more side-effects. If driver is unsure about recovery or method is unknown
> > > -(like soft/hard system reboot, firmware flashing, physical device replacement
> > > -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > > -will be sent instead.
> > > +more side-effects. See the section `Vendor Specific Recovery`_
> > > +for ``WEDGED=vendor-specific``. If driver is unsure about recovery or
> > > +method is unknown, ``WEDGED=unknown`` will be sent instead.
> > >   Userspace consumers can parse this event and attempt recovery as per the
> > >   following expectations.
> > > @@ -435,6 +434,7 @@ following expectations.
> > >       none            optional telemetry collection
> > >       rebind          unbind + bind driver
> > >       bus-reset       unbind + bus reset/re-enumeration + bind
> > > +    vendor-specific vendor specific recovery method
> > >       unknown         consumer policy
> > >       =============== ========================================
> > > @@ -446,6 +446,35 @@ telemetry information (devcoredump, syslog). This is useful because the first
> > >   hang is usually the most critical one which can result in consequential hangs or
> > >   complete wedging.
> > > +
> > > +Vendor Specific Recovery
> > > +------------------------
> > > +
> > > +When ``WEDGED=vendor-specific`` is sent, it indicates that the device requires
> > > +a recovery procedure specific to the hardware vendor and is not one of the
> > > +standardized approaches.
> > > +
> > > +``WEDGED=vendor-specific`` may be used to indicate different cases within a
> > > +single vendor driver, each requiring a distinct recovery procedure.
> > > +In such scenarios, the vendor driver must provide comprehensive documentation
> > > +that describes each case, includes additional hints to identify specific case and
> > > +outlines the corresponding recovery procedures. The documentation includes:
> > > +
> > > +Case - A list of all cases that sends the ``WEDGED=vendor-specific`` recovery method.
> > > +
> > > +Hints - Additional Information to assist the userspace consumer in identifying and
> > > +differentiating between different cases. This can be exposed through sysfs, debugfs,
> > > +traces, dmesg etc.
> > > +
> > > +Recovery Procedure - Clear instructions and guidance for recovering each case.
> > > +This may include userspace scripts, tools needed for the recovery procedure.
> > > +
> > > +It is the responsibility of the admin/userspace consumer to identify the case and
> > > +verify additional identification hints before attempting a recovery procedure.
> > > +
> > > +Example: If the device uses the Xe driver, then userspace consumer should refer to
> > > +:ref:`Xe Device Wedging <xe-device-wedging>` for the detailed documentation.
> > > +
> > >   Task information
> > >   ----------------
> > > @@ -472,8 +501,12 @@ erroring out, all device memory should be unmapped and file descriptors should
> > >   be closed to prevent leaks or undefined behaviour. The idea here is to clear the
> > >   device of all user context beforehand and set the stage for a clean recovery.
> > > -Example
> > > --------
> > > +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> > > +consumer to check the driver documentation and the usecase before attempting
> > > +a recovery.
> > > +
> > > +Example - rebind
> > > +----------------
> > >   Udev rule::
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index cdd591b11488..0ac723a46a91 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >   		return "rebind";
> > >   	case DRM_WEDGE_RECOVERY_BUS_RESET:
> > >   		return "bus-reset";
> > > +	case DRM_WEDGE_RECOVERY_VENDOR:
> > > +		return "vendor-specific";
> > >   	default:
> > >   		return NULL;
> > >   	}
> > > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > index a33aedd5e9ec..59fd3f4d5995 100644
> > > --- a/include/drm/drm_device.h
> > > +++ b/include/drm/drm_device.h
> > > @@ -26,10 +26,14 @@ struct pci_controller;
> > >    * Recovery methods for wedged device in order of less to more side-effects.
> > >    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > >    * use any one, multiple (or'd) or none depending on their needs.
> > > + *
> > > + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> > > + * details.
> > >    */
> > >   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> > >   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> > >   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> > > +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> > >   /**
> > >    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > > -- 
> > > 2.47.1
> > > 
> 
