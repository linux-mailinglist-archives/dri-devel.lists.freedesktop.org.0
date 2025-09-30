Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A48BAE4C3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82F310E625;
	Tue, 30 Sep 2025 18:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlFT6ODj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA7B10E00B;
 Tue, 30 Sep 2025 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256723; x=1790792723;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RKEYNEqGIu3rfa8HCkE1FaxTkXLK62t7Qr3TORnavHE=;
 b=HlFT6ODjdikCetI9wpf07BgyPvHQBJPwOWAPT3qRRCQfN/YBIDtAptJn
 codUmeDkUEqZjs0mbnushtVWM8N45iECHsyTdBHZuAAmWMu2mwclFp2Ss
 5UXF2xdJi420F2PGvF8XAMd1DqxomCAJYQNSIb48yVvuFwcigVxYlcHaN
 1vr9cvdfl+POA9U9pMYEqePgxJTf5s1i6NHfbC/DsLaffH4y+bKTKsbf0
 cz2Aau6bfeOr3/TLBAcG1xp30n5GlbHEBK+qBhZzewT73/ak4y4vuiaXH
 Md3ZppZemycp+WAv3I73uNjxmXnpDw243HIBCi2licvoWv8bZc2kvbq2H A==;
X-CSE-ConnectionGUID: 3xiUs2gWR+uNnz0/XJA/tQ==
X-CSE-MsgGUID: guSFl82ASYOSCIt2pRiNgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61634164"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61634164"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:22 -0700
X-CSE-ConnectionGUID: 873l1TUESRytB945bzbSfA==
X-CSE-MsgGUID: 3vnzXzHdQIiN9Q2gK+tlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177863725"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAtamcGWrLUDIs/R0V+yJf7AKoD4oE5K7r/TOO5lXzOHWJ8AyEQnf4XSlCONTDQHRZ1456g2xJIRLRvbpeHvcXQ4pKv+0Etf2nYlp6aqEe+kd7UzU7XVNs/H9cihplXRy9Aw4QH2TJPLOkkrdqxR4ca6ZsVx1Zbt0zEQ+lWQXto/8hUtbRLZzT9nJ3LhJ+zFxPnm8F1L+jr1grWOJvj0M1jztOb92z2vEX41OJP6nI7tv7wXxcICIZalRFiXGHoA+42h9TkUHN7P151kCUh8ft7EYJF40CNV3+PKBsxPJ26+rh0hiKzs3U/CPNhKVgcRFkBat5sW2Qq+Z6Nh/EGH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJmFlNb+cpOs66YsoX/MG2NTRP4yZLS3228qx0rTzdY=;
 b=D3Cfjzw0GHsmTfTNadE99+FkGZFa3DXDEJ7MaVYWdHMWfTsCS6XO6qk4jMDTjQoagnxHcOyNYixjj4GMcEo/T4pSGHrKm1SHWigQbddu4+eU3zN0jUwIQXZ1fsd6wTOKhUadicc2KEkKyW6LNIISr++XktzCNoIT/Njx3AZWwX8BxIFDVvZYnYiM6O9h4XF9mlexePxWj0sfC/8PsIwUo9X5/Z87UXKt1o03facC5Zi1Cbcv50lCqMHNKKwtUQ46z1gybdNJUiMcAyHYCijjj7F0AOQDBZgOEhb7WpQsa+cj/KIsCOo1Oa67MypPrWZ25qSqGDLP+X3KW8fHK+kSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:12 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v6 0/6] drm/i915/dp: Work around a DSC pixel throughput issue
Date: Tue, 30 Sep 2025 21:24:44 +0300
Message-ID: <20250930182450.563016-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0021d4-8f01-49dc-c5ee-08de004eb1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1Rab0JqOHBBTVRnL1JGSHd3MGRFNjlqajZ3TmRoNjdOTVprdnp2Z01XWWVO?=
 =?utf-8?B?d0o4bU1BeERZbmdmTGNXeHNRTnpPRTRyN1pRMlpkQ3pVMWFIOFp4dFQ0T2xI?=
 =?utf-8?B?TTV1MW9rOWVUSzhuMDlidk9qOWkzMWdCbmVIanNESEJvUzZrQ0N2WlJtVGlt?=
 =?utf-8?B?eFJ3MmRueFZFRHBrUmhCVzJzQlVlNzNyS21IeTN2QmxVMG12LzIrWkNjZngv?=
 =?utf-8?B?LzZ5c2diM2pzM01PMEw1QWFUQzhVcU5WM3VrRUVjR3ErYk1XY0RqVGphSE9F?=
 =?utf-8?B?aWJ3YUhUdmNvOEZjY3lvU00yekRTcFJjQ3NNUWkzeE01eHBMekFOVVloUldH?=
 =?utf-8?B?MUI1eUJxTTJJU3ROQWpKUEJTaTlVRTlzZjkzWWxsNC9tRklsdlovaCsySzZW?=
 =?utf-8?B?V0xoZG5aUXpjd3JJK0g1cldDQnpzZjNOSFUxM0JrM0NGSGFGTGlPaWNKenNE?=
 =?utf-8?B?MFpsdVI4dEpINHA1bjlieHFzZW9wTkxpNXJ1Y1VmT2hRSEtLM2g1OUJaNUR2?=
 =?utf-8?B?V2x1a0EyRFdEOWdyQ3lUbDh0VFhkVWlhcGl0alNzZmNheVQ5UWxpUHVnYkZa?=
 =?utf-8?B?amc1YjNObkZ2Nkl2N25XNjV2N3JQdmhRZWNLUUI2SWJPRVMxVWh1LzBEYUEz?=
 =?utf-8?B?YUlkOHJXU1lyMW16KzZIdndkTlArNEx2bzhGSGt5ejVnNWtVQnhqODVGem9Z?=
 =?utf-8?B?alZuNXlzd1JDQXhIQldlUEd5aDVYbk9sRWs0Z05HRWM4eE0rWk1odlE0R3JD?=
 =?utf-8?B?YmlIa2U3eWtQQzkreUNwWUVkejZKVVREMTZYZDJ2aHB1SWV5YU1WQkF6bVox?=
 =?utf-8?B?K0loYlpNYTV3M3Z6UVhLZmVTcGZrSkE5Zmd3SEU3aE9mWXMvbVFHd1p1WTVj?=
 =?utf-8?B?RktPdkpoZ1RiZHJselJETksySE5QM0tzY2tHek82cUtza1hsOWMyb0l2Uitk?=
 =?utf-8?B?MUFOeVNpQkdxYnNwOHFCd3AvTVhrY0kvWkFSV2hXWkUrQnFpNHQ0dDRCa0JU?=
 =?utf-8?B?TFNyWHJvY0xNNnZ4NWZwcXlMNXhqRlJUM3pUeXozNldMM0FEMEd6UlVDb0tn?=
 =?utf-8?B?UTNXc1plcWZTK1BhdHZhbUhoK1BJZGhjd1JhSzRkMFg1ZE1sS244ZWdRWE1U?=
 =?utf-8?B?c2pqclloc0UvVVpoNjQ4ZTQwTGhHNzZGVEgwWDFCNGMwbjY4VEQ2c2Zoa1oz?=
 =?utf-8?B?enhqVG1kVWhZYnJPL08zNlRacHMwODR0b1ZaTk9CeDFFRGxtcFl0ZnNuNmJh?=
 =?utf-8?B?WGtlb2hYYS9JenkxSC9TNFpvWUNMZWg4anRSdHVQSE5Ha0Y4WG5zMGFqekgy?=
 =?utf-8?B?WjBTelN4bGVNVGF2b3lkMVc0eXY2VTE4Q05KUWVnSVlBQXhQWERGc05GWURq?=
 =?utf-8?B?SURvemd5a2RjcjF6dmlzblgzY1I5TFgyWC9vRXhnZUFWWmFxVGxtbDBPUHFH?=
 =?utf-8?B?VjBtcnNsaC82ZlRrZG0wOFpqNEZTMldDdGFDc2YzS2JWeXpoa3RkeWtjdHpu?=
 =?utf-8?B?REhuOUlLendJV1U2b3lNbDk2Nmg5UTcydEhCL0d2dWFTUFc0U0wxS3IvekYr?=
 =?utf-8?B?ZHNaOVJsUGo3SFA4bjN6WkFVU2NCK216UklOZHd2bFlPbXR2L3dWK2N2eFdj?=
 =?utf-8?B?TFMwVXhtM1o5eGtsOHVjWjVKbjU3Ky8yTEloVk4yVGgyTnZEOXg0SFczY3d5?=
 =?utf-8?B?cXFjRG85VWtTSStoQnV2NHZ4cEdQZlBLWGtRZW01YklQT0JmY0VnamllTThS?=
 =?utf-8?B?c0tLd3RUVVM1NGJrdld3dittdTkwMUsxRXFYZDYrOUYxcVNqcDRNbzdORzM1?=
 =?utf-8?B?R3dUbk9DdFUySm9BNHV3MlBiUGgwL2VtbDhHNXkycFhVU2RQVEw1eVhmOE51?=
 =?utf-8?B?YXpIV2NOYjhhMGJVQ2l4RUlqZzRYK1JDOEt1K3hTejhLajVLcmQwdzlocW5z?=
 =?utf-8?B?R1NNUVljMXVHSFcwOVhYY2FjcktCdmljVVBFYXBJTnZoSUVFejdFWXhiOHF4?=
 =?utf-8?B?N05QYlZsS0NBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dC9HK0d6TDM2UTNuMXRWOXJCRDZ1c1NZMVhXYStVUENuUGsrblVYdTJtRks4?=
 =?utf-8?B?UFFYZ1o2bDJHbUxMQjE0RU9rNytRMTV1cU1DMWJwZUhnTEtZZWVmOWhYQWpP?=
 =?utf-8?B?TDJkZ29nUkZJM3NxTnZObURvaUlPcUFJZVNKemk4RkEvdU9FQWFYVGcrdkRE?=
 =?utf-8?B?VnY1UWliVlVQbS9tOFRPSThmUGd4QXVZL1NTNmVENjhTdERsYjJHcXhKRlcw?=
 =?utf-8?B?Z24ySDVKKzNaOVBnZFQ3cHJjS1RyTTZUdmFrZ3JnMERRMFRhbGszRG52VnVQ?=
 =?utf-8?B?L1U4QjcvNjR1bXc0Sm5NT3Ezdm12c0hUQ2tNSnR5NEFuY3V5YTVkeDhnU05z?=
 =?utf-8?B?ZVRpdU91OXluY3pnSitYUE1hRk11Q2t6ZzA2NmJTV0MzMEhWbDFuaGtya0ww?=
 =?utf-8?B?VTQvYm4zNDFwcC9VbFBFR0hiWmNiYTVyK0NCUUkxMVRoZy9Ib0tEcFlrVk9y?=
 =?utf-8?B?enJBbnJOcm5RSDhJVWp5YVhjTDNwNUVmTS9URzRWT1JySjI3QU1SaXc2eXo5?=
 =?utf-8?B?ZTJVT1hEZm5OZUdjK3BCTXJ1OVVOTlhLS1dGdlJnYXFtbEVRWTNGOWZZa1JK?=
 =?utf-8?B?UTJ5SzVudWJYelYxc1N6SHBYa2NFTGVBaGE0ZDBjRWVKL0ZvR0szRXFhZ2tD?=
 =?utf-8?B?Q0hQc3p5K3VQRDg4R01TK25HLzRHY1VVWmN4VE4yOFI5K1NaRWR5QnY0MnAx?=
 =?utf-8?B?NGwvNkdtc2JYM3JkN3hGcnJGVDVBRkJVVGlsQU82MkRDc3B5U2dHRUlSdTRV?=
 =?utf-8?B?aVI1TUd4RnlsS0gydjZQNXhqWW9DQlluYmZVWGhtOFB0N1djNEh2a0U4QlFj?=
 =?utf-8?B?a3FPVm9YSWVRVE5URUlkdFhNbnM3dWxoclFIZS9GVTlIZUY0ejFOL3dOOTRN?=
 =?utf-8?B?ZTREbkNRZk9kRWZFY3FTdDhOTks1NmZPKzRqbjRsM3VuUi9iVE04UExZblh1?=
 =?utf-8?B?WVdCR1NDa0VTeDgvb2dWaDl5Z0lFejYxd1pPbEtFWElMV1duWms1WTFmNi9p?=
 =?utf-8?B?Q2hVNktBdnV1eEloK3ptUVk0WnBVRytBTDdaYStMMzJxUW9TajVuRVZ6c3dI?=
 =?utf-8?B?TDYyRFZDSGN5VTVmb3Vlb1VNanEwbmRpcG1sNGM4dkZvd1BDbjBEdnNFeXNZ?=
 =?utf-8?B?U1V1NTF0RnJ2Z2lUeFNzbGVJcXhUOXhQOHVQdmJSbGVzSUNwTUhoLzhVdTda?=
 =?utf-8?B?cHZON3M4aG5YVUdvLzYyU3dxQUlEUUF6VWxDZTJkaEhaVTdMaGNVbUtmZXRD?=
 =?utf-8?B?MlpsWTVBZm1aaXVPd1NFMDJpaS93WkRYQkF6Y0pQdlVYZWIvci9TRjhsd3U5?=
 =?utf-8?B?VTJ4YjY4eEZrL043cW5pbGEwQlJBN1ZiVlJHVnFyY1dPZmV1aGQ0aGJUWmxq?=
 =?utf-8?B?S1JiVjFYalM0amFEb2EyTVIwaHRjWUhCVTNCb3BBZlFLWFJOeDNjcjNoUkJU?=
 =?utf-8?B?VDhseUk5Y0Y5R1Q3aEVVTVZqUXByWEhIUDlMSkgzcWFIbXVjb0UwcXdRWFVy?=
 =?utf-8?B?OVlzcWJNN2xXb0QwOUt1T2lJL0ZDSHJLeDVlV2NvUUM0NkN3YUdqam42eWNl?=
 =?utf-8?B?S1BVRXk0RG9PVjA0Rmd2TkVZMmhmNzhyemI5NFRVY0ZpMktzenZoaVVIbHl3?=
 =?utf-8?B?WTVoR3ZpY3Q3bWc1Y2VvbFpiaFRoVkY4Y0p6NE94aGFYMkRsOUt1M04yUVpJ?=
 =?utf-8?B?cW0yQUFkNG14cDBYeXdkaTVLSzkvL1NFaExjVERLbW1pTWtJalREUWJ6VkRG?=
 =?utf-8?B?bU9NUU5zcEdvTlYyZWs5SFJ4aHJpMHY3YnI2dWVZaEZXV0dpQmRuVk1nTk5B?=
 =?utf-8?B?QlpUb3J3YzZ2SzhlVmk4cjZ5NFdadE1tSlo2YnRPcVlWdVFWQ2JIRkxtbmQ2?=
 =?utf-8?B?ZEVMR0s1RjgveStEOHBZWmxCWmVyY3puQWRvRHE2amRSZjVGOHRIcS9LeWtQ?=
 =?utf-8?B?SWNJY3FYbVR0ejI2VDlvMXMva1VDbk15cXpZWWZtS0hwcmZMRENDL3dYbEFr?=
 =?utf-8?B?UjZ2d1lReVk5VExxSGpNZDFyQStJNzV5akVNcW9ZOGhUWXdieU9sMGNOeUJT?=
 =?utf-8?B?V0VnWUR5ejduNDh2b25MSW9URkFUdlpBaW15WDdCbW5rTFFEbTdDWkRzU1dF?=
 =?utf-8?B?OWhXNUtCWUY1Nis3c3RDb0x4ZittTENYYlpuY21adHppQzc2cjJxTUN4d1Qx?=
 =?utf-8?Q?5WohvWcOuUEwG0adxVqHiSRUDaE+JJ2QcX80w518yPHc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0021d4-8f01-49dc-c5ee-08de004eb1bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:12.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpUVol4PXG7Ydi3dS54zQzmrhJ2uOdYOYcErC9/g2c4Li+OT6t12LJuThcWKH10HcUQxw+CZc6VwgVWdCJfD0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

This is v6 of [1], removing the unreachable default switch case in
drm_dp_dsc_sink_max_slice_throughput() and adding the R-b and T-b tags
from Ville and Swati.

Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org

[1] https://lore.kernel.org/all/20250926211236.474043-1-imre.deak@intel.com

Imre Deak (6):
  drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
  drm/dp: Add helpers to query the branch DSC max throughput/line-width
  drm/i915/dp: Calculate DSC slice count based on per-slice peak
    throughput
  drm/i915/dp: Pass DPCD device descriptor to
    intel_dp_get_dsc_sink_cap()
  drm/i915/dp: Verify branch devices' overall pixel throughput/line
    width
  drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk

 drivers/gpu/drm/display/drm_dp_helper.c       | 156 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   9 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 146 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
 include/drm/display/drm_dp.h                  |   3 +
 include/drm/display/drm_dp_helper.h           |  14 ++
 7 files changed, 328 insertions(+), 14 deletions(-)

-- 
2.49.1

