Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F129A31CB5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 04:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A6E10E232;
	Wed, 12 Feb 2025 03:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="I0o1hTVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3E810E232
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 03:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=As2LSr6EYUiZK+axxUFmuqO0g3kajB0CGMbXcfEJGjR9fS54ut+Bz9d0jF8n30LJY794/jG1vEWyD/urHQPxtQ4e05wWMrymlhttGpVDgAGVFdrpjeCqeDHITFEpE0aQf43x7By7sWv8mK8fmQ3EzVEhXefohoNtnx0EAz2eDZnagg4HrfH6dtRhGVI/YOY7ffhI95263/5lydcrU/2jY6NRFAjyEh9ildA5fwK0feG1q36qnHsD6o3hWGYzhbaQAcAfvYHS/huWZtj/883djIISerFu40wctC1tw+FRBULsfolMrfNMakuO1MBSRDTY5pD6vhEchnI+JKjc59kVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SZ6VTida6m5eq0SubaDDWx1Bs6Y7IAL6y6YmoYbWms=;
 b=AnjPP57ZN3PWPlvgviEnxkxurhjj0OcSDjSlzn91W1GFKJ5k0kS2QD9F/Bbs66hD8tn1+SK9AxeW7Ael4Eopy+Pwx/WdMeAdn8oDM7hJSYP+oLwu62qUAgUkWZ1SwkoNt+wAmX4MMsXCStNxrp3FAHkdTT30CeTDN3V6EpwIzrSvobRX1w9MLzLQmV0BpSHfiDDSDnVjIlQmkXz1ZvQaXlp7Pg6tZijHrJ3Vpf4KpnhnHKC7eZGR1RmPuA0f8emkHvu36xqKyELim5pPcbErK2hbaynGqYloQFBcA6s3uxhcBQcA4rjxQKLogtywI0oQIupDe8/A/oDKvb1xFpiPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SZ6VTida6m5eq0SubaDDWx1Bs6Y7IAL6y6YmoYbWms=;
 b=I0o1hTVbqIYpnUattX6YkIJ/iXVePsyayVhT3ZWJLra3i8QTheJuGOekEgt8zv/fcAF6G6QFwiXhKQ4AMAiyACZupkCjMlVq5p2nxkgXu4PlC3OwqTRV3LDOL9PdVTO+9LeD3baneJDk6urF7za0oM/2PIR4z89VJjzcsBxZAuoIl2hj8FenVRGAWBLJ3tiHXbPkR1t3zPj0djA7XEbyktlYJhiXgPXmXhtM2amcI59Uqw1lVV887BwYfVJAkSXXN72q1kygSjW8dvqdUyl2al7SnC7mmaCZOhIb4WEtgkPwqEC1MXNWHlz8BjLFX9fuh93LFEw1dC50mxwbg33LJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11000.eurprd04.prod.outlook.com (2603:10a6:800:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 03:25:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 03:25:15 +0000
Message-ID: <fee8efaf-38e1-4dc1-af51-e8e0f70f15ec@nxp.com>
Date: Wed, 12 Feb 2025 11:26:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i.MX91/93 parallel display bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11000:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae7143a-1e3d-486e-8cf9-08dd4b14ddda
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2xTYjY5Wm94dE5naHkrUWZQZGVocVRVRHFVSjJiRk5OZmRvVW9BOGFNeG9V?=
 =?utf-8?B?d1VZdnhzamtpdis3aDBQbk1KZzBTVHNxZm90Tkt2SGVHT2N1VUVYNmIwL0lr?=
 =?utf-8?B?d2dLeHU0cFRxWHBKanFyMURJVE45RGtBYXNrSGNjY25RTlYyRU1Gcy9DN3hT?=
 =?utf-8?B?a252cUFDZ2sxalBPOWlTSWZMUGFrbG9BY1orMi9obEY3L0oxVGhHVUFiM3Yx?=
 =?utf-8?B?YWFpVXFXb1JXRUFtc3Y2ZHJmMGlweU5YWTJkU0dtZStlU05sZHZjcVcvZWlH?=
 =?utf-8?B?cjFOR0xxaDBxeFZvaEZoWnExdHFpU21iTXpIK0E5VDR2dS9QdzEwQThJcGdS?=
 =?utf-8?B?UVpHbW1XRGxzbnRyRHBveDdWdWpSWXVEVk9SWkRmbDM1TUg5cGNUMXRhWHVB?=
 =?utf-8?B?VWcreTNEeWxiU1JHVGcrK3BENmpVcWVPWml3akdUN0N3SDZiMlhEUHIrMk8x?=
 =?utf-8?B?MWlWdUlhMk1WZDlPS25MVVQ2ZjVrVG9uY1d0L2JXd1RDSWpVSDdFQThObXZ3?=
 =?utf-8?B?aEt4OExNZDFmR29TRXBKblRHZmJVKzlBR3dlWUpNTkRPT2krK0tPek53bVcz?=
 =?utf-8?B?VVpSQVA2aDNxcWUvUkR0QUVDUkFiemZ0S1lxVlZHN3R2eEpDL1haVElSTEFi?=
 =?utf-8?B?alRGUEgwRmJtN0FxRXQyQTJEcEJ2eG52OGJpT1FTc2pheFhzSTVpT2ZRL205?=
 =?utf-8?B?MmtkTGpkS1lsYzlSd2RsTnZ4amxYKzAreVMyWG54NHpUVSt2VCtjOHJlNEZQ?=
 =?utf-8?B?V3FoU1lLUnRLYlhGVVc2WjFDYWZWNytXQmZGWEw3T0NDTW9iZUxVcEtDN1hZ?=
 =?utf-8?B?Y2VBSlFSVnZrbHdXSEtFdk0wbG5sYkVhdk5sR3hlNlcremp2YlFtVkkwTUd4?=
 =?utf-8?B?M1dINFd6WGtnQUxJYy9OUzZYTmVvYzdBWnlZMm4rQ1dJcWxrZG9xdjdFV2Rt?=
 =?utf-8?B?ZlpSL2ZUQVRvS2hhb29UUHZPQlBwc25KT3ExZ1l3dnR2VlE2Mk9TbnFSYmZk?=
 =?utf-8?B?K3VBQVlOWmtESkJJdzBSZUtXa0xQR0E0R1Rma3BoaFZGYkJJakxhcVV2ZlFQ?=
 =?utf-8?B?UHV5OHdONnBOb2diTm9KZC9LandhOTRLdzJiZGJibytuM2FJSGI4Mkl4TFE0?=
 =?utf-8?B?RmM3K3R5bmxaQjIvbzd4WlYwdmxMWmEremI2amdHNk9Xa3AvRWIrVDZkYVJo?=
 =?utf-8?B?SFB1dHptOHJQNzZIazJXaGdmYzE1OHpSa0ttM2dhd0pkR1RnSjhuVDcrMG1t?=
 =?utf-8?B?b3Y1RHEzVzkvTzJxaWhQMEV0SWRsUG8xOTNOaWNCa3JZYVRNdFF1VGZKSFVP?=
 =?utf-8?B?Z0tvbStFV3RtaUNNSzRrd0FqekdxZmc3bW56T3lRR1hsZFZTbVYxMTJSdzZ1?=
 =?utf-8?B?V0dRNVNPR1ZFZnA1bG42YkIwVkU2WS9XdmI5K1F4bTRhQXBhOHVVOE5ycW0x?=
 =?utf-8?B?ZWd4bmpwS0pDWE1obzM0K3VyK2d6NWI4SzBUS1NIU3hmby8raHRyYTdOSUtR?=
 =?utf-8?B?MzZmQnA4VDBZVTJZdjlkVExoaER6WWREMWk3TVRya2NuWmJLK2MyVWNyQnBD?=
 =?utf-8?B?amdpQ0hFK0p3ZkNkU0dpaE9GSlVWejJHVW0xWDVkRm9hOFJ2U2VJZzRQWTJt?=
 =?utf-8?B?KzFHcVhVSzNUeWJPMC82dGJmcFFzc0lZTDBjR3RpMEo4eno0dUZzRlpKREtD?=
 =?utf-8?B?T25hSG1Hem5pNG9vQkJFdnphcUIvV3gveWlKSGZRMzFGYnh2eWpkQnpwcVQ3?=
 =?utf-8?B?d09QOWg2QmFqSnZnaDV1Yy82enNRd09ISUJmOGh1YlNCNXJIWlBZa0dHMXg4?=
 =?utf-8?B?bjFwSXhJMFZmVWp3V2Y5ZnJ3MHh3R29NbkRldmpINGxuM3F3ay9WV3djc0Y2?=
 =?utf-8?Q?ZlpQpSuhwXfJe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNpcnBHOW1TMmFFWjBBcEsyYnYxRjgySXZvYXJmaXhYcTUvVjlsbFZHRXQy?=
 =?utf-8?B?QmhONEkwNjJuSHF1SzhxMUF1c2x6clZxVUdZUW1lSVk0ZlNyS3Ntb3pIeUdQ?=
 =?utf-8?B?aFA3SUJ5dFY5czJuUThmRjZvTmo5WlRDeUpKK1pXOHhUTTFtMXlKbVhzcXJL?=
 =?utf-8?B?WEFOV29GR2ROZzNnMkUyZUJUalhQMjRoWk5VOWFFdWVuM0JBVW1WVzVLamJ0?=
 =?utf-8?B?SzZQWWVjUGNVOGg5MmsyUGZCbWh2Y1FadytwQ2FvOFNUdlhpcmNiZ01DR0JL?=
 =?utf-8?B?cXFxZm45UFhLcytkbFdWQW9ndUNIZ09MQ0lsYUdSdHlQMEJLZ2NUUkJHNkZr?=
 =?utf-8?B?TjFGMktjYUVDcFFCVTBXTDFLMVR0M0VNdFRhMmVIbjh3aFBsV2NtTXE4UDBs?=
 =?utf-8?B?RVFzT09NdW8zUS9SUG1kTUdQcGp5OHkwQ3UvRUxPR2hMSis3RWNZY0RPeXRi?=
 =?utf-8?B?cDM0NDJlMW1Yb1QvQmYveUkwNEZwL2dRUUlURjE5UFl4ajNHYmJOZUM5R3h6?=
 =?utf-8?B?Z01iR1F0elk3R1RIZGp3TWhRR3hVMmNtVXZEU0NYRHVKc044am4vR0M0bTA4?=
 =?utf-8?B?aG80ckVtbHJPeE54cXJxSWthd2JwamVBTVBWWDdYT1EyZFZOUmViUVZxTlFz?=
 =?utf-8?B?Y1E3Q2RkVkFzWVpQQ0ZjMzF2bWh5bndiL2ZSVzBxQXFmZ2hRNXZBcnRxVllo?=
 =?utf-8?B?V0hjdElyVjJCN2FtSlkyaElodXE2YUZHckhKNjk4WVdCN2w1blRoY2pjTG1X?=
 =?utf-8?B?TUdRSzltdUcwUHNUdEdoY0djRytUVGRicThMY2lkMWV6dEw5cHRLMkRlZmNR?=
 =?utf-8?B?OFpoZldwN01VU01mMEdSZ1dESGo5SDFKS3dacUJaamd0UHFjZW5OQXdQeWFq?=
 =?utf-8?B?dk5LTkhGVUZyOE5SZ2VGMWk5d1RQVnlqblU0TE5PbXdhTHFlSXhLbEkrdlp4?=
 =?utf-8?B?MTRYS29qdDM5MmR0WjQ2Zk1hZXlYR2c4SFZVMHB6bE5KMEIybXlkTWZ5V2lW?=
 =?utf-8?B?VzY3STFrV2lRazhPMGE2SWdST2pZY3BmODlaZFppRjk3ZGpoYXNCa09BOG5n?=
 =?utf-8?B?Sk9Fcmk2Y2ZQZ3dHMUZVaTBLTmhmUXlqVHE5U0J6R1U3NGs0dXhrL1ZQQzd3?=
 =?utf-8?B?dEpvZHpmS0ZDTzBydmpqdlEzc0dFd0tEd0lNNVRtV1IxbWwwR1NCM1lhNDBF?=
 =?utf-8?B?S0M2WFlueXJsK3I0RGcrdkI2UG1oN2Z5ZGN6ZER3c2tWRHJZclVQRDZBNndL?=
 =?utf-8?B?aTltbDQ0NE5zN2cwNjQzN0JPVW9vTGFqa3AvVXBZOU5vYS96aks4TjNBSTVT?=
 =?utf-8?B?YWJOZUtqeTlJK1Vaellobk9Jb1Q3MHY5TzlYQlVMSmxPWXJrZGxBQ0hab1RW?=
 =?utf-8?B?cU1IcW4rbHBXMjFsY1NRb0VtRkRtQ3dCYzFVeGxQYndDMHZDcGZsQURxMHhQ?=
 =?utf-8?B?TEpCc2pNUHRaQ2g3RHM5bm9nZ0JXMTUxb1RmZU9LZy9WOXFDcWtiWWkwdkZy?=
 =?utf-8?B?NDBaMWVRRDQ3UHBYcTV3SGJsMEV1SkNYRFdNVVVSK1BvZE81a0dFT1FYRW8r?=
 =?utf-8?B?VnR0Zk9reHpNc2JIdTRFTlZqYVB5ZDg5YVUreVUwTkdjUHpaWml4Q0ljcGdv?=
 =?utf-8?B?YnAyNmdhaG9TdWVBVUM4RGxSdGdjdEVZWEkzSFBmaE9KK09qbFdML2g5dGNv?=
 =?utf-8?B?QXVoeHI4YzUzMHJaQThXL3NoREdxamkzMVJvTEVFZmd6NGkzWnkrRzF6NFU2?=
 =?utf-8?B?MVdjKzk2ZWl2MVhPb3EvSmxQejBHQmpmMlN5a2lwWEp4b0tTTFpwRUJTK2Rn?=
 =?utf-8?B?aEh6cUZ0bHpOS212TzBZZHJueEdFYld0K3hCR0Q0RUZKRmdoS3JVWmIreEhH?=
 =?utf-8?B?ejI2THNUVFVkajBSVitud0d6UUZKb1JiZUtXTnpySU9jZ1B3ejFmU1RTVzV2?=
 =?utf-8?B?RFhTUjJzN1dkVGk0aTlQNTh1b3dXYVVDcHp4bFNFSTArZEZyMTNETGFyc2NB?=
 =?utf-8?B?ZW9mZU1DeUlLcjhlMWViV0IwL21GRTVmUUM4eUt1Wkc0TlpVT29JRm41ekR1?=
 =?utf-8?B?YlhVK1RDUGNiblBJbkNWMGplVS8rdFlkQnpvS0ZrbXd2VmxNM1NrVXhPbjV3?=
 =?utf-8?Q?LFrANHJsLlxy66/7xDaBKImM4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae7143a-1e3d-486e-8cf9-08dd4b14ddda
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 03:25:15.1617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owvzoRmM173Lr6/M16cI2/IKgudV60dAgHegiPIZmS5FKBq+QZeKfQW8YwxEfagQkpCm1Swqbuq5fcTEpLKs3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11000
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

On 02/11/2025, Alexander Stein wrote:
> Hi,

Hi Alexander,

> 
> i.MX91/93 support a parallel display interface. There is a single register
> for configuring the output format. There is not much documentation, but
> apparently this does some internal conversion.
> Add a bridge driver (similar to fsl-ldb.c) for connecting a bridge/panel
> to lcdif.
> I'm a bit unsure about the name. There is no dedicated IP, according to
> reference manual, just that single register. I would also agree
> to imx9-dpi or imx93-dpi.
> Note: It's only applicable to i.MX91/93, but not i.MX95!
> 
> Tested on TQMa9352 on MBa91xxCA
> 
> Best regards,
> Alexander
> 
> Alexander Stein (2):
>   dt-bindings: display: bridge: ldb: Implement simple Freescale
>     i.MX91/93 DPI bridge
>   drm: bridge: imx9-parallel-disp-fmt: add i.MX91/93 parallel display
>     bridge
> 
>  .../bridge/fsl,imx9-parallel-disp-fmt.yaml    |  78 +++++++
>  drivers/gpu/drm/bridge/Kconfig                |  10 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  .../gpu/drm/bridge/imx9-parallel-disp-fmt.c   | 213 ++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c
> 

Thanks for your patch series.  However, I have already sent a patch series[1]
to add the i.MX93 parallel display format configuration support.  I may send
a new version to rename .remove_new to .remove in the bridge driver at least.

[1] https://patchwork.freedesktop.org/series/113457/

-- 
Regards,
Liu Ying
