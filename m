Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D8C0F31E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925E210E4E1;
	Mon, 27 Oct 2025 16:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dKhYQXkb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dKhYQXkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FA810E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yHWEM4JmvyX59wV2ZxY+VYIuajXShhPHMhdvfL5VysRkWj+SP00+4cqPOTwOP7kqQJFkf805h1UKg1l3aNHwGclvneB7l9YQiKgEYEOpCvxiYWNwWX0yxGSHsEi7RSEfJpSYNaCIsYHJsZUEBju66m6uFHR9xxOXZCUKv5K3ROfewlLl8V/iT8FxO7cJLdm9Y5I23fGYEHK2KKC7aNhs320oSIsiAqsdZUpezAYK85Z+Wpe4/hnaJZTZo7s/4vMM4QouE0kdiBP1YdEyphPPsG4yR6ZphWrbnOmvCvInGxqdM1qpQR431cOz5kyiZuliUIqqSOolSB7NVxKvcTYOTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9pP4EBmvdyOYGUPLSfRzQFzFCcM2jCGue0aJTZJ4h8=;
 b=hWRr9b1yVxp6b6gHLkiyOToN2cBWq1pDyCeSP3PjfuY2h2ySl3pNo3EdhXW2MWRe41jKv6MuTj9yNNxSohQ6xDQ5KKZ8sE7NwiBBKMPV6p49pxK8u6ar3pnUpPSDZa/XLtLBBAp0KiiA4z1REW+/ZwiellEGaqXN7AIcT5LWFL/fKZovTJyrqufVffthO0VG1j5+feWSTm6Hjptr85wVRsM8qbYBcsvmE34IZlUQWXJTClnPFmAHP9umd4egSHvZl96KnIVF46e+u7JGV7G1Y+g+/TTFYA6XtKH0gfZinzzWUx6Tyugj90QWON38kNCIeeF9PaTAwxr1DmluhL969w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9pP4EBmvdyOYGUPLSfRzQFzFCcM2jCGue0aJTZJ4h8=;
 b=dKhYQXkbbRWtueLgLaGx7qLsYQVYlsV6Joq89MBo69W1AItfmRp3sALnDEz74h5n5726lbekQYVssCQgnTLkyeIHHCsagNa/Q4ykbxAPpBNivjJRWVY7wx/pHtTlx5+YniBSC4fpRUjINj6T9hg8fWp+makK+Ae7zsA21J6T/j8=
Received: from DUZP191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::15)
 by AMDPR08MB11307.eurprd08.prod.outlook.com (2603:10a6:20b:718::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 16:14:14 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::dd) by DUZP191CA0046.outlook.office365.com
 (2603:10a6:10:4f8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 16:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10 via
 Frontend Transport; Mon, 27 Oct 2025 16:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv/+mpNAxLy96EGs1PBAZxO9hGAdgjR/dnULNViRu445dW/N+O2yh8LTClBplu6rYMf7KUBxzbEQ60gK/hR611CfEg1yHmplkjxsq3s/65WdoBg3Y5+AnekYukbHy/3cpcMGcHbBn6BvhqtFpm6CIj6sQv63owKfCr9HJES6xRoPduQbRAshP7LexRLLmQOaa/i1YpXUmFC8Oyrxb8pZvQBMypRVGVR+KiiZ5IUsqLSUPZEdxHspE63buywUx4cwcAVDwtFXkY2UUyuBpLLOymXBBNM2lDRWm4ytnlJZxiMAH5eyOP7SNbMQTepCZhA3oF6/+DYBdn/RhS/9CTTNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9pP4EBmvdyOYGUPLSfRzQFzFCcM2jCGue0aJTZJ4h8=;
 b=H0OtlRN/DdAuG1MaEfkgAGafVIkZ5gIHAM6rox4+nFGHbNleJlHLvLzNHKflTWcDq5Uq2fcKiV+EJRDuc6zEXyesZ7AWqTpJ4ZngFpWE5BH/i6a3rZWKIpqN+BkwugTGvTH/onPVnLbXt6JeZGHn/hG8s9SlHHGNf+SGknOzRMsdHc8niGwlTCvnB2hT8lh8J02ItHJs2wNKhTTazfgBgPrdPra35d0qS4eeEXZL1nUsyxxWfiFOsHRlDXi3D5BlZJCpP94CkloH9ErQdkmnP2Op2IeE0K5LoWNilWcrSrKqnyvjsTZAm1NvOjzAC7OR26rbFZKcQkgvlB3DSmg0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9pP4EBmvdyOYGUPLSfRzQFzFCcM2jCGue0aJTZJ4h8=;
 b=dKhYQXkbbRWtueLgLaGx7qLsYQVYlsV6Joq89MBo69W1AItfmRp3sALnDEz74h5n5726lbekQYVssCQgnTLkyeIHHCsagNa/Q4ykbxAPpBNivjJRWVY7wx/pHtTlx5+YniBSC4fpRUjINj6T9hg8fWp+makK+Ae7zsA21J6T/j8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB4PR08MB9335.eurprd08.prod.outlook.com
 (2603:10a6:10:3f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:41 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:41 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] drm/panthor: Add architecture-specific function
 operations
Date: Mon, 27 Oct 2025 16:13:28 +0000
Message-ID: <20251027161334.854650-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB4PR08MB9335:EE_|DU6PEPF0000A7E4:EE_|AMDPR08MB11307:EE_
X-MS-Office365-Filtering-Correlation-Id: b7dfe725-d41e-4f39-206d-08de1573dee1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Akjm8p03yi2iNEz3PDymA6gPl6u4kJZ9oRTQu3ZQdI+0eCJygLzPG0UxXVXV?=
 =?us-ascii?Q?9IhZVD3EVPuMqvxX3/3lln4kR1pCqk06/ul4Os5K/5gCymFRKISwWEPzSWuW?=
 =?us-ascii?Q?ecq1TB4fL5CNybXh2IzNvFZ94Lra6XJ8RTdb4Um0zKj9ljsZzg68eVMOJBt4?=
 =?us-ascii?Q?N80nDzWUPFObl9JPChQVAC1MCa8E1pQ2rzBz9wU/EjPvUaCB486uTqQWWtvG?=
 =?us-ascii?Q?avHQBz3I/cg2LdH70uI+dEK+BMx2ClIZGMGjiS02NiqbjTHue8dQu2wBXmb5?=
 =?us-ascii?Q?7BQkPpPURI0MwX0ZjLx6QA6T+3KGh9xoD73j1M1ssDKk9S7Jpc30vE1E9eRi?=
 =?us-ascii?Q?NfJS22NBeOFzDlNyKVULQqVqdP3sX4d1WponLht6EhItdrj09mGdUgsiMq66?=
 =?us-ascii?Q?+uC9e34Q2VXpGrf7Q/0H3XpiqpXV4AsZIx9xSVqer9RUzZxF2OXtpRqRwNIo?=
 =?us-ascii?Q?RexqD2OUbcOTZU8aEVf/a7OjdxnCtVtaOCy+mNUd09osJtgyvoraKQH13KZx?=
 =?us-ascii?Q?bHpR5m53Y13lvXTlZty+Qp6SNJVKub5cVOY5SBOHQ1G1uoKnknu5ntYEJlgZ?=
 =?us-ascii?Q?FgIdZo46c/YdP9+vYvsM/jGEInRQH7Ilo041ltWlm/e5APFy0gXW9e9ZgUWv?=
 =?us-ascii?Q?v/IhfRxEkXyjvagqrsy+OaPSsJcxXpLHHlp4C6qs30fnayKH7kdELzdQLZd0?=
 =?us-ascii?Q?+a8btnru8TOkYZa6cuMgu+4V3bi79RP0mWzsdgksbegp/AIVeThtjJ+61YU2?=
 =?us-ascii?Q?Rq7pyuDUv6T+uHadsuJOk79emqtIvFZ7PrimZ4cDQ0li8ENfkEAAtOsQE7ne?=
 =?us-ascii?Q?mfQE2g9xeqCNbi+yBKmgaNvmqs/Got9t1D9J0PGBiyXzMLWKL/hK9LSezA9O?=
 =?us-ascii?Q?X4phXyTa77Yihw7InVSOUO6tPHw2PZO85cAcwBcQMVlSyShgHq3BiIx0csky?=
 =?us-ascii?Q?dS206LCds7y80d6IHA3PZ6tMOwSVUV01kWpHESLx1YYC5b8P5hhmC4cgUeHg?=
 =?us-ascii?Q?I8zK4FA4Tx9CiR3wrr+pXS8Tqrv3+OXzPBDvEDmu0BPLQ8+pmd9N3tT1Ults?=
 =?us-ascii?Q?GTVLb33uT6LwBpOaZ0KoHRJhNi61ovG+wdMlHxcgEP+uQPsGpztnuFfaysZr?=
 =?us-ascii?Q?ggDvUqLNg7WgnksTbV6pkCk49U8dKBJRFF6V9Ng3oYYRdNLyKhGKTe0SAO2N?=
 =?us-ascii?Q?jVo6USt6uMivjuln9ZGc9pb57/ZGPMCq2b+SgpndWu/qPMhdbld1FdG3ILbG?=
 =?us-ascii?Q?qB+9nmNMZCQnt2rW4tLBjV7GAWVDwCbo7hMYgHa35QNoHVZfMYkCvryyu5mt?=
 =?us-ascii?Q?oE35Oh15g3jlFfuWYvDtb5YP3BObjSVMRpmkHusvGxPzPIkzHSk1fYsKaMs0?=
 =?us-ascii?Q?4/WDr7fXVxb6DYXrigZPMDef9c4ucu0uCSfzDzFedV3aXGLxrettCOagsj9N?=
 =?us-ascii?Q?zZzWrjSTJFkbIjoNDGe/b4yZKiaAMkOG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: da29a428-ea5e-4684-8f55-08de1573cb2b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sc42zMyJZTBF6nVXWopsBsB45IjbeEGiBXmYLumg9T9ycVAI4BaDo8GkZl1j?=
 =?us-ascii?Q?hv3BrS8L4do2j1aYpCVRoNdlAAq6gO+QUKHLFj9Rl3M2pgm0hIDZpyla31Kc?=
 =?us-ascii?Q?Zi/vVmAVSmI52r8WoXsC4eJVFjw5wco5qMNFiKwNWWcJlad0cKrIxtXQkIMj?=
 =?us-ascii?Q?8fNlZjRcA0nTHTjViJsDj0Djcpm1DskbRH6jxNk+PTFgljH00cnyus82p5mi?=
 =?us-ascii?Q?1+s6eKxdszEWbYS1qttd3So18gqswKDcuDcqXo9faNhLhcze6esZUNtZqnBz?=
 =?us-ascii?Q?AT1QGVQdG/pHbFPEq2ezp2F954xklVAAz18PWOPDEFFTvdwaiTphOoBv18jg?=
 =?us-ascii?Q?e6rIh6F/GhtFU3xZvWfa5utnQQEpg2J4kHlJ4Cf7E3Pi5E50sihkAC6Flm6N?=
 =?us-ascii?Q?zuT4TcBatMEhpItLbpI6Y+rAT6Unjbnab86UFa+nwTowDJslh2az/GP45f6p?=
 =?us-ascii?Q?gwHL+dcRq6VzAawgcEW18Ujg/xdyVOggMNva12+L7SM5hmp6htFRRxR9hOA8?=
 =?us-ascii?Q?Yd9FEjqLOqcM2hiw4jLSD/Nyrniq/z7fR3neqiDtlMhIXkbjphi/ZCnzkIsn?=
 =?us-ascii?Q?FfYvNinqtBGZn2aBzg68yONWPKg6v19UwQcoY93EONyi74pCv2NWutEF5lSC?=
 =?us-ascii?Q?daPAtbE0rtanYyQbSV2Nmir9oSuyo0U0IMpigmYq2amaz2b3d1/lsR0fMWVq?=
 =?us-ascii?Q?juQYqBREvsy7berziNOtF6PhRadpsklrohqjHIacyLqPw+24Ox6B4Miw0k7V?=
 =?us-ascii?Q?enmARJ36MnReV9aH5YLnhfIk6uMqHnDE+VobgBKFxs0yIq6oMuZwF6G+zQoy?=
 =?us-ascii?Q?SdonZr9q51bKbWae+7RS6hP6M5MXHKb3LiHkPsN4hovGVZs4D7nuqMne/xKe?=
 =?us-ascii?Q?7hJtvHZs9J1Wd/Xt7TO6eAbPNMrLmE1b6HXAnKC9HXabWGXf+WANgqcTJhHh?=
 =?us-ascii?Q?NqqKHA5KjsAbPLApmzt5xw7yDnl3udKqyGJlgyC/pWbpAz27PzSeM9a+K8cc?=
 =?us-ascii?Q?0Uq9zcxaca48yGNvukRH58ANEqMUx/v3xv6J+qzgZgXXYLv1Fim1QMu38WQ6?=
 =?us-ascii?Q?j1UfjQX33MgOhpsLQNbuIMwaT03dmMUnJT/k1tzr09pB2edjvNTWTSUzne0e?=
 =?us-ascii?Q?JsVxDy4BNUfK0cw5mUjr1IRR+F11vF2DNrX1unVkK4QZO479pUv31bsHZ8X2?=
 =?us-ascii?Q?XbvuI9OBdOhUHaxv99+ZzQ3KgBQOCj6pW6rpN23AuSZunmYf4UrKT+FnodUJ?=
 =?us-ascii?Q?7CBaNbCwyqyanlnCCnlAVqzOTBfHe7lgJ8ysLs6nnBt/+o7wa4w63O+9ciZH?=
 =?us-ascii?Q?7pRh1tp8zIq2OQi3jZnEI8sX9gw1yIFOb0iflxVRjj6qBVryOhvPsirsk6fM?=
 =?us-ascii?Q?MNuGbzhsmvKSEOpJhTscmrgQrJJQDqBgGpYCx8uKaf7r/uBLc6YxswVhCHY9?=
 =?us-ascii?Q?D4Guj6sih+yk8+p7QmskyTqRFZIWz2B5jTkrZdD43bUQKzFf7dj17OxwGUgz?=
 =?us-ascii?Q?4hNYngiPD11DKlGyC6k419Wt7AJpcawb4sCE84olv3EEczLwBI98eUZdDnFE?=
 =?us-ascii?Q?u2Jr4nZXHUeuvRyTyfs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:13.6794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dfe725-d41e-4f39-206d-08de1573dee1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11307
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

Introduce architecture-specific function pointers to support
architecture-dependent behaviours. This patch adds the following
function pointers and updates their usage accordingly:

- soft_reset
- l2_power_on
- l2_power_off

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v3:
 * Reverted includes changes to align with the include behaviour of the
   rest of the driver while enabling the definition of static inline
   function pointer accessors.
 * Moved the function pointer accessors from panthor_device.h to
   panthor_hw.h
v2:
 * Updated includes for panthor_hw.h to allow static inline function
   pointer accessor functions instead of MACROs.
 * updated l2_power_off function signature to void instead of returning
   int as we have no way of handling a failure in this case.
---
 drivers/gpu/drm/panthor/panthor_device.c |  4 +--
 drivers/gpu/drm/panthor/panthor_device.h |  1 -
 drivers/gpu/drm/panthor/panthor_fw.c     |  5 ++--
 drivers/gpu/drm/panthor/panthor_gpu.c    | 12 ++++++--
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  9 +++++-
 drivers/gpu/drm/panthor/panthor_hw.h     | 35 +++++++++++++++++++++++-
 7 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..847dea458682 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -141,8 +141,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_soft_reset(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 1457c1255f1f..f8e37a24d081 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,7 +26,6 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
-struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaee..e6c39c70d348 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -21,6 +21,7 @@
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -1184,7 +1185,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;

 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		panthor_hw_l2_power_off(ptdev);
 }

 /**
@@ -1363,7 +1364,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 		return ret;
 	}

-	ret = panthor_gpu_l2_power_on(ptdev);
+	ret = panthor_hw_l2_power_on(ptdev);
 	if (ret)
 		return ret;

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be0..63ed8c461796 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -18,6 +18,7 @@

 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_regs.h"

 /**
@@ -218,6 +219,11 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+{
+	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+}
+
 /**
  * panthor_gpu_l2_power_on() - Power-on the L2-cache
  * @ptdev: Device.
@@ -344,9 +350,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
 	/* On a fast reset, simply power down the L2. */
 	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
+		panthor_hw_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		panthor_hw_l2_power_off(ptdev);

 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -361,6 +367,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 }

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7c17a8c06858..12e66f48ced1 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index b6e7401327c3..ed0ebd53f4ba 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -2,6 +2,7 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */

 #include "panthor_device.h"
+#include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_regs.h"

@@ -20,7 +21,13 @@ struct panthor_hw_entry {
 	struct panthor_hw *hwdev;
 };

-static struct panthor_hw panthor_hw_arch_v10 = {};
+static struct panthor_hw panthor_hw_arch_v10 = {
+	.ops = {
+		.soft_reset = panthor_gpu_soft_reset,
+		.l2_power_off = panthor_gpu_l2_power_off,
+		.l2_power_on = panthor_gpu_l2_power_on,
+	},
+};

 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 39752de3e7ad..64616caa6f05 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -4,14 +4,47 @@
 #ifndef __PANTHOR_HW_H__
 #define __PANTHOR_HW_H__

-struct panthor_device;
+#include "panthor_device.h"
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+
+	/** @l2_power_off: L2 power off function pointer */
+	void (*l2_power_off)(struct panthor_device *ptdev);
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+};

 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
+	/** @features: Bitmap containing panthor_hw_feature */
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
 };

 int panthor_hw_init(struct panthor_device *ptdev);

+static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.soft_reset(ptdev);
+}
+
+static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.l2_power_on(ptdev);
+}
+
+static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
+{
+	ptdev->hw->ops.l2_power_off(ptdev);
+}
+
 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

