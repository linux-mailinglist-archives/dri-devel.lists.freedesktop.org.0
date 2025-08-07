Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC032B1DBA5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927E10E0FA;
	Thu,  7 Aug 2025 16:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="IbLRBEPx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IbLRBEPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AB810E882
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Eh2UlSd3wK60qW33Iz5n6IJuq9RxymNkfLnRA18HBJ1VCwTKshrRHGVHDfhL+m9+SyHjvmfOWwICdeJbRuWgbIaz5Lf8r1r0DWKB4dZvqS70Xww/jj0hw/FEnAdbYLQ6WefZ6F4zjP5VKb2LdVbo+Czhhmt1OATK8CQvxu2ZRVDKa1QgxlT4ELfhmUUdAZACJ+fz8Cqy9fJ3IC4cD5HokWSr7k0QzxjG21V18xmmLTKpTSAx2spwRAXzmdImg8UjEiPVYYNI8at1EvKXwX5fQvvN1/MoDOyGmQpaZS1aGnIsrzeFIdbyYhtkMLO1vHJOzWOcslvxYMxwT38qHY2AXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=Lxa1OaGi+ezjxi6aoY4p3EYSYBYelXeZ5zzNM7n+9R0wsve64gwCvB3V6jUjtWVanc8VuNY4wXWxvQldpwmW1s6YMaL5DpNCdQkCZ7zZLGlSqJY0a6rPYuZJ57tvgVOt9Od3gUpreY5CaBiHPa5jb/dF5ff6F+HE6ml1mRQlpCwZpjBZQk2exP1vXSQCDkVMVhKt+nzVkcFkcD+INajVxXcCaSMu+pwfh8WwMUDwsLMXm38g6/6dzyu3IOm5naHKDvF/vZqve8WltV3UsyNot9tSKlK8enCG6+S2ykRS9m6UyRAel3otTjemVttC1Ybs6Uy9q6XKPV9sMx85k9SGSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=IbLRBEPx5itmNKee4Lhbp7NsgLn51NB2VyFI9I0eDHtYxPu11pqUOkjyMo1jAn8IUDVyFFwRemAfy/DSbMwCJrZ9p6aslnQV1+3/pgy7gUQHb08PwC5SZ2kTvslFCF3KelIh+DGHNFIwX3alK/fGu0C1R6fohFVy3OU6OWD91P4=
Received: from AS4PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::13)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 16:27:41 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::f7) by AS4PR09CA0011.outlook.office365.com
 (2603:10a6:20b:5e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 16:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4zhye5TfgYrECQO6ESTxOF9/wScLseujBqn0pB7hbpYTWWx0n+MRvFqegutmwbBxy+DQx9z9tDKmSkggz7ELuP0qYyZBN8jL7PcTM6T0OVimMmD9AJeKiscEmp9/aueUutb8yGP8956/2F6xRmNPxvq3Hew79SnpqJvW4AwvX5xyctc45ukgpwFcTPyIIgJOc++qObK7pQ9KDne4hh1Yeus42HpN7MA69frfWdJPHeGsA5IS3n7/YhCbNskFoF9JcWzfjg+o/Sm9mp6n1SE9cOWVFJTeSUQwM7aEhnbSU0TDqVvgtOirJ4RtcYUKr3MDdQ4skD5TORQzWtlrT+2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=rLbS5F/IjY+EE3URNJLExw2l6L3OvUCVORuhH9a8LE8bcPgNmM+ALF3h+FhRwD9pQn80uv07Cd/NWT8s9Keky3qUL0oy/FZ4Me0WAeTzqq0Jpk9S9VlkTWo5/35u8w0GNAH7YapeeV50Vw/puaxULhTyWRLlQbq2ZVirPwUT3iWLSwkF5kp3LgGL1J0Pe0iSm8jr0z9cMRufWHL62mMXstNjMCLjcofsrQlcMtNzqX0N/bxE6Gr4pKwYKRACQa4wdQrx0WNlndMvZl/zj3ePao+iLPs3iVbvsmvt7Hym25zJqgn8ebArVbUfntyF/y4C4Nr2bBtpjatGGXTPVTgewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnSbabYdty3yAXpc4tkZIDjTYpp8vcumtAW5e9NFEhY=;
 b=IbLRBEPx5itmNKee4Lhbp7NsgLn51NB2VyFI9I0eDHtYxPu11pqUOkjyMo1jAn8IUDVyFFwRemAfy/DSbMwCJrZ9p6aslnQV1+3/pgy7gUQHb08PwC5SZ2kTvslFCF3KelIh+DGHNFIwX3alK/fGu0C1R6fohFVy3OU6OWD91P4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:08 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:07 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v9 3/7] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Thu,  7 Aug 2025 17:26:29 +0100
Message-ID: <20250807162633.3666310-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AM4PEPF00027A60:EE_|AS8PR08MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a8b98d-acef-4c30-420b-08ddd5cf54a7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?l6Gb8KtRJj2T1MVSXSMBjLBMleiYleKoMu8ikEx2cZbvo8nBF8hg0MFkXLSr?=
 =?us-ascii?Q?dSv1s7c2H9+8kmIHpd8zBFP+79Zhe1HGsWWLywoWonjmu0ZuDEKlRWov4gGa?=
 =?us-ascii?Q?OM9P7HfxFcXqsjJnaGqAdi8Z8xG3IEBVwpKrMwMo4L6d5DP5sZ55vNWHEGWB?=
 =?us-ascii?Q?Q8Qsn7fnB+aJPmndwIj2OX7SsrTGoe6Wau7+dtZQOr8Y5nMqNHHDvBvCAVkn?=
 =?us-ascii?Q?NQtatllgLEfNvlgalaJdV4V6Md20NwG807aTKuu2jwfTDZmQFu4nlB3uVzyC?=
 =?us-ascii?Q?+4iCrJaiC3Bwd69ykoNonDhxlwInRu94RO2ZI5Q5lQZwD4FSnRsEcCJLK1K9?=
 =?us-ascii?Q?tIN0sspaVTTiCejBHQV5ssfMf3VSMLYh9x69+i8oCb1DH6sOGfaw0r2ppTPH?=
 =?us-ascii?Q?svivcdZjS1ulbj08/gYXk/oDQYJynM9Y1+OTNMiJZsiJau4SFf0LZDvGVtmQ?=
 =?us-ascii?Q?GiSm3/p3zKN+790tj9HoJfMPEQb8fOuNdavYDv5ZdmzYj6/tYvNEZ8PR+zcM?=
 =?us-ascii?Q?wsva1VPl7ZhUOygnDykXP2ziwf+cHKooAuSGyioCOArPxSeyShTub1kCowxf?=
 =?us-ascii?Q?GBPFjQZXWEQEO8hNaVOkhFU4JQGFYZv6Es2TB8xGDGQ0NcWhv0eGckSIVE1m?=
 =?us-ascii?Q?Gw868xpjf5YIPMe+jpLdeHWcpXNS+D7lADHLgCxpF2Rc7fYYNUxXSeT/WKVp?=
 =?us-ascii?Q?Td7cnEVmHL8lE/32+sKzSnwPlk0fCH00RMzY1Gjm6nWr4ec5jeG4Qrm/uHBj?=
 =?us-ascii?Q?5TClgQForFLkFOuV0Uj3ChtQv8VQBRmWeU2xHN8VnM8UKxWk/YSSCEWZciq9?=
 =?us-ascii?Q?bW2Omj4OdBH+P7zfMpRo6ira1GOYpwAwZzNpgOc4xjRFgJHQzXymcLX/PIpD?=
 =?us-ascii?Q?VZpRXF6iiEl4eE9sAFo4j2q6v4q35WTpBzwLh6XoLMOH3fXg6tHuJoF+XBmO?=
 =?us-ascii?Q?fB0Z7h6Hn6QaB2Qg88uLYuXaoHLUum9bnVTpPXo1s+0ngvXPKx+oKRPz3RQI?=
 =?us-ascii?Q?VWosd4EuHz/vQOVMNnD6q2IUbSTCWYMhS0UC4rx38B1qRzJ89k6cofWmNpHs?=
 =?us-ascii?Q?SYPVQWRdWoSUJI6D4Id46a+bQn3PxEhfLvDTSGddlJBWynstUp2kB4KUwQMN?=
 =?us-ascii?Q?IahT7pqXGztXSREVqdbD8besScHfpGks1OVgOqy+5HpqcHQPK3WE9Qrw0KlK?=
 =?us-ascii?Q?ia9XRJzCCcbVFJmvUPLjqA7AyfTBNo3vcY2dfg9vIeGdPrZ+zSyzs4s4iS8W?=
 =?us-ascii?Q?Aen742KE5/A7K/o4OMLuHaNfQIzYG81PKJM6ouKVtEKvPhjnO48DIE4sxyEy?=
 =?us-ascii?Q?EvfpPwwc6OgrsxUW031aNKZe8iRbXHBfD9DZFlsywDaDFVnAOIjBmAy/XEv8?=
 =?us-ascii?Q?Tc3m7IMx2/tBpzRvsqVkOt2q0n2z/TIJTViDyKlRMn0ExTBtZw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: af2b0c6c-197e-4869-9bc6-08ddd5cf4095
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SO4xLJfo78hiZ1/75bjdafzHxAq0lM+0WK9vESSWTBDu6vQG0l/0xgG2D9qD?=
 =?us-ascii?Q?UkJboi4UyRr8vsmOXfsr27m3VacLLiYUHcByoef2nOin40l3jVxSeTcKa5YC?=
 =?us-ascii?Q?hN5ZNgPZD1IDSGSowyOaiKHhMcf5wO3coH7dyqkeLidPHZlsMIfJAhA60dsi?=
 =?us-ascii?Q?p5ETFWgdRU/R90P7mSdgDAT+AEp2aqxJqr3hZNkCsOeZQo818XjWUnfL9Roi?=
 =?us-ascii?Q?1y/ZwWG6wVPY1JtsDUFeYqYUT/QNmeSqhoFNPVnHNF31t305sBaS42iFUHUe?=
 =?us-ascii?Q?44D05oZ/zrFVChJ7c3JDaevM5T4guwrMQfSQUnLZg2/emcYwNEn64vq1o6k8?=
 =?us-ascii?Q?I+p7K7NsdPS4Pgk724EvW3eHQ3q574REIn7c74oel7OdyJCZIFJR6NYGg/Uz?=
 =?us-ascii?Q?Ormzs4z79btzPpdxlR0fEo3zBbs8yWmjfezSd5cXvktf5WPpI7g3JS+0B3eZ?=
 =?us-ascii?Q?D5+SEAr8h57tfdYxSVGqpe1JqpVEv1gEJpfEerG2f7UqoPavdTluf5SOZapY?=
 =?us-ascii?Q?JK7O/SBkukOaoQAmS1kS3K9CdtLEhmJjRr9zkFXe7bEf7bkAFdqIkPGglgAt?=
 =?us-ascii?Q?Btw5wyhx6b1+iSYcnVFCrJgnGaOed8kqeW9vYQLm9agpuXCfjJEl9G+qQrDi?=
 =?us-ascii?Q?iJk+irD50HVl8p7ndFc4cOgKpBnxUwftq2eoJmESJ3/KGrVo4KFftOGCy75w?=
 =?us-ascii?Q?fVKV3TorQLQMFx1jgATJ+C1rGgmtmXpt04Ns+hP3qDBqzZ47iLH+dMsxkMvs?=
 =?us-ascii?Q?8KGjXD+oNKPJsZBDSbNfRWyULRxc7bl44dxIL2zw8eonBNr5Pa+uhneIxXtQ?=
 =?us-ascii?Q?DUCDd0ObNkiHMJ29Tg/baBjn1UTmHYlIkYglliP6nDkMMqELbcvpmYHh/VwW?=
 =?us-ascii?Q?O5Ohr+//WIjPxPXe4vS/4UHEwbcXV5tRHyCrlPI+QLPQkJOgZXNDwmUSWRX5?=
 =?us-ascii?Q?vI4Uz7FoRV2TsQsxivVVbAdEQQIUlJ4CxuTwCZDtkSt8XeD/Q67S1ZtESXai?=
 =?us-ascii?Q?4CLtX/sqicCewzUBNdpMzzhyAt51/wNvBdBgSEj/6kuZdIUgDBxcBQ3KK1p9?=
 =?us-ascii?Q?lKb8RvrV1zfnOWcTr5NBdr8j8ZeC8Xyf7f35zESK3PVyTYL5j/h9Cd90Pdah?=
 =?us-ascii?Q?MUbBvd1o7G6j86x/sTwTww9tj2ZLRn2YdYtdYbDG1SuWNCCcW+tf5sbBO9KO?=
 =?us-ascii?Q?Yv+W7K1WYPDUnBS7xz7wm+FykzWQyeELoDETsUpFDl206GUe7OzztIdVgOP7?=
 =?us-ascii?Q?ceu47g7WopXIHTJeiFJyNRN57nFOE2BM5SEfky38Q3ELS2PWcdNBO8cZD+pX?=
 =?us-ascii?Q?u3lsTnxsDy3g8e9wcDtvQpEVQGAELrYSGlf7aiGkgWi7dVPItyKVh4CuVvBQ?=
 =?us-ascii?Q?k+W7Qt/d2fA6N2aIHOe+jkXxrJLMjt20R+5rREDZ73ovalWTCvpLDcTXXq7U?=
 =?us-ascii?Q?OYe+IzzETKP2va2lFB8XoShBIHlbhzJflcfJRXStgbOu+0driqy4uFQcCs4l?=
 =?us-ascii?Q?emP37T9QrN0m/gw+n9LULhmy6dI3P3t6K9cc?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:41.0681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a8b98d-acef-4c30-420b-08ddd5cf54a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
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

