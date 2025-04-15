Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E2DA8A2AB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 17:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A638F10E7D8;
	Tue, 15 Apr 2025 15:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b/8o5bAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E810E12F;
 Tue, 15 Apr 2025 15:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyUQwdzVxBjydn5QUH2MxCCLGuyAUPQopGZDzanrfVMx9lvaTTicPmW86foamK2cMwUbAhKqAxdNhejHAhAo2mvLIRa7muAjPz6Riv8aAelYXLNuXK47zE7r6N0FQj+XH/EMAUbjqbI6q0FewaUN670/FphH9vptXaGsEBYDoz8DYJR3p52ncdjsjFxiNGmvjCGYrO4kSYOKkyBcRjFaP+wW01nx7MrwGaLnaSuCGgzrJST+micmAYv6f5qmAM1qtNDMWADRgJSpzjWZFyM8BIF+/3yqoDU6MMw23YgpeKxdU/QhD4KUGPJY7q5LU1ZXNnJpRc8wgyhTyFTwqN3p4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScndWZf/f1/UfriXH8CI0IwlKf2O7ZyQbxyAKR+Le1I=;
 b=JNzx6U2B3kUvwHW1NLgZIQWiTokJL1SU3neGWEDZvQWVgezEBYrjCsEKFDP4XIvIHXOvZXNeC+LfAS7RAHe/aED0gW6AZw08dTEKvLcNtH7Uqz60HlwBeCcEj/ORCtatuDdQ8k9JVauyRQp/sPYbZDhQRySUNISTXlKDsnQh5lON8BegpbYaRliP9CpnYLvVxHvKrMSI52HKt8Tf/NtSwg/lBnpLA9Gqh9nleB1ecHYYr5zlZ0TvziTT4R5yqSnlp3t2TyxLs2mfnYs7rVk1mnlVqHdc0OEVaGnp0hrDB57BADkSvjBE1GD99MIj7aZm3QgLTYwXnpI1ymrvcsRauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScndWZf/f1/UfriXH8CI0IwlKf2O7ZyQbxyAKR+Le1I=;
 b=b/8o5bAUtvBa0rT4ShyBW2tJRf7OuqMGt9+J6J+M/+KuA1jFdNKo49WRPa/0sViRl9o1X/RSF8niOryShElXnlSDOE+IHR2KGDTL3h2Ra4q/LXLgK6ltHgmqtSLgcIC2fRqwuyZsmyQNU7p+5XbnWoCf5+ogOFak0dA+c/2oNAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 15:29:17 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%3]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 15:29:17 +0000
Message-ID: <a557d929-7bf9-4a52-96fb-ed7a696744c2@amd.com>
Date: Tue, 15 Apr 2025 11:29:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Pipeline vs. no pipeline (Re: [PATCH V8 06/43] drm/colorop: Add
 1D Curve subtype)
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
 <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
 <20250410105343.606bb75c@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250410105343.606bb75c@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0476.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::16) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e43cb3-4bf7-49e9-8572-08dd7c32491b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGpHOGVLaVA4eUw1VnZTZkhZSkkyVjYyRnpKSDRVNWtEM3BFOW5CWUhsMy9h?=
 =?utf-8?B?c0ZBMHRPZEZ0TFpsbHV6d2FyWjVBU1doNHF1RVlOdmZONkkyT0dQMEFrWVUz?=
 =?utf-8?B?aGpqN1RLN3NvY0hlVDIyQ1NiaHZJcUp1RzVYeTQ2eEQ0QzY0cUpmNVhjODJM?=
 =?utf-8?B?cDF2aU80eGFqbHFubStnTTBJNTZtblhidW5sV1FnTTFzMDdmYThhMmlaNWM3?=
 =?utf-8?B?RVhvWllUR1dwSnFQYmtwTjh6d3FjUXpRRndmR3lGaWlKN3VReE5pOTRzRXk3?=
 =?utf-8?B?NE1yVUtVbCt6S1NvcjY5MGhZbklJNzdEZVNudUwyZWN2dWVJZ2pLVUsrNEhH?=
 =?utf-8?B?WUVoYzB4MUlRUi9mQ08vajh6b3FhTXowbFp0Z1g4OE1xL1hOQ0R1ZkRrMExI?=
 =?utf-8?B?ZmFHSEhWaFVjMWdTaHhNK281WHlEOE4ycUtndWJFc3ZKcTJOQml2a3JRelp1?=
 =?utf-8?B?M21sZnJiSG10SzI5UmNBWXplRFdON2VBY2VhMXNGYkJOTUV1ZkhldUp3NVlM?=
 =?utf-8?B?LzZEcVhIQjlMbjNjNDN1MlhVWmFDbUJzRG51QkpMKzVsc3o0a2h4N1FleCtI?=
 =?utf-8?B?MnpiU1dzUEVpMzJZS0JZZnRlWi9WcWZLRkNxdmVxemUzbitqRnYwdnpiNmh6?=
 =?utf-8?B?STVvQkJUL01PM3piMG50ZS9yODNrZG1veE51bmxIK3lGc3V4c1ZRcVdCSDRl?=
 =?utf-8?B?MlVOeHZ5YjMxOUd4REFxbVBYengrWDY1bFZoeTFaOUFtYldKUll0ZElHY3lr?=
 =?utf-8?B?eDVLdUZWMzQwU0hOdWhVVmt6WVhGRVBDYk9iQllxNjFWUmNKd2wwR0hrUVky?=
 =?utf-8?B?RVJJRjN3clIyY3dhbWZORE5DczR0MFVESVFqUkJXSjJVZWZMSVV0RWQ2L01m?=
 =?utf-8?B?RGNQSGw2RU5PSjN1QlJiRUd3R3Z6dGJIOGxRQTJkN0d1aW0yaUpDZlpyNnhB?=
 =?utf-8?B?S2ZPY043TE9YQnZoZnAyRzZJaktzYzlxdGUxRjVPR3RWRzdyZndsRWhNVFdr?=
 =?utf-8?B?QTZ4dGN4cjBGQXNaakNQbUNTUHBnWTR4T29Tbk1hUVh4clg1V081a2NQZ29D?=
 =?utf-8?B?bmNQVTdVV2l0MXFRM2l3YWZjRElEK2o5akhmVml5SVAreVlBSmxhWVlrWDZl?=
 =?utf-8?B?dE4yalJmemk4ZnEwM1hOelVPdndLUm41eHpCWVJYV3ljNmMrZzA5eXJwQ2RM?=
 =?utf-8?B?cjg3T2M0NE02bHp3cFJEcU9qcXVUZUEreWZoSUZGV0Jtem1jTTc5c2lSYjJY?=
 =?utf-8?B?dldHd01RZlRQWFNWc1NsVWhxNTJmVXBUQ3h6bE1sV2pvam1Xd0ZNRHI4bm5z?=
 =?utf-8?B?UGdubW1XdUtpRlBhMXo0OVZGMHBLQi80cjJ4Z3ZuV3laNHl0K0xQSThKbTZ0?=
 =?utf-8?B?NStKQzg5ejlkV3VxeVg0QTRWSFB5SmxzSGZwUDJSV2ZCQ2czSjBJZFBRd2Fp?=
 =?utf-8?B?YVJWaTBvK0VFVXErWGVTT2NhZGhRcnc5cUtxZVorM3NmdWloZmpQQzl6U1N0?=
 =?utf-8?B?aTI4NjNaSzdsSmxmdFFaSnFZVU5QSm16MXo2bElid0ZZVS9Md2tRK3RQTVhU?=
 =?utf-8?B?ZXdnYkNOb2FDdkk1ZjkyWENYdTdlMHhFK0JQSC9pM3daMmRoSS94Z0ZvWHNo?=
 =?utf-8?B?Ty84aW1pTmt0cG5PMjRuRnp1UU5kVUozTExuMHBxR0tKVHdmR2NzL1hyN1BU?=
 =?utf-8?B?RllBRXZ1bGoxcG85Nk5JZEM0eFlyajJPMWpKQ0o4RE9CYUM4dGgvRW8vMzZy?=
 =?utf-8?B?YmJNa1cyN2h4OHJkOExrOEdoVXdLb3NVVS82R3NOeVE0MGxOVk5EVEZqS3ZP?=
 =?utf-8?B?MzRQWUhvWm5mcGduMUdjcngrVnNOT2twamd0d1lWVlFhV2JVd1R0amdRS3o0?=
 =?utf-8?B?ZEpSUDBTNEY5TTJ5OXpQdFMvZWtWWWVEaG9XYjJRRG8zQnNyY2V0RjZ4eitk?=
 =?utf-8?Q?q3riRPyi97k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWM3V2lKOFJlNm1RVTVsUWFkbjBuMzRkNi9QNXVzeHRaVFpFeDNoOVM0V3NV?=
 =?utf-8?B?NXJOdmpWSzZ0SlFSR1FOQldySUZmRmZ0WXNpK2hZWlRPdVlhYzByTG5xMWM4?=
 =?utf-8?B?UThzOTZqS1FjUDV3ZzlRc0EvMmh0Nis2TnM0Ly9xTEFoVUg1KzJYV2pIb2h2?=
 =?utf-8?B?eVJma1BOS1o1RmhSTjlvbjhhbE5BL3ZRaVgyM0NjWUNEVm9FTHhkdUJqT2VK?=
 =?utf-8?B?aHc5VHVCRWhjOVlkMkpaU05ROWlpRC9CbE0wY1lpeHM0VG9WOU9zQWN1RC9B?=
 =?utf-8?B?S3I4UDJzcWVGTS9FQWR6L1BVVzA5aW5OOWEwSUoydm56c1NrdUVZSjVRNVo4?=
 =?utf-8?B?b0JEZlZiZkd3dzRDeVlUcFZ3WnVwRWw1L0lxOU5td2ZXWFFNckhiR28ySHFS?=
 =?utf-8?B?bGsxb2c3WEhkT1NqQVpGdFdFYUNENFpYK1A5ZjNpdlE4NFZsc1lWVzFORnEy?=
 =?utf-8?B?YUJpOVRsVzNNbi9uV2YyZVdZSXJlMjk4VzFTbE5kWStpaWNpUHprNnQvQnJ6?=
 =?utf-8?B?ajZSUTMrbjFxUkdIWlp0RjVPQitkc0c0QXdSclliS1RLSVVIQytaaTRLUXFD?=
 =?utf-8?B?eGdrdXBZbHBxKzFWVnlyMkJqVGdIZ3NQaWxFd1VwMTVnbVVSZStSUjFkWXdW?=
 =?utf-8?B?cVN0ditEVXFESS9manhDQ0RZZnBUcXZPNkVmNCtBWXRTQ2VRbXVITWZMNVky?=
 =?utf-8?B?YUJ5T090cElheitlYVBqR0NwUzBEYk16bVpVTE1uUHpqcGpjWjRXUW1PMnkw?=
 =?utf-8?B?UDBackltMEZnNHRLS0RoZEZmQjY3eDJ4RU11Yy9TbEJtSTgra2Y0cDJKdjVr?=
 =?utf-8?B?cUtzN1N0Qy9tN3JBaUVBemlsSDRzaWFIVDA5ekpicTQ5akl3RmVvTU9CamV3?=
 =?utf-8?B?MDdUTlpzRFc1VVN5WUlDWldPS2doaE84dWg2dWJZTHB3R0gxd2VUQzZ3Z1Ey?=
 =?utf-8?B?OEJlNGMrOGs4TzJYU1B2NC9kNm4xdmxVc3ZFa2xwV29zVTBKZk5DcjBqbmhj?=
 =?utf-8?B?MEI4KzJzTDdGdUh2eFd1VVpTNy9EWFZUQTRtUk5qaEMyc3ErbjQxb0V0N3Na?=
 =?utf-8?B?ZUFRZ09kYjRMSFdEMnRzYUxiVEhleUFZdEtxRWd0NnQ1ZlppSmxHeHZETnZT?=
 =?utf-8?B?eGlUUnkzNGhPbjFpZFVEOTJHUDZLeVRZMzAyRWVzSmwzKzR4MHB2OFZUKytn?=
 =?utf-8?B?c1dJOTVwem1VYUtmMk9TUWpqdGJSZk5UK0JaVy83eVFaeDJpQU5Gb0NUSnZV?=
 =?utf-8?B?K1JOLzlFWVorZzRJbldIdHExcm9XRTRlT09nbmRKWWtqRXM4TlJsZXpWbHUx?=
 =?utf-8?B?THlNR0dvMmM5L2YvTVFWSGlTYmdlV2Ixcytid0NUN2FYMjJrWTN3eXRmQjd5?=
 =?utf-8?B?QTE5S1NLcDdOcit6WHBzc0w1dXJKM21LVWw5L1crWHJoSDZPZk8vQTh0cno2?=
 =?utf-8?B?ZkFJQm0vbUx4ejZkYlZhekxIT0RVdEV0MUhodVh3ckc2V2Z6Ym9TTzNZRzdu?=
 =?utf-8?B?Y0dRYVBMQ2l6OElQN2YzM0h5ZHRIK2pxV2RXUUk3dEt4ZTVVamhjQjloaWJZ?=
 =?utf-8?B?eUpZSWc3SWpFUHVuOTJhRkI0ZXQzd3ZxN0h2OExLU3RTbnJxVUp2M0FiRDFD?=
 =?utf-8?B?TElNdnltS1crUzIrSDBENnFzNnVWc2wySFVCOWJoTXVEd215WWQ4U293bVVL?=
 =?utf-8?B?bVNYRC85NXYyMUlVT0RZVmZHa3VRMHZPNDQ1SzZ3UkMvS3pIcExPV1hMNzJL?=
 =?utf-8?B?YUZpZy9sWEdVcEFFWnpWM0VVVXpkZUx5N2QvK2trTjAvU2dtcWN5S2txNzVC?=
 =?utf-8?B?VFVVbEZCc2NiVjhoNC9uQmw3RW5hVHhENVFrVXh3QWw3clp6NFprUTF1RmZZ?=
 =?utf-8?B?MmkwV2Y2U2t3c3AwSCtHc05HbzYvd3MvSmhIVll0cFhJMTJkWExKZk9pWHhn?=
 =?utf-8?B?dXN0T0VZRFllaWYvZjhxRjB4SDE5MTYrQkU0QzVPMWlvOEVhMm50TWdFblhO?=
 =?utf-8?B?alVxL1YvN3ZUNEJCdjJlRkVrZUdTbnFqNXNocmd3MW5pRzVwNmNDNXltTHRh?=
 =?utf-8?B?VUFJZmptRUx1Z0VYZ0k4TGJRZ3dGUkZyOCtGR1NVM2tzSnpjYjJ0Qkg3ckVo?=
 =?utf-8?Q?cNkHpQ++fkA6Fwyf7PW7/KIuG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e43cb3-4bf7-49e9-8572-08dd7c32491b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:29:17.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agSGsLsNJP7M0ra33owFOPa52QXS78iQ578tMlQIf5ShbaZJ1DieEhZUCpcpscgrJ+JSVoosYFxoY/iMCEcGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
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



On 2025-04-10 03:53, Pekka Paalanen wrote:
> On Tue, 8 Apr 2025 13:30:46 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2025-04-08 12:40, Daniel Stone wrote:
>>> Hi there,
>>>
>>> On Tue, 1 Apr 2025 at 20:53, Simon Ser <contact@emersion.fr> wrote:  
>>>> On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar.org> wrote:  
> 
> ...
> 
>>>>> 1. Is it guaranteed that, if any plane on a device supports the
>>>>> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
>>>>> (Given the amdgpu cursor-plane discussion, it looks like no, which is
>>>>> unfortunate but oh well.)  
>>>>
>>>> I don't think so. (They could all expose a COLOR_PIPELINE with the only
>>>> choice as the zero bypass pipeline, but that sounds silly.)  
>>>
>>> Works for me: so any planes could not have colour pipelines, and the
>>> result would be undefined (well, less defined) colour.  
>>
>> Yes, basically it would be what we have now (without color pipelines).
> 
> Hi,
> 
> I see Alex wrote:
> 
>> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
>> support to the color pipeline. I have sketched these out already but
>> don't have it all hooked up yet. This should not hinder adoption of this
>> API for gaming use-cases.
> 
> Was it considered to be able to lift the full-range RGB restriction
> from the color pipelines, eventually leading to the possibility of
> scanning out limited-range YCbCr bit-identical, giving userspace access
> to the sub-black and super-white ranges for e.g. BT.814 purposes?
> 

For AMD HW design and validation assumes that the pipeline is
dealing with our internal floating point format and RGB values.
Anything beyond that is somewhat undefined. Things might work
as one expects but the product was definitely not designed and
validated for that usage.

I assume other HW design makes similar assumptions.

> These questions are pointing in the direction of a bypass
> COLOR_PIPELINE being different from no COLOR_PIPELINE. I assume a
> bypass pipeline needs to shovel values through unchanged, while
> "without color pipelines" would need the old COLOR_ENCODING and
> COLOR_RANGE properties.
> 

What I take it to mean is that this iteration of COLOR_PIPELINE
only allows for RGB pipelines as YCbCr ones are underspecified
without COLOR_RANGE and COLOR_ENCODING. For RGB a bypass pipeline
should be the same as no COLOR_PIPELINE.

> That reminds me of yet another question: if the framebuffer is limited
> range, and it's not converted to full-range at the start of a color
> pipeline, how will the sub-black and super-white ranges be represented?
> Will they be negative and greater than 1.0 values, respectively? This
> would be meaningful for the colorops being defined now, as I assume
> people might implicitly limit their thinking to the [0.0, 1.0] range,
> or at least exclude negative values.
> 

Without COLOR_RANGE there is no way to know whether the input is limited
or full.

Is your question about when we have COLOR_RANGE specified? If that is
set to LIMITED then I expect the values to get expanded at the beginning
of the pipeline. In that case it's probably a HW or driver implementation
detail whether the sub-blacks or super-whites will still be represented
(as negative or >1.0 values) or clipped.

> The 3x4 CTM colorop is not yet explicit on whether it clamps its inputs
> or outputs. Should all colorops be explicit about it?
> 

Do we expect all HW/drivers to be able to support the same behavior?
Is this critical to using the colorop?

Harry

> 
> Thanks,
> pq

