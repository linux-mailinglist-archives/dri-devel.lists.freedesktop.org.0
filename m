Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA7B530C7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086810EABD;
	Thu, 11 Sep 2025 11:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vh0hpRif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAA310EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1Errn17666pzyHO59Y1hM+vv/jnXQqZn9EQr97TcnaEp6qPBicz515Bflv3fYgBnXN4PIYCwTULb3RDNSxPQ31BdMvrixDDAM2isoRee7nItJs+1IYHLAMA2TsY5iKDfbeBeYbHpIEpx7MNUIKRrpaVBnsltDYkR7AcPG0/nMvF76VxBFNohmzacZryfCCV4V4BwmaeY/BDc5u2HiZxcvX0cv4TX7mSdsq8t8k3bS1SXaQmxXTkTJlHb3dohlTJ37QlE8OaZYu5sGQJmTbH++jG33yVyDlyL6dsPciPIlh2qEP2v08iLwdJ1qCEd6RZwa2mOtv69sdJMxhPq63IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAdOgeg7NPl/P83AFbc+paxfIgIQNZpJAvPLn9PCFmU=;
 b=vcqLHM73ARmxDfsvrDu+sU7jkaZRgNBV+jYyO0nC9eO+hiawMr8mnp42gwqkLu+du9SLF7igcqdNzIZ93V2+Qvx+xDFhO8ETVkIInbeUofTm7Z7H/Zpn3WFc7vhrntxJosOC+2PgPDF/6jJ+7luBu26jGa/FJlyM0bFLUCnMUfs8f++xU1u2I2ycTCyw2diwlx05ft+/LdVErw+dj2qYc2azJcH/9nDHz1upanFrLBFtfUV7RlIyePCdXNbe0O8Bm1Y94WIeh4oTRFixqeQFMg5BLcndoIxKbPnMnYc7aQ/26S/8nplIyfYteFL8wzqGqQpmoLF57MjhZbyS2kJsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAdOgeg7NPl/P83AFbc+paxfIgIQNZpJAvPLn9PCFmU=;
 b=vh0hpRifC1PXpai1enFHXbOTQSpUfRYOoGuMsy2Q/JHyCvwtHRLVUtNZiqk4W/qOkxzw0e/Ccd9Js49iLoFev570R92Oar4wb3FrQJMRbD/GC9tnBN8mKUgLyNw7M5F+tlBKj93XpoEvW+zTZVGouEA1s7V7tRnVtFNKmWtXZbkpU8HpQXFQCJIxmuXLyLisjlCbCjj5+ly0+K08BC4tYevMR0SJYXCzhZMhstKlgsCZh91g/x1KMzqg0tTNL2Ao3wKr/zvfKHo692WjtsPJwvkqRnRoXVPHjPPOf3B+HOrcHUJkwTtNY/3tc9+CQtKiwgPrcHvDgTDUH/6oLGJuHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 11:37:47 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:47 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Date: Thu, 11 Sep 2025 14:37:04 +0300
Message-Id: <20250911-dcif-upstreaming-v5-4-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::24) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: a36bc46b-cfa7-45e7-1deb-08ddf127a1b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUdMNko0UHltWTBvMmdSZk4wRWNMZlNoQlFSVThsMkE3VmdZTDBpaTV0WURW?=
 =?utf-8?B?M0FOZVFqbUdUSmtKaHd0ck0rZmRzMDJ5Z3FvQkxqVVRNdjBSRThONEU3UHFR?=
 =?utf-8?B?V1BSTzkwTFJjd3pDK1ZpZnFmOTlhL3dFcCtrbUk5cEUxeVNEN3FWc3dtZ0pI?=
 =?utf-8?B?VjFib3grZkVMcm1ZdzA1K3ZUV3p2UkI4Qnp1UXpnaFNuSFZmT1ZnajhuYUtQ?=
 =?utf-8?B?UThqKzRtd2hySkJaRHBwdHZOZ0RCeDdFM0RINGpqakVtUlp2aks2ZjUwV0w3?=
 =?utf-8?B?MFlkd2w0R1RhQmFGalVCdjI1aExuYmd3Y25FemI1TUVEZGFxVG1QRlFXR0tw?=
 =?utf-8?B?Q1Bibzk3WGpjU3RPQk9Zc2haeG9aR09RcmM0N1A0VXh6QWR5aThwWUMzL2l2?=
 =?utf-8?B?eFNlanREQlphaVgrQTJpdHBmSG1LZkxlbUhaYXcrT0NKNHdYR2xmVGNhUkJu?=
 =?utf-8?B?aExVdUpwcmg4aEI2U3IwWHdzQXF1eUN5TkEzRldQTW5hdS95YUZVa21uU0o5?=
 =?utf-8?B?d0cwaDlJcVhPRUIvZ245NWh4SlREQXdraGRyRWtxekRQU25yelo5LzY1endx?=
 =?utf-8?B?ZkM1Q2xXcGxjL0dlUm9oaTAxMWsrZWJkb05EcmRMZFhtTVZVNVYvckMzTXZ5?=
 =?utf-8?B?OHRLZEZqaWhIb3hiOUFrbEtsQms1Q0ZlU1BOOVJXbDI5SEdka2pRRDY5V3Zx?=
 =?utf-8?B?L0xXQ1paRW1jQUxPZ2pQc3JoazBhanJOblh3RFhiSjVyTnVGVHQ3L0VvMVRE?=
 =?utf-8?B?Z1EyZEk0MEE3NFpraGJjb2FPQUFqcFdHSTVPMm1laDBaL2IyZjJqZGNRbGQ1?=
 =?utf-8?B?d0h1K1A1RGtsK05hdTVYUkIwQlFIc0QzSnBzVDd2Y2tNa2JZU1VOanlyaGZv?=
 =?utf-8?B?azkyamN5MVRFMkVNL1djR2dQYktubFpFcnVyRGdnOWx4TmpSQWlwYWJwaXEv?=
 =?utf-8?B?UWZBeGlFRURpVGpZSlVMREhlSnFvTzB1QWNpWnZ3eHlaZEM5dUNPVVpkRzBl?=
 =?utf-8?B?UXB5cjRjRk52aWc5cVUrODNmY0s3cmdrTnR5NzlGRnVNYzE5UjA1KzdVWmxH?=
 =?utf-8?B?dVJyelEyT2R2ZG9ORURjMGc0YzJGMi9sblFzVmpPN3ZvNW53K3grS3A0WG1H?=
 =?utf-8?B?Zk9QNUoxWUJPcUtTSndNTmZaT3pKUlVJdXFUQ01ZR1RRdjJiZHBtcGFzS2tr?=
 =?utf-8?B?cHp3ekYzRE1OU29oMXpFY29HYUQxeHp1N2s3MEdVVHcwNnMwQUt4VG9MbmxD?=
 =?utf-8?B?ZHd1SWhieDVXL3FjcU1nMm85VzZPQURleEtHT1N2TmxIclEwbmRCQVNSVDRk?=
 =?utf-8?B?cUp5a1V0akpoMkEydUlZeFlhcHZ6N0M4azdtcTZHTm5ES1ppeU9ZT0N4aE56?=
 =?utf-8?B?K2piSndGVDNyZk9zZHdLeWlGMTZoemFpQWI4V2NKK3N4UVQ2ZEkyRXBtSHFz?=
 =?utf-8?B?UXd0Z0NGeFh2a2RjWXkrUk50SE9FeWludmhiaFJvcFJlNThZMG9raTZiNWcw?=
 =?utf-8?B?ZG1iRnRVVUN6aWFWZGpvcVVyQkJSNlJCWTBNdi9vNU4wejhkQ2ovUEtzdVJT?=
 =?utf-8?B?Vk5PT3hZeDRBZ3paVncxblFIeGxyZXRKOXZuRGI2WGlDbkIwVkNTQnN1RmdO?=
 =?utf-8?B?ZGZEWGxjK2dSRm5RYUlQTUloTFJXelJzN2tzNjVOcGxhWUwzd0FEbVQ5UGVk?=
 =?utf-8?B?WGFmVmZSNXdwZHNpWUh0RlhvQTBKajNrMG9TUEJTdE9Tbjlla1BlMkZQbUl6?=
 =?utf-8?B?aFJjK0dpYUtBMFBSM0thMERiRGp4SWNlWHovZ1duL2o3T0JpbXdKWERRL2tW?=
 =?utf-8?B?a2xROHlraEpoS25MQ3Vxd3VsSGduc3RZZE9KM2dZdXpzTEEwRnhEZUxEZTE4?=
 =?utf-8?B?R085cWZoalhmS2lpRnovVm1WYkRTSFhDSkl6a1BZNTlyekY2amNIZHgrTzFN?=
 =?utf-8?Q?49OjWwG8W58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1ZkNDc1S2VGRDYxKytOOG5oWDVzNm9GR29SQnB2WmpJSXlXclhEZFNJSG5p?=
 =?utf-8?B?amdKTGpvMEMvQ3RtaXVDRXpuTkFDOG8yRmttdGxMZjl6MHdPaDNKL3JIRFgz?=
 =?utf-8?B?bmZMWWlQN1NFalk0MXUzMFpiR3ZVL2NiN0xteUdlVWF6VnZ4WmFzenpyUWJO?=
 =?utf-8?B?dXdneW1KM0hCMHFGSitCMHZ2L1hjdi9HRFNqdjl2Q0RScW91TnM0OGl2TXZF?=
 =?utf-8?B?Q0RSRll6ditJU0RNQkJmRUJqUFFNY2pWS0tZbWNXZVRCOEY2T1JiVFR1OHF5?=
 =?utf-8?B?dlMvYzJYOU9mYzkzenlnTFBhWVZHVVRWMExJbmtlWmJVKzB4TmE5R0pHeUtW?=
 =?utf-8?B?TDhsY2VGM1ZMb3ZzdGd3YmVlbjQybjM2dWJNSzVLK3Zmby9kYkVBdFB5Mlhm?=
 =?utf-8?B?eUxzeE9nOGNCdk5FS2tDZExJa3RUbGJtNHVnY25hc2ZKYzVtK2llY3ZMaUdP?=
 =?utf-8?B?Y2Z6Yjk1MUM0UjByTVBMUjcydEF1VGdEQTg5UXBrb2Y5UzlJTnVJakF5d0hG?=
 =?utf-8?B?TFVEUGE0end2bzBBWHRheDRWL0pQOWxJeWJGa2ErVldFbkZNMkI0bElWRkRI?=
 =?utf-8?B?eGFNWldhQW9RMG5vRWVRd01kVUsrd21RcWNSb05ScFQxUXU3Tml5Yk43dThM?=
 =?utf-8?B?MTR0c2tXbnJFVG9Ja2hGdEJYRzE5ZDJtejRvTzZsemhUQjFKL1B1ZTlsSkNR?=
 =?utf-8?B?Um9yWnE3SGdNb1ZaTjlueHZpNUVHSDdha28vNkNsRXJ2NzRUbmhQMDB1Nm9w?=
 =?utf-8?B?VHlqU3czRHg0a05uYjFBUm5qTmhpU2dXOHRtY0RFY0lDMmtrZU1PenJoSWZG?=
 =?utf-8?B?MVRUNU5kNjVoeUhTMDlJWnhGRTVqYmdZSEF2MXJuNS9EQ0ZlQ0FtUU4xazlv?=
 =?utf-8?B?Y2plMmtnZk9RWkNIam55YW9ISFVaK0NTWlpCVzRMeGFNL3NLdktJd25jZHNR?=
 =?utf-8?B?aGhEdC9USlIzTFRFRVNqRStJampwNGRyakc2R2IyNVluRUtQUTNvdTg1Q0p0?=
 =?utf-8?B?ZDZudkJXbW5tUEg1R0VGTXFrMHY4Yy8waTZmR2NOZ0loKzh6RmgwSkQxQ2Ir?=
 =?utf-8?B?cUxaRlI5SmJKc2haQlE1bXQ3SXZ0eGxCVzVvZXM5ZmlpbExuNHVYb2tuR3VD?=
 =?utf-8?B?c1g1eEhKL2FaaklWWlVvaXlUR0tzNEppbDQ3Slcyek9BUjRNK0dTRGovOTRo?=
 =?utf-8?B?YVhpSzlMSk13VGhQczJudjhWTzNsYnJaWGR1N2RsUGEreEVJUjdudE1waCt5?=
 =?utf-8?B?Tm1uc0ozOHVhZmgwcmpYaHlqVGFsUGJTVC8wcmJCMzBhcnpuRUlBNzgzOWI5?=
 =?utf-8?B?Mk5ITW5XR05EdFpMRjZ3VnU1MW8xN2g5SXJTQWZza3BHU0xjeGRUMWxaelhX?=
 =?utf-8?B?cEd6REFiMDBpbm9mZThrcDVxdGthL2hMK1FyWVFyRVAyQVB6RWVLZzk5WEFG?=
 =?utf-8?B?UjRBaFRsbkNjcno1VS8wV051YmdzUEF3NWx1RDJUcEVPNm1zOHFkeEZ1aWVZ?=
 =?utf-8?B?UU1aU20ybElKcmJJYXN4akJIUXdOT0k2MGNrVzMrbmZhUVQ1d2IzaStZSkgr?=
 =?utf-8?B?T3o0SkJFcTQrR29ZV1J6ZFRjMHRqOUcwYXhWQ0VkcGZ5SkxObklQYUhSMTNw?=
 =?utf-8?B?bVM1UURvSkkzT3AvUkZUK0dYbmQwV3hWeHl2eGx2MUx3WGRORXFUeVplTXk4?=
 =?utf-8?B?clhRTHlPQ1k1NHl3MjJ2eUpVU214RWJyME1YOFdKNHRSZGhScnliUHN0aVJv?=
 =?utf-8?B?M0Zka0lPTGNkUXpiYnY5N2hmWGxWaEZDUmdKRnRtWXV2bUxYV1ZqendUWmZt?=
 =?utf-8?B?S21ETmI1ZCtYbkZuQlhpV1B4amVVSlIwUk10eXhMQ3lqdWRGdTZuRVpaQnhK?=
 =?utf-8?B?ampMRk1DWitLdHZwSnNKRzRGRzIrVDRSVFNNb2ZSODVjQzRyeWdKR0F5RkpU?=
 =?utf-8?B?eCtrcEpnN3J3WjJjNWN3NHYvNDllV3N1L0tTTTh3cm0wemF1ZTRJR1RkVGdC?=
 =?utf-8?B?aU9IdjhkUGVCSFFlclpoOHVzTUpyR3N5cXI5d0Z6NllMd0hOU0VqMG9LQnM5?=
 =?utf-8?B?RW1kSWxudXhEaVpTVGdiN1NWdkJ0Z0dhNUxtYjlkYzA0OTFKSVZydlZ4VG9H?=
 =?utf-8?B?QlB1ck9qRjA3ZXNpRUlWZW9sd0dUY0xIclI0UE1YS1lGV3dRTHlJMW8ydEty?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36bc46b-cfa7-45e7-1deb-08ddf127a1b3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:47.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK7NHTy5KV6c8KhxEUbTp0Q8AlmMxosYo9OL0Fg2avkm5dfK8dV+5bYLd+LVtoC5CTlI9PD2vlsySb39o3kFZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317
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

DCIF is the i.MX94 Display Controller Interface which is used to
drive a TFT LCD panel or connects to a display interface depending
on the chip configuration.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb25300e25529699adeb4caad9837d7af23a3581
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX94 Display Control Interface (DCIF)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  The Display Control Interface(DCIF) is a system master that fetches graphics
+  stored in memory and displays them on a TFT LCD panel or connects to a
+  display interface depending on the chip configuration.
+
+properties:
+  compatible:
+    const: nxp,imx94-dcif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: CPU domain 0 (controlled by common registers group).
+      - description: CPU domain 1 (controlled by background layer registers group).
+      - description: CPU domain 2 (controlled by foreground layer registers group).
+
+  interrupt-names:
+    items:
+      - const: common
+      - const: bg_layer
+      - const: fg_layer
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: pix
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Display Pixel Interface(DPI) output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@4b120000 {
+        compatible = "nxp,imx94-dcif";
+        reg = <0x4b120000 0x300000>;
+        interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "common", "bg_layer", "fg_layer";
+        clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
+        clock-names = "apb", "axi", "pix";
+        assigned-clocks = <&dispmix_csr 0>;
+        assigned-clock-parents = <&ldb_pll_pixel>;
+        power-domains = <&scmi_devpd 11>;
+        port {
+            dcif_out: endpoint {
+                remote-endpoint = <&ldb_in>;
+            };
+        };
+    };

-- 
2.49.0
