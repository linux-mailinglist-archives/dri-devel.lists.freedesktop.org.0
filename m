Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC0B530CA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD210EABC;
	Thu, 11 Sep 2025 11:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wyEJTtQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42A210EABC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=memcV/cS3NypjLa+ZtPS/cZ4gtfmk3FUZfq26t5jkcyezg5Rsk1CQ7OgoujnzVbsaH6VlsbGq+luWYBHz1AFJjzDM9SDz+rm0NDXScygzpEQe2hNJW2mrkUVWw8NN3/J3/uIfqzqryelNY0surnOA2rnr0ACvklXJs4BmGi5QAIoPL0Q1txbuHasyovMzqB93pAP79vwbdA7L0wKvOYr2pWYNgaHECwc9c4Pk8nYggYQSPEresvV3sW1N4GcvMcSRiD+jj2nLL90A2Otu7DRkwh3AkUjyPVKgJSBkbk7TnSCLF/EP42V5RchZdQhA1ocwyMq3dD1p1z+za4RFjbwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIMnOy5L5xf3/InWkaqrfPV5BiIsvgHScdLM8BbHHnw=;
 b=wdjXHFMGCe5rEZh2bjSvchOzHpNAaMzbf/bbhRRsCcFt9YDgQKGDth6eEHTTR311TyrtyuvBPTHsZgpLuLHnXmPAOnzY9O+Jw0CwdmkGTs6r3GkqCKvBC2XEeHnWDOOqSwwflIms5Q9g9KZf99O/ZYGRPBFKXe9XZdzg+MZcOO+vJf5CkCk9kvNsMKv3xhm7E5jBNWiD2HNT8tSJ2DaaIF4+WthJrYarSOZ3c/j567k9/SWCVR9YJ9/kaM1JBr5+4ByOXGBGmNU2zhYLrxx3lb2eo0NKNBjstFfsc6Yqz5Kf07vvHp/3QXN/67DbY+/9KkOBStZsly6o9Rn5sIRgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIMnOy5L5xf3/InWkaqrfPV5BiIsvgHScdLM8BbHHnw=;
 b=wyEJTtQDJomA2ttrmcwDqtcRE+6vw4JXuj+RnoS8roraR4crb6Awlsta8/DhJPExE+ws5UQwGAY3YxHTHlwV94tbXqW3xdo5zbVbPnmrVX82FwdecCJhQpUc1SEWg50VCN+IAPqouzxAqO+55UqCt3KnO4AbkIRurhl7Wz6UIrCKTORTVYBNblFe/SknHac2FBCsKMJgBQuceCEamFboh2V3PNbrTNlar9n8qMGEWHGrsN/v5zv9wp3WD+GP5aZ19GGHqEVeyUajT3BuLIa/+D+thrp1Yly5ng2ls9Sk63ZEduXNu2T2hV1HAsWU7wgMkZdR0pnw8Nx4MBwplm8iTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 11:37:57 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:57 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] dt-bindings: clock: nxp,
 imx95-blk-ctl: Add ldb child node
Date: Thu, 11 Sep 2025 14:37:06 +0300
Message-Id: <20250911-dcif-upstreaming-v5-6-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::15) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: bb82cec2-48bc-443f-e70c-08ddf127a790
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2QwU2FjU2p5dzlQeVMySVZxMlZRNEJtQXNEdm1FNzRXc0hWV2tmWloxbEVs?=
 =?utf-8?B?eDZzRjI4K1BWa01ud3VQanNEbTg1cnBlUkRNYVd2b0drVTRIYitwTlBTN3JQ?=
 =?utf-8?B?YzNIMFVmQm5WWDlWMmhyUVlyM2N5VzB1TjFxbXRqdW4vQzhPNWllcG44Ujhu?=
 =?utf-8?B?eVVjYnJjY285UnltZTRCZ1FQWnpmWDBIOFM5MUhlZU8vd0MrWWw1Y1ZxU2FH?=
 =?utf-8?B?Z1RzZUpyWlFxNnYrM3ZjaEhhMEtaRy9OZ2d6S2xGUlpnMk8zYWk4SEN1Mkgw?=
 =?utf-8?B?QkZFZ1MwYzE1TmZpUVg1RktZNWNXelZKNDViR2hiM3BEa1VOK2FZZUxQaXBo?=
 =?utf-8?B?dkFRMTlvN1o1NXpabzdWRUxaTEJqMUFLYTh0S3VaUjV4NjNQWnZabnZ5Zkts?=
 =?utf-8?B?eXhWbGJ5N2V5MUJwMUhEa0NKWHp6S1piTllOSUpOckkrd3phdUo5VmRrRG53?=
 =?utf-8?B?b3NQVmlWMzJKbUR0VnQwcEtQMWlOMXhxWlF6S21KU2l4K2JHRWJvSmo1emFF?=
 =?utf-8?B?UVYrLzVmQnZOYkEyZnNuU1hnbmpKOWFHei8xOXZPYlJlVDhKb0QxbWl0VzFT?=
 =?utf-8?B?L1JxcjNTNjg3ZkVHdzE3VmhQcWwxc0grRHdLZDFMQm5NUm1LMGVvdzZoMlp6?=
 =?utf-8?B?YkwrV2hFdVYzdjEwU2JxclNUcDhVWStGQVNQOXlLTEcyUjFneis2SDNhU0sy?=
 =?utf-8?B?RklCOXRncUxJRktWcU1nTzFCVjV1MVVvdVRpN2dZTDV3VXFtYUdBQU1kRzg5?=
 =?utf-8?B?NmhVYTh0djZJV2ZMaC9LQVlSWmJqRXp2ci8rRnhLNjRZUlJWWVJaL1BSVE00?=
 =?utf-8?B?dlRiaWptb0hhNjhYK2NnZ3dJbkVQc0VVT0QzUDlzT1JqWHd6ZW5KTkdNK2h2?=
 =?utf-8?B?YWF2Q0hYWjZyQmFSdGxGOFd5MkxvVUcwSzFSZWlDNU9yZkF0WGticit5Y0Vr?=
 =?utf-8?B?andRcFRZOXVBZWVoUXEwRFF3SFhqejJUNnhSVnYra3VmOHBEM290Z0NvTi9m?=
 =?utf-8?B?cThTL2I3cndqNitIb1FaSjhXbFRDQmVPWVZ0UzBXQ3FPNWEydTlNdTNuRzhS?=
 =?utf-8?B?VXlvRzFwS2ZuYmxMOU9mWHk1TjZrYXFuVGxSUFNic29JTm4vc2Q2ZDVnY1Zs?=
 =?utf-8?B?MkRYVDdsSU1XVGR3YXVlMlh0cGtlc2NEbTBNem4vNDlQTjhNSGVGVkNFbTJE?=
 =?utf-8?B?WkJqdVhpeHdaT21PeW96anM1bzlRZzJzbE9SbDNLRnlHSFlyZ0x5N0gxbnp2?=
 =?utf-8?B?WlZ3cGFCSlVMMURTQ24ralFFV0JWUVBGaGVqK2ZPV1V5ZWI1STczakxrd1Nj?=
 =?utf-8?B?ZVdUOHY5ZUFuTWorTEJMZkRDQ1BmWC9ndXZxWlg0ZjRUZm8zWTNLRkRlVU1w?=
 =?utf-8?B?YVg2M1RvWmZMREdqZGdsYkdXTjFMU1h1dDNicWZqTjY3SE1wRWNNWVg3VEQz?=
 =?utf-8?B?Q3l5K1lvVHNQbnhVRGFGZ0pyazhtZGRtd2xONkk3WUYzZEcyZ3ovd3ozNEtI?=
 =?utf-8?B?RFA5RCs2ZHhZL29vM2JXUTFaVG4zNGxxQmNIa1Zremh2WjR0WlErTnlpRGk1?=
 =?utf-8?B?a3FjTlpXRmtrdkFHWDI4MW04ZG1hWXlnRklad2ZsMTRNUk9pRDNRYkJOd283?=
 =?utf-8?B?QkVpQkVGR0RsdGhpSkk5WHppNmdOZlFBUE1VWnMxc1UwU0l2a3REZDB4ZXZZ?=
 =?utf-8?B?djRmdTh4aWR5d0lMMUw4eFRHd3dCaXVxc3Nic3crYnR5VEExUC96a3BkaDRi?=
 =?utf-8?B?UzF0SjNtZkJKQ245d1JQNWhEemg0aWkvSit3MUVVUEM5Q3l5MFVCcjFzNTRm?=
 =?utf-8?B?U1NsZWxvNkZDeW5lWkRIWGF6U2RDYWtjMG10MlcrSitGaHFxYkxObVdrdVVZ?=
 =?utf-8?B?eHhYTnMzdDFVaDdVeVhEdTBTYWNnQVBQdlJkblhVMWZGSkJsSzlOZS90OG01?=
 =?utf-8?B?UjJHWmZQbFlKTWVQNU82V3lxdllQTGR5emYyWHI4NVgrTGMwSkFFQ1ZyUjVM?=
 =?utf-8?B?UVR3ZUlSYnR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZaQnZuNSs0dU5PajRDZklibEdaRFgrQUM4eUZTSnJFalNadVcxQmlmYnND?=
 =?utf-8?B?dzduYjRXY20zdUxwUnk2U3dUbVhhUGhtY0FaS21kQ3ZxbWlhaHIyVU1odWpq?=
 =?utf-8?B?Q0RvRG1LdEQzL2J2MGMxTUlNSCtqSWdCbGUrbkZCRVhhUUdEMzNGUmhFYm41?=
 =?utf-8?B?NzA1d0tOeEdSOWgzNnN1b2JYNStwQ253ekJKMGl3MFlyblNMdFJtclJiK1pO?=
 =?utf-8?B?a1FxeHBWSDh6dFpmYWxpQ241TmFSbG0zL2krTUtXNVhzSnFpY2NWbnhTc2NO?=
 =?utf-8?B?YlVtU0ovTFE0dzM1bExRYWtGZVBWdVVHUE1GQ28yeU1HVVdOSDVYbjZ1SVcr?=
 =?utf-8?B?WXd3UUNHUlJZcmVHaDJQVncyTk1yYkszbWhaMFVZSGd2ZkpFQ0ROQXNOL3pi?=
 =?utf-8?B?VVBtdHh6NmRRNFh4cHZEVENQeFI5dTR1NUQvby9UR0dvQ2daSmtjYjFtdFA0?=
 =?utf-8?B?VUllakxRYWROa0NqaEQ2VXZYSk9JYytBK3IzbzhZSy85dHFkOE1iRWo0UGd5?=
 =?utf-8?B?Nk1QODZrUlo2Wm5YRmF6a2h4VlFTNGZvRDJVQThFSi9xZWJtUTlIc0FDNUdO?=
 =?utf-8?B?VmdseUFUd0dUZHo2dTNLYm9GdDVlNC82SGQ1UVZTdEJCRWZaWjkvOS9RU3Yw?=
 =?utf-8?B?UzJoN3hQN01wSFBjaFdGYmJkKzlqM3RMVUlGL3FNVVRsY3BpS1hxUE5MYzY1?=
 =?utf-8?B?cHlNMzJHRWVDUmFpTHpDZzdJR3NXcHkvRUpSeWE0dGk3STgxQVI0ZGU5aHhZ?=
 =?utf-8?B?VUlDUnV3SGtycDRYRzZQZVdKNDlmNjhqSUNsY1czeFZTaTJUZmZrR2xJVmNz?=
 =?utf-8?B?SG10ZW0rN3lsd3ZyamRWNkR1SUtUQ21CR1pGTU03YlJ4THMyelNjNlV6NW92?=
 =?utf-8?B?VmdBUzJrd3E4R1ZESlJBOGxoTlYrdC9ldFhNZGhnVWR3RUxEQVVGSmlTcnJw?=
 =?utf-8?B?RENYUnZmU3psOVpGc2VKbXJmblhsQUZxQWxNTXpreWNRckJWVjNlcFozNG8v?=
 =?utf-8?B?VzJMdUJPcVIzU09lTzNhNzhIeWdaYUlvWUNRSGRCdXI5aENUcDcwNlRqZDd6?=
 =?utf-8?B?R2Jzc3pzRVpJdFR1djlWbEV6MnlBWndOT3BqWTE2UXE5THk3NHNvU0J1M2VU?=
 =?utf-8?B?d09tQVVKRDNGVXR6aVJxV1hUZUwzcWtCaGdRTGpXVlE5THJGYjZEeUVGaFNW?=
 =?utf-8?B?NDQyb2Y4MStOekh2VEFyeHVFZmdsZ2w5ZlRkSVl3ZHZNdG9QVDY0anE3NE5q?=
 =?utf-8?B?bXR2MG1xbWdZUDFEMENOa0dDRDF4YUorSGZxakk2b1dKME1RUEhabGVzcytN?=
 =?utf-8?B?QkxPMCt2VHV5MHJ1SlZnaU1tb01TS0JoSGlIQ2xjeXpwS3JKUTFSYUhMQnpE?=
 =?utf-8?B?U0p2QXd0alZKMTBXUGV4NWd6YXVINVdidkpaYk5DVG9zRDVUb0N1cGx6U0Ru?=
 =?utf-8?B?N3lha2MrVUpjdjFBM2RPTm1xTFFQdEtHMmJDYlBxNVZPZnAwWFoxLzVFMklX?=
 =?utf-8?B?WXRBeGtyNGdkSDZKb1Bmd0xhVVlycHN3cEgyQmZYZVpqL3hkVXBoTE9LZWU3?=
 =?utf-8?B?NnNScmFVSXoydGpzL0VVajBjay9MOURFVWtGVTF3OUl3cHh4M3BKVDFIV21x?=
 =?utf-8?B?SE5IQnZrRnBCVXVPcG5YbENtcy9pMXNtWkRjdmpXd3NJRlp1WEhXa3V5eXZr?=
 =?utf-8?B?STVpK0NabkhidlJjTDBjU1ZxM1pISENpSHpLS1FGYTc5OE5aSEtQNUxpUWJX?=
 =?utf-8?B?N3RQaVlPYXRxYkQrbndTNG5mQXJjWnc0NEJXUGtobzIxRytNb0xQZTIrUmNZ?=
 =?utf-8?B?RUhYZnhUcmw3N3Y3YzREeEhkZndIWUFYQnFFZ1VEVStLVFN3ekZIdXN1ckdY?=
 =?utf-8?B?ZkRzVGlaRTVFRHhTVmtlU2IvTXpYaURwa1pkNHR5NnJQSDEyRFRYZ0RrQ2dk?=
 =?utf-8?B?MkRONnhQTWFwVmVFUk5kT0NjVVhMUHNwbzVrZmNIV3FubzZhMFZ5WVBhSHRq?=
 =?utf-8?B?cmlQLzNMVVh2MCttZ0lWbWl3aVVuYVVWUS9nYk13eGtybDU2OUtTMU9VQ3Jp?=
 =?utf-8?B?R0h4VTloN2VSSWwzd2JNWlNzcVJDWUF5KzVGOTFqVVA3dFJRM0JQMlZrNDJh?=
 =?utf-8?B?YUNvS3RvdGQvc01UWlEvQjBzZFNlc25zeFNkYTZNeXI3S0FZNHVqdVV1cUtT?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb82cec2-48bc-443f-e70c-08ddf127a790
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:57.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMYzbCzoyClH/BsYSii67YzejU1I88pWDbbjRrGLYxqPTWgmzC5m82BtusNmcsCvZttDVOeazIHXlBwJRk3BOw==
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

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add 'ldb' child node to handle
these use cases.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6219d31649d75539af93edae0f17d..d4a20d17fc5758453e9c59c94893380ccb34f3de 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
   power-domains:
     maxItems: 1
 
@@ -39,6 +45,26 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+patternProperties:
+  "^ldb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        "^ldb@[0-9a-f]+$": false
+    else:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+
 required:
   - compatible
   - reg

-- 
2.49.0
