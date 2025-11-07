Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2811C4050F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28D210EADD;
	Fri,  7 Nov 2025 14:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="hdXM9rr8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hdXM9rr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913D10EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Yy9msGneq/aV/wnIMiLgAIBaiC4UIb43FV0dzG60+icWgrlg1zAkvBMZwlrV7z6wZJZtZ9hfh/WfqNYp9WczbnZa5zAK1E4dQ/IK/ejcjMmqgZvL8oeatbGWpaC6IfYYsaHD6OmtAvUlFa6kNmMX9Es53YzqsKcdh4Gym8nhblrEZX+TpeUx8fBxK/hsujSD4kan1WX7zIHcfQrNxzFQtn1+cCnvqzxxvflL1nmcQOo070YPBlqTWNDVpxWi3mV8zIfCTTRBBnEeMfOhVkIh0e/MzehCzdEQSsdDF3Ns4OCUMDUO4f/VKpNShMhHKuz5Kgb031sPVolbIMncdolQLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIXHTC9XgtbFLjz2y1mLJahqQ0kR4H2RxdMexvDjsfw=;
 b=LVvpzuCzzHS+VW1aG/oUrk6PuLMbH3EL8kpd2ufqAwtrd+9d4GoIKEUpMkx8+EvH1wKhiK0VcfDbhLW9zYd7MVJeaEl7VOz4RaDZ+8fSH3zscT4woPPvNd+Qd3SNcp7hxKIc/SjWGJ9Olb0JxwXTXjzIaIob51WNEmLcJYjP2zLZ6XsUpWn+R5B62mlogv8bd1UZsT8UU1j/Sh7TBLsgDo8PuYU30TWfOweKHAU8J98SB3ohBpojL+wv+zlGtMAQGoJDi6z/PF0OtQfulsFLghHEQOewQHiIkPbefgBpJM2B3345UDfGa9N66iooDecpQuZlYdIrvvj9SzP64HdWtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIXHTC9XgtbFLjz2y1mLJahqQ0kR4H2RxdMexvDjsfw=;
 b=hdXM9rr80rQNNOB5ted6udPwPqb9Sx0GonHaONCH8au3RMVEBpCE8AqHjx4H7bImuGN3i8jbcsvDHaBLCCOHHVH3J0HKX2HJHyA1YGW4oK1zXf7YaqbzyGInm8qGfPNZ48R4F64MsDHq5AXPuqwZQNkf0lw0TnErAFbo03T5dXA=
Received: from DU7P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::28)
 by AS2PR08MB9896.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 14:25:37 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::6a) by DU7P250CA0010.outlook.office365.com
 (2603:10a6:10:54f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN/cmO///Q7bBNrnpGF3nH05T/jHWfbJRHwFrD0k6wRSNWaTIaf/ak6zy01ukA4q4Tn0Ztm0ziDiE9J/LFOXBj7WBFzas2fqmYEG1qseqoMM9jPYCJD3zJaQuXECWSh//kM1KTMWqtLED4Nk5p01VzHtwVj2jO+fvEd2eEPazjotTYLtc0o7TbkIQvzS6pvBsQvQPeEHIgdyu1/S6CDQvmRTFGKHclk5chges5Kx8tEzxT74B1RLjaSD+a66ilr9sND355bg/aDNpPwysLnaKlHdxecn1nj9+aGInKzTve5mvSHZBWxb3dOBt83FRkguLpWeTWwl87Uy/n7SNCLH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIXHTC9XgtbFLjz2y1mLJahqQ0kR4H2RxdMexvDjsfw=;
 b=fcMVz28r1DFxD0Cf+92Rqv43fz+Ng7RNa511sV1amIi6IGEG/9U/Umj2MuvymEDGVUqWPYTb6SvqkfmpTykOEAw7GZ7TDHHZ+Rv/3Dn9ViaKz7YjrW6ba1O3FEo1ftF58Xki2qJOeLYQ7F23G6wOskJK9zTCoDKpp3Op7M0dVmM0RJRZSOw3RqrHFD3kgVBRFLwA+GjfyfSjyarL6+hkHzekD9BXHQcJ4+9h5I+APtwES29/09P3FEGKTMBuMT9p1iCAkb2fMSYS8nOazzQHRJZimrNOvfSx1LMAWXrbaiE7kEXDt9TRMllG3AVhxr6BBf/58h1cZtaWS5APOjgVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIXHTC9XgtbFLjz2y1mLJahqQ0kR4H2RxdMexvDjsfw=;
 b=hdXM9rr80rQNNOB5ted6udPwPqb9Sx0GonHaONCH8au3RMVEBpCE8AqHjx4H7bImuGN3i8jbcsvDHaBLCCOHHVH3J0HKX2HJHyA1YGW4oK1zXf7YaqbzyGInm8qGfPNZ48R4F64MsDHq5AXPuqwZQNkf0lw0TnErAFbo03T5dXA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9682.eurprd08.prod.outlook.com
 (2603:10a6:10:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 14:25:02 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:02 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/8] drm/panthor: Add arch-specific panthor_hw binding
Date: Fri,  7 Nov 2025 14:24:33 +0000
Message-ID: <20251107142440.1134528-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9682:EE_|DU6PEPF0000B620:EE_|AS2PR08MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: c01f2225-4c37-41da-34ef-08de1e0984ca
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?IHC/njGuBjBGu2rRNbHRo32Mlg/L9XfUURjdoEXZMO9B4Adaz8IhV+xRTNY+?=
 =?us-ascii?Q?IePWmZFHhVzKBTb3RcTRqBm5GJBXrVhiRTPHe0iV9ilzLOoi0ZIds1ood1TD?=
 =?us-ascii?Q?SMUwfGPRRxt1FphYwZCNPBzRWGNA2yNr36rRob/L8GnR5as/y4VyJLLaCZOi?=
 =?us-ascii?Q?ZlRKhQHjDSDac3l72OFL9mIXaPSUa+EIstirYr3S2Z3HVB2uGw7yRdoeuJCd?=
 =?us-ascii?Q?sfmk2qrwyW+wsVl+qyRz2IcJg5ari+W/WJSZUx13/nk8rKK9S3K1w2+i4h+A?=
 =?us-ascii?Q?X6MiRCvdz2i3F1jK6CYS6h2ewW35fkiplimH0GE2kyH2lqcjs51A5Yf+yT0V?=
 =?us-ascii?Q?7y6WkseLBzNXa1wDycZoy4Ly/0KdcrNTBCRuIq2QqCwPgTKPVjM9dfkllEiW?=
 =?us-ascii?Q?kpJ0OScPjsKMUJnabRTQS3ieaM6Bv74sYN4qma0DbuCGjv6NGbNnvmUVtshZ?=
 =?us-ascii?Q?SrFMbCg/il2kOOkyNqetzsUNNEZPhY28ZBLo37Sa0Lnq460gVVibcYZTKmPR?=
 =?us-ascii?Q?H9ftde3rNePU3luggSSXaUInVyP2Iy67blXNyzE4h3v0vu/ZXbXcThe2T3yU?=
 =?us-ascii?Q?LjYYt+ta8bZr7bFVkyRNHhz94qbJYfpL7koPfoAuX34A4VPjo5VsUrblrceD?=
 =?us-ascii?Q?7gKAwDFKPAxznAFQVTwnlfpmvB4x49nlFUF7tKTwUAVpgZh2kFN7Uf+hA1Sn?=
 =?us-ascii?Q?RlXJsmIB18cPQzRu67/stdd4mT6GE6y8pIjxnlE2PyGsaFY336EoXbf6t66F?=
 =?us-ascii?Q?Whq47s1rKfi2JtqSWz3uLUEmQ9Dn57+FOZvLEhU3pvhBZtTx76XDJY+fruH+?=
 =?us-ascii?Q?bfclzaygHVJVWq89USsBscRNLTSuYNYhmOnzx+IcMkCsNU3RTA3sV4OREhO2?=
 =?us-ascii?Q?nEwpQqibJZxtWCmWWncxa2ugf/jbtOLG6nSsIfzt67Xg6Ypu9gXMBm6HaRkt?=
 =?us-ascii?Q?VUd+CQoMAbGGOpsUIDGFWMbbaR/F09JUCb+EqpUSq5QBy8P7iI8Y/xBOMuNe?=
 =?us-ascii?Q?miQdssD93bULJ2SoSEmaaSi0VmML+z3+tkXrZ+4OhijsDXRhi8f4ZguBf5Ml?=
 =?us-ascii?Q?gMYMewKGlopkIQArMalR7yY1CwNJvl2rUX0cGsF8tD6sJvOIJ7f+YynKAVR/?=
 =?us-ascii?Q?TRutdJuzUNMgK9NSEhiuD06xmi5nY6ztGoSyrUse3okBMXl0TDubwhzWyZ4A?=
 =?us-ascii?Q?3FKKkPv92c77cp93JMbnY3qG9O8rfP/vJ/ANF07t87x+BAPC+mqmxnKDV7Ci?=
 =?us-ascii?Q?f2JgPK48BSO9kaAzcTgBsMwBjQWSx6UeRaUjoYMvSNcTn0yy1NfCd4uI9cRX?=
 =?us-ascii?Q?pCOSNxuWgomZWqn5bF+fS458K9v9h9zRIUKGDYWesNZZQhtF0RoSoy30S0yI?=
 =?us-ascii?Q?MdJgpPHOKfjY31KZgm3oQvODxazRfNLmHmUFjzxxazjijOVd6+Q7wMJhUSwy?=
 =?us-ascii?Q?mkPaN/FAHHsN9tgL5gXAfgKyH+/G6b7V?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e395796c-7dd3-4583-e237-08de1e097044
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZOX8Wm7UVRndkN0CYJO8EEjMbAMKF3BqP9/1/uh+CpxOZW4ZuHksRbYyY9zt?=
 =?us-ascii?Q?AtUP21KOu6RYHzvjjYXrDuPg05O4SKiWeFQDsALV3CP8CxazEtQkkpfBpoML?=
 =?us-ascii?Q?df2bynSOd7SrbK5aQsmI41mOyVFL8/JGGPg9+1p1dqoB0KiDBLLwdqSXU8Q6?=
 =?us-ascii?Q?KYRFd49QTzwBdowIxhlfc3nLeq/X0NgFQzRG5/QIBnkBhmhL6qpvNyhVCcvJ?=
 =?us-ascii?Q?tTlel92W8IQRqXN79V+4KQ/LPkzy6toBCGcSBEAc5cVCN7AQUFC1reC37pcy?=
 =?us-ascii?Q?KYxCHMeTvgYtH8pvUhyEr7eFPy+9y7KyxP5okYgDkKoJHKkdWFpujypTCJL4?=
 =?us-ascii?Q?FxxZeJZ+ihvB12kzrSYxcFHADpoH3nPM2lnjbhN+FoqM7pyqEDO0LHF2CR1L?=
 =?us-ascii?Q?ywY3d6jbUHxsqJZD4ItAvHsujGKk5BlxawmQKqmJhJ73S9YY+rNhl7SeVvF4?=
 =?us-ascii?Q?p/HeZoxYOo6X5hvdSFVXwPVC/zfOfAOvy/gzlFOsSTlhdUuVMpZ+bwekITy7?=
 =?us-ascii?Q?dmPylP9UZG2a8Ib6p4kwVchGEtAQ0vWrc7z+sKIMJRJNPmG1Mu5fRbNuKb1Y?=
 =?us-ascii?Q?v1YnbSJTdcCPSxPzkog3M8qGcwBJBPoP1m9kyGMv98yY9LG2mCtvsLVTQ5Nf?=
 =?us-ascii?Q?yCBYfQmBm02X3CW841JCwumfDuwHz1FOJ33/cJzThllzOnMzfjReLy3MNm7p?=
 =?us-ascii?Q?qoyZ0Mg5tT21qy0YDs+F1P1bb9otWS88xEOLcslR1hL/mhr+KTLE6TywbHW6?=
 =?us-ascii?Q?UvKmmz8wuxBvzcBHd/Zt3ivYN8Dh5qBynE6aWFUDb76GDN4sLMM8Ysj2GFW7?=
 =?us-ascii?Q?w+RDcFA+r3314tUGT0WPiX7l5VaMptQZvLdIlvzJ51LLUZ13QEqg7lonxOGz?=
 =?us-ascii?Q?w/3vhZ2JkpRHssL7/dPN1bvyZ1NZrSAvnrXtANS9k6o+m6Tn+fPbAHlSNJVp?=
 =?us-ascii?Q?hB+gJPzgAWVMHUoQs7xL7SY2dWNmRlNynO4n3sRTfK3fNrNF9dliAbOUfJA+?=
 =?us-ascii?Q?ndXMbhhrJhZI8uWQ8efP/Sszh+AJ72Lr6q5Zwa2GbUNYc/rso/HLn1NxJoMO?=
 =?us-ascii?Q?a1wjPczZ2SYQ7SJoqU1xHzmud2jkuEmAmZfVjqW+WWwSldi0JPzsSmBIOzBb?=
 =?us-ascii?Q?vHewpQoIkowTugqH3YCI0rLexA2J6kD+mtm31/nJdRSRO61TRechG0cfAPks?=
 =?us-ascii?Q?4tQbdGn7SkMuxXvSFzqcOUqLbOMX9FpWro0rCfil+w+aL9A5X0jw4/X4g5ci?=
 =?us-ascii?Q?MOApvDoqt7ULsPdfODEiApNY8+p+OyG0PYngMv9hR2qmBAV9Mv1Y/F0KsNgc?=
 =?us-ascii?Q?Hdb0jAvc8sz5vqAT0SWScmvgc+9tKXrCCgOjX3VWFBfWY6wbIELugw+w2J9y?=
 =?us-ascii?Q?06l52anoyGiIalh5GFI3yUYSHVViiY+hkMqRfnYr3jDRreCPa8Lrou5fcRZX?=
 =?us-ascii?Q?qXuj5lAq+DmePAwgaXyl9Pwe8vXn9YXTdHyrL6xXIJPL71f1kwjZn4gdF9qQ?=
 =?us-ascii?Q?XlAdfGOWNyaCmaX4m8JBzHeiMbkGKZuuX18oR2MpNOdIvStUTJvi177MQqd5?=
 =?us-ascii?Q?sKkNRxqvSmbq+e1z4O4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:36.3442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c01f2225-4c37-41da-34ef-08de1e0984ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9896
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

This patch adds the framework for binding to a specific panthor_hw
structure based on the architecture major value parsed from the GPU_ID
register. This is in preparation of enabling architecture-specific
behaviours based on GPU_ID. As such, it also splits the GPU_ID register
read operation into its own helper function.

This framework allows a single panthor_hw structure to be shared across
multiple architectures should there be minimal changes between them via
the arch_min and arch_max field of the panthor_hw_entry structure,
instead of duplicating the structure across multiple architectures.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (PATCH 01/10 and PATCH 02/10 in v1).
---
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a764111359d2..1457c1255f1f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;

+	/** @hw: GPU-specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4f2858114e5e..b6e7401327c3 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -8,6 +8,28 @@
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))

+/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
+struct panthor_hw_entry {
+	/** @arch_min: Minimum supported architecture major value (inclusive) */
+	u8 arch_min;
+
+	/** @arch_max: Maximum supported architecture major value (inclusive) */
+	u8 arch_max;
+
+	/** @hwdev: Pointer to panthor_hw structure */
+	struct panthor_hw *hwdev;
+};
+
+static struct panthor_hw panthor_hw_arch_v10 = {};
+
+static struct panthor_hw_entry panthor_hw_match[] = {
+	{
+		.arch_min = 10,
+		.arch_max = 13,
+		.hwdev = &panthor_hw_arch_v10,
+	},
+};
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
@@ -62,7 +84,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;

-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
 	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
 	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
@@ -117,8 +138,50 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }

+static int panthor_hw_bind_device(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
+		struct panthor_hw_entry *entry = &panthor_hw_match[i];
+
+		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
+			hdev = entry->hwdev;
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -EOPNOTSUPP;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!ptdev->gpu_info.gpu_id)
+		return -ENXIO;
+
+	return 0;
+}
+
 int panthor_hw_init(struct panthor_device *ptdev)
 {
+	int ret = 0;
+
+	ret = panthor_hw_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
+	ret = panthor_hw_bind_device(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);

 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 0af6acc6aa6a..39752de3e7ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,6 +6,12 @@

 struct panthor_device;

+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+};
+
 int panthor_hw_init(struct panthor_device *ptdev);

 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

