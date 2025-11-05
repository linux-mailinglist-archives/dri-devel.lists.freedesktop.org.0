Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBEDC37622
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 19:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB00210E1A3;
	Wed,  5 Nov 2025 18:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnMXWLOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2E10E098;
 Wed,  5 Nov 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762368696; x=1793904696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PXvCDKk0K/zJugpagohpbbzwnNAWMBEwcAKgF0jLOPI=;
 b=PnMXWLOTyd1PXSRk+JujELBLLvfw+rWRxnT5LTcq4dsbgD8zKl+ppUWP
 4MDnYYVI8dYiUJiKHjMfBuk+cu2Z30XQskUmzKEfaIvAAPuo8MMUV8PvN
 lrXYCRc9OXoWJRNZ82hdlpDeiiZuAeM6trj8RR26ymWA+iuWS8EJjd8u7
 AMKJSXzOAhsMiBzQhGgx8S3YdxIKbTZIRkNF5IUYlxJdVnY90exjbN72Q
 H7UruWcqPFXH6sfa1deYELFgzRllUuvrDfibm5VSUyMxyjSGtyHc33YQQ
 /OdI3Mv7qhamcskbuFsF+fV22y7v15Mv54Fm7ybZ/Ds8MWFDUo/xTh2rp w==;
X-CSE-ConnectionGUID: +aiCZxxIRZy4o/S0Ecer/Q==
X-CSE-MsgGUID: WwK+4AHyTmyUOGV5Xz5x2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75175242"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75175242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:51:36 -0800
X-CSE-ConnectionGUID: tZ+3PkyYSNWIwrVex7auZA==
X-CSE-MsgGUID: m5BfFST3TJyueyq1kYHf7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="188257514"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:51:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 10:51:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 10:51:35 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 10:51:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD1DiHeaQVTJPWtDNhRN+3tALOHIMSLPGJDFZH+TUiqn7c5Z/+4Jei66QBEvk0ndgwC10IDlB/UPK80abMnPcFlugCV//7RvjU7LjcxXh3C2Oxnf7mjh+GAw21mdtbs0Dq69I5V04dQb0pbYCeAHQaqeUqNhCBjWRF/C73gj0TV3BwqDxbvHzjrj8Txgm285b8cko2WwNcw9fI+v9Od5eNpD0erRS8LUUsBC7gyTUqz9NkPX+0xTDwjJqpgv+baI81WT3YvA8CHp/bNRWx2OGqb4/2VAkBhYhYm4Z1/Kt4Ug/LBxgqE4FDBRNUM65AVcSXnDiNvrITbwue92uWTa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjPQtXkcakAtSmqfbZ+duMqs5zj5esP+M9x899Jgg9A=;
 b=Ej/7VIfZ4IT2wKNjcJe+k5ZkqimxYkaVlQN/eXKLeZZsBsSR7bzAtmZfmhIxq4AwqyrvfQsHfnZgWuuSHLZ7m/1vZJcJdxKPBnBqU5Y8hflu96YTVNij5dL+J0lHaEOqFZUS2I/K46Wng+JMdqm3f+IQCuJtOt+GvOkKRzS2t8bUPRvvk1rxotDggWNyZbXYbeG2mwjKGV7MGlHiWCv5XiG/wQD41oLTIkmb28uuJrbeNHAm9LpVcmUSRlYlE+StmaiEc+oyTNQhKTNk+ToGa+rGEGqI3jd1o3zAE4SHqqDgzeqq4HQjRHc+jDbzC770MO/JVTvZBWy6Ai2HKMkrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 18:51:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 18:51:32 +0000
Message-ID: <481aa68f-ffb4-4eaf-a2aa-d112e9529aa0@intel.com>
Date: Wed, 5 Nov 2025 19:51:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/28] drm/xe/pf: Convert control state to bitmap
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 kernel test robot <lkp@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-4-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251105151027.540712-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: d779fcbf-3699-41b1-0efe-08de1c9c5612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2dZWGJWUHN5WWMzSzNJQVc3Vk5ZWkxSSXo3ZlE4Ty9RbW9NREY5ZVNBVkdK?=
 =?utf-8?B?SVEwWStITnI4REI2NnBEK2pKUzVmaytKUWlvVXJKTm94ck92ZVRnNXNWbzg5?=
 =?utf-8?B?Z0NtMEJYWC9wMEVBQkVQdi9OekVnQkNaU0E4czhFQnpPU0FmbStISGxsNGlx?=
 =?utf-8?B?WDFUTzBSSVc4Mm9XMzlDVlJiOEkyQ0ZON1AvbHprSFBuYlQ1QldUNnNvcUNw?=
 =?utf-8?B?ZEdOZnBRbm9XM2swTHNEWFJTWEtua1Y0MitJVVdtdnJlNDF2bEN4QnJuMjdL?=
 =?utf-8?B?enBMQVA3V2NuVVFpYjZSMkRxSWtJQzVpcWYvSEJabEVidk1yYis5T3BXWkpO?=
 =?utf-8?B?Y1BFbitYYllzK2hmOW9MeGlQdEtqUTRvdVAza0h1N3A3WkZQZElmMU56U0V1?=
 =?utf-8?B?UGpzOUJzUE9HQlFLQ0p4Q2pLWXFuTDZYQTIwb0JrQmVMVXJHUkVKTlRKNnk4?=
 =?utf-8?B?Zzc0WVcyWEdCY0xEWUhlUGxNV0t1dzdRZmRoaGY5RXkzZm84ekhWalZQL09E?=
 =?utf-8?B?bDhVUGZCT2cwdlFnbEpYZVRCYmpmWVlacVBhTTRhRmlVMWdpRm56V3NwM2ZX?=
 =?utf-8?B?QjVPZGliOHU4anlTTlJwL2IyK0pIU1FoS0lZR0JMeHJ4OFlrTGJPY1M5RnFN?=
 =?utf-8?B?dVdsaVR0QXk3YUdNeFBNa29LMWpSSFlVR3VJSE1XcktZZ29GZlFPUk1UOEZz?=
 =?utf-8?B?aGw2WWplLzEvVmM4R0I0VzhLK2Jxei8ybWNsYkFEa2NrcWZpamc5Rml2NFJy?=
 =?utf-8?B?Zjg1d09mdlliWGdzVDMxYWVVaUJHejlocmJMRXNJWjlZTVFaSEMzWS9wem9M?=
 =?utf-8?B?aDdyY0pJVG1makhqTTBlMVB4eFVEcUJkRlRlRnlDMUF2WXdLSEUzZEl1L3hr?=
 =?utf-8?B?SExnSlF0RWg0SnBLOU5vSDYxdmExQ1VKdlUzTUJjZ1llS0FoNHZZTlpabGR2?=
 =?utf-8?B?dW1QQTY4V3RESzJXTkFwUFU2Y2svQnFESk5KWnd3bG1nbWplc3NpOWZLbE11?=
 =?utf-8?B?OVFJcWNabGU1QzhOd0FzeXQ5TFVaOW9yMmJyb2NzdjhOWlYrdEc4M0FmdnZ2?=
 =?utf-8?B?eENWMENxY0R5TXdRRG9OODVYNEFxZ2VIclZXQjZlNG5SK0NGRzE1L3E4TEhM?=
 =?utf-8?B?WUlWTUZqbzlxcjdaWTVhaDlPa3VtekxtUmNickN5ZW52RTdtL0VkdkdOVzZa?=
 =?utf-8?B?UmRIQU1xcTljRjlQU0JNZC9qc3doTFlKdlJMdFplc0hZdHF6anFvMEE0Y0FZ?=
 =?utf-8?B?T3lRVFRrSXFHakFvWHlwcTY3eElzeG9tbHhDeDg5MU1RVXhYQ3o0VjZwTVU2?=
 =?utf-8?B?dmU1T2g0Q1V1VURsSjZXeDBwK0N2R3A1VXh0ekJrYjROWWl5TTRMdWZPY2hu?=
 =?utf-8?B?bFhyblBtSDBXZ045OTFwRUxYVU05bTlhTHY5K0JRSVdRSkVoVDcwdnFvbkgy?=
 =?utf-8?B?cjVOYXlwKzJ1dzlxTXE4a3ZreHdydStjTXF3dUVUTGVBR3VGeHFac3c2bkgz?=
 =?utf-8?B?ei9MSUo5YlAvN2RnTkllUmovTlBDNm5VZkc3ekJhN1RnLzAvaWpmS2tzS1po?=
 =?utf-8?B?SEYwRXhLSkVxZmw5ZzREZjQwbitmSHdvV1pKRUNoeDRmN1ZCZm41UW9TSGxy?=
 =?utf-8?B?MUNsUGRZQmxUWWd0cmZ6VUlWc3R1aVQ5dFBYOUdsL2JRR0hyTGNvZzFnUjM5?=
 =?utf-8?B?WDBOczFrRmtRR1RXNEROTE85ZHEwQXZ3OHZFRXJjMXY5SE9JRFVkMGZtaFNn?=
 =?utf-8?B?OHBudldWaUNHcHlzRndkVFFUZmgweldQbHowVlhycUgvMHlicWpqMlBKUW55?=
 =?utf-8?B?VEFoNlBSNnNRRnN1QzA0b21MMUtJci9qbUcyZ2FVMDJxdUtZL2VZVlA4NXBO?=
 =?utf-8?B?TEFZd3BLb3EzNVYrVkxmSTRlMXlRVDdvR0VFVnJrb0ZmdS9KOHQ2cGN6NGpC?=
 =?utf-8?B?SjBzTjRHVFdUaGZGb092Mkcyb1oycDhyVjdCSXhwRG1QQnRmWkVQTkV2OVZV?=
 =?utf-8?Q?4ujmQrhXeqRSaPklDWDK0iTT2Xjq6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNPd0N5NDIzUmI3Zm5uMC9kL0QrUDg5eE9aamc4L2VCUCtDY3NqckQ2c252?=
 =?utf-8?B?cy9YMGU0OGtnOU01cEJ2TzRSbjJGTUhJaEE5OFk0eER4bk00UDVLNmNUU3F1?=
 =?utf-8?B?ZU1pK0xPM3RiUFFOa1JUcGd0andSR2hlK015MVcxNnhRM0tvSm44TC9nWlpP?=
 =?utf-8?B?eGZzaXZka0x3UVl4TndiRFQ4NFUzMW12anNaaWIyWlQ3eHJEc2J2SmlYc1JD?=
 =?utf-8?B?VjUwRGtsUVV2MkxIWTFZTklJbXVaU08wekwwSjgyWXpVMDdXakxuVVRvZ3FI?=
 =?utf-8?B?ZXNWS2g0bXBNYzYzUFB0SGlUOTZmZ3J5NzREQlM0WGx4TWlkWWtlRFBWWTM3?=
 =?utf-8?B?alBRZHlCL1JwR3dKOEpML0FaN2dQRUh5eHc2eHM4VmVkM2tZSnRUY3pWTDBI?=
 =?utf-8?B?M2d1K3gyTWpnS2Jrdy91V3RIanhOUEZMdVN6Q0dEQ1ZhZ1lGcC83U214ZkxP?=
 =?utf-8?B?cDZHSHlSZ3ZOK0FyZ0V1Y01HVXlmUm1LU09tUVhVR2J0ZUFUTVJHUEF2SWg1?=
 =?utf-8?B?ZnRyMERKWkRUakZ3UGY2UHIxWjhXUXlJZmxIWDVBVEJPS21wVEhPTVVnRnZG?=
 =?utf-8?B?MWhYR0ZNanZ0MjJKN2wwc0p4NXZSb1RQdFM5bE05MlUwTzhXMHYzSUJZdjVo?=
 =?utf-8?B?T1p1cUJQUm43TDliK2RMSzFibzArL2NqNlFLVTJ5dW1SWVp6TFRjTUNNaFBK?=
 =?utf-8?B?UzJNRWZIaFdBcGc0OE9oV0g4Z01pY09ySFp6RzFzdUl6QS9sdVlISDNORFRq?=
 =?utf-8?B?RzJHdktjc1lub1hUV0V2ZGpoM3RsZ3B5TXUrSVpYYkhwaGZTaXozc25GMVFo?=
 =?utf-8?B?Znp6MGVCa3ZLenJjbVZ0cFBZdzZQUXVOL2FvSEg2WEt2dWVtWlRGOExjbVZR?=
 =?utf-8?B?cERYYXBRSEl0dC9wSGRrdk50SzhHVWJnK0JwMUxXdGVtTlZBKytTV05yYStX?=
 =?utf-8?B?bStSUU8rVzFWY2hRRGtrNVhKR3paWitjM05MMTBaWUk5WjJjaTlacU1pNG90?=
 =?utf-8?B?U0U3NlhBREx1ZGtZVEd5ZmwxaDhMQ1ZocjRuNmg4d2lVa2cxd25qV09TSC9a?=
 =?utf-8?B?OGdLazZLN2pkbW1mZEF0U3l5bFRReEl4VllDMldQZElrMnRPVGdQQURzcXFS?=
 =?utf-8?B?MVJ0WmgvSGZiT2lrZ1pCbDQ4NTBzUWlWWE0yTEtFaEY4RmRYd1VoWFpHcERn?=
 =?utf-8?B?Zk1kRnIwaTZzVEpxalpKenhQQnpBSnBicWF5QWdnVlh6ZGRsb0dKbDFLQlhE?=
 =?utf-8?B?S2RTV3VxeGJmVldwbFk3a0JicFVNaU5rL1ZpWXlIWmlrVUZTdDkyVkhCRXo5?=
 =?utf-8?B?QVhvK0YzSXh6dksxSW8xek5pMHBmanFKMklZd1dQSVlzaWlkMWpvWXd6M1FS?=
 =?utf-8?B?Y3NKVnovcmttUmNWT1RvOCt1NXd1N3l0dFJ5WjV4WVdiNFliSDZNTnRRZEN0?=
 =?utf-8?B?bGFyMERRNCtxOXRLNFRRaWhqRVFFSVJrVU9OQm5hR0UyWnNkekdBOVNnQVpx?=
 =?utf-8?B?NFB0d1hoc0kxb3RmUzA5UXQ3bEdURWFoRHpDMHdzVXZQa052MmRGc3NBSzNI?=
 =?utf-8?B?RGdkU2Exam1aUmtBN2VhY2hhSUN2NnQ4N1I0NEZyM0M2WGtLbG1qd1lvWHJt?=
 =?utf-8?B?MHM4bW9kNVdCL0xZUUdrL0o1WjJRcDFCTG4xSk55N2Qya1hwbHc3ckpsNnpx?=
 =?utf-8?B?UHoyWGVDbEx3QlhhOTFNZDNqM2NtdUNxYlZYc1lhcHdEL0o5RXNZeUl6RE15?=
 =?utf-8?B?RSs5TFJ1TldkSi9KcEw1cjBDMHIxQ0piYVcyMkU4TC9ZeEZEbGZ1aVRCcWNa?=
 =?utf-8?B?bkc2U1FJUHZIR2lkY1FpeU9sTmk5YVQyVjA1M254enBTRkpYRG85UEJPUHZM?=
 =?utf-8?B?R3NtSGdLYWsvM2RRaU15S1VmWndGbStaOXdKOVJEb254YTVBNFdmTndMdTBU?=
 =?utf-8?B?UDEyd2YzU1dVTWdQT1VkaFFSL1BhblRxTUZ5WUttTGJxOTI5WEUzRCt2T0hh?=
 =?utf-8?B?OFhsWkpReVQ1UTBwSDVUcWtORGR6TmhISlRQZjdJa256L3BrUnZ6ODJWdTZK?=
 =?utf-8?B?ang2NGZ3OGkvV0VQZStGUGZMQ2pWRlFVUUtTY2g3cGFnd004cWpnRzdGdjdB?=
 =?utf-8?B?a0docXZzK214Z3VuZDk0UXNGYk5LUVF6Q2g3M2FaT09hWVZmWUF1R0RkaUFD?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d779fcbf-3699-41b1-0efe-08de1c9c5612
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 18:51:32.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17X07qEwY6dwwg6SKjR6pO3XGu2vxJ1CguiLL+S2tyPyUWSTlZalD9xbQ4VTRhqZxhTu0N27gOJGJ9rFQban56+s+sruJtnHDEPvj2se4FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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



On 11/5/2025 4:10 PM, Michał Winiarski wrote:
> In upcoming changes, the number of states will increase as a result of
> introducing SAVE and RESTORE states.
> This means that using unsigned long as underlying storage won't work on
> 32-bit architectures, as we'll run out of bits.
> Use bitmap instead.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


