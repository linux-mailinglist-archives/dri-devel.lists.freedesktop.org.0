Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB74A8A264
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7B710E7D1;
	Tue, 15 Apr 2025 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lyPhSpwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8535C10E7CF;
 Tue, 15 Apr 2025 15:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMtgO3BFFI8FhNsXYysYiRu1PD8JTXEvtgGwGZIF0/xwtkG2WuGQ451JKg4wcxqu6rFusnU5W1TCuM7Cnt0zutTiJsgvSZAl7qtjgM0+7tsfn1Ialz/bk39fHlYsnMljsDa51E+pSfX5VW12nj2snagVynkpsdbIHECXigfd3TRoLT0g2PGD3Luaa0iiWQ4BAz/O+iLclitmnIAD5s6i4HCaMBMVwwvmG0H5HMFSfRHAWhr7UVp/PjyYTtYuj36ynP9CoHcYxnuuFyMwxjM0bECSR9K/O1b6DqAUjqR/kWTd5pIcr2A2DpcuQutnwj8X8//KZcmClruJ3xH9AwJA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v9UPeI4rKsczjav9qLDo6ODWiqF0Y8pFBiCw8eMK80=;
 b=juR30mlfKpVcLgliIpJV7apNH+f4juBJyL0GCq5wJ43DJGtYG06emiqzIoKcEF6ysPSc/vbuL+k/sfMImQJQ1AdJNUPg06p/Y5B+vBSoP20mYKmJlrBR0fiaMhZIZogez02Wkzm2cndsWYHyHAd9vFdbn2wI9mEHAzqQcUakYhzFPMe5q9Gvw4fXP3i1nBKzQMxmWamz8tBTCt2KJw8m8FxZzcSLDhng/gGAQVJdDKoo6XP82+c6Qo4qihNUNmbV+MDdnWbkX6tI3xMIV49jRWAcdN/DGRsYDfggMb98sEB502hIguN2eCjoudfiNuZs6E9UUtQLmcuKgwnwTQAjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v9UPeI4rKsczjav9qLDo6ODWiqF0Y8pFBiCw8eMK80=;
 b=lyPhSpwei5Qo6tPwNbsSaGaEHxIztshbvgYp8rbx80XJMkVZ2qeahl2/4QkLkN9pwLfoxWKSp9pwUss0XPSaEzUz+aidg0zbfsI/mVmxsj+U+rpsON82elr2fK1ShG2mvUzvuqlPC2k/XCRj9NBV6cRUlPqHMUmTcT6UjdFMYyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 15:05:43 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%3]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 15:05:43 +0000
Message-ID: <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
Date: Tue, 15 Apr 2025 11:05:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
To: "Shankar, Uma" <uma.shankar@intel.com>, Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
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
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0063.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::28) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: cd48c26f-b77d-4237-b338-08dd7c2efe23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3F3UW50Znp2bnJTM2hwN2tzZEZ0RHlzRURZTHpud0tOYzhuSGg1ckJ0Tmxx?=
 =?utf-8?B?RTJzQjEzMlVSSTA5TWpXSHVCR1RKZW9lRU9SSjdlZGFJQXFrZWppdEVORTNh?=
 =?utf-8?B?QkVuNmhNVmptYzgrampuZ0pVODJseC9mOU4zN0c5T0MyVW5PczFNWDkveCt1?=
 =?utf-8?B?cUc3S3BVOFdvaXVmRG81UXN0N3NzRWNIMjU4Q09abHVjWDVsd0Z6cnFCWGxU?=
 =?utf-8?B?b2ZYWWhIazN3T1JMbGZaNzdYVDh2WjJndG9qM3NDdFBQR09iVGx4M3lhbGQv?=
 =?utf-8?B?QlpqWC9mQUxEZmNnZUZhaTM3S08zamd2clFPbHBjTzhJR1pITmJIdXU0RlZT?=
 =?utf-8?B?OXNNTkpJRWhIUVlCWEpZVERiVXhUL1ArV3dXcGM1Zi92dVB5WXNXZ2NTa1dR?=
 =?utf-8?B?SVp0dGk5WWxwYXl5OWxNa3ZJR0VxRXBTbUR4SVlmYW1Ec2g5Nk9MQ2JkT2dS?=
 =?utf-8?B?Y3VYVHc3YUpocmhORzRIeEpqYVNQUVRpNzh1R3o4YVZaNk1EVHhVaHBFVzhx?=
 =?utf-8?B?NU44b0tVY2E4c2VSSmdOWXZScmRPQzdxTUdmb1VRV1llVFNvUkhPOUFNYzdS?=
 =?utf-8?B?NllzenZQWmk2aW1PRkpoeTFzUDgwQ2w1U2RaV3dDUEJnK1NYWUxXbTN2UjNQ?=
 =?utf-8?B?OHg2REZNaUhzQmIxQ1I2Y2EyZDdaOWwydzFHamNEK1QwaHkra3d3aExOc2Zo?=
 =?utf-8?B?Q3hNZzdUOGttTzlYWjM5TWhlU1AyRDk5c1NEYXlzd1ptaFlrVFlNNWRlakZy?=
 =?utf-8?B?cGpURVowK2ZYa1d3dVBNUnpJVkFUb3U2SXdTNnNNSE4xZjN3S0I2Ym1Nd0RS?=
 =?utf-8?B?QW9xK1N3Nlg5RTY4ckJxYlFaNjR0NmxxYkE5bk1kVEZwT2ZjM3dQeUNER0Fw?=
 =?utf-8?B?blZRMkExK3VESEFOZWxKaGRrVmdFUnRYR2V1VVBUMFVFWVFnZnBlaEsrSHNy?=
 =?utf-8?B?OWJsSGdJZ204Q3p3UEFVUTI0RWdGbnFQWXU3MUdmWVJiU0IrNkhzRGtnaTFq?=
 =?utf-8?B?Vi9GSWVWcUxUREpOYTBtVVdtU0ZvelMvSDJyaEFMWHo5d1lUQXJZTlVEZmNq?=
 =?utf-8?B?cUFBRCtlU1d3QzlZWFQrZ3U3eUo0Tnoxd1d1UlE2VlJDYkNEZWNVRThxTGcw?=
 =?utf-8?B?S1ZmVHJXOU1EYnp6eTFoUUM1L3JVUm82MU9pTFNyL2MyZEQwd24zMVpSZmx3?=
 =?utf-8?B?bzJkYXRhV3lyeXFzUU5EVXpxaDBZdHNFcXFQbDkvaXEvOU1ERzNDREVUMlV5?=
 =?utf-8?B?MWZkU3hRU0dyZkJiaTJtZnhObG5ySVBGcnFjckI1REZHT3FZZjAwdk5Od0R2?=
 =?utf-8?B?Z2VGU252UTZBeEVuajl5M2NlYytQdUl0L0lWYlQvV1h1eDc2UldnNzlMSG94?=
 =?utf-8?B?cm15ZXpkSlJtc3lrUUo1bmtWS2wxQXpaSHpIaysyODVsOHh0d08vNjMwcUE0?=
 =?utf-8?B?YUJ1VEcxQXZ3NUh4d3A4MDh5SUt2RE5rWk93UXA0R0xTK0lyMkw3TE43dHEw?=
 =?utf-8?B?QmxRUXFta3pWOWtxbk5JL0tpTEtaNExBWG5uODBPanFNY2cwSHQ3NEszTnlo?=
 =?utf-8?B?anhBU2kzWm1MSTF1ZjdYSkI0Q1NGOXpwOEhGRjFQeiszN28ydHkwd1lXTWZV?=
 =?utf-8?B?SXJYd1A4dVdJQXliLzc2UjRRNzB2bkZ0VWpxU2ZhQTFaQW52WWl4UUU4aUhJ?=
 =?utf-8?B?ZUc3b3BGblkwYSthK1lEQkVpNURPOVFubmJJazNrM1VZVGpSL3QvZ1A5Y050?=
 =?utf-8?B?K1hXak1lRDU4UHkrQ0wzSzlySlVtZDhyVDE4c3Y2ODd3S25GTlhZcDlPaGtR?=
 =?utf-8?Q?dqnNdEm+XLJGqFwSlmt7hFTbQKl/y2m1+QUAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEt0K21hUWM3OVFPbGgya0FxZENxWU1WdXhqbUhJblVGNXRmTGloZTBIaCta?=
 =?utf-8?B?QnA3MFF4NnpvUHVWeTZOVkUrOHlmYWRZVXNCR3gzcS90c3JlaURDWVJ6T3c5?=
 =?utf-8?B?M096alEzdEJHekVHZHdJaEdLOUFVc3FMS1BuaklqYVl3VFpBcWU2UFVPeWha?=
 =?utf-8?B?UUZWVlUyOFRaRCtkd0hhY1lVVnZ0VmtyaDlTSCtIejFFb1NvQzhJMHhrNy9q?=
 =?utf-8?B?UXNYdk9wUW5GWkRXak1zNHlOWThFS2FXTDMzcW9lOHR1VHBzUVhtYkxieko5?=
 =?utf-8?B?QzEwYkRpY29YOVg5SFk0dDNZZExqQ3RlV2lMYVUydGhlbmVySFIyQ3lRSC9u?=
 =?utf-8?B?YU1PVmU5SVora1FFU1R3Vjc1TFN4WGZxUWtlRUEvcTZ5V0t1MUg1NFljMXNp?=
 =?utf-8?B?a3NmVjVIOWNYZDIyU2p2Q2YrZlQ3RXNnVVo1eXF4N1Q3MXRmYXNSMXZ3Wmhx?=
 =?utf-8?B?ZDRacnhXd2NIYVYwRUNWZW9uRmloSkxuamZnNU9hUFVsd1ROT2xtTnI1SS8x?=
 =?utf-8?B?SkRwc1FHZXdlYkhZU3hlYUMzemxXNzZCN2tXWVl6Mm9QSWdzWUE4WjNITFNk?=
 =?utf-8?B?M1k5eEV3Y2k5anc3T0EyQVAxTkk5dlVVVU5GMzViVjhQYVIrZEM0MGs3bUNx?=
 =?utf-8?B?cUlPMCtaNUxDUDhJR0d6TmhtdWxaZ2d3QW9TSllpcnBxSEpQL0RzRmw3S1Aw?=
 =?utf-8?B?RFVTNVJyOWV0Q0VOZ21US0hFWjl3WHNxb1V1NU9ONjB6UHo3UzF2QUU4RCtF?=
 =?utf-8?B?U3JqMUdTbDNzL1I0Wjl6NVZxRUJad1pzYU5YTlNUVVdaNnZHTWF5ZUtjbWxu?=
 =?utf-8?B?RFhJUUpYSEFlejhBcmovR3R4cUtkbE1pOVBOQjBJUHNNT3JpdWpTdGNRNkMw?=
 =?utf-8?B?RDFibnRsK002NkFDTW5CUmlNbFdQdGtETWlwQmdlaFMxWVRhRUZpOW9jcmVi?=
 =?utf-8?B?T2JKMElDN1E3blZMSVd2R2ZIaTZFYVAzVWRDY01PQncwbWQxVVNGeGtjNFc0?=
 =?utf-8?B?emc0Y2R2eWdOUFJqVzJ3bHViZHdaQXJrNlZCU3pCRTE4RnQ5SUdPNlNRZzdv?=
 =?utf-8?B?cTFOMTNXRVVSVWM2WkxnMDhuaWJJMjQ1YVVDTGxFZ3VxTFpJbTVYaG94OHNH?=
 =?utf-8?B?cHdqbWZ5N2JMRVExZ3dUYTVPSFQ5ZGtxd091YXhBMHVBVTdLYlAxeEkvWHBO?=
 =?utf-8?B?V2R6bjVaUmZGbEhuOXFCVzVUSTl5V1J0d2pRaUhoLzVKSzhpdGpJWFJHRzly?=
 =?utf-8?B?NTZCbkFBUXM4VHhVL215M2JoQU1HOVZwbVdna0dGWW8vNVkxRWVqZk9TRmVS?=
 =?utf-8?B?Yk53R0Vtc002bzJZV1RtaVR5SVhjcTltZHBnTUNBSEdCZVMwWis0eVVIbjg0?=
 =?utf-8?B?RXN6alg3Z3RYaHBDSXNucjlUclYyWjZmY0l0N21KbzQzNThQWEZraHZVZkl1?=
 =?utf-8?B?R1d5SU1DVHRSbnU4dTgyRnYxNDY0V1FJYlMzb3JScjNaWlpLQmZmU3FXcEFU?=
 =?utf-8?B?WGFaSHhPZHR6cjdFWEhpc0t6d0JpQmZuM3pKOHJLWisyOEVZYnVJMnlRV1Jr?=
 =?utf-8?B?TS9CbnVBRmVKWGlUcVlHY2pDL3VSVEVrakYzZVYrdXRqRExTcU56RDZINFBE?=
 =?utf-8?B?VmtxakMxd21GZ3dRRUE1SjB4SFY5UTV5Qit1RGR6Z0QxZndJNGRnbDU0dDRX?=
 =?utf-8?B?RE53aDhzajFNR2hxY1lGM3VKcjI1SmdBbkdZcThTSGFlb2lCdWhmT2RUUDFE?=
 =?utf-8?B?YXF0Tm5iRFJPdzZzdmlUN1RESzYxS09DbEVBNmZLekRNYWdwVy9vZU5iM0ll?=
 =?utf-8?B?S2kzQTdER09sTmtOVCs4OEo0VGhWN3hIMUxIT1ZoRHp1d3o3YkJnckxmVjc4?=
 =?utf-8?B?Ui9GWnBQS1FHK3F2bnB2VnN4UXlzalpTUFd4M1VJdUFCdGZnWnZ2cW5uaHY5?=
 =?utf-8?B?ODU5dU9qSTBPRU1wUVJtMGdueVN2WitaMUZwUGhGTjF5WTRHQzhrRVltV0ky?=
 =?utf-8?B?L3ZMVGROMGdibnVTTlhnWGpPei9KUGFyUzhVTFVlR0wxWUM0L2lTUWRwMEhq?=
 =?utf-8?B?NHF4Q0wydlI3dFNLYVgwWWlhck5XMnMweTR6eGFlaU5yTTZJVGRuSGVMNUN0?=
 =?utf-8?Q?R+1YvfbXMTOU00vuF1PnUlsf5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd48c26f-b77d-4237-b338-08dd7c2efe23
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:05:43.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkyGbWsfI9SxANSgAiXFkNGBecEKX6c2DRrYlXpkR7wlUSDHAh3C8ownNRCqvpMN24GZm0K0Vl+o/dy7izmKAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526
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



On 2025-04-15 02:40, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Simon Ser <contact@emersion.fr>
>> Sent: Tuesday, April 15, 2025 11:47 AM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: Alex Hung <alex.hung@amd.com>; dri-devel@lists.freedesktop.org; amd-
>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; wayland-
>> devel@lists.freedesktop.org; harry.wentland@amd.com; leo.liu@amd.com;
>> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
>> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
>> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
>> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
>> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
>> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
>> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
>> Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
>>
>> On Tuesday, April 15th, 2025 at 08:09, Shankar, Uma <uma.shankar@intel.com>
>> wrote:
>>
>>> We want to have just one change in the way we expose the hardware
>>> capabilities else all looks good in general.
>>
>> I would really recommend leaving this as a follow-up extension. It's a complicated
>> addition that requires more discussion.
> 
> Hi Simon,
> We have tried to solve the complex part and made it simple to understand and implement
> along with a reference implementation [1] (can also help add the same for AMD case as well).
> Without this we will end up with up 2 interfaces for 1dL Lut which is not nice where the one above
> will be able to cover the current one. Let us know the problems with the proposed interface and we can
> work to fix the same. But having a common and single interface is good and the current one will not fit
> Intel's color pipeline distribution so the generic one anyways will be needed, and it will benefit userspace
> to know the underlying LUT distribution to compute the LUT samples.
> 
> [1] https://patchwork.freedesktop.org/series/129812/
> 

I think there is a lot of value in giving userspace a simple LUT
to work with. There are many compositors and many compositor
maintainers. When someone new jumps into color management usually
same thing happens. It starts with "it's not too complicated",
and then over a period of time progresses to "this is very much
non-trivial" as understanding one bit usually opens ten more
questions.

Forcing people to deal with another level of complexity will
discourage implementations and be counterproductive to furthering
adoption of color operations for HW acceleration, IMO.

I'm am not opposed to a complex LUT definition but I don't think
it should replace a simple and well-understood definition.

Harry

> Regards,
> Uma Shankar
> 

