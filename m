Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CAC30B19
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148E10E5BA;
	Tue,  4 Nov 2025 11:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbInwreM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAF510E5BA;
 Tue,  4 Nov 2025 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762254974; x=1793790974;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OeQmjRRKEkdwqwYs4XXBHMCQH6tRvKy2JWya1A46K7A=;
 b=cbInwreM68gRN1fR1CV9Tx2ABpCKXNyNBduMs1/6G3oOG+ryU0RpZhll
 JjEl1EV7NZVqGXHTYCDWvlWTCX3dcpLyQ26/PWJ7VNiy+2bZKlWteFSRj
 gbZP0PHThGXZ0JLSEK7Q3aCIQ7SNYCceEddX3CjX+QK0LjhdDgAbjg3oA
 sQckst3YnnOcV8aF1cBviO2ThBz2x7YlZWLU4AwIXERoQNaeLEjbyCJLL
 UjqKfQmAsAOZLqJFES7UuBWSy6OdHymswAYJt7Qm7gWWi7go9Xbpgq1u+
 aW9Pmq0ePBOvRs1pko68zg87R+XY1Iq1v2R77aUqZyG3PWiJ/5cDBivgD w==;
X-CSE-ConnectionGUID: JSrvJXqvQkKXsn6m76rSBA==
X-CSE-MsgGUID: 3wTPE4hDQOSTg+7seqYi3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64250968"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64250968"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:16:14 -0800
X-CSE-ConnectionGUID: +gg46Iu+TDeW8I3Tj/pKkw==
X-CSE-MsgGUID: gU8p9+lhTGmuUPFsSkeG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192300087"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:16:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:16:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 03:16:12 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 03:16:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCL8kpYYBSunszUtZIyGm0xjgN+HSlh9qWhNcfyYnuENvwJyNzYaipG73r4a1PqcYvJlYeecOqq5CluoZQTrAH5OHIhkIyH9RHJbPMnQbRaNg8mplkLJGzx/k+7OCWlE7U3sh2e/pgOGevghEJOPXfiVrcqqhiaHD7gHoYDzwgkpjoIXQ0eXLX9B7TbILn7In3QrZC9RPmVsZodaVK+19ywtnkdKYw+A0gG33vbTnevOjzDIIlofNQY2sbFshpJi246w8Zxl+9q3wqniPSZIobsOXFZEkzb+YGV3IRP8T4DeWgfGzQfzmwzEnSDQk1gemXHoBtX+53PlCylKIZjBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CSrSiWVM9GvnmEPqaP4Ooh7Cy45McqVsgmzLvu9Btk=;
 b=ODmoQafQKZUnMez39r+b2bGDppHct4ClmWv8Pt8bILc3kDbVnfOgl/bL7IZjn2O6ivNvABTc1AlzfKyuOSPjRdFtufNsYeT44jfYhtA/asf6w4IKnD+NmMLwXjAmEQizMILCBc9KByEzw5a9saXZVlozQnijfEC+6ez1op05E8d8Z4eMW8qbrvKKlf2v8zYn7IdJZECpthklo7tBX4jBT1R4XbgdLy78ZJaS2Ytile6q67sjHLZ4pqwD7Pf3eLLBAFjbKepvaKNfg7cZo7AU/1PZLYFYJWNM5DMBVwVBaHCnCZbc4wdQv6GEOGqpIibXSnb7hiRQDeUSzgEP2nIZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Tue, 4 Nov 2025 11:16:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 11:16:09 +0000
Date: Tue, 4 Nov 2025 12:16:04 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 07/28] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
Message-ID: <7ykmbyoxw6frstknmyji6y2ueibbhxprcntrtotfsop7c7mq64@3wxej6ixzqp7>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-8-michal.winiarski@intel.com>
 <f39aed6f-1f40-41f8-b6a9-627c70e8119f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f39aed6f-1f40-41f8-b6a9-627c70e8119f@intel.com>
X-ClientProxiedBy: VE1PR03CA0048.eurprd03.prod.outlook.com
 (2603:10a6:803:118::37) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec4cc7a-2f81-4887-8d9e-08de1b938df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGJhMkJVYVRWK29TaHh4dllpQWVoRy9NbURETmFNWEtNaWdJRGlzM1pITC9X?=
 =?utf-8?B?TnMrcXhIVUpvOFo5OVd2NXpjMkJPOFZXVGtXYzM0VmM2bkRBb3hwTmh2SWdU?=
 =?utf-8?B?cE5yZHRMN1Mwb0s3ekthRGJJRnNHZ1FhWmxOTE1FRkdRL01NelBpdjhJNGJz?=
 =?utf-8?B?M0wyc1FZNFZVdVR5bXgzMm1zVFE3VzlmeHdXWk5CVnZhZjAwWEpQWStadTRr?=
 =?utf-8?B?UU1WT3BwVjdHWjVud09IQ3BaVXNJZXBIVG9rcUhJVmpvWlRZWEswT3FpSlFn?=
 =?utf-8?B?QU9OK2Y0OUN5YmZvR2xBRkppQU5uSE4yelk4NHVRcWFJdGwxSXlNNkszdEVv?=
 =?utf-8?B?R1YxVGdhTk9ncmNIMlZPanUrenZqOTVpdW92RlJJTTF2WSt3aG95T083YnJK?=
 =?utf-8?B?NzAreVZqYlJFNURwbWdvRlNDcUo5bTR3dEwyc0k3M29PSEphRGttblRSdW5R?=
 =?utf-8?B?OW1TaE5heml6MHNyd1p5MFdHWitwVzh4aFZRUkUyWUJheVJFZDFwMlVGS0Ev?=
 =?utf-8?B?T01TQTdpaXVWRkI3aHNGTGdPOHBHZkVIUC9oN2hsYWtZeERMQ0ttc3N5Znk1?=
 =?utf-8?B?cE9pT1NaQ1o5VkNBT05YVDRpeS91U0FuK1pDckcvbzNOWC80U0tlZkVPdjVq?=
 =?utf-8?B?QzhsVGhQdGJBcXR1cVRHejdoZExiQmdwcVRSdCtPbDhDN0VEVUhPTVA5bnBi?=
 =?utf-8?B?ZXlSWkZ0R0V5d1Ntc2IyM1MzU3dRT0hZTVRoTVBGK2QxeklNQitKVGZZNkFV?=
 =?utf-8?B?RkwreHJnQ01WMlR3aVJIVVhlNk9YbFBaZGFCcDl1d1N4MktSWmNMSlMxK0Va?=
 =?utf-8?B?enVUNjlldGZkY2g0dTJFbytRcEloWGVST1pFOUZwTENoRFdtVmlIQjJCTHY2?=
 =?utf-8?B?V0NjT2hhVHBMNDdMWmxaK3N3ZnU2U3YzRndpNHpGVW1rUGMzNmREZEcwdnc2?=
 =?utf-8?B?M01ZV1B2SWVXV1hZSnFJeE1MTys3RVJBSVI5UkVnVzYxMFhsWDJKTjVTOGpz?=
 =?utf-8?B?NzYvWmRlY2xBaXBUMC9Ma0d4VVFXelZuMjhsSXBpWW0vNnlJaHA3dFhsQkxL?=
 =?utf-8?B?UER0MkJLQ1pBcXhiY1BWdE5jamtxWG5jK0wwVTJSQzAwc3hPRlZnYlMzN21E?=
 =?utf-8?B?M2IydHJaWnk5Y3hiWjRTZythSm1IbHhrTDJQaWIyUFl6cWpPVmZpOGtZQ01n?=
 =?utf-8?B?Z0gzNWhZK1BJc1NMK2h4d3h2bm5zdDFwWVBkY3hjcWoxN1NKdTc4WGEvb3pp?=
 =?utf-8?B?TkI1MEN6RWN2blZ6bWVmNUgwWENOU2o3SUZhREQ0NE9wVkFaY3ROdGI2UTE3?=
 =?utf-8?B?elpmWnhuVHdWcWhQMnlveE94U1VwbXRwdjFVZVhtMUZBRStXdFpnYzlDRmxO?=
 =?utf-8?B?ZktqOG1JS1J0SjZtS2RlRGd1V1ovdmtzQXIrWjhQQWRCeHpqdFJBL3pjMG43?=
 =?utf-8?B?YzhPZmVIUzk2SVVxbVRrOFN5OEhIZUc4UUZydzRJaUd0RmxKV2RSS0lTQ1g4?=
 =?utf-8?B?RVNSdzJHejQ1TWJqRm04TlRVL1J6cWkvTG1neXlPbkpuN3VDY0E3T3A3YUR2?=
 =?utf-8?B?SEUxL1BwR2FFT2laMlBIMjdYT3hzMzlMUnByNVBaaVprOGpMZ2ZtUURrZ0Js?=
 =?utf-8?B?Y1B2b1dkZEg2TlEvWWExWVhVT3hSdzNJMmt1N2tUeW9XUkZWWkpMWHF6Uncr?=
 =?utf-8?B?TTBiR3FoYXFNSjRkdFN6a0dJRlQzQWxacWxGT0w0TnViNThkZ2REd29kVFpC?=
 =?utf-8?B?ZHhrSFJsUCtpdDNwTXhKQWhuS1EyUmxobTA5TDNuRUUzaDQySjB0ODFFaWZa?=
 =?utf-8?B?NEpTTjhJZFRLVjVpNFQyZVdwSGdaYUZLYXJNMFE5UGN1MTNCeUpOYWl2QWha?=
 =?utf-8?B?eittZEVJTHlKM1hvS3ptN2pMdE8yUGQ0K2JSY0EyNXVFN1FyZUxiM0VZaS8v?=
 =?utf-8?Q?s0EUeIGnCzx9mXdmu/HGQntnpiRRfg7d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDRCM2hBUDlxWkp6RWpKVENvNkJpMlpDK1dieGZqamlNU0VnSFVpYUErcXFT?=
 =?utf-8?B?TVlhNVc3TlhSQ3V5VXlpcUZRQTFRMmJuQ1ZXVDhnMmkvVllaNG9JbGN6VGlY?=
 =?utf-8?B?NGhxK3RzS2dhUktFVCtYWGRXWTZ6eE40U3BUR0ZaZmZreklBMDh4cDNoQjFV?=
 =?utf-8?B?QjREMmJxSFBnWG05VkxXU1ZlQUQ4QVpTMHJrblg2VTZPcExSSXF0VTRpM0NZ?=
 =?utf-8?B?bmR0TVNSSWhHc3Q5WmtCR1RxaHlIUVBuQ3VKOFNHbUEzT04wb25NNFhvSjJz?=
 =?utf-8?B?UGdxaEhNY2tyOEE2OWtWc1Q2N3hkbTdacSt3TGlDaG9DTDA4bzdtUVViRWZM?=
 =?utf-8?B?ankxTWVVT0lNSUovQUNEdktZZGY2Q1NpMkxDWE5MN0FvRnZIaFB1bFRuWEVh?=
 =?utf-8?B?R21ZWWtpSlRzS3k2aUFrQjhHQTU5TXNiYlNsZDB3Lzl5ZGdaNWw0WVhhVER2?=
 =?utf-8?B?QUIrQmxidE0za0R4Q1FURU5naW5OT0dPQ3kyaW5xZHNMNU1sUHJMVkNYdWZP?=
 =?utf-8?B?aWsrMGV4RXJDVWhneURSS0MwampqZWlBSXI1V1hUakg4cDJoUGVGZUdOWU5G?=
 =?utf-8?B?S3M2ZkdMckJZK2JvWEhZTlJqWW0xRytYdU5JNkRWV2FQTitVdG11M0ZiL0My?=
 =?utf-8?B?Z0RaZDVPVW1WMmRKMWExM3VEQXlkenhGNGJ1MW9LeDVjM2FOSnhaQlB5NFRl?=
 =?utf-8?B?TTRTbXdRMTBubGpMWHI3aW5aZ0FhRTRPOVhlZUhxNFRjOEhIaU5VOUdmYVlu?=
 =?utf-8?B?V1lqdC9FbTE2MWdBbHhsdUlMT0hEc2x0RDF2cHRFMmhWQVlxcWNWWE5YMWJ4?=
 =?utf-8?B?K1Y0OXdNREV3a2VLWnE5d1Z4d2wyRUd2RWN2cVNMcG1jVG5BOG9kcTkvZlFJ?=
 =?utf-8?B?SlEvYzJ6cEhhNzNGL2lBMkVsSmtyeGdkVjljdTRuTkNLaCtJbWtMTVZuZVd2?=
 =?utf-8?B?M0dHNm4yWlNZVHJWU1g3WmN0Ni9nclUwcTFqRngzSWZrN29sclhING4zM1Bz?=
 =?utf-8?B?WkRuaC9nVFBoV0xWWXJjZTVtRnRraDMvc3o5ekNRZUljaFhTOFROR2VrRUZh?=
 =?utf-8?B?YlB0c2FWTGFGVmpFb3VxVkgybVByTUF1WWZJKzRqcTVSa1Ira2FzQ2F6RXlH?=
 =?utf-8?B?UTRSVStUbHB4b1RIMTRpR2tma2dmenlNTlVCZHAzNWZ0ZEhTWndjMDBXR3Bk?=
 =?utf-8?B?NlNjSnhZZXpRWEtTWFpKcHROU05EMkpwRmVlUngyRWU1a3JoWmRCYVV3QWdW?=
 =?utf-8?B?SmFKVWtsQms0dkMyS2VmYUYxSmdSa3FBMXEzdHFYbnQzVmtLQ2UvZkgwSVdJ?=
 =?utf-8?B?OHVabytSYnRmSWpGY0ViY2plK1htY1hPVmNIcVg3RFdTMngycUJrM2xSSTZP?=
 =?utf-8?B?QnJVTjBEbjRCK3NmZG1hNUM2VEpQMTU5aUY1MDEydDhPZkR0ODkwRlVHSHVR?=
 =?utf-8?B?SFh4NlJWSFVsRlAzUWdHYkpoNHlLZ0gvV29HaW1iNTBhRDNUQmlyMGpSOXVv?=
 =?utf-8?B?cU1xbDNqWWZ0bEY1R29hZ3ZMVGN5dHNySVo5NEhCRjJYQkk2NzZ1L0M0dDhO?=
 =?utf-8?B?VjVuT3JlZGNLTXdwQU53SjFycS9CY3ZCdlA0dE5DZGJzTGM3OGtZa2NVNU9W?=
 =?utf-8?B?dW9QbVloZE5XblpZZGF3VEtrY2NZY1JaR1RsZDV4bHkzcGE4V3FmMm9sWDRJ?=
 =?utf-8?B?RnVONmNESythd3M4M3NVYlFHaEFqTWs1czNmTHlab1JlUXk4bDJrN0h4emNJ?=
 =?utf-8?B?SEdxbm5uRUpGRlN3Ky93b0kyWHJlQnR5cXo2QjBxYnhzT3d1cm5jTU9LQ05m?=
 =?utf-8?B?V09UQnZFT25zNWEyNWs5QzlsZkpTdGVOK2F2SlZQa3FHNlF3MGc0a21IZ3lD?=
 =?utf-8?B?YU1aTVQyaE9IRGdWR3hReEhSVk9ZSHlVVnpkQXoxdURTemc2Z015L1Mzbk1L?=
 =?utf-8?B?VW16YVdpbnUyUU8ydTNxWjBORjBpNFpsMVdOMWcxVXNsWXUwdjVGdGw5WFZO?=
 =?utf-8?B?R2RTVHJUUkNscmtIcHVzVXlmNGpjcjlHUzVWNFpoZXBxclhieEpsQWx3eDZO?=
 =?utf-8?B?OHVacDFxOUFLNm5JL1F0dUJYa0gwWk1yTW9zemJSOHIzN3lOSEg2dU9ReEpq?=
 =?utf-8?B?cEZ0ZHlFSUhzT1p5NWZSd0hsclNQNVh6elZUVk1ZRnNNWVBuejltYjE0RDdn?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec4cc7a-2f81-4887-8d9e-08de1b938df1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 11:16:09.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eFA+yaYsyPBB5o/9E0oC0LMcNJN4GVa/480XCvgbGtsMGFBBtoOp1DW5G/bGChXLvoMd/oA48JMLKTZXhPSOh4DOZvF7yIfcdl27GNTciE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Fri, Oct 31, 2025 at 05:31:21PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> > Add debugfs handlers for migration state and handle bitstream
> > .read()/.write() to convert from bitstream to/from migration data
> > packets.
> > As descriptor/trailer are handled at this layer - add handling for both
> > save and restore side.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 337 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
> >  6 files changed, 445 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > index 2371ca3e6b9a9..a3f50836adc81 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> > @@ -6,6 +6,45 @@
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_sriov_migration_data.h"
> > +#include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> > +}
> > +
> > +static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> > +}
> > +
> > +static struct xe_sriov_migration_data **
> > +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> > +}
> > +
> > +static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> > +}
> >  
> >  static bool data_needs_bo(struct xe_sriov_migration_data *data)
> >  {
> > @@ -42,6 +81,9 @@ struct xe_sriov_migration_data *xe_sriov_migration_data_alloc(struct xe_device *
> >   */
> >  void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
> >  {
> > +	if (IS_ERR_OR_NULL(data))
> > +		return;
> 
> nit: maybe to be always on the safe side, this chunk should be moved to 06/28 ?

Ok.

> 
> > +
> >  	if (data_needs_bo(data))
> >  		xe_bo_unpin_map_no_vm(data->bo);
> >  	else
> > @@ -124,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
> >  
> >  	return mig_data_init(data);
> >  }
> > +
> > +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
> > +				    char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +
> > +	if (!data->hdr_remaining)
> > +		return -EINVAL;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
> > +				char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
> > +					 unsigned int vfid, char __user *buf, size_t len)
> > +{
> > +	ssize_t copied = 0;
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_data_hdr_read(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_read(*data, buf, len);
> > +
> > +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> > +		xe_sriov_migration_data_free(*data);
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **data;
> > +
> > +	data = pf_pick_descriptor(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	data = pf_pick_pending(xe, vfid);
> > +	if (!*data)
> > +		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	data = pf_pick_trailer(xe, vfid);
> > +	if (*data)
> > +		return data;
> > +
> > +	return ERR_PTR(-ENODATA);
> > +}
> > +
> > +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> > +				       char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
> > +
> > +	if (IS_ERR(data))
> > +		return PTR_ERR(data);
> > +
> > +	return __vf_mig_data_read_single(data, vfid, buf, len);
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_read() - Read migration data from the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested read size from userspace
> > + *
> > + * Return: number of bytes that has been successfully read,
> > + *	   0 if no more migration data is available,
> > + *	   -errno on failure.
> > + */
> > +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +				     char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, consumed = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		while (consumed < len) {
> > +			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> > +			if (ret == -ENODATA)
> > +				break;
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			consumed += ret;
> > +			buf += ret;
> > +		}
> > +	}
> > +
> > +	return consumed;
> > +}
> > +
> > +static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
> > +				const char __user *buf, size_t len)
> > +{
> > +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> > +	int ret;
> > +
> > +	if (len > data->hdr_remaining)
> > +		len = data->hdr_remaining;
> > +
> > +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> > +		return -EFAULT;
> > +
> > +	data->hdr_remaining -= len;
> > +
> > +	if (!data->hdr_remaining) {
> > +		ret = xe_sriov_migration_data_init_from_hdr(data);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
> > +				 const char __user *buf, size_t len)
> > +{
> > +	if (len > data->remaining)
> > +		len = data->remaining;
> > +
> > +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> > +		return -EFAULT;
> > +
> > +	data->remaining -= len;
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> > +					const char __user *buf, size_t len)
> > +{
> > +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> > +	int ret;
> > +	ssize_t copied;
> > +
> > +	if (IS_ERR_OR_NULL(*data)) {
> > +		*data = xe_sriov_migration_data_alloc(xe);
> > +		if (!*data)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	if ((*data)->hdr_remaining)
> > +		copied = vf_mig_hdr_write(*data, buf, len);
> > +	else
> > +		copied = vf_mig_data_write(*data, buf, len);
> > +
> > +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> > +		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
> > +		if (ret) {
> > +			xe_sriov_migration_data_free(*data);
> > +			return ret;
> > +		}
> > +
> > +		*data = NULL;
> > +	}
> > +
> > +	return copied;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_write() - Write migration data to the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @buf: start address of userspace buffer
> > + * @len: requested write size from userspace
> > + *
> > + * Return: number of bytes that has been successfully written,
> > + *	   -errno on failure.
> > + */
> > +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +				      const char __user *buf, size_t len)
> > +{
> > +	ssize_t ret, produced = 0;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		while (produced < len) {
> > +			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			produced += ret;
> > +			buf += ret;
> > +		}
> > +	}
> > +
> > +	return produced;
> > +}
> > +
> > +#define MIGRATION_DESCRIPTOR_DWORDS 0
> > +static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
> > +					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
> > +	if (ret) {
> > +		xe_sriov_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*desc = data;
> > +
> > +	return 0;
> > +}
> > +
> > +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> > +
> > +	*data = NULL;
> > +}
> > +
> > +#define MIGRATION_TRAILER_SIZE 0
> > +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
> > +	struct xe_sriov_migration_data *data;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(xe);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> > +					   0, MIGRATION_TRAILER_SIZE);
> > +	if (ret) {
> > +		xe_sriov_migration_data_free(data);
> > +		return ret;
> > +	}
> > +
> > +	*trailer = data;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: 0 on success, -errno on failure.
> > + */
> > +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	int ret;
> > +
> > +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> > +		ret = pf_descriptor_init(xe, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = pf_trailer_init(xe, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		pf_pending_init(xe, vfid);
> > +	}
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > index 3958f58a170f5..7ec489c3f28d2 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> > @@ -26,5 +26,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
> >  int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> >  				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
> >  int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> > +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> > +				     char __user *buf, size_t len);
> > +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> > +				      const char __user *buf, size_t len);
> > +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > index 8d8a01faf5291..c2768848daba1 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_control.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_printk.h"
> >  
> > @@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
> >  	unsigned int id;
> >  	int ret;
> >  
> > +	ret = xe_sriov_migration_data_save_init(xe, vfid);
> > +	if (ret)
> > +		return ret;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
> >  		if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > index e0e6340c49106..a9a28aec22421 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > @@ -9,6 +9,7 @@
> >  #include "xe_device.h"
> >  #include "xe_device_types.h"
> >  #include "xe_pm.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_debugfs.h"
> > @@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
> >   *      /sys/kernel/debug/dri/BDF/
> >   *      ├── sriov
> >   *      │   ├── vf1
> > + *      │   │   ├── migration_data
> >   *      │   │   ├── pause
> >   *      │   │   ├── reset
> >   *      │   │   ├── resume
> > @@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> >  DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
> >  DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
> >  
> > +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> > +{
> > +	struct dentry *dent = file_dentry(file)->d_parent;
> > +	struct xe_device *xe = extract_xe(dent);
> > +	unsigned int vfid = extract_vfid(dent);
> > +
> > +	if (*pos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_migration_data_write(xe, vfid, buf, count);
> > +}
> > +
> > +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > +{
> > +	struct dentry *dent = file_dentry(file)->d_parent;
> > +	struct xe_device *xe = extract_xe(dent);
> > +	unsigned int vfid = extract_vfid(dent);
> > +
> > +	if (*ppos)
> > +		return -ESPIPE;
> > +
> > +	return xe_sriov_migration_data_read(xe, vfid, buf, count);
> > +}
> > +
> > +static const struct file_operations data_vf_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= simple_open,
> > +	.write		= data_write,
> > +	.read		= data_read,
> > +	.llseek		= default_llseek,
> > +};
> > +
> >  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  {
> >  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> > @@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> >  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> >  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> > +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> >  }
> >  
> >  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 7be9f026d80e8..8ea531d36f53b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -10,6 +10,7 @@
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_pm.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_printk.h"
> > @@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> >  }
> >  
> > +static void pf_migration_cleanup(void *arg)
> > +{
> > +	struct xe_sriov_pf_migration *migration = arg;
> > +
> > +	xe_sriov_migration_data_free(migration->pending);
> > +	xe_sriov_migration_data_free(migration->trailer);
> > +	xe_sriov_migration_data_free(migration->descriptor);
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
> >   * @xe: the &xe_device
> > @@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> >  	unsigned int n, totalvfs;
> > +	int err;
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > @@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  	for (n = 1; n <= totalvfs; n++) {
> >  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> >  
> > +		err = devm_mutex_init(xe->drm.dev, &migration->lock);
> 
> IIRC all software data allocations/inits we are doing as drmm
> only actions that interacts with or cleanups the hw (*) use devm

I'll use drmm for the mutex.

> 
> > +		if (err)
> > +			return err;
> > +
> >  		init_waitqueue_head(&migration->wq);
> > +
> > +		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);
> 
> (*) like here
> 
> > +		if (err)
> > +			return err;
> >  	}
> >  
> >  	return 0;
> > @@ -153,6 +172,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> >  	return data;
> >  }
> >  
> > +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> > +				struct xe_sriov_migration_data *data)
> > +{
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +
> > +	xe_sriov_migration_data_free(data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> > +			     struct xe_sriov_migration_data *data)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	if (data->tile != 0 || data->gt != 0)
> > +		return -EINVAL;
> > +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> > +		return -EINVAL;
> > +
> > +	xe_sriov_migration_data_free(data);
> > +
> > +	for_each_gt(gt, xe, gt_id)
> > +		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> >   * @xe: the &xe_device
> > @@ -172,6 +221,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
> > +		return pf_handle_descriptor(xe, vfid, data);
> > +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)
> > +		return pf_handle_trailer(xe, vfid, data);
> > +
> >  	gt = xe_device_get_gt(xe, data->gt);
> >  	if (!gt || data->tile != gt->tile->id) {
> >  		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 2a45ee4e3ece8..8468e5eeb6d66 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/mutex_types.h>
> >  #include <linux/wait.h>
> >  
> >  /**
> > @@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
> >  struct xe_sriov_pf_migration {
> >  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> >  	wait_queue_head_t wq;
> > +	/** @lock: Mutex protecting the migration data */
> > +	struct mutex lock;
> > +	/** @pending: currently processed data packet of VF resource */
> > +	struct xe_sriov_migration_data *pending;
> > +	/** @trailer: data packet used to indicate the end of stream */
> > +	struct xe_sriov_migration_data *trailer;
> > +	/** @descriptor: data packet containing the metadata describing the device */
> > +	struct xe_sriov_migration_data *descriptor;
> >  };
> >  
> >  #endif
> 
> with devm/drmm clarified,
> 
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
