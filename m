Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B356AE67B3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 16:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E8510E5D1;
	Tue, 24 Jun 2025 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gy9ulRTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86E010E5CB;
 Tue, 24 Jun 2025 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750773816; x=1782309816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1i4PvK0YN7Q4zt973KY9qZ166qnMlIVVLEUnS0WJfqs=;
 b=Gy9ulRTdDKtWPmxFDPuj9s/h0QQeIcdb1sj1l9B5LaFpiib0O7GMXyI2
 LgI1jucA4rLlwneHlBQ6AglCfZSpl1YW8EedwFya23TjLeRDhS+v7dX68
 aFlBibfEh/vNo80oI2VijOWgHRw0j++yPjxpMDf2k3DpFJoAv6fzIJFw7
 sLSl4ta5JW3L/RIeGRyHqR3qtQr+H0wZp/RMqrCtkhi0WkbRJcn8pJCnP
 qhY+50Ob1DZoaKQZxVdhTgpjYAXqI8b9EmQGTyqV+rOqXUXyXcOyKDQzx
 2iJiUjEJC8IOuZgdrTjIwisdikZG3n88CyiM/RNlq5uTFsxbF2Y6HUa1H g==;
X-CSE-ConnectionGUID: jJkz6VQ/QVucVfBc5f7eVA==
X-CSE-MsgGUID: LmNlhYGtQEetVeL+0gZdgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40628863"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="40628863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 07:03:33 -0700
X-CSE-ConnectionGUID: KztNJSZVTuyX0ms7lExhng==
X-CSE-MsgGUID: y3YXFE6GSY2OIyBMSqO9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="152450937"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 07:03:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 07:03:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 07:03:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 07:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3eST07WLTsM5bMZosTJoVwWLgSK0uGZEeftQZBKPwOblE65umUZBAAtn7CsyF8fl/TnACTExg5VJR+WjJZ/TqPrinqR0/bGmWRloEaIm9n0+7UXe/MNH9acxo+cSDC1sDFVc6wmC8Nd5USqGjCgo49LAGeymAm2KXcmxHDhAeCul2JRsn7SL1r2R9rtMaCxMvEpjxUhUiQ6XnVk8mUnv9MKahsI7TbgU/ECwLy9MPtj9hmJpyjlpRJ8hCaysZNNLoRnqPKVfH/ia0RCQKUKxr1YqlCraZ1/Ui+gImCVQ1qTaFd/TIXMCf8UiDugky9dQWpKNHeEqBfrSifr16rjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uZbmdT6apN1IHSCwjKQaLiaYvJYG01Koo0SgXLNiIw=;
 b=PwKETooN5+hYDDG2ekoJQICRqVz2odVQf2vPK0dOsbdSliOsTT5YYbU7ycMraKrhPePFiV31/usqhFBukUs9NJMrFWA893igZqUtdulxzGrE9uT/Mo/1nuh6CSLAn62D4Yrk9IkK3kM4DeRuMQN3XIN7NrRsauTtyxhprRlelPH1JkU1zLz/6wKKB0pzI6eb9XcoU0eFsguMGI78URWAe2SA0jAmZqF/7CJ5DH55lYlEfY8S1hyDu2Amj+OvKbQytVXWVq+qH/ZhG1cWuUiVwcJZRQHAWSXPIiGGm1wKr6vR4GDrrZ9hqKY1JxMvVhyEO+BmHMOF1lxL22ux4ac9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 14:03:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:03:25 +0000
Message-ID: <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
Date: Tue, 24 Jun 2025 19:33:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: f4834132-79f3-44e7-8283-08ddb327e2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dS94ZzNvNHBLSlo4aHl4MHBMRnJ6aHRaTEZMM1E4cUpLY1ZXRWZFTk9hWUVj?=
 =?utf-8?B?U2hTQ3NaQUJrM0JVZnNYWU9sellYaHgxTFdMdUhpbFdFK1hwcVBYSklSeXdS?=
 =?utf-8?B?R3VXYVY2TUUwTy8yWUV5NnlPMjluWmwvUHpkOHhRcUU1dklkajFFOVZ6YWhu?=
 =?utf-8?B?SlVSWWZ6ZmdlQTM3MmFIUGEvU3VINjhMdDc1bWdBSzFRYSs4aXB3eGRkdFRm?=
 =?utf-8?B?aytjcUU5elpxWXRIeDY4N2FDUzA3Q0VHZ3F3bHNjMC8veTJrcElmMFd1NDAw?=
 =?utf-8?B?Vy93SVdsT2owWXRHSXAxNTByQ3ZoYjNPK2l4UzRNVzR1NWJYaXRuTjNnM0h6?=
 =?utf-8?B?dkVHQzM5Yi9QaHhwZmtGVEI2K2huM1U4OTlPMk9FcE5qeTl5SVdSQzhoT2J4?=
 =?utf-8?B?ckFrQjh1UEJoZ2R3M3pGZFVNem1Lcktsdm50Y2Qyanc1UDdsTzlzMkdhRm5Q?=
 =?utf-8?B?ayszZkdxNDFmSkk2WDhWekRlVUw2dXNJbTVDWFFqTFYrZExmNXRKMTlhQkRZ?=
 =?utf-8?B?Z1JlcEE2RE5ZWVNRTG9ySm9XMktwdy9JMGxOOElKS0hIUW42WUt6YXBQM0RB?=
 =?utf-8?B?SURDWVZVeDhrM0RuTWJrNS9LZjFrTzlmRXo3Mk9Zb1o5Q2ZXOUx0UDVhdFZt?=
 =?utf-8?B?ZWxLbDZYVFZFRGZNSzVDaXhHTlYxUEtlb2ViSVdqVHd5eXRmQm9sYXN4Z041?=
 =?utf-8?B?WGQrS0ZhS0tqcml2MUpvNnZlTEVPYlE0TTI1eEJMb2lRTjh1Q0Yra0QvemZp?=
 =?utf-8?B?TVhhaUdOa2QwMXdoSU5jSlBWeFBLakVod2M0QVhNOHFYZDdvQVZ2ZHVIdVBQ?=
 =?utf-8?B?ZDA4MDVYdGo4eHBsdk9yeFYxRnNIQUNHTUN1cHd6NStRd0ZMWTYyZlBoSktM?=
 =?utf-8?B?clFtRzZxQS9ITlpNREFGZ1dYbUoxT21ESGF2dXZoejA0QXNzSllOdEFtaEl5?=
 =?utf-8?B?T1JkRVpyRHZoaUZxNm51VWJndVp4Um8rVEpWMG0zOXh2bUh0VjVEdzFFMGZm?=
 =?utf-8?B?R0U4RXVmN2drUnBrWmZVdFJPMHRDcXJ3aXJLZGlLNnJlY2RSU3Rlemtvek96?=
 =?utf-8?B?VWdweXJ2YnkwaHcvaEp6bUh5MTNFSXV6THoyVmhDMHBKZnhYUzdJYTdJakhI?=
 =?utf-8?B?aVkvTXJyVWN0U0loVndLY2doVU44ZFNDSWhUUnhsY2xYM0lNeXcvcExoM3RY?=
 =?utf-8?B?UnJBNVB1bHUwOE5aSGxDZzFRVVBzWTlRVUtPVDlLeitMY3NsK3pXbWVocTMw?=
 =?utf-8?B?b3h2d1VHaTRVcUxhOXFEWXhWZFFBaURQbzhYcGFnSHhIY2FqS2FzcGQxWVFm?=
 =?utf-8?B?bDI4VUhiVFpydkhzR2tNZ3crbG1xU2FPUW5SVnMwOFBQS3AzWVFFSmt0Qnc3?=
 =?utf-8?B?ZGNkVHNlNW9ITzgwdlcxT0dqTHF6Y2t6dUNaSkhzOHJ3WFRpOXAxYmUvenpZ?=
 =?utf-8?B?Y0JWeWhBYXAvam5IZUF1Vld4YTlBeXZCUW1yTHZGTUtpMWhKZGV0S0haSXBv?=
 =?utf-8?B?RForeVptQ3h2QVAyR3JBK0xjZWV5blFUb2ZNMFFzNndwWHBaRFlhbFMyUVRq?=
 =?utf-8?B?cHJYTEl1dXl1bmR0VWxMUDBIWXZUZE1XcUtDYm1JaExwV1hSam1UOGtkamdn?=
 =?utf-8?B?elo3V2w0ZDFUVWROckpxTHlpVGRja1kwTVBXWUM4dDV4K3NvTUVEZEh2VjJw?=
 =?utf-8?B?Zm4rRkZ4N1BzTEducDhTOE42QVdWWnZUcC82d2U2aGFRUnNaeUJYMi9aNVd1?=
 =?utf-8?B?K0ZDYXJZMUxWQU5PS3FCK202d3EwS1Y0RTYyWFVmY1piNkNESmhOeW5mS2tq?=
 =?utf-8?B?UWJTdGdlMzU0ZS9LS0N0bFEwN29TTzJkdno0eDZLYmFiWXFQa3pmSjZWamd0?=
 =?utf-8?Q?0E+ieaIhSLGvJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlh0WDVmb0FoUisvTW0xQVpMNUY4RkExNlFncnRUOHpLTE00dW9ZVDdYMzVi?=
 =?utf-8?B?YnlEQmFTY2laVnVDVERBU2FnV0RrTlhYb2FRQVJwaVVQYlBYNmNKSjgxblpI?=
 =?utf-8?B?NlJhTERDalJaR0llQ1NmQWIxZFIrWmsycVkwc3ZVZHhUc2JHeHB5aTB2bDUx?=
 =?utf-8?B?bXpLOUJXVGNkRXdBZU5QelU3UGQ3ZEp4N3JRMWwvckF2c2FTUitRdWJDRVRh?=
 =?utf-8?B?VlJ4c3BhVkUwUVI0bnlSdGY0V0RPR1pWYlRMa1ZWQkR6aHRIeFhZdUVhL243?=
 =?utf-8?B?N2RmRG05L0FmVEFnYVFLZmNUaUpvNzJ1VEtJSEJoQTd4d1d0ZFpmejJCc0hv?=
 =?utf-8?B?ejlhRXp6VTEvck42ZWRFdGJwVzNMYW5xZWlHeWxxNkgzUFJKUkFVYzU5cFl4?=
 =?utf-8?B?L25xVVlNakxyWnc1bDErOGMzdFBNUG1ZQUI4djFJYUFNS1FRUFB3K21TaWpV?=
 =?utf-8?B?NFZ6WXAwRk44bDhsNW4rdmNGQ2JBS0NYSUhiaHg4LzZUQWQxOHNmc0VJYU5x?=
 =?utf-8?B?QWhvdFBmTlY3dTlSa1Z3WitHY0xyb1VRSjhPT3duVDg0akpNT3BxZ3c1Nlkr?=
 =?utf-8?B?cFhna2t0UDVYK1BudjlUc1RUSjcwaGo0L1VhMTNlS1g0azluV3NuSnBJaW1D?=
 =?utf-8?B?b2FPUFRUK1ZjS0Jld3JyZVMzS3N3MlhJSEJSTndlRTNqRk0zREg4aHZXeVEv?=
 =?utf-8?B?b2NMV0J0Rll4NnlTc0FXeVVYaGpsSG92bDk3WXoyYTdBaVdaNjQzT2VlYjQ0?=
 =?utf-8?B?WW1JdEFEQzl0SFRyL09pcHozMmNKWlVJWlkzZGxIYzhyZTM4ejBKcWU2MjFn?=
 =?utf-8?B?cHlCWkhFNEVCZ0I4UDFna3ZCZHRwYWtzNzBaQjNTWjVoR29PblRmaHoxOWRK?=
 =?utf-8?B?WDY5OTl5eUc3ZlMrVkJjL1JhS0lvanJJTnhER0FwUWwxSlB3bUFlSERlZzVk?=
 =?utf-8?B?K25DTDFwWGVqVzVtNEwybzZtOHdYMnMxbTlwek1BR2d4SnhFNE5YYUptNGgx?=
 =?utf-8?B?N1JtRlI3WG1PdkxpQU5VNm0ySXJpZjNyVE8zZnN2Y1l5S2o2S3VPSWdiQ05R?=
 =?utf-8?B?bndtNGlQS0dXTEFNN0J5cG1BWENaT1V2RWE4cVNKNFpwMHF2VEFqNWhwZkVz?=
 =?utf-8?B?N0hrbnRIWFBSUnJoZElHSlRiTlVnUzZnU2xwNzl5Ky84a2tOcDNLc050SGxj?=
 =?utf-8?B?MEp6dmtoSWpaS0xlUzRlWXRXelcxWGFUdmd4MlBzbHdKNWwwdVVjYW1NNk5P?=
 =?utf-8?B?WEVpU1Q0RkI0ellHeE82VmN1VU9aQUQwOURUUVd5a295aSt1YUxKRzk5RWI4?=
 =?utf-8?B?WFpBcTFWWC9ZR2llQXhMTGNpd2NIYldBQkUwUDZza0ZORlA1ckcxaXlnM1BG?=
 =?utf-8?B?UmRLTWVpdGFLNWV1VzF3Q0RYVjI3Nkx4MklCOURLNGZMVGp5Z0FhNnhsSnFZ?=
 =?utf-8?B?R2tuRWMxSmtTTE5mSmZCc3h3b3dMR21YMjFmekxhZFlwVmliemdnV2t0Z2dS?=
 =?utf-8?B?K2lDVnZRTlRvMy9zRzg0WlJVYndkWFhFdUI2K3hzZXk2bVNlaTdXbE9iaXpY?=
 =?utf-8?B?WlVWRHdLeFpMYUNBeHFlN3I2YnQzaTV3dzllbm95MTYyUlE5M2xQeVFxWmxS?=
 =?utf-8?B?RjIrcE5xOWtqc2V5ZkxrRnk3dmg2T3Fua0hTQkduU2ZQV3puREZKK0J1T0tO?=
 =?utf-8?B?UFRhdUcrY2V5UVpDazQ4cWFHdmRRMWZIam9zNWZGVjkwTnpxd0pzT0xON3B6?=
 =?utf-8?B?ZUdFeTJYMmJWWjVkcHprUGwvMXNPczYwc3NHMXFDZm5LWFR4MEQ1eFErV3M5?=
 =?utf-8?B?QjVoVjBBRk9lNCsycS8yWjRNenliNVdYUm1WRFhONVkwSVR0U2lvODdibEQw?=
 =?utf-8?B?SnJHMm5lNkk3TGFuTlZlcDFjL21yVy9rRi9tbENPNDh2aE5SMnhMMk9sRlFu?=
 =?utf-8?B?Z3piRGRkcG1uTi8yN05sNDF5bkN0ZFZlMmJwUHNabUtja0dYSEF6TVF5MGR3?=
 =?utf-8?B?S2dDZitYVk5rL01aSDllYXhSaUh0MnZ3dEFJaFU5K1NPWHBxM3o3by9GcHVq?=
 =?utf-8?B?QVlGVFp1NldlQTJualhRVmFhNlFsQXo3YnJkMUlOdjk3Vk10SmRkMWllTFRG?=
 =?utf-8?Q?oyPIKaNcV0n+m5rroQZzjuA6I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4834132-79f3-44e7-8283-08ddb327e2de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:03:25.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKi3pU7iBYX02GgAq0rxbF3BSLIHDC92MGRp4IAFlF5XI2KbBDvL6PmDBtdRb8p4iLPazRjjlP10VI2o5FReQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

Hi Christian

On 6/24/2025 5:56 PM, Christian König wrote:
> On 23.06.25 12:01, Riana Tauro wrote:
>> A device is declared wedged when it is non-recoverable from
>> the driver context.
> 
> Well, not quite.

i took this from the below document. Should it be changed?

https://www.kernel.org/doc/html/v6.16-rc3/gpu/drm-uapi.html#device-wedging

> 
>> Some firmware errors can also cause
>> the device to enter this state and the only method to recover
>> from this would be to do a firmware flash
> 
> What? What exactly do you mean with firmware flash here?
> 
> Usually that means updating the firmware, but I don't see how this will bring you out of a wedge state?

It means updating the firmware.

Series:  https://patchwork.freedesktop.org/series/149756/

In this xe kmd series, there are few firmware errors that cause the card 
to be non-functional. The device is declared wedged and a firmware-flash 
action is sent.

There is corresponding fwupd PR in work that uses this uevent to trigger 
a firmware flash

fwupd PR: https://github.com/fwupd/fwupd/pull/8944/

Thanks
Riana

> 
> Where is the rest of the series?
> 
> Regards,
> Christian.
> 
>> v2: modify documentation (Raag, Rodrigo)
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 6 +++---
>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>   include/drm/drm_device.h       | 1 +
>>   3 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..cd2481458755 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>   more side-effects. If driver is unsure about recovery or method is unknown
>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>> -will be sent instead.
>> +(like soft/hard system reboot, physical device replacement or any other procedure
>> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +434,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    firmware-flash  firmware flash
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 02556363e918..5f3bbe01c207 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_FW_FLASH:
>> +		return "firmware-flash";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 08b3b2467c4c..9d57c8882d93 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -30,6 +30,7 @@ struct pci_controller;
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_FW_FLASH	BIT(3)  /* firmware flash */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> 


