Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63AA362CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE9110E34A;
	Fri, 14 Feb 2025 16:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsjKg8Fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950410ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739549786; x=1771085786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3+W77FPa4qYi/p6jHkS5N5D1r20bLrH3MqSoHPLJ/Sg=;
 b=ZsjKg8Fn+NjzOtzezLtAHputkXUCogOHU7jTCpqGFsBJbBTSU8hxk+0d
 qWXfHBBbtJWSQVKGp/Skl/ujDmgEnh+2ckWat5l5k57T2rfwoUOcEifHt
 S1aFPKCCEUP7Gf3DdIuAshy8eWEczQK15AmgwlIDEuUTe6zyyWf7Ii47O
 t7QXCxzRRbr6hkhRhu7gFMOVfqQYTnmBozYZVT5Xjq0NCiByOf3Ifxoei
 hWwboHd+B6abIIct/puzAWF4YzAXhh2MXmdcSx//iP66MKFQKzi+iXqrb
 HBEpF93A+EwSuoVpFoNz86Nt3mH563N/bCbHHrgfxQHeYwc/insSnhiyM Q==;
X-CSE-ConnectionGUID: DoXxH2rOTIypFS4ThOUCPQ==
X-CSE-MsgGUID: AiiLNxcLSuyZrWRD2BQTzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40165450"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40165450"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:16:25 -0800
X-CSE-ConnectionGUID: 7qmMv8xtTFWkAPFj2yX80Q==
X-CSE-MsgGUID: PNuie8B+Q46bwQCuQ+GVVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113471618"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 08:16:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 08:16:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 08:16:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 08:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6QomcEqmbb/BfP0RwJ1Ifh3BHhWZWFbcJN90pdm2+ocB/4czXowD5kd11pIU6comzMovnaI2yU6qifpevw4m8rWY2WAip2qaaDHVh3QX1tMAX+WYUDnsKuR71dV6owqjh0Ixg6sxaU22ljgEGSmQoRSfDRuOAX/+V8sDNei6/YW3YyepgyQvOw1Kf2LXWn8IV4YfT199NxS6ssXcdmeGsqGwCA11HlxcH+HYkCaGkJx/rYA+4af7OGuSPmKSK5GgWWpZR9d1FviJWVfUI1ICLC5GPPqvdB7nsFyCDPQdLnNdbO4yZDZ9Ix8/ZIovXEalQ4CpgnOk6dVtM54drShNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT+R+9FVXkyT/l4dyUBzdD2xUY0sPG1U/xKrzpzmj8I=;
 b=n1Tngb7dQbzn6QuT8BzAesTgXwy7oOl/Jl9E4UzLLmRbAlNwyqRafPJROzrZ4iFf8RDWElg47cZTGYpZizMmg2YGbIlKyANpurfSXmb0GxEf7PtXco7n1NVTWuHxBiuVNIhFn109odQ04NVbA3iJPZo7FujojSAcMBhyEq3KxwiOQxcPz2pzUY1fRkoamXi9T/a2N126iyZe8f4+sAVTXWhezcON22tWepHYD+piDcquHwgU/ZbXvFaeBEaajuNc/NNiKTbMlT8kujfnuK2QS7yjsjlxS/UkPvSJDvjpQfJRnTpfh6H0SMcEFmDyvzp4qmAlJoQe6+pStq7go5gmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Fri, 14 Feb
 2025 16:15:50 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%5]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 16:15:50 +0000
Date: Fri, 14 Feb 2025 10:15:36 -0600
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
CC: Jerome Brunet <jbrunet@baylibre.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
Message-ID: <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 085784fe-299f-4d7f-4a20-08dd4d12d940
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WDq0UZPwEJiXbsJOv7ccnrPWbO0EvkG8FJtIemmabvlVsnJ+jZSrAQw8XWZf?=
 =?us-ascii?Q?aX14bSRSU/SUhIu1grRFiV0S3JRyZnzhz1PgXLNhaIv07srvcXpJyzYwgtFy?=
 =?us-ascii?Q?jNQP6i+/5FnXl+W1hRqjui7ySJ8atD9on0vlfWmjiUFjGIiWtDwMZdZCzHzs?=
 =?us-ascii?Q?njgd4ECbVlPkkdfuaSZAcb6AUbKEMDnwA6MOlTyYcgbPQu5SV1LOOu2vWI+A?=
 =?us-ascii?Q?aUgoAfW2APZeviRAehV/WB7FnMRbyvlGCSSc5W7hY/o19KqHrNXP/8g6LvoW?=
 =?us-ascii?Q?d6tgx8ki/6OB/yELHPfGwvjWxb6j1oWxfIex0JLXEeZKiBweZdaDW2vzXYml?=
 =?us-ascii?Q?yV5UJIpuMH77MbDkBNzvaFMShxqPhgryOVD6PIC1nTj4M1csHamJFa9lhLzb?=
 =?us-ascii?Q?asXSf76MPILlxTszXsiJ0CNCJOxEWA4KTASyU1FA6zqKjsoJduWfwD6I3XnC?=
 =?us-ascii?Q?veSU8HfZSW3EXY1rEvy69ziXJfyDoP0jHDuJEADTP4iKMWPQFHK7bvUyf+3R?=
 =?us-ascii?Q?gZll7cm9oNkmCKWS0Y20fbaL0P9JxlFJXpbhZ1jgfDqEWckbnPkHBjqG0PGP?=
 =?us-ascii?Q?fFfl4IXWdyfph046JYiWed2yAGfnIw6uHwEY4wJ0oaY+kx6IxKNoKVszNXth?=
 =?us-ascii?Q?Ef/tzuH3+iYF9HfOIun7Ry0FzRNxx8Y4mjH8BQ+ZhAQKmrYIUfPImBDuPQY3?=
 =?us-ascii?Q?uOJVZxR5AhoFfHs6eCwkdS9gjDH5aF/s4MaeVDYQQpjdLrxcsyU6yZKdd9aF?=
 =?us-ascii?Q?JwSYetlfg8CQK4qOAkuAljkpNyKiLE4vV8kjdBMe5aKis8pVI4qHzOsUHvxw?=
 =?us-ascii?Q?6JCTcelbh5zo0qh2WbgwYGCpORRUYcBeqwgwn40jBsFrCRwJ7/EYDFIQ45JG?=
 =?us-ascii?Q?GVYdFCY27nSG3BXMlHrQY2j/QUyiyyocN4wNi5HV9kqGoayYGLm1QFmqngir?=
 =?us-ascii?Q?/re3coRWFWABrFW6eoYoFhSkUcwfZXAjr9UWQxCzyfqXEWzqprlHbWjPsW1p?=
 =?us-ascii?Q?fldWcCVRrwF2NMGvvVwBgxxnfwAf98H2wD/cH62h5zXR+k5XnweigkYRlVSx?=
 =?us-ascii?Q?Ifh2jCUhcz+8cMJiLyE4hIjX/ODvvCFRJmrSZU5CA5TdYPi13ovYj8wI7Hqi?=
 =?us-ascii?Q?LN6no32iIpFtfgLYB3J0Iq8XDmgzRSuKUa33YkcLPxn51x0Uj0Kvh3lTCLC3?=
 =?us-ascii?Q?mILg8opLr0o+ovZqBelQ8eODNS4UFu5HAP7m9YfpsGWb9jIQwby24dKKih/a?=
 =?us-ascii?Q?YhtlKV1wcywZalwJWWLYL5Hqc8k/fXiHNq3u9dih/DoXAW/98LZLQJmXzPkN?=
 =?us-ascii?Q?mIvz7uf3o7cblYIIk21/NipZnd/VU5q+vuZc5QFlwSt8qGHM3tvaLPQOcRWa?=
 =?us-ascii?Q?XqBPWu4tbKb6WuWA9aQt5D0tkFG+vEitqfltu6uTsINbyB9oaggHakp8Dyq5?=
 =?us-ascii?Q?kjdr/qPHnQY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1k3Affq2l9akXSjbiEChWZzpkpmkykXrhmm3D7a3VmzIdwqmFvctan4I9N+0?=
 =?us-ascii?Q?Dnrhq03pyX4pz0rWdTxkJerE6N8SLpDdxOWDqFFXuS2WYwiB0BAn1cooQwFu?=
 =?us-ascii?Q?I7Du791V02dzbnoYQ4lYZzqY1u7P68HwDQ1pp+0AI/oLAoBnmzvLIfyQtXV8?=
 =?us-ascii?Q?qhAzTGVYQdYVg/efqUv43cXJKBuJr0KqIC4B827MIh+2/3yXt51hZlyLZKam?=
 =?us-ascii?Q?cLeb1rpMpwvPHs5UKO9lr/vP1w3SZCtsbExUnrfazvznIOrvb0eFUBQ33dD/?=
 =?us-ascii?Q?2Rp+aZ8JIXa75kcwWrSCfFWZm3HQ1N74EoDQH9Qm8UjldX+bkiEmVSLbNkIz?=
 =?us-ascii?Q?qs71GKdZTxbPPcqbLKkAefP8w56uIyUXwOK+2IO+c22xhZUwOfnHkA/Uv+pZ?=
 =?us-ascii?Q?bUodu6nZH3GbryO0N7zsDF6WLLy8EvRkBUJH/oXLKLAVETqELBu1e3m23cCo?=
 =?us-ascii?Q?sbPeA3Q4e+2QnrSF4s3KbfiL4CCBd9yu6a83lp7Ps4c6IuQUT48FxvSNHMaE?=
 =?us-ascii?Q?9rvxz7C9cpJz8NroHHvWDIsKi021cyvLw3KGPDflxHeNNPRD+RIh6KUhX6El?=
 =?us-ascii?Q?uoLMphxp31Ig6YeVW7mI19r9p5MrznDbWjrisfQriZ8Nvog9dvd+Wx1CyA6c?=
 =?us-ascii?Q?yeaMuy36hw8TVcJJNiJvm/xy2B1CLYurNedAQx8zswpHfZNupzQgWyB4m+JC?=
 =?us-ascii?Q?pHSOOLROfRj+qde26q6O09eDU4D16Xq9j/X2a+j+N2g1ZrKia57nNzuqreu9?=
 =?us-ascii?Q?VrlZS++2hAj1796xezFw0pZ8nBFnNqjKrFyjrUW3u18AlcyXaZlePr8ZRFJP?=
 =?us-ascii?Q?Pf5N+8p1fMsUoY2J4bLr6yus/f0vRtA5xcd2ly+9W0Mvi5qRoz/q+D1NejO8?=
 =?us-ascii?Q?3yd4Cva0zQjdDDL0Z7yXmk5KVdUMiJ6dalyWIWxpo4fk2ZVzGcDcc8Zrr9TR?=
 =?us-ascii?Q?ez83nB7buYTGl838hVeCwSZMEZ3h1hZV2fEfJ3FZHe//fvficARxXC/Gs5lZ?=
 =?us-ascii?Q?IKkFjIQ5tofLbApGPTbFMupmYMcRGCgbnbhHN1onELEOy846wgoLSOMr4N0P?=
 =?us-ascii?Q?QDJ9QUZCuMWOzLASGOK/I3tWnZrRdBrk92yvHdV+CObZwrJWZNDYZ7+bFVBc?=
 =?us-ascii?Q?iPzLvk3MvN21RdQtKvKco5ldY/1WU9+cSiUEAyR05PXgMm652jvUwyv6ATha?=
 =?us-ascii?Q?tbYiaFJ1MfTuOXfT+mLnEGHiPWTcQeF1qal5XE1jMIHcre1Q28YhvvB0OVJi?=
 =?us-ascii?Q?BpP+Y5D5+OH06VRMXFbkmVHmlhEb288byZJriLFpV1GDkM6CWpbRQ1BZzAvw?=
 =?us-ascii?Q?TTtx0Jrn2FZ0foijeLC9e6GD+Tb0OdNkkR+F3Ufsld+AzzmQJFGpfDEhMDEK?=
 =?us-ascii?Q?51yjlUVXcd+8OlpIQlvumR6PytQU6FwNVr6EkAVPJ8t6kw1Xg6DcSLpUc1E8?=
 =?us-ascii?Q?76pQHIDWz0P7GgAy/XeqNLdQBluRXbsRQh7pTooJCCuykJTvFvRH95s0zl+z?=
 =?us-ascii?Q?Kgc/o7OxIY5StQHrS68FXm5AUy5gTMN7AdQ+mDfuYf4Am0ufd5EdVHouFKIB?=
 =?us-ascii?Q?/G6bYLPKdo1hvSU/zxVpRjwRU5c7H5nm6Vdkgl83?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085784fe-299f-4d7f-4a20-08dd4d12d940
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 16:15:50.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dc2AQ22RE1hFaoyRwWWpHXWNqChlSkEk+yf4qeuDx3KluUNZJ5PuGXHBvad4xcmM+WJWc2KoeNrTMW9emCxfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
> 
> Use it and remove some boilerplate code.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
>  1 file changed, 6 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
>  	struct clk_hw_onecell_data clk_data;
>  };
>  
> -#if IS_ENABLED(CONFIG_RESET_CONTROLLER)

I see the Kconfig ...

        select AUXILIARY_BUS if RESET_CONTROLLER

But I don't see how this code is omitted without AUXILIARY_BUS.  Is this
kconfig check safe to remove?

Ira

> -
> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> -{
> -	struct auxiliary_device *adev = _adev;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>  {
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> -							 struct clk_imx8mp_audiomix_priv *priv)
> -{
> -	struct auxiliary_device *adev __free(kfree) = NULL;
> -	int ret;
> +	struct auxiliary_device *adev;
>  
>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>  		return 0;
>  
> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> -	if (!adev)
> -		return -ENOMEM;
> -
> -	adev->name = "reset";
> -	adev->dev.parent = dev;
> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
> -
> -	ret = auxiliary_device_init(adev);
> -	if (ret)
> -		return ret;
> -
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
> -					no_free_ptr(adev));
> -}
> -
> -#else /* !CONFIG_RESET_CONTROLLER */
> +	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
> +	if (IS_ERR_OR_NULL(adev))
> +		return PTR_ERR(adev);
>  
> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> -							 struct clk_imx8mp_audiomix_priv *priv)
> -{
>  	return 0;
>  }
>  
> -#endif /* !CONFIG_RESET_CONTROLLER */
> -
>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>  {
>  	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
> @@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clk_register;
>  
> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>  	if (ret)
>  		goto err_clk_register;
>  
> 
> -- 
> 2.45.2
> 


