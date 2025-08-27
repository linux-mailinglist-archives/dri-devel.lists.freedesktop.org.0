Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4CB377A0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 04:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CDF10E29F;
	Wed, 27 Aug 2025 02:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RAFJcZv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012063.outbound.protection.outlook.com [52.101.126.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6F710E29F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 02:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp7YEXrQMlcD8ieSlWbCx3eQG+jwp8m286a1sYxpIQU9p2gXrsgpAsOBewACOadvgiKIOvgxeY+E3r4pidAs8ia6SUhfnO8IOCvnBdZGbZL2V6SnymwbtBTCfEnnDVtpmzprAydXFUFJ4wCZJsmRHhlKfnqQPdOOS9p/jvcvrkFX+iEF5OPTE1rcjynqs2DZQsr8t2VHCdlnaZXZH9Hvzr/ZX+OjaAVr/l12ckXfS6oLOHOt1RfdVy7wWX44zxwHfQo3SxSnJmFKFK/LEhjLFZ2ZjcM5pEbmyCJl+gmy1P55HU4s6UiVelh3BenKtXbkUK4FLTUZhhiGxHpfPXfcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/mZUME6iQvcWh2TCCzAPiw+61AkatH8/qdRrtlSIOY=;
 b=oC4l3TMXL8hgn0rrLP3W8DThdQkwdmOFps79ve+Abki/ta9Zazb7zzOCrsgrvrTfrk56dy2v7vHBV0pyRAXCuDrZxwQNkY+/xMzTmo241oy+Hn+BeGyGXv+yP7+Y0xpr8H/NSufU7r7xYl1j9W79lW5KxiPnXTGB+MtW14m8bXvb4/yek4ta+uHt8lBAYwMGfbRERM1If0becqClqta+ep8aSN7UR1S3h/you9fhGbtjcFcRbdVht7RDV7bx/kSpIBpF9dt3A8CgGP568L050NxYR62hACq6Xnrqea3dySxlmnYj06NV5hb+6cz0D/kCILi43uVPznRLIX5y1lW+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/mZUME6iQvcWh2TCCzAPiw+61AkatH8/qdRrtlSIOY=;
 b=RAFJcZv4d2sAhR3GaRHf4M4mnhcc8rpJ+jLAJkeR7PEBEkhssjv+zKlvdS2epx1RiXdisN+KBhZ32e1ZFqUN3ZLcrQCvvVelgIJ/H84w/yUvq8BtQl0070natYjndBMH88NyeC8WeucvSbtM/xx577u7hR/T+5mHvh2qJsUPTWNmSgksznzZ9btnEw6WC7o3H+pSQ3fuLV3yF93WU3n3FZJPDAAoNozDo9oe02EjkZnQXCC7PD4d5EwxB66iBsnhxys08F+NlWkXN120QDRYVW4YvW/P7IjFR3pGp3Kci00cL0e9f7FBrNIRVBXKUq/ActXzEAaAVEH+sl8D0Azr3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB5478.apcprd06.prod.outlook.com (2603:1096:101:a1::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Wed, 27 Aug 2025 02:15:07 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 02:15:06 +0000
Message-ID: <eaefefb6-7ced-4c47-8bff-bae83f143b72@vivo.com>
Date: Wed, 27 Aug 2025 10:15:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Use int instead of u32 to store error codes
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, Min Ma <min.ma@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250826072917.186638-1-rongqianfeng@vivo.com>
 <51440ea7-bbea-c890-057e-109685a72cb3@amd.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <51440ea7-bbea-c890-057e-109685a72cb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: bb338f4d-f7b1-4560-3c49-08dde50f8a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDBCU3h4K1lDU0V6cTFLb00rS0VvaEJ3dWNURngvVmU4NHEvNW8rcG9hc3Z1?=
 =?utf-8?B?Zk5yZC9TUHgxMWw1UUVzRzhXSkw3UEdHVUdHdjBBVlQ0aGFJK1prRHZJdXpV?=
 =?utf-8?B?S3gvbWNIL0ZacnF6cWU0Q2l1d05KMlBmQlpVMFA0RGlNMVRLM0pibDYyekJn?=
 =?utf-8?B?R0Joc1hzMUZlM2NFTTlzOU92OTV4RmNQdGFBUE9wMkR0SVVoMFRhN3NVRG5Z?=
 =?utf-8?B?TmtLVStIaUVDOVlLVVZMZGNHZGkzeFQwMUhXcHhDSUdkdEpIMHhFSElid3B5?=
 =?utf-8?B?NGdidjQ3OEYxbDlLMnZhYmd5RHp2RU9IQ2gvZnpNcWFtZ0dGdUI4elhEZ0dk?=
 =?utf-8?B?OEVuTFNlODFDc1pZc0hRNE96emZYQ0x0YUdGM3NGTWp2SUIzcWFESTUzWjNJ?=
 =?utf-8?B?N2JzQS9Nd0E5UGVrZEhoNjZQT0ZXNTdZY3ZqVi9QL3RjTmdJSnpNTmw1WWU4?=
 =?utf-8?B?Ui9QeUkzTEthbXBQSVY5STFGL3NIT1B2azdpY0wzSEFFYW1hUjlPR2Z5TzV1?=
 =?utf-8?B?SGtNNm1hMWwxSkFXSGR2blFTS1FtOS9UL1Y3WElHZkw0VTZDOWF1M1cxcFUr?=
 =?utf-8?B?emdzMDdaNkt0bUdjTXg2WlE1Z3Q0Ull6TmRUYzlxTnFZZUFaTWllWW1Xakcy?=
 =?utf-8?B?N1BMWDNUL1FkTExhY3lCeWt1aGMrVGovTVhJbURSN3JUZGxIVXpUNGJyV1Zw?=
 =?utf-8?B?ak9hbXJpNmNtRm9KcDcvM09TREZVM3FqMXI4QjZCVWk5NG5EaUlZNEM3SjFF?=
 =?utf-8?B?ZXNpVDVUMXByRmFpR3ZiUEpQS1lWVVRMUFZqSVNrczhpOVhZUm5rQ1F4dm45?=
 =?utf-8?B?SUlEK01xNFltcmN2YVltOVVzZUttUjZrYWp0RXY0Y25PSzI5bVB5bWdSR2ow?=
 =?utf-8?B?RHU4RGh3NzdCTkhnZ1I2NmJDOXVlZjdLcElWRkoxMzlhU1k0UG9Pa1NldkJs?=
 =?utf-8?B?TWtrYjc2cHlLOWtEUDVDTWFNVExaK0xWaGRhVlNrN0dpV0tMbHBHK3I0cUlW?=
 =?utf-8?B?N1VGVko2OHU2ejIxUy8zQnZsVDVzR0N4bGs1bmNOM25VeDZ1UGFxT3doTmZl?=
 =?utf-8?B?aXVXQlJsRDNJNjM2aU9aR1VIam84OENQQjZYTGZISUl2ZG5TQ2kzdVhJcFEy?=
 =?utf-8?B?Mk1uRXNMcFpQRHZUUWttVVZVOWtoTXZkM243MmpDdzVDL2VlWjlQRGJ3dkxl?=
 =?utf-8?B?WjQyZW1JRlczZCt0T1hOQVltZDdFQ0NCM3dyWUhRMkRDOGpvSUJoWTljNytZ?=
 =?utf-8?B?WGVWTzZhNm5oU2N2SnNiNFRjMUYzejRkOG05bEJ3OFV3ZGE5dHBsek03TkNU?=
 =?utf-8?B?dHNCNnJwb2hIMGFxM0Y1MGNtY1BwMVdmNllzMmsvbGVtUjhVdWl0ZVFZTUlE?=
 =?utf-8?B?anNjVUtKdzluZW1GZHB1ZTliMGhHSTZDQTNHdUlwcUo1d0FQNUE5eW5iODNY?=
 =?utf-8?B?UENHL2RqSWNiNS9HeDFwWnJqd3RONWU1L0g2SHVZbm9sMDR6NFUxN1FWUEVF?=
 =?utf-8?B?N2pTRjZqbjJucHgxYnZzaFpseXVhTmttU1VQVVdqL3FtYXhIUC9ZNkVEYTJN?=
 =?utf-8?B?dUtQN2lzcE5nVVk1bnlMRGZ3RzlJbGR3QW5LMmJRdk1pb1NtQk5NcDRPWFZ6?=
 =?utf-8?B?YkNta0s2OE1ZNVZnNUo0OUhOUFdIVjJHcWxjY1g3VTA4aXpNaXZIWXRwdC9F?=
 =?utf-8?B?YWlTckpzZVY2WGJGNlgwNk1EMDB2YnRkZXhjZER5QVNwVHVHRnQxKzc0aTF0?=
 =?utf-8?B?TWd3blBhVXJUT01ydHRONGVLQ2VpOSs0b1BqcnAzRGRjREZwaG14QzByZVBS?=
 =?utf-8?B?YXRMNXB2M2RTS2hzbStZQzFNYmFnUHpYTElkNVlPTlUwOFNZeTNxK3ptaUFm?=
 =?utf-8?B?a3BzeU4yVjg0SmxwTkVpMmlZY2ZCdVd5ekJQdUVHUFBLek80cDBYRlFyMEIx?=
 =?utf-8?Q?kaaUTv01xro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzdka2M4TEpDNGs5WFVKaDh3QllmUmdBRnVSL05ieWRCLzlnU1VSYStpSlRI?=
 =?utf-8?B?eU82ZGlOVUdRcGlpUXlldWxJUVU4WGg4OWt3R2p4MjljWTJRWFV2L0d3aVl4?=
 =?utf-8?B?ZHNYbGtZUko5VFpqcGJFRkFQa1ZqY04zeDJKMWk5OGJOODd0S0dUWSs2V2FI?=
 =?utf-8?B?Y1ZxWGxxTjZ4OTJ0ZUFLaWFRZEZGSXBuOXdLSkVUVGJmVkNwL1phUmZaNmVi?=
 =?utf-8?B?cWtYM3hXMkpyenFsalE0bm5tc28zdjhHT0JiTXBqTmx4NlYyR1VyNHMvQWF3?=
 =?utf-8?B?RUFHejF0MGlMM0RqOEk1NnJsWU82OWplYy93dU00dkpPYUpxenowVnhFNjlH?=
 =?utf-8?B?aXZhd0V6QVNPUjh3a205VitrMmExZllGdUFDZllyRC90aEhjUmpGQ2l0Yk9D?=
 =?utf-8?B?VnJTb0NCTVJXWkEwTE0ycTRMZXY3V1F5VS9qaUxqK3dCdmhKT1lDS3kvWlRL?=
 =?utf-8?B?MFpmVkRZWk53cmxrRnJyblVnREEwQ3NLb3M4c3RSTmxVUjc2ZXRsOVl4YjRv?=
 =?utf-8?B?dzVsZGhvOGdhY3Y5TjZOaWpqdlhRZG16elFqcVYxd3J2Q2RFcVJCWHUyWmd3?=
 =?utf-8?B?UjloZE1qZWdWUUg3V25PRlF4Y0ROQXIxbXdsdEVTZFMvbTRUcnpGQ3VtcDVI?=
 =?utf-8?B?aUM1WWtRb1lLSG1sR0grN3kzbUR5ZnNMZ2NHN3RmaHhreXZDOGVkQWIvM3p5?=
 =?utf-8?B?bHcwOVNzeHliZUtuK09zQ0dTOUhVc0lrUCt5b0NTTkx5TjdnQzQrNmVaTlhD?=
 =?utf-8?B?c0F0d3NRbnM0WTR5bXJxc0FVUTRuU3JuQXp6TTlpVXVhMzBHYytIdXJQVWJ0?=
 =?utf-8?B?OXFKMnA3OVVCeEViN2R0L1dhcTVOcnBRNml0anZOL2FTU1dEb3ZMdkRCL20v?=
 =?utf-8?B?QkRtOGRaK3pSS0pYVDF4cmtlSFN5M2V0ekNBc0sxbHYxcWZsVWRUeHFiMjVQ?=
 =?utf-8?B?YjJHZ0R5d1lEYUk4ajd4dGg2K1RBMTlnL2FYOGpEdk5LcDFYcG0vVVhEcTk3?=
 =?utf-8?B?Qm8zV0FYdEF0YjEwWXAwWXN4czFmVzVXQWhWNFE2ZlZvQkZKNXMwTnlKajYx?=
 =?utf-8?B?QWkvUU1tVTZQRERjWDlYMWJPRlF5cXFZaWtSK3c1TUFScFdBQ0VuYVdTaTA1?=
 =?utf-8?B?NVVtSlNsdVBiMXUwdmlGeVRMUHA3QWk5eHJoY21Camt0UHVPMmF3NUpKSWlE?=
 =?utf-8?B?a01vY2o2K0NLRzNxS2llckJRV2lOM0EydmVIcG9PRjhrYitvSkpCcG96QnhM?=
 =?utf-8?B?VUdKMkltZURhMDlRVTcwM0pzTXVxcUJPbkdvbkJhb1YvNHM3RjJqNG9wa0tv?=
 =?utf-8?B?VXVHcDZvd2RVUUtjci9ndXBlenN2OWpVeW9lSHFMSGtJT0x3MlFQRUllL3ov?=
 =?utf-8?B?Z1pNQ3RDUjZ0YWl3OGVEdnV0L2d2dmlCck1xSktadms4NHBzdkQ3VmxCdEw5?=
 =?utf-8?B?T2c4Q3JWVXJBN1paS3FFOGY5bURXbGd2eXMrRFNoOEN4OWQ2dUNoUXlXOHlG?=
 =?utf-8?B?UWt1aDRlc21TZ25kZ0JWVGpxYmZlaDl4My9MYkpET2FhMHEweTQvaFF6aWxW?=
 =?utf-8?B?Q2Z5SDExYkx5TTZ6U05iOUtsWUdvL0ROb0FrSTUrOCtaTVlWb0xGdDU2UHo3?=
 =?utf-8?B?UERDbFhWL2JWWXlCUWQ3dkxBMk5obGErNFR2cURSQ01GL3lTVFR5SlN2MkpN?=
 =?utf-8?B?TG0vZWZsTmJza0ppTXhQVXFYb0RXTzJoc1VZYU4wSzJrNFYyK1RoclZ1UzY4?=
 =?utf-8?B?dytRcjVqQ1lYdjlMWTlkNlNNVWU5cXJDRllBWkNmWTlwZXBWM2NWMjlhcTFT?=
 =?utf-8?B?SWJaWHBoYS9HeEdZQWltZnE1cXhxMkRiSllLdXdXaWVDRXY2aDBYMktIUlA3?=
 =?utf-8?B?eitPa3ZMWEdJNE5rdnp5SGxIOFV4NytGY1AzZWM1RThqbVE4USszMWIzRldD?=
 =?utf-8?B?MkZvb1BYYkUwSG52U0ltOWNQcXpZY2NnUjFFUjZGV1krcnFiclNMTmFZYnVJ?=
 =?utf-8?B?emxDMHBlODFWbzFpTHozbzJMdU9lbks0aXd0S3RzZlQvVjR1bmlRU1dTVTJN?=
 =?utf-8?B?RkhseVhpYUxkMEo4ZUtMNWhkMHY2ZThqUnlHQlpxcWF4Y1Fta3lOZ3VXRy9T?=
 =?utf-8?Q?d5jPRYYQdi38cNpNI/J2ScQXs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb338f4d-f7b1-4560-3c49-08dde50f8a34
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:15:06.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B610itaZMR537gBxZ/uCBqeMebezF31jqKvVQMBagSSNVkaktE+Fo8sUO+ooglwKZSgIvGv5t1QbaSFSgkpXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5478
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


在 2025/8/27 0:31, Lizhi Hou 写道:
>
> On 8/26/25 00:29, Qianfeng Rong wrote:
>> Change the 'ret' variable from u32 to int to store -EINVAL, reducing
>> potential risks such as incorrect results when comparing 'ret' with
>> error codes.
>
> Sounds this fixes code issue. Could you add "Fixes" tag?
>
>

The 'ret' variable stores negative error codes directly.  Storing
error codes in u32 (an unsigned type) causes no runtime issues but is
stylistically inconsistent and very ugly.

Logical errors with 'ret' only occur when it is compared against negative
error codes. For example:

u32 ret = -EINVAL; // ret becomes an extremely large unsigned integer

if (ret == -EINVAL) // This condition will never be true

This patch reduces the likelihood of such issues occurring. Since it does
not fix an existing bug, I believe there is no need to add a Fixes tag.

Best regards,
Qianfeng

