Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7982B10A7A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B3B10E204;
	Thu, 24 Jul 2025 12:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OoMFm5zD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OoMFm5zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37FB10E201
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q2cvHx6dDLawd2oCuNzhLppqSTdffIA7RNcn0sUsoF4fGFuFwpPwAHE45LL99dinhtlpOBU5p/Mal9y30NYhB6JIuLdj6m7XEwgujzW5sPSIKHp9oU6eNddcgTvYqzekixjHe7vGyP9AUtaFoSlZtZiYLrax2MoYoVM/IB8IWqbOpS+gPqc/rIapNTMlib+wIGH/q5sYjApDhn//f7Lgy1ITvDRO7HWnYQuvti3IXluqbJFgnc/jurQOKU6DoLJlx0HBbE4/uCaNEn7tiVYJj023E3l7XNvyfm7f1IFLZ1QWc/ffNKqgZeRr+8V5sQmr/OZ4waBEoPhmsZ2PMM5nyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=hOSkyxOKY1dyhHaAaw2l3aMbGfRhKid6ffqB5MbnJojPxetb9HGqt9lfbhiIXw4XBgvBW0AwjyLNCWJm1zR/cclKI/gX2mUFIDnfcWGrCPEH5xh1D9FmghsR/RF7lGvqwm+mSguRXpkn9EVxKLi3hKbbkI4IAXUNNPNaTIZ257iJBqa7Z9lMrgP4DKOe+oypEKskXg6wPkELqsZVDhFBPly02NaEo8C9gq0GTAMVifWvjbvQqXmU/Gx3jRjtrjzl/6FrMOxsSJp2QIotNIzBWA4BI4s94PkLu4vU9r+v9DTH65sc83PQIu3KS6Jxl6iKuUHHT5l6JHz1PnxfVrFzBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=OoMFm5zDwICXenkDWkYsaHpQ7SjRfPmzNX4pn7gphIyycR0N/yP4ut8qqTwAzt6undZuegnAzYrysy4dMMmg58J/HpeElgK63APl0IajXhtGdo1Mv20jXWo6cds35bveTFCDsuzjca2imJEvOj+FTk4BpORTGR7jTfIGJMKVODU=
Received: from DU6P191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::6) by
 DB3PR08MB9012.eurprd08.prod.outlook.com (2603:10a6:10:429::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Thu, 24 Jul 2025 12:43:10 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::44) by DU6P191CA0066.outlook.office365.com
 (2603:10a6:10:53e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 12:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 12:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb833oZOWg4Lwun6OHe1S9YTSBxeQhdQPYVyLXfHvHploXcsAbOl7djKISub2lGHtEeoOd6b+HRAfxk2QpKN2Ma0ACtU8k+3EeUxD8vhblb/vLgQIJV2IUUl6S+4IuPai8D6PTYgV8/PoEohcdMDd7YshomyGcrSDqCJjMSt1SDm9ub/tL4Pbp8Tn2zNbTz2I4ayGHlCzTkP923xOzQf3XLFqiYkP3HgI1ZKEPIcyegIVk32jQRfJhph12TBqPu9bCoG8jfCyLVmBoWYivvY1SccNnfDUNlltaSzGyAb/k2dwsKpvCZwMw6fcwpr3RoMnet6xqthXnlsgJ6Aby2XbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=VxJ9kbQdJpgxg5bs8ei/+ZS7aiNceqG8XBABu9XOurkf3+ub/Cb7o/rRjmu3FcS0z/n6kjqrBCmGkYwG1g/Pl63o+9z+koaKZKMLMSqPv09Tu5N1+CbUl1iZXTSOImNdOAlZ7QXHwZ4qowqkGoDz6pIbFilis1MAunqcFZ0M0yG0upoTzZsU/ckE9zucT6XRnlYaAZ57dtWR3lX6D0oTkUE/OiGPJrxVnNAYB/WJlmvSZTUxD4oq4hAjYFfig9k6mNc2DueKpY7Up2ATB66df5YEhFsy3px1mcwNiroWhkyfbN9y8ajO4GcQsEkXe+NCvigd7XOWnhOEa68WXLPc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=OoMFm5zDwICXenkDWkYsaHpQ7SjRfPmzNX4pn7gphIyycR0N/yP4ut8qqTwAzt6undZuegnAzYrysy4dMMmg58J/HpeElgK63APl0IajXhtGdo1Mv20jXWo6cds35bveTFCDsuzjca2imJEvOj+FTk4BpORTGR7jTfIGJMKVODU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:37 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:36 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v8 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Thu, 24 Jul 2025 13:42:07 +0100
Message-ID: <20250724124210.3675094-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|DB1PEPF00039230:EE_|DB3PR08MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 7558ac94-e570-4913-6a28-08ddcaafa55a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?vpinYT3jHxDs98wGccriMiBannp4JwLRO8HXy2gMuhb9nNqIoJYvWbYxAraZ?=
 =?us-ascii?Q?ZvZpYFfeJm/DPhIVQ6qtPBCtNbW5o9fII4gM98r9JF5IbjPSKhjJR9r4CXvJ?=
 =?us-ascii?Q?EUVhIEOSDHMcey1ujwAscQQdZu4yU3VbRDdP1P/FebjT3g+a07MjvRkdJmIt?=
 =?us-ascii?Q?j+wAxLtDzLZYKwM+CqaNxQnAKH7eAnW4GbfrOekcASTLjuOlEM9shjtKMZak?=
 =?us-ascii?Q?LL/qyxvcYUEZUxT+w8AGlL+7OMbjr9jduHii0w3wio1XnHKtLq+LgDkaIWZf?=
 =?us-ascii?Q?OqYM3Bnvg0xVyhSkor6s2K5yXtJIHkxlzNQ4QCkKwM/vlcOWuObuGsUHVjMb?=
 =?us-ascii?Q?PX5XWtRn7nd+VN6PPxlwPBvn5HQheVYGzQqp4KdB5D3pGuq37waDmVh1bH2V?=
 =?us-ascii?Q?i02XqWzv/5J2g+64kfjjm1dsnlhWLjNWGEIMdVykHvMldgWKT/NTGxT6XV80?=
 =?us-ascii?Q?mzoHa28WPkEDUR7GCVrXTfEFsSRKKO5IWnaaS/UJKXJCmQcqQtI3EefXWAE8?=
 =?us-ascii?Q?QA3ZVFMwkgrflnF1PaNpd2vrbqd8YEiuiw/l/CsmOJffkVrEXpe1shXVcqzW?=
 =?us-ascii?Q?ZmO1bd5412ONmPkDJw//YJHwvgj5hrCKkFAwhLrOeu3eTqfg/831hyv1vRBV?=
 =?us-ascii?Q?WowodE+QpsOIkOP+eZkV67QdMzeMDbHChfjNH+LGt/lIggpesQ3KP1rFd6VJ?=
 =?us-ascii?Q?2ugc5MvIZjD6snSFswdiczQSZakqA2YgwD2A848Q5DemDA1k2+X2rRMnaAg8?=
 =?us-ascii?Q?FCpaE7WAWhcTUQA4UXxuPAx2h79ldn5gDuYekXpNnC+yZW/LeqX/4gX6ZJ/I?=
 =?us-ascii?Q?H5pYP6eK8lS1CEhem86/rgt14VyifYUEPFhB5kKRk9InFAvKQ2cC3rt8ku1G?=
 =?us-ascii?Q?z9t2uFcedD9mUHZHc0gkJT3yvoWI5gnpI3V4sBEalW8wL6X3jSPuTi15CK4m?=
 =?us-ascii?Q?CwzMCB4KcDQxFj5PtR756YBXbAnta0mLm47CYs92j7cCviUuhQ4v/t+NUAAK?=
 =?us-ascii?Q?awAP5fIYHpct5GmMv62qUCqSAWMy6+HG8VCLtrsaU2z1rHMOMX3cJd7+7Bl1?=
 =?us-ascii?Q?1xTeoXw2iIBa1KZEHjXYTTc34KcZu3VzlXJSF5slyI4XYHoZ+bhtmzhhBZ/t?=
 =?us-ascii?Q?fhRk7DHwE+L81Y7Qauvl6XXwyYy6RWHtdq+51f+R2lQWSTjM6K6JxWr+qfvC?=
 =?us-ascii?Q?Z0ojFcogp73ssvqu0GJdkdTlYWNEtSAaVE1H88S2EM1T4Ludp3z2LEIqUXSa?=
 =?us-ascii?Q?WOFxPJlD3RoNp2gIooepKlKqMCaalpb3IUi+c1Ge+56jOHQR7w3SIg33TaIU?=
 =?us-ascii?Q?xS3Oc5TlUCZ5Rv8szPvcNe4DwOsxhpSZtFcjW391sV6FuzPJfeUrouTU1l3t?=
 =?us-ascii?Q?lsFkaB52zAaDgpOsvgbf5TNqBmX9kocPXqaqDCa0PYayVqhTiQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b3304c11-6192-4463-1778-08ddcaaf9127
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bx54SqTWppv3vXLjawm+5+FBCZMdl0pC3nWg8gibXHPbS9rWbMEac4EyphAU?=
 =?us-ascii?Q?wt/QVIq9nI772XpkKf9lHu3hU6mIsc4WYOboF9Q6xsihGr62dHe9OsN4m5Lg?=
 =?us-ascii?Q?V9z9o3xUVEUK3BfBb1ZrAsvX1HEL4fTeJYz8r9MRKoCIkVdRuk9G1UonURAY?=
 =?us-ascii?Q?wSFQ1FswZfrlA8hJ9efvXPxpmUT8y46VWzfvGKpSno8Q10zdKNKNVEa6BWPg?=
 =?us-ascii?Q?9ipGeS835ni4B6u1J8MExJ9sry0ei5d7ji27btBEgGJ25q6iayEo/r1nfpNs?=
 =?us-ascii?Q?LGMaO2xVmlM8H0N+848jk8PoXHQ9TTBhqDABjEOaMsxxbkZ5Zd3I/slxPX34?=
 =?us-ascii?Q?qVBY9wcA9C0yFZMvLnZn03nYNIIvD7NAzL4iL3Sb1Ds5IOGs/wlqapohLkWb?=
 =?us-ascii?Q?WlKwQptfMxdbsFi/kP/94Wh6nLbIz9SVOif4CnR5LFYyWBGf8g0qGG+ESTsE?=
 =?us-ascii?Q?SXuevLKnA7x66lRQe6wnFlrB03cJW2weSDrOUNuF/9isoe/0YBfwcONLWBYA?=
 =?us-ascii?Q?tmsL7kcQjQcyS+U0OZREhyJMDbVYzoeS4HMQOteQ6UB+WS2RIUjkGQf/sJNv?=
 =?us-ascii?Q?ubhvV2ymUEg8oP7rTZ+Q3zi+NKkLWVU/6jnCIQkedA5cbRFf/5fh4FQS7eQP?=
 =?us-ascii?Q?C2RTmwzhK/Pv0Khdyk9tlxItjJzBNjfHW77vGF4mkn8RDS0PBPL8lBfzp4tV?=
 =?us-ascii?Q?IE72Pe2RprdPg9E17nysdvQkohPZVBxO9v1fPe8zcwQVBSv96uSzHqrNPVTQ?=
 =?us-ascii?Q?f/U7KW75vIUzBRDD8GcsEub47zvwDuVu6cS0xvDjAX/EU0F0mRb1tIb074Bh?=
 =?us-ascii?Q?kZjc2RRNQjG2P76lmDb6XNtFRXd3NQLogF4UZcMAU4nXW6rFLt/roAG7iu5O?=
 =?us-ascii?Q?vsCDNbosUACW4dRJjz13CJdBY5Mx141CTQcB5IhpI7gPms+EFkQ/2/7+DNMS?=
 =?us-ascii?Q?y7IeMGI69ASaalYoEQfuG9j8ydx2AEBKiBtB+52SXzHf8wJNPOQa7gCsgf2G?=
 =?us-ascii?Q?yXYXUCxomHzbiBw9SuAygDyhasAYlQQqaYld9gdcGIntyey4JBG4AADGuVZ7?=
 =?us-ascii?Q?+jpcNSDfFOwSxCd3MOKznr7WVr40wz6oLvFG6aGAnU2FatbHO2kfznHsYLWs?=
 =?us-ascii?Q?BQX84Ckw3sSl/hSfC/UxB2c3uMmpjpWmHDtpYQKrb3QZW0sGwHA9vn3yBfOc?=
 =?us-ascii?Q?xr1ECf9Z8eptezivYYa/iLUbnMXxifntbj382J++CEP87mC28l1BzL+WoHoY?=
 =?us-ascii?Q?FD/0ImFY3omxTyMyBvBKY8WFtX+nt/7K9upVn4k6So3nj5F8TdahCrlsn+zo?=
 =?us-ascii?Q?1P9uou0Mz6nEbH1n+l6ghoP1zsrjG9c74O0QluSGv041X15hPx/gn/ahp2qZ?=
 =?us-ascii?Q?GwB3YnLJCNC3q+n9Us/dvPn0VGbeEOYHYW5TDsyWEkm9jNWD/UH6HUPUZDer?=
 =?us-ascii?Q?QL1o7o1hQSO2XhKzgjQOLTINYCia+56TgFtsOAC9JJx4UZnV2sdSBlcEZuYu?=
 =?us-ascii?Q?WU357DEJyQi+sgOE5eMoqim1jXSOL+YM827C?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:09.7719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7558ac94-e570-4913-6a28-08ddcaafa55a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9012
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 6bff69fd247e..6d2ad3c8cb5e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -15,6 +15,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
 	}
-- 
2.49.0

