Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12425998131
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7B010E8A5;
	Thu, 10 Oct 2024 08:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuVtA5+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794A10E8A1;
 Thu, 10 Oct 2024 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728550771; x=1760086771;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a8g25fQRO6Whi+BLRy0uQijAA8AJo9FT+6Enz0fIHKc=;
 b=fuVtA5+7jrPNZANHz2+BjP76WVZvnxYNrsOP8ytaBi76Q8vv9cNCM/Hd
 2+rEXfsk2Flq50dtr3T6pQoRpf/6SsgPWXr/8K+V8BDoo0O8/wHqst9IT
 6L2e2CxQtSWGnB69VWyVqaWiSXRUCLrU9rcV+vemp+68hdl7q8/FQNePg
 1ppoMQthwtmoe8SLdnAcCet/xDSDo7kJJxPHFnuvN/x3gHtp7cZXTTKHb
 f7jI4CeiQvwJG/oyh2VbL2AsObEQss9EQqTp7q42/mb1f1S8ae9oKu5ur
 Sz0GG6zrHbyQLZaqvC5gfS4cIMipE0VsNbzQQ8oPyzWlOsf1R22w2CItD g==;
X-CSE-ConnectionGUID: 2WxdhbSbRAKTGCfbwQcqGA==
X-CSE-MsgGUID: 5HYWvWR6QbSIJxGnPKB4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27341778"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27341778"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:59:30 -0700
X-CSE-ConnectionGUID: P9qh/JEsSFS1nWl3+k0VcA==
X-CSE-MsgGUID: vWG366IiRlKAV/1XfKF3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="80535482"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 01:59:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 01:59:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 01:59:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 01:59:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 01:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiKyfOHHUNS8KQegSZmo11tfaeLGvuZKheXW2CVDxSFxE4H+RPWqRxsZfUpbxaiBQNo3QafEvUpJhSZl1g5KCGg7Uz7HMDK8oOkN9pcWUeVyIx6yd1Y6ES+F5qq62QWpaM9Qspn7tpEC5yo9fnzIlGsCo0b2vur0Ei3lN82A3ZDsYJ8OReHZpXCa9oJuW/pKa82TPieWMcF3IXlOCkCGT2G0HjzQLp2wfdwVesgPmmyO/7JUmgN403Gu3RYIVKfeGLr15NPuHc/p4jgJAZy4BOofLjOdf9QjvypxKywcRB6Emker2Nh6+lVczIUJ0lb/B+TDtjgx7dm4C6jrCdwQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ceB3Wgp8hSRQOUVxxL/kXlPlDfd18VoVtPQ76Kxkaw=;
 b=xTymCBkQFG2ck3AfO3oYM5xvja5AhAbmcQ/yeQBB4dbXy0MMDlaMIAJoZk6n4A3+m4VKA7DnxM1Cv8AyXUtvwjh5Tm9mST+LEffmydAJUuJXT+Y9GM3nIPH1uj3lJg6ouZcDeFUvXR1oOBd8zkT7UsUnx/nI8i5cZ3bWQWRadNfTqYU0L3mJBVdBtOy49U50BT/6L0tju3FmPdcyZz/bL2X/sQo2PE6xRKzmY/q0x8wmPbreMcUxYVlM1MVknvfZyD44OHXplchhAXvjhNFgfbwNsJggzKZ+RQQiFISol/fvx0T4pc9t7QSzCfoLdFYJtZ+Wum8Ixp+riBwXP1Ovyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:59:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 08:59:20 +0000
Date: Thu, 10 Oct 2024 10:59:17 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
Message-ID: <47iala6cl7tks7tw3wcrxm43y4xl4w24u6gfw5tekdcuabhndx@t37nyrqysrb5>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-3-michal.winiarski@intel.com>
 <376713b2-6703-4fd2-b99f-cc67de4f267e@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <376713b2-6703-4fd2-b99f-cc67de4f267e@amd.com>
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: 880e8ecf-3f54-4f2f-e8e9-08dce909d3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmdxSy90UlU0NGFTNlpHOUJJYUEwMDNvYWk0Qk9kcGxFYWF4Y0RVWStFYmhY?=
 =?utf-8?B?ajJzNzNWbi9lY1FzeFNEV28rVnZSK1MvdDNQVXZBbk1iRWs4UG9mTW1RRTBG?=
 =?utf-8?B?MnVlTDN0emZ1MjNhUXowRlpRcXEvRW9Ocm5FUC9ZV1dNd1lPejZGOGIxeTJZ?=
 =?utf-8?B?S0tnTUJJaWZyb2E1TkxpMThoYld4a1duOHo5Y0g1ZGlyQlhQL0JJWXYvS2hL?=
 =?utf-8?B?T3hSdlR6SDhRbnR0ejMrc1VoNUlyWVFaL3pzWXI2VHc3ZWlEd3lzTCswKyt1?=
 =?utf-8?B?ODBQT3h2S3JvR1ZieUJyRVNzRDhlUXJmOTA1R0oxVi9GZ1dWMXRxNkpwNnpK?=
 =?utf-8?B?RlJIbnJITTRzVGsxckExWkZ1TXo4TUo1YnpkVVh3WXE0djRmY25BcVZjODBX?=
 =?utf-8?B?bzlWWS9UdlNRdmpRRW9pcmo0d2VOZlJpaWxwTmZsYzl6TWtqeS8wRU5WRnNU?=
 =?utf-8?B?YlFpc3VTM2p4WDIwQ21ZWlVTVGZ1WitNYXBQRXl0TjVjbVhlOHIzeGhhemly?=
 =?utf-8?B?aFpsVlJPSllaQUc2Z21HTjJKSXBQL1lMc05pS291TFM5Nmx4dEw5RUowcHJX?=
 =?utf-8?B?RCsxTHVEdDRJdy9BUnJESFpscjRtSlZjUzVsZDFJUE0yTVl5VnBUTXpoaEp6?=
 =?utf-8?B?TW9LcWw3ZHJaaUxRZWN3WWdJQ2tSYXJNVFBXNUY0RitjWHlhYlR0VjdlRm5U?=
 =?utf-8?B?UDR4czhVa21tMzlLZXkyYmlCZjFBQms4RkVnNEE5YitzcVVvaWJkL1QwRzdZ?=
 =?utf-8?B?emlDYjNSRTA1NVR2NFhWOUMybUx5ZmJHa1p6QXNuOFdjaWV0MWtRZE5aYjZK?=
 =?utf-8?B?SU4yTGZtNUFGOHlSMTJ2V0Z0d0tIVWowTlVsOFY1M0U4ZVFFTW9vTE9KSWJQ?=
 =?utf-8?B?V3oyYlQ1SEhwUDdiekdaZWxydnBtTzhIcmdMSjh1OHRFZ3ZWWXExSWZMM05W?=
 =?utf-8?B?cGNwdDNGcHZqZzcvL2kxWkl4RnlGdXZKU28zQTZTN0ZxUGRGdFQrVFFxYUpj?=
 =?utf-8?B?SGxRY28xWDg0R0JiNjJxL3NVZjI2NHVLck1KbitTTjkxbVJ6clY5b204TjhQ?=
 =?utf-8?B?cGVmZzF5NWVTRE03U0k2OU04NjZyNjZuZFBNQ2VqMGFSMmpwbGhFa0QzbHlP?=
 =?utf-8?B?Q1lGa0QweElKM2pCLzJZbjBCWWttVVY1NndURG44bGV0ZlJsQUZsR2w2bDBG?=
 =?utf-8?B?WjJQNUhHMHhzVFBlNmVhblJ3bGlhQzhtbndOOXJ2eDgyb0ZkUGN5U1dsNVpG?=
 =?utf-8?B?RkhyaEsraVo0UEFaYnRkZ3BlekQwWW5hSTdVV2VaTVV3b09FdDdyT0hHTWM2?=
 =?utf-8?B?aTFXSDV0TTN6eFJnNmk2STVZVmVvM2tXYjhUUUhKZ3p4UmdsL1B4WjVnNGhz?=
 =?utf-8?B?S0dKUzBZM0F3MEJqUTVDVjh6cnBxNEJRa0xPU2RKeDFMRkRscXJNY25hWXNy?=
 =?utf-8?B?WC96YW9rR2FNc3ZrdW81aEdXUi95dzZZNWNGbzhwUFpZYXdmek01OWlJUE5y?=
 =?utf-8?B?dnNDKy9MNHY0TmU3SkpMcnJHVllCRGVpL29JZGdEQWNQekdTV1dRbmYzcDBX?=
 =?utf-8?B?bVBMc0cxRVdNY1ZUeHp4WHVmY01Qem40di9oWFl4MXdWRzN4NXQvWFl6b0Rq?=
 =?utf-8?B?ZHF6WFBMT0ZoZWNpL1loVTRPZ0JSK3JvOCtDVVgwR1hYV3c5eVB2cmZPcllR?=
 =?utf-8?B?Qy9hMHU2M3N5c0hJTEFkMW5XMzV0RU5keFdlOFRHbVk5Zmtpdk0xOTV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdIRjNYTE1kMWpmOHBZOWFoOXJtR2U3U1U4LzBva1J2My9wS0tBbzcvR0RK?=
 =?utf-8?B?ZGlZZXN6ZkRKSko5blMvVjRqVXRMOEVoRnhtcTg1eWtKZ2lOU3duVXlXazkz?=
 =?utf-8?B?SEFrL2EvN2hVbkp3N24wbHFsN3oxMm1zbnFVc2tnMjRxdXo3aEJxOWJ3dmdk?=
 =?utf-8?B?L2ZNUGdVc1NIWFJyWEM3ZlBIbEdDNitjV2VvR21RWXd5M1c3cEhXelpNcDNj?=
 =?utf-8?B?SmR4NDFvcHVLK3NsRTZ2SUtxV2JKLzUyZ3dNQzFDZmVGTUhuRUkrM3lmUDR4?=
 =?utf-8?B?TWpLM1FUR3lHSDBIc3E4Y1FhaXhybUpuVUVEMTA5ZmJTemdleGtLcmh0T1Rm?=
 =?utf-8?B?NGFwZ0VGTzlnN3lCZ3cybFRtWFBoUzZpZDdBMW0yVDFvOERyU0NwNExlcmpT?=
 =?utf-8?B?WkZuenE3cVRZQlhJVDBPTHY4RVhZRERIcTdnTmVuUUtpYTJ3RUVXeDBQR3NY?=
 =?utf-8?B?NUlDOU5tenVBeHpOM2xZeWxwdUJSVk81d1UrVUVnd3JxYzZ5Y0VrWkdiaUpG?=
 =?utf-8?B?alRyeitIL3VyV09JUCs0TEExWGZCcndLcm5ycFM2b28vM3BVeUlVYkdTTXlk?=
 =?utf-8?B?ZXlIVmdhYXJiN3VOTTZOOTVnRzUxSHAvMWpTMUtLajZISUxUeG5JamdzeGlL?=
 =?utf-8?B?WjVZNzJldFhBZ0hidmtQc0FrR1d0Zk1lKzVWNUY3enZEc0tjWHBTSS9yQ3ly?=
 =?utf-8?B?SmlaZVV6M2xON1dlWDdQSTVNbEt5OER0TEkvZFhIbXFsT3VHWmRYZmthclA0?=
 =?utf-8?B?cGNaajJjR1ZqbmVuUU9Vbm5DYUJRV0UxTi96Qy81SUNrMVhDeGpqSS9YaXhP?=
 =?utf-8?B?WmM2NURtM1QrUEZlcjMwSktMK1JXVU56ZTFuOUdnMHE3NTRSeUwyZ0FGSm42?=
 =?utf-8?B?S0NJUFd0QmRPc1RRUWt2YmJkb2xJYjM0eW85d3hOVUlYdFVyc1JFaW03REtq?=
 =?utf-8?B?TkpGSkMwWmJsVklxaDAzc1k1ZEc1ZXI3TkhEUmVubnphMi9jb2dDenp3M3dL?=
 =?utf-8?B?OSs2TlZiQW9IZWpkbU0wU1NTaEYwNW9xWGs3V1RDd0R2WGdZd3p4N3lFSWN6?=
 =?utf-8?B?b1lDSXArUkhSZm1GaW5SWVFFUWptSFdDTG12blpXZFJlaGtBVTEzdGd1YXVT?=
 =?utf-8?B?TkRsZit1cWJvaURMZXJDNzRXanl0WFgwOXFVYlpWZlBETjgzci8raGRjek4z?=
 =?utf-8?B?RjZNLytKQU5rVzZxUXhlZUxBZmpsQVN3cU5DcEtmZG5DUjh2NGJnTzhnRUNF?=
 =?utf-8?B?RStCaUFHb2ZxMjN3enRSeis2MWNQYXdMdUEyUmlpNXAwQ3hSdWV3LzlmQld3?=
 =?utf-8?B?bzBYcWNxeVVLQWtBeVE1cGZNMVo1SjJBaXU2Q0x0bFR5Rk5KVGNvQk92NEp5?=
 =?utf-8?B?YTVJVlE5NFhVbWtheTk4SE5yUFIwOWtCS2dDZnBWU0xBZTROcnU2Z2xSTU5Q?=
 =?utf-8?B?WEphT2FSNWdGcHZobjFQNXNyWk9XVXlkMnZwR1EyQXVlM3k5ZTYzb1BtV3N1?=
 =?utf-8?B?cjJhMTFlMmI4U3NlaUJLODJBOWNHQUJSbSt1VXNXWFRmODlMNGJyL1c0MDhP?=
 =?utf-8?B?Y3FDdUs0Qm9kOURzNUtKV0tDZDBOcDdTbmcxN3BCMTZZRHd5c3NCaE9QQ1Y1?=
 =?utf-8?B?NGtvNVBUNjhhc0VSZFdpcG9PMjdlbytvU3RzcndBMktmNHhrUDk0NVRlZlY2?=
 =?utf-8?B?OUhxMW4wTWxCemFCNnFYdTQyd3g5aVRxRUVFTFU0NUZlRWQ3VkFPSWMrVk5D?=
 =?utf-8?B?bDZHL0F6dENpS3grazc5SDBRS0IxRjhiWkhjVGtncjVxTU9KS0xEbWRMOXJ6?=
 =?utf-8?B?SHhWZUlmUWpzMG1STFR0cDBYeGQxSkdDV1k4ajlrUkYvZERoSjVsZnU0N3VS?=
 =?utf-8?B?UDcwZ0cvWStZWnZlVDdZYnROTzNDbEFRbGpwS1JkbzNLSERlSXBiam9kVVhj?=
 =?utf-8?B?RHRrTlpETWthUXJ1ZEpQak9NVDhQWHlNa0dsblUyUmxWYmRJSXMrbk45YzlQ?=
 =?utf-8?B?Q1ZOaVJxQ2p6V1h1NGF2OVMrQkQrKytwTnV5TjNoeHRmeU5nV001bjE3ZHU3?=
 =?utf-8?B?N3hjK1BReXZWVlQ0K2NpZWM5L2txV1NXZk9tcUNTNHUzeW8xOWRxU1dabHJV?=
 =?utf-8?B?ai9WaTZKSHdEZ0FCMEJpRjMyeGhVeTdiWkVTbnkwSjJ5d0RtTTBBZzBjWTJh?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e8ecf-3f54-4f2f-e8e9-08dce909d3e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:59:20.0640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH4NwS9AtBqHj/iGduPYO9la4LuCxnLCFSFUgXZPBm9J1S06KUqfVKbhGbOnrOQ0rCoOZ7YBlhCXEAvE1Cm8Pr8D5jVzqwgmRRE0/BxC5yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
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

On Fri, Sep 20, 2024 at 12:07:34PM +0200, Christian König wrote:
> Am 20.09.24 um 00:35 schrieb Michał Winiarski:
> > VF MMIO resource reservation, either created by system firmware and
> > inherited by Linux PCI subsystem or created by the subsystem itself,
> > contains enough space to fit the BAR of all SR-IOV Virtual Functions
> > that can potentially be created (total VFs supported by the device).
> > This can be leveraged when the device is exposing lower than optimal BAR
> > size as a default, allowing access to the entire resource when lower
> > number of VFs are created.
> > It is achieved by dynamically resizing the BAR to largest possible value
> > that allows to fit all newly created VFs within the original resource
> > boundary.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >   drivers/pci/iov.c   | 92 ++++++++++++++++++++++++++++++++++++++++++++-
> >   drivers/pci/pci.h   |  1 +
> >   include/linux/pci.h |  3 ++
> >   3 files changed, 95 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index e8ccd2ae0f024..d88efbfa70e42 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -181,6 +181,86 @@ bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> >   	return cmd & PCI_SRIOV_CTRL_MSE;
> >   }
> > +static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)
> > +{
> > +	resource_size_t size;
> > +	int ret, old, i;
> > +	u32 sizes;
> > +
> > +	pci_config_pm_runtime_get(dev);
> > +
> > +	if (pci_iov_memory_decoding_enabled(dev)) {
> > +		ret = -EBUSY;
> > +		goto err;
> > +	}
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes) {
> > +		ret = -ENOTSUPP;
> > +		goto err;
> > +	}
> > +
> > +	old = pci_rebar_get_current_size(dev, resno);
> > +	if (old < 0) {
> > +		ret = old;
> > +		goto err;
> > +	}
> > +
> > +	while (sizes > 0) {
> > +		i = __fls(sizes);
> > +		size = pci_rebar_size_to_bytes(i);
> > +		if (size * num_vfs <= pci_resource_len(dev, resno)) {
> > +			if (i != old) {
> > +				ret = pci_rebar_set_size(dev, resno, size);
> > +				if (ret)
> > +					goto err;
> > +
> > +				pci_iov_resource_set_size(dev, resno, size);
> > +				pci_iov_update_resource(dev, resno);
> > +			}
> > +			break;
> > +		}
> > +		sizes &= ~BIT(i);
> > +	}
> > +
> > +	pci_config_pm_runtime_put(dev);
> > +
> > +	return;
> > +
> > +err:
> > +	dev_WARN(&dev->dev, "Failed to extend %s: %d\n",
> > +		 pci_resource_name(dev, resno), ret);
> > +
> > +	pci_config_pm_runtime_put(dev);
> > +}
> > +
> > +static void pci_iov_resource_do_restore(struct pci_dev *dev, int resno)
> > +{
> > +	if (dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES])
> > +		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);
> > +}
> > +
> > +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> > +{
> > +	if (!pci_resource_is_iov(dev, resno)) {
> > +		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> > +
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (!pci_rebar_get_possible_sizes(dev, resno))
> > +		return -ENOTSUPP;
> > +
> > +	if (!enable)
> > +		pci_iov_resource_do_restore(dev, resno);
> > +
> > +	dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES] = enable;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_resource_extend);
> > +
> >   static void pci_read_vf_config_common(struct pci_dev *virtfn)
> >   {
> >   	struct pci_dev *physfn = virtfn->physfn;
> > @@ -445,7 +525,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
> >   				  const char *buf, size_t count)
> >   {
> >   	struct pci_dev *pdev = to_pci_dev(dev);
> > -	int ret = 0;
> > +	int i, ret = 0;
> >   	u16 num_vfs;
> >   	if (kstrtou16(buf, 0, &num_vfs) < 0)
> > @@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
> >   		goto exit;
> >   	}
> > +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > +		if (pdev->sriov->rebar_extend[i])
> > +			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
> > +	}
> > +
> 
> That sounds like a really bad idea to me.
> 
> Basically the suggestion is here that the PCI subsystem should silently
> extend and shrink the VF BARs when the number of VFs change?

Why do you think it's a bad idea? Everything is under PCI subsystem
control and the driver in charge has to explicitly opt-in to this
behavior on a per-BAR basis.

> Bjorn has the last word on that but I would say that instead the driver
> owning the PCIe device as hypervisor should resize the VF BARs to a desired
> size and that in turn restricts the number of VFs you can enable.

Then the PCI subsystem would silently change the driver_max_VFs (or new
variable, as driver_max_VFs is under PF control, so it's either new var
or checking VF BAR size in pci_sriov_set_totalvfs).
It also means that we have to do the maths to calculate the new VF limit
in both PCI subsystem and the caller.

We can go this route as well - I just think it's cleaner to keep this
all under PCI subsystem control.

I'll keep the current behavior in v3, but I'm open to changing it.

Thanks,
-Michał

> 
> Regards,
> Christian.
> 
> >   	ret = pdev->driver->sriov_configure(pdev, num_vfs);
> >   	if (ret < 0)
> >   		goto exit;
> > @@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
> >   static void sriov_release(struct pci_dev *dev)
> >   {
> > +	int i;
> > +
> >   	BUG_ON(dev->sriov->num_VFs);
> > +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> > +		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
> > +
> >   	if (dev != dev->sriov->dev)
> >   		pci_dev_put(dev->sriov->dev);
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index e763b3fd4c7a2..47ed2633232aa 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -385,6 +385,7 @@ struct pci_sriov {
> >   	u16		subsystem_vendor; /* VF subsystem vendor */
> >   	u16		subsystem_device; /* VF subsystem device */
> >   	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
> > +	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
> >   	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
> >   };
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 4cf89a4b4cbcf..c007119da7b3d 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
> >   int pci_sriov_get_totalvfs(struct pci_dev *dev);
> >   int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
> >   resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> > +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
> >   void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
> >   /* Arch may override these (weak) */
> > @@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
> >   #define pci_sriov_configure_simple	NULL
> >   static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >   { return 0; }
> > +static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> > +{ return -ENODEV; }
> >   static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
> >   #endif
> 
