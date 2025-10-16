Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB3CBE1BED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDAD10E95D;
	Thu, 16 Oct 2025 06:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DjReisWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEB710E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAV+Li3PhDk5wQh3KBI/VBNDuwRgeBnyqA+0EJ84MtAGRyGC40GrR8UxMTb7qsiSSlm6u6cBUx5bGSbEx8oT0lbzy+TEeok7opllT/bQKYWMxQfR33iV36xK0bEs5cR5rw+3rmzP6zhoQj+RMbrL1AfZNRrkS1+rVX7yf/eXCa2hz4ZVH014BMqwqUJddV0+VyrhB4bJvBikhTbpU+z/RnPuh1Hdl3Ht2bdwatKY/+ZPhlE77v4DfsIFRkWCB1paG8QPj2hVZHCGndSD4U9tYA9OoskHbFG1OJe7VlOzAztYw4UtJLA4HpqbGAhX/7zTxH6B6N0+zBQLCoatFivhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yukhhkRsH82J7m7ux9G4bzAwAdach8qioarrVe1Iw0I=;
 b=WUEJuVQ9ubTzN8xQHR+RRR5T7m4YgCzOnBZTPt8TqKBn+Nu+fsWXsbOK9yQUB6ptNO6l+xDa/AnS5HAkJD+IsdqUbzDnO8FWI68hEAVdbhFKhNNs5CTGpgtlc5WT7n0bwUWPEDRAcDQtw3XnlsJgBrZXljPXecJt68SjGmgYVTfo4ZzaNqwjLZhyN8MUgHhCQhpXDxahQI939qhwezXKl8d/hc1mWoVmxbw4jZ7vcClE0csLWbvxHoGPtro/ADVpfePY73KlL/YANlX8d7lIZJj229vBiSyIJUdkoveX12Q2rZu/X5FVt49irNIHdgKINUErUzA1mXwqz4Fvdejqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yukhhkRsH82J7m7ux9G4bzAwAdach8qioarrVe1Iw0I=;
 b=DjReisWFVzIxJ8J+/kRwAYDiX0ohkP8Ocorx8paO1ttiKTapqcIwhG7Q6GONPgluY8Z5zvcDFD5GOo7hSMkIAQOjjngpY5/Wiar6dbPiACVVh4pgsUb+ZSo7LAjAEf9tHY2C+wc/9MH6gt4kx205bkOp0ao2negOZhum70J18TZ2m8ZryFDLVvxl8+93x6yEO4COK2y7eGrVUAA3zeUJMSPb4vfJwYsulpYuqxlMiEgeXfU5DOyQAoJN1fChdD3lzt7Mttfe756tsGaepaB8J8mFnQYb6CsQVy1ufoLYuC05x8YHwJnGgKRtCCem8riukIqG4ftkkF05gK64POJmqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 06:33:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:33:56 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:32 +0800
Subject: [PATCH v4 14/14] drm/imx: dc: Use prefetch engine
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-14-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5841501f-29a1-47d5-29e9-08de0c7dfb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlJ3N0twY1J6U2t4dEp0VHkxRUVVSjVuVEExbURVbERySGFtV3pzMzRVdVZl?=
 =?utf-8?B?OHhDT2FmclVlTDlFMGhLQjMyRkVYMjZNYmxkRGczeFAzd1g2YzA3bUpaaGw4?=
 =?utf-8?B?M1ozUWZ3QWdyWFNFSDNXUXl6empTRnh3bU5GSzlDSkFBZ0RzendVK09TeVRG?=
 =?utf-8?B?aXRPRXBseWFhUlBwLzJpM2FvTWRER25PMlVUOVlzd1hSOTg2WWFldlpubnFJ?=
 =?utf-8?B?OUZpMzc5WWk5LzcrOHl3dVl6bEVWcDVSNWx0dVY5ZU9ZNWcwU2RuZDQyazBY?=
 =?utf-8?B?Q3RZY21PM2RIVmVKS1BIWkVIS2plVVdRdVp4b2dGNEdWMkkybmJWTjBIbHZR?=
 =?utf-8?B?T21PR0FzTG9Qb2wxdXJVbU1Tdk9EZUFnV1NrU0tsZVo5dlJaeXV2bDFSa0Y2?=
 =?utf-8?B?WDlTaCsrU1lCeFY2WG9OZmEwSFVYMEV3TzhkdEFuZFBjaWs2Smtvb0x6RTd5?=
 =?utf-8?B?azdWNkVJK2ZhdnAzK3pJT0pha3QvR0VHVkRGbVh6RFZYNTZ4T3JtbjFiZFg1?=
 =?utf-8?B?SEg4c1ZJdW9WVitBQjVmZkJXMTNLd082YWlxZ0FxS1ZpdDhBYmNtY1p1WDJ1?=
 =?utf-8?B?Tk9NTEJvODdoYlBBUStGRndac2l1ZGpya3BOU0JTRUQ2V0RadFFGc1A5N2w1?=
 =?utf-8?B?MVh1UzYrUzhVWGhVQzRGMVdtSFBLcVAyZWp2Zjh0ekFmSU1QRXNidEwrQkxU?=
 =?utf-8?B?bitHZFR0cGlpZ2dZV2gzbFQwUlVYckdkN0UxRU55T1V1bEdhTkFNaXpVUG9q?=
 =?utf-8?B?QWdkeUVkbk15cVBoYTZJODlJaHJvT2RmWm1WT05Zc1UvV3dWclFwZWVMSmpj?=
 =?utf-8?B?N1lXeGtTWXpnamhXaVJBRUZhelA4RDdPbGd1LzdXVVpjU05qSXNjM2swUkha?=
 =?utf-8?B?Ykl1S2dLVmZrYm1vTjE4L082SWJsb1FNM1NLaVlPNHBNb1FUUFVCckY4Tk5N?=
 =?utf-8?B?emkzSXRoVVE0eFJXZ1RacGZ4Nzlud21KamVYRGRmeDdnVDBkZm81d2VBWXNE?=
 =?utf-8?B?Zm55NTB3TkpHalFwcnFXOW5KdWxqU1FROFBZMktsUy9ocVdmZjg3NWFXMmVz?=
 =?utf-8?B?N3d5a1AvTGdlbmZONWRydkZtUWlYazhkY3VDMFRudmxNR3J6MTVYZ1NEdEZ3?=
 =?utf-8?B?YUJEUnd1N3p2ZGtFeW9rL0VQZjJCNncxVUJBOTdlZng4elhHeXk0amh3RjBZ?=
 =?utf-8?B?KzZDU2VCL2poNnduZWxmRDBaYlVPMEdKMkJlVzE1NzhnZFlKNHZUeW9Ubm5V?=
 =?utf-8?B?eEtvbC80amFPd3pRNkp1WVVSUnZHRzZ6QnE0WTdhcGhYUlJHZXhQTmJETlZ1?=
 =?utf-8?B?WnhJVkpTTU44RGFOOThSVnIvN281dmQ3WXUzTExtNjVnMCtwYUFIQ25VdG4z?=
 =?utf-8?B?VzNyQW9HS2hQOEZBVisySU5sWGdlMSthMHNDa2R3OGx1b2hNNmtTdnMyeVA4?=
 =?utf-8?B?cjdyOFc5a3hjODJtK1l1WXVwcGFtb1dKZlRqcExBSFhWTXRLNE5NQjZGaFNJ?=
 =?utf-8?B?RUpMOWtCaHVOYjc2OFRETGZYbUkvWWJ2WnZkOGhaK01DOThTYnZab2hzS2Rx?=
 =?utf-8?B?WFVGVGhwMnI5eTNWZ0R0ODNKakUyd09uSDNhcVMvNTM4V01sakZUUmgvL2tX?=
 =?utf-8?B?eEZvN1ZnV1NBRUFCM3I1dC9kOTdNTU5rWFcrK3o2U1lVSCtTaUdhSXVQWnVK?=
 =?utf-8?B?QUN4WVVlYnQrUitZck9kM1NzYjlRYjduRDN0OGs5VGtUMDN3TnFoaDE1NXQw?=
 =?utf-8?B?SUh6SmpiMDVvOThBbFhJZjIzOEIwZzJmL3FDY0JDWTgyOGdkRFBtaWxZWlZs?=
 =?utf-8?B?STJUenBDV09sa1B1QXpXQTVYL3pkb1hCM29UWGFJK2dTM1JTbUY5d1FBUEpv?=
 =?utf-8?B?WEJuTUhlK25xcUZTb21iTHg4cEw0NzRZQ29JSW5qdUtudDE1Mm5iVG9QUk9N?=
 =?utf-8?B?bENVMnhMZXN6YlhrN0ZQU20zSzdxYlVFSEM3UkNrd09zdE9vc21XRUJTbVZP?=
 =?utf-8?B?ME05VmloSVgwZEVpZjFreGxselVnUG9DWkpZb1RESDJBdDd2Y2JCeUltWXh1?=
 =?utf-8?B?YVBoNmNiV045UHRQYUttMEFiZFZBR2VQWEFjQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJiczFsb2x4eG92QkRwa3htTExScjhPWXk3b3RrS0hxMEJpRHVBNEs1bWNG?=
 =?utf-8?B?ejlCbGlkVCtSZDNqZVpDTlExK0wvdjJBR2M4ZytsWHRNaWp3L25YV0lhdlZv?=
 =?utf-8?B?Z04wQkkrVmpXcC82bHlaM3FCMloyL2huT2g4dGh3ZGk5LzFDOG80UzBGZThh?=
 =?utf-8?B?b1E4NWJ2QnE3T045SzVIWS9CNzFySlBYYnJNZEpjZzRXUHJJcWZzVnJzMWo4?=
 =?utf-8?B?V3NnZmczZVNkd0RXa1FhLytvSDB2OWNvZzJxRGFQZUlZTFJoWmpwemd2Wk1t?=
 =?utf-8?B?eEl5TVI3Q1hqdTAxUGZlVW16QXpNYy9uWXN6ZUp4OHVTY2xHSE1EMTFianZq?=
 =?utf-8?B?MWtiS0V2NmYrZUNGQ25PZWh2c2t4RzFqM0xKNjlxcnVTSEsrS1RhckJJYWNB?=
 =?utf-8?B?L3BHZnlWZ2MyenNpeWk0SCtYOVZtZXA4a1djMWtlUStaZm40bll5NWdmZ1N5?=
 =?utf-8?B?a0E3ZlZXZi8xWkZMNzRPR1VGQUNFOTQxZGc0VDBHa2RCaUZ1SmloNzl0Z21q?=
 =?utf-8?B?Z3JNaXhIQm5wMHFyL3BHRkJIQ080b3lzTjk3RnlsU2xNSFFrRmdLay9QUCtH?=
 =?utf-8?B?a2t1bFg1TXA4S1grcUxWOEV4ZWxmZ0V4ZThOUnNoYVkxKzlSeWxPTG05OEd6?=
 =?utf-8?B?V0xGU0IzSEZkaW5BVCtpcDd0RFQzMUN6MCtqZU95bERGSUVjMjJrYVdVMW9h?=
 =?utf-8?B?eTJGL0dHUFJNLy9HRXhuVmpLMGlkOUJYV2VvQ2JTVWxMT3ZLZTEvTzlYM1NL?=
 =?utf-8?B?MlpzRmp3dVlpbkh1cERoa0piZnFUUXRIMFZJaFA2NEVVbGVBZHV5aHVQVFZ6?=
 =?utf-8?B?ZEtvODA4a2l4MUErTmozOFNmRHFLR3B1cFBLbXlSaHovWVhKOXltdnNaN0ZG?=
 =?utf-8?B?UlRCdzc5Uk82ay9FamlnbWFIcGJzZ0tWL1M1c0JLOHBGRXd4Rno1Snhwcnh3?=
 =?utf-8?B?WEFBSmtOYzJ3N0kzNEtvV2ZlVXNucUxHcG5MU3NFaTBaamJGTWFIZzBINHBj?=
 =?utf-8?B?VEdqVTc2TmNCQ0UwdTZRM3RxMmhZU1RXN1JmS3FTSWxPR0hkR09UWWVIODhr?=
 =?utf-8?B?K05tUzF4WkdjQzJIdEt0bVB2eHUxVDA3L1NBdDkrVVZLRVZ3aW9qcHNpM29l?=
 =?utf-8?B?RjdGZFBDOVA4ODh3SytvYXkzRFZYRm1YNmswWE5HR280ZEw5UkswSm5DWXV3?=
 =?utf-8?B?Q0RJZ1BMbS9mekYvT3k1UjRFQVlwY1VJb1JJdjU0elNpVGN2MW13OUp4ZENJ?=
 =?utf-8?B?UVgrOU16TjA3R2t3QmZzczNtNHBmc3Q2cUlFWWNKYlRQZkxsUDJCK0hwZTBi?=
 =?utf-8?B?M1QvaW1sd0pyVW9GVkwvaW8vMjRQblRWaHVLVzdpOXR0TVZJLzUxcTBmTFBN?=
 =?utf-8?B?Qk9ZK1k2aXpzeEhOSXVqVzhVWGUxM0ttSWJtMlJQenhwYjZXcXB4MW9FRDNn?=
 =?utf-8?B?Z2QwTmdzM2lFWnlvRFFMaFBTM2RhbjBrSGZmdkIwV1A4RFhGK0E4OWVGYVQ0?=
 =?utf-8?B?TWVqa0xpeDUrdjhZaVpabDExajJrNFQ4K2c2ck51aEIvTmJtdWd0WnR1ZnpQ?=
 =?utf-8?B?VVNoZWo3R2JLQmlGZjQ1VUxmZlh0aFdxZnNzQlBraG1Wd3dnZFR3Z2NpNklm?=
 =?utf-8?B?QThIMlhvK3JBaXNQZWtWeUh3cHNtM1dUaEtPY2lVMkpkQzRjbFUrQ2ZobWp5?=
 =?utf-8?B?ajhndkhqa2E4Y3NaU3RlT3VJcGVBTlY3ek9oS2h5Nkp2ZDRwZzdGYkNTVFZ6?=
 =?utf-8?B?aWVyZm12UThocmRWWlBNV0JuWEFacGFtNnA1citpNHkvU0JUZ2VFVUpYUHlR?=
 =?utf-8?B?TTNMWE9BNisyM1hnRDFSOGp3Zi85eHZob2JMODk2WU5iZy9XcU9ERzNjL3pt?=
 =?utf-8?B?OG1relhyRHhVSTRBZzlPc25WTk4rb0xDdUhXTEtZdllZYi8zOVU4UVN5MWg3?=
 =?utf-8?B?N1F3Tkg2Q09RL1lmbXZNYzZ6Tjlub1dEVUVzb3lMYUR0ZVNMZVRsR2FLcU55?=
 =?utf-8?B?SDdnYmRDZ2NiTjFEbk9ZK3lnVUtzbklzWTJsVmdKaHNtRFdrejlVTlhiYlkx?=
 =?utf-8?B?WFlKMTNHQlF2dGtKNzdCVVJJRFdZamxPeTgwb3A3TER6UG5LWEN1YUpQeTdZ?=
 =?utf-8?Q?ioPS495o3l3eLfiyXCgZo6Mgx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5841501f-29a1-47d5-29e9-08de0c7dfb86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:33:56.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61qtdtNOK6zOHZB/jsmStHnRAbXKmB9fWs6lZ7m/Jy4jhgqk/paIMtavJ39X2m44Tx0PNjXZl8xrx+qo0+HeDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

One prefetch engine consists of one DPR channel and one or two PRGs.
Each PRG handles one planar in a pixel format.  Every FetchUnit used
by KMS may attach to a PRG and hence use a prefetch engine.  So, to
simplify driver code, always use prefetch engines for FetchUnits in
KMS driver and avoid supporting bypassing them.  Aside from configuring
and disabling a prefetch engine along with a FetchUnit for atomic
commits, properly disable the prefetch engine at boot and adapt burst
size/stride fixup requirements from PRG in FetchUnit driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
 drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
 drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
 drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
 5 files changed, 197 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-kms.h"
 #include "dc-pe.h"
@@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 				drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *old_plane_state =
+			drm_atomic_get_old_plane_state(state, crtc->primary);
+	struct drm_plane_state *new_plane_state =
+			drm_atomic_get_new_plane_state(state, crtc->primary);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	bool disabling_plane;
 	int idx;
 
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
@@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 	enable_irq(dc_crtc->irq_ed_cont_shdload);
 
-	/* flush plane update out to display */
-	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
+						     new_plane_state);
+
+	if (disabling_plane) {
+		unsigned long flags;
+
+		dc_crtc_dbg(crtc, "disabling plane\n");
+
+		/*
+		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
+		 * sync is triggered.
+		 */
+		local_irq_save(flags);
+		preempt_disable();
+
+		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+	} else {
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	}
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
 
 	disable_irq(dc_crtc->irq_ed_cont_shdload);
 
+	if (disabling_plane)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
 
 	drm_dev_exit(idx);
@@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
-static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+static inline void
+__dc_crtc_disable_fg_along_with_dprc_repeat_en(struct drm_crtc *crtc)
 {
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	unsigned long flags;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	/* Don't relinquish CPU until DPRC REPEAT_EN is disabled. */
+	local_irq_save(flags);
+	preempt_disable();
+
+	/*
+	 * Sync to FrameGen frame index moving so that
+	 * FrameGen can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
 	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
+	/*
+	 * There is one frame leftover after FrameGen disablement.
+	 * Sync to FrameGen frame index moving so that DPRC REPEAT_EN
+	 * can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 }
 
 static void
@@ -335,14 +388,29 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_crtc_state *old_crtc_state =
+				drm_atomic_get_old_crtc_state(state, crtc);
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	int idx, ret;
 
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	__dc_crtc_disable_fg(crtc);
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	else
+		dc_fg_disable(dc_crtc->fg);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum dc_link_id ed_src, lb_sec;
+	bool disable_dprc = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
@@ -383,13 +454,53 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		return;
 	}
 
+	ret = pm_runtime_resume_and_get(dc_drm->pe->dev);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
+			    ret);
+		goto out1;
+	}
+
 	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
 		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
-		goto out;
+		goto out2;
+	}
+
+	ret = dc_ed_pec_src_sel_get(dc_crtc->ed_cont, &ed_src);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get content ExtDst's source\n");
+		goto out2;
+	}
+
+	if (ed_src == LINK_ID_CONSTFRAME0 || ed_src == LINK_ID_CONSTFRAME1)
+		goto disable;
+
+	ret = dc_lb_pec_dynamic_sec_sel_get(dc_plane->lb, &lb_sec);
+	if (ret) {
+		dc_crtc_err(crtc,
+			    "failed to get primary plane LayerBlend secondary source\n");
+		goto out2;
 	}
 
-	dc_crtc_dbg(crtc, "disabling at boot\n");
-	__dc_crtc_disable_fg(crtc);
+	disable_dprc = true;
+
+disable:
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc) {
+		dc_crtc_dbg(crtc, "disabling along with DPRC REPEAT_EN at boot\n");
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	} else {
+		dc_crtc_dbg(crtc, "disabling at boot\n");
+		dc_fg_disable(dc_crtc->fg);
+	}
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc)
+		dc_dprc_disable_at_boot(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	if (!dc_drm->pe_clk_axi_disabled) {
@@ -397,7 +508,13 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		dc_drm->pe_clk_axi_disabled = true;
 	}
 
-out:
+out2:
+	ret = pm_runtime_put(dc_drm->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+			    ret);
+
+out1:
 	ret = pm_runtime_put(dc_crtc->de->dev);
 	if (ret < 0)
 		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 8339f44c0091918c796c478d968e0640391781d9..28f962af697469f4ad32ca23876938792a74779f 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -124,13 +124,28 @@ static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
 			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
 }
 
-static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+static unsigned int dc_fu_burst_size_fixup(dma_addr_t baddr)
 {
-	unsigned int burst_size, burst_length;
+	unsigned int burst_size;
 
 	burst_size = 1 << __ffs(baddr);
 	burst_size = round_up(burst_size, 8);
 	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_fu_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = dc_fu_burst_size_fixup(baddr);
 	burst_length = burst_size / 8;
 
 	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
@@ -150,8 +165,14 @@ void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
 }
 
 static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
-				 unsigned int stride)
+				 unsigned int width, int bpp, dma_addr_t baddr)
 {
+	unsigned int burst_size = dc_fu_burst_size_fixup(baddr);
+	unsigned int stride;
+
+	stride = width * (bpp / 8);
+	stride = dc_fu_stride_fixup(stride, burst_size);
+
 	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
 			  STRIDE_MASK, STRIDE(stride));
 }
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 9fbd7aadd26426d797e89a954e7e4cfa3e597b62..0527a7b2221ddab84dc6459a84a2cf4db834a7e0 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -87,7 +87,7 @@ struct dc_fu_ops {
 	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
 				dma_addr_t baddr);
 	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
-			       unsigned int stride);
+			       unsigned int width, int bpp, dma_addr_t baddr);
 	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
 				       int w, int h);
 	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index a25d47eebd28792e4b53b4ecc89907ce00430c2c..8b45b21a6f8a7e6e6ed2563499753200bdd42ebc 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,4 +130,9 @@ struct dc_plane {
 	struct dc_ed *ed;
 };
 
+static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dc_plane, base);
+}
+
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e..e6bced9b716ba19cc913860744258434b3933212 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -17,6 +17,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-fu.h"
 #include "dc-kms.h"
@@ -44,11 +45,6 @@ static const struct drm_plane_funcs dc_plane_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
-static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
-{
-	return container_of(plane, struct dc_plane, base);
-}
-
 static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 {
 	int src_h = drm_rect_height(&state->src) >> 16;
@@ -88,6 +84,28 @@ static int dc_plane_check_fb(struct drm_plane_state *state)
 	return 0;
 }
 
+static int dc_plane_check_dprc(struct drm_plane_state *state)
+{
+	struct dc_plane *dplane = to_dc_plane(state->plane);
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	struct dc_dprc *dprc = dplane->fu->dprc;
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+
+	if (!dc_dprc_rtram_width_supported(dprc, src_w)) {
+		dc_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
+		return -EINVAL;
+	}
+
+	if (!dc_dprc_stride_supported(dprc, fb->pitches[0], src_w, fb->format,
+				      baseaddr)) {
+		dc_plane_dbg(state->plane, "fb bad pitches[0] for DPRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int
 dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 {
@@ -123,7 +141,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return dc_plane_check_fb(plane_state);
+	ret = dc_plane_check_fb(plane_state);
+	if (ret)
+		return ret;
+
+	return dc_plane_check_dprc(plane_state);
 }
 
 static void
@@ -131,6 +153,12 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state =
 				drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =
+				drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, new_state->crtc);
+	bool needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+	bool prefetch_start = needs_modeset || !old_state->fb;
 	struct dc_plane *dplane = to_dc_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	const struct dc_fu_ops *fu_ops;
@@ -152,7 +180,8 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	fu_ops->set_layerblend(fu, lb);
 	fu_ops->set_burstlength(fu, baseaddr);
-	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
+	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, src_w,
+			       fb->format->cpp[0] * 8, baseaddr);
 	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
 	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
 	fu_ops->set_framedimensions(fu, src_w, src_h);
@@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
 
+	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
+			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
+
 	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
 	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
 	dc_lb_mode(lb, LB_BLEND);

-- 
2.34.1

