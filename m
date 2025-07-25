Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BFB1207A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3991910E454;
	Fri, 25 Jul 2025 15:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="iI7magod";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iI7magod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013020.outbound.protection.outlook.com
 [52.101.83.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E3C10E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:00:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u74dNLTBCpMUEq03T6DuM9nxQUw3xPKBI5Ji228I/Z88KFXdxR/D4fpDfbTNLv6xupuqVDLHViLrrHk3QW3z6KF1Mp4noAklrz6BOlm4dveo01P4bDp4HV/LvH738tAS4RZnAkxMgWvL4tQ7Fm6yZY543vsFpBtF1xpF8fn65vCjrI75CF3+pYDCt6H5HGzjc/zcgL/sWdysTHqGtCe+8L8frIxvhAbdSJ5wWO+eeaJHb6Y45KUDaNpBODNSDwTP9Lb3G3SkcPp3Dzf2kv712Bh9XB2cd5EfpswLI8SrbZ0lcsK9CAYlEHocGdilchhqyEjtJQF4EIINZJvCfCc/zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPJp1hIV1GxzsplNY1cPYsqzmKSp+MJQHGpKIaYHs08=;
 b=jYpR24blaTw12HQBwk3viS52qHWIgvDtjhirx1TpWpBsmVcl8w3vnrdMxYt6Z2Vx4xck/pOfVfoc5AQmw/R+LSOLiW0nesD6fHhbq/FBKbSgUZRDJZQISpTrH7pjBxnDK60TaXqPQIgYMk3b2FNv48RblCRBFSFdY7xrCKrL3YQwzMGYeV8mb8aNiy9R5n2xJdODWkVCi2Srglv4d3NraEK2Qog6CdvtYCkG060PJFsxITmmJMaehdHOjzWOepj66OL+NTZiG3wjyBrVafC+DLjXuA2J16jWz8aXCiVkvyDrX71rPzVmON9k/llXIfeBQBSony3vh1WQqQi4aJbyjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPJp1hIV1GxzsplNY1cPYsqzmKSp+MJQHGpKIaYHs08=;
 b=iI7magodbmiHt8wVs9LbU1K10paTK1wuJUDPnF5bU45z+eh7x5TrWqxfqjXv2gk6j3xbuN2ZK0L/TNdAHRIVY1BqkZ4f0tOOsYECZwzIUuawDxA+Q6NoevSOVu8XiBnJKX7cgK7WOuZwUHYUjuNZVZF13N5ilt8HJVKQIeVXCg0=
Received: from AS4P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::10)
 by VI0PR08MB11064.eurprd08.prod.outlook.com (2603:10a6:800:252::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 14:59:59 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::97) by AS4P189CA0019.outlook.office365.com
 (2603:10a6:20b:5db::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 14:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 14:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ8ATXjWZ/36ENOo91Lpmi70qxUJTmefNLnCfTaYisEgOvm359Gr17lPVT2cZLqKEa0+MVRC8mVOWSunifIhrBEY7Ii8ekrKqjXUCb7iVVjh7ekaLZT96Um/CVR3G9QaiNd2sB7KpBZnPnFjQ5pD7os68A0evtFEGmsfZgyfceLiyUmoo7/55C5L+qH7uMzStGzVo8TlQWC/Sj0Bf8iEhMybT+Q7r/l/yMnydqI63LphPrmF9HdjwVjpKwmvn/waLw5HyU9pCgL7hjmpOBf9ZBhuRfzljOX8lkmCle8Wt3tgO6vOmVP9I/oEiVAQc/0+C4dajDAp3ZFSqxKz4+23zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPJp1hIV1GxzsplNY1cPYsqzmKSp+MJQHGpKIaYHs08=;
 b=JxEdC4zs9pZjP9ma+v6X230blqAnjWSgXS4j2SUWSqDCS97Gc4i+jNaFvah44Q5m9vcUpMFj7FntWi1ggeCBEiR6vh156hxXv/EnlmMmlvKx9uiUh4tz3+f0khOkVCTZ+EtBEt7Z0Oweb+YrB9zlB/XgxR++gqbP5V393wPvqsoLE1imLNlbayWenzVuVV6Md4Ohb1i4t01sUB6TVAJqCkbukRtoU401Ft8+fmIpksNnT1wZ1BUYly+OZRHMIxbga33+FL34xXO3jpJYnF1RAGLWr8aOikuvjuZinCiUnfCbbFhFQC6kRB0Fl5h27rpCtshZpn7u/Dn1DKiFBCN7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPJp1hIV1GxzsplNY1cPYsqzmKSp+MJQHGpKIaYHs08=;
 b=iI7magodbmiHt8wVs9LbU1K10paTK1wuJUDPnF5bU45z+eh7x5TrWqxfqjXv2gk6j3xbuN2ZK0L/TNdAHRIVY1BqkZ4f0tOOsYECZwzIUuawDxA+Q6NoevSOVu8XiBnJKX7cgK7WOuZwUHYUjuNZVZF13N5ilt8HJVKQIeVXCg0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:27 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:27 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 3/7] drm/panthor: Add panthor perf initialization and
 termination
Date: Fri, 25 Jul 2025 15:57:54 +0100
Message-Id: <7674845a8c23b379c67b5aa279a29b3963489d26.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::11) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|AMS0EPF0000019A:EE_|VI0PR08MB11064:EE_
X-MS-Office365-Filtering-Correlation-Id: 776f866e-f454-4fb4-7418-08ddcb8bed21
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?8bNLXmTnEOD7XZXnBkXNYsAYJb7SLvGcIL/MVC3EYx9p03EgWPZ533RGBCFn?=
 =?us-ascii?Q?S22XqQAot3Pj95FvpWmNCmHG1gtWz8HF0+/PCXCVOMdfoKq3SMAkk3tYTglv?=
 =?us-ascii?Q?79gntLrLQVZwqlzbGWDJHWGmhRnmHcvgYDkmI6toiWSt/sSIIMEjrH/vEGCB?=
 =?us-ascii?Q?FXaQI2XtpQekaVW5Sy5xGIpey9r70BkygCFjDOa8i/C3BZhP8GtEsataUtc4?=
 =?us-ascii?Q?KWPVEeuf+RnF3dBBkfFtfoSVscwf1uzrdEgTJE9gLCLh50cA5zl5N/6HtZF6?=
 =?us-ascii?Q?zd42wpl+r0W+0Z5iGRfSk/QQArjIBoJHMCF6Ut3g13xnTWZJVALNoMO1w0/5?=
 =?us-ascii?Q?NKg4y/rjBpAKNH5FHXwbAgXJBU5pbQhpPU+YLpo1/dlIV65JdFGGwCbVhH0B?=
 =?us-ascii?Q?0kW82zzf6CR/mSep5tZ6mZmH2oIoCDhjgNvan3Antg+uN7y4LJKMdMr+H0Yb?=
 =?us-ascii?Q?XlCK40AvNp5X5azVclg05eEm8o7x9fXJb8J0S5IMD0wVlTFEoI+G1lEl454S?=
 =?us-ascii?Q?I1TynF40B9kWhRpgHd8AfP3+naFf6yw0Ze9OsOAJ0fcuL4hBDP4gEiC+CCWh?=
 =?us-ascii?Q?cCzeNkIiGBIqAORVeM6nIf+yOUZJGsfweMEED/jmNRa6i+w2ToFDPJvjYV6Z?=
 =?us-ascii?Q?otzVQKdgZwDont7pe7IC0Cc5Sx0oxoWl3mXSmdsja75KW3cMTPbF/YitbLf0?=
 =?us-ascii?Q?wJosqvuYGO1//NB8pkXvqiIVsPiSfoir0Fv8yougR9pCRVPFeoM3Uuz+yrv4?=
 =?us-ascii?Q?Fqe3rDEWEljgirXxK75d/ILVNGNd/2ooJEgp3BTTDrQzTGzVJAf4b1AOU0mR?=
 =?us-ascii?Q?LKfdHchDcWxbQZH3pr+hOV7bokOvrHHNUZL0hPKVcrN00Ld140uSj4vwEfLI?=
 =?us-ascii?Q?TMxxjSph3AbgLiqQl14XNnqbr3UWHDrcwxPvNBqJCq212y257Al8sV/9PDrY?=
 =?us-ascii?Q?Vqmgvc3beP1qN+GgKCQ3ovO+0QluRv5R8v5BhLX1KO8rnDXZf+bZQbWocnCc?=
 =?us-ascii?Q?hMaVt2WSxqZZYAyq7TCjKD4DvYgyjCKB8u+kWo+BJk67wXImGf7+8ReGyrcV?=
 =?us-ascii?Q?tM9NNPMVJlkqkAQAyre18pUBT4WCgpvWbDkkXiKvoVtpJyoUzsuQdfJsaALr?=
 =?us-ascii?Q?cvrURocezbOY4iaiIPq83X3EbZGCbWDkSUVan4QdLvqa+/7qCz9NVVJQunOx?=
 =?us-ascii?Q?J7n5365mGavS9NBVbMxY+9biNg+ME+kiUeUQIeyNQNT44qGi6ZedvL2T28N4?=
 =?us-ascii?Q?2k9sNstIPRTZRp7yrmLBQvOlDFfreKq8YHkJ7AEpo1gbW8XJcGl5FNGF3cDK?=
 =?us-ascii?Q?ZhTksNWAMwouRelIRf7nBdf0raSSLUJuSoVeYi3k02fMnXQEFBJccHBqx7AS?=
 =?us-ascii?Q?JaCvicgbNqAf966yy2hAw2Vhi8YJlV4wNGRZr7MtagdHQm+3kd6ai/ZYE5an?=
 =?us-ascii?Q?2u17jjIwycE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8e3a0d09-9c3c-4098-c246-08ddcb8bd9ff
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?otpAXtFME4fmTXkWlHuPxwACnCXN0/T4oAJAedLGgluVknVUv39MD0AtKBnc?=
 =?us-ascii?Q?JOGdplfKxVesHx3hkSQ1zCLE+bZvoEih4TQS3nt29UTX2tj2iJYJCUFJxD78?=
 =?us-ascii?Q?h0B+xV3vKEVWbQS5JUGRMJbz+WEcgzqGqQ3ZP12IDrcORSnKiUsVyjEzNEXN?=
 =?us-ascii?Q?GsmLX6G5lM4uUkWs1jaGkif6DI5f6jFxE1QtYem0Nb/FwzVmzR4CuvlVc+vW?=
 =?us-ascii?Q?810yJQbK3CLYaJV3VroNva6c1fXRLuJzlMrtp9Q1fljH8Bshk9V1V2VzPAQS?=
 =?us-ascii?Q?ct4UHP9CKMFkjw/MmO08bE6PxyMi2HGoV5b6W1T4vVE9fKJRNF14E3m2dOJh?=
 =?us-ascii?Q?xx+Tm+pFcsT1nioFcFxl4rpNd3zJIRfrH0FF0dEe4FWxH3mzT5Gbmd5YtDgI?=
 =?us-ascii?Q?gGd4SkQz2nx85ACLUHz12qk1PAttB2l0I+14JbNNHOUE6AmpL/juY5ff3Sp2?=
 =?us-ascii?Q?prDnQW5ilRxl73/cOPSA6AolT/hF3qF0h86Xc9CFLiOFjbdjiYRW1VJ3/UYR?=
 =?us-ascii?Q?nShcIIhMCj9ymQEJHfJ7UIFPFoxRg84znYeH+VTQE3SAAKx//CBsQRgidkny?=
 =?us-ascii?Q?rzbX87/ZburfU4QDRTNvQSBlAl+9QBYkGLSy3GtGuUmijBXfzuUYlxSXrKsw?=
 =?us-ascii?Q?NXmdsj0yrCKYtu82bAElIRW2TAHpcFofh8DSNR13ZSMNx4jgYRe8tj6foPX/?=
 =?us-ascii?Q?IU8VxjofBzprbejlAUP+vrrWpcG8wCC/I4SQ40chE2fkEaiIz+X21F7ZT6Hz?=
 =?us-ascii?Q?8yBAK6FjQbquoj7bC51VAjoIhlvmeHeuMhnw/Vn0H1+k0mSznbimL3T3Wper?=
 =?us-ascii?Q?+1ot5QFTYDbue9mWipdlcF/JxvyxLdmnj9g78f8cmRwitcRqZavGwQ9QlK39?=
 =?us-ascii?Q?at0Li0Ef7q81jiJaXuJ7vmMlRGXpdQit7imu6W6Y8fcnQvzobRifcqoocQ9z?=
 =?us-ascii?Q?G9Txeevw2CgsbKMAwhG6duIJMUTU6BNXtxyfTnt0/addHoRRqAOk9jhMNW35?=
 =?us-ascii?Q?pnIv4XspZGXtLc3uAQXYVaEfC8+dNB6amMKym2XAsPWA/sbqm9ald8imhRxS?=
 =?us-ascii?Q?Ueqoz2H9LTapOqLdleZgfRCe0O1NaXyZotG8xgbcO8+RcsM3oj2HGdjsR3ar?=
 =?us-ascii?Q?vKtlUkJRqqLi8d3bRMensTf7G+rEM+kdYd9wfZ0PDKy3kiqEMIroSk0hs03c?=
 =?us-ascii?Q?BEcJUD87HC3g8KGC9aSrwzn5UQQx+DkWUP5lb/+5pTkO5+VeaOzsZlHcXmqI?=
 =?us-ascii?Q?bQDNdJljI80dIi//uLzvj/MVmfriHB/QrZVNJaLbngSF3pSin6bA2NHjrgw8?=
 =?us-ascii?Q?Qxo6G9l7yj1q4OVO4ti1MjdMZzQPbJdGbvCpGQiLfgaFNuCO1Vi+ksuyCr0E?=
 =?us-ascii?Q?qmxI37Cv5LOFD+6hkGQXJgnzFHfDUePxM7P4dh6LusuK5W2xWKE5hE7GW2q8?=
 =?us-ascii?Q?CTl8hTFMKRcaPv/BP7lBl0mvHis9/r0Hy5ClAA9dHTt/UxtHYjob2NYAuKf/?=
 =?us-ascii?Q?UGpoKq/A8dRWbIGYNxiGlmOHK5sXWfaSNxRM?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(14060799003)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:59:59.4673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 776f866e-f454-4fb4-7418-08ddcb8bed21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11064
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

Added the panthor_perf system initialization and unplug code to allow
for the handling of userspace sessions to be added in follow-up
patches.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +
 drivers/gpu/drm/panthor/panthor_device.h |  5 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
 4 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 15ab329722cc..ab3e65cc17bd 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -98,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
@@ -282,6 +283,7 @@ int panthor_device_init(struct panthor_device *ptdev)

 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+	panthor_perf_unplug(ptdev);

 err_unplug_sched:
 	panthor_sched_unplug(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 720d39b9e783..a31dbc1919c8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -27,7 +27,7 @@ struct panthor_heap_pool;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
-struct panthor_perfcnt;
+struct panthor_perf;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -138,6 +138,9 @@ struct panthor_device {
 	/** @devfreq: Device frequency scaling management data. */
 	struct panthor_devfreq *devfreq;

+	/** @perf: Performance counter management data. */
+	struct panthor_perf *perf;
+
 	/** @unplug: Device unplug related fields. */
 	struct {
 		/** @lock: Lock used to serialize unplug operations. */
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index e58a62ad7988..af1c58e70a78 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -10,6 +10,19 @@
 #include "panthor_perf.h"
 #include "panthor_regs.h"

+struct panthor_perf {
+	/** @next_session: The ID of the next session. */
+	u32 next_session;
+
+	/** @session_range: The number of sessions supported at a time. */
+	struct xa_limit session_range;
+
+	/**
+	 * @sessions: Global map of sessions, accessed by their ID.
+	 */
+	struct xarray sessions;
+};
+
 struct panthor_perf_counter_block {
 	struct drm_panthor_perf_block_header header;
 	u64 counters[];
@@ -64,14 +77,61 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
  *
+ * The performance counters require the FW interface to be available to setup the
+ * sampling ringbuffers, so this must be called only after FW is initialized.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int panthor_perf_init(struct panthor_device *ptdev)
 {
+	struct panthor_perf *perf __free(kfree) = NULL;
+	int ret = 0;
+
 	if (!ptdev)
 		return -EINVAL;

 	panthor_perf_info_init(ptdev);

-	return 0;
+	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(perf))
+		return -ENOMEM;
+
+	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
+
+	perf->session_range = (struct xa_limit) {
+		.min = 0,
+		.max = 1,
+	};
+
+	drm_info(&ptdev->base, "Performance counter subsystem initialized");
+
+	ptdev->perf = no_free_ptr(perf);
+
+	return ret;
+}
+
+/**
+ * panthor_perf_unplug - Terminate the performance counter subsystem.
+ * @ptdev: Panthor device.
+ *
+ * This function will terminate the performance counter control structures and any remaining
+ * sessions, after waiting for any pending interrupts.
+ */
+void panthor_perf_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return;
+
+	if (!xa_empty(&perf->sessions)) {
+		drm_err(&ptdev->base,
+			"Performance counter sessions active when unplugging the driver!");
+	}
+
+	xa_destroy(&perf->sessions);
+
+	kfree(ptdev->perf);
+
+	ptdev->perf = NULL;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 3c32c24c164c..e4805727b9e7 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -10,6 +10,7 @@
 struct panthor_device;

 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_unplug(struct panthor_device *ptdev);

 #endif /* __PANTHOR_PERF_H__ */

--
2.33.0.dirty

