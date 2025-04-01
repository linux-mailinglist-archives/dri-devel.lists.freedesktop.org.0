Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002EDA77F6D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760A10E600;
	Tue,  1 Apr 2025 15:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kVTLMgsU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kVTLMgsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C325810E5FF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:48:55 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gifjJhIsWssiMt/1w01O146tTphN4K135mwcWs/OWl6Cy8TFXxKXGx2NM0Qm5/cwIUufXZDyCp2MWhPUW3XtiTXkMlPGzXuVHAnlR7CbU7+4q65t/DAH3oLmjgaYmGJAPteqnuZnbKFshSo8ILV7PCP+uWdnNBB01tirCGdbOdm5athfJjlDguqzRAF+z6OFjua8nXg/tvMVCNWF25gzp05Y+TTYDw3DefkhTRPSYLLroJSUfK9oqlDRzZ/B/1JVKeZ5RIb1thKWNYTDDjeTEwNM4+8cTj9HdMNYPfrFmsi5wMAuVdS0HWybkow6qIRI/ok8eMv4CINMh1U8bl0eow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK8eaAo11ZlCQ6I373AuHMwGQk0vWIuFjiv6aQ2KXCs=;
 b=x818jzSkmMJAio+4hZ+WJu16o4mRU2IYXFc29vh1BAavPTN+Q93h4tEhARzzji0qaUaol4ZHMnH8mOMy9NJ3Zc/KVpDt7LqWk+iTl26CrnpSIP+w1qvOfjqu0H1Q2q8vcP+i+J+/tVHt34iI4iThjpvH1ELSMHbEXZIxg3iKwk44OzN2JRGGwPkahN8248S2qaAPEWti1lTj3tDLqN5TcvtKTQZRdNRSvVu+Yh8jdHRcQvPVJNVNrKul8xznAULiN9xBR2/zOi5x6QNXJl3xrkeR7SpPweQJ2cdwjWWrvEaOUD+jaN0mmHRdNOfhxdoLqoTPu1lS/Wz27gaNWFG3AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK8eaAo11ZlCQ6I373AuHMwGQk0vWIuFjiv6aQ2KXCs=;
 b=kVTLMgsUDqjRCcyUDL3yq/hwvGTyItJEyohR6zy4VvnOUqhvoRVg6wCa1Ys7wsbIbQhItdLUzkIogPsIw/ToRgyztwq+NWE2Bw2P60+TCMBfloyuf/cA7RXbnB722f9kut3d6pngID9flPFEwlu8C9+5UCR2WE6ZUa+XP2XUjQI=
Received: from AM0P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::39)
 by AS4PR08MB8190.eurprd08.prod.outlook.com (2603:10a6:20b:58d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 15:48:52 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::6d) by AM0P190CA0029.outlook.office365.com
 (2603:10a6:208:190::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.50 via Frontend Transport; Tue,
 1 Apr 2025 15:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:51 +0000
Received: ("Tessian outbound 93207444acda:v604");
 Tue, 01 Apr 2025 15:48:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d6888ad6b27e5a1
X-TessianGatewayMetadata: 2wo16KCqSDmdAK4BxtRuODu094DohDQl4RJmO2wMXxuhd8qhYHT0enbWsXNfAvtGMzPU9RQ+bT4HID+QOegpgI5ra2Mwn8dy/e9qvNkZpH2G0NrAEnJQm9Ev0XaSy1g8ZXMQl/jefyO/8Hrkvxju8q9lFJK2n9KcFYKgzPD7YMmE4BhrfDdFhBg7VNE68KjLu92R3Q8YYus6pT+iK1WKhA==
X-CR-MTA-TID: 64aa7808
Received: from Ldf56ed5f71a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABABF5FE-650C-4DDE-993E-C438ED48AB1A.1; 
 Tue, 01 Apr 2025 15:48:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldf56ed5f71a0.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLEJKUZxqhEJOY/l97PMyPp7GoKB21SKkvGR0uovsgRev0OKU//fFoNmssFP6rgWYvPUu0Hv2BX7J2ltAvZfo9SX329T7Eu+vTWK0LIad76jYG6GozdhzCuFVv+DJ5e7CPpWsZRfC0mGkgXkAfsZMUZDX7EZCEcM5wx5n6hrgjtnVaANfB1E87SZympX2h/1zOuqbSyV/0jE6JTu+Oo6rKwrIJ2bn3Q7ghxaGOuU7UQ4OHjeQjKrI4jfJc9aEivk1h7uoG7k69OPGPIly9FAuqedTlEmXuruKFOajKcLlBQ1lu+WnxhRAsbaOtFr5hgDJuSljuXhja69cTiGps5OkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK8eaAo11ZlCQ6I373AuHMwGQk0vWIuFjiv6aQ2KXCs=;
 b=kcSDBWcfWGwr7zriUZ4KX2pkA2SfFiJFoyrMCUH04z1HoU6nRpDw5WM4cfgOFN4KsMywoic0gA3xSDCjG8ftuOrVXODiUUBq7/j8eIXYJlI+Dz6qQHoRelF594NEm1vyssQFlfzVbSh7sx8BE7k7hr+Q+/PDBaD0sIgVbr632wawKL6eOG6a3rskQsodW7KzUvrd0ZB+/SvSDbnGb8GG9SsQJyiaFWlAl+jbFgYzXvWBOo/WtVaplqRLqUj0jAGbGOeDL1RhHlOYwPmY0APsF5yAdoQ5djPQk142dR/smJWnzzCFyYC8gPtsvw+S9Ub447L+kjrGG1P41T3v3jQdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK8eaAo11ZlCQ6I373AuHMwGQk0vWIuFjiv6aQ2KXCs=;
 b=kVTLMgsUDqjRCcyUDL3yq/hwvGTyItJEyohR6zy4VvnOUqhvoRVg6wCa1Ys7wsbIbQhItdLUzkIogPsIw/ToRgyztwq+NWE2Bw2P60+TCMBfloyuf/cA7RXbnB722f9kut3d6pngID9flPFEwlu8C9+5UCR2WE6ZUa+XP2XUjQI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:36 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:36 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v3 1/7] drm/panthor: Add performance counter uAPI
Date: Tue,  1 Apr 2025 16:48:16 +0100
Message-Id: <45c1f1a99427800ee154f22070648c41e0d3dfe9.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0040.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::9) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AM2PEPF0001C714:EE_|AS4PR08MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fa5e01-1fd0-4da0-e01b-08dd7134b349
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?QODcco8NbBjoAuOdspfzkcZ/rYW6TCvVee2El16Jp+ToOni7V2JyaeUqTBLn?=
 =?us-ascii?Q?SldLRc1FzJcNm8rb9u74BtsnCcs5nKV/oZboiY+czM2YMh3kG92u/6ueIovI?=
 =?us-ascii?Q?LRUk2n8dCA6M7++sBDL3jKJNa2rhVoaTVyBLShVF/YDI64q4/dDBMBJrRZL2?=
 =?us-ascii?Q?ZMEdCqLwlwpujSynoNcvVSs1ij0SVY2e21zFKjHy9oNYcz8hHtccetIrak5J?=
 =?us-ascii?Q?bMRMdTQcWnWLMS5pIE8ThmNXbISNYAbUHUoHnF3vz8KrxIvbHcJoYGCfpUDu?=
 =?us-ascii?Q?FC3Q9fOPLM8gsg1Gvkock8KtUP0L8JXozb+El9T0TtXKPXaTBM1Qs42KuZZw?=
 =?us-ascii?Q?MQFRlAITHz5LGU2Rh/7hqvg4OtaGNvEatB5XS+lROuEYfnjyN6ixCmq87Ii7?=
 =?us-ascii?Q?4yexOdnmoFPFzfnMMeEweXcD42fIZmSwnnzCAOoShQovtbXo1b+CGVOEFW3W?=
 =?us-ascii?Q?hxaTt5UsosJFir4dCBkfH1JBPwtGrokOJOiqkFV4OUPiylHNrALtsOK4gg5d?=
 =?us-ascii?Q?Qe6LZupP9nMaXyHj2fNoFzqikd8rpXqYPhwT+ikBZ5FH2Q1qT58H8YkIe5wA?=
 =?us-ascii?Q?DWvIKKgoGQ4ud2spuWKgBpzOnkdxP/uK44W5PValpaKF+2fvS955RuhMdS2b?=
 =?us-ascii?Q?ne1T8dfw2sFPL0eFBCCZuwYTRDV5DqtZr0/eHXLzUL36p3MCTe0ng8J7IhLJ?=
 =?us-ascii?Q?9LKQr5VxDMvMI/U5Hrh1Zq0z4e7N6TnnMWiOPJwIikKnVHYeceZshM4m7Xux?=
 =?us-ascii?Q?QWUNZVv1HeZZ0qk05zI45lMW8wVMSX3k+iejipm+xHdxovtZCe0WQ/J6G1u0?=
 =?us-ascii?Q?uT+HPQ1wxTaYxFqHBhPvHYEdIUbqBjhzWXZm5j9BTwY7Ifm3MpHRej7zBb6h?=
 =?us-ascii?Q?zwoi9XvGM6NvBkuSoYCQ6rurJ5JTo9x7sp6/7/tp3nbQZY0wqDN9lmjJgTX4?=
 =?us-ascii?Q?iWQ9YSfBQzpNik30Yxs37lLRCeyIyTHkH9RTKDd6kpNvHUQlMwKKpmBa6RjY?=
 =?us-ascii?Q?vG1mjOwvbnQHAnz01OzHLhtq+Txqtml3UfhMz7YleRenMd1mAeehEegkldSL?=
 =?us-ascii?Q?ojdPu5acPARxa222ba+rSHnVCI6hp6OfLDZSw0UoyoQqftHB3YOprWSrvTPp?=
 =?us-ascii?Q?ZsnKimYHo0AafqZWp/nu2cuD0TGLrQlEZTUic0a0FUewciKD0zp0Ts+EP8lC?=
 =?us-ascii?Q?esL+dw9JnicBti+5i0UryFA/dB1vSXRQnX8oqWITbJhI7UP1K414XeMjviOU?=
 =?us-ascii?Q?gftzsq9eKojQR28UJp1TM0fEpI2ygS092l8Jg3uYatVBgOAhTNy/W9rAuCKp?=
 =?us-ascii?Q?SwqmrDWuE+bwLoucwLRg0ZJCLOr6rxomjF5Bf3696I83TyQaKrndi50eTEvC?=
 =?us-ascii?Q?z7nDjlK7VgmMRHanYsywTbWR9t6tDii3UC2UjJPEan/oAezZJRDH538iLwn9?=
 =?us-ascii?Q?lykzZuvFA/0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f36e349-6b82-475c-f756-08dd7134a9e9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|82310400026|1800799024|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9cc4f4IxlIZJxGY7I/2fN/D1zY6IJR86GHAmeChXyB7JOPaVWJ27rB2CtC/4?=
 =?us-ascii?Q?ybTmtuxnKkYhxKpYJRbGi4IVRayPUznmtsr6NuUImWt3xz40ttZ3DxefuUmx?=
 =?us-ascii?Q?k6zTU7sA//nw3fh9E0KVincjmoSM0WiVHdAPDmm5fDtFl2nAJewPSRBSHSOU?=
 =?us-ascii?Q?g2i2FqTMGxB9oMkInFlXlxbpaNLDMiI1HHzpl+VV7fRJgZpPIGIT4hm7Yaoj?=
 =?us-ascii?Q?CLEeMQdt/7eZTbsyir7T5hf0sFUA3M9fuZkXl2DLHliXt2rMoR3SIO3JQUNb?=
 =?us-ascii?Q?R4265uQ0sfwGcbq+C0m/5SuCqFhVVIvMfj7ESJ76ngx6FR1GtUK0wMJ+YqCY?=
 =?us-ascii?Q?oLt2J71dMQ5JgPPLXwhn50raDAvWc7DXHkbBfeCqgPh2jbEFdGAIFgrr4ZBr?=
 =?us-ascii?Q?2zXlmoQBd6JOEFWJiboCeWPfkTdPYsMEhKOMYgcjm94mPJ1RTVG/yxCQSb8n?=
 =?us-ascii?Q?gy6kwj0TV7/0kLwvhVuoyAx1uywr/B6I4wljEpSSGKjsHAGyQpqwmp1XTANq?=
 =?us-ascii?Q?xBZQ4as9gJsSgAUBocunbAALWSI6dskRTd+32mtP6RQ4CJRyZ+2w80fM99vW?=
 =?us-ascii?Q?vDEXdNe/2IAUDB2HssziIkcyUHhmvWpo6qU0n8py3gQnepTLw91wviVNCZxL?=
 =?us-ascii?Q?ErXrY/vRKRQW+sol2dFowZ7pY5daywAloUUQ0I3qgjWCaY/B1nFj8e4Fy/uu?=
 =?us-ascii?Q?G1e3F6Wk3PhwU0Fk5Mw2AYIuGxD3oBwIkb4GTnFtu3h2JMjOs8D/8Clv5bLF?=
 =?us-ascii?Q?0RTS24loXNsohJUEdVhYhDoem3ZO8zFbSU3IMpqhC7IlNyWDmIl/Q0CrEoKc?=
 =?us-ascii?Q?LwdOEMknGyXW/yj2X+4+Cqm7gGW16lscrtX7iteYu+/PfjHxPIpZ9bvZVlH/?=
 =?us-ascii?Q?3VVCXiuPpmSFINxTzOFK3pq/f6Ui4r+lhXziXKgRCJaIXdEDqtXL4w2B2Ng6?=
 =?us-ascii?Q?0FCQt9nyDoj7lgXs1KT94+dmTpfaj/VY/4FawYJ2vFHEVNnM/KvwVt+d1wo5?=
 =?us-ascii?Q?TmqF3lK7qVWHyoJM4Dd97HdUAXGQwOTAyjXkFRQ1wHstlAIQY7e9u9cz+ej7?=
 =?us-ascii?Q?mSs1V7+5HzzrWTwFztA9P1LG30K9k2CwvAyehJxO3NNUA5eQsAVkDNBf8ByP?=
 =?us-ascii?Q?664ciG2AEZ+dsmyn4S76ALqn3wfKFMo3ATcmNDR2M5ja12zJocI8+xLw1snO?=
 =?us-ascii?Q?4+XCpOGnTxyTLXhg3cG2yTPtZ65EIgdXDBPDE8B2ZgLoBt0Onk5w8xTf79iH?=
 =?us-ascii?Q?HhsocaYfMLGeb00q+kkSHmawMJZjwASoIVUtbNKQGvYXDZc6/37hl3NRqmfB?=
 =?us-ascii?Q?MVdEjIjgSAv8nM53AJ9RJ2Do2abTBoEcYIBNDXK91/jhqhj/a4gGOgNoh3zf?=
 =?us-ascii?Q?eCbs4SvIMudyGE0NIh3yq3nDhRrkPSznZCSvr407zMlsLmR3ujm4ikBCwOhf?=
 =?us-ascii?Q?sME7Njx4+AiMVUZQehN3soX587s4WjIPazZjWh44X49/MKriDmhESxqhLMpA?=
 =?us-ascii?Q?0i9rBSXnrl8yfRK0iVrhOcSqVS4edQIdgfy3?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:51.4804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fa5e01-1fd0-4da0-e01b-08dd7134b349
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8190
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

This patch extends the DEV_QUERY ioctl to return information about the
performance counter setup for userspace, and introduces the new
ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
performance counters.

The new design is inspired by the perf aux ringbuffer, with the insert
and extract indices being mapped to userspace, allowing multiple samples
to be exposed at any given time. To avoid pointer chasing, the sample
metadata and block metadata are inline with the elements they
describe.

Userspace is responsible for passing in resources for samples to be
exposed, including the event file descriptor for notification of new
sample availability, the ringbuffer BO to store samples, and the
control BO along with the offset for mapping the insert and extract
indices. Though these indices are only a total of 8 bytes, userspace
can then reuse the same physical page for tracking the state of
multiple buffers by giving different offsets from the BO start to
map them.

Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 include/uapi/drm/panthor_drm.h | 545 +++++++++++++++++++++++++++++++++
 1 file changed, 545 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..c63cbdddde76 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
+	DRM_PANTHOR_PERF_CONTROL,
 };
 
 /**
@@ -226,6 +229,9 @@ enum drm_panthor_dev_query_type {
 	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
 	 */
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
+	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
 };
 
 /**
@@ -379,6 +385,123 @@ struct drm_panthor_group_priorities_info {
 	__u8 pad[3];
 };
 
+/**
+ * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
+ */
+enum drm_panthor_perf_feat_flags {
+	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
+	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
+};
+
+/**
+ * enum drm_panthor_perf_block_type - Performance counter supported block types.
+ */
+enum drm_panthor_perf_block_type {
+	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_CSHW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
+	DRM_PANTHOR_PERF_BLOCK_TILER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
+	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
+	DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
+};
+
+/**
+ * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
+ * in a given block.
+ *
+ * Since the integrator has the choice of using one or more clocks, there may be some confusion
+ * as to which blocks are counted by which clock values unless this information is explicitly
+ * provided as part of every block sample. Not every single clock here can be used: in the simplest
+ * case, all cycle counts will be associated with the top-level clock.
+ */
+enum drm_panthor_perf_clock {
+	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
+	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
+
+	/**
+	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
+	 * caches and the tiler.
+	 */
+	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
+
+	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
+	DRM_PANTHOR_PERF_CLOCK_SHADER,
+};
+
+/**
+ * struct drm_panthor_perf_info - Performance counter interface information
+ *
+ * Structure grouping all queryable information relating to the performance counter
+ * interfaces.
+ */
+struct drm_panthor_perf_info {
+	/**
+	 * @counters_per_block: The number of 8-byte counters available in a block.
+	 */
+	__u32 counters_per_block;
+
+	/**
+	 * @sample_header_size: The size of the header struct available at the beginning
+	 * of every sample.
+	 */
+	__u32 sample_header_size;
+
+	/**
+	 * @block_header_size: The size of the header struct inline with the counters for a
+	 * single block.
+	 */
+	__u32 block_header_size;
+
+	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
+	__u32 flags;
+
+	/**
+	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
+	 *
+	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
+	 *
+	 * For the same GPU, different implementers may have different clocks for the same hardware
+	 * block. At the moment, up to four clocks are supported, and any clocks that are present
+	 * will be reported here.
+	 */
+	__u32 supported_clocks;
+
+	/** @fw_blocks: Number of FW blocks available. */
+	__u32 fw_blocks;
+
+	/** @cshw_blocks: Number of CSHW blocks available. */
+	__u32 cshw_blocks;
+
+	/** @tiler_blocks: Number of tiler blocks available. */
+	__u32 tiler_blocks;
+
+	/** @memsys_blocks: Number of memsys blocks available. */
+	__u32 memsys_blocks;
+
+	/** @shader_blocks: Number of shader core blocks available. */
+	__u32 shader_blocks;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
@@ -977,6 +1100,426 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * DOC: Performance counter decoding in userspace.
+ *
+ * Each sample will be exposed to userspace in the following manner:
+ *
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ * | Sample | Block  |        Block           | Block  |         Block           | ... |
+ * | header | header |        counters        | header |         counters        |     |
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ *
+ * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
+ * providing sample-wide information like the start and end timestamps, the counter set currently
+ * configured, and any errors that may have occurred during sampling.
+ *
+ * After the fixed size header, the sample will consist of blocks of
+ * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
+ * header of its own, indicating source block type, as well as the cycle count needed to normalize
+ * cycle values within that block, and a clock source identifier.
+ */
+
+/**
+ * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
+ * hardware block went through in a sampling period.
+ *
+ * Because the sampling period is controlled from userspace, the block may undergo multiple
+ * state transitions, so this must be interpreted as one or more such transitions occurring.
+ */
+enum drm_panthor_perf_block_state {
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
+	 * sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
+};
+
+/**
+ * struct drm_panthor_perf_block_header - Header present before every block in the
+ * sample ringbuffer.
+ */
+struct drm_panthor_perf_block_header {
+	/** @block_type: Type of the block. */
+	__u8 block_type;
+
+	/** @block_idx: Block index. */
+	__u8 block_idx;
+
+	/**
+	 * @block_states: Coarse-grained block transitions, bitmask of enum
+	 * drm_panthor_perf_block_states.
+	 */
+	__u8 block_states;
+
+	/**
+	 * @clock: Clock used to produce the cycle count for this block, taken from
+	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
+	 */
+	__u8 clock;
+
+	/** @pad: MBZ. */
+	__u8 pad[4];
+
+	/** @enable_mask: Bitmask of counters requested during the session setup. */
+	__u64 enable_mask[2];
+};
+
+/**
+ * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
+ * period.
+ */
+enum drm_panthor_perf_sample_flags {
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
+	 * of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
+	 * the sample duration.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
+};
+
+/**
+ * struct drm_panthor_perf_sample_header - Header present before every sample.
+ */
+struct drm_panthor_perf_sample_header {
+	/**
+	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_start_ns;
+
+	/**
+	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_end_ns;
+
+	/** @block_set: Set of performance counter blocks. */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[3];
+
+	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
+	__u32 flags;
+
+	/**
+	 * @user_data: User data provided as part of the command that triggered this sample.
+	 *
+	 * - Automatic samples (periodic ones or those around non-counting periods or power state
+	 * transitions) will be tagged with the user_data provided as part of the
+	 * DRM_PANTHOR_PERF_COMMAND_START call.
+	 * - Manual samples will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
+	 * - A session's final automatic sample will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
+	 */
+	__u64 user_data;
+
+	/**
+	 * @toplevel_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 toplevel_clock_cycles;
+
+	/**
+	 * @coregroup_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 coregroup_clock_cycles;
+
+	/**
+	 * @shader_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 shader_clock_cycles;
+};
+
+/**
+ * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
+ * IOCTL.
+ */
+enum drm_panthor_perf_command {
+	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_SETUP,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_START,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_STOP,
+
+	/**
+	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
+	 *
+	 * When the sampling session is configured with a non-zero sampling frequency, any
+	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
+	 * -EINVAL.
+	 */
+	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
+};
+
+/**
+ * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
+ */
+struct drm_panthor_perf_control {
+	/** @cmd: Command from enum drm_panthor_perf_command. */
+	__u32 cmd;
+
+	/**
+	 * @handle: session handle.
+	 *
+	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
+	 * It must be used in subsequent commands for the same context.
+	 */
+	__u32 handle;
+
+	/**
+	 * @size: size of the command structure.
+	 *
+	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
+	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
+	 * struct_size) to the pointer and update the size accordingly.
+	 */
+	__u64 size;
+
+	/** @pointer: user pointer to a command type struct. */
+	__u64 pointer;
+};
+
+/**
+ * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
+ *
+ * The hardware supports a single performance counter set at a time, so requesting any set other
+ * than the primary may fail if another process is sampling at the same time.
+ *
+ * If in doubt, the primary counter set has the most commonly used counters and requires no
+ * additional permissions to open.
+ */
+enum drm_panthor_perf_counter_set {
+	/**
+	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
+	 *
+	 * This is the only set for which all counters in all blocks are defined.
+	 */
+	DRM_PANTHOR_PERF_SET_PRIMARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will
+	 * have the UNAVAILABLE block state permanently set in the block header.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_SECONDARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will have
+	 * the UNAVAILABLE block state permanently set in the block header. Note that the
+	 * tertiary set has the fewest defined counter blocks.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_TERTIARY,
+};
+
+/**
+ * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
+ *                                           into memory shared between user and kernel.
+ *
+ */
+struct drm_panthor_perf_ringbuf_control {
+	/**
+	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
+	 *               modifiable by userspace.
+	 */
+	__u64 extract_idx;
+
+	/**
+	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modiable by
+	 *               modifiable by the kernel.
+	 */
+	__u64 insert_idx;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
+ */
+struct drm_panthor_perf_cmd_setup {
+	/**
+	 * @block_set: Set of performance counter blocks, member of
+	 *             enum drm_panthor_perf_block_set.
+	 *
+	 * This is a global configuration and only one set can be active at a time. If
+	 * another client has already requested a counter set, any further requests
+	 * for a different counter set will fail and return an -EBUSY.
+	 *
+	 * If the requested set does not exist, the request will fail and return an -EINVAL.
+	 *
+	 * Some sets have additional requirements to be enabled, and the setup request will
+	 * fail with an -EACCES if these requirements are not satisfied.
+	 */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[7];
+
+	/** @fd: eventfd for signalling the availability of a new sample. */
+	__u32 fd;
+
+	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
+	__u32 ringbuf_handle;
+
+	/**
+	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
+	 * insert and extract indices for the ringbuffer.
+	 */
+	__u32 control_handle;
+
+	/**
+	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
+	 * a power of 2.
+	 *
+	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
+	 */
+	__u32 sample_slots;
+
+	/**
+	 * @control_offset: Offset into the control BO where the insert and extract indices are
+	 * located.
+	 */
+	__u64 control_offset;
+
+	/**
+	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
+	 * disables automatic collection and all collection must be done through explicit calls
+	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
+	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
+	 *
+	 * This disables software-triggered periodic sampling, but hardware will still trigger
+	 * automatic samples on certain events, including shader core power transitions, and
+	 * entries to and exits from non-counting periods. The final stop command will also
+	 * trigger a sample to ensure no data is lost.
+	 */
+	__u64 sample_freq_ns;
+
+	/**
+	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 */
+	__u64 fw_enable_mask[2];
+
+	/**
+	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 */
+	__u64 cshw_enable_mask[2];
+
+	/**
+	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 */
+	__u64 tiler_enable_mask[2];
+
+	/**
+	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 */
+	__u64 memsys_enable_mask[2];
+
+	/**
+	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
+	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 */
+	__u64 shader_enable_mask[2];
+};
+
+/**
+ * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
+ */
+struct drm_panthor_perf_cmd_start {
+	/**
+	 * @user_data: User provided data that will be attached to automatic samples collected
+	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
+ */
+struct drm_panthor_perf_cmd_stop {
+	/**
+	 * @user_data: User provided data that will be attached to the automatic sample collected
+	 * at the end of this sampling session.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
+ */
+struct drm_panthor_perf_cmd_sample {
+	/** @user_data: User provided data that will be attached to the sample.*/
+	__u64 user_data;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1562,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_PERF_CONTROL =
+		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
 };
 
 #if defined(__cplusplus)
-- 
2.33.0.dirty

