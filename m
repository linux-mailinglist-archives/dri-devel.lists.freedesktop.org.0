Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3614ACB29F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444C110E542;
	Mon,  2 Jun 2025 14:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="B7LH8wj8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B7LH8wj8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABE110E550
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p68q5kADRCBzcEd5mqG0fqWTwjQRU1Dwa4TyIbg3jdNjtlPTqKFrPTeomkYOR4THVNIcY7+a3rievMUMGxc/cNj0e6nnkLuwolvD/pWhK2WnHfoPBCsU78ZQhhywrF6aTqohKNo2+Yu567bZdW9xx3n/a/oS4PleBOWsOmiD4Xk8qWV/L8t6TNsm/WIZeOoWhUKkbjiW6ovnUD6QDE+0WlnSdr0poQWHyfEY4QxWOPCgDFm5Emey2hQ0gI+k6jT/G7LChiAWiGDy/iOpZd9+nXRfjvhNxJCNrZY9U8xJnU+HB2Dup98AFmsODX+SCJ7rO+Xg0CS14gxlR+GteSWatA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=fbasL7Q7iRq4cJsATU10zukgPCR6rbKRNx9iZ37fXOYGjpcNVvX0S6R7KgYC956xfrYdpMLkObLZd+zC7garJDslwRnSBohvrCLSMR4IYOdZ/D6JdVH/5n04BgxgR3Za8HdhcFeB12NU7IiISIojHa4+XOQ6rVwueIgrt79Rtg5JVaDl5u2cqJBGvSkYhh2W0g5aWLsptQfxMJIjCrrPSxW8Xb930a61ULCsio+RoMZB3wJo+7Dv5C9kBgtsTn5OwGkWuPEoTrnCt/faQ7tehn7xWEE0APwuqBUO3oQ8hwZ60LGznMABPFsW4w3T9YZuq4809Xdy1g8y0rY3fr49sQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=B7LH8wj8Pbl2xxrnC+hL1m79OkLSQ8N+y4joKe+fx5FkNe15YAlkKYu+5GP8RQcRixkzv/IFzvWe6qm6R2TMUXjVRZ6iZOL3Cyp6+WxtPSVO93DBkCxWFFV4M8VDVwmJ76i8dUSnK0rOEcF24xxniLvtAfi/3DulPxPqi7++e8o=
Received: from CWLP123CA0102.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::18)
 by PA6PR08MB10442.eurprd08.prod.outlook.com (2603:10a6:102:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 2 Jun
 2025 14:33:53 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::25) by CWLP123CA0102.outlook.office365.com
 (2603:10a6:401:5f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 14:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HchyYc+1WrvFZGMKEg99DD/KLFeHJMpe9rO2YHmSI683NKlKmHqpY32KFmErX9ibpG6R9/pAzA2SjcxAEDsoKQEMRI09URA+/Jw69nCIrJm27g2u+fc7MXtdYEQ/tUSreosQ7m7PTtX8/CceWAlqOKrkzSfZ3BcrhHqiD2XKaEF6wRH1kWhVp12g/GSvVi5FvPjIbrvggm5Ud4hgQFwhtR7/QxEpW3tgym5IB1oha92m1vMXjZL/PJXv3Di3lJ/AvqnWXAJZ3I8gI7G7i2tjqjXBTo0wxViNigmoHbJQf40Uujb0HKVOzW9wS+vCIAW8HlKQxqbXV0ClQXJG0wJ0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=Vd7LtyNjPfnKkfExrSVpwRsM+/oLsqyocW65HFVWP3RY0GsB0KEw1TDNa+ymJf1bJ6Q/RmeMlFg4ASEIMBPRMuFBwnpXA56WhtJZX1QpRi6UX/YN88WkEcwQ/onwq/vcRW2yba+U0JvfePxKE+f1Sa2DaRpTOjtfSnyg1JsXW6i5hSY5xXWDjimBLtr6x1zbo6+2ZdyA4G97oDBjMTuxW3tF9Si9L2+6xtJ733CUZqxTQIxPv9i/FRuzZd9fhIJ72JdRnbEdH+4hz+UEwX0tXIqDJSXwL3ckr4OaoBO7Scs1vKpkPSMkf5hafs0ZDtam84SwlXG6phcPAA5f4hJd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rDGmSdfteGoIfKuzX5uIALrHmiyn7prJje3zFECTP4=;
 b=B7LH8wj8Pbl2xxrnC+hL1m79OkLSQ8N+y4joKe+fx5FkNe15YAlkKYu+5GP8RQcRixkzv/IFzvWe6qm6R2TMUXjVRZ6iZOL3Cyp6+WxtPSVO93DBkCxWFFV4M8VDVwmJ76i8dUSnK0rOEcF24xxniLvtAfi/3DulPxPqi7++e8o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10809.eurprd08.prod.outlook.com
 (2603:10a6:150:158::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:11 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:33:11 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Mon,  2 Jun 2025 15:32:12 +0100
Message-ID: <20250602143216.2621881-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::17) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10809:EE_|AM2PEPF0001C70D:EE_|PA6PR08MB10442:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cdcafa-046a-4691-8fb1-08dda1e27d86
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?096xOTEMfFVf0yslrAuPNyUFc5ijeU0DQ1OSy+uaKNNcEbjHfzbxOx/qLZmR?=
 =?us-ascii?Q?F2U54N6gEnjAkVNQmJFSvIHGH9fXOaAyVlPs0O8VVd+OeUuqszzAM4AdoDSl?=
 =?us-ascii?Q?RxFXhxVhTigCpKKAnz7eo5U54e+hw0RLBBWdT3gBUqZeZ+xwZNKS+I09hF+d?=
 =?us-ascii?Q?CqjERJ6c/Dtn8yUhY4Q9T6p2n5uUd9zQene7hgHHjmkhxKBmJqjIOqZvKeDH?=
 =?us-ascii?Q?/6LBOetg9fPuT9zgxUPjxyiCee+aNL90v6PK+yx+4y8Dl6LR7E3njzY7hy1J?=
 =?us-ascii?Q?GL3f4SRE7PiaE+cHa+nNWEZvLnhuLUg4agJzG9KjT2JGgQm2BVwKoMeU5s/m?=
 =?us-ascii?Q?4y+7AmIv6KVavlcmlKUE+V3OodcepTi7cxdD/S0hGisEUrMpRTFAbK3hHQU3?=
 =?us-ascii?Q?/pzarpxl56nqD9kFeREu8ORAWvE/FeQVeAoGTLpSKiZowTGOc2oXP1WY7udU?=
 =?us-ascii?Q?pdIssUm1mhdqlodoiwKcLtMyKaSQYEiFUVJTESHieUPM5czQtUL8SIyy8oCh?=
 =?us-ascii?Q?8wzr9v1aPQ+EwYaWvxnmmt/dfcmei9H9e+finGL6K5nZnAtN6eIz8kwP4HWq?=
 =?us-ascii?Q?pKZqwv4G4mpOh/KbYFt0Q41+4SEMcvToFURLOcdS4CZPTaNAzH1QlSy3Prjc?=
 =?us-ascii?Q?Rouh0/IxUkGuyjNtUCpbhMAw7UfNgrxRd0SU8PlfHjTxsUAheCdDWtO4dPpP?=
 =?us-ascii?Q?aXWGJaxxIo8w7ldmavagGH5YN3CK2mHw8IGn0oSFX9cqUiwkmBsCD3lqSqGx?=
 =?us-ascii?Q?jrPpAKZ6senS/3cgv/d8n7+NTTYMmhTo8yKvVDzu2qqH4w7AxM0mV6TlJYgZ?=
 =?us-ascii?Q?pXaF80DvVz3JvVjWYU/I1RLIueSprq9qx5vrcnm6pf7DCflu1SD+t8HMYLta?=
 =?us-ascii?Q?8cHSg4sBCwGG3L10LxZFCtqgh1Lb7Ixemp1JRTpPKtb5BjDH4hcr2kOtAlIK?=
 =?us-ascii?Q?6qF5FbfsbHIfjuvMOIU5A5p4b1sDmToQtxQCxW7tsv/G/RqL72tn0JiYkMbD?=
 =?us-ascii?Q?1LH3FJ25wqPK7JYNNvPTixkYqH8NSbnnktbFlP6kdmBfZ/HkZaLjBdtqoMx1?=
 =?us-ascii?Q?dKS4Y2EPqqCcDSOEfvnyNNoMPsIcWXYdw7hd6+ZHzH92S/QzctIPko7ZKar2?=
 =?us-ascii?Q?e+izPnAXcWLAvhs4v9iOgbh+gmXKZRRnsItUl2teyBeVmWKWWMUZF8J8EY1Z?=
 =?us-ascii?Q?D1SK9dTwOmHU0Ho4qm9Lcab+y4ZI946DMfFQN4m8ziRODUPE8iU1cSbmt037?=
 =?us-ascii?Q?9pVcrGhgR5l+z0vBNUfvIZKRztOy0sVeuyIOUGa7dAxP/kq2zge8nNOZlP3v?=
 =?us-ascii?Q?2CogifAsr/5T9VoHya9YVrWHAEHByeepaLgj4hlmnj3DINBtzJ9pDfDYDHiE?=
 =?us-ascii?Q?CoxJqJsQomnLpS8gP1ULsj8LxhLrdwzWQMPbrv3ELdJAlvuFqVHfbAWetcjm?=
 =?us-ascii?Q?tDIFccBmbZQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d806adb-380b-4950-10e8-08dda1e2664c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|1800799024|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izNvmQXs0l8SR1f5Qvabj5t2/qCUkl73K3gUUD5IC4MuFfZ2AvmG+Onmh+Oc?=
 =?us-ascii?Q?d0Q2Dd76cJuBFNZ93XY2nHIyzPOWuGo1hoVMudhLK67ffoJgvlY5KjY0x53y?=
 =?us-ascii?Q?NIe+WplFrCKcFYM1QtvzlWZf+EFncz79qZUrry0a5tbRyHR5M49JG966f4Oe?=
 =?us-ascii?Q?6dMuPaKjRMwUkopVnXBAoHiogzAon0Ov9sfpIROzRgJzPLCYsXP7JXC81k/R?=
 =?us-ascii?Q?Ij5fZpUY1A2MKcok45W0Jkpn3gsgojOERl5MzlDpYXFGwRpEeuryhbyrSMZb?=
 =?us-ascii?Q?FSiM5OxdBs1Qv48P5u17H0FoB/lU9/V8U1Tyd0cxl3Nks7Ypk9u442uc+tTW?=
 =?us-ascii?Q?sshiX+dMD6YDsMxnMatna/iFCE1W2NYomduT9S2SlNRxCta5466aqB8jQ4YP?=
 =?us-ascii?Q?TWH/opooDSciuMa/ik/oKlfSa0Ku5IjkcNvT1DRtpUwsfF8raUEbQUEFRlbQ?=
 =?us-ascii?Q?tFXL0s+PIYlQoXIlpgBe1/ded9DZuoc3nS2Am3DP1w1n97bEQYlU0Eo52mY1?=
 =?us-ascii?Q?ZfD30r6GKwCc1dr9GqP2TlijnGv26is9ETYm7ZNfmtDIouhh4zNjQgzFgYRI?=
 =?us-ascii?Q?6akkq5atAoUPlXUbhSwKRh4R2T5XbS+l2vdyYxhBmXoe/u4cUzs3DzqT+JN6?=
 =?us-ascii?Q?5RSc/0esYDnhX8Vzgm1eMBtCZIPJsIxpS8NLngwmKT5Ui98mlHNfHojetrIK?=
 =?us-ascii?Q?FmVbCooMcbi+IN4OLdyhp6MGf8X4PyZviiNrH8VxoU8rXdr1qku4fdt3MPNA?=
 =?us-ascii?Q?dZfSu9+JPyo44SZxnZ5m2s33dBPR+vr226sVmAlIGnpmy0KLNZQm1Kvhfych?=
 =?us-ascii?Q?iva7XOOTPYehBWsQx0xn1gF50C09QRTHlic0F0Xzj4wgucmF0ero/KnFPa+w?=
 =?us-ascii?Q?uDUYaj27UXx+ulb14Xcbvyq5+8j0tgJFY7S72ZLsbTdoEL7HW1fT+NdKi3iP?=
 =?us-ascii?Q?pb4eT+5ilkbwzSYN9QpyU8juJKXIFGE5wPbo8QxjfNoDKcfyooy51DFSuYBW?=
 =?us-ascii?Q?u1k+9oGeYo58O+efRrjbAJh6uIwSR1KNramM9FdATP/kh8xj4lErfKwS6L8T?=
 =?us-ascii?Q?9cx+1BPXlwlvppn+X6DtOGfA+Lbonf7R297Fnc0yfslNj5201dxGhVhpkpyJ?=
 =?us-ascii?Q?UTY3MQs/0GwSM7m8S0IlWHDF4O+It5S0PDw0BJ0HGVfGwbd26tuxOzXIbwY+?=
 =?us-ascii?Q?DNCSk7Fkdbcx976HJqSDi8xSOkrycTs8bJSA5LrHjlcZjMT1RsSZjzuizveo?=
 =?us-ascii?Q?HVOHdt9dB69jpBRVev62mpRWeowK+b1pcwvv2l9kjBNTNsNdjtNz+ohVXy3v?=
 =?us-ascii?Q?n4NZey0KLrICRVYlz7/2DrZPSAelDQSCLfDFT33ciXMM6py4QOMPVmgBLifO?=
 =?us-ascii?Q?Y7TuLV0CbfqzgESkL6lqBuYJnOFx/9RoatXjGElQYWBl+yqEV1QXfB8EJDHj?=
 =?us-ascii?Q?OVwEzTYjHWsnRBP6/QuyJcZz1xoPRve4d0WLRnGMCUHv8KJvZX+5cX5ZfoBj?=
 =?us-ascii?Q?2vdkzU31naZ176nEpEUXMaPtwlQpj1lmYng/?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(1800799024)(35042699022)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:49.6243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cdcafa-046a-4691-8fb1-08dda1e27d86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10442
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 421f84fde7d0..5e423122cd4e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -38,8 +38,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

