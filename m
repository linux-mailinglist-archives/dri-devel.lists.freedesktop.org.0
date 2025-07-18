Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E640B09C7A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D374410E913;
	Fri, 18 Jul 2025 07:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TtHHaTOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6BB10E906;
 Fri, 18 Jul 2025 07:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YasxPH867yYNIuuAX4SkwU3XkdZv+Q3tWoW3uoZmef0w1usBphTchjRE7QkbWiphZaQSm9Z1Ij5p0KoHgnItOTf7lUkreRoH5EhqBR741REC67hDMEa3ulhZO9cVueXKOyz8i/oQoz8m8nVEaMSb28nBRm30pSHGDbqV+uzH3aO+glyAfuDiYPvdCise26i4Lu88Pf69jt5Xg9NDuis/NSuE5sfibTbTy3Xu/RA/XryTpf5aOzJXAmCjyXw0TWhPmmTIFNKpJqtgqVqQi2tX6fL58Cmx236epAAZ46BRVZb1YBrA/LstX8w4Fd5dwlij5sn111D4cokluNPXefVLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5SekYasKXIP/bm55RRXBufjryWYoXADEdWucWl4oLc=;
 b=n93twTSZfXJJFIyNWCUaVOcC283grBxGR93ksHWiYVe8vD3Wxn558OAE93oB1ljelPLPpfj9NcEzQY1BKdfDlyKP3broXVsiGuu6RSqKL8WHlQvjPqswbpURunM04UayWnQ69wYmS6T5WSt1MfzeB9/HmGfJQIvEMfq+IojBrjiT2qNUPQy461CX2kk6J1kfVgYyRh54y32DNT9z3EIZzMLd4iWen50DG7WZyjJNQTqlmfbQDF+v/EDYE+xsvIb4opfRSilTG057XgM+YVqczN9GNsehIo7Bnv56l8t+7bRf+Dh/Mo9TpjtYF5ndd3abYs7yKCyIUtq5ydGdXWiHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5SekYasKXIP/bm55RRXBufjryWYoXADEdWucWl4oLc=;
 b=TtHHaTOK2QKB6j0jVG7Bjx+fygbKDrTz/nHOOMTZQwtAoStz4iWN3oXxN7UZCAZdxuhPl9JLYxnxCTpgBrcntWZ497TTbrk/eaJkSCLjBrRvs2addbLiYw4eS5KSGbVNjI055ButnJZw3B5iBPJcmbx0N8lvP6SUVzguA/1V33CYshJmkYCgpiwZ2fCaeYmJbQ2/ofm4NVjDR2vNv+9DoPj1vrPO+NOObn+3sn+6y2LF281SGZja/Q3Y3nPi2RuE1Ki1OcSxBTsB3BE0GRwmq+AaDTJXyCRzgOpEmtLR/boN2JKGUovTB8EH18uw+BYVEzi6o9vH3lAcE6QC98j53g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:21 +0900
Subject: [PATCH v2 16/19] gpu: nova-core: falcon: add distinct base address
 for PFALCON2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-16-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 987f3e75-28da-4420-8139-08ddc5cc84ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3pFNDJyTzZFMG5pZXl2QWRBNUR0R2t2L29Rc1NlZU5Ld0tIb1R2b1Bjc0Fu?=
 =?utf-8?B?Q2ZValc3TTRWQStPbXZybkxKbytXVnN3WnFmbEwwcW9qUEpuQ2Q5QUpYY3Rp?=
 =?utf-8?B?blFhNFdZd1ZzZmFrRUVhRUVpcUs5MllNTldidjZQcGNOM2I4Y2xBUGpGU09X?=
 =?utf-8?B?cWhLOWdhSEtwTkNGYWpZeDNxQWpMWlhOYnFVNjRORXVSNld3L0NMYlFnYVE3?=
 =?utf-8?B?aURlbUgvenlFOEJYZkZHWG1ReWIwTWZYVllzMS9vUmdTSnNtVTBBTjVEZFVJ?=
 =?utf-8?B?c2h2OG1XUUl2b0pDc1RoMnlmNzdkdGxVcENHdStkcGp0Vm02dkM3SXIwSHQz?=
 =?utf-8?B?ZXI5SUlLaGJySUo1VDhGYmVLMmFXZ3E4Z0FCNUJ2OWFYekVvMEtnT2pCNUF4?=
 =?utf-8?B?UHJvUXltWTFGUkJPZ1N5VUFlVzRmYzJhSmg0L1NUM2NVeTdKMTBkRTg2YWdo?=
 =?utf-8?B?NC9MZHpzR04wZUVWaGVwRm5aaklvRVNjZUxzUEhzRWd6UE0zUG1Ec2phM1hk?=
 =?utf-8?B?MFZEZUwveUoxYnExVlRhWURoY0E3VjdLamlQN1ptbjJxeThnRlZRczZLdEJ0?=
 =?utf-8?B?c3JEWjBMTWpoT2NHZ1ZmMllYYnZJK0h1VjVTQnhFMHVVUmc0L3NpeU5mV3hz?=
 =?utf-8?B?SXNNM2ROVkNLWHp4UmRuQ3pQOGcvbjhQVkljQ0xHZ3JDWnpNMDhoeG9ZeStr?=
 =?utf-8?B?RG42M09DMUc2aGZJK3EvWE5WOUIzTFNOaDJaVWxHdGdYNmMzM0U2V05lT2Zh?=
 =?utf-8?B?cElIZGdzV0RHQ1hSVXZTRUJyT2RjanlhajZwSFVZclVNNExWOU1Wc3NKMnBV?=
 =?utf-8?B?ZEY3Q3FuN3ZoeDJ2RjJzbStYcHI2SnJRRlMzbnRkeU8zVnBtY0t4SmVnaUtZ?=
 =?utf-8?B?NlZYZk8rQnhIRE5YOHJTVVZJVWFHT3NBSGtKSXhFMWhYQWlxbFBjZzlkUUFx?=
 =?utf-8?B?RFlMbUsxbktSMVdwbFFLcDhWM202N0dTbXYwYzdURHV6cHZFSDJldzlVM0sx?=
 =?utf-8?B?QWliUlFtQXFRNTdZK1MzSk9BaHZhbFhVMTU4YkdrMHJUa3k1dTVtWWUzRDBn?=
 =?utf-8?B?WFRSQ1ZSd3IzUE1LUFZoRlBUcFhYb0VBT0c5N1FNakorTEQvd2lWdjhsdFVL?=
 =?utf-8?B?SkxORUNpN1JuQ2doUGN2czJsYndGK3FDUm16d0FIV3dGMUhRNzdDNVhZYU5a?=
 =?utf-8?B?amFyZXYvWVFhV0t0ZFk5emNlK011Qy9MMlZBTXRmUm9leHpGd2ZLUE45TUJo?=
 =?utf-8?B?TkttSEpzUlVRZW05dzVORzdiQXhlOG5JRmtJcldOR1h3WWlPNG4wNW1UZ1A5?=
 =?utf-8?B?NWVEQUFRUnFQamZVU1NqSGgrdnhueGxHZ3JPdnp5dUIrQk5rLzFIdDhtYVBo?=
 =?utf-8?B?WVlHLzZmY0hvUkNYVzkwVnBmdmlrTi95LzVRdmYyWVhNVE45SHJuWlBncGNr?=
 =?utf-8?B?bXRzZHRxSlVPeitQeVp3QlNiRzdJQUdPTFlqL25mYXNJckw1cU9CVDN4WStu?=
 =?utf-8?B?UEQ3VFRpazR0d2pkWldtRXpFSUhDZCtWcDZUUm1EZy8yMFpjcUMwNlpBdHJQ?=
 =?utf-8?B?c0pkQ3NyUjg3MUsvV2pQSEs2WSs0Rnd0WlJqOGtRdzBEd3RlYUNPTW5qTGpY?=
 =?utf-8?B?MUxleEJvem0xazNZamhORFJuUkFEcmlBdWdXNXlnVmhNLzcyRHArMU9rVU8r?=
 =?utf-8?B?RExQL1RPZGxROE1XN2p4UFhXRU55K2tFSTNJaE40TVNlUFdmdG05ZFhpVHFT?=
 =?utf-8?B?THE1MU5qK0FveGQ5WlFUMXZySldqQjhrM2dybWNjcEFEemlucXdlOFpjQWNL?=
 =?utf-8?B?Zy8vbWVlaU5HUTFJWGZDUWR0TG1UZHJiaVh3OXhFeG5wdU9mS2VLRjFBazZq?=
 =?utf-8?B?d1NlY3pmakJpanVvUmtCdmVWT0g2K3FXaG9DS2tqcXc3Mmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlA5QVBWYWJ6dmRXbHRWWTAvS0xvKzY2a2svUjhRQU9rKzV4THp1NHc3Yy94?=
 =?utf-8?B?UU5jVDJXU1pUZFRBdEROYkN4SzJyVlJyRUFtK0FLRFgwRkI0U01jYTVIVDhG?=
 =?utf-8?B?NVI5SkNKTERhVHRoclp0UEdzUG5iVWxJQlI5Z2g3Ui80MkxKc2ZHcDFkK3pN?=
 =?utf-8?B?L1c0eDZDWWd4NkUxU2xqalB5bUNoNDdyc0VYV0cxTTlpK1FuSGh0UlBoL21u?=
 =?utf-8?B?K2VFYjlWTTBVclF5RzM3UzBmUHU4SGJOSzlCOThyNVoyTXBrZkI3Vm0zTlFi?=
 =?utf-8?B?aWY3ZDQvR3R5czFDZW56WW1qbGF6aCtKemJ0dHBocGtqLzVFS3BQOSsweEZv?=
 =?utf-8?B?SW9tdWlxWE9mVFlsblpkWWJhOHZzYSswakl3cUZJVDRqQk05MFIrZTMxck94?=
 =?utf-8?B?eWZjWnJUVUR0andFQlYrK0JEeVB2bGJSNFZuTmdLaE44c25mK2NtWFpRbWtQ?=
 =?utf-8?B?VStwVFN1S0NZblBNNkQxTGJjTGc3VlJFSFlmY1FjNUdGNUFyMWsvQUlrRHRo?=
 =?utf-8?B?UEo5dURxL1hPekZmbFljRTdOVWoxQ1poS3NGZ0E1cS9kRVNqclBDcGdvUllZ?=
 =?utf-8?B?UGJoem02K1Jydkp3S1JsSHZRQkg0VTJzR0FSbzR0RmFtK0J1WTc4bXpEM3Bk?=
 =?utf-8?B?WG0vQ0t6aC9pR0VQUFBnV2NLbEhWUjB0b1FFWHlzUzdBMmczM1U0WmlDZisw?=
 =?utf-8?B?dlpLWHBaYjltbk1IU3hSTTJFWStqeDdyLzZkTHlLVkY4Nmp2U0pIdVg1cWRD?=
 =?utf-8?B?aElUUmdJUEhadW9IRzUwamc3YjJJN1dqck1Qc0xWN3I2dEs1bzVPTDF3SFYv?=
 =?utf-8?B?V2MweG1UOVBoaHpWVi9QYTY4czE3Qm5oZVZPa3I0QkZsdFZiajFPRnNJVWhG?=
 =?utf-8?B?cUhMVi9WQWlXM0Z2NDcrUTFnRkJKajJWSFJEYXY1U1hCRDNmeGF1TE9TMFlH?=
 =?utf-8?B?QkZnUmtIaXRxQTg4aEY3ZHNsR3dwOFhlYTlwMnNEK1VQS2IxZDR3YVl4dEQx?=
 =?utf-8?B?MlNrdldvRmRKTWlMMlZXRTFlV1B5M0s3MC8xbmZ0elJwa2E1MTdpQmhUd2F5?=
 =?utf-8?B?QXV4bUk3UjRQT0U4VVZSNEhCTEVoamxRNGJtV2puOUJiUE1zUjY0K093WnNX?=
 =?utf-8?B?ZXpKWS9JSjdSNzlsRVYzUStsYnFNQjUrZzlYTHV5Rm1aU0tUdlVkakJCejFP?=
 =?utf-8?B?dERHWDFPT2w2MlB2bmNMQTlaVkdKTXk3dVF4VWVXRTVzZVhhNllCdCswYUg1?=
 =?utf-8?B?VXphaGZCVEJKYVJscFFRVUx3TTNWaDdwOUtSbDhBODZSR095SnNXLzhpRHN2?=
 =?utf-8?B?Qk8rMjdPMkN5SkoxaHBxd3B3Z3RBN0RtRzFXTUVjeERDUHloWk9mdkwyNmxq?=
 =?utf-8?B?b3dBL0tOTSthcE8rcjdwaFNGbW5tMllqWDlHN2pPVjJtS0c0U21VTW5TZlpa?=
 =?utf-8?B?UFdJZFdjWWM4YXI5T3BveGF2ZGdyZFBZTU0xYm1mNUloNXV4NFpvaUdaRGNH?=
 =?utf-8?B?dWswRzJQcmtTRHNRY1E3MTlvc21iK2IvdVhnY2x6eUR3WHFKZ3RHdEVsVjYx?=
 =?utf-8?B?Y042UEFXM3Zob24weXRwRDAwMm1qc0p1L3gzQWxLdUhYVmVUaEN6eUV6Ymo1?=
 =?utf-8?B?dFZtZ28vNU13S0lxOUptT3VRZnR5VytMaFdaRk9aMERzc0lGWW1WZWo3RW5i?=
 =?utf-8?B?d1Q5bmkyRjhObnBIZnNVamhSQnNBcDZOYytOSUNvY1o3RFpBQllQblJHUDlC?=
 =?utf-8?B?UGF4Z0dKcSs4cTRLOWZDUjdPRWFYYWQvV1BjQ1dsT1ozOERURG9VZXZ3cTFk?=
 =?utf-8?B?WEhlMExsL2lmVUw3dG9GeHR0V1BEQi9sbWFLNGJ6T05GdEQzeGxJNFZtaFM3?=
 =?utf-8?B?UXowUXVpQ0l2V2tLYTRIbzdvbE9xZUtKWkliWnV5aTdXM2J0dFJEQTNBdHdQ?=
 =?utf-8?B?V0tCalFtYmU2QU52Z0pRMjMwRFl4bnYzc2pQWkNjaC9RRlRpQXBxVEJiMTln?=
 =?utf-8?B?cDBLZDVJbWxnSmp5cUJVNVhSU0NkR2U2TERmNm5VQVRuOEphZTdBcmRWNVdp?=
 =?utf-8?B?L0lnaHUyNDFsNHVIUG0ralpaaUZvSmdzZDRKalQ2T0xNT3FJcFIwc29ONFZN?=
 =?utf-8?B?TlgrbFY0cFVMRWlZa2E0UHBtcHErOFFaWTZyTGt0NjczTi9PUkw4Zlg0aFNz?=
 =?utf-8?Q?g09IdV9lpKV2FKDtmnV1WlM/604wU2IUfMGD4dsoUV34?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987f3e75-28da-4420-8139-08ddc5cc84ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:14.7533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/v+pup1s/mNxVcRXrl9t6jdgjhkWHw1ukoMccOwFq6oS3NSoB+xDRL13nZrowVv2oMVrwrG3lkKoSGGk9bqdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

Falcon engines have two distinct register bases: `PFALCON` and
`PFALCON2`. So far we assumed that `PFALCON2` was located at `PFALCON +
0x1000` because that is the case of most engines, but there are
exceptions (NVDEC uses `0x1c00`).

Fix this shortcoming by leveraging the redesigned relative registers
definitions to assign a distinct `PFalcon2Base` base address to each
falcon engine.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      |  7 ++++++-
 drivers/gpu/nova-core/falcon/gsp.rs  |  6 +++++-
 drivers/gpu/nova-core/falcon/sec2.rs |  6 +++++-
 drivers/gpu/nova-core/regs.rs        | 12 +++++++-----
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 67265a0b5d7b481bbe4c536e533840195207b4bb..2ecdcc6b9b9dea39889eb9e41e3a8293fc56a54d 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -278,11 +278,16 @@ fn from(value: bool) -> Self {
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
+/// Type used to represent the `PFALCON2` registers address base for a given falcon engine.
+pub(crate) struct PFalcon2Base(());
+
 /// Trait defining the parameters of a given Falcon engine.
 ///
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
-pub(crate) trait FalconEngine: Sync + RegisterBase<PFalconBase> + Sized {
+pub(crate) trait FalconEngine:
+    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+{
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
 }
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 0db9f94036a6a7ced5a461aec2cff2ce246a5e0e..f17599cb49fa1e5077a554dc14b3715aa62a4ebd 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -2,7 +2,7 @@
 
 use crate::{
     driver::Bar0,
-    falcon::{Falcon, FalconEngine, PFalconBase},
+    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
     regs::{self, macros::RegisterBase},
 };
 
@@ -13,6 +13,10 @@ impl RegisterBase<PFalconBase> for Gsp {
     const BASE: usize = 0x00110000;
 }
 
+impl RegisterBase<PFalcon2Base> for Gsp {
+    const BASE: usize = 0x00111000;
+}
+
 impl FalconEngine for Gsp {
     const ID: Self = Gsp(());
 }
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index dbc486a712ffce30efa3a4264b0757974962302e..815786c8480db6cb74541d7ab574112baeb816fe 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::falcon::{FalconEngine, PFalconBase};
+use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
 use crate::regs::macros::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
@@ -10,6 +10,10 @@ impl RegisterBase<PFalconBase> for Sec2 {
     const BASE: usize = 0x00840000;
 }
 
+impl RegisterBase<PFalcon2Base> for Sec2 {
+    const BASE: usize = 0x00841000;
+}
+
 impl FalconEngine for Sec2 {
     const ID: Self = Sec2(());
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 7a15f391c52c9d0ba3c89094af48998bda82e25e..35d796b744e933ad70245b50e6eff861b429c519 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -9,7 +9,7 @@
 
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
-    FalconModSelAlgo, FalconSecurityModel, PFalconBase, PeregrineCoreSelect,
+    FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
@@ -295,20 +295,22 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     allow_phys_no_ctx as bool;
 });
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalconBase[0x00001180] {
+/* PFALCON2 */
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
     7:0     algo as u8 ?=> FalconModSelAlgo;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalconBase[0x00001198] {
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
     7:0    ucode_id as u8;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalconBase[0x0000119c] {
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
     31:0    value as u32;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalconBase[0x00001210] {
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210] {
     31:0    value as u32;
 });
 

-- 
2.50.1

