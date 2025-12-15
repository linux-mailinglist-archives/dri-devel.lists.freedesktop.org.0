Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2BCBDA46
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7151B10E11F;
	Mon, 15 Dec 2025 11:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="TjqDpgqz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TjqDpgqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4310E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zAJtBmVEbCcJDqKCzD7juBNUukLD+9ror7pgQ3EWK487LifGnmthcOCp/sHE2LrUyGLvEoIGesl9dKFnyG6mxP1s3xOJBFFNxmNqUrIdmTty1ql7T+KGQGiY3EFqEp2QIk2MXhVyX1SuJHpqDMMLAhNMLHRQvRGxdPEcPhsaVKvaJD7r7QhOkNRn+Dsw8R3LD6JAN1jfw9J8j4QtSnMGZcErwoUsRjE3ifCjOzcWzJA7zZhro1Ugn9axyvrunaNgLK1qHZA37DwlA0c7/Uv7Hjpn636C1E7EOCQCBrf9vP27gqlbXYcUHIicYYOphwjom+lGXgpaBnkBxOAdoRS/mQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4DoaVAYuZmBlA/xsMC/o4LCJHxnuQq2CRL8nQzSPQ=;
 b=tMa+qoskxx3kRjKUXOfPDyFLEvsE0qgHXCU3uSSGCmE0U/bsaPAlgZOR9SpRCU1d6JihEhNIkHNHeYu4BjDSjR1FI/76xLWXz3UqnsygSWRhklRIm7BHrSyp9N690YDHziKlTTfPy4Q1BZB5Ole24+wlfB4o72rii+Q0oXZcy1zzy/uHl7H9v7Bb2vvdjmoQD9DhNgoE6auA5bpA0XYNDB0UC1an3KUBAbotVnULsniixq42xvdrDpXb/oa6HBxnGovD2FSRTre2QBksHHkxEsXzXRnMToN3wTHtsOSfWfm10XMc/kikDDznYlVt+3id3cIAPpikugtHTemm77c/xA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H4DoaVAYuZmBlA/xsMC/o4LCJHxnuQq2CRL8nQzSPQ=;
 b=TjqDpgqzUX7xQD6JO0rezvUXMcAWMM2sbKmPaUf9r7pblxezXdK/gzHCnEtFEH82iuHhqnDB828e6Sdh/3qoR7L3NfxQ2ffnWN4U3K/g/EtLjGthb946kQAlDdtnq3gERnAn0SHDqEChhskoQ1WD7iTcPm94K4mjFQAdNyjoYsg=
Received: from AS4P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::11)
 by DB8PR08MB5401.eurprd08.prod.outlook.com (2603:10a6:10:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:05 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::4a) by AS4P192CA0005.outlook.office365.com
 (2603:10a6:20b:5da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 11:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB6MIk+wNalfy3V5Ejpz9UpJ8f3LL5loRayC6lJOIhJstw5dhR/s8x8N5DPyrC5A1p7wkyuSStSnsFBQQYqY12DkIUmHK1Yi4JnVb+sSFM1Cgyix/HE7F33WHKG32TBEnuJfRgaZftMxAP47koztRaSBTBB/CJ8INQwPFC9nEvbVxkwWlcGj4Ne3J5sLJozhtGlFyOjYdsQAV0qmtqQzy0lS5A2WqqbGZw7UbyRLUV8IUBr+94Zv3nWm3m0zGrmYmir45SpFe9elRI839oLFJenb8v5XPzgxM+TQTLt0fIWNVjVrnPZdMNj0NbAm4aFRkp3U0ozm/Z7+eBWvNwxuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4DoaVAYuZmBlA/xsMC/o4LCJHxnuQq2CRL8nQzSPQ=;
 b=PjecxSp7oNU/nwN1JLyWqaE5L6Oty2hUQtySzb94FFf0zR/C6C4HuRbMJdVq7mNGTVwTadUyqu/32cTkCY1uuw9tLrKBl3bXCdB0uL3jEc1ATGmAuYcTdTVzA1Qz1rS1L0egDFFFqmfggte/k+BilSTBKd3cdrd2Ig85nq0NnRlLP02zVdyyWei/y/WLYEY89Da2Oi/OISEyqO0jCzThDao51jCE7sOND25LVht3GjQie2YIcbWQ0NYDU5zZ6I/IEkKkjhewCnNASo3qigWkLbkmVsjaZp6qgn6rn/AfBwzJ4K0mWvE8eb1QZc41sEROvfjlIqEjMZUjsJizKl3PUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H4DoaVAYuZmBlA/xsMC/o4LCJHxnuQq2CRL8nQzSPQ=;
 b=TjqDpgqzUX7xQD6JO0rezvUXMcAWMM2sbKmPaUf9r7pblxezXdK/gzHCnEtFEH82iuHhqnDB828e6Sdh/3qoR7L3NfxQ2ffnWN4U3K/g/EtLjGthb946kQAlDdtnq3gERnAn0SHDqEChhskoQ1WD7iTcPm94K4mjFQAdNyjoYsg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS2PR08MB9617.eurprd08.prod.outlook.com (2603:10a6:20b:60a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:02 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:02 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v1 0/5] drm/panthor: Implement fault information propagation
Date: Mon, 15 Dec 2025 11:54:52 +0000
Message-Id: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0603.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::19) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS2PR08MB9617:EE_|AM4PEPF00027A5E:EE_|DB8PR08MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d475ff-3d99-4cf5-dbba-08de3bd0ed12
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CXRjFy8lIeETxIZv1YGmBmQj4hKE8+oKxXhFjEEl9ULQPR3Txsli8KQeCD2M?=
 =?us-ascii?Q?a9oYDJxMQLJlQfEJrx5NdSM57FW6vNnh28v+NJMxiwrXbszU7j2799vc/tb/?=
 =?us-ascii?Q?VmA4UcDfoPWatwKGUEV49rNsNO2nB9F90+penxxPG/1gtlpfTYcvgVTqYcnV?=
 =?us-ascii?Q?3cNRCZ9c4fdvk/eVkaL+8kJ/MLzWymPCNyMR5YXSiEm4nwpfh+L3Xo+28shT?=
 =?us-ascii?Q?kqsXUV48qHb3469z10TjSRxlLgl2qOYXaxXteNyPagH30FWpzw5w4LujjavP?=
 =?us-ascii?Q?IY9ytTBPoXkcIiN9Kbfmwb0kEZuAaatDSkMPVgZL+eYXscaD976gvbwnbLBO?=
 =?us-ascii?Q?H0dertLlOGUvGErKWrQCF2GN2lAmYFjDD5ZgHI+WEhgsEJNHarQsDFt5/LLb?=
 =?us-ascii?Q?6h7Lfs/9CFeWj6bZiXGV0uy2/+6tKOvNIeES0m5/h8nHV9/wF3PKAaC5BTw6?=
 =?us-ascii?Q?ppBgSSenUcMi56ESSZdJY048fubFCwGMztDCWtNcA2P4gIBntVA93or5XJsj?=
 =?us-ascii?Q?JNv4MuxgVuk1Q39R0HrLNonE2vrw65Gt9sigm/5RFEOKWrUgIOj2aDNfWOqP?=
 =?us-ascii?Q?L0J+N74SRmyei/fr0js7VBbTCsfeZe2h6+IImU79SYDo8P8J3u51jb77d9gj?=
 =?us-ascii?Q?e/hTHBUD9kYSzp3siHy1KUtIc32i+3ZFZ1oeaNJv0eoOPBJL2gvU3X7ivQXt?=
 =?us-ascii?Q?bCRV+wg/HdrAOwgWGIdvsfGPC8oLgw/Jga4uqOR0SHFtLJzTYbDlMItvlNov?=
 =?us-ascii?Q?Y8MgMlxcMs4s5xTfo5SmWkIufJkA65p0L0pZl0QozLGXEogzhnWjSoAwE/bm?=
 =?us-ascii?Q?k3rC3uIEW31/say3W0kjED30evumiPL7g5IogQhmJYkrrTC9cGp7JCE/AFdX?=
 =?us-ascii?Q?3hUXN2+AYcjbsm0OKbcxQyxvpzpJwrw8ZGrj05hb+CsfC0SbYBiw50T8iHIE?=
 =?us-ascii?Q?F26JzopVKluVMweM2VHR1EPeCnY7F+DCPAaPtC2mh8vM8mIYbFMLI9hrAd83?=
 =?us-ascii?Q?p5RCnml4O13cioPS+gO8w+DvUP8IgqKJrEYeXOHYwKZG/MEGjBCWBdYmPltx?=
 =?us-ascii?Q?acC7k82+yHuPSFokv/BpYjfWGoEWWVAIPrYv4WifTN9s1T/IXRy1bbQhS/js?=
 =?us-ascii?Q?DUanaMw8RNR6civnliVryCHQxcs2+LedgxuIn0APiUibkp9aPjdtPk9vR8hV?=
 =?us-ascii?Q?Xifo+CTZ1KNbEPiabDsYzHhzdsKjV+kp+Zioo8pRw3EtZQLdVUyePUbOVJNY?=
 =?us-ascii?Q?qT7hbGEyTeexOR/ny7IjV4DB4K3sLY3qC7CS2XUcdvfKcJWAyLZXPUx1vsiP?=
 =?us-ascii?Q?j3+iyLghNAYkQxNofZlRNfVWX7KwQ3iTADuahmRqcy2+yM/tOSUSO+UN0W7f?=
 =?us-ascii?Q?pm0kKhvC8bHN924P8Z64GX3BUZOUSi3i0H6tXYpMOgqZpnC4tUZXu3WJL0o1?=
 =?us-ascii?Q?odhMaQeIrXnwV2jtR4x7NaxdDMfHW5bP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9617
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bbfda525-01dd-445d-20b7-08de3bd0c764
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/OJG5tcrF6uPE3H3VL3PkZ7qkdTRGzc8T8eTOEnlzREAJsatjM/g4zDz+RbT?=
 =?us-ascii?Q?W0KjCT4raYEBy6IHfPmuLkSydAmgveiKziQuGHrkJAMcJdSiPm4yUyELsPBw?=
 =?us-ascii?Q?c0qAMVRUfcEqx3TcMLCXtX5L0oI4nypugp6kPqjtEBVXcZ+WjIiWuzXyL0Cm?=
 =?us-ascii?Q?iPQJCgJXQfmLQLQlxhyfFGGgQOg8i2gk3PQGAJ8sUDOgow+GI7xZ/EH02UUp?=
 =?us-ascii?Q?AM+Jhpq2+Vl+mFLJ1CWdg/3T9t/6Tj7J6vPFP5YyGtRTn+KnpYofKFr5seTi?=
 =?us-ascii?Q?BLosVXh74LbOufzxqWcUfpTLXJLuCj5fxykpna5pAOiYTKJ0J3mBI0G/iVje?=
 =?us-ascii?Q?/LlgGt0aJRaotgpXk0MTMKut4CpzkmUzIGC+uRUDtBqalZAsNW2JklpbGBUM?=
 =?us-ascii?Q?bLdCN9Qy+VOT/WJjmUE2FqdJ11oXL+zVaojBRg20SUG7Aur314OpVDGItymD?=
 =?us-ascii?Q?5DaH5pVfldNk1ho/wA4NQczCmpBOLrM209sPX2ah4BRrxZyWI55YRkNoEV8c?=
 =?us-ascii?Q?lsiqahe6naV4cNSYGOJhuEeNHDPeK8MYJzPKVLd6TJK2lzgskf/oeto1/zPF?=
 =?us-ascii?Q?5dDFG8kdrRc8cc1nwJ/MvclFjq15WThJ4ajnfJxbL24g0q5o3ZX0ngWrjy8A?=
 =?us-ascii?Q?vsc66y9SHGvFbc6jNKq6SB7oxCN3eivG1KG6V4p3KNZxmn2bpx1+J/D5rEl5?=
 =?us-ascii?Q?JOZwMYfiwt6tw/DwltRNIZ3pizFsVtUK/jOWx9yocbTWiNyizpQihapR2s0J?=
 =?us-ascii?Q?I9194Do73E05VX+wcxtfVgKMcp28CvCCAuo0GRD5utShSwmNv8PsBD0sAeaF?=
 =?us-ascii?Q?WFuxGVYFFSscGTMP4sx5eK5s+/d1dIQY0n7SVIYi+gNi8qjVnJ/Cu3fidne0?=
 =?us-ascii?Q?oYpv8f/lGzwQT0ZRNhK7pNvO49u0XOf1wHHCu8QWG68WYRQPw6suf0wfdF3A?=
 =?us-ascii?Q?BD/hjPWwW3D620nmThgBISUE33rvJzfunVJN4NZwKlFMg6ctkeffn7LNAK04?=
 =?us-ascii?Q?19vPK+2zAqa5RnX0Vx3gD9LluppKiBbndCvw+9rwdyUkHuiB+HKgJD81+xdQ?=
 =?us-ascii?Q?9aIo705VY88wo4S4gnT4W3pepHoTJjEy/zU6Ku8ypt7mphCezq4fv97lkSbC?=
 =?us-ascii?Q?nKL1/tilA/8LhEWz3jS9tVOl0u7/rk141rqHhg82bFlLmAU4/c+OldNSFHWq?=
 =?us-ascii?Q?lc0Rk88heVUC7znIki9oJolDuCsC28m+Upbn4yJhuRLKMH4L7GLXWCVFecuA?=
 =?us-ascii?Q?IAgYCXmzWh+t/wyqrNZQ/VjEYTRY8B/CAl/+GqXWRYaZEgcdrsdumqVyi/+o?=
 =?us-ascii?Q?39nQgN6/St714Vf3zqiAQMaijVJVEA2EN8MKFL/Zd8a96binqNbNhzw5h1be?=
 =?us-ascii?Q?ASkA5J+0Ozt9gkpAHcmExD2J5im1FbAh2PHAJuxfWMqjPycd6FqdHz+dQ3U9?=
 =?us-ascii?Q?b6XoPru0iYVzaYRTZFp8f8QNzwX/eR8UmLjTyg78OLebOMoQQTI4IAOHH+k3?=
 =?us-ascii?Q?40iH6HOkGKad3Pr3GtXPEZ4AElfc2K2ExZfhaOz/euzEX2QHNhW1vw5ZZu4C?=
 =?us-ascii?Q?uRztdWI9o25Xoz3XVC4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:04.9006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d475ff-3d99-4cf5-dbba-08de3bd0ed12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5401
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

The Panthor CSF firmware and hardware interfaces provide additional
metadata when faults occur. In particular, there are three relevant
categories of faults here:
* faults raised at the address space level. These are fatal and each
  group bound to that AS is affected.
* fatal faults raised on one of the queues in that group, preventing
  further submissions on the group.
* recoverable faults raised on one of the queues in that group.
  The queue may progress further after this point, so multiple such
  faults may be generated.
Each of these categories provides fault information containing
sources of the error, read/write/execute bits and potentially virtual
addresses at which these faults occurred.

This series extends the GROUP_GET_STATE ioctl to propagate the fault
metadata to enable the VK_EXT_device_fault(3) extension.

Lukas Zapolskas (4):
  drm/panthor: Store queue fault and fatal information
  drm/panthor: Track VM faults
  drm/panthor: Propagate VM-level faults to groups
  drm/panthor: Use GROUP_GET_STATE to provide group and queue errors

Paul Toadere (1):
  drm/panthor: Implement CS_FAULT propagation to userspace

 drivers/gpu/drm/panthor/panthor_drv.c   |  85 ++++++++-
 drivers/gpu/drm/panthor/panthor_mmu.c   |  24 ++-
 drivers/gpu/drm/panthor/panthor_mmu.h   |  22 +++
 drivers/gpu/drm/panthor/panthor_regs.h  |   3 +
 drivers/gpu/drm/panthor/panthor_sched.c | 237 ++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_sched.h |   4 +-
 include/uapi/drm/panthor_drm.h          |  52 +++++-
 7 files changed, 378 insertions(+), 49 deletions(-)

--
2.33.0.dirty

