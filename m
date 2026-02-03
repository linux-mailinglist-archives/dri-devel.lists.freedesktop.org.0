Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGKzIDxsgmlkUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:44:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2338DEEBA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 22:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3F10E2B5;
	Tue,  3 Feb 2026 21:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="grAnxdhK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="grAnxdhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED07F10E2B5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 21:44:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iXcAC+f9WHAVoO+qE3eXtiO21tfCZLtxYjcVcwXv/9/VHiXCluBCBgj0DedkpS4VIs6I4INgruPpkmS8I0ilEFovK/x2RUSrH78MHlWnfwDzELKfkifck1fIW1wzVyAG3OA73QuEGl1/mujtl8YAU6DsQ7ZbpIjifUbEujlu8GyR4KtA6SnltL+IcrK2vOexzY95uIDYiMj9aMW7ZH74KVPMJtS5SeFdGpKTbFtD8Kvy58nfcFd3m5+xZp7ghXaEtIDWvsPv6b/UJAKqazyHKT92wHJu2BFbvOb7RTK2RHmT1g/Ei49y25veXFR5pYPekElJa1HuyjtFGJo+CyRPzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEL5hpcHb89X7qMzaOrzhH3DV3SjVnftlBxW6g4xz/U=;
 b=Zq3j5jcjSlVI1O+7PtqlImtuE4pLORB5Zoc7ivAwF10AOV7wVK7Vuh5w7Z0/B9M7IzbBDuWs9JwTf5gN7e9IMjf3+oD66U3YjXK4ncDD/PHXJWoVJjiIRmUu5mGNbMaOTZU73F4/Nh/jRRyOHJ67VM5mAdwgMtRvAvM7x3H/EU8zEubb+c/VGFrJ9mM8boY7s61ylGXeAPv5Hqr2nLPB6fSww/knfDphesXCc4+lQqlwBeNZk8PnLE8T96105b1aMXvGk6MZqolhC5jV9T67AsOStpGSOWboEO4lrdDpa9oUhtG1gr6g3RIShWH0BhwCflRIFU0cfaR+r01WId9HQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kaspersky.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEL5hpcHb89X7qMzaOrzhH3DV3SjVnftlBxW6g4xz/U=;
 b=grAnxdhKNd483uSjFsIl3dxFca1BjA4P3QKQk+2ucY7mI04e4Pm0cKjQ+p64ph34MxPmFw6RRnvGi+zcrlhmvRaLh0H8NwBjyWkTj/Ia09vAJg/7O6H8ejE3mNUdZOFbXoJgZC0tH6HR4uRvL04BcCzb9heXs5QPRHaHtRZ1Pw0=
Received: from DUZPR01CA0184.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::7) by AS2PR08MB9344.eurprd08.prod.outlook.com
 (2603:10a6:20b:597::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 21:44:19 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::3c) by DUZPR01CA0184.outlook.office365.com
 (2603:10a6:10:4b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Tue,
 3 Feb 2026 21:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 21:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0+0IK4c1BjcWci9qJBz12saLZSb/ucNhBNUtkBy8fYQvbGceDzN19rHE6/0CiVOnUOBnylbYyg1ImNWx4GU3YNFCmIwDeijNq5XovsIekijBdKasvSb9noxDWD9piFhaNgOp84W68EOBXmR5NCVxFegeIqpHjRMsVRUbS2Hk5IRjZS8RpRBcN6o6Pkr9t/p/KWdkpRPV8eQ/3QZS4Qh2QwVYx4sv5r/sIO84/k9YfPah+xP17n+M3Qg9vwEYmOZXZ0Be6KzHId+kZIayU/QcMOtAxks3+medJ6aOari8HX+DzLi9vr4KuFtrJkYNmHuVjZyDZ1xbZ912lhYj0isBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEL5hpcHb89X7qMzaOrzhH3DV3SjVnftlBxW6g4xz/U=;
 b=CQGT54hYQwbTUcXmcEy7ZyJlJ6aC+SaGb/tP3cSliwQNW2uFVpvY0v93c+YvtJcDL7NYPIt0b8y8h0oWO0LiwIPpGbkknZpnjJ6aZr2EK3CZ+fYoB4UojR5GFfjGvLS9LSALdXJUL1WgPsIrpvbI3q9k+mFHFt/DjXwMAGSIPHgnRIpbWoP/jrQ/Ed/gL7zlwbGcEGYLYWdS1uokb2xsnxXqcZfVI8riRAexDRHbXsoth+3mfQvSjQzZue1agiOBwva+1dzD1EF7FMuIMYVoBZJ+DWgv/DUQYjOu7jHavKTo6/cey8pxfgB1r5F8Wb+qnmxlYGhqVkeefsUksb6Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEL5hpcHb89X7qMzaOrzhH3DV3SjVnftlBxW6g4xz/U=;
 b=grAnxdhKNd483uSjFsIl3dxFca1BjA4P3QKQk+2ucY7mI04e4Pm0cKjQ+p64ph34MxPmFw6RRnvGi+zcrlhmvRaLh0H8NwBjyWkTj/Ia09vAJg/7O6H8ejE3mNUdZOFbXoJgZC0tH6HR4uRvL04BcCzb9heXs5QPRHaHtRZ1Pw0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10) by PAXPR08MB6624.eurprd08.prod.outlook.com
 (2603:10a6:102:dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 21:43:14 +0000
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e]) by VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 21:43:14 +0000
Date: Tue, 3 Feb 2026 21:43:12 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, nd@arm.com
Subject: Re: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer
 size check
Message-ID: <ct5tkr764socel5o4gtd4k2fgofqiljy3yzdjokij3jjkcf2ks@c3p7fs33znoe>
References: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
X-ClientProxiedBy: LO4P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::12) To VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11822:EE_|PAXPR08MB6624:EE_|DB1PEPF000509F5:EE_|AS2PR08MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 8410a353-f6f2-46bf-6dee-08de636d62b1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?uWOYsIhD22h92sF3vamYF9AgXUm+bKI0Vs7xf7UUPAaIgTxPEPNOFjTRyzXn?=
 =?us-ascii?Q?V3iTYADXIacytQ8cQv5j9CnIdPWl4+WyJBCgBqW+Ugc1HUgdiCRQsEEIkar+?=
 =?us-ascii?Q?ElhroQRvTmf5ugAwErDeYhyBBkZht0gqoyzVv4jzj5JqeLJxEas02lyJ+Y0t?=
 =?us-ascii?Q?WTJ62bWLdgQh1H5l08AkdQwJc/jXvpztDU3morybKhLOvJiJKEwVdwiDzJGF?=
 =?us-ascii?Q?mELV/sDUIaxaIclMO7ZJvYHmpDgW/3azlv426yt/a1Sp5QUGKgK9eCtZiG+2?=
 =?us-ascii?Q?Iu+2+yz1LldlqLtjcrXuAjfaqunbN35nrn1Zm9mnEXz1OK72uOBUwUISgP1g?=
 =?us-ascii?Q?0RuOlbWqFAwnsP3LIPQi0kdjhldLz1HUq5eCV9+6tjFkgAmEGsYLqUwraAL8?=
 =?us-ascii?Q?xoZ30OR+4wsfm7N4DM6yjexZAvVSh69fUkglR4KrThNoPMFGOvADZwE/IF91?=
 =?us-ascii?Q?X+99DJm2EHADPN2aZM7ol6Sk8cHiRtpXwwE7TGZcs6EFIOOFdqv78FVVfkoY?=
 =?us-ascii?Q?Sbx/4RkxLrMSqVOZXjqr5JxL7shOO4w9I3Ahb1qVeEukJBD8GORL+5Dn0DdO?=
 =?us-ascii?Q?6RJ0Nnx9koEha2wNdVioS1gzhjJD+PZOOSpBHUfxGyg1CFdSBtAXkhecy60+?=
 =?us-ascii?Q?CpDZxMJc2f7gTTqnrB5jwtIbXRfniHybei7+v1MvT21VCdrA60oNqX/Cdfy/?=
 =?us-ascii?Q?EUYo7GokMTjrN8zzL9NdjMc8WbWohx0iBh1qgJoy7GdDn7FYzRqmBwi78JO7?=
 =?us-ascii?Q?+RYKur/FEqfZ5WScJ1CuVeuTD41pcEVlQKu8ksQ5fc/ppQL1UfnfOxaiWO60?=
 =?us-ascii?Q?F6FzLQoKCGU8Ks4+PBEKLwGwQh+BDNpGkmGV2MiI+bPpznhNM+JAKFYwMmBk?=
 =?us-ascii?Q?kTieOHsLiRMaQ5yeZU5BAiV2SFdOvoCrwHl2k2KRK/Do2Am+S1Y3kjphI31V?=
 =?us-ascii?Q?S4+D405dy0t4BtdFgQFD6KubvIxl8wbPv7v9xSp+2VpPpiniL9EMBdLSkChL?=
 =?us-ascii?Q?vcbs4IeRIEhbsmGOL90qombOJK2yvaXQA0oWNlxNGIhWl8XxSD2vO/TSngf8?=
 =?us-ascii?Q?W+ptXeyww/bqcjn68rxKlQn0J4bkpJ5wlzqrlQ8QJSXr+K2GxT0DZSuDJUTQ?=
 =?us-ascii?Q?P5rX/2cFyy3PvAnkGoNwoB3S/D0ss5NbMadW5dLjwunXPKIjLwsQdRXKLyRE?=
 =?us-ascii?Q?mX1soqg8TC42FT/4V//uS3MgXu/45RwAGNU8R6l/mXMJEmH2qrxUUJl6kvni?=
 =?us-ascii?Q?1xng4kvI9b3LrFsaH6v4dcg62iuLk1KcDHPW/k3l/MVTM4fau/qgg6K6EbDi?=
 =?us-ascii?Q?iRGqRz+aawGmJ4JP2kOfgponWTS46k/v+9PAlB3vqggYpXk+ocoHCznsKLYU?=
 =?us-ascii?Q?hoVfn5ZgSfv51YmW6stDJKpz4nPEg9SCFxiS2xXjxHtiYSPVmZR2oG3ZcST8?=
 =?us-ascii?Q?0E7pCmN59rimB6iQCcEYNFaXLJ0JvqNaI6R5d1ZKo0TZC+LUBpOBfHBHozR0?=
 =?us-ascii?Q?T/7TtJ/LDp4blDieoWaclr/9L5mFHzzn3vdozFJQIx+3GaOJ1izPUD857a0O?=
 =?us-ascii?Q?+YGZffPBdxMtxDA+pqQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11822.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6624
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cf4d39e2-69e0-4364-28a5-08de636d3c21
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ee2c9+48VrUYsEGNZB1kVn/3qDLeXd8U7/hE5qPZcn5zRnYqgFH+sSYfu65?=
 =?us-ascii?Q?sBR7A/22031tz4tAOeRfqiwVe6XZzWO44NjyUORXhj8al0G/k3y1V/HjWD5J?=
 =?us-ascii?Q?olmZGZQ0rT0WrhGTO1ac3XyUQDapiBPXXX6CzqWhmPCt0Qs42uB1LPUp3LLM?=
 =?us-ascii?Q?u62wEMyKqgpa4mETEsBqUzKToT/TMx7wGKrP0IGea87tQytyznRw3DV4NgpL?=
 =?us-ascii?Q?Xssvrr/PkjlEGKdLeTUSqQJfmHAHCTgxZ+jFpMT8ikrcMUG15Zg7e8e42Gif?=
 =?us-ascii?Q?bWaPOiWTY63tnKu/pztAojpiC1gf7Kmh8r+5qicIR07lbVpFcOeMeKqUn7fk?=
 =?us-ascii?Q?ebUtjGdxNOUrwS5+jZUJzHGTU4i6ka+F8cYg1oziRi+VU5GyhsWk3UrZcdpi?=
 =?us-ascii?Q?HAyVQl8Wes4chehHlgW7cgIbb9HO+dHNP/rRttpjsj6+rfYmTXsuLn9DGy3h?=
 =?us-ascii?Q?mowrRMaq1qSO+5BTx03zaqY900YyrYvWcMDe66T2YqB1o4JiytnbuYRZZnHy?=
 =?us-ascii?Q?+fD46CCvkY2ickvFGvXByp9F0SNDvOfhrCwqhrkM63RZGFae85ibgXJ51A5a?=
 =?us-ascii?Q?KQx25OCEZBknKKCUj2cEKAogTjVLW9jXgtjot6KlobnezOPr7ljyXrwRFzAN?=
 =?us-ascii?Q?zcxFkq3L82yixza0jCvhFBUs8IZr5/8rnJo7hDXCGV3Y3a9Ca7WrKtZYFHKu?=
 =?us-ascii?Q?+SiRkHFSfH44MnZyVePH47znNs5i/1xUNeEMLzli7rq7uTs8BMerlQRQPDCW?=
 =?us-ascii?Q?gSxkLMFW8OpKj2y5dRBgX5ig6dOTWeam0hQOIC4IR36yB9V0YxR085vwLNLF?=
 =?us-ascii?Q?Gy8mJNsF4GvmkZcWBO7pGsyJ/RhRCCU9ODePKghGw/hdPe1fAoyESn0GIg/W?=
 =?us-ascii?Q?q2VUs81w57CVpI8Pc3meUkrAv/WyLhe9W4nIYXsTZMU4svGwOksRLQ6mkjL9?=
 =?us-ascii?Q?1QGw8cV0q7vmE9x1plwKBkIhzUTlXJINLthcD3558uRsvMHadvbVuUT9TcPv?=
 =?us-ascii?Q?42RQ4AuTknEE5PSUi64vQriceTTiNlyc8YurirjvcgpcppcOyF+nOAa5es7z?=
 =?us-ascii?Q?Xah1X0UjE+ErvnG6oDg7MuULMGKBKWeqEb2CqQUelclR2g2CRYKBX7P96oCt?=
 =?us-ascii?Q?uYScdomPw33wQUAPU66qL/8utTO4QR6U6V3cqfAXjml37EgNbciLiXSlQ2Wr?=
 =?us-ascii?Q?KoO5MuNTmLTEfpAG6b5G/gwrv+Gz7WMRVcEXUkfQZqh1tFIjMnWZpDeqkG9z?=
 =?us-ascii?Q?ZgK4iEJzNZ8dW4vp1kF9HSkpZiaXAzYOug23aIF1CxpXdN1U+AsDZLD/r3tg?=
 =?us-ascii?Q?9Qpt2Hcao2xketZuLHIkJJ1sJldQcPgrLqg74Dn9vjavxFAtTZ2ASl1Db6X4?=
 =?us-ascii?Q?BiRE/EvFcmLK0feNtRkBRzejfjMhQW5opVqhiRtg2i1mpbGOr36ZVJAXdQ92?=
 =?us-ascii?Q?jDEOizagVpW+wBG1/PyY2cbepJYCE+RFJqBxTuSFi8BS53Plq5rbVfRAi4gU?=
 =?us-ascii?Q?jsTeZgyRW5U7gwWlSsliXcgdnJXgT/KuKznc1mQjAZJcanqJ0Iji6Xg7qXfk?=
 =?us-ascii?Q?eRDyYLdgN8EOshGjyp3JWTqNtMQatZW1gcLte0v8z54nRr2UO2qzc9ERKj10?=
 =?us-ascii?Q?QGq3VEPU/SMKhNBgyqxEAx6covIi/8ZgL80xRCOQ2app6x2B3BdwuP0Sd3Jh?=
 =?us-ascii?Q?BWME6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gdj3xDPxgf5t/bKjcjpbUiZLYOMOAkFssL28OdF7MaijvqU8FQOemj6MhGZrUPavjFmpPCJNGaoaSgpz0ZTmmmZwWEghLI8hyVx9uAQUa+/IyS7bGnRmWME2EvBu/eviUCAffb0MQnI6kToCO0++DFqNC6gAAQP31k1INhb5xdP5yiwAi2bHjBdSirncWS5BbIhRBhZIKOT9ayDvvVKVTkjhJO/tmwofbjeY9oNRa72uujGzy4Z/TDqskE4Hw1YNacDG8MXAdqkA1S+baPENj3cEqLmwWEjjMVhSNmunNE47z+1OF+5Qsehs8JVHYTONpohYeUOZFS79T5G2e/5ilKx9d0AsNmxfWbO4+g5oAiVlOboEJKYgHW42+sBScJa2JCywZlbN1sskJd4bMJbj2UYUWPGOxnxN9G9vHQxBl9aIucDFylDhXO3YY5KB0J2V
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 21:44:19.0589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8410a353-f6f2-46bf-6dee-08de636d62b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9344
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:email,arm.com:dkim,qian.wang:url];
	FORGED_SENDER(0.00)[brian.starkey@arm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Konyukhov@kaspersky.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:nd@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[brian.starkey@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2338DEEBA
X-Rspamd-Action: no action

Hi Alexander,

On Tue, Feb 03, 2026 at 04:48:46PM +0000, Alexander Konyukhov wrote:
> The AFBC framebuffer size validation calculates the minimum required
> buffer size by adding the AFBC payload size to the framebuffer offset.
> This addition is performed without checking for integer overflow.
> 
> If the addition oveflows, the size check may incorrectly succed and
> allow userspace to provide an undersized drm_gem_object, potentially
> leading to out-of-bounds memory access.
> 
> Add usage of check_add_overflow() to safely compute the minimum
> required size and reject the framebuffer if an overflow is detected.
> This makes the AFBC size validation more robust against malformed.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 65ad2392dd6d ("drm/komeda: Added AFBC support for komeda driver")
> Signed-off-by: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> index 3ca461eb0a24..3cb34d03f7f8 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> @@ -4,6 +4,8 @@
>   * Author: James.Qian.Wang <james.qian.wang@arm.com>
>   *
>   */
> +#include <linux/overflow.h>
> +
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_gem.h>
> @@ -93,7 +95,9 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
>  	kfb->afbc_size = kfb->offset_payload + n_blocks *
>  			 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
>  			       AFBC_SUPERBLK_ALIGNMENT);
> -	min_size = kfb->afbc_size + fb->offsets[0];

Can this really overflow? Is the concern a hypothetical ILP64
situation?

min_size is u64, kfb->afbc_size is u32, and fb->offsets[0] is unsigned
int.

Thanks,
-Brian

> +	if (check_add_overflow(kfb->afbc_size, fb->offsets[0], &min_size)) {
> +		goto check_failed;
> +	}
>  	if (min_size > obj->size) {
>  		DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
>  			      obj->size, min_size);
> -- 
> 2.43.0
> 
