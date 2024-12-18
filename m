Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3C9F630F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D637110EB56;
	Wed, 18 Dec 2024 10:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="S8bpINp/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S8bpINp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3210EB50;
 Wed, 18 Dec 2024 10:32:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Kw2mfiupF8m0lmdG6Zsf79MMU7DF9tq/FlBNhr0fNq5Nrz5kp6c+E1hkL6ZoxQEnwLkbemKK+0H5NArt8Px7bW2GaSzBhIZGzhaVlbQYjGRabQBPZdG0Vwz1k8zg4krZKS+KbCYWIh7qJV27yHFKL1JSdTlMwLgnt2ndBEN0q6/ZkU0DF9kYJajzVbEl35DufklqYxnUsKXhEY2ozXNyvfGJf1CSnGb7029+SU1as8lRPM5NksxE9Qr9C+kBVG8q44bQPHr7VWs1HOa0nex6YaZ244wqUl1q/OV5AET7CdIyLM6pVrq41FUwuLcl7DOYtMRa7/nNOcsJ8wAJAzSBMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzcZyGwrbbtZWfKN/ZvihvH7SapUcTjZoOgtKsRXO6Y=;
 b=WdkrPshRqh/6Js3Y9aiUo8fx+HlB6ezGxwWDAfDQJCZIa6ROKOwLz58Bru/eA7f/d7bL/618wRv40fYX2Oh3q14feib4Oa7R+LGg/CkPZv4TiZ+R3KXAThbB6q/sqT1hV0ZCOE9Hbq3tNpDD8PTCEAL/cb3+wLRRizruOq0ox8u9atGhRIXc8MURIGAlBVTWlG9iB5L/Nx9KBEHsUCQcVy4eYP+BCBvjVf6PrBLpqaof7BZddxF+sJPII2zqB7vHZQCt1seItvilmHmmMKs6B26bLibpdpHECKGUgK9jV1umTGjMOlB1xhnORkw0iuPPfK+2yAoY24DlToppQSw8Dg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzcZyGwrbbtZWfKN/ZvihvH7SapUcTjZoOgtKsRXO6Y=;
 b=S8bpINp/xvDdJ3N/a+FJweVEoCEiyuMe8imn2oSbV8Yrns5nvyAqpM7y70MVJh7SrRS+LMTcr9Qb2SEcrc4Gek2OXN7IZpy4YBdm70dCD0aCPE9HusYSFFlQDlTA/9Spw01w0zHHAs0dYGhmalxal+unsJ35jxDzl1Te1RzGvx4=
Received: from AM0PR02CA0219.eurprd02.prod.outlook.com (2603:10a6:20b:28f::26)
 by GVXPR08MB7798.eurprd08.prod.outlook.com (2603:10a6:150:4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:32:21 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::45) by AM0PR02CA0219.outlook.office365.com
 (2603:10a6:20b:28f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 10:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:32:20 +0000
Received: ("Tessian outbound 7762b28e8285:v528");
 Wed, 18 Dec 2024 10:32:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85c666fb44ffb838
X-TessianGatewayMetadata: qEnMuRhRywvjgXenXBLSEcOHguHCN6dYEvVHgfnrkqDJpCV2HluxMqdNygrSWX+eSweSdVmEeb1/fCCjApx9o9F3d0u4LsLbIIYtZBNwqNzttGSaMWO/3cWnNTz0aGt3EpvfF0nEEfAOLJJc7GlVy+fltnSlEsowrPJcYIdnDuGCRnGuLkLupN0xaHWIhL+w
X-CR-MTA-TID: 64aa7808
Received: from L0033a9369092.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A13B318-D851-4F5E-9D8D-89D022B034CB.1; 
 Wed, 18 Dec 2024 10:32:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0033a9369092.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 10:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY7Z5SRDFITc0rwIZfTOr+plATnJ7I82CL2B1YLGIjqG4bgPr33/LZyHuk4/S2OVdi53N6PGtqcCjOIacm9DV21kyzHKIXFBwa7+KJZJB8YqHJ0BzLDu4Sg6OTak3X5H01f/Z0fchf/6c3ZlMaDSiK3l3oYSqDFrbiT6UsUK+Fr0e98Ed2Om1IpT4fObi8R+0wECKMfxs14Qy0QUvBbV96mS0WIUYg7K96bxTIjPYcxFVyMQDGpsy75jkvDv/omDpCZQSOWOg7WUj/TVE7bFE/qqsXgaN2pIW3Dg8ucGARl3Sw/1YM8k17YMUgo5L3odGbdSrBaQhU9IMiVRo2lvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzcZyGwrbbtZWfKN/ZvihvH7SapUcTjZoOgtKsRXO6Y=;
 b=JcfRBvO+huDYU62aqL/3EUwc8c5lJxpStsUvHDsEvOuG4gzY4/9pfFX5rFFw59qVoOjLrd6R4/7EipcAHeL46ZP5O14yo3bdTDX3SmqooOM8vNV4HDL4bN/GET8PphvEezLSj/dP1B+gesuRnZjROTfkLIEHnPG2rJzCl3K0W54m5RClfDkiA6KoQ04ZP9SlNPf7REltxcmvAE+umLIw+iLW+HyqPWKVR+JywhKpdkr4+9ImXr7ggJtg3sX9txVAlaHHmpFmRU3obtuTIcvkASR/D74kszuiwor6XphuhurSW6H/Cn0nGbvIkIQl2e0FX+vxgBBcxFOSo037laePmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzcZyGwrbbtZWfKN/ZvihvH7SapUcTjZoOgtKsRXO6Y=;
 b=S8bpINp/xvDdJ3N/a+FJweVEoCEiyuMe8imn2oSbV8Yrns5nvyAqpM7y70MVJh7SrRS+LMTcr9Qb2SEcrc4Gek2OXN7IZpy4YBdm70dCD0aCPE9HusYSFFlQDlTA/9Spw01w0zHHAs0dYGhmalxal+unsJ35jxDzl1Te1RzGvx4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB8566.eurprd08.prod.outlook.com (2603:10a6:20b:567::13)
 by DU4PR08MB10936.eurprd08.prod.outlook.com (2603:10a6:10:571::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 10:32:10 +0000
Received: from AS8PR08MB8566.eurprd08.prod.outlook.com
 ([fe80::3ed0:c669:404d:832c]) by AS8PR08MB8566.eurprd08.prod.outlook.com
 ([fe80::3ed0:c669:404d:832c%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:32:09 +0000
Date: Wed, 18 Dec 2024 10:32:08 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To AS8PR08MB8566.eurprd08.prod.outlook.com
 (2603:10a6:20b:567::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB8566:EE_|DU4PR08MB10936:EE_|AMS0EPF000001AC:EE_|GVXPR08MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e8f0d4-a460-4260-68ce-08dd1f4f40d7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?oQIIdmeIFzN1iiMDbEuk22II1tjMkVCB/yz/Bi52i+C/vPVB5ja5J4FnOuXy?=
 =?us-ascii?Q?BMez8exkk+dXco9Iba+5pc3aey5Wyb03NGwr1L8NVp/JF894+Vn8cm/HfMz5?=
 =?us-ascii?Q?iZIqJLuaPOwm1lSDdnW6VW/OyS01htzgke2iTMGRyssybm4/McdAaHLCs6v1?=
 =?us-ascii?Q?wp6qj3+DEPp07nw6zY/bav49dW8nbIBJBiV9f9yKAq2DrR4ERJYTeCkHEhlb?=
 =?us-ascii?Q?h7RBqGfTE227zrWoCvSYxahqnHdZ59vPhM11nFSGe5M2qyh8hqY5pUz593HI?=
 =?us-ascii?Q?YTNEB20UXjkjYVYuXh3ET7o7Cf/lnizid+3rtLT0KybAW4vsuCZcCQ1FeZHq?=
 =?us-ascii?Q?Z/hG1zRprW7NhC2YCk5jt0dEz6WiP6Z1DJP0TX/QJKb/cbRuJdyRIpRwSRIC?=
 =?us-ascii?Q?eBW8Ut95OnS6bDMJSzJvay7xAP+IG9xkr/8LHfsvExQc6GlCbKq6ds0b5Huo?=
 =?us-ascii?Q?K7yjSypr/2gatNcbfo2/ZtAf43O7SOSDIUm+SKWYnuRhRfULwbyaA/I/q8E4?=
 =?us-ascii?Q?Eq5XOxSHeYJPxNoWshSlHeKdIqrcXZy6lCg7Ke2x3JZOuSb8743qXb1mZFhz?=
 =?us-ascii?Q?3N30gvBm1FLY1Cx/bN6mVYi7XWPmg5ZriedBdQLW1r6F28p+T5SKJPnS1DM0?=
 =?us-ascii?Q?8wqeSkg83O8VqRmeKnGdLQIAdVnEBvCUgeuCdJiCiVKN7/Ps5esXNbnuU3xk?=
 =?us-ascii?Q?QyZwKtuXR96Yh407h5JkW3mm2XPalYIbKBKX4S0Mkiqqmuv8/A+T20KJLMHJ?=
 =?us-ascii?Q?sNB7TxUhYKsChGI5uFkJMytJkQRfzDGHZEvdctyGZ6SwXGpvu+M1EMFCUoLk?=
 =?us-ascii?Q?7ZFU0HcxyGEMzKghRxL6qihwQiX7TkfkU8+jdIzwpvMHdyUaNvjiw+etZmu7?=
 =?us-ascii?Q?0Yh244yi4VoGN6Rs43o5xAkVmzW/vg47daIdLLks3B3OZW1rWV5Czjq2lopH?=
 =?us-ascii?Q?rgyUuIPlotiOI1+/r9juC06mzkoTzYC3seBF/+a+5+COorhWICiQzovjx7bC?=
 =?us-ascii?Q?ECIjGCcheqonTtVOQ/XSXfwrOlOgGTL6TM1Nl/hDIsHBOMMSkaB+t4RJGmq2?=
 =?us-ascii?Q?kEb94MZhWmnDzKbry2Y2qPLmNuer7jLbk8Sebkn8t6xN+1PG/ysufhG8dV9F?=
 =?us-ascii?Q?lMxiKyeGoOGzcGMpY4cl6ns4JvNWc3O99FDMYtjSEdU7BSbX4GCflIEoOLyq?=
 =?us-ascii?Q?wedEQ5EjKFsF8mrofrEmHyPbuWcGUtBY+azxKAdAkO0pjn9roHHKhxWmgpgZ?=
 =?us-ascii?Q?rsaFGS2EfPIZJISrPjOizK8+ZbduFIsZqm6c0FNyhDPoffN5Nej92lZbmIyb?=
 =?us-ascii?Q?X3LeY12K9X6TjdJPZuYtC8iJVWZ03Q8AdaeAZxQ1CBLIZm7s5sygwpYFZNZK?=
 =?us-ascii?Q?ghXqJ7oXSNORzU41t1lWb+aXEsKq?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB8566.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:567::13];
 domain=AS8PR08MB8566.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 105fbe76-9373-41a9-ce6b-08dd1f4f3a47
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mETZLC8bfL382ctG6pQvVxe2y+1OvX/17ekMm8bWh8dFE50vNeE8FdThwc/Q?=
 =?us-ascii?Q?iepDZzbVTPRljdU6/T+E9K2IhrKS8i2Vv6NnjK17vRV0M5M8EKzuDiXALaJi?=
 =?us-ascii?Q?WuvlD1WdR9n974BWD/gw6t25e58pDKvkkioBwAdBVDf+Dn2mKMQGadxCw/FB?=
 =?us-ascii?Q?S7cRRPl3z8kjHbXHPKowRt2kuGkSCnfLYKthQp8p5IVOFiV9Qash8uXD2ROo?=
 =?us-ascii?Q?ywPv46mY5+VIbP9q8ToEKUWXwaTjG/kU0QllhLyGq/qYS6D3bFZxIXh10zbx?=
 =?us-ascii?Q?AWTnTnELUJdZHS48EgvPY7laj0Z6nrnCD/LFsNXwHp1I55UMLN7p1ChYE0J8?=
 =?us-ascii?Q?KxDFvkeO4I1rfsShRS2Zk2gHjaRIJA1E8mPDbzc46SZG++bl5tgJzWPrztvm?=
 =?us-ascii?Q?v9CexRq3hqh93AMMdAUI72yY20Ww5DLku8/fIGVXG57Q3Bd31eRsBmJmdy5M?=
 =?us-ascii?Q?rVjFFgcHEv+yl+zvfgXfPTRclsTcYTXPixsnIRG8MgkAbGr/EcvoveE4jwQQ?=
 =?us-ascii?Q?Dlk6yG/bqbtN9eAQGf/GDDzWb4UuC1/yWzp9A7rteN2zLALsqBRYChJLYzX/?=
 =?us-ascii?Q?+DLB4Y1KFx9xCxQ+Qw40IhcNf2KlnpZwYCuEzsqo/x1t9QADovVioegKFs/D?=
 =?us-ascii?Q?Rtpd8GyJL+E8rhvWTSvbxCGEcavdDQ2RdyMsTgoomZOFYOnROH+vw1G5I5qH?=
 =?us-ascii?Q?Wv593vvUr2k3qYzOZhCT4wYqrBdofAnKerQpD8+cZ76je4HvWfJUEPUF7IcY?=
 =?us-ascii?Q?Z20AGa7CVXfE7tkR2cYpVz+A145islyjvF1Dv5zZ2E86vL3WAMFWTE8fBn1F?=
 =?us-ascii?Q?5g8J0ljDKXb+84nKgCpzdTWq6wzv6BvVJmUjQoGwJL9gYn1mEA0ngfbPsrgT?=
 =?us-ascii?Q?x2goz1FsgwacBSqwIjWhwb/zDmTfFDTVyx9khSmZ2AuZwAOb6tHLgtYWE/cL?=
 =?us-ascii?Q?k8uCTeFnMierJu8nck3To52ILvzdENmjf8PwoZktbtZgaa7QMnUKre+gQS69?=
 =?us-ascii?Q?oOIhtox6S3biCNcQKtE2m91jxWjeJ69jC664MnqPAJaXtmR3e9GFHmZvw7N+?=
 =?us-ascii?Q?DGi7tumeYNj/neUdM1za1S+KhKwCEfHtA0MoTi6Anwmd6DVTz9YEBJG6E1Ar?=
 =?us-ascii?Q?BlQGoA/BtMHS1ePSmKKKj06fI/cHvtU0fwafPkBl17dYDkCM4BP2gFTeGDDP?=
 =?us-ascii?Q?YNLVSW3r04/lr1w0/vNA/QCGY1yxVIhfmoM4VUL33+3vqRJkjPkAfHh3JXJE?=
 =?us-ascii?Q?iffsahUYmlSYZTL3BvV+YzKJEvikweU2iWKMhghFkF9pGCGiI9EEB2Qa/3T0?=
 =?us-ascii?Q?QvVjV7CO3tEkDfJA/2IZnEsaA8B8p7AXg/yQCLaEwcGEF1n3cXs5lBVd5Uo0?=
 =?us-ascii?Q?L0IZjtsc59IkSkSsolrTYU6UDqH4Mr4aCnOzF9mPIgKPn7Gw2fjlYiCPsVS7?=
 =?us-ascii?Q?kQ7VwP7UMPUa70d5r2CEx53dydvFT3IBunF0Skpaoa8uecNpFCa5AERBN5lY?=
 =?us-ascii?Q?mij7BKiwCkYpVUQ=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:32:20.6122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e8f0d4-a460-4260-68ce-08dd1f4f40d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7798
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

On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> 
> For that reason I think linear modifiers with explicit pitch/size
> alignment constraints is a sound concept and fits into how modifiers work
> overall.
> -Sima

Could we make it (more) clear that pitch alignment is a "special"
constraint (in that it's really a description of the buffer layout),
and that constraints in-general shouldn't be exposed via modifiers?

Cheers,
-Brian
