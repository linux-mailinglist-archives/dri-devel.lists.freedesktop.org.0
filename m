Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A742AE1E49
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 17:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747610EB78;
	Fri, 20 Jun 2025 15:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1xEZOX2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069110E10B;
 Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750432486; x=1781968486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bsx4uRFX9nWWm3GL8oCefLPjHyUoSl7F2EM9cGDoDwQ=;
 b=L1xEZOX28S0ASjm8qCzbgGqbLc8jP1hjLGY1aguUJ/b394cSF6j0PQ31
 7nZ1Cc6+NKDsUbREdzf6i3/6u05wKn3GQhMi1KKfgmfRlKBfMBXWLYdhZ
 VsPxniCgfrit+MI/aZbBVnLEoGtdnn0y61THO6OLO6/6KUVZLlJgLxR1J
 /clA4KIjES8HaCY8PTBlTDnosdCEzMNpGoyg+r/pd8Dg1mewyLMnWdCJ4
 I+zd6anI+/kX9gsrNsfZ+k4t+MdBMHAwzFLRllyhl8/aI/svzC1w5mZEX
 x0L+XPVxKCA0WdST0guAVZdsgwqZWkUfz1iyHE9RnVtv3iXdAjRbkeiR8 g==;
X-CSE-ConnectionGUID: 26lIiatIRpinJzgHToPiMw==
X-CSE-MsgGUID: BiOiMWtNRMmnnNF2QessBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63304658"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="63304658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 08:14:45 -0700
X-CSE-ConnectionGUID: TZRvk2z1QISH+iPiW1iYAQ==
X-CSE-MsgGUID: d/Wsoy50RGyk7fyj9HWdEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="188149097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 08:14:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 08:14:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 08:14:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 08:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfvkV0yw8vdFCNF8F978vQI/JY1vXCmcm9fRi5uBFNtyO+Ieosq8ZUNp09GDSd5Sclg+eksRRPffgj9aQyj0P4Xy1Fc9n/sEtqmUspsxN8y9a3ZNdE9L9WTbBbkjDjAqPRKY3VHT1peud8iTYwVEbHGVRWqWcmouewyTmfzF8jnaU129aSP1qJ3cNzdzxSOlE7t2wLFdGko2L5A+ehif+3DRXywTg2OvSloIRjFw3aqiUj7VIwN0sdrCQVXSwJKG17d0jX3sJ5ESQ/8OvgwxpHSfFaJQjniP+wwUF9FeO5yRWKDc+SsnfLMTym9goa0qkO8eo7A30F48s+cHc0wxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+hnasPsXkm2WgOOuaGkQMRev0XbOymIRD5GU5E1y20=;
 b=YqLatWhAwybydgB3gG8FJOXNaRAKFhIEzzsWznokoZYAl/5OrZKs6R5SezbT/jgM426x5u1MqTYi9b/GUqLM+WkgtgJhgJr/nzsuMEJd2pAlTUgf0Gp3yAxI6LmGX34FzHGgcGl67axCGgnkfHPbYIURg4rjBNAz3Z14Ndk2nw8DER2ZLF4H7F/2MVHc4f4+GtN1Ya72zDeO0dAgNETjMwHEiTCit5HStAqEtD3ox67bZ9D+jgKlHnAojG4fYgO88P9mKpZIpTX0uL0Zpz+0O02c3MeySwCUltaPg0DUNyoNjm0ZPDHJdVyIjlyxrSdlq7VhYaSFjYQqnVZ/JSdpCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 15:14:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 15:14:41 +0000
Message-ID: <1417f4a8-1911-44ff-9bfb-b5cff990b14a@intel.com>
Date: Fri, 20 Jun 2025 20:44:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in S2Idle/S3 resume
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-8-badal.nilawar@intel.com>
 <aFVm-lidsDMMDSit@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aFVm-lidsDMMDSit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: e23e1056-1653-4793-1d32-08ddb00d2c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckNKZEVEMWZxMXUyVmRGSi9lSWw0YkRwbk9oN0ZXSzdsMnN5dFRNR2FRdEUv?=
 =?utf-8?B?NlhmdGx6RmwralBwUUlIeEJsMVZRWVFtZEZUalJJdlNYOW5RdVdLYnJRdXNL?=
 =?utf-8?B?SEg4RnByNlMwdmY3d2dUUXVQWFNNc3RDekgvVi9mWmRPUWNjem9jVU4vSW1z?=
 =?utf-8?B?eWpQV1BqUjlhdjNaalNYVVZCNHJNaEhaZ05FYzh5MWRxcEM0c1VHRlkrYklM?=
 =?utf-8?B?OG5XSVhQU0RONlF3dFVldjFiSkdFOTBMMEFJT1Z2TlkyL2ErenFORDUvZVVB?=
 =?utf-8?B?TW5JZSt0Y00wTGRGTEJKWGhteVA0SGxQcXFMNFVQc2llL1ZVcysxZVNrMDI4?=
 =?utf-8?B?VkpPL0RXRXNGWDFOZGRXUEkzYXkvN1h6WWJwZVEwdnNaZE83ZTkxdndjczVJ?=
 =?utf-8?B?YWV4dk94LzVrRUcwVUkzZmpqMXY4RDBpV1ZJWnFRMkY5OHdQa1V6aUhzZVlF?=
 =?utf-8?B?ZjNLRTFVMHVENzcrWFNpTm45dDdEeFE1M3hKcXhBL1VlSnRmN3BQOWNMQjJL?=
 =?utf-8?B?NW9NTWw2b1B0WVd5bkFIbjkvNWxPekZBRThZWnJtVmgrWGo0S0NYSHJyUGx5?=
 =?utf-8?B?UjRSLzJxYS8xdlY2OWZMMFBmV2Z2ZkJ4S2J1UGdRbUo4Nm9hdlFqcDhIckdl?=
 =?utf-8?B?SkFVQnpLbzR3Qm5wN2d1dCtZMjVTY2dBOXlLQ2FsVG1NdmZoeklwNlNLQUpa?=
 =?utf-8?B?YlBDenhyZWhTT2xhVVRKL0JYTWNnTzVHNXhxWWxyV2VmQ1AzeksvRFpxRmVk?=
 =?utf-8?B?NEJQM2pCNjdJZGFDY2lFL2VDRmVaWWdiVjRDVzh0bFZ3VlgrZHRiZ0p5dXQ0?=
 =?utf-8?B?cmw1QjgycW1JMFJ4RUtsbEl5RmZqK0ZVYTRHZFMrVm9iMGFkcktkdUVUTEQy?=
 =?utf-8?B?N05WRW9Sd1RGdlcwUWMzbnUrUkE1SGRiclM1OWpnTGxHaytXV1BacGgvWnIw?=
 =?utf-8?B?QXJ0OWtWdXZNcHF5RlVWanpRZFQ2c2JQMkZQTyt1YjQ0amhkUUh0cGxCSll6?=
 =?utf-8?B?YU41VVNBQmUxUFU0dytGdW9TYVZtWFdreXFaZ3FTRXhMbXpIZXh3Y203aWZQ?=
 =?utf-8?B?Zjd0SEU2RUoxNGNuVXRJWDY1Rm92aXJaMGE4Y0d3cjhnZ3d3bjIzMmxIM3pQ?=
 =?utf-8?B?ZVlHRHlGREVocGlNNU12V1Z4UDA3L09ocC9oWkZWRFRjb3BnalQ0R0l3ZEU5?=
 =?utf-8?B?QTQwZDNWU0tNeTVxcnUrdC8razdBdU0zUGVWbklkeVZvQkZNZHhhUkxxbjB4?=
 =?utf-8?B?OHhVRDk4NW1aU0pxYk56QTNPOGxNYVBjQmNvSWZuM1ZnaitkNWRWWGxBTHYx?=
 =?utf-8?B?dHR2MG54ZzNuSGRnN2RjTGZlenZhZTIvcmhvYStkOTM4eHdwcnUyWmJDbXVz?=
 =?utf-8?B?R3RUbG9QQjlsdm9zMllCNUJJbHdaU3hFamhDVXFzT2NzRy9LM2FOcUttN1R0?=
 =?utf-8?B?Rm9iajVTMDNVaGo3N2ZJYlYrd3FzM1BHaDdzaEl0c3BYVVZiZmsvUjg2VzhR?=
 =?utf-8?B?R3grRmRobGc5NXJ2aUhKMHFaT1dNTVVvNjRwR3N3VStLZzlQdmtOWG1NWHlQ?=
 =?utf-8?B?enJhUEd5alp4aC9iM2tCNVhUMjY0akZ1VllVSHczdFJzOE9SMEJlOGhudEZr?=
 =?utf-8?B?aVl1OGtnK1JQYWIwMHVGZk94L3ZoZDFqNVFOYmQ5cC9RbnZmTHVnZUNYaStR?=
 =?utf-8?B?dms0RlFnV2xzaDNqbTR5NEJST24vWGhKMGE3NkF2NUJaK01TODJpR2M1MVQ2?=
 =?utf-8?B?SkJ0Qkw4U3Y1TzdoV3FqRUhnbDFRdTIxZlhkbWxMSFlRRVJYNEtFNFFRWG1s?=
 =?utf-8?B?YXhZaWNkeER3cWJIaFRXMmJROW42OCtCYXVKSUwvMTYvOXhjSUhQNGhZR3NF?=
 =?utf-8?B?cGthTllZNXI1WnBGU1l1OXhydnBKU3d1NnB5Sm1qS2NDZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXhHVUVxM2poeXdMWnY0ZExOb1BQR3FzTVl0LzJTaUNpYnV5TWNYUUlqOUla?=
 =?utf-8?B?K3BPUU9uOVdIcXNzb3ZLVVJpN3JCNFZ0Qlo2YXZmZ1AwQzdXb0dZK3hxRHFC?=
 =?utf-8?B?RndycGVKNm5tbW9rMGV5TTZOV2lXSEF0ck9jOFB6T01UaldIRHlUN2dUWjBT?=
 =?utf-8?B?MVJvblBnNm4zbHNvTmh2Tk9uY3NvZit4UkRVbDhlalZ6SGFLdXZtRmd6Y0M0?=
 =?utf-8?B?UnFMUmdtWUFlU3FEMTJya2FNYi9Sb1NGUGtiZlhWUVJWd3ZVWExFaVhmQVcr?=
 =?utf-8?B?N2tYV255Z2VoZVIwUGI3cm4wUStvS1l3MFdVYU12ckNNZG5GNFFkMHJQdU5M?=
 =?utf-8?B?YTUxSnl3cWpUc05ESzhkVi9kL1NvNmZKaHpYZkllakxzd1JsTVVPTDdsSHdt?=
 =?utf-8?B?SlJzNisrVHFCb3MxWU56cmZiNHFkZ3pIZ282aE8wdFlNZHJONGk0Rm03TTlM?=
 =?utf-8?B?Q1hVQ0lGWnZwYmV0N0hNeDY4bU5KeFNQSXZldURtZmNsZlhETnRtOGRVbFY3?=
 =?utf-8?B?eXNCS3hscDBERkw1TDJaVUZtQ1F1R21VdjNBUldUTmVoM1RzUjdwTzNEOHJO?=
 =?utf-8?B?L05VdWtrdkJRekhLQ0JRdFFBM2RhNDFmT241MnhjcmU2TFBlVENWTm0waWhh?=
 =?utf-8?B?bENpbW9jUEh2ZDVEUkZ4STVnMnFNeXA4cnJxM2Z0MmRReUpWanRSWmFFVDFV?=
 =?utf-8?B?WGJ3blZDWlZFZ3dQeldzbThIeGRPTG54YjlZTENzWkFqMktzV3JWbjlhZk5E?=
 =?utf-8?B?cURuZE9HVFQvVDlMNnpXK3N0bzdqV3BpZHZrK2dwQTNPdGtEYytwOWZ0ME5L?=
 =?utf-8?B?RmcxQzYzVHJrMzhRMW0vdklXVS9VdEdZNGJkczdvOURqb1ZWOVFjZmdhOWd6?=
 =?utf-8?B?VXcyMk96aGsxRCszWlliRGsvVWRDVmt4Y2dUR014dVJYWENybllxYmREajh1?=
 =?utf-8?B?Y2xUSm5IOUdHdVl0YmlUa0sxNHEzSWh0MUZLNlUzZDVIN2V3anc0bzA5S3Qx?=
 =?utf-8?B?U2FiL0tvK011OUVNZHo3alVvVkJnWU5MNUZTWW5DaW9ONUlTWVgrbStYaGg5?=
 =?utf-8?B?N21vSDJOYWQzTE9yRktSQmRKdG90d2hUVUxBS0ltMkVjTDNMT1d5bWhaQXRm?=
 =?utf-8?B?TVhKajBnamYrMHBzMFlZUlQ4TytzcFhscU55ejF6ZlEyMFM1dEI0ZzJDRG5P?=
 =?utf-8?B?R3k4VmpVMEo5VW90MHlTTWs2ZnFpLzFYTTBKcFcxT2JlVnVqNGRLOFBWRGRx?=
 =?utf-8?B?elRuMzEyRGtpWnJ5ZVhMd28rK09rYjR3QU5GUUJWS0l5c0RnOEtscGJBZGNQ?=
 =?utf-8?B?MVg2RkczdC8wRHdZKzFNYnhUeks0M3lNeUVHK1VBRVBtZnVzZUx3VGQ2Wm8y?=
 =?utf-8?B?M1ZVeWxCRHBQMlFROGhDWGVNMENQRzZ3YzNWM3ZZS1c5ZjJCSGZ2emFLdVNJ?=
 =?utf-8?B?S3VmZEozeDFVbTI5WjdDT050OXNGdWpDQU84QlJBUmtMQXhtNkFubzNwYjJM?=
 =?utf-8?B?MmU0dGtxTHJXZ1NGWGVoeGZHd2RNazlYMjJrUnovTVU2TGt0U2JybE9xREZv?=
 =?utf-8?B?V0xJbUNKZEV2K2dBNExEU1IxUmp6MnRUc0RlRElQRHI4aWxCZDdFVzh1Nm0v?=
 =?utf-8?B?U05wc0RIeVdXdjFDVllrZW5JSlplOFhLUGlZY1VGZjFOeDNPOFdleStPd2ZF?=
 =?utf-8?B?bU92M2NvMFFhTll6SUxheXJyZ2ZVdXdERUlUZm8wSWJ0cU1vYkFpTVNrb0VV?=
 =?utf-8?B?U21XS0NUbjFYcGZMTGVRL1pzRzk3aUdhZHM0YTZjUHJCL1c2c1BEUXJpNmxM?=
 =?utf-8?B?dVM4dlFrVCthLzE0L2tRaHBwR1dhYlI2cEQ3VnBZTGIwaUhydDY4NTdJV1lX?=
 =?utf-8?B?dU50SE5yRUVXcU5yV002Z3o0OFpGL3daNGU3Vld0cGxRenlPbVBLbkhUeFNT?=
 =?utf-8?B?MFljaXdVVXA2NUZROTNrS09FTFY0RmRCN0JFdkRJL05ZNG1mVlhDTUYzbTdF?=
 =?utf-8?B?ZmlsN2hYa2F2a2FMV0gxTmxUSHVodzJwVUNINEl2aVdZcm9lUy8zaVlMTFEz?=
 =?utf-8?B?bDRQRStURmZJcW4rM21TTFEzc3NzcjRmQW12dGM2QklIQXl0U0xxVlQ0WEpz?=
 =?utf-8?Q?3ljxxgzYqzbk66VYauKJ3h6Ci?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e23e1056-1653-4793-1d32-08ddb00d2c23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:14:41.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TUOb058ymBS0L2gGYRk1gABWYrVHctoOgR9GMKB/RP1p8aAhEYXcuOmPH7kZ0bPGlh99QyRNHncQlNGv/yFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
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


On 20-06-2025 19:19, Rodrigo Vivi wrote:
> On Thu, Jun 19, 2025 at 12:30:04AM +0530, Badal Nilawar wrote:
>> Reload late binding fw during S2Idle/S3 resume.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 91923fd4af80..6c44a075a6ab 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -205,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
>>   
>>   	xe_pxp_pm_resume(xe->pxp);
>>   
>> +	if (xe->d3cold.allowed)
>> +		xe_late_bind_fw_load(&xe->late_bind);
> something seems off here... d3cold allowed should only be used
> for the runtime pm portion from the cases we can lose power like d3cold.
> But we don't use that in the s3 path.
>
> We should probably have 2 different calls here. unconditionally call
> in the regular/system suspend path and conditionally call in the runtime one.

Agree, we should unconditionally reload lb binary in regular 
suspend/resume path. I will remove D3Cold check.

Regards,
Badal

>
>> +
>>   	drm_dbg(&xe->drm, "Device resumed\n");
>>   	return 0;
>>   err:
>> -- 
>> 2.34.1
>>
