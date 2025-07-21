Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDFB0C22D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F63D10E4E8;
	Mon, 21 Jul 2025 11:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="hfA5DQ64";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hfA5DQ64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6A10E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=epORJNGinOnSZ9WQqWzBhYcOtjLfl7YoTDcuduoHFd91tigm0J12i6x94bYYaUy9YViFwotVOHNZr8kaqUtB7zYEHQUSSqN1B/Jl4IYyrvE81zWl3grVMrVX1WAiNGpLDMGxpLEqPMMPDpXCpIugaooIdkGLQAhcrWiXpQgWrc+QQad9mfFOIhphIfIAGq0ooPAICtCUz5fMvBG7IA7HFIceOK9RYNw3xL6rwHO0gOjILZYsKQLDYlv1dKhkmsejeox/2Z4iyUUaBhseS+toj4RAy0bJzYKoRxMImJQkhI0S0XaZQCLH66t7GORui++GQyyEJtpNUrwbboAb7mNEQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=YCW4tOKI/D58pfLxjmvLcRDZ/iuk5YWxXH/cksHS0qvexNB5Fc52pJwPHf57HdSOXGp02/1iLELaGmHvppXNU9GoTNDhD8f3ZZltQkwwvPuw/LWlVVIzQm+gUovabXCZSH8o0UHiuOYf1HUlozl2/dSRQO6JnZQkjQORufVivEGDCpHhC2a+j5GtdtjwI7pEwitZfAgXErcwYHVFyJHaGX251RvRLJUhHTmB5DqVbgPZ8P9re+GWG/jd6xD7iRNFbYJE3nYLao3AjNpr6lpj3+0S+/uaeNi12B3Q1acNFpyb4bo4WLO2fvriAG3oEr/ZxEwrsprkPdLU2Ck80STiKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=hfA5DQ64HAZv36JMDHSNW0Oemn75RKAO5FZ7pVB9RMKoxmV+nph+pG95W4H7RZgX64YvQ9kH145sI4J3ZJ8J9QVC2FH8oqo0bbQxV2egZJsID26SnA+OlPgBmrXIlmi5DWS8WPtzzZqvt4fnrZBbj2Vl511wHxzITT2RlpbxzFM=
Received: from DU2PR04CA0230.eurprd04.prod.outlook.com (2603:10a6:10:2b1::25)
 by VI1PR08MB5472.eurprd08.prod.outlook.com (2603:10a6:803:13b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:08:19 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::74) by DU2PR04CA0230.outlook.office365.com
 (2603:10a6:10:2b1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:08:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUgRpw2JezBsLX3SM4xa5MZDQxIPkfFdWjeq7BgHOYpeXnvqfSMpLtHpncEgtop8hTETFUV5Iy0F01sMe293xMZPyc1O3gOv7hoRnx8p4hicd9ATySFvtVERpMtpC2gQs8rUUYMGO2FnYl6bDGxrW8iPrJYVFS/t0qxEwozmeAwyYQsp9WX5HtiOE8Y07JAQV/froE4xUNqJ9oXFydCXzao55DVrqhmDTO5djX1oX8ALr/3220stpfgGJ4jmocqeefV9ew9x4Nj6C9SdtPg2f9iEfq6ZwaeEXctw/Gpg4X2Ejq0qg2Q3aL42prl8eo8k9Hn6yScVysWxPp0pFJirFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=Yx0QWebZnTpYUricd8GK7Saq37sL5/QPkoare0a+EZvv5zvy5EzW8UtH9FbKPzKGZgUb64K5gQYKuX+zr4FScplA03l0bNCod20A58rj2j9U7S4e9Ug5Bft80UBsJfS8L0kIKpfQRCHIVimXJv3OOwhygFqoPlf/lkSBJt4iOoRh7Wp4fnSv9w/gdg4+u8VTCog3/mlSw+IZPts2AqXH7qF2hrGiHP9N3QXC8TGx0unPmuaM53Q/9IhKbgvOzKdfCDAsSFBoxR9mbjpmYEPApLo/HG4MPE0mmW8/s05nw5MTrtbKKzQi9XY8/lMChXxAtZcwHp7T/lEXh7XFJ+UlUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=hfA5DQ64HAZv36JMDHSNW0Oemn75RKAO5FZ7pVB9RMKoxmV+nph+pG95W4H7RZgX64YvQ9kH145sI4J3ZJ8J9QVC2FH8oqo0bbQxV2egZJsID26SnA+OlPgBmrXIlmi5DWS8WPtzzZqvt4fnrZBbj2Vl511wHxzITT2RlpbxzFM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7904.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:45 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:45 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/panthor: Simplify getting the GPU model name
Date: Mon, 21 Jul 2025 12:07:21 +0100
Message-ID: <20250721110725.1595387-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7904:EE_|DB5PEPF00014B89:EE_|VI1PR08MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: c02cb151-ef20-4721-0ac6-08ddc846e5ca
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?LQcaQ5/Igo8Prk7UXoZnVDBVlK1UDitVPQehBa6auwJXvg9JYjId6XRnZeDk?=
 =?us-ascii?Q?PbEAaIsKe9YeCF1TfnUkRkzY4Z2CrrrTvFo42ws7oowkWKwN0y+LOaoUIIfQ?=
 =?us-ascii?Q?Y7Ojn/XUCXRYykDzLQnNgjQ++U+QnpwKs42TMiT3Zdex2PvsV9ZYI/GTPU4y?=
 =?us-ascii?Q?xLWmG5qLelfcCyan5xBwx8I/meUpRMh2OofsfutUNPlIJvJ43DhQjILz1PEd?=
 =?us-ascii?Q?kflRfH3GjJZ2CzJlZrT7jLRAmSLRPb6Yb45adE6xK8LUirnEYuMbtquiz41H?=
 =?us-ascii?Q?UVFeQ/F31m5Z9VyrWBjFVpjYzsorAGOCEKDiX4fAzlt877gnX+Qmz/M3z46Q?=
 =?us-ascii?Q?mrT+CXqDlCCiJX2+q2WMy18KDs5YPwCQDJQcIzUit5D7HAioLSw/Peu8x9dq?=
 =?us-ascii?Q?z8Xdl2AVSv8AXy9REI9txlUk227NzDFtbykMeRmaA5tFAS8U4Wm8R4x8gDlY?=
 =?us-ascii?Q?jbjCWII/087OQquTj3pfvCryP6Voj+GisroIXDVHAyFqtz85L3dI9xZp7SCu?=
 =?us-ascii?Q?6nMCwdJ55MVu756csuKmT1vow08Os11QHeXU2PW5sGyoUpa+qvXsJKsaahqH?=
 =?us-ascii?Q?bcyHym9M+JaNQfRUuyaL45kmkyYNYyerKsExqqjDLEnvC60CXI7o5/q36o82?=
 =?us-ascii?Q?uRvIFMgQ4XEA8wwfV11/GvX40d3GuKpsHrM/7Qq1coIsdUT3S5tNrWdKAUm+?=
 =?us-ascii?Q?xUkOx3L0MFEbjmsuIxsB9QzmndPOpGsSb0wO/4qJucjFUHtCX5D7NgLuhQf/?=
 =?us-ascii?Q?jdfuh93WJo/eL6YgG1KnWiJvJwd9tDo4hE63OZ/E0lwhjqSFZXwOUv7/PcEn?=
 =?us-ascii?Q?bXEFsL4dPWfotWppjjD/4aikpmDM3du+Tw0vTm4cCwK9D41FDIgMkbu3kyRI?=
 =?us-ascii?Q?Zn0OdALxTPC2PmvsIhxAdiP0V/lfH+jNR6cs8zhPwOJr63ZplZ7QYCLmewxE?=
 =?us-ascii?Q?3kGUCjaN2v/j3yARioXRF8sGLXOY5oVAo5lUYzVEHYoCshnyDDM3qcJZLTCe?=
 =?us-ascii?Q?O0KovaAGKQQI67lIHwwqC7t4mmsb4jVGxYyS2fV+gEadJMDIHfTfD8bS5wkb?=
 =?us-ascii?Q?xLpqxKPAgoXbWjfEWVneXnToYSOLkPXzg3GeA1SGgoytKraJvcZSTdHHIdNP?=
 =?us-ascii?Q?yDfET/zzA/dBBEle/qRHdEdr5zTPMX1gZUS1icavEUBX8Bu47ywLqHd3Uj6D?=
 =?us-ascii?Q?bJo+/0fDIa4v2C87eU9TTytStUsn/3QEIrSJ59pa23Mn8TEOguZzkdiTVwkr?=
 =?us-ascii?Q?gqMgpvEyCC/RPX2E7Q9hQF4Xq9gud96kbimf18q5E7yks+hLctex56ucXFnN?=
 =?us-ascii?Q?PjojUlPXQZZcSott1PiTYI370PfwPNHjwjsQIxuqrP6AAMCE0/eT+GzMvwyz?=
 =?us-ascii?Q?39koR9sC1ssv+ZdyJfAueqhwEwxdpHBAzB9y5PosjfjQEVXEJg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: adf5aac6-92b7-44ff-7ad4-08ddc846d22f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|82310400026|35042699022|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ABVie6I3WdW86BS2zU0+29ZEvxSrBDYU9EKv16Xkll6Jusb5z2djPRZKKqy?=
 =?us-ascii?Q?AqFDU/sh9qQWqkkgJ+bJjQk65DiUhJ0he1cRobQ/AKMnudecKkJpUko32o7v?=
 =?us-ascii?Q?OSmneZtlzrfAEev0rFkg+a/+nvE/ugwF/Bs0e78ZVN52QdDPqmCYPi7IP0Ch?=
 =?us-ascii?Q?rt98E3jJu0IyZ2e9JOd3grlueIDKZNB4rTwDCYeavBn43MhJKgypkhVRCr/k?=
 =?us-ascii?Q?9Kw3aYs0H+0JRyOGuKNW9hTbZj5PYnBzB18OaQ9ZYKRVw51sAWV7lGTG/qXd?=
 =?us-ascii?Q?wLXRNtaZXOtevwFfEq6cN85iswc2IeBrOuoh7HQLnmT2+efjq0VerkEr4cW2?=
 =?us-ascii?Q?qxBDl6TTgp0Huxc//NwpYHM1Qab1ddcqHdCWe7wP9Sluxpx+SYFYpbkNsUXI?=
 =?us-ascii?Q?Ui3QZW/fsCDT0uiBLMRjWBKXUB9h/r3lAB4xmKYE+M7h07HSC0Ze2i9IfnQ3?=
 =?us-ascii?Q?Tc6l22e5ZXqt6gJXoupzI7ooRBep1GA8UYQSABoIBVcylmrzrsE0I6E4MM80?=
 =?us-ascii?Q?jcIYaHFDmj8tXJY++5ikAjgaSN5TRXrjT2hyHM83TN4Ys8wbrJMxSuUKEIkl?=
 =?us-ascii?Q?un7WwOxaMzb4kAOHOuHqTbG5ngroLwpGbFhHm3Yzlgdri6dsHUUoNkWaIt9p?=
 =?us-ascii?Q?6ikUXOFanWw8Lh7pRMxuXUleJ32cKC5kwJWB+zLFBCXUNbwFPpeZNLBHimak?=
 =?us-ascii?Q?jujQ+2Lg8UR/S3qJ/JG943QgwJqaGdTbgutKGK5MxlsY98oJYVkV7fch/Y/L?=
 =?us-ascii?Q?YTcXaG6x2cisnFdzcsSfxARD0WH+A35gFluACDzUPr2bFzUgOBiutgcJhlot?=
 =?us-ascii?Q?GTMk9W6HPvdm3J3nzy2FOoxB0doaj4PdZv18OUVXnNxY0SRttl2itReDh4Va?=
 =?us-ascii?Q?SI+RFGYweMCzqkCNIjEB525M29jsuASqAbdU0WQ0FVU7k7C5nO30DpI4I1Qs?=
 =?us-ascii?Q?zKJ1KyPRIFpUto3CxsCvrksqJlRsoGPtzv1OEN2H5ltExTbKGwh4wYjT9hPB?=
 =?us-ascii?Q?XbYhTSaXZ7Y/fwAkRS8GVZkW1dVIDJf9KJKW7NQvs0KkstBvRjV1IEJzqqbS?=
 =?us-ascii?Q?6djvmCX9vApB4fIYjgigNU3nX65kDLcx1GuXIKRHsYwxPIjDWQ6Oqmoq8Hyf?=
 =?us-ascii?Q?zYVXvu668E6RvRiBRI8y7hWxx1xlbhs874lu1WSQLpVZfffR6gUNYs9hHvoT?=
 =?us-ascii?Q?fe34QvVNYNvUFFb471ybIyy0a6Yrd5RC/gfNh6B6d3X1RfCTiOa0dI0sADeV?=
 =?us-ascii?Q?4qyuCFW5LzmO9xKI40w4Kx1lKKUYcRSFI5BviV8smVh7bXTW9fA7fqLWkzhi?=
 =?us-ascii?Q?zpZVa/0HGXUzro1D0j1X6hBxB560iAv3r2E503X/XJQedUmyyIRYoTWQGzyc?=
 =?us-ascii?Q?iuhY8bmc32LhXoeThs2Nqux4hYdElc9MiY5HRgFEo23zn/hmHSySQxm0bqvS?=
 =?us-ascii?Q?YTkcTVRuTs2ZDC0nJMuF146j6XH+ecNNLplOZyPuac12Oqtbt9nyHhjy+54C?=
 =?us-ascii?Q?Qr1VE6A3+4viiQ1Fn/HU8XBlXBspPiv1T0AJ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:18.3978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02cb151-ef20-4721-0ac6-08ddc846e5ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5472
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 3f7175cb0ab4..f39010c0ca86 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,39 +5,22 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
+#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
+	(((arch_major) << 24) | (prod_major))
+
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
 
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
+	return "(Unknown Mali GPU)";
+}
 
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
@@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
-- 
2.49.0

