Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HTtHJwwcmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:13:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6467C26
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491B810E9C3;
	Thu, 22 Jan 2026 14:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gOUJoQFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24A10E9BE;
 Thu, 22 Jan 2026 14:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHru42mG3wFX58uxG5ivpTudl3udMNJjvTlG5UpH67rWzv88ms3LSLVmp57vACdxD9Ga3bMU4OjVR4iAtFjKlZWvU8T1FYWj/S6RksDmbmDl4tbkgS1/JsYxo1Y79VQI6+01F3QpospF7znKYpTlSQD0TMD3P74EDI7eKJ6LHC9t3Q1o3l8KqGv/yd3iRDO5RN/xPNAzmlYL8iGL5eZPK3CV7yceW8HQv8tDaqi8CKavS5ewP3X81hjSeP+IdYWciP7u1mVANqtW1lmeK9FopwwAYb+bId/UYPQ1EOzJnKjNKDyHeo8Cl+0PiMBZWjfpjq5cZBgPbXz6q/M4nOwlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2PDoVxoYr28j35pUjHRPBKwACCliBrqfgEYZ1yBhqY=;
 b=ZLpVjaYIzn6L4jdWTAaj9e9o2JNOu6ek4d36U0h1fWZGZusvyhMxlJ0xSV1hSwr+ii28//DEXmU6A2pLWL94BM10HQkY9HLbDjUCANkQeMJHd7+FlAxljUdilgZoEfXTfGyY3vBVS/rDKZGS0UStw6ciWxSwikb9GiZP4snOyqnAnExJO0NsCeWnHnbgDGsoe7Ng/n3SGD6hFbrmBDMkCv9ICD955EXz7PsK55Ebl4VQ80Egh4aEWBatKCqR/fYs/kVoDWOl7DUiOEY9Uw0g1b2WmEA37fP3gTsMnr/6swqVF6voI3cDOaDQ0AImYAJqGKvRs92nv3FdAd1zg8cfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2PDoVxoYr28j35pUjHRPBKwACCliBrqfgEYZ1yBhqY=;
 b=gOUJoQFM9EK/OqeaR+AHsKU2Qp3cQvgaQdb9khMICiRVyYABKW2L+8Q+gxrcACQ3eAG+/QXJ7CBlwZ9rbom7qcZWDbg9MIXdEvJmvi+tP0J1qarDE8P9AyybHNJU3Fm9kIl6eeMgX/R1ZUMRRvSLQgEFDmlKaUED5N5qSBdMu5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:13:40 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 14:13:39 +0000
Message-ID: <b8640bf9-1c00-47da-a659-ce79a7af67e3@amd.com>
Date: Thu, 22 Jan 2026 19:43:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/buddy: Optimize large alignment handling to avoid
 unnecessary splits
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
 <b2aa28aa-ce9c-4948-9bed-289700f4eb4a@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b2aa28aa-ce9c-4948-9bed-289700f4eb4a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0223.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: da269c68-93e9-40cb-901e-08de59c070d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b29EYVlpa05EeVF3M1RhNkxxcWxaQW9JUzNVaHVwMm9Yc3JyZW1Dd3B5eHFv?=
 =?utf-8?B?NWFsRDhWSm5yN2Y3UEcwRHZUWGpUNnR6cmZmWEZJcXVrSThRb2IxN0pFeXps?=
 =?utf-8?B?dkpITDBqZ3ZkalR1RGdMVlJleVBRSkxRSXVCVE1TMmkyakh6aHpVNEp0YkdW?=
 =?utf-8?B?WmZMRTZTd0tGMlova1NVQXpIekNmYnYvUjdhcGFGNitneE00TmdUbGc3cThR?=
 =?utf-8?B?U1l5U25HWkZ0VW9sWE9XYkwxWXN4eFhBOGVBSXBuSTY0eUZORzhHeHVrc0Zv?=
 =?utf-8?B?ZXByWm5QQUdCMDZFZS9yMHNmSHFKZEd2VFZHbmVkN1ZGSXRPOTZmaHBQQ2VZ?=
 =?utf-8?B?TnR2SzlaUDVQLzUzdENMTDZSQmNUZUNvZlQ0MzZpVU90V2dwdzdWZGxTK1A4?=
 =?utf-8?B?OElPOVpDUzdROUlxdTZZOHpRd0lvNjVjeS9MNXI3ZVZjUnFQblg2SU5uRzFv?=
 =?utf-8?B?dVo5RDVhdE1hTCtCWU80ZmErVDJGM3VJMkNrVDJLbm1qTVhCTTJYZ01xM0ZX?=
 =?utf-8?B?WXgvNzJuMlRLY01HWVFrazN2QUNiZG5NMU9RZzNBNjNFdndhU1UxYWdxNVpB?=
 =?utf-8?B?a094WHhoTlZpbzZmcFBZZlVjVXc4WStFTXZXQU1hcXNSNlVhODlEdnZ2UVRH?=
 =?utf-8?B?Y0VRMWNCQXczR3VrUHkzNVBNT2Z3SUtlY0NJZHJ6cnhKelY3Z2x2eGRSY0k2?=
 =?utf-8?B?clFrQU4wUllaaEZsWC9VZ3BJdGRJWFFDUGYrdVRIRkNWaWpjNVNmUjZ1SXFE?=
 =?utf-8?B?ZmY5MS8yMjl2QWpEek9jSUNhZDU1d1RONWJSc09MWWMyaFE4Q2VPTUc2dGNS?=
 =?utf-8?B?Qzc5dVRqcGMwZ2gwNmlXNmR1SFBGU29CTU8wTGkxRnZPLzNRcitJbEc2cjRV?=
 =?utf-8?B?bjNqbzlEYlBKcGFFVmtZTjN1SDNVRHk2a0hMaGN6RGhjVkY3Q0d5NWNQclZH?=
 =?utf-8?B?T1JabDgvbCtZUkRwTWFVUXJSZVUraHdVT3R0aVhXQ0lVTitINmdCUGF4TjhL?=
 =?utf-8?B?azZWUEdkUXI2aHJYOC8yNjdMSHdqNnJacllRZEVKQlhqWjNxNFR1Rm1YZG0x?=
 =?utf-8?B?YTFSdlYzQlRJejR3ckVWQjJQeFVtcitzUzlnWTRQS0J3SGRUdEN6d3ZOVkJW?=
 =?utf-8?B?LzAwSDlyN05QR2huWlBuRGZzUm0zcnRMejJZUHh5VXFyLzdZSldtMlUrV1hr?=
 =?utf-8?B?cXV6aG02K1VZOU1RczZrRXF6dUZQZnJYMjB0cWxGc0JISm0xSFA4YVgrRVkz?=
 =?utf-8?B?UjVwY05wbjFyMXZaTUNmTkVsR3JqRytZdlB3QWQxcXhCSE5qQ0tzblZqU2ho?=
 =?utf-8?B?MFBYVnlZSXV4K2JRSUtuckRXbE80S05nSWpXV3ZhY29SRU1saXYrclY0ZFVk?=
 =?utf-8?B?UGgzQmM4czN2VGdHYzlrcnRoQjdrOFFyL1JVM0FMSy9tZ21WTDNDK3dxOXZq?=
 =?utf-8?B?UVNTZW4wcnppRkNqdWpHV1ZMOFlWbDlwQkxhOHZsam05bENmRkh0SmFza2Jq?=
 =?utf-8?B?WlFHM3Y2UFhBOEs2WTQzb29TRzMzRXBIeE9nT2c3dG9DUERSZHpUc3QrS1pi?=
 =?utf-8?B?S2VRdWJBcGJMSTlOa2hHeUxSZ25OdGlSZXExTTF0b1RTclFPaXR1UEtickZx?=
 =?utf-8?B?cHpGWmkzSTd5WUJ4NnFtOFl2TzVjeVpOUFFvOUNxd1p2NmNyMU4wa0lNWkgv?=
 =?utf-8?B?NHhaZ2U3dGZDNWxxaCthdzFEM21zazNMdXdtRjlSbEVDdjFGNEllWTZ0SDJh?=
 =?utf-8?B?WWoybVFHMkhJck02dS90empBcE1IZWlhYjA1aU4xMWhCTFMvMHdoQ2pOT3d0?=
 =?utf-8?B?QlQxS3RjWTR2c1BpMytBZzRuTnRPYmF5N1haU3A4dHJxUnpPdEY2OEtZMm9q?=
 =?utf-8?B?eHErVTVUeUFJamU3KzZwbUduWlJmWVQ5eEdLY3dQU3N1Zlh4QXRSYzN4M2ZT?=
 =?utf-8?B?MHRmZkZXQ2E0OXRMem8zUXFwNXh0eWFBcGlmNFBjakVGbFl1T3NUNk5hWU9G?=
 =?utf-8?B?cW1wUFkzTitETmtuQUJPb0ZWckl2OUhEVWRvajNJTU9xYlBYandnYkl4R3Jl?=
 =?utf-8?B?Q0xoQXd1cVY5dWM5VlNNU1BUYWpTbVJuNzRYV1FObkZlSHlDTXdsY2ppTmFk?=
 =?utf-8?Q?bYOY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5hTEY4cWliVmFIUXBBanU0eUlHamZrYjNtYVNyWXAvekw2ZVpXa0VUeUd2?=
 =?utf-8?B?Wm9NSHljaFAzZFk2RDc3RzFHS2dNVEFrVmxpWDcwV2RpS2ErSnFMWGlqakZF?=
 =?utf-8?B?MjdMaDFGaW9tVHJOT2xReUc5VVoxeGNwc1ZZQ2ZwdlVzcnBsQlhMaXVIY2g1?=
 =?utf-8?B?U1BBQU4vRWI5dFpEdXZJcGtnRTYyWDFLL2toSExnajQyREt6RXQ5eW1ZMjBP?=
 =?utf-8?B?QzE3c29TUU5RdGdTMGVNRXV5aGErL2orY3NYTlJUMnpqSXBPQmhQTkNXYWh3?=
 =?utf-8?B?eUtkZHNWY3RaSkY1UmEvOG9mUS85NE9ER296U1ppOG1mQTdoeVlyWWVtblVS?=
 =?utf-8?B?RGpPYTVxbWZXN3g5U1NsdWRkc3NmR21EMkpEVzJwYWtSRTRWRWhpRlR1MWtC?=
 =?utf-8?B?VWRTVHp6UHM0UnUrYkJFSWE4OHBoMTVkemk0dTU3ZWhlaDZZMWZWTHRjbXNP?=
 =?utf-8?B?WHlSL2V1RWxSTUp0NktQODROV09XbiszVDBsOVg5c29WUW1JOUdNbDd2cEI3?=
 =?utf-8?B?NnJmS2FRbDFsc0FMK0lqRlZSVzVCZGNSaU5GNkxjaDZQNE1OaFphazB5QzhN?=
 =?utf-8?B?aFZiaHExTHJYY1pnNm1PYmZTcXYvaW1qMmVQeG9yemkxSVl3QmZPSzlzeXla?=
 =?utf-8?B?dzFUWVhRdTJ5ZDZ6L1Q2bHE2cFVnZ21vRmR4Yk4zTll6UUUyM09BWmtwVzBZ?=
 =?utf-8?B?OS9hRGM4QTZ3VVM0UUJISWs4Q01PTTdDVmM3YXFSS0RDWnlaeXZhTVkxMkp4?=
 =?utf-8?B?d1RnYkZmbWpCTEYrYTBvb05UVDUzMzNVZm9ucVY0czdDRFVEb1BtdHdxc0ps?=
 =?utf-8?B?WG9hZFlFZWoxYkllYUd5Z09sVHF0YklMQzRmNi9zbFRSVGxMQmdxTk5ZeDBN?=
 =?utf-8?B?SDZWRmJEaythMXUyKzhaZzRmTXh2cHJXSnBEaVVlVDBUbGs2NUtyNnBaaU5J?=
 =?utf-8?B?YWpXT01DcmZlK1Z6NEVWYWV5MW1TdXppR3RkakRMU1JSWUdEdGRPWS8zRUJl?=
 =?utf-8?B?RGFPN3JtSWw0aEU2eHJHVFR2bHBLQ0pTL2VUUlR1VmFDTzVYSnFsdS8zL3dl?=
 =?utf-8?B?WkZpWDQveEdjSzA4Qmlsem9JUTRubFgvekhOWlhhejVuaUErdzYwZmZVMW9I?=
 =?utf-8?B?eEIzMGVaeFVsbDJMaUMxNS82TUwxWFVBdFdYcHAwZEV5NnY3UUxqZWtDOFF2?=
 =?utf-8?B?Y3EwdFhRRDBBdjNlOStEMzcvblE3alRwd2NuVVJjMTZNa04yTXIxeFoydVpQ?=
 =?utf-8?B?ZzFab1hETkVXVXVNeFRxUG82aXAyRUIvaUZXQnBJbCtJamh1OXJVTEpTWWt4?=
 =?utf-8?B?enBsYXVpdVorS2xIYm1GYWswQk9DdWQ2SUd6V0JBa3lZQUlhMGwvNW55L1FG?=
 =?utf-8?B?OVp4dFN1QVd5SmtIYXVtcXZuR3A3NEJYcjFBK0FGaERISEtnT1FsT1lHcWJJ?=
 =?utf-8?B?Y3dPNWZEU0dWN2Zhc1YzQXdpZWZ6U1N3UUhiMXBWek5mN0QvYzU0bWk1emtF?=
 =?utf-8?B?dytDaWZoY2hsNHBxZHpIZlo4TDA1SGdLMWJSOW1NeDBhS1NtM0NtaWl4azFC?=
 =?utf-8?B?cVFaTnNJVC8xNlRNS2tYRHgvRFVBK2NEZzNiNXY0UzNmUTYxeEVyMU5YSC9q?=
 =?utf-8?B?UkovS1o5Z29UdjQzV1FnYjdMNnh2eFB0bjJaOTY1dWFRamNwUTZCeVRNZnpJ?=
 =?utf-8?B?dG1BSTkyMWxIMTdWMi92UEdOdjE0bytGdVoyWm41bm13S3ljcndicUlNTFdj?=
 =?utf-8?B?dVZvUkRXRzJ1UmFtNkN6VzJIK1Vtc1VHREE1Y0xTcklOSHZPN3RkOCtSdzRx?=
 =?utf-8?B?NW90QUcrbjFaelMzTnJ5ZklsY21hVkl1ck5KdHZ2KzA0VTQzUzRLUVg0Wnh1?=
 =?utf-8?B?MXpLTUNhZk9MWUYxSEMraC9hb2tDb3IrWS9makM4VVcvdlJPZG12V3RESGNQ?=
 =?utf-8?B?UjlDNXJYRDRhWUJ0K0V2dDNZemFhU2ltY1piNkdnV2JjMkF4TXJUN1FSbkNZ?=
 =?utf-8?B?VExDanpodGZPcDMxQ0k1U3huLzN1QS9zUGdzWDJtaVRhdVdIa3ExdmNSM2pL?=
 =?utf-8?B?M1VOdXBMeEtxSC80NXBEZENSSVRjeS9sM2cwOFVkL0ZmM0NCbnFsZ3NDOU1q?=
 =?utf-8?B?RHBDZzJ4d0x5cHh4QXhxR1lFbnZvcU84ZExaRHBzVCt0MHdmdUFKbWl2VWZG?=
 =?utf-8?B?ZVFuY01xaXprelZYV1FVSGpIdzVVQnFVVHlRT0huSTJSKzZvVnprOTd3K2tw?=
 =?utf-8?B?aWJBaHJYd1U0QUpkUURKaGJxbFNtdVVOYU5UdFBjRm1rbjd5L1UwdTNUeGlr?=
 =?utf-8?B?UzN1Y3I2Y2dML1RsWmZ4dlVUWW12WEg0blRpcmtJRW1JcmlQUC9LZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da269c68-93e9-40cb-901e-08de59c070d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:13:39.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vS7tZCNHzB8L7qJDN5uGXt7sT+olGnCMxf7MI7Iz9TAeghqn+8Vh3KawTAa3+kZPWrhKp5z2txfhfGWgnZWgoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 14E6467C26
X-Rspamd-Action: no action


On 09/01/26 22:12, Matthew Auld wrote:
> On 11/12/2025 12:23, Arunpravin Paneer Selvam wrote:
>> Large alignment requests previously forced the allocator to search by
>> alignment order, causing large free blocks to be split even when a
>> smaller aligned range existed within them. This patch switches the
>> search to prioritize the requested size and uses an augmented RB-tree
>> field (subtree_max_alignment) to efficiently locate blocks that satisfy
>> both size and alignment. This prevents unnecessary block splitting and
>> significantly reduces fragmentation.
>>
>> A practical example is the VKCTS test
>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which
>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, these
>> requests caused the allocator to split large blocks despite having
>> smaller aligned portions within them that could satisfy the allocation.
>> The new design now identifies and allocates from these portions,
>> avoiding unnecessary splitting.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 205 +++++++++++++++++++++++++++++++++---
>>   include/drm/drm_buddy.h     |   3 +
>>   2 files changed, 191 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f2c92902e4a3..f749814bb270 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -23,6 +23,18 @@ static struct kmem_cache *slab_blocks;
>>   #define for_each_free_tree(tree) \
>>       for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
>>   +static unsigned int drm_buddy_min_offset_or_size_order(struct 
>> drm_buddy_block *block)
>> +{
>> +    return min_t(unsigned int,
>> +             __ffs(drm_buddy_block_offset(block)),
>> +             drm_buddy_block_order(block));
>
> Didn't quite get this bit. Why do we pick the min between the order 
> and "alignment"? Say we have order zero block but is has 256K addr 
> alignment this just selects zero? What is the idea here?
Sorry for the confusion. I mixed up two concepts and I have sent the 
offset alignment only patch. Please have a look.
>
>> +}
>> +
>> +RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
>> +             struct drm_buddy_block, rb,
>> +             unsigned int, subtree_max_alignment,
>> +             drm_buddy_min_offset_or_size_order);
>> +
>>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>>                              struct drm_buddy_block *parent,
>>                              unsigned int order,
>> @@ -40,6 +52,9 @@ static struct drm_buddy_block 
>> *drm_block_alloc(struct drm_buddy *mm,
>>       block->header |= order;
>>       block->parent = parent;
>>   +    block->subtree_max_alignment =
>> +        drm_buddy_min_offset_or_size_order(block);
>> +
>>       RB_CLEAR_NODE(&block->rb);
>>         BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>> @@ -76,26 +91,32 @@ static bool rbtree_is_empty(struct rb_root *root)
>>       return RB_EMPTY_ROOT(root);
>>   }
>>   -static bool drm_buddy_block_offset_less(const struct 
>> drm_buddy_block *block,
>> -                    const struct drm_buddy_block *node)
>> -{
>> -    return drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node);
>> -}
>> -
>> -static bool rbtree_block_offset_less(struct rb_node *block,
>> -                     const struct rb_node *node)
>> -{
>> -    return drm_buddy_block_offset_less(rbtree_get_free_block(block),
>> -                       rbtree_get_free_block(node));
>> -}
>> -
>>   static void rbtree_insert(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block,
>>                 enum drm_buddy_free_tree tree)
>>   {
>> -    rb_add(&block->rb,
>> - &mm->free_trees[tree][drm_buddy_block_order(block)],
>> -           rbtree_block_offset_less);
>> +    struct rb_node **link, *parent = NULL;
>> +    struct drm_buddy_block *node;
>> +    struct rb_root *root;
>> +    unsigned int order;
>> +
>> +    order = drm_buddy_block_order(block);
>> +
>> +    root = &mm->free_trees[tree][order];
>> +    link = &root->rb_node;
>> +
>> +    while (*link) {
>> +        parent = *link;
>> +        node = rbtree_get_free_block(parent);
>> +
>> +        if (drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node))
>> +            link = &parent->rb_left;
>> +        else
>> +            link = &parent->rb_right;
>
> Is this correct? From the docs it sounds like we are meant to update 
> the max alignment for each subtree on the path leading up to the 
> insertion? It looks like insert_augmentated will only do it if there 
> is something to be rebalanced.
AFAIU from the docs, rb_insert_augmented() updates the augmented value 
(subtree_max_alignment) for all nodes on the insertion path, not only 
when a rotation happens.
>
>> +    }
>> +
>> +    rb_link_node(&block->rb, parent, link);
>> +    rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>   }
>>     static void rbtree_remove(struct drm_buddy *mm,
>> @@ -108,7 +129,7 @@ static void rbtree_remove(struct drm_buddy *mm,
>>       tree = get_block_tree(block);
>>       root = &mm->free_trees[tree][order];
>>   -    rb_erase(&block->rb, root);
>> +    rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>       RB_CLEAR_NODE(&block->rb);
>>   }
>>   @@ -596,6 +617,88 @@ static bool block_incompatible(struct 
>> drm_buddy_block *block, unsigned int flags
>>       return needs_clear != drm_buddy_block_is_clear(block);
>>   }
>>   +static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
>> +                      unsigned int alignment)
>> +{
>> +    struct drm_buddy_block *block;
>> +
>> +    if (!node)
>> +        return false;
>> +
>> +    block = rbtree_get_free_block(node);
>> +    return block->subtree_max_alignment >= alignment;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +drm_buddy_find_block_aligned(struct drm_buddy *mm,
>> +                 enum drm_buddy_free_tree tree,
>> +                 unsigned int order,
>> +                 unsigned int tmp,
>> +                 unsigned int alignment,
>> +                 unsigned long flags)
>> +{
>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>> +    struct rb_node *rb = root->rb_node;
>> +
>> +    /* Try to find a block of the requested size that is already 
>> aligned */
>> +    while (rb) {
>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>> +        struct rb_node *left_node = rb->rb_left, *right_node = 
>> rb->rb_right;
>> +
>> +        if (left_node) {
>> +            if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
>> +                rb = left_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        if (drm_buddy_block_order(block) >= order &&
>> +            __ffs(drm_buddy_block_offset(block)) >= alignment)
>> +            return block;
>> +
>> +        if (right_node) {
>> +            if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
>> +                rb = right_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        break;
>> +    }
>> +
>> +    if (tmp < max(order, alignment))
>> +        return NULL;
>> +
>> +    /* If none found, look for a larger block that can satisfy the 
>> alignment */
>
> What is the idea here? IIUC we are looking at some specific order and 
> we want some min addr alignment, if the above can't find any subtree 
> with suitable max alignment then we should bail and try the next 
> order? Why instead do we do the search again with the same alignment 
> below?

Same as above, I mixed up two concepts. Please review v1 of offset 
aligned allocation patch.

Regards,

Arun.

>
>> +    rb = root->rb_node;
>> +    while (rb) {
>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>> +        struct rb_node *left_node = rb->rb_left, *right_node = 
>> rb->rb_right;
>> +
>> +        if (left_node) {
>> +            if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
>> +                rb = left_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        if (drm_buddy_block_order(block) >= max(order, alignment) &&
>> +            drm_buddy_min_offset_or_size_order(block) >= alignment)
>> +            return block;
>> +
>> +        if (right_node) {
>> +            if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
>> +                rb = right_node;
>> +                continue;
>> +            }
>> +        }
>> +
>> +        break;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>>   static struct drm_buddy_block *
>>   __alloc_range_bias(struct drm_buddy *mm,
>>              u64 start, u64 end,
>> @@ -798,6 +901,69 @@ alloc_from_freetree(struct drm_buddy *mm,
>>       return ERR_PTR(err);
>>   }
>>   +static int drm_buddy_offset_aligned_allocation(struct drm_buddy *mm,
>> +                           u64 size,
>> +                           u64 min_block_size,
>> +                           unsigned long flags,
>> +                           struct list_head *blocks)
>> +{
>> +    struct drm_buddy_block *block = NULL;
>> +    unsigned int order, tmp, alignment;
>> +    enum drm_buddy_free_tree tree;
>> +    unsigned long pages;
>> +
>> +    alignment = ilog2(min_block_size);
>> +    pages = size >> ilog2(mm->chunk_size);
>> +    order = fls(pages) - 1;
>> +
>> +    tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
>> +        DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>> +
>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +        block = drm_buddy_find_block_aligned(mm, tree, order,
>> +                             tmp, alignment, flags);
>> +        if (!block) {
>> +            tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
>> +                DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
>> +            block = drm_buddy_find_block_aligned(mm, tree, order,
>> +                                 tmp, alignment, flags);
>> +        }
>> +
>> +        if (block)
>> +            break;
>> +    }
>> +
>> +    if (!block)
>> +        return -ENOSPC;
>> +
>> +    while (drm_buddy_block_order(block) > order) {
>> +        unsigned int child_order = drm_buddy_block_order(block) - 1;
>> +        struct drm_buddy_block *left, *right;
>> +        int r;
>> +
>> +        r = split_block(mm, block);
>> +        if (r)
>> +            return r;
>> +
>> +        left  = block->left;
>> +        right = block->right;
>> +
>> +        if (child_order >= alignment)
>> +            block = right;
>> +        else
>> +            block = left;
>> +    }
>> +
>> +    mark_allocated(mm, block);
>> +    mm->avail -= drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +    kmemleak_update_trace(block);
>> +    list_add_tail(&block->link, blocks);
>> +
>> +    return 0;
>> +}
>> +
>>   static int __alloc_range(struct drm_buddy *mm,
>>                struct list_head *dfs,
>>                u64 start, u64 size,
>> @@ -1147,6 +1313,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           min_block_size = size;
>>       /* Align size value to min_block_size */
>>       } else if (!IS_ALIGNED(size, min_block_size)) {
>> +        if (min_block_size > size && is_power_of_2(size))
>> +            return drm_buddy_offset_aligned_allocation(mm, size,
>> +                                   min_block_size,
>> +                                   flags,
>> +                                   blocks);
>>           size = round_up(size, min_block_size);
>>       }
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index d7891d08f67a..da6a40fb4763 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -11,6 +11,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>>   #include <linux/rbtree.h>
>> +#include <linux/rbtree_augmented.h>
>>     #include <drm/drm_print.h>
>>   @@ -60,6 +61,8 @@ struct drm_buddy_block {
>>       };
>>         struct list_head tmp_link;
>> +
>> +    unsigned int subtree_max_alignment;
>>   };
>>     /* Order-zero must be at least SZ_4K */
>
