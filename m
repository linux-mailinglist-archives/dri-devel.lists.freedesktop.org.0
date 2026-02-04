Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMX/GwNyg2mFmwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:21:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4DEA1DA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C4C10E0E3;
	Wed,  4 Feb 2026 16:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="W2GhqN6C";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W2GhqN6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE710E0E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:21:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H1eDEa7qXaMgSDqc/Et82OfEbyJMr2lDHhfUgHw5ie7zlkEo3IOgJRnMHB2rBjO38jmI6oqT4y+JfEk05AUNkgG57l1ebxx50SeFs2alZVkXxCi/4x7TT0k9Q2/4mKXNQgim3RJWLZV4OHgo2zrm3K229rzJU1iebrSJ7GOO97gHWBOneFhiI+Htvl+wqX10LaBHXu15txzWx5zlL0XuW8sapL2PXv9aappFSROPs1L9p3TsiaSJatZK9pUJOV4cCqMIAF7CaSCr3KEbKk3+c7ezLBTouJJKU8MsPZ2KDIuVh4gWXBAZuKaPMUAMTWl1Gig5HVelKV22AYYw7dH+FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr4/8p8X55d1uTU7r8r0fB29Vl+T+alq74A/2pIdQ0Y=;
 b=nXr1+M81ozqT/qZtzz9K9aReh0yXDamMQZdJZc5+mi6AFtJhN+yUpzd6PZMqdJoj18siTxg82UL02I3Wd4Bsfehe7o0ygJp/9hOlk+ik84njkuD5uF5bHCIEvFf9fIsh3IOb8MY8Fh7K2rCKaaoG4+WhQUdZdvZN3bxq+hpmGvjknqNVEuPz/P6uxYRy/3LHmZrlX7e7grNgiZZsiLdJbf8oR/xhBTqnXOjUr3N7OnpR26fZ9bY3qTSkIHJZzG5LntDGSgduI9IMA3KlQa6ymYf7xpfOUTwTotLms1MAU1SPO/M4AkhFfiwVd2iTykkiWV2DQZjg9KxdZO2ol/8ISQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kaspersky.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr4/8p8X55d1uTU7r8r0fB29Vl+T+alq74A/2pIdQ0Y=;
 b=W2GhqN6Cny1/b1OTwXAoyd0RbN9dH8/mxzJOVBLgBD28LQZrXZzGfjJGuEuisTiWvhInR8/Xz8fIzLFYKD1/6amsrvKCyC3sa15AJlG85WlXo44Pv4q5g4acerXtOXyY/K5ASPI2ui/tuxyTq2nXtRLggSiqQ6R6UoTYBzuIgNc=
Received: from AS4P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::11)
 by AM0PR08MB11703.eurprd08.prod.outlook.com (2603:10a6:20b:743::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 16:21:12 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::fe) by AS4P251CA0021.outlook.office365.com
 (2603:10a6:20b:5d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 16:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 16:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4vICwPP/0ERrh+wRR4B0gVDRIz7tfNe2J0PsqQ6mktCxJKpmwDSKDYqzFWc/bl40qiwkm4oO3fSVpKoe2ycrdHcOY6i+hq8KtQ8+DdXVH9LfVeFN+lCdn4akjRDROWtpYz0/bPEIPAXDfHmMHSj3vVzyhZECwfiBXwasga1gZN6mjDYNjmtxI7re4YsQcvm4I372liVzt6x2jqzwXtRunKoB+xd0TjIfjjvkVT7otBJ43MUU3GcBnkOC9itto3XOeE98JnP7kmSao0hsZDftEx8mv8b3g9GvoJdrEmIFOWsJQgPqI3BkRNS8s2U++E7AZgFEmAgZyk1k0rUk3SjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr4/8p8X55d1uTU7r8r0fB29Vl+T+alq74A/2pIdQ0Y=;
 b=pv+1vwCmz41LeqEjL4zhkvExqmcreYGWoFQPgNH82mwrwe6Wtn7Dil4vYWe+kegxSTcKd4+EWnSiR1XOvA/TAvQGu3vQMygt7DXOXUTeaWlyb9a25x/jDaD5keW8JvRVWcfk5xQRzbRrCwCKoYSMpw6rz8oh0KpPlclCRw//eK8BnDtqcq2wqmNe/TRB59bYwHOV/oq2hfvC+WuEjKEhIudxvRHF4y9Dv/ULsIEKS6EB6Oop5ZwrjgMB1Gyka/Z1xVgIfrut6MGN8Xce1MYB6Ty9tmdbgKAN6MqOonzALxR118jJ3e7hXP1YSFlJ41f7+0fCHrSW13DtqoDZa+Pl7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr4/8p8X55d1uTU7r8r0fB29Vl+T+alq74A/2pIdQ0Y=;
 b=W2GhqN6Cny1/b1OTwXAoyd0RbN9dH8/mxzJOVBLgBD28LQZrXZzGfjJGuEuisTiWvhInR8/Xz8fIzLFYKD1/6amsrvKCyC3sa15AJlG85WlXo44Pv4q5g4acerXtOXyY/K5ASPI2ui/tuxyTq2nXtRLggSiqQ6R6UoTYBzuIgNc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10) by AM8PR08MB5795.eurprd08.prod.outlook.com
 (2603:10a6:20b:1df::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 4 Feb
 2026 16:20:09 +0000
Received: from VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e]) by VI0PR08MB11822.eurprd08.prod.outlook.com
 ([fe80::bbe2:97f2:3aed:5e4e%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:20:09 +0000
Date: Wed, 4 Feb 2026 16:20:07 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "nd@arm.com" <nd@arm.com>
Subject: Re: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer
 size check
Message-ID: <zhbz7lxbl6zxmrulxve6tnoibm6vx26uuafvr2d5vg7gwwnlq6@w4niz5ei4qrx>
References: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
 <ct5tkr764socel5o4gtd4k2fgofqiljy3yzdjokij3jjkcf2ks@c3p7fs33znoe>
 <aYNIjm8XIdxKNo-0@e142607>
 <57df230af1624c679a947317152fd8ed@kaspersky.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57df230af1624c679a947317152fd8ed@kaspersky.com>
X-ClientProxiedBy: LNXP265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::34) To VI0PR08MB11822.eurprd08.prod.outlook.com
 (2603:10a6:800:312::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11822:EE_|AM8PR08MB5795:EE_|AMS0EPF000001A2:EE_|AM0PR08MB11703:EE_
X-MS-Office365-Filtering-Correlation-Id: 763d7928-1680-430e-7898-08de6409698a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?nnKyPM02bxnGM+Ym4Co3YPi16XPPpa7noJwXEAxn8726HfkNFv2ceU1XNAQl?=
 =?us-ascii?Q?5Xy7G82BIPazrvdGnCZ/IsoXHdN4vkVBn1MvGeK8wNv+O0hvyowpLP+PSrX2?=
 =?us-ascii?Q?ckUIM1y1moWTdzUWbpwzKZRqQHSnSAe+76EaimFxYGWpok7RjN5jUpMyUzqA?=
 =?us-ascii?Q?Xkx3WEHD9ymfpupbdiL98tIchYejxD2Zh+PtfiHOBA605FNXtJaTBEwoINhv?=
 =?us-ascii?Q?ckwG0WkjNK7HsO83njZCZ3EuI6eT+hBDGdyf6qSizGvHUZzR4u8I98qxabtx?=
 =?us-ascii?Q?n461bWd/ykGZPJ80uQCMSmEHMmd+fw52uPKdW3qtnX9YyoqNKCgT6bYgHsxw?=
 =?us-ascii?Q?1f8oa+eoYl76PxWYk8xeZZE71TB6VQAQTO/7AemfIU8H4R20xEC4Hxgh3a0o?=
 =?us-ascii?Q?053UwtagAMB9+RSSdrqz2FP3omX53UOasc6C+l0BjH1oL+i5ztuAO7BjdWsZ?=
 =?us-ascii?Q?gv9CW1gdyCzpx2G3kK458jPvKAFx9Pfctn2zYOL43XejcDsljEg3o8P9Ylpc?=
 =?us-ascii?Q?tKHDbb0aIYwMQPtk2HsEI+0OozHExsjW7pJF2Z1o8Gv4ivl84lDxLSFVcJ3W?=
 =?us-ascii?Q?4rkuQxAqNMpyK50sDovCZS+R21pZl/Gd25bSi2Evp++kCmn8h57stsm5Ccm1?=
 =?us-ascii?Q?WzYUYuJ06CHNPjf0CQhJPkZEvANGGBZGc0JjvYzVfipsaasoJjCG0DO/GtEs?=
 =?us-ascii?Q?zuEFxjS7ehvmAkGEVnwnlgPGFOqWSUIZsuhZjFs8c9ytJl5SXnd8DS+zFNFh?=
 =?us-ascii?Q?AtmxaGMdC/+kZ6e2Sl6pir2kaeEQq4ZhpX8ORV/U9soAaPG5ECFLCUNr0lO0?=
 =?us-ascii?Q?cxjXrx0geAuGLoajOcY/7tLqLeYqcjmsQHhpE6giKj4P85EPCavk4zDSLN6g?=
 =?us-ascii?Q?V3R/nzMFZNBnbNI251f8a2c6DlWCiTtKJ5odhowbzNfq/WnjwlWYo15MwCLX?=
 =?us-ascii?Q?eISXDGYET3ElSEBoHXcHeI8DuT/99/rmstp6fhYyDOXK9JEytQy2qIW3MRmN?=
 =?us-ascii?Q?ymRRY+COSpxjxQFa7AUEiY82ZZWUQmjHnDwk5B8WxFiDDMrzO+7CLUbqbbh8?=
 =?us-ascii?Q?aX/lmIch5ObxczaWnq1EeY5tomIBncjDHMrgjokSaKll2sOOzChF+4z7xTYC?=
 =?us-ascii?Q?xT+61h7bMs92I2XCr1a6p9a+Dwyxpzy/TY3PS4OWygayXU98u7LGa2/AUNve?=
 =?us-ascii?Q?P5FXvN+OHOG3CaYkUWKmPaxSUsnPb3BL3PUXFPu5b5UDZCJn+L8kTO9z2fl+?=
 =?us-ascii?Q?GOYPzsZo0xpmDpT05QqlM7L/VhBzqrdtYws2diRT+pMPLFaVKtzQlh6xsfVA?=
 =?us-ascii?Q?X0826M4TUWORBnHGhU43Lq0iMENaV7vPOH8cwzh1UqN1P5GDoNR6/BoyJkfw?=
 =?us-ascii?Q?jZf2lJaXBIaH0tU7l83UfGPLbNTgEfeGNzEPchxjCF8Iq3HngfRnu++S02vQ?=
 =?us-ascii?Q?RSaeoHWk+jmhE84RA24F3/sqQ2NUMMyZTh0tSffZOoEu+CtY5IV4AW+5s8VI?=
 =?us-ascii?Q?EVi6NVlw0qvSezsTb5CrvJql0GLKjDTPl9kaLpBgxGRtuiXli1Ld2MF2hu+d?=
 =?us-ascii?Q?vIQ6KBFISEjfzojT0g0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11822.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5795
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cdd83542-029a-4b61-332a-08de64094425
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8EBWeUbYNC8f1dizIneswrTJhi/cE3+/YhjHru3gMZFFXxkiMmip25eXzEl+?=
 =?us-ascii?Q?VRD8Yk6Cve6C0rYaIFs3A7he46W6GFxFL2guKZZ2E5g7CJpq1Jk35aizwxHB?=
 =?us-ascii?Q?I2KlwXbMcxB0TUA+g5C+RtLaHrZO1wgRVhJfwociXGESy5XBAT4ar2BA46bh?=
 =?us-ascii?Q?Db4VBoqnCLMdHMx69xSvBxqwxnULLftAFjNS+o3NhwprtbgIQpG3xJCaZAMk?=
 =?us-ascii?Q?mUw6S258QFWE+ePeP3G9UWyWSnGGlWjLkLcniHNjW6EUE22dxUYiRrn9Dmnp?=
 =?us-ascii?Q?xNlwfWpUp8V6x8YomElpNWWQc+iFcNDXVG05ousHIQusz5sgFiY4uRiC1cvB?=
 =?us-ascii?Q?R40uNX7HtgGum1KzmI8Og5d5UmRt7jWFjdcPKM9Hp3wxcg9K/b+JOimKYo7s?=
 =?us-ascii?Q?h2di3yAFpws9fWabX6qUePCgjpCaQRVG3ghKFlYOhAQ3K3vxnIZmVMPZ0+DZ?=
 =?us-ascii?Q?rE52Z50BxtXRU4ZbktirAMUMiWqFIAfh4JaOuJgWjzEAwqQgw9C/Hec0KYlB?=
 =?us-ascii?Q?RIfHqc7vfeuyoqUSPyH6G698lFuNc9l/DJggxCwfBPYQPPBV+54go6UN8WuE?=
 =?us-ascii?Q?T1zkBnjVSAZKxXv/2HjzrXacRkrhCHVKoxvcZNwyOJBQp5bE4/jQxJXmvvdA?=
 =?us-ascii?Q?FbkpqIKWxtIT37NKFQ3n6YK0KNHGsA9fLh5T5bi8r7CSGTRlFTZ2a0iZnUTy?=
 =?us-ascii?Q?7Xbca3roU3/9c7i4muJcHpg8USx76aqM/E5h0yJzy2RBvejNR4HnZz7Jt10x?=
 =?us-ascii?Q?eDr9kbLoR25+UK+m7d/O+CpvHlNWJtAxhS+18xhwbJmBDioQxKi8J4551y5g?=
 =?us-ascii?Q?JYe7DIZHIm0MaV5lPF7ZMSZL6PMloNQWIuNqOhZjh0523weiHkzXg3zHX7hm?=
 =?us-ascii?Q?/bBq759slE1nKLdnGneEWHrqRgYyRDxor862PZPTvWIvagmbBgurr4Mf3+eO?=
 =?us-ascii?Q?C0qNCQWRBbQcUqihT71NfJIpyLzZ+xTk1hFHF2F6/Vv+S4w3tCYHU0T3WEqS?=
 =?us-ascii?Q?LkcV5JQwzTwDv5JM9ziHPpjXikRn40J/CqPb091qtD0rPL6TEx8dIuhrIOJD?=
 =?us-ascii?Q?CFBSXCnbrfEkci8dOj7d91NVNWwubOsbrcortUp5Gu5o6Ht4pTciHpKeMugl?=
 =?us-ascii?Q?jtRfYrvw+jjVFBUzmE8221j/2OWRF1BtAduCR+GrSBoJuc1wL2NS3ZtTRcBM?=
 =?us-ascii?Q?RmL8nLqgcx72JphtZyOP4gjQTAEKW9DzvxOXxE9nEjNZwtGmuei/xYp45DQG?=
 =?us-ascii?Q?rJyY5Znr9euCnip6AonCYyL9l7T8SIHtMs41GmK8RirpUQzubuWTHtrDRQxt?=
 =?us-ascii?Q?4Laru6ISaRCJBWl9v/coc9R6qV8PY7BnhWzSI3Ahbs9XargL8tK/zcvyXxNp?=
 =?us-ascii?Q?rPEZFk9sE+4RkjGsZAU7Oxu3q/+BlRV17BMTY1RCOnG7FdBqWE2Ji0xFsZVl?=
 =?us-ascii?Q?xK04J2Jb0Ihn1Jh+G3Sknb97/QYZdrQy6dsTUPqQh8Q+Amcw9w+Gqto26uNa?=
 =?us-ascii?Q?UBTT2tLbwSKeJFUCqnLYFZpCiWfvJngTfTYTMgh4ezXFLEm0r4zzghtAehdn?=
 =?us-ascii?Q?2bTSK6NisjJie/VpLp1MLADULiVUybO3PJXStLYazq+SOT+yfq5zdFeALX/U?=
 =?us-ascii?Q?PBbMZpVL+kWZhdUTJ73qzfHebCR2eYasywmcrsdSdT3NvnrZEMIdKmRncTQa?=
 =?us-ascii?Q?n1zGtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(14060799003)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1i5e+k6SmzI68G8uhZ54duxUYol9oTfOJOA32u4wTeZjlgrfR4OUnMPnWQMw+ushuiVp8wvbU+CXsonUbxSdGJqY8QMf8HE/ZenxI2rb2Q2X8Xj2TecLtmVuUDz+6SrR7TvYahBlNV00HoG+ikQlhGH36cNVnPf2NIe1/HCC/o2QWQUR024T5LJnVhpnwumJhea/YlM8f9HUgxQxWEF3UwVSzF+LPnfbMC5lUnetJVVx4RiuabTArfkgX2uhgk6Y9GuZKrnLR4bxm0grdfHt12Mj3kbkvzhyVzWI3l/aaQjnuPqaDJJAoEsK2ti7Yo4EXw6XKcGLWzOgzUfbNuqRCtMwOB34GXXHpHExe6ybAfvsTgHNnFbYsszMD7YO0gRjCX+rfMq0CMsqOVjhH7RwMmU26DWRg1RpdiQHeJ6QcDCZ9zkr+e+UcacKRPvBw8YO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:21:12.0458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 763d7928-1680-430e-7898-08de6409698a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11703
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
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Konyukhov@kaspersky.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,m:nd@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brian.starkey@arm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[brian.starkey@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BED4DEA1DA
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:56:38PM +0000, Alexander Konyukhov wrote:
> Thank you for the replies.
> 
> According to ISO 9899 6.3.1 both operands are first converted to a common type (u32), there are no defined limits of kfb->afbc_size and fb->offsets[0] , so min_size can have an overflowed u32 value.
> 

Ack, my bad - thanks for the refresher on the promotion rules.

I think afbc_size is indirectly constrained, but offsets[0] may not
be.

-Brian
