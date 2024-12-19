Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22849F8109
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662910ED57;
	Thu, 19 Dec 2024 17:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HzZHrHVL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HzZHrHVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328B310E217
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:06:00 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lLVK6X6lP4+Xs+6uUKrBnfJ3P4bYLZf0BZHHIkdY3tcikJlimlFMdasaHDkCfwVgHZ2q+9wJ8o0IIvDiKQA5TbMM3yrWvRsfmveQt766XBAXBRn7NLuMYaNfFekPRffSgFUhKalcIpv1uNWONqp06DtO7fxAAH2CiRS3CkN4cD9wDkaAeEiIWo5o9TdBJuIf5vZHXjTON5ULVgjNA95klzEF4fYZmsLDfLxitiY0TIK/jSOEGXny00y5/C98C12g0J0ZQZOJoqveBte7SNaEzj5um7kJijuw7r3jlh1kiPIUGpET8524RsbRPSYoDi+L5wvPtdjbs3QduAIUgVCZtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B30OBGeMjBaX2MEB36FZDiv9JLRT33e56cLFZvvKWFA=;
 b=StBaeJaMxo+2S9y6WfvxMxoY41OJakRjK1tlHsmwDyYdLFp88zKlT42cRzpUuV0RvKcoH6hpw1nEigXdx0wsZzZ9t5g3WjOi4b4XK+ar7582R8oZ5CWyFzoIZ/l4Tik7jREGg0JqA3VqbrVpeSnN70CuLsrnp+D5YqkYt2wyYt9HfH01/q1LqpYDtxqhgLgSRUU5bcIlM+Bi6JljHZ+CMyxHeUukxLNMd3Ka29Xg3OvhFxpL40qaJjw/lXD9SmVXdJdPkPyZ0LFCMGDKTJ29zhDMicHcxyvqKl/1FlXsol63ThHHTcI0xUa11TlS8wq5xalJ7F4LaHxjki5WxKVFdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B30OBGeMjBaX2MEB36FZDiv9JLRT33e56cLFZvvKWFA=;
 b=HzZHrHVLmxPL17HLqAECLhIZ3M8GWrhxhDEqyQYlnGFo2UwVXrVDXQvuXrbcmWVjpCntm67ZrNA1CZ3d3qHSbImYeIuXtvnIJUG5hrVwzpo9utZRL/+luNRKQ0gShkxNwpYZQyYlwyFZazTk4pNm0xlQmtGYWFEdCep8QV1/Rao=
Received: from PAZP264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::11)
 by PAVPR08MB9460.eurprd08.prod.outlook.com (2603:10a6:102:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:05:55 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f9:cafe::d0) by PAZP264CA0150.outlook.office365.com
 (2603:10a6:102:1f9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 17:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.6 via
 Frontend Transport; Thu, 19 Dec 2024 17:05:54 +0000
Received: ("Tessian outbound 7762b28e8285:v528");
 Thu, 19 Dec 2024 17:05:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09b2f0bedd6230ba
X-TessianGatewayMetadata: u3IGdk9v2dczOG+tRXHACX+4qGxpscn9rXln9MeYg/CCmB6FdZXvKeNXykHhIteqL90EJIPUCenJFL7iYDEOazfDeYWZ4zoc/0EK580kE5ogrUYCJh6sdzaCP7WblDyJ538TEF7YGlQUIlxQ7HjHmJim3JKYVhUudpVcSCQk+QQ=
X-CR-MTA-TID: 64aa7808
Received: from Laeb471f382c8.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68D64701-8084-45D6-80A0-ECB9B37D33F1.1; 
 Thu, 19 Dec 2024 17:05:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Laeb471f382c8.6 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 17:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXHgcdeHJO6tdRyMV8j7Cam69974cc34QGV9z8ZV7vqqFJNi2mDCTZ1Fw8PgV4Eo1NyRT+eSAVRVUhw7Q4UthDzlvpV20uT5juWnp40JOiEINn1d4stpvdxFAaUPwuEHBZExHvOAkO+hC6RtrIwxCMYdj4EzdBf87oYzrWfwwbsrp2lASL6VNmxuOW+N5eVSIKr1VRzXG0BsTFhs6ataMNWgxc8anfpA0A1V5Jqqtj2hUOKcp6+RKscIpA3Fx7eFF9b8wQCDis1q5SwH1UHmhxtWsZhSOJI9dhnyqQn4SR9gR/YpWP24uRwWZdo9femPUlwbLsBfPQsSRcdGmx/UcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B30OBGeMjBaX2MEB36FZDiv9JLRT33e56cLFZvvKWFA=;
 b=IrRNF7/xsyfBYTH/WY58cw2nntU1M7W+tc0fMZPXGKsAXuu9rAXn0O+9NPL4MheXDbDApAPsEC957Yro5S0rF7y9WldmX6UMq1DJ2jtexMWyKa73wDp4se9DuIDrnXjOVAuNXtWyBTuiIveHVTsGl+lK+ZBWNAGuF4NsghwjQW/FFmxKZKfP7DiYNqQEHG5P5rMyI7DaBe5oDEgafl2INtPJAX6INkddU5fp/Z6LVKjwI8guZQoDM59Bc2JhGmRdI2309On1qlO2cJQuuFJugZD3/rHXAz6lzVOn5CXl1QFQCt+ZboSn/Z5h5HmqzgGE2l8RDQ0+hE2XcTrtjAy3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B30OBGeMjBaX2MEB36FZDiv9JLRT33e56cLFZvvKWFA=;
 b=HzZHrHVLmxPL17HLqAECLhIZ3M8GWrhxhDEqyQYlnGFo2UwVXrVDXQvuXrbcmWVjpCntm67ZrNA1CZ3d3qHSbImYeIuXtvnIJUG5hrVwzpo9utZRL/+luNRKQ0gShkxNwpYZQyYlwyFZazTk4pNm0xlQmtGYWFEdCep8QV1/Rao=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB9109.eurprd08.prod.outlook.com
 (2603:10a6:10:430::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 17:05:34 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 17:05:34 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] drm/panthor: Add 64-bit register accessors
Date: Thu, 19 Dec 2024 17:05:18 +0000
Message-ID: <20241219170521.64879-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219170521.64879-1-karunika.choo@arm.com>
References: <20241219170521.64879-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB9109:EE_|AM4PEPF00025F95:EE_|PAVPR08MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ca83e6-504a-47d0-0ea6-08dd204f666d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?3ESuSeN3cmz5ln75TO3uO2mtjzP+qyUYelFHdbEqHKaU+dChXMXbafV83W2T?=
 =?us-ascii?Q?4MaURy/RGwTH7B9TVMPdlR/fEfhVxLtTEtITCHkZKbiTXvi+WVyyklZjmtw6?=
 =?us-ascii?Q?ytwiAStHO1QXVAMOXkgdssgxBLCV8WH9ClGGpmgQkjD6N0AhBjr62iWh6ytI?=
 =?us-ascii?Q?wIpCUsSROn1K0nsxNdkLcY+Gq1ThcRvZxai/h2hJieqTzovSuRSMkc9dej6N?=
 =?us-ascii?Q?FIuE0jSPgXP+NmbLcnAqWaozoibXnH+CfKZONublYMJjGPP3eq6LlQaJoo83?=
 =?us-ascii?Q?34K+7yeMLDfUUK235cdeQ23pMBuvu19li2KouadAIKdn4gR8Z29ovbG8Ou+i?=
 =?us-ascii?Q?BCX4/epvMakle1hymV6KIgFxOWBhdL2dXl94d4hJPqdh/DVLWeC6pZdZUI2N?=
 =?us-ascii?Q?d/J0uA//eGJBKYz4nCv8fBeZ+sRZRNRJNcNMNbCnQDifUKTJQ0f5J8wuJ3rQ?=
 =?us-ascii?Q?56jWCLgDGOx6xB1+s47kFkNdwqKWhRSR8qj72nvkyIXHicRadT97++sXD6wT?=
 =?us-ascii?Q?u9MOjXYz6g/6l8+QBIF681h7rc3c2Hkaj1SYgwUaDKMm/G5/nZC/HIuQu6XM?=
 =?us-ascii?Q?GaSkJ8R3iQZ7FX0I6fyzob5A69trchjcyyvw5jOEqTatJFrs577QU+5hBwel?=
 =?us-ascii?Q?WzMtmqWBVnDtnDZm6lsguF1BM9ZMFLwE8V9y/NI9xM2Qagz0tGtnm8CZ8LTG?=
 =?us-ascii?Q?T0+GikPWP2/B9y+BWRNDxna51xKlfi/hmmLG23P6NzqLSXnNETd68EJp8JJ3?=
 =?us-ascii?Q?z98AOiMojvyp/8Fnt3Ts2Qk6/lKM3ldwX8oTHHLbfd/mWU+Yzd6sCjYm8Wyk?=
 =?us-ascii?Q?UISOn3UO17ND12emw8nLuAHUhehmBXT7rOwBXfp2GC7K/Gox059HU1ozrlnl?=
 =?us-ascii?Q?8eqVhtK+zicP3kfMDc8c3vVLWkzcpHBBwkAyIAcyd0ym9eNx+vlFQU7+aS3O?=
 =?us-ascii?Q?GndOuI3AGwGvKBGc/0Euy9C6fb2lrVB6voSGq5AIKcC7k0Xf2fx63EcQZG0n?=
 =?us-ascii?Q?bNMI791hX6aDPJ0kbutDnSqg+9evL/0JnALll9XFNsZ1JFz8lubzRsCxgOe7?=
 =?us-ascii?Q?09mzh2c+SK0oKzJei5kUHqDFyBtOaLT/OBeg6Z1zt+jqI51lJBj6lA9ESZe9?=
 =?us-ascii?Q?IRIueN2rcmQT+yoJ5EnHDeL2d+xEp47dV+gKhBqguEk7/RExCRwg/1lGKqAo?=
 =?us-ascii?Q?jx0EtMxAdKdphbH7DOrZ9aFYSYH3aw5hqVaiYdGGk+BQpCbFg2Zj20fWiA7n?=
 =?us-ascii?Q?GS2OQRkV70GZXlfg3xj66TgDpEVvwurvf+YqSDDeMgc2FXtMacQ0f4pJC8Q9?=
 =?us-ascii?Q?r9jHaQmczZnq7jDK4cPgFn03js06ZmFg7tqnWt+r9sqUMmWlz0/7sbgTKzqt?=
 =?us-ascii?Q?ct7mKYv+vb2QIiFseLUdJIQ5boF7?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b4b6389-8850-4eb9-1452-08dd204f58ca
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|376014|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OT83QQhCWomsUGBFk72PbhiG5F3BjBhQ2Fy+nZPGkqlX0zfgbzBkrRB+666g?=
 =?us-ascii?Q?5TVUfPamyZCoFzMsJyNf7pIj1Pm8efJhXCsK7VZBaRUTu4bd/v88srECFSm5?=
 =?us-ascii?Q?+2WGDGmd6w3Pjfk9/VLwiwU7ArXQ6tMhjUF7jrKYYnJ1zNhWwUJuJbcwB302?=
 =?us-ascii?Q?NzLeRzmJr2AAzIyYYZhB3EOKt6+reeBA9nxzajlQ4mVjRpErsXdLAfL+hlzO?=
 =?us-ascii?Q?oKYk8F2SWCh+Iu89PvkteX+rAP5KSU5sLqclB99d9oien7RrEERAbmLc352Q?=
 =?us-ascii?Q?ImoFrLcnoloEqdud4F/mD8yTN1bFm+ByGJys0C79rwsgnQrio1jdrqWNMU5i?=
 =?us-ascii?Q?zo3ZiHP1obJZQIZGJCR5vHUn74eGKJRUvsmhHjWAR/05mVXlqNBr41x6lpd4?=
 =?us-ascii?Q?JmasneyoyEDX5gfhxLO9mm9FI1w+AhGYj3Onn/gZUEPpVItujcY4Cj8WgFFX?=
 =?us-ascii?Q?lIb2t0uKVQMvNhrMdQh+TcvAqpFc7nVcfx/wEqySu2yPYpwOipc3GxdfsXU+?=
 =?us-ascii?Q?Uf9jbgQNZH2d2y+l1sPfhdqzcEbvg4Wfxn9YJMBclk1u7F3qNotQ4eosX3TR?=
 =?us-ascii?Q?EnLoSmj65HZ3ufdmQkg/GrUH8lCF8z3hOG2DnwhYJOFlyvyrmeQA4TkwV14l?=
 =?us-ascii?Q?BisOW9ZK+zwGi1aqLjNvFMSf/y+2Iq8z2MTAP202a08FZKZ4TjzBlQcgQOBg?=
 =?us-ascii?Q?TKvmvnaux0EZW/shuq16lQyM8L7PZ5ZYkXuJB9HkTllGG97Sex67g8vkfqqy?=
 =?us-ascii?Q?79MK66QE+5Pgp6rXPBiO047iZ/omY+DY4EQ1a3ea2xmgc0MbzSfYG+JVBsmV?=
 =?us-ascii?Q?brHINvlKpw9mUR7FNPcWEsmo0QBcVT3TBa7Ypkhh9rLi2qeiy1kqwg+LktS8?=
 =?us-ascii?Q?KQSxhcnTAkKWwQ2f16tl0w02kjx2GzTonhRPltJAL98IJEK4kjwE56fqNI5b?=
 =?us-ascii?Q?7IuBvM7dAVcHXl7ymGp9lgrlZ5GMcJ+8OTpHCbfpCIRvUujqpdGve8mnorhX?=
 =?us-ascii?Q?/oB5vtxugHgs7Tf5XsOEOixcuCMlOqDmiswZRqVv/M/SM78qLrOBel6TDO5h?=
 =?us-ascii?Q?kcaqQzZrqN2AVXS2FZgiHepn3BX+2naYxA57q5g0LSmTBFd/Y0GNAsSMNM1j?=
 =?us-ascii?Q?LbDjrkU2SjImW9hBr4ROU/zaBji9+fu8ZnL8zfaeorygqFO1gqc0WLFEL3Si?=
 =?us-ascii?Q?s0Og/g62PxJCPxMnaLSBIYh0RZEuRC4+kiNIfvITJ/TJULUZoqnfQf0Avknq?=
 =?us-ascii?Q?GIEFF3kjqRfgJ4qY1S+6FHHT0pgSmxQybAO8Ls61k1pWw58uMnQOAtUaPavp?=
 =?us-ascii?Q?rv5Bj3Ehsy1Utv+brleoEvWjzzP3pGjemZg22+zj3i9xmgI5Mv3iZVpzencS?=
 =?us-ascii?Q?3EWKu92QEDXq3YwZacKpkh+ibwCOQPdHTvjRgmhfimDOBN5lg6wX0BlksGhn?=
 =?us-ascii?Q?0kGMtJQxsLJd1MHzIu6GvU1x7lEym/NQPPKD0BtQpccrB2kfoWK2eOFgpTVw?=
 =?us-ascii?Q?CQ8vQCWgBXniACw=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:05:54.8313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ca83e6-504a-47d0-0ea6-08dd204f666d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9460
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
Panthor. It also adds 64-bit variants for read_poll_timeout and replaces
all 64-bit and poll register accesses with these new functions.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  11 +-
 drivers/gpu/drm/panthor/panthor_gpu.c  | 143 +++++++------------------
 drivers/gpu/drm/panthor/panthor_mmu.c  |  34 ++----
 drivers/gpu/drm/panthor/panthor_regs.h |  49 +++++++++
 4 files changed, 104 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 68eb4fb4d3a8..8f1b9eff66ef 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1061,8 +1061,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 	u32 status;
 
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
-	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-			       status == MCU_STATUS_DISABLED, 10, 100000))
+	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+				  status == MCU_STATUS_DISABLED, 10, 100000))
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }
 
@@ -1087,9 +1087,10 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000)) {
-			ptdev->reset.fast = true;
+		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
+					   status == MCU_STATUS_HALT, 10,
+					   100000)) {
+			ptdev->fw->fast_reset = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
 		}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afa..a7d5022d34be 100644
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
@@ -244,45 +238,28 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				u32 pwroff_reg, u32 pwrtrans_reg,
 				u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u64 val;
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
-
-	if (mask >> 32)
-		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
-
-	for (i = 0; i < 2; i++) {
-		u32 mask32 = mask >> (i * 32);
+	if (mask)
+		gpu_write64(ptdev, pwroff_reg, mask);
 
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
@@ -305,45 +282,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 			       u32 pwron_reg, u32 pwrtrans_reg,
 			       u32 rdy_reg, u64 mask, u32 timeout_us)
 {
-	u32 val, i;
+	u64 val;
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
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
+			blk_name, mask);
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
+	if (mask)
+		gpu_write64(ptdev, pwron_reg, mask);
 
-		if (!mask32)
-			continue;
-
-		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
-						 val, (mask32 & val) == mask32,
-						 100, timeout_us);
-		if (ret) {
-			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
-				blk_name, mask);
-			return ret;
-		}
+	ret = gpu_read64_relaxed_poll_timeout(
+		ptdev, rdy_reg, val, (mask & val) == mask, 100, timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
+			blk_name, mask);
+		return ret;
 	}
 
 	return 0;
@@ -492,26 +450,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
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
 /**
  * panthor_gpu_read_timestamp() - Read the timestamp register.
  * @ptdev: Device.
@@ -520,7 +458,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
  */
 u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
 {
-	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
+	return gpu_read64_sync(ptdev, GPU_TIMESTAMP_LO);
 }
 
 /**
@@ -531,10 +469,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
  */
 u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
 {
-	u32 hi, lo;
-
-	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
-	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
-
-	return ((u64)hi << 32) | lo;
+	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index c39e3eb1c15d..bed13089bbd4 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -509,9 +509,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
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
@@ -563,8 +563,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	region = region_width | region_start;
 
 	/* Lock the region that needs to be updated */
-	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
-	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
+	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
@@ -614,14 +613,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
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
@@ -634,14 +628,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
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
@@ -1677,8 +1666,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 		u32 source_id;
 
 		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
 
 		/* decode the fault status */
 		exception_type = fault_status & 0xFF;
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index b7b3b3add166..269c2c68dde2 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -10,6 +10,9 @@
 #ifndef __PANTHOR_REGS_H__
 #define __PANTHOR_REGS_H__
 
+#include <linux/iopoll.h>
+
+/* GX10 registers */
 #define GPU_ID						0x0
 #define   GPU_ARCH_MAJOR(x)				((x) >> 28)
 #define   GPU_ARCH_MINOR(x)				(((x) & GENMASK(27, 24)) >> 24)
@@ -236,4 +239,50 @@
 #define gpu_read(dev, reg) \
 	readl((dev)->iomem + (reg))
 
+#define gpu_read_relaxed(dev, reg) \
+	readl_relaxed((dev)->iomem + (reg))
+
+#define gpu_write64(dev, reg, data)                            \
+	do {                                                   \
+		u64 __val = (u64)(data);                       \
+		gpu_write(dev, reg, lower_32_bits(__val));     \
+		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
+	} while (0)
+
+#define gpu_read64(dev, reg) \
+	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
+
+#define gpu_read64_relaxed(dev, reg) \
+	(gpu_read_relaxed(dev, reg) | ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
+
+#define gpu_read64_sync(dev, reg_lo) \
+	({ \
+		u32 lo, hi1, hi2; \
+		const u64 reg_hi = reg_lo + 4; \
+		do { \
+			hi1 = readl((dev)->iomem + (reg_hi)); \
+			lo = readl((dev)->iomem + (reg_lo)); \
+			hi2 = readl((dev)->iomem + (reg_hi)); \
+		} while (hi1 != hi2); \
+		lo | ((u64)hi2 << 32u); \
+	})
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us, timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us, false, dev, reg)
+
 #endif
-- 
2.47.1

