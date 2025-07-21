Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED8B0CCAE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E0610E5B3;
	Mon, 21 Jul 2025 21:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OkN9reLm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OkN9reLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013011.outbound.protection.outlook.com
 [40.107.162.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0F710E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aFXZO53hmlFXlcC9MWo5XeUv/SsDdpcxhm2kkrYAZ4O1xVIWMX/jCG7/Op6Q7N9xFePkZ9ksxsQfvdSbBh9d84sxodpAQmUmlYzZAJJpxYXykSNl1gZUhH3KGG1UDkZEETAEcZ7m5WyqkWMXFc6ALwvsw1ywWl8GkvqIhBhYtgV1CbBjN/1/SZbyMZK9S7B76OPcsICkGxD40hHmU1dRoFzQL4z6WkrTHS7QvqV0dYN2IR5e2FNEqxCN8SCYicy0QDO9vl2Oyx/AcYI67dArp8Qf53GYSlFfvui8nnOM7hCbfP3fzBdjUChoSgG1CFlnaWT1O5aLJ8hxRU3eUYNkIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8mcLTxezTBl23FL6gaiq0hV6/S/EM/tg4LYWPwtDyY=;
 b=SgUDB5FPYkPSxHJP0qZ3E6gN02j8cESP0v0yz0pNVeh1wxlfDNqC1V/NL5EVXCzFl5lCrS6p4/hCnqZchvziVAn4SuKAhPN3GSLM8kvdrF3x4JWV5HAtglzrQkxxORhIEaHUw8vRyrLdac+rBPg1j1W12JXJGRsi8uz9go7ccJNAzu7B6uWOlKvJlJEwQ3+XabhioQyCfy5R4p+B+D1w9PngSe0+w2nEmPeddDfVShUqW2jQIY3E6wIr4C61fDH+bakzyhq62CTdf8Q3IySbUzIKTdOFpfnqzD1npDoS9i0/TmvXPQEGTsftazIEj2ug6JV7VwmjkR72kvI1D0YbFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8mcLTxezTBl23FL6gaiq0hV6/S/EM/tg4LYWPwtDyY=;
 b=OkN9reLm885TuPAFYn1fNIvXAACVfZlX0jHf6p5pzW0eo/CDBdvTgUpr80Rpk09dQq9IYlBnQqtWnDqm/48EKAvNRoZgMn5zZBM3pxFZbh8QrD41Zmxb4b166s9RtmbzHuBd6C9doeA+J4oMCX82b8imXUXYnaIMsxjuLhi1bgU=
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by GV2PR08MB9349.eurprd08.prod.outlook.com
 (2603:10a6:150:da::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:36:10 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::e1) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 21:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVVIKBmf3vVRILR8x3UfGQZMEO1vPrwOJMHTqum7Q2U/M7aqtMy0jh51YD4gGrO4kenInzq2JHcx2912Jl9qGQoFl7XEUA+FAU3WYEwughFlyDToEYddNUskfu0K6iNfuv7FMFtVwsU8gUBXfLN2xbJZbrt0BGGnF1+tulmb6Ntf7tr3+2uMuSHYyWt0gWs58QFvoMoLOh8neTkz5H8Nc7GK7Oej7uKrM/Ej0Jz+IH5JWfnHB+XTfVF7G+Hx1z22r8wPpBdKWDeaefbnXFkWUp5PSDlzYnygU9CmZXLqkO7lZQXCDYHhHnHRHKqA0/gBmHhG5NHjJTqTnDV48AQabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8mcLTxezTBl23FL6gaiq0hV6/S/EM/tg4LYWPwtDyY=;
 b=bA3ZclTI0HetTYcqAdR0ELwbJgWwxnG9ycZeJfYQEbDiqUaitiACJy77U7SVJmf1KzFKo3JseqmoncEZzvZ5GhA5mKs/2coFyTeJg8yKyVl1feC8JuJ83Sj4tHqdDabqa9lZF35vjXz/ZbzuJdkuZBSjxyEwuHf80qcmGqDZEw6URKw3bKWtxH52XDB8emHTrUHMVPO6Lyh7Jz7VUCi2/+sDRBp70TCmQNblhGxNxoe+eFB61IgSvCZhFxU1UVnk8LMW1S24+MRuN25aranM6Pt7ORvnsQ7V9g3SrGa0mh1oOQDZCjgn9dvtAwj7PQwGKMlriVTw+1DePZCP0Sc1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8mcLTxezTBl23FL6gaiq0hV6/S/EM/tg4LYWPwtDyY=;
 b=OkN9reLm885TuPAFYn1fNIvXAACVfZlX0jHf6p5pzW0eo/CDBdvTgUpr80Rpk09dQq9IYlBnQqtWnDqm/48EKAvNRoZgMn5zZBM3pxFZbh8QrD41Zmxb4b166s9RtmbzHuBd6C9doeA+J4oMCX82b8imXUXYnaIMsxjuLhi1bgU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:36 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:36 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] drm/panthor: Simplify getting the GPU model name
Date: Mon, 21 Jul 2025 22:35:24 +0100
Message-ID: <20250721213528.2885035-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
References: <20250721213528.2885035-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|DB1PEPF000509E9:EE_|GV2PR08MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1f442a-eb2b-423f-69f1-08ddc89e9b70
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?vXlSnz45EzjGea8W56IMzKoPVo9gzGM2tygE60X6WurICKhtC3wjlhgsCilb?=
 =?us-ascii?Q?+TAMPCfEc3fw+LqXFghTE+Dt3HsvXz9CU7xMgCU9FRGpWx9wO1ZiVz4QHT4z?=
 =?us-ascii?Q?/lg5jKaOLil9sIGy2x98sq1xniLzwUT3tkt9M4DZBkZt45ARiDQeZkVGNqG2?=
 =?us-ascii?Q?FhGR1ih453h/MaMY3nB5UtDGLUQ51wpzCLTb7ixgtJv5L160KXKKWbl+iE+A?=
 =?us-ascii?Q?tX0tsZHr4byHa1vzSq8wR4T4NKv8JKtDUspBexDOn+7M7HwVZzUYCRcZlHxQ?=
 =?us-ascii?Q?yTB2BhwseJ8bBKcWSofn/JU104hXzUGzDbnfZ7trrusNM6pyBW8isFYMkuI8?=
 =?us-ascii?Q?+JYjbMwGNb3Naho1cWvbCJbQQJUJ8tupXrolsWMFLm+7mSfzWjvsLiXCCi6E?=
 =?us-ascii?Q?J2fNGbUycRgSf7TmrtYQb2/vTeWhpUXX9zGYtvONoK3x1rkoc96npRulL8Kx?=
 =?us-ascii?Q?alGOPOxVeeXEZHkkl7P83Cx2DcB1zFgj0ERuHHpnNKuqEo1QByqrRpRSt498?=
 =?us-ascii?Q?ghkh/vLWo/EDFahtwS0cCfSFOYsr1eBFfl4ttVOisa7g1GcWzt+zsRWdVTkD?=
 =?us-ascii?Q?wppP2qXXfaIfkA7zBLXwZ/mkDhOfDfgpeuBEpMprM9KbktxmqzQxJUo/wPm4?=
 =?us-ascii?Q?Zb1PFAIIXd1G5kLwjoACSUfRAWWDhEhTuGDx+wUjhTPRFA5HVhvhFBr9Fr3I?=
 =?us-ascii?Q?emzeK6d0RlvtNG7qkrwL1pqR8y1RC5T/0a/2yyPRqyDOPCjQ428FHye3HFfJ?=
 =?us-ascii?Q?dsDBUW0IRM1iE7ZKVrFaaW5FnsGvHYlWWuahlKPLYf9+QTicd8KzCAid1sw3?=
 =?us-ascii?Q?aOj5Pq0zzdhLbm43wsR16gvy+pFy7TdNMYOov2H7Wp65w3ORN/6KYZ7Syoho?=
 =?us-ascii?Q?Mut+w9ZHZzGIUmyDOP2R+xZ1mtivyAHxdfOtk4dF5Hst4iOqoFjyqhCHe3za?=
 =?us-ascii?Q?JT4i9m7r5dtCNwyPCmiwddxqFKlKKrDlw8MeEMlSZpc1pVUOUQJYSabN+Cz0?=
 =?us-ascii?Q?9xhNxyYJOs5BwtYMefb2Cj094m+FtyqG0plsMZX9OlbZ3erpxcs61bvs+Qyw?=
 =?us-ascii?Q?BXDhd8RA6q6d06j1DuEASMrTdGxZtSPj0pLA8KwyldpestoqNmnZksX5xjpd?=
 =?us-ascii?Q?opx/JztbMY+9l5jot5C31fnxaI6U60cpF32ca6zHBQHQBHk0fxxqNqF6K5G9?=
 =?us-ascii?Q?DPQGMP7Sd6i0tUgae8AyySnSVA4KlK7CDkWJgLj6FaypGsLAi8pI7tddZ4e0?=
 =?us-ascii?Q?e/nmHvbQRjdPirLieFjX3h3nhvx2MYL9iVrTmoKWRWUTM8NqKe84R/QkW5kQ?=
 =?us-ascii?Q?1wRiZfizbBcVazDaEbbxyFlDIQorfL4AlwDMBuAJ0Ca1xI+cchuq7dQovrlF?=
 =?us-ascii?Q?kovETewlE1ExKrj4kaURr0wAxzWkkIBIGzQOsGisgC5QbfX35Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b27b9097-e897-4f9e-2393-08ddc89e8730
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g5d01xT/jbhXvyl8emwhUScQHF2+KB+v8PAit2R3MIxhsqH41jl7Ojx3+NSE?=
 =?us-ascii?Q?mSDAxKf/Rnglp07YzfdD+0gXCZ5lTKELYbhWN2JVps8r1TD6NqP3KEwPWS7+?=
 =?us-ascii?Q?HdF9XAGZ+CeEnUnlRwtZcosf5u2Fj2s1XJQ7uBOfXhNyK/FuNzUk+c7lyszG?=
 =?us-ascii?Q?eHS2j/UVc3WZI1hJu2rOFLQningDKsYw/Ld4IoLnytqfc1RQ4UVwG3Y5R14M?=
 =?us-ascii?Q?yG9ThHuz5ONdWsspx1s1strRmXqPnz3W+RLJatC7YvQQ983qqrF/11vl2/lq?=
 =?us-ascii?Q?2qdvVWevAjWW5zxehCT8NM6enorcXAu2WFEOiHo16/IhIQpL/GzcEbgqUJQK?=
 =?us-ascii?Q?fObVNJ/ZCGgRFdBQHsm5VJIKioaM7PQcAhdTZ+zLNlVIWosZRAKGb5ic7jcE?=
 =?us-ascii?Q?pUSTj3/jaIBAF3k9ebxwv5vm4njcf7aHML19YZOtqEzNMYnPF022TMuldPJy?=
 =?us-ascii?Q?UywtwOCWQiSKn2wgS9/F8aynWI8tLDxv3Pt5GZDoAYKQC1nI/da3yNGBO0Zy?=
 =?us-ascii?Q?48lwGZmm+Ok5zmnSBmehFUhBMvtGIiQSSWntSN90XhcLgy06sU2zmUDcTR5h?=
 =?us-ascii?Q?cDaEFVAMH7ahQVPdlBCVnvjrGGQuRDVc7OOXxd2ef8eiWisb+8WMFCQTRsoh?=
 =?us-ascii?Q?VWBBEsWisrlH9774a5NAU8auGN03Uu/iC06sB/kwMihGzJbv1Pv85bCXbNV9?=
 =?us-ascii?Q?7pH94ES/JMhJRsNzEBIDfun+vb5PsCadDs6qGAa8PjolbHy7ebBuLf2IJckO?=
 =?us-ascii?Q?yjKwAULkD2LUyd2XmK6SmSS1ORgcFOadq6OK/7nmHH7nB8HKRuQHTkumnZ+J?=
 =?us-ascii?Q?nBiR/5G5raYJij3WYfC+/cPJg5f+/O9w1UlP/4AhID1aRaU1L9reVs+Fa4ST?=
 =?us-ascii?Q?3QBjIa5ow1/X857D5FLNtT8uzmNWKVSV6Wq8bSkVz1rgOpFM5o5/3S7VsZZm?=
 =?us-ascii?Q?1eYIZTAnVuTG7cawzrXakqiovmoUnH5/3SRkiDnE8JDY+KCZQNzTR80kx6pR?=
 =?us-ascii?Q?ruuks2uyn6jUID7S3Pa0qwAurzxP9Nj7ylkuK7iNKsWar8BHbf6gxPy4VBzb?=
 =?us-ascii?Q?Wg2ofJvaPoVzBJnxwmsa7HW0rokNYNOTT4ooAMre81acnmrXxFhuYT48fG0b?=
 =?us-ascii?Q?LMkzB7uwHCmUq8xqs1Idnq65ngHKo4FhW8xLZp4OJBXu6Uqtf0eTjXeMKLfX?=
 =?us-ascii?Q?PqBeG/67uL1B0WJae7OMMDXhFJoCQ3z4ieK15yhEYXQTWK0UAMsVD4/h2I9O?=
 =?us-ascii?Q?5WLPiqV4FVEIcAnkqFOR9TNDRhg+gflh1yObgDWQZZFZRQ2qvtMcoKIRuiua?=
 =?us-ascii?Q?akNFTRrINDn7ILwrShPwnsYhOsT4ulI66iWQD9OhN4A1beQ2zVgfC7W2TVeo?=
 =?us-ascii?Q?OO3SJv0yyLUtD2r863i96+dfz90RC7TL/kYjyOQ06Ex7DQkiQvcjgR+kc+IK?=
 =?us-ascii?Q?5y479PURpuPZCBlVpJU3pZ9X6oQJhgrQr6czsZzOhyUmllwoVQywWdatFcfd?=
 =?us-ascii?Q?eYH+3DPpjQYF3lmvNS6ny+t82wRvsfgttd6j?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(14060799003)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:09.3727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1f442a-eb2b-423f-69f1-08ddc89e9b70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9349
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
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

