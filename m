Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC8CC15F4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DBF10E717;
	Tue, 16 Dec 2025 07:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jg2Qtpg/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jg2Qtpg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C2010E717
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:53:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QNf661UbTUS6Dquszs6wQoyLFHp7I7+CGcKK4FWnlBjwHLvVtwbzOtm9hD/w7QwH0o686SsObeWWMbtNFEIyz3hERmeDh9m2hVJ5g0jBi4/p5iShv+n+7GTS/PMYNsLytuX37DwAHYHhOqLjyjN/LloPndSAZ5m9AykB86VJ5hQrPNcbRCwdwIRawh1Kfue7HmiwNWFNYn+YW/HC4h0TA5D6We0LuyKs+Fq6zDmmxFj0TIt9n9rS4pobk3+S7jn+pSAqimmMn4NKCLPP/1uTGkwUpDUIR4sZdK8uLfHkJUimlZSmfeNwcOOBxTAmiwPJ2hvwUdHcVCXoe/zxPiYqvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb/6uabVKg4Mavr8kqDsmnv1bxRfUWqb6VFUWEisJ+c=;
 b=SBYYa0H5rQoGXPraIe5U0GK+iEhomnZBgrZSe6UXvswAKg4sSO8EAC4lp8wgNmkyRu0G5ocg//HmmFM8LgOOPZFdtyzzlGWRSl6GQ2Q8n6ynBq1M+EL00mo3rLKS48H6ThBQu4JV99kVnEvbse6OXhVD6HMkpdiRvoFDp+dHF3cndM9usKOpr69Jhrd28e95kCSr0BP5XBjj83jM8YCxxPt83ThsZj0K4OTVOMT2Bphjd+D8xt9aM1A5QRdmXJuJ8o9IgSSY/LecTbAgvG9cM3vQT/OgZiCV1nA8LpcNfOB51D/HokitSXzqkh4qtyQamluXItx+v3ccIwkTvIUqAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb/6uabVKg4Mavr8kqDsmnv1bxRfUWqb6VFUWEisJ+c=;
 b=jg2Qtpg/8L6HAZfxDe7pHJ7vD/ja7yXdLMn6c9vrVhJnvdAv4OaJUsDkBhsVQa7LlPUoQpndfM9YYLaROvlsUIg+8/lInug4WDZ9W1AAs0wred2Ydkcf6Ra+MYbuGkF1JdBq7q/5G9ipP6ZsNkKqyucDBql5bowGq55G9WJH/co=
Received: from CWLP265CA0389.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::11)
 by PAWPR08MB10258.eurprd08.prod.outlook.com (2603:10a6:102:358::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:53:51 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::d4) by CWLP265CA0389.outlook.office365.com
 (2603:10a6:400:1d6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 07:53:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 07:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sg5/I0/197J4nP7MjKXDklrZ8CSuaJlLsVL0aWFmufOHhVXtnbRD9XD1Y3byOg9LHgFwci3bVBc73jZJJrck8LOtm5BEPrmieGDZmOR1kHYfU74IUbC4FmtlVHH5wdMPxKCy1gKmU5Q74JmQGgsjZV1GNFNDAYqgVti7OOY4qirGXS+uYiaUmsHhL27YHs1NtB7cPuDLnYT3ed+ZW68K5Q88KAXINIEibEB8324N144LWmtoaMJSHD45ebRESDPczMJxp99s9wc53L+rnDt+87YNEApSUPL3DqttkfrIGjKFcwU0SbjdP0dtr5IFM+ww66BNR5PGv4WIYqfUk6PsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb/6uabVKg4Mavr8kqDsmnv1bxRfUWqb6VFUWEisJ+c=;
 b=Q0sugFZE4jJPItkffk3opbCyBGFyHMZUznJSSQWb/XTHukOFBOyqgKdtgRlZSSt6sXfI5+Ukq050viIms/vhmc72YuuL4FpE5GYfsyU9YiXnf/JMWWO1ally+qAhB4j28LJhMmr/QRcmZSM/+X0vtaOuDQv/iR5v9khuR5LDKsec+lw7M4M2/CbmXbqW47NCMxXRZ85vedMiVddKoeqribBLp9jJRPipoKHm+er0XLPBNiW4nV8saZ77/TRgMVhpH1JhP8vVUCEAphvcalLWCPq6e/v4K4dZYK7xle1IFsSdWNFjJFudMmYeOeDHrUgVLgd8wGCD3K+XSiqDSn5VSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb/6uabVKg4Mavr8kqDsmnv1bxRfUWqb6VFUWEisJ+c=;
 b=jg2Qtpg/8L6HAZfxDe7pHJ7vD/ja7yXdLMn6c9vrVhJnvdAv4OaJUsDkBhsVQa7LlPUoQpndfM9YYLaROvlsUIg+8/lInug4WDZ9W1AAs0wred2Ydkcf6Ra+MYbuGkF1JdBq7q/5G9ipP6ZsNkKqyucDBql5bowGq55G9WJH/co=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6440.eurprd08.prod.outlook.com (2603:10a6:20b:33f::9)
 by AS8PR08MB5957.eurprd08.prod.outlook.com (2603:10a6:20b:290::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:52:47 +0000
Received: from AS8PR08MB6440.eurprd08.prod.outlook.com
 ([fe80::c5b9:7014:641d:50]) by AS8PR08MB6440.eurprd08.prod.outlook.com
 ([fe80::c5b9:7014:641d:50%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 07:52:47 +0000
Date: Tue, 16 Dec 2025 08:52:43 +0100
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nd@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group
 and queue errors
Message-ID: <aUEPyyT2KLr3wd8W@e129842.arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-6-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To AS8PR08MB6440.eurprd08.prod.outlook.com
 (2603:10a6:20b:33f::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6440:EE_|AS8PR08MB5957:EE_|AMS0EPF000001A4:EE_|PAWPR08MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: ef18c140-c1d6-4a0f-6124-08de3c784072
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?19UqSJUio7Je9IKDDwHHTYatzAWIZwIAyC7zwVqaBAKtNcrYIfRQ5OHQq+8a?=
 =?us-ascii?Q?iyUJX607Q46V2vPNL+IuBttlrgRc+wqP0oIQWi+PdSZZ5vIYSxTUUyt2EHUi?=
 =?us-ascii?Q?qW1exymhqarpjDQBFQo/30iTddhl7fYPLn2LqcQC9X6IlHhbA4n9r1RIOmVs?=
 =?us-ascii?Q?gfMsyQdb9D6D1uRjwnXAB/Prq3p+4lN2Ymlv8uMTDAvZ+wctIXJPi8LFSbcW?=
 =?us-ascii?Q?seASOMZ5fUO9im9js4YJvoZIZI6AVa2csmpKbOC79Ephme3oDhGCkk6elEGb?=
 =?us-ascii?Q?VRhBXv5zmT+pwtQbEOo6Ga9SDW5dHrPTfX8ZnCYOgI10b1QNI4qyFqQ05r+f?=
 =?us-ascii?Q?Z3x1WfTMsz0RChzg4YS4kPInuU4LW0tOp+DLHEIuv4/A0mj7amZHn3PUvvys?=
 =?us-ascii?Q?V+5TRljJkyut7GuLPk1wquTC4HrCh8cZoneBLwmOGtdqOQXtUj+nsHfT+5F1?=
 =?us-ascii?Q?wFlSsToFJV4pd9g995bcHZ8OrOsJPWNWPFPT7s1IanyCs2E7EOD1RZandLeD?=
 =?us-ascii?Q?thWnKa70StD+ASLj4l4B0RdgqXAFKMtmbCp1QkFwCmuGama4cR3xPOZJbHrf?=
 =?us-ascii?Q?UiBWjxlFJ2UsWA/9LtTStJAWGG1E1LLJZ3HWS2CqwAXI/NWg2zAWkjo8XfAK?=
 =?us-ascii?Q?rcr7USTHATdXsZWbF3Ez14QKe8vIJMnz2Uq1CDZLyrRnjBS3s9Yhjb8CnLNt?=
 =?us-ascii?Q?0EB33VN66CfJRB2E33mV9KpdqEJd4Cc15hVGfXiLi69rj7R5++gFVwvVcyx9?=
 =?us-ascii?Q?mvGdgxmvmkYDb4983U0SCPJO/NOoi4+tdXUYeOUtpz9kkJ74EwNJbTmPk+jK?=
 =?us-ascii?Q?+ZPQwJXTaveh39r+CF4UAHezBkRIr/agn990Rl7+nGV3zKiCagiOQ9hMAIEj?=
 =?us-ascii?Q?tUT1QHFR6KlzOlzN+niYQJgqfMbakzqswC0hQxSLdFRJ+ujKFdzg8O9P7J2c?=
 =?us-ascii?Q?nowugrXmS3pkFvHZSbeyeBZExX4w9CUdgh0l/V+7DyH+6gEMtyuaxuclu7Vg?=
 =?us-ascii?Q?2sZLO0sIamY3LOEwIeK7kPhf1ULQDl8UgyOgAKI+N3MbGWzMsgiw8dgFgnyN?=
 =?us-ascii?Q?fI8KgGfCaElvgTN17ON7sUabTO/pwb34zicgaETjdyvwDMHkZGLG4XJsoD3o?=
 =?us-ascii?Q?KzffC6eM5aS5254XwA5EgrsAOOR1P6urFxfCctrWz2X0yzlQ3SwOb+iExA3K?=
 =?us-ascii?Q?V46+FQUSdYN+TBUr9DDAp5jup3EgWi4PUR1gqwXZE6DPHX7hPCidobqyPO+r?=
 =?us-ascii?Q?sshghgvRxH5p1NXtltUQwQOykWRClHqhWRkNhy0in2tmRHebepTtgQ71ryxN?=
 =?us-ascii?Q?dLaWy6eiWef9Vdrk7lGB2e/g2gze33TTh0b2D/0hgcwktdgtVf+SLLLGxsAB?=
 =?us-ascii?Q?bmzkWcvBSXGZjFHa98zSI8PQbF+KW3KRc+3UXVTHNLzv8bOWreGgNiNGmAYB?=
 =?us-ascii?Q?tL/SZSZYa1urNvLxoQwXnHhJzRIsUtxH?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6440.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5957
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5989f17e-3c59-4250-e098-08de3c781a5d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|82310400026|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qB0EpxCKMp03iT+iDJXcwHLzr54SFRvFxaNHstxojqvVKkUayb02NwMbu5Ax?=
 =?us-ascii?Q?LC2KKVYLOvPIRep71MRkBOtR8sl4Pl6GZDJu+PjXLBdmDu7V/va+rRPIX4mc?=
 =?us-ascii?Q?vrzGOBhNLExFEIFH9oxLKFAvZ+zKR/vdjbzvB5on0W7MH3r76i5n6SgeSkXN?=
 =?us-ascii?Q?ZQaPdm/WHfKhiOzC4k+RlSSn4okfRjwU1qF0zu/vzp7IX2VeLIDG71/+EG+Z?=
 =?us-ascii?Q?htees7CEdm+IZQVUpDWgnY34i/BlWWQbBgsiaD65OVxjO9wNtdfr8ODUo/cL?=
 =?us-ascii?Q?mEWtzPkApJC26oaqkrjDD7VebV1GzSVog+uMXi4L6gulwIt65dN4QMk0cSdC?=
 =?us-ascii?Q?sD6CPe/mZRW6dKMxhWNhWnvTaNX1yefXi7DEJkA8+5R4ECazbmiOJU6q7zJZ?=
 =?us-ascii?Q?ylr2IX3SAs+7Qbut/9wZRGt4v3XLFRnxZK+TpFmUVZqYijOrfCWC76Wron8F?=
 =?us-ascii?Q?pQqU9Z5GupgWVRDM1Dppfp+EYqUSnhfvVg3qeLOnDkkErDyuy10tN5gEYNh5?=
 =?us-ascii?Q?T+9f15hvTwHUfAts/2rXh0u8pHMtg6PPNnc1oSkzq2Ucy58UR+2pLBCUs7Jl?=
 =?us-ascii?Q?d/PlItTI/aaP0m3jyNdJxxx3flkhIqfkN9rKGflSh+pBQ2sJm+ieEP7+LQT3?=
 =?us-ascii?Q?qq5gLHOiX6AkJ9FLXnWardRr2Ropq4YhOjIVLsxwU12g9fA83TAZdwatlPmT?=
 =?us-ascii?Q?S99gIykwgyf2ZLPli4bMxv5HsNRIW3L3eau9kJiziZYOSiO3zK2HvNqAA9Dx?=
 =?us-ascii?Q?XXM5kJkeclnf/71VNog1Op7bWGPso8EyV+r0o556aVsKTMxTyKkjF3gxiW1s?=
 =?us-ascii?Q?2vDm12vM8TasKM7HXHEamU6jSwrowtPz9XqOsSuM4yZGFkm9dNdoJ1qmPevZ?=
 =?us-ascii?Q?FVydbdm/MxZXEl6NcEz7hDEr519l+pOB3EhUg6hn7luiVjnvB1CNRDLs3tZE?=
 =?us-ascii?Q?64cy2zXCcZnwbLwPoOPdttVDgmF6muaNiErDe6UIl0GIYlkx+arGJbtnP55D?=
 =?us-ascii?Q?ya2i7MvQBxK7GHMEbMUEzDdynEUIFcZSrg+nujtxQxbPsKFQoxUNDQu/v8Xw?=
 =?us-ascii?Q?f6gT8JxvfRSFiTIoYdaWOo0y4vp8CaZtuCyze59LkcF6TV3aUteCAPeJTEIj?=
 =?us-ascii?Q?Sl2KRxb5jW16S3FztFF55SfMExHcbwjiAeluXqrv4DqVKncLr2BR4pZhO0/U?=
 =?us-ascii?Q?nKDgo1PpGGtHaDBGypcRCk0tfz9u0dwwQhYHF8RZWoj9zTAIPnXj2FNzdmVj?=
 =?us-ascii?Q?KOQ0TRv2wPp/4yavnScZxcdN22bCXbSOdKOq38bmFt5/Mk2F0IPW2gwelwDz?=
 =?us-ascii?Q?Krm81nuPX/TdOMAZX2ovE7vSrfteH0fJzj3IAR06tOwn/2O3m7gdoLM62XSj?=
 =?us-ascii?Q?LlIRxCvoUAwkfWumO925hIc61MaslXJkj8Hs8c4+pG+cn88JSMi6y4wbAKRQ?=
 =?us-ascii?Q?qEwtemXY5Mn60E1XgvlqXfZ9JwYco81VL2nnCulrOJmIZT9AS2Is2HO/5tm7?=
 =?us-ascii?Q?Rj/1figoNHiicFEwth9KoaW8uo+uAUxkIG3+kd3HArNvwjvU48p6dpuoUg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:53:50.7090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef18c140-c1d6-4a0f-6124-08de3c784072
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10258
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

On Mon, Dec 15, 2025 at 11:54:57AM +0000, Lukas Zapolskas wrote:
>  int panthor_group_get_state(struct panthor_file *pfile,
> -			    struct drm_panthor_group_get_state *get_state)
> +			    struct drm_panthor_group_get_state *get_state,
> +			    struct drm_panthor_queue_event *events, u32 count)
>  {
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> -	struct panthor_group *group;
> +	struct panthor_group *group = NULL;

Initialization is not needed. group is set as the very first thing.

> +	u32 fault_count;
>  
>  	group = group_from_handle(gpool, get_state->group_handle);
>  	if (!group)
>  		return -EINVAL;
>  
