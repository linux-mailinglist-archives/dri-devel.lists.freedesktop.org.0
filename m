Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C3CBDA55
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3201510E467;
	Mon, 15 Dec 2025 11:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="WC4K7kGJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WC4K7kGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3B010E467
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qH4bm9XiLmdKUxq7RPR77wxVU/pQqHjT+vcOufpNn6DgEJbp/ZNwD19LVMRXjsRi9HRWlO24wbWxfr4OPkC6VKaBS6v4mG7rP9mFOxjw8OVmBKKJqJuNA6GjBw+YUi5rfHdaTZU2/7VmDyzFS0ANWc7uMGzS1ko5IaNXcePJaRCruQEPbeleskW2hp1XLZi4dlNGqL0LArPMg9wsh4rRr03YqPWrzHjlkt+XxS5uKJ636fNpDgQX1jGDge387uP7tWxQtVgWio/y3B87nwPk1SFqx4mZBQUWorWZ8R4S44tGr3Is6EGE2D1gB6JeOVX6jTRVoIeOgelX92vO3H6WjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af1xWpuXnn624A9sFc9UvQ397D7r1iZ7jPBbzqntxwI=;
 b=dRITMR94SaJJrgYTZsDaLRi5WX0H5nn4P4OhaWoSfAkLo+fvEgHbtGYhM72xCiI8dPjKe4bF62UiotJ/DcnGxZmOKxL3XkAmityhWvqOig8lRVCJe7mKrZofKH39mDz8Ef8XWyZASGOn4xoeNx1OTzp36+rjyKXvynqiPlW5A03uZIjPOwykjRuoME8mGv9mwJg2tKko0AegLRIBWxk3SoWi7BRxvC7LFXHZQxB9nR4yEHmlxleIPztDLc4tQiO4nKaKvpusdegyoPY/TUtkp5A4xO0l+wk3w4+sh9APQl8A1fmp1inDaJM562sebPS8eIgw6M8ZAgyiHB8E6lhK+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af1xWpuXnn624A9sFc9UvQ397D7r1iZ7jPBbzqntxwI=;
 b=WC4K7kGJujkE6bCmjxCGX/MggINTSSFssFmhewCjO/n7CRPC49G4Zh030mGaF/wAEP/5ppBddIgd5O1ozdfnrK0l629xOThWiIW+nkX6KqjPmWs7NGx2OzWjf2fzHziXlJEBAAuTuOudsWlcTB0fsdrM91FUfJVMDMwR+fmyYiM=
Received: from AS9PR06CA0355.eurprd06.prod.outlook.com (2603:10a6:20b:466::22)
 by AM9PR08MB6691.eurprd08.prod.outlook.com (2603:10a6:20b:303::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:15 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:466:cafe::29) by AS9PR06CA0355.outlook.office365.com
 (2603:10a6:20b:466::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 11:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynAUoS3km6HADCtWPAcHtNV/1gRsNaoc+XtguvWz8/UzU90lKyNEJep3U0SK8cH5ajsU25KJfuzZUK4EwqjphpMXzAXTM4IlqvYaUPsoGRGbCjhfMgR5DAINU8JfwTZSmOdOIvLdagnYoiXWMBUucCeETga3g901+F58PzW8MikTRweOYz1JBDtbF2jkFTuSP9ZjR0KaD/Vx/TAT5G1p+ulLEuv30EgAjlWlRSz2BRk5xX2JvTAeTv2ZT3cvNcRFWJvEiPVANASY+jurQPriJOgNvRanWvqM+8kbq32kaR3TGePbnxoXV2PjJvnYapsRtD71V3RX5atZbDmd4RZ6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af1xWpuXnn624A9sFc9UvQ397D7r1iZ7jPBbzqntxwI=;
 b=u673uXWgDxoSAoiSLXcCLJMZ4+O6RhGwlVnZ6P/Vr9ZGwUZBW6ncMlpPwtcFVQL6jnILUJxrEL0g1fq3HjMQqz9fAbE4ibYrbu9+2sFQx3xuL7OnhN49boJ0z9HBnfRwnvGs3rKMh/wyL4EPiEn3JkNpiwMrnlBx55PE7/BW69SVIK41vXtskkgBzn8Y4dP1YT3o4DZ9/8zq3e/1n5f7uPbOhbc10AgCYxGMABxrlxGQDwfiqwxngNjBXj1eup08YtZh8ZWLEwGJG/TmdR1vwoGyF/CetxZ780gG4BnA6eaaHzlYh+2R2AsKFlTg2ORTVIHXrbFEzgCRhMIn7801dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af1xWpuXnn624A9sFc9UvQ397D7r1iZ7jPBbzqntxwI=;
 b=WC4K7kGJujkE6bCmjxCGX/MggINTSSFssFmhewCjO/n7CRPC49G4Zh030mGaF/wAEP/5ppBddIgd5O1ozdfnrK0l629xOThWiIW+nkX6KqjPmWs7NGx2OzWjf2fzHziXlJEBAAuTuOudsWlcTB0fsdrM91FUfJVMDMwR+fmyYiM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:13 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:12 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v1 3/5] drm/panthor: Track VM faults
Date: Mon, 15 Dec 2025 11:54:55 +0000
Message-Id: <20251215115457.2137485-4-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0696.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::10) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|VI1PR08MB5312:EE_|AM3PEPF0000A78F:EE_|AM9PR08MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 6985c7d4-10dd-4c71-311e-08de3bd0f370
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?M6ZcvkAzT+IkEP24LDrPvpKu0fnGWuZSRsdiE7m7vQf1K85jklxy+ciKQY5R?=
 =?us-ascii?Q?3kNyKTR3rR+HZ6VLmQY1kVtUrKNPRwoYyDnVTD0jNt/3NPph1E1/b/YGUlLr?=
 =?us-ascii?Q?ij8ScOlJFuesjD/eWe37IGhP3O/V6vRkoEt+qLKCNC+lgfWXc+fAXX1VvsvA?=
 =?us-ascii?Q?o3cj5rKeav4yAt1zD6eTToSriP+Gcoe81cHSXWssLUhoC8/SQceKv7Jj9H7C?=
 =?us-ascii?Q?SFOnHaDB3dkM9tosKFoNvFYOSbCIUEr8ZtUpWvFfM5Yjs7VsuGIgQHnFR9eP?=
 =?us-ascii?Q?xwNJwRd1S200hG+vrcWfrLOmEFgHpkRePBpyQ3CsGBhcVqWjpdF3EIfTenPW?=
 =?us-ascii?Q?rMzlAP2LBYJxcVpUxD4SL2z2FmuNQPo2sZgSvPnjcXkySeqEA+bGTzAd5R7B?=
 =?us-ascii?Q?pbU/D/NUNWSIhG4690ObONAKCUfs37juOMPIe+bGzmh9hfw8DRqgRtMn/O8s?=
 =?us-ascii?Q?VUxBQHv+XE9WIs0KBTrbBT5e2Z3dfqZOwrAzV1GDhyLP36AY2c8r9aBdoqif?=
 =?us-ascii?Q?qpCDuf5/MeUUumYvgT8RgYR8XEHyDgopK6ScEcMqim13ukzxPCDzEV+u56al?=
 =?us-ascii?Q?x9/18kw6EessBeZlaN0zFuvn/AIpnGhvnnESP4yC4tCBAxXX0mXt3hgNrpqu?=
 =?us-ascii?Q?Io9P+58VGxiBXC6yv6eKI4+0hakmKKt90mmErRhV8FTrRp+r8T8PTxBnTLpz?=
 =?us-ascii?Q?At30ABWoEOiNj4FPVHN6hBvhympKcSMiNnresN7prIFUTgsWw8hb0ActlAtZ?=
 =?us-ascii?Q?5ISmjI/7slzhKIHoHPvxcGyU3zyzbf7bAwas6E1dqrEnsSQOYHJPLea/RSyZ?=
 =?us-ascii?Q?HOiLVQvJCiSooUcHdm7osYebYcHYCDo9NZewMGRJLjQ2r+PMGLlCjh1lqPAg?=
 =?us-ascii?Q?4yrbSWhOIn5DxmTEQdnXek1u4bwb0oHIkMxdKRPTFiFFTORTNdZ2r5IKkc26?=
 =?us-ascii?Q?6j0i8q9XLpXItcv5a7/rX/apk9OYgxlZdDx/HLmYLVOsvu1C773iTnoBweXn?=
 =?us-ascii?Q?SvrLxWENFuUOqU2mOwJsa7PW1fBkXl4nVXLZDNfTdddKztHJXjHpc1sNk8fI?=
 =?us-ascii?Q?9g7Q2fiuCGX+i1rLpO9Btbu5CdZyZA5kcISeIgOCaGbdH6Wa1FXv+J3VJds8?=
 =?us-ascii?Q?KTrSa298DyYOnM/o2M+iljA/VzmbLJDuJzOnMZBOM7kvU5Ci89T/Hux/2bKH?=
 =?us-ascii?Q?o7Y6CHAOKCIIDl1T1SBoMIvZ6Cd5v144MYaHCgXbNzTV3sZc8+xtGecQQrjc?=
 =?us-ascii?Q?xE+n/yYf+NJebUq7CB4QcEKCoi9TiCw3p5PZHO2g706WIVrBMnpOsQExZdxZ?=
 =?us-ascii?Q?BpoJrE1zCLUsvT7Ok0rwpUH3ECoifIERto52mm5oMTrxeFHcPB7UpuR5ixbB?=
 =?us-ascii?Q?NSiD5Tq+1sAt+1FVvCkDqAfuL8kPZkrc6vit2De1WnGtSr+cuRcPyeI95rfM?=
 =?us-ascii?Q?mXLDfhzkX47H9aTXfkUdl/UiSReMT2Tr?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bbf2ec8b-ac9a-4bd2-51e3-08de3bd0cdbe
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sbhvj7H0wXZkGoNeNC73LqcQTUtPsAxyYcuQf41NutyXWJYWDy+75ui7FGtS?=
 =?us-ascii?Q?sX6fyynryoRC5pyyDKCt0wNv9KSmEzTmOA/zTaMCicJtndTTNLSIaE8hV8q8?=
 =?us-ascii?Q?Eqk2Hwq86F5xsveJUiAOzWqiSsZab7uL5+4D27I2DqACYJbCKuZmAX3ZkN3t?=
 =?us-ascii?Q?nA1hSc4rGfPyBoP2QD3Jsj/WNfpb16XvoWmMUyYH8l8upYHky9G90V8U/wZn?=
 =?us-ascii?Q?BwsvdsNTXsRYqMADTTkV26+xB7ohu5VwWBDro2uW1BzvIEafnX+tEw1K8l7f?=
 =?us-ascii?Q?+F9hfjOLxVDcqB4p1kkgEhLt3U46X6aTr9ny8NTDunNxu4ddtJC7YzfS7JN0?=
 =?us-ascii?Q?hOWn9A99ulLEswKa7Pn62Y0/bDvRgAeSQrCVw6Mu6Ddcw1rlPpH+/XNby2ss?=
 =?us-ascii?Q?rTjt9TLIV6Sd4X1YkkBcuplXVbYd//J/f0mzTHEy9THomWeRQEP8qXClBeSf?=
 =?us-ascii?Q?cE6MoAAqsHx4vpVWEANdlOy72Zg/amZWwnmmJYD4/LhYPys3pL88GksJULKU?=
 =?us-ascii?Q?2sMJFq1Jl9w4Ub2Uzy9ePqzp+DhbbY5XVSXU1rEklsRfwfRPXFB/1UcTMLus?=
 =?us-ascii?Q?ZlEJM8IRdWppTgqRPhH4EMnDTgKxn7Ht1fw+MYK7ylVps4FG+1CHM56Ihedp?=
 =?us-ascii?Q?u5Icv8t/e+y+gt8i1xDEbgubqmi0n3euRGoSRxsMqz6YRaKdR+y+g7lZaeY4?=
 =?us-ascii?Q?wqZqeznCW1pZxKBjJTr+dUA116QfEu7a4nynWum4zvUxwbvN0n2szUvCDe5O?=
 =?us-ascii?Q?nj1z+utepkFNU6F+iJNbMfHK7e+h79y8BAxjeJ6J6yfWZ3FmXKXlFeDG+QPo?=
 =?us-ascii?Q?VftKShXQ8DCB5J5P0H7Zc4/oS7dNRCshB8C5/habT003eGdWAOgfG5YLCfrF?=
 =?us-ascii?Q?IR4eKO8XAvdRQvmUX7DifCoqzTY3CbY2f1aY+q8TI0uVx9fIkOkQVXQm73Fc?=
 =?us-ascii?Q?Im99tQMuuUMgcx6L6rsWiZUlhvKTsZYLAI1Zf9HWXReVQAFdyGAJauOT5thd?=
 =?us-ascii?Q?PbdcupG/AFXOMeo0Jq6l6ULgxyh0KNDYCLfs6pW8siXTJgxakAO1QtCa85tm?=
 =?us-ascii?Q?ukormuzhCWtSyPx3WVd/SOw+2J6ozqNnd+/NFyj8hg1Iqeik3cFHZgt2nGHM?=
 =?us-ascii?Q?I6zez9vUWxdmLiBU3soSgE2yWG3C3Bn1XHdiOZfbo58mbt+Ag5wAALZZW2i5?=
 =?us-ascii?Q?9WrwXojvfeFftcubxS86DObtLt0JTG6BaiGH2/Z6akZxTXk+b1RV8D+6/4zH?=
 =?us-ascii?Q?MQPE+dX80lIO9qzgPPoVhdsEjqN/0kF/5EttXMLn8OfDP7xdOfeLb7IczI4Y?=
 =?us-ascii?Q?yuLLerTOjlvErFt/GqWq5mBVb2f6CsEbYfaccRTY4G7dTji+ajD+nSlO9OdS?=
 =?us-ascii?Q?oc/HorDBQ4/gKrYlrooz5AHnCxDG5AXBx/e2bJEpQkUscdoW84iIvaFXW08G?=
 =?us-ascii?Q?ITPVmRuxG5dMl6j1QQgJ6qWQS8piA6Hx261epDZO8awzERRgAmaxXg19mxm7?=
 =?us-ascii?Q?7ZFWUMsUgfPV3KACu9GC4h4wHyW6FNw99Mysg11ECx+5n1KoXsvHHwnCwGpS?=
 =?us-ascii?Q?2jTEoL6ISvopgvsGPKU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:15.5773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6985c7d4-10dd-4c71-311e-08de3bd0f370
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6691
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

Faults reported via the MMU_CONTROL register block will result in fatal
faults for running groups on that AS, which will also be useful to know
for the user.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++++++++++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h  | 20 ++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 473a8bebd61e..10a7418eecda 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -384,6 +384,9 @@ struct panthor_vm {
 		/** @locked_region.size: Size of the locked region. */
 		u64 size;
 	} locked_region;
+
+	/** @fault: Fault information (if any) for this VM. */
+	struct panthor_vm_fault fault;
 };
 
 /**
@@ -741,6 +744,7 @@ int panthor_vm_active(struct panthor_vm *vm)
 
 	/* If the VM is re-activated, we clear the fault. */
 	vm->unhandled_fault = false;
+	vm->fault = (struct panthor_vm_fault){ 0 };
 
 	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
 	 * before enabling the AS.
@@ -1744,8 +1748,16 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		 */
 		ptdev->mmu->irq.mask = new_int_mask;
 
-		if (ptdev->mmu->as.slots[as].vm)
-			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
+		if (ptdev->mmu->as.slots[as].vm) {
+			struct panthor_vm *vm = ptdev->mmu->as.slots[as].vm;
+
+			vm->unhandled_fault = true;
+			vm->fault.exception_type = AS_FAULTSTATUS_EXCEPTION_TYPE(status);
+			vm->fault.access_type = AS_FAULTSTATUS_ACCESS_TYPE(status);
+			vm->fault.source_id = AS_FAULTSTATUS_SOURCE_ID(status);
+			vm->fault.valid_address = true;
+			vm->fault.address = addr;
+		}
 
 		/* Disable the MMU to kill jobs on this AS. */
 		panthor_mmu_as_disable(ptdev, as, false);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 0e268fdfdb2f..023fdc79c231 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -16,6 +16,26 @@ struct panthor_vm;
 struct panthor_vma;
 struct panthor_mmu;
 
+/**
+ * struct panthor_vm_fault - Tracking information for VM-level faults.
+ */
+struct panthor_vm_fault {
+	/** @address: Virtual address of the faulting access. */
+	u64 address;
+
+	/** @exception_type: The type of exception that caused the fault. */
+	u32 exception_type;
+
+	/** @access_type: The direction of data transfer that caused the fault. */
+	u32 access_type;
+
+	/** @source_id: ID supplying further data about the source of the fault. */
+	u32 source_id;
+
+	/** @valid_address: Whether the virtual address is valid. */
+	bool valid_address;
+};
+
 int panthor_mmu_init(struct panthor_device *ptdev);
 void panthor_mmu_unplug(struct panthor_device *ptdev);
 void panthor_mmu_pre_reset(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 08bf06c452d6..5aa5e37d29c9 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -178,10 +178,13 @@
 #define   AS_LOCK_REGION_MIN_SIZE			(1ULL << 15)
 #define AS_FAULTSTATUS(as)				(MMU_AS(as) + 0x1C)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_MASK		(0x3 << 8)
+#define  AS_FAULTSTATUS_ACCESS_TYPE(x)			(((x) >> 8) & GENMASK(2, 0))
 #define  AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC		(0x0 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
+#define  AS_FAULTSTATUS_EXCEPTION_TYPE(x)		((x) & GENMASK(7, 0))
+#define  AS_FAULTSTATUS_SOURCE_ID(x)			(((x) >> 16) & GENMASK(16, 0))
 #define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
 #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-- 
2.33.0.dirty

