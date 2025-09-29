Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DDCBA98C6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6634910E43C;
	Mon, 29 Sep 2025 14:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0pT2Nl21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDE710E428;
 Mon, 29 Sep 2025 14:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB8GCWOIYPN81EAZW2peQy46oJWKRF9MZmZvJrc5QxFqbo55LVYatNX7Euy3rR0Y3yvvgnhvmW2VGH65KknDSYMhebez2oDQoKd+Oq2TBYsNHMLgvxzSob4WDpjHtxC0XhqFWqcSHpHWG8/RM2gof9WzDdknSTgnBrdF2T2C11U9oAhH6QcUUFZ8QharKbh/BdA8rt+xyl0rUZLolJ+Z1LMbCVophsYVTi+DOZhJlKvrCsPWNcQ5pH/s5H32lsfPCNdPuakibeGkDJTXYNG7hN+wz1eDFBCEIcEpzi66urAqICS/YZF+KaHkG29xYAYR8nbDtzYHZrvwL18sU6fQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv6lqwHflTZO2FaF/5SKKmfhOIQBsLFh6rucuxhfQUw=;
 b=mQ36XVjwxcb5QDUZPIU6Fse37/LVAVZUrdPCgJ/60CWTCxVfGcBMoxv/TjyXiFLvahLzueSf9dCUfQfGwdVgANmPQgnboa0vtl7IQeHygKMFtPwSxH3cpya9yruZ+gF+stUd0uQnb3/+Fhpk92zZPfeDz3USZyxWGObDjxWdWKdHjHUTGQMyOWigCJmMaPCMouc4ZWhONXAmi9PeZ8/xGfOecBS8lDRJz/uvXC/h1d6ExKdSVY9bj6+RoFpfA0Gyjf2cHYkC5qolgSwh2fVaeyVEvcT3sCgH2Gsg1PwXMrU/oRqhbE97H/Vkgz1h3TYE6OKLy9G9I6Y0fxC5ooRwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv6lqwHflTZO2FaF/5SKKmfhOIQBsLFh6rucuxhfQUw=;
 b=0pT2Nl21JdzU5xMwGT04JAmuq2u6HdmK8ArBt9wNO6tBZLjEXSMZWKn76DLhwJhpPppBmwVNcQietlQVAh9+WrnDVkxj5NgEADjR+bNQYpY7GHrJdyNSoZI2qclUu1+wPU9cGy36N5twfzNn8M6RDJd115gaaaYEuqUdZu06s1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 14:25:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 14:25:53 +0000
Message-ID: <7884e68f-48bc-4218-ac21-150751a79723@amd.com>
Date: Mon, 29 Sep 2025 10:25:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/20] Introduce support for post-blend color
 pipeline
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <4d4170fc-f91a-4e15-b8a0-317b1af8324e@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <4d4170fc-f91a-4e15-b8a0-317b1af8324e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0240.eurprd07.prod.outlook.com
 (2603:10a6:802:58::43) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: d1894f00-a49a-47fc-4fd2-08ddff64185c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDZjVlRrWHB6Z1p5b2ozU1REelloNlhjbnI5aXBjMWxLZGZDNjJ6R1AvUVg2?=
 =?utf-8?B?VTRGMnhpV2JLbHdBWDNqVWtkK0c5REhqeU4rdlFKdzFzRDk0OEdIOFcweFFv?=
 =?utf-8?B?cWlYS2lyMXdHTmd3eSt6MFV4cHJTSnh5WWEvRzZZdzd0TUVReFZWM1VDZFZX?=
 =?utf-8?B?VDk0dVhIQVI0elFiTGk5SnZRdzlTYVp2bHlqWjUxSkdUb3lHZzRRMExkbGFD?=
 =?utf-8?B?cmwyZ04rOUcrMjB3SWg4bGZ5WE1Td2VIUGdwMTkxNFZKUGszdHB5NmJpMHdG?=
 =?utf-8?B?TWs4amh6YnNJUFVnRXZ3Y3F4U0dXNW9sZEFHczZNeEs4dTlwWTR1cDc2YnVV?=
 =?utf-8?B?STBoaFJzZHdoV2t0blBrOWxrOXlCVUpaOEFOQStQTlc0Rno3UFExUjJGRFll?=
 =?utf-8?B?UzFSWmN5SUc4SUdRWitaeUNPb0lCeHJtZFM3aUJRdFJPRVFQNjBxL3FzLzJp?=
 =?utf-8?B?dXljK2FqdlNJcHNxL1VIR2huNGVPeGhscUhoWGR4cksxbEttbUVQTUxmbmdx?=
 =?utf-8?B?RlZLQklvTkMzZzV6SVZBOWRZVzhxVTBXV2wrTFdhbGRNM2lLaVdUSU9ZS0Vs?=
 =?utf-8?B?RG5aZjRFeWhMQVgrYktNV25ManlkVGVpM0MxZ21xNnN4eHl5aVl6M1lnYjBH?=
 =?utf-8?B?QmxsTWxiTEZtT1pISjBnSEZrOUpOcjhUMHk0d2pmdzZYUFVTOXdsRHRudzdi?=
 =?utf-8?B?Y1M0RlgwUUZNR0g2RG9YamVhQXR2eDdLczJ0VmN4dmxVRVo5eWdVRzkxL3U1?=
 =?utf-8?B?bzdXM3dtU1V5OUU5QVRuNy8zY2J3d1pET21mQ0toVndRcFdQdkJYcFBCaHM1?=
 =?utf-8?B?U0JyNkpsZVJJUGpqU3hQMnM1TW1DVGNBdFJmUk8zSjJoZTQ4UndMNmJhaGla?=
 =?utf-8?B?cWxrejYzRTFDS0U4UkNDbUZFekd5bkR3TEhPNzBPeFc1eXM0MzFqV283d251?=
 =?utf-8?B?WlFPVU9rdXJHekFVS09OZDFHdDNONXhnK0hXZk9UWU1kVHRxNy90THY2U3l0?=
 =?utf-8?B?SUhmOUtNOWlQbkxKVVFCTkJBcTZ2S01GcG00MVl1azM4WHJEcjA1YVAvZld6?=
 =?utf-8?B?MDB0U09KTlp6YnBqZU5YODliaFpUM0VZcjIzNU92SGJoRWtybVBnMlc1THRQ?=
 =?utf-8?B?bWxtajNZNVZqcDVlWG1TR1pPNy9SVHN5UE41MlBXclhWSXZRbHcxWUVBK3ZM?=
 =?utf-8?B?UDRKNng2T0ZsRVpOcHV5K3loNWgrMktVaHhGOUUwZjlYOU1tUXFmeE5nTGJK?=
 =?utf-8?B?OG81SmloRWZiK2hiMjNxNTRwZ0JLWHovRC8rbWJzZ0xmd3VoNG9BZExUaHA3?=
 =?utf-8?B?THdvNENtclh0UGQybWZzaDAxNjRyZVB4VlBTQzBNczA5T2dqS3F0anYxek1Q?=
 =?utf-8?B?R1h2cS9HZGlmSE9LeWlsaHM1d3JLUlhwWkZGZkhoWHVEUytyTFFDZDhpTmdM?=
 =?utf-8?B?eWhXYlJMR0ZiVjNTdE12bXBBWmVvWmVlcGV1WXh3OU9IUmh0NFRha3NyYVlB?=
 =?utf-8?B?K0ZPZ0lzNGpkN2h2cVVWQTZEaHMwMjBqc0NlblVOQi85OVhHZDZsNXczY3NK?=
 =?utf-8?B?OERCMm9kWGlUWlRheU8rV0dSYmpvMEhsMlR3YW9iM1lIRWhNV29rOG8rNnhs?=
 =?utf-8?B?S2tqaW5qQUM4RThpZVNEeEIrQ0FVUzdUTDg4R3ZaeFdyVDhBMzBvL05WcGJv?=
 =?utf-8?B?WWN3WDlXVTBqN1BoSWZ2YklyM2xTa1ZMSU9YbFdTNmZvenhQZlVycThiM0Jz?=
 =?utf-8?B?NHhHZVJDOXo5RkVUTUtYc0dUOUV2NE4wdEhHeWdCZnJSOVBncFgramNtd2li?=
 =?utf-8?B?d2x5R2pLTlFLL3VSQy83NzRxeW1SRWs2N3hGd3lkSkJPTk9DR3JFdGtGQXFw?=
 =?utf-8?B?WXpReHhjdGk5YzFiTUZSUDZKMnBvcjZ4amRQeVYvNjA2My9wQUdhMCtKNERZ?=
 =?utf-8?B?a2pzYUtvYXBJNlZoeGZSdlB0RkZjLy9WWHVNb2xuc3Iwc2plSi9xWklSblY5?=
 =?utf-8?B?L25MNjNuZGhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdKUGRCbG9tclRQcXlmOHpENFRLelBDanRJZlFZTFVIMG9CQnEzRXE5M0pK?=
 =?utf-8?B?ejI0MHZKZGpLa2o3OFVXa0dqalFlbU1tSjYwcnN0dE05TCtWQnRYbEcwNmhk?=
 =?utf-8?B?NFFFeGhabVhRZmROZzFVMnQzUkZqRGFlK0YzeEU5b2EybE5aM1RVb1N0Mms5?=
 =?utf-8?B?UmpWTzhVajVQQ0tkRjh4RVJpcTBiYTJob2Jrc2RFZTdpV3dUcXU3czJVYlMw?=
 =?utf-8?B?SHpvRVBzL3BCaEpad1dQLytEVWZZYXFTVHdxWTBJTXFmR3RHdmtsc0txWDhm?=
 =?utf-8?B?NUp2Ym03VzhMa2ZYSGp6RDJSWTA1cE1zUSs0UlhpZlFGWlZlYjQySnlKZDlV?=
 =?utf-8?B?bHA3aWs1V05Xd1N3cDJuNmpuY3NQa0NFTVJrMHdLWVNEcndPZ0Q4MG4rSUdo?=
 =?utf-8?B?Wk9UWnRkWEJnekZJenZNWXMvSGlITVVZYWNBSVBkTndBdEVlcG5QTGhBTk12?=
 =?utf-8?B?QWdCb3pFZVMzclhWeS9rSHBXaitNeHE0N2hSWlZoRDZYSlFSSXRXbmxMRzlr?=
 =?utf-8?B?aFVQZkcvRklSY3hVRHZ4OHN1Tnd6OFNhQUVDaWVHVGtkNHdQQmMxSlAzQlpy?=
 =?utf-8?B?RXNrUmRsbExpbTZuZlE3QWlQZm1Oa29QcTdnQWVyeVRpRERFUXAwd3N5OXJa?=
 =?utf-8?B?akE3VnNJeWNDNTk0VVZtWmY0UlJjTlpsRjNNMjA4ak52VC9lZ3c3R1VXRUU0?=
 =?utf-8?B?UUFERGFlK3VXQnpTVEhEUkdhMWEzNitGSVNaVTRjN2g5N0JMMEgvdVhpelRL?=
 =?utf-8?B?RW44YmMxMVFiVDFDbHU5TzJDbzVUdmFJaUIvNVYrZ3c4VFRMZVBOUGMrbEFJ?=
 =?utf-8?B?TzhmOEIwejFsVGpUakdjWlZSRU5GRWt4UlBYQU5sYXR1bWJjeW5URjhTNU1I?=
 =?utf-8?B?bENQVlAyOUNZTC8rRFZIMWRVdnRBUVNsc2huVklRY3l1V2N1VTZRNVRqZks1?=
 =?utf-8?B?S1lKNW54SEYyTksrS1cydFlqWW5tS3VHdHcxaW9IbGVoazF6RmJpVGg0OXF0?=
 =?utf-8?B?K2ovVjN0Y3F5RVovemFUT1o3S2FnV2VDaFVqQ3p5YTRLSDl4V0huQkJUWWZO?=
 =?utf-8?B?WkRscEtKdXRDYmlRcXc1OC9xaWswOC9VODhxd0J5U3lubk5EVVZua2oxQjRn?=
 =?utf-8?B?Z0xMTjlnUXhKbEFEMVdMMjJlTGdhb2U0L2VEN2p4T3BlajdKbWRoUWJXZkNY?=
 =?utf-8?B?bnBFN2hldWxjL2ZtT2xuQWV2N3ZaNnl0bkZjVFc4STloVFh0cXlOay80Q2dz?=
 =?utf-8?B?SGE4TE1CTTAxWHk5NE1DL0dMSEJJUEdrbHVvWldoWmpkSEdHMVRoVTR6OXZi?=
 =?utf-8?B?NjRROVFKNVdranpnc1NYQkJmVS9BaUZkS1JyU200ckxsWEJRSmh6ekJQNDg4?=
 =?utf-8?B?TUlTK01KanZxdW5NaUpBazBPTHRtOEJDdFhYSXdWaGl5UXgyaHoveVpWZ3E3?=
 =?utf-8?B?enJWd3dOMlF3aHlzeGNXeHoxcThHY0U1UWdXL1NUMnZ6a3F5d3p6NzVmL0w4?=
 =?utf-8?B?Mk1BeFlFY1FmZ1lqZWJYUDdOK2R6MWRVQyszd3dWR1MzbCtIZndEYjJPOFpa?=
 =?utf-8?B?R2NReExKcDJ5SGIvN1Mvc1ZMTlk4QmMyQnBBd0ptVnNkaHIyb3Q4NjVOVEg0?=
 =?utf-8?B?aXRXVzg2Y2RETWdDU3pENVJzUkhwc0NKUVFJM09HRFk5cWNaVUZjMHJ3M0tT?=
 =?utf-8?B?akhjcU5iMTE0WGttUnpxcUJLSHNkdnh0SmhLd2tMUHlKZEM1QVk5RTZWVkpa?=
 =?utf-8?B?UmFnNm9sRzVyajdQd2hzMU9Oc3Fuay9jcm9UVFBLaksxc1FEdXRUNG9DRVVt?=
 =?utf-8?B?MnczVFJ5aTcwWGRuSjBNOEJhUEFkWGVrUHZRK25xNkhHaEQ2cGJBSEVhNEJz?=
 =?utf-8?B?eklSZFI1eUZ6bG91ODQ0V2M4U2J5b2hmc3dBR1I5OGc1bGpoWlVsKzdPSm1D?=
 =?utf-8?B?d3B5UndSYkJ6Z0RBNHJnaEhIaGh1TlkrN2prOHU5YmU2TlYxWUc1NFF3aWMv?=
 =?utf-8?B?QVBGYlB3RGFGSWFsdkJpMldnVUc2T2d2QTdwbUhrWUdFK3VUbjU2SUFSMVRj?=
 =?utf-8?B?QmFEWG1PZi9wR3A2V05XTkdON3NBa3B1WnBhY3h0TzBxaUVkcGZIT1VQYnRE?=
 =?utf-8?B?RWN5cnFpL0EzZU5odXVON2FSZ0ZJQ2o3WVFZNWYwWVhmaWJlcHRrbnJGTndW?=
 =?utf-8?Q?18kHHzcdqgV5BS4kAFmh38SBg8Q2MXI1+K8lp/daY0Jp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1894f00-a49a-47fc-4fd2-08ddff64185c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:25:53.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8bZ6ZOF9S3nlBI6eNZwCWlfjG1RC/7mnv5QwtHUn9WUYKbHEH/SYG0xoeB4FYyhH7f9202OIDr0ph3yMnX2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
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



On 2025-09-29 08:05, Melissa Wen wrote:
> 
> 
> On 17/09/2025 21:43, Nícolas F. R. A. Prado wrote:
>> This series is based on "Color Pipeline API w/ VKMS" [1]. It reuses the
>> same concept of a color pipeline API but for the post-blend stage
>> instead of pre-blend, by attaching the COLOR_PIPELINE property to the
>> CRTC rather than a plane.
> 
> Hi all,
> 
> I'm confused about the timing of this series being reviewed.
> Hadn't we agreed in past hackfest on discussing post-blending color API 
> only after we have sorted out pre-blending color properties?

I don't think it's a problem to have people with bandwidth looking
at the post-blending portion, especially if they weren't involved
in the pre-blending patchset.

I find it helpful to look at this and it proofs (to me) that the
direction of the pre-blending design is correct. I don't (necessarily) 
like how it re-opens questions that we discussed previously, such
as hiding legacy properties, and would be hesitant to change this
on the pre-blending patches and therefore delay the merge even
further.

> There are still open questions around color_encoding and color_range, 
> for example...

I apologize if I missed key bits that might require attention. Could
you elaborate on the open questions?

> How assertive can we be evaluating the post-blending API now?

As people wait on the pre-blending pipeline to merged it makes sense
to start looking at the next steps.

I would like the IGT patches to be reviewed before we merge the pre-
blending pipeline. Otherwise I think it's ready.

Harry

> 
> Best Regards,
> 
> Melissa
> 
>>
>> The patches in the series first implement the necessary changes in the
>> DRM core to allow for post-blend color pipelines and expose it through
>> the uAPI, and then implement support in both the MediaTek KMS driver and
>> in VKMS.
>>
>> This series has been tested with IGT, with the "Support post-blend color
>> pipeline API" series [2] applied, on top of VKMS, as well as with
>> Weston, with a WIP branch [3], on a MT8195-Tomato Chromebook, where both
>> gamma LUT and CTM color transformations have been simultaneously
>> configured in hardware through the API and validated (test commits for
>> weston at [4] and for kernel at [5]).
>>
>> [1] https://lore.kernel.org/all/20250815035047.3319284-1- 
>> alex.hung@amd.com/
>> [2] https://lore.kernel.org/igt-dev/20250912-post-blend-colorops- 
>> v1-0-83fc62420cba@collabora.com/T/#t
>> [3] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend- 
>> colorops?ref_type=heads
>> [4] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend- 
>> color-pipeline-lut-ctm-test?ref_type=tags
>> [5] https://gitlab.collabora.com/nfraprado/linux/-/tree/debug-ctm-lut- 
>> data-post-blend-colorop?ref_type=tags
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>> Changes in v2:
>> - Split core DRM changes for post-blend color pipelines from single
>>    commit into smaller changes
>> - Added post-blend color pipeline support in VKMS
>> - Introduced driver cap, and made client cap depend on it (daniels)
>> - Made deprecated color props (GAMMA_LUT, DEGAMMA_LUT, CTM) available as
>>    read-only when post-blend color pipelines are enabled (daniels)
>> - Created colorop_modeset_lock/unlock to commonize locking pattern for
>>    colorops (louis.chauvet)
>> - Added helper for post-blend 1D curve colorop creation
>> - Link to v1: https://lore.kernel.org/r/20250822-mtk-post-blend-color- 
>> pipeline-v1-0-a9446d4aca82@collabora.com
>>
>> ---
>> Nícolas F. R. A. Prado (20):
>>        drm/crtc: Add color pipeline to CRTC state
>>        drm/colorop: Allow parenting colorop to CRTC
>>        drm: Factor out common color_pipeline property initialization code
>>        drm/crtc: Add COLOR_PIPELINE property
>>        drm: Introduce DRM_CAP_POST_BLEND_COLOR_PIPELINE
>>        drm: Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
>>        drm/atomic: Pass post_blend_color_pipeline client cap to atomic 
>> check
>>        drm/atomic: Print the color pipeline as part of the CRTC state 
>> print
>>        drm/colorop: Factor out common paths from colorops helpers
>>        drm/colorop: Introduce colorop helpers for crtc
>>        drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
>>        drm/crtc: Track post-blend color pipeline client cap in 
>> drm_crtc_state
>>        drm/mediatek: Support post-blend colorops for gamma and ctm
>>        drm/mediatek: ccorr: Support post-blend color pipeline API
>>        drm/mediatek: gamma: Support post-blend color pipeline API
>>        drm/mediatek: Set post-blend color pipeline driver cap
>>        drm/vkms: Rename existing color pipeline helpers to contain 
>> "pre_blend"
>>        drm/vkms: Prepare pre_blend_color_transform() for post-blend 
>> pipelines
>>        drm/vkms: Introduce support for post-blend color pipeline
>>        drm/vkms: Set post-blend color pipeline driver cap
>>
>>   drivers/gpu/drm/drm_atomic.c              |   9 +-
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  65 +++++++-
>>   drivers/gpu/drm/drm_colorop.c             | 245 ++++++++++++++++++++ 
>> ++++------
>>   drivers/gpu/drm/drm_connector.c           |   1 +
>>   drivers/gpu/drm/drm_crtc.c                |  77 ++++++++++
>>   drivers/gpu/drm/drm_crtc_internal.h       |   6 +
>>   drivers/gpu/drm/drm_ioctl.c               |  12 ++
>>   drivers/gpu/drm/drm_mode_object.c         |   9 ++
>>   drivers/gpu/drm/drm_plane.c               |  36 +----
>>   drivers/gpu/drm/mediatek/mtk_crtc.c       | 208 ++++++++++++++++++++ 
>> ++++-
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++--
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
>>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +-
>>   drivers/gpu/drm/vkms/vkms_colorop.c       | 106 ++++++++++++-
>>   drivers/gpu/drm/vkms/vkms_composer.c      |  13 +-
>>   drivers/gpu/drm/vkms/vkms_crtc.c          |   1 +
>>   drivers/gpu/drm/vkms/vkms_drv.c           |   3 +-
>>   drivers/gpu/drm/vkms/vkms_drv.h           |   3 +-
>>   drivers/gpu/drm/vkms/vkms_plane.c         |   2 +-
>>   include/drm/drm_atomic.h                  |  20 +++
>>   include/drm/drm_atomic_uapi.h             |   2 +
>>   include/drm/drm_colorop.h                 |  22 ++-
>>   include/drm/drm_crtc.h                    |  27 ++++
>>   include/drm/drm_drv.h                     |   6 +
>>   include/drm/drm_file.h                    |   7 +
>>   include/uapi/drm/drm.h                    |  25 +++
>>   29 files changed, 994 insertions(+), 135 deletions(-)
>> ---
>> base-commit: 342e5ee08797cde0e8af30e6110a5dc1cba61e9c
>> change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
>>
>> Best regards,
> 

