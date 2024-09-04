Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66896B55D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B8A10E6F7;
	Wed,  4 Sep 2024 08:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cHuWwZug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE61310E6F7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEmiMHAIFoPvGBycIKWIedl4Mc/qbithybsHbRMCFNMuFvC6/Tt6dfjAoVdLQULKR293+cRaypneVXGE4RPOb8cCEy7oFgbJ6Krs6tMSo840y9hhLWdUGgyKTqMz6xljT9iuwqPoyWXr9VR3RVvHu3DM462QHJRJPIk6LxkZyF19N5hBXNcp7z6h6xkRasyiFraFX4BX8ja4H77ooEmbcRXNdIOtRdjfoAHPcEY63xbtXRuF1dRA8blBUHor9bC5KgKq/NXjczj/FnqRRW9Tn/zVpCBzwVLIQxqoGpPZyY9erPFz/XDtnzO0Uh5VR4H/q5HBpjFhDJWu4gQVjiakSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3ZSo7Jv3Is4fzSPepZ9mKVJCVrFuTveK1A8Z5Qb0fs=;
 b=oAm76FDfew8/voCj2V2l68yFxC1cTsW4AlpW1aYMRzRI1aEWA0OnKvzt1r3RiwD95tVRaMq8MqdVUOOKFqY58RiehNxb8vlM1knb4GfHBwv5xDBk9bKCJACqCNSh1vu5RXE14kxGXtDkwymeKkLf2+y0owyGPnbyKkDN3LyaNgiUkvxJ6pZuQ8xBvVR7QxPaVdOZES3JGjfT5PPnBrXZobaUQR0AsVtCJideogVurMywFgRA1ecHJ6G2PMsFyahnQNjpUCa9wekCoNGMdHUy2XzOA9dNbELh6ynNsU5RYOU8dX0j52vn+JqaE9gnpljEqYCkDOHobT58qY5w6P8Ndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3ZSo7Jv3Is4fzSPepZ9mKVJCVrFuTveK1A8Z5Qb0fs=;
 b=cHuWwZug059zcoU4mNBKCt5DISK5btfw4XpAGD5zbsJo97v11tJqsDqBWO4zFS9HYJxFgieBgBaV3mqCpm1HFmX2SSih/dbynIPPGnyVGpz8tK0WiFte6dE0zzKM/Sf+7sVia6/WGhWCjG1zJYxG9wSJRDViB9qWzzhlTnmnH+ypdLcDegfn362yEU87fhygRKz6dhdscmKj79OMzHplhIV2lt9AvCTNCz7rDBzMEt8cdJvhaADpyvVuUh8V/YoUkT4gT+DdoKkvNxzBVBZJG+3bFTq28hSd/PkJzFUHFOEWNYXZMicUWfkUAbennswAX6/U19kq7a2NZxKhU3CJYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7902.eurprd04.prod.outlook.com (2603:10a6:102:c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 08:48:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:48:24 +0000
Message-ID: <918336db-3c3e-4b5e-a9c8-096c9290f9d1@nxp.com>
Date: Wed, 4 Sep 2024 16:48:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imx/ipuv3: ipuv3-plane: Round up plane width for
 IPUV3_CHANNEL_MEM_DC_SYNC
To: Paul Pu <hui.pu@gehealthcare.com>, p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: HuanWang@gehealthcare.com, taowang@gehealthcare.com,
 sebastian.reichel@collabora.com, ian.ray@gehealthcare.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <20240904075417.53-1-hui.pu@gehealthcare.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240904075417.53-1-hui.pu@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: a47dc9a8-4997-4f1b-748f-08dcccbe5652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVRqSlRJdXFzaFhORmVDU1NOTy9BRjQ5cDRYNXAvQXBERk9pdGJQQlZKVVZv?=
 =?utf-8?B?TVk0bGlJbi9WNGZ2Rkg5bTVpekVqODlDZStwMkQ3amorcDhiYWJhUkRGRmN4?=
 =?utf-8?B?UGE2Z05JaVhQMjR2WklxVjNZZitTVUh2N3JuQ2hLbVNpYWZOTDdyYkdqc0RY?=
 =?utf-8?B?OVc3NWp4OWlHQUF0TlpxTVRXZXhRbkpiMmpVVGJzU3RDUW50a2Z0MDVTaTd4?=
 =?utf-8?B?eUNYZUhwR3Q4ZzV3elNiZmRCOWxnVTNscTJ5VVY2blJqK0twTC9xR0U0djly?=
 =?utf-8?B?L0pxNWk4SGNES3dJMXVKODRSOWkxRzdQM1ljeEp5TVpmUjV5MHhaeDNrL0Rz?=
 =?utf-8?B?Y2pzRlBjUERCNkRpYzArZWhhMmFIc3cyRzY5MW85eUp0eVVRTnkrVE5aYVFh?=
 =?utf-8?B?VGxPZklOSnFvNHgxb1BGL0JJdExRTU15TXFPV0lxUElrRi9KRjlUcm85a2pU?=
 =?utf-8?B?eGFCQ3hXMkFpYlpNVUM2VmZrRGtQR3BkRXluQk5UcEJQN3VtRjZrNnhTaDFQ?=
 =?utf-8?B?OERNNUk1UVVWOUlTTDdvbm5LT215eW13U1AxYVRsQXE4RlQwVUNja21DN3hU?=
 =?utf-8?B?M0FKRHRLOFQvczl6SEoyUWkxT2R2S3FUSEdFUXR0SlhOamg0MUxEQy9NUnFZ?=
 =?utf-8?B?M054UDNGN1cvNUlIenNmUkgzNXJ6T2t6RHhYTWs4SFloY3I4b1lOd2tOREZx?=
 =?utf-8?B?a0VhVkhmYWNFbXhDOThDT2doK3RlNlMzNXVtYVROQnBxWlBZdmQ5VittUG1s?=
 =?utf-8?B?TjFML2RNWm1UbER5SXFFdUhZUjBUd2tKcHNjaE5ROVFoMHZvcjNWUDU5cVJk?=
 =?utf-8?B?ZzR0VnpGTld5SWVwN3J5ZnB6SXNyQk1ndnp2dTZ6c3N3OVpMS2Y5S3MzYzM2?=
 =?utf-8?B?SjQyL2pVTENJNzRwU3BRNW4vR0Z4YmdNck93dVZmYXFDQ0VuZCsyRGtkeWk4?=
 =?utf-8?B?bFhvWEdBTGc2aURqK21NZXkwVGNudENTT2RDbzFjaDNTd21FNmYzbnhuZE5D?=
 =?utf-8?B?WGc3TjZLYnNab1FJKzNMZEh3NlY1SE8xUi9pbVJQUDFmNm5Ic2pNL0FrWUd0?=
 =?utf-8?B?MEx5NHRBV05TaUxzSFZkMDhmNFdPR3J1N1hVNnFPcW5ySWJiMHY4Umw2dHlx?=
 =?utf-8?B?TXQ2bkVyaGpkUTFCbGJjcVV0azI2YnJIVS9DdWR4cVNIUHRkSWplaXdVMDl6?=
 =?utf-8?B?SzhpVVNqM3NKVFhEajBEOWlnN09nU2VHd09jNThoZzRWZXpUeG1HWTUyRys3?=
 =?utf-8?B?QW90eGhVZE9zaFVZQ2txaE1TSDcxVWk3Nm9KSlA1S1VVMW8rM3RHWFFzZ1Bm?=
 =?utf-8?B?a0tibHQzTTBldE5ZeTFRWjNyTG96TnFYT1krTVR4TytQa1UxMnViTjQ2VHlm?=
 =?utf-8?B?eVRYdTBoVTdzaGxMeVFBQ0pvakxxOEg2bk5CVWxVbFNPczBZLzdRWWdtejhE?=
 =?utf-8?B?eHdRU1JucDVyTEkyaFYxbFdtS01YKzZ1ZmdVckVGZ3BIYjMyQnc2eDhBUVBO?=
 =?utf-8?B?ZVQyVzFvdnpYakNOTGovTHl3TFQ5WHl3N3lmeTYzZ0RjVURsbERURlRNZEQ3?=
 =?utf-8?B?NUMvaXNGNDFxVU40Y0VveXFnQktmMkdxTVZ5L0RRQXZ1U28rNVAwNEtBWGlW?=
 =?utf-8?B?MzlEM1Y2RW9ubVFwbXRWRGZnRUlSQTMyMUFsNWxwWTRydEoxeWVySWJtR0hS?=
 =?utf-8?B?Q3llS2ZQYmpPZU9RL2dtUnI3T2hKNm1UUHpjK1VCVXgyUGJ2VURodHJPNlN2?=
 =?utf-8?B?cUYyUHZxNkVORTlhTDUxY0Z3Z3RQMEE5aUpEdzJrVDQ4bEFkSTF4eVAvYksx?=
 =?utf-8?B?MWNtbFpyeTJqNTF3L1VTSnpWakxWOWQ1aTExZHhDZWxLUjhDTzdNNksyYUN2?=
 =?utf-8?Q?0zVkVVPtRfsjw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBxcUdaY0ppNHA2dE9QdUVobHhDcy94dktYSk9hV2g3OE0zcm5YTkxUWnA2?=
 =?utf-8?B?bzBnZG9DdDQ1SWtBVlo3WUtHMGxmYXhpSmxqd1ZKL3hCNVFwZnkzUm1CSXI3?=
 =?utf-8?B?WlltelYzOVpIbkh4eHpvaUwrbHlDYVRlSEs4MmVEL3JDWldkRHdERDgwckhE?=
 =?utf-8?B?ZmYySFlCTGF1ZUtKRFpIUi9GbFhiSTFxV2hBRDVwckJteVlwYVBWTmJCazZQ?=
 =?utf-8?B?YzFDMyswdTdPeTVQellHUWRwSktvT2JKd1cwVlpsZ0xNT3dOT282NE5xUy80?=
 =?utf-8?B?ekJhbmVVUEppVkxSang4RnFWK2U3QjRwM29oa0xIM1NRdC9pYkw3RjNGMnMy?=
 =?utf-8?B?WGlhZi9PaUFsNDhJRU9pc1JEUUZmR2V4d0NtQU10MG8vbWhpSDlYVTYzM2c1?=
 =?utf-8?B?VG5aWUNOcXdPOUdtQnZkMnV6MXc2emdsZGx5U3YvMVVRQWttaHhiWUwyelVm?=
 =?utf-8?B?VG40NnJ2akxmUm9zcmJLdWZ1REJmM3BUSlFIbXg2L0RJSUtRbG5xUWQrYzRR?=
 =?utf-8?B?dnI4aGcyam55NGhFRTMxSkJTTWFVZVp4emF0WHl2TFR5L0hzdHF0ejBRZlQy?=
 =?utf-8?B?TGVpVkdibW5TS01qR1RoT0JjTjltRk1sbm5oWmtHRHp0dHl0VlhiY3lJcG1E?=
 =?utf-8?B?ajRSLzVGQm9oS3A4T3U0K1JTbjVxQzJxcnZNRkV6MUdrOGRBcXVBaExOUVFj?=
 =?utf-8?B?cUVVZ3E5SStCbHdva3VRMWM5Ly8rOUxJZzd3TWpBbHRrYW9hWVJUbWRXMEZI?=
 =?utf-8?B?cnJkYnpkTGVseDdHRDFVRGVFODVIVDM5S09iY0VPZTJnaEN0czN1ZEZHNXBx?=
 =?utf-8?B?NERudm5iLzl6ZWN1WE5SWWVleWtpTkl1WVdPU21pcGhzTEplbDB4eDgzU2FS?=
 =?utf-8?B?V3RnckpuNnRldTJhWVJkZloxVGRMenVGdjgzTFhHQkF6V25lT3dsS05FTXJC?=
 =?utf-8?B?aDlCWjVUSzVENHdNdUxVL05MQTVjTHYxdzJMcTFPa3FIRU95TEpxK2c2Vitl?=
 =?utf-8?B?bVR1Sytib25acm53L05JN09CcVRQTS9zS2tscVpqWkNUaC9GbTVmQ3lUd1Nz?=
 =?utf-8?B?dHlZbmFsVHBBUmFnZ3NWRjlMMXpCQjlCamwwV0xwMmFlS1dxc01wSU82ZC9M?=
 =?utf-8?B?bFBjZVZZZWtlVm9oOVptZkxJQkU1R21PMWw0Lzg4cDNFNlpTa1FabHd6ek4w?=
 =?utf-8?B?MEhLVitaNnJub2NQM2E0THJCbEVSTG0zaWI5TU9rcnJxblZSclMwQTFwRVZB?=
 =?utf-8?B?Q3R5SmlCY05aVXJOZjdQQjBZLzFJcFFlUnFxQitpTjRaNTdYMmI0cExWekpN?=
 =?utf-8?B?a3laOTU2MGhEbldkUkp6Y05uckJlbDVuR2VQT2oxTEpxWXJ5WmtTSG8zMVJG?=
 =?utf-8?B?aEdFSW84TUdCT09yTW1DUVdsaFNjUGFLaWZ4OWxwSzFTcEJrMFNXa3BSVFZJ?=
 =?utf-8?B?OWgwZzBEU2pmNnMyRVJtcm8vTGZYcU9GWWdYZHUydW9BK3VJK0JxclB5MU1o?=
 =?utf-8?B?MVNSMnplM2VsWndXYm5XR3lKYnM5VVlsRkVaYlhIaEU1YlFyOUtqdjlOb2c5?=
 =?utf-8?B?S2pXNFJqT0U0T3hJdVBDWmJ0UWtVQUhLVjhiTVErU0lhUWMvNWRueHBtdmEw?=
 =?utf-8?B?OW1CVG0rem1hSkRjSkllNHdJWEZvdmNmeUxRU0YyeGFkckU1VHFPZXk4WDlK?=
 =?utf-8?B?SWhkSXVZM0hWRXBJdk1jTnZJdWhjcFIvZDVWRm9mY09PQkQxa2R0RXpOV254?=
 =?utf-8?B?U29WZWZQaFd6bmZPbVpjSHBuamNKRWxNSExqK2YwbVJOdEJ2cTlBYitLdENj?=
 =?utf-8?B?YkdqL3QycGpoMjlLUXV6T0ZXbGkxRXpJL0dRZUdBb3F3R1VzUnMzSTZOVGFa?=
 =?utf-8?B?MHN0TFV2Zm1KaXkzUlBoS3kyemFxYU9kTGdPRXJPbklnTXFYM0VjeEc1UWFH?=
 =?utf-8?B?azd5RnV5all3U0xLak90dHpVK3QwcG0zc2Z3bUhsOWRCRmU2ZU85dU4zaEdS?=
 =?utf-8?B?a0FVcHRoajB4OEsrc24ySndWMTI4eEgrSDRhek8zN1NzVENSc0JIQ0trV2dt?=
 =?utf-8?B?OTVCMktlTk5VclNaZ3VQeVdYdlFnVWhOOUt4ejV3dE5Pd25iVzNzK1BvV1hq?=
 =?utf-8?Q?LAjj9dL/Sc0//6Xf7u/4+fg60?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47dc9a8-4997-4f1b-748f-08dcccbe5652
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:48:24.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDl5Z3AJNO0hli7oqmvnCG4xODx0EZFmmGhfGZnTugLO9VPYs1cHncgwa0mCDyE+eyPHH1p1360eALs1YFvvaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7902
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

On 09/04/2024, Paul Pu wrote:
> Cc: stable@vger.kernel.org # 5.15+

Why 5.15+ ?

I think it should be 6.3+ because below commit introduced in v6.3
moves ipuv3-plane.c from one directory to another, which makes
this patch not being applicable to v6.2.
commit 4b6cb2b67da8 ("drm/imx: move IPUv3 driver into separate subdirectory")

Or, it could be 6.2+ because the culprit commit 4333472f8d7b was
introduced in v6.2.

-- 
Regards,
Liu Ying

