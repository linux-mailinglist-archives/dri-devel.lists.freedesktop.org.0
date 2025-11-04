Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F45C2F2AE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 04:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5610E13D;
	Tue,  4 Nov 2025 03:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lpEsAltq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823EC10E13D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 03:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+XtxCn3GYPTIM5A3pca1ssAzSZ7TLwhwdyPxAdz3+JBGYV7xgiQjr9neKNky5RxrdmFDVcUK9c+9iF5ZlYGthB45DEddzPuF40Oyc3MXroC9/ntpm89PpoSGRuCgnn8lKwJir8FgqY73QH3QXbvd0e2FNYDcFIdx9AjBRVx/0XA0zIu0TYX5CFdyOKWMFY+56ufkbbwRoQp7/Xjojo2TTxMqrVJyCyqS0oAsMnIS5xXUQjwRnnEHH6EeZP93UBMWvtZ/BTZ0nvxH+Nd4vPSz8Ct8GvBUufMMOFzsQlWZQn0zOg0vJdQXadJCvg0WVEL0YJoEcp2gWK8ZF1Haj0xBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgTsoopUoUCPxGvbnjhOqS9Z8iPdIyOuU3+TzGJnGsg=;
 b=kvuZYPNgUJTQNhDGljIfTbA5BMpiG1jLuJAEKICFGJ6E77KlT7o+jcV3EhccHyi64fU0xnyosAxvTf4iuX0lI+nNzDcdga18akoVarncWGBdrYPE0gpEGe3kjVXwllCOemhbtKVoRi5TVubtZk0NKlDTb8T7wt5nXh+fb5sr3t94ZDTQU4+qlLuIaCuzpaUYVUaFd9n4OpPhOxQ24HRYNHBTFs6vRPEvMycYOw/5xyTtXkNDfulKnwx3OrJggvtK7RwYY4MeiyhBUbbjGI1TU6YTAhTEMqsxEDWJy2qFJrYpuQMY6zRIb+wsBCgwo0WGMxgRk7+95CVMItGeE4LkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgTsoopUoUCPxGvbnjhOqS9Z8iPdIyOuU3+TzGJnGsg=;
 b=lpEsAltqgwMBDXAS7bxdMBeoWXb+YUA8VBvIwtR7Kb0CJ7eCWdpNPo2I4RQJFlx4iNjIxxBxQX1lO1DKadcC+lQBnr2QufMUtPHwgqP64GwiA2kFEtTrJ4mz2CiaHzngYq49B2jDtp4xUF/3H0BXVPbM8Edfs+TEKsHCoxVpAoZzFoaVIYOCAaZOSD7I1EVoKncvNPSw4kThkUr5StYi5Q8UvFu+7oUB+orf5MTNp4FITR3rjNW5B3+isrNm9F+yg0160YS7LH4GLnKZVHfmms7Jn+3qVm+G6sjEVSR5+Io8u5/taAha0/SWCNSJnH5Jwchaa8jnFCtYr1YEd/UA9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11072.eurprd04.prod.outlook.com (2603:10a6:800:259::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:31:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 03:31:31 +0000
Message-ID: <130e27d8-9e3f-4da0-8709-59c876638581@nxp.com>
Date: Tue, 4 Nov 2025 11:31:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Marek Vasut <marek.vasut@mailbox.org>, Rob Herring <robh@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
 <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
 <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <30dc382c-6b26-4b2a-81ab-67ac5bbf7150@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <30dc382c-6b26-4b2a-81ab-67ac5bbf7150@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::31)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: ba05b1e9-e25a-42e8-2dad-08de1b52a5b9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|19092799006|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THBoRmpKeEdkMnk5MDU5RHcwcEhOb2pZRlFoZlovMis4RjdjbUU3a29xZHZI?=
 =?utf-8?B?UjVQRzZBRSt0OUhaeU9mWUQwR2tmUXdkZE9ack9qTHd5K01ZTi96QUJoRzhJ?=
 =?utf-8?B?RGJjanVZWlFsVU1ZWEYzbG1RNjdZOG5rKy9mcDFXd1ZQRXRJeGxKUmp1aHBR?=
 =?utf-8?B?VjlwaWlFcDEwWTBvOXd2bmFpMjBLVHBrQ2dsQVg3ZVNoK2NRdkYrNHRYR2ZE?=
 =?utf-8?B?a1NhSFgvTXdjNk9HVUNWcnFDMXU3MGEvNFE5OTZPOWFBdWlnMnVSb0l3a2pr?=
 =?utf-8?B?ZEZrSktEcjZ5bkc3bjloaDM5QXNIbmdnZXlGRit3STc2VkwwZW1ueTNGSFBs?=
 =?utf-8?B?Q3YzbXRhYVgrbHFhTis5N2R4czRqRWhlZUUxK3NnVENhQ09peU5XcEVWNmgz?=
 =?utf-8?B?VlJWdkwzSS9sUW5RV1lURmlkRDJ1WE1wNmFleFArQVNHSHlLbDVrdmpreDdL?=
 =?utf-8?B?YTZsZDF1TTBselJnT3B1U1d1Q3h6eUw2UnF0L3ZpQXVPdXJmKzg3ckgxaW43?=
 =?utf-8?B?cTRsbnJKaENIZGt0c0NhSGFLYkRPNTI5SWJISlkzT1hiR0lmMVA5ajVySDhE?=
 =?utf-8?B?TnROdlBNeG5XeGp1Zko0a0xoczJ6ZUxDRzFzaW84QU41M3MrYzhMRDFwMURP?=
 =?utf-8?B?MytVcDBja2tMaWwvZGVIS1ZxTmlEVmV3K1FLbHQrNUdFK2lQZHUyNHBjNW8v?=
 =?utf-8?B?Ni9Hd2dqdDhrSUJvMHRYclJzWktpSTU5d210a20zVk9xTzExSHpUQjBsRThK?=
 =?utf-8?B?eXZGRXhOajBRSzJocENTK3V2VnQ4RENLcXpxVWJLYklMM3BnQmxqa1dLQU51?=
 =?utf-8?B?MWtXOGl1d2NQN3JQM1U2M0E1dCt2QmNTdVk1ZzNNSTF6cGp0Q1I1Wjhjam8x?=
 =?utf-8?B?TDZkTXRZNlZOZ0x3S1R4NE56VmhRRWV6ZWNhelIwTTJkMUVLZEwvZ0NoVzY2?=
 =?utf-8?B?cVJxUThkTjQ2NDdkSmhvK0d2dlVoWXdTYUpjcjVLTm5wUmo5dTV1MGQ1V0JL?=
 =?utf-8?B?RVJIZUNpc2pIZndVeHBpQWZ3cTV2dEpiaEgxbk1uYXFWWXVRdFpGVTJlWnJ1?=
 =?utf-8?B?WWo3QWhTNi9lbExGVnEybmlOVmh2RzFNcm5TSittbjVVeDBKaHg3RXlvZGFo?=
 =?utf-8?B?eGUrUHJ1WTJiVnBZdUdYRElPUlh1TGNzcFFZckRtcVIxUkkvOGNFcVQ3VHNm?=
 =?utf-8?B?NG11U01pZENvaDlJMy9jaEY3NlZ5SUhuVXJNbE5OZWpYSm1Wd3dLNFBCSUJZ?=
 =?utf-8?B?YlFuWkMvV1pjc21Ua1U4bUlTVTd0QWcwZVU2bE1qQ3J5OVNHZHFmVDBDQ0VD?=
 =?utf-8?B?STM3QUNKVGZNelpkM2trNDRWMnYvK09mbG84TW1hZExBVWR1MitCSHFLRnVU?=
 =?utf-8?B?R1BjaWpxMXBOTVVQekZIdHlVTkI5MDRoS0FFSVVYaUEvbzcxdER0KzdJWml6?=
 =?utf-8?B?NjNUYWZ0eFhRMGhrSW05WHl6M2s1VDVzaXJaMFl1Z0poTHpBY05TYWRXSHQw?=
 =?utf-8?B?YUhuREltRjRDQURPQTBKY2RzQVFhUHlESG5GOVR3WTJqMm91cGhyN0hSc3J5?=
 =?utf-8?B?Wmx2VmVaMm5BY0FYamV0RmJvZ21ScGhtMndUOFBwVVphSjU1L2p0QjBpRk9S?=
 =?utf-8?B?S1ROTElvcWNpbnpoU3RuVTB3K0VUZnc0TURLd0QrdGE3eUZpdGN0b2Jhc3FB?=
 =?utf-8?B?T0I2NzA3eXQ2TnIyS3A3RXkwWnh4RU1pYmorRnZWdktpb1dVODJ6aExSOXZD?=
 =?utf-8?B?dSt1RGxSZml0NVE1dzZyVlVuQkJHbU9YUlF3QWw0NXMyMkx5RlphTDlENmgx?=
 =?utf-8?B?TDdWdHp4MnYrWndpSlJ1L3JaakR4bWlodmNSSVVPTkN5TDhLMXF2ZGFGNWtI?=
 =?utf-8?B?dGJiYTlwWlZoN0t3dlJiNUw0VUx5aWZrREF3NFV1MjRHTFltdjFHak9EN1hI?=
 =?utf-8?Q?yRCNSkAeepRO6V2/9otoDYg47uECAXRs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktSblJNODg5WWVFZVdCanM1VGZabE9OZS9wWCtHTlc0MnNmaGEvVDhzQUt3?=
 =?utf-8?B?UGpEUWlVUGNuaDQ3R2k2WHp3TUhuaktHOGZWZFp5dSs0eGFKNHF2aklqYXlM?=
 =?utf-8?B?d252YVZheHFQdkNOSW1UWU04QXZ3VEhoUWVERzRudXk4UTYzSDFNV0hNWFUr?=
 =?utf-8?B?TjlXdnRhNisyVWhHeFVGQ2lhd3JFYWlPanFBRHVRTjc5Tzd0SW95czNucmxD?=
 =?utf-8?B?TEJwbnZLYUhObTQwdDRPeUIzNiszY0pub1VQOFhVWjJkQVczS1V4K0ZobFZu?=
 =?utf-8?B?ZzRneGpjVXFwOW42Ry9vRlhSL2NadjFXK1QrKzA3bTRWbytlMkZhZlh5d2tR?=
 =?utf-8?B?aHh5cEF6Z1BGRXBFTVNsQmYyd0RLRDNHRjN5OUtUMGh0c0pFYmtFODVEd2th?=
 =?utf-8?B?RjkyR2lqYjAxdHk2ZWNzMWluSCtRQWUzcXJrcFdGVXh0TFJOQytsOUxkOUI1?=
 =?utf-8?B?b3hoYVlCQ05BZlFKcDdxbmpnWElnd0l5NndDbFN6Nm80S2R6T3ViWTVCUzZi?=
 =?utf-8?B?SDM3YmFNSHg3SzRXd2h0V2E2Q2JwUTZnVGZpWkRHNEZTVkNBWkRWVFRTNHIr?=
 =?utf-8?B?eTdoRldWekQvMGY3VEd3a1BFY2tSSWNIcTF6anpyK0p0a2dZcThncFJvczBk?=
 =?utf-8?B?aXVVV0dhWGQ4Tm9XUWNGaVUvQmppTkhyUGJ2T3hsTEtObmlzU2gzbnFKaHdj?=
 =?utf-8?B?UVVteTRwZ0NiREEwTkh4Tjg2UlI2UWV1WHJ5bGttSnIyNjFZaTY0MXJremps?=
 =?utf-8?B?K0JBQjl3ZmFnWkQxRGsxczBBUERtUWR0TUFIR3ZQVk9IMm4xbWo1TTdER3VN?=
 =?utf-8?B?cDFRNTRmZW5ROVpvM1BqQmFjK1F3ZW02Sjl0ei9vVmF0dnBYS1g1cWh4RGV4?=
 =?utf-8?B?T2pzalB2dnJuRk1NcGx6MEl0aThkb0NaVlozY1JVY2dMbUZkR3lBRUtieTVn?=
 =?utf-8?B?L0ZNWGxYYUlZTU1mVW1xZnU0MlMzemVrUEVGam9BREcrR25mZVFjQ2t6TmhC?=
 =?utf-8?B?eWdRNmdIVXZPelJmWFQ2ejJoWmlnUDdlNjZudkV3MEpLK0RGemRlcS9lWTA4?=
 =?utf-8?B?c2lyYWMwZFFqNmpqNWVab3A0OXoxNVNpVmVFaHQzQ1B3S0lIQjJ5bFZNVWNM?=
 =?utf-8?B?ek9FRU1ULzZIV0F0UDl3R0JRb1VjSUVKYTFiTno4NEJXL1dOcW03M3hNVkJq?=
 =?utf-8?B?dnEyZWFqdFJoQlVySWF4ODI0U1A4WTd6L0tJWW95WTJIZkdtVFlzbEs1djBk?=
 =?utf-8?B?QkpZcE52MGErSGdmQUtoOGJ6L1VaYjM1ckFiSkZlZitNYzR1Njk0R2g3b2JN?=
 =?utf-8?B?OEpuUmQ2QnRNc0NyR2VXWHNnd2wxYU04VHEzQUN0c2RVYzgyWDVyZ1YrVHp2?=
 =?utf-8?B?bktmUTJxRkllamZLd2hYemVITCtPQktWdXRicE1HYW9aUUFYMUxJUVR5c2VG?=
 =?utf-8?B?L3lZM29BNm1BNjA4Rjk2ekZBNmswazZXcmxmaklpK2JwS3Vub0JMcytlMnAy?=
 =?utf-8?B?M1YzSHV5NXQxSE1TMWNlKzdHbFFHMUw5ZUNObEJTM1lKYnpCUzJzdnhEOFVE?=
 =?utf-8?B?dUVJc2srdXp6MDhQNFBTRTlkaGFOYVlab3JiY1FSRmpKbVR4Y1IwTytPZTBp?=
 =?utf-8?B?anhmeGxWVlpQVkpQdEp5ZTZ1SzJPT1hDTHhJVU9xZzM5Vk9PQTdzck96aWNO?=
 =?utf-8?B?NVNwTnloZTU3QVpmbW9ldkF2cTBoaHlIRmkveTdOOFNwRkpLb0YyVUF2ME1S?=
 =?utf-8?B?blIweHZmUWhpeUR6TlBMakRDeHVFdHVsS3VBL3dDMFRBcmphZVRiKzYwOWxJ?=
 =?utf-8?B?YnBjOGJnMUZicUEvUXVWc1pyRUFhYW9zRmdhSVZlZ3dxZ202cVlYeTF5TEs3?=
 =?utf-8?B?VGprQlNGRURrbEdXaHNkck9vTnhWWkRHNTV3d0NNVVQra01hTDhDQUFwNjZR?=
 =?utf-8?B?eHRqeUtCaTBGd2xmMEpweDhKRTFtQzlRZ2FaM1pkaGt2NzZvYlJjK1ZZYXpD?=
 =?utf-8?B?QlVIMXdIOHRhOGRtUmM4TWljcUVXdlg3Und3RkhQYXFYSzREVXpZWjdQQ3Zh?=
 =?utf-8?B?K2czQzZnaVcvM2gvM0pMSHQ3b2ZFZDZBcEIxSUUxK2VuOGd1MSt3SWl1bGFU?=
 =?utf-8?Q?v0hZsqPM7x0a1SptY6ZUItrXZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba05b1e9-e25a-42e8-2dad-08de1b52a5b9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:31:31.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhQu+536KtPkbdbxC4hqAj0OjjZeXK6kWETJErxZo0o+A0ceO+q11bTU1M4DCUhUMxLRPFM2LYkCuFPWu79hOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11072
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

On 11/02/2025, Marek Vasut wrote:
> On 10/18/25 8:09 AM, Ying Liu wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>>> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they
>>> don't
>>>> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
>>>> modes, this would impact how an OS implements a display driver a lot,
>>> especially
>>>> Blend mode and SidebySide mode.
>>>
>>> There is one thing which specifically concerns me about the DB, it seems
>>> to be capable of blending two inputs from different security domains, is
>>> that correct ?
>>
>> For now, I know nothing more than the DT binding description here, i.e.,
>> two inputs are combined to one output in four modes. And, DB cannot be
>> bypassed IIUC.
> 
> I see.
> 
>>>> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
>>>> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
>>> It seems we currently do not use either clock or interrupts on either
>>> domainblend or layerblend IPs, but maybe DB and LB are different and LB
>>> really has no clock/interrupts ?
>>
>> If you take a look at NXP downstream kernel, it uses
>> domainblend{0,1}_shdload IRQs in CRTC driver and I believe that upstream
>> driver should use them too.
> 
> Can you please tell me what exactly is this IRQ signalling ?

DB's shadow load done event.  AFAIK, this IRQ needs to be waited for when
enabling i.MX95 DC display engine, also maybe when changing DB's AlphaControl
and BlendControl registers as they are shadowed(OFC, shadow mechanism needs
to be enabled with StatiControl and ControlTrigger registers).

> 
>> DB and LB are different. DB is in Display Engine, while LB is in Pixel Engine.
>> This pipeline sort of tells how LD and DB are connected: LB -> ED -> DB.
>>
>> LB has no interrupts.  And since it processes pixels in Pixel Engine with AXI
>> CLK and it can be configured via the AHB interface of DC with CFG CLK, I'd
>> say it kind of inherits AXI CLK and CFG CLK from Pixel Engine and DC
>> respectively.  See the diagram in fsl,imx8qxp-dc.yaml, you'll find those
>> clocks.
> 
> Thank you for the clarification. And sorry for my late reply.
> 


-- 
Regards,
Liu Ying
