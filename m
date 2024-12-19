Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3D9F8105
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901289701;
	Thu, 19 Dec 2024 17:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Kcd06dLz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Kcd06dLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C26D89701
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:05:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gZK867k99uC8Xl/Nt8eBdVSrcoSNV3+wA91NPwPGCxJkyiOjimRqGppJlCZ47+gf61nphxGoSnr2irEx7hPE4bKw2vK2A1P7Aiu0Ax1Mm2cy75rNmjt0hCtOMYuWLJkBpkcls78SW5SOIkuK2rlnNClh7UhGwmQUnPbzJxUxiUbe9xUcR96TVlfF6ZUf3+pJKIUzmZtitlfuQ/fllYbctPME2klAE/hBcT+QCoZBnczlIEjeYvJsMOqi9pfHrAKIQsPuCRewz6eD3FyotLhKDAAR97U7hm/C00OHAQN7oM3VwlFClr+4QX8x0+I1yIOsszeR5X3TGYdgOE52+4X+ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WdZl8mgKzbjhVrvvE0l9KsplOgP5IptXxnMUitDinc=;
 b=JWizDbCFFoI0/uUl7R4ekFB+VTXPn/9QjituKP+qqECxNPN3Mg6nTACVMX+zQyt+yEFHfcOteaFlaRGKCzJYP4XoUaqb7Z1BGT3Bta44851kHMc3PmP7aGkRGNwLWL9XsKZxI2j1LGBrqorBSQe/Xyakk9SyfHzkALlB0B0OMzL8d08RlroOzjsifV3c2lWAvQZczLzTQFZEz78lP1D3B8nKIT8haXXh3jbSb389PQlFbRQmMp5PzLD5W2FmXebl//o68Wuxe9Gb/XGRiaqrz+cNJUeO2rr+z2rtHXltWrLUpRDANCuamRhqRchoxInlwp5EHQjjdmw29J8RYtBTlw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WdZl8mgKzbjhVrvvE0l9KsplOgP5IptXxnMUitDinc=;
 b=Kcd06dLzx0Xi2tHhU9tFdgfXbTBhE0+9p67hk+0CYesm34YMgUpOZ36L7acLwGTtnLnbtYUh39eYiPPifPLcAQ3Wtqk4UsO8dbMEoFAo80mTgFsTcsR8MrDTyBFNo8TtXzQNXCYr+FF2VElG+eIs1MOQXq2WvWu3Ghb6vAVChVE=
Received: from PR1P264CA0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34d::7)
 by PR3PR08MB5660.eurprd08.prod.outlook.com (2603:10a6:102:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 17:05:51 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:102:34d:cafe::96) by PR1P264CA0196.outlook.office365.com
 (2603:10a6:102:34d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 17:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.6 via
 Frontend Transport; Thu, 19 Dec 2024 17:05:50 +0000
Received: ("Tessian outbound 867970499bdc:v528");
 Thu, 19 Dec 2024 17:05:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e582596346a2c76f
X-TessianGatewayMetadata: ESwNnYDQsedH6LD+IFa2urXFJulHhWdwKS8oketnUOCuMagnmdbbuSzJO7HPtGpZBZfH6ilINO/6UFZ0dVn6ky0GnRvVj+ezjS+MsYCIEaP0AXBy8qMgemOPzDGJ6UybJhbnU5W5s97veG5BC2+wWC5eGLtWOGA47aJ0gKbhcjU=
X-CR-MTA-TID: 64aa7808
Received: from Laeb471f382c8.7
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93E54F76-ABE9-4F6E-A8E5-633DA394EC93.1; 
 Thu, 19 Dec 2024 17:05:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Laeb471f382c8.7 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 17:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGDAUMmpOlQ7phC6y9jw8geAcYXIGWVejIbkki1+fam6e9BQ05WqamdECYw/DnSbZohyMpJ1s+z/QRal/4DfYxpO658GgOqFrzJ8D0oudApCVuoo32YqdwLSLeSVP9OxXXqhgP4Jdm/DYuXITILwnxSmmAUDI047aNB/Vm2hhVASxbtM5Mk97jhrn3XwiO+vdxFeJf3/ECOzw9UihAhIFtAxeOwOhrnG0Z/EBV2ntDeWylGrRXC1nxIhoNk2ZEdf5v9iAIWGJgHrlNh0FnHEl5EJPHXwxsWCmIJK8YNI2rJv+1zkE1KX7WbQx1sXRW6iDspWWltROYK8lW5txPMfsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WdZl8mgKzbjhVrvvE0l9KsplOgP5IptXxnMUitDinc=;
 b=OWckIH5DBLczJMOAC/g+0467omBB4nQNqWDaFAVYFuKTPscVE3+JHIuIoxpE8BiCQ0YB6wlv6ifO9PIU4vEY+yty/Jy1DMXse7h0qXf07RIAoJqxMJIR7bLD0wL59LkbleIRuJIeq8EqQoeoKIQ26QeahKzSwpZ+TRBQpgG5jcAlXLR8T3g1gJQzXZk7Ljd2BrsqtT/3qlE4rD9EMfZ+ycpglhIdLoXQz2UCgIOUJEBeY+uvHuF4ysHE+aA+J1ppypcM1OZNShzY1lh8br2TGE+wnCQ5QCXJtNImt8Kkm3rubV+JJU7gaQg+6ZojAG4z+At/ThvlmUe+WDJSrrsxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WdZl8mgKzbjhVrvvE0l9KsplOgP5IptXxnMUitDinc=;
 b=Kcd06dLzx0Xi2tHhU9tFdgfXbTBhE0+9p67hk+0CYesm34YMgUpOZ36L7acLwGTtnLnbtYUh39eYiPPifPLcAQ3Wtqk4UsO8dbMEoFAo80mTgFsTcsR8MrDTyBFNo8TtXzQNXCYr+FF2VElG+eIs1MOQXq2WvWu3Ghb6vAVChVE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB9109.eurprd08.prod.outlook.com
 (2603:10a6:10:430::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 17:05:36 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 17:05:36 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/4] drm/panthor: Add gpu specific initialization framework
Date: Thu, 19 Dec 2024 17:05:20 +0000
Message-ID: <20241219170521.64879-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219170521.64879-1-karunika.choo@arm.com>
References: <20241219170521.64879-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB9109:EE_|AM4PEPF00025F9A:EE_|PR3PR08MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: d9514f9f-c09f-4a10-653c-08dd204f640b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?yiVcV2DGCrYFb+UvoQrqRvmelqgmSjsJVLVi8c1rIHi1KEFjp5GOb2jA/pVs?=
 =?us-ascii?Q?WSF2YXsKX5v4RRhZ11cPG0PB55LAjvAEUUHMZfmgSfM4Oqr55mdUVJrR8V8X?=
 =?us-ascii?Q?nJA1bPMwLYjgS1DU/j/0jCZYL0lYEdoM81mPygmYqQUA7v/xg6eWli8rQE7x?=
 =?us-ascii?Q?uwtTfavqOVEDqARBiLPPhtU3TBhuma+XdqBmwdVScfpzDH8XJVmTib9zO3Z/?=
 =?us-ascii?Q?iAIYbwIHN+6S6rvS2XcUqFn3lRcpi7z/L/uYLb1wXke4Skf405akNJTKbPfL?=
 =?us-ascii?Q?JB/RLwCDZiaeHeCjywORthgeSu1dzXidzHf589GHOqGu8N5hK6zAr0dtMnqg?=
 =?us-ascii?Q?TWJJp+lz3OK6CX0REjuKN/uYvrhNPh0xJlmzGXcNO7CziejYb0bfeWVa9Rp/?=
 =?us-ascii?Q?MhKwnTGnBCrbojKYbU7fh7oF9qFas93kQtyuoJWxvNT7HpfwbjjhVrVf0EQA?=
 =?us-ascii?Q?JS00KDV4DXPU/0PldbDqYmBzmKffiAKx0v/+RS6pA+rsVZcbzYxC4/UuMTDq?=
 =?us-ascii?Q?eqVTePkbwB2Al4UnPt6sjeAXzfCfCchOg/pb/GGTdPIWOnbKKuF1zyltnj0K?=
 =?us-ascii?Q?Q4KZ6abSv1MKyNyu4p/dvqyAsGN8SuZSugQTzQH7br3WZcLswElQ06L//161?=
 =?us-ascii?Q?NoLP7OP1zsExZQPuWrAWeVMS6FAOfAFBfrJY30XTwreD6t9IsfLUXAEPRwVD?=
 =?us-ascii?Q?emdm0a7b4r/OygvjR6qfz56myI0v8PtEy6P5GHHtiuvdMluq+wRbwikcRqhk?=
 =?us-ascii?Q?yXjaZDnzEO9zXoERpx46AKbnh7SDYsCPMA1OQmNgJHHJ8XwoRDmG+Qgzo8QJ?=
 =?us-ascii?Q?+MEWAs3Q/MR75zDzhSzmiCRDQwCnuo+vVbxoCGEV7TluJzXQ3i4o3tPtzjbJ?=
 =?us-ascii?Q?ldOddi/+/OUV29CB9GSAOTKzwXTBJUyFg/RjChr0dlmcSZZmoq1Dd38ImKqV?=
 =?us-ascii?Q?8tIjG42ZmIVgIJ5kjCyQBb5jqKBvOKxtoZyjg5fJen3hntf2UF9WIi5VRsZh?=
 =?us-ascii?Q?UDEL7JPJ4WQHgvmHhteBUW0xGrgEcr9TbY50JdINyvnQPrg59CGQVlOX9MRn?=
 =?us-ascii?Q?eDKwqK9Po4CqHJJobtl8xMCi/1CtJRDNafWfSlRBSDEqD9ktPmLPHln41e69?=
 =?us-ascii?Q?eJffzMSptKDc7uuWV/EH+mJwLgBfcXjeYJOXn7ZdRPxDO90y9T7iik9RWLyp?=
 =?us-ascii?Q?+E+FfW3ukmsxNuGSAbV6E7k0o2tRAuslFTlfeqkwqqLXOCxewl4ywBLhztY3?=
 =?us-ascii?Q?14V1NXLLMXv8eGf2z+ykz7vR0/lX0wBHMGM8PsZxPhptI0Hv66yUMHWOP0OC?=
 =?us-ascii?Q?dEHFFysQwZpzt9x6mYLPxZODS+46Rz8KVwK58vY9mKuOOnTu7NA0SXZdxz0c?=
 =?us-ascii?Q?s/2z+AIgqm3RI4LuWW+KKiM57mCB?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 48fe6a20-98e5-424d-c37c-08dd204f5a4d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EF6Nt3lr5IIyzT/Odzw7MOOZVidlUwHbTx9wPO9zePxmvdqA5TK42LiBBq/H?=
 =?us-ascii?Q?t/0bnNYIotnLXzx0Lz/X/nbrtk5OWd6uF/lXEB7y9oB+J6214ivH6OMU7Xy/?=
 =?us-ascii?Q?WQFPoiFeJ31ffHZDvikxUNjkDxTx+mu2js1G02qzZUmQx+D2XNkksqeBgYBe?=
 =?us-ascii?Q?4KNzWUOc79GTXKN6vRHBxrTo6iHHoP/7FeUmZ8652fdQF82hFjXOm8QUPZCR?=
 =?us-ascii?Q?73qnUZTLkIxze+johE3azMTJXsDVcS434OAXHZggYgPsOXwt/hB8yM4fOq5I?=
 =?us-ascii?Q?m4t+JsdZ8s7DE/ve5JGdH4XrNjLpcyIsgtj44ZDnfOYC9iFkEY2ciGuDcywE?=
 =?us-ascii?Q?KcuwG4EiVDuoiWUGX700rkPxaq4TuXkemy+Bcj3A1X7X2fH15fmWRwDgQ6vF?=
 =?us-ascii?Q?ZAndTaiY5lPgN96aiF3aMSgTBr5OCWxXAFEOlE2fQEbpDM/Uic4npC31Za7l?=
 =?us-ascii?Q?WlqxW9/g0MEFzygF3s2j4FXQ9RjkjqiUzX7f6LaZFxMgU904lb+shuRc5MLt?=
 =?us-ascii?Q?y+HdEga2s3qCnz7mROwoCqg9eU+7JWr21VlXL2cscjC1ejMAp9QWSUtFYkjq?=
 =?us-ascii?Q?NSRsvFOrdjR4H6s1j8NHO5KouTmCbQrbzrSnKDZ3tS7n/ESNAwtqhoRwZ2vq?=
 =?us-ascii?Q?G7KtfJv+wloLCjRA9GbAUdJL0aA0YDiYdKHkMy/oW1gTwZoSnFeI0n3lhv+m?=
 =?us-ascii?Q?J+fy5TwkKBlyVSam8uKDnwUSU+/WvINX0sgd+sWpNFFBgtCkKLjivjSruG5E?=
 =?us-ascii?Q?8hWWxuHuXcia0wzzEHzXa3bItG36XIiP8514d+hg894HnZ38UvppXwrPfqDe?=
 =?us-ascii?Q?w8k822PimZN0xhJX4ddzeSERknsb8VFhr7moqyADlOBupjsfqNWZoFSDD9Ie?=
 =?us-ascii?Q?PHS7xr7ykr7Ytj/8yR+7RTV/6D0KplB6DXIcZkcdF7/OvV3gGDfICVNu/5HH?=
 =?us-ascii?Q?N/EEzC5cdFBUbi9x/pFeyzbd755ajhEgplj3kbPnyAHAMNzIYUKj0tD/H5Ak?=
 =?us-ascii?Q?W9H9SmZGCXVk31iB4BoasPWjwRRajVyn+avbaYrT5z3ODbQjctN/LHD+u0jh?=
 =?us-ascii?Q?RxpKm2T5F5tUwdFM8hScjuafmHyJDth1WhpBwi6t5ObA8h4PHvp333sEvy5f?=
 =?us-ascii?Q?vvaEVvLPucTMPQrlrJO403r6NXE1mH68mv7vM+Q/OIfQI0axhsSdTmgBp81N?=
 =?us-ascii?Q?GqhiEVBMrDuTFepzstTXoTrr4xftWrF/ywGkJtx90JSrC4tQmfGMXHqnN0CA?=
 =?us-ascii?Q?yKZLx21rZpbEqMT/8SK0JWgV9t5AbXMT73NXVVoukFhPb9u6CTbpHKt8NZdw?=
 =?us-ascii?Q?ndtZUW/Wnk6clejwzy0J7ymg+nCne5fcWii/uTRgiMkDsOwQtXR5oU9ujVEX?=
 =?us-ascii?Q?iKqzSdcETO2bAI2HyODbZFsfsMslZrYP0a+OCYoRN6O8xXK10vDtsz1JN143?=
 =?us-ascii?Q?lSIpDi43cdplTLFxzJC4dP9Q9LzTmJGaS8mhqlZ+7GrmH2v/yrUHAZ9dIdb3?=
 =?us-ascii?Q?qUWMpArXCTq/5XI=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:05:50.8827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9514f9f-c09f-4a10-653c-08dd204f640b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660
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

This patch adds a framework for adding GPU specific code which adds the
following gpu-specific features:
- register base addresses
- feature bits
- function pointers

The above allows the handling of changes to register and register set
offsets, as well as logical changes to the code between GPUs.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c | 22 ++++--
 drivers/gpu/drm/panthor/panthor_device.h | 28 +++++--
 drivers/gpu/drm/panthor/panthor_fw.c     | 27 ++++---
 drivers/gpu/drm/panthor/panthor_gpu.c    | 44 ++++++-----
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 94 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     | 92 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 41 ++++++-----
 drivers/gpu/drm/panthor/panthor_regs.h   | 62 ++++++++--------
 drivers/gpu/drm/panthor/panthor_sched.c  |  1 +
 11 files changed, 323 insertions(+), 90 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index ab297637d172..e1f06396bd1d 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_props.o \
 	panthor_sched.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 0b74dc628489..fd261e525b7b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_props.h"
 #include "panthor_regs.h"
@@ -116,6 +117,11 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	complete_all(&ptdev->unplug.done);
 }
 
+static bool panthor_device_is_initialized(struct panthor_device *ptdev)
+{
+	return !!ptdev->scheduler;
+}
+
 static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
@@ -141,11 +147,14 @@ static void panthor_device_reset_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
+	if (!panthor_device_is_initialized(ptdev))
+		return;
+
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	ptdev->hw->ops.soft_reset(ptdev);
+	ptdev->hw->ops.l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
@@ -158,11 +167,6 @@ static void panthor_device_reset_work(struct work_struct *work)
 	}
 }
 
-static bool panthor_device_is_initialized(struct panthor_device *ptdev)
-{
-	return !!ptdev->scheduler;
-}
-
 static void panthor_device_free_page(struct drm_device *ddev, void *data)
 {
 	__free_page(data);
@@ -247,6 +251,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 60c9a67fb4a2..a984d5f9a68a 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -24,6 +24,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_props;
@@ -124,6 +125,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @hw: GPU specific data */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
@@ -365,13 +369,14 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	const u64 base = ptdev->hw->map.__name ## _irq.base;					\
 												\
 	if (atomic_read(&pirq->suspended))							\
 		return IRQ_NONE;								\
-	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
+	if (!gpu_read(ptdev, base + __reg_prefix ## _INT_STAT))					\
 		return IRQ_NONE;								\
 												\
-	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
+	gpu_write(ptdev, base + __reg_prefix ## _INT_MASK, 0);					\
 	return IRQ_WAKE_THREAD;									\
 }												\
 												\
@@ -379,40 +384,47 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 {												\
 	struct panthor_irq *pirq = data;							\
 	struct panthor_device *ptdev = pirq->ptdev;						\
+	const u64 base = ptdev->hw->map.__name ## _irq.base;					\
 	irqreturn_t ret = IRQ_NONE;								\
 												\
 	while (true) {										\
-		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
+		u32 status = gpu_read(ptdev, base + __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
 												\
 		if (!status)									\
 			break;									\
 												\
-		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
+		gpu_write(ptdev, base + __reg_prefix ## _INT_CLEAR, status);			\
 												\
 		__handler(ptdev, status);							\
 		ret = IRQ_HANDLED;								\
 	}											\
 												\
 	if (!atomic_read(&pirq->suspended))							\
-		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
+		gpu_write(ptdev, base + __reg_prefix ## _INT_MASK, pirq->mask);			\
 												\
 	return ret;										\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
 {												\
+	struct panthor_device *ptdev = pirq->ptdev;						\
+	const u64 base = ptdev->hw->map.__name ## _irq.base;					\
+												\
 	pirq->mask = 0;										\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
+	gpu_write(pirq->ptdev, base + __reg_prefix ## _INT_MASK, 0);				\
 	synchronize_irq(pirq->irq);								\
 	atomic_set(&pirq->suspended, true);							\
 }												\
 												\
 static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
 {												\
+	struct panthor_device *ptdev = pirq->ptdev;						\
+	const u64 base = ptdev->hw->map.__name ## _irq.base;					\
+												\
 	atomic_set(&pirq->suspended, false);							\
 	pirq->mask = mask;									\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
+	gpu_write(pirq->ptdev, base + __reg_prefix ## _INT_CLEAR, mask);			\
+	gpu_write(pirq->ptdev, base + __reg_prefix ## _INT_MASK, mask);				\
 }												\
 												\
 static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 51b63d258c7a..27c2e950927b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -21,6 +21,7 @@
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_props.h"
 #include "panthor_regs.h"
@@ -34,6 +35,9 @@
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
 
+#define MCU_BASE(ptdev) (ptdev->hw->map.mcu_control_base)
+#define JOB_BASE(ptdev) (ptdev->hw->map.job_irq.base)
+
 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
  */
@@ -1030,13 +1034,13 @@ static int panthor_fw_start(struct panthor_device *ptdev)
 
 	ptdev->fw->booted = false;
 	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
-	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
+	gpu_write(ptdev, MCU_BASE(ptdev) + MCU_CONTROL, MCU_CONTROL_AUTO);
 
 	if (!wait_event_timeout(ptdev->fw->req_waitqueue,
 				ptdev->fw->booted,
 				msecs_to_jiffies(1000))) {
 		if (!ptdev->fw->booted &&
-		    !(gpu_read(ptdev, JOB_INT_STAT) & JOB_INT_GLOBAL_IF))
+		    !(gpu_read(ptdev, JOB_BASE(ptdev) + JOB_INT_STAT) & JOB_INT_GLOBAL_IF))
 			timedout = true;
 	}
 
@@ -1047,7 +1051,7 @@ static int panthor_fw_start(struct panthor_device *ptdev)
 			[MCU_STATUS_HALT] = "halt",
 			[MCU_STATUS_FATAL] = "fatal",
 		};
-		u32 status = gpu_read(ptdev, MCU_STATUS);
+		u32 status = gpu_read(ptdev, MCU_BASE(ptdev) + MCU_STATUS);
 
 		drm_err(&ptdev->base, "Failed to boot MCU (status=%s)",
 			status < ARRAY_SIZE(status_str) ? status_str[status] : "unknown");
@@ -1061,8 +1065,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 {
 	u32 status;
 
-	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+	gpu_write(ptdev, MCU_BASE(ptdev) + MCU_CONTROL, MCU_CONTROL_DISABLE);
+	if (gpu_read_poll_timeout(ptdev, MCU_BASE(ptdev) + MCU_STATUS, status,
 				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
@@ -1088,10 +1092,10 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->fw->fast_reset = true;
+		if (!gpu_read_poll_timeout(ptdev, MCU_BASE(ptdev) + MCU_STATUS,
+					   status, status == MCU_STATUS_HALT,
+					   10, 100000)) {
+			ptdev->reset.fast = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
 		}
@@ -1183,7 +1187,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;
 
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		ptdev->hw->ops.l2_power_off(ptdev);
 }
 
 /**
@@ -1352,7 +1356,8 @@ int panthor_fw_init(struct panthor_device *ptdev)
 	INIT_LIST_HEAD(&fw->sections);
 	INIT_DELAYED_WORK(&fw->watchdog.ping_work, panthor_fw_ping_work);
 
-	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "job");
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev),
+				      ptdev->hw->map.job_irq.name);
 	if (irq <= 0)
 		return -ENODEV;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index ec1780fe2638..9dadcea67a39 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -18,9 +18,12 @@
 
 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_props.h"
 #include "panthor_regs.h"
 
+#define GPU_BASE(ptdev) (ptdev->hw->map.gpu_control_base)
+
 /**
  * struct panthor_gpu - GPU block management data.
  */
@@ -46,15 +49,15 @@ struct panthor_gpu {
 
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
-	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
+	gpu_write(ptdev, GPU_BASE(ptdev) + GPU_COHERENCY_PROTOCOL,
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
-		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
-		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
+		u32 fault_status = gpu_read(ptdev, GPU_BASE(ptdev) + GPU_FAULT_STATUS);
+		u64 address = gpu_read64(ptdev, GPU_BASE(ptdev) + GPU_FAULT_ADDR_LO);
 
 		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
@@ -110,17 +113,14 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
 
-	ret = panthor_props_init(ptdev);
-	if (ret)
-		return ret;
-
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	ret = dma_set_mask_and_coherent(ptdev->base.dev,
 					DMA_BIT_MASK(ptdev->props->mmu_pa_bits));
 	if (ret)
 		return ret;
 
-	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev),
+				      ptdev->hw->map.gpu_irq.name);
 	if (irq < 0)
 		return irq;
 
@@ -216,6 +216,12 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }
 
+int panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+{
+	return panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present,
+				     20000);
+}
+
 /**
  * panthor_gpu_l2_power_on() - Power-on the L2-cache
  * @ptdev: Device.
@@ -264,7 +270,7 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
 		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
-		gpu_write(ptdev, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
+		gpu_write(ptdev, GPU_BASE(ptdev) + GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
 	}
 	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 
@@ -272,8 +278,10 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
 				msecs_to_jiffies(100))) {
 		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
-		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
-		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
+		if ((ptdev->gpu->pending_reqs &
+		     GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
+		    !(gpu_read(ptdev, GPU_BASE(ptdev) + GPU_INT_RAWSTAT) &
+		      GPU_IRQ_CLEAN_CACHES_COMPLETED))
 			timedout = true;
 		else
 			ptdev->gpu->pending_reqs &= ~GPU_IRQ_CLEAN_CACHES_COMPLETED;
@@ -303,8 +311,8 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
 		ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
-		gpu_write(ptdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
-		gpu_write(ptdev, GPU_CMD, GPU_SOFT_RESET);
+		gpu_write(ptdev, GPU_BASE(ptdev) + GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
+		gpu_write(ptdev, GPU_BASE(ptdev) + GPU_CMD, GPU_SOFT_RESET);
 	}
 	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 
@@ -313,7 +321,7 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
 				msecs_to_jiffies(100))) {
 		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 		if ((ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED) != 0 &&
-		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
+		    !(gpu_read(ptdev, GPU_BASE(ptdev) + GPU_INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
 			timedout = true;
 		else
 			ptdev->gpu->pending_reqs &= ~GPU_IRQ_RESET_COMPLETED;
@@ -341,7 +349,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 	if (!ptdev->reset.fast)
 		panthor_gpu_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		ptdev->hw->ops.l2_power_off(ptdev);
 
 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -356,7 +364,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	ptdev->hw->ops.l2_power_on(ptdev);
 }
 
 /**
@@ -367,7 +375,7 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return gpu_read64_sync(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_sync(ptdev, GPU_BASE(ptdev) + GPU_TIMESTAMP_LO);
 }
 
 /**
@@ -378,5 +386,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+	return gpu_read64(ptdev, GPU_BASE(ptdev) + GPU_TIMESTAMP_OFFSET_LO);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7f6133a66127..887075a7b4d6 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS_LO, \
 				   mask, timeout_us)
 
+int panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..0fb3adc093bc
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#include <linux/types.h>
+
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_gpu.h"
+#include "panthor_hw.h"
+#include "panthor_props.h"
+#include "panthor_regs.h"
+
+enum {
+	PANTHOR_ARCH_10_8 = 0,
+	PANTHOR_ARCH_COUNT
+};
+
+static struct panthor_hw panthor_hw_devices[] = {
+	[PANTHOR_ARCH_10_8] = {
+		.arch_id = GPU_ARCH_ID_MAKE(10, 8, 0),
+		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
+		.map = {
+			.mmu_as_base = ARCH_10_8_MMU_AS_BASE,
+			.mmu_as_stride = ARCH_10_8_MMU_AS_STRIDE,
+			.mcu_control_base = ARCH_10_8_MCU_CONTROL_BASE,
+			.gpu_control_base = ARCH_10_8_GPU_CONTROL_BASE,
+			.gpu_irq = {
+				.name = "gpu",
+				.base = ARCH_10_8_GPU_CONTROL_BASE,
+			},
+			.job_irq = {
+				.name = "job",
+				.base = JOB_CONTROL_BASE,
+			},
+			.mmu_irq = {
+				.name = "mmu",
+				.base = MMU_CONTROL_BASE,
+			}
+		},
+		.ops = {
+			.soft_reset = panthor_gpu_soft_reset,
+			.l2_power_off = panthor_gpu_l2_power_off,
+			.l2_power_on = panthor_gpu_l2_power_on,
+		}
+	},
+};
+
+static int bind_hw_device(struct panthor_device *ptdev)
+{
+	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
+	struct panthor_hw *hdev = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_devices); i++) {
+		u32 mask = panthor_hw_devices[i].arch_mask;
+		u32 arch_id = panthor_hw_devices[i].arch_id;
+
+		if ((gpu_id->arch_id & mask) == (arch_id & mask)) {
+			hdev = &panthor_hw_devices[i];
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -ENODEV;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	int err;
+
+	err = panthor_props_init(ptdev);
+	if (err)
+		return err;
+
+	err = bind_hw_device(ptdev);
+	if (err)
+		return err;
+
+	panthor_props_load(ptdev);
+
+	return 0;
+}
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature)
+{
+	return test_bit(feature, ptdev->hw->features);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..3409083d09d0
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+/**
+ * enum panthor_hw_feature - Bit position of each HW feature
+ *
+ * Used to define GPU specific features based on the GPU architecture ID.
+ * New feature flags will be added with support for newer GPU architectures.
+ */
+enum panthor_hw_feature {
+	PANTHOR_HW_FEATURES_END
+};
+
+struct panthor_hw_irq_regmap {
+	/** @name:  IRQ name in devicetree */
+	const char *name;
+
+	/** @base: Base address of IRQ register block */
+	const u64 base;
+};
+
+/**
+ * struct panthor_hw_regmap - Register offsets for specific register blocks
+ */
+struct panthor_hw_regmap {
+	/** @mmu_as_base: Base address of MMU address space 0 */
+	const u64 mmu_as_base;
+
+	/** @mmu_as_stride: Address offset between subsequent MMU address spaces */
+	const u64 mmu_as_stride;
+
+	/** @mcu_control_base: Base address of MCU_CONTROL */
+	const u64 mcu_control_base;
+
+	/** @gpu_control_base: Base address of GPU_CONTROL */
+	const u64 gpu_control_base;
+
+	/** @gpu_irq: GPU IRQ regmap */
+	const struct panthor_hw_irq_regmap gpu_irq;
+
+	/** @job_irq: JOB IRQ regmap */
+	const struct panthor_hw_irq_regmap job_irq;
+
+	/** @mmu_irq: MMU IRQ regmap */
+	const struct panthor_hw_irq_regmap mmu_irq;
+};
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+
+	/** @l2_power_off: L2 power off function pointer */
+	int (*l2_power_off)(struct panthor_device *ptdev);
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+};
+
+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+	/** @arch_id: Architecture id to match against */
+	u32 arch_id;
+
+	/** @arch_mask: Mask for architecture id comparison */
+	u32 arch_mask;
+
+	/** @features: Bitmap containing panthor_hw_feature */
+	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
+
+	/** @map: Panthor regmap */
+	struct panthor_hw_regmap map;
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
+};
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature);
+
+#endif /* __PANTHOR_HW_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 2b6d147a2f0d..8a190dd2e06c 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -30,12 +30,17 @@
 #include "panthor_device.h"
 #include "panthor_gem.h"
 #include "panthor_heap.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_props.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
 #define MAX_AS_SLOTS			32
+#define MMU_AS(ptdev, as) \
+	(ptdev->hw->map.mmu_as_base + ((as) * ptdev->hw->map.mmu_as_stride))
+
+#define MMU_BASE(ptdev) (ptdev->hw->map.mmu_irq.base)
 
 struct panthor_vm;
 
@@ -510,9 +515,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
 	/* Wait for the MMU status to indicate there is no active command, in
 	 * case one is pending.
 	 */
-	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
-						   !(val & AS_STATUS_AS_ACTIVE),
-						   10, 100000);
+	ret = gpu_read_relaxed_poll_timeout_atomic(
+		ptdev, MMU_AS(ptdev, as_nr) + AS_STATUS, val,
+		!(val & AS_STATUS_AS_ACTIVE), 10, 100000);
 
 	if (ret) {
 		panthor_device_schedule_reset(ptdev);
@@ -529,7 +534,7 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 	/* write AS_COMMAND when MMU is ready to accept another command */
 	status = wait_ready(ptdev, as_nr);
 	if (!status)
-		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
+		gpu_write(ptdev, MMU_AS(ptdev, as_nr) + AS_COMMAND, cmd);
 
 	return status;
 }
@@ -564,7 +569,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_LOCKADDR_LO, region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,9 +619,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_TRANSTAB_LO, transtab);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_MEMATTR_LO, memattr);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_TRANSCFG_LO, transcfg);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -629,9 +634,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	if (ret)
 		return ret;
 
-	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
-	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_TRANSTAB_LO, 0);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_MEMATTR_LO, 0);
+	gpu_write64(ptdev, MMU_AS(ptdev, as_nr) + AS_TRANSCFG_LO, AS_TRANSCFG_ADRMODE_UNMAPPED);
 
 	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
 }
@@ -767,9 +772,10 @@ int panthor_vm_active(struct panthor_vm *vm)
 	 * before enabling the AS.
 	 */
 	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
-		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
+		gpu_write(ptdev, MMU_BASE(ptdev) + MMU_INT_CLEAR,
+			  panthor_mmu_as_fault_mask(ptdev, as));
 		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
-		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
+		gpu_write(ptdev, MMU_BASE(ptdev) + MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
 	}
 
 	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
@@ -1664,8 +1670,8 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 access_type;
 		u32 source_id;
 
-		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
+		fault_status = gpu_read(ptdev, MMU_AS(ptdev, as) + AS_FAULTSTATUS);
+		addr = gpu_read64(ptdev, MMU_AS(ptdev, as) + AS_FAULTADDRESS_LO);
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
@@ -1697,7 +1703,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		 * re-enabled.
 		 */
 		ptdev->mmu->irq.mask = new_int_mask;
-		gpu_write(ptdev, MMU_INT_MASK, new_int_mask);
+		gpu_write(ptdev, MMU_BASE(ptdev) + MMU_INT_MASK, new_int_mask);
 
 		if (ptdev->mmu->as.slots[as].vm)
 			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
@@ -2707,7 +2713,8 @@ int panthor_mmu_init(struct panthor_device *ptdev)
 
 	ptdev->mmu = mmu;
 
-	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "mmu");
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev),
+				      ptdev->hw->map.mmu_irq.name);
 	if (irq <= 0)
 		return -ENODEV;
 
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index bad172b8af82..9f22c16e5dac 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -12,7 +12,6 @@
 
 #include <linux/iopoll.h>
 
-/* GX10 registers */
 #define GPU_ID						0x0
 #define   GPU_ARCH_MAJOR(x)				((x) >> 28)
 #define   GPU_ARCH_MINOR(x)				(((x) & GENMASK(27, 24)) >> 24)
@@ -42,6 +41,8 @@
 #define GPU_AS_PRESENT					0x18
 #define GPU_CSF_ID					0x1C
 
+#define ARCH_10_8_GPU_CONTROL_BASE			0x0
+
 #define GPU_INT_RAWSTAT					0x20
 #define GPU_INT_CLEAR					0x24
 #define GPU_INT_MASK					0x28
@@ -145,41 +146,46 @@
 #define   GPU_COHERENCY_ACE_LITE			1
 #define   GPU_COHERENCY_NONE				31
 
-#define MCU_CONTROL					0x700
+#define ARCH_10_8_MCU_CONTROL_BASE			0x700
+
+#define MCU_CONTROL					0x0
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
 #define MCU_CONTROL_DISABLE				0
 
-#define MCU_STATUS					0x704
+#define MCU_STATUS					0x4
 #define MCU_STATUS_DISABLED				0
 #define MCU_STATUS_ENABLED				1
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
 
 /* Job Control regs */
-#define JOB_INT_RAWSTAT					0x1000
-#define JOB_INT_CLEAR					0x1004
-#define JOB_INT_MASK					0x1008
-#define JOB_INT_STAT					0x100c
+#define JOB_CONTROL_BASE				0x1000
+
+#define JOB_INT_RAWSTAT					0x0
+#define JOB_INT_CLEAR					0x4
+#define JOB_INT_MASK					0x8
+#define JOB_INT_STAT					0xc
 #define   JOB_INT_GLOBAL_IF				BIT(31)
 #define   JOB_INT_CSG_IF(x)				BIT(x)
 
 /* MMU regs */
-#define MMU_INT_RAWSTAT					0x2000
-#define MMU_INT_CLEAR					0x2004
-#define MMU_INT_MASK					0x2008
-#define MMU_INT_STAT					0x200c
+#define MMU_CONTROL_BASE				0x2000
+
+#define MMU_INT_RAWSTAT					0x0
+#define MMU_INT_CLEAR					0x4
+#define MMU_INT_MASK					0x8
+#define MMU_INT_STAT					0xc
 
 /* AS_COMMAND register commands */
 
-#define MMU_BASE					0x2400
-#define MMU_AS_SHIFT					6
-#define MMU_AS(as)					(MMU_BASE + ((as) << MMU_AS_SHIFT))
+#define ARCH_10_8_MMU_AS_BASE				0x2400
+#define ARCH_10_8_MMU_AS_STRIDE				0x40
 
-#define AS_TRANSTAB_LO(as)				(MMU_AS(as) + 0x0)
-#define AS_TRANSTAB_HI(as)				(MMU_AS(as) + 0x4)
-#define AS_MEMATTR_LO(as)				(MMU_AS(as) + 0x8)
-#define AS_MEMATTR_HI(as)				(MMU_AS(as) + 0xC)
+#define AS_TRANSTAB_LO					0x0
+#define AS_TRANSTAB_HI					0x4
+#define AS_MEMATTR_LO					0x8
+#define AS_MEMATTR_HI					0xC
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
 #define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
 							 ((w) ? BIT(0) : 0) | \
@@ -191,9 +197,9 @@
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
 #define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
 #define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
-#define AS_LOCKADDR_LO(as)				(MMU_AS(as) + 0x10)
-#define AS_LOCKADDR_HI(as)				(MMU_AS(as) + 0x14)
-#define AS_COMMAND(as)					(MMU_AS(as) + 0x18)
+#define AS_LOCKADDR_LO					0x10
+#define AS_LOCKADDR_HI					0x14
+#define AS_COMMAND					0x18
 #define   AS_COMMAND_NOP				0
 #define   AS_COMMAND_UPDATE				1
 #define   AS_COMMAND_LOCK				2
@@ -201,18 +207,18 @@
 #define   AS_COMMAND_FLUSH_PT				4
 #define   AS_COMMAND_FLUSH_MEM				5
 #define   AS_LOCK_REGION_MIN_SIZE			(1ULL << 15)
-#define AS_FAULTSTATUS(as)				(MMU_AS(as) + 0x1C)
+#define AS_FAULTSTATUS					0x1C
 #define  AS_FAULTSTATUS_ACCESS_TYPE_MASK		(0x3 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC		(0x0 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_EX			(0x1 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_READ		(0x2 << 8)
 #define  AS_FAULTSTATUS_ACCESS_TYPE_WRITE		(0x3 << 8)
-#define AS_FAULTADDRESS_LO(as)				(MMU_AS(as) + 0x20)
-#define AS_FAULTADDRESS_HI(as)				(MMU_AS(as) + 0x24)
-#define AS_STATUS(as)					(MMU_AS(as) + 0x28)
+#define AS_FAULTADDRESS_LO				0x20
+#define AS_FAULTADDRESS_HI				0x24
+#define AS_STATUS					0x28
 #define   AS_STATUS_AS_ACTIVE				BIT(0)
-#define AS_TRANSCFG_LO(as)				(MMU_AS(as) + 0x30)
-#define AS_TRANSCFG_HI(as)				(MMU_AS(as) + 0x34)
+#define AS_TRANSCFG_LO					0x30
+#define AS_TRANSCFG_HI					0x34
 #define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
 #define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
 #define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
@@ -230,8 +236,6 @@
 #define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
 #define   AS_TRANSCFG_WXN				BIT(35)
 #define   AS_TRANSCFG_XREADABLE				BIT(36)
-#define AS_FAULTEXTRA_LO(as)				(MMU_AS(as) + 0x38)
-#define AS_FAULTEXTRA_HI(as)				(MMU_AS(as) + 0x3C)
 
 #define CSF_GPU_LATEST_FLUSH_ID				0x10000
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 209fd9576969..0c420e8c0acb 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3838,6 +3838,7 @@ int panthor_sched_init(struct panthor_device *ptdev)
 			ptdev->props->mmu_as_count);
 		return -EINVAL;
 	}
+	gpu_as_count = ptdev->props->mmu_as_count - 1;
 
 	sched->ptdev = ptdev;
 	sched->sb_slot_count = CS_FEATURES_SCOREBOARDS(cs_iface->control->features);
-- 
2.47.1

