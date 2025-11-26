Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAEC8C29C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997BB10E6DC;
	Wed, 26 Nov 2025 22:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8vYGmCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42DE10E6D6;
 Wed, 26 Nov 2025 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764195139; x=1795731139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SS3mwHhTbi7Xd2EdmqOFrLLklqLYY280zXVbAg0Bpzo=;
 b=m8vYGmCuyULZ/sNfnOJK1V7O1d0ZQNhjsqIu62iNSdIzxm5YoMYSXnvs
 NPeX12tgkH+7SNfyJrQEVM2i0+5Xiz2Z/QvCFpUfn0YUpzz/bfXS1WrBG
 4ZE5L6w63Mw4Qc7ooDLoeNBNlQeaEYGGxzphmmIp0CZAEEBRH96qFSxuj
 GmeYCHSwJrbsqzwnMbYM8LkAl1NBXlP9WjpT4ng+Z6eQfqrNFdfB+dXX5
 IWqpL2IpaIh3GZ4ftqalImFjiDBW41eyUZHQ6SrzhxOjuNUqJwhocGIhX
 kx1wLVhWXYzv807D7Hb8sKLjoxe73VRq+iRyhEVq+KiowPxxegED3BRjr g==;
X-CSE-ConnectionGUID: mFdmULWvQ7ab928vFPeu7Q==
X-CSE-MsgGUID: vRMjcd9WRIGCdkJIenJtxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70103757"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70103757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:12:18 -0800
X-CSE-ConnectionGUID: yw8823vIR6m214FvPBPy/Q==
X-CSE-MsgGUID: MClpp1GeQeaoKHV7iocGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="197544996"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:12:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:12:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 14:12:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:12:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuFPWQxNVLsoP088zjS//6Hv29PYqtm9W6zZQ9xzXZSPJGB4DxCRVTtAqqEP3vIrNjrwKQAwQtNzPzfykq0vcFm6r3Q2UkNYqmBcZ3ALtSKU/Uh5k+94PM3dpC+ZlQpyRwWm5g6aq1ipDU/zjqdH8sGYh1LJvJPa+FNf9dtQW4zGaQaR/OPXjVJzDYgmonCci4dg3X8Rzp+e8hfVIFHlNm6VjRdFYHkU4VzD0cVFKFtSYPAC6rHOVUYrtkDqFgONWktB/NA6qOCFni9+JtutJkdqn821PvtIdNt3JQWyVOA0ja7O4uTPO5nH5IdPtzmvJWfa6KP3qBMy4TIvtxGYXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkMmYjjOHWJ5QkPoauO9qpOOdbBSqMy0fulaqzKF1JQ=;
 b=p0Yn40sn4S8V/vR48txJxCpw4bgFKH/tGpbi8X2rvDeRfz6ol4UI9q6n5DBvlqtC6e4ImE9LdH3L+Uv+uBgKgRxOCmg3WirNCwFspet3sWZj8LHXBZIdvrSWsQHvYUHPBMuyLpYshZKlTvOG5twradIpE69IlI+iJAM+1nRjwEctL8NNL66m2MCBxnWZR6pk44TV2TTScDhISKsxes5WjUGirpckSj2eid/mb8K9w/ZB58WilRTi/L0wZyPalx3LgJS31PEaKcTVp8rgvxqjpwfVvE7sWDtV0kF6o1e8sZJObQKdjO4VM7Bl5l+RA8OQkpBbAuMlFGBb1NSUOX80Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 22:12:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 22:12:13 +0000
Date: Wed, 26 Nov 2025 14:12:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aSd7N27imF7NnS8X@soc-5CG1426VCC.clients.intel.com>
References: <20251126214748.650107-1-matthew.brost@intel.com>
 <20251126214748.650107-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 88757ef2-54f6-4b0e-0346-08de2d38da57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnhMNHBqVXNVNmxlVlQvY0Jrcm9GTVNEMmdyV3Jya0IwZXJvSDA1Q01PS095?=
 =?utf-8?B?amdLOHRyMVNoTjhWYTRDNHl0SENBSnB4UG42Q2xLUzRucE5xODdFNThMUjdZ?=
 =?utf-8?B?c1hwQStPSElaN2dibnNvWVhybDBPK0VoNkxyMHFaRHdLUThpazZxakxzR0pK?=
 =?utf-8?B?N1pNOXcxMVlwaXR0b3FoeGhaclV1N29LVTRxb1UreE9vRXI0cE5uRUxJN1Y0?=
 =?utf-8?B?RGNmUlJUZXZSYjFlR0kwdTNGRlVHUE9BWG9LY204RlRtc1gydWVrUFNyZGNE?=
 =?utf-8?B?eTMzeEpqRDZiazgwVXVRRHllVmthUENXKytrR2F5eGtPNUcwTFU3ZjhBdkU0?=
 =?utf-8?B?U2xBdXRnNUtLdkUvWVVjNkhvNE5FVEY4S3V4UEp3V1J1d010UkQyWTRFRHBM?=
 =?utf-8?B?VUFzWkNHYlRSNnM2SC9FRHdEYUd6UkRVakh4UHpyS1E2UTFKejBXenAzM2dQ?=
 =?utf-8?B?S3dZb1NRWG45b1pxZWF0ekRuWVd5WmdwaUhCdy9PaytiTW5yNnZEek5WckRK?=
 =?utf-8?B?VjFwYVBJUTJlRkd0YTNwRm1PM01ReHRLNlNYQ3lJTFQ2TEw0ckpWbVBWemRw?=
 =?utf-8?B?Rnl2RklkNjMzZGlTK3hBYzQwbHlDcEJqSWgzMzZCeTBzdTJ0Q3p2aG12SVBZ?=
 =?utf-8?B?M3A1Q29zOEphQWJJenhvcDNzRDBsQjZES0N6bTJKNGJiYStlSmFtdGZpczR4?=
 =?utf-8?B?bnhUTHR6NTJlbTQ1QTluQUY2MkptQlJOWkE5Ky9GZEtaOS9rcjFrZnJKdDBS?=
 =?utf-8?B?cWQrWUN0UlR1bUlDUlFxNHpBbTBSRXF0WExNeWc3QUpRZkNkaS9GK3BUSlVM?=
 =?utf-8?B?VEJmS1hPZ25Kc1Z2SnZaeFROUERJMjFOOFNUTXJuVENIcm1FdmRhMWNjY2tt?=
 =?utf-8?B?MG9HNlRKbEFhNzBJUDg1WklmYTRsNGNTcE5NeTJEZDNvMll5L0MxYm5ndzd4?=
 =?utf-8?B?bVd4eDJpRGUzekwrMTVCZXpvNjU4bkQ5bVRyQlAybTdpRUFaNzd2Vlo4dlYr?=
 =?utf-8?B?a1Iwb0F3V0htTTc0RjIwZ1dndFlDUUFQbEViOHBJVkpndG1iRzZkUGZ1aEV3?=
 =?utf-8?B?dTFLVkhpV0pXRzZFejlNRnhvWVZ3R3F2aUR5ck84MDhKT1JmSjMrVDZ0eVB6?=
 =?utf-8?B?YzRzY3V5SFhRQ3pUaU9xa2U3bEpTamgxNHBaSlF3Y09MVUtFQnh3ampqVi9p?=
 =?utf-8?B?MDErRUFNSmZNcWxXdndDdWZrYWxzbHZqZndHUE9VRll5RExuZTJ0a2c2bFNs?=
 =?utf-8?B?RW9kNWZoeGljOG12ZmFkSEJCOWQzZ1dTVzlWZWVJZVRweTV5bm1LUmkzU2lI?=
 =?utf-8?B?eEpPdzVFZ0ViTHBFU2pja2pKZUdzVS96eHBIYm1tVEN3YlNKbUNvalRyZjAx?=
 =?utf-8?B?UEMzNHJwdzN0bHowS0g5UG5tN1k5ZDhLZkNoUEdHQURNdUp3Vy9nYUtWakxJ?=
 =?utf-8?B?S1VIcG5SSG04Z1JReHpvTngrT2FuMU5BTi9WcGxWVit5Q0Zxd2hDdzNjbWFs?=
 =?utf-8?B?VkVIWlQ5QVVmV1M4bHNhUTJlV1BYRGdwZFp5Zk9rQXJhd0t1ZDFmbENFV1E4?=
 =?utf-8?B?S1lJRlB3SUhjbFltM3VEMFFYQjBSUzBYVytSZVdqdXNRVzU2RVYyRGlUdlIv?=
 =?utf-8?B?Qm8rVE5TbXlCR2prdmYyb0JxTWNMSnZtL3RyaXRhdElpL3p3eFY2R2dtNkpC?=
 =?utf-8?B?WjZkeitOL2puUGRkenovUXFZTFAwKzE4TXg2R0xWYjBrQ2ROY0xDa1hPcHVM?=
 =?utf-8?B?N1dadW9pbTdTbUdtY2NxSkN5a01wSTNUMFgwenBqVW9FczY1K1lVNjNYcFlp?=
 =?utf-8?B?aWVJV29HTmxLekk5aE55NTJIK0d3ZmxDVHdFWk1ma3ZnaXEzTjVycEtNOU5s?=
 =?utf-8?B?TnZSaW44alp4aGZxU1YwQkZiR3h0KzdTc0NqTTZpZ2F3dmNEZ2ZTQXBjTjhj?=
 =?utf-8?Q?+eV1IdGXF3gVCwMeExrz4PFgedbgR/8I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXU5ZkhIVHhoZzN4a0lDOTNmTDg1TFVYRkY5bENZYUFKVGcyS3R6K1NNRko1?=
 =?utf-8?B?ZFlkL3RIODFCS3htNjdyV3Q5aXRmczl0V3lYSWZJWVlHNDdaVmduSUh3YW5a?=
 =?utf-8?B?MGhRc0VPT3M2U1JaVlRXeEF2VjczTm9HTld6a0hmWTQzL09Kd09sWGw1OTR4?=
 =?utf-8?B?eUdPSTdhdXdlVXVlcHZ6KzZZczZ1NXloak1pbzI2T1BJLzRmRXY2UndKR1Az?=
 =?utf-8?B?YUdhckdhUzZOYTJSbXlmQnhuYXd5K1ZkY01GVmdoanIyVlFpa0JPSVVQNjJN?=
 =?utf-8?B?Z1FHT0NPRVJpUUI3SUx1TkIvcm9VSlJqSjc3RFpXK1hBWFhVczFPUTAxejdO?=
 =?utf-8?B?UGJCT21IeVJqenZES3Z0SzNpOWpKRFBvelhtRE1vMngvV0dOK2lScXVsc2xX?=
 =?utf-8?B?dmcrajFFczByRjhudXB4djQvOU5iemtObkNZYjVsOGxpYTBNZFVCWjlnU2Jx?=
 =?utf-8?B?MUdSRGZHeVZja2dqUWppeDEzbWk1dFlYak9WWTNjS0M1QWY4Wk1RUUlFeVJM?=
 =?utf-8?B?VGZsU2ZnTk5mcDJpb0IyTEYvczZEZTVNTmRJdWRvZVEycGVmVnV4UEpVU1ZS?=
 =?utf-8?B?RXJIdnAzRWdZSHJMcWJqcWxkZ1VkNi9FeG05MUNDNjZpMGMyelFmSWZPbkFS?=
 =?utf-8?B?elNYTXhWNHNTZCsxUUtobzRKWHRhZTFoK0xURXU4NUYrbHhEa00wa2pZd2JN?=
 =?utf-8?B?UWpuMkNyaFZML3JoQkpQdmdlaVd4T0xyU05ZWm1ZZFhKeDk2SGdmZ2hkNlcv?=
 =?utf-8?B?QzdKbFhOSnpmUlFJTzFIMlhwWTdyc040TjFtZjBycWpCRWkyS2lCRmJsZVFW?=
 =?utf-8?B?VTJZK3B6N0ZiV09YNENZNjBpYTBIRStUR0M0WGdZV05wajhjTGM5NEc0eFRo?=
 =?utf-8?B?WW5jWGM4b0hCVEp3MXNXLy9KV1kxUU16Qy9TVjNaektkSVBwaVByYmY0b21v?=
 =?utf-8?B?Y2tiMmk4L2gyZmJhQm5EWktNdWlRblhzdXVab1FuWWdmQmRIbzNFdFZPUUdQ?=
 =?utf-8?B?WkdoY2Ntelg3YjRjcndPbVNGWldXem52MjRZemhla2dTQXlsN05vVUVwcnhz?=
 =?utf-8?B?QjBjbXUwMDUvZWNXVlVDREt3cDlpNEMwK2FaUzlUOFBUczZLVHY3VytoWWFX?=
 =?utf-8?B?b1lFVUw0K3V6S1pGcUYvNVNWbFEzZW8yNnBrM1RmMG5QQU1VQWxWa0hqVUxq?=
 =?utf-8?B?YkZwWmtXUWwrczhBMEJhUmR0L3p4YnhCTy9EWk8xRWpUcmRQNGovemZRZFJO?=
 =?utf-8?B?VmxGc2F3M1k5TkZQOFZjWWhmOE54TTNrdUExQ3ZjMGtNUnJzMC8zdHpCWDUz?=
 =?utf-8?B?VWxiM2FmcHJvNnllbXFDOFMvWDZMd1RuSTFlTWk5ZkxOVEZSWTN6WkszNFFR?=
 =?utf-8?B?ZysxUGRBWWxKQTBKcGgzTlZXTm1PWmdGNWttSE1GVkdFUER1UTZNNVJlU2VU?=
 =?utf-8?B?b2V5L2RzUGo3d3ptSEZhOHZHRDZuUmNJenZvbnI3bGVYb2pyVERRTFhMNFFa?=
 =?utf-8?B?MDFtdUJ4c1QwbmxZZzRBbW81OHdGd0x5aHV2Nmh3bkVyOWwzSXNUNVMxS2p3?=
 =?utf-8?B?Tm1ReVBIMFQrZ2lGLytDSmh4blVOZjRLVjRMYVpZTFE4Rk5TTytVTHVRNjJu?=
 =?utf-8?B?WkVSYzV3cFE2SVRjM0NIb0tWN21uNkUwRzBlcUxXWXIwK3pVYjU5M1RtRytR?=
 =?utf-8?B?dGRDU3RRQWdMMm1GMlpFclRXcUIxWjg3Sms4VWYvc0ZXeVVkM2JuSE5NRURT?=
 =?utf-8?B?ajlzSVFiVGZHVkt3aEozY3VOdmxGVUhjbmM0eS9YSktPT040S3pDekcvYlVL?=
 =?utf-8?B?SENtN3NFTXd6WjVSNndibksyb3EzK29zWjBPSzRJMWhVNzQ2cmlaQXlidkto?=
 =?utf-8?B?RHllcVR1VkVWSEFNNEVuS2dqYW93YnoraGlqZ2M5UVZEaTVPdzcwU1IyWXNL?=
 =?utf-8?B?aEVLZ2NvNUd3UFNzZ2gvMGt4Y0JtOE81QXZERnNBQm8xcStHZmZOdTdhckxD?=
 =?utf-8?B?M3BaTm1LVnZlZ0xFbnB0MEc5VlZXMTZNZEVhN1R3cVUxQzBiSU9oMCs5Tjly?=
 =?utf-8?B?MlhzZUR4cHJXTVJNWFh3eEpMOFNDclIwdkZNZjJmRWFEcDM3Q2ZCbW5PYmVr?=
 =?utf-8?B?ZGlzMVJXV0I2SVppSCtOdW9BYzg5aVhPYWtNb2wzZ3dIcmdha2htUG9oeXFV?=
 =?utf-8?Q?rPC2lhlc8jCfiYJKgC5TiWE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88757ef2-54f6-4b0e-0346-08de2d38da57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:12:13.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nLEhS6bJZMt9Ggm+h/eiewdqVdIJW1aUAork0c5jbQojdKEgOHPyOUtL+yamq0PPojJGplLYI20CUa1r4abAHpjOOgYU7SM7HyjHZ8QMl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
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

On Wed, Nov 26, 2025 at 01:47:48PM -0800, Matthew Brost wrote:
>We now have proper infrastructure to accurately check the LRC timestamp
>without toggling the scheduling state for non-VFs. For VFs, it is still
>possible to get an inaccurate view if the context is on hardware. We
>guard against free-running contexts on VFs by banning jobs whose
>timestamps are not moving. In addition, VFs have a timeslice quantum
>that naturally triggers context switches when more than one VF is
>running, thus updating the LRC timestamp.
>
>For multi-queue, it is desirable to avoid scheduling toggling in the TDR
>because this scheduling state is shared among many queues. Furthermore,
>this change simplifies the GuC state machine. The trade-off for VF cases
>seems worthwhile.
>
>v5:
> - Add xe_lrc_timestamp helper (Umesh)
>v6:
> - Reduce number of tries on stuck timestamp (VF testing)
> - Convert job timestamp save to a memory copy (VF testing)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c      | 97 ++++++-------------------
> drivers/gpu/drm/xe/xe_lrc.c             | 42 +++++++----
> drivers/gpu/drm/xe/xe_lrc.h             |  3 +-
> drivers/gpu/drm/xe/xe_ring_ops.c        |  6 +-
> drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
> drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
> 6 files changed, 60 insertions(+), 91 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index db3c57d758c6..1c249b031537 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>-#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -202,21 +200,6 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> 	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> }
>
>-static bool exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
>-}
>-
>-static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>-}
>-
> static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> {
> 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>@@ -232,21 +215,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> }
>
>-static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
>-}
>-
>-static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
>-}
>-
> static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> {
> 	return (atomic_read(&q->guc->state) &
>@@ -1006,7 +974,16 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 		return xe_sched_invalidate_job(job, 2);
> 	}
>
>-	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
>+	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
>+	if (ctx_timestamp == job->sample_timestamp) {
>+		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
>+			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>+			   q->guc->id);
>+
>+		return xe_sched_invalidate_job(job, 0);
>+	}
>+
>+	job->sample_timestamp = ctx_timestamp;
> 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>
> 	/*
>@@ -1132,16 +1109,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	}
>
> 	/*
>-	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
>-	 * modify scheduling state to read timestamp. We could read the
>-	 * timestamp from a register to accumulate current running time but this
>-	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
>-	 * genuine timeouts.
>+	 * Check if job is actually timed out, if so restart job execution and TDR
> 	 */
>+	if (!skip_timeout_check && !check_timeout(q, job))
>+		goto rearm;
>+
> 	if (!exec_queue_killed(q))
> 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>
>-	/* Engine state now stable, disable scheduling to check timestamp */
>+	set_exec_queue_banned(q);
>+
>+	/* Kick job / queue off hardware */
> 	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> 		int ret;
>
>@@ -1163,13 +1141,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret || xe_guc_read_stopped(guc))
> 				goto trigger_reset;
>
>-			/*
>-			 * Flag communicates to G2H handler that schedule
>-			 * disable originated from a timeout check. The G2H then
>-			 * avoid triggering cleanup or deregistering the exec
>-			 * queue.
>-			 */
>-			set_exec_queue_check_timeout(q);
> 			disable_scheduling(q, skip_timeout_check);
> 		}
>
>@@ -1198,22 +1169,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			xe_devcoredump(q, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			set_exec_queue_banned(q);
> 			xe_gt_reset_async(q->gt);
> 			xe_sched_tdr_queue_imm(sched);
> 			goto rearm;
> 		}
> 	}
>
>-	/*
>-	 * Check if job is actually timed out, if so restart job execution and TDR
>-	 */
>-	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
>-	    !exec_queue_reset(q) && exec_queue_registered(q)) {
>-		clear_exec_queue_check_timeout(q);
>-		goto sched_enable;
>-	}
>-
> 	if (q->vm && q->vm->xef) {
> 		process_name = q->vm->xef->process_name;
> 		pid = q->vm->xef->pid;
>@@ -1244,14 +1205,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> 			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> 		if (!xe_sched_invalidate_job(job, 2)) {
>-			clear_exec_queue_check_timeout(q);
> 			xe_gt_reset_async(q->gt);
> 			goto rearm;
> 		}
> 	}
>
>-	set_exec_queue_banned(q);
>-
> 	/* Mark all outstanding jobs as bad, thus completing them */
> 	xe_sched_job_set_error(job, err);
> 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>@@ -1266,9 +1224,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	 */
> 	return DRM_GPU_SCHED_STAT_NO_HANG;
>
>-sched_enable:
>-	set_exec_queue_pending_tdr_exit(q);
>-	enable_scheduling(q);
> rearm:
> 	/*
> 	 * XXX: Ideally want to adjust timeout based on current execution time
>@@ -1898,8 +1853,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 			  q->guc->id);
> 	}
>
>-	if (pending_enable && !pending_resume &&
>-	    !exec_queue_pending_tdr_exit(q)) {
>+	if (pending_enable && !pending_resume) {
> 		clear_exec_queue_registered(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> 			  q->guc->id);
>@@ -1908,7 +1862,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 	if (pending_enable) {
> 		clear_exec_queue_enabled(q);
> 		clear_exec_queue_pending_resume(q);
>-		clear_exec_queue_pending_tdr_exit(q);
> 		clear_exec_queue_pending_enable(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
> 			  q->guc->id);
>@@ -1934,7 +1887,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 		if (!pending_enable)
> 			set_exec_queue_enabled(q);
> 		clear_exec_queue_pending_disable(q);
>-		clear_exec_queue_check_timeout(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2274,13 +2226,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>
> 		q->guc->resume_time = ktime_get();
> 		clear_exec_queue_pending_resume(q);
>-		clear_exec_queue_pending_tdr_exit(q);
> 		clear_exec_queue_pending_enable(q);
> 		smp_wmb();
> 		wake_up_all(&guc->ct.wq);
> 	} else {
>-		bool check_timeout = exec_queue_check_timeout(q);
>-
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>@@ -2288,11 +2237,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 			suspend_fence_signal(q);
> 			clear_exec_queue_pending_disable(q);
> 		} else {
>-			if (exec_queue_banned(q) || check_timeout) {
>+			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
> 			}
>-			if (!check_timeout && exec_queue_destroyed(q)) {
>+			if (exec_queue_destroyed(q)) {
> 				/*
> 				 * Make sure to clear the pending_disable only
> 				 * after sampling the destroyed state. We want
>@@ -2402,7 +2351,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	 * guc_exec_queue_timedout_job.
> 	 */
> 	set_exec_queue_reset(q);
>-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>+	if (!exec_queue_banned(q))
> 		xe_guc_exec_queue_trigger_cleanup(q);
>
> 	return 0;
>@@ -2483,7 +2432,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>
> 	/* Treat the same as engine reset */
> 	set_exec_queue_reset(q);
>-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>+	if (!exec_queue_banned(q))
> 		xe_guc_exec_queue_trigger_cleanup(q);
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index b5083c99dd50..c9bfd11a8d5e 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -839,7 +839,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>  *
>  * Returns: ctx timestamp value
>  */
>-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>+static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> {
> 	struct xe_device *xe = lrc_to_xe(lrc);
> 	struct iosys_map map;
>@@ -2353,35 +2353,29 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> }
>
> /**
>- * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * xe_lrc_timestamp() - Current ctx timestamp
>  * @lrc: Pointer to the lrc.
>- * @old_ts: Old timestamp value
>  *
>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>- * update saved value. With support for active contexts, the calculation may be
>- * slightly racy, so follow a read-again logic to ensure that the context is
>- * still active before returning the right timestamp.
>+ * Return latest ctx timestamp.
>  *
>  * Returns: New ctx timestamp value
>  */
>-u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> {
>-	u64 lrc_ts, reg_ts;
>+	u64 lrc_ts, reg_ts, new_ts;
> 	u32 engine_id;
>
>-	*old_ts = lrc->ctx_timestamp;
>-
> 	lrc_ts = xe_lrc_ctx_timestamp(lrc);
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
>-		lrc->ctx_timestamp = lrc_ts;
>+		new_ts = lrc_ts;
> 		goto done;
> 	}
>
> 	if (lrc_ts == CONTEXT_ACTIVE) {
> 		engine_id = xe_lrc_engine_id(lrc);
> 		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>-			lrc->ctx_timestamp = reg_ts;
>+			new_ts = reg_ts;
>
> 		/* read lrc again to ensure context is still active */
> 		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>@@ -2392,9 +2386,29 @@ u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	 * be a separate if condition.
> 	 */
> 	if (lrc_ts != CONTEXT_ACTIVE)
>-		lrc->ctx_timestamp = lrc_ts;
>+		new_ts = lrc_ts;
>
> done:
>+	return new_ts;
>+}
>+
>+/**
>+ * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * @lrc: Pointer to the lrc.
>+ * @old_ts: Old timestamp value
>+ *
>+ * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>+ * update saved value. With support for active contexts, the calculation may be
>+ * slightly racy, so follow a read-again logic to ensure that the context is
>+ * still active before returning the right timestamp.

I missed this in my previous comment - The above sentence between 
'With...timestamp' should move to xe_lrc_timestamp().

Thanks,
Umesh

>+ *
>+ * Returns: New ctx timestamp value
>+ */
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->ctx_timestamp;
>+	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>+
> 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>
> 	return lrc->ctx_timestamp;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 2fb628da5c43..86b7174f424a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -140,7 +140,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>
> u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
>-u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>@@ -160,4 +159,6 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>  */
> u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index ac0c6dcffe15..94586c9b4087 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -235,10 +235,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>
> static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> {
>-	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
>+		MI_COPY_MEM_MEM_DST_GGTT;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>+	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+	dw[i++] = 0;
>
> 	return i;
> }
>diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>index cb674a322113..39aec7f6d86d 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job.c
>+++ b/drivers/gpu/drm/xe/xe_sched_job.c
>@@ -110,6 +110,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> 		return ERR_PTR(-ENOMEM);
>
> 	job->q = q;
>+	job->sample_timestamp = U64_MAX;
> 	kref_init(&job->refcount);
> 	xe_exec_queue_get(job->q);
>
>diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
>index 7c4c54fe920a..13c2970e81a8 100644
>--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>@@ -59,6 +59,8 @@ struct xe_sched_job {
> 	u32 lrc_seqno;
> 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
> 	u32 migrate_flush_flags;
>+	/** @sample_timestamp: Sampling of job timestamp in TDR */
>+	u64 sample_timestamp;
> 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> 	bool ring_ops_flush_tlb;
> 	/** @ggtt: mapped in ggtt. */
>-- 
>2.34.1
>
