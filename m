Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A037A8639C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79510EC2F;
	Fri, 11 Apr 2025 16:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QG5xQR8v";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QG5xQR8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3305510EC32
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 16:48:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sRpPKgu2bXcE6voqPhXdFv5EtObZWgajbpeUhhCKx7CrcyoZdXhbAMghN7QSxmfYj6/JhMVqz1Olmo5jHxSR6y2Jd7j0EB6AHYerbhDspxX47CzyNXhOCUFIzl12P+7Hsn9z1v1i3tLg//rQ1gzd5rV8WgA6HhrAKIh5TvK9Qj56JCrt7N1J1d7laf7umtO2kz4oTn3UwTdeBzuO+UDP2QG5/htDjMOTOg620LGSQORDsFqmIKjMygNsPUZUEalJSWA4MWT1/dX/cyTRvewtjZEKfMZjg5sF0ZUV+ZOk0l+PEOJ8sXBQcOT8rb332Jpsz2RD1p4WNxz4SPDOjU+AZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=ykd4ERhwj4Fy0/KpIJSeoo0U19O1EiafCfg6HSDxXylTuEA2WHVVGzBPaFbL1dekkPsVbAcMODkfye5b/ZeavTXZ+Sexcd1S2RnHSm2jIjsfdOnlYIcFbAsPIqeXBUuI7lYNwZCGg/waPIQC5n7+WSVjmon59O8bMSXV8a3BpGV/MvPSdvCoGc1p7iSAWzrIuwjEfwKkJA499/+8biT/cnm6O6EIez2GYwmf7j8mcdbYUP5Nooogqf5xwMK+TEktXSzjYCkWrOOPPVWdOl2nm+i8pzJLQoHH1OZyE/B9JBS3knDwR29R6Auv6lE2pIltyXryjLqaNVFzQLcIANVzZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=QG5xQR8vLVDkJIDKOS5K4RaaSDnq6//GDzbd6PpbmsbM9oLIpu67MEutsVxU6XRA599ny83B7K+q1MrOPxUZu87LtvFBq1QdsUwAr9/uebb/TP3APGfqoMvC2/s8vkaeGwD1LeOuPZoN8oj2+Tl4kVuV0Nveo4FLQtIhc6vn3Pc=
Received: from DB8P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::39)
 by AM8PR08MB5860.eurprd08.prod.outlook.com (2603:10a6:20b:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 16:48:50 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::f7) by DB8P191CA0029.outlook.office365.com
 (2603:10a6:10:130::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 16:48:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 16:48:49 +0000
Received: ("Tessian outbound 15d661e369c7:v605");
 Fri, 11 Apr 2025 16:48:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f52803acf18a4762
X-TessianGatewayMetadata: H6ImjYdMdYMFO7tuD1BvPU4sT2SxN2UOldA5jcMahmZKTJ1d5zvG966NrrP35qxBzE2MUeRUa3ABSsUJSMdlwu799SdeTC8dtCZofyF7axBgPCPet7ejh4bHr0gqgVjReWfsILeUPeEK07TZiT0sZ9h8AaCpNKq8Zh/Dp7cwy+A=
X-CR-MTA-TID: 64aa7808
Received: from L2c728b089e97.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E278D63C-140C-461C-AFC6-067A12821FC5.1; 
 Fri, 11 Apr 2025 16:48:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2c728b089e97.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Apr 2025 16:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdDNieTr1W8lkBHNO2MRmNyzEpExYGfV0bAlUtBAoVY905FKkVoq2LCAkmwn1tBzN5ibjO0T3NdpY/ZLmUXcuF/CW323Hu3JfqK0F3CcSKPHrt0qq3AR80mGtHHsmZqXaFIJlePkOEkoAr5z4Fv2xG5dKdEGzEO19EQlM4meBjsyLkBw3yaHNpIMmxNpBi0jDpRkHDOi1yaWmo8qXRCYkhNv5I7jmWhLg0anEAeovaHjYYt0pCSXs5Pl1gwr6BhPwNBmTHgcnSyvJBjln/nMpw6zlGsJVOXI2U61AFw4AxIYX0pIbejKYusLxKjL5vgydXJUD6P4SaHdmaUyjANCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=W2GLxILxL+imp5XjOn7Os0w39f1w4zq1KTnRB8mMnLQ9rZjC2gyL8isRLU5hvhwM88w0z3yDnaEdoOjnQ/pB+Nm2qCZmTvzH/TtMbllvO1JxxuR67Ik3h75QLwbb+cao8u3gTWcSRar/5DTx72jvJdCWk5KcuKrkiVn65E1C3Orj1mC9s9v/TieG4D3Ww4RQdqx2ID8xyKmapfQUCA5c21bl0TdTShkSxBEw6kdvVH0SpKmIXKkGeaY6xhz1p7XJA20wRohctE6X6RUWZJgILrgibiThvGqYJ8Aj63xZHbG7rOYGHRaUnEGR2X59F7W1yzc+Bp1YdWiXFQE88WXAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzizt5E338PnuUAEil2qsjw55tI1Oxg/xqDXZGAa6w0=;
 b=QG5xQR8vLVDkJIDKOS5K4RaaSDnq6//GDzbd6PpbmsbM9oLIpu67MEutsVxU6XRA599ny83B7K+q1MrOPxUZu87LtvFBq1QdsUwAr9/uebb/TP3APGfqoMvC2/s8vkaeGwD1LeOuPZoN8oj2+Tl4kVuV0Nveo4FLQtIhc6vn3Pc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB7605.eurprd08.prod.outlook.com
 (2603:10a6:10:308::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 16:48:39 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 16:48:39 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/panthor: Add 64-bit register accessors
Date: Fri, 11 Apr 2025 17:48:03 +0100
Message-ID: <20250411164805.2015088-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB7605:EE_|DU2PEPF00028D11:EE_|AM8PR08MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d51b99-9bd1-47c8-1455-08dd7918bc1a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?I7TJbpWGgnGibdeFCjf+5v0MFJaZ519pbJHp/7EYZ4RXAAccEe1+cS2U2Ta4?=
 =?us-ascii?Q?/d0rcuu5xccUC20Jvl8f3oJGFec0xgrepNrm1KCmaZkP84qR3a/oDsyqU2ll?=
 =?us-ascii?Q?8UOaWaO56G0T+Gm5aNFcPZBRaYdQPux+UrgSNwgWIUz2IdjjjSAFw+gnYN1a?=
 =?us-ascii?Q?tYpfQdo+gjZL7Klj+ECLtGBW0qP7BUTZE1w9juQqlTSgltcT9jQOcqsy64NL?=
 =?us-ascii?Q?uo3qwbdfhN/qJjrU40pEct5Q75yAyHARnJKYpayVdIx0iXE8WI/0pfI4gzQh?=
 =?us-ascii?Q?WOgoBnN2MX6CjJ0C1fX3+iE89u3q3jdFSmcbsbyLJEZWQiLdLRaul6juxsg2?=
 =?us-ascii?Q?ivoh57WI1lATkx3HDw6HxuKO80U1UblGHVsEbuor4ClvDU5YUAuq3AoQ8omW?=
 =?us-ascii?Q?dOBK2DWIU4vSxxR63EPB6Q9xW1WhdOhwDuNb94wB/53WGUD2UMRdl9g3YjbI?=
 =?us-ascii?Q?baMnkP/AfGhnueq4sz98xX0Agy+2U1AzDR54BZBoQMTwv3Y1cBDW5DcLV+/1?=
 =?us-ascii?Q?eaOk3P1kTo8u7CInaZ/OMmIS6qCVF6+Vd63MVNBhs7RjOuehJt/c5m/uaAc9?=
 =?us-ascii?Q?fjbbKR+dwkhNyGa0Ujd6WcVRW4pJB5rgigFfbM0ira2U8D26mBu5nOURCmT1?=
 =?us-ascii?Q?1G1FxD74d7wd6x9oGspkKrQHKYPqiFspD6cxDo1rJCDj1ebXaDvXMfWye1so?=
 =?us-ascii?Q?1Gi3V5FWe4297QxbYuaahJNC0Vj6me5AEZlJ1Y5ct6FPQeh7zZTPhwtGYz7Y?=
 =?us-ascii?Q?kpBUOeVJkC3bKgCVNCUm+M4POusSRLjk8DrDtE54dduTXvSh2vG+rdLidtG+?=
 =?us-ascii?Q?id/kylOwJiwoOSspzuQQjsjDvNM2EoLQNzbZrkzt0PlvyhBSauGfDuJg20Y6?=
 =?us-ascii?Q?vWSkZjPHl67zrkPcW/XMA+ckO3ljJ2ajCdmU5qYnJyE3hiUNtRcggVkT/QIM?=
 =?us-ascii?Q?ZJdLsp2wvPE+t85lEYnGuZt7H8htf7RDWLQEb+0rxO9IvZjsMOjrqah3Q3Jg?=
 =?us-ascii?Q?NloM4v2xH9ymz3hQrsk9ydnH0wxqxaY99JhR5zA2QqGX9XwuFRHh8swmZQbz?=
 =?us-ascii?Q?fqRJyy8KgCYrxvhCkexdneu5z7agiQSFUK8a1gt14twNcWLSFTQo5L+naOlh?=
 =?us-ascii?Q?9iQ+n+M1B63vDdtRkBxOiY+bns4CfXcf8ana6TnDY4VdZx9JKpM4CZ3YfgoH?=
 =?us-ascii?Q?pRGlQfVC4wVwBWMM/3KAPPV2dKZfMchfHBr1RedWuwROZR6dK1BAw/9S81CW?=
 =?us-ascii?Q?OTsBKUEaNE3IF58AiqTCMNZCgsQgoPkODcutBcAN7mtJd/RKqsJ9K/XVChOv?=
 =?us-ascii?Q?nXhWpHBiNEaprabBoaIADigookYC+ZVg/pFrVr+FKK+K4WRww64iXUwAbRKz?=
 =?us-ascii?Q?wGIjcUZNNHqw4FtjPBZbOdCSLBqctV6x9xHA3GxOP7kh72JqwnuuMlstUpaF?=
 =?us-ascii?Q?k5fPXCpypXk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7605
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8e053a47-f189-4cdd-6398-08dd7918b5ce
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|1800799024|36860700013|35042699022|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jNO3lh2RK337lnyuzJFOe6OLpECDnbCvf71NUb/Iz6vcHo6jilQ/gZRZmIay?=
 =?us-ascii?Q?qvvg4eocifKpv2ZEmEAOhKajW2m5spAQLURSEY57Dh0/D5+iN7nivpLGBc2s?=
 =?us-ascii?Q?lrJlBQmZCamNd0D8GVW9U0TyYxSpvCeeraZ4jBe/9PoKoXka/AHXnwXKqbq9?=
 =?us-ascii?Q?fZN9LRybLYuFy4FnI6Q5LyEtkQ0eeOgd++rQujOjnWb6rYil3ognexOwPeBN?=
 =?us-ascii?Q?bU5DNFjA4olNB5JNxNO47Tg9AachN3kLH5gZaXrZuPMpgPojOuwD9Sfm6Hfk?=
 =?us-ascii?Q?yx+XDtpPRgkCMw8oj56GAWsyYU2K6DtiLEMk53EbCaTC6MJqnjwR/3z9z67C?=
 =?us-ascii?Q?SFnEsLQzGzjdMNRZ2vpMf0YIK6iGRua2rrohOCi/NGjtWsbjIAkSymGIXWZn?=
 =?us-ascii?Q?WHo/7ZqVg8kdOXb2b60exi5Lq1oV0M1TxjX2qPJxIpoZBDsOw2hlCFtag4H5?=
 =?us-ascii?Q?ZCcs+wGwRZA8CpF91gZIe79kvlNrifF0chePqLFNHqQRVqywQU1nKQyxCDFR?=
 =?us-ascii?Q?n0mMFHiJQQp8f2lb6qVZRtT+kGcaLYa5Dalis+P9/uDaHyMptlpU5fIvMQip?=
 =?us-ascii?Q?GIqH/KIeR9C+115BB3lW+z//KbBleuhEZ33bimC/aauZ9b1flVDNnG6QusLu?=
 =?us-ascii?Q?BCmqtNeXid7bZAqh44pizA0/Y4AVPSC1Kaul2sS37F5Woshxz20704OQlLUb?=
 =?us-ascii?Q?ghhURZgt3nuMcr8OglsVXUzbeR3OXediDelZU/dpIWp2btaZmMb7fbvB2LiZ?=
 =?us-ascii?Q?K5b78l1nMnj6vUYMpGN1Aod5kBrqf6fZlI6wbxYlaMVyXGl5jKopjJQukE0m?=
 =?us-ascii?Q?yBVV6kdNvDBU1WMaGYIaQux2Zwbc+r9N408bhWDRs7qPKLvFG2zss79Fk29H?=
 =?us-ascii?Q?jYRpw1aT2xlDt2Jw36d2aDse50rVQaFqmRjIwPXSVoPzeZuR7ppUW4rQng1L?=
 =?us-ascii?Q?BTqFSdlIgB2QdP0OiEC5gZ1KgvDiBZADVNZBzgB8yylyiJu5Jblyr2KQS8er?=
 =?us-ascii?Q?cgG763zhwHj+sEBUktFjosmA/XwK4/uUD9GzwJVhYWqZ2iXcrgVP+q3P6Zjm?=
 =?us-ascii?Q?BW5vF9tQ6fHSpZFn2eARpMTAAOZNOOsx+EYHYRBO68fpEv7ywN+hNQX5xe49?=
 =?us-ascii?Q?uVSGpaI48LogEC5OCexzWaiUB6NywxG5chqXxsJbynP+2vSAT4flviaaKn2z?=
 =?us-ascii?Q?U3oM4GPaB0miJKADyAKVNDUfhZSa3mBAsSu17ricQJ92Sc3RzjpmQ64bUd4D?=
 =?us-ascii?Q?4R4Uzl2nVJqm4cMKZM9JArMZyenJf2yVVEmMY+1zwQYqbQveyMjZZRW6HpMr?=
 =?us-ascii?Q?5Haa9EtD0Gr7tBYwop746daV6lMtev7wbMLfdcxZ1IMBUThB6rm6nr/64/+U?=
 =?us-ascii?Q?pveeDpztdYyZy789PFkgDGtQ3Ub+v5rAe0pcyuXRT1MT2te1dBq9Yi/xdZXQ?=
 =?us-ascii?Q?zOyl2VJ6vIRLQJLnp1oHYlxaB94zXPaBoOujqR89f3YWx5KbXIc3rWiIBRZR?=
 =?us-ascii?Q?Pvl6AEJsEe8fLDA3vpO40/1O3HbTHxjw1Zf9ZMCTwwj3XDuwF+31tmyUMA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(1800799024)(36860700013)(35042699022)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:48:49.8167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d51b99-9bd1-47c8-1455-08dd7918bc1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5860
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

Hi all,

This patch series adds support for 64-bit and poll register accessors in
the Panthor DRM driver and performs a cleanup of the 64-bit register
definitions.

The first patch introduces new accessor functions to simplify and
standardize 64-bit and polling register operations. The second patch
refactors the existing 64-bit register definitions for improved clarity
and consistency.

v3:
- Picked up Rb tags from Boris.
- Link to v2: https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/
v2:
- Updated padding of the poll functions as requested
- Removed *_HI register definitions and renamed *_LO registers
- Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

Karunika Choo (2):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Clean up 64-bit register definitions

 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |  10 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h   | 100 ++++++----------
 6 files changed, 162 insertions(+), 204 deletions(-)

-- 
2.47.1

