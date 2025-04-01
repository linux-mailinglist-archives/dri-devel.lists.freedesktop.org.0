Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B6A771E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 02:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE9510E4B1;
	Tue,  1 Apr 2025 00:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y9aYSDHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16B10E122;
 Tue,  1 Apr 2025 00:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOQr/v7arleycl4qpk6Q+AXq0PjgwfstZMpEkHN9+s95mcUETCotGIbq2KpOXxIkOWRQC0eThWll1fY56UwVVx2D20nBsalsryb2xbqVLj3CxT/0wYFy5gMm8H3OWjCftjPyn5rg3G8h8Z71XL3+3/9KNqesBNSkf0jW00S5BqnbE2G6LU3vP2Md8xYWyKONYZ2VW+KcnSHcG/KpJMvCX3T+M8LQJTkLZpIxncOa3B+3r0nvX7b0toAiWTy6MmlfwV4cqSwF1tkDiyohya54kiTxcZi02Hvtc6Svo9KKCyZD9510azLUFsyqkzLHasvGCk90x3ujBEh4KTxAOLAzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Jod8NqicSWA454ox5ok306hPVv+EXmxat5n9QeshLo=;
 b=fmj9MOpfTRu3VQsK5Fpv/iPkUmwGTcFaUa4mvjtuFsxBFmlJX3/Td9yc9RtftdRKOFX8COkNjST0ipI/tU+YLK2uQnCohilP6y2zUoApT/1LB48pzcvqd0Co1XQ+PipwfcSrQpW/M4VOqoG5b4VkxpQvvYxf0koRzLAiAy11zoUZ+vl9ze0/zqXlziYS99TVwJ0Zrhv7w7auMc9h6WDVWElLLNHYlMW7k2HaMhRhj0jSHbwz0UbPnzZPA3g6cjWcNKls6UnO9DLVcO97SpA+v+6Lwqd3owyQ21F0uVhyo8YgR9+7STy9CM7nFiw7Hc6+hBz/J8juA+frM7MW8CJxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jod8NqicSWA454ox5ok306hPVv+EXmxat5n9QeshLo=;
 b=y9aYSDHcAoFixXWC2wJWOY0U5T3kRnMBZeGDAA9Uv1Rlvn3HMdTz7g+yZWS0vuV8rADNTWFY7O2NuhYdPdAebN0rCl0dzrvU9oaMlb/rxpoABqiDbUWxwsIVOCtoCUOgfyGXXBMs9670VrpFPYJCH8gEQVoG3bc3igYQG+G9lu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 00:29:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 00:29:03 +0000
Message-ID: <4198d3db-aa31-49c1-a8c0-ed8f40b7855d@amd.com>
Date: Mon, 31 Mar 2025 18:28:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0044.namprd16.prod.outlook.com
 (2603:10b6:907:1::21) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: aa51fa24-4028-47cc-e8cc-08dd70b43447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WS9za0d5Vkc2V1B6SHQzQTBGdU5vVTZzbExaSWdDaS9zQ29NUUg0ZGJ3VXla?=
 =?utf-8?B?anYvUWdiUGNEWTEvVWNvQ1FQZGJadVdDVjJOQ00zRGFvdHMzcW9KMUhlTG16?=
 =?utf-8?B?R093Wmtlem5OKzVFcUdyZi83bGVnd0IrWTBqa3RqL0ZKY3BjcmNuR210Tnc0?=
 =?utf-8?B?SURVbytjVDdQbVlaYkY5eUpPV0l1cGNvSDY4bzErQ2RjZnZDRzdKRmhEUCsv?=
 =?utf-8?B?WmlrZU1Rb2U3ZzJ3Nk1qTTlLMFUrV2RwZVZpb3E5bjVzYU1BSDlJYzNseldj?=
 =?utf-8?B?T1pMM0hZWTh0QlJ3ZGs2STYvZEpxc2JuaENIcEE0akV6dzR6T3p3M3I4WHZW?=
 =?utf-8?B?bEVveFN0ckRabEwySHZCcWZ1S1puaTh6WGpOdmhSYmh1aWxSQUkwOTNBTzVm?=
 =?utf-8?B?WUE1alZiMUlORGZUWDZNbGRacXRVd3I0UTZvN2JRdGVreGRJMkpTWnZ4eGEw?=
 =?utf-8?B?WGgyT3hGMDVEWnI1TGNrVksrVjY2d1BmS2xKMHRuek5YclBvTmk0UFRENEgr?=
 =?utf-8?B?ZDVtczlRM29vbkQxOGYvOE9paE9FOElIUzFUU2ZLWWlWQjZ5ck5DaUU0SzY1?=
 =?utf-8?B?ZFdWenprVGNQaTlwd3IvcSswUnhVZU9mdU01VTBUK1Ivc1JXK2ZMd3d1T0pl?=
 =?utf-8?B?OE1Ld3FsNFoxTlQ5WENRdnRrZXpIN2pDMy9WWWVQU1FOeGxFb25Tb2IwMFJ1?=
 =?utf-8?B?aVBqeXNoUUxJZlVRODdWU2NNdFE5VE9KbVN6QjBzV25ySVVBK1RtdEJPSncx?=
 =?utf-8?B?ckFsb0E4MlVYUTNQbnVNaVcxSDdDbVVSTC9MM3dxM0dScUdmSHV6S25tSG5y?=
 =?utf-8?B?dUJhenBqUmQvbjFHMEttYXFRT2tBbHg0VzI4RjhleHF1ZHlsTmFmSUpRa2p4?=
 =?utf-8?B?WmJJQTUyK1VlTjU2Q0dRUzBHbWZ1MVZTbTRqSG5TSE9FVTNkSzBCWXo4TTRO?=
 =?utf-8?B?MnZCWjl4L2xiNkZQdjllRGxGM2JmUXVFdWJlMktGVHBtR1d0dDA2YlN3Zitv?=
 =?utf-8?B?SUFINmQveEpnWFRCNnExWE5wY2QyVTNmYXVRZGY2MCtpSkZkZXNUUjhVNUJa?=
 =?utf-8?B?Qk80TFFaaTl1d1U5L0tPQllZTlppSG5vQjhBSEpXNXRiUmJpMFh3OWIxMDBN?=
 =?utf-8?B?TTRzR1kyekxFeU9PQVJBa2NvcGUrc3Q3bjl3c0NCclNkZ3BGb0RVWE9kQnhz?=
 =?utf-8?B?ZjRDbDAvazhrVFMrdERLaW5zUG5TejlYRS8vMlhyUmFIaDB4bGpGQkFwUXY4?=
 =?utf-8?B?QlFmWnQ3SWh3VmFwSnkvOHl6VWMwSVFKMnd2cE9FTGluRTdDUXZOcmNQRW5C?=
 =?utf-8?B?Zjlpd3VEd2toQ0d6ajNuVUFCZlV0ejg1bFZZUkN4VGZIankxMnZtK0J4RWRD?=
 =?utf-8?B?MzdLRVNualQrRkVmMU9YNktSQXoxeEdJOEx4aFdyZU1SeWx0Nm5reTFPNnJ0?=
 =?utf-8?B?RlNHTmEvWTNuYjFnYmtDL2ZDbklmU3l1OWQ0Nmw1bEFvL0tTTHE1UldOUWc1?=
 =?utf-8?B?Qk84YlpDQUVFK25mWU1PbG03RTBtcUFyMk5DQ0tySklNQTlhWkV2RE1TZWhs?=
 =?utf-8?B?eEVxZ0M2WDdINkJmSzJyR3l0YnpmSjZ6QlVWNWRpNHRvZ3lmQW80NkI4MmVQ?=
 =?utf-8?B?TEdBVDB3QWJEaThmdllPNWo5R0RuWGNreXVjdVYvL0ZkZGFQaXdtZXFBVlpJ?=
 =?utf-8?B?R25yWXAvS3VWV2Mxd0RYOFA0Nk1UVTB6dFV0NDNXQXpQcG1qbmg2TGlKOUtp?=
 =?utf-8?B?cjI5LzdSSWFyemswMlB3VXM3UHhsNzVxbHZiVjJSYitjcnpxenM5c2poSkJN?=
 =?utf-8?B?RGJqOTBkZHhuLzlsWk9VbFVPcWVaOEdTd2VlV3I4WFk5Slo1SGRqNCtxWjVF?=
 =?utf-8?Q?Xhrot5P65aTyA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJ3dUF6RVk2aGN1czdrQStodVVEZll4cVFYaC9OUVRld3dDL0VKZ0FOQ2Zo?=
 =?utf-8?B?QS9tMWtLQ2xqYzdDd2V0SHZiVTUvblFNVHNJS2M2Ui9MUHRMYVRZNFZHeGNM?=
 =?utf-8?B?NjIxNjBtVTN4d0NncUU5K1R5cTJibGlrZktsLzZ6MGJrTzY3WFhwZVphQlRX?=
 =?utf-8?B?Tm1sT1BJNVdPTlZXUGVvelU3aEh2SzgvdWN2cmxXV1F4MGxtci9Pc1IrTWhC?=
 =?utf-8?B?YXhRa2Z6b0VDcW8rTXRub3dld3g4QlVaZFN0NUFRTEV1aE1JMDdDeUU4eEZl?=
 =?utf-8?B?bFd1bUE4cE9PS0dHa0pCVWlGMWx0SHhib0xLcjhISUk3Sm1acksrTGV1NDRn?=
 =?utf-8?B?dm1vQWp2TGhUT3VBWTBOcFZ1b2V5Z0Iyb1VSb1lLRzhIaWtVWVMweEpjbk9G?=
 =?utf-8?B?MTcvM2tEQlZiaEoraE1kelZLM0ZXUHZtZXI2USs0OXRTNWNUeVBlcUZtVlcy?=
 =?utf-8?B?UG9kZGZudEp3NlFwMzJMVnBkZVpyeWJzaVk1eU5hTitDaWYyN1N2QTRBdjJF?=
 =?utf-8?B?VzNiOGtLMm1Ea2FXWnk5NjhOeWFXN3B3SWxjVWtnaTY5OGFna2JGR2FybENK?=
 =?utf-8?B?MCtqUFZDTjZWUVd6QmQzcVc3ZU10VVBKc0YvbG5FdTdTM3JtbWg4MEg2UERk?=
 =?utf-8?B?OHZxeVI3SkMwTGFsWlNPUWhDdG1ZR3p3cm9oR3JydGltMDFYamF5a2tTQUU4?=
 =?utf-8?B?Y1p1bnRzSTJTSUFlUHJhaFlqWnBsZXgwWksrNkFTSGMyTFFyZlhLK1BXVXhy?=
 =?utf-8?B?NzdCUVNuVDJhNUFSQ0IweGc4TzR0akhzWlFxd3IwYXRWcmdSZGt5cmljZnA0?=
 =?utf-8?B?YXc0WTBJc201UXdNaTliZ3JVSEYrTi9sNmQ3d0lTbWtXVUFoNVI3Yml0NklK?=
 =?utf-8?B?T0NtRXlSWk1wRzY1MGp3WDJFOFJhOGE3ZzZxZ3VKdW8vTi9pTjZBc1FTd0pv?=
 =?utf-8?B?NWxmNEpCWWk2QzYxKzVuUTlXejJaUEhXNU82Ry83L3gvbE9laC9GcVpEclJC?=
 =?utf-8?B?SFcrS01JbndmcS9FRG5iY0Q2SFBUb3hmZW5WVk5ienhWcW4vM3lUMHJ1eXg4?=
 =?utf-8?B?V2tteG9kcmtScTlWcnpvV2ovL2FZajkwdUJJM0FBaTA5UUN3cENZK3pYT2tr?=
 =?utf-8?B?TnJBbG1hV2lmdnZGZHV3bFBNd3NoeE1ubUxqWjVRYm9iNU40R3ZiS0pWK2dv?=
 =?utf-8?B?YjlVS2lyWGlXcEtHdW9OYUc4RUNyZE56aVJQMEJYWWxoeU9aN2ZmNVlQMjFF?=
 =?utf-8?B?YWh3alV2bHNzekNxRzNEZEtaTXB6Q3lQVDJCLy95WnBiVTZjZzV1Tmh0WWRy?=
 =?utf-8?B?SXlnZmVhYkFTbW5YQnA1NXAyQXBIZW9IQkZSaHVGajFHQWRsem5rc0h2cUQ2?=
 =?utf-8?B?Q3ZXV3kxSzJsR05VZ1lYMnZpR3YzbFZOUWp6M0VNV3lQd3FEa0xtVDJaM2Nx?=
 =?utf-8?B?bmMzaUJzSmQxU3VDMTdXakNPUTJqY1FxVDQxbGtUUjUyT0lWUG5mVkEwUWtO?=
 =?utf-8?B?OEQ4ZWxrZ214Z3V2MmxRNm9IaXcrd2tEV1BySy8xdi9ObWI1bnJvZmRXNFdo?=
 =?utf-8?B?OG9nTkZ1ZnQ3dE5jelR4aTROVHRuYjl1MEJhSGFHMmhpWUlReGloNCtXdFAw?=
 =?utf-8?B?TEJNWS9KOEJDNnA2bTQxMEVrQWhJOC9HOTZYb3hucWV4U00xOG90dTBDUUJj?=
 =?utf-8?B?ZFJndU9HVUQwckJ0RklOT2hoeGZuUHU2Y1ZmZlFaYzVWc3F0RjVESnlxVjJv?=
 =?utf-8?B?aDRWbjFSQU4vRUswZk5CNG9vTERvUDZ6SjV3V2JvcDRIakllSG13UmszZXZT?=
 =?utf-8?B?d3poNTlKc0pkZXRBM1haQVVUd0EvQU9vaDFQMURrcGtBNjVRMHRrcTVpamE4?=
 =?utf-8?B?UTgyYlBCUlRWa2UyeThDYmJEbEk1UndkQVpZTDdkS0g4WGtUVjNVTnJXVFQ5?=
 =?utf-8?B?MEpyY0FHT0xwdHNCd2l5YVpmZ016WkZrZ2RDL0w5OC9qa3N0cE56NlFMdURO?=
 =?utf-8?B?MFRNTHNGcmt4MzlSVGJiK2ExOVdmdFVsOHBZSnZFd3VPdkhYdjNqN1VSVE1o?=
 =?utf-8?B?OEZuZzZmTHE0MDhwQXFVSVJoZjRrSXBmWUUwaXNxNmNycWlTeUdMQUFzOUtG?=
 =?utf-8?Q?jwR/AMxaGoBoKmYko4X/L7uwk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa51fa24-4028-47cc-e8cc-08dd70b43447
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:29:03.2106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk2T053+QHh0nAInCeusZRNmg35FY3sdJVN150ny8g6QGuHU2d0vpKAGueei3E41sCRPL5VyUx/5wT4gflppNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396
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



On 3/31/25 12:53, Xaver Hugl wrote:
>> Cursor plane has no color pipeline and thus it has no colorop either. It
>> inherits color processing from its parent plane.
> 
> Just to be sure: That means amdgpu will reject atomic commits that try
> to set a color pipeline on the primary plane while showing the cursor
> plane on top of it? Just like with scaling?


In theory that should be the case, and I will investigate and confirm 
it. Is this a beavhiour expected by a compositor?
