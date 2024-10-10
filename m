Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B97998C01
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D6E88E45;
	Thu, 10 Oct 2024 15:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZVwtjTI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E9988E45
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmw4lffN9KasulZ5QIlg2RGQhF52b3Lb0WRAQNlXfxx7SltPwfY6hXx0qTOr7x+u5XaOmi6nxqhjDP+defVBF5E1jDsHaa/2zUia93UBYIe5cs5VBb5EVFOX3VJG4KNvnUfa4DZc4TCg18mZyD1Gi7oYqE1li4NUtjMHin55EFCx+nzU4dG0jaW8GbjiIBpYTpg1SHPXEo7IkDOQgp9sG0ESUghcCZJG4UUabwLB+XqxKbipOdg2KAdJYYe30XIm8ThCSQc0XwhM5HmYXAxfVklYiiNpWmt3CHAAfPfIMpWf+UJz/7rOZCOPBXOuTZGLKn38lhFQgH5qcapW/MMTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5yBaguEH7/lRAPP2avNlNp0tYwa0TnmzDd43PItTlY=;
 b=uQm4grj75S5YEVBa3SZkjqjOvshv+34XJEkH4bDR8/y1atvObHF7MXUlOMeWTfUTS7gXptZ/6bsiiCsfRcLbbm46uC/1Cw7mdtPwld6roqdo7/OToJvNMQoylkoG7BlFYv9QRWxSQOQSHiJPI+YFRCSnQbuGEOQO/Hajd4kU7Ddd5gKfsJlw8xrVUkZj8h/FYNAgQnp3EHA1nTPy4db6Tj7fL0uBWyG9bfCdc9QMbCAefeiNxquONBevM5ZwSK5S+rZ7nL5cyXleu5kJrLElDhWaGtPspDnSdFktk6ydzhhTN2djMFKMgZfDw2W9xm9P7MRqa+8iUQKK3keaLngvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5yBaguEH7/lRAPP2avNlNp0tYwa0TnmzDd43PItTlY=;
 b=ZVwtjTI905LcTjv1H29DZXwpjc+6loB+u8W5drIo/ZZcYUM0blZH0Xqkg76FWNr8GK+nLEbhy4vsuTRW2T28FjhfVXpBYotRXnQ0Z1MmMTWaBb//ga8xdebJMWCDiwP7Ahdd7046rw58KchF4GKnVOn4ips/j8jDaMsXp3gKCKzl8Iw5a/5dmtplXELavn5La7EYXWNhJ/lglCvQ31jzhWhRZJUTTFNiZYQIu05uNEBRtwXDpvCINZsEkY0bizpGMofUk9eXwCToP+3Ot3Xdse+tijriKKHdJBdIS/Sm7Q5pJeYW2k0AVVSJi2Oi5LhucYrQ7ZnYazJM0wVZukki9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 10 Oct 2024 11:42:42 -0400
Subject: [PATCH v2 5/5] dt-bindings: mfd: convert zii,rave-sp.txt to yaml
 format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=3530;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QgZ4qpuBe2Iuf+86t5wdsnelCC4x9/FyyKlFxjiYoLE=;
 b=FwvYC2wbbYrnZIu/cKhwgmJuKtMJgH8bOQDFnzE8CrQQ5sOacTcY7/t2hQyMrQJHC9bVS95gz
 VyqB5JixYsaAnTyP3D9UZpGIn/VzS8p05s3pwEGqA5rbi8/X3eSEgBK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b50f0e-e150-4beb-e3b6-08dce94250f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWRTaGlNS2o5c01yRlBXTTFlMXA4TVdLREJ1VHc2YXBvazhtcWREWGxtOFZX?=
 =?utf-8?B?bkIySGU4dTVzOGI5OEFqbFM1eHBERjQ4U3U2VjJWZHBJcEZRY0k5STBoWDZH?=
 =?utf-8?B?Y2ZFQjBJYmROZXBKc04vbmliNVdXM29jZ3VYM2I1WlFsbWs0TEdwcWo0bVc3?=
 =?utf-8?B?L0x1UEJGRVBNRGE5elRDdnliYk9IMFM4ekV5WEFsVUxXbXZTbUg4OEc4YXlE?=
 =?utf-8?B?a1cwbmdaME5VRHdJYVNLb2hDbVZ6VHp3OUxYZlloUE5nVFZmNngwSnVsVHdV?=
 =?utf-8?B?NzFWWnMwZmtnY1JicnlEWVpYWnQ1YVdTc3dHV3NZNXo0c2tiTEIva0EzQWZt?=
 =?utf-8?B?aG1FSHdyd05uTXc1YkhBb252RlVraEtubXRmMERYRTBFYWVuVzVSSXE5MTZV?=
 =?utf-8?B?NXRMWm83cWtEVGxyYStPdG5Yd0pndHpHOWNUV3VMaTlUYUZMMTNyYVcyNjlx?=
 =?utf-8?B?cEp5UEplVlhaSXJiSVFWejFHZWZSNCtKZmNWRXMzVVdIejhydlYyR24zQ3kw?=
 =?utf-8?B?V0VYUDZiUTBsM0pzT2IxYXY5alY5djhsMU1LQUtyVmdKRXJTTUg1aUp0UWVa?=
 =?utf-8?B?RVgzQWFmTFkwVHBFQU9TZm11cXEvNFk5Z0pZNXdSTjFNWEgyZVM0L0hkWkdF?=
 =?utf-8?B?ZTFCeTZXQUoxdXpWSzBYR1hRbk9aWmlrcEJXWmVTODVMODNBUzhocU1YWTdN?=
 =?utf-8?B?cStyVTRtNk1NbVNmb1VoQjVWSmxLZmVrNmdaQUNNVXR6V2Q0S1ZLenRKb1V2?=
 =?utf-8?B?TXFMR2pJVEovWndlOEhMcGxTM3NOZUFSemRod2NBWE5UZTJNTldMTnBTTUhy?=
 =?utf-8?B?TjBmaSsyZ3MzWi9WaEhRR0plNTVlZzhQUkdMcnphMTFDdTJXeG5BVkgzU2Vo?=
 =?utf-8?B?RElMRkw4NVlHR3N3QUk4UEtEZjJOQzl2eXVzTTZMaHFQMCs5TGdQYUVZbk4v?=
 =?utf-8?B?SmpoejBjenN5WjRQb1FHbmU4YkZGRnFwczNhOUFreStCVk9QYndwVjl5cURp?=
 =?utf-8?B?b2NoYjVqcmIxWkh3MGFPdG1MOE5Vb2dPUHJvU1dZMkFOQWptMDBLbi9uVU5U?=
 =?utf-8?B?UnpCOFFaRHNMYU1DMnB0OUFRT3dZQloybG55T2wzVk5BdllDNGphdlUzQ05i?=
 =?utf-8?B?WnZNT1NlR09GWTdWZEVrRUUwSHppSHc5RFF6dll0NWdBUVJBN0l3dVFscU8x?=
 =?utf-8?B?dUpHTjNOMkxDK1A3ckdwM1MwaFlLZG45WnhsclJaM1c4Q2dQUi9QVWdNNFBs?=
 =?utf-8?B?RnpVK3ROK3J6dWh1cnA3Nlc0ZndPMzM2RnBLd284Y2k1a3k0QS9qdk44WEt3?=
 =?utf-8?B?M0oxNlZpZ1RvcklUd2hyc3NzV21OWDExQ0R4MnJnT3lMVjZoTG0xMUs5bXBp?=
 =?utf-8?B?bWdFSExheGQ1OFZZUDJ0Vm02ZmtFeVdiVXU1R01FZm84WTZLTDJPVjdiVkxD?=
 =?utf-8?B?a2NPVzBwakI3TmgvMUdva1dwaXBoRk1XcXI0TmRRT3hidS9DQnRRR0NvVk16?=
 =?utf-8?B?TUdLeGJ5ZEIrZGFiWkFRMzJjQ1Y5MmpTVDlWWU9GdmlBSVpMWFpLQUsxS2Ra?=
 =?utf-8?B?eEo3dElKSE5LMTRVQ0JIRUN4SDQyODFPNFNoMURoUXNQZUgyR0h5K3JraFI2?=
 =?utf-8?B?aGEraTZmZWZaTTlQRFR1cWdoUGU1Q29nbU9tNzQrM2h2eDZKdzFRL2dPR3dY?=
 =?utf-8?B?WkdsS2Z1V0wySit6aXFPTmI2RmMyV01xMy81OVZmQy9meWI2TDNsUGVERWli?=
 =?utf-8?Q?Kd1aJ4JHeEkoIwOgbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhPSjIvemI4ZjZvQnFwZlRNZmUzMHZCTWk2cGRFOVlMQVU1bXg4N3Bpb3Bv?=
 =?utf-8?B?L1pLdUZ5SXloRzJnQjFJeFVLR3JDRkltUURVZEZJeWdIQmwzU0xVUDFZWkJD?=
 =?utf-8?B?UGlrN0t0Y3VXYnRSa2FBbUhiK0Q2bEF6dk5OYzl0ZXppM2JJQzlZaUlRQXFs?=
 =?utf-8?B?cGh1OVd6QnBPWFM1SHVQRW02Vk9SNXZpM2lqclRJWDNZYWxtUDg4R2d1TkM1?=
 =?utf-8?B?VmpUU2xQOGdEVU5INVdEcHNjOVRXOFVDZkFDbUVoTTlsbVFYN0dvTzEwbzBk?=
 =?utf-8?B?WDUvdDlxampuaGQvWjc1ajBRcllNUWZaWDd3b3lXWnUyUmVGOU5XMlBRREk5?=
 =?utf-8?B?U2JTd0F2cFNwbisxNWxNa2JVK0N2S0JjL0IxcEZrS0V1dVZQbE13RHJjM0RP?=
 =?utf-8?B?UWtxUXBvTFZWVFFuOGNGQ2JBVmt2WFUrbFVFeGFGckh1ekN5bjVqNksvM3N5?=
 =?utf-8?B?NWpCZHlack9BR1pwazA2M0lKd0FxVkJZYmc5eTJ2MzNibmVSdWMyM0swUXND?=
 =?utf-8?B?NEE4Sm1FZ0JDbXlyOXNhaXFZZ3pad24rRTJ2VCtobUphcklCNmtHSFFOcTRH?=
 =?utf-8?B?ZENiWUdXY0hWVXU4aUQycXFod1FSQkNqbHdJQytVSWhzTjFIcThpaVlrS0RO?=
 =?utf-8?B?bnlFUHFYaGQxcy9vRXRYMUg2bDJyU3dZT2QwcmtlRjFBcGE2cjFVTDlLNjdK?=
 =?utf-8?B?Y2pLNkQvRmU2NG5sN21YeEp0MU4yNy94NjZWREk2MHlKRXB1ZVEwQk5VdHZw?=
 =?utf-8?B?cW5DM0Z1M2J3cjZIVkpzK0xLQ3phcXpNYzBQVjJTaUp0T1FpdzBoL0t1S0l4?=
 =?utf-8?B?UmxybElaNFZUMEcxVlozS3p4TEY5bmdrUjZqSUVuUlNpa1hscFFqSlhLV0lz?=
 =?utf-8?B?OXN3MXZJZ3R6ZXJwekNMWlQ0bEx0YmF4WE5WeXVSOU9rWmtrRmVRNjFENG9L?=
 =?utf-8?B?czkxVmdZU1JwN1dOdklIZGg4ZmlNM29FMCtEMUt0d2tpSGgvWVlyeThXbFQ0?=
 =?utf-8?B?aGxuU2Mwd0twcmxNQnFyNzlFTS9QdHdIMnJ3UmN1YnVIam5qNEgwcTBUdDhL?=
 =?utf-8?B?eXprRFJ2WnU5Ui9RTkNtR1ZEZzRQeWZZOG0rV1RsdHRtTEFVVk9GRnk5T1Vo?=
 =?utf-8?B?ODVvcFE4WDlHSitWWVJNUWk4aTRRQ1BsRWpESlRNRnFXZFJSbEp0aEhXb0pP?=
 =?utf-8?B?WVhqWTdZL2QxaUk4ejFSRlZGQUxEbGN0emZmekVIZ2lCQzRvbEw0ZHZQblU4?=
 =?utf-8?B?UG01NzRvU0pFNkZ4OWNaeGdMbmRKb1BUNzhFUHJUNGlwTDQ2Y2UzMmtwYmtS?=
 =?utf-8?B?SkF6cEVxVzFIZ2ZPcEFMQWdkQytGQ05BbGU3VSt3UlpiMjdVd2VaaUp1NFpF?=
 =?utf-8?B?ZTZNMDF0TDZBRldMYWZxYWNPbnBRTGs2NU9pOHdvcHpidzFwWGFvalU5V2g1?=
 =?utf-8?B?V2YzcFhwZWYyZFRIMXluZFdaUkpzRHNEZkNZK05jWUJhdlcxWnc1VFRiUWRR?=
 =?utf-8?B?QlFrSnczeUg3aHh3amQyRUszc1cxWVVybmxzL1lIUkd5aktYUkZPTDhoVW1Z?=
 =?utf-8?B?d0pUeXhldWFmYlF5anN4WGU0TTU1bnkyWEFJMmZaYnN0VGZJOVlIUVFaY1Vx?=
 =?utf-8?B?NTZNUTJENDNabzVyeDN6eUlTZVNoSzAwc0l6UitGUjhObnBRL3phVU1aUTRt?=
 =?utf-8?B?YmVMSFpWRDJLQkhnSUNrTHpzVE1tWWI2REUyRHBUcWhQYkxkS3RNekI1Kzk2?=
 =?utf-8?B?bXhUM0x5WjdtV2Z6eUgzYnlycnl0S3FMeWhjL251WGpHbnAyR0hTU0c1U0VG?=
 =?utf-8?B?VGNvTVFtNjB2MElSTmZvN2ZEM2NtMWx0d2FuTXllbWVYd25TRW5XUmRzR0xC?=
 =?utf-8?B?MGVWU0pNUGljUVBkejFTTnZFd3lWZ1d5cDhtU3E4dVVZN3hNaG5IWUNubEJj?=
 =?utf-8?B?OG91RE5xWVh2bVphMkFCanBqYjllcnIzLzVXK0pqREM0WE5UcUJaOFBiRHRV?=
 =?utf-8?B?djJtSm11T0tHaEJqK0RSY0JVR05jbmkzR1luckxpdEtjdDliVmpvSHk5dHNr?=
 =?utf-8?B?akVheWhCVmM1Q3h4UE1xeDdCOFBrS0FEcWlsYzhIWUZIanFncWZ0NUg5am1h?=
 =?utf-8?Q?CVOA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b50f0e-e150-4beb-e3b6-08dce94250f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:41.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXTd1nB1CLe1KLUN5UvDatwx6W+DFlr1sgB62EofxRPc8cBIdxBuZ0PBRdwtfg5gc0yX0U0GA3mHt52tQn4HfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
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

Convert device binding doc zii,rave-sp.txt to yaml format.
Additional change:
- ref to other zii yaml files.
- remove rave-sp-hwmon and rave-sp-leds.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
 .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt b/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
deleted file mode 100644
index e0f901edc0635..0000000000000
--- a/Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor
-
-RAVE Supervisory Processor communicates with SoC over UART. It is
-expected that its Device Tree node is specified as a child of a node
-corresponding to UART controller used for communication.
-
-Required parent device properties:
-
- - compatible: Should be one of:
-	- "zii,rave-sp-niu"
-	- "zii,rave-sp-mezz"
-	- "zii,rave-sp-esb"
-	- "zii,rave-sp-rdu1"
-	- "zii,rave-sp-rdu2"
-
- - current-speed: Should be set to baud rate SP device is using
-
-RAVE SP consists of the following sub-devices:
-
-Device				 Description
-------				 -----------
-rave-sp-wdt			: Watchdog
-rave-sp-nvmem			: Interface to onboard EEPROM
-rave-sp-backlight		: Display backlight
-rave-sp-hwmon			: Interface to onboard hardware sensors
-rave-sp-leds			: Interface to onboard LEDs
-rave-sp-input			: Interface to onboard power button
-
-Example of usage:
-
-	rdu {
-		compatible = "zii,rave-sp-rdu2";
-		current-speed = <1000000>;
-
-		watchdog {
-			compatible = "zii,rave-sp-watchdog";
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml b/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
new file mode 100644
index 0000000000000..1d078c5ef1689
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/zii,rave-sp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  RAVE Supervisory Processor communicates with SoC over UART. It is
+  expected that its Device Tree node is specified as a child of a node
+  corresponding to UART controller used for communication.
+
+properties:
+  compatible:
+    enum:
+      - zii,rave-sp-niu
+      - zii,rave-sp-mezz
+      - zii,rave-sp-esb
+      - zii,rave-sp-rdu1
+      - zii,rave-sp-rdu2
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  watchdog:
+    $ref: /schemas/watchdog/zii,rave-sp-wdt.yaml
+
+  backlight:
+    $ref: /schemas/leds/backlight/zii,rave-sp-backlight.yaml
+
+  pwrbutton:
+    $ref: /schemas/input/zii,rave-sp-pwrbutton.yaml
+
+patternProperties:
+  '^eeprom@[0-9a-f]+$':
+    $ref: /schemas/nvmem/zii,rave-sp-eeprom.yaml
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mfd {
+        compatible = "zii,rave-sp-rdu2";
+        current-speed = <1000000>;
+
+        watchdog {
+            compatible = "zii,rave-sp-watchdog";
+        };
+    };
+

-- 
2.34.1

