Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB5A91C72
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A50810E2B6;
	Thu, 17 Apr 2025 12:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YHCvGezp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YHCvGezp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2066.outbound.protection.outlook.com [40.107.105.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88AB10EAF5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:38:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xHVV8Qev7H+gqkzEDZ3KrZObse+jRTtg0hAY0H+OTsu3OWaBO0aSOfXL2uuuM1Cs/frFLGPq0eAZF5XMDRYHOqZjZahlzfEb9SqbazT/JNxq6YoiRUyobbXV+B9zCe+nUEVlir8zdZQwFfRTFBslFZY/Qb2NcB8GJTKpw4SPk5xbS2sssQZWbvfzRDm7+ftwAO9yJZG90ENUMKLtKGf+6w9b1u++LsQ0J46/Um5tBDK5uPHB/F/apKDW3WkVomC+YZq1yin9KVyjRC+r9TFzomeIAs6PNFqvC+/NCEM3AdPY+SuJHFCv5ca5AxujFZQ1uctu3XaE/UmsavlOYHWoiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Gx4hQKc9ULegbDpUn2CcMIJ71UZAUSrI7krRmGV0W0=;
 b=ineyIqUvFtlLOwymFE5VnWqWBuuQP1N69iGUpJ3NShBkjMFQ4vq8OOcdddUcc3LK89XD1WXM9ATfjZI2eKkBwGVFP0YuvS51pbQ3CUL7PGYb7yWG/tEx2lid/YFAwGS5pl7deOuzcYObGSTu+Jwe+srQ0IxIrO7J10JDTVfFmopO2n3/58seRx5HTYPTYa1AUUi+Hwd+H7tcfLbXEYsVPYj25WNNpir+nZ8OkIxwR2YBTOqdWvBjAvF1n10Ei9qEMDpGFB8w/2CJYLljLq5PqnFHSkK4sbHUmQ5sBdIybFQuk2tw01o+yFdPqu1GM8cfANV/x2utb4erYRFE/qm49g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Gx4hQKc9ULegbDpUn2CcMIJ71UZAUSrI7krRmGV0W0=;
 b=YHCvGezpmyiUmjHsmBMH7O1aDsLbmkXGPiye5x4mHgNE9NUR0m2G9HJiU0OeEcjiFo5ZXwMIrcnd3GXBUDdflPPBDM72ODgXE1sJQICzhuBMObGvRe5g3cJmNc/6peJtcdCq1GQ2JQCcT5l6ymySBo91Wo73S1lGlXwqUhn8b8k=
Received: from DB8PR06CA0056.eurprd06.prod.outlook.com (2603:10a6:10:120::30)
 by DB4PR08MB9335.eurprd08.prod.outlook.com (2603:10a6:10:3f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Thu, 17 Apr
 2025 12:38:08 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::74) by DB8PR06CA0056.outlook.office365.com
 (2603:10a6:10:120::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.21 via Frontend Transport; Thu,
 17 Apr 2025 12:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Thu, 17 Apr 2025 12:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biEjjZwP4snV/4A52WWO4eJ8I/byvKv4/bTr9cqssNr7VeFuA7I2omICeNqESU5E6vgw5+W27t5BDPHDZIMwOTelUOxZmcBNfrTbrzSxXkbgFmdt4Htq52LlHk4M5NSPFXRgt5KvusTWabRI9ts92omOQN49ypherOJ2K7JlOM/ARtWg6Wpk8WCex9adj0equllMpgVqDeL14tbIoc2AIsGJcuh2Er5A226i5JRRYr2XeBhsVWmZnlW084FFw82OpruVTJA5QaYTxTjNZTEnbter+W7P+HLrpp8aDgID+0qGjRa2UyFkyNQFNAcyaZc68rAPpzBnaZJKwKqcQThfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Gx4hQKc9ULegbDpUn2CcMIJ71UZAUSrI7krRmGV0W0=;
 b=Ybf7OkQkEZKG51VSCHBIOEdL1kdu/8odX/KkoBFdw4jFd2YbVw+8OaMadULJ2zhbL90nmjTipE9aZzwjF1Jk1GSlRAkhS3u9dRhn5FLHiH7SdiUXOzBrzVN3JqT2dFipLGy4JjHtEXeTQILYo4V8P/uRTSJcNHl3ApRSBGW1j61MHeLO+n0ngVnGtS0rJAJ1/3nOXWSCydDpQJSD5lxr905ipA8AgnlYk1TnQODf70o3N+OWe5+A0Mtdx5Rhs98qALxDPtPht35WLQwxqdn/FaF58D/Wj4bFJyXcPtTIDa0IS+oGTcwtL7rDV2G5zEKtIuBUsb/0xSvL6qjkQAE4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Gx4hQKc9ULegbDpUn2CcMIJ71UZAUSrI7krRmGV0W0=;
 b=YHCvGezpmyiUmjHsmBMH7O1aDsLbmkXGPiye5x4mHgNE9NUR0m2G9HJiU0OeEcjiFo5ZXwMIrcnd3GXBUDdflPPBDM72ODgXE1sJQICzhuBMObGvRe5g3cJmNc/6peJtcdCq1GQ2JQCcT5l6ymySBo91Wo73S1lGlXwqUhn8b8k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA6PR08MB10489.eurprd08.prod.outlook.com
 (2603:10a6:102:3d0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:37:34 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%6]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 12:37:34 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/panthor: Add 64-bit and poll register accessors
Date: Thu, 17 Apr 2025 13:37:24 +0100
Message-ID: <20250417123725.2733201-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417123725.2733201-1-karunika.choo@arm.com>
References: <20250417123725.2733201-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA6PR08MB10489:EE_|DU6PEPF00009526:EE_|DB4PR08MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 76174d1a-15ea-4115-4f5b-08dd7dacb4c1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?hgfsjXNwhlgxiGEJNkmdM9eUYPENGw23fT5AlAXMO5PHUPY1KNEvvjuIcnnJ?=
 =?us-ascii?Q?2x1ZPQES8FYHX8/pqJgJOkxhjHgMYL/mR50AYPLucnibOqw8xk9D+PYMsYXT?=
 =?us-ascii?Q?cU4aCPdEwZ9ExMtLGWVmfQOdhe+3cgsPp5Z65WiWadv08u4Y7pQa0Wox9Rqs?=
 =?us-ascii?Q?ldo8a9+g8rMJVAlzwZuBIRIJh0nvllavym8B3EBhDTTWoWw+WovB2vdLEZEE?=
 =?us-ascii?Q?ds4eyluqtS3Agh1PN/qiEC3iE8wQtbBR9C+SeSsvjU7FzEcbriB/afx7MkWH?=
 =?us-ascii?Q?DwahIQxlGWYBjN/JJFVt8s7jmGXyZ9VGO+MCDC3VMszaXrTrKVxPrC5/s8yF?=
 =?us-ascii?Q?Al4EIsO385eV1PeUEMGmAOoJAUbKVz/sZ4SN4I6QDE8NdMuHKnOgqLhd8eNu?=
 =?us-ascii?Q?MK+vZoryB3Ru5fAJqN7vCnl6dGXX5u26jwHqgqqeiJmYCZ+GOqBiTo/Uz3ha?=
 =?us-ascii?Q?cABeSS2PbpI1VB1TuJAW2q4V6C3zohcE1AfbpK0I6Skw7NXbDDfCx/s7nV53?=
 =?us-ascii?Q?MSyd1aBUAL0Lh9vGSp3JHyVMHEFIbw9EemqS1V+7uacm2U+nJRc1F0cw84UD?=
 =?us-ascii?Q?2z9k+uNh3tgqyrkhFAYPk4bxVKtk7olkyvoXMCxivNVQrHebEJoO6Dlbr9zY?=
 =?us-ascii?Q?sSB8ohf3A1eEHbZ/V8vwLaaNTJhCea1C5ds0rw8FSOg+a7GzOpfrBOE4+J6e?=
 =?us-ascii?Q?dmxx3hlCrmXlRGl2IPLQdmmGZp9NhJRfTFweZt2If37tvI+dp5X8soQvD1Ar?=
 =?us-ascii?Q?4GD99I2L48S2qpC/2VtqwS1pDiWbyeeOrsDKv2B8wg2caKQZLl292Vf/iZTY?=
 =?us-ascii?Q?weeIC1r8t9IXequa5lYwWADcoQli1JNpinfQtI4HAPyNJczYz95WlGR4jfvs?=
 =?us-ascii?Q?1daajYISzTvpinUqBhleMK8MKr2dsM9tIvoRqbHBpEYHulxao64MNrkco1XK?=
 =?us-ascii?Q?xKS94GRbF9BnJcBiJPTPg8HsDd6Xvo8Ct3IU9gdPlzUucVjhEAbklgg7lAIH?=
 =?us-ascii?Q?JcEuOst8K6o/+31xpoj0eVqSBkvnR0LxpfNwIPFsZA6pR7DfWTuzo1+46LXY?=
 =?us-ascii?Q?PkzCVkgzsZmYoK7zkxLk79t7XCMFtG/lfSWlXnwoN2iZqnOXY+9hyT6zdri0?=
 =?us-ascii?Q?BMHqFRRqQpCGbIxD4g3LZcjBr9w+gG+cBVNQqqsXTf7VCOi1hMO2XL6BDyLb?=
 =?us-ascii?Q?iN/Yyesa1gio3ZS5Ld+louWiAA+xDW3rksplc/9z//HTTq5JanWr+sAj9f5O?=
 =?us-ascii?Q?TNssnjbq42osCBU5likmYn6ph6TqdAFpJBxdMOdmIMLQWYWNkTnwccz9rFSN?=
 =?us-ascii?Q?uwesLi5T6NTHnrwlB5F59LtHY/no4E9xr4rpG2DcJJyauDICrHStPpj+AT3O?=
 =?us-ascii?Q?rNSIAQ/kZC7w/rG6zLhlFd/FhzL5VcNTgdy6Kf8EFcJhqwvR2kIfwapjE0nq?=
 =?us-ascii?Q?1w1kN0mZ2qA=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10489
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7363c700-c260-4e97-7208-08dd7daca0b3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|35042699022|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OyIpD+uThSjYRuxorbDwfsUR94YIySjo67v7v/Z6yky5BFi+eiZ8oPDb1X8p?=
 =?us-ascii?Q?y4sqCMCGb3hDm3LELOq4JwlCMjMwTJVMlWS2GEtfEr31FAxfWMi7nnmhj+oA?=
 =?us-ascii?Q?UNKpUZu9GaGlTJtLB30fGRtFeVydWo4UzwRupcnq/XQnSgeK8wBWFX5ugndF?=
 =?us-ascii?Q?mbkvoV8hbf8tNo4k/T+R3+5dqj+8hAMEOlNYVAJoCLJgYfqCDC1ZcPQ00ZGY?=
 =?us-ascii?Q?fXZT4t0gVCjmlARzbHer4qx2K7akDpkMADqvC2ucmrwkB0l07m3bfKu3mD9U?=
 =?us-ascii?Q?DSdsAeEJAlosf6OtN41Q/INuuqGWCiB8l/Ph/f7rcek5qpCvZFp8ojuiO0PU?=
 =?us-ascii?Q?nayYr74Jv7SY7g29r5OUOw2JNafGPe1gwk2HILJ7ZmEqbXMVmsB7R+0mwQLi?=
 =?us-ascii?Q?VsP4WPA/OiwzOELC2C4qRE/SZBJmuXkwJPB0aSNuzf+H74S2zIphCrga5QWe?=
 =?us-ascii?Q?xiFXnuC25n5tRcAAjyRsdCS/LkQkZeV2uJISLbZKwgdbAXd2+XXxbKCfV6qK?=
 =?us-ascii?Q?TBg+5vX1K60M3JKqMDzMVAFjrbJuqrQyzI7pGeMLJJuB2nE+sHtmQcORnIWI?=
 =?us-ascii?Q?XCpI1E/L1pBs2BGwkGuwNgdjYt+pJjYBH5IGulePUxnFe2QFjfn78nOO1uEl?=
 =?us-ascii?Q?16pE4KR5rxa5PA6D8WnpphtbxLPKDGlL72isJzTri10yp+UPzl6rHCqC/kXL?=
 =?us-ascii?Q?QfTPLpZFivBgx2fTPPXQ4QIVfN2lYIcnWUzW1h7dXoXiO74XEaGkjeIhlP2z?=
 =?us-ascii?Q?VN3kmCcvlzVpWQUYT2M9RVJLjOIOZYakseB+BY6yprFDdaHC3/e124RAiEjx?=
 =?us-ascii?Q?GdltMF1fK/gmyMnNFv4Bocb4elAVepZlGtJBMV4uR+dtIwB50emfljlufqPj?=
 =?us-ascii?Q?NHMLDvNKy9kXfSAsOzzuBHQtXepPQPFNQPHlzC0HFRz9yrH5u82ufUlhUD91?=
 =?us-ascii?Q?yHfM84UHf8ZHnp9hhfmyoWOAo+5Am87EQZoTlF7ysWF7Gl6V2O0rntMzj4D0?=
 =?us-ascii?Q?tkZRGoqshJ9uDKPfgW1gzsGOZlyqnFIwoU3X6nV/z4oODAam290YS7Xn0Dmp?=
 =?us-ascii?Q?xzRLjdy0yQNVpXfHE35znsFEU72FY4ScIVJ2hMMMyUJC7UEjiHecOob28QYx?=
 =?us-ascii?Q?Wn50jv4yJA/sbp7WXAhlci3kh9kSyJPY+po7XfS3HQsdxQufsIbCCaYNbl/v?=
 =?us-ascii?Q?Q53FWC2JQYsQiRMSMkDiXy5jiBBQ5lPW0xN0wQHr2g9QXjozgVrauFE9jAN+?=
 =?us-ascii?Q?oxMBWLha6QPTEfwcRdtpG8/iFL8qApepDM+UTbVFwOXNZeoKyemgN0F6DDaD?=
 =?us-ascii?Q?ponKgoPFQk7p6+KWwEwTC7E1FTUtv18CIIzM1iPa2Nfo9Ai7leUxGF7Lzvs4?=
 =?us-ascii?Q?WgSHX74eEysgdDj2d/hxwFpPr7YkvyiCXly8vT92/TAkMn+a1MERzqKnrp3b?=
 =?us-ascii?Q?5C84NSmlevfxdPQ5iX5TYEX+JPuxpCOYX1u2jw+zeiUGa3XeFxisUPyvz2iI?=
 =?us-ascii?Q?mpu3aQDTGXgBExgaSI9w2Eekvz9qHLWvlh5g?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:38:07.5789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76174d1a-15ea-4115-4f5b-08dd7dacb4c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
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

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

This patch also updates Panthor to use the new 64-bit accessors and poll
functions.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |   4 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 159 +++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |   2 -
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++---
 drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
 7 files changed, 124 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..40b935fcc1f4 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 
 extern struct workqueue_struct *panthor_cleanup_wq;
 
+static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
+{
+	writel(data, ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
+{
+	return readl(ptdev->iomem + reg);
+}
+
+static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return readl_relaxed(ptdev->iomem + reg);
+}
+
+static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
+{
+	gpu_write(ptdev, reg, lower_32_bits(data));
+	gpu_write(ptdev, reg + 4, upper_32_bits(data));
+}
+
+static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
+{
+	return (gpu_read_relaxed(ptdev, reg) |
+		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
+}
+
+static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 lo, hi1, hi2;
+	do {
+		hi1 = gpu_read(ptdev, reg + 4);
+		lo = gpu_read(ptdev, reg);
+		hi2 = gpu_read(ptdev, reg + 4);
+	} while (hi1 != hi2);
+	return lo | ((u64)hi2 << 32);
+}
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				     timeout_us)				\
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
+				       timeout_us)				\
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
+					     timeout_us)			\
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
+					timeout_us)				\
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
+			  false, dev, reg)
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..880d35eaa806 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -772,8 +772,8 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 #else
 	arg->timestamp_frequency = 0;
 #endif
-	arg->current_timestamp = panthor_gpu_read_timestamp(ptdev);
-	arg->timestamp_offset = panthor_gpu_read_timestamp_offset(ptdev);
+	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
+	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 
 	pm_runtime_put(ptdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0f52766a3120..ecfbe0456f89 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
 			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..49dc34a82b0f 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
 
 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
 
-	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
-
-	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
-	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 
 	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
 	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
@@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
 		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
-			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
+		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwroff_reg, mask);
+	gpu_write64(ptdev, pwroff_reg, mask);
 
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
 	return 0;
@@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u32 val;
 	int ret;
 
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
-						 val, !(mask32 & val),
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s:%llx power transition", blk_name,
+			mask);
+		return ret;
 	}
 
-	if (mask & GENMASK(31, 0))
-		gpu_write(ptdev, pwron_reg, mask);
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
-
-		if (!mask32)
-			continue;
+	gpu_write64(ptdev, pwron_reg, mask);
 
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
+					      !(mask & val), 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -492,49 +449,3 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_l2_power_on(ptdev);
 }
 
-/**
- * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
- * @ptdev: Device.
- * @reg: The offset of the register to read.
- *
- * Return: The counter value.
- */
-static u64
-panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
-{
-	u32 hi, lo;
-
-	do {
-		hi = gpu_read(ptdev, reg + 0x4);
-		lo = gpu_read(ptdev, reg);
-	} while (hi != gpu_read(ptdev, reg + 0x4));
-
-	return ((u64)hi << 32) | lo;
-}
-
-/**
- * panthor_gpu_read_timestamp() - Read the timestamp register.
- * @ptdev: Device.
- *
- * Return: The GPU timestamp value.
- */
-u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
-{
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
-}
-
-/**
- * panthor_gpu_read_timestamp_offset() - Read the timestamp offset register.
- * @ptdev: Device.
- *
- * Return: The GPU timestamp offset value.
- */
-u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
-{
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
-}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7f6133a66127..53abdc7839a6 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -50,7 +50,5 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
 int panthor_gpu_soft_reset(struct panthor_device *ptdev);
-u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev);
-u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev);
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..a0a79f19bdea 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
-						val, !(val & AS_STATUS_AS_ACTIVE),
-						10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
+						   !(val & AS_STATUS_AS_ACTIVE),
+						   10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
-
-	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
-	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
+	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index a3ced0177535..6fd39a52f887 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -232,10 +232,4 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0
 
-#define gpu_write(dev, reg, data) \
-	writel(data, (dev)->iomem + (reg))
-
-#define gpu_read(dev, reg) \
-	readl((dev)->iomem + (reg))
-
 #endif
-- 
2.47.1

