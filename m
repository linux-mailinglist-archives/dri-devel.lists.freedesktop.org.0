Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEEB1DBA8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4C410E87F;
	Thu,  7 Aug 2025 16:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aB6LsiUR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aB6LsiUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF8410E88B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D7NBsRWD8d+I0/464ama93vy+oKzWUUZ4/7+yM4ewwHIrErNfe5o5p90VdUwkdAANI7+zX4gJKcmp410K61jS7O11ftSB7Kp3/LxfmuVdCAB7KRvurDuKo4clb4MxDJjtmk02oG5yjZLFDXN/nqTY1fb1rumoWazoh2FNvI7jDOqb8eSpI+tqJkqozeEoBFZD+TLNlVVOI+eGUwyxLRqSqys+uU4uMDJz7GJHHAdSdnI5QbN4mcdQSdZang9kroSl4lU/Ef3gAiyxoTml/HUwpsgTy9FFsPFC/zzLpLLa702dXqifPxVxl+lofp8r0oXlkpcQSl+HYJcj8K+zS9fPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=SZV8lxFvb9dHqeoHMdBzBbI6WHkrxD2ktDqElQdkJq6RAy6jOGTXOHYZOt+4hH3utLOs5HTDn/wxBmBcU5aRvTdWH/r3TIv2wsm9Ar7y6pR/KU6YbEE7lnY60I2DRu6EOJTCKqjwV1M6I3HBMM/uNDRYYvryErvqeEQCyRYp1sdzUrnEb9xuPgyJ/OnfuuOg+D8AFjgatjD0Gs+xhWPnJA8nWHlI3w8+bibvfzyiti9sbv5ysd+TsfijKRSwmccDl27Xob6OiiIelqYvAtwqyIpH0krgb5JSLbN1wOTLT/PiJVfAQfw7U6IP/5IUROBo3J4x9hus12Cnoj17Yrpj8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=aB6LsiURKGue8hCCxmDkhAZSmY7bWDJglXHiKB2s52BHEoysv5NwP86NCINUw3EgOtaJacKwS1iW2am2YdXN3Mxn9z4s1jBtt1XIWUuVZpi9R1HeE5V/iFaYMmSh9ElXLF0AbieC5LYJo2mZx/JXgkYoY8Dm4qtQfVd5OQxer6k=
Received: from CWLP123CA0144.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::36)
 by GVXPR08MB11058.eurprd08.prod.outlook.com (2603:10a6:150:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 16:27:44 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:401:87:cafe::b) by CWLP123CA0144.outlook.office365.com
 (2603:10a6:401:87::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Thu,
 7 Aug 2025 16:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWUYJiUvdQSNxmdxQFdpKuR//EWEJrTgIMyMHgF+Qepow2XQ86gmRELBrIVgm1W7irjNeSWTmuAUshrAOV8xtAv9ZZWw/p+YW5OvJY0tNfaB7+YXtaM0SwTeDUBhcrLVqbuKHTNry96ntrieDxPKM1FAHTFkrkHJ9teHMTXuRqtj/IETX68cIQRaX9JA52w3IhchEa82ei3Cpj7EdAFHiOQiH1sptLnTi+fCfnB0iMwxYRCzUrwtWuFL2Wul0fvk6cGX1yyS19er3xKxgxA+9n8F+re/lg++EKrGVKfahlBavwazdQbJVFzWtO6hxF+OVjtHkJMvCqnrNtVfDULVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=kgnBXo2Y/3BlAv9qzttJwfLMv2wlZT0f4kOCYcixGMBiboU8MyNw+GR+7tpIMZ6lkoeo2Ah0o/P6Jd6Uo6n+glyLh4x8kx3dFHKnSjmu/tODHkfbXEJquAGpegh7vbOK7nMJgaKKu9dPbyRyD79q07eRcF/cHw7z3K4cW5Jc3RgBaZnePJq30w/WnTZpqqyMNe3xbHnHyRfN+tozPN0V99HlYUNgiQe1UdJC67qJ7GdDKEtXzFU5wp14u/VE6Ghs/F7SIing0KhFAU83PMBK1Hu/+njpJ/ql+pZe9jsSsejnXVYR47QQ8bb2RXAnL90L3TF214K10tB0V2/7lwmUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjgVoDuFVFbCu37TmdReHBn3HfnSCYbKodLzFSwml8=;
 b=aB6LsiURKGue8hCCxmDkhAZSmY7bWDJglXHiKB2s52BHEoysv5NwP86NCINUw3EgOtaJacKwS1iW2am2YdXN3Mxn9z4s1jBtt1XIWUuVZpi9R1HeE5V/iFaYMmSh9ElXLF0AbieC5LYJo2mZx/JXgkYoY8Dm4qtQfVd5OQxer6k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:11 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:11 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v9 4/7] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Thu,  7 Aug 2025 17:26:30 +0100
Message-ID: <20250807162633.3666310-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AMS1EPF00000048:EE_|GVXPR08MB11058:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a478fb-33b6-40eb-e297-08ddd5cf561b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HzuEr/eadLOdD//TOp0D8y+BZ4ZZSbcb42Qye1rXOLkL70YVa0/kZqRn3taW?=
 =?us-ascii?Q?DLh11pg+TJvx5ZNfDSJvyYCRY0bIbwRvTCZvFnBRngUbki9UDHO+mepn3NxO?=
 =?us-ascii?Q?W8eobpsBrQ92veh4VCe1fQUqy9Ai/uMwnJoUTWTH00p5TRsSTAsGJKqS+ftX?=
 =?us-ascii?Q?Af+SOYRY9c0nAbZpKxD9ieYKe31sIeJO7fq6haO9uOe3kQ/s2S20Z5fa2f4h?=
 =?us-ascii?Q?O4+UaNUu3Le/ew2U7vIF1tARZNaXIvd6hFZQzyImijlYBnUqCz08RSlWVP76?=
 =?us-ascii?Q?FGidCYTS1F3N4b0UmkEylM73AJvVhDgp8rmhfCzZxiAqyYzUlLeh+TVutpHI?=
 =?us-ascii?Q?Uzvs11X+j6c1TrUoPY2xX0sl+s79R0E4sbeyX9zJQoKp3a6UlYSbvAZVM3Uq?=
 =?us-ascii?Q?iaLH/saEgFYYZ9Gr1fagSb3VCxP4AaGTxZMwRWLHdVm3YDsELWipTOczreT/?=
 =?us-ascii?Q?5QPlSuIUv3mU1NPGDMnVPw44VFT9AsxK1tjixU/CE20qa9n0go20a30l+n59?=
 =?us-ascii?Q?hNYIG1PF/6Mf8+XN8Uw4TBNFB/2eHSWFogsxVo9ngwEVchMh+zEGk+9+Tg69?=
 =?us-ascii?Q?eS1NhynVuq0KxVj0mA/4jpNMr0hx4fRa0rlvryoPUJlj7j4vCGM+Cf0oFdu5?=
 =?us-ascii?Q?6tSxVlknUlvBepT8DQ2k5BkMdDvwyeP7n10ERTaQJbSxtqX9uzUbLikXfCAp?=
 =?us-ascii?Q?TZ9aG5k8wqoPWYdoLuNLiO4pf1XngyrED+pKZEKMBv1mddRx5P/PBM2pcIZA?=
 =?us-ascii?Q?32ET0AEZtPkAu7f1RSd1vf/kKdZuY2PtLHFf08NBRRC3yQ3ioVOJFFV9UuPF?=
 =?us-ascii?Q?UI1+Km92Kz/dGQ3K6/NV/ALVzBOz7ubyz9V7YJ5LZG5XG0DilTUmmenm/Et7?=
 =?us-ascii?Q?pYGgvaCJkiUAcHRtGRaAsFunKWPqV+RY4p84PTzLuQngMjF89cGbZuW96t3w?=
 =?us-ascii?Q?N7qcUgvusLBehGS5f4l9DWg/m382OT4PI5aorYbKowvMUpADHPyCRIbo/PAr?=
 =?us-ascii?Q?CvpYtkzfhtAT6muIhBw0aVPUzsmVgu4a/PwDDQr1YIvGatUEGdfrUJEfPDey?=
 =?us-ascii?Q?y6oF6tnZ62zJgsPTfx95Ku2kGJ+tzUW3emVinGQZtz2kuaWQx7xj7B/iTUeY?=
 =?us-ascii?Q?+b8P6HCJq3rLhxb055Z39WEAGnbertypsTUtEtewUtHIyW54RI48tjxi0Fws?=
 =?us-ascii?Q?eIBZpM0IIij5sT6lFCq5l1uVHAHyR4Bi7yS97SDlJ+ejKt3JyN4FhXeQ2e1B?=
 =?us-ascii?Q?XaQYy0kMg3rLJi/F1iwNg7r2aSEFQfJf9EqMw5JifpB5FhFC329AgLOCL2B2?=
 =?us-ascii?Q?+AQ/3O6Ke/s4oaqkkW4/yjI6iRRiMRaI7LDaWCw5fmEGu0ydLOQpupaAhNA0?=
 =?us-ascii?Q?NIND+IMTU8IXVW4YJjFdb8zvq5C3RthI9bX/11zKxrka06avDA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e2d7676a-f156-4505-a18e-08ddd5cf42e5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4pQbi81ESM49coTvuLmMNxvkG8i+P+z4NiDRqEdNPszB9/huZ7k6galxb5X?=
 =?us-ascii?Q?zZNEbtXbF7DJJsb17kMA+P+7/kapvg2VazF3r+bK7VGhvKBA06uEEOafp6Tr?=
 =?us-ascii?Q?IgwMtouW9HPzOi+ZR2SoQo1DBW3UT3xInl/JEtzXkgg/H+8I4bTjUsPFJ04H?=
 =?us-ascii?Q?jszQpifPXnz87nJgqLhfbjQpR+J29Dl19n2Pqd2BRuYgOm49VLhhUzKOt7Tr?=
 =?us-ascii?Q?swyvykqQ2qdRwRuBIWNmq9BZyCKZR9uqcuAYKwh2mlpz1ZbKYRDS35D/Axtv?=
 =?us-ascii?Q?avPS/hzBK0fRU20KUvNmoQ3W8CKJqccUK4URzQiCNHlhs6L9G8RKcoKDA3q3?=
 =?us-ascii?Q?4LmKOJKFdEdE2qIDBdcK7+0s1nVXBBvZnD4qx3GToK+z6onqW/FOcDEdTWRR?=
 =?us-ascii?Q?nAD/YrUqiEZr4LIz0AVlFAEYodI2+FVHkFFrtNxJ9sKPnFgll2gU4S1mWIvR?=
 =?us-ascii?Q?FSRs67sB+s0JzjVPlf807EIKxjji5p2mPjkqBZcxzvi67crwo8JEfKz5NBYe?=
 =?us-ascii?Q?V8Tv2QX1Y3HZ2E+d1Fje0x1T0T59NwbFb+DuWCj3e6h9FMWMgU4yxacyRyBd?=
 =?us-ascii?Q?CyK0xC3QmL/7v8yHKGBMLZDa/tawd5/oTfOhWRcCUo53Z+A+qNUdJxS/e1uq?=
 =?us-ascii?Q?jqDWiXlDWkkZEkcWH0RcCirTAz8Tv7gLZfuxYS1aFDpBbjfePIoGW+mFY2Iz?=
 =?us-ascii?Q?Cu8Pql4Qk5gFSbfsX+7EhyOnMeSoPG2LKyjB1g6HZvfzi+etRUkCJxjkbc1a?=
 =?us-ascii?Q?4OgzvLHcWnmT2VjOn8nGK+En59dRKmUz2xqdK+MwYcJe1YvYPmtTCkaSX1/3?=
 =?us-ascii?Q?YaJcIpiDW5pax1Pti8tM1JEsdNnJEJMfVV5bXGGv4KDeJHvHF5lW5zt32C68?=
 =?us-ascii?Q?s2CsJqgkfAmF2MCrQ1Z+RvXQmZ1fYgyzck2aQVX1PI3kcIiTEpupZMIrfKsm?=
 =?us-ascii?Q?RZUpUYy0A+4KX9sG/wdRyI+7uQCuOoMOVOKGema9aFN9xzK21SDWWxDU7xTD?=
 =?us-ascii?Q?PqFoYEkP6jpbwlIU1eJzK3viZQUCv0dFlxCpx9+yGhao+7QL8ba/dxjhfL0D?=
 =?us-ascii?Q?VRbB+QyX1/JcV4IibQPiNoRElfv8d6PX7lTHEMX40sMalSE/9ACz6HiN5f2C?=
 =?us-ascii?Q?WpqUVbtkI87v+4POjWmrKaGgL/yd1MhYaRJpa2nVMLaRz2sKJWhMY1BdtA/R?=
 =?us-ascii?Q?6gU4C4DyK1TNFPsWwelmyrw5C0JEcKYtAtrfeTsohqQz0NFL36uafp/LgM/P?=
 =?us-ascii?Q?70lfMv1yqB/X46aSjUsUuqDSfeQgMV6xORBF5mty58cZw4Wq36FOCBFuihwy?=
 =?us-ascii?Q?3zG8f+AtXmlbGwnCuvD+36t3Aud5BWc3qoMuThY328Twd/R45mY6UPyS5bTR?=
 =?us-ascii?Q?mrzlTcuCE8EsnbjGqJJsmwiLPYSCmoiHAufMEP1vR9XQewYmARumFqVkM2kh?=
 =?us-ascii?Q?KBY7BynrRlEwDOPrT5VMsW3+k8tRIH+SEu5zVx1RgdnvdVXGXxeEvEAn/uPy?=
 =?us-ascii?Q?SW1SrFlwe4+382PPqLW5ro7xje7kZAYH9rLi?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:43.5232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a478fb-33b6-40eb-e297-08ddd5cf561b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11058
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info.

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h |  3 +++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 6d2ad3c8cb5e..8c041e1074a1 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G310";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..8bee76d01bf8 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,9 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

