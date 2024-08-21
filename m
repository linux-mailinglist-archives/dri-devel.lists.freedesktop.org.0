Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B9E95A713
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B073C10E05B;
	Wed, 21 Aug 2024 21:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kPHwYW99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D710E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:52:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APRJMeo5zUkuT7HIN5CpgGPYAFfPY6O1I5VyTM5M6Idmtb+Cr0juELIedEEODeOMRy2rOJJTb4Y4sgY5C2CPGCdRQSgtXqaVJ8I9ymWcm7vUERdT/gJVtiRIjK3A86y/104/wsluMDrJU+6sEbPw/Kr+34bSAzFL84k+WUYF2nudKESBb0yG4MUqXhQffvze89LvRf7EUPKb1/V9oyQOTIHO54YqdbIIdmZnR5IT3gClFc8zHPVv3jH8H4xHdLTojYWUvanA1EysC6g88L+M+5OSRKjRjPXwy6rVOFf2HwwB1bAACqEDpM2TGUVohaA0XY7ZNtb9qyzCkfupg+kiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtZQf+ArabNBcIrRh5yxDtysG8/fNEyAOER30PyPZVo=;
 b=xwHQICurkoUQK2Kqp+JOu2PJA7yOANgkq+371HwhsnLA2VYCyjhqvx4he2GCoOwANZiFuUGbgd3PkVdPNCnBnNGKziG/MDUEqjB7FocLDtvBeESy9r4rwROA7dWamPh/zdWAnqt08MSHOjGZ00IJIm3BHEzCoDdUgOXKPRAE75wjJ+wNFgobHMrzKZW/nvGKKBr8Pc0mWUPO393m+Kv5IGHUIKX+LHP8c1y/a09js7pfBsj3J9qWT5ocbpCCHPHDPjdo64v2W9Ocd4vyzKP5swfukyQQ72YZjJthS3QT1M5HfKouxwMH9q7wgFRKSiV7S8e8cwjfXrFFTymK6aeG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtZQf+ArabNBcIrRh5yxDtysG8/fNEyAOER30PyPZVo=;
 b=kPHwYW99sf4nDWPavuPoZ/e3orT8+g7BdZmMG4HGw2wcEhTDWTvGWtWaXz98pGMMKsBfQ0rVhTEf76V69pYN/mN/c/odO8kU7TeCD7YjaSE64uYWoHC76rlIC5lJT0ON/LIx/zB7QPQQnUgByy98IPQ09u8y5riMhWoMFd9JChtZHBfouCu57FvjsOJwSd+MgyvfjX8IlFKaXr52MLRTpe1Ubyzwf9tDau9rLuaOxfBGFpautCPoxnhzz06CgEnBj9J+TUFLsjw/vtgcGY05LdK/8ksrLLSYxgpRJZJbF5lU63y9N7KP2PGkQ2yQWi4//e90puwDWf66l+6UlRiy7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 21:52:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 21:52:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] drm/panel: simple: Add support for JDI TX26D202VM0BWA
 panel
Date: Wed, 21 Aug 2024 17:52:10 -0400
Message-Id: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIphxmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyND3ayUTN1E01QDQzNzA4PktFQloMqCotS0zAqwKdGxtbUA1bVgcFU
 AAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724277142; l=1243;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4PxzKG5lvJRAkCjYgUJuczo94QC1XNCKpPKLjoa4hHw=;
 b=z9KUqbmPD6ocyI3WUs9KRBSaB1dyemPLvUYVSuPVvoh9KxNAPW/qV3MfHSK9kvC/31sfrmtpd
 t7YtE9XKVSECwywYI33fbzzkPriW+AWt7gZo/yonpCVBBq/AMky4ZAm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d889cad-7a7b-47fe-69c0-08dcc22b8c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEo0aWRjYlRwN0pDaFhrcXJhQjYwWkdSckFadllOdTFnazRuQXRwZUpLQ3Va?=
 =?utf-8?B?MGxKZTcrdU42VzBwZjBRZGVheW50TGd6dm9rV2NwM0YwaVFMdUxLN2xvUThG?=
 =?utf-8?B?Sko3cFI0UXRINVJHbVBsWkZwMTRmWXJDVDhtTmU1WWFmNDZiZ0hSRTlva3dQ?=
 =?utf-8?B?ZW1mUEkrSWtZMVZpZk5DZVY5SmVKUFVVT1B6RWV2NzFsQmpVQmVWSU9ydXBo?=
 =?utf-8?B?enJwSjBCSU5hdmVnalV4ZGJVRllzaWcrMlc5Mm1EQW9HbXVzM2tGUCtGOTUv?=
 =?utf-8?B?UU55Ym51THZJVzhRR3pTblFQK1hzZU52N0NqbllKdG1ESnIxWVpJQlFNN01M?=
 =?utf-8?B?aDFreDAvZEZvVzhuMVFWcm1rcG1QVUt4YmpGNzRMYUgvaDlLY2NDaWFkTnNL?=
 =?utf-8?B?TE5KTWVnQ2NzK1BJcW91Zk8rd1FrK0libWg4eVlUNXFqZ1N0M1lwaytqOVF1?=
 =?utf-8?B?eDFmWVBHdXN5MTY1UzlOY0k3YnFNV3Ixd1ZjYmI2QnlXcVMwa2FFLzZxMldF?=
 =?utf-8?B?ZVJ1RitWN0Z4aVN4Tk4vSXltZGpJVlEvUjF6bWFOZzFpWkJrNlpFSUR5K2FO?=
 =?utf-8?B?ZWp0czIyK01FVW1MMkhySXRNeDJVeUNXKzkvbW9BdjRHZVR2Q3FyR2htVzlr?=
 =?utf-8?B?UEsxdWt2Z3MxMkl6UnNoajhrbGY5RzVOWFY4QWFUZDdCMW4yZnQrMUVQY1JW?=
 =?utf-8?B?RW00LzRlNmxJUWx2YVFydEhFNmh1WXpYOEFKd3Z2Zkt3NEJFQVpkREVtZTVH?=
 =?utf-8?B?cG55TXhzdk1tcFI2eVUxaHlPWlFFVzRzK2Q1cTJlalhxK2pNTXZWd3pVelRK?=
 =?utf-8?B?b0FkdEM1OWRoTC9jTnd4M2I2SEtIVmpUMTVSOExHeXZ2YzJWS205ZDhUZFdj?=
 =?utf-8?B?a05HWjBya0Nka1J0bkhKSmQ4MmcrRHJ3S1R1czJMa1ArVDd3ajkzNjlDcUJp?=
 =?utf-8?B?aTZpa1JOaCtFUFpQdCs0c1FBVVlJSkRRTDBad0hjamlMV082RTJKOU9XUVY1?=
 =?utf-8?B?ZzZndTMzUFJobHdVTUFxNC9ZOVBGR2N6UFVZdVd4SWsyRWxJTHBaQ1EzSnhM?=
 =?utf-8?B?elg4cS84bDZKZ1E0RlFZbHJET2ExMDdzRFVweE1TMzlCQithVXFvUEpHRjA5?=
 =?utf-8?B?Ukg4SWxvdW9oMlpMQXMxOVFSbk91TkY3RmRqZDJZRkE5ZEsxVThSOVJhMzh3?=
 =?utf-8?B?NnJPcGtGOGhvK28rK0dOaCtmTkNaeXRGU0xjVUdCcyt0b1pmaXRBWENRT1h3?=
 =?utf-8?B?dll6blI4c2JacnhkYnl6M0ozcDRvL25oeTkvSWhZZ0gyZjcyY1FIVG9wU3hQ?=
 =?utf-8?B?dU9hTkltZS9GZ0dXMkhyZW9YL0NsSUx6MExRcDVZSHVKQ3B1VGpKT2s5djZi?=
 =?utf-8?B?YkMvZitNbUw4ZkJEQXY4RkhMSU1CTlJvemdQTkwwS2trd0Y5MEpmRmJHais4?=
 =?utf-8?B?RVdHV2s5UlcrNitCbmRuK2NtMjVEWGRRMklyOEJRdC82RXg3QVV2M0t6d1ZI?=
 =?utf-8?B?Vzl5R28vOWozbUFHT0tFQmhYV2lmbzdROFVkUURHWk5WZjZHLzZob21peTdG?=
 =?utf-8?B?dUZzTUdsamxsNXBSMnZUVG1nQXZRUGY0VE90bWEvbmpBWjd4QnRyL3hqelVz?=
 =?utf-8?B?ZStoalVtOU9jWXNsWmQ0bUNINGgweUFlYWlBYjQrYWFWLzVOdDJTamRmZ1hM?=
 =?utf-8?B?YWQ3T0xvL0JtNnoxalJpY2ZxQWVzMnJ2NFkwZ2pxVnUrRHQ2NWpvNTc3K0pz?=
 =?utf-8?B?Q3lNUm5halVSQ1VGSTdzZmVYMmt4ekg3dGVUdThPK3dUaWhNSVNwN0c0MzBi?=
 =?utf-8?B?a3JRdlZ0RFVlV3RVKzEzT0JVbjZESzhjRC9zaFV4SjZ6UWNKcXpwY1NDckNn?=
 =?utf-8?B?QmVzY3BGTjNrTWhIazRjRjlhTkl6VmJBOVNuR1pmWTJBMGxNNHRUVkE1WjI4?=
 =?utf-8?Q?syOW36Yfais=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V094ajl1RmdlUVNKblN0UXA4R1VvNmhVWUdYZGdmVkU5QVVBNnNnSXFETTRv?=
 =?utf-8?B?ZWNTcjZueDUzRGNIRDQwcFd0S1JLZURJV3FQaldiaHo3dW4vZE9ET0V2Y25X?=
 =?utf-8?B?RDRlWG5hTWxMV3QrbnFMdUpzejNvYXBWY0RCSEdDNmh3eVJTbUxsZ3J5bFQv?=
 =?utf-8?B?SkIzWkJjSUZraDBVc3JaU3h6c2FwcGhFOERXR3FkMWZxSGpQUjA3Yzc1SVBG?=
 =?utf-8?B?QmdtY2NmemdkTmVJNTdpNldNYkVkdVdPOUQzQmdLS1M5Uk9nMzArSXk2TWt0?=
 =?utf-8?B?QzZoU1ZhcmU2akNnM1RJMnJwb1FUUjlKVDZZazFoanM3NFpqODI3TEdIeTR2?=
 =?utf-8?B?L3JDTEtIWHJsL3BWTWlsSUI4MjltMkVYbXN4UGJYME5yTU5MSTE5TjJ2WlNv?=
 =?utf-8?B?N0RYKzMzYWNzbWh2c2VDVVhsUmlKalNRUVFKbG1iSXdINS9VTVNYKzMwSU9S?=
 =?utf-8?B?Z0JWd2o0M1JQaTRWTDRVMnFaNGRmcGhiWW1NaW9LeERDQ2VRVDBuQmFQNytG?=
 =?utf-8?B?ZFp0bmtmai9PT1BON0ZWUHRVK0Q1WVk2RHRlYkZ5L0dGajlNRjZnTlYyc01q?=
 =?utf-8?B?TUlxWUJPbU82aUFLTjhISWl5aFpTY3EwTklxRjBic3pHRFNnOVhudXJ3L0dF?=
 =?utf-8?B?SFh4N056STBRRExpM1p5VXVjWkplNHVxKythN2xObG5OUFZNVVNxdktJblZY?=
 =?utf-8?B?VjhiREMveHlycVh3L1h3eTlTc0NrOEd3WnVOQnVzS1Z5dTd4WjF6N04vWENq?=
 =?utf-8?B?MFdIekRVeGd3d1dsVlg1WnRtemNJc3N6L2RaOHQwWnBvV3JyeEtXa0hGbThG?=
 =?utf-8?B?b251bXB2d0pmVXN1VlpqaHNud2thWW5TTTkvRVhSeEJ3RWx2N3Npbis1N0di?=
 =?utf-8?B?NU5xVjZtQnZUcUx3Tll2SjhsVlZzU3VLTWg5Nitsbm1TRTMxb01ocG9TODNJ?=
 =?utf-8?B?SGo1TzRsTFFzeFZYUWFyTzlSRGYyeUtidzlCL1lSM0VkNFBKR3BIWEh0VXo5?=
 =?utf-8?B?aXp5dStRalBHNk82MXkyb0xKQjFlcEF3UFhDWkh3dXFzSEhMTmRqdmFnUm00?=
 =?utf-8?B?NHpYaW15b3FnblNXUS8zLzVOM1h5MkdEK0oxMjRTN1I0WU9BOGdHdnIzOVRP?=
 =?utf-8?B?aDc5NnRHVG9YTXExMlN1bFVlTzJEZ3RHTThKUVYrc1hXbFpmMkFXRkxSS05N?=
 =?utf-8?B?bkhxUWE3MSs0b1BsWnFGTWRFYWpBdUhsNDlDQkNNZTlmVUxSNWZHeUdwTnY2?=
 =?utf-8?B?VlpPbDllRWFrYzVYYXFMVUY4VnBMK093eW5rOG1RMzg1RHRSU2dISUN4dDQ2?=
 =?utf-8?B?cWRVRGE0aFJyM3QwUTdPYVB6SE1wTFV6Z09ZbVJzbGtDb2ZhQXNobGJGVlBU?=
 =?utf-8?B?NFpoYzIzMThMTGZkSW9xV2I0ajBYazhYZlNqSUJueklLd0g4b0ZTd0M1Z2Mw?=
 =?utf-8?B?WExMZVJHeHc4K3J3NUdjNEg5MUM5WHFveUlnWmJDRDFxbVNTckhqd1h4Q0l6?=
 =?utf-8?B?UEd6QVh5clduOHVjNVJMVXhIdVVURzRIemkwWVJkeU5oS2RtNnA3Yi9BNEVr?=
 =?utf-8?B?L1hJajhVU3h1MnhHVjRwcGNrRmo0VmQzZDVPZ1N5MmVGNXM5RER4ZjFWSVE0?=
 =?utf-8?B?dDFXN2hBY01LMllFL3hWODI5amtDTjJ0aWt0clFtZkJUQmFyQk84MWo3MTJh?=
 =?utf-8?B?bG5GMGtCbDV6d014dHZFeUNCNzBlaXZEbWJmODRMLzh0dm15OXVyV1UrR2RT?=
 =?utf-8?B?Yi9GbzM2ZFFBeW1ra0taWG9DeXkrWjVPcjlHV291dmh5VThiRWI1bmJacmI3?=
 =?utf-8?B?NDNvZ1VmTGRzRTVJc0RPNGp4V2lCTktuaHUwSDBpdUJMZkNvait6Q0tqK2lm?=
 =?utf-8?B?OGg3QzFZaUJ6ZnF4ZTY3YkNkOEVja1JEUjRyeUsraGZwQXphL3I3RUZlZGhQ?=
 =?utf-8?B?b3F4OVdybjQzbisyS2NGVkovZmNpNVd0VWlXVitqTXl3cXArRFpKYXd4NmVR?=
 =?utf-8?B?Z3g1bVd6QzhjU3NINS9kQVU0Z25UdVJQeEJyUk8yNnhrR0E3S1dYUFdVUkNl?=
 =?utf-8?B?aXJWMCtWbHp2U1Z0MWUveXlta2ZnMlEzNE1EdTdTNlBsblVoMHVKMGw5bTRX?=
 =?utf-8?Q?xSGc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d889cad-7a7b-47fe-69c0-08dcc22b8c3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 21:52:27.2991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfMPqAq6+eUttKM1KY4VV71l0VEQFhBbqVv6oJiXuVX/GyJjUfZw9ewUtj0CAxWHTT/e1IGbFxddWMNWUhzqDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566
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

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (1):
      dt-bindings: display: panel-simple-lvds-dual-ports: add jdi,tx26d202vm0bwa

Liu Ying (1):
      drm/panel: simple: Add support for JDI TX26D202VM0BWA panel

 .../panel/panel-simple-lvds-dual-ports.yaml        |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
---
base-commit: eb8c5ca373cbb018a84eb4db25c863302c9b6314
change-id: 20240821-jdi-a5e016700cfe

Best regards,
---
Frank Li <Frank.Li@nxp.com>

