Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7AA91C74
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6735C10EAF2;
	Thu, 17 Apr 2025 12:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Aw/avdo4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Aw/avdo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7AD10E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:38:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mkAC8d/N73HjGtaIQ/bcjdy+3fiJIZpb8HglTvrGMNV7nTrUf/D84hWhf4ibpqK8Vq+GJLNVfU8lDTys3gEjoR5cUI/gqOFgdpyY/WRrKhkXjq2TvC1X0O2gp1eTX7CCdsdWySjn9SLQ2GLsNMYqh7lCJRVTgMOUjjXTmCs2MVIPdZ6q7UnwSmpNPpstfuoSv96p9SdTi3hPD1deAFXcTTaixw1o7Dd2ooYAalfggmjTdfcGQmN3gWikrnZQYaEKaaie6rndn2XrEx2lwOFUTwSVp9pjavpbFqaAmCXDyFthn6qWXkLR91jNnmfox9QOhkjIE17jnv9eQfAHviBGcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgimXwXEZev+qrgnIDP6u319jX/COV27utHatY7FUCA=;
 b=Y52ZrVitFMmy8BWT5nBGjruTJACpw9T6ETK/+2XaiVQkjj0RrIE7dUUap13+2TRV91IXAxY+aRpiCSUAQIjk7LCLYbyXy+zS8JTy/oZ4RaUCSYo4bXMuYgMliFvWPYqrbfzNyptIsKNQyIqZ6ZkgZbgsSjJ2iEf8zDXYVjSU8hfEwZ6tIr5PhCv8r/kPKD5IuYa1J8wYxz0SBxMWGGjMO0jHhG2rWKQ2KKzmq/GtWz2QlTAemb8xNh3o+ORJIwe6j868xm1Jppe7LisP2w+nTVlkCBLxu3ISvOhOts6IFQPRI+CHDi7czK9Xt3sOsseXwzlneMQ7JShBLD8WmXojzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgimXwXEZev+qrgnIDP6u319jX/COV27utHatY7FUCA=;
 b=Aw/avdo4kMUeON1Mt14qyQ2H7VGqsno6DA+baHCNneoV8YLuadAEL57+p/UZUMhkCD5vRH5yhhfqnVK2Uu8KxxNaHTnfCB6joXdjeu+5/aWRJuMJul2KUDcEpkx2AJapNgemJlc0AvKsrTy/Zy5CHQoxQjz5jIDe+2GVXrkziVA=
Received: from DU2PR04CA0270.eurprd04.prod.outlook.com (2603:10a6:10:28e::35)
 by AS8PR08MB6645.eurprd08.prod.outlook.com (2603:10a6:20b:38f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:38:09 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::ba) by DU2PR04CA0270.outlook.office365.com
 (2603:10a6:10:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Thu,
 17 Apr 2025 12:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 12:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhtJk3AzP7lnoDJNbrjqn2rCx/nNOjBI3cTZGOyUv6K67Tclsqg98dfyQ/mOvKw9ZVltYyiASZtSFyhDBeFg27s3dygPih1TI9PoJUohzBG29+pTSgv8Q3rMZBD0XFLIFk/Rq4oJ6hTm6jCkxFxmRrkSPiN+Dx1MmozMawSZuWGGL+kLJEJXfZJS2Mt+9FcWW4b8NqrhG5eylo8mxfKSHhTp+Rvzz9uwpNgoc4SFRYU3quwjpcJoNduO0nlo2W02pW+9XTJYAtEVQqG5iLZ3dreBVUYOE96Ldlf1CcMXX+HwQSk+DHE+vWG6Ltt3nUCe60gBt/un5spf8+v+MiEu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgimXwXEZev+qrgnIDP6u319jX/COV27utHatY7FUCA=;
 b=ehK0TVBSix4yUSxqXF3z82x1/aIiuH+mHczrmsFewXOUAU7XLRoiS75r0im2AlnrVzpNMkcF6jJaVeb3OthFUkkBSX7RBT/V1idRDMxP4bEQT95ZZkAMZFvUv11T9msS3D67H1w5uxH4x+Cd9U7kuNMjNQUnGQo3prNsMN8FcY1VwAwC30XpXlu1VB0q82XodJH8Q3sVDKhZkC2W6dP9B5RnkoWwRPt7JxZt2XGaFWIOt9u+0+DvQtlLQ3WH0GuTOvq1X9qzRfdE0GygqbGKnT30Rg+O8Zq+lv4bzDhveGZEuk7JQevFFqcvVb3KLDbuCYfugTxWiFX4Do/TVBHSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgimXwXEZev+qrgnIDP6u319jX/COV27utHatY7FUCA=;
 b=Aw/avdo4kMUeON1Mt14qyQ2H7VGqsno6DA+baHCNneoV8YLuadAEL57+p/UZUMhkCD5vRH5yhhfqnVK2Uu8KxxNaHTnfCB6joXdjeu+5/aWRJuMJul2KUDcEpkx2AJapNgemJlc0AvKsrTy/Zy5CHQoxQjz5jIDe+2GVXrkziVA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA6PR08MB10489.eurprd08.prod.outlook.com
 (2603:10a6:102:3d0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:37:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%6]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 12:37:35 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/panthor: Clean up 64-bit register definitions
Date: Thu, 17 Apr 2025 13:37:25 +0100
Message-ID: <20250417123725.2733201-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417123725.2733201-1-karunika.choo@arm.com>
References: <20250417123725.2733201-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0130.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA6PR08MB10489:EE_|DU2PEPF00028D13:EE_|AS8PR08MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a33ae6-cef8-48ee-ccd4-08dd7dacb4bf
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?MPzCi7gFSeZ8yvSsqST/YYRMRZF0rbM1iVUIOmNSN4WlfswfHop/IsI0AAPI?=
 =?us-ascii?Q?81Fk4UMmdydjCOLhQll9Wzc7vbzDlSqMlyb8XrwxY3/wLT81D55fFDchyStW?=
 =?us-ascii?Q?7Gr6IKPcUuMY88AKKQWZu86Qc7jGoyCx7Hkzld+V5AnSz7m1az96/k6Mg8Vf?=
 =?us-ascii?Q?geR7phRa0MU85JEbOtGhFAbQcZV7u/2+gwhfC9p4Az1p6hDs8T5uiKBX3TfG?=
 =?us-ascii?Q?j6xogngZk5D9eHXYsjPpigu5yedK1wElz6urRyVDxFbGaRVvQnU4iit5lx3n?=
 =?us-ascii?Q?OPuxLp3l0EgbSXZaYI3InPSFGBuxHuQrJuConpHtZZXGFBGps/OJID7TLKVx?=
 =?us-ascii?Q?m7PqKtf1VzSw0ZESwgMsoZwQhuexS0w31HPk+XMknYev899KwmCIEaZv+i2K?=
 =?us-ascii?Q?eS1aDep/oUSfXGkIxvQ0W0qKNLIQJ9wMNpdkVZfPe2LRV9c8/tx+1zhjoK3V?=
 =?us-ascii?Q?STHzFm/ZM2v6P29BsTHQ/99w6alOKCCTEKPb/Rnq/6thupg3QsGhbt0Ffirm?=
 =?us-ascii?Q?a36GPQf27f+DAQgSSafAjgV+o0om1UDUSnysrC8SkLMKtzHwiMtzCmlJeaA+?=
 =?us-ascii?Q?+8hMSikUvAaGBJ0Sd2nOfsZBn9ftaClYtuN+0Ju/c8BSkROa7vCUDm2hyHhw?=
 =?us-ascii?Q?JzQzytrFBVtTEYKDDqwoSjit6XJpK6qkdrBAiqjqcaxwVRX5pGEKHKBfjQt8?=
 =?us-ascii?Q?PmPD1UX+454C5EAt+F0l1uYWiPQ+4AXHnlYaytJ0wTsB047nl3aPYNVByP5g?=
 =?us-ascii?Q?vVwN8meSY4Unjdj1wZwuSaHnfbx5HO8geQ3gRf2vwHjDAiYAEyn+rInFl0so?=
 =?us-ascii?Q?qB19DDkVVhTBrWdQrCuJoXPxm11cvVD+BwYd9dnjFE3gxz0acsB8oaTqTm7R?=
 =?us-ascii?Q?YpbC9Dfe3+n/xrIY9kOervHMMhFjI0KnawW/0ynNCebT5ekNRZF59Fh3r9+r?=
 =?us-ascii?Q?TUMl19CDeC/LBeyeWvRRNt++UMVzQUrlM3vTY3X8QPgK2SVxkzmEcPfllK1H?=
 =?us-ascii?Q?zFf3V4e8ElpVQli0vUSZeLqiB/bauCramWI3toqc1OjzAYdd0VANEcVGD8LN?=
 =?us-ascii?Q?dJxq5Qcp6lEzA2S9LeMsm9iMO4Dpo5czv8vGUUG7ZKwvSntfvks9juhV8S2g?=
 =?us-ascii?Q?AtwFIPH4aa3Iq8iZv+7Zw+nSJLJ9ceki6aF4TWh4qKx24NjpjvytGBZ6nDaW?=
 =?us-ascii?Q?fFVlfW3g+byU5NncPwgPYR6KtAfTgCFkwzfXgUpxedzSdlVi4ymwMxytc+vz?=
 =?us-ascii?Q?4/gWJXnR4AaAvtIHkaI5SDv11zvXarkparg4ppBCELRO9tI6Wgqzfcbg4MBg?=
 =?us-ascii?Q?lyXX0PY21mEmeun3TqUj5pKehvyOesb2p9MUPo9OPkJ4etYCrfeNJwTGwnxL?=
 =?us-ascii?Q?sVIr9p72T1tSQa2qG6rMYu5BY3iPX+wk2vQZfRf7cLGmHD6+uQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10489
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fad128c8-39e5-4fce-0371-08dd7daca198
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6lo/mA08ajJkUo38yo7PBbUIzjpinSDSDcCb2HtqFgQpk0hOly5GhgTTIwUO?=
 =?us-ascii?Q?Laq3IMGlYOP0PHVAZcBIGGIyGhm+keQ/uw8Zq4mA1epcGaoU91fN1ghPep4Q?=
 =?us-ascii?Q?rQjhnnA0R5FFTMq1MVwRZWdkDJ06kQZZcawWYJzmWKEe4Mn8nkhxU120x1Ca?=
 =?us-ascii?Q?a0IHqn7xi/a7EBIYn1NYUYaSIVsorjmjNWEXWmagngvv0zwJ524fBGMONzhF?=
 =?us-ascii?Q?zW60VUuhxt+oTLLMcOQqpBM2Uv5Ccj3bfmT2c/ij03KXH1Q4LJ4DzLeRCAK5?=
 =?us-ascii?Q?m99tan6EQraxsG9dvmFbcqVCDdsfFIR4vcV4luKNkCdQP00BIwri7teOWB/c?=
 =?us-ascii?Q?wD6tn1LT0/Fw0jUd4uLG/xqaoC0Hu6+fFp80u18unq3aZED0q/CpqTCe4aA3?=
 =?us-ascii?Q?dSKN3oYqYOf55r1N7LCaArROlIkMGay6n87dMJWsBJ/WNtEhgVwGOW+Afuvj?=
 =?us-ascii?Q?SziRJvPPUIzYqOyvXQ20bQEcS+Fu9gk5iFvIWHUq3QUTJbwk/ftJRfBOg/Mo?=
 =?us-ascii?Q?RvEiWLahI3Dwn5D0agOXbnIyXoyZe6R1VS4N/pL9gtgBztLK9Gg/DORu6Xhr?=
 =?us-ascii?Q?AdB3TskuebXaXA92sgbvRN9HJS+aqu15vUn6ntSAnywmlgy4lAoVXTwtfxrV?=
 =?us-ascii?Q?Q6yA+ry34yos6juFgShrfis0Q85l7FbPNh4tDhuqAlxQcLRhqRMrVSgaNABs?=
 =?us-ascii?Q?RK6LS0PZ4Gjo1YPrXGgpYV3LxZdZuJp65PRFG7O536hM7QSPWfsbGmrvLIYx?=
 =?us-ascii?Q?xXvmSCKWuYlh7f22eUdsJZHDKCxwSPPmb48tF/OU/xSitS8Wux4IIByimMbd?=
 =?us-ascii?Q?p0VtFIDfuSPcUwDnv162jovzKE6KtWytlloW9S3HrxmtxIcmfsiF/QNqur9e?=
 =?us-ascii?Q?e1VLk+VVM1WG64lPDDRsQs0RTmR4CIQ/1irWHharCXJP1uPzM0Qpx/tT30pI?=
 =?us-ascii?Q?/Ly4QDeMHohykrK6A0YuF6TdvM83IbI48pkIfF1X/h4NgbT0UL8X4SCFziBo?=
 =?us-ascii?Q?gZphDjfEoOPdyQArRdpiuT4ukKlcXns3B6AgDQSxF6BZBaH7NwxxL7+Hbncc?=
 =?us-ascii?Q?frIZjb7NZYRfpcD8Vm1OTC3BTECbyJbsm7EqMYJdnSsUeS/rU60SjXMQ5sq8?=
 =?us-ascii?Q?vnYTPxUajazZ4jb1kmWNGY3MhNdF5jxqutdd15E62ThzBED2pAfCwPHn0zVw?=
 =?us-ascii?Q?gaxdCeO4fJfQmHgQsKNoR2olJc+Jl90k0DnFFDSNmkNV/TUgtwT/JU7+Mho7?=
 =?us-ascii?Q?JETEX1T9ZIldRhb6U+PZjdwlMVaL6IGPRzhQjzY6fbIC/eeAv4dz/N+77GL7?=
 =?us-ascii?Q?VjKW1xwi7RQCmnmALWOr8IpnoEGj80Gl/DNQFLRCJUEzfyJ54QSnJl1OePrp?=
 =?us-ascii?Q?ZeX8X6ckwXvem97fNppiWVeyWAwwdL+uXNYZyYYPGXh5pLX21U7qmRjGAICs?=
 =?us-ascii?Q?+axFWg8IkyqLhBcNX4zDmwc+l6Pehk/Sp/Gv0d2kyPpLmR9KuVjpT+32YTUU?=
 =?us-ascii?Q?VOs9cQtdEc1XGeRO/o+3x29lpFCPJClRwxJo?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:38:07.5856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a33ae6-cef8-48ee-ccd4-08dd7dacb4bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6645
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

With the introduction of 64-bit register accessors, the separate *_HI
definitions are no longer necessary. This change removes them and
renames the corresponding *_LO entries for cleaner and more consistent
register definitions.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c  |  4 +-
 drivers/gpu/drm/panthor/panthor_gpu.c  |  8 +--
 drivers/gpu/drm/panthor/panthor_gpu.h  | 10 +--
 drivers/gpu/drm/panthor/panthor_mmu.c  | 16 ++---
 drivers/gpu/drm/panthor/panthor_regs.h | 94 +++++++++-----------------
 5 files changed, 52 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 880d35eaa806..930cf0adb9b4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -772,8 +772,8 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 #else
 	arg->timestamp_frequency = 0;
 #endif
-	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
-	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP);
+	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
 
 	pm_runtime_put(ptdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 49dc34a82b0f..295704732b4e 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,9 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -147,7 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 53abdc7839a6..7c17a8c06858 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -30,9 +30,9 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_on(ptdev, #type, \
-				  type ## _PWRON_LO, \
-				  type ## _PWRTRANS_LO, \
-				  type ## _READY_LO, \
+				  type ## _PWRON, \
+				  type ## _PWRTRANS, \
+				  type ## _READY, \
 				  mask, timeout_us)
 
 /**
@@ -42,8 +42,8 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
  */
 #define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
 	panthor_gpu_block_power_off(ptdev, #type, \
-				   type ## _PWROFF_LO, \
-				   type ## _PWRTRANS_LO, \
+				   type ## _PWROFF, \
+				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a0a79f19bdea..1db4a46ddf98 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -564,7 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
+	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,9 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -629,9 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	gpu_write64(ptdev, AS_TRANSTAB(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1669,7 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 6fd39a52f887..7e21d6a25dc4 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -65,20 +65,16 @@
 #define   GPU_STATUS_DBG_ENABLED			BIT(8)
 
 #define GPU_FAULT_STATUS				0x3C
-#define GPU_FAULT_ADDR_LO				0x40
-#define GPU_FAULT_ADDR_HI				0x44
+#define GPU_FAULT_ADDR					0x40
 
 #define GPU_PWR_KEY					0x50
 #define  GPU_PWR_KEY_UNLOCK				0x2968A819
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
-#define GPU_TIMESTAMP_OFFSET_LO				0x88
-#define GPU_TIMESTAMP_OFFSET_HI				0x8C
-#define GPU_CYCLE_COUNT_LO				0x90
-#define GPU_CYCLE_COUNT_HI				0x94
-#define GPU_TIMESTAMP_LO				0x98
-#define GPU_TIMESTAMP_HI				0x9C
+#define GPU_TIMESTAMP_OFFSET				0x88
+#define GPU_CYCLE_COUNT					0x90
+#define GPU_TIMESTAMP					0x98
 
 #define GPU_THREAD_MAX_THREADS				0xA0
 #define GPU_THREAD_MAX_WORKGROUP_SIZE			0xA4
@@ -87,47 +83,29 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
-#define GPU_SHADER_PRESENT_LO				0x100
-#define GPU_SHADER_PRESENT_HI				0x104
-#define GPU_TILER_PRESENT_LO				0x110
-#define GPU_TILER_PRESENT_HI				0x114
-#define GPU_L2_PRESENT_LO				0x120
-#define GPU_L2_PRESENT_HI				0x124
-
-#define SHADER_READY_LO					0x140
-#define SHADER_READY_HI					0x144
-#define TILER_READY_LO					0x150
-#define TILER_READY_HI					0x154
-#define L2_READY_LO					0x160
-#define L2_READY_HI					0x164
-
-#define SHADER_PWRON_LO					0x180
-#define SHADER_PWRON_HI					0x184
-#define TILER_PWRON_LO					0x190
-#define TILER_PWRON_HI					0x194
-#define L2_PWRON_LO					0x1A0
-#define L2_PWRON_HI					0x1A4
-
-#define SHADER_PWROFF_LO				0x1C0
-#define SHADER_PWROFF_HI				0x1C4
-#define TILER_PWROFF_LO					0x1D0
-#define TILER_PWROFF_HI					0x1D4
-#define L2_PWROFF_LO					0x1E0
-#define L2_PWROFF_HI					0x1E4
-
-#define SHADER_PWRTRANS_LO				0x200
-#define SHADER_PWRTRANS_HI				0x204
-#define TILER_PWRTRANS_LO				0x210
-#define TILER_PWRTRANS_HI				0x214
-#define L2_PWRTRANS_LO					0x220
-#define L2_PWRTRANS_HI					0x224
-
-#define SHADER_PWRACTIVE_LO				0x240
-#define SHADER_PWRACTIVE_HI				0x244
-#define TILER_PWRACTIVE_LO				0x250
-#define TILER_PWRACTIVE_HI				0x254
-#define L2_PWRACTIVE_LO					0x260
-#define L2_PWRACTIVE_HI					0x264
+#define GPU_SHADER_PRESENT				0x100
+#define GPU_TILER_PRESENT				0x110
+#define GPU_L2_PRESENT					0x120
+
+#define SHADER_READY					0x140
+#define TILER_READY					0x150
+#define L2_READY					0x160
+
+#define SHADER_PWRON					0x180
+#define TILER_PWRON					0x190
+#define L2_PWRON					0x1A0
+
+#define SHADER_PWROFF					0x1C0
+#define TILER_PWROFF					0x1D0
+#define L2_PWROFF					0x1E0
+
+#define SHADER_PWRTRANS					0x200
+#define TILER_PWRTRANS					0x210
+#define L2_PWRTRANS					0x220
+
+#define SHADER_PWRACTIVE				0x240
+#define TILER_PWRACTIVE					0x250
+#define L2_PWRACTIVE					0x260
 
 #define GPU_REVID					0x280
 
@@ -170,10 +148,8 @@
 #define MMU_AS_SHIFT					6
 #define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
 
-#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
-#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
-#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
-#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
+#define AS_TRANSTAB(as)					(MMU_AS(as) + 0x0)
+#define AS_MEMATTR(as)					(MMU_AS(as) + 0x8)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
 							 ((w) ? BIT(0) : 0) | \
@@ -185,8 +161,7 @@
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
 #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
-#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
-#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
+#define AS_LOCKADDR(as)					(MMU_AS(as) + 0x10)
 #define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
 #define   AS_COMMAND_NOP				0
 #define   AS_COMMAND_UPDATE				1
@@ -201,12 +176,10 @@
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
-#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
-#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
+#define AS_FAULTADDRESS(as)				(MMU_AS(as) + 0x20)
 #define AS_STATUS(as)					(MMU_AS(as) + 0x28)
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
-#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
+#define AS_TRANSCFG(as)					(MMU_AS(as) + 0x30)
 #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
 #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
 #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
@@ -224,8 +197,7 @@
 #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
 #define   AS_TRANSCFG_WXN				BIT(35)
 #define   AS_TRANSCFG_XREADABLE				BIT(36)
-#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
-#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
+#define AS_FAULTEXTRA(as)				(MMU_AS(as) + 0x38)
 
 #define CSF_GPU_LATEST_FLUSH_ID				0x10000
 
-- 
2.47.1

