Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358AB28A46
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 05:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965FF10E2CA;
	Sat, 16 Aug 2025 03:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zYSwubeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ED210E2C7;
 Sat, 16 Aug 2025 03:28:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPaRhxY7ByEQgVH/7YLdCEk0QcVJTv0ge6+a01RfhAjKCD2Smk502Iqc7UYPYwKFWNH5xDvNf36bmYdeLrpD4K+aRoG6oGfPN5Qgmhfo+NPK8U2JpBkjCsTE+cyNN9ERU9r7kdGeb4+A44Gf3KfZyR2wcfOSKl9oTxUynEH+anns8Y35Dgh5F1d1slO7eGTfOskQTUhM03zxftoKjr5WCFRDJS3EzQklr1ftAxOdzHrRTk4LObSrW2T0UEPYovHV3eZuRKoc6mvWjx4HfMbcXkIRUCW5yMTR+9MQlGVo0dOvjZV0gqIYJBRwIfHV7nAR5KZoaRhjQV2QqghqeXf6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVimpn/7CiAe/wgKaMD/sZBO9aXhNW0ANfkwJXN6zhE=;
 b=oV/YFKGSSvPPP05+0Fwt1Xv+ZdyynGhwqPgkqn4oZw9JBG46djgbrBVMcu+Bj0jQTe/99Za7+vjd0g/y5n4ILqooTSoaZN6nMONw5JSWTkfn2wDt3xSnhAuWiBquIjU/tOpVVd+NDbVJMbFRFQDfGibVatKtQ56r93HJGgJFVgyQMptX06CalrkaWMId03EDTrAOKf47Q4gRH0VgyIjaMOmeKU23+61yf6Vxwu3hBSGOXL5B7ChxPUuHuIRGypNW4FVOwl8fiR7PWn2JA1wDqtpxy8wGP9qYSHTJfomAsxTdgbKrDsSZZMGrZgBpkoIjtdtNfeCtm7tuLu5FI5wLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVimpn/7CiAe/wgKaMD/sZBO9aXhNW0ANfkwJXN6zhE=;
 b=zYSwubeRKJ4y+hJrBpFT3lrLUrXn9ZQn83nzMYLVrkNH4QhgZ3XRf67f0rfO06pAroaJ20erWexJSHY+2r+XeJncmtNh084Yv5vr/urDZ2oR1x2s1LIAGKvFbkXoz9zC2XqDXN+0d0SvGdLjLoYedLeRpq56s1Whr/130ecWd/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Sat, 16 Aug
 2025 03:28:51 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 03:28:50 +0000
Message-ID: <6ab345aa-262c-4da4-8e18-8d8041962540@amd.com>
Date: Fri, 15 Aug 2025 21:28:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
To: Shengyu Qu <wiagn233@outlook.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
 <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
 <TY4PR01MB144322B1C74D8FCF6370BD12D9837A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TY4PR01MB144322B1C74D8FCF6370BD12D9837A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d876f0-61f9-470f-3d63-08dddc7504a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDBXUXkwWjIyMGJEQzZ0WThWZm1Zby9qVGkyamdXUHBhajBJNUNQcEF4WW9C?=
 =?utf-8?B?YkdDNXRoSzYxZnVsWitITXI2bjFIaGI4R21JR0FwODF1YTZIblRIUHRSLzNx?=
 =?utf-8?B?ZENHbW4yTXFKMGVkRGhRRFVhV3B5S1RoMDhJem9PVTlCYXA4TEErL1VCZnJE?=
 =?utf-8?B?a3J5ZFp2VC9zeEl0SGlHdGlUM0NxVEkxeGVpNDZYRkpIeHVtck95Z2JYSjVQ?=
 =?utf-8?B?Y2VHVHk1M3pVclFWQllmckdNMURXazUxNXVPNzJjNVRwUkp4cDZiN0d4Q3Jt?=
 =?utf-8?B?T2Q4QzR2SUJ6RkxNQ1hnOURkYTNsWkhQNXZ6WHNJd05HeWN3NnkyQ1VLcy9K?=
 =?utf-8?B?SFBuKzlMT2ExTHBVNkk4Vm1KbEZub21pMStWcEJzRDlyZDFTNTVvbU92WGpQ?=
 =?utf-8?B?N2lyRGRZNTZub1A4YmgyNVJBcnpiUE9zVVJzbHU2SVZKb201YkZZOExwZStN?=
 =?utf-8?B?SGJXbk91UFJKVjBXWjBKUnRGQ3V0QjdEY2xvL3ZSTWUyR1RnbGU1UW04UmpZ?=
 =?utf-8?B?aitxamxGWFRNSy9CRFpCMkRoUHFSVVJWWVZuUmhZU2pPR3NLUDQyTlgrWklF?=
 =?utf-8?B?bnpCeDdJenZGOURwbVJQTjdaV3RxRUNYZkxiR1ZxanhLRWlwMzYvdzVoakJw?=
 =?utf-8?B?TEU1S2l0dTRHVWZRUVBGRkRBRUFTd3Blelo4WVBFcUZsSzJ1MkplRGdQS1lW?=
 =?utf-8?B?K1VtWGFoOEFydnM1N09qWHRERUZvaXdNaWttWGVQdWI3Mm5tRnJ4elVwdVNW?=
 =?utf-8?B?em5TYjlEU09WdlpISGhSSGpENU13SGpkQllxQktQL3g0ZU5kbVBxTUswM1RV?=
 =?utf-8?B?OGZkSnBldjR1aFhXZjBnRUd6V1EvdHJkQ3JWYlpUWm9NSkozNzUzZU4rT2NC?=
 =?utf-8?B?Tlk4ZkVUU3VPREF1MW50VWNZTUpUaTd5NElYSzE1ZEE0ajJOcTVnYVprOFhE?=
 =?utf-8?B?eEhJNWVuZXl1bjM3cE5jRU5zYUpXUDlxc2RMeUlBNWRlaFJ5a2NFbnN4S01i?=
 =?utf-8?B?c0Q5ZDBEVk5ZODVxNzF6MUlYRjR6ZGo4RVVjeU9pbHJxLzk1K3BKYkRWeDBn?=
 =?utf-8?B?WEFndzBLTlV6TEFoSy95T2pNdHZVbm1WTVZpcjVIUEdsMFhTZ2pYdkZOdzlV?=
 =?utf-8?B?b1Q2Q0JWSmt3UjRDSVFMcHRPZkVhd0FCeGY1MklMNmhxRGZ6VitPelpJS0Jo?=
 =?utf-8?B?MDRlaDFrMGY5TjFEZFU5VVlWYkx6QmRTYXA2V2ZCVVZBRnpDYWhtUzlzMHc2?=
 =?utf-8?B?a0pnWWtTN3pKRGY1Ny9zSTVodGNFajVhYWxVejdJMzJKSDdvc2xBd3BnWkZT?=
 =?utf-8?B?YTdsMFh6T2tPcFo0N2wvYnBGZXVJUXpiUkYvK3MrYUgyNHdmV2R0QkoyMldL?=
 =?utf-8?B?R01rcERlc3plc2hjTE5leWRYay8zRzZod01qMGM3dWRLQXlJY0NaWDhGb0RD?=
 =?utf-8?B?dCtRMHIzOEVyQkIzOFQ2aWNqTm9XbXh4ZVhwSk1Cckh5VDNBWS9ieUhnQnVE?=
 =?utf-8?B?OUhVQ1N6WXpwdlB6bk1uNFZ4SzlDbHh3ZDhhNDAwUkdpWnE5OG0rQ044U0pz?=
 =?utf-8?B?QWFjNkJTazVxZGpENHRhL1pJUi95M3JyRkI4VHF3a2IzZVQ2Zk5CbEEybEtn?=
 =?utf-8?B?azBLMHE0V1BzZlJKREp2Zkxoc25NOEp6V0YyZk13Y1o1R3lFUzlnbmM2NWVI?=
 =?utf-8?B?cHo2ZFVZMkROQkJmN0o5cGJ0VUk0Q0Z4K3NZV0x1SzdFSzZLdWtQaDJWaUhZ?=
 =?utf-8?B?WVZZWG80OXRycUdBcm1IOUhScm85amRXMkxyd1JvU3RSZTZjdUd2RU1VRllO?=
 =?utf-8?Q?BSaxn7BceHgKfGAyE+FHFjHe2zhq0Kou+zOVU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG04MTJBU1VxMGtjdkpVeDNyWk1yOEpVQzk1dmNQVWFyb3EzQ2VvUFdwUWtr?=
 =?utf-8?B?bXIzVUFIOHpSdTFoN1BVd3l2Z1hFRWFWYzFYS2d0aWIyL3FmenRxeWdlMnl3?=
 =?utf-8?B?aHkvbXlqd0k2WmFjQ2pwNXZxcXdOa2VKaXk0VUpKdnI5blhyK1J2S2xOOXBy?=
 =?utf-8?B?bEFkWVpWKzJaTEw2Q2pmSTVDRmxzS1ZlQ2hrVGtMWEllUmJyQjEzZTcxekZt?=
 =?utf-8?B?a2JVb3VocFhmVXdXaHZTN1NmYVh4Szc0QlExR1JzN3BObzRHVDJ0V1VMNUZ4?=
 =?utf-8?B?Tkp3MWdURzhrWUJzb3UzUmJTbldjQTRtTlpIUUZ6ZW1xNXBubXFKVE9sTm11?=
 =?utf-8?B?MTh2L2FqS3IyS09XbDBMdkxSdjBReUI4M0M3MVJ6ajY4R3Z4TWMxYmhCMTdl?=
 =?utf-8?B?ck9tSldMSjdXdXA1Tkwvbk1ySDRTTG92dkNscGRiQlE4K3dpV0IreDhWd0hq?=
 =?utf-8?B?RzVZbDl6aVdKeWd0ZmJVVmtBUzk2S0IzdUlwS1J3MUg4ZDl5aTFFYlVlWm95?=
 =?utf-8?B?YTNPV3oxU2NpT1c1ZHRQb2VrVHNHSFEydE5kTnpRSWJMWThLQU5YY09IRWhD?=
 =?utf-8?B?RE5ITUdtMG9HaXYwRTVPZVJKbDZKaHQ1RlRNYXBYRmpwekRmendER2lVanFC?=
 =?utf-8?B?SllHWk1uWlllRlpvWFhLTzBMMEpWWFJUZ0tMRjYzdk9QblQzR0l0NmFodDdp?=
 =?utf-8?B?ZlNTa3ZwQlhNKzVOcEFrdERPdktCbVhOYzRQQVFqRituS01lQVY0RlBtNCt4?=
 =?utf-8?B?TVdHSDRMbGp2aVBiaVhkQnEvS0VBMXhYMEdERjdKY1JOblpxeXZUc3pCRHc1?=
 =?utf-8?B?ZG9IeHlkeUpLZWVDbXYreDVFYmNINk9sczI4czFUNEhwd092Um1UdHFNeGRV?=
 =?utf-8?B?ZDBZN2N6MERkSjQxeFk1SjJGeEIrSWNFRVJlWVliWkdRNGw2eUFNdFIrd05X?=
 =?utf-8?B?S2RpVFVCUGpFalcxbUx4cmk3RU9DTGlJYzVaMEJrQkNMKzdLMEJMMk5oWWRR?=
 =?utf-8?B?WUxNQ2NaYUZIMlQvL0dsYzVmYmJ1T2dMWnNXQjhyaHFrVWEwNHNZM3dZa2pk?=
 =?utf-8?B?VVdXRW1NZTBjV011Zy9jVzkydjEvbEtJZU1EZExDZUcvenhYaGk3RVc2U2Vm?=
 =?utf-8?B?TVpieFNsMElVOTBHYTdQUWFsNFVGWWltK05MS0FuWjVLNHBZV1U4T0tsbG1p?=
 =?utf-8?B?ZnFSZVRlMUQ0TkhRM3pQeFZOeUxicjJDcjdmL3BaR09rbTlWekdRK2VaZEU1?=
 =?utf-8?B?L1lTSk9yRjJaa3hITHFFc091dm1WdFc1VU9SUnJZU0VyTGRoaXF0UG4zZ25O?=
 =?utf-8?B?R2t6NFUrSW9aSmFxUThZbjlRNkRqKy9FR0xrY1BHM285YUg5aDFlbVFNWUhN?=
 =?utf-8?B?aUlUQUdic2ZrYUVoZlZuVjFrT0VwWjlvcld6SWtzSVc4eXZzZFJTclVrcm9U?=
 =?utf-8?B?M3RKcktlRGhhTlJCRFV1R1phcUxNSEFsMnRjaytxa05tMUdsMTA2UURCUWdm?=
 =?utf-8?B?K2ZVWjk4ZnN3L0lrN3VNZExRbmFBY3lRZlhMT3JyWSs4bzJMdEk4bWcxWjNv?=
 =?utf-8?B?Y2ZaYXZFS2FTM1BkN0IzRW1WcjVTZ2dkcFpEblVJeGQrYzBHR1Q2V3RmMUo3?=
 =?utf-8?B?K1crOCt3M1k5d0phdkk1U2JrR1BGK1F4a1BaV0dmQ0RlbmNKN3Q1SWQzWlRr?=
 =?utf-8?B?dWpkUG5xTStZejRSNU4vRStSNy9OTzlhekRGSnFWUy9BU01PVnJONFh4c2JE?=
 =?utf-8?B?c2ZycWZPY2ZIbDFhTGxqZFFpWjlXcXhFdHYxckRPZTg0aGFnU2NrQldPbVJN?=
 =?utf-8?B?ZTkzNk9oUmIxdWZ0SzJ3RW4rb3MxbnpMaTNHZ1NGd1RoanIyWUxqamIrKzNl?=
 =?utf-8?B?QnZPdjZielN0QmE3QVNLR2dQSldjL2xJWHFJOW5xWTgySHlzZVlrSWJiU0k3?=
 =?utf-8?B?Q3IraElrNFdQTlpVR283enRrcjFDL3FXQ1VYTTdSQjFNTjRBeHh6OC9ZeDBU?=
 =?utf-8?B?ZHV3NWQzU0psc016T3RHRmtqVmU1RDNWcTBRbWQ2Z3hxcXVEdmxnMEhlbUlB?=
 =?utf-8?B?akUvcW1xZFBaUGRzK3JZbGkzK2hqdGxyeDVWc2JiQ2hRdENCM0dCVGRJQ3gw?=
 =?utf-8?Q?F/CBUlmuYau8DBUI/564A9m6M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d876f0-61f9-470f-3d63-08dddc7504a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 03:28:50.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNW0+mIg16OV+JFEvbpVkJF6Min4LWNco8an1YPLp6XFWQka6sWnXZFbARK5IL3xeiGkF9yy24Kz1o7HwH43zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815
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



On 8/15/25 20:45, Shengyu Qu wrote:
> Hi,
> 
> Thanks for reply. I guess we need to point this out in documentation or 
> code comment? As I can see different definition somewhere like this[1].
> 
> Best regards,
> Shengyu
> 
> [1] https://color.org/chardata/rgb/BT2020.xalter

It's the same one. You can find the ITU document in "Documentation 
source" in above link.

> 
> 在 2025/8/16 3:26, Alex Hung 写道:
>>
>>
>> On 8/15/25 11:54, Qu Shengyu wrote:
>>> Hello,
>>>
>>> What actually is this OETF? Is it power 1/2.4? Or reversed BT.1886?
>>
>> https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!! 
>> PDF-E.pdf (Table 4?)
>>
>>>
>>> Best regards,
>>> Shengyu
>>
> 

