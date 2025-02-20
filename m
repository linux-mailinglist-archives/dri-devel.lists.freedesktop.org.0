Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18C4A3E4DB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 20:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB010E07E;
	Thu, 20 Feb 2025 19:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k88ZqlrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785E510E07E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740078936; x=1771614936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y5/GIGUAmPjqPeLaabrnFsYsp8IUplW6dp/NxsEhOaQ=;
 b=k88ZqlrOYtqIZj2QGkcXEkxPzVvmdvRkUd+rMiccwQ4X3lpl8qo4eZDt
 ybkXPE3rMEwsbcDdCDF2n7JvTjQ7KhmuoshU7USBIEdzfXr1QdT3tHhRM
 W8V1bMj41pQHxwF5qJm5Xi+9xGlWHddGdg7sONhUb1/YIQCTZdX4m+61q
 IOZttj4Do0L5SF+6dVqWdvk466YARGjgk2jtUp9txQgl9r/hkuUsIFMnB
 b02mzAoWJvpHh5aNSX6OE2GgPbEK/geHi0YlgBhMwEL/x7Pg8ZhQdS1uC
 cMZbObAo0KQD/BZf4i3d0QkNDU11XUzXx65P+BJbIQlJaZsoSV+jwMUlr g==;
X-CSE-ConnectionGUID: IL+PxSL3SyCAsksX9TnEJw==
X-CSE-MsgGUID: +KYmFLiNReq7LMm0vHFWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41016562"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="41016562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:15:35 -0800
X-CSE-ConnectionGUID: r8ybEuYPQ8+CC96/VlFg+Q==
X-CSE-MsgGUID: CsYLW8s7RrG6mA2pu97GLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152326487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 11:15:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 11:15:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 11:15:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 11:15:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUcDDnh1Ms884qNymajfxUfBYkushOhymTU9JbEJT7TrUSyoTw8bSi5ktkco00dVGyS5mSfue9gQUHXTLEE5pJ4P1eWTgu5OYBBZeYCe5s6E3nD6fFWYHp5U+vlNn/C80v03+PQKkmNA2lfH6lnYEVhoBnxaOJ8dOIaxittocxkX/SMSyfyR1t2TyoG6wyWebSHPn5abBBqyPAt9EWv2dWtekXobQn4D1FYo2YPCuUBZ5ygDEk6ZSLks/dk4KCa+4EoFzCuMXpRKe8aNmb6x4/oOhccIt1fCtMHypL0IkQdhhSfGgwDQ/Ph5CI75y58pmz8prhN3qJMcDF47T6BfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ygf8cFjhlQCkx7XTNZWwUlTU6bPWY9SmcIPCpv7htuI=;
 b=FEU3xVN61y+rFlOK0CHUzeRpqxYuT+FANhjOOfIAnhFNEkD+8LVWHMSsCz7YlU89sQYQThKkRfRRwK8BNAPvkHL/iHQtFGcXTPYmArCosVGmxlEzXO3jaJETGNnQpNJUjz3vKX2eNV0xDN9CFFweYxBl3lPeVH+SHVz8RE31v+LC07TCVrYB166cIQ2UCdmSh0YfieBktgQB+Wjo/Q0uDlvMbaNQtzjErzdyWnjQARTUIFCujUqYdxyN9veXSREBdh9cUsX1tPIjcLucyXbjjunsizL6dB0q0M3cCW1Moq4byMGpYGse0sSxvAQw6+YwQmGUo0KH8hgJkBZ3azIIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 19:15:02 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 19:15:02 +0000
Date: Thu, 20 Feb 2025 13:14:52 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, "Ira
 Weiny" <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Danilo
 Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Douglas Anderson <dianders@chromium.org>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?iso-8859-1?Q?Th=E9o?= Lebrun
 <theo.lebrun@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, "Abel
 Vesa" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <67b77f2ca80bb_2e189b29478@iweiny-mobl.notmuch>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: fb227a0d-87e8-42e4-35ce-08dd51e2e064
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s2k+eg8ptYD4NYMwXglAMuS8kJvH+O/N3AnZfUkLwnON3vxgAgMX7hIdVAJ6?=
 =?us-ascii?Q?ZOk+TG9eDh0KCHQ/fuCU4PCvScEoi73NF5WpQveaHwexCuVCBlvnAfgd8zOy?=
 =?us-ascii?Q?0GG+DxHJRhZVdJ7lMLypJKOaOsi+AJG/em5LS1v7X4ZL9qJKBrxB6N/CBkfO?=
 =?us-ascii?Q?+Ze/FI33aabiO9PMUEidYGdIEiN72G+nzUoBGZ2jeZ/P1Q913H9MU3PmD5ZF?=
 =?us-ascii?Q?7nwH3iQZrjKnyutjzv/hoN1bsUD7qEVXz3ddVJHFBJW+fWppvuUXlas54yLn?=
 =?us-ascii?Q?jlWg/AvAcWepB3/MTkBTZSTYwNmWxrMw39f+GabxF8jGhLdnKvRCX//yVy+W?=
 =?us-ascii?Q?jENbeJjgL3RWLXacVwNT1No14lkuMw4MTi7LO+o+OTLzocHB7C2hYztkMeSw?=
 =?us-ascii?Q?hP+DY9yUDkMWKizl3ZhOdpCTML1CyW3DshNRQDWQtmTI6X2gCPxD2mbWfjwn?=
 =?us-ascii?Q?VQVwkNfN0oZgGQHtHenp+CPr5FdFUVaDUec0aQ+GuiTkEnr2wL0q/AX1hZbg?=
 =?us-ascii?Q?L+tsRIFStOztUC296Jd6C9pqNNXMOqkFcTWySVmkMHq+zHvy41Gynl9ajfwG?=
 =?us-ascii?Q?svQaz13fKMwdteBDT9I+23NEmqNfQGpjU/6EfBsfwJf0EvHgbL2gy/WJDz6p?=
 =?us-ascii?Q?hWCfmmqXzbu8M8zPs8LDTxPJgSn0wMeh7G40NJtcv9c7wLUz/fBgZhOSe5DX?=
 =?us-ascii?Q?RtdyfoVUjlQ2rOLEYfD7tJGx2tQROYmJAOB0GTsA2JmfYS4iaqLVgDLY7AEZ?=
 =?us-ascii?Q?q2Qza+xNFyI3kk2YH2iSRi4RtDhveG+AR3Mc3k/WY4lgF9AgM2PqVr62uOTw?=
 =?us-ascii?Q?vIP5zMDseHbUwck3xh7yjtZ5ZugTRIEOzopJ7m0YSKFvZR4oWw8WoYagdhe9?=
 =?us-ascii?Q?5Pos1pU+h49ADnaP6KubllLocezH/Ix9Z/bT0ukmlOHEQU5a4gfw1JMVzUbF?=
 =?us-ascii?Q?ZaH5g8gJzD3YQxl2ijrhH39yjNGJfH9wXCgBSmiIftSOPYCR7cLybOQNENZg?=
 =?us-ascii?Q?WDQ6INAzpWTpJJKzBzTACSlA6Q5lKCp+UtWw6dtSN8NMtYlFiOLLWDeJtNFk?=
 =?us-ascii?Q?S2yfacMTLs7WTPGTNxvrlXlwDV4MuOjpRVNrIj+vXb8QryFr+d0DQZCQmkXL?=
 =?us-ascii?Q?Zz6ibKRU+zR5E6MbtAwtHsdckHj5fWEMtmMAT9KCasZOQOlc6HLrJPhIHWwG?=
 =?us-ascii?Q?+JyaSZbcNvXmdrhLyz8pH5wutbptlq/CgyK2efN7qTiZYfsAGIjcoTdngaw/?=
 =?us-ascii?Q?/L19YjQhgIf7AfTyPs2qsdkMF5eFOTXom1jBZmB3RsmOfh0CGqdV3fB3hOQk?=
 =?us-ascii?Q?VwkkD5Q5Ou02pz9tgOI4neJe9YMOxz4ZMozcWWuz0CPDcH4o7dvBboE7NoiZ?=
 =?us-ascii?Q?aHOWFcYfP/b+NTUjZFVgJiI59lOLRwbyjSdWgLAtnj3d6I5cBuXjV+vIkrs8?=
 =?us-ascii?Q?02g47R94wTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HJm+YssxHf9hJyQi+4fjSLbGE11tDzbngtkPC763B1fPjUGehulOt3YQHFdP?=
 =?us-ascii?Q?stXz88kY3eUey2kBd4jl4CWXTxGj7ZPWalfRpmlq5Yt7gq75inVSLFD8C7YO?=
 =?us-ascii?Q?A5vL7/328G/FnjQB0SACgAF0sPonpSpelbsgL0ht1NCuUMAadyQUD+ucrMn5?=
 =?us-ascii?Q?uMHBwunQVnanQdotK88hM57o9b7XgVJ/DSUDtVQx/YWZ2LdL8Qem9F3KgisM?=
 =?us-ascii?Q?v9tLhVTG9Ysh6ZSzyL+Ts039gSm93WqIJt0mSd8wc5cFkj8iynTBVoixznzf?=
 =?us-ascii?Q?kzB2nqfBvMwmpLlbwiDbSwhpA58i9g/C09K5YlyBkk6FnyPs7HZlJGCoo/WM?=
 =?us-ascii?Q?RoollfP1JEW52AYZ3Pbe6JcrESj4SMzp/kxuNHEfxFLfJp/OGKfFVNSg9b3V?=
 =?us-ascii?Q?UPsMsK4b6qnGnEqWoGJIB/H6RZ7z7IR7o1di14h2WSFG+DzuC3ml31vwbAL4?=
 =?us-ascii?Q?LhgBtrEQoeUB5i8cvIJMc99CQ4zzwKqdxRrXUV/Q3gAuPrwYcUuw8X8L0jg2?=
 =?us-ascii?Q?VwUC5WGBuVFA6shVDHkSLLIDC/fzbBlEOfPOwRx48AtFeksvH3LQowWIupyM?=
 =?us-ascii?Q?2Sa4la8NKx2e48D4BB0/HKkfS3dm+AS3EDW11fndNMRug9wKy7OJ/QBfj45/?=
 =?us-ascii?Q?sJp9HYEVMyDo11zkrwrnlimL9HJ+yFJOo+yC3BrfQ/z4tY7kXlSjyMXFlk+m?=
 =?us-ascii?Q?ZLt49tpiPROBGghmh/ICyCAIXNgDau9DOv3qsQbC2Eyl4cCzQ6/ucyU1zg3e?=
 =?us-ascii?Q?6xRy3wIL/OsTJi2NLG4U/C/UU4QtmbDv9ZtaQqVkSw4f6u/NIarykM+TafWT?=
 =?us-ascii?Q?siGq8fwPwIpcRch+WeN7J5QehWT94JUS1yvoNs/IbXnVH7kxMUwkm2x7VTg2?=
 =?us-ascii?Q?3hLcJqkVnE2UNqEiaNfXU+n4md2m+yNdPIhd45Ysx4vyfO7BsoGMvnJRqsh1?=
 =?us-ascii?Q?zqPGTCkhwn5TP1/RZy2B6sz5Q1J9FV5dOj0P4hzUJx/gE1xzCVWn9qz0UdcU?=
 =?us-ascii?Q?ihF6t0cE9XKOc67Un8uG8sw4rtqFPVozxaA9/jvwZCKGm3frjjJ9SQlysN30?=
 =?us-ascii?Q?61gs8LYmHdZ5e9G37pDD/16/HWNw3ECnxr+DVht+MAkeu7bcvyQoKW7Ctqpt?=
 =?us-ascii?Q?axTRJW2Q1LQtFtYhuBRuBkchS6Qwn0HdHSEy1ZHZmhGX4kCAL6KZW2a7kjA7?=
 =?us-ascii?Q?vQ3dsmkjghBUXfV096yB0qKUymZwgj4S/kVY/SM69IXpwzFmNHiAoqkhq+sH?=
 =?us-ascii?Q?7KtI3c2RfStQMn3cVajrFZELHS3qMi/UG6lf/MurGVxAIHlIAq+f8bhTIPbr?=
 =?us-ascii?Q?cZY1Bju6tdAcpGkFDzfF3Qpn0zVci1HuDQMOPSKGV3AUD/wUByy/U8ztgU+N?=
 =?us-ascii?Q?iMYBn7s8qpMD+Ulho2gCi0RwSbgtNjEpFXASqT7dzOeg/fVtRgPEZ96gptB2?=
 =?us-ascii?Q?KH+fmEsbaWx8q0/lTLA4ypqESGxP32llGSXm74kkItF8McnMf1LGB4aQz53b?=
 =?us-ascii?Q?/CL3Q6to9e0lyo52d3McQK/keOGEll6RHwGp0nQhZJxD4Z7pVWdwfPV+EoCu?=
 =?us-ascii?Q?Oj95iXtza4tHgBNhpGV3vE3t0OGvNEy5lTL03PQTgP1v2vVoidx6oOswCT+D?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb227a0d-87e8-42e4-35ce-08dd51e2e064
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 19:15:02.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1k3J/nfnQ/rrtYI9R5tSbZyH2G3+0tY84o2uyl1Qe+4C2sgT+lkaxaF6xrqIUo3ax0mT02KcjjbOSD2qoAP2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
X-OriginatorOrg: intel.com
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

Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

[snip]
