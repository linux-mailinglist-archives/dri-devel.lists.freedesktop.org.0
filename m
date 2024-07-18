Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7A9351A0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0095A10EAAD;
	Thu, 18 Jul 2024 18:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KV3d5SoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77C10EAAD;
 Thu, 18 Jul 2024 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721327637; x=1752863637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNwybQxUAxQIZnWySc7EMBqz9vQtSQZyn0ONs+ClvAk=;
 b=KV3d5SoHGL+AyShuO9l7JQNme0aD/QJCRfKYAYVc+7aFG3qg2LXS4Faz
 FicWhqUn4LyqWGUAXiYqXd7LPjrxAC+f5PKwH2GKqeBy6tTUUQWWq/keq
 npUkkB3f0fztAFU8ck2BOnXmCmtib9o/k0QVYgMFSB0dyB261XvdINEdA
 pnlSUBs8PWua/gY8gReS7mf760ASiheiiLUq6hum0k9muYi+jq+PyaRZ/
 7SW30osJCbCvinBI2dDgWV9qJRp8lN03luYXtxqAVKDGpPfBKFqqv2MR4
 65fGapunIszoz6pWKg7r53gfnfVGCoDxlf/GKPbfUfgDcSb93H5p0/LGN Q==;
X-CSE-ConnectionGUID: jDhPPw4sRheDpFmJnU/J6A==
X-CSE-MsgGUID: zuLt5B9aRd66Fkh97OdV6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21813486"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="21813486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:33:57 -0700
X-CSE-ConnectionGUID: M/ob+hjoSde4l52kAIgItg==
X-CSE-MsgGUID: xFrBC8O1Q0Gu9POjyUTAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51147620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 11:33:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:33:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:33:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 11:33:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 11:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LArV29gK8PDHyEtPMErRB+BEJ8t5Mue7F5AV4SjUMvBbJOBZUqdfSee6YMlkfquuIILJnZWsqNH62biLD+XJUAzW2f2EpxFevJsUM76hQTyDnfUScc6EbHQjT/LOjUFQRNYwNAPN5xDDmsOzHWPQJ5N/kk02a/Ejho0XfCwgpHD97groX4rkmAQYTXcNw8QeNgcePVVWza9fCLOvUIdqaRWjiFtlsBeW+ybv76sPxsMi8x3GNwDVRsKV6uZ3aslg1rGx36X4HZG++65U6y59o7+eOEJoeFc5/n1F/hm+LylfImlLz/2E47w0W4Y4ZHqYLXKVCwvkaUKN5ZGs3JW1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByRvXWhkrRayN/k/5sz47C+BR0pB26F0zsbSMoxy//c=;
 b=GSCnx+WWbN8bX/2VCxQWv0c6FdU0TlEofAxkTwK/GpUfkP47SDk/gk6PMBU3OxSiGOPldLiynCNoPrcp+N2vXEAwgKiovi5NMCG0lrGN24VyjBkMPqjoHrac/4vHZBQXGWWqvNfwpHfFki+R5vJEOlg55dKzbJRbcSSOYKgdACZnoiyMAclj/PHwyFEwCk6e2eWkM+MR7Oz/D94Skvd72YzlIU7RwZ5RUStMXsG2GAyTdyHWCUnzN1Y4MrdLosxg7LIcziVXz2u/YpWvDg1kun4tv9XvKvTgFkmqm5hLD3oh9Rrp2nsOWwkG2dNidykcqrnTvaZTkwswnGMH728aZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Thu, 18 Jul 2024 18:33:50 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Thu, 18 Jul 2024
 18:33:50 +0000
Message-ID: <8e806515-4148-42ab-84ab-716fb4b066a6@intel.com>
Date: Thu, 18 Jul 2024 20:33:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/migrate: Clear CCS when clearing bo on xe2
To: Matthew Auld <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240704081841.30212-1-nirmoy.das@intel.com>
 <20240704081841.30212-3-nirmoy.das@intel.com>
 <b0af2f0f-40c6-455e-8c74-ee075950867e@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <b0af2f0f-40c6-455e-8c74-ee075950867e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0041.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 28666d72-951e-4c10-c5fc-08dca7582ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUlrdWFtN1ZnbkZGTTlOS0FSV3VncCtLcnZpYjErUWZNSndMdFpPNEYxYzF2?=
 =?utf-8?B?Ri9ycXdyTlRpcVE5ZnV5RDNLSEUvWE9LRDZsMnpIaWtmdHY2eFVmMld4YWRR?=
 =?utf-8?B?SW5udnpBd1E2NnpUSzVQck84YnZ2N0tUMmpSNDlhdWNPTTBMN2J5N0JVSUl5?=
 =?utf-8?B?VlBkdUJXQ0JLMjhrOS9VSXJkVFBWV1FxNTRZTlI5bzRKN3JvU3RjK3R0anFK?=
 =?utf-8?B?eGRtRFAxR3NLc01wZk1vanFHdnhIYXo4T0dxRG9NQ0R2Y1pIWlF6eFhMUXhr?=
 =?utf-8?B?RDRxZ09lcHlseThMNmdNQmk5aUx0dVdPZDlVZ281bzdMLythTjhQNGJjR21j?=
 =?utf-8?B?d0lkNTkzTTRIMlphSEdTblpZdE5HU2E2TjdoUmdhcHZMeGo4cVZiaDRUNmk3?=
 =?utf-8?B?MExFQi9acnZIRXFENFNjUEpzc2tQREsvRUpzTi9RZ2FxdnJSTWZhcXV4dlk1?=
 =?utf-8?B?UE1xTDFqRjRPZHVtWHNMZjlWNjJxbnNKb3pGc1ZCV29hMVhGRXExV040Mlhr?=
 =?utf-8?B?emYrU1hDNDM5NGJETnl4VXhJS21YZ0lKaEFZY0RpWVFuTGJpRHhhbVE0M1l3?=
 =?utf-8?B?RVJJQlREdzRDT3E4N2x2Y1pGdkcxWEVVWS9vbHdzc1JxaTlGTEFDUmZSbnZs?=
 =?utf-8?B?UUxMWWUyUHhtMGh0dm5pWmRvWFVOOW5kZmpIOE5WaFd4RW0wNC9TaksrbFB0?=
 =?utf-8?B?VDVqQnBSOWFVV3BLMkJ4M2dKS1ZmdGtrbDc1SnlSd1RKTmxqWU4yYkxzVE9o?=
 =?utf-8?B?OE5YMXNQMG5DWGZpRFl2elhnUGVrRXN1QVhUcURBdWZHWVpLODl6WDFZcnlV?=
 =?utf-8?B?NzE4YmUwWlVUVHZhWjljM0VwNjgySlVIVVord3BsUGtLWkhEQ2lEelFWNXlm?=
 =?utf-8?B?YWNQVElFYjRORit5dWRGbG91alpMVDZlWVZIaWNJdXY0QWxZdVdxYmVpdnhT?=
 =?utf-8?B?NzF2OGlpM2I0UjliZGNadm9kSncvT1d6Y1hXWDQyUWtua1poMmU1VXhyZ3kv?=
 =?utf-8?B?VlN4enF6QkJLOUR3RGpJYnhjNHlYckxxNVlGOUVDL201TlNteWhLZXFMWFMw?=
 =?utf-8?B?Y2RUTVFORm8yTlJKa0sxakJIZDBkVUppRkNoc04yWjJVa003c0hXeC9jb1ZV?=
 =?utf-8?B?VVh4dEx4bXlicCtnWTJmdGFKcXNOQTQ3bTQzMzdvUUFyYXhlRXlUeVZEdnhi?=
 =?utf-8?B?WWlNSzZsdkNJZ1gvZnYxRXFUWnZWaUlRQzZwQnQvRWFNUWtxd3BaY0ZZaXdl?=
 =?utf-8?B?SDJPT3NTK0UvYlhwQTFyQlFOVllNOVJYN2ZBNTRXcERoK1VrK29QRUV3L2Ni?=
 =?utf-8?B?ZlpaQzBNclpaYTNWenZvQmdpT2t6OUlpNnlPRzdOeTRYQmwrMHNlclorS3FL?=
 =?utf-8?B?b3E0TXFVcjhpZlVJbHFRUzFqTUVMRUhxRUU3RHluTGN0ZEhOVlYyQ21lK25R?=
 =?utf-8?B?MXN4bDNOdUdNWk9PN0x0bTB1SDIwbU4rUlE4Z2ZpenVHZUowSnkvZW1peGRG?=
 =?utf-8?B?OFQ2VFBubFN1SW04WVhENjFzalpKMEIvS2ZvYWs5SkhIdldSelIxSFl1S0RY?=
 =?utf-8?B?SEVkL3kzWDdxRHNYQ2JNRVArU214MVIyVjRSaWM4ZDFIVTVYNDJ1NWxTQ3pn?=
 =?utf-8?B?a2dhS1YwSGs2WEJRWWpVcW9YOTVJZ3lLUHBLeG1FYlc1Y045Tllzc0pMSkNB?=
 =?utf-8?B?NVFvNmU2NGt2NDg2dW5qdEM4dGwwd1BXRUgvVHE1aDRjR1RmOFBmSTVVcnBD?=
 =?utf-8?B?ZDRyRUs2MkE3ajFjWGJnVzFScWhUVTh3dThUWXZraU53SGlSdytKeDd1Qk4y?=
 =?utf-8?B?TElLVStBM2dpQjV3VVVDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1YwdGV4cVlRWDhVVWh2SWNPYTdhY0xJUlR5Q29vNDZMMFFheWhhaUdLb1B6?=
 =?utf-8?B?d3o4dktiTzBLTktUNjFpeXBFeEZRWU13UjN2NEc2TkRaWWlHaGM1bWdNZzV6?=
 =?utf-8?B?R2wzRjhlQ3VYVmt0VWo4TEdpUndzL0ZBWVgwUWZWY1JNeVlOcjVlU25HdlVD?=
 =?utf-8?B?Z1lCK2JzYlQyS2tiUndsWlRNVnI0SkY0MGx4VDF1VGpOWmV0UVljam9FREZy?=
 =?utf-8?B?dm44ekczaTdMc1kwWDcvR2Zkcm5PUms3a1ZWd21vdG84QXBlV0F3U3FVM0U3?=
 =?utf-8?B?Z1hzZUU4d2xGTmVZK3BIcFFqR2J4cU5uNDhMWmF4ZWtrZFphaUZlRGpxcm9K?=
 =?utf-8?B?bHRvQ0VRa2MrWkdWTEh5WGt5Ym9CTmRYNXc3d3Y5bTl4TWR1TVllUjhxYU5W?=
 =?utf-8?B?ajVRMUpoUDhHT09FRzlDQWs2NXBqTFZQUXlJeHJwWDZyR1ZhOFhOQUZqUzh2?=
 =?utf-8?B?VE02T0QvNm5MQmlCVVg0YXJsdWJtK2tBWkdSWTluNTVOU2NJcTRndUtEalRq?=
 =?utf-8?B?dUpsWGZ3aWw4cEV6VDBvdk1NMm9rNWlMZE1GUitHVU4rYTBKZ3JWUzducUN5?=
 =?utf-8?B?L1U5RlQ1Y2FmTWdNb0pnc09ScThqWWJYcGdaaStvVmdmbGJDeEtGQk9pSTlt?=
 =?utf-8?B?bmNMU2ZGRUJvcU1DdCtFek9sK0NrM21XZGFKajNNNUlIa08xOXRHeVBSV2Rl?=
 =?utf-8?B?VndwK3lXZnBTeFJiUGZSWnVoRGRFd0FNMnFCSHpDODJFUzRFOHRoZFFHMHVs?=
 =?utf-8?B?SWk0a09PMUZzS0NvVWI0ZDN3OTFIMXdhaG10eHZpdlRRbDZxQmxIb054YU1F?=
 =?utf-8?B?aFFmaGxyOHBGc3hCd1o5VjNNbFJPQnptMktyd3hScXV0V0FyRmwyS3BlK1VV?=
 =?utf-8?B?SVYyL2d0RlJMaGw5cHNCU2F2L2lTcWpOcUZocUdlbTA0TU1paE9FeW1DZEc0?=
 =?utf-8?B?N3Y2MEF1eU5sTThpSWE5RW9rV0UyUUdqbHlycVN5Vk5JWW1CeGVQRmdzS0Rj?=
 =?utf-8?B?QzIrNzJ1ajUrZUZSS0dHQksxUjlUNDlrQis2eGVnaC9EUUdnY0FKRFAwdHU0?=
 =?utf-8?B?S3pWSk1nM1Q2bGVkamhSTnJxVW5kU3JHN3hhcklrZkFNU3Fqd1RwMFFOMEpT?=
 =?utf-8?B?N3ZoWGZCVlZocXlSYUl2T2d1dUVpN292UzJSR2hCU1FlM3J1eDFBekNtVi9T?=
 =?utf-8?B?YjhxanAvQzBtUkVQNHBxY1VMRCtTL1EzUXR1UC9Dc2VCM284eWZTaXUrZFYz?=
 =?utf-8?B?VmFrQitxSk9yMGppRzhSN3lDQnNtcWwzSmRUVjJ4ejA4ZDN4SWx1MjFrUXdD?=
 =?utf-8?B?RklTcCtCL0ZSQythQ2JxUk8zZ3hydFRmdXUrV2RSQWM2bm9DbW9GWS9pMzNN?=
 =?utf-8?B?QkVNTEpHL3lDUG42S1VwdURuM0hkTlVkcWprbU1XRll1ZUQyaGM4N2o4WHNR?=
 =?utf-8?B?RWZocjVlWjJUVXFHeVl0REI3UFMraHlGUHIwRXZueTEydWJlc002R1pSelJp?=
 =?utf-8?B?b0N5Nk5BVFVBbmlQVmk3d00ySGJEZ1BYSm9oL2lObEp4VXlVK3lzWXRLd0E2?=
 =?utf-8?B?QjM3OEdlVDQyODlDVTY0ZE5yWmxCa2prNkQyd3pjektkM0xyZjhmRzhnamJu?=
 =?utf-8?B?bExGOEdaRjZIYStjWDVuZXZTNzFYaTI3bjR6eWJKbkVNcFd0cmE3KzZYUGRz?=
 =?utf-8?B?RXV3NDk4NUhXeExRTzJaUU16Nm5lV2NZWDhXWWdSYVY0dmRvOUJsMGdTUVFL?=
 =?utf-8?B?aDRrdi9peEczSjVVZmZZU2sxZFh1cGZJMHR2UHZ4Sk1VNXpCOEZMcCt3Nnoz?=
 =?utf-8?B?WnF1eDdLMEVwei9UdkVrNFhwNC9nQndtSFFYODBrYmVuc04yaFZEa1pUTzBr?=
 =?utf-8?B?YWlFcWdQSG1ieDFQd0VMa24zaElNTHB1am5hYnJhZ2dmaTdVMDk3WnBXWHJQ?=
 =?utf-8?B?dXpTVWUzTlpOYTNaaDMzMXZJRTh1M2ZCblFmTEhuQUtpYmN4Rm40OXFOZVBj?=
 =?utf-8?B?M1RtTGZjZWlEbVFwcm1mUVIvTWJyQ3g3QVRpSGZ0SUl5VHJmKzBwRjdpWll5?=
 =?utf-8?B?TVBSSzdVUVNQRDhLUjN4Z1N0SFJNdXFLOEtyVHdrWDhvRDF6R21KNVA5UUkz?=
 =?utf-8?Q?Kjd/VydZKuhZOXixIP2d/YI2q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28666d72-951e-4c10-c5fc-08dca7582ae3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:33:50.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: belZtVyCGjCMiZ+24hEoeXhBfDVkbXMg9W1oSvP139miqg9YBYys8wTMy+1+bQKD5G7dZShcEedDT/JJoku16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
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


On 7/18/2024 6:40 PM, Matthew Auld wrote:
> On 04/07/2024 09:18, Nirmoy Das wrote:
>> Clearing bo with uncompress PTE will trigger a CCS clearing as well
>> for XE2, so skip emit_copy_ccs() when on xe2 when clearing bo.
>>
>> v2: When clearing BO, CCS clear happens with all command as long
>>      as PTEs are uncompress.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index e0a3f6921572..cc8beed2bf8e 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1061,7 +1061,8 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           if (clear_vram && xe_migrate_allow_identity(clear_L0, 
>> &src_it))
>>               xe_res_next(&src_it, clear_L0);
>>           else
>> -            emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
>> +            /* Use uncompressed pte so clear happens in the real 
>> memory. */
>> +            emit_pte(m, bb, clear_L0_pt, clear_vram, false,
>>                    &src_it, clear_L0, dst);
>
> I assume this uses coherency 1way+ mode for that pat index? 


When compression is false then we use XE_CACHE_WB which is 2-way coherency.

> We could potentially use coh_none instead, for the case where 
> bo.cpu_caching != wb. In theory that should be faster, but could be 
> ignored for now.

Yes, coh_none should be faster. I can try that out later on.


Thanks,

Nirmoy


>
>>             bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>> @@ -1070,7 +1071,9 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           if (clear_bo_data)
>>               emit_clear(gt, bb, clear_L0_ofs, clear_L0, 
>> XE_PAGE_SIZE, clear_vram);
>>   -        if (xe_device_has_flat_ccs(xe)) {
>> +        /* Clearing BO with uncompress PTE will clear CCS metadata 
>> as well on XE2 */
>> +        if (xe_device_has_flat_ccs(xe) && clear_ccs &&
>> +            !(clear_bo_data && GRAPHICS_VERx100(gt_to_xe(gt)) >= 
>> 2000)) {
>>               emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                         m->cleared_mem_ofs, false, clear_L0);
>>               flush_flags = MI_FLUSH_DW_CCS;
