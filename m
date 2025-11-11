Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D0C4A2C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B3710E4A7;
	Tue, 11 Nov 2025 01:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrHE5mh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B9C10E4A7;
 Tue, 11 Nov 2025 01:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823136; x=1794359136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TxDgyQ2OxRQaRyJ31fQYnldxhVpXoodp0LUwhBWk8XY=;
 b=mrHE5mh3a14wy9oBtu0wXBKuJmC08j56ByJdg+uLeNh4YFYF5Umpb8Bb
 iH+UFlwW2pmf5BJrxq1g7AQ3Edx0tYx2Ojnb/8Y4198dgwVf8hqtSRNvE
 wAr78jzthfz6eW55LzkJFbwYbUr8vCnBc1VDyt1wL3x9vPiJScPvzXSD2
 FEuMsnJMATIGmrtjuUC+LCieYULjaOlKu/fv5Dova4WvzvPwTyepF5d5X
 aGT3jbAf96/pl/zTSv7ZuP1zIj0pfNPVy8QwpEj53OgwAaNA/QK7XKFsC
 6UvYuVYJKOWvZXL7cCHCpMkvjxKn/evV9W0elidasqdpcTa7cAsaAUakO w==;
X-CSE-ConnectionGUID: o2roS8xUQa235NOOQqJ4Ig==
X-CSE-MsgGUID: o6lgh83qQ4q3FYFp2wzdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277563"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:35 -0800
X-CSE-ConnectionGUID: 9sGvpLZWTGa6u+5YQMwXrg==
X-CSE-MsgGUID: edstKD1zTnGbj3YbEWZfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193203641"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:34 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI5WLvdfEGohapeuiI31lqpFfKky7UutLXsyelNCxYNle7nFfYJlDSkopmMCOzCAUhs8r9pt4gkmYgwVhQg/B21eWOakjlrECBEmied8ogq2XOfUuZiYFhIII/KOeCaLM+ls7UOei1cXFYoR9tL6Tp0l8QCon6DErhlgRg42nF5RjX6IHy2BKZw9PGPOXh1LThZqNN1pM8rnyTH8VyhbQ4fx7jBiUaQ1ytn4eIjOokPA1TWvKWkUl27Ex7ewau7JRLJNU5onyw32hn9REM65GdyeYWNNPkfkZCHL36dPMQVEEuA5inLrs/9TkPbvDB1x3J+EAGfc4cjvl2+Oy9ULPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEOUehYqiFd0E+xsQo+IPBAmdA2LeSFSAGXK/PECRSM=;
 b=KrIEgxmYy55BSwN5Uu0FTWMB5I0bCmLCK0tc4Z4AHvQu0Jmeg1EeHc2KcjHKQ4U2f8yqxVyGaHgmjkLrhAfxjUlpkvWqusE+WOGpPlTKDlotKKi0NRDtaydNKIxrud5ASvZvzuQiHlsOHaPbqV+WycpE3+/Z1/y4CPm3Ted/404nS+ju1Vt4eyjxxAk6URTOYwoLIfE8gPlzovFzlGcjhRivJVR0bFTi8XdqlzqIM2FPBljxCRliwW8pV1XpvbaHKPn2GC+At2AEB7HKE40maXAj9o0nlcvyZ0FuD84tW1Z8L9xnyP5N6AefHvVz1GoJ0yrVkhwIoKAtXdpSh5HLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 04/28] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Tue, 11 Nov 2025 02:04:15 +0100
Message-ID: <20251111010439.347045-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: c16ee4ac-cfb3-4139-7c4c-08de20be660f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUpic0NJWGV5di8wcWx4RVljak9HSEFsc0FtZGt1Ui9BMHV5WTQySTVKd0E4?=
 =?utf-8?B?Yk9IMU9JMVNtcThRQVRyaUNxSXEzS2QyMlhkZk53N1B5N0RLSldiaWEvNFht?=
 =?utf-8?B?L2VOdlhhcW0xTWxUdnJjNHZ5L2p4bXhrU0QvMEhEWkliSExPMVlSSjBVdHox?=
 =?utf-8?B?cVZJM3RBTkhZWXhBOTRHb1pJd2o1NE9ES0kxaVZlQmh0K0g0K3FGQ2xYb2Fp?=
 =?utf-8?B?cnhUb2tzejdPSUtzYXFEdkVuQzFSaWZINWVPRWtlcWQvaVhyN1FqaVVIU1A4?=
 =?utf-8?B?cWV6d2dFZy9WdjFndjMrZzQzelJjZ1FyM1VHUUlybHJ2ZTNmcUR1aWZ4Z3ZM?=
 =?utf-8?B?Z0dqQnNIaU1yM1dqeEk5bGY5MUxTV0U0dUg3bUxNcDJwektzMWJwNTBQVXp0?=
 =?utf-8?B?OHJLTTZNeC9oVkNmYUYyUEdFSmtISkRwK0U0bUFGRjRGMkJPL0d5dlAvcHAv?=
 =?utf-8?B?NmVPU0NKVGNMUHJ5bGI0QjZlMGVHZDY2UUROZGVnUHZFVEFWUnNxSldLU01z?=
 =?utf-8?B?THMyVWFudCtybEVsVlRiR1VNdDE5cThaREhNWHdPY04rSDNyRElyVEZOTmVy?=
 =?utf-8?B?dk1IUHU1QXY3bmtJMkh6ckJNZzBlb2thdTBmUHc5WWlFeGU1TTU0NGxVYzZh?=
 =?utf-8?B?UjhBQkRadU5JZ1V3RGxDbVlCZlJQcHF0ME42eWxUdzZhV01qVUFpTGNZQ09J?=
 =?utf-8?B?UTN6UzBLdzRQYVBIZGZjY3Jnc2FrUXM2NXZKL1lBdnZsejN5K0JDSU9IRENn?=
 =?utf-8?B?WGpMY3V2TUh5anNsd1oySmUydVp3Q2xvemhzQXQ0QWF3S0UzWmpWSVdOQk9Y?=
 =?utf-8?B?STRwcmVrczhFT0tzbFUyQmttQ1JRejFac2FmTkNLYXhiQ2pGTEFVMXhEaXNh?=
 =?utf-8?B?S3lwSHk0VDVRSUFxdzhhOXNzQVFqQ0hkVndXalF1cG8zSFgwSFJXcTlDcWFR?=
 =?utf-8?B?bC80d2VERk9WUEJjMnVTb0sxcHlrM21EaWczUmVtVzBPL1ZEbW9TVndPVVdo?=
 =?utf-8?B?bUtCRCtNaGNRVEM2L2JFNjhyd05vQTVyUE50a3VWNzJTcmZ3cG10MWNLeHF1?=
 =?utf-8?B?ejYwY2xhUVV4akNENER1cVIyTTdMK0NqZE5DekgwU0ZIZE1DVXNrUTZha2ly?=
 =?utf-8?B?dnJpb1lMcTNUVzJ6NUw2SnUxOUZJRWQxelBITjNPRFNBZmx1Uk9oeEI2ZGR2?=
 =?utf-8?B?QysxN0xCUXFHY3ZrZS9WSWptSk5uZzJ1NitibXNFSm92VExyTGJwcjlEenpw?=
 =?utf-8?B?K01ZU2JOQWduT2lJRFcvVFN0aVRIN01iWUZTTTluNENSSjdFN2dLdFR1QTVG?=
 =?utf-8?B?Y0J4RmtVL1BYRDR6MWZLcWJENzArdGcraTVVNmlKcHNldGtDRGRTQkxxeWNL?=
 =?utf-8?B?UU5DQlZWMEprRW5Bem44S3R4MUNSdmJTMlZHYTN5NmFxYTlPS2hPOXhmVXk2?=
 =?utf-8?B?NzdPWmN6SmJzTnFpbTB2RnNFd0tmNzVuSVVmeFZaMjliNWpaaEU4S3R6TE9G?=
 =?utf-8?B?WVkwQ1M4ZnNhNk1uQjRXT1RWdytvY2xnMVk5S2NjU3BWN2hqUnMyQmtGM3B5?=
 =?utf-8?B?Rm9YaUs0UUcyMXE1QUJzNklQM0VjWFBJbEMrdjc2RHlZQnlZWXNiRlZNbnUx?=
 =?utf-8?B?OVhKbVRaUW9PcDNjN2I3UkhNZXNucVAvcTZITGt6K2JNOW5iOVRWQndCb2FU?=
 =?utf-8?B?bmdrWXZwUG94eC94emRQdGlkd3R6R0EwTnFtWU9oVFRYUmJWMisyRTZ2WWFv?=
 =?utf-8?B?TlB3UURacXJ6WmJFbytBaXdjV09QSHhTem1NR1RHN3VBWnpGZGtQYWpIemhT?=
 =?utf-8?B?WGRUaWxxUCtFWUhPUFRuSFpPNVFuV2pFWnluUCtzcStkVHlocWV2MHduRzhI?=
 =?utf-8?B?YXVKL2k4Y2daM1V2U3doQyszUHlnYmJZeHVIakNWUjNIbzBLazM1T2wwci9o?=
 =?utf-8?B?NUllRENDZm9rOFFFU1ptelBXY1A1Mk5Sd1BSaGNySWtyZVN0REZwL3dCMUk2?=
 =?utf-8?Q?xx+Ab0gbG5N0CTW3GaTuVvMEM0iuII=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1dtejM2bDU0WklyV3BZUElyNWNoNXVpcW5FYWFtMFNhTWRJUWdKbEdRS3hN?=
 =?utf-8?B?aHBkaGgvQ3FTTmR1dmNmTnRSd2VLNGVaMUkvSk9UdEsxY0xoem95OU5aRGNj?=
 =?utf-8?B?MWt2R0JwTmVCMU1qTGJXNzNnenZUY1o0ZnhaQlBsZGUvWjBydThna2xaOFhq?=
 =?utf-8?B?YWRnZTJSbk82cmZyUlREWVpsRkoreUVlb0tlWDdScW5qQnVkTTR5Rk52Nzhu?=
 =?utf-8?B?NDc4cG9hSWFteHV2dWNzclFKTVpGb2hHTUxMTlhSNmNFeG9sN0NDR3FVek8w?=
 =?utf-8?B?dCsveVgwOFRkd1hEV01FS1lHWThWQ1NUUHVCVkxuWG9Ga2ROUEU0VnVORm5F?=
 =?utf-8?B?VEdzK2kzUzZHS3U4a1ZYZlpBY1F0NFo2UUdBOE9XaUltTWdBUWk2R0J3eWVJ?=
 =?utf-8?B?enlVR2Q2TDk4QWo0SEpKbk9yVEFWc3JPaDU1SnloNFdpWmlBZnVSUHlZZTZr?=
 =?utf-8?B?U1piUXFIMGgydi9XQXBXbENwN0dNTnl0ejM1Y1huZU5peWFVSVplUEJoVStq?=
 =?utf-8?B?TWd4eHFmNzFzdGtrbzFzT2xaZUN0VUtMR2dDc1lSRGhBcm5xYmdBQ2FMLzRZ?=
 =?utf-8?B?RmE0SXRLeXdzRlFjNFpjQ1l1WnZ2V3hjZzNNYWhjNU0wM3U0YkcwU2xuZjFi?=
 =?utf-8?B?RnNZZytOaGhQTU8yYVJDTFZpZE9IUVAzTHRjNDgwTmhKUEtPcTZKZjhWcW5V?=
 =?utf-8?B?U25xVDR2ZGJQckxscUhrc2xVbFFjMmRPSENRbC9iSE50bTlrK1Q0SUFrWXZQ?=
 =?utf-8?B?MHJsVlhxWnIvakMyUXliVUc2d0wxeUhHWWEwR2l3NXF0a0tkYWxDUGw2RTFa?=
 =?utf-8?B?bkpQRWMreVhLSCsvSHZjREhOT0hQYmx3UlB4dk5xMjNQRkM4bUg5bzFDdTNu?=
 =?utf-8?B?cFUyazAvNFJlMVdmdU54ZC9OUWQ4WFgwUHptejJoZ1ZSTjZNdXhYZnZVK3V3?=
 =?utf-8?B?Z1N2VE51SFNYekxFQmQzblZ4V3FwVTNmblhjVldFZm10RnBXclN6WElyN253?=
 =?utf-8?B?UmtoQUFBL1lheEVCM3JGMUVreFJuMXo4Y0kyaWdRa1NGbHZuUGVleWdVZ2lW?=
 =?utf-8?B?Y3lRSGdieTF6NkpyQVlxRWJzY1gzckNmRkZJQnE3ZkJaNDFjRjdRUUdta3Jk?=
 =?utf-8?B?R3NOcDVxZXIvcmE1VTJvOS9WQ0wvbnZWOG02bnFPSkVzOXdpY2h1NlMyQmFR?=
 =?utf-8?B?b3REYjB6NHFvaFkwZnExVENyeHdTa3pXY3QvWGxLMm9UT1hJanlBTEs0WGNp?=
 =?utf-8?B?N3dpQ2dYRUUwVCt4TzJoZy9RdGtTT0wzYi80M0JtbG9DU1ROS1p2U0phRzB3?=
 =?utf-8?B?M0N0ZVpxV1d6ZlRCN0w1R0FYeC9xME9aSzhVc0NBRVFwZTdVWHdFbjdIcVpP?=
 =?utf-8?B?TVZtVDBYK3JUWEZ0S2c5djVEL2NOdVloN052U09SaTRXTTA0Q1FFRURzNFZa?=
 =?utf-8?B?cFFXWHZJNE8wOVFZRUxTd2VudjNYZ2lMeThsWFFXOUxXSFl5SWJ5WkRNQnZr?=
 =?utf-8?B?dldYZStPeVlkd0VPT3Y1clF2bFgvMkdtNWhtNGpqTkJKRlFmaUQ5NkdTQ2Rh?=
 =?utf-8?B?QkNMVndkTjF5NFpKT2hRVUVFSkVpSTdSc3hDeWw0Rmd4RkNKRVY1TEdFRDRs?=
 =?utf-8?B?ZkI0T2hyUktETFVxb25CZTRKazBsK0R1bEpCTDcxVHhuL3hDUExPSjRTbW9K?=
 =?utf-8?B?QytXVkdPUmcxWXNXQWxzcXJiZ09YV1JaVVFGMVg1Tjc3S1Z1dnlHVEFQMVFX?=
 =?utf-8?B?MVN4bG9kcUg5YTVvNEJlOUphSmtPZGpXcWczeFlNOURONmEwWTNwNmRUWW5I?=
 =?utf-8?B?K2xvNFlGL2pESHdBTkxpWEcrTFV3Y3pncTZJZEcwcTQwTU44RUswTlFiQVc4?=
 =?utf-8?B?aG9rK25HN2NLZHJ4ODJLUjlWQnpSdTJVL3lOWGlrT2pCOUlUWGEzYnlKeDlq?=
 =?utf-8?B?MDlzU0dBNFQwL08wNDV5ZkY4ckgvdjVENlV2eFFQSU5iTnphSEJCblNqQlRN?=
 =?utf-8?B?N3FrVjJrRWh1ejF2WWhyZHBsNUNHSXpobFdGSkl1eTdJVHk5cGtJekZjcXdD?=
 =?utf-8?B?NjdoUkhHMlh6QW5Nb1JpZ2ZTaWZpd0pvUnNjeFpDWjZrOUtmeXA5UTJHbytR?=
 =?utf-8?B?MDc5YXB4OHI4VlFNeHlVK1lJRXRGTE5YN3FZSStuZnRpOHlwM1Jnais3V0xy?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c16ee4ac-cfb3-4139-7c4c-08de20be660f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:26.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZNM182y9dCoQReaDnISG5Q0b+52gTpEwOzRChC1nXQofpkrcbHU2wAgJUipv6QoSzQYbRw4hjvkeOJ8vURAWGxEzlsiL3IcFnWZf24yjEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   4 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 404 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 8a2577fda4198..a571e1c02a3b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
 		return 5 * HZ;
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
+		return 20 * HZ;
 	default:
 		return HZ;
 	}
@@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
 }
 
 #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
@@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return -EPERM;
 	}
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
 	if (!pf_enter_vf_resume_wip(gt, vfid)) {
 		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
 		return -EALREADY;
@@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		ret = pf_wait_vf_restore_done(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1463,6 +1705,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..0286536375d17 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -16,6 +16,10 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index d9282eb259727..c0ce05818e24f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,12 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..e7b904e57b68c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_trigger_save_vf() - Start VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_finish_save_vf() - Complete VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_trigger_restore_vf() - Start VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_finish_restore_vf() - Complete VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..30318c1fba34e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c55326..e0e6340c49106 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_finish_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_trigger_##OP);	\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.51.2

