Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E0BD8835
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A398510E594;
	Tue, 14 Oct 2025 09:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YjYuOKKB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YjYuOKKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E756910E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:49 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e4EMWasCt9g5HDyurjjB4KKV9MZa07MdvycpXDWR8vgWbZc8ZzpEHHHaRTPkwCyJ1W+dBoDQ8aZ+Hg/4cvp1jBj3YN7qq7rJ61klkq4Q8oNAusCOaxp5Bvt/uQsm+cRDpccWsLNnx4SSt28gvSuigSvr2JKpN56CQ3iBK5VZSZfKjM2rB0i8jVWjU9/COMvzGn3rxnGR5T8OSyzgv/TligZtvCDUa/zWDbAha8RRKe4kQk1Bf6UmHRVhU9f9ayqAaFRmSG4E3a7WzAo5xj9a9LTEb2aa6iX6nwMOj0DFzg7agedzHgik0UoWmE9PAVQrVa1BM+08W73H7O65UrDYJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCUKKsvPhipuAzajm7IEzThtaIfKt1fk2izws/hH0C0=;
 b=NSH7ki5asEcB8i1QnSkRkDBl/oC8/vKIcZ8VB4JmYL8uG9Iy41HpOmJYSk3FR2Dm68f4jA6U9SKaM/jhCKjeZYjm5VuxB7dEn8Jhpe/bDrbzcrzhwPEekMXTuLXx/c90U1WvDiCJ6HhKYLBdTlqoKZZ9o5wGQKokf2ccUvDnBCgUx/hhbN5fJJyy5C3N1e8WhVTcEr+dGt4mMMUTwsIQD8H2252o1G24Rp22bCA2Td+uw576H+a7UqX+RKN7xzfzLpNmRmwckylg9TKL7SPndwBsh14rjdMFex5ikcGJoqysfPFbA4GYcF6r1grkdyxGyZovAumVxE3TDPcBdlEb+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCUKKsvPhipuAzajm7IEzThtaIfKt1fk2izws/hH0C0=;
 b=YjYuOKKB8y//OK5vxPegjCdzRuMhJe7qnIo7RMHcRU6GOZp/c1RquK3HUvkXKMVBHVdczJWieMQFHhCDggM+NbT+gt3pd0n+jL3BAWeoh1tTAQj3M+ObyjGuRUetoPAMFAvFPf0rO/TVmRMuzdwf/VcjIbR9mJLaT9NqEwz+tcA=
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by GV2PR08MB9232.eurprd08.prod.outlook.com (2603:10a6:150:d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 14 Oct
 2025 09:44:43 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::8b) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 09:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaAZt3dSnIQh90RdTlenvZEW7noUYyh+MkkRB7NZ5BHRcNayVH4APunfE0Z5+yjiUlQeF2/4bsTrvRqiidkLfZraGGt7sUYYhKbKqKaeuiLkLJlpk49rK//0l5Q7ElWDHJHbkERNrT0NgsU6QkC5sM+P2tIhz0gNtlIIoIQr8DWcmXtAb+BnWNrASbb4rW8wYFvCbcEHyCyL6gwtIMM3XOlr8gNI858J2n6X0+iOMshMo1iJwsIGXHdi/hzPOuUECI3SKRL99fmINpPhQM7GJTSdPPPJibJ00jCr1uaHAV4q+BZqy+7nJIvIyFFbHLpxLfveGMbSyxpeNd0x1VB16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCUKKsvPhipuAzajm7IEzThtaIfKt1fk2izws/hH0C0=;
 b=XVQk3QYddlZ3Bq8+Gta4XN4VSQpc+WTSgd5c8IX2cbCnYgQu/WxopLHXRs6wJf7jhpuwYwmyr2kRfgwORE2Uy9sMzal3HmNv/vBwKL0B4tK+xiLWR1z9n94/Jl050YROVoj27vk5YHT0OWkUuz0tLKbj3n3Hn0Mwd8CD2YUvxSntVVdnW5ZCO6zXnWq9G6lAgLeC9ZQdL9JVHBKIC1ozBQh4Dv6Pb/Rs+LyBfJ5mg01dmQS5HMhpV/3i/7mPPZUigYduze1h7I1BbXcy3S7dDwPx/GZS/KkeWPY/1UYcGoiOsqcwP/t9Vrhv5gbDmINkEgfZs8XEZC7ugjR6ge0TQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCUKKsvPhipuAzajm7IEzThtaIfKt1fk2izws/hH0C0=;
 b=YjYuOKKB8y//OK5vxPegjCdzRuMhJe7qnIo7RMHcRU6GOZp/c1RquK3HUvkXKMVBHVdczJWieMQFHhCDggM+NbT+gt3pd0n+jL3BAWeoh1tTAQj3M+ObyjGuRUetoPAMFAvFPf0rO/TVmRMuzdwf/VcjIbR9mJLaT9NqEwz+tcA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB8286.eurprd08.prod.outlook.com
 (2603:10a6:20b:555::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:08 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:08 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/10] drm/panthor: Add architecture-specific function
 operations
Date: Tue, 14 Oct 2025 10:43:31 +0100
Message-ID: <20251014094337.1009601-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB8286:EE_|AM4PEPF00027A64:EE_|GV2PR08MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b10bd68-5291-45ff-d682-08de0b064de4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TQiDSbuDWx7c8sluxxbXF6HouWTc7niLsr6/QdHjX5IPX8TSDkZADCBwTwVO?=
 =?us-ascii?Q?iGQxRJM/UH6iDdpk2rfMKIXtqJpcEXEIR9Mx6QInGhE7VTHMnYeIHVomrNab?=
 =?us-ascii?Q?kgO2j2gioPB9ObXFjh7icdIBn3b/OtC6D1QjQ8FsizeDZ04AxbfzRTjdoA9Q?=
 =?us-ascii?Q?ymnai6VIQhXmXZil8Yp2SanZYGY6ganNm0cCtC5y/2K+i/AHeKtQXi3M2UaO?=
 =?us-ascii?Q?Oyp5huiKklz0jmqXkyWKWJspua1gnCyddO0a9zMVgCA3xqz5aPnfX79MbCSv?=
 =?us-ascii?Q?g2RSPP8bonWOTBhwu+ohbiqKoP2qbWEUdwJozwYMNrjajvDpKQQMXlG15JGq?=
 =?us-ascii?Q?mACIhcibvlNU1uIU1zorA06MPrOtZS8v4Tfo3KDoTD4EvUd6sSWaPUqFWww4?=
 =?us-ascii?Q?yM7rjnRSiQnCU/h9wBsxt1ExhNYe9ObM8uCLhsSC7o0BQiLQh3DZhJ2A1m8Z?=
 =?us-ascii?Q?BOhoYeb2/SgJa63Dad2ZrOV/Uyj/GuD6WROli00OPbNoB5fuW82zw3oOuxPt?=
 =?us-ascii?Q?NaDIguinKl/mwALnwhKc6T3utIsUZv32VeF/dM083Y1NPUmOOvTmh0jyO5QQ?=
 =?us-ascii?Q?oDT2kumn788Z0IgzeZohHkn9yBFdg6HzKHtnSsZArovXPj6oFLfZPNEcBe9C?=
 =?us-ascii?Q?/Bac2IgH0L//CydFwKE4idQU4GR+gki6BYfBMmSaczV4g7S85Sh6m8qlLiT9?=
 =?us-ascii?Q?PvFdQNcQLVrR5QIvaI3xAOX/yaBKcun3iFq8dEj/NHsAloGjNrV/YPnEvAJB?=
 =?us-ascii?Q?EOJq1z73yQGj7PtuI3i1Z1l4qL+4Lmi4kXkFPQPpkYcXAUOujNu6a2cb0dSf?=
 =?us-ascii?Q?5Xp2yV5GFX8Jfa/NF/t3DfBfjlMyRRkOzeobH9cXrQnwEY1v3o6shQi/Kt8R?=
 =?us-ascii?Q?dKDzqxvVcXyMQFFxkQpP+l+njU8Ex+5v6NgIEHNOPnPJ8zwA85eLkO2CaF4L?=
 =?us-ascii?Q?AcfqijffexeN8AuGLrj1UV1yy2vVdzS2PLOMPDPhA+UAyvNXlpcYZSW3CNiW?=
 =?us-ascii?Q?ThFZOQwPxXbGgG59NLreb2J5WQiFgMc+aPbB3NO0vm93yV9E+TYlqoRVaG08?=
 =?us-ascii?Q?wMML0+tI6SuJyfuIGdNaz5IgMdklGcT1vZrsgn+zKHbAr/TbZZlOlsehoY9j?=
 =?us-ascii?Q?0aJ1Lk6Oo7ZdoCRXRAuHQmRdr2fzhllYBYLab9zQImxxcRHSq/51WzgI6byK?=
 =?us-ascii?Q?6ojhgUI5O8PjphuRY3uXwzAxso52AxxdgaDPTNvkVFX1iUAFQEJdhfjAIgjJ?=
 =?us-ascii?Q?bD4Uwn0L3f9ylrBocu5ByBncrz+Ro0+iw1AMiNgm2OGvJ/T6A6o0BLjof1ta?=
 =?us-ascii?Q?nZ1A36Sm+H6jgXSzPca/IeWMx+KV5EfyhlQ11oGQKRJlqSrh+p1DraXGfwUe?=
 =?us-ascii?Q?KqVzLvpa4LdKglnLVwhmPE1NXWAZ/FMF5XK8FHRqQuZv+lJVAczcBVffAnQ4?=
 =?us-ascii?Q?+1wtMPKiZvGq9TSn0OcD7pg4lT6uCzJo?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f88f847-053a-4a78-385a-08de0b063836
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|82310400026|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U70Y54Lm9mFLL1GdUJ4TQ4l+E9QPgey9lH8AmzVmuX7z1Mgfbf3nsWR6pkLK?=
 =?us-ascii?Q?Vjq17yJKjeCKz45d44CSZ0JO8e1KGJU+wOPA1e+D2EemAxawoQEeZu2FmbpQ?=
 =?us-ascii?Q?qpLUNucMM+s63VkyFA09n7YfIPcvv8t/X07q6PK1PkU52R99Gi387x2Gpmbv?=
 =?us-ascii?Q?vFNdBWLeJIUEx9fzBJOD8KOZhW/OkLeDbtjl4Je7qgP90ukxmCh72YLJNqfj?=
 =?us-ascii?Q?Hv3AlJ1qDLQWLTwa4rdOvuLMdvNqvu+RZ8NLDZ8mHKnooSNy+fyjC8YOJkMx?=
 =?us-ascii?Q?XRZzOEuQgoRY3mrpBe71Sb3OAE7pV7+QTX4uql/5ZU5Mr3vbTV6Ksa/MvtDL?=
 =?us-ascii?Q?HDfFn1U4mw+kvgd3BrmIel5Wn/PkBFJO+Avc78KunNJMv4jUF8SeutwpOT9v?=
 =?us-ascii?Q?n9xRlyzDFE1cQckKgef0EJJs2oj269Dw93FaRCG5SEM0vySszxvn90dKK4tF?=
 =?us-ascii?Q?wionm2+p8KGp0dKhD8QwZxvLK+/agz8RQrUzQiT4ADmOY1ORbh4y2lZf91ik?=
 =?us-ascii?Q?tVOnhMdE3StXVml+1lKBVjJ2DCGzTob3gpF2bvprQMA1CAyrDlNjY9STP5xs?=
 =?us-ascii?Q?hgV02J2bTHI94xn1ZRJBzcWnR0omUR+V/rIh1yBLH+oYCdE9KwmExts1dDxO?=
 =?us-ascii?Q?VNZz8rrVX1IqcPBhtlfDpeHezAJlwp6AzItlRxG7JVb9EqT3RkJZyDxDxPZA?=
 =?us-ascii?Q?BBLVGh/5jp0Wzy0hm4tWSMWkjWvZjnAUlQIKojUx3haFtpomEHo8pvXdyfmZ?=
 =?us-ascii?Q?CI5kWgfhK0lo08o113r0QkQVt6rvSaQmHkoTcYKerFRljS2I95GaSEDpv2O0?=
 =?us-ascii?Q?LMfsf4w6OVcN9/Od1m2lVrMzvuInRIK23ZnFTZ9iCsNu5SbfzJbLVU62q3Wn?=
 =?us-ascii?Q?23dgA50prA3myjwPXvXP4NS8YCCZcD4AlgxkRhUy6cCUI37Z7rBI08Uzv/W2?=
 =?us-ascii?Q?APQZ/BneprT+zGiPN1ILnW9mLVn6+4J1JnHJnA3SRIbLggTEuQLDVu1r8k9M?=
 =?us-ascii?Q?3t+u4h5UZmjzpYV8Bjyd/nBHERnRSBdUbepmkxoWnjWqRlYgIQvar7ZcRP7k?=
 =?us-ascii?Q?b/v2sDXKBUz0SkglBeBcYEDmbMT1KYhszOv3HkjgGZyKl33jR94EVW9p8ZU5?=
 =?us-ascii?Q?jCsOaQbF9eyoeWSXdAwc22dbuG8KVa3r9MsPG0bUqZWH2mNP058AxQj6xRyN?=
 =?us-ascii?Q?g9TPhQSwxvJYpvAxzA1cAFvepC28ggAW2AwgQBT9+I4xIP519xacfRTPyOZj?=
 =?us-ascii?Q?SmXBGbMJux0L3CmM0xsR+SHaefc0K2KLmICu049I2a2IJOZH4nMu5xk+4/Wj?=
 =?us-ascii?Q?ij7d/vJVNwP3fM9r58wYalNH+5qqN+hRMc1Ug3+Lu5wlsnS6tAWu07HmknzV?=
 =?us-ascii?Q?gZVkj4HlCFGC53mIZ3S9Me6bVwv8AcaUUD1uwTmq/gs7gnixjuR8MpTb87k8?=
 =?us-ascii?Q?JnNA+Wths9rzLWMo+y1oL//y1FOZnB48W5ImaM+PkeJ0nAaApWNX8NDgS2Pb?=
 =?us-ascii?Q?SyhgCWyvLqD47ArU+5STviglvsyL7cCx1MaUIw04M/Ncg8ptw7Ytk0NKWrpp?=
 =?us-ascii?Q?0tpSNtUy7/2yZIAROlQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:43.6739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b10bd68-5291-45ff-d682-08de0b064de4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9232
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

Introduce architecture-specific function pointers to support
architecture-dependent behaviours. This patch adds the following
function pointers and updates their usage accordingly:

- soft_reset
- l2_power_on
- l2_power_off

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  4 ++--
 drivers/gpu/drm/panthor/panthor_fw.c     |  5 +++--
 drivers/gpu/drm/panthor/panthor_gpu.c    | 13 ++++++++++---
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  9 ++++++++-
 drivers/gpu/drm/panthor/panthor_hw.h     | 23 +++++++++++++++++++++++
 6 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..847dea458682 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -141,8 +141,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_soft_reset(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaee..e6c39c70d348 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -21,6 +21,7 @@
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -1184,7 +1185,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;
 
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		panthor_hw_l2_power_off(ptdev);
 }
 
 /**
@@ -1363,7 +1364,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 		return ret;
 	}
 
-	ret = panthor_gpu_l2_power_on(ptdev);
+	ret = panthor_hw_l2_power_on(ptdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be0..431ac866affd 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -18,6 +18,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_regs.h"
 
 /**
@@ -218,6 +219,12 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
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
@@ -344,9 +351,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
 	/* On a fast reset, simply power down the L2. */
 	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
+		panthor_hw_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		panthor_hw_l2_power_off(ptdev);
 
 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -361,6 +368,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7c17a8c06858..bc67546f3f6e 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)
 
+int panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 34536526384d..77fd2c56e69f 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -2,6 +2,7 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
 #include "panthor_device.h"
+#include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
@@ -20,7 +21,13 @@ struct panthor_hw_entry {
 	struct panthor_hw *hwdev;
 };
 
-static struct panthor_hw panthor_hw_arch_v10 = {};
+static struct panthor_hw panthor_hw_arch_v10 = {
+	.ops = {
+		.soft_reset = panthor_gpu_soft_reset,
+		.l2_power_off = panthor_gpu_l2_power_off,
+		.l2_power_on = panthor_gpu_l2_power_on,
+	},
+};
 
 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 7a191e76aeec..5a4e4aad9099 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -20,12 +20,35 @@ enum panthor_hw_feature {
 };
 
 
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+#define panthor_hw_soft_reset(__ptdev) \
+	((__ptdev)->hw->ops.soft_reset ? (__ptdev)->hw->ops.soft_reset(__ptdev) : 0)
+
+	/** @l2_power_off: L2 power off function pointer */
+	int (*l2_power_off)(struct panthor_device *ptdev);
+#define panthor_hw_l2_power_off(__ptdev) \
+	((__ptdev)->hw->ops.l2_power_off ? (__ptdev)->hw->ops.l2_power_off(__ptdev) : 0)
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+#define panthor_hw_l2_power_on(__ptdev) \
+	((__ptdev)->hw->ops.l2_power_on ? (__ptdev)->hw->ops.l2_power_on(__ptdev) : 0)
+};
+
 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
 	/** @features: Bitmap containing panthor_hw_feature */
 	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
 };
 
 int panthor_hw_init(struct panthor_device *ptdev);
-- 
2.49.0

