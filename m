Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECEC40519
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EA910EAE0;
	Fri,  7 Nov 2025 14:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="M04K4SGU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M04K4SGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7F410EAE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:50 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a7lmwzePHWVfw8lMIaCObk0SSzwjgH9AbXhjGpAyoa4ik4m7lcZnA+cr27Q4deMnwLbym0XwtO5kS1sxygwE5p+aoD/Mn7zFmcXZ9VYWZ5OOihR2U314uPBXBFNqUo1ko9malDzd04IBeYjnkGNALEqWBSpkPxuiRU1maftRyhf9VCLfEFithyaymrA7mRGGUTcne4s1RYRujIzgwrzYXP1Csu8xSNX2IZIozfvtF3Tj5RqtFe+XLakPs9G6DkiCxCUh7o/mioonQB9rIeo/NF16ZIkMelZst67mgtp3bU03MaoqEg4NdILGcUZIqeD9IVPJAYiVdkDu95KfMVRkbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfXvDBRxTz3L5TFoDzHqsnuS2EnNO8I7y65Uk6MoZyc=;
 b=Iupz/tmTPITCzSDVr9uCpcqfXC65+SdR5nP1UpOsKIdN7Q0RUjT6HHAje8JdLN/53hxu7NlKjvfJ37iQbrUcfGyK9oJPz4CsV4M4SAInWGad/oDZsXu3SED+rpO6VAwlSCMD5GpKD8M9sgepE+8FGKf6tD1W+6eVMXAEN06T6rrSCiQ5bFz7f93LKhPZzDwPG2b2pR9dPQESAm4W63gJ81Wv5F3FxGBOKCbSLaxAVXWPFBRuYi+L1QWXGvdk801OdsK7eG+tBHz7SrApOA+VonUOJvSq87phpivnTOEzyv3Ectz0TnpboY79LXPqPDBxDk/OAo5L7F1NCil7vKxoGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfXvDBRxTz3L5TFoDzHqsnuS2EnNO8I7y65Uk6MoZyc=;
 b=M04K4SGU2xho7vHYg4YcC59XNnz8SnFZkEggvqkyEBv0DuLlj6Vfyt/NATApO/UXofGA0fHmOUN6H6L4VCbFnZPnKX9B/cWlPvA83bfvcxC3KchpnOSo0cSah2PKVdBywGn55xtSNtB/F0df484xvQvQlzK0jJiM+t+oRvOnJ3w=
Received: from AS4P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::6)
 by DB9PR08MB9708.eurprd08.prod.outlook.com (2603:10a6:10:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 14:25:44 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::99) by AS4P251CA0017.outlook.office365.com
 (2603:10a6:20b:5d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpJ+etCkdh1KMG/vf3dB3Pk9gZPIRhMRs4BGBDd8wehqFxEc5MT2IOJZQfvj/2qR9b+EQm/CJ4f86BzWYYdRr3LzHw8nO14/rUeAQ3zuhzP6wa6KF1IGOkmnNVEkQmNrSk+f1sF7YqUUJHyVNaTs/uCwB9S4fS8FmuCdXIazzqFwxcku6PFxTHviqon2IDcOHeHifFIEWaYcvMPWFfip8R50YnyAKaiULoyo5ZpaNDB5sSBxyAa5joiOj1zM/IY8fhxVBp5xlSywlodOleEAG+SDppf6xu/oWMxoEr8Cgx+BnbWK+JtNpbwg6WKEw9fTyAEKWFPkMuSGaZ5vzSfV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfXvDBRxTz3L5TFoDzHqsnuS2EnNO8I7y65Uk6MoZyc=;
 b=JDmvJXOP3h9rc/GiD9BUjmRhFqs8PzrsgCqMayg19aDIuM92BtJgtigqgPloOF4MrlOD419w1LnpasePXaEywAdpsRvKQQU7XuOnl+aF07oP5hbxEwwS444b6yvbDjs59Rczh07QKQIPPr5vYsH7f8lTqU9SPB+jnhXOiM4toLcBtHH5cTKJ4RcyC++DKYGyWhOESlUBW7Vgk9FMq1BMIN8dkdVn3OUKNVryISYXLjK/EhEgt6R2npbbeK0E6RYQ5CUldjNAWbI3R/NJ++Ai5kIK0hfcSt0vE7fvzhnwP4C9WIEF1N76033LIdMRwAZxpQoLIkr35qU/DalAmGAiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfXvDBRxTz3L5TFoDzHqsnuS2EnNO8I7y65Uk6MoZyc=;
 b=M04K4SGU2xho7vHYg4YcC59XNnz8SnFZkEggvqkyEBv0DuLlj6Vfyt/NATApO/UXofGA0fHmOUN6H6L4VCbFnZPnKX9B/cWlPvA83bfvcxC3KchpnOSo0cSah2PKVdBywGn55xtSNtB/F0df484xvQvQlzK0jJiM+t+oRvOnJ3w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:11 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:11 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Date: Fri,  7 Nov 2025 14:24:35 +0000
Message-ID: <20251107142440.1134528-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|AMS0EPF000001A0:EE_|DB9PR08MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2dded6-448e-4cd3-9733-08de1e098968
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?tqTPCetseFrcgMtWp3lmnsfWllGW4j1Z9zm8DVdqIqKYeo6KWiVPzd+rDfiH?=
 =?us-ascii?Q?cW/IwRwZk+Rced3pG1yjAmVKCZrsm8xDb3tWi58zzAXwzHdKiJLENDrzoHJ3?=
 =?us-ascii?Q?zF+4QJZO8NBuOJsBka+JyGspcTRPWimsJmPqrX18IWfGTZufHaCaALWnKAoN?=
 =?us-ascii?Q?WR/25OGo8uzdfC5+pQz9YXAno5oZ+FkGpPWqKRUmW1OB3fY1T/p7N4CdZ6eD?=
 =?us-ascii?Q?H3tn+AWQSiqoFi3UQncUpChaFHzDveMUXHt6larWHYVolxY/eBurPkqaOWhs?=
 =?us-ascii?Q?A6X87YqkDiFHcE19FQyY8k0v6AsOU15J6AHyECcM3MVZss07w+qImdu3qWR5?=
 =?us-ascii?Q?X4/NQhJHeogKgUVBs9X3dl42hFqj4opYkP2yH6Sp2yC0qqxBTxAaV6ZCQT5A?=
 =?us-ascii?Q?+uW1REX0CxNV75EIeEMxrpXI6jXVz/A2Z/ZavKapGbN7gMyyE+V7g/TSQNqb?=
 =?us-ascii?Q?S2h22kGNKcMWdvBQi9AORccCNQ/W5Tuxh0gkvNfO1Lhr7Z+2xE/vdxdHNg2L?=
 =?us-ascii?Q?9yDl3fg6jU1+Oj8Xbfw6rGkYNc6+ZBIgWePsR3NPmLj7GQMvC3WF3D2oTtvY?=
 =?us-ascii?Q?Q3c7n0ln2voJfgiDtLPswOS/+fjVxZQnKYThmCjF9mwCas4w403D1aw6bb2+?=
 =?us-ascii?Q?baWKZqSDKGDxxniG1/tBEW69kO8Enca+Iv/9PUKfa0ROu4IQ7cLyDdn+bt4L?=
 =?us-ascii?Q?w8dBsKjbwGOXgkVrgRrwblF3xl/Ia4ALZrb/odaEP2sdoeUjRhUd2z2vRMj/?=
 =?us-ascii?Q?28QoWrseNWafUxPd05HyQH1NlnApJiJCAVdE2E/qoyab5WlWTYBQJkr/GEAw?=
 =?us-ascii?Q?7xJxSjERXSnQr3oEqLK5LJi6zXAuqhsbQJAMNsXhYrrONhrTQ8Vgkq/9slQ/?=
 =?us-ascii?Q?rPZjLc1veF/6Mqehv5nnuuBBT+uirCvXUkhty4/bOwMh+hNEhDAR4Gon11Mi?=
 =?us-ascii?Q?jFRnQzRo2XcVBpGq4k0crb4BP8KWtwfb+T5GWLR9yPLfnu8Kv7NR2+ejrdo1?=
 =?us-ascii?Q?co50PvlOTVS8tcJPiz9xbtyc/cGjTI3qhEFsKJMDq5LwiraIfo+ajie2AM/L?=
 =?us-ascii?Q?v8wozwFfuU/OtpveChMAWFFf8BRBqjx7W2Hj5DEaDRk+WuqLE2lvTWGuWzb9?=
 =?us-ascii?Q?Alm8q2lZ4+mjgG6hh+EIwRn2WCTE+ik0ixv4Q80Eccp4gTU+fT+J4+M1C3N/?=
 =?us-ascii?Q?ALJJX29uzeswbOQZcx/9wDdvrseRDTfEnTu3yh/iWm89riveu2Er362igQgE?=
 =?us-ascii?Q?e7g9qiCXGJibdf0DmmYDzadH1U70B3YKKz7X/Iq01NgOPNjCfJ8tjpFM5na2?=
 =?us-ascii?Q?5+LKkWLVHxP43XiqdICpquw/JbdEI8jckdfV/lHe6IRLRpJMktk9UuGByOVs?=
 =?us-ascii?Q?961wI4CMxzAUwBaRaYUcJUHPrYeTKUrqT7E60+SHAGKVfzgKfgrJ3+azs1i5?=
 =?us-ascii?Q?Rdvn/S71SQJi5b9b5t+5FXkRNLHNuqY0?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d6a393c-b57f-4217-fae0-08de1e0975e1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|1800799024|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zMh8bi4pXVLY9ZiUdsLMxgSX84GSCPsECzcovPv692UPuzz7LSLkCkEN+QjK?=
 =?us-ascii?Q?9bxkjsDzd7P90RvUuu9tncusxiNiisvccRzg8AGZ/EOY069QbrRyjIpcM5Zc?=
 =?us-ascii?Q?iLYmL8Qx4M1/q/22HaD+p12CI2IK8nxFIhtLL/ug9d3RBlxTIQzs/N7M5rWj?=
 =?us-ascii?Q?t1ng90dEDgduyArZ0Zo/v0xL8o7yny9BsLrhqX3DAUOlBVWt/0MJwCJA9Sej?=
 =?us-ascii?Q?peGBm/wZ7yo/jFmjQats/T4mCj1AwhuK0WlbuC3AMK6wVw9ag/mb/JiEeajt?=
 =?us-ascii?Q?jQAnTzuK++WFK/OpEk4nLx0EA7wuYUnhChl/iGUoeFQuzBmCGYhSlHJqRB0r?=
 =?us-ascii?Q?kJVZ7phJSbTvK/ILsLNfZDC1Ag3jykJhG/CJ97+Sv/QDIKubpe+YF8cpIzQA?=
 =?us-ascii?Q?HTYTeVBtbHFE+Y6huHSVzl6DDH6AZkU307NIDQqR/QcqneWbm/2jNwe9k/xD?=
 =?us-ascii?Q?xGtd8Ik1FqB4mKEDxeoO7d0ggm8YqTv+A4KwY3gKNxuWR+oVBTAZVf26mybw?=
 =?us-ascii?Q?xrJ3weNhVrx9WQ1Kj13doZW+0aE8ADtgbQIvb6uHJ9TdL2xErdJvRwC3BMGO?=
 =?us-ascii?Q?qcdycJIkgf9JskffT2mdhkwJDl/OYZC09HaKqVRBp2jtnbOAUJxTeDfsa1A1?=
 =?us-ascii?Q?96N5SzEkSfc//h2Vq3sMV3u2gdL8TZ2XObNVGAxWLnVqUZcxQ5ry9dH0TZVy?=
 =?us-ascii?Q?I/9t0NTexpsAlB3zcbhUDQElqFL1y7v0bt12hpoClBLJsiD22YFFhFKh2lSR?=
 =?us-ascii?Q?Bz7jL4bDrbOlCki7fRZwr8VgPDw0cq/izeh5kzti+ahcmWmw9Oo7Ex9zp/bo?=
 =?us-ascii?Q?TzoE1BHu8H6izSWtQi1Y4VQyJJqS5BWbfOcfSb5EOvHVAMd48PutXlXEycxq?=
 =?us-ascii?Q?WmWAyBCkP28JN5Vclr36GPhdYdMulgvZZCyaz820t2yCzqq6Vw8FqpdoLHpu?=
 =?us-ascii?Q?3pJQbiL0EtCFv9uOipdRuAFiyO0I1uASVJXGiKutLhfVIO3ZefUtqYentmSi?=
 =?us-ascii?Q?UyJlgNATzNy33qKJ1zM0s/JiRfwas8iOsUOWB8+KrURCbYQIz1c6lZPYcAi2?=
 =?us-ascii?Q?9w/SOgSyaSsg7L8HhJO7h1aok7KRBBj0ZZzvDxta1iJC9VYYgQ8mZZrl2DZ0?=
 =?us-ascii?Q?Y21V8KGEZGbw28V9fFBs9mEKfHj5/KHaAVMGQPJttI4oiARFOg0KW9836IPW?=
 =?us-ascii?Q?tCebmc8Wg1AVH1TqJbk8GtbpI8JV6ttJkgKaICFh56Nj+6VaeQwxTdf6LvYh?=
 =?us-ascii?Q?ngtUoULaGdkUF8PGqIfzlsB89TcUBfBPLVakBn88k+k2L4FL9+Bz9OABl4Ej?=
 =?us-ascii?Q?8TpthWLpRZaSa9yuSn27B4X46mthH4nkVgKpOhgC8v/pITe9FU2nSRkW7LOk?=
 =?us-ascii?Q?erba1HlRxxTMaahweQj6AEX1RQtBMYH92OEr6gEsr4H33HIqdkpINcnjRsup?=
 =?us-ascii?Q?Xc4BY2/PMh59KLGxCszcmmhcW19oJ+RJrE8DwNAZoirDQzZaf/nxfJY5ZQ7P?=
 =?us-ascii?Q?vRiqZe7hD6R4FlBtaUZuYCSmCmXyzXM+AvY0EdQuexh1wU+59Xb6wX6lG3ej?=
 =?us-ascii?Q?uUplMnt2rhuom3jqJyM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(82310400026)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:44.1043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2dded6-448e-4cd3-9733-08de1e098968
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9708
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

Add the new panthor_pwr module, which provides basic power control
management for Mali-G1 GPUs. The initial implementation includes
infrastructure for initializing the PWR_CONTROL block, requesting and
handling its IRQ, and checking for PWR_CONTROL support based on GPU
architecture.

The patch also integrates panthor_pwr with the device lifecycle (init,
suspend, resume, and unplug) through the new API functions. It also
registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
is located within the GPU_CONTROL block.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Reintroduced include for panthor_regs.h.
 * Add include for drm_print.h
v3:
 * Turned panthor_hw_has_pwr_ctrl() into a static inline function.
v2:
 * Removed stub functions.
 * Updated BIT() definitions for 64-bit fields to use BIT_U64() to
   address kernel test robot warnings for 32-bit systems.
 * Moved GPU_FEATURES_RAY_TRAVERSAL definition to the next patch where
   it is being used.
 * Drop the use of feature bits in favour of a function that performs a
   GPU_ARCH_MAJOR check instead.
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_hw.h     |   6 ++
 drivers/gpu/drm/panthor/panthor_pwr.c    | 121 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  17 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  78 +++++++++++++++
 7 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c12..753a32c446df 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_hw.o \
 	panthor_mmu.o \
+	panthor_pwr.o \
 	panthor_sched.o

 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 847dea458682..d3e16da0b24e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -20,6 +20,7 @@
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"

@@ -102,6 +103,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
 	panthor_gpu_unplug(ptdev);
+	panthor_pwr_unplug(ptdev);

 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
@@ -249,10 +251,14 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_rpm_put;

-	ret = panthor_gpu_init(ptdev);
+	ret = panthor_pwr_init(ptdev);
 	if (ret)
 		goto err_rpm_put;

+	ret = panthor_gpu_init(ptdev);
+	if (ret)
+		goto err_unplug_pwr;
+
 	ret = panthor_gpu_coherency_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
@@ -293,6 +299,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 err_unplug_gpu:
 	panthor_gpu_unplug(ptdev);

+err_unplug_pwr:
+	panthor_pwr_unplug(ptdev);
+
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 	return ret;
@@ -446,6 +455,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 {
 	int ret;

+	panthor_pwr_resume(ptdev);
 	panthor_gpu_resume(ptdev);
 	panthor_mmu_resume(ptdev);

@@ -455,6 +465,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)

 	panthor_mmu_suspend(ptdev);
 	panthor_gpu_suspend(ptdev);
+	panthor_pwr_suspend(ptdev);
 	return ret;
 }

@@ -568,6 +579,7 @@ int panthor_device_suspend(struct device *dev)
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
 		panthor_gpu_suspend(ptdev);
+		panthor_pwr_suspend(ptdev);
 		drm_dev_exit(cookie);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 1457c1255f1f..05818318e0ba 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -31,6 +31,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -126,6 +127,9 @@ struct panthor_device {
 	/** @hw: GPU-specific data. */
 	struct panthor_hw *hw;

+	/** @pwr: Power control management data. */
+	struct panthor_pwr *pwr;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 64616caa6f05..56c68c1e9c26 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -5,6 +5,7 @@
 #define __PANTHOR_HW_H__

 #include "panthor_device.h"
+#include "panthor_regs.h"

 /**
  * struct panthor_hw_ops - HW operations that are specific to a GPU
@@ -47,4 +48,9 @@ static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
 	ptdev->hw->ops.l2_power_off(ptdev);
 }

+static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
+{
+	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
+}
+
 #endif /* __PANTHOR_HW_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
new file mode 100644
index 000000000000..66dc72b29116
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/wait.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_pwr.h"
+#include "panthor_regs.h"
+
+#define PWR_INTERRUPTS_MASK \
+	(PWR_IRQ_POWER_CHANGED_SINGLE | \
+	 PWR_IRQ_POWER_CHANGED_ALL | \
+	 PWR_IRQ_DELEGATION_CHANGED | \
+	 PWR_IRQ_RESET_COMPLETED | \
+	 PWR_IRQ_RETRACT_COMPLETED | \
+	 PWR_IRQ_INSPECT_COMPLETED | \
+	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
+	 PWR_IRQ_COMMAND_INVALID)
+
+/**
+ * struct panthor_pwr - PWR_CONTROL block management data.
+ */
+struct panthor_pwr {
+	/** @irq: PWR irq. */
+	struct panthor_irq irq;
+
+	/** @reqs_lock: Lock protecting access to pending_reqs. */
+	spinlock_t reqs_lock;
+
+	/** @pending_reqs: Pending PWR requests. */
+	u32 pending_reqs;
+
+	/** @reqs_acked: PWR request wait queue. */
+	wait_queue_head_t reqs_acked;
+};
+
+static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	spin_lock(&ptdev->pwr->reqs_lock);
+	gpu_write(ptdev, PWR_INT_CLEAR, status);
+
+	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_NOT_ALLOWED");
+
+	if (unlikely(status & PWR_IRQ_COMMAND_INVALID))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_INVALID");
+
+	if (status & ptdev->pwr->pending_reqs) {
+		ptdev->pwr->pending_reqs &= ~status;
+		wake_up_all(&ptdev->pwr->reqs_acked);
+	}
+	spin_unlock(&ptdev->pwr->reqs_lock);
+}
+PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
+
+void panthor_pwr_unplug(struct panthor_device *ptdev)
+{
+	unsigned long flags;
+
+	if (!ptdev->pwr)
+		return;
+
+	/* Make sure the IRQ handler is not running after that point. */
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+
+	/* Wake-up all waiters. */
+	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
+	ptdev->pwr->pending_reqs = 0;
+	wake_up_all(&ptdev->pwr->reqs_acked);
+	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
+}
+
+int panthor_pwr_init(struct panthor_device *ptdev)
+{
+	struct panthor_pwr *pwr;
+	int err, irq;
+
+	if (!panthor_hw_has_pwr_ctrl(ptdev))
+		return 0;
+
+	pwr = drmm_kzalloc(&ptdev->base, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	spin_lock_init(&pwr->reqs_lock);
+	init_waitqueue_head(&pwr->reqs_acked);
+	ptdev->pwr = pwr;
+
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
+	if (irq < 0)
+		return irq;
+
+	err = panthor_request_pwr_irq(ptdev, &pwr->irq, irq, PWR_INTERRUPTS_MASK);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void panthor_pwr_suspend(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+}
+
+void panthor_pwr_resume(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
new file mode 100644
index 000000000000..b325e5b7eba3
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_PWR_H__
+#define __PANTHOR_PWR_H__
+
+struct panthor_device;
+
+void panthor_pwr_unplug(struct panthor_device *ptdev);
+
+int panthor_pwr_init(struct panthor_device *ptdev);
+
+void panthor_pwr_suspend(struct panthor_device *ptdev);
+
+void panthor_pwr_resume(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PWR_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..5469eec02178 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -205,4 +205,82 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0

+/* PWR Control registers */
+
+#define PWR_CONTROL_BASE				0x800
+#define PWR_CTRL_REG(x)					(PWR_CONTROL_BASE + (x))
+
+#define PWR_INT_RAWSTAT					PWR_CTRL_REG(0x0)
+#define PWR_INT_CLEAR					PWR_CTRL_REG(0x4)
+#define PWR_INT_MASK					PWR_CTRL_REG(0x8)
+#define PWR_INT_STAT					PWR_CTRL_REG(0xc)
+#define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
+#define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
+#define   PWR_IRQ_DELEGATION_CHANGED			BIT(2)
+#define   PWR_IRQ_RESET_COMPLETED			BIT(3)
+#define   PWR_IRQ_RETRACT_COMPLETED			BIT(4)
+#define   PWR_IRQ_INSPECT_COMPLETED			BIT(5)
+#define   PWR_IRQ_COMMAND_NOT_ALLOWED			BIT(30)
+#define   PWR_IRQ_COMMAND_INVALID			BIT(31)
+
+#define PWR_STATUS					PWR_CTRL_REG(0x20)
+#define   PWR_STATUS_ALLOW_L2				BIT_U64(0)
+#define   PWR_STATUS_ALLOW_TILER			BIT_U64(1)
+#define   PWR_STATUS_ALLOW_SHADER			BIT_U64(8)
+#define   PWR_STATUS_ALLOW_BASE				BIT_U64(14)
+#define   PWR_STATUS_ALLOW_STACK			BIT_U64(15)
+#define   PWR_STATUS_DOMAIN_ALLOWED(x)			BIT_U64(x)
+#define   PWR_STATUS_DELEGATED_L2			BIT_U64(16)
+#define   PWR_STATUS_DELEGATED_TILER			BIT_U64(17)
+#define   PWR_STATUS_DELEGATED_SHADER			BIT_U64(24)
+#define   PWR_STATUS_DELEGATED_BASE			BIT_U64(30)
+#define   PWR_STATUS_DELEGATED_STACK			BIT_U64(31)
+#define   PWR_STATUS_DELEGATED_SHIFT			16
+#define   PWR_STATUS_DOMAIN_DELEGATED(x)		BIT_U64((x) + PWR_STATUS_DELEGATED_SHIFT)
+#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT_U64(33)
+#define   PWR_STATUS_ALLOW_FAST_RESET			BIT_U64(34)
+#define   PWR_STATUS_POWER_PENDING			BIT_U64(41)
+#define   PWR_STATUS_RESET_PENDING			BIT_U64(42)
+#define   PWR_STATUS_RETRACT_PENDING			BIT_U64(43)
+#define   PWR_STATUS_INSPECT_PENDING			BIT_U64(44)
+
+#define PWR_COMMAND					PWR_CTRL_REG(0x28)
+#define   PWR_COMMAND_POWER_UP				0x10
+#define   PWR_COMMAND_POWER_DOWN			0x11
+#define   PWR_COMMAND_DELEGATE				0x20
+#define   PWR_COMMAND_RETRACT				0x21
+#define   PWR_COMMAND_RESET_SOFT			0x31
+#define   PWR_COMMAND_RESET_FAST			0x32
+#define   PWR_COMMAND_INSPECT				0xF0
+#define   PWR_COMMAND_DOMAIN_L2				0
+#define   PWR_COMMAND_DOMAIN_TILER			1
+#define   PWR_COMMAND_DOMAIN_SHADER			8
+#define   PWR_COMMAND_DOMAIN_BASE			14
+#define   PWR_COMMAND_DOMAIN_STACK			15
+#define   PWR_COMMAND_SUBDOMAIN_RTU			BIT(0)
+#define   PWR_COMMAND_DEF(cmd, domain, subdomain)	\
+	(((subdomain) << 16) | ((domain) << 8) | (cmd))
+
+#define PWR_CMDARG					PWR_CTRL_REG(0x30)
+
+#define PWR_L2_PRESENT					PWR_CTRL_REG(0x100)
+#define PWR_L2_READY					PWR_CTRL_REG(0x108)
+#define PWR_L2_PWRTRANS					PWR_CTRL_REG(0x110)
+#define PWR_L2_PWRACTIVE				PWR_CTRL_REG(0x118)
+#define PWR_TILER_PRESENT				PWR_CTRL_REG(0x140)
+#define PWR_TILER_READY					PWR_CTRL_REG(0x148)
+#define PWR_TILER_PWRTRANS				PWR_CTRL_REG(0x150)
+#define PWR_TILER_PWRACTIVE				PWR_CTRL_REG(0x158)
+#define PWR_SHADER_PRESENT				PWR_CTRL_REG(0x200)
+#define PWR_SHADER_READY				PWR_CTRL_REG(0x208)
+#define PWR_SHADER_PWRTRANS				PWR_CTRL_REG(0x210)
+#define PWR_SHADER_PWRACTIVE				PWR_CTRL_REG(0x218)
+#define PWR_BASE_PRESENT				PWR_CTRL_REG(0x380)
+#define PWR_BASE_READY					PWR_CTRL_REG(0x388)
+#define PWR_BASE_PWRTRANS				PWR_CTRL_REG(0x390)
+#define PWR_BASE_PWRACTIVE				PWR_CTRL_REG(0x398)
+#define PWR_STACK_PRESENT				PWR_CTRL_REG(0x3c0)
+#define PWR_STACK_READY					PWR_CTRL_REG(0x3c8)
+#define PWR_STACK_PWRTRANS				PWR_CTRL_REG(0x3d0)
+
 #endif
--
2.49.0

