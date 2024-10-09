Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464C99719E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 18:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E4010E787;
	Wed,  9 Oct 2024 16:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjr7MVX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912B610E781;
 Wed,  9 Oct 2024 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728491600; x=1760027600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MKaVmjNIZ6RHBWLtJ1kvfdmUbDiC8KqeCczNL+Kb4HA=;
 b=fjr7MVX0DTiTnGKJB9u5ETjQC6f1HuXfIaQRu3bPu/uMDjxWUJxL7Tyz
 DgOAYg5iVs6UZMgSR9Vst+quYR9YbF4j7nAXPVJ2RzMcyoBBDOfy9LEBd
 Y9Hu9KpSpflDzEOXLE5waMS8p4iVxQ7Fe6Vv+Emo6wZrmi2WQvZLZzXnC
 AJvyY3H7/TG4dXbmk4vfTIf/dH4IZEXlG4cAJeMzpzg+nxLOjz2xO73Hs
 csSSk8WpqSls3i2AL570J+xKqaAbJbNXt1srIdlw5qZz0BrHLx56N/y4p
 jLGza4LmZ+8/nuMD70B7Wcs29NlZ4fCTM7PnJCV3YK0/h+PVhdRDVoLlq g==;
X-CSE-ConnectionGUID: m1KnEF76T/uP2yJ40eMgCA==
X-CSE-MsgGUID: Jiw1B1oSQxu9hlxRQ1AXCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53211809"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="53211809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 09:33:05 -0700
X-CSE-ConnectionGUID: RCMrSNcLRfKulmWHYZIdbg==
X-CSE-MsgGUID: 9Lnukj7yS9KqtEhsc5tNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76775925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 09:33:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 09:33:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 09:33:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 09:33:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 09:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMgWZ5a1DG+GAZmSTzEWVpoBtqpvQa22xQ+0yNitDrqbZezhi/0ONfYXXvxWmHtfUkH1zyWSzTQgY737q1oMcngDcAzCl5mnej+BgPD073MfZdXF9YXXEhHsO6TrUPvJn5G8oAlrX7ZNUQQH98YCDsHczjS+Obb+wYRemGFMQnI8ilCKPQIuyp5cs8IznmupwiD1Pwh2eVN2uxnxzimHWz2O/co5nP9pQlZpBZXqZ8Ci/4KMZkqsh7UCB/EbXhWDd6b7xJCpG+lljUHigJ7DcZznCS3+Gwqm+qVoyO3l0UI7MfD6f9ut2yi+/blx9m0rBSanlAVm0KS4tL6sKdFKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mszenVbSDh31krTGCYslZTT/r+rKH3E3VPasdLhwI4=;
 b=HLtJmpcHJemtIN1NRIIfqeb6IEBPzV/4nQEBMSINBRoLGIUqBBuEoMmy+j3+LwusS7cmDliI5OR4fp4wgA1f7zmSRBscGQ01Tn/QC875qClYylS0ANu5U94F+2b3D93pOgxkqto2gHKq5XnmT8cwQff1VXtY/hDK1vSJjf2V5ZUMLy7WU6D9n56KvwKtTuFu0PBBSKga1h2Q0o7Z70LKZTohBF/V91gnKK8vcsndIHhuSN86W9uQGs7DcWEPiVi05S4s3O6MCiQKVnR2UtY3hHz0t+EHqZ8JEsvUbtKssqQN3GAzp+tmjkUPVPHxPUdo2MOD4F/lBqBs0JtsLPhgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 16:32:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 16:32:51 +0000
Message-ID: <7feb0520-0cd3-46fc-8b44-a78d1c3a65bf@intel.com>
Date: Wed, 9 Oct 2024 09:32:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/xe/guc: Fix inverted logic on snapshot->copy
 check
To: Colin Ian King <colin.i.king@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Julia Filipchuk
 <julia.filipchuk@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241009160510.372195-1-colin.i.king@gmail.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241009160510.372195-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:303:2a::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c71f58-1222-4bc6-b139-08dce88004d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWRRejRNVlhiQjJzMkErenJZSFppTTVkVjZ5YU5yZ2tOQlFtelBRRThYWnN2?=
 =?utf-8?B?T21vZ2p3RDJkNVVUZnZwa3BSV1VlYkF6bEYzL3h5OUNSb2l1RTJUMEw3VSs3?=
 =?utf-8?B?YUVjTzFRd1Z3Yi94Qy9oQ0dVUTE5QjI2YmJwZnZZVlUvb3hCZVRIT3lVWm0x?=
 =?utf-8?B?Q254NXMwMDVuZlpJaFZ2aDVPenozV2krYmtCU1pFUkFYRVhEakpDc0w3MnZn?=
 =?utf-8?B?dUo2cjJEYTg5YzVTa3pGMVh3Y2IxU0I0a0pMbEE1NlpGMnhweWRlbVV2THdT?=
 =?utf-8?B?TXVPdnVUSUhGcDhySHJWUnpQY3VEQ0VuSE4xV3RSK1VBWXRNc1dqN2d4N2x6?=
 =?utf-8?B?a2RzK1pVQUEvL1dJNCttYlNpRjIrVlNLQUViOUcvWXFZek8xOHk5amg2amVp?=
 =?utf-8?B?N0tsb09mWVdHZU5jdkRKMVhhazMxbWR5clBoMmJicVRxc2taSWpHNk5NUkRv?=
 =?utf-8?B?dis3R2hLT2FqZE1hZTRPZFpHeExVSUpKRGgyMXZoWTlBMWZNTklrOElKS3Br?=
 =?utf-8?B?Y1R4cHBVdTV1ejQwT1VBdW5GdU1oT2RHcmlnNTJYd0tsYXZmQ051MmNtblBZ?=
 =?utf-8?B?V1FENVNOaXBhaVNBRVFtb29vcEtVd20rMkxJWXZWaFBwWlpQYzUxRDFrWk5P?=
 =?utf-8?B?UmMzRDFJNWVGTDJKaHZ4cVNXbGErUXdNamVkbTYyOFdIZWR5NnhKdEFMTTNS?=
 =?utf-8?B?SVVhUmt5UWVOY01LbmNNTmJGWnBQTzg1ZG5pSzZ2cGFDMk44YmxvcEsxU1Ur?=
 =?utf-8?B?NjJ0NWIxMFZ5MVByUlo0NFIwYnZvci93WVdkTm1WUUxPa0xVMHkyYk9MYUtB?=
 =?utf-8?B?Qjh5MldSMmNpRjJ2TXBhRzBBVGRqaVhoeUtKSWltSXVvN1FZNFNXcmJxTmNh?=
 =?utf-8?B?bmlCUkdDWjhBZDJIcUVjS21iODY4dWVjRTNYd2ljdEQvcjRBcDdtcUhUTlE1?=
 =?utf-8?B?b25zM29Md2dYUy9OanlSQlZwY1pXM0RRd0xjcS9iUHJjWDJHY0FJWmFLOFcw?=
 =?utf-8?B?Vmx0Y1g3Zlc3T25KdncrYktVM2Y0RDQ4SVZBc09QandmcTk3QzBENWs4aHM3?=
 =?utf-8?B?b3I1RWhHd0s4cWVuM1RwSm1xVkxwWkUyR1ozRERFTTYvRkUxNUFKU2o2RXd3?=
 =?utf-8?B?UXYwbHYxRTVaTVV2cWNoNCtab1g3K0c4Zk4yVUJpOUhRTlVGUUI0czhrZ09s?=
 =?utf-8?B?WUV0YlZFb3FHUE8xZmcwTGRGcjN0T0JUUjRvM281eDZ2RFRtRjNQUlovdk5L?=
 =?utf-8?B?dDBCQjBRSUVzckpBak1INEtVNFp2T284cWpFemNDSC95L2pGNm9nS1lSMDNQ?=
 =?utf-8?B?RmdMQmhocWdLcUtiWTc0ejBmNHZ0OThpRDhhc3VHRk81YWw1NkZVUFhFYlU2?=
 =?utf-8?B?TmxMakZjYUVTaWR5RkxLK1FXUFovQ2NrQ1VKOWl4eDg5a2NNZWc3QnlOMUZ4?=
 =?utf-8?B?MGVNd05kdUdkbjNCek9YeGFOcWc0N1JXRElwNkJQR1VieWQ4OTZod1YzNk1B?=
 =?utf-8?B?Q2JHUnhZeWZ2RGRxaDUxL01ScVpJNFJiZ29JQ1ZOL1VqdXlSRk1MaWxKenJE?=
 =?utf-8?B?c1BadENKSk45cEkxVkpsVHIwZ1NJM3JGS0creG95NHZQM3dEMW16TXhDdU1G?=
 =?utf-8?B?UG00ZlU0OGlJSVlxekg0QktVd0pzWm9LMWlOYjhRa1ZjdkdybjBGS2Z6aHNs?=
 =?utf-8?B?OWZobXU4d2dKbG9STFkyTk5UaFhaaENtWHN3bksxL282WWR6RnE0b3ZDWG5M?=
 =?utf-8?Q?AcRASM4SEhQYcI8MjYafN+qluYglUZgyX4jfAJ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTUwcmp2aTB6S2JoNmhiUkh3MTYybTFYSUVTS2FMM3RJYXBrNnBtdnhGMFhJ?=
 =?utf-8?B?QS93VThzWERiWXlPbjBDQTg1QkVBQVNBdE5tSjlRSSswRGYwQkFnOGMvWnpH?=
 =?utf-8?B?VzhmMDhkVUNwWEpmRlFkOTFCcEFiSGx6ZWlMaEpZdzBVL3RWanYzcXJUUFRO?=
 =?utf-8?B?b1BoL3ludE9FYlIvemtqNHFobytIckV4RmE5dHNPbCtXWWl6TXBWZU8zbTR3?=
 =?utf-8?B?TFNyL09FNHB5VHkrYVhFVG42RkFTZTNXZU5nYm1pdk5oc3RlTnJ2QjlBWjZy?=
 =?utf-8?B?WklyZDlVSkUwaVlBWm1ycVZqUTRmcWZYdDNvcENHRzlVbVhsVXk0RWErMlV3?=
 =?utf-8?B?OFFRbHlsZGlOcWZkeEFES3dydlBBY2dTSXlNajhRclRaWG9lU25zZWxDV3JG?=
 =?utf-8?B?dUJvQStCLy91TzhWK2h3SUFsaXBoK09iMVMvMkhTL0ZoeDVTdUIxbmpNQVdJ?=
 =?utf-8?B?ZkdYWDRiMkdjeFB3ejVuclBGUHVKY2pKdkV0VU9ranQwV1E1Q2htay9WZHlu?=
 =?utf-8?B?YnBncld6b3oxY21kdmpUSVBWK1c3Mm5sVUZ0Um94a3ZpNGJYSXpjNlNtblN0?=
 =?utf-8?B?YXYvT3liRzlMWkE0dnc1dkFEQ3EzampEMDRRUDBqRmRVU2hwdFI1ck5LSGxS?=
 =?utf-8?B?cDlsZHIwamhOYmtFWUtUUmVyMUZMN1hnZHNhYWZtOHZTL3d3eFZ6K2hKMWxI?=
 =?utf-8?B?bFJtUXg0THpDMWJ5ajVKdFVPeVZib25BbmR5M2FmYk5LOXdwT2dveVljUVEz?=
 =?utf-8?B?OFRUTFFCbXFweUg4cWUzSDRrQlJLMlN1K2U2MTY2TFlmMmRrOG9KMktyV1lH?=
 =?utf-8?B?RkUxMFhzLzhPcTQ4bElnenQwcTMxWUVCUENudkZGZkd5QzR0ZnZXT3dUZ0Uz?=
 =?utf-8?B?Z0pEMjVWUkUvTXZBb2dXcmZmQzZUbFNST1p5ZkVSbU1OTGZpWFJwbUh6Lzdz?=
 =?utf-8?B?c1hnVjBJYkJKWHpmTHZtT3ZyTlNoM3pzaytiL2FITTBnMVRXVWtvbTUvQkN6?=
 =?utf-8?B?Z0t4a3VmaWhnOUdyQitvT3hNcGx6cGtVKzRoZ2FSVkJOOUxnbnk2YzJ3K01H?=
 =?utf-8?B?bGNSekZlWjI5MTE3UkFpQlFVT3RvYmdGM2hIRDQwRFBJdjhEaGdrak9vaVFs?=
 =?utf-8?B?N3A0YmIrZ045SXhnWS8rNXFBRVJjbFFJVVEzRDMwZE9HRkxlWW9Ld1pWaDhX?=
 =?utf-8?B?cjNMQWEwWnlxY3FmZWFsQy9DaWwrNlRWL0ltWSs1NkxOcGRxWEVMdmdRT3Jk?=
 =?utf-8?B?T0tPWmszNjArVW00dWI3cWJqQ3dMaGVSdzBVZVFod3NySUF1bXl3MmJiUy9W?=
 =?utf-8?B?U0JtaW5GSnBHM2tLV3BGNy93YXZISUdNVmNnclpIZHM1akF2WWJFb3daNUwx?=
 =?utf-8?B?KzRSVUFBU1pDZ08vU1ArTHVxZVgrY1VERHNkU291NDgrdDNETm8ya2NHNmdy?=
 =?utf-8?B?Y1JlNlVnTVlJVDUwb2d1ZkxIaTk1cC9TNFhLVFVMMjR5TXJzcmIwQ3A1TC95?=
 =?utf-8?B?dWc0aXhHS0JNTm95UTZnQ1EvR3hKeTNST20wWEQrUHNwNkc1RzJ0MDQxL2RB?=
 =?utf-8?B?Ymd2cXB1eFh0UVR3Tm5DY0dUTzY3M2VqYTh4L0ZVbDlkRzNSNVJkRWRZcnhD?=
 =?utf-8?B?emxxb1hyVmhzN0FHb3Qxd0JjWUxaa3p1OUZtQWdYOEsvYnVnWFVqb2VDRE1D?=
 =?utf-8?B?SHl1VGxnMTFWSGFkcVpZMEFZOU8valRXNjR6bTFqTDg3Wm8wbVBHekFjT2I1?=
 =?utf-8?B?K3VRdzRhZFprOEt5Sk1MYkw1TkZpN0h1SmNKZ2MxVjJFTmlUaTJtckgvSGxD?=
 =?utf-8?B?anBQbkpxMTlveVo3TS8vK2NZa2R5OHQwWGhiYWxZT3k0c0ZTblZ3YTZhTXJV?=
 =?utf-8?B?ZDRIQ3Uyb2VLM2lCZHhORmFLajR6aC9NVE9mOE92WkRjWCt5bUdYRmxtZmxU?=
 =?utf-8?B?MEg5MDYyMjZNcEI5bjZsNWZWZEZJVVJUUkNCUDk1OERacU1heVJCbS9QM3hB?=
 =?utf-8?B?UFJReVVkTC95S1EyZ1NlVGU3U09BdDJBYWRkT1M0K3ZKNWZJdm5sSUdqR1Zt?=
 =?utf-8?B?b2ZDTnl5clJOZnJSTktLRzJOM25TNnQ2VFJpYnpMRFVSVmRpSjJuN3F5M1JC?=
 =?utf-8?B?VVYyYXM5K2FwVXJqeTlZL1FrYkZqcHkvRWs1Y1pDeE1xQXhwbms2WGcxRjAv?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c71f58-1222-4bc6-b139-08dce88004d3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 16:32:51.5941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ7f0PqGA103e6eyNkLmGB1CHV0UFemjiK2QfSj+9L8pC2I/h6fovbOPevQiChiH5jhkfJX/3NG0GqFqCUsmzkas3LOPy0D3n9j+8akXzY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

On 10/9/2024 09:05, Colin Ian King wrote:
> Currently the check to see if snapshot->copy has been allocated is
> inverted and ends up dereferencing snapshot->copy when free'ing
> objects in the array when it is null or not free'ing the objects
> when snapshot->copy is allocated. Fix this by using the correct
> non-null pointer check logic.
>
> Fixes: d8ce1a977226 ("drm/xe/guc: Use a two stage dump for GuC logs and add more info")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

Thanks for the fix.

> ---
>   drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 93921f04153f..cc70f448d879 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
>   	if (!snapshot)
>   		return;
>   
> -	if (!snapshot->copy) {
> +	if (snapshot->copy) {
>   		for (i = 0; i < snapshot->num_chunks; i++)
>   			kfree(snapshot->copy[i]);
>   		kfree(snapshot->copy);

