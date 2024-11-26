Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786819D916F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 06:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E7310E07C;
	Tue, 26 Nov 2024 05:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="itQHQo8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EBD10E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 05:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcMC7trfxhZrJzg5WqS28ZemQtBZSFJjzWqgz/YzeWUZqwCsIfqB5SFpnsLQ1//xq2KaG02bu8PifvzfhT47UkV/6eZeystahpwh2+WRwcTGeIKA0m2k9SqYmS2CVO0KpVuSkGxaS78ibvUthtTG3lFSFnlQyHgEVXCyuZoM36mF97JfQcG0UI6lQ50QotK5Zja6ov58jokbw/0eEfPhI5veMNleiEAJtfhmWv55EKlX033+oB3aEbrdq4Ucsi5z/al5VsHRPSktdADa+upXVli6bKbGbDLNQJBMEtCE9WWg3v52aljpi1byj88CJyua011qOHt2lLnnqxBByWarKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9UAcXKv0IvgWzgjydAeFSsIGTK2lSvbyBZv9fTCg1c=;
 b=FHaEljhNh1/DQC46raC1WjT/nRl4Aajr4UcsFqXKN1d8uYPoIaymyjeEfiATptitsfjffkrvK894aCnwiDs2QiaLY4hlsFAknDqwDHkFKCcVux31GWmrvUL8mXsemLLtPdpigi4zitN8AD+uIjbwbBAmfxD/1gVjiAXPAXE9WTVvcs1If7YwJko+1/tLBO9iBogtXKuA7h76F0ppjLAPLVkkDFh6Yavqs8hQMKt8ItUWBjqivrfXuHqXVnUdbLHbSmXDfP6FGSU3dJZ7a/uq+oAn0cM29HXc/bot66Y+V6n7306zfr/Zos/Q8FqR1GH1a7uV8VdzEL4T1n2qlaUUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9UAcXKv0IvgWzgjydAeFSsIGTK2lSvbyBZv9fTCg1c=;
 b=itQHQo8ph65HN7+DvYSiTsvn60HGBb09qkmvNxwM8T+bGfnQ2iEsNMOK8eZ09fWpw4zikcyZ+Ds4aNsGiArL5z7244/3N8LQIWbfzOyLamOfTdEEYgI906674bVvcsWqLu6ilDtyJ2WZOY8cc/MMNWOeuqU4dOqMJdkImEeLUJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9787.jpnprd01.prod.outlook.com
 (2603:1096:604:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 05:43:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:43:34 +0000
Message-ID: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/3] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Nov 2024 05:43:34 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: d151514c-cc2a-4b21-94d3-08dd0ddd4476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rMx4LXbvXYphthspOe4aCsw4iivazptMpf9snxnSEIRQFouHDN3BmdoU7F3y?=
 =?us-ascii?Q?j4udUckdvrCeYlnuyibqmMvt+w4pqRvXWxCcyBW69xSIp1a9+XqaCP7ua2jA?=
 =?us-ascii?Q?dtvQ21jTIRvayPX1f2NM40Yi1Amv4XCPCzrOKtt2NjD7acJwz/GjmbFpoDRn?=
 =?us-ascii?Q?c4eQ4SN0oy824sOI78HsJw6vtoFmqHtPXUqPgRQcRD9MDkIFYf72vPZNFqOK?=
 =?us-ascii?Q?5eIg+qSO0CGLcE3WAGh5dlP9PnDn6I0F5McbPhaFkGbvzCEZNzk9RVuGa/Bq?=
 =?us-ascii?Q?Qh1+7rkANSw3ybPQTOx1ZxTN1lDLicHwz85CUkTDz6joB8guzo0hUqj//kU+?=
 =?us-ascii?Q?Hq4EKyoMnRDd1k0BsbO6dTUusXgIBVRl73hySlk4s5eb2t0UHNqDDgqMoaWH?=
 =?us-ascii?Q?XyYZnTNFhPG2qAuQ2PWrYHSbXMEbj66nLWP3N/yNauBr2yGZdyAd4iFHrers?=
 =?us-ascii?Q?U7kvtoE19TAQCHgnIrcFi3WjuHsW9Fi8Oz2IAaqjq5nQknwhLbWZHavwca3p?=
 =?us-ascii?Q?ylHGyT/PvfXI31GAHwmVR9RKlncvdBvUngmv3/c9Sc4RwcZFRqtL53sknWjx?=
 =?us-ascii?Q?WPVn5jHQCRSlIeuSvqUQ7BXmwjOx/7vry6P0NmNYJUmrTEG0GyYXM6QpPZOx?=
 =?us-ascii?Q?yVEacazEXLcBsVvmzdjjl4dl0bhee9eHZIPne8pQ9Kthuo6XEe+9oSSPZaNd?=
 =?us-ascii?Q?OhB5lUiWNc6pv+bcomkq+NO1uFx2Ap5QRysy0h8AyPURYHOO2PzPnMcwaS5X?=
 =?us-ascii?Q?CdLDO35N2PIywTIATpUZYJqsVzRhN/sOilWV/xb4k8iEG944GVmwwmHDpUzg?=
 =?us-ascii?Q?0a0OuvHEo3ZykSSqTAdmx3fQVlFAV3hhPUqA6mfzza9LxAkbyDD+04Axw9Ol?=
 =?us-ascii?Q?SGAeNcmO6XDl+MqmnZUlzg/7HgmcST98XYsBilCmH+HJtAC0n4qT+jBPb4/U?=
 =?us-ascii?Q?HZHXR9o7wOOUTK4Qvbzakk+rumM+4CaP4PtCmtNLixP+9DQmzOLlNldhgEn2?=
 =?us-ascii?Q?Bw5tfWY8+L3CMG+FKCkMzwdhCwJkuVMY4nMiEyIffUOBPf9ZdNcov+DtpTwW?=
 =?us-ascii?Q?Cb/Rt9p6FfbX2rnD2wqUDFY53uYMFhm4oVI/q7cApC3k/su1gIQUbh7bPdUx?=
 =?us-ascii?Q?gZmOttvlzwaqlEJdtIM9yG67csk02sENJf/S+/VbKYaPxGTGTXh9BcgMBFVl?=
 =?us-ascii?Q?pP5PgkZIKAaBQddxuTlss5sW9epaReMoTZTuv5oasCSpRneV/lNq6rJx3i9P?=
 =?us-ascii?Q?gh8VT1qh1a/AkkC+mWZCjx1ToBkHLSyDQCkUzvBqZhORV2pp//cwHzoKCQPg?=
 =?us-ascii?Q?6gfymLJ55qLLTlcExwtmdKMXnwzJdZBlOt4cOUqNMagdedjpAHLogwVfU1kC?=
 =?us-ascii?Q?0oD7wBjbWua+UW5Bo/YDeLBqp6w2W0NA4qiQiUiT9IWgJsaEd0R7ahSTBtzQ?=
 =?us-ascii?Q?S50YKH9nIGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?21M1XSid3OSHc8u0PiUWEWk/xk+wKzFXeakSeE4Vv1dWI9MGVNCU6eZ92nub?=
 =?us-ascii?Q?adnu0qSZOwZHcGbtm5QEZOPWwJbbkS/N4L8MgwTxF1JfTj6KWBAK/d2zQjC0?=
 =?us-ascii?Q?G4PFoBfMEe7sc3Pk6codCkqbqXCMgydSzIz7VL0tueHaby30Yfa9WrSbtjLV?=
 =?us-ascii?Q?nCP/ztyXtYsKGRKGSvIIK3xXIvgkkglgjthbtJKPMxj7cJCDoWh8FLPs0lY6?=
 =?us-ascii?Q?WHD7a3fKWectF0FimROukii/idO9grN0k5xvWfDVhZrAhgyfhu9NllYXfNvS?=
 =?us-ascii?Q?Isve2qEWqGWaPz1BSuPIn3mLeo8fRrZ9P3OtSjinj/1SQg632bbUAo/lZSM6?=
 =?us-ascii?Q?2H0sBe0rn/7P692TaSVZ9JMPtAQzxVA+5AA8QlTo+eTp03PROSXSw+uSidNh?=
 =?us-ascii?Q?Vgq8R3zWSNV/kXPpDncpNLjQCGGVdLofYH1/MgGaKDHek4wYGxx/Ixuy7hbr?=
 =?us-ascii?Q?LOZ6f1Y2YI2gkbtZZEM2Dqw62iUTPLBlGqbyaU+qoXuYJNa2z1mwB1tg1M50?=
 =?us-ascii?Q?j8YSyDiyqILWLVQ1orn8bHyOtOilln7StDoIYHXwybGLR1nB0I0+ENnNDIib?=
 =?us-ascii?Q?bwEU3mR40pPoJeiZ21ZAgImozeBo/qs4MMAekBAm5XJZrm/hHXcUEZZWxyRS?=
 =?us-ascii?Q?fCIzFuz3iDhzuh8Qpws5whCgPz+DArrK9MbtynJyvajoIPR6Z6QA1/x/Y1I7?=
 =?us-ascii?Q?pV9Nn8gridHIXk5LBOZ1aMLVZ7aAM4EaHnk8oZX2QZ1o7OCtMsHJBH8HHUbl?=
 =?us-ascii?Q?yuH4ZnhcV8mkliiXuDFuKcPx/HHOGozIE1dOsbMNES/+vMaRahkXbO2LC8jP?=
 =?us-ascii?Q?fTzHGaIayM4NHSwSPUQl2BuucuSqWGVSN/0jI4WSosDQv1oKne8ZwftMDcap?=
 =?us-ascii?Q?SrZa5HQr11eZnbKLqNcN17JNAdfNxIEblQHgtiOvFT1+44eJwS6W/Kvr5qaj?=
 =?us-ascii?Q?MY3T8YX08wstzHmpUVHlGAFSCMaMpjcW39Kz6Rza2QTbkDiFh/ZJW2P8dCyN?=
 =?us-ascii?Q?TR3lvvicq2ZAifVHjGkf8GznzQyS1cW+MehMcJAsWoQNCwAsaA2N2n9gMKJl?=
 =?us-ascii?Q?gj1DLlpVGjRyG/SptCzWzJxpLtL1nriOXUr48ZmfuhFEk6Nx/fU3vfgeflWH?=
 =?us-ascii?Q?RhLNs7e/n42h6wLULv4m41Nq4Rfrm0/lvop3rwMqPa82WVVIN73ihpqtvd6r?=
 =?us-ascii?Q?FtsFi4xBtn5CL6KcEIELAe0L+Fwl4+8b20yxImibILl0va/w6yig/6JQw6d0?=
 =?us-ascii?Q?MNwXQE3D0f5R67NS4omGMzVI2zHEUsS8t3TWnCNrPkAVQafy82khAUhpnoU0?=
 =?us-ascii?Q?bBQrdgHkaV6wcqIvrAWElgM5o0eVHJg1zKicvmv12DU8nc478fwG//qnmfdy?=
 =?us-ascii?Q?CvjJAVtP8TflG2YT6JlxCdrgcWXL/JycKBO3aqiZhv4dQOtVdTWjK59K6DJB?=
 =?us-ascii?Q?KjzV48QUyDgMFXkVnXQxUAWZMdodfCoqqTcMWkX04zjheWBWhkseUeX7lpQh?=
 =?us-ascii?Q?GulcZ8Z34H4gEsA0ar+uIoDnO+1lkHLq74kvhJKK/feFscqAztGkEEpZJHfx?=
 =?us-ascii?Q?FtpVl8oZtUMfHQoGpQE65u9kA7bPtKBk5VD7x3Tx6FcQuxbC9P8ae+5Z4t3C?=
 =?us-ascii?Q?bOBM/lnItpDB4bvxEEpBd24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d151514c-cc2a-4b21-94d3-08dd0ddd4476
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:43:34.5429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8Qa2r/Vh717j8w9whQo4ObIHmVDejhiIotNLwZy4/LNDzfFXtJtv3AmWJxWP67E00p5fI99dC5cMiY2rrDf29tHSZr+YiyNzr8q1mj+X9Uu6AlKV4ctZQgP/jM9Opur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9787
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


Hi Maarten, Maxime, Thomas
Cc Laurent

The patch has been created as 1 patch for "drivers/gpu/drm", but this time
I have finely disassembled the patch into 3 patches.

v6 -> v7
	- created as 3 patches

Kuninori Morimoto (3):
  gpu: drm: drm_of: replace of_graph_get_next_endpoint()
  gpu: drm: panel: replace of_graph_get_next_endpoint()
  gpu: drm: tiny: replace of_graph_get_next_endpoint()

 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

