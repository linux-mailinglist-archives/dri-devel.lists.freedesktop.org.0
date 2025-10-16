Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E589BE3FE4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888210E9F7;
	Thu, 16 Oct 2025 14:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eI0bzSXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB04110E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuhLxcbG/+RmC5/pNEu15KOU5Uz5PviPgMxX2b5EGVZzlAfN9PYSqxLkL1Xe0A+5CCYsLWqAaeyCSY35oX2ve0Hlr1hMv3L95ozASk5RIFHDnt23jvXE/6ZMnQuEMHVOcuJFKc6XJvU2mGXPYoY6XIKbjAKvvWlm2d1ImxMEhwHxJMxhYLFyMSc/sulEl1UImAzqxBemAzXDkpsJmeIf1jxvnoI6YyP85cpxZhhLznQJt1ryLW6Dq1fcgPmRGZg7nh4PmkvAI7X3CgaILnpFwXJEIvgukdS/JyCMxy2ZHBRqIK1wQwPsjfDas51SqNNrNSLmqCnNseR+8ELRKxWFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziISQ4ihHW+Iw82LwuYtZbYgCJyXsHjarY9khGlEEXo=;
 b=zWNPOdCUgZ80ktbsiYszzEUXRkphl7SlWQ31DaSY7GiWiX0/ueT1eCU2mVUZdp3xvOBbP52nLDe+oXQwcYalfILlu7/mmbj3VleA/p3DFNmg/fOrYkF+YZHRtqT4GUbhmIhamZahfUZa6Mc1z1lpw3v+kkfUqvYWYkJ5DXdaAPzqZddFnGg07ew6Gnaw/eYfRKzoHARHtNR7Q9x8Rx8/drdFnFw+MLTK2k9xE9Jp0yttTKi8h1ARRkMrZSb4rCttxHSoc5IkPy39C0N7YcwzIWNrX2udGIz5Pw3YD53j6a45Pf6SkxCr0PYxMygtSUlGZSCFAt/RLNlzqBVJL1zqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziISQ4ihHW+Iw82LwuYtZbYgCJyXsHjarY9khGlEEXo=;
 b=eI0bzSXrN4hUi6Bfv3w8uLsXVCL0JshcPEmf4S6kIp7V7i4uO5r/K7wGX2inyGEOCWjSS4oR7bhD3L3VyFITmAlxSMtlmQ/pWsvMhwQO51kdxvgsXKK2YQBz9TWvyT7pd6eKSMuEMoc3vP+Mofmd2p3iKbT66IUIk4rnExfgi6kg3kQFuOyaW0hzTTEWagQjw91bAIH8r4+6Dy71gqxUPvBab9S0lxzyFXadISTTZ+CXyoJiXjBY/zZde9G5uo+vZXX8nhckBddrqJu/JwLHmPIWGzNqvZY8Pv0yuoGjcKhVf/bkahVHf4iK7aZIvpq/VlEMV7t498o8bIlqAKt6uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AMBPR04MB11785.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 14:48:09 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 14:48:09 +0000
Date: Thu, 16 Oct 2025 10:48:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aPEFoDrTBxH7Y2FL@lizhi-Precision-Tower-5810>
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
 <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
 <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810>
 <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
 <aPAL67Oct5yJv8/d@lizhi-Precision-Tower-5810>
 <CAL_Jsq+sEYztJKdD0t8uPwwv1uKk_tac3MqQMUgxfrRjRZmz4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+sEYztJKdD0t8uPwwv1uKk_tac3MqQMUgxfrRjRZmz4A@mail.gmail.com>
X-ClientProxiedBy: PH8P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AMBPR04MB11785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffed2a9-8597-49da-3b20-08de0cc305d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmt5b0VHSVRQdGhibDErUkdpd1hxZWY0VHNJbm5zWkV2WGthek5mTFZlNWg1?=
 =?utf-8?B?RnhuZmRqb1k4eDlXZno4WFlBSVREMmoyYlR3M3BndGZrUVA2TVpTQTltR3pI?=
 =?utf-8?B?ZFRPV3pVUXl2eWdaSjA5VG5VUjJ6WkFXa3pISS9xbTg4amZYYUdLclhZS2Nr?=
 =?utf-8?B?Wm9UMDNnSUJsdDBKWWthQmFXYnlqMFc0cUIzN0FtY0xrdWxQSmlaZFB4Rlgr?=
 =?utf-8?B?VjZQQ0JMcUpFVXN2ZktuZXJodXN1dTdtY2pNcHRKQjZsNmZ0RXlYT2c5cmNL?=
 =?utf-8?B?MVNic25IL3R4cFFXaXd6eENTU0FWcjBJOGdCZDdkUm9GZlUwQklLeGFpYUpN?=
 =?utf-8?B?ekY2UG02RFFxYWpQYnhkZUs5YkpkcHd4NThqSmp1NXlBOWh3SUl4aFAyMUFJ?=
 =?utf-8?B?QXhES0tuQUtnMG94MnpINzQ0K2FIdjd4aENpMTJXem5UdEpkdEo0c0o2ZmNT?=
 =?utf-8?B?MmFLbWw2czRjUzVvNGc3dnhBQk5LczFpanhCL2twZDUrNGYwcXdmb0RoQWJp?=
 =?utf-8?B?MjYySkw1Znp4WkN2VTBWWWgrOXVudzRZSDdwNEh6a0RuQ0NBZFY1NmFDY0NJ?=
 =?utf-8?B?UTgyam9Rcmd4QXk4SmpmYmJDMUE4dzRDLzdZWEltMUM0V1NJMlo4NzNFOUJS?=
 =?utf-8?B?WU5DWXpyUnRHVW9NVnQzTFIxSEFEVTFTVGg0ZmdNaUhGd3BYY1hpaVpkWEFy?=
 =?utf-8?B?d0xKbmRTUTByMU1LYUYwdTAxdXQzVm4xYjFQMmZPZElDY0ZoekxQRjRZbnhL?=
 =?utf-8?B?WUlLeVV1bjVFTEpjVjl0UE40Z3BtVEdiOFgrZi9OTjBjb2ErV0VEL0tmRXJ3?=
 =?utf-8?B?VHA2cTRxbXEybDhOYnlPTlRhMVR4aURBK2ZaYUkwNFVxdnhrdlVHSXI0RHg1?=
 =?utf-8?B?cG9sUERteEdIckVkNVFoS05pc3l2T1R2c21JUUsvSVpHczhpTHg2WnBCaTlM?=
 =?utf-8?B?a2c5Vyt3SURDQTMrSVI1VDVjRWx2dXFnZkhvd3BudVcyd1loV1c5aGZ1ZkNC?=
 =?utf-8?B?SUZPeGw3K2lBZ3hvNXZBWkNCRlhEeDVHUCtzbXQwUEhjZVNzbzVUTjVhMGda?=
 =?utf-8?B?RFVweGVQSFpENlFBWTNCM2VPUzEyU3QzTDgzMmhDTW9WMS9FQjZ2ak1QTXM0?=
 =?utf-8?B?RVQwNTFudVJhSFJnWXY3WTFhc1g1UlBHMnRhMXU3TnJwRWZudXJYRVRncS9Z?=
 =?utf-8?B?b2FlTUprRjJGajFqMUxBeEJGbkRUNkVZVTNobUEzOHJsbWpyVFEvY1NNUlRl?=
 =?utf-8?B?eU9JNlBZN2ZicXFjbHpGMy9tL0FjVnlBMnBUZDZ0QkZhZm1HOHVMdHgxN2Np?=
 =?utf-8?B?S3pWNDVraXBIQUN3YjkrSXh6N3VYR3ZnWEhtbGxJUVhlTHF4S0FaNmtnUWxR?=
 =?utf-8?B?S1hRYW12SklsOXhTUkQrTVVuQTB0aEtFckI5Y3VsVDR6RXdmVjcxZmY0MG9J?=
 =?utf-8?B?dSt3eDBtUU5MRG9CZDREUnJsSzhsV1p3WHRSWDg4RXBhVmg4ZjNjWitLN25K?=
 =?utf-8?B?clFqelNIVS9kYzZOMW1XUWlWOFl1WGUzdGhJMm1hM2NlUU4xK0hNSzlDR0lw?=
 =?utf-8?B?bWh3ek9YYlJmTlB0RkZzMjFqc0plNktkR1d2TWo5dnc3SGYyWjVTaW53MmVC?=
 =?utf-8?B?cGxkaHorb0U0cmNjK0VKME5NV1NEYlI1TWN1WENiNDROc0xyVmpieXlmSTJi?=
 =?utf-8?B?dlh6RzBTK0grMGNTSmQvSTA4QWg2QjJtdjhUUTFLdDRENmFPd1puM3pkd3NL?=
 =?utf-8?B?VVQ5c0tRblNRd1ZnY1loWnJ2Z1A1WGVHOERxZnBTV2Q5ODVJaG0ycCs2ZVI2?=
 =?utf-8?B?WGxsaEhVbTg2bFgwMUJ0UUJ1cG13QWNIeVdlOFo0VE5tdER5YVVnL0Z3Tkky?=
 =?utf-8?B?bDhNRW9rSnovZm1pbkNjNUFxdS83OG00RmJrTVZocTJvVGliYXc0YTJlTkNr?=
 =?utf-8?B?TWJBMGtIMlBQRDU2UDB5MGd5eG43cmhrbVI5RTVxUnUweHVpem01TTlKTWZE?=
 =?utf-8?B?VXFYck5WU1ZxaGIzK2d0alhTS3NyenhXZUhNL3lqQ2E3ZzllazhNVTZnVERa?=
 =?utf-8?Q?KB62Yr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDlsNHlZNFdwVzJGQWJmYVlTTHhUcUdreDc5a1l3T3d4Q281SWhEV0tEUUYy?=
 =?utf-8?B?OUlHNkhPeE1VWVh3Q0kzWGxxQnFVZmE1ZWtiL3VzTVFnczFJdFdKaGpwMXFh?=
 =?utf-8?B?SnN2eHU3NlUyQ1Zld2pxRkFXZnBaM2J0THd1N05WZUY2VUhhVGJwblM3U2E3?=
 =?utf-8?B?RUJTWmlRN3Rhc1hWcmpVVGFVRjl6RjZzYjk5UmUydS9IV3FTbkswTFR5MVFs?=
 =?utf-8?B?UlYvL1VGRVZEalRIRStFdG5oQ0x6UzN3MWlXRWNwaE1pY0E5Z1gzaVFQRm1U?=
 =?utf-8?B?dW5paDZFNUlPWGpXdGI4UDBTdmo4dDhUeENvalhTYldOVlp5NXBiSVUycTlq?=
 =?utf-8?B?U25YdzVJTGpvb2NGVVgvZW83NkRock55VUFCYVdxeVErMCtZemVIcnhmdnJI?=
 =?utf-8?B?cVdESG4vaWVlSC9tcTg4RU9jNGd5blJaaWU0Y1gvVnlVdDBmZXB2Wk1KaUx6?=
 =?utf-8?B?N1BMOEl1SlJlbkpIbSt4S1VzcHdXczM4anNSZlR4eFM3S0F0dU81K0tXaUEz?=
 =?utf-8?B?ZDBqbmtGTUZFT1ZEN2tqWmhmYTRpNUxudnFzOHBJcjJUdjFDdVBhTHdIbWJM?=
 =?utf-8?B?Q0hXRjJ4QVh1ZHl2Y081dzJNTklHcXpNb3UrZGRDRnI5UENRVkVQa0NKTGF6?=
 =?utf-8?B?c2VhV01Wb1Z6SFdFMm0wT3BKZ3puQjBOcXhrODNtdVI2NDkwRkF0cXhiV1h3?=
 =?utf-8?B?Smswd0FnTW5FVDlzQWtKRzQyekxnak5iU0xIWDlGV3VXY3JOL1BGNldUWXdM?=
 =?utf-8?B?aytrbmJ1am16UW5waktxNVJONXkvUnBMZ2p2UkowQk9qZTlHSkVZQ2NZYmVO?=
 =?utf-8?B?MmhvNFYwQ1dlbkdBSi9pTTNPOXJvODlSMFZyT2Z0ZHNFUjVtS04vWE1iUEE3?=
 =?utf-8?B?RDhqVFUzQk1Ba0N5bVc5VmIvNWJYbCtIbk9neENLSlNxTGN0QXF6a3BGYmpa?=
 =?utf-8?B?RDZyaGlJNFlvMmt1dStiZjZySDJOZmsxTitVaklvQmx1WlpITktwVGRPRTZ0?=
 =?utf-8?B?emZTV3RpVWdnVVVteGRXbDZjcFlNTytxbi9ZSGJZQzlRclZvY2I0b0RBbmdB?=
 =?utf-8?B?dUJ5bWxjdFpoZzJTR3dicmdVaW5lSjZKcU50Sk5odVVTVUloZms3Nk14Vzl2?=
 =?utf-8?B?eksrVnd3TlZxazN1UnRGQkZvMVo1dVJacEh0d0VGbzhDRjFEMkgwS0dGbWNy?=
 =?utf-8?B?V2FOSHQ3QTBycHBjd2RWRi9jaERkanprTXdic2xFVG9NNDBOakJsQ2N5enhG?=
 =?utf-8?B?U01oN1FUQUx0Q20rdWZMTlZVWHR6NVVqVVV2TzZlbGcxay9UdDJURlR3RVc1?=
 =?utf-8?B?RXZGenljaHBnOGJIcUp6K2prRVgxQ3dCbDRkdW1jQWcrOFhiNlhvWENQREhK?=
 =?utf-8?B?VHIzTEdVOG9OWHh3c24rNHB3Z0FqRUgySFViOWNDd3dzT1JtR0tXdEg4RWdF?=
 =?utf-8?B?cFFnZTV4cndlWHJQdS9YRFJET1hwVG1tNVU4T2xkWnZQTnNGNXBlck9GVy9i?=
 =?utf-8?B?QzlKZ3hMd0tUZ3lsVmRyMk5qLzhZY2loRS80UEpBUUc5am11R3k3TGtMc0Fk?=
 =?utf-8?B?Rnlvayt0RnlhR2VuQnZxL25FT2oxc3ZZT3pLQnNHdEQwU2pWbEJoa2dGUjh0?=
 =?utf-8?B?VVZ5VUppVWlZeFZiV1lmbnFIL0tFUndxcTlkTW9ORVpsUVVrdmx5MmNENktS?=
 =?utf-8?B?NnlMUTdPbGZ1cWRuLzIrNTFVclBZbVlXWko0cktNV0JUUStYOUZhcjZNd2g4?=
 =?utf-8?B?Um9aWXQxKy83b0hoQXZvdGJpcGErdUowWnFYamhsbzJ1MHpxN0FFM0llSk1p?=
 =?utf-8?B?UXZHTU9Kd1QxYjV2ZXBRMEhDbHliRzhtWTJUVFJpd1MvaVkyMWhaM0YvMDlF?=
 =?utf-8?B?eFl3Nm53SGRrdUxBalZXaUhISWRGWUhKRHcrbkVQb1dleUhTNVJyN3czTk9F?=
 =?utf-8?B?L2E0UkJKejl3dDhqT1Bwa0NHNGJybURscVQwZEtsa0hMdXNpamtaT1ZJUHN5?=
 =?utf-8?B?NTZxRU5JWi84cEpIQ2hGU1l5N1RBNENYUFBuYitDNm12UkxON0lId29yU01m?=
 =?utf-8?B?N0tOT1Z1cVU0YjFHUUptQ3hsQStKWmQreHJ6aTJwUTBrREhyUnk1RE15UVpk?=
 =?utf-8?Q?6hFA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffed2a9-8597-49da-3b20-08de0cc305d4
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:48:09.1005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCL5rn0gJyovlXf+79yQKnkCBrJm+pEuJ8Mx/KNxG9CwM5YwOKGlNG4FSI8+2k50tyZN6wTUUG1bOitdPwrxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11785
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

On Thu, Oct 16, 2025 at 07:35:06AM -0500, Rob Herring wrote:
> On Wed, Oct 15, 2025 at 4:02 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Wed, Oct 15, 2025 at 03:36:05PM -0500, Rob Herring wrote:
> > > On Wed, Oct 15, 2025 at 2:39 PM Frank Li <Frank.li@nxp.com> wrote:
> > > >
> > > > On Wed, Oct 15, 2025 at 12:47:40PM -0500, Rob Herring (Arm) wrote:
> > > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > > relatively simple interface with single command stream to describe
> > > > > buffers, operation settings, and network operations. It supports up to 8
> > > > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > > > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > > > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > > > doesn't need access to the SRAM.
>
> > > > > +static int ethosu_init(struct ethosu_device *ethosudev)
> > > > > +{
> > > > > +     int ret;
> > > > > +     u32 id, config;
> > > > > +
> > > > > +     ret = devm_pm_runtime_enable(ethosudev->base.dev);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     ret = pm_runtime_resume_and_get(ethosudev->base.dev);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > > > > +     pm_runtime_use_autosuspend(ethosudev->base.dev);
> > > > > +
> > > > > +     /* If PM is disabled, we need to call ethosu_device_resume() manually. */
> > > > > +     if (!IS_ENABLED(CONFIG_PM)) {
> > > > > +             ret = ethosu_device_resume(ethosudev->base.dev);
> > > > > +             if (ret)
> > > > > +                     return ret;
> > > > > +     }
> > > >
> > > > I think it should call ethosu_device_resume() unconditional before
> > > > devm_pm_runtime_enable();
> > > >
> > > > ethosu_device_resume();
> > > > pm_runtime_set_active();
> > > > pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > > > devm_pm_runtime_enable();
> > >
> > > Why do you think this? Does this do a get?
> > >
> > > I don't think it is good to call the resume hook on our own, but we
> > > have no choice with !CONFIG_PM. With CONFIG_PM, we should only use the
> > > pm_runtime API.
> >
> > Enable clock and do some init work at probe() is quite common. But I never
> > seen IS_ENABLED(CONFIG_PM) check. It is quite weird and not necessary to
> > check CONFIG_PM flags. The most CONFIG_PM is enabled, so the branch !CONFIG_PM
> > almost never tested.
>
> Okay, I get what you meant.
>
> >
> > probe()
> > {
> >         devm_clk_bulk_get_all_enabled();
> >
> >         ... did some init work
> >
> >         pm_runtime_set_active();
> >         devm_pm_runtime_enable();
> >
> >         ...
> >         pm_runtime_put_autosuspend(ethosudev->base.dev);
> > }
>
> I think we still need a pm_runtime_get_noresume() in here since we do
> a put later on. Here's what I have now:
>
>     ret = ethosu_device_resume(ethosudev->base.dev);
>     if (ret)
>         return ret;
>
>     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
>     pm_runtime_use_autosuspend(ethosudev->base.dev);
>     ret = devm_pm_runtime_set_active_enabled(ethosudev->base.dev);
>     if (ret)
>         return ret;
>     pm_runtime_get_noresume(ethosudev->base.dev);

Look good.

Frank
>
>
> Rob
