Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B5963C01
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D91210E49C;
	Thu, 29 Aug 2024 06:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Bk26Y6SL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2045.outbound.protection.outlook.com [40.107.215.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D361910E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8bvWQ1itq4lvILQnY1NxVle96CVjtljx9mw5HAYiPbSPqC18CQxRqGO97tVPhwQAag3f3NuttD2nWc/fI+bvS34NzdpggKt8mQUZzcxXF6io9dozK6+OlMNVuqET23FC0wbpktXW/YDHDwl7BMz90Eqiw2tg/2jiafgUw1q0+jV8wEQBAYQAdIf+ne7rS45GgJs/nvBCg7h/U2E/TyFK7JTGEKfWpLdXlrijecpZ7SGPT2M+LO6VweBcjOT35TwJRlAdsqTL24Uh7G25mbVrbfMmY2J3AGUsg9OLBtV7tE7k3S24EYwrmP0QoJbqSUEF7MFwGdSJZ3wCF0tqoTmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq8pgHwRXsDkM9hZbOXbUP3IXczsu9xRphpXR8VfiAs=;
 b=dVs1PxkeLrnDlqJ/ETTJ3Ohlji+o4HnPknB+55ClgHjiLAUGGOg2hbBMD+PTDgKPDUzYYhmHbFF0Sum1NNvZVE5QltVPfBZ7VhtqEWL1WfhcQu6qzALcSabCp528yHNtDtw3ts9fBj30Lw2tuMS5yf72CNm3YFZAOC/px5IZ6BzN5lWxsDUQ86aqje30Vzkj6F7/05TtcAdHjRF9v0eUMM6wBvUVsDJbWZTcvRhoGNzDKXhluiflaTaS53R9ZcIzOE3n5Es3hRjmz8PEzPFDpwf2gz9jw8TAf3U2O4/YPKFI17frEBBiomhF4BLjxwytbd3Nq05sl1tdWlSJCpCfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq8pgHwRXsDkM9hZbOXbUP3IXczsu9xRphpXR8VfiAs=;
 b=Bk26Y6SLnUujouUx+yMDC9QRlw3/dojZdBQkaCpH/pysP/Gj6gQyeKYyWIVkuBN5C7igFse4a9u5It2ZvQ1m7DXnSe5YWkS30mngH0AoFF/VgvZyXEJEGajCsNMFDJQypPTx/KGGk+GciKq/OAOt2mGK/quVwt9o01SoBYe70u6O2Nt8NmWilZGwaaI4ft2DtvjsZZaLHE2FMG9uAN5yh4IMh9OWVbunPdnsk6UFSHKrzKxkXM/adamtpeCLGSdfQe/TxjDqJvwVENKPY+aI4WZc2w3daj7+YULuHm3Bllp4qQwh9PzH7VSyBLfhIhv71+wRKEKi2DY13KeKzsfLFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SG2PR06MB5035.apcprd06.prod.outlook.com (2603:1096:4:1c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:52:47 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 06:52:47 +0000
Message-ID: <35daccb1-64ee-4af8-8b5f-340649ce0143@vivo.com>
Date: Thu, 29 Aug 2024 14:52:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-6-link@vivo.com>
 <IA0PR11MB718586A7B051D53490CF51B0F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718586A7B051D53490CF51B0F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SG2PR06MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: f7adc67b-6e67-4937-aa71-08dcc7f730f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnZTVzVPL0RmcW5wMU5rbkYveTROQUZmYis3MFoybmZLK3d5WWs0QUdUVldH?=
 =?utf-8?B?aW5IOUk1VkxkTEk4UG40aDdmTG40U0JYME14YW81dFpGcFlXWmVKNUozUUdV?=
 =?utf-8?B?b25Ic3VMZWpyZHNrcUpLbTY3SnQ5cXpnSmxpSmErUDdkaExRa1BHL1FTUFRw?=
 =?utf-8?B?TFhCSGJKVmRZYlc3c3hFdXpmZ3g0VkN4L1Q2VE0rMDhFYXZhWGZHUkpPZkxG?=
 =?utf-8?B?NjYvajBZUndWOTZGRnNkMjQxY201enQycktVQ0MxaTV6OXJsUHQ5Z0F1N3Jp?=
 =?utf-8?B?dVZPUmtmNlJIQncwMTJ6ejQ2WU1zb1QxVXhNUVBlQzBZWUx3czFFVkdMby9Y?=
 =?utf-8?B?Nk01S1pRSU9lOXdZL1lzbWZkdFBvWDIvY1JQb3RHTjJtUHFvYnJsclFXSzFU?=
 =?utf-8?B?cEVYZ0pWaWQwYWdyQkd4S29LT3R5ZEpObWMrRit1UDI4cmptL3JuZ1ZXU0g2?=
 =?utf-8?B?M0pOd0dzcVhSTVlLaTdIR2FpUzJHa0JEK2FUYUIrY0drWVR3bUc4NWUrc3ZM?=
 =?utf-8?B?MmNVMWFFRVUvSCsySWhncWJodXV4V3dUNnBhTFZSMmVyc2RvQ0RrdWlaajlN?=
 =?utf-8?B?MWM0UnBrZWZIV21HVlR3RVh3eDBSZVhvQ2NjQkNYR2ZxaVhQdXNZekxlc1BH?=
 =?utf-8?B?Qy8raFlCZUsvVkxMby9pQjRVWGhONXF2ZGE1M1l6Zy9uQy9OeHRMeUNwUEND?=
 =?utf-8?B?eU9zdStsZUlUNXlqVWlOVVFWVGgvSDRtTkhESG9PZUR3eWg0QU1nMUdaRE43?=
 =?utf-8?B?YXdlTWpEeVFBVlpuOEgzQVZGMG00SGkzZnlRRHZ3UmxETnJmUHJZR1VOUnR2?=
 =?utf-8?B?TFVEZlJWaHhMb04xcTRSN2ZEM2RtRTkySlNRVWRib2ZGZEh5YzVDVmJqemRt?=
 =?utf-8?B?c1hwZGJxWU1vL3FadXNpcW9oN005bVlmd1VLSUVEcFhMTHhGRVJpNHBUMmtl?=
 =?utf-8?B?cEZtcm41Mkx2WTkrTnN5dzBlQjYwK2xnbWQ1aEI5Z1FYdUZ4bzlSdTIveW9I?=
 =?utf-8?B?dGM3RnkrVThFUjcrdmwxNC8zeHpVWFFmZjl2cjFJQnc3KzZZRG1CNXE0R2Vl?=
 =?utf-8?B?Y01nZHdLYjZYdkxZbUtHSXhBaFRrT1RmWWZXVnhoRVNvMmllb3pSdVNlZzNM?=
 =?utf-8?B?dGRXNk1LeEFFbTkrWWZJWVNKaHFaTzZTNUpYWk05TnJINFo0SU1GMERyTHUw?=
 =?utf-8?B?WVpNc1BqRU9hUWtLSzFNdHN6bVE1d3NDaEdYMTAwNWZhcnJQeTlmKzF6V0Vz?=
 =?utf-8?B?bVRRTTUyRUdreTcxSFA4SC8zbmVFODNpeVhDL1N4TksreE56ZzJvaTh3T0E0?=
 =?utf-8?B?ai80Lzk1SnhaZXFYT0xTQ0kxc0xrM0JlNWU2WU00aGU5dE9DOHhtbGRHdmVB?=
 =?utf-8?B?N2ROeitod0pudkpvWEoydmZCKzNJanpBY1ZXS25wNE5aWWtycHg0aFRoSWJa?=
 =?utf-8?B?WVRWdE1mNEZDa2hLV2FMRU1UUHBpV1JsSlh0VXQwOUlrOGx6YkNkdWlQU1Q4?=
 =?utf-8?B?OSthNXlWZ3ZxdFRSTmI5dW5Kc0JqNUJraVJCS1RlTm83MmZvdmdJODhuZm5Z?=
 =?utf-8?B?WEJsWFdabDNmdEE1Wm5FTlhBdTRiVzFjaGRETTA5OHhWdGZMdnpoMmdhWG9i?=
 =?utf-8?B?bSsvR3VONTJYL1Y5V0drNHZ6V0hZSzhWajNxQ09udFFWTlJwalVlSzYzMERB?=
 =?utf-8?B?UGN3MWN2VHFwdmpmMDA3SElta1EyTFdXY1dUcjI2K0EyeXZtS0lFZ1RlNmVU?=
 =?utf-8?B?V3ExS09ZQm9TRFVmN1FudUxMVStWUEV6MFFoQkJxZ1RjNXlVc1IzU0NjdmM3?=
 =?utf-8?B?SG41UUxTYWxGSEtGZ1NuZ3hFaE1qL05WMFdlT2FiL3UvbEx4d2ZLYjVjSk5q?=
 =?utf-8?B?NnVQOTc1RVdBNEFWei9lRlMzTzcxcSs3WU5VYWkyU3NCMEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlNjSmpaVG8vVWVtWi9oc1NEajY5WkFwTlpQZ1RjNEVZSE9GSW4vUEdMT1RB?=
 =?utf-8?B?dWxKRFJvNnJIeG90RktiNXRublZiZkxlVFZnSG02ZkZwSW9lZS9aQjBRcGtY?=
 =?utf-8?B?YWNtN0pOcnBON1lnQXBmQzlVOS95OGdPcEtqQm15MnNORkx1bnF4L2xjR3Jv?=
 =?utf-8?B?ajNTUXI1azVZRDJvNHN2VC80cHdXODJOMEVBRmZuUDZXRUgvZG55MGlFMXFW?=
 =?utf-8?B?MlQzU0ZQb1JkY3NubEIycGNVTjBvWFZ5a3V1TTBKNVhXOWcvOTZ2ay9xVlhw?=
 =?utf-8?B?QkVVWjBKUm5qZUhqNmh3SUFBT1Q4NGowbjRZSFJTREdpQXRSZ3dwUUF1Lzlk?=
 =?utf-8?B?R2xtNFNoTklRa3g2N2twd25oQ3JNbVQrRTJzNzlRVGRRRStjbjJ3a1U4VS96?=
 =?utf-8?B?UmNDM0RlY2hpZTZ3VDlxUWEvNmhBcmR6bVVhYjZnTWJiUHFyd2ZiUjBRS093?=
 =?utf-8?B?TjhsbGttdnNmb3ZtL3FDSHNtTlVrQVg0ZTBwcjNZdSt1QjZNRVB2cVZiMGJw?=
 =?utf-8?B?L1M2cXVzQ2VrQjFxSFlSdG9FTkc3RTc0VWt1aVF6WXI5ckp0My9ETXlYQWRv?=
 =?utf-8?B?ZXh0ZTI4WGpFKzgzYWRyaXZMUzM2VmFFelgxaDFKTE1QcHB0K0VpelF1RG40?=
 =?utf-8?B?M0YvVjhuS1pCVVJjT2s2TUx1N1lMa0M3bnNhWFVnOWRsWkxxMndaYU1MUm9O?=
 =?utf-8?B?UGlhNnlkOUg3Ym5KblNidVZVRjdicEJXdVVIcXoxaHpWc2I4cFAwZStLQnB3?=
 =?utf-8?B?ekQ2T3UxMWpKaGkvMVRZWnNlRjRhT2l4NkZMTndvV1lKYTFQa2NTWStnbjZs?=
 =?utf-8?B?TURHVFRzVUVrMjZIbjNUdTZ5ZkhvanlsdVN4d3Y1Yy9wYU01VTlEckhYWi90?=
 =?utf-8?B?U0kzYXd6VzdESXJta09iOTZmaFVNK1Z5SkJZa1M3bU9jVHV2VTVKdFZkRWtk?=
 =?utf-8?B?emJ1V2QvM2k5UDBuM3VtQWNMeE9jQ01IMVZybk90ZERVMjVrTFoxWDZlbGhj?=
 =?utf-8?B?dHU4MmU2SDE3MXEybjFBUlNBeGdaaUFRdWhTMG41ZWgvakJZRmVjbUR1eTA2?=
 =?utf-8?B?RnowbG1SY2tnR2xQdGVFSjF5cHRGQjJsL3oranVhSjBPcXN2Q2FuUkhBSTgw?=
 =?utf-8?B?TitZVVBQbXgvYXdQcjhKMGNpalVUdXlhbnd6YXFVblF5YTU3bGpXNXR1TTdl?=
 =?utf-8?B?aFgrNXkvWGZLdkJuWVg3VUJseUtER0pQRmtSeTkvcUlMSWl2bzJFSnloSS9r?=
 =?utf-8?B?eVNKTGZ5U1F6YUxQWEVsek1uRXA4ZnBTelFNRlFtY1k3QVVrUElDNFo2S3Uy?=
 =?utf-8?B?bzllQ25vbnkxcXZrV09kdE42bXJteXkzQWFveW9DTHFIdWpSZkZxblVWUEpH?=
 =?utf-8?B?QVFRaCtkL05ySS9NeVl5aVBSWFN5MldMUzBYM0ZPZmlnK091eDQvdXJWQXBs?=
 =?utf-8?B?NlBlUlBObG9oRkxWSnc3Z0RZQ281OXFscWR3bzhzSGgxUjFKZW52azF6QWlO?=
 =?utf-8?B?cHI1MnNnbnRQWHFRc1Eyb1dVK201N3p2dFIwTE45bmZIbnpYcWJvRThPZWMx?=
 =?utf-8?B?SHhDRFV5MWlPNnlhb0RzdWhNTy96TkRLZVd5b0huWDhLSG14b0dmanAzQjdT?=
 =?utf-8?B?SkNwZDgxdEV2QmNtcS9kYnJjbFp1NS85Z0FsL1J2SWo1aE4xN1QreEw3bmRp?=
 =?utf-8?B?TWlwcWxEbFRnMzVjT1duWkxjSVZCU3kzSUFBMFpPTEcwNVMyS29vU25uWlJZ?=
 =?utf-8?B?YUdOTlE4TThVMkQyeXNIdVVyT0NGNnBuSHMyN2RUT1dxWEtZSzZtVWNMWXNR?=
 =?utf-8?B?azFySmRXUElhZm5BM0ZjeGUwMS94THQxS2xFaTRhWEpOM2x2bmN1Y01aczhK?=
 =?utf-8?B?R1dIcUxGZUU2Rm1kQTdveUZSa2ZSbWQ4YUxlcFIvYTA3QVJxek5TYlJubnZW?=
 =?utf-8?B?L3hpYlUyVE9WY1dHdUt1N01vZ0lkZkl4OUNnc2pMSGRma1YrWU1VcHYrOERQ?=
 =?utf-8?B?U3Zna29kcXlaWHFvQkp4ZVpzNnBUU0FkTTh1ZERPdUM5TDBUa05weTBSZ25F?=
 =?utf-8?B?dEtIWFgrdnNQUnVFcGhsZWNWMEk1WkNMa2V3cWNIRXJIMUdJYnNHcEZvV25F?=
 =?utf-8?Q?bF3Nkvioy2FgX0FAs5vTPg2Gy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7adc67b-6e67-4937-aa71-08dcc7f730f0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:52:47.3336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgDyKTwriqHjYyfIVh26i+AnjNcmmHid5jX97vpLoQYSshUX8uNV5H/XIQv7Aqqc2L9jiriOV3BAllCoMlX3Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5035
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


在 2024/8/29 14:47, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
>>
>> Currently, udmabuf handles folio by creating an unpin list to record
>> each folio obtained from the list and unpinning them when released. To
>> maintain this approach, many data structures have been established.
>>
>> However, maintaining this type of data structure requires a significant
>> amount of memory and traversing the list is a substantial overhead,
>> which is not friendly to the CPU cache.
>>
>> We actually don't need to use unpin_list to unpin during release.
>> Instead, just use a folios array record each folio is ok.
>> Compare udmabuf_folio 24 byte, folio array is 8 byte. Even if array need
>> to be pgcnt*8, may waste some memory when use large folio.
>> The access of array is faster than list, also, if 4K, array can also
>> save memory than list.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 80 ++++++++++++++++++---------------------
>>   1 file changed, 37 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index eb55bb4a5fcc..a45cec1f82b3 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
>> dmabuf, in megabytes. Default is
>>   struct udmabuf {
>>   	pgoff_t pagecount;
>>   	struct folio **folios;
>> +
>> +	/**
>> +	 * Unlike folios, pinned_folios is only used for unpin.
>> +	 * So, nr_pinned is not the same to pagecount, the pinned_folios
>> +	 * only set each folio which already pinned when udmabuf_create.
>> +	 * Note that, since a folio may be pinned multiple times, each folio
>> +	 * can be added to pinned_folios multiple times, depending on how
>> many
>> +	 * times the folio has been pinned when create.
>> +	 */
>> +	pgoff_t nr_pinned;
>> +	struct folio **pinned_folios;
>> +
>>   	struct sg_table *sg;
>>   	struct miscdevice *device;
>>   	pgoff_t *offsets;
>> -	struct list_head unpin_list;
>> -};
>> -
>> -struct udmabuf_folio {
>> -	struct folio *folio;
>> -	struct list_head list;
>>   };
>>
>>   static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> @@ -189,32 +195,12 @@ static void unmap_udmabuf(struct
>> dma_buf_attachment *at,
>>   	return put_sg_table(at->dev, sg, direction);
>>   }
>>
>> -static void unpin_all_folios(struct list_head *unpin_list)
>> -{
>> -	struct udmabuf_folio *ubuf_folio;
>> -
>> -	while (!list_empty(unpin_list)) {
>> -		ubuf_folio = list_first_entry(unpin_list,
>> -					      struct udmabuf_folio, list);
>> -		unpin_folio(ubuf_folio->folio);
>> -
>> -		list_del(&ubuf_folio->list);
>> -		kfree(ubuf_folio);
>> -	}
>> -}
>> -
>> -static int add_to_unpin_list(struct list_head *unpin_list,
>> -			     struct folio *folio)
>> +static __always_inline void unpin_all_folios(struct udmabuf *ubuf)
>>   {
>> -	struct udmabuf_folio *ubuf_folio;
>> -
>> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
>> -	if (!ubuf_folio)
>> -		return -ENOMEM;
>> +	pgoff_t i;
>>
>> -	ubuf_folio->folio = folio;
>> -	list_add_tail(&ubuf_folio->list, unpin_list);
>> -	return 0;
>> +	for (i = 0; i < ubuf->nr_pinned; ++i)
>> +		unpin_folio(ubuf->pinned_folios[i]);
>>   }
>>
>>   static void release_udmabuf(struct dma_buf *buf)
>> @@ -225,7 +211,8 @@ static void release_udmabuf(struct dma_buf *buf)
>>   	if (ubuf->sg)
>>   		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>
>> -	unpin_all_folios(&ubuf->unpin_list);
>> +	unpin_all_folios(ubuf);
>> +	kvfree(ubuf->pinned_folios);
> Move the kvfree() of pinned_folios into unpin_all_folios().
>
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   	kfree(ubuf);
>> @@ -326,9 +313,9 @@ static int __udmabuf_pin_list_folios(struct
>> udmabuf_create_item *item,
>>   				     struct folio **folios)
>>   {
>>   	struct file *memfd = NULL;
>> -	pgoff_t pgoff, ipgcnt, upgcnt = ubuf->pagecount;
>> +	pgoff_t pgoff, ipgcnt, upgcnt, nr_pinned;
>>   	u32 cur_folio, cur_pgcnt;
>> -	struct folio **ubuf_folios;
>> +	struct folio **ubuf_folios, **pinned_folios;
>>   	pgoff_t *ubuf_offsets;
>>   	long nr_folios;
>>   	loff_t end, start;
>> @@ -351,22 +338,21 @@ static int __udmabuf_pin_list_folios(struct
>> udmabuf_create_item *item,
>>   	}
>>
>>   	cur_pgcnt = 0;
>> +	nr_pinned = ubuf->nr_pinned;
>> +	upgcnt = ubuf->pagecount;
>>   	ubuf_folios = ubuf->folios;
>>   	ubuf_offsets = ubuf->offsets;
>> +	pinned_folios = ubuf->pinned_folios;
>>
>>   	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>>   		pgoff_t subpgoff = pgoff;
>>   		long fsize = folio_size(folios[cur_folio]);
>>
>> -		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>> -		if (ret < 0) {
>> -			kfree(folios);
>> -			goto err;
>> -		}
>> +		pinned_folios[nr_pinned++] = folios[cur_folio];
>>
>>   		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>> -			ubuf->folios[upgcnt] = folios[cur_folio];
>> -			ubuf->offsets[upgcnt] = subpgoff;
>> +			ubuf_folios[upgcnt] = folios[cur_folio];
>> +			ubuf_offsets[upgcnt] = subpgoff;
> These are unrelated changes that should belong to the previous patch. I
> suggest moving this patch before the codestyle cleanup patch.
Yes, sorry for this.
>
> Thanks,
> Vivek
>
>>   			++upgcnt;
>>
>>   			if (++cur_pgcnt >= ipgcnt)
>> @@ -381,12 +367,12 @@ static int __udmabuf_pin_list_folios(struct
>> udmabuf_create_item *item,
>>   	}
>>   end:
>>   	ubuf->pagecount = upgcnt;
>> +	ubuf->nr_pinned = nr_pinned;
>>   	fput(memfd);
>>
>>   	return 0;
>>
>>   err:
>> -	ubuf->pagecount = upgcnt;
>>   	if (memfd)
>>   		fput(memfd);
>>
>> @@ -407,7 +393,6 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	if (!ubuf)
>>   		return -ENOMEM;
>>
>> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>>   		pgoff_t itempgcnt;
>> @@ -442,6 +427,14 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   		goto err;
>>   	}
>>
>> +	ubuf->pinned_folios = kvmalloc_array(pgcnt,
>> +					     sizeof(*ubuf->pinned_folios),
>> +					     GFP_KERNEL);
>> +	if (!ubuf->pinned_folios) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>>   	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
>>   	if (!folios) {
>>   		ret = -ENOMEM;
>> @@ -463,8 +456,9 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	return ret;
>>
>>   err:
>> -	unpin_all_folios(&ubuf->unpin_list);
>> +	unpin_all_folios(ubuf);
>>   	kvfree(folios);
>> +	kvfree(ubuf->pinned_folios);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   	kfree(ubuf);
>> --
>> 2.45.2
