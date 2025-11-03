Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B978C2CC21
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9166B10E42A;
	Mon,  3 Nov 2025 15:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dWdyC9QN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDE910E42E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyXRXSHnE1GE19lLu1yxeCzfCempEQG0Ahi+KhGp7fN+7s/OemHefkSVC9mli8xKaRqyXgRl7+x2A9yDc2orzznNQ9Jh8he/qnE1AUgE2tqU5NcSNlHDqqIApLkocqdutNADPjYRZ/sD8elz2Oc5dkIe7m22RfTeaXlZl7qFRXOzTL2NH3X5RS69gc+nIJS4zAqqqjyx7MoAjU/axBE2N5xJf+d8FmZ6NoovwIcqpyW7xU/w+O59nGotXy+i6PLu+ndrXCUuume6ZO562mL84feMc12OMkdA5BUVsUGiHBU4vQ0NRRkpv3ocjjA74f75SIrMpSMfRnmw3NM7TejBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgP26udAd2fHCh3OkTxE7AQXDUuf5RWh2ltggmW6hR4=;
 b=nNtKl0/qoW7LNbF2cb/A8PuPBDHAMXDVQxi0APdg3YgHxDCqupQyo0QmQgr1+3/UOnx9YYn0fPxeH4xPJ+OH28arixQYwY7WHo/E+eOEmwAlymHFMCHNPnSJUhtcbSdHJAJUF9MWr8XG2jSCOYEJG6/x5JcOd6EEjC027a0Xr7URKrNIYAsviUpf3Nd+BTZDesEBrAP5X6enRiOo8PNzyag+R+6OAz3ZgYk6Iu5KKJfUTlQdrE/NsbCcAV1aICtT5ftPmZ3EPAHp/PKjGucAyq17uuVg9j/nfnJ4Jqx7THZ8ol1FI8ebHzTYsTW4g0853b9CZD6pa+gyrzbLK/oFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgP26udAd2fHCh3OkTxE7AQXDUuf5RWh2ltggmW6hR4=;
 b=dWdyC9QNINsXpDd9meUePmdZZRemJS8mGuuo6vNiI7lNAiJELZ04r0CaFN1I6UOmeuy2dH/drxiRzUZV/q77PyctYQ+nzUwJRe4tiVI/fTsWbAlhkBhUH9P+MmtM4CGy0CovCU5zy+M1yEkuLcybO7WyHWCAMf7InjioFnNWldO7ifLDx/hGvEkRRvXGzVHD9TIIi3D56wjBz4+qmX40EUsyBtswXWW3oTLx18KpFEI3W3HvFk3qeBE6EEKXyDDlCuUv8Afy3eBP7txnmySCODDpREcbsj42GCK6rBPnjWhE2qmWYeDSil2WkQT5RDgPByeov9eGd/jsy5nd29KuFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:55 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:55 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Mon,  3 Nov 2025 15:30:53 +0000
Message-ID: <20251103-dcif-upstreaming-v6-9-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::30) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b06b0a-e38f-4e97-231f-08de1aee4238
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3JJSHpxT0V2SG1HTkZvc3pWYm9lNTFVMTJ4eGpOSFNkaXI2MWJZa1JnUkJx?=
 =?utf-8?B?UFU5R3dhbllSN2YzRkEybEdINFRqQVRPOG1GdzBtWTA2L2NYVG9TTjRpK0Zs?=
 =?utf-8?B?MGZvdS93RGpTZFJrc1RtVkE2ejROVFQ2QmFjTHRjSWFtazFWZjh0TnZwb0xs?=
 =?utf-8?B?TnFHSFRBbHIzTlZ5VTlFVkxCeW0zL1Y0N3FJSnhORFdFSnRGNXlaLzNmOFFr?=
 =?utf-8?B?TXpvQ2FhM3YzUlBPc2FNN3EvbE5PWml6N1FEaTIzVUpucHEweEl6WUdyc3li?=
 =?utf-8?B?QVJtTGJtRC9LSk95SCsxOUFhZzZTRFNrV3dHbFJ2OE52aGNVMUV1RUd5WFZL?=
 =?utf-8?B?RC8rWnNaTTFkYWRSYURIVVBxZ3g0bkdCdHAwRUh2OEFZN2lvZllpNFUvZ3pD?=
 =?utf-8?B?aG1LTnBPaERlTGFWVVJDazRxWWkyR25jcUhqN3UxZGMzK1JLcWJaWmhuQ2Jx?=
 =?utf-8?B?SUlMWnRGL3hEK1g0b3pGMXdYZnNNZEF0RFhHUEI2RkNJSTJxcVZ0RmRkbFcv?=
 =?utf-8?B?YU1IQTFQVkJsTUREajZMTk1aM3R4WjFLMkJqVC9Ld1I3ZTNOdm11dkNNeTY0?=
 =?utf-8?B?SUZRdDUrTTA0OWh3S201dTBzNzVSZWFHbTkxVjQ0ZWJUQjhuVTFXZ3BxVVM5?=
 =?utf-8?B?WjdIeVNnbkRCYk9neDEyNzVjcjBidEZWTDJnbVErYjEyNEU2bGFCMFc1dUdE?=
 =?utf-8?B?Z1JVY1BRaFltRHVtc1hRN3lFRTdzTFRmTXhQUjB4b0xSb0RHODNuSkpMZEVl?=
 =?utf-8?B?QUdTTkZsNEJZWTNYdXA2ZWc0RXlPcnkvSFlTSFdWWkZtTUkyUmlRVWtnekkx?=
 =?utf-8?B?ck02WXNVckdjYkNSTTh5YTU2d2pucUU5dGgwYXRTN283amxKREg0aGRxQ0sx?=
 =?utf-8?B?UUE0OWdlSE4zOUtjSW1VQytQN3BBek9hdVdFNURlcmYxMmppOEhHREJET3ov?=
 =?utf-8?B?Y1hIL1N2dnZlZ1Jyd2E4dmVGTmVxWVVPUWcyRVR3Ni9IR1VMQldMVm5kSEVt?=
 =?utf-8?B?M1NCZzRhaU9UZ3lGVUI1bXhhVlhQNmY3elI2Zml6Q1VnNEZSUEduN3cvdTZM?=
 =?utf-8?B?UFYzUUdpWFJuY2F3OUNuQmwwMzZ4RmVKRGt6UzFFQzN1T2dwL3FIY1AwZVc0?=
 =?utf-8?B?emxDbXJVaWJocVBKcjFGTnN4UDhrenpHSDNva2tYTVlBZUhFeEsyRmw0Ynps?=
 =?utf-8?B?S0hQZkVTTTVVVFdKTk0wWGNPRmFRaGZYeWdrMWZJc0dOZXg0OGdlT2xxMnNa?=
 =?utf-8?B?MlJNYzNiWmVBdWxBNGFCeGxiVkp2eFZ2bEU2QVhiV2pBZ0lHd1BtMzcvdE9O?=
 =?utf-8?B?c2pTZGFhMTR3UVg3VHFKSjlFaFM4R2c0eFNCamJmbGJ4VXU5c1pPMUc0RDBa?=
 =?utf-8?B?c2lwVlBNSzg0bXVLLy9mY3pJcE01empTL0lhQ2NBajJTN2RPMUkyelNjSjAw?=
 =?utf-8?B?TERnZ1ZQRkUycVUxVHRHRlptaElFR3hqR3NtRjlIRWJCSng3TzZGQTZ0Q0o2?=
 =?utf-8?B?bFJ4b1ExWjNkdEViRVF2RkJIUU5BeGhEaDhoQUxOQ0hkaWdsUG52TS9JV3Rk?=
 =?utf-8?B?d201UElIdnVDMEVQRVBTb01wZXc0WnNuNk9CdnhCUWpUbUlHYTFIV0trWjRC?=
 =?utf-8?B?NDVBQzVYQWtaejJnMkVGaTFEWk5nZjVLNXhYSWNoMGNmM1BhRXBBZnpQaHVp?=
 =?utf-8?B?Mm1iTXdibWJjR3UzU0tJK0ZSL1BJNUp6VDQydmdBWXlsWldZWDFUOGQrbmdN?=
 =?utf-8?B?UEJvV0UvNnB0eDhyd2JCb2hVZGV0M2pnc0QyVUdzcWY3Ti82WXRoT0tYNXR3?=
 =?utf-8?B?aFFBVVc0TEt2QVh1VHBZcEczaU5aUFBOR3ErN0RMd2d6UXV2SzAzTHozRFpk?=
 =?utf-8?B?cWM4ME16R3E0SGdPVDMrdEhnZ3ZaY1pFK1BDamxlQmYwR0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZaWi8wZ0Q2by9iQnBLekNlSXc3emVScTJiVHp0b0xGY09CQ0NEOElaWmVz?=
 =?utf-8?B?cFhZTi9rdnhXa0lsb2FZNGtrVHhiaVFFY200dTA0aHU4M2UwR0hMb3VQeTg5?=
 =?utf-8?B?cDlGV1BIQWNqMmtqNnFWUUIrNnZMYW56b29FYVNzaHJsd3NVcXZxb09vNWho?=
 =?utf-8?B?UHhJK09WbG4vMjVOMExFL1RGNlJzMWNiOEJ6K3ZxWS9CTnhWaGdua3hQV2xz?=
 =?utf-8?B?bHpIcjI4U2FaTU5jbWZscERURUMzUk10UHRXcFNpYXUzZXErd1hyZTJjdi9S?=
 =?utf-8?B?aVFKeitHblZabXNHUWh0ZnJMcmFsKzBBSTIvVW9rUXNaS0xteFh3WklGYVQz?=
 =?utf-8?B?ZFlqeXpoVDRUSVdMYU1vcktIQzlvZFRUOTlCQnAxbVRiNkJaVzc3Yis0cTBs?=
 =?utf-8?B?czNhNTlyY3J3ZVA4d1ZXd0I3TWV3dDJwY0xla1dvQjZUcCtsY2JvUTdZZUI1?=
 =?utf-8?B?MmtqOHZIanROUFIwNVhFK0d0RGdmMWFFamkrazh3UWQ1T1RxSDBpY21Qd0F5?=
 =?utf-8?B?bmJrNDFVcWRyTVlsNnM1MERHbmF5TUdLMkxWK1l6eC9ZQXJwL3Z2WC8yd3Jo?=
 =?utf-8?B?MGZuSlRzNDQ4N3hncWM5aThWblBjZkF6TXRrQlBCT1I2dEFLUXV1MTVVd3NN?=
 =?utf-8?B?MEpVdnpjK3FadUUrbStQTGdxaVpLT0FXQkhDTThFQWRmS2hCWXJSRFI2aml4?=
 =?utf-8?B?OWsza2dtY3lnVFFtU3NjaGNBTXVvd1NYb003WCs3RDlIaFRPWmZ1blh1RG1w?=
 =?utf-8?B?K21RLzlod1dmN01qRFZCNWtaamlFUXgyVys5N0pTZkpxZ0xUcGVPc0FLWVQz?=
 =?utf-8?B?bDMwZGQzMW9YdXcxSlJlZmhYc0RwT0IyVW1waWVyMGVGbS9IUktMcnhUT3RT?=
 =?utf-8?B?ZmViVlh5c2szTTF3dFZ0QVZhYkRpOGZWbXFPUHFtbzJnQ05TRXBtLzhhN1Nl?=
 =?utf-8?B?VkdMUFFueUp3NjdUWW9pNHhaaGRSRnY3aEJCYnJraHBqcGxObUkxR3VVQlUw?=
 =?utf-8?B?QWxROWI3OVZWUCs4VlZsTlNCMWhuYjEvSHgrMUNEZHJUZ0xVRkdjSEJJRVJB?=
 =?utf-8?B?cE9RVlU1aGkzLytzMm0xazVuMmJJcnQyNGFocUl3Q3cvcTdrSk9YMGV4dStT?=
 =?utf-8?B?Tmdpd3Yway9RS21GWGNaajNMSndwaE5hMlpKRnhpSWIvZXRQSmx5eThEeTZW?=
 =?utf-8?B?OFpCbXFFck1xbjF2L1Qvek9uSDErWHRFNWw5c0ZzSG9XNmhYalBaa1FYTnBK?=
 =?utf-8?B?OU9wSUtPSkoraXpHNGxRcFlVb2JrbFlYWGZtNzY1VXI4Z1Z0VHVkTU81SHdz?=
 =?utf-8?B?Yk5GU3pOZEZKNDNYK1MrSk1oNE1UOS93dmNJNGE3YmRGejltK1F2ZU41WVJE?=
 =?utf-8?B?RWRXd0dpWlhCL3F5MUliZVZveGFJNlB4L29xUjRsa2xFK1E3S014N1VySGVi?=
 =?utf-8?B?MkpHZFRxVnFVWmREY1J3S3pIQlJPMFNkTENacGJWME55b3RZanJJby9aS2tv?=
 =?utf-8?B?SXZIa2U4cDZ2ZEZLTlBOUm9SNi8waHltTERPYVFWdkNscmx1MWZ5SUZTZlh2?=
 =?utf-8?B?OGFGeTE2TWV3bkFUcENtQnM3dUMzVTY0eGIxZmlJV01hRkJEVmp6L2FxeVdZ?=
 =?utf-8?B?SmRlSnVZdDFiYlRIbFZ1Um1EdW9ibDhCQXRZdThHTTZWOUx1UUh2bE90ZWlX?=
 =?utf-8?B?S3g2K0hrcGxjR0dEN045c2NMQUk3UlNrR1FwT1pFYVNNUUQwcEpranlFU2pH?=
 =?utf-8?B?U2JTMTFCTTF5cHUyUmRQNC9pZy9QTjB4bzIrek8wNUtXczAvSVBQRHp3N0hn?=
 =?utf-8?B?NDVsd3Zjakx0L0twN0VJVC9FWDBZNG5OTWFJczU4THBJditOUlZ1OVllbElM?=
 =?utf-8?B?aXhYb2R0YzZCWmZJcVJlek02RHk3Rmh3ZGljdGE4MnFCVjVTT2xFcHIzMzNu?=
 =?utf-8?B?S2t0d0N5SWZUZTI0N2I2eVpzQWNReERoMVN5bWRLWk84bWNJSVJtQzQyQ3B2?=
 =?utf-8?B?WUYrZnNLWkJ0aFNSU1N1L2cwSm9uQW1wWDR5MzZseW5iR3o2OU0ySUVtZW9x?=
 =?utf-8?B?L0R0VnJEUEtsTVZJN250NG9JTEVRUnJRcTBvcjkzWVdVRTcxQS9SK1o5dlJE?=
 =?utf-8?B?Tnk5Qml5YTNFZzZMcHAycVBib1VFTHRWb2wrbkNpNVlEYllrbElrUWg5ZXU1?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b06b0a-e38f-4e97-231f-08de1aee4238
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:55.0390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Re1f+PZ2//Ybt0UHtmx4vUVkUX+dcO4fJVX5WOOp07GFZe/RX5viCF7CS7iflHROC8nFiT6mBj4vyX2suE0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38383f9d8a31e28c64447032d1052827dd5d3ea5..ba16eebd0da223509aaee6bb60070c62bc508a09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18693,6 +18693,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>

-- 
2.49.0
