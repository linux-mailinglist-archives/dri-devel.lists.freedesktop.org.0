Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38578B0D4EC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864F10E3EF;
	Tue, 22 Jul 2025 08:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aDXJdV9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFC710E633
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:47:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9VVmV13uNBvVKAbkBUOJY16n3Q4GxiqMinQmEWWWMfVv1GJYJMAf5UK+NtE/LZoFNu4d7ARh+iz3Y2fFNawwkELk2nk+GUUa7Bm2d7sOW5mvxHMDmdhehC4lD/FPKxZ9aAkKfuC67Bg6guwmBwEy5GxoNSNC1wWtldZut64M5wu3/EsmU9jjZfhNQ7pFZ2AhUB6uovpt45ZUJnOexq7EwzRtx/NToRV9SFtHb87RG0yvIMA1L+auvGOQKXwVqMEpn6pst4VbOWkfhIa/KsZqPsYqBV0ky2XvE54ye+30a+4Ez/cHCHCRe8X2v8uiJ9PtWcDa5I6JhL8rzyrS3aKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8OMZ8x5VbL8KwCJ7pghpo+qa5X3kNLeWB05NMj9hrg=;
 b=fpuy6LaWHRzgzlo4reebm2lxm8MKKz5JWlogy4Kp+M4EtDENztWo7U3pxNegeReljFz6pJ2xOokHbFu3c1vBeR9jWXz7uFZ8/3UJgwzk8LSoEmQXzwPNPjd8NsxfFqz/Bc4bGBudf2iyoK1RRK5bWX1qTpCEITekNM61xJpsblv8sWrQ1zYpEz2F/DmDgm8y9wiEimmXJ2zogzp4IPGnh7j0BVEzNW+W4eFdxNDQCfTEqZbldQZagrGMkMmWkFrCJd/KHHRdTSqdVRG3IPFwx5xvj7iZxprPhmg2YraS2NME45neYZ6uGm6qenHbzcVOsWJ0SP3L+CdzAGW3hkX0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8OMZ8x5VbL8KwCJ7pghpo+qa5X3kNLeWB05NMj9hrg=;
 b=aDXJdV9AHVCFFnd1qOp7nhVbAzP9pkwePIf3MNN/Q6f2mGV2nK1xUefHgJrLT5BrA8hgcsd4/Xi4AfxyxkSjRc9/uQIroo2qVstu53xPugEgHnqpoun7fdc+v/uVWFxH/TB96f0g2dZCDmEVv9X83IvG6CdHOR8AC8rd3SDDKQ1PsIxlASjLKuftUqjXKoOvVo1IKbzEanUc9FykNFSd2shDDL/AVPKYZgcXYinTtMdnRCA0GQ4Yq69Ud9UbmhEo3mWIqFquhtjBl/5RNxNFxTi4rNlFY4cpkgN7EqLpW0OCWWaI2ahIv+Okc4UKGrCXeKE0G7OTkQILER4cbRrhPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 08:47:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 08:47:35 +0000
Message-ID: <e7c90b0c-8aec-4fe0-85ef-a629e67a56a0@nxp.com>
Date: Tue, 22 Jul 2025 16:49:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250718101150.3681002-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: be420d0b-3522-4836-ae55-08ddc8fc67d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejNydjBqcnZodGdJNzg4RVpPdi8zTzlvUTI2UnhZVUI5dWwvQWNPUVlPWHdh?=
 =?utf-8?B?Wm5aUDJ4T1hKOWRFWFo4K0pWUjRmMVFMd1RjL3ErajEwMEtocTRDRkhaVW9M?=
 =?utf-8?B?dUZ6bmR6UE1FelJOeVR6bkErdWMyOHRqOS9QSVh6Vkc1Z0plbHZvMzVYL0FN?=
 =?utf-8?B?WC9YUDA4c21wN3gybE4xeHFyMnhHc1ptb0xLb3RTNk9mMkR0eXVQZ2tzYjRQ?=
 =?utf-8?B?cGRoRmVMWjAwTmRxdnV6ZW1qS05VNUhITnA5VHY2Uzc4Z0dWNzdxWC9vZjZT?=
 =?utf-8?B?eU5qNjNBNTJKUm9YcEJ2QURwdGZZU1RzekRMc0daL2tSYUtVZjdkbVAyRzYw?=
 =?utf-8?B?aDBEQjdCNXo1Z3kxZ0tQWTlSamhBdTZwTlpTOTNrTlc5SVBMb29MZytkOVlD?=
 =?utf-8?B?SjdpSjZTMkNKM2NpMVYzOE93Ylp6ZXRyblBLYzZJWkk5d29Rbm9kOFJKUDdm?=
 =?utf-8?B?NDRqdklwcFAvQ2JlNWN4bUhFYy9PT2VhYjJYaHd1bHBFU1BZcW9uM3ptODB3?=
 =?utf-8?B?dmhGT1VoanlYdkgwdHU5dGJxQWVVV2M0TjJSWit6eml0K0JxZDBKdkVWbnlO?=
 =?utf-8?B?T0cxdWxyZHJobnNVQTc5WVdtcmpTbXhPZE9nMUNucmJQNGhod2J5L3Freitk?=
 =?utf-8?B?bXhHWmI3NndhY2g1VzVReGo0NG5hQnBDWDFCbE1nN2NrVHBEVlB1QW1tYXhu?=
 =?utf-8?B?MmxScnhmQ1o0UGpZdWFFa1ZSSXR2RktBL1hpR0xETnFOeDlRODF4eWRzZGhN?=
 =?utf-8?B?OTZpdlFZV1U1STdjVk1VaEE0S2JIcndQZno5RjllRTROOFlNRFFBYS91dm13?=
 =?utf-8?B?eUY3TFA2YXdDSkd0MUo3ZXYwUnh3aVZwVUJXZE05NFh3MjBtRjdyVnBXN1Iz?=
 =?utf-8?B?ZTVCRS94WGhIMUlpcjFvSzhiVmtkM0IwZGxVcFhKOXJlWG9GTnlrR1cxVHdN?=
 =?utf-8?B?alRPUkt2ZzFnUHdyZy91OVNHU21uUVphMGVLRWxtN09tWHNMMHNkT0pzVWRp?=
 =?utf-8?B?NFEvOWhvY0IvTXRNeVowYnpiaHB4Mm8vUXFEbjFxd1pITW4vNzNxRFo1Ymp6?=
 =?utf-8?B?cHpQZ3lzYWtGM3FscEVjT1d0Z3FEK1A1MWJnMEdnN0hwWVMzZElPYTM5aVA5?=
 =?utf-8?B?K2dTVWZpcytVNzFkSGNlcC9DM2VrVUpTTGhrNFN0U1BEbDZBR2doWXlESTQ2?=
 =?utf-8?B?RnFUV3JDYUtadUd6UDhnVGtGczgyNWV4bGMreithNDFnd1l3Nks0c0Q4TnpH?=
 =?utf-8?B?aVVSbkNleXBDZVNFc3FYQ1VCWHhiRU1WN3NlNWR6QWpGVUk3cGdoRm10d2o0?=
 =?utf-8?B?cE1kbU9DSEduMGsxSytSSXNmaVRQZ1Q2eWZZMGJPNzljVjhJejFDblU3Q3Qv?=
 =?utf-8?B?U1EvVVcwckU0NnJBbUtFaStQQklsbkVMTDhxWGQ5NllFNmtoSE13bnFtaFli?=
 =?utf-8?B?ZWg5a20vbzBPSnZaSU1McjhyR2dKVVBjZng4c3BWMzNHWU50U3UweTNBZExL?=
 =?utf-8?B?UEJ0dExsM1lJbUJMWVMzbEovREdBaitCS3ZqUVhKd2RqUk5nWGlOTGFQOXJm?=
 =?utf-8?B?SEdvaGRrNzRYaGtEaElLTmxrMEYxNjdPWm5NWm9yalUxQ2VGTXhRZ2NvWDZ5?=
 =?utf-8?B?N1pGSW1kcCtBOWZWVnowYlRWZGF0czB3Z2N3T05MZUxZaW44Uk1MZDJSMzhY?=
 =?utf-8?B?aVRrcUtSUytjbFpMZEtwenpCWG5KQ0NvLzFFZ2hFdXhtcTRSSEdmeWhzRHRr?=
 =?utf-8?B?djZVN1NpT0NtNWx5MmNEVExoeFhsb3NUK0lGQXBSM1dUTXBwS2NnT2xGbHpR?=
 =?utf-8?B?blVBOExrcEFWdCtnZmtuQ0ZxMWRTQmJCeEhCKzU5VWFCaHcrMkxQYktHZlVs?=
 =?utf-8?B?ZnYzZ3lTUkdhd3FiSFFZUzg5RVU5NThOcXBHRUY3cUdDWTVGQXRpalhOQUV6?=
 =?utf-8?B?N1pMT0VnWkZibDRMM1ZRd08xL1BYN3VYbjhFcFZHOS9sTWllcU5RaThVdnpw?=
 =?utf-8?B?dEF5QzFubFJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnBka25qUElRWFovT01rTFF2WmVSc2dOcmt3RWVBNEExVjNXSWEvc1RLamVT?=
 =?utf-8?B?cHNWQ0lqNno3Z2RRNkRydUhsZk12RHBzQlF4UkVwMWphNWlhY1orKzYxazVG?=
 =?utf-8?B?eCttYVdobnphMTByLzlSQUREbWRRVE9ybG9qdGhLK3Jkb1FNeUpndXh0ZC9k?=
 =?utf-8?B?SDN3U1VOR3J3Q0IwVnVvaUcxdlR4MHhRRkE5TTlIVytyN2hPbVUrR1drenpW?=
 =?utf-8?B?YnhLOTdsUmxSMW9JZHlucDBCMHVObXhiTUpzTzFYdWEydjY0ZHU1ZWI0Mk5Y?=
 =?utf-8?B?T1FDNkZtZEhhak5iZW43UEdYMjhLK1dFdDM5ZUsxN2lzSlNPbFJOcE51RExz?=
 =?utf-8?B?VzZCRUxHRVFKMUpBTEwzaVg4UFFncWhLWklWblgra25ReHdYZ2NJaTNSQ0VV?=
 =?utf-8?B?R0JZTDU4bHhKc0l6SHFkM3FueTJUV1laS250N2VaWnJ3T2VPNzh5RE9DbzV6?=
 =?utf-8?B?UnE1MXZmU0Vub244MlRMN1hZRURmb0ZyWjZUa3VLYTl5Yk1OYjZEYlV2WVhp?=
 =?utf-8?B?b2FjNCtuUDFaRGU4WWtLbXJicEdSakVMR200RTFrenY1Y1VjM3lIdEhwUUZu?=
 =?utf-8?B?ZWJOeTRlMmJxQUN6UlJwdkFpUkl3Lzd0clN4eTYrQkRkMytTZlJMdFNJSkFs?=
 =?utf-8?B?dWtPTEVUb2VXSjFpWERBZTQzRGhMaDZJZCswWHZWL3F5T0kvTDVCbmVwRTQr?=
 =?utf-8?B?RUN1SW04UDUvc2dqU2NTV08xZ01ZcUh0UVJPVzlxbUdMbHpZK1FvSGcxbXQv?=
 =?utf-8?B?Uk5SZFRHVWdRUUg1QnBBMWU2bnVxWVQwZ3MwN0E4SzNRdFE1VnZ2aWN5TzUz?=
 =?utf-8?B?alFuZEgwaWhBY1JQVElIemF5UkJINlc4MjJZblc0bUJGb21nQlR1eFoyM2Rk?=
 =?utf-8?B?b3F5aVp4dHU4WjZqSFFuZ3Q1blFDZmVsaVNWLzFsejdlYnYxNjJDcW11Smpi?=
 =?utf-8?B?TkpGNGlaalY0U2x4SzgvQ0xTd0kxVXFUNGcyVXJsTnM3cC9KWlRFM1BONkdi?=
 =?utf-8?B?NVRrbk8ydUMrL3lJOStOblA0VG81SFZRMVRvZktTQ0d2LzFNQnJ4NC9VMzJj?=
 =?utf-8?B?ejl5bndTemRqYkFzcEVUYTlxVkU3dE9EL2ZEMjBPOE1DeUNWNDNZM2k4cXdG?=
 =?utf-8?B?Wm1wNG8vTTNESXFrakZyd1gzbDlCMmdwTXNTVmZyQnpkcTBGTE5GOWc5MFJt?=
 =?utf-8?B?emVwbmg1OUpTYURtMnRnNmdIR0tRQXVLTjIzV05UWExNMWNBeVZ0UDB5QXhH?=
 =?utf-8?B?aU9LZmpiVHZPRTdiVG5QRjFIalp0SENFbzFKWjBRZzBjdUV0L0V4TmJKajJs?=
 =?utf-8?B?MDE1Q01QMEkzN0VzVTRYT0ZXSStEQ0l3TllJVFFKOU9BemNZZ0FiTWhUOFBx?=
 =?utf-8?B?V1p3M2cxeldSOENoWThJVC9qc0ljcm9DckM1WHJXQVpVR1dobEtCVElHLyth?=
 =?utf-8?B?QlA1QzVsZFNtN09FZ3o4NkZNTzhNd2hrNGpuSVQwMzY0VTRCcUhleGY4ZElC?=
 =?utf-8?B?R29jSjBhR2JWRmVJeGhadS9wWUlTQnZYcW9veFhCcU5XbFgwT01KVGxmMU9y?=
 =?utf-8?B?OFl5cithOUczbkpKNlpUcXk1MGE2U2szREhHMmJKa2U1S2l3eHFPT0tOemx1?=
 =?utf-8?B?Ti96QkluelUrc2NYcW9QQWxWRnYrYUt6K3pKWi9QdUJBdkUvQkZYK3Q5MmFL?=
 =?utf-8?B?Z2wxZEZuOTc5WGdnMkRFN0NRcFNBS1hYM0NUWkZUWXpkYWZ2elpDeEdXSTlG?=
 =?utf-8?B?OGpDdGFzUHByNk5OMmJtczVwbkhhVGJjREhIb251NW9QWEJVZFpmQTFIL2F5?=
 =?utf-8?B?ZlVpNnZrVkRwczlMVnVSK29oRnZIUS9lTHVoZEcvTENxeHo5WS82NzdrdFEw?=
 =?utf-8?B?bFByMkR1OVVsVW10enJNVFF3RlN3RjJ1aTJaVlVhcVBZVDhvRnc5QmxWVHhh?=
 =?utf-8?B?TWVlV01raHZBMXVlN0EzVzJDYVpuakdvbnNvN3gwcmhVZVRnb1hQUDVWdklQ?=
 =?utf-8?B?NlIyRWRSYVlpREY3KzRid21abXd2R1lyOFQ5NVB0L1BSeUIzWFIrUGlGMlZT?=
 =?utf-8?B?blpaYmErRUtHdk9Rc1cvMDVycmwxZWRiTzBxTFgzVnlsck5ocTNYZUROZytF?=
 =?utf-8?Q?AShpnBxdDRctNCp4EeeHhgybT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be420d0b-3522-4836-ae55-08ddc8fc67d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:47:35.7988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrgLwolWnVjj3mf6gSz5F2J86EJ5I6JzGMEHjeVJUIAOgOB5q3v+eZq0lN+tzJjH+KvD55zjaWmxC8zZs0MFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475
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

Hi Shengjiu,

On 07/18/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 134 +++++++++++++++++++
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb85..d95fa84a8dcd 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -24,6 +24,13 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
>  
> +config DRM_IMX8MP_HDMI_PAI
> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
> +	depends on OF
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Audio Interface found on the Freescale i.MX8MP SoC.

Should DRM_IMX8MP_DW_HDMI_BRIDGE imply DRM_IMX8MP_HDMI_PAI as it implies
DRM_IMX8MP_HDMI_PVI and PHY_FSL_SAMSUNG_HDMI_PHY?

> +
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index dd5d48584806..8d01fda25451 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> new file mode 100644
> index 000000000000..f09ee2622e57
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <drm/bridge/dw_hdmi.h>

Usually, linux/*.h header files come before drm/*.h header files.

> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#define HTX_PAI_CTRL                   0x00
> +#define HTX_PAI_CTRL_EXT               0x04
> +#define HTX_PAI_FIELD_CTRL             0x08
> +#define HTX_PAI_STAT                   0x0c
> +#define HTX_PAI_IRQ_NOMASK             0x10
> +#define HTX_PAI_IRQ_MASKED             0x14
> +#define HTX_PAI_IRQ_MASK               0x18

The above 4 registers are unused.  Drop.

> +
> +#define CTRL_ENABLE                    BIT(0)

Drop CTRL_ prefix.  Same for the other bits/fields.

Define this bit under register HTX_PAI_CTRL.  Same for bits/fields of
the other registers.

> +
> +#define CTRL_EXT_WTMK_HIGH_MASK                GENMASK(31, 24)
> +#define CTRL_EXT_WTMK_HIGH             (0x3 << 24)

Add a parameter for the macro and use FIELD_PREP.
Same for WTMK_LOW and NUM_CH.

#define WTMK_HIGH(n)	FIELD_PREP(WTMK_HIGH_MASK, (n))

> +#define CTRL_EXT_WTMK_LOW_MASK         GENMASK(23, 16)
> +#define CTRL_EXT_WTMK_LOW              (0x3 << 16)
> +#define CTRL_EXT_NUM_CH_MASK           GENMASK(10, 8)
> +#define CTRL_EXT_NUM_CH_SHIFT          8

This is not needed if FIELD_PREP is used.

> +
> +#define FIELD_CTRL_B_FILT              BIT(31)
> +#define FIELD_CTRL_PARITY_EN           BIT(30)
> +#define FIELD_CTRL_END_SEL             BIT(29)
> +#define FIELD_CTRL_PRE_SEL             GENMASK(28, 24)
> +#define FIELD_CTRL_PRE_SEL_SHIFT       24
> +#define FIELD_CTRL_D_SEL               GENMASK(23, 20)
> +#define FIELD_CTRL_D_SEL_SHIFT         20
> +#define FIELD_CTRL_V_SEL               GENMASK(19, 15)
> +#define FIELD_CTRL_V_SEL_SHIFT         15
> +#define FIELD_CTRL_U_SEL               GENMASK(14, 10)
> +#define FIELD_CTRL_U_SEL_SHIFT         10
> +#define FIELD_CTRL_C_SEL               GENMASK(9, 5)
> +#define FIELD_CTRL_C_SEL_SHIFT         5
> +#define FIELD_CTRL_P_SEL               GENMASK(4, 0)
> +#define FIELD_CTRL_P_SEL_SHIFT         0
> +
> +struct imx8mp_hdmi_pai {
> +	struct device	*dev;
> +	void __iomem	*base;
> +};
> +
> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> +				   int width, int rate, int non_pcm)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
> +	int val;
> +
> +	/* PAI set */

/* PAI set control extended */

> +	val = CTRL_EXT_WTMK_HIGH | CTRL_EXT_WTMK_LOW;
> +	val |= ((channel - 1) << CTRL_EXT_NUM_CH_SHIFT);
> +	writel(val, hdmi_pai->base + HTX_PAI_CTRL_EXT);

Can you use regmap API?

> +
> +	/* IEC60958 format */
> +	val = 31 << FIELD_CTRL_P_SEL_SHIFT;
> +	val |= 30 << FIELD_CTRL_C_SEL_SHIFT;
> +	val |= 29 << FIELD_CTRL_U_SEL_SHIFT;
> +	val |= 28 << FIELD_CTRL_V_SEL_SHIFT;
> +	val |= 4 << FIELD_CTRL_D_SEL_SHIFT;
> +	val |= 0 << FIELD_CTRL_PRE_SEL_SHIFT;
> +

Nit: remove this blank line.

> +	writel(val, hdmi_pai->base + HTX_PAI_FIELD_CTRL);

Nit: add a blank line here.

> +	/* PAI start running */
> +	writel(CTRL_ENABLE, hdmi_pai->base + HTX_PAI_CTRL);
> +}
> +
> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
> +
> +	/* Stop PAI */
> +	writel(0, hdmi_pai->base + HTX_PAI_CTRL);
> +}
> +
> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +	struct device_node *remote;
> +	struct platform_device *hdmi_tx;
> +	struct resource *res;
> +
> +	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> +	if (!hdmi_pai)
> +		return -ENOMEM;
> +
> +	hdmi_pai->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(hdmi_pai->base))
> +		return PTR_ERR(hdmi_pai->base);
> +
> +	hdmi_pai->dev = dev;
> +
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 0, -1);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	hdmi_tx = of_find_device_by_node(remote);
> +	if (!hdmi_tx)
> +		return -EINVAL;
> +
> +	plat_data = platform_get_drvdata(hdmi_tx);
> +	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
> +	plat_data->disable_audio = imx8mp_hdmi_pai_disable;

{enable,disable}_audio callbacks could be set too late...
You are trying to probe this driver after imx8mp_hdmi_tx is probed,
i.e., after dw_hdmi_probe() is called in imx8mp_dw_hdmi_probe().
Note that after dw_hdmi_probe() is called, the audio device could be
functional soon, while this probe is called asynchronously.

Also, what if imx8mp_hdmi_pai module is removed while imx8mp_hdmi_tx
is running?  Leaking {enable,disable}_audio callbacks?

I think that you may try to use component helper to take imx8mp_hdmi_tx
as an aggregate driver and this driver as a component driver.  After
the component is bound, you may set {enable,disable}_audio callbacks
in imx8mp_hdmi_tx before calling dw_hdmi_probe().
And, you need to export imx8mp_hdmi_pai_{enable,disable} symbols.

> +	plat_data->priv_audio = hdmi_pai;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
> +	{ .compatible = "fsl,imx8mp-hdmi-pai" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> +
> +static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
> +	.probe		= imx8mp_hdmi_pai_probe,
> +	.driver		= {
> +		.name	= "imx8mp-hdmi-pai",
> +		.of_match_table = imx8mp_hdmi_pai_of_table,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index a56a3519a22a..9ca70ce80cc5 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
> +	/*
> +	 * priv_audio is specially used for additional audio device to get
> +	 * driver data through this dw_hdmi_plat_data.
> +	 */
> +	void *priv_audio;
> +
>  	/* Platform-specific audio enable/disable (optional) */
>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>  			     int width, int rate, int non_pcm);

-- 
Regards,
Liu Ying
