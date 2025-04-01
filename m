Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC8A782E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928E10E66B;
	Tue,  1 Apr 2025 19:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1qkUKZJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498910E665;
 Tue,  1 Apr 2025 19:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knSWKCFByb1InJyL8TFIbNfvjoFG1r/NPU8GPMLg8wrkcXrXVGYRztnfKZypzVcyiOsjvI4rSEeF6TQvBYtU61ifUn36jnH3NRsZqwTyaI6vBEXzCZL3XZTUQqhNqC8VteFH+jEs1yXG51mYfoGxIyy9bS/dLCJpc7tltuVGpTasTHm5LKOx9ufgqkpMF+YJBayhOslXuya2m6ZJUmgdFf+M4iKiKzDluLUAQqAoUCj/sMbAuawIFXMgXkG1d0rxVYtkEqzq9k1Ld5fr4JvH2s2oT2Cp7WrkjWCZ+lnqCGQ+jIfqkDkLzlShPh5RrArkWcagkpkedD5uwhNw1vrLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffyLXgPuJvSARSrjPBDM6Llos4nxEqGiPZdR7GZtZmY=;
 b=G/bK7oSE+rRUVRuMRG3VSTr7npimytzCrKVutPQ0QOYv5rxOZU5Q7kAuRBw1rOtMR66GschI1KV7ZHMgn1vfYmZDi3fcRfZMqkq2YLtBIQIdS4hN6bWT8tN86cUqNAl7SzdkrkKPkLYEWe/vUVlxnJONULdVSYWibDMwpE4nMR0eDXBtRi16m1Dd+PpGqEgR4vDtfs5+SvNfjnTMCDSV40nu0TOvTMA4C4h+sUxpoh8mqWJxdnph6ORrHDhbyP4uUZVk73SVGmXSPTVpvQAnCg8ce9DK0sjpvzAhhjXoMsybPLybNv0dLkJrSFufsMmBqwQ1BS/IiK08UQNoiBh8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffyLXgPuJvSARSrjPBDM6Llos4nxEqGiPZdR7GZtZmY=;
 b=1qkUKZJaGxY07Mmn13p+xY6GnluAsmyVKO7wlXX9+9zgTaJdoiRa8MIyEzoVr7MZLqpmTvb+WPW9/MN2xRV03Hh7boE0hHNqj/12pK/0xnRJYpWlKKU6ppYyvSuBeIUn7Z3vWCsXx4VX5jhv26Jt4U9rD+cjrtfzxva/mb9qJ/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 19:45:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 19:45:14 +0000
Message-ID: <202160dc-4b1b-4a3e-8cbe-3b0406fa38df@amd.com>
Date: Tue, 1 Apr 2025 15:45:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
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
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
 <TYCPR01MB84373F182FECD129EEB3FF3898AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <TYCPR01MB84373F182FECD129EEB3FF3898AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0190.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e355bd5-a78a-43a2-edc1-08dd7155b8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkorQ1JmaUw5b0FFTEVQZHJOZEFEME5wK09SV0pnWFdRV2VjcXZmSzh3bi9Q?=
 =?utf-8?B?dGQvTjRGWHNYMWpIT1d4c1Z3OHRMK2hNNmg0SUxTK0RqQnoycUFyV01WUm5G?=
 =?utf-8?B?eVdjQytYWU5reUhDRG5aUU9rOStPbVdwWE1MM2FwSHBKbFB5VW5hMkJPVUhy?=
 =?utf-8?B?UW5pU0xhTis5RFc4MWQxYmdjUWphN2lScFdTbjk4S2lXUld6QVRQN3phamNt?=
 =?utf-8?B?ci9xWTFLUk14MTcyYU43RFRRVEhRcXdxZFNiS3dTb2FXR2IweWpKaGUyR2E1?=
 =?utf-8?B?dmtoWHBGNW85R2x6cnN1bGZhci9JTkhPcUtMWlJRQk0yYTBmRlFzMEZWVy8v?=
 =?utf-8?B?V1Z4SVVkNC9xUTgyMFlIYkQ5dndpNjQxbTVvaUcydXMrVmhMem5yYktydnd1?=
 =?utf-8?B?NTdMeTN5SDNzN0JESjZ4cEhETytad1FDRDZzZ21IZ0I1ZFlvbkRiejlaRDJU?=
 =?utf-8?B?WFppQmRBekxCMmVCUEFQaldOOUFRN1daSHd3WWtGTURBazd4K2ozWklHbHhE?=
 =?utf-8?B?VS9oWEJWeHh5VVhtUHFndnoxY2VEdFRBSnJMWHdZVmFnbjFFQ0VTRmVEUmdm?=
 =?utf-8?B?ODZPUlFiNWpSQzJDZ3VUcmwrU0NYSXVra1M0SUN6T2U3eXozcVZIQVl6R1hI?=
 =?utf-8?B?ZVAySk5vbkExRWRnOVh6UkdrQk9UVlgxNjlzYjZ6SHpuMlNUb2cwWjN6RjlN?=
 =?utf-8?B?VDhndXZFU0xLQkF4MENYQzNWSS93OXp1T245RHByZVAweVJGNW5ablVDVWdN?=
 =?utf-8?B?WUZvWnZsSnRQcWtJS3VGRVpaSGZxc0g5eW42MVhTWGhqd0dnRkZVRVArNFYr?=
 =?utf-8?B?c3lFaXpEUjh3R3NCTjhpSCtkWmlMck9mZk8rZFY0MDB4ZUhjNmJ6VWdWbmdn?=
 =?utf-8?B?R0l2SlgybndKVkdBZUw5OFA0WXV6S2JkaXpQNDhRbnRKTzZIdnVrekFlZU1N?=
 =?utf-8?B?L0NlWHdyeXVxWVlYWURCRG9KUlZtVnA1QmFoaDRuS3VzRDl6MHZYZXM5REFP?=
 =?utf-8?B?bjVBMm44UDl6NEpCSmVSVGNQY3RqeEJORXptenFrN01idVNXMlBFaWRENTlV?=
 =?utf-8?B?bkJPUGJnUHl1TFFZWVd0cXQwdTJJUG82b3JScFdxcFVUQkFUeEJXbVJJanIy?=
 =?utf-8?B?VlFFVzVZQ2M5ckpGVm5Tcmd4SEovb3dsN05oZ2YvVk5GYXl1MkpUTU9sM0Rq?=
 =?utf-8?B?amM0M1lQZnJMWDIySW5vT0FPSnQvc25Ic2pxWlhldlVCUEN1NnR1SUtocDVM?=
 =?utf-8?B?b0FMOGorQ21YSSs3eVR0Sm9OWVJVWFU4dkNuRGh2aGgvOWZCUVNuS25INWxV?=
 =?utf-8?B?bFdzSk1seFhVcFhMRis3dzQrZnBTclA1ZFlpSEs5N1F4VStNRzhGVnZEMWZn?=
 =?utf-8?B?TkxDZU9kZGR1VWlobDFYZVZ4NFhHY3NaeVZRKzdVNWgyV3N2VXhxbEFqSFNs?=
 =?utf-8?B?b20yWDJXb0JBeW9SMkxNKzF4TEl6ZEIzT29Rek4wTlpvOEg3M1hWaGEvaU5G?=
 =?utf-8?B?OUFuZmdwaEZXSVpwSFdCTzkzditOcCt4Slc1am9kM2FFeUN5TlFBTDBLQWto?=
 =?utf-8?B?VFoxOGtmVHNlWXVHSVR6S0VmUG5RUWkzajlaNmhwcUdBS1lLa2Y0dFpnUXIz?=
 =?utf-8?B?SkRvaitBR05iQTJocWRxcG1WcE9KMTdDb0lKcGlmaTBSc24zdVFUQk9ZalJC?=
 =?utf-8?B?Yk4rT2FidDZlcGQ4UGFBMnBkSHgvU3pmR2hWQkUraklCdjRPZGdCQ2I3Z3Rr?=
 =?utf-8?B?aFRLUEZoVG5od29YRGhMTlFWZHpuVUdtK1JQbXdGdGpVbTg3WGFhdDNzc3I2?=
 =?utf-8?B?RlJ6a1ZtZWNMOENpQUZrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG9yME5BWEZYWUd5ZkdnOVR6djRVYmg1MWJSemtkbzRseE8vdytDRkcwVFBt?=
 =?utf-8?B?Rm5QSHVRNGFibER5eW1Dd1BjZE9FY3l3MEZ2MTJWODZKK0FldnY1aUJWUC9m?=
 =?utf-8?B?TFlySFRGT2syNng4SzdkWVhEeWRndStUK0o4Tnc3NnFwdkc4ZGVFd09MZjUw?=
 =?utf-8?B?eENCYmFpY09hR2ptaG9kTHpIVzJIaDRwSHFucE5HUWd6VThyWDRScDhLSHJU?=
 =?utf-8?B?S2NBc2F3MlZrTTBMK1JVL0plZ3g2TnRSS0ZlaFBYTUR1WTRLM2RCMGhSMDlV?=
 =?utf-8?B?Nmh1YVZYU2pCUXFTUE5OcmtMM2RuaWJhRGZDU2pUSlFsdEYrazJJUlhTa2x0?=
 =?utf-8?B?MmhERGdkYkhYMFBtdVhNa05kM2RRbW9ad3FOQXlPVktpdXdsVDJFeVJjK1lX?=
 =?utf-8?B?aU4vdERHZmF6aW5zR2V4bzlRemtRUDVBVzVFUmJhbDlYUGJvUkllYkJvYjRR?=
 =?utf-8?B?YXM1Z3g4NzZWcmFXbWpXN0RvVWNwRHZPSXl0RjZYaXdxdjJVMWtsMTZyU3ZP?=
 =?utf-8?B?di8yZkU2U1UweC91c1hLU0tvN1dwR1grbk93elNNN21DQlNlNnJOTEFRdzFX?=
 =?utf-8?B?UGd5N2VlZThOQjZjeEcvL0M0czd2QSttM2t4L0hpb3dHdmptUi9BYWFuRlAx?=
 =?utf-8?B?bGU5YU9HWTNwemFqL0k0NEMyNWVwMk9McDVOQzdGMlk4a1lrSGg4b1hlTzJE?=
 =?utf-8?B?SXJZSTNoVStiemFvREFzWC9JQUZaREYvWXk5Vkg2anRtb09XWlU1b1FWcUtm?=
 =?utf-8?B?MWFaWTlaeWphTVNJRGdlaTYvV045NG1jdTBpaktUTnpDdG5TcG5ZTjNSS0Jj?=
 =?utf-8?B?OWhxVTRoa012YnNyM0U0R2t0ZWZnOVRjNko0K3JQcjdMZUljaGY0Vkx6TXEy?=
 =?utf-8?B?cTc3aG9rOWdyRk4wbG5XaldUMXZmNVUwdFl4cUtKc0h5NnZtalVib1MrMnRk?=
 =?utf-8?B?REUxK2J5TWFITXVzVW9HWUhqUi96UDkzQjNEejh2NG5vdGpBeGo2NUdYK0JF?=
 =?utf-8?B?WG85NHMvakptc0tVQVBLbWh0ck5QRXpNR0lXTDRpMDdQYnRwNk4xc3dySEp1?=
 =?utf-8?B?bVFDYTlocVdTekJtbUpPMVljOFpqK0hQNlR3VVc4dXNPck5nakp5cmlCNitp?=
 =?utf-8?B?ankwaGlSZnRaRnRPZytFUVVDVW9kREpyWnFJUkxESVQwR3AyK3N6TjFXTW1E?=
 =?utf-8?B?Q1VacnJLQWZNbStKQkJWTThOQldneHB0eXJQTjZhQzNyVm02bGZJUHNaSmNP?=
 =?utf-8?B?WTdXRlR4QnRmWndPRFBWdEFldlBvYVdQWWI0YkZ1V1FiYVd5SCtSS2dkSmU3?=
 =?utf-8?B?NlRNT2JTRHpmS2RBZEVCb0ErMlNKQmp1c1hhVHZtL1ZsaHEzQk14U0ZqUldG?=
 =?utf-8?B?dHV6djdZWUg2L2pkb0MrMTdRZjFWRTBPNlRoS2RlMkk5Y2xyNTg5QWxQQTVH?=
 =?utf-8?B?YWtHZjBzejg1ZnlWVU9BZGpHWW1uSXRjRXE4V3ZXOGg1RC9SanhscXgzVXRo?=
 =?utf-8?B?d20vdTkrWTllYnBTWmdST0ErcmpJYmdDcDVpd01yZW1TUnQrK292NTJLdWgw?=
 =?utf-8?B?RWtnWjdxaEVndlZFV3NSYUFKUzQ0QTg0Nyt5b05lMTY4akhMbzBFK1A1b1N5?=
 =?utf-8?B?UG8rek9IZ3lXS1JNenR6MWhlcnAwQVFZOFNqR2J6TTFzZGYyd1piS21OOTZ3?=
 =?utf-8?B?Q3Q0YXpWT0lxT3RsMmdwV1QwYUxaKzBaSkMvMStlU2xrOC8rcmtwOEJFR0Q0?=
 =?utf-8?B?alBCSTVQTzlCdHZISHIzN0tNUDdNR2VQbXoxVnZqMSs0Zk9oWFVXWVJrTXhv?=
 =?utf-8?B?Z0F5eUl4MTZhdmVUdjE0RDYzTVk2OE00Qm1xUllEZXU2U0tpZ2VqZnAwKzBR?=
 =?utf-8?B?U2RGMEtXNVlmN3NEQXl1cmZUaEUrVncwZkEzdS9iQXlmZm1nZFdIYThIT2NM?=
 =?utf-8?B?eTlqOHJUR2Q2UnJ1V1Z2TFNmZ0dBTUNSRU01cEpENzlPSWFjd1M2emdFUmFC?=
 =?utf-8?B?OWk2d2pBbVdDTGl6bW1CQnJWdHBQSnlaRlFCRHZxSGFuNk5kN24yZzJ5d204?=
 =?utf-8?B?M2xJb1BMVE5tOEV0TGRocnFLT1FvUytnNDBxS3FwS1RncE5EbUdlODBubjEy?=
 =?utf-8?Q?PismKO3GNWxIcECX257qSYMj/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e355bd5-a78a-43a2-edc1-08dd7155b8d5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:45:14.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQt2D8WH7oq1zqBJJBlpW5BztwCIgVFvyBGqIAgGPvWHc/rANvGs2vfiZRhhm+fpKGsmZM8dVDDOD3tkIWnciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497
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



On 2025-04-01 11:45, Shengyu Qu wrote:
> 
> 
> 在 2025/4/1 22:11, Michel Dänzer 写道:
>> On 2025-04-01 14:32, Shengyu Qu wrote:
>>> 在 2025/4/1 17:56, Michel Dänzer 写道:
>>>> On 2025-03-31 19:42, Alex Hung wrote:
>>>>> On 3/31/25 11:04, Shengyu Qu wrote:
>>>>>> Or we can add some kind of "linked with" info to plane's COLOR_PIPELINE property, to let userspace know that cursor plane and background plane share the same colorop config. So that userspace could do extra conversion on cursor image data to avoid display wrong cursor color.
>>>>>
>>>>> That's over-complicate and makes little sense for both device drivers and userspace applications.
>>>>>
>>>>> If any planes share same colorop config, a device driver exposes the same color pipeline with the same colorops.
>>>>>
>>>>> If a plane does not support color pipeline or a driver doesn't want to support it, there is no color pipeline and no color objects.
>>>>
>>>> I suspect using the cursor plane is generally higher priority for Wayland compositors than using overlay planes, because the former is critical for a responsive user experience.
>>>>
>>>> This requires that the amdgpu DC driver backs the cursor plane with a dedicated HW plane though (as it's already doing in some cases), to either fully support color pipelines for the cursor plane, or at least provide proper "no color pipeline" behaviour for it. Letting the effective behaviour be determined by the other planes which happen to be behind the cursor plane isn't usable for Wayland compositors.
>>> Current behavior is just disable colorop for both background plane and cursor plane.
>>
>> Are you saying the color pipeline is implicitly disabled for any KMS planes which happen to be overlapped by the cursor plane?
> According to this mail, I think so(unless I mistook about the meaning again):
> https://lists.freedesktop.org/archives/amd-gfx/2025-April/122257.html
> 

No, that's not what this is saying.

What this says is that when a compositor tries to enable
an color pipeline on a plane on AMD HW and a cursor on
top of that plane the driver will reject that commit.

A compositor can then either not set a color pipeline,
or not set the cursor plane.

There's no "implicit disabling" going on. Everything is 
explicit.

I'm having a hard time trying to understand where your
questions are coming from. Are you implementing a compositor?
Are you trying to build a power-efficient system using AMD
HW? Something else? If you could expand on that it might help
us answer them better.

Harry

>>
>> That sounds like a no go.
>>
>>
>>> I'm not sure how much planes does the hardware support, but if there are too less planes to use, maybe we still need to make use of the cursor background plane in the compositor.
>>
>> If the HW has too few planes to allow both the cursor & overlay planes to work correctly (regardless of their dimensions), the driver should not allow enabling both kinds of planes at the same time.
>>
>>
> 

