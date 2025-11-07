Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C869EC4052A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E86710EAE2;
	Fri,  7 Nov 2025 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="f/uCeP5A";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="f/uCeP5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011045.outbound.protection.outlook.com
 [40.107.130.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F4A10EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:26:05 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fK9wX3iRTphCiejfO/OS+CJ+6Gi3V53ONZRUfHk4zA7RldEN1VZiYs4aB2Tax/hzfyGgvAqrIUirESfZJFiA1/GLsl1WjD+TRGTPvRLdpj/28AruUmJR57V3WcE4F3fAXyxVQoz3rMImxlVtZZA3XVSQeMW0S3NkBRLgmAq862uzJHLxgKRE42/l8PVn86Z0OgorBSOZ/ODgmkd5zssDQp4SAlzFKVuNRAkbhuKppdljNFQAxupQOo/Y/oXbV6euZeZsruVQmj8gkT4lLDh2NS/iiL1I2QNBMC4lD9j6QcWMCle5lJz2kbBSNTn85DQp6o7VhZ+2XKJ7HcG7WhKiOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMAh1tjPsrlmYtEEPBbH0RkLV3sFJqtzeAb+QsGJki4=;
 b=yII/Q2p6rSKWGYPQmL366Q+Xy/TY0I/1lBOliq/Pneh1Q6q8ql/ecZc9fqTHbfaMlczBw3HARA+N/y0HK444VDuJjPE/Vk1obbB0ztqvAongo5EnB6vReLIFsJaR1weSYSlFY0vLyiUzCMKurGzUSQ3TPIyS51ls9J5Vq8Cs5WelkyG0PfX8DS3XL/F579ExnGPSJoV7OgkFf+ABK7rh5I/JbB5LR0vel1DgJfpEDYqLsV2mtwv324W+IfnFsTZEK+WLgFmTFJpbjFuc0EHLBAjuwLVgf+eJec6eoZ664NT0RcmTBQ3gAyGpvP3T73g5mlS/nUpEFPAUfL1ToBGUxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMAh1tjPsrlmYtEEPBbH0RkLV3sFJqtzeAb+QsGJki4=;
 b=f/uCeP5AzlDu8J032qyPnUqDUibMiofaIbgYFO3ob/tCRXz8SEy0TA6qX1P1kuvV5NyMUDRSYwQp7LV7kZlFNMbd1bEsrwhaRfRgxiteOGj1480f7qX4n+GiY0rMuc3BNAkLYu/8ZeGrepVknQWzF4XcoveZYnZsQAOMukrbuvI=
Received: from AM0PR02CA0186.eurprd02.prod.outlook.com (2603:10a6:20b:28e::23)
 by AS8PR08MB10150.eurprd08.prod.outlook.com (2603:10a6:20b:62a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:59 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::84) by AM0PR02CA0186.outlook.office365.com
 (2603:10a6:20b:28e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Fri, 7
 Nov 2025 14:25:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibHjn47tNgpHXN1AR/7uAVn8NI16IzqN6tMY0XGoHm2XZG7tYYqA9cKkHtnBYp6F8oxI06yXXcHpyKhVXCrGVX6fcOQiVl+452/NOodXt6sPY+WY8+7k6qtrCxOHCMsPVnyMdfDKhBwkQagT1YSP6o2e6l8gwnt9z1/P6QsIQ76Lc+zLCgCsmUa6QicDVcnE3l8rY60LNk/5okLGhVOz+OMPJKBJrEV5d3YTloYQdYY/WlILcV361hn3m67eeytNkm+1Ez1q4BhqgeKIVX8tSzBmWj+BXL7GbrXEVFGvhksQYt5RAypYMYaO2b619ofHZUvPlxGQF7BI1O5VoypviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMAh1tjPsrlmYtEEPBbH0RkLV3sFJqtzeAb+QsGJki4=;
 b=Mg1al2mf+s/Zp7+KVQUYldurUaTHZzJRLi74m8gIrDTIXz+QPBFKH8781tPrjD/89rPyBaTO8oeHQfer42a+7bHApudHH9krg2DPW5eH5HN1hfJytKuapCN1z4LLl8orTErzNkpo1N+VEJc/lHqTEGALsykNMXljmjKlZkNTb4j+AloSewk6ObaOAiNavs7Y8d916gZY6OpzpaJOSXxCnPRmiFXfsz1ZmnmKk5ZcVUEpOWhv3Wyi4GfdLMvNXeAb5gAKUjVPlO6s4HaK2WxqAdiOi0A46Aeb5sxllleY/yUz/onfjiSFk/47gurvQwVNdr25Yy47HsdEoDsC43lsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMAh1tjPsrlmYtEEPBbH0RkLV3sFJqtzeAb+QsGJki4=;
 b=f/uCeP5AzlDu8J032qyPnUqDUibMiofaIbgYFO3ob/tCRXz8SEy0TA6qX1P1kuvV5NyMUDRSYwQp7LV7kZlFNMbd1bEsrwhaRfRgxiteOGj1480f7qX4n+GiY0rMuc3BNAkLYu/8ZeGrepVknQWzF4XcoveZYnZsQAOMukrbuvI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:27 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:26 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Fri,  7 Nov 2025 14:24:40 +0000
Message-ID: <20251107142440.1134528-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|AMS0EPF000001A2:EE_|AS8PR08MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dca91ad-d9c5-4305-de9d-08de1e09928e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?1t2gzLZE7s02OdXZpDOqk1tOqs+N8a8DggMprjhY9rUD9GFl1IcsuAATNzsP?=
 =?us-ascii?Q?/z4VblaU6ZnqGErX5kCAB11HgjHelGOuJZKSOkP9DQRqcmrTVOB2oAGOah5h?=
 =?us-ascii?Q?aufmKA2u7qTmZ+4vYNhha1hTYIAZX1y0gspcbJ2xta922hDxNJ8FdcWshU76?=
 =?us-ascii?Q?RuxSlmXr/IAku7aKtVqWUBVKIt9OhqcWX9wxw8W4aImbvFP9O1UJ1PdXieN7?=
 =?us-ascii?Q?M9H/U14/d6sHH18tTkzuTskZWCBkzuul2TyGNRSM5hRh0Pb7ZWZDPlIb3WLU?=
 =?us-ascii?Q?mLm4GM+os+FB0qma4NGbkpNAN5na9g770hkpT06txVbxLjh12D4bE9qfGt0t?=
 =?us-ascii?Q?AP8pcDiRE8cWfYa5lnDZNzSLLKN2y+mZ2ZPKAqJl+plhsiKF6Ti4613MqbQx?=
 =?us-ascii?Q?8DCOi7ftSKTnxt3x8LlTt5hx26NoX1iCPT5971J1WAAy9TEYrCFpCYC24usi?=
 =?us-ascii?Q?lFd6Fl98V6EIRw+7POBrEpPU/tddmoxCyMsHrcMVtb+zYlY6tyihKD+HSrfT?=
 =?us-ascii?Q?N+4bAQ1zE8V5ozg9OpGB/bYJxT5+EbSUrS88wKuJFvK7UAm7gvdKJsCTzgWq?=
 =?us-ascii?Q?v9MoZHOWs+Qmi1OBWYqJi4gqRZChYraFF3z3JpDHIdaTxe5vzsJWsYOhtUyS?=
 =?us-ascii?Q?Jm1kYTqNCwDkvGmVNr1VH7Cf6+wLAy3RREBXw0jV2xyeYxZ3a/wSGHnqURPZ?=
 =?us-ascii?Q?Z5DOUdQ7w0xTUnQh2L4UTDyFBdGMuPPpSHDo1+w6/GQ7fBl6BQWztHe2P05F?=
 =?us-ascii?Q?HbVLkw9uCStgHnOmWinQy9V8CBfPGIdHl6+GX2LMLhpiVRjYZfpFdtyqaSWf?=
 =?us-ascii?Q?LyJMx4XTdeR0C7AK7GqVFvd4SsOYqr2frgZV8XcAGXb6FPqNlqGDrmOQYs6w?=
 =?us-ascii?Q?RxBJajWNCrJC0fnGFRx6JKlKct7u/EWFfEOViWbEWrvDduxJTJVeWjbDkxr3?=
 =?us-ascii?Q?NFgeABZ1vDuF47zU9JHQv4TMlx1htFcrJG2ZptdRM9zodYWjB9bVi3AorWZk?=
 =?us-ascii?Q?d+/Ba4a2LC0Hq1r3r+O3CCKpafgIRmLP8AEcAw+EIC+LUpTBhK8k4g0YAHo2?=
 =?us-ascii?Q?0vjRR/2/0NgA7JPP+WHgHjAJrap/LxUfDVBQLG6GwA6BOjv6d3VNS/wPWM8o?=
 =?us-ascii?Q?vJvTRjmtCVepc3R2Pg8NQCD57hdSsjwcguLymFjfQKkM7P0zXPDTcI4UowSq?=
 =?us-ascii?Q?lK6+5DNMBu/uRfNtPS2kJxJZKXwZM9uxB2p1CPsRYKb5jkMhKeVX45llA8Hi?=
 =?us-ascii?Q?zNmGrdpD+KtxYprv0KWUAofqaEHeVWtO58ygyP4cpvRJwf5ul3LYdgfWeOlh?=
 =?us-ascii?Q?ytFxgupN9a+5tN5wDcLv6xHMV/25bhZGCbG28v5ZRlrZoavTcurSVGpeTls2?=
 =?us-ascii?Q?EqkV2QUFTaNc3gtfK1uNHJsPb8H7mjSzbbIObfIgYyl9QhLAETkfxOw206Cv?=
 =?us-ascii?Q?qtZ0NL6+/V+RrWyU884tIxJTeWe/1jhW?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c7bc13ed-ab0c-4f68-131f-08de1e097ef1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vt3dQkN8+AJ1x85xv/vyVn7/c0/NObv0EgarzJPyD79a7GK5hSleJw4RNOpl?=
 =?us-ascii?Q?ll8CoCLrkHHlz8MT9fLngL7u30Ri+KOnZbWSIHJXD7ycBu/oZkvLJdmIWPWv?=
 =?us-ascii?Q?b5hIawfZhrF3/hEKjcFolTlLTvGx1ChKy6vS3fxN23TWKt47INX0UjsHib99?=
 =?us-ascii?Q?hZUUh185bHp2FJvobvMWvULi6+LN9JNUn6MRv66wuOXifYKxJmjwO2HNHSiK?=
 =?us-ascii?Q?kwr2ZBUB0vADyCmJoZ+8WRHpl3xw1kscsRgxEyPQGZM2EdxwYyj6jEwjLnCB?=
 =?us-ascii?Q?7shG9TWDsX1NiE2uYYN0oXrkLG42iwWFLs3oX9AaENR15zwOI61p1iXTgfQN?=
 =?us-ascii?Q?D3Bj5mcSJ14/qZylmNVzoKjMfGQsnRSHty8irNTScDqb44LRwGIzn/GIjQU/?=
 =?us-ascii?Q?gdtwEcGWHhXDGzvYeMtqPcEbnlFfxi3IsCLn1jejzHZSR+M7BtxBsGjc+CWk?=
 =?us-ascii?Q?ZjQu8w2/8DGaXNl5pn+BGNh/5bpsQT+slFdQetwXRN8pUondW/051gjnnkiM?=
 =?us-ascii?Q?xV4dbglx5eH4dHEr8OBRdgVYmVU9eYmo/dDEw/3z1TinZHDCCLKrGJz4wu5D?=
 =?us-ascii?Q?EXn66wBZtaQsi0VoZH/ZIiYHWLvgSTFLTwYzp21Yvbsw1Im+2NQ1gxL2cD54?=
 =?us-ascii?Q?X1uxPXHfEcQbkrUPNeHy7g0z9zSN95Imn8uWdwj7y5SfXBiqihQo8olXhhSP?=
 =?us-ascii?Q?5vdd4lLmC7ZEsLLikv+60jHZqaTeqrineQOWS4svEX9fKgzDPMAAY/LXd35j?=
 =?us-ascii?Q?/YYXwRLyCdid7OScmWIHtiXEKXGC3F3TiSIuWivrc9v92i/CqQL7PytZl+ub?=
 =?us-ascii?Q?zfLQ/mzO3T+Mek02jQaN6C2QEvZLIxOnCtNVX6vve2F10mzJfJIyyqYKbbLF?=
 =?us-ascii?Q?UzOZnsVKToaIkKDucuVJnpP6hKkJOvcjCwLtHwCBSNEnvAAqHI26RgAwY4Wh?=
 =?us-ascii?Q?h3Us40RQNJsoikog3BUv7xF5YaTOqshEKAbMwtK4EdjsSSieCwcF1Fi6vnIm?=
 =?us-ascii?Q?fHPg9NkVdSXcDufyPhbUYOAxCuki9XiEMqhlow+PgfyEoc9hhe7xU27JRLiB?=
 =?us-ascii?Q?0hKhQtHimk4LknamhuAT52WgC0fDx0/k9UvVLjOMbT5DdrdQi74PWonrC18i?=
 =?us-ascii?Q?ArJlv2x2JE93i0G603TjdPmtooTdaiEmOkK0E6HxXYVyZ1Iju2BYAJztYY0V?=
 =?us-ascii?Q?jr+D6HO68GUKI8KkW/y43VRuKDvq62MVktIsThnxiOwLFqFO2+5V/4D0Qq6+?=
 =?us-ascii?Q?Eyb1DiqPrNyiQc9+gCIaqjyRvTN6F/2AvNu0qJDcFiLZO6v1g3cXw/U3+nlM?=
 =?us-ascii?Q?wO757oxe0OjX16Foy0p8O6nALJHBeql69F75qMMqU2j4fRf6gLpEAMPoOD1z?=
 =?us-ascii?Q?8bGNB78dlneOAJJViMuy8QBuYQSMgVYgXAw3HfouJTwIu9N2W4QMuZlsSatU?=
 =?us-ascii?Q?r1S4rKuVV9LNrhL3kPUY9kVjiAmKGjbWok8E0Zxyl2CfOaG7HTsAlvuhKOGe?=
 =?us-ascii?Q?yK/e3bVK9XZVk7d9yEa83Rcr3OHwNgCv4YnSd5SpJow5AgwQRkDT6dRSu65b?=
 =?us-ascii?Q?+DZQkUn2M+OU1/jENd0=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(35042699022)(14060799003)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:59.4632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dca91ad-d9c5-4305-de9d-08de1e09928e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10150
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

Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
panthor_hw_arch_v14 entry with reset and L2 power management operations
via the PWR_CONTROL block.

Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
power domains. panthor_gpu_info_init() is updated to use this block for
L2, tiler, and shader domain present register reads.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v3:
 * Fixed some includes.
v2:
 * Removed feature bits usage.
 * Check panthor_hw_has_pwr_ctrl() to read the correct *_PRESENT
   registers instead of reading reserved registers on newer GPUs.
---
 drivers/gpu/drm/panthor/panthor_fw.c |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c | 35 ++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 2ab974c9a09d..9450a917e66b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1501,3 +1501,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index ed0ebd53f4ba..421369aa3211 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -4,6 +4,7 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
@@ -29,12 +30,25 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 	},
 };

+static struct panthor_hw panthor_hw_arch_v14 = {
+	.ops = {
+		.soft_reset = panthor_pwr_reset_soft,
+		.l2_power_off = panthor_pwr_l2_power_off,
+		.l2_power_on = panthor_pwr_l2_power_on,
+	},
+};
+
 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
 		.arch_min = 10,
 		.arch_max = 13,
 		.hwdev = &panthor_hw_arch_v10,
 	},
+	{
+		.arch_min = 14,
+		.arch_max = 14,
+		.hwdev = &panthor_hw_arch_v14,
+	},
 };

 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -82,6 +96,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(13, 1):
 		return "Mali-G625";
+	case GPU_PROD_ID_MAKE(14, 0):
+		return "Mali-G1-Ultra";
+	case GPU_PROD_ID_MAKE(14, 1):
+		return "Mali-G1-Premium";
+	case GPU_PROD_ID_MAKE(14, 3):
+		return "Mali-G1-Pro";
 	}

 	return "(Unknown Mali GPU)";
@@ -108,12 +128,19 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)

 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);

-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
 	/* Introduced in arch 11.x */
 	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
+
+	if (panthor_hw_has_pwr_ctrl(ptdev)) {
+		/* Introduced in arch 14.x */
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
+	} else {
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+	}
 }

 static void panthor_hw_info_init(struct panthor_device *ptdev)
--
2.49.0

