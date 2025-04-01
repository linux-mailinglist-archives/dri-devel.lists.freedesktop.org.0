Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B7A782D6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6310E663;
	Tue,  1 Apr 2025 19:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mdBNIloj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3610E13F;
 Tue,  1 Apr 2025 19:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAEGRmfKAsK7uygToRO8jnngU9CtmKqsK7k79fmAcG7aaiXgI2EHkVKltyFi5rz4stX1iginnbQ+DheyEPTlYdqUmtdOu1pL/0Jm56FvxQXJGmLRod6C9TzaR2cQHaSp7jHpbXUBadh4kP0i/2BBiheAAoGB2YKihS1uhBdToulx5/cD1ICeQS4vaYaXC+wSvtRT7v2w3Uezz9PiMGstbLF0I1aSiAXfelvoA/Jrs0K53uRkhzH6zdECrNFiyLncPwUuM+503f7aJSQwQ7q8mzbiuCW5Hj0s+bz3Fgo9oeitx5bG3uHq3N+TCLAWyfXERLf8t/qVGxU6VSTH6tVy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTUtsxcCOZd3s2cGGHKEzFME2kSt35cD9AzTc3fzxB4=;
 b=exhZvm1Ba5dEA3FAiPqXMa8Y5rFgf55UHeTnikxRBeuc/Edi0oh1MGMvUGgeXeFxKoVcvzTS6rc6wka3zuZmM94bxzo4p5mhY0xGTxGFMKhf2a7nnrOpJ3g1bP3uFk7d/635rEUdoN32goCSJnMonI4KAPNxNZ9PCAJh+2WLBx70DLXnnOBe/5OQEu2U/3+66Qs7ZHgd8SsY9Zzm4y+J6afBxOj2y49xvhc1yZM4X+ZlO1JvXbarTytc9M4nvrVs6WJFl5LebbDrOIWndG27UHy0UvxXGyZEQK7/Mf2pGDi9CYFBGH9UEQj4E07hapm2aJcbvRF5dZh/ja0Ny8f0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTUtsxcCOZd3s2cGGHKEzFME2kSt35cD9AzTc3fzxB4=;
 b=mdBNIloj9Pg1BEv1+/bjcYUyJO0nXLZXAXkSolxkKRLCmpWLHqYmKVN86UBbJUoyiHp3HHM2cIkOH7kS4t9VYxN0NJ40ZsAbDoknOcprF5840E6yyDDiHXtuA/ece6vFB79L3cFI2Lv4Fc844ESQ6YzvPMLQZCeVTbDihawi7Ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 19:39:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 19:39:16 +0000
Message-ID: <9460ab55-a8ff-47e3-a9d0-dc41e17673f6@amd.com>
Date: Tue, 1 Apr 2025 15:39:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Melissa Wen <mwen@igalia.com>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, Shengyu Qu <wiagn233@outlook.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
References: <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
 <4vyvhp5bag5hlmmudwxqolvlf2qgpcmdozj4vgkxzvsv2cvs6p@gumxpiflj7q7>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <4vyvhp5bag5hlmmudwxqolvlf2qgpcmdozj4vgkxzvsv2cvs6p@gumxpiflj7q7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b60bef9-abce-47b2-7338-08dd7154e396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE8zUXRSdm02cnlBdHNJSWtTQ0JQbkFVZmplVVVuK3BuZEVMV2tVTGgyMVVk?=
 =?utf-8?B?VEJlSGdMWFpwNlFNVXVFNURvekpwYU5lMEw2anE1Mzd6WVRTK0JzbHFTZS9z?=
 =?utf-8?B?dFdtQUpFNW1PeGtxa2UrblNkbGZSK3J2VjhhWTlpK3hhUjJudnJ1MWJ1dTBI?=
 =?utf-8?B?MEZ5UGo0QlZzZDV1MXA2Z2FmVDJhM0N2c0FrUWtqSlBjUklvUE9JeGtGZmUy?=
 =?utf-8?B?Tk13cHNXWitjWU1FNUFPRVZTcGRJL3RSOVlncjVVWUJCdXBESGxYYmliaGFQ?=
 =?utf-8?B?NlQvOW9BbGFSRUVNZVNpZU9ZelNxQS9EZXB3TkFoODRiT1AvUmRjclpVNkQ5?=
 =?utf-8?B?V2JwTTNWbU95Mmk5NmJXWTZ6VzVSaUNCNTNDOEZmQ2FSREZHVW1VNFNSdHUx?=
 =?utf-8?B?b0czNlgwKzNHKzU4Vi9WV0FHRTdxVUlocTdGOTNvbzJBNHpiY3JzaHRHMjNj?=
 =?utf-8?B?VmpGSUJ4OHRIcDczMWRPTC80ei90WDBCVE54ZWxXUFVOTU5oT3NnWWR0bkVz?=
 =?utf-8?B?ZW9YQmdaLzlBOGNhem9BWnQxeUZaMFJuU3BXUlJNUUk4dW52K0NTQytMMktq?=
 =?utf-8?B?S1JLc0VNOFdkbW56RUpYYzhuYzNWR2lwRUpXREgvS1pVVnh5MHpUaVdDK1Z1?=
 =?utf-8?B?N0JEcmhnNXc3U3FCeGozUTFxMm9LM1VCRURrNEJacGs2dTJEWDFLYm1yMVVB?=
 =?utf-8?B?VXE4SmR0aXNYYy8vVjIvdjVKUndUaC9mYVVwRDB6L3g5M2w5a3lBMTFSbzM5?=
 =?utf-8?B?Q3gyTG1XMGFjQ2JCK2lCWml4bEUxZ0dweWJsRXdHWm5Wa2VnSFpaRU1mR0Iy?=
 =?utf-8?B?K2dVa1l5N1NRbjNXM0cwZ2ZCZ0U3WGQ2WU9uQVZSbUN4RWVlckovdUQxRE1q?=
 =?utf-8?B?RXllTnR1NkNtc1dHUVJsZkZNd0hzNU02b1k4NG1hZzM2RGcvMmRUb251akhQ?=
 =?utf-8?B?MHBSMXNmU1VsY0Rsd1QvMisvb21HT0d4MEdyVGNsZFF3L0VsTksvbXhkUGJx?=
 =?utf-8?B?VGJUY290RnlOSGdiSnc4UlRzSENvV240dUZ4TXFBYjZVMnRXeDZYTXB6ZVRP?=
 =?utf-8?B?WWprdGVqcWhkYlpZc1lQUzI1enlsbFBUd3B0WTc5bWFjOWg4NmtSVmhNaUI4?=
 =?utf-8?B?am5VeWtnMEMycW1xcmt1aDBXeEFKVjFOYzdjOG0wSitFeGtrR0wyWndpcDU3?=
 =?utf-8?B?eVh0K2hKRlpVNFI3ck1JRnB2eVVzdVpZQmlGaHRQRHVOcUZtM2xDVXQ0a1ZJ?=
 =?utf-8?B?Y1hmMStJYk5FNjdwd0tZVGdPaGR2UDhGS281eEY0YXQ0OENBR1B6SlRidVpu?=
 =?utf-8?B?SnhmN01FYytNZjdJd1VpVVNUT3lnN2tBeGw1emgvcEI0c1ViMVNQMm5oZlJU?=
 =?utf-8?B?Y3hLS1RWTjVMc09JVFBqSkJQUEVOMXplRlg3ZHlETXF1aTNSNlpueGlENkdt?=
 =?utf-8?B?a1BUV0dRczljeHN0WEo3WHVVRk5OcS9aVjRrV3FpNjUvcTZYR1pDUWhSb0dX?=
 =?utf-8?B?RUdGdHo0YmVJcmhPaVpRMmdRNTU1cXlQSUJQd1I0SE1QYVRZMmt0MlEydkNK?=
 =?utf-8?B?cmdiMGQ1RGdRb0R2YzgzYlg3MzlGcFNvdjZFbm13dGZZdjh0OE41Q3hUUmxL?=
 =?utf-8?B?SUxpcStiUUZLSkJKTzBWbmpmQWdhSjEvZEtjVXdwRlVnTHorbHpWSU1zZ0d6?=
 =?utf-8?B?QkVQMm5hYnlEMExQNEdmcG5Md0hTOVRVU1lyWVpxQUhjZC8zTHRMWkgxcjZS?=
 =?utf-8?B?SFE2UlN3S2tmZDZ6Y3JuSlNVQkJ4TzdDQW9OSktSUlRLYjcwNm43WFFSdkdS?=
 =?utf-8?B?VEYvUmpsazNxQmxNVm1PUDk2Zk1VMjhkMFBwZ2MrRy9JWnB5K29QNHA1ZXJr?=
 =?utf-8?B?MDdnMWVMdFFldzQvRkxpUk1kVTlENXFmbUNON2p5TlJXbUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0t5bk40eXVOMHlqbEtKTVluQnpTTWRpQ2ZiY0VQdk95QTBZVmUwOVdNc0ts?=
 =?utf-8?B?MnB1ZElxcDdVbUFyVzFndFJZL3grSjFGWWJlb2VtcENYQWdZWEM1SW9XYUFp?=
 =?utf-8?B?amlybTN2dzhMNW5kUUdvOGRtMmFQUW5tWjk5NEIrN09GN2w3bEpycXVEVmJp?=
 =?utf-8?B?aUcwb1VjanlINEZ2d3pUMEZGMkRPN2w1S1VRNVpPV3hKUlVWSjMxdTdrMXRy?=
 =?utf-8?B?Z3lvSHFQM1JjM0lKRVp4S1pVd05UR0NxV201UUZ6TlYreWhOUkFBQjRRNWpH?=
 =?utf-8?B?UVlpcEJLQ0hCUWpDZHJGRVQwTWtzWWtWdWZNdTVmeWttYk9tT3E1bXNxWGFR?=
 =?utf-8?B?cXlqV1V3TFpKcGluaGp6cmtObG5sdHpoeDdBeFZEVnFDYUFuRHg3UjNHdk9G?=
 =?utf-8?B?cnFhcm9iNVZDQzlzM0pET1dzR2t5QkRKaHJjQ2x5VTRLaHFSN3FKRnBQQWlY?=
 =?utf-8?B?M0g4dE9sNDY2d0hhbktPb0dMZnRlMzdIS1c2WVdwaWM2eElhcyswTyt4d2pP?=
 =?utf-8?B?WVlSRWM4RFdtNjdaYXZrdmVEU3dSOG1hVUs5R1M2Qjk4RmFZZUhRbnlOT1ZL?=
 =?utf-8?B?cjc5OW5lOHFXZXlFMTJSSzBNR2dlaUxMMldEU1l3a3FkdHpla1NMZkdYYnVu?=
 =?utf-8?B?bENVLzBCQkdHZU5zOGdMK1BwVDJZRmhETkZXSnRhL2ZCWnBxZGwvYngwQmRN?=
 =?utf-8?B?bm1hdWFmS3FaMDd4aDlIR2F2cTlxNGVXNG5Hc1BNY283V0ZsajJoTlI3eHI3?=
 =?utf-8?B?NUsyTy9hRUF1SnNvOXVINXFqV2ZmckYvOVhSSkhEMGVJOG1XUjI4Y2ttSzQ4?=
 =?utf-8?B?NUZWSXpnbmlOc3MxaWxDYUFmcTNMMjZyTXR5bzdNNzJiWFdFekVJd2hpUWYw?=
 =?utf-8?B?dXowam1vZFkxNGoyZUNxRkRJK3piMmJOT29CRVJWZ3RHUDZsaEpBY3h3U3Vk?=
 =?utf-8?B?amlKcnptVXByTlN4VUpCNmRvcTJrU2JLYWxlaVlNdzhGY2syRUdJSjFObHhL?=
 =?utf-8?B?Ukx4R2VadDRwdnMzZDV1ZzEyaHk4MURvS0Q5K2FzUzZyTmloZnVGSUlZNmNn?=
 =?utf-8?B?U0M1dHFPczFYaUpTdWFWTjE4Zy9PMmZkelhmRmtSeitEZnpzVFdHNll6OW1m?=
 =?utf-8?B?TG5halRjSE5jWW9vcmpGWUZVYld2R0ltckJKdUFPZWtZc0RjaUNCa3VNdUVw?=
 =?utf-8?B?MVM1NHpRQzJ4TTFvR1JLQzNpc0l2UHF1NmNIVnlVOHFqek9zK3FSMUFiMDYr?=
 =?utf-8?B?OFNaalQ2am1sWjRWRnpFcnAvU3RkaDJrWGVCR2drdTd6K3ZORnl1c2VMZHBo?=
 =?utf-8?B?Y3p1dFBieWxiVitVZFZwWFBRZEVmZytrdVRkZ3VScWFBdW53Qy9Qam9PQ29S?=
 =?utf-8?B?endla0hPTmJZd004L1plaTQ1N2U5d0Z5SGp3Z2tuUy8xbVpNUExwem5aaTIz?=
 =?utf-8?B?VEtQeUppTHpaaytzZ3R5N2RtWDlmRFJQZjFqR3BaTXYrVXVvWkNNNGV3c1Rl?=
 =?utf-8?B?aFk4NktuYS9HeEdCbFk4R3VVVVNsbVNtbjFkQ1ZoZGZ6YVpWclBLNk05c0xu?=
 =?utf-8?B?NlVrajhLRXRyS0Q4Y0ZrQWJ3WVR5WDhJdVZMc2JWdE9NcjRBbGtOaWJUdzM1?=
 =?utf-8?B?R05yS0Vwdk9FT2g1Y0lOYzQ2YVFCdHBPNTFGRHdmT2ZIT0d6V3pWVEhIdklC?=
 =?utf-8?B?VXpkZDdtbW5BRzRuNmE3WGpVSGpJMjZZeStqSkVYUCtDU0wzNkI1dEV5ZHor?=
 =?utf-8?B?b0FIb2JJQXhaVlhadDZMZnpIZUtqTGI4VjlRcTFoMU8rMXB3bncrZzBmeTBY?=
 =?utf-8?B?eFRLYW9DTjVRV1FMZHdDTnQrUVZMcmNiQ0J1d2Y3WUsrbjd1dDRJT3J6S3VI?=
 =?utf-8?B?Rjl5WFJRc0ZwRmY0dDIzSWJxc3pNT3NmTkVzT1pFaWdVeUVqdkh5My9OM1RX?=
 =?utf-8?B?MTJ6MytqNkZlc3ZTdXJlOHprWW5hQ2FDaXovekxoSVVueGFDTUJtbVBaKzlZ?=
 =?utf-8?B?NVlONE1FVWVnaEorQytPZit4Y2ZIbndZbnV1bHQ0SEFwTTdjQXdDMWFqc1FV?=
 =?utf-8?B?c2x0dXd2bTV4VVliUTlBUElROXR5TEEwYmlWenRFVHZQS0RqMWxvaEdEVjhU?=
 =?utf-8?Q?0yehPw0rDWl5aug0z2Hoov/5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b60bef9-abce-47b2-7338-08dd7154e396
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:39:16.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9fqzSBYUprgLMwr8AIMeE80PF+V02jLSFXbxZe7XvgAnd71KY+r7NFXW/R62o9lEbUBLAjV4gv+scoqCfdK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279
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



On 2025-04-01 11:45, Melissa Wen wrote:
> On 03/31, Xaver Hugl wrote:
>>> Cursor plane has no color pipeline and thus it has no colorop either. It
>>> inherits color processing from its parent plane.
>>
>> Just to be sure: That means amdgpu will reject atomic commits that try
>> to set a color pipeline on the primary plane while showing the cursor
>> plane on top of it? Just like with scaling?
> 
> Isn't AMD driver resorting to overlay cursor mode when scaling?
> 
> In addition, isn't it a case of using overlay cursor mode when setting a
> color pipeline for cursor?
> 

Yes, AMD driver is using the overlay cursor (entire dedicated
HW pipe) for the cursor when the cursor scaling doesn't match
the underlying plane.

The same thing can be done for color operations but it's not
implemented yet.

Harry

> Melissa

