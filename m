Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60836B45270
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C6510E2CB;
	Fri,  5 Sep 2025 09:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="m6xS0CKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEB010E35A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfHy2SuzWZmyVgda+G4xNi41Q6tfv1itrTIMJlz+ZduBVDBHTL5AVhRimiGwRJBcgDP3GiwmW4hbMbEie6tof5hRyb4nlgAaaRMjx7fLhCV3JPDUk8sqgBTgUJCBrlknvL9eB3OGLfxwETvPpNac54QblKH/z3yZF79lTCxPHEOrQeWlvHVBbgbkNK1vJdQuGFuXoqt4ljIWaA/NE+G4VXbgFwXJbXnlgKVIxyhvafBmuCeUPheFQ880tDpKoIij6Os84OlsdSZ1m/LvurQbxTEn/ujddVZHn3+NZdMqauGki8s4s1xwqF0DDPoP5Bz0LRwp9+iYjg1umE9JZycRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoWQmc2UKURtBamhXCc85fT1apmAc+C5Bn+daRPSShw=;
 b=cOlWKxgHirRg8SgwMclb6lf5rxYpOFzaCbK1Ysw16t2S4QC5cRAjVba9rae/q6xAd0QOgR3tvZCmafHiM/aijG3GXMM3MfR2RnfnlmLbFh4qqP92kLkLuv/aPd0zyLWQ4aiEqaz2nRy0jK8W80HVO2bAsHYtXLgkNZVzd+lUqK47zutGYcrS7aN822F/GTuwl1EmyVCouTZTOAeaC6pkYosVEQW4kVGs24TFtabqdsaItgG9b1Q/5dnG1J1nMcnN456BXU3qqgVqFNBmDtAgD6F74N4JsSeL+uGpPfRFWP20Td/qNZ6PGb89DrP2eyTtSXNusBG5WHVmbGglQBwD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoWQmc2UKURtBamhXCc85fT1apmAc+C5Bn+daRPSShw=;
 b=m6xS0CKcFk7Cus3YxQs0/pTppImK55ObMQHaDQDkK/uZYBft5i9MzJc8QZ9s0q6giR5xcB7o1IcKEDIpReMdMzZYXMPBV1xSVhoy17K1jEsRmaVu3GEMSWyvLbP1HG9mHkqa5XAbV4W2mY/bd0twllcJ8HiK2uvQLBanS9uWdPsWn1ACCssRv4ciCFR6GAqb8s7592SUh+UCAw8W+IIAPk/Ou7dSeQu+OhKp5eQzszSwgjbjrLDiHISWamlvRTVZb3c//phLMeLAW/X9UWbRqjGscqvPef3mjzL0fIAjzDr2HUGs+pWEdXCpNvFRh4tAq0zTa3xR1+a+LkWahZlKaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8024.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 09:04:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:04:52 +0000
Message-ID: <5a481c11-5ebd-46d1-ba5d-095ecb6359f1@nxp.com>
Date: Fri, 5 Sep 2025 17:06:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: lvds: Remove unused members from main structure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To VI1PR04MB7056.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a1480b-0654-40db-d6d1-08ddec5b45da
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHlJUk15R1p6b2hKSVBUQjZUVlJSaVAwazg0RUFJdHVnbjZmck1DMTNGbVVw?=
 =?utf-8?B?a2FnL09LRVdiTVZZaHhkMGFDby9kUkpRZVJYdzdsTkxXTHM4WmxaamNpMHdO?=
 =?utf-8?B?dW52R3dpVmtVais4YjVlZlYrWFhlYU02V1lXMGNaNmNqM08wU0VBL0duQ29h?=
 =?utf-8?B?WFcrZHozL2hJV0c0ajJ6c1FySG81QXBHNkVTN0U3dXBzRDVha2cwSXRrbEMy?=
 =?utf-8?B?Umh4YkdlSkhFRHJzS3EzaG45c05CeEkvOUVkaTVZc2tLeG1yb1pMbU5rdXNC?=
 =?utf-8?B?dXhrcE5PcmVSdktDVkg2WVFydy96bXZ2WHppekJ5cWFaSkJFTk5lcGtucjRJ?=
 =?utf-8?B?cml2UVkzQ1FSbG5KUnk3bnRzMnVMRkdGdnZmZjN0N0g2eHFjeFYrUit6T2ZJ?=
 =?utf-8?B?eXZBOEtpUXkza0RDVlFIdzVpWkJaWkJ0UUx6NlRYU0RBNHJ5bXNOMWI1RkRV?=
 =?utf-8?B?YjhLdTJFdGlLRjFENlBBeFJOam13RVBaUGlaY2VlQklrcDNRdnZaOSt4blBI?=
 =?utf-8?B?cnB3dnAvd2laTjVXdERVZk5kMDNTNnhpM2ZXMUtMUWpmRFNzUFd2U3dhUmc4?=
 =?utf-8?B?WlZHZTNpT1c5U3NsczJFSGJremFFS2UxaTNBR3l5VVBsS2hOQ2RoTXBDSjQ5?=
 =?utf-8?B?ZjEyS3BMMXM1ZmZXK2pVcUU4UXNVZ05CUkpRKzhBU1lxZXNxVmYyZjNmOHJO?=
 =?utf-8?B?aDJWVTlFTDZvbks3bkVreVdJV01RZWtkZUYxNkRndXpMMEhpUFJueVI0US92?=
 =?utf-8?B?MHRzcWZxYXBVb0lSR3JIT2hIOUpqblA2R25pN3RINlMwajVldTAwckxPUFA3?=
 =?utf-8?B?WEdEUkJpTVUvNVZERDFZbW91NVhhT3o5b21JNlA2UkEra3BRVElIcncwSjVl?=
 =?utf-8?B?T2cwNjNJUSsyOTBTakNBM05IUlRHS0M1SWhqTXBlZ3g0UTJoZ21MVklYcS9o?=
 =?utf-8?B?ck4zR2MzLzBmbGdpUDl1WmJqU1hHZXo2UTZ0Ukc5KzlaSGREQUpCYzBCN1Rk?=
 =?utf-8?B?Q0V2NG03bGRHVGRqdEp4alpOMERqWXNBcUU4TFB3UTk4emk4QmxNcHpFWHdP?=
 =?utf-8?B?T044QmE4YitDSzNmbDZJNDMwcURWMUN1L1U2L1ExRmVWWThvL1oyK2ZSWjU2?=
 =?utf-8?B?MnJvRkNNdEYrL0h0ZlVpOStreHhlZTBPcWVQOXYrb1J5blJQaVdRQjBObk1B?=
 =?utf-8?B?cXpSbWpMZzFBNnFEYlR2M0pRNkRYOWJBRFRMM1U2U3ptTklEK0VLcE5WK3Rh?=
 =?utf-8?B?WHZ3NXUvTDZkYXp2OGQzeFlDRlhqQVZ0dEIrZkdHZjlKaXVKeVowc3ppOUJ1?=
 =?utf-8?B?MzVySlVKNUtLMWhDQnhxTTlidjRVMXBYN0xoUzJQQmpXVmRPckJmQkxhVU8r?=
 =?utf-8?B?NmNNRFNZbllCZWdkSmVrcUZTeDhDWW9OSHhiWlhFU0JXUm1XN1FCM09uN1px?=
 =?utf-8?B?QkczMW9XMldvSWlLb2Jrb2gyS1R0ZFlrNVZtMGtmYzFUNkdBaUNlMnhxSC9p?=
 =?utf-8?B?dE9xOEVIRjZaSm9vbWdKM1JGSWpWZlhiSFcrc1cyNzZoQVJsL3RIazhnQnBX?=
 =?utf-8?B?SHh2OTJLTXp4VkM0V3k3L1JpMUprUFdzSVBzNGlQS040RWExRkRoOGViUGtx?=
 =?utf-8?B?VDIwZjdnWHJGSjRtL05PZ3hsMStFL1BRK0NyVDhVbEtib0YzYWJvdE82TDdl?=
 =?utf-8?B?OTFWek9GbysyNkhIKzdqaXB6N3VhQTRwNlRKUEJ6ZEZCZjNyVisxSVVaeXNX?=
 =?utf-8?B?RGJXKy9yTXZreGlqRXBlbVJMcDRhZ2UwWlFVMmVoTDh5MHZVL2lOKzAxR0hw?=
 =?utf-8?B?ek1NTGFhbnUyRWlWelVlNzViak11aWRidnFCRzZBSVIvSitKT2g0U2dVVG9T?=
 =?utf-8?B?L3lLL2g5YW5Hb1Z0dGVyenpEZWZLRUJORWlqQ2FRcGVyeitvSVVtNlNTZHMx?=
 =?utf-8?Q?eGfwA3sTLoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU4rNCs2OVpMTURqVnc0STFNQ28yQk53WWwzckF6T2ZCUktPLzQ0MGU0cWg4?=
 =?utf-8?B?Zjc4YklBVURHY0dVcDNBNzJCTnNvblRqTzQvcE9Oaklmamg4WnRoREdpa0N5?=
 =?utf-8?B?Z0kzU1VuV1MyNEdFYkhQejlZNzN2UUVWQlMxc09HMTAxcFoyY2I2NUFtT3E5?=
 =?utf-8?B?WWhOdmJIUVZPMGJFUUIzcHBvMkNFNFYvU1E1eCs3KzZLVm84SlFuNXMrM2RD?=
 =?utf-8?B?bHM0QXFmUUxORDVnYjJXSFdjSXRSOTJiY1pVVEdvUlpoYVJMbi84M0F0YytR?=
 =?utf-8?B?WTFRSUh4alJkNHlrb0luQTJDVXc3R1BNdGRSdS8ySjF1bjk0SFdxUDExalVR?=
 =?utf-8?B?YmgzY0J1MkJrRk5JT3hyMGVkMmt0OHBzSkQyaVlLbzBHY3pnNEpnd0twem93?=
 =?utf-8?B?RW00QWtCOGZkeUdtdnhKMVFmNlNud3F3ZnVvbkpnM2JuM200SCt5Y2FxeVhu?=
 =?utf-8?B?SnhFYXBwd24xSXR0VFNHTHQ1Nll1RWhublJKSFFoRmdOZ3VFWE1yclV6L2xr?=
 =?utf-8?B?YThwck1LSEdXUXYydnhDdjd4UW9FYzl2V1RXYWhVN0dGeEpGRzVEbTdINDhi?=
 =?utf-8?B?dzAzNERtY09hZVBDeVRoZXc0NHFNckJVenRyZmM1RVJNUE5RMk5JMTZOcUpT?=
 =?utf-8?B?ZHNieEZQOEJxclJoa0x1UTgwWWQ0RXpyVlNPaHRWRHpjWVc2bVdKNUdVVTRS?=
 =?utf-8?B?V1ZwRVA0UGp4TW1ZQjJTUjcrUldFMjRvV1BQU3d1OGg4dS9NdmozR1RWUlY1?=
 =?utf-8?B?UStIc0VSS09LYkpMOGF1bnBjbG1lWlp2WTVhb1Nja2t4STVyWldnUXF6WEY1?=
 =?utf-8?B?SkNmWjQ5cGRHeVVBenE1WDlCVFZGK2pLQVRyYlg0R1hCcHoxbG5HaVM1cTFv?=
 =?utf-8?B?WXZsa2VrMjNVZTA1d1VvVlF3dXR5c0g2eW5SeHI2dU5HY0RjNDFTRnFZVHBT?=
 =?utf-8?B?R0dsVDQvWSt2MzBnUUNyNFZXTjdmbGs4b2k1R2Z3cmVOOXY5TnM4bVl1TTUy?=
 =?utf-8?B?ejRuQ3JwVnZoN2o4bFl0UXRPWWJGVlluaGZVczBsc2k2THY0eDdyWGMvakR1?=
 =?utf-8?B?dFlzcTNFTHlRdzdjQUMvaW5qemhmWEdpaXg1YWxaS0xVMUpTSmFhaFg2ZTEy?=
 =?utf-8?B?T1ZWN3BlTk1MeWlack84eEgvSUVZQWJSRUEzazNVK0N3V3FoQmJmSXJkZnFN?=
 =?utf-8?B?RlR6bUQ4V0hjdWVUNlNXckxNcWxrV3dKM3d5NTRQa2hyMUI0ZjNQMEJ5VEx3?=
 =?utf-8?B?RVp3TnJ4TmpXSCtuazdhRnJrM0YzMlQxUjhHTTJMUnBuNHJhbS9qN0JvR1RC?=
 =?utf-8?B?TEtLMHduTWdhUGNwWnJzTmtNb2s0dnUzdWJFbHBrZGZadWZxVzJxeitJZWlw?=
 =?utf-8?B?cmoyN0FWaVlGcnQ3RFBrdWdzMHEyYnhzQUI3REQrWXpoMllFUEtoU0kvNkoy?=
 =?utf-8?B?bkcrNTNYYTN6SlpFeDQraG92b2dtazlzRmZGd2VNb1JFUG5MR0dyQ2NaRW1G?=
 =?utf-8?B?TE1OMzBQOXJBbEFJRTNwSU1TVTFrM1N1ZlJRMGFtMjdsaXNXa2kwOU1hVVEw?=
 =?utf-8?B?Mk10RndBQ3ZPVW1KNXBjL25lNW5OVEZKRmxQRjU0QVNVQnVuNGJpanZXRVJi?=
 =?utf-8?B?NEJibGE2Q3ZUdk50WWFKQ290TWwxR3VndTJjTFR0VG12WDVJYVZ5cXNvblhv?=
 =?utf-8?B?R042NS80M2xXRzI3RDZreWtNQlFnMUdxa3ZmdTJlNkJZOVVSVW4xRGNZdXpU?=
 =?utf-8?B?UUIyUjlUcEVGVUU1V2hhS1FtMHdNVTNFVGxlS0MvMzlraExhQnVtRFcxcDdo?=
 =?utf-8?B?WWNUV2U0Y3I2cUw5TVhwd3JOT3JOQmFzV2VrRlQ3SEY1UmMrOXVzOGNhL0FD?=
 =?utf-8?B?clRPa3h0dnhOUTRYUDVtY1dXeEtpM3dxaTVlQ28yaE4wa3JvT0ZwT1QrcGMw?=
 =?utf-8?B?Y3MwR1Y2QVVoNDZtWXVkbkt2NHFqNUllTzVPMVUrSFZPK0gzaUk1ZWdmV05J?=
 =?utf-8?B?b1paMmVHN1NMZTNHb0M3NXVOQnZBSFZnYnFyT05BM25KODRsb2cxZTAyRjBC?=
 =?utf-8?B?bGVpb0laN0V3V2pKc3pNWm9RM29taTZPejA5c2grZURQSUtJNFZ4RithQkNv?=
 =?utf-8?Q?pb3qk7Y7YkjeYDhkBIv53sEif?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a1480b-0654-40db-d6d1-08ddec5b45da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:04:52.3472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEnSVLYZUl5g5YSRRzeuQOfKTsYuW5PQtEfDkXUNfi0eNJXFJj3D04BKkYmk11h69+mTD3yPxdKLQAGasbgubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8024
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

On 08/29/2025, Liu Ying wrote:
> Since commit 03fa454bb666 ("drm/panel: lvds: Simplify mode parsing"),
> the width and height members of struct panel_lvds are no longer used.
> Remove them.  No functional change.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to misc/kernel.git (drm-misc-next).

-- 
Regards,
Liu Ying
