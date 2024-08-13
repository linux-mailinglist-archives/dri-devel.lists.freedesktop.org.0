Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66EF9505AB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3366210E338;
	Tue, 13 Aug 2024 12:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtTEyqYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524FB10E308;
 Tue, 13 Aug 2024 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723553772; x=1755089772;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VueBW9z0Y6RJiAe3mxAK/MOPGbGQesx3FT3V0MYhsf4=;
 b=dtTEyqYV5tqm/tfxcDV9CHpt6Xa/BqXm/cIRvP+taDHJINSEc2pW6r3m
 4ZjphTkQfQyRyY/CwJ112sHrPFX9A0J0E2xJ4bl/FtqYKplG3y9b5fT/e
 23nAWyf8o8dK6qkIafbAW9HaYU4GKxQYvRNWsunNcddft0CWZptQgOiAu
 BJw2XntAVGjeNxzN/xg3qUhyYPMIFa0i9DpY/3RofQWlUKTMmzIUS1YDn
 nI6gHTLAmTgxtGxoXVHba4xqjRb1OBz3/e+P41hLtgRNDBxg9yUCW6U5V
 zsHB/+gqUV30Ha79YEAUuK+/hHfrCp7YWrzdcHp49oKvkC1oLhrLjC0Pk w==;
X-CSE-ConnectionGUID: YEMHg7fRTBu9k7FZpk06tQ==
X-CSE-MsgGUID: zIZhauKrQ/K1r/aSOtj5wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25506104"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25506104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:56:11 -0700
X-CSE-ConnectionGUID: XPTI7pJ7T8GHlN92j3YviA==
X-CSE-MsgGUID: OixXsUGoSTCPMCELXuhfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63066014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 05:56:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:56:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 05:56:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 05:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH3+JK9gQAWn9OLviqyOwLgU+AJ0ezY7kN3oyITC+uUVG27rRDLK9ltXnlzIYdsZ1Nz3lY7L9OGGlH2eKF7PJmyoMhI+JDt8FiHlP55/1+dpkzKvRqlEwL0yVTCJbEcq8wSl/Urpjm8cUgbVY8ql0zsIO8xtbMv+49CQtI99gBeuU9+5ULw62+xhKfyFdvz10+yqbXOm0nLxCgjvnmwkkPz15SlG3VmJUE/xO21YG3vI8q5OAQxVt+ch4ppib2oTWdMajDPVhUMY7HuuVsQk94Mi1/uGrsoj44j2zr9Ap8k31Fk/ilCc6Zk5MoagkOUdh8Qt68eSyaz+8twwYL8avQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M/I9/qu9MJazlXcRJT4pMsfMK6JUJ2nh3g4IjqNWpE=;
 b=YHsQk7/GyhcpAkre1tHAaaskARlujzIVDzqhhx0m88gk35yiOirq4SbS2USyn78cOLi5+Q/snf8j6LrLCDJH78S/A7F7VC6NCtgFpzrYHDykvEVvcHoyQj8KYUYPlexJEg8ygXvGQjckkF0nPggBb3a/i6+q1bpd76OcrNMu6JrvyT/Yx1+rcx3TGw6jxBoRGMDTg7ezaCAnXfPvFQmCd85TBSmo4+B5606C6mViPvgLqfDz36zyNyi4F8NDx/SmmStNnls0vekSYE2cVTlZk/ZgS3Y3XgbOQwkDDEAbKwxM070x23/mRRnzdnNl67KfK2uUOsmBpGzk66BORhCGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 12:56:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 12:56:05 +0000
Message-ID: <c089e457-6461-4a43-94d3-25e4b19bf52b@intel.com>
Date: Tue, 13 Aug 2024 18:25:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
To: Jani Nikula <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <akinobu.mita@gmail.com>,
 <akpm@linux-foundation.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: efb2b72f-fa70-4630-c02b-08dcbb974b04
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0hFMEZsY1dsUjRvUGVQYXdOOFV2TUl2YWhHWjVBWE5FdlZKcld4RzBTNS9W?=
 =?utf-8?B?aVFiTHRjUjNWSmgvUVcvWnpMWlM1dVFmZFVXUTVJWEN1bFdQckVnbmFQay92?=
 =?utf-8?B?MFNudDdudGJTbmhRbHgvbkdBWGlFNGVhSmdWQUVRdHFXNThONlZVL3YzWTJ0?=
 =?utf-8?B?aXhqTEFKTDdoRlM4UXJXeUdqL0ZNeTVkR3ZrOXg4b1B3djhNbU8vMmhCb3NO?=
 =?utf-8?B?UXNuYWpRM1QzQkhPengyT0g4MmJRU0lpNVMvc25xc0hPQlJ3T3pQRGJJNnRm?=
 =?utf-8?B?NVp3a2JTL09FOXhwOWtoRzRzWEw0QzNSbVVudVI5a0RRWndWcDN1bkFmR1Fw?=
 =?utf-8?B?YUV3Tzk5UlRWV1NSTy9zV1FVcGx3bHVsZEw0dDdvNUN4bDNQMjMzWC94UUhv?=
 =?utf-8?B?NW56aVVEZk4vUjA3REVCRlA4aWF5RGNoNHQ5Uk55Vm51Y0VxN0F4VHUvekVq?=
 =?utf-8?B?QWd1WkcyckszRDIvMnI5SUxOWTFMcmtPZDJTYitBaDA0S0tEOGFBU1UvOU1G?=
 =?utf-8?B?by8rdUhYTU5uTFNIUjN3Z1ozUTlRU1lsc3laWTBDQTJWT3dTSG56eE1yOEhV?=
 =?utf-8?B?YjF3RzhiTDdDQkFEcUpsVGtuQS90OUlmbU93cHVmL2twOFg0WnRLdW44Sksy?=
 =?utf-8?B?bEVyMnhTeUVSc0piVUFiWDRKQS9kWlBVZ2U2VlQvU0pwelBqbDZrOFI5SzdV?=
 =?utf-8?B?L3BZZzBPZDVRUCtBVW9DWU0yUzNjZ0RGSURNWlhNYWR5cngwcWgvNzhBNEU0?=
 =?utf-8?B?MURIR2t4RGJaSmhybkdsTXRkMjZncG56a3VYWmNoVDcyL2tyZTVuNlhKd0tO?=
 =?utf-8?B?RVNveG9vY0FWbEJyMDNGeUZoTEM4YUJ5dWJHRUNnc2g4QW1Kd1VjdzNKVEZY?=
 =?utf-8?B?U01WbTNvNk03WVFpWXM0U2Vyb1U4SWVwclVRRXJCMzIwQnp0eWM2MC91dGFm?=
 =?utf-8?B?TXpyOXNhY016bmdRNTM2aUsvYXB4M0l4U1ZlckpML3ZmbUFUUGpGK3FidGw0?=
 =?utf-8?B?UnA5a0tXK3hxenVWN1plVzlsZ0xObjdSamhhdzdRYnRHemZ3Zk5mWk85Zk1E?=
 =?utf-8?B?dy9YdGJZMEY1REtreno3RnF4dUl6VlIrUmlwRm1IdjBzQXJGNzZGd3RhUHAr?=
 =?utf-8?B?UHBmRTJWcVR5OUpzWEp0SEwyMjlQRExpMHJRa1BqeGt6S3ZuQ25qZmhIZDNk?=
 =?utf-8?B?V2IvMlJxQk1UN2dWcFlhWi9DOWtxNWRybm9PR2xqRnBMcmljYjlLT3RqbWV1?=
 =?utf-8?B?cGtiUVlqTTRJeHU2Wkx2TThtNFFQZjNsWHRCNUNBcjc4UW5UcmVMY1pZYjZw?=
 =?utf-8?B?WVJ6cXBBV0ZqUHllVUZTM2RILzIrbWV2WjFPc2xZaysrZ1JwTnh0WndwYzAy?=
 =?utf-8?B?TzNpNDBVMFBDc2VBM3A1a0ZiZi9ydTN6dVkyUHBISStKcjBLaG1IU0xnV3E2?=
 =?utf-8?B?SDBHNURFWWVQVWtqTi9IcTlIbmYwOG01dFhBUHhxd1JVcUN1YlBWNkNZL0VP?=
 =?utf-8?B?MHFpVzFPRG9yT013d1J5MS9FR3VHejVwR04xK29qWnRkbTh1MWtkcmo5L1Fv?=
 =?utf-8?B?ajNNdjUrbjRwd0x6c2FVR3ZqeEtYbS9ENFdycUZ6M0JEV1pJRG14MnNETnU5?=
 =?utf-8?B?bS9iVFpxZDBFRTI3VjlpdXQwQnppUmhwM3NmZ3ZGaW5ETjErNms1SnNOeHJO?=
 =?utf-8?B?RWhWRnJNM09LbFFEOGhuOU5xYm1yakdCSVB5SlMybi9XeU03c21yaWozOVZ4?=
 =?utf-8?B?bnBwSUZ4dmdxV2tGUnBsdE5MN2VsdkltenUxRityZEdrTXh1bWpZazBzVXQz?=
 =?utf-8?B?WTVNMDEzNjM3Ky9aUGh4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk4zc1V2SVNTZlo1RXBwUWEwN1B5QnpZUlFTOTBaSlZUdEx0aW5rNmEyOHJh?=
 =?utf-8?B?ajNvNm5Ma28wQ2x1M3FsTm1CUDdUS01qbFhBVWZ2blJVOGQyM2dncXVJMjFX?=
 =?utf-8?B?ZVRqNTMrMGdYODg2bDBjRHFvL0RZZDI0QTZsQzhLb0ZFc1FVTlR0VWdBSC82?=
 =?utf-8?B?M3VPZ0s3S0xtR0Ywdk5VU2FLeldnaXEza05aVHd4LzlkUUJQMnlGYS8yNkhR?=
 =?utf-8?B?RUFSZW0xcm5JS3BMeXZRZHpaK0ZWMmYxVnBqeGhzUjFGY25wZys2OGZOMStp?=
 =?utf-8?B?VlNJd1RrQ2d6V050OHRYU3dsaG90eDh3WFFjWnRwV0lzaklCZnJ5Wm54UmpL?=
 =?utf-8?B?dFdLMVk5alc5TUZGeGJkN3R6My95MWFDSnlvOUo2STNndTFXZTZ5K01SL2kz?=
 =?utf-8?B?VDF0UnlQakVyRGh2aFJSaHdlUERvRGxsdDhkUVNjaEhPeldOclIyNDkraHBX?=
 =?utf-8?B?ZitoSG9HNnlFK08xZFpBVk9ZWVpsWDZFZDdMdHM2M0tnR1RDaXRjRWdYNzRO?=
 =?utf-8?B?UWZOZVJVV214YmtLdHl5RUlFRWdMWklKUXIrOFV5S1hLMnZxWFdpS3JDZU04?=
 =?utf-8?B?dm5PamMxdGFldHVVZmFNK1FSYWJhUnFhZzFtdnZnbzR0eERISFJMZWN1OFpY?=
 =?utf-8?B?Q2V2bFRmWmllbnBZY1RyM2EzdnFkdmVGTk00UHp0WUZCa3RMSlNQYjVyZ2ZU?=
 =?utf-8?B?NGppdjFHNkVmNUlHMXRUVlo5STJ2ZzhlWmVaa2hBb283MERkcFpLZzZiemRy?=
 =?utf-8?B?RWtqYjJleFpEM3E0aGJGSERxSUFFbUNWRFh6dnAzc0RvcWduVFE4bys0emR5?=
 =?utf-8?B?bDM5OW1UKzF4VWlIcUdndmRubEFYNXRma2o0MDFMVnc3L2N1dkpNT0dxTllh?=
 =?utf-8?B?VW45a2FZRUhTUnoyTnVDc2QxUm9ydVAwVStnM1JveDNTaTBkQTJvdWlGT0xm?=
 =?utf-8?B?a0xheVF3aXBIemtEbFNaTmR2M2RJdG5jMFFLaUlHcnQyU0VvNm93VTlLOUtl?=
 =?utf-8?B?QjZzbUlVUWhtTUY5NmFkNWtLZFpKK1lzQzRlUDQyWFFka3grMWNMaEswQkFL?=
 =?utf-8?B?MGZtL2EwU0tBZHo5SVUyelJTdU9UUXlLNHZiUFFVUXZPaXVEbTQ1dWZNbzZ4?=
 =?utf-8?B?a2NNVXBvUXozRjQzQ0FHaWJHcEc3K0JtQXoyYktGay9ydXE5ZTVWOU1TeE1G?=
 =?utf-8?B?TTMwRnRGM2p0Q2oxR3VYYnZvVGR6WGllbUNOVEQ4ZmN0Z3lSR2lIVGpXSS9U?=
 =?utf-8?B?amF0VHNkdFNCcjcxRHkrUUtRbXZzVE9tK2xZdUJXUW5qZ3dPaklBYmFzbEpH?=
 =?utf-8?B?bEZod1FKdm5hdkhKWjBuMGprS0MwUzFMeXBJUzFMTytQckdjbnBaelQ5Wmhr?=
 =?utf-8?B?SWRoSEtodU41bkV5NVNuanlUcFBXck5aY29YbS81MnBOQm8yci9HdWV6eWtu?=
 =?utf-8?B?UVUxaVg0akdGUzZNZFlUQXZRVXRoNGprcXNSSUVtUG4xMG92VkhlSGh3QnE3?=
 =?utf-8?B?cFlYUjlHTTJTT0ZMTFJNeUZ5a1YxRXdlMW1qblkvODdJWWVxQkpoTHNWRDY2?=
 =?utf-8?B?VTBNUWdqbWd3cDg1UGh2ZnpHZkUxRDk0aTlpVWlBWXVtdUN5TWY1NDczQkcr?=
 =?utf-8?B?dldlWXhYRDFPd2JCbUg4bFMrZmEyd2huYWQ3THlkVnNQVklxY0hZVGpxWlhH?=
 =?utf-8?B?clZua3IzY250UUp4aDRVR2pQNnNGbVNkaGQ0cng0S25tQldDOXJXeU9pdTFp?=
 =?utf-8?B?aGtkeUVHa2UzdWI5QnVySzd1MStqVTJJaGE0clFiNDJick52WHREa0tYeUt0?=
 =?utf-8?B?eHhXaW53a2gyT0pMK2IyMmR4RUVyVTdtckFCbEFUUkVISWs4dy8xdmkwZCtH?=
 =?utf-8?B?QTZpUGFkUGVqQ3hJVEJjMEQ1MEljL1l4ald4Yk9TUC96cDRJSVI0ZFM3WTdu?=
 =?utf-8?B?b2hPK2RneGVJMCtDZ3lWdmRCYnE3alQ3bVNJaWY5VXIvb2RaSk9HaXRCZlla?=
 =?utf-8?B?M3JSU3dJMzFpQlBYTlVmNjVJQTk0Rm1pM0p3NmJ0cnBkN0VZTFQ2akgyMGQv?=
 =?utf-8?B?SVB2WEF5cS9teEtiVzFSa2V4ODV4cjVyYmQwZWxPa3hNTlkzQjVINytZZTV2?=
 =?utf-8?B?WGhra3k1bmlSdDFpRkttRVpYZXlCM01ZZFpoWkwxQW5zVzFNRDQxUmdhWm9N?=
 =?utf-8?Q?obpuYzJ+K9U5GxXH7LMSL+g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efb2b72f-fa70-4630-c02b-08dcbb974b04
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 12:56:05.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm16ApbbnbA9XQVABCx/rywq2p5F3zzcOdMe/LjbABPAvZsVxAOBqck+Gqkz8BdzDZ+qnsTP1/hnNV6fjslKKg0A8qxiFYa1dnf3dxDNUNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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



On 13-08-2024 17:42, Jani Nikula wrote:
> The fault-inject.h users across the kernel need to add a lot of #ifdef
> CONFIG_FAULT_INJECTION to cater for shortcomings in the header. Make
> fault-inject.h self-contained for CONFIG_FAULT_INJECTION=n, and add
> stubs for DECLARE_FAULT_ATTR(), setup_fault_attr(), should_fail_ex(),
> and should_fail() to allow removal of conditional compilation.

Would a "Fixes" tag be appropriate here?
Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities infrastructure")

> 
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/linux/fault-inject.h | 36 +++++++++++++++++++++++++++++-------
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
> index 354413950d34..8c829d28dcf3 100644
> --- a/include/linux/fault-inject.h
> +++ b/include/linux/fault-inject.h
> @@ -2,13 +2,17 @@
>   #ifndef _LINUX_FAULT_INJECT_H
>   #define _LINUX_FAULT_INJECT_H
>   
> +#include <linux/err.h>
> +#include <linux/types.h>
> +
> +struct dentry;
> +struct kmem_cache;
> +
>   #ifdef CONFIG_FAULT_INJECTION
>   
> -#include <linux/types.h>
> -#include <linux/debugfs.h>
> +#include <linux/atomic.h>
>   #include <linux/configfs.h>
>   #include <linux/ratelimit.h>
> -#include <linux/atomic.h>
>   
>   /*
>    * For explanation of the elements of this struct, see
> @@ -51,6 +55,28 @@ int setup_fault_attr(struct fault_attr *attr, char *str);
>   bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags);
>   bool should_fail(struct fault_attr *attr, ssize_t size);
>   
> +#else /* CONFIG_FAULT_INJECTION */
> +
> +struct fault_attr {
> +};
> +
> +#define DECLARE_FAULT_ATTR(name) struct fault_attr name = {}
> +
> +static inline int setup_fault_attr(struct fault_attr *attr, char *str)
> +{
> +	return 0; /* Note: 0 means error for __setup() handlers! */
> +}
> +static inline bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
> +{
> +	return false;
> +}
> +static inline bool should_fail(struct fault_attr *attr, ssize_t size)
> +{
> +	return false;
> +}
> +
> +#endif /* CONFIG_FAULT_INJECTION */
> +
>   #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
>   
>   struct dentry *fault_create_debugfs_attr(const char *name,
> @@ -87,10 +113,6 @@ static inline void fault_config_init(struct fault_config *config,
>   
>   #endif /* CONFIG_FAULT_INJECTION_CONFIGFS */
>   
> -#endif /* CONFIG_FAULT_INJECTION */
> -
> -struct kmem_cache;
> -
>   #ifdef CONFIG_FAIL_PAGE_ALLOC
>   bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
>   #else
