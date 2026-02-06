Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MGUM1kIhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:27:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5083DFFBA1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C010E803;
	Fri,  6 Feb 2026 15:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rymowZSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013060.outbound.protection.outlook.com
 [40.107.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A9710E7FF;
 Fri,  6 Feb 2026 15:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCLzqbJf/UgAwfn+lNXr/I9LgtNMKW3I6u5CWtt0PlYlKoZrrgz+nUz3Qg4uZuoWF1NgLSWsJEEZhwSmSVBLh5priuUiZbNy/jsx9GXiy7c3/HOqZ/kS1lFgYCxImu0XAWKOEKV5FRLdst8pBjeGcOoS0zffyAD74FFg1lsevmf17MbeJ7JkpqUUADczGkq9OkSuzmBw+/hrmH6espGzDLpe+lzVu6GSeLBTY44iHDaHfsHZUZ9xYAsgyA57y5EDLihd9meqWUgGyNClTiCracIPzIKY1xtsJcpErrTt1UAIt2/B9hT9MrhF/pMHE/zZeEjng9DRF8kAdSnG6ogybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PdVaOJcBJJIm9ULsH2uzWTrmKqKPL1NU8rknzL7Ufo=;
 b=K7aJCXSN8q3RZpzGyl6BtypY9tIi2XRF/aPdoKPlzqxUzbp+6yfMKBdCEG9C5WmFx0mw20jmTsVRN7Bh8gyhHgM6Hw6inWiycEiz2nvjA0RrPNgS3u+P6EUH+lWb2cBWx9lg7xWzwodTJx3mR/zl7J/PKIHyiwJoMUlIzxO34td+AN+hYEnLxmH0jsj4U83zQtmKWiPBXtfwz/D71ZEPGBHQxQwPIfcBOF7RYu4Rbbr8vGue+EC/bniGUbCSp6Rh3QDg3ShBnY/sn7izjH1tgI9TIodT6lJXtuGatwtftMlb3VB0DJ2cffwGd+e8qwczABWbwV9/9xsxxMA+tEiSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PdVaOJcBJJIm9ULsH2uzWTrmKqKPL1NU8rknzL7Ufo=;
 b=rymowZSt6FjZ1g+CczK/P3aKpDPn3Ym567opVb7cHCkPTXQrudRagg/U86Kb4e9vUtfbkfdMURSw0LbMv6pwQczbILxMxFl+UwW3EVtEnEm4mHiGDvFHjsrFPdulqBJPcD2g04MUCWX3ODEbMkai80X22Kua07jNpfbVF6UXcyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 15:27:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 15:27:14 +0000
Message-ID: <bcd0aa16-c504-450a-a3f5-d10c7d08e4f8@amd.com>
Date: Fri, 6 Feb 2026 16:27:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
 <93f01b083861f180838f662fc81a74b14dd17fca.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <93f01b083861f180838f662fc81a74b14dd17fca.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:408:f6::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ee87e4-4a51-42cf-8ede-08de65943421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3hNaU5WdFludDUzeHhXWTg3YXE4YzE3eklZblZna0hNcmQ3dzZDcmZJb3JD?=
 =?utf-8?B?dDNtM0lNZkJxNG1NYXM2OXNzU2tMWENKbUhLTnVKdmxVeW92R3FaUWlqaVRj?=
 =?utf-8?B?RVdrYnJqMElLc2V3Smdsd1l3OFFvbFFmWklXdjA0TG9tRmp4NG83cUVIUk1z?=
 =?utf-8?B?VEtqOG9acjNzbTR6cUl5b3Z0TDlQTXJZN1V1bU1WWndGbmZsSFlhZ281NU16?=
 =?utf-8?B?RlZobE5yVVV4c3BxdXQyYXVuajdEY0VIaVR2bXh5cUZGRGUyWFJLQ3h1ZWdG?=
 =?utf-8?B?WlJwdnVRQS9OeW0xQ0RXNjJzam5FKzYvcGVpVkxaVTFLb2g3MkpoRXZrL2dR?=
 =?utf-8?B?dk9zWm5WeDQvM1BPaVl0SjBVbmFqK0psK2pTaklEVHZmK1oyWHFhWm1GcTd1?=
 =?utf-8?B?MG9NYlg2QnhMNkhGY0REZWFXUHVROTJPeUJUcFc3cFBZVXhXZlpKU1JuemVy?=
 =?utf-8?B?blY1ZFBiaFdxQTNzRnVDc0s0S3J6UWtwM1hKVVBrTVpDalBWZ3B4K0x5ZFMw?=
 =?utf-8?B?VkYrM012TDVqM3FkVTZVdmxYMWdjaGZLMTErQzY1d3VGVlpsRFpoalBQaHBt?=
 =?utf-8?B?QjB6elliMSs5a0pmL21OTGdSYmxKdzZ0ZnoyemNtTENUS0hnTDVCY1hRbmlr?=
 =?utf-8?B?eHZYZEt3SXBQenRMZ3AweHFGcFZhYXNOR2ozMUdpT1FqKzl6WHhOUzFDTzhn?=
 =?utf-8?B?THQwOFlaOVlvSmdvRk92U0cvWUVnd1piNkFseE95dUpvVnBobDNFMUxKc1Vh?=
 =?utf-8?B?dzY4Ym0xVWVpaG8rT1NUWXhYUkFiRWt6Q3RWRHpTdTE5TndHRWRiS0xVZW9D?=
 =?utf-8?B?UHFDT3FNTFhLbDl0eGpKUlUzZEF4aTBvR016RWdkeitFUVNLM2N3M2w1YW5W?=
 =?utf-8?B?dHJvSzZmNVpxVy8wYUtYV3krN0orajdSakR6ZlYwVFZGb1Z5MkF1dmVrNmZZ?=
 =?utf-8?B?S0gxenlCU04yU1VEb2xDK1FYbWtpTjgvdFZ6NkRCRVVoTGowUGNGLzMxQTVC?=
 =?utf-8?B?OEZnbWFKZlAxOGY3UEtCUjdoM0taS3dDYXFQcU5vWXhCbEFvbE1GUFoyeWRt?=
 =?utf-8?B?bEh1amc2aVpYWm8vcFEyNHZtNld2LzhndVdVZEQ0YXdvVmJFZG41aFFjSlBJ?=
 =?utf-8?B?dGJQdzcxZ1EvYkFVejdHNTRYSkZ1UDJkNUcrL3Z2bmxmY0ZLdkFjNVZHV04v?=
 =?utf-8?B?K0VuaFJ0ZWlQeWFlZ0xxbTNEZDhvYlRUMVNvVWk4aVRkMDA1S1REaGxjSEtn?=
 =?utf-8?B?SFQ5Y1pVSlBEaFlUNEsyd2lBZ0h5ZFVGVGF6aWRHZnVSekMwLzhtbW9yOE12?=
 =?utf-8?B?TUtwYUFHWTBSNGdpbklIRThkVjVYcUxPWHJnc0JENlY5SXlYSUVkdU13aVdk?=
 =?utf-8?B?Tm1oTjZSdUlNR2Q4WTFCZU1pbXVBYXN1ODBmTWwzUVpvdW1IYUZhS3JHSnlj?=
 =?utf-8?B?ZUk4ZU9JZk0zUDMyMElEdm56SS80UExUY0MrendJV3hJamF2YUlMT0V0eTQ3?=
 =?utf-8?B?dWZ2ZWsyVENhYWZPcWExcE1XSVlmaVVvNWRsUktyUk9YUzRjSFpTckJrRWQr?=
 =?utf-8?B?Uzh6ME54OHM4MlRRRktXa2c4aFdKMlpHb3VMb0tkUWJMSnpoYWVMcVQ2R2ht?=
 =?utf-8?B?NzNQbUN3dXNtRnFVNXNINW9JWlVwNU56TUxkRzdtOWVYZG1iOWFpdTFabWFq?=
 =?utf-8?B?UUVXWnpneCtlVkVUWS90M3JKL1c0Q1FGd0tWcGNoTFRWMElUbEYwcG5zUk9F?=
 =?utf-8?B?STZwRW9IbUVteUJkZlJ4YkU2ZG5IUlhtcGUwYTI0ckF6d1JWdUdCU1FaczBM?=
 =?utf-8?B?VzRIRTJHcHM2Q3laODhjT1Ayam5rQ05PY3NjZjBTbmtsVW0wbmtGN0o0UmZN?=
 =?utf-8?B?dlppL1QzbkFFYUEwblNpZHNodnVydmNDN2txeklxTy9sa3MzeGpOV01ocGtQ?=
 =?utf-8?B?dWRBcFpPQjdjYzFtZGZjcFdlZ2VJU2ZCSGhOazRVVVdITE8vRGFtdHpBQnhI?=
 =?utf-8?B?M1JhajFGRmtaVEUzeUFqVnBsNUhxa0RxaEhVNVM5cWFyZGxUbHp0dG1CME0v?=
 =?utf-8?B?OE9JejAzWmhUK0R1TkRXZDE4KzNPUkxiS3hyYVJxdHIxbitJRlJLWHpnQUhK?=
 =?utf-8?Q?Wa7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUVBenNhK1VoZ0N6dCsyYVhtQzlBRWZJNFJkWWZ1TS9URVVtTmlmc1lTUWVL?=
 =?utf-8?B?YWZlcHhoUnJyczIwam9Wb09xdXI3dExnQURVZzVnM1V1RzFqTVdMcXptRGdi?=
 =?utf-8?B?UWVEYVQ3bHZBeCt1elNXS0p6ZHZkaklpWnR5ejkzaFBRbTBxcmJyamtYYkFX?=
 =?utf-8?B?WmF3MGFRMUMvMEV3TFR2MDYxQm8wTzRONTkzZzM5Njk0QWtUU1pIblFJOWpi?=
 =?utf-8?B?T21QTVozVXhxUzJmemF1aHhyOWVSZUd1UGdsUzFOYU5lZzFQaW4xWWxvVjZn?=
 =?utf-8?B?d0F4cGp2eVAwd0tpa2d6K3Q0ZnpzUFY4WENJY2RpeTZyM25YRUNHVUZFRG1S?=
 =?utf-8?B?dFdrTEJvWjNxZjArd2RNd29TSUVmeERMS01TZURyK05uM1plSldQV2ZzVXo3?=
 =?utf-8?B?Q29ubGFxNU8rZm9SRVgvKzh6SE10VVplcWo4ZDhQRGlJeGhCYkhzcEtiREhT?=
 =?utf-8?B?NXlLcWJxRGhRVi8zSDBCTnkwTzN1WjdxMGR1eGNZUjdtbVVlR1ZmaDA0RHZ2?=
 =?utf-8?B?ODZZbDY2aGpTb0ZoVW16SzQ1cHhRR29zWjRBSDRxaEYyY1hCSmQ2cEpXOTFZ?=
 =?utf-8?B?TVlmeFhWb1lKanFFVzl5ODZNYXFuVzJNcm9RTUNjY296VUlQSEVjc0VXZnY2?=
 =?utf-8?B?MnpsME9WL1h0YVlYRkoxVlpCNnBsbEVUdzcwaFFMRDBieXdhdFppQTQ5VzJo?=
 =?utf-8?B?am1RSnZIVmR2OTBhaGxoRVZLNlhDNlFBdU1MNk8zdS9PQS9qdWRhVHZBQVVa?=
 =?utf-8?B?Rm1hMFFOWW9DU2I0Z1J4dTlUdjV2LzMrZlBhOExjaE9CaWU5VENyTXFaYkR6?=
 =?utf-8?B?OENqNDRvTGlCVVpJTEpsSHM2eGRQelZhb3lPbzEzSmxvblVFUnlTb215dk55?=
 =?utf-8?B?aTVVQlpVdkEwVlJHTjV4Q3oxc1h1ZUREQTZEeHF2Yk5ReGQ3R2YveFErZyts?=
 =?utf-8?B?YU9tcE9EUHE3c0hBMEE0TlUzOThic0ZFZmRibXpuTzR1bHpCNUs2bzZQbGZZ?=
 =?utf-8?B?TWJtcUlNcW4xU0Y5bW1GcnZVK2FuYU9FVitOanVCbzk0d01hYVQxbWtvOVFN?=
 =?utf-8?B?RmN6dW9TaTlkdzc5aHlEa1NNM0pwRDJUYmJNUUxZaVdpeGdGQ0RFSlUxb0Vw?=
 =?utf-8?B?TXZjamFFUzVlU3ZQSFhJOUs2NEdrSUk3ZzAvSzR6NjVUQzZ1M3ZVVi94UDRG?=
 =?utf-8?B?NVcxUnczR0N6WlNiYmcwN05odnJMOHJ1N3FnaFBuNnJSUGkxWXVQK3ROVTZ1?=
 =?utf-8?B?Z0UwNExMSWJuanhUc3hwN3ZteXlsSElGK0wxQUMzalJJNkM2RUJ4N3RkSVNV?=
 =?utf-8?B?NmcydWJUS2c1b1IwUWt6dkxFT1pnaWh2cnVsV0ZBY25uY2ZkQXFrTitCeUhR?=
 =?utf-8?B?UU5Ca3RQWTM2T0Z5N0N0dTdEcjlGSEhxUWZVa2VlNWtBcy9nNno4WWpGdGgv?=
 =?utf-8?B?QVJhZUZVcmQrZklZLzhNTzlTcXNkdC83Vzd4RTNJVFJPdkp3Zld5ZlhuOE05?=
 =?utf-8?B?dWFoL1FTelRpSll1K01oMzdGekNRM0ptOHZaY1UrYXU1UnFHemZOeDlJOFVm?=
 =?utf-8?B?TFZweWZFN1JLSTVLbG41MUJJQzVXcG43SzJVaWZicTZiaFZoRk9kVno3dzdM?=
 =?utf-8?B?MGhwM0JmTEtwOFJkNFIxS2wrZm95Mnc4UGxJeVRycHovb1BSTHYra3A0TzQz?=
 =?utf-8?B?dmxjdFE2azYyTnFUNmYxbkpXd1FoTlN5dzNMVTdxVWtaMFNTUTA3anVob0Zx?=
 =?utf-8?B?Y0YyK0IzbGg5OVBQZFpldGs0enR1N2tULzdNU2F1ZlZjcy9HUlpGaHdlSHpm?=
 =?utf-8?B?em1YN2h5SzR5VGpvWmEya3JXRkp2NU14RksyQmVsNWxucXl3OCs1UVlqcis3?=
 =?utf-8?B?YkdZWWRpZ0NoVFZucXVoNXJ3S0hDQXZhWEdjMmg0dHhGOTZ4ZmZRSjdJczhw?=
 =?utf-8?B?c2NudkZYd2pIM1A4TnBDZ245dUcwMTJsSWhUZkN6Njg0YWpxN2FSWGtTbWtT?=
 =?utf-8?B?aFpEaTlnNGlNU1BIL0FLSitMVExnVkNvMURELzhVVmxTQktlL2JvdkY4RGpz?=
 =?utf-8?B?UEhRdjJBcFl2WEJLS292c1RVaC9FNzFJK3FDZmwwOEFzbWRiUUpQVk5Jbkh4?=
 =?utf-8?B?MUdacXQ5d1ZTbEMrR0o4djlyTVdPZnZVSVJGZTdmOEphUzU1Nnd2V2tTdjZU?=
 =?utf-8?B?QzZmYVNsS3c4WEpkbkNuSlFYQTFzRWNUaFBDN2kzeVdleisrdEFMTHRJTVhL?=
 =?utf-8?B?dnE5czFCZ29YQ0lSSXlNU3FDai95TVFValRWNERvenVUYjczaGxjMmsrTzlV?=
 =?utf-8?Q?XLObmSB+hP3ox59zLe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ee87e4-4a51-42cf-8ede-08de65943421
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:27:14.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2vEr4pflSNFzvCaEJxr/4t/XRZ2jFLcYrFlCyS7Y1u8v+Ftg3bW3pdQ1n20u00r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,intel.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 5083DFFBA1
X-Rspamd-Action: no action

On 2/6/26 13:34, Thomas Hellström wrote:
> + dri-devel, Christian
> 
> On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
>> drm_suballoc_new() currently both allocates the SA object using
>> kmalloc()
>> and searches for a suitable hole in the sub-allocator for the
>> requested
>> size. Since kmalloc() may take internal locks, performing memory
>> allocation while holding the sub-allocator mutex can trigger lockdep
>> deadlock warnings.
> 
> ... As Matt mentioned, This is to be able to suballocate under a
> reclaim-tainted lock: Allocation can be done outside the lock, and init
> inside the lock.
> 
>>
>> Fix this by splitting SA allocation from drm_suballoc_new(),
>> separating
>> object allocation from sub-allocator initialization and hole
>> selection.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> This must be CC'd dri-devel as well and AMD maintainers.
> 
> Below is in addition to MBrost's comments.
> 
>>
>> ---
>> V1 -> V2:
>> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
>> drm_suballoc_init() (Thomas).
>> ---
>>  drivers/gpu/drm/drm_suballoc.c | 135 +++++++++++++++++++++++++------
>> --
>>  include/drm/drm_suballoc.h     |   8 ++
>>  2 files changed, 112 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_suballoc.c
>> b/drivers/gpu/drm/drm_suballoc.c
>> index 879ea33dbbc4..6f21f9e048d6 100644
>> --- a/drivers/gpu/drm/drm_suballoc.c
>> +++ b/drivers/gpu/drm/drm_suballoc.c
>> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct
>> drm_suballoc *sa)
>>  	list_del_init(&sa->olist);
>>  	list_del_init(&sa->flist);
>>  	dma_fence_put(sa->fence);
>> -	kfree(sa);
>> +	drm_suballoc_release(sa);
>>  }
>>  
>>  static void drm_suballoc_try_free(struct drm_suballoc_manager
>> *sa_manager)
>> @@ -293,45 +293,75 @@ static bool drm_suballoc_next_hole(struct
>> drm_suballoc_manager *sa_manager,
>>  }
>>  
>>  /**
>> - * drm_suballoc_new() - Make a suballocation.
>> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
>> + * @gfp: gfp flags used for memory allocation.
>> + *
>> + * Allocate memory for an uninitialized suballoc object. Intended
>> usage is
>> + * allocate memory for suballoc object outside of a reclaim tainted
>> context
>> + * and then be initialized at a later time in a reclaim tainted
>> context.
>> + *
>> + * @drm_suballoc_release should be used to release the memory if
>> returned
>> + * suballoc object is in uninitialized state.
>> + *
>> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-
>> ENOMEM).
>> + */
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
>> +{
>> +	struct drm_suballoc *sa;
>> +
>> +	sa = kmalloc(sizeof(*sa), gfp);
>> +	if (!sa)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	return sa;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_alloc);
>> +
>> +/**
>> + * drm_suballoc_release() - Release memory for suballocation.
>> + * @sa: The struct drm_suballoc.
>> + */
>> +void drm_suballoc_release(struct drm_suballoc *sa)
>> +{
>> +	kfree(sa);
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_release);
>> +
>> +/**
>> + * drm_suballoc_init() - Initialize a suballocation.
>>   * @sa_manager: pointer to the sa_manager
>> + * @sa: The struct drm_suballoc.
>>   * @size: number of bytes we want to suballocate.
>> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
>> but
>> - *       the argument is provided for suballocations from reclaim
>> context or
>> - *       where the caller wants to avoid pipelining rather than wait
>> for
>> - *       reclaim.
>>   * @intr: Whether to perform waits interruptible. This should
>> typically
>>   *        always be true, unless the caller needs to propagate a
>>   *        non-interruptible context from above layers.
>>   * @align: Alignment. Must not exceed the default manager alignment.
>>   *         If @align is zero, then the manager alignment is used.
>> + * @timeout: Time to a wait suballocation to become available.
> 
> I think we should split out the timeout to a separate patch, since that
> is not really related to the problem of the lockdep splat, and it would
> require a separate motivation, since typically the CTRL-C in
> combination with fence timeouts are sufficient. We need to explain why
> that's not the case for this particuar use-case.

Yeah, agree completely.

Timeouts need to have a justification, either because userspace said it wants to wait only that long for something to happen or because some HW specification says an operation can only take a specific amount of time.

Otherwise timeouts have the strong potential of being abused to solve deadlocks which is clearly not allowed upstream.

> 
> Also that would make the -fixes patches for the reclaim lockdep splat
> smaller.

Agree as well, skimmed only over it but it looks pretty good of hand.

Regards,
Christian.

> 
> 
> Otherwise LGTM.
> Thomas
> 
> 
>>   *
>> - * Try to make a suballocation of size @size, which will be rounded
>> - * up to the alignment specified in specified in
>> drm_suballoc_manager_init().
>> + * Try to make a suballocation on a pre-allocated suballoc object of
>> size @size,
>> + * which will be rounded up to the alignment specified in specified
>> in
>> + * drm_suballoc_manager_init().
>>   *
>> - * Return: a new suballocated bo, or an ERR_PTR.
>> + * Return: zero on success, errno on failure.
>>   */
>> -struct drm_suballoc *
>> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>> -		 gfp_t gfp, bool intr, size_t align)
>> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
>> +		      struct drm_suballoc *sa, size_t size,
>> +		      bool intr, size_t align, signed long timeout)
>>  {
>>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int count;
>>  	int i, r;
>> -	struct drm_suballoc *sa;
>>  
>>  	if (WARN_ON_ONCE(align > sa_manager->align))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  
>>  	if (!align)
>>  		align = sa_manager->align;
>>  
>> -	sa = kmalloc(sizeof(*sa), gfp);
>> -	if (!sa)
>> -		return ERR_PTR(-ENOMEM);
>>  	sa->manager = sa_manager;
>>  	sa->fence = NULL;
>>  	INIT_LIST_HEAD(&sa->olist);
>> @@ -339,6 +369,8 @@ drm_suballoc_new(struct drm_suballoc_manager
>> *sa_manager, size_t size,
>>  
>>  	spin_lock(&sa_manager->wq.lock);
>>  	do {
>> +		long t;
>> +
>>  		for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
>>  			tries[i] = 0;
>>  
>> @@ -348,7 +380,7 @@ drm_suballoc_new(struct drm_suballoc_manager
>> *sa_manager, size_t size,
>>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>>  						   size, align)) {
>>  				spin_unlock(&sa_manager->wq.lock);
>> -				return sa;
>> +				return 0;
>>  			}
>>  
>>  			/* see if we can skip over some allocations
>> */
>> @@ -359,34 +391,75 @@ drm_suballoc_new(struct drm_suballoc_manager
>> *sa_manager, size_t size,
>>  				fences[count++] =
>> dma_fence_get(fences[i]);
>>  
>>  		if (count) {
>> -			long t;
>> -
>>  			spin_unlock(&sa_manager->wq.lock);
>>  			t = dma_fence_wait_any_timeout(fences,
>> count, intr,
>> -						      
>> MAX_SCHEDULE_TIMEOUT,
>> -						       NULL);
>> +						       timeout,
>> NULL);
>>  			for (i = 0; i < count; ++i)
>>  				dma_fence_put(fences[i]);
>>  
>> -			r = (t > 0) ? 0 : t;
>>  			spin_lock(&sa_manager->wq.lock);
>>  		} else if (intr) {
>> +			spin_unlock(&sa_manager->wq.lock);
>>  			/* if we have nothing to wait for block */
>> -			r = wait_event_interruptible_locked
>> +			r = wait_event_interruptible_timeout
>>  				(sa_manager->wq,
>> -				 __drm_suballoc_event(sa_manager,
>> size, align));
>> +				 __drm_suballoc_event(sa_manager,
>> size, align),
>> +				 timeout);
>> +			spin_lock(&sa_manager->wq.lock);
>>  		} else {
>>  			spin_unlock(&sa_manager->wq.lock);
>> -			wait_event(sa_manager->wq,
>> -				   drm_suballoc_event(sa_manager,
>> size, align));
>> -			r = 0;
>> +			t = wait_event_timeout
>> +				(sa_manager->wq,
>> +				 drm_suballoc_event(sa_manager,
>> size, align),
>> +				 timeout);
>>  			spin_lock(&sa_manager->wq.lock);
>>  		}
>> +		r = (t > 0) ? 0 : !r ? -ETIME : t;
>>  	} while (!r);
>>  
>>  	spin_unlock(&sa_manager->wq.lock);
>> -	kfree(sa);
>> -	return ERR_PTR(r);
>> +	return r;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_init);
>> +
>> +/**
>> + * drm_suballoc_new() - Make a suballocation.
>> + * @sa_manager: pointer to the sa_manager
>> + * @size: number of bytes we want to suballocate.
>> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
>> but
>> + *       the argument is provided for suballocations from reclaim
>> context or
>> + *       where the caller wants to avoid pipelining rather than wait
>> for
>> + *       reclaim.
>> + * @intr: Whether to perform waits interruptible. This should
>> typically
>> + *        always be true, unless the caller needs to propagate a
>> + *        non-interruptible context from above layers.
>> + * @align: Alignment. Must not exceed the default manager alignment.
>> + *         If @align is zero, then the manager alignment is used.
>> + *
>> + * Try to make a suballocation of size @size, which will be rounded
>> + * up to the alignment specified in specified in
>> drm_suballoc_manager_init().
>> + *
>> + * Return: a new suballocated bo, or an ERR_PTR.
>> + */
>> +struct drm_suballoc *
>> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>> +		 gfp_t gfp, bool intr, size_t align)
>> +{
>> +	struct drm_suballoc *sa;
>> +	int err;
>> +
>> +	sa = drm_suballoc_alloc(gfp);
>> +	if (IS_ERR(sa))
>> +		return sa;
>> +
>> +	err = drm_suballoc_init(sa_manager, sa, size, intr, align,
>> +				MAX_SCHEDULE_TIMEOUT);
>> +	if (err) {
>> +		drm_suballoc_release(sa);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return sa;
>>  }
>>  EXPORT_SYMBOL(drm_suballoc_new);
>>  
>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>> index 7ba72a81a808..cff0e14556d1 100644
>> --- a/include/drm/drm_suballoc.h
>> +++ b/include/drm/drm_suballoc.h
>> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct
>> drm_suballoc_manager *sa_manager,
>>  
>>  void drm_suballoc_manager_fini(struct drm_suballoc_manager
>> *sa_manager);
>>  
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
>> +
>> +void drm_suballoc_release(struct drm_suballoc *sa);
>> +
>> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
>> +		      struct drm_suballoc *sa, size_t size, bool
>> intr,
>> +		      size_t align, signed long timeout);
>> +
>>  struct drm_suballoc *
>>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>>  		 gfp_t gfp, bool intr, size_t align);

