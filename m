Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B126FCADA11
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 16:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D010E479;
	Mon,  8 Dec 2025 15:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3VYW7xo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013063.outbound.protection.outlook.com
 [40.93.196.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9481010E100;
 Mon,  8 Dec 2025 15:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYOpddlolLfDcqzVv9Hs9NDKElQc7kUHM0v/ERmYmsp8g3TIZ1n1z7r0ZL9d7JNzpl+5iup9QVLwFNiptavVBBYr5sDPpOhzs1h8vqp/NBtyYlw0stV0ZdC99Zrm06W0pRsflwrFe+LEREdCfsh+RGxK32f01hiCVApFyOMS5l32vRnL2JJ+daaV5BWlOZFDV18JLD+u9amiHZHgyM7c2jAcG2f6H95Bk0fQ9fyh/lpJBAjuQANRsjSlked8lZaq4FwbA2PAg2FP+sOOmGB2+uv7Wqqd634x272Jc6gIzvS86CVOrWx2lepepjfoFtjam++1+5uagP0FthrOv0BrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI6gYMN6HMmhV4JdTgO0kI8A5rGndYCC0xlP5qPNIRE=;
 b=dDFbiF6woMvBsIb8a35DP1K5aDjM1OySDluMHO6MWqkl5AmIh2hgrMUrhLugiTGaXrmXZTr+zMfQJpwtyoowbvMpETQUB7BK8oQNiXfOrv44xcbQTLjgCVoLLz8zIb6+F7outweVzc66opttSakwIK8bmXgyvIh1u6Bf42ZCXyJA9RCoxG3ce9CCgqZP48jeBEB7d0im8swQlopqS6qH5Kz/YWvItLgBhUbSwCe/x1u7qFmLhxkwXGxBmxeeOnNZ8Kl86pqxI7BBqYCYujoesKgWwsVAJtu/8hsZWnxgpOxKAFrhzM4iI5N4l/1Pc3LenzFgoFP+6xfQeq0d3TYoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI6gYMN6HMmhV4JdTgO0kI8A5rGndYCC0xlP5qPNIRE=;
 b=3VYW7xo0CyIMJtkT6JZ3zDWRsbSuTaGvnBJzAA6ywAzkgy8HmnEA8LpN+AAOQszjpcqPsLxOsKWYdrD94Vx9joVCpzO3aSdKQ3Ynqt4ACAGRInO/vHyBpGWUV27ed34e0+rlxA9NHtxrDE5EFndrxYtaLyksyqMW7qTLhjOEuQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Mon, 8 Dec
 2025 15:43:39 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:43:39 +0000
Message-ID: <3bff7491-d0f3-4ab5-807e-45678640d085@amd.com>
Date: Mon, 8 Dec 2025 10:43:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com
References: <20251201231807.287414-1-sunpeng.li@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::26) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5b134f-c2fe-45da-2b49-08de36708eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGkweFJENTRmcmV6b3JOdWZYeUZqUVhTczM5Y20zNXRMbzRlVzJwSTFyRncx?=
 =?utf-8?B?NGlJb1lXYURsQ1BpaFNqbDlkSXQzWnozYmF1czhkdEFtY3pUZmpCQVQ2VjNG?=
 =?utf-8?B?U01JSGVCbUJzMjVPMEJmU01aR3dxN2V0RGwrMk5EWXF4QmhOYm9FQ1RQTENM?=
 =?utf-8?B?MWZVb0JyaW1SVjNEMmtTTGhGSG9Uc2k1ZFNyNE1CWmwyVDR0UGRPbmt0Sit5?=
 =?utf-8?B?bXFNd1MrUkhneWVhejlldkhrOVVGR1ZDWEoycjJkNjRFN08xRmFWVm04eDJC?=
 =?utf-8?B?bi9zaWcrK3VrK095UzF4cEgrdmFDTGZqVHlqS01kOXMxZWl5Z25Fb2VieTI5?=
 =?utf-8?B?S3lqbTQwY0lXNWphMm8vQldKcFB3N3VDbHhld0xyWEcwa0JVamIvYUpDN2Mr?=
 =?utf-8?B?UytGQXJteWFqd2NuZnBsbnBqelp6azZYMjZ3MGd2T05UdDhTMXpnU3JpYkVy?=
 =?utf-8?B?VDRUTFRjMWJaTnBreW5WV1llVnJzMlVvRUJSU3RTcEMydVZBdGppQjNuZnFr?=
 =?utf-8?B?Rzk4RTNLSEsva0N5eGliL0RjekhsaGdSa1NrZGFsUGZMN1ZWeHl3elhGM0ZO?=
 =?utf-8?B?UzBFNTdKT0IyUXNWVGdmaFFQTksvZk91WjRYRElWSHZkVG94Q0tRRkZLdm01?=
 =?utf-8?B?bjhEeWlxbFVUYkdsdFpaaVJKWmsxYk82M0pKd2ZVNkloUGE0MEpUazV4ZEpH?=
 =?utf-8?B?N0g2RU91YmRQUE8yQkpET2pENzV0MUcvaFU4azRCaU5RN1c0bXJUL2xnaFJI?=
 =?utf-8?B?TXkvTkRPOC91cTRLcmZYcVRTVW1kby9UWDJqRGRnaFpIM3VoK1M5VXNGbWFQ?=
 =?utf-8?B?YmM1NlhtYXBkN2w3QjdEK1Q0WCsxdXRsWXRINXhxSlYxSVBtVm44UE1VMVlJ?=
 =?utf-8?B?TXQ4a2ZsRGhySlJSRnlOZmp2QUd0a25tSTczUHhpcXVoUXMxdExoN3pVMXNX?=
 =?utf-8?B?b3NkWEllaE5GckNHV0EzK202Y0RKMldjZElZWnd5QXZ1U3hXd3ZXaHpiblZ6?=
 =?utf-8?B?V0Z4V0tncVFnQVlJTzlITHlyUjFIWE1oYVhYbDJQOTg5Z2pENkdBam43MTVS?=
 =?utf-8?B?c002clhDV1BxeTBnejd6ZEJMaHJ1eVhxRlUzaENPZTB1cUs0Rlcyd1JDQ0JZ?=
 =?utf-8?B?NFZsTFR5eWFld0JVaTQzbEVhNnN1TFRhbjdHWDZ1S1dlTVRuZGk0NzlaaGxk?=
 =?utf-8?B?akpYeW5JcWg3YVRGWUk4U1BGa2VmSHBIWkZmbWpZb1kvTXFEa0NZL3NQTUtz?=
 =?utf-8?B?RjB5SVYyYXBBRThFbDlqT3ZpOEgxRzFHY2NMMjVWRm96cWNlVUp5QkdKNW11?=
 =?utf-8?B?ZzBXOXBhMEt3bDJPdUNmTGRheVViS3ZJcnNQdWs1VjBYK0pGYkY5Z1hDWW4r?=
 =?utf-8?B?N0kwd295cFB0RzN1OEZuR2plNUIrRE5IN0lpOHJrNlIxQkhQWDl5WC9Zc3Zt?=
 =?utf-8?B?MXhjaXNJOWtsMklnb01UR2JHcmg3LzdlYjd4KzZCL29icjFUSGprWTFFZHJN?=
 =?utf-8?B?UkZmZHhrY3dPVGYvVDFJdCtSNEQvZnVUZENhdXlqRWpGaUppUE1qRHR5Qmdr?=
 =?utf-8?B?Q1paVHVBWldvQ2RWU0xBNSt6R1puNUg2QzFUSzF1Q3EvMlhicS9ZYWdnaXh4?=
 =?utf-8?B?YmNEVTA1dkc2U0dESndUUkZrV2wyajVpditORVVXTDYzTTlqeEVaN1RuZHds?=
 =?utf-8?B?eUJyRndFbHE3K2RWU2dVZHM3S0dib0N5cVJ5aHI1V0ZlZHpaeXgxSmxsdkZu?=
 =?utf-8?B?UVF1NG1MSlhMdUlsU2RtWERKLzlIdVJoMk4zcThzbjYyTHEvNDFPTWtyWTlM?=
 =?utf-8?B?QlZSckRsejdsQnJKUkNjeDQxL2xhMlNWbldHQ20zTUowQlJVRDJrZVZPbVUx?=
 =?utf-8?B?aUdJeHdjYnk1WC8vaGNXT2p4QlRxRlZlM3U2TmJtdG8yUTYzd1JLdEZGK2xn?=
 =?utf-8?Q?7RMQ/+N5Ng7xWigzwgDRWwYDFkSW7RI1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU9HdDNuRUh0dXdPSk12STZMdUtBM2RxU1o1VmR5ZDdUUzBqU1hkYWN4cXc3?=
 =?utf-8?B?cld1UFBDUlJEcDBCZVJ0OUVxeWxFV0pMbGRJQmtwYnFtUnVuanJXNE5vbFJY?=
 =?utf-8?B?N2VoTGt0dExtVDhtYlljOWt6SnNUWCtVeTByb2V5MzdaemlqZWh1TnlCaWZ6?=
 =?utf-8?B?WjBzNDJkMUdFb0FvWkFLY0RtYms1bWtvQ0FaSlQ1bFdnMjBBWCtkTGpoQ0lw?=
 =?utf-8?B?YmdUcEdWaVY2WlhGVEFjcUZqWVFidFJXL0FvRmNoUXhDZGJyZW8yN3RkWUl0?=
 =?utf-8?B?a3M5U2lyTUxBMnRXWVJnYlZ4eGtiYzlkaG1NVnRsemJ0R0Q5ZE8wWk04VTJr?=
 =?utf-8?B?a0Q2OFhjQ1pENzNHQ1ZhQi81Uk5YanpSUzNuUFFNa1BBU0tvSFB2NVNId3U3?=
 =?utf-8?B?aXRkSmw2UUNzcEVTekZ1QXloTXh1VVE0VitZa0lSeUhqbVhnSGZmeElEMlBl?=
 =?utf-8?B?T0tOOFV5a2dkbS90OUJsY2Q2WDY3NG1BWWY0RFRsZHh2MXZ4NVJmaWtIcUVC?=
 =?utf-8?B?dVlURnltZlF5TEZFcGVYQ01PZTNMZFZMK2tMb2prMzlBWFZTVXQzZXlUSkg3?=
 =?utf-8?B?VUE0V29KZ25ka3JiS0FNaERXWDRnQU5rN3h3a3JpMVZWQVdTK1VJVXFmVlc0?=
 =?utf-8?B?dXdhdEdmZHZLOHBLSG1kOEJhWDBEUis1Ti9lcy9LdFA2R3hXNXBIOElRWGZp?=
 =?utf-8?B?azlXR0RVNXV2YTV2aituVzc5NDFmb3RBaVgwOExGTDhXUm5ZZE1aaXNxSzFy?=
 =?utf-8?B?TktnKzk0bTllWUtLKzJpU3JYa3JEQmFyODJQSDNJVXdXZUVXQXd2NmVBOVNp?=
 =?utf-8?B?REx0aks3dm5HbXBzeCtwRXoveUZPWEg3MzVlOGV1RnduVUZYK3dONm91UHky?=
 =?utf-8?B?ZmQwWWtablhVVEhsaVVrYkxJUStuTk0xM1JpN2xucVVjUFpiZG1DZWFiMW41?=
 =?utf-8?B?MUxSZTZrbXpVQU9MQ0pzMUF3a3lvNjRzZ0hEcS9xWGlPNE1uVVdqei80UW1p?=
 =?utf-8?B?cjZ0cUg3amZON1hLblpEZnpGZ2VraU1UUmlkdTBKaWdPN09yUEZiMWh5Uk1Z?=
 =?utf-8?B?Y1NodFozZ0FCVDFCY2FNTU5HdlRDN1czNzY1SmVaT1lYRDBSSTMwSE9FTjJX?=
 =?utf-8?B?bG44NTZkNEtlclUyMEMwaTVYWjdhaVpFaTJVR3QyckVMSjlvZjAvUTh5THJP?=
 =?utf-8?B?azNqbVZWdzh4TzRjYlBMZkxUaW9lZmpRSUtaK0NvZ2VUOGVwZUNmRG5HeFlM?=
 =?utf-8?B?UmNUeXA3YzRTSXQwblQrZ2FWSHBhVFNRVndteDdrRWI3aVFYUS9EVXo3WDB1?=
 =?utf-8?B?SlFrNDlYWHFYeUV2blpWbGF5cENxaHJlR3VTbFpPNnV5d1Y1K2t0dkxjQUgr?=
 =?utf-8?B?UnR4dExIbG5ldDNyRXMyNTUzUjNYVDRuSzFETllySlVjWjNRbnU2Q3pvQ2J4?=
 =?utf-8?B?a05PcmdDRkx1bmZrcUV2TWRHMnZLQ2hFTlkzNFBraFBRTkRKMW9aZDVteXlD?=
 =?utf-8?B?NkFVcElrb00ySGE1MGk1ODdVamM3cXVZdjIxcHFmTlpEd1hUYUdGcW1uR2I2?=
 =?utf-8?B?d1dkYytsQTEzQnZHalhDOWdXNUpaNEhUWllYanZ4M0FYR3ZOWGlhQzdleHFp?=
 =?utf-8?B?WWpJSXdYOTRVcnkvRFU5ZVU3OFhacnBKcVIyMEw5bWtvYnE1Tmp2enlTV2Ir?=
 =?utf-8?B?VjJueHJRTGpWS2NST1ZPbS9NSzByTjIxcURmR1YyUUJjODIzVUFobEloQjdw?=
 =?utf-8?B?RFh4RGdydDlzOHdGUUFHemhoY0NZTzRnaFl0VTl3UXk3MXI0SmNRdUtadWFL?=
 =?utf-8?B?OVRiektpT1loMGZ5blZnTENBUDZQOEowa3A1cHlkWWtQcUdmQmxlUWY5TlpI?=
 =?utf-8?B?c0JTV2MvOVFlWVN5L3FIRmVZV2kyTWdVVU1TbmVvbDBsbjdYR256RVJjcmNY?=
 =?utf-8?B?MkVpU1MyQnVzZGxsTDR6QmxROTNBVEh0eFg5VU42dGNodWdKaGRNTUtMeGxl?=
 =?utf-8?B?aVIrZFhydGxuMmR2clZnWHdSRzhlYkhhRkdCRWlXU1EweWVQb3d0c1dzZFpv?=
 =?utf-8?B?K0tjdk41NzRjbUFlZGROK25yeko1SUtKbUtEMmw1TlRvcjYxRVJyZDBaK1ZV?=
 =?utf-8?Q?9+GkI+2pNTqzK18l41l/LjnYn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5b134f-c2fe-45da-2b49-08de36708eb0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:43:39.2504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBdYQ3eloeGK+su55asnnAqYgTZ4ddJQtMT86dte7pAXob84vyqAh52R8/2jdhuQ2ez5GGMfQi20NmTKMJ2Sow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
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



On 2025-12-01 18:18, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> Some drivers need to perform blocking operations prior to enabling
> vblank interrupts. A display hardware spin-up from a low-power state
> that requires synchronization with the rest of the driver via a mutex,
> for example.
> 
> To support this, introduce a new drm_crtc_vblank_prepare() helper that
> calls back into the driver -- if implemented -- for the driver to do
> such preparation work.
> 
> In DRM core, call this helper before drm_vblank_get(). Drivers can
> choose to call this if they implement the callback in the future.
> 
> Signed-off-by: Leo Li <sunpeng.li@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  8 ++++
>  drivers/gpu/drm/drm_fb_helper.c     |  4 ++
>  drivers/gpu/drm/drm_plane.c         |  4 ++
>  drivers/gpu/drm/drm_vblank.c        | 69 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank_work.c   |  8 ++++
>  include/drm/drm_crtc.h              | 27 +++++++++++
>  include/drm/drm_vblank.h            |  1 +
>  7 files changed, 121 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ef56b474acf59..e52dd41f83117 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1264,6 +1264,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>  		if (!drm_dev_has_vblank(dev))
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		/*
>  		 * Self-refresh is not a true "disable"; ensure vblank remains
> @@ -1815,6 +1819,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>  		if (!new_crtc_state->active)
>  			continue;
>  
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret != 0)
> +			continue;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret != 0)
>  			continue;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 11a5b60cb9ce4..7400942fd7d1d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1103,6 +1103,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  		 * enabled, otherwise just don't do anythintg,
>  		 * not even report an error.
>  		 */
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			break;
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (!ret) {
>  			drm_crtc_wait_one_vblank(crtc);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 38f82391bfda5..f2e40eaa385e6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1421,6 +1421,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		u32 current_vblank;
>  		int r;
>  
> +		r = drm_crtc_vblank_prepare(crtc);
> +		if (r)
> +			return r;
> +
>  		r = drm_crtc_vblank_get(crtc);
>  		if (r)
>  			return r;
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d9..4dac3228c021f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1194,6 +1194,30 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  	return ret;
>  }
>  
> +/**
> + * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
> + *
> + * @crtc: which CRTC to prepare
> + *
> + * Some drivers may need to run blocking operations to prepare for enabling
> + * vblank interrupts. This function calls the prepare_enable_vblank callback, if
> + * available, to allow drivers to do that.
> + *
> + * The spin-up may call blocking functions, such as mutex_lock(). Therefore,
> + * this must be called from process context, where sleeping is allowed.
> + *
> + * Also see &drm_crtc_funcs.prepare_enable_vblank.
> + *
> + * Returns: Zero on success or a negative error code on failure.
> + */
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
> +{
> +	if (crtc->funcs->prepare_enable_vblank)
> +		return crtc->funcs->prepare_enable_vblank(crtc);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_vblank_prepare);
> +
>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> @@ -1288,12 +1312,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> +	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
>  	int ret;
>  	u64 last;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> +	crtc = drm_crtc_from_index(dev, pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (drm_WARN(dev, ret,
> +			     "prepare vblank failed on crtc %i, ret=%i\n",
> +			     pipe, ret))
> +			return;
> +	}
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>  		     pipe, ret))
> @@ -1485,10 +1519,18 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>  	struct drm_device *dev = crtc->dev;
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> +	int ret;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		drm_WARN_ON(dev, ret);
> +		if (ret)
> +			return;
> +	}
> +
>  	spin_lock_irq(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
> @@ -1796,6 +1838,17 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  		return 0;
>  	}
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret) {
> +			drm_dbg_core(dev,
> +				     "prepare vblank failed on crtc %i, ret=%i\n",
> +				     pipe, ret);
> +			return ret;
> +		}
> +	}
> +
>  	ret = drm_vblank_get(dev, pipe);
>  	if (ret) {
>  		drm_dbg_core(dev,
> @@ -2031,6 +2084,14 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  		READ_ONCE(vblank->enabled);
>  
>  	if (!vblank_enabled) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret) {
> +			drm_dbg_core(dev,
> +				     "prepare vblank failed on crtc %i, ret=%i\n",
> +				     pipe, ret);
> +			return ret;
> +		}
> +
>  		ret = drm_crtc_vblank_get(crtc);
>  		if (ret) {
>  			drm_dbg_core(dev,
> @@ -2098,6 +2159,14 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (e == NULL)
>  		return -ENOMEM;
>  
> +	ret = drm_crtc_vblank_prepare(crtc);
> +	if (ret) {
> +		drm_dbg_core(dev,
> +			     "prepare vblank failed on crtc %i, ret=%i\n",
> +			     pipe, ret);
> +		return ret;
> +	}
> +
>  	ret = drm_crtc_vblank_get(crtc);
>  	if (ret) {
>  		drm_dbg_core(dev,
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
> index e4e1873f0e1e1..582ee7fd94adf 100644
> --- a/drivers/gpu/drm/drm_vblank_work.c
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>  {
>  	struct drm_vblank_crtc *vblank = work->vblank;
>  	struct drm_device *dev = vblank->dev;
> +	struct drm_crtc *crtc;
>  	u64 cur_vbl;
>  	unsigned long irqflags;
>  	bool passed, inmodeset, rescheduling = false, wake = false;
>  	int ret = 0;
>  
> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
> +	if (crtc) {
> +		ret = drm_crtc_vblank_prepare(crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	spin_lock_irqsave(&dev->event_lock, irqflags);
>  	if (work->cancelling)
>  		goto out;
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a..456cf9ba0143a 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -860,6 +860,33 @@ struct drm_crtc_funcs {
>  	 */
>  	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
>  
> +	/**
> +	 * @prepare_enable_vblank:
> +	 *
> +	 * An optional callback for preparing to enable vblank interrupts. It
> +	 * allows drivers to perform blocking operations, and thus is called
> +	 * without any vblank spinlocks. Consequently, this callback is not
> +	 * synchronized with the rest of drm_vblank management; drivers are
> +	 * responsible for ensuring it won't race with drm_vblank and it's other
> +	 * driver callbacks.
> +	 *
> +	 * For example, drivers may use this to spin-up hardware from a low
> +	 * power state -- which may require blocking operations -- such that
> +	 * hardware registers are available to read/write. However, the driver
> +	 * must be careful as to when to reenter low-power state, such that it
> +	 * won't race with enable_vblank.
> +	 *
> +	 * It is called unconditionally, regardless of whether vblank interrupts
> +	 * are already enabled or not.
> +	 *
> +	 * This callback is optional. If not set, no preparation is performed.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
> +
>  	/**
>  	 * @enable_vblank:
>  	 *
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 151ab1e85b1b7..5abc367aa4376 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -272,6 +272,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
>  			  ktime_t *now);
>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>  bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
>  int drm_crtc_vblank_get(struct drm_crtc *crtc);
>  void drm_crtc_vblank_put(struct drm_crtc *crtc);
>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);

