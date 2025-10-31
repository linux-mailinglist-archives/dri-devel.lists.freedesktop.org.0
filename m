Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6323EC246A9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A392910EAF7;
	Fri, 31 Oct 2025 10:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lLHooJPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3DE10EAF7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9pY5s3t+iyLn4DdFohu4PNxQUiKfjfe/Bn+0INWr20fJ/b2t41a3rxpNCKRdUx+wxhA1bvfjql4M8CycCD7jlT0lMt5MVqCpJe142h+HEAeUWMgzOl9rYRwRbmd7AzwCHCxutTNvvG/HiJa+0dqJaQceU6kIoqNDXD1KJTMC+PRlLMbONchLx2CAGKtp1UQyqjNaFpHJddtd2bjjH6cnNnEMfGqAXWO/cVBO2eHZ0c2WTIJEyQKfvYNlC6wkp+PzWV0wmIejJO6IbRlDlg1gSZBKkRyDPwmoJ/JMetmNQnMOgqcroAHRXfF2uI68ANA3bolUBggVVZgvqASFbyY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7me4Hdoe2D+Vz/nfpVHFn22kNfi/lyGUeLse+Vexjg=;
 b=t7WXJKeihd604U6I7BaHRyTkJZvsiJD82ZpkEO7yXz2vG95DlJKDEnRP/GsOL8mVIYebqFdyNAjSdkJ1OxKhJHS5ZHCmlCAAztGQCA42EysRx4DHhNo0WdZwAwibSQJWJeAih7ds633XRaz4rt1G+OiwhvGH5BLyOs5jhtu7e7wNMeK4LomILlwVqRwXuWsTjdbanSHEXgt1ehaWRmomOOQggg203tqSkCZkJlVCt3m8NIR+KImEKOdS9Q/RsXi8oN++YoxSQqWLCa8u4L88OXsHqcuDNlxlqxEbOon/H9rUeVdpOXtrId5JA5dOIU3+BYkzyLqmMYR5ljrl0ZEZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7me4Hdoe2D+Vz/nfpVHFn22kNfi/lyGUeLse+Vexjg=;
 b=lLHooJPAb/uUDLOsiJoWbnhOon8pFQ4gLhXEnHaUqNK88V3HEps2oENXbJud3JbOo2SNTqhOKN5Cj31E0OOxkyWbR/Fm3I5jv2oZSejpm7G5EE9LHgRL6jt5PqFHK3r3k1y57nCFsNCv8LhCcJkfe5x1YQWPVSCcOH6eLdRhEdmFphc8yKOJyC1bz8wdKqquTavxK2t0FkWJxmHRzSWbW4TShsaB22Q6+cFknLjb0aSgtH82YNhpz+Zi8+2nKB3fx9z64It6oxANmQrNf5uqNQtcwLHPE8CJeSleOQmVsl3vShQtzBmJYSSF0YV2xdA6Gb8Sj541uzaOBsxBwaWGVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com (2603:10a6:800:12c::21)
 by AMDPR04MB11677.eurprd04.prod.outlook.com (2603:10a6:20b:718::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:21:15 +0000
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74]) by VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:21:14 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/2] drm/atomic-helper: Support atomic flush with an
 optional kthread worker
Date: Fri, 31 Oct 2025 18:21:23 +0800
Message-Id: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKONBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3ZSiXN3kopJk3bSc0uIM3fL8ouzUIl2DxMRkI/PE5DQTgzQloN6
 CotS0zAqwudGxtbUAiQ3fu2cAAAA=
X-Change-ID: 20251031-drm-crtc-flush-worker-0aac27acf40f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To VI1PR04MB7056.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7056:EE_|AMDPR04MB11677:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4dc4d8-6621-4ba9-ebd0-08de18673849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm5qNGZHWHhSaE0vZ1ZmaE9rSURIbWZ6WXdkSjd5Qy9tT1ZvcnphMTYya2dn?=
 =?utf-8?B?RHFxbVFZUGpxQUZKaDZmbnRUamZYYkNENk5SMWIwL2wwK2RRYjRIWVlvRmdL?=
 =?utf-8?B?QjZramkybnJjQUtPOVY5RlMwTC9LK2VqTW5xNDlaN21PemZENWx2ZHN6b0lu?=
 =?utf-8?B?bDFIcndldDNkQkxMN0ZxVTVaYmFsZVpuNUptNFkyRWJTM0N6aDRNZ2ZPU0Ir?=
 =?utf-8?B?K3FQQ3BRWE0wbnlnaEhpdkxZSjVBZ01mMDd3czY0U0tNZHhEOVlQSmtvTEFy?=
 =?utf-8?B?WnFSeDN3M2EybnBFTXF3R0pkMlErQXNPeVlCOEZxT25tTDVxMDRyODJIQ3BL?=
 =?utf-8?B?U0l1T0I2SWRSZjhqV3hRS1R1S1VXelVDSk4xMGYxWllyVVJ6Y0c0VkVKaHZu?=
 =?utf-8?B?eWV4M3ZXU3VscVNwOEI1YVFsVTREaGV5MmM2a1pFaEM1dTIvT1J0TUZ3b2RD?=
 =?utf-8?B?ektISXdxUGZRcGc0Y1U5cE8yZHV2OVFtL2hVMHVFSzI5TUtxZkM4VGxhKzZJ?=
 =?utf-8?B?T1lBQUI1VEFxT1pYN0Y0ekNaUGRtK2M3cTJNUGdJVTlOV1FEeW5ONHZpcC91?=
 =?utf-8?B?dE5SYlAzenNZNHA1Y0h4QTdXZ3d5bUpNREpCRHZIaWxyNVRkWVFXYWZqdFda?=
 =?utf-8?B?YXl1OFVqWWRJOS9FdnpmdGxuR1dMTXNGdXkzMzMwY2ZVRStOV21PWXN1bEtB?=
 =?utf-8?B?RnF0Q3lFYjZFUjNLZFVOeVlyZnp0bGlzNEF3WFc3SEZqRERCbDlwREhyOG94?=
 =?utf-8?B?VVAzSVNySGx2N2h5dzd6c1B5UE9sc1dOM2Q1SXNtUnFxMFJoRHU2bFhOcWZs?=
 =?utf-8?B?YXBicVY2OHFBalRJbUwxR0k0QWp0cXhERS84VWtxOTdhaTRIYnRrMU5zb3l1?=
 =?utf-8?B?UHM1THlmcHY3eDIzZ0MvZGphR1U5SzdPVy9NSFA2SVRRa3Q5Zm5IVnlRd0Js?=
 =?utf-8?B?ZHRCSU9Db3lzQVV3S2NCMk94THozSzN0SmlReDRsTDVIMWhRYnphN1lWYm5I?=
 =?utf-8?B?MEpnUmJaOXlmNUNSSUd4Q3A5RmNZMVhBRHNMcXh6UTYvTisvb3VtV0gvTFFB?=
 =?utf-8?B?UlRUSHMram0vekt1UTBzNXg2Y2g5SEI2T1lKN3lTUDErRXVHazRCaEZiUUtQ?=
 =?utf-8?B?Ukd2amtJYm1YdmNiS2k0YlE0VjlpYTJpcHJTSEp3S0k3dEVndjN1N08wcUJV?=
 =?utf-8?B?Y2llOUtXM242aE1pbU9ldG4ydWdHUlZsdjBJeHliUHRNNG1LOUtUNVE0UytU?=
 =?utf-8?B?UGRuRFdGNU1HYmQrQ0Vqd3hYdm1qRkRTaTd0UDVoejBrbUJiTjdiYTNqa2x4?=
 =?utf-8?B?cVh6RU1YaHFQdW5nSWFxdDJ6blVGL2ovMnJCNmhHOGZuMnllS1FGN3AwckUw?=
 =?utf-8?B?cEtNY21WMHlva3Q0b3lvNEFmbjFPRStycGpVcWVYckkwN0lFYVV6ckErMkZu?=
 =?utf-8?B?ZDQ2eVA0Wkl3WWNsclFEK1IvVXAxRmNFSVZoaW04Y05jdnQyeGhlU2pzeGtO?=
 =?utf-8?B?YXFIcjhtU1BiS1NmLzI3UTdWV3FVRXlzbnRsQmY3NXFEbGpqQnFQUVVoNzRU?=
 =?utf-8?B?VEs3djZYQnhBT2pEblc5RmF6cE5XTm5ZcGN4VjFxVHQvYXJFTldKWVVrN01U?=
 =?utf-8?B?czh3OWkxc2FydW9zczA2dkMyWFN5Q3dXMUlPTkdqNG1qL3BZNjBkZktnam9J?=
 =?utf-8?B?OU1wUUIwaWNGaWF2S1EwdVVGdVZHMmxwM1JLc09RMkR3eGYxcEJoMkRnS3ZI?=
 =?utf-8?B?bVd3NU84RmlRRWo5TjFEMWU0RHZGZnBlOTg1NFk4OEhmNmEwYXFtQVppa2t1?=
 =?utf-8?B?eVdtUjFZeG1aa09oL3QrZ2xNa1dJOEdtTlRvQ2RMaWdUVjlZK25BY3kzU0ZQ?=
 =?utf-8?B?TFFVUS82S1hiQTdseVV3QjdTT3NVV00rQTh5Q0VWblIraDRuVUdKYS9EMTZ0?=
 =?utf-8?B?SGViOFFNc055YnhJdFhKdUpubUtmc1l4MStYOTU2b20vc2plbzkyYjkzS0Qr?=
 =?utf-8?B?ZGxDbFpEVWlONkRoS1hrUmJEcDdOMDZTZWpFeUlXejRHQjM1eFdtdG5aemJY?=
 =?utf-8?Q?G389qc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUNHbDN5aGZ5RFdJRnBuRGRlUHhrZWVQNTY5Mi9ZanltUXU4SnVwZnpvODNl?=
 =?utf-8?B?dzNuN2xOS2pIanZPM3JiZktMcy9NVzZVcWYwcHl3UWhLS2ZKSnEwRFZNUktv?=
 =?utf-8?B?cHdWdHNoOEF1dU51WUpCeVArUmpsWUd3TkRPcXZFVUJnVzl3L0N0a1ZHbURi?=
 =?utf-8?B?QmJ0WjFKNnVQZmdUbHgzTUhRUDlSMEpseEtPQ0g1d2R3dEpJNExvOU9LZC83?=
 =?utf-8?B?QlQ0ZWFWcUFDdEZTMVUxR0h6eXlFanlBVzRoWU9nSUFrT2M4eGIvdDVBMzZj?=
 =?utf-8?B?YWlCVDk1L1RhYVJxeEZnajBSVEsvQzN1aVJxSzlXWUM3d1dQbFNsM3ZXU0Zw?=
 =?utf-8?B?UmtHMzRkNlA2SVpPZnhxZGZBVnVJalhtdUcrY1plaDZnYS92MnBXcXJvMVlq?=
 =?utf-8?B?RFZ6V0Zic2FYM1BRMUpNcGRHUytINHlSOGFTRXR6aEFHOE5RSFBBWnNJakpW?=
 =?utf-8?B?bjgzMWhrYlRUVnNpQmhsNWpKZU9DV1psOXQxdjdvUTlwSEV5OWZ1L2l3MmRm?=
 =?utf-8?B?Yk1pM2pUNVZiQ0NtOWdCc0pyWVBNcUNOaWF2UkI1VVJhUHpwYmpKT1JrVlZ0?=
 =?utf-8?B?YXhXZW1xSFBMcFJkeWxaZStaUUpiSkdrOEcvclkwTVpnR21TUmJnbEdmdDdD?=
 =?utf-8?B?QW02TjU0Vms2aEcrZlY3QVFmdVhrR0hFeVA4K3ZxK1owMXVsdDBHS3YvRExl?=
 =?utf-8?B?Wk00RHBucUpJZU9mUjZ6ZFE5NkY1T2U2TVJrQWlBdFZ0QzlpdUFycnRMSkxN?=
 =?utf-8?B?bGp4VEVlWDVWb2NGZlQ2cDBGbnUyRTZmSnFkRzhWWFg2RTlTYjVpZHJGVkg4?=
 =?utf-8?B?YzFPRlVhZGQ5cFVDSFJLTGZXRVF2TEZBelFPb3VDV2lTMkcvZVgySU52UHR3?=
 =?utf-8?B?eHQrRDk3cUh0Z0hjaWo1RXMyNlBTWnM1V015RVM5VmI0dTNidERhUEthZWNu?=
 =?utf-8?B?VHpDbkFxSHgrdHFjUHBVOUdESzFXZ000eitCeGt3OVJHQkk3TGt3bEJMa3pO?=
 =?utf-8?B?UXlBVXJDWVlaUnQ3dEgwbkYwSkRnUU14MFZRWUwzVUZHeS9TYmZtcWsxTXhV?=
 =?utf-8?B?OWNLV08vQ3ZHNk04cnRMOERwYW5kb1Y4dzBNMU5lL2dnYzBubHI2UXJXdnh2?=
 =?utf-8?B?YjBjUjVIZTZhL1pzdnF1MU11anM0R2gwd2tYcHJDdkVYcWROb0NVeVVzeXJv?=
 =?utf-8?B?RnRwZG85M0d0L01DTWhVOUd2ZmpHZDVHM2dPSGhlVzd0cGd4aHJQaWtiTDhW?=
 =?utf-8?B?SXpDYnVIV05XV1VzNk9RSzgvc01JOU12MWpBN3M3cUxFS3NDb0NIQ0JHcGhL?=
 =?utf-8?B?RGprNFhtbHh1bi9jM0kvdjQxUjFZR093VDV4TktBejZITU9uelJ6ME51YnBZ?=
 =?utf-8?B?a09ldFFkWWhSNjBCSW1xbWh2Mk1iQXJ5OHhUNDZLOXJKcE56eW1MV3piQ2FQ?=
 =?utf-8?B?UWVaRTFjMmplaHM0OEVDR0JvdEZHTjBaWWg3V3NzMlRCcDlVdDZ0aGgybk1x?=
 =?utf-8?B?Y3Y1TmFSV2dyTk1BTytYdHpVdDBJdlFRdTU2RkVONGlqS3RuTU0rVTlYTmRD?=
 =?utf-8?B?NU0xcW1lWHRzVmU1K1lQek9Mdm93ODI4Rm85aFI1QmIyeExPU2RFQTkrZjNR?=
 =?utf-8?B?QjZSQlp4NGVEYlhYUkVmRnVOajlRaVhrd2w1RDhiVXdzQmowTWt2YXpMS041?=
 =?utf-8?B?UXNvdGJsQTZmN0VhOTlFcXdtU2djYTNOWHZ2NUlzQnZQemxMc3pUbExZdUFY?=
 =?utf-8?B?QmdicWRJRndWVWJoYmo5RVlKb2JMdlJDenZ4YW9MK1VNZmo0TiswRTVvWWsx?=
 =?utf-8?B?V3plaW5vU3Z6ajQrMitUdVZLcTlaNjZFTENReDIyTXQ4UTcvcEhjcTlkK3pB?=
 =?utf-8?B?TG5pZ0RvTU5mSXY3eTZTUGZDbXl4V25zVEEwSmJlSFFBdzZzMXJsQUFQK3F6?=
 =?utf-8?B?WkpxSUhqR3UzMGlMRTVEbStTQStnUGdvM3k0SXN6NFlHRG80anB0bXYwcnNl?=
 =?utf-8?B?NzZ0NWkxMnlxVmZmdjk3SWZ1Q0gwOXY1anl0WTd3S2VmeVN2VVVrZDhPbFJK?=
 =?utf-8?B?U0tqUk5PM1c5SW9hMERod1dCbCtwNng3S3BFeTNyU2FqaHc3Ynk0U0VnMkZh?=
 =?utf-8?Q?VRekvYhDWozZgWY+XkFyMiz0b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4dc4d8-6621-4ba9-ebd0-08de18673849
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:21:14.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p9ruoZjvixZTaTSHfk4GTiF39gFavdyGxaG8qI8VnmjvUc6fDq0pjcCTpnnqqZSsuwqULNm6tF+6i+XRxzGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11677
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

Hi,

As drm_atomic_helper_commit_planes() calls atomic_flush for CRTCs
sequentially and a driver's atomic_flush callback could be blocking,
the performance for flushing multiple CRTCs in a single atomic commit
could be low, like page flip for multiple CRTCs.  A real case is imx8-dc,
which supports two CRTCs and does atomic_flush in a blocking way, i.e.,
waits for a done event for loading shadow registers.

To resolve that, introduce an optional kthread worker to conduct
flush in drm_atomic_helper_commit_planes(), so that flush can run in
parallel for multiple CRTCs.

Drivers should call drmm_crtc_flush_worker_init() to initialize the
kthread worker if they want to use it.

Patch 1 adds the optional kthread worker support.
Patch 2 makes imx8-dc use the kthread worker.

Let me know your thoughts.  Thanks.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Liu Ying (2):
      drm/atomic-helper: Support atomic flush with an optional kthread worker
      drm/imx: dc-crtc: Use flush worker

 drivers/gpu/drm/drm_atomic_helper.c | 27 ++++++++++++++++-
 drivers/gpu/drm/drm_crtc.c          | 59 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-crtc.c    |  9 +++++-
 include/drm/drm_crtc.h              | 45 ++++++++++++++++++++++++++++
 4 files changed, 138 insertions(+), 2 deletions(-)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251031-drm-crtc-flush-worker-0aac27acf40f

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

