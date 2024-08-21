Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590DB95A719
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C059210E6F2;
	Wed, 21 Aug 2024 21:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WWBaYgE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECA310E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqIIajOygrfM11wuNK7Nm7h6HJ05BMLhW/60gHFXytZCS2NA+13msHsN1FpSH+yUFdlE+cFA/UOGqf9HT/sOgR7T+E35JKK9rHBoDzqdg7hjAdUKo1PMopoJYa0IX/gheeehYyCQJ6cGkyxiwQ0PtGi0WpfEjvfh7NDOgsG7ASes9J8zZqUUP/jhQfH9vlMgM4aCx50W8tzaA43asoS3+74mEnUq3NM1iqllMEbXaiJXp70Tcn3S2g9d6JQpdNlXUAyOtFlveBpjCRZEReS96pN2LI5KG5XGGylYpjNrQFxK7g/VjvqYzmEOO+26jTu3U2fbiefbHIxyD9TVoajNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqPBA/0UC8hgauW8SlEyUHAs3+DkqvYG/BpxNM94zvQ=;
 b=aKNn+fOXL4bAG1bjCOavTPKFalKzokjxN3izwy+tz6BM6ghiZXELXzIqwHdNvw/7MxTCaVjuHxIXqe1KfIm5qjLqoXST0iksD2Q0asYTCDQ56SR2F5QKhbzQMo+aAw6fr5/JJj985zX/JEkW/h6MPecAEzY3C/crCqX2nQsiTX9xBfKBTbVEVTIR7lZTORKmlxzvZOMCBk3GH6raxij3jTwqgpjRzCjcbztMCctSiWh4UXR04OgtP1kYwpfmg1sYjm8kTL8Hl5DEv1vUSr4O0V5aKc/2u6EBuhvlUZp9HsquMdZX1AqmU+UNcxmgLnidtneA5vWih1wHiuc5g7iRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqPBA/0UC8hgauW8SlEyUHAs3+DkqvYG/BpxNM94zvQ=;
 b=WWBaYgE1t0gxkxegXBN9pvMDzQ41vUqKCE2KHnasWuDYsVJYTtkLXcfADtglezc3IxUZdLmRcWRk9MhUC58HqkC9VuNI5BzreMX+EwkFNCVmDBeji2P+4HHNLFiet+85nQiCwtRntl6VtGioV3pF++IBaa+uvQ06ncEL3e+seoy3/As7g3RJY3SxG9Dx53e9l0bf/QaGxMMfNSYPKzBUR2xWgEZod0GyX5UwT9c/MVr6OgBcX4LUe19T16+x8Ht0jAbboo9UUkhfBYKwyU3OXeeIt9rZ0I+wgydUMRQwLHs/nRXeXPo5v2gV4dRjOaK0Jfh1E2wxzbnDTCIC+dmT2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 21:52:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 21:52:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Aug 2024 17:52:12 -0400
Subject: [PATCH 2/2] drm/panel: simple: Add support for JDI TX26D202VM0BWA
 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-jdi-v1-2-6e3ce584072a@nxp.com>
References: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
In-Reply-To: <20240821-jdi-v1-0-6e3ce584072a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724277142; l=2187;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GuJ89DU1Af2gXckvRsJT0KI9BvHs7/0RqeoKZOagbCI=;
 b=dcgXqX0Uz3vU0WJYTVMHNUPCVrll+9kTb4p0UtUsSeg/kA8kRwTf89OgXOMLmIXQMbQoD5AMk
 LXfsko4k8fsBsTK73z1s9qaQ+RM6anRmeALovUDaLWXsbhCdSzKAo3u
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 050bcb11-649b-4be6-490e-08dcc22b91a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzFsc0sreUE3ZVJVVFNZOGoydUtqT2VXRGh0ZlY1TUZzNmI4N1hRZHFsL0hK?=
 =?utf-8?B?dWFVdTFjV2JzNVBqNCtaNmk5YUtLV05Va0RSUHZDQVFxQ3V2Z0wrNHFUMHkv?=
 =?utf-8?B?WndCbHRvR2VsTThWZFlkQmtSYy9FYVdhTWFaYWY1Y0hHdi9td2tGUE01L0FP?=
 =?utf-8?B?Z2Z3R2c3L0doeVhpUVNkR2NFMDJ0Um5KTGhqYnFFaFpMZVJORlIxUTRYZXZo?=
 =?utf-8?B?Sk9KNWxKM3djZW80c09uTDNEd3I1eXU5N1I5anFvWkIyRGtSNW9JcTQxcEQv?=
 =?utf-8?B?Q25kWGlGaXhNVXhMSEpBOEFZOVZoeHpCOUx0WTdRaTRmSThvdFlSdmZGRUZC?=
 =?utf-8?B?MlNTNnlVMVlEUTV6bC84d1kxNlRvK2FiMHFmcFRyMUp2RzIwVGQ5Z1RRTHdQ?=
 =?utf-8?B?OG5BOERJemtFTUpFOUhjZFpzZ2xDL1oyVWJlQzJnS3EzcFF4eDUwc1prVUhP?=
 =?utf-8?B?ZjVSN2V0VnB3RlJHS1hQRXZhVkFsSENQMis0ZWRNRFp2bG5Fa0lOTVoyZW5y?=
 =?utf-8?B?ZnhOcEwySzU0ejBhMDBuVFB5d2lqbE1LZU5YZmxCU1VuSEJLcENTcEUxTzBJ?=
 =?utf-8?B?K3JEZlpqTGNpQlJhUU56bEt6UUhDTGtDMmVpanBhVnJqbitlVDBOUmk4V0R6?=
 =?utf-8?B?YWZGM2FxNG0xeFplZ2NkNjdLTjdCWGc0RmRPMUt4SVNvdThJOGExNEQxeDI2?=
 =?utf-8?B?OXJ4ZjhQQXg2WlE5YnQzTGdGWWdKSTR3aEoxR0hwaFlhM0U4enRYVEFYWTZi?=
 =?utf-8?B?VVJ0cjVERWtsRlNUS0lIcTVzd3BVTjRUcjFQRTA2UWdPUTVoQW8ydmlhWVlh?=
 =?utf-8?B?ZTg1NWppMzg2bGFseHVpKytOai9JckM2VHFmMmxhY1dtd1Q3dE9ablJHR3NG?=
 =?utf-8?B?SUxwS0U1MnpuVlgzazJHdVJuaURvUjRCSDUzRjFhamdYMytDR1Vibi9aREsz?=
 =?utf-8?B?dzVCRzNDcGcraS9ZVGt6cFh5ZGJMd0tnbDhkWXk3L3hiUGtsMWRjT1UzNGNC?=
 =?utf-8?B?cXYwclZ1WGJ4cEJoelV0QnMrZEVUZytGWDhRQjBjbGxQSTlBcWZqNDQrUFI4?=
 =?utf-8?B?SmxWeG1ZRWhjNkdPQTl6VG5zbmxkL3VrWU1KOUI4WDZXTE4vRHY1SlcyUGs0?=
 =?utf-8?B?aWZzc3FaSHhzczF4MXNrelAyOWNQanVZaWZUVHZMaENTWXNLSWRNOG5BU1l2?=
 =?utf-8?B?RmRXQXpVMzRzNlhERFMwOUlTbnp0UXA3dFBhb1k1dzlhQW0wUEEzQzNFamZ4?=
 =?utf-8?B?dEV2bHlOaFFLTXB4S29sZmFaeHhndEx3TlRxbWZZSWxnZDVQTEVQNWk4LzA1?=
 =?utf-8?B?TzUvUFlQN3FEUjIxNWo0RjUxNHl6dFYzTlUza2djR25DY3YzLzh4aGlETlh5?=
 =?utf-8?B?MnZwaFkxc3NxWFpHZ0ZkNVpLOGtXQUY1NXFDSjZtMm0vMTFaODJWbVVMZ096?=
 =?utf-8?B?RVlpajliWGNVOUlsZ1VUWjBJbGlFRjY2SDgrMHc3d3dyY1p4RG9YazVxOFN5?=
 =?utf-8?B?ZlkxY0lFWmNPL05jSUJhT3lxNW1tOENNUkJHd2hJNUxpSU9ZYVlNVlhTbDU3?=
 =?utf-8?B?cTJiZHJHTWF1VVhUeXBWS0JkVEVJN09WUnFXczNyVkJEdVdON2VMaytPc2Rs?=
 =?utf-8?B?WVBFcE5GNTcxdjZDQnpreWpkOEdsaFkzYjVjUnVxRGIybG05a2MwaGpiY3RZ?=
 =?utf-8?B?NTZId0RSazI0bkdtWUgzR1JnUFNoWWJYWXcvaU1kQ3lhOHB1eGg4c0VJdnVF?=
 =?utf-8?B?NHZGT1BjTTExNlJVQmdBZmhBeDNaZHJkTzNuZGN5RUljVmZaZ0tSbWJQc2Ez?=
 =?utf-8?B?RENwU1FGMjRLL3kzS085cDJLUk5jK3AzeThXcmJXcktYRHJqMXFBMTVBSGZn?=
 =?utf-8?B?S1hEbVNKQ1RxMUVFWktxcXY5dWh6Vm5vS2FMT3RuMGdDTHp3MGFVQWNLdjA3?=
 =?utf-8?Q?RMbgL3H3Hyg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkh3YlgyZTBPQTdlTmJUUnJKUEpZc0hCMGt1WmJKY1BUSVNjSXI0RnhDUGIw?=
 =?utf-8?B?UnlEbTRoN0ZMUGVwcmdCSDBJWWZ3by9MTzllc2IraWczb21zZ2tVblpQbWpQ?=
 =?utf-8?B?U3RWc2tZcEpibHF1MmxBdlhtY2dQa1IrODN2RHdrSjArOXRHU1FnbWRKSnBT?=
 =?utf-8?B?OVMzTndMWkNMTE5BVGxVaEdBcjV6SlU1dzc0a0FMYXJ5SS81SjBXY0ZoWDRW?=
 =?utf-8?B?dVpoWlFQc0p1SHMxUFFFUzFCRVQvMVBJaGlETVliU0dMbDVJM2tYZkxQWDBH?=
 =?utf-8?B?N2tRVVc2djRkL1FWU1BhV2U5bE9tbmoxTitmMkJnL2VicmZNYjRFQkVVWXMx?=
 =?utf-8?B?MnhOOVliSXcyRXFtamNFckRoODVHRzJ6OWgwcEY3NUhHdXRMK2hwcW5rMStk?=
 =?utf-8?B?bFFuU3FCRFhoZFVrMnNFUnAybmxBZ2tVdkUzYVpsY0owVWlnbTIwOWVTdHlC?=
 =?utf-8?B?ZFpKQmVFeXpScndnZkluZmJ2c2o3MnNqU1pKSmhRaTY5UGRIM3pCYmhEaWMy?=
 =?utf-8?B?aHdqeENobHJlU1hjU05EN1Y0ZGpocnFwSDFkd1kxUjUrbmNQQldyaGE0VEtz?=
 =?utf-8?B?eFdiQ3lXN0Z5WHM0dURtUTFkNHNnT3BMZ0FTN2ZTQlFtck1IbHR4UDhRVHFI?=
 =?utf-8?B?NzZ0M2FhRUwwalE1cUVPOTVncEdES3ZIdExaMGkzVDVqbTErU3NIRmhCVWJV?=
 =?utf-8?B?TXZsc3phQlBNTzhJeFNuSU9RSWh3MDJuQm40bHhScDgySnJwUHlFVmV3azNC?=
 =?utf-8?B?dXNkTUh3SlhIazRPbzJ5Q25tZ05wMHBnVTFrdEE3aGNTVGFvR2RZOGFkVHFZ?=
 =?utf-8?B?RmpFSTdBd1lvSGVkY0NHS05GVElyL3VjUDIzekxyVEU1MFpRQzVnYzJHTzha?=
 =?utf-8?B?WHJ2bnNhcnZJL0thSDBqSlVOM1RPTUdsQUxyN2p1ZTl4TmNDdS9YVEJVMFVC?=
 =?utf-8?B?TTQvbmprNHR3OStVZ1g3N3BRdHg2elVrQ3c0T1o3N0prb3BEaENNSUhnQ3FN?=
 =?utf-8?B?WDlvemxJbGR3c0ppVzd3WHVFMEhvcnpweXhYTkFPVTROcERFMVZqVStGSFJZ?=
 =?utf-8?B?TVlrOEwrSllOSWFrMTdoV0JwMlJjelVYc3ZkdG5ZN1ZtdklHUHBQSUZhVUJB?=
 =?utf-8?B?S0kyRkVUdTdla0FFd2dYcVkxQ3lmdWFoNjlPelB4czR3M3RxUXZuenFieDJR?=
 =?utf-8?B?bFE1Zzhwa1NHekpxUDZ2SnVXQVZHWFQ1enErTUhSY3hiT01mWjJPQ3hwNmRt?=
 =?utf-8?B?LzFEZ1c2cTdRVndUTGxTaVhNeTZ0alZqYTdQdjNLblhQVFZzT3Zvd05Bc01w?=
 =?utf-8?B?OVJmYWdocEY3U29xTk55dFIvMm1zL2d1SjFjbUs2RVMwbmNrSFhRVDAxY1Bp?=
 =?utf-8?B?YXNiVUdLZE45QzlRMTVEN3ZUelFRYkYrMXQvby9JSUNoRklIcWwyZ0VQWk9U?=
 =?utf-8?B?NWFHTlIrMXdndXZhaW1EWjR1ejBuaDh6TWlEeDJrUUVDZEw1WEpHdXh3Mm5t?=
 =?utf-8?B?VFMwZ1lsM0xtQWI1Y21KL3BZV0tMRjB4ejIyOXRkMXFWamliUHVzS2gyRFRx?=
 =?utf-8?B?dXFmTStPaWwrY3Z2ZUNnRUJ1TXRUOXoxZ0JCanFDZFBmcFIyWmZLMXlGZ3kx?=
 =?utf-8?B?aERldDJyVW5wa1hSTFpPbXZYampQVlRSOEYxTnNPUHNQSFlqUDJRN1FIM2pJ?=
 =?utf-8?B?bnorMytJVUNwUkxYeUNPWmwvcVhaODFRTGErejdDR1dzRURZQjlEK0krR1lw?=
 =?utf-8?B?WVJ5OUU0ZGgvWGhPZmJiVEpNSC92ZzBDQTBOaHp1aWZZUGIwdm9BbVBmU1V1?=
 =?utf-8?B?d3Q2T29HdjdpY0dVbXZ3WU9YUGhQWEdhY05WdUliUDhEU0F2dnpuald3SzBD?=
 =?utf-8?B?RHg0Z2E5djByNjB3ckhnVzY5VjM3dFZFWXVadmk3U0pjdEVjZkd3M2dnS2t5?=
 =?utf-8?B?Q0YrTTI4MS80V3k3b2xvc3BJQjZsRG1Vayt3TDVJWUVYYUR6eGdiL2hBbHVy?=
 =?utf-8?B?bXZZYVpnUGwwUXJsRVFvY2tnTEY2b0FTMmVuNkNwd3VmL2xIVHBxYjY0VGJz?=
 =?utf-8?B?dXhycHBDdlBIUWZFTkdTTUFPV21maklxUllubGJHLytQVXd4T0d1aU5DNVZm?=
 =?utf-8?Q?v/0b1E/JFVpBb97vsoFmbqqgf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050bcb11-649b-4be6-490e-08dcc22b91a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 21:52:36.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpqLz+6zrCzitHmv2+jTstrPU7NN1Huc2PBIRHUEQbNrewbQ/+3eTophc836UNkc1IaKlRt2uUdo0c3mr0x4pQ==
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

From: Liu Ying <victor.liu@nxp.com>

Add support for Japan Display Inc. 10.1" TX26D202VM0BWA WUXGA(1920x1200)
TFT LCD panel with LVDS interface. The panel has dual LVDS channels.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86735430462fa..7d975749d84b4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2769,6 +2769,41 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing jdi_tx26d202vm0bwa_timing = {
+	.pixelclock = { 151820000, 156720000, 159780000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 76, 100, 112 },
+	.hback_porch = { 74, 100, 112 },
+	.hsync_len = { 30, 30, 30 },
+	.vactive = { 1200, 1200, 1200},
+	.vfront_porch = { 3, 5, 10 },
+	.vback_porch = { 2, 5, 10 },
+	.vsync_len = { 5, 5, 5 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc jdi_tx26d202vm0bwa = {
+	.timings = &jdi_tx26d202vm0bwa_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		/*
+		 * The panel spec recommends one second delay to the below
+		 * items. However, it's a bit too long in pratice.  Based on
+		 * tests, it turns out 100 milliseconds is fine.
+		 */
+		.prepare = 100,
+		.enable = 100,
+		.unprepare = 100,
+		.disable = 100,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+};
+
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -4829,6 +4864,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
+	}, {
+		.compatible = "jdi,tx26d202vm0bwa",
+		.data = &jdi_tx26d202vm0bwa,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,

-- 
2.34.1

