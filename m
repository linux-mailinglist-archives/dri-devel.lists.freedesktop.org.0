Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMrFNlH5fGmYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788EBDCA6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A907610EA44;
	Fri, 30 Jan 2026 18:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cRNd+ezr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2E410EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXYi1EtlnH8e9khPYCpW5tWxqCiuxp63RYsSVDm7+X2qXmk16akELXMTkZhj3yyyHYuV3M791SWMSsoZ8VYxyw39fj2dgC8DAJYlWm3+eenDM3ul0MFHuqnmWAymlbb9k6Dv2SKw1NRN9FCh8UDXvCIZI1XFLrmQGeDfsgtHzEG8An5ALKMxvfOjnklBUmDbFE60tfblKtQlCHTp0Uj97UdEYxQXwSULlDFKKwQ1l35h9UWtnVRRzsuuXZ3IZLwUcEUTiFzIOc+WGizh0QXuoUI6BT0B4/QIa/RNQTHDqzWbwpU07qoaBMvJZgbEF+bldOWD8NSNPFqNmNzt+OlSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqYFv4wqyZwsRllDTByvtaqHJ8dCnaPa+eT/yys9CpQ=;
 b=n4Xfy+VxYrxzSCJ5ExSM53n3pZsTcIJitVwOmCsk+f+NXGXfkFzLo051/6pKd5LBRpXuKDgpad41rlVisu6Qjqx0aLLwA8nWQeP1eDGjic9vAFBQpjdc2cby7x0/GyUaBzX14uNzTEN8NQUbA+86WrDokF5b+SltQ8r4a1QS2qfjO6izzp8VoKkNC5D8Nbvf9nHOpG/1Zx7gENXVjUhtqVy9En51Iwo8wGHhcBYwZDgZS0tdclsLScvV0441m0xmscswDRJ2ttUKoJlssys2zV1cWn7e2+FwqnFN7HtPDaaDL2FDn2m4nkfAQQon4fYzW1o95eLoJH/gTArNEN6mRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqYFv4wqyZwsRllDTByvtaqHJ8dCnaPa+eT/yys9CpQ=;
 b=cRNd+ezr2l1qSoDF9s81tVGpqVW1sj0GVO1XopLTDV0j30VwjYRGtRrSZ/hux+ZxaDi8OlV9oYrTrZQeL8ATyl0Fl1zDcF9aA5ZInd1N98NVPDeWeYPbMQYz3UXXhL9z/ehx6r/b2EqMAmdllRUwc8pH4woQPz6kSeBUfHV5ezc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8547.jpnprd01.prod.outlook.com (2603:1096:604:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 18:32:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:42 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 16/20] media: dt-bindings: media: renesas,
 fcp: Document RZ/G3E SoC
Date: Fri, 30 Jan 2026 19:30:08 +0100
Message-ID: <455d7d307f6346d86e2b315719930f5ff96d0e1b.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c4a935-ed61-421a-d93a-08de602df48f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zR4St5Oj6nZ6ne8Di8XTDXh+yKZRAoihtDyPAATv4eZkduFQGTM1Ti/2rSfI?=
 =?us-ascii?Q?reugVbIu4EgMEaVZYUM3fAlqabNKQmj3ee2D09lbxXK2VnyNmy3KSCDxz9nd?=
 =?us-ascii?Q?6yNKtGCoVYFmFCLHkcOMfuFA+YfvVpPSoEg7Kr9EZD5B2o6LImL8Z//M+WkU?=
 =?us-ascii?Q?LUFbLvtQZa5xCoB28Wg/BTdoqPU86pJOYurQ4QxoWsZSExOTfFKFLnrisFyp?=
 =?us-ascii?Q?xHqp5FH2BLWEDPJ/TqE14M2Y/eA02SMrjVuqlqc+Ul03SVjGtx1xYxMPSU98?=
 =?us-ascii?Q?XDolqSl+WdsdnSOZgzCK7FwvzycvDGDav3JTLGa5Szxi0HEaR+QUaGEZqfFv?=
 =?us-ascii?Q?u/WNdr9bMy3CSRHhCWCO0dgBsbxlTKlFm4SFNXYbPhOZIQDxxwaDCRQs9ztC?=
 =?us-ascii?Q?VPE4Yl1BYyYr0vii6Mc5qFy28TvJ61vq/Pi8kJFRN5ZIl6jelXIkzPolR/mR?=
 =?us-ascii?Q?TE6ZYqXtUVDgzMWEILbFUilZklhXmZoIodriehP9V00hW7V0AyQKSclHCALN?=
 =?us-ascii?Q?nQo6JWRsV3yBANP6wCDp2u5Lmvvmm+Fycx6XrdZVSd3v2EVnrAuX/7qbrQSM?=
 =?us-ascii?Q?e1Xf0tuUVCvMSDoMfQwZvBABfOJvCuNsaeaBy9X+RPjqKX7zTj3mE+gi7MJq?=
 =?us-ascii?Q?JXFF65ykBT26YyLfMkH9eZ96JKREnH6bIegh58laP1SJfvTs+KY/oLng93gt?=
 =?us-ascii?Q?l+l/PuxuMSt1wOAqwYRDPnPLm1dcIHf3PasbS51nHXhcxczpyrcGfI1SESSI?=
 =?us-ascii?Q?TqVFWsXPQQl3OkmYu29584UAY5Nbdln2kltsIeYmZy+yXflGyyzvhGmYayQg?=
 =?us-ascii?Q?JP8EFkfRNVzg7O5TVbdUf9yHrgN8ooIx6VSK96sUZBwuCsxtWLBjx7kmVB1y?=
 =?us-ascii?Q?4cAisTNmszCcqzzs2khzwXhV5kej1bp9pMUBoakMuMXchRbU7oidOCRcfVt5?=
 =?us-ascii?Q?zjtdrIGOs3/LUiecqZAN9yDJNOAG5Z3uih9IKjpTuMwRUUI4fP8FRpHLdSS+?=
 =?us-ascii?Q?yL2FsrAqHVgSYbSAbEJDvoCHiqWLWa0KGk548JrGizwhQKOpOQEuHGsyhx+D?=
 =?us-ascii?Q?NOm9RZRMgHxXLq6cbvz7qhG8kCaT8oP49fPUSJ2ZDb7MalctonDiCBmasMUn?=
 =?us-ascii?Q?AvEgDRF9L45za/qZzoaf1bfZT5VgGlQo/3UH/1TfDCqOv5Lo+Ds7qohezXOd?=
 =?us-ascii?Q?sdlQ6qVPEtYUOCAv/vC6pTrhMd9PXPUZECvNBA5KnZ92iYJtoWKGe7AO1tWT?=
 =?us-ascii?Q?obEFBkIRQAMX+i9xrEvLkqDyDk00sQkxjL5joqL2leU4XV18xuB1TjGvQ75w?=
 =?us-ascii?Q?n5pZE4gm4rYVe4UXJK+azULqXXy8cgtPuHkaGfDMd4buTmE5YBsRcmQaR4L6?=
 =?us-ascii?Q?apacvFdVKStP9YZqc8HYHPaRTNZaItNNwvhzsWKTJVsGoGQZVvozWbCq6fNC?=
 =?us-ascii?Q?e9zlntsVtG2tv9MUS60O0uih90TNU5L2bTesF553I5xPENneVMnv7tOYkBTS?=
 =?us-ascii?Q?b/5UQZLhFJRLicbfbX4h1gTOQAWsxbZA5QhvsQwwlfBAHUEmE+qF715jFu1e?=
 =?us-ascii?Q?aDQwosiBiaZAmHgk2VQbkYEHw92317kja9f+5n7+Ke01Sfa0bpM5ui5XA3B9?=
 =?us-ascii?Q?n35ETI0J3avZ66MTIly3QOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vf9XzOlVOQTtDqFL9nBAp+OlgGpRqnMKFdHZLHkT+r6OKhALv2N4YlOU66Cq?=
 =?us-ascii?Q?kPmgWeAsuucnEntfjEKRhSiPVXACNyx/4ZgxuefrDB6S82aCH4dEmWiA9I2c?=
 =?us-ascii?Q?1RqiedclMuKFGq8s6gev5ygtHmiXCTDTnSDgx6paolHlpaDHEfyuJOEPcZYZ?=
 =?us-ascii?Q?nMWYn3414kaHi4gnGOoFoQ9cTXA7wwl8CK8iJRyTkBUZQaB2T3gKMU2dW+wF?=
 =?us-ascii?Q?TutYVSwM7hRCW5qKoSYwUobsRzGMDUCIRK69epwoX1nPp5n/+ixN3/00jFbC?=
 =?us-ascii?Q?+a2bJFKMRGD/OjlQy3Di+peSVmKDIswoKWaxW8j1FuT59yAkY8oKyZDetGQm?=
 =?us-ascii?Q?URAnXC4Pz7bke2H4ytwfwv7SLwvq3bV92npVPK4OeqCMWTXioPwYJsuiO+4+?=
 =?us-ascii?Q?DIND8QZlGSE3/2SA8SINBjt6wsBJcbSIqjpAtK68SEEF3LhaMM3J3j4xaPE7?=
 =?us-ascii?Q?rDGsE6mpjDSypTm6AhE9H52IJMMylWCxMEznm9jmtT3WHmeWO02tuJ7mrqC1?=
 =?us-ascii?Q?kfLMshFuZjPPUmV6U2TLuoPn35gJt07bFWSmeJZ13JGfLUbwmDA6ZkKlEOAw?=
 =?us-ascii?Q?j50F2Ipq6Ua71mzMMVeeJJu+0d/Vvy/EJzwtUS4dUD1rQPm6UY8vjgOK7Wo7?=
 =?us-ascii?Q?7/zZw1reg+3QS8ENhqLGge73/WeBHm8qfig2Ox4mrnEFb5mhO7ofZAnTjSRq?=
 =?us-ascii?Q?4ou2bIB+0OWkqXqNdqNp1JQ/1RpD71/XmytNkyF0KYpFoXG7VmkqPb3dhpsj?=
 =?us-ascii?Q?E9k0VOng5K/uZe2LRWPcGxY/Dp9HVv47SX4x94nZnnyZEcXBqzxxzdVrEC7c?=
 =?us-ascii?Q?iHEO3rb234g2tGFdcw7lbf82WM7BYsqtJURyGc+MHd/pRtI5DIUdgoNnLlvd?=
 =?us-ascii?Q?tUy93AEJX70R6qB/Gy5i4iMklSTjNNUyxBvjB/5TSzXMpSdL3ISS9wkUK3oE?=
 =?us-ascii?Q?RUQqgLzhpPn2oOgVBJht0M/fJeyoEP7pVKFf2aQfcLxpvyDVVxvZUye48/4B?=
 =?us-ascii?Q?BuOR1M9Qn3nkNsArI6xpqocYjZNHcueRBvzfzUZZwnnG0VyvQI3p71rqbzhn?=
 =?us-ascii?Q?EIjimbrOMcHwZUIPM6NS4Dg3DZI9DIksWfqX6sTdS3lnEbeajumSrGnONHTl?=
 =?us-ascii?Q?Js3AE8NssxvMJ3N6+x+ZqO8WVYy8snv6pZDQbLm7mC83zEDM5+Vcc60SeqA2?=
 =?us-ascii?Q?kF3yE1jNHX4fVquyeyNgZlbhXZlNQsMVcNKXCDECwLmKoWHRiLPHr8Fpwavg?=
 =?us-ascii?Q?RHzr1FOz74SLytth7vv22WcCUZQIKNj6RzkfAH/wlPYMxErdpVao7yrPWEVw?=
 =?us-ascii?Q?XWb2WFhS1g1XdVQp83BCW9IyGTrKqaEQbSEph/bysyIDWGygQxcUjmijiO9P?=
 =?us-ascii?Q?+rhVxpsACtj+ScQWK7yV1/N/6Yp9ZqVYdkxqxfHDcGI9m/aDEbd7j8FW4vEf?=
 =?us-ascii?Q?IW1Dmyw1ZfFZZ9YdWpre8nsu5Vc4L6iIlXfXXjnGe+ZuvrhDNgMZXWfWgohp?=
 =?us-ascii?Q?tEFm0UZ8vOPF2YKF5Ecy+hCPeasV6birbhgazr20riTcJg7kS17DwcBmOXmq?=
 =?us-ascii?Q?6fsCcUyVrWuWFMacPNHKn6S8Vzva8Fso3ksKfkvGII28VoubRFD/w7fQgNal?=
 =?us-ascii?Q?Wxz4vg2n9NPxqSm4c1sFV6gzbhyAueW93rLBgiswulyRr7yeai3KZ4fLuF31?=
 =?us-ascii?Q?ez1F8ky1U1k2cJ73s/8l/4s+tuhsX/ZCfuFPit8lJ3bXxLa7sMfPVudVCdAM?=
 =?us-ascii?Q?RWCCwXm2TFYoQDBcGSTirZz9/FQpPZkQ8QObFWo8HYCsAM9cWOTZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c4a935-ed61-421a-d93a-08de602df48f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:42.6816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhDpPLTeH9sKX8PhcCsswJIbSSgp4GcLlB8lFoS+geGL26dXWXtiBRzML/Jn8zuKEDExdvnwyMfgZ1bYkWCgOVUdAKPSnyh2N4taVoIvxLkZT4upWCE4echA1Ez/8Xom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8547
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,qualcomm.com:email,glider.be:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5788EBDCA6
X-Rspamd-Action: no action

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

v2->v3:
 - No changes.

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..f7e486e90e43 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0

