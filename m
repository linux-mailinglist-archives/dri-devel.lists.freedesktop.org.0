Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85272ADF80B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA0910E94F;
	Wed, 18 Jun 2025 20:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIfOEA6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E459810E942;
 Wed, 18 Jun 2025 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750279611; x=1781815611;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eWXcZA0NNWrvN3Usj0mvPEtPSsu9wkVHY5jWGjQP7LE=;
 b=UIfOEA6gDh8tMSEi+JlHt4z+VIG8hsgec1lT+jHVTiERbOC/ug13N0np
 mKbb6FlmYh0wVFRIoavIjki+ZuibYI/lOlp1iDHU4wxc79sjwGLewOUzc
 om3anlle3ctJ3bCeQXGDlM2h46W0jH4odvqrD7ZbhMNvPJWzXKUS6Glb9
 fyJrHSFbBj4he2otxg8LjVykL7ru4wxrLixOQyd5oB2dVVS7zJZfpJSa9
 mV/xr3XSvqFsVHJmq+B5E7EP3ztweJjJ4dtPWZbSqeoBvlcJaVhbaG8zb
 FX5R6nQOD9rvGXdUD2dc+FE+t9Ga4QD9xFvQvClmQHNJe4Ngjv6Zz+Dhl g==;
X-CSE-ConnectionGUID: gQJEGrIBQi6l2LEaByHOLA==
X-CSE-MsgGUID: /1PqGUbTSz2n4pYsF0GHUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55146318"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="55146318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:46:29 -0700
X-CSE-ConnectionGUID: wr5dgjPKQcy+N24ZoLpvpw==
X-CSE-MsgGUID: PeQ9xxNgTQ6Q1opotEKPMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150011546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 13:46:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:46:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 13:46:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIW2m7URBomtUxQYH6xLm5D8dMYpRteDJ0h1Oisuf4le9XS8lOLBrafPONs82pmbzAQoK8OGRtWYEx2OuZXWz7OJUHXr4ZLBDcIQygpGQEZxWaaAYBTD6j/bOwCJw6bCn6Tm//3OHOQtmy2SBrDMf+ZV0kDpaN/Khs7mXd7xZz4zyKp0ZAHnnNHGZ+RrqM3EtXj86Xqmp/kxR7yx71zYZ5DcSVc60YJxFnOL57VmAG6/X6H7ppgC8RfD9QlKVTchx9GDbX4Rkrkn50bbMNnta4N4jaDGCnJHknxBNPpFVtCwyhWLOqxcyJWmoGVN+At+/+ho+lBB+XYRaJXbEsyl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/EsW0Ylc1V97exQKSZOpDwP3S3pF+unh0MbRo4t8Pg=;
 b=HByUS/N7iNd8wcfdOT14aWGJr4c/sKneWLRV7eCMcibhKS6QIbtDKGOClrXXT6WQLDSAhzWvauXyPFvBJ4vl4/lmHyvG74FQNj7VW4UvthttRbzmfjI1w3JSJtuHEHEyl3EIvsnAoY9AS20RAjumc6nX5BjAj08YbaPqTsAUJXFswEvWwce+FR4GeNcZPCw6MXCgYaBXIX/9alNCbFbZ0bWWhTdiy/TT18KK+7OwSx9iqeDunNEk00qHJu1Ldg6Ic0tzFeJbuHOvV70Pe/J5aP0audgTL0QqhvBkoxQgH1/YMRCVBCgPP8RJqhHVEXLYnpVf7ffVBzKn74isYA3Plw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 20:46:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:46:26 +0000
Message-ID: <d243bdbc-b3b3-4d58-b378-04d301df3b5e@intel.com>
Date: Wed, 18 Jun 2025 13:46:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250618190007.2932322-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 1853e5d7-9c39-4c82-14c1-08ddaea93181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkNTRGZlbUwxKzVnbGV4b2FteG5NVjdqVklEdEJ1RGxMd3NtMlR0VHU2QlBG?=
 =?utf-8?B?RXZSQ1BPZmVCcm1mck1ha1ZmaEt2Q1crZVA2SDY4b3dyUEJhTTlqYWFZWXJC?=
 =?utf-8?B?NkkvRGR2REZPZld3enlVUlZpZklJNGxMWTNPR2xDREdvRVJqVlVNRllrY0cz?=
 =?utf-8?B?djJ2ZFExZDRUTTRkbnlIWHNzUlM2MitUYUIyK3hYVllnSDJRQ1FzL05NQ2RH?=
 =?utf-8?B?UHpmRUpJeVdBRlAzS3dKOFJSSGtNdmd4ZkFZS2RXNVdJZnVGbnE3OU5qL01z?=
 =?utf-8?B?VmJmUWFzaEtsNUkvVnhHS05RZk15TFV4clZuc0toRHNxcUJTMnRCUzhjVThT?=
 =?utf-8?B?TW9DVk9TaUhCcHJQdkhUTnRoN09vcjl5VWZINW9keUZoV29DTk9mUnA3NlBr?=
 =?utf-8?B?YlU2cURCTEpIYy96TEVqRmVpdnAyRk1wZHRpNCtER2EvK1JyWXdpV2M4YWx4?=
 =?utf-8?B?RlNrWW96NG9FYmxDRzlDK2tDMEpzQld1aGRWSzlYaDlKb1pWVXZ5dkxjSUov?=
 =?utf-8?B?NUdFekhlOWF0ODlYd2pLY3NjRWJIeTlmL2NSSFhrUFZuQzZDTDk5bFRsSVJ1?=
 =?utf-8?B?Z2hscmhCZXhtMjF6ekpCSGZXV2RhaGcySTltYUFKekZUWlowcmJRaEdyQzdx?=
 =?utf-8?B?R2p5b0dRRHlpR1RidUNBWGQ0SFJFODV6Nk9hdjdjZFRoRFNsNDFSb2hSY0hh?=
 =?utf-8?B?bkRxVHJIU2JsNnRRL1FsZUFxZEJBQjYzQmhQQUthdTZ3R1VVbGpLU29YSG9M?=
 =?utf-8?B?OXpKeVREUDYzRnVQdnVMZUM5ZFZra1M1S2FHQTFwb2p4YU1LQnp4UWdnajZC?=
 =?utf-8?B?Y3E5OXJHTG9Od2lIRWNvbkhZQlpmVlMwWm1PeU1FanY4Q3d0MzFKY3kzQ3Mx?=
 =?utf-8?B?YkRTTnZUYW9LZ3hvTlBzdS9IYU1tZmtQSlloNDYzcDZzUHJXMThjYjdjaHhy?=
 =?utf-8?B?dzh5ZjNWOFF0WkE1Umc5YmkwSmYxS0x1SUZVTkpXTU00Ni9ZMmd5Qm54VlA5?=
 =?utf-8?B?L0ZWRm40WlRsYmRQT3VzaEdqbTczcjNuMjg2M3NBNHdkVWxaMmZ4QVFqNTlZ?=
 =?utf-8?B?WFE5bnYwU0xESDFRYktWQmFreTY2OTdWSTQ3NUhUWi84UEx3dTVEYWtseHVS?=
 =?utf-8?B?enRGTThiZk1WU040eHJ4UVlKanhXOEhxcEdueFBGaVBrZ3ZLUjMwaVNrU2kv?=
 =?utf-8?B?T3ZybTNkTC9BbjcrL2xJcE55RUU4eEJGdmVLWVd2VE9Da2FBcFdNZThRY1cr?=
 =?utf-8?B?cUk0TmxBV0hsTnZ0c1NEZDdkbnlIck1QaHNvcHJtUGNwd3VveklxR3FIN0lz?=
 =?utf-8?B?eTJoL01uTi9EZ2R5VHlRd2JkMHlnaUJJL1MwNEdTMHBCTm1uM1NGRTd0R0RL?=
 =?utf-8?B?ZkJxQ3VZbWg5MW5MeCsvL2t3NlI1UDZQWnFUR1hrN21zUkk0UVR0am9XSGhJ?=
 =?utf-8?B?RkRpeUJCR3dtclJDL1FEZVhFb2JUUUlEZHo0bmMxT1QzWmZycEx0S29kVTk5?=
 =?utf-8?B?WFpOcE9VeVdXbGluQkRrTkVqU3VHRWVrQlZ3bG1RcldsQytGdmlhMlQxbk13?=
 =?utf-8?B?ZUNhQkxaT0VXU0JJZm1YcmRlTkx5bCtSZkVpRDVjOW1oblhtaytxQTlRYjZn?=
 =?utf-8?B?allNVGVwMk5sTVVzMGYydjA2dWd5WCs5TUpTQjd6ci9hMDkyRXVHK1lzZ3VQ?=
 =?utf-8?B?RFRZbVpvZ0xud240S0ZIS0ZaS3JEVGEyK3RQR3loQTNabFZCV3Zzc1dkYmVl?=
 =?utf-8?B?eDNDVzhlUk1nYzFwdmJuVDFBR1FXNjdWWGVSZTg3emtCNnhKQzQ2aGJlRUNu?=
 =?utf-8?B?OERjU0c3dFRxWHRjVEZMZklDNFJETWRrVktQWVR4amFIem1QUkJnbEhGVldL?=
 =?utf-8?B?bkF0YmRLdkZUVXRaT2hZSkZ5VncxYVZRVXY1YVVHelEyK25MY2FjL1BheHhn?=
 =?utf-8?Q?TA+0z5Vijq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5Lc2E5K1BkSjNtSkQ3N3FrUEg0aGN2MjdLSkwzQlR5dVpqK3p0MHc0cUNX?=
 =?utf-8?B?c01rOTdZTUNpZC9XNFo5ZllzZWtFclhWVUo2ZlRPWEl0RkhLUk5iVVBIUkVh?=
 =?utf-8?B?S2lkQlhNc0ZuUDNkVHpzM2t2TElaWnJ2M1gra3lLZzB4V2dOQ3VjcWJsK1A0?=
 =?utf-8?B?Qy95eXZWM3RIRzRWU2Y0YUlKTE5qbUkxbnhmNndSeWRCMVBpZzZpR1VYYVJj?=
 =?utf-8?B?WUgyS2F2NXlBSFVtTDI2ZGttbnN3RHpoSHRLK09FbzF6YUsxVm10S2JkMWow?=
 =?utf-8?B?TWFhbDVIem56UEgzTUI3RWpOTkd4bDd5aVFhN2JMbmlEbmxmRVlxTWoxWkxF?=
 =?utf-8?B?TlFwc2xaSHQvZTl5d1FNZFF5eHRra0JOUzBteC9hMVg2Y3dtZ2xVVDNtUDFS?=
 =?utf-8?B?NlhIbmR6Tjc0eVZoa0JHQUVxRkwvTnRuODlIWGIwMnl5TExnaGxIeS8vSito?=
 =?utf-8?B?NVVVcjVCT1VmckdXVjJpekpIeTFhMUFTcCtvNnp0WW5sRGZpblVlK1BFUFF3?=
 =?utf-8?B?RFhmSEFxcWtianlEYVhUY1BjRDl0NlN6Szc1QUJ5bmlWd29UZGdDN1ByMjN2?=
 =?utf-8?B?TnhYbndNbUR6NVFvaXgzb2FxV0dIcWFtRTlHRDluN012UlVXbi9oWVcxbndQ?=
 =?utf-8?B?blZMcUtsRnpIelZTRlRsV2l3RzVlaitOdHg1T1ZYa3YrR0c3bE45NGpLNXNx?=
 =?utf-8?B?T2twYXBaT2tPanR4UG1nTzFKK3hWb0ZDSkRGdkRWdk5TU1lsUkRTaTRDM01p?=
 =?utf-8?B?TUl3U1BpdDg2OVgrdEVtMUJhMW1QSER4QXdGWFhTMzFoT3NENGcwZXFFcTll?=
 =?utf-8?B?M2hiYm5lYm5lcXQrRXRBa09tU1BzeTNIelB2aUJwZlo2YjVlQ3BhNlR0aVVT?=
 =?utf-8?B?ZXQrTysyWUJrK3hvU2YyK0NOWUJTcHp5ZlpCTlpkNnZxR1VTR1ZRVmhMNUxr?=
 =?utf-8?B?UVJmRlUyVnpTbklSWEFoejAySmN2enFrcmFzUE9UYVc4dkhPWjdObWEwMWw2?=
 =?utf-8?B?aFE3cFh4UlFBZC9LV1hDVFpReFJSMStHU1IvMml5aHoyVHZ4V0xITm8rbXdz?=
 =?utf-8?B?Q1JNcDJOeElEMVN1aVJaQjRRQ2ZidHF1MEh3VWttcExUUDljMC9jUU5ZS2ky?=
 =?utf-8?B?VUd6L3lJdGU3RG51dVZRbWM4Y3ZGd2hIa0pnTVdLMTJLeWltMjdJRXd6REJB?=
 =?utf-8?B?K1B6cHMrS0FDdXlqRHV3OXZlTE9FaUtEcTB3UUpwajZoUU9LNVVwMUsvang4?=
 =?utf-8?B?Um5RdWVRYVlhV3RPNG56V0ZrVllNWlA4M3BIcnFmanVNQXVrUzdHSHhrS0lX?=
 =?utf-8?B?dENrdnI3bytLdE92NDlhZHFsY1RxUlZxU0F1UmVSODhxajRtOFArTkZaODhv?=
 =?utf-8?B?T21Cakpld0lZbGIyV3JmY2NaeFRvcDRSYWVmcHo4S3RLSzljSjFpeU53VkZM?=
 =?utf-8?B?ZjdsTWJjYm1sL29PckxIL2gzOW5XVGZCOVJPV0FSSkh3akg1ZkJlR0Z1anZX?=
 =?utf-8?B?cVpCeEN3SmdZMDBqdTZpTEwvakVCYjFwMkhxQWJJT0RQNU5FNHUybGpDUTFl?=
 =?utf-8?B?emoyN3VUeWdUaEo1RWZTbnUyMHRIR2Y0Qm5ON0lqaHF6RlRzcnFBVVRCa3lM?=
 =?utf-8?B?cThzaXFKYXJhRFh5MmkzeEd3eU82bDVESEg2TTVBUFBNTWhnYnhpdTA1Uzkx?=
 =?utf-8?B?ZzhwMUtxMnlkQUFvTXRxdFFvTTVSaEtleWxQdkdBWW0vNld5NjZ2WHFjSm9Y?=
 =?utf-8?B?UStNMFBZYTVGRkp1ZTY3UHRZZytSYnlwTFVyOU5Bc2E4UVVpY3poU3p2emJG?=
 =?utf-8?B?c1dpZ2NXUTVUVXFleloxODF3ZGZqM2JNMW5Dbk9sSFNzdk9PcU82dlFydWVG?=
 =?utf-8?B?Wk1KWE83M0JicTJlemo0Y3NkNU1HZ0xBazgwMG5pZVhDTUFQVXRJTVlOT0kx?=
 =?utf-8?B?Y2JPZkJiZDZTakdoOGwzM0tJSGNYYzBqa21NdXhUeld5UG5OdnFuTllhM2lo?=
 =?utf-8?B?Y09CRkU2cmc0US9HeVhkZExuaS9TZXB4YUp0RSt3SmNqZUtnWnVaYkJkTjNI?=
 =?utf-8?B?ckNFKy9CSW5aUHd2UytXTzBUMFhaSTArZ0EyMnJaVjFtenFkdS9NUllXaXlo?=
 =?utf-8?B?L3pqL2UwVDdpM1VSQnpSeUVIMm9OZXhwUG1FdXFiRWZyUDNUenM3aWtKTDND?=
 =?utf-8?Q?xwn19hUPKH67BboHoHo1uvQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1853e5d7-9c39-4c82-14c1-08ddaea93181
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:46:26.0839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW9EmWgnUy3OBfE7UFqYwiFg/Oi2IQyG5fKSwZtTyt23RAuyRe0Ww0npVpabnUsSceddslkhEXVpH7k/OWf4O4p7whZDhorRJPire2VZZ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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



On 6/18/2025 12:00 PM, Badal Nilawar wrote:
> Search for late binding firmware binaries and populate the meta data of
> firmware structures.
>
> v2 (Daniele):
>   - drm_err if firmware size is more than max pay load size
>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>     not be available for all possible cards
> v3 (Daniele):
>   - init firmware from within xe_late_bind_init, propagate error
>   - switch late_bind_fw to array to handle multiple firmware types
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 97 +++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 32 +++++++
>   drivers/misc/mei/late_bind/mei_late_bind.c |  1 -
>   3 files changed, 128 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 52cb295b7df6..d416d6cc1fa2 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/component.h>
>   #include <linux/delay.h>
> +#include <linux/firmware.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/intel/i915_component.h>
> @@ -13,6 +14,16 @@
>   
>   #include "xe_device.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +
> +static const u32 fw_id_to_type[] = {
> +		[FAN_CONTROL_FW_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> +	};
> +
> +static const char * const fw_id_to_name[] = {
> +		[FAN_CONTROL_FW_ID] = "fan_control",
> +	};
>   
>   static struct xe_device *
>   late_bind_to_xe(struct xe_late_bind *late_bind)
> @@ -20,6 +31,86 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	u32 uval;
> +
> +	if (!xe_pcode_read(root_tile,
> +			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> +		return uval;
> +	else
> +		return 0;
> +}
> +
> +static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_late_bind_fw *lb_fw;
> +	const struct firmware *fw;
> +	u32 num_fans;
> +	int ret;
> +
> +	if (fw_id >= MAX_FW_ID)
> +		return -EINVAL;
> +
> +	lb_fw = &late_bind->late_bind_fw[fw_id];
> +
> +	lb_fw->valid = false;
> +	lb_fw->id = fw_id;
> +	lb_fw->type = fw_id_to_type[lb_fw->id];
> +	lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;

nit: lb_fw->flags should already be zero here, so no need to make sure 
that flag is not set. Also, that flag is ignored on BMG, so there is no 
need to make sure it is not set anyway.

> +
> +	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
> +		num_fans = xe_late_bind_fw_num_fans(late_bind);
> +		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> +		if (!num_fans)
> +			return 0;
> +	}
> +
> +	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +		 fw_id_to_name[lb_fw->id], pdev->device,
> +		 pdev->subsystem_vendor, pdev->subsystem_device);
> +
> +	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
> +	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "%s late binding fw not available for current device",
> +			fw_id_to_name[lb_fw->id]);
> +		return 0;
> +	}
> +
> +	if (fw->size > MAX_PAYLOAD_SIZE) {
> +		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> +			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
> +		release_firmware(fw);
> +		return -ENODATA;
> +	}
> +
> +	lb_fw->payload_size = fw->size;
> +
> +	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> +	release_firmware(fw);
> +	lb_fw->valid = true;
> +
> +	return 0;
> +}
> +
> +static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> +{
> +	int ret;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
> +		ret = __xe_late_bind_fw_init(late_bind, fw_id);
> +		if (ret)
> +			return ret;
> +	}
> +	return ret;

nit: this could be a return 0, since if ret != 0 we return earlier

> +}
> +
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>   				       struct device *mei_kdev, void *data)
>   {
> @@ -89,5 +180,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   
>   	late_bind->component_added = true;
>   
> -	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	if (err)
> +		return err;
> +
> +	return xe_late_bind_fw_init(late_bind);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index ef0a9723bee4..c6fd33fd5484 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,36 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   
> +#define MAX_PAYLOAD_SIZE (1024 * 4)

nit: could use SZ_4K instead of 1024 * 4

> +
> +/**
> + * xe_late_bind_fw_id - enum to determine late binding fw index
> + */
> +enum xe_late_bind_fw_id {
> +	FAN_CONTROL_FW_ID = 0,
> +	MAX_FW_ID

nit: Maybe use a less generic name here, to avoid clashes? something like:

enum xe_late_bind_fw_id {
         XE_LB_FW_FAN_CONTROL = 0,
         XE_LB_FW_MAX_ID
}

> +};
> +
> +/**
> + * struct xe_late_bind_fw
> + */
> +struct xe_late_bind_fw {
> +	/** @late_bind_fw.valid: to check if fw is valid */
> +	bool valid;
> +	/** @late_bind_fw.id: firmware index */
> +	u32 id;
> +	/** @late_bind_fw.blob_path: firmware binary path */
> +	char blob_path[PATH_MAX];
> +	/** @late_bind_fw.type: firmware type */
> +	u32  type;
> +	/** @late_bind_fw.flags: firmware flags */
> +	u32  flags;
> +	/** @late_bind_fw.payload: to store the late binding blob */
> +	u8  payload[MAX_PAYLOAD_SIZE];

Sorry for the late comment on this, just realized that this is a 4K 
allocation, should we alloc this dynamically only if we need it?

> +	/** @late_bind_fw.payload_size: late binding blob payload_size */
> +	size_t payload_size;
> +};
> +
>   /**
>    * struct xe_late_bind_component - Late Binding services component
>    * @mei_dev: device that provide Late Binding service.
> @@ -34,6 +64,8 @@ struct xe_late_bind {
>   	bool component_added;
>   	/** @late_bind.mutex: protects the component binding and usage */
>   	struct mutex mutex;
> +	/** @late_bind.late_bind_fw: late binding firmware array */
> +	struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>   };
>   
>   #endif
> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c b/drivers/misc/mei/late_bind/mei_late_bind.c
> index cb985f32309e..6ea64c44bb94 100644
> --- a/drivers/misc/mei/late_bind/mei_late_bind.c
> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
> @@ -2,7 +2,6 @@
>   /*
>    * Copyright (C) 2025 Intel Corporation
>    */
> -#include <drm/drm_connector.h>

This change shouldn't be in this patch. If this header is not needed 
just modify the patch that adds it to not do so.

All nits are non blocking.
Daniele

>   #include <drm/intel/i915_component.h>
>   #include <drm/intel/late_bind_mei_interface.h>
>   #include <linux/component.h>

