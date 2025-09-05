Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B1B456B6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0B810EB8E;
	Fri,  5 Sep 2025 11:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="xO0Fp2Kq";
	dkim=pass (1024-bit key; unprotected) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="PQ8Ointt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2610EB8E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 11:43:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585BHhgd019505;
 Fri, 5 Sep 2025 13:42:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +Vp0ZHMDZ97NkjEO2PeHQOjhIYzMjldaYFs1fFWzdKM=; b=xO0Fp2Kqcl7z+e8t
 tkYG/lOMbSYDn/G18ukPVCEAu1hR8R6YOkqZKMD+YaHFQ4H7GwKYoYpCZaojNCY9
 h2KFTedP8gemfoR8+eUs2TWge0GNTZBJChCU1CvYRijs80+gpKBbXfNHNpu92mpk
 S9XCiuCt4im5xr+sK7fh/7LsWJsRhSX+3IzaHZxOBVgs0SIO1+jrBza3dRRqM/JM
 cRbE2qxQNzMj4m7iZ8VYSKyENy9Iz1hYcC2CbQlPJDnBIK2b4SDMFfa3u5UNEFEH
 UIEC4P864NcLx2Y/bc+wJbc0eE5iyQtOwIBqMyyRBj9Mm8Ss/XHZxlM9BLnKF+Lu
 NbFBHQ==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxttt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 13:42:42 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pj6j3KZBN7UTrn6G9XeHl2e0CmbDsmZ5k7pDiTfYcQ75CPGpA3SWRzBiUk4aYQPXfDGvrQsBDcTKpnqtI3R8iCvJB7m5iUdVTf1hx85DA1l+fpCbN4tmne8RX5yrY/GyoTsAGxOdbtY9irolKwrPX1JXefkSoXhPbHA4taMlUDmUBz/Z91nlGFAGXYblolf8AdklwJk+n5RPz/AbVjm8y3mcLo3faA6gcUfCQhO45/gTn3n9DFgWaHEudM+1PbuX9ieG4r0qCfjairXcBHLRcsB1Ck5P42c16Q2yHBPPhXH1IwSnLtNEwzZwRO2S43nQx9av+C3bV2fIVgUAmqIfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vp0ZHMDZ97NkjEO2PeHQOjhIYzMjldaYFs1fFWzdKM=;
 b=MZKoUGjMHryl9Q6zPbIdJr6Xw1ujMem9gzVQwa77Pxp3ha88qJYa/cwY5K60vpZrDPITMAzSDtKPI4meXy6FMI5b+j9yHQ5pRiT4Z4euBcrhpqLyV82Xz6yh4Q4cHanwHYkG2UNBozWSNeysSUue84BWC2aMNYkO80GqbRHvvZuB6OV3a+TTTAuzrzkxMQykKZV//i3vx7JXNHd5elHam62IMgd8MPW5zcBPATbD0oDAOS1lmHJFMBuBS2LiDJ5DZgN6ZbTTZLzHNpyozYz/LhsANVSgXQPtUSGzGH/FdRTKj1pjGF2TKI8wnFFbGh6AzDHGColGnJEnosuZ56jP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vp0ZHMDZ97NkjEO2PeHQOjhIYzMjldaYFs1fFWzdKM=;
 b=PQ8Ointtw8ViJj8gGZ6N7XY7ctq6yTU2azLDMyD6tx32LgWPuMSNTWWRPHrCUUQm8coMyw1a/CWXy5akLPf6xdPZAgAmv1DVfDEsLkf8Ok2RT90QjHE12/4nb0sfmKs7O3jPraKtJv12y+PI4UEZijCND4XNRcp0hkaQ67aoGj0=
Received: from AM0PR02CA0174.eurprd02.prod.outlook.com (2603:10a6:20b:28e::11)
 by VE1PR10MB3950.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:162::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 11:42:40 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::93) by AM0PR02CA0174.outlook.office365.com
 (2603:10a6:20b:28e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 11:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 11:42:39 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 13:40:21 +0200
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 13:42:38 +0200
Message-ID: <d49741bd-b5de-4765-be24-bc0274eee3e3@foss.st.com>
Date: Fri, 5 Sep 2025 13:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: panel: lvds: Append edt,etml0700z8dha in
 panel-lvds
To: Conor Dooley <conor@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250829-drm-misc-next-v1-1-fedb48cf50dd@foss.st.com>
 <20250829-geek-unearned-786928b128af@spud>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250829-geek-unearned-786928b128af@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|VE1PR10MB3950:EE_
X-MS-Office365-Filtering-Correlation-Id: 290586ea-4a7e-4ec3-97be-08ddec715189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXpyMEoxZ1I0eGx4Skx0UFZkRXVQNDVZbThIR3VTSVlVYzEwaFByQm91VUF2?=
 =?utf-8?B?SG9TR1RubFJuRzNBQjQ0VW1acGpCbUk3RE51OGc2SERZb1doYng1eE9USnc1?=
 =?utf-8?B?dUhtYyt6RnMzQktBSk8yVjBTMnFXSk4zQzV3WWE4eGVNcjlFTll6MnhXZm5n?=
 =?utf-8?B?MGhPTThoK1lNdzFCN0Njeld2Q2VMclQ3TEtsRW5qRnJleGVDQ1ljT0JuRUp2?=
 =?utf-8?B?dUtqZEFWdnhmckx0bDkwZXFzdUlhQlZCVVJPR1ZhVFVRVVdIbngvZHBlM1FG?=
 =?utf-8?B?eHB2TFh1ZTJ4OUJsZkhqM3A0cllwSUhsdExLdEZnU1loY1hJWXlVYU9zRlN3?=
 =?utf-8?B?VHp6RlhwZ09tOWxLL2tRS0pTY0UvWTJSRU9LVldLNHlENUZoMXo5cmNqTUl5?=
 =?utf-8?B?aURwUm93TDFSOUN6ZDRuQnBTYzl5QXQvQmZSQTdxMFMxajU1ZFZZdFNKdWFV?=
 =?utf-8?B?bUtjRWY1b1I4ZE5ITFVBNHZZaFV3ME5scEJtakFXakhDVWlPdEhSQzNFUGdi?=
 =?utf-8?B?WjM4MUI3SW5Db1cvRmtWV2Q4elRsVDJKVnA3ZDViUThOd3l4NXRDTWZpOUhP?=
 =?utf-8?B?NVNKK0pFRmI5SVFWbVIrTGRYdUQxOEhxbWpDdXFLM05RVU8zeGdiRTVLbW13?=
 =?utf-8?B?b1NNYWJIS2dmMFhNNHlWbURPTkIzaC9hVS9hNUpRRWZ2YUVvcE1rMnNsTjBT?=
 =?utf-8?B?VGg4L0RMVTRBUTRrRERSaldhSXlQdUJaQ0QyWUtVTWM5UUlPSWdHQjVFREgr?=
 =?utf-8?B?UkVPYTNaZzVpcHdpU2VZZkw4L3VRQnFFOUhMWVFnc05mYVhLMVpvYkR2Z2th?=
 =?utf-8?B?eGc3ZjhMZnB4cDRsMW5JYWtlVXlGbnNSaCtNWHR3cTg5RisxZHdvUFMzcnk3?=
 =?utf-8?B?YVdVUU51MWRyajhJb2RpMzNCMUtKU1NnU2dZWVpCbXg5RjBYQmVDT0lMMGNW?=
 =?utf-8?B?RFpoZ2pTZHd3Y1hTM3ozTXUwRnhNcVRIQVV1T0dHTngwTVhLYlIxa1dDdzBk?=
 =?utf-8?B?ZUNzY283MDdRVDlqUTJWUWdRbXUxNXFwTTFEQW5wT1FralJTN0k4K3Y1RC9a?=
 =?utf-8?B?SHlaSWxrR2l3WDNJK25uM2FzK2NvTnhJbVlBMXNGY3hpSEJLOG1xQWNYeXc1?=
 =?utf-8?B?SEtpODBaTHlRWDFGenhQSGgvZkNmYi9Od2plQnYvRVNnSVgrb3ZDOUMvbWR0?=
 =?utf-8?B?elZxb2t6aUk2Um1GOEkrd2l4R2pTTlZhVEF1dUlhdTFrWHdDWnNOcUxTeTlB?=
 =?utf-8?B?bUdabmFqRDFYUTE1aERMeGpWaEFIR0Q4Z1N4bCt1ZjJreGNOOVdqaTVsUGk0?=
 =?utf-8?B?TlBwREd1azNucVJtT0lwRmh6STlzUEZ0VEJod2VGVXM3OGgyWGpKUnFxSkEr?=
 =?utf-8?B?TzhDaTdKL2J0WXVWazZIVVVNTVRXVDVCWWN5d05vMlJhYWdxS1hNQUV2TTln?=
 =?utf-8?B?eEVWWmdkSWdrb0JuN0crRkFza1N2TmtycE5ibXFIUjFpQWFvOEtBTmhVK2J2?=
 =?utf-8?B?Ukp3ajRkN2V2UlpIaDhIVG0xdmQ5SWhONTNZbHUyTjN2K3lvRkcvZ3d5UG5P?=
 =?utf-8?B?Z1pDSDFYQzN4SEU2Y2R6Rzd2SmhUUnhXSGNrQld4MDRsaEgvU3BMNWxkNVFn?=
 =?utf-8?B?Q25ta21WZW9GWWVkeDNaNm1tOFJScVJ3amFKVzk1V3JQUUtEL0hYenVnODNm?=
 =?utf-8?B?clJyZW0wR1c5TDZkbVRSSGE5bXZqRzJ4enZwODdsZFkya1p4d2pvbGp0ejl4?=
 =?utf-8?B?T3hBbDFWYXhiT3RMcGpLOVZBUjBtRmdOR1BXeUJuSDkyM09FckNsV2w2QWxS?=
 =?utf-8?B?RnlFallTWFlQMUhmbG1yOVRZUkVXQzZpS1E1d0ZiaSs1YzFmeU55T1RabHpj?=
 =?utf-8?B?WGFTdXBudWl5MUxaMnZ6YzNEOTBMMVM1MWtUMG40eEZwRk1CVTk2QXF3L2lV?=
 =?utf-8?B?bkJmYzBQdVZVQXZHWW05TVZKV3paOXJYdGt6N29XK2h0K1l0YTNCakU5WU5j?=
 =?utf-8?B?UVpwRmpFeDE2eWZKdlF1T3NhSlJQSmZiVzRtNnpiV3ZrTlNtaEpob3VhUUJw?=
 =?utf-8?Q?CmEQem?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:42:39.9050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290586ea-4a7e-4ec3-97be-08ddec715189
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3950
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfX2r1LZ7NB2n44
 qnuc3GRT7D0BHMYR+edInrkljLGjKyKV9dP2zZ+06W2Di4cpDcHulpZbWyxxaYjmbmRK4T6Dt29
 Bd5xTYus3FQUOblOosccL1R20jAF9GiGrOCot1Yxv3SN7XLJeahsrh/b4ixJgwTdScK/Vtlgplv
 uELSpCg2DN9MerVNwMdD+6XFrANcqFmqFpM1o/6+Hl0RRBuOJ3+7uHoSL4bHuzel1yVxF3fCM6h
 MPDP4aD9sMfYE8p4sWzcahbfJu/0VwuYoCSfDPjqMRACDUDYxP/RvDVwCYaMoQG1/AMNnmLKLeG
 R/km/qgV5RFSIUmDAx+L4NSOcA0rK6uheDipp2Lu/MniQQ7vBgGGTFzxlej5hZDazHrLK142G/M
 N9h7NPxk
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68baccb2 cx=c_pps
 a=kHNPgcXsDGUk78CmhPaQ1g==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=XYAwZIGsAAAA:8
 a=vmFAgxZJNHDd3Og3P0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2twJjXCMuRUA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: wmVbhYQ_Tszl0146C1Qi8E0luHQnpvsc
X-Proofpoint-GUID: wmVbhYQ_Tszl0146C1Qi8E0luHQnpvsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025
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



On 8/29/25 17:14, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hi,

Applied to drm-misc-next.

Thanks,

Best regards,
Raphaël
