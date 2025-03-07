Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5FDA55E43
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183DB10E9BE;
	Fri,  7 Mar 2025 03:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="czw7O2jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013043.outbound.protection.outlook.com [52.101.67.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE910E9BE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUTaWH8dOPYU5G+To4TylY1lX3tdSdbTBcdM26XNPrqUvq6wAGYPE1zP1JagYCkFsnDexd1fb0AvX1DLJEmy6seCIb8uuM5DXEumPs8lz4PtO5l/jJLoPs59ke40irIe4xSjrXB66/q7YazN/u9StUI+eO44a7JXyA0WPiZPVNmEkvSx6MYp3nShYlJ0tdy5j7yGqtrzilJiclmHE0SnT2Eagfx44aAyYbb2VsauLCUEWm1ZfQgCzD/dw6aFlhWzv9dKHBkhCm12Tvn8kVwIANoeIKW9S29OONMIt/hSzeK2lhRNgqvSx5ldOpef6C0GUMObTIXJKbbKFob+g5RTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzHPeQEJh5xDMU2aMRKoiRXhpWGcQnaAY9qYu28ktZ4=;
 b=TyNu4iqb2yc+KVQOJepKnwGA66v3FGFbQYi/DDCyFLt+Dzz493w1IJrbFeTaALhYMwWyYpU1ROcSvRbqpu1708vRDqbFGYk9A1kvwl4BysKlUsucHCm7ztrZ0tQ1X88JlIxxlNOcDGvwyzxt0yGQNgLuF/ilKO6tlKqy2x+Yoxl2aCf156bRcci/wPmqgdQYGR/tebcNNZaw5icuW02lZ0UFvJ+IiYP1sq9YHg/XVQY23y5YTt5186GfNAssjB8i6tFB1cQzKcpVMjskM54wAPzr/sKnt6NEa2qzB1x4MHs+XV6lQXAU6koiQ7fkImHaavqptQHb1TK/RORrizaErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzHPeQEJh5xDMU2aMRKoiRXhpWGcQnaAY9qYu28ktZ4=;
 b=czw7O2jvOblww8rT8y4Qg/KJrJJsIkkJDd/U25T8EZTI4muDu7366ywzebL5+nnRgFMgkdZq71mINjsKFXEE3nuRc64V4oCnIph51p9K/l2ekLFRP4AHbBINFnfcK5cC39EeEvThDrumjF1I1gVVWbedAKd+iRG3J5VVRls2IQEfhfJXM2DF33agMy+tQD+Yu0bkgOKz+wby3/qOfXlDN3Gkdzw25uVXiUnpKXAJ1BMolsqMGLM+JrEe7Xbi7HLKOp+2+a8gPx1ST1D6Dv9XdhT2duWbKP/TOQ5rh1AZS79quWZzwB914XuQ1MqZ73RJFlz+gtX+m241oMgoKO6b5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 03:24:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 03:24:28 +0000
Message-ID: <3836a4d2-ef4e-427e-a820-39dd4823458b@nxp.com>
Date: Fri, 7 Mar 2025 11:25:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
To: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org> <1891036.atdPhlSkOF@steina-w>
 <20250305163805.GA2071011-robh@kernel.org>
 <7d98163d-10c8-457d-92e7-6a1d6e379beb@nxp.com>
 <20250306-kangaroo-of-pastoral-typhoon-8aefb2@houat>
 <20250306203444.GA570402-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250306203444.GA570402-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e86a23-d577-4286-e627-08dd5d27919b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3Y4a1M3K1dKMHBnWWYxTUJNbS95ayszRG5HWkJwUDI0ZHN0anNPY3UrUk9Y?=
 =?utf-8?B?SkZmeHZ6eTBTSGFPbVJtNFB4M1lnS3FpaCtEMjd1RlA2VXFySWJzZHRORjJR?=
 =?utf-8?B?UEtmR0JsTzRhYzhqTXY3L1NqQUpTYWZGcGl4U0Y2OXpyYUtrNFAwR2ZjSWls?=
 =?utf-8?B?aUp1REFISnhsSlE3R0Y2Wk9zN1EyQjJiQ1p1NXVsTDZFSXVWNkNHRnViK0Qz?=
 =?utf-8?B?eHNzZEdBN1h1a1kwVk1BbHlkWER3c2RMLzdUZEFmQlF0ckRKcEpEcmVhNEJo?=
 =?utf-8?B?RmQvQzVMUVBuNTZKWVNMUWhXdk1USkpBNEtRdmVLaU1VL0NQRjMyU0hHaGll?=
 =?utf-8?B?ZWIxUStUY01oamhoV2ZwYzV1MXlPZkNQN1d5ci9kM2pPcjRxandXdWNReG5r?=
 =?utf-8?B?VHFhL3I3bVhKQXNzT0pPNDQ3WlpIQVlSMTlxdXFDa1c1Z1Z2dVpqeFRrQmVS?=
 =?utf-8?B?NFBNWXdNMVhwRFhJUTU3eE15MFYzMHUyUWFOOTN3UFFJd0t5VTlQRHlLNEp2?=
 =?utf-8?B?ZW1xVzJyV09uTWdCK28rMGpmVFlRdmxCNzhEMDY3SlZNNElTM2JLNnRxV2tu?=
 =?utf-8?B?a3NZa3JFSFBrWkYyYWg5dFBhTGtDeVpjdHJRYzhiek90c2x5QmJNZi96UFhF?=
 =?utf-8?B?N3ZNVTdBOFlKNG81b2F2VGhoMHFnMnpNTE55YUxZQzlyUGJlcVRjQVhqK1c3?=
 =?utf-8?B?eTZzMXVSQ2c2ZEg0WjRqaFkvMkFiVC9VbHkvUElycDR0bU5rSGovT2JaT0tz?=
 =?utf-8?B?NlpDRVJvcGkzeUY2RmZIMjNVWjl4TEVPTXJIdFFvZlIrSlh1MkRBWXNkNUhp?=
 =?utf-8?B?MzlUdEJ6RlhYTzEzdjhLVFhidkxWSk0zL2lQYkM4N3JFMlBITUl5blY5aGg0?=
 =?utf-8?B?UzN2NW0xTEhxbVBtYkovY3luNXdHSGFXRmdQbUpDSnpFbjR6QXRuNHdMWURW?=
 =?utf-8?B?NmNaMEpIRzhhWlNNN1k5Q1dOUWRNVVdEUFpKemRCODR2NHdWNjIxOUFERGE0?=
 =?utf-8?B?dEthb084U2FsMUxHc3FnelZQZjlHNHVGMlYyeDhJemRCUEgxbnNqSkpidVVa?=
 =?utf-8?B?Qzh4cHhOZmNhYllCL1gwZE9iVy9PNlFQLy8vSFplbTNVbjJlNlhDU1JEdFBv?=
 =?utf-8?B?Z3FaaVlHMGhScUJUbWcyRTdsQUdGTUdtdStnWXFXM0hqOVZCTXFQU0VVNHor?=
 =?utf-8?B?N2xxZkFhUGtCcWk0bk1lLzV0UXRPemR0YVNVTmd3RmVGZytCby9lNnZFMUpU?=
 =?utf-8?B?c2hPRFl2MkFRMkpyZWdzZEN6RzNpNmwwSG5vYllHVDlTVjh6ZEtKVVg5L0ts?=
 =?utf-8?B?aUowbU9JNFZqTWZpK1RHd3V6UVlEek9JUjgvTWdOb0ZBYzNlOUpmNklycjVt?=
 =?utf-8?B?UFArbTFidlQ1T3oxSmlqL1ZrUjcvRmVDbCs4d3ZxOEVnbVRkeHJtTGJUbElv?=
 =?utf-8?B?SlZWQzJIb2N2VTBzem5PWHNiWXluR0tteisvMERIUXNKYmhadk5vTll3T1p4?=
 =?utf-8?B?UzZQaUZrU0Q4cjNLYTZFbGtDbEkvc1pTN1RuWUMzTFVwdENkK1Q3VDZRUlo5?=
 =?utf-8?B?ZWhWQnFhdlJpK05nREpycDFqT1pUSVRYL2dvbHhNME1pL2ZKRUZZOUVQT3pB?=
 =?utf-8?B?di9xWHA5V2h5VUlFbEtYSjBxMkFWVUxQd2FMTXpXRjh5SzV0ZlhVNVdYVnhP?=
 =?utf-8?B?TGZNNmJ4ZDhKQzRtSEtweTV2TXJuTy9MYmhBNlI5LytHRDFwWUpnSEtBMU4z?=
 =?utf-8?B?N2JVenhtbThzVzJiekFuQjY2TEovVjdpdXBvdC84MmIzRm80UnB0bWMvVnly?=
 =?utf-8?B?dzd1RXZIQUdtNEhCTDV3R053cmhsNGtTSmFKbnp5a1Q0MFNGcCtDMDFsQlBm?=
 =?utf-8?Q?MNF1G3t2FsI6g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJGRmw2dzhGV3VORGd3Y0QzU3VCTFY4UTRVekdqZmd3YVpKcm1qandhWG1J?=
 =?utf-8?B?cC9vVjRmQXRFdmozZkRlV0I5aEh4N2NGUFY1MjJLNXZMQUlsaDVaM3ZHY0ZO?=
 =?utf-8?B?bWxnNzMybGhIQmRlSnl6dy9uYi9IUEdXeno3d3VxUUxPWFVxMG5uSjNuZitR?=
 =?utf-8?B?WlVnaGVUTzlrU3BEb1RmTkVNNTVnOSszbXpEQzdNNCsvcEJUWnhwOFUyUFJv?=
 =?utf-8?B?L0FzSmZTRlZENmFpYjdwemRQM0RyMDk1Q1V1M2J5UElUN3R3cUJKUzVieWxW?=
 =?utf-8?B?d1kwcW5NVzVJYTh3QVh3d2VWQVFsWnVwM1RGdmFZVGFYQ0ZuWDZaeFd0WGpa?=
 =?utf-8?B?T1FFMno1bklqVGtHc255NVQ1R0EzSVVVcCtaV2lyV0NrSnd3RkhPdE9HazRl?=
 =?utf-8?B?QVBSdVBibnRQaVhmVndWRUhVRTBTSEE4NnBianIxa0lOYjJqMUg2WGF2NjVt?=
 =?utf-8?B?ZGNLMzBZOElwK1BrY3NQMmw5NDFVaUtRTkJpNEQxWXEwSVg2Y0NzdldQcmw2?=
 =?utf-8?B?S2F2UExnUVRGNlVYRmtLUytlTjc1SXdNOHNDODhHOUs5Uy9wWHpadE1tTENq?=
 =?utf-8?B?US9McjNjUThiYkgwNk1vd1pYSG96cUtXZGFHWjRmSUwxQy92b3NEN1FsTFBz?=
 =?utf-8?B?elZJM1dHR0x6Tkg1amJKZ2lwMlVMRy84VmNNL1llcnhBRldGVGRzNFZFN3l1?=
 =?utf-8?B?K3QzVUNFN3lWMDNLNjk2SFU1NkZDc1diMzUzSFFSTjh0L3FkeWJRcFZEMmxQ?=
 =?utf-8?B?T3N4MnVlQm5VWHR5SVBqUTg2ZTJDeFVWMmxWaTM5R3RtV04xak4vQlMrMllH?=
 =?utf-8?B?dGVQMHBOSGRuSmlLbnRLQ1ltRThLeWhveFNDaUg3KzdYejY0eitoMThaYVZD?=
 =?utf-8?B?Z3RIOVNiZnVqcEU3VDg5bHJRK0Z3QXBHTmkzMGI1TVFWUzE5NWdzQ0N6UGRE?=
 =?utf-8?B?T1JzNzVyUGJHVE5kNXdPUW5TTm4xdkUrc2xhVFBOTlh4WlZ5NStkNHpnbzlP?=
 =?utf-8?B?OTI5cEMyLzgxVGdGTU1NdU4xVGpld1JxMU5BMmRMWGluamV2UVZMSlkxZXVO?=
 =?utf-8?B?bkZCSUMycEd1Mk1mb0JaMHJNb2tWSWdEWG1IVFhzSjVyVTVYSzNyQVlqeWxn?=
 =?utf-8?B?Z1VNamZDQTNZWjJ1OHJJbU03WUFlVDEyVnZXcHVVUjM1ZG5rOEtGN0pkTWIx?=
 =?utf-8?B?Y0p2REdod1ZaSElTREt1cnNjZDU5a1RieDZ0dVBCd3hQWTNEQkl5UTYzaGFE?=
 =?utf-8?B?c21UYUNaNHd0dlRFWWRNU1ZmbjNSSFkrVjZxcHl0bUpBdFUvNWg5Zy9CSFJz?=
 =?utf-8?B?dTVLaVFaVlFIbDlpMEJla1BBYnVsb3hxQ3lGUC85WllFVlRnM0dBOXMwNzk0?=
 =?utf-8?B?QVhJOEwyS3NVOU1WNEFLckhEQ2FLR05DaktsVE9mZ1h1b1lsYk9pa3VqODZE?=
 =?utf-8?B?NFBhbEowVURkbTNCekZWWEwyMnZ3TWVOaW0xWGlFNjJ1RFkvcEJOaC9xY0Zv?=
 =?utf-8?B?TkFNaTV3OEVSV1hTa0x2Q3RETlFLQWJvME0xOUM2d0d5K2s2NEhVSTRteDdM?=
 =?utf-8?B?UDdPcDM1OVV6UTYwVE5yUkw0R1JqNWFGTmRud3M3N1ljTThaNFZXMWFiU3BW?=
 =?utf-8?B?aTJScHAyWjZ5VXBqZDZMQWFjZTM4Mmh0aG0zaklxdDN4REV0UWlrZkhCTitZ?=
 =?utf-8?B?eVBvYjJKcGlNZEsxL0c4K2dOSER2OU9oM3ZHQlI3QUVaTi8ydHRmZnJmVjQy?=
 =?utf-8?B?NnNDOENZT2gyS2NUSk9JYWVISnhGVVBLZlluMllPTk5ZWDdLZDNIeEtoSHhl?=
 =?utf-8?B?U2tXTnNlZmpkZEtaOVVXQVkwY1J2YmFQYkRHSXhwVTJIVldSTmNZVGtxMEhP?=
 =?utf-8?B?cHY1aThkc1hpRTJQWFNqelEzaU9UR1k1SmMydldTZnFHeFUydkdWL2NIZytt?=
 =?utf-8?B?SmYwZis4bnBOU0EwU2hTZzFtVjVhdUJkNlVaTGxFcDVRY1h1YkJWRXNFd2Ey?=
 =?utf-8?B?bm9lL0JocE1aUXBIZlFVL2piZFpoOTZGTHVkUEpROGdUZnFyVTdYVDRTSjJO?=
 =?utf-8?B?bHJVc0ZqT0hBaGpNYXA5aER0WGVLYlhhdktkRzhDYnNxRXVZUXJQR1hXbWE4?=
 =?utf-8?Q?FCsQslQLcDpIgu8TW2rg1EfRs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e86a23-d577-4286-e627-08dd5d27919b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 03:24:28.6634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIel8jpPNrg6O+ww9jNwxyzKkrdKdYlxcgdSxRzlU6cMcxcf/ty3cCktCBrmuvzwnD8YOztYZ1azRPZ6wBUuEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781
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

On 03/07/2025, Rob Herring wrote:
> On Thu, Mar 06, 2025 at 12:35:49PM +0100, Maxime Ripard wrote:
>> On Thu, Mar 06, 2025 at 03:02:41PM +0800, Liu Ying wrote:
>>> On 03/06/2025, Rob Herring wrote:
>>>> On Wed, Mar 05, 2025 at 10:35:26AM +0100, Alexander Stein wrote:
>>>>> Hi,
>>>>>
>>>>> Am Dienstag, 4. März 2025, 16:23:20 CET schrieb Rob Herring:
>>>>>> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
>>>>>>> A DPI color encoder, as a simple display bridge, converts input DPI color
>>>>>>> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
>>>>>>> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
>>>>>>> bits in every color component though). Document the DPI color encoder.
>>>>>>
>>>>>> Why do we need a node for this? Isn't this just wired how it is wired 
>>>>>> and there's nothing for s/w to see or do? I suppose if you are trying to 
>>>>>> resolve the mode with 24-bit on one end and 18-bit on the other end, you 
>>>>>> need to allow that and not require an exact match. You still might need 
>>>>>> to figure out which pins the 18-bit data comes out on, but you have that 
>>>>>> problem with an 18-bit panel too. IOW, how is this any different if you 
>>>>>> have an 18-bit panel versus 24-bit panel?
>>>>>
>>>>> Especially panel-simple.c has a fixed configuration for each display, such as:
>>>>>> .bus_format = MEDIA_BUS_FMT_RGB666_1X18
>>>>>
>>>>> How would you allow or even know it should be addressed as
>>>>> MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
>>>>> 1. Create a new display setting/compatible
>>>>> 2. Add an overwrite property to the displays
>>>>> 3. Use a (transparent) bridge (this series)
>>>>>
>>>>> Number 1 is IMHO out of question. 
>>>>
>>>> Agreed.
>>>>
>>>>> I personally don't like number 2 as this
>>>>> feels like adding quirks to displays, which they don't have.
>>>>
>>>> This is what I would do except apply it to the controller side. We know 
>>>> the panel side already. This is a board variation, so a property makes 
>>>> sense. I don't think you need any more than knowing what's on each end. 
>>>
>>> With option 2, no matter putting a property in source side or sink side,
>>> impacted display drivers and DT bindings need to be changed, once a board
>>> manipulates the DPI color coding.  This adds burdens and introduces new
>>> versions of those DT bindings.  Is this what we want?
>>
>> There's an option 4: make it a property of the OF graph endpoints. In
>> essence, it's similar to properties that are already there like
>> lane-mapping, and it wouldn't affect the panel drivers, or create an
>> intermediate bridge.
> 
> Yes, that's actually where I meant to put the property(ies).

Put optional dpi-color-coding or something else in endpoint-base?
Assuming it's optional, then it implies that it will overwrite OS's setting,
which sounds kinda awkward, because it is supposed to be required to describe
the actual color coding. If it's required, then we would have to create
something like dpi-endpoint-base, but existing display device DT nodes are
based on endpoint-base.

> 
> Rob

-- 
Regards,
Liu Ying
