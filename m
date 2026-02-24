Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFPMJlRQnWkBOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:16:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DB182DE8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254D510E4C4;
	Tue, 24 Feb 2026 07:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OM4txo/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8875010E4BF;
 Tue, 24 Feb 2026 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771917391; x=1803453391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sXjCkoCFDlCimZNmk9A9lwpdhcoDTgS+rsdDEgTv13c=;
 b=OM4txo/T09eIFszuV0MrkgNBUK8M6kAuIn1Ot5TfLf80C1TapJTIedeO
 DzxhpBSlbpQmAGb08oTwSnKJr6hs4tPhjD1zXTZej55gSn3+D2DKNxPhR
 2PIj/sRS2HwfZRrQItZ6Np7Mbbyd3fDBXs+61xu7TO3UFOfrlNFNGBF68
 8q74/I14lkGLZpbvXXha84EXnsuo6ywTPSHRJ8CMRMtYyozyz4coNbKBO
 +Ov+LvmkpMDs8GKc5EzAGYqIOYTaASQGXi4+c/imZNkW06M2kR+OAHcr8
 WtDlpDbQfofhfvv7bunsXxgawju+OUKDhKcvupI764BjMbpv8qeaj+9G/ g==;
X-CSE-ConnectionGUID: Ir1ZSeMaRWePUpDEGkae2Q==
X-CSE-MsgGUID: oYFqU675Sgms5HMYBZmV/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72629159"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72629159"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:16:31 -0800
X-CSE-ConnectionGUID: HhTCkWN3SUq9tgMaMLqLeg==
X-CSE-MsgGUID: zt30qr3cQTCA/Yc7N4q3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="243823385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:16:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 23:16:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 23:16:30 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 23:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpzN57sAsn165sjPWJQB9V3+11VMbs4J5zZSDFcXfO0R2zYG/WYNfTxbgnj6pPnv0XjMcGK4EnhkVdD+fZBhWbUzzvqglxftkAMXJpE5VVkIEa2kbf1EYZfz7W+yWMME4KHxUSGL7Z3F+wbZyo32CU4pZy0l0POvhntvA6ObK3rV3AIkC8kBDCcVvlknRWqzD7xFZTLyajPdYXHGJWeIfgDETKuV8bI8yIawJZiIA4UNApa2i1aLef0G7mMhUWVYoo3MHN/BE2GPJqZSrW7gfXGet60IaJsi0uWxoK35aDV32Owx/KB+RxaM/R9CaFLbw+f/MvUi94qNpjTA+zrQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s676Vog9RpfU24V5IaXSV5z0hkCbXxSN8JwKdt8ETPw=;
 b=gYdqH25M+mpZkSD9blwgK5iZqWbRSx2chJEmM1AspZdLvhHt4Vo0CmxAwJeAmk57ReceFX9rN0kuumC7xZHwzKWOXC/V9A2NUCCuAnLjCUN8AjK6Of/Xj2KLx2/CDO2/FoQ+QxgRwc7w8KLseRPR8dnj+TQZ/PhUKXGMOXvtcw/0zLJ6++Tzp6b1Cm95cmGF8SEAZ8I7S7Thk1lMpNUjrUeeoCWR+pQ24ILa6TkWnzMTXWK+w/uC7k77XJYYgdXhiiHDlgb/QvjniNVRWZv+P12JCUoz5pI7V8to9F+rH/SL8odLy/g9umHT6UXa42kS44Qh0OjypHO0LCIyT6hgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 07:16:22 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:16:21 +0000
Message-ID: <5f04b5f1-744e-449e-9a45-00fd477256fc@intel.com>
Date: Tue, 24 Feb 2026 12:46:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>, <louis.chauvet@bootlin.com>,
 <naveen1.kumar@intel.com>, <ramya.krishna.yella@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com> <aZ1OIDsVfFvyHUK5@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aZ1OIDsVfFvyHUK5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a47e3e-48cd-4233-b1fd-08de73749cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFJNL2Fxa2VKZ3hEQUlIbmZpOFR4ejlMWmJzTWZVMUhYTXRBcEVOdExwUjY1?=
 =?utf-8?B?NjRCcFQ0MjUranFOWVZkUEpxM1IyLzhMR0p5bEdIZWdNYitTTnQ0NXZzeHlk?=
 =?utf-8?B?NGFjaFY1YnF3QjFWODlSS09ra3FuSllTUlR6c1lhQnRBckNZa0FRZWM3dkIv?=
 =?utf-8?B?NVJQTGs2VFFCSFRETnR3MERyQi9NaGpPL0pXMFFwSXZwQktobmEwcG16bkZC?=
 =?utf-8?B?RW9yTmVPTk42N3NPVis1Z0FlTDlQeFBtRXFuRkM1VXZ0SHZ3RFU5eDd6dVR5?=
 =?utf-8?B?cUt4Q1pNRGh1TmFPbHlhamR1ZzJpZkVkaWNScDRCbHlpYzdXYlhVMFc4a0Z2?=
 =?utf-8?B?Mm9kRlVCZWRtd1RQNnZGMEh2WklFWkx0d2ZoQ2JKTjBtY3hxcTVhczdsL1hR?=
 =?utf-8?B?QTVhYkp6bG9kY1dYdXJJK3ZtUmlvc3E3OU5LaWdUMmZSSHlocW5PZVJNaEtP?=
 =?utf-8?B?OTZiN2YvNEZnTExvNnltN3pOSE0vTG9PcWRMRHpqTnRqKytIT1JlbERrWlM4?=
 =?utf-8?B?aEFNa3JMZ2dwWXJMZTI3amhoMmxKaXBmSVBxcjV2VFNlOU42K09yN2VUL0RY?=
 =?utf-8?B?bFlBVHNyUkZTNENBc0Vjb2YyVXBWbTRveUFGNmNmdFdzdkxSR0UraWEwK3pu?=
 =?utf-8?B?M1pPY2wrRVVRQkJaTG9mQlFiNWEzaEhpMWdDanNUZ3QyZU1wUlJ4eVlLLzZz?=
 =?utf-8?B?bmNhRGJqdUdwUTE5YVhDclZFYXA5Sm0yMnA2SFk4M2dDS1liWUdJTkQ4M3pM?=
 =?utf-8?B?VTY2Y04yTVp1MElLb21HT2NnZGpPWkFhVmtLUUM4aUJGaGI5RjJsS0ZocXRQ?=
 =?utf-8?B?WDFSSTQ2M3JIU0FmbzBncWlIN1ZNWisvRUVLK0sraUZocXBCQjJUcElUbE0x?=
 =?utf-8?B?c2U1Y3JlV1pWSmdPbHhtaFY0emord3hoSGdGNzlqR3NSRmxmS2MyNzdJQnl1?=
 =?utf-8?B?Vy8vRDV4Ym1GNzFidnJCanpmSkVsbjZXVFc4cC9VTEZQa09GM1R6RVJlWXg3?=
 =?utf-8?B?RVBIMHpvTG5BMmpQcVFqNHN3SGl4NVpVbHFxbEh6VElMSFMzdHJicndFREJS?=
 =?utf-8?B?VzdFRE1SRUZ1NVdBcVE2bXAxc1luYlJIcFBsdm9JV2pRT1RZdGg4cHVza1Jn?=
 =?utf-8?B?WCsxZktYQmllQmZvNnBHb2JBNUVxOFVZY2Z6cGFhQ3E4Wlh4cmtvUEVLdkVP?=
 =?utf-8?B?QVFlNDFnOXhHa1J3SkRqem5xMGhRUjVtQUVzTEpyMHVVa05iZ05zNUhtVjJP?=
 =?utf-8?B?WHcvVmhoVTZQVS9uR2pSazM4OXFYaVZEM3VzUnhXS04zam5PcFlqS2s1bFFZ?=
 =?utf-8?B?ajhNcUR3NEFVNmU4N3NUWmo3ZzRERWNaN2JaVnBOdGxoQVQ4cU8vN09UYmdO?=
 =?utf-8?B?VGJDNE5YbGhZQzR2ZnJycE5ablU3Q2x3Rm9kNkphM011NERtTlZvbnJrUlBI?=
 =?utf-8?B?YW1VNTlKRngvLzlsV29RaUl5ZTB1UlpjL1VCN3BlNndXWUlFclBjK3dsbE1Y?=
 =?utf-8?B?eERhNHpkN3B1VHhuVkpPT3J6cENORzBiL20xRXdOWE5OdnQ2NzlWV0l5Zy9z?=
 =?utf-8?B?L0tHQnZoVUhCM0MzRzhBRnhSVTFTMllZWTk2aE9RRFltZFJCcHEvQW1DYXhE?=
 =?utf-8?B?WUhkRlh5ZGFRcm03TVQzUUJ0ejVNMlF4aWU2blpMaFFWWU9XQSs1NDkvN3VB?=
 =?utf-8?B?SGxrVjVBQnhGR3JLR3R2emQ3YkdhbWRqNjA3Q2dXUEhFMlZKbjdNYzhFZHlm?=
 =?utf-8?B?ZjNncXVER3dLSU81U205MXBDM2tiejBrSEM3THc3TDE4MmxVdUEwM1VZV0pH?=
 =?utf-8?B?N3piSWRxaWk4ZFNEVHFvR0loUWxGUUN2THJkNWlZZktRMkRsNGZXd21sZU84?=
 =?utf-8?B?NytLYnBscWtiWkFsdkpZcDM1MVJKdHZLUXVtekVmRXJxMSsxN3l3QkNrTkkw?=
 =?utf-8?B?R2hYNjNHMUVXbzNYTmN6d2FySndxdlhuYWlBZmZTUUN5Ny9kRDNWU1UxMU02?=
 =?utf-8?Q?CWWr+/s0N2VkPpO10AIUOqgp240oA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVXOGxGU3lVWlZPaTg5MmhudmFyM2dYU0Y4c040bjZTeGJ3dm1pNWh3RnFh?=
 =?utf-8?B?cExEMHJyZzJlcHdiSDh1cFdtTm5NckZ5cUtUM3QvOGdOSkZNTzY4QXA3UkhD?=
 =?utf-8?B?YnRNT3E5Y3JxT3UvMzhmYk03L2lobkp2ZXlOdFp1TXRoQ1MzeUVwbUZwb0dv?=
 =?utf-8?B?bjEvelB2S1RtT3htVThQMWIzMm1PaGhRaXVlSExnZTBqbzVGY3k3eXE2RERw?=
 =?utf-8?B?WnEvcUUyZVBkZWRXNE8zZ1gzRURQek1FdkdrSWpsRFZGWmxsUU5KUkJBaHFu?=
 =?utf-8?B?T044Qlg1SUZiNFJ4dVJvamtzSTZ0WENiQk5iRHdyZURZcG5QK3N2STVUUmg3?=
 =?utf-8?B?WHZyZzRrNGhlN3FtRXg2WDR1cnN4WGdiUjZuNlIwdlVCK1FzRm5TMEk4R082?=
 =?utf-8?B?VkJna1hNWDQ4cmlRaHRUZGxYdFg0T1pEZ1NFQ1BhSjlWT1YxMlRsYndQU0pm?=
 =?utf-8?B?aE9OeEFPWlBlRndqaEs2b2JsN2NqL2RsRTlYdC9tWjJjTWdUdWtLRUxxWWpZ?=
 =?utf-8?B?SURoSloxMEFXTXI1VDVkN1NscE9Dc3FHeUJydHl6WUQyYWRzYWZtYlFtNVRK?=
 =?utf-8?B?cmlNR1Ewa1BPVnhiZWVQdkRmOVZYbUtreGpUR3VQaHhNT1UxY0c1TUVLT0M2?=
 =?utf-8?B?eDZjQ1UxbVdUdFlpMkJiTXZlNWZwRDc2NFNSVDc5eDZleDJ6aTBueHp6djc1?=
 =?utf-8?B?RkhLbnp5U1RscTJBZkFabFRHQll1SENLVmlsajk1VEpSMUJ6Y1dMV3dsWjdI?=
 =?utf-8?B?bFBzUFFnclNYMGVkc3lCMVhRUk0zaDVTRms2WVl4TmFOOGE3aXZtcmtTSXh3?=
 =?utf-8?B?d3kvYVI5U01hajhEM3JGT1FWc0Y0eWdOdy94Nk5PNTRUYjQrNnJGdTd1c1pr?=
 =?utf-8?B?S1FabEF1N3lEOU4ySzZ5MUYrZ0dvb1BPQVdXWDlXZEJPN2pzNGVQeTdnMVR4?=
 =?utf-8?B?SVd0cjJiSmtNNm1tbWMwYTZYRzF5TlZLV0YyNTlxUmZBVGFrSmV5dFV3OHZ1?=
 =?utf-8?B?SXc5bVRlR2pTSWJpRHJ2cTJkT0JET0F5dlJ3SnlQS0ZoS2QrMVlRWTJlR3JH?=
 =?utf-8?B?RENsWkl5Y3ZjVXVMcEZYUDdlNG42TkQ4dDBFcUMxLzZIamtubWYwV3NxRW9v?=
 =?utf-8?B?Tk1rWTFOOFpwa2V5V1M5VFZBMHg4RDdQZWFrVmswZWNjaVphU3IrTnI5OGRN?=
 =?utf-8?B?cG1hWElJYkpQMnhvdzRaVEhiZGoydzFEaVJjTEQ5ZU5qUTJIbHVGcU9LQlY2?=
 =?utf-8?B?cDJRaTZ6WEZnaGVLVTQvMTF5N0V0amFWQWRGN1FTNVFqb2RjK1U0Z3pFcVBS?=
 =?utf-8?B?OW1aOG10Z2NjTU5JTFE3MzNlVEpmL290eG4xYUVhMThoYW5VUVdWcGZpTE5B?=
 =?utf-8?B?M0RQdVNwZmRlZ2lwcVBpdzcrbzcrYlduVUo4c3gxY3Q4dEZRUWpHRUZ5MmlH?=
 =?utf-8?B?UFE1U2xubkhweDhoTm1Vb0ZOTGFVSHI0c3pUcHJFT2NaQ21YVUM5Qzh4dGpT?=
 =?utf-8?B?K3pTZFF0bThHVkZMSzJZWFpwZFZPSFBwNnA4UDJsOFFhUzdtaUU0cUpHeE5n?=
 =?utf-8?B?S3dJOTY0U1hwQmdmTTRkNHo0dkJtcWdsT2hzeXlNY1F2Z0RMLzJuREpMbFUx?=
 =?utf-8?B?cG1nQ0pYUVJrY3hKNUE4eWIwaTdxUUNVb3B6Z1NqNTE5d0pVMjV5S0NXdUZR?=
 =?utf-8?B?SS9hUEp0aXNlRWRZc3hkZmhKUUptMzRZVVZVN3lqb3UwOHN6VjNXZ1lNbGhw?=
 =?utf-8?B?OC90TDcvWERWaXFjYXcwYkc2cHhFRVBkTUZKWmVUV0xLTHkraWIzcFB6WFF5?=
 =?utf-8?B?and5YnUzbnJ3RHJtbTZULzRKTHkwcUJlbEswOXFDc3NVUDlFSkIzdDhQVDJ6?=
 =?utf-8?B?N0VOcDZxSTJzMkdnN24wNW9UOGxNdzlteWJyNFhoUDh6aUJ1N1BBRlRHWlgx?=
 =?utf-8?B?UWJmL3hpRkRqVGU1OExqZzNHZzdFTDl2dFYzcWxQci81RjZMcTdERHJpNWU4?=
 =?utf-8?B?UDQ3OXVHbGNUcytpZ3pwNUl0enkrc3F1MHRVUmhHU3ZSUG1sRms1RUdDUDI1?=
 =?utf-8?B?QWtOaXROZ0kyN3BxR2xMbEJqbUk3SlNiVHJub0kzdysrSzZTdGNsWkRTY1Y5?=
 =?utf-8?B?R3RSQTFMMTJsVzlDNDgxWkF0S01TbXhEaDdJam8zODAwRC9WZkZZcmRRNjVa?=
 =?utf-8?B?aGJXRUpsT3B2eS9ueFVUaGRxeis1OGtmcVFFeFNTK3F3YmxHTHg3ejN2QmFo?=
 =?utf-8?B?OHBmZWtaVGRLZWVhRkNnLzh4Q3ZCMjJYdytZVHhVZ2hYUFFpMXFBdytLOHE5?=
 =?utf-8?B?bDVmU2dNR0hIdzIwRlM3ZmRMVU1adC9BUXBleC9nUGFkekd0VGtEVjhPZFcv?=
 =?utf-8?Q?yZd2nRNbEPz7jHto=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a47e3e-48cd-4233-b1fd-08de73749cab
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:16:21.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6apHaB/oRe/1gY1j667/ynL6Z7RgzlgwdphH4DWgNwCGNc3ihMItqJwze8BcRAh/GPmBys4yDk9Hh10//ARmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4E1DB182DE8
X-Rspamd-Action: no action

On 24-02-2026 12:37, Ville Syrjälä wrote:
> On Mon, Feb 23, 2026 at 03:37:39PM +0530, Murthy, Arun R wrote:
>> Any other comments/feedback on this?
> Having random strings as uabi seems like a bad idea.
> How would you make sure those are never changed?
The requirement was to have a string for logging/debugging in the UMD 
logs and KMD/display to pass the verbose information.

Discussions around this.[1][2]

[1] https://hackmd.io/f3bDn3kyRUalLn4LbMfCVQ#Commit-Failure-Feedback

[2] https://patchwork.freedesktop.org/patch/666193/?series=152276&rev=1

Thanks and Regards,
Arun R Murthy
-------------------

>> Thanks and Regards,
>> Arun R Murthy
>> -------------------
>>
>> On 23-02-2026 14:45, Arun R Murthy wrote:
>>> EDITME: Imported from f20260210-atomic-v9-5-525c88fd2402@intel.com
>>>           Please review before sending.
>>>
>>> The series focuses on providing a user readable error value on a failure
>>> in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
>>> cases and it is difficult for the user to decode the error and get to
>>> know the real cause for the error. If user gets to know the reason for
>>> the error then corrective measurements can be taken up.
>>>
>>> User will have to check for the capability
>>> DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
>>> that the driver supports failure reporting.
>>>
>>> TODO: driver specific error codes are to be added and will be done in
>>> the follow-up patches.
>>>
>>> TODO: Once the series is merged the element 'reserved' used for sending
>>> the failure code in struct drm_mode_atomic is to changed to err_code.
>>>
>>> The IGT related changes are pushed for review @
>>> https://patchwork.freedesktop.org/series/153330/
>>>
>>> [RFC] changes for libdrm pushed for review @
>>> https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/450
>>>
>>>       To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>       To: suraj.kandpal@intel.com>
>>>       To: Maxime Ripard <mripard@kernel.org>
>>>       To: Thomas Zimmermann <tzimmermann@suse.de>
>>>       To: David Airlie <airlied@gmail.com>
>>>       To: Simona Vetter <simona@ffwll.ch>
>>>       To: Jani Nikula <jani.nikula@linux.intel.com>
>>>       To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>       To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>       To: Tvrtko Ursulin <tursulin@ursulin.net>
>>>       To: xaver.hugl@kde.org
>>>       To: harry.wentland@amd.com
>>>       To: uma.shankar@intel.com
>>>       To: louis.chauvet@bootlin.com
>>>       To: naveen1.kumar@intel.com
>>>       To: ramya.krishna.yella@intel.com
>>>       Cc: dri-devel@lists.freedesktop.org
>>>       Cc: intel-gfx@lists.freedesktop.org
>>>       Cc: intel-xe@lists.freedesktop.org
>>>       Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>
>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>> ---
>>> Changes in v9:
>>> - EDITME: describe what is new in this series revision.
>>> - EDITME: use bulletpoints and terse descriptions.
>>> - Link to v8: https://lore.kernel.org/r/20260129-atomic-v8-0-4cb7b0faa051@intel.com
>>>
>>> ---
>>> Arun R Murthy (7):
>>>         drm: Define user readable error codes for atomic ioctl
>>>         drm/atomic: Add error_code element in atomic_state
>>>         drm/atomic: Call complete_signaling only if prepare_signaling is done
>>>         drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
>>>         drm/atomic: Return user readable error in atomic_ioctl
>>>         drm/i915/display: Error codes for async flip failures
>>>         drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
>>>
>>>    drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
>>>    drivers/gpu/drm/drm_atomic_uapi.c            | 89 ++++++++++++++++++++--------
>>>    drivers/gpu/drm/drm_ioctl.c                  |  3 +
>>>    drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
>>>    include/drm/drm_atomic.h                     | 10 ++++
>>>    include/uapi/drm/drm.h                       |  7 +++
>>>    include/uapi/drm/drm_mode.h                  | 37 ++++++++++++
>>>    7 files changed, 165 insertions(+), 37 deletions(-)
>>> ---
>>> base-commit: cec43d5c2696af219fc2ef71dd7e93db48c80f66
>>> change-id: 20250728-atomic-c9713fd357e4
>>>
>>> Best regards,
