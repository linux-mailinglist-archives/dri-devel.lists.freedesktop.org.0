Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6839C2F587
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF43B10E519;
	Tue,  4 Nov 2025 05:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH8UQkVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6900C10E23C;
 Tue,  4 Nov 2025 05:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762233089; x=1793769089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IUCjRF0EQbpwmwyab9pf30RTCmqn84t0QZS4OMXhMdE=;
 b=CH8UQkVztr6N1X5gFwSSmydHRwU+ApWtdwLz2Ggqdg7TbAZ0kdT3Kxqs
 sqlJJ4boTLFmooWUDev7hfioNmY2ZexWDlzJKcXYg2F+ChkttgNa1nH7p
 XjqtYshzYLB9m6H20hluy3/EceyJmPk5E9I2OpuiwHzr4qvQ7cA/Lw1P7
 Zt1ahhUaHFNyLeNwvr/YVR6jzyiytfCwNRGwA+8Y0XFL7sWjy/lXjmXUj
 CjlFuf2lQimJ5PyfhlkFwli1Bnuu23QnMAet5laJR5L4Eb6qhP/Q3UJSZ
 lw6L2fzF34fY15iLhTO17bQOUH16Q7cQwo3m+OXjL3Hm1rRxrfnd1Zzyt Q==;
X-CSE-ConnectionGUID: uPbccvLcRP+CGk6UvzZalw==
X-CSE-MsgGUID: g9XBLNQzRhSvR+yG46cfyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64359525"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64359525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:11:29 -0800
X-CSE-ConnectionGUID: ZabPQJSJSAu0sChPKdEY5g==
X-CSE-MsgGUID: 3lJMChQxRze0Ar3j6vG8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186299719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:11:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:11:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 21:11:28 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:11:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS6cO7b8uEUtM47zIRJ4GrvOo0POZpCsz2dy1WEoh3nA5wG/rfu+duqWVeLl8V9dMk6Czq8jGgiGuDnwIqOTOj5iVoo4Vu/Cgj2JspHhqZobwOXxqoyclm566MIjrZOqSODujY28WOTrrCdw8hswYT9gJDv9lMX7wMNcV9pXts3g/L0p53MhryHRT+gEARHgy0t1PsImew2o5FS+TtNW5c08Faz7x5xuBBXNepT96oyJvkRxAK0sMLFRCgsoDbxAGs23UkIPrqtzi/A7aHnp82iT9mSrV9YCN7TiaQdDLfGcpKFu3XAgRmxqd8iEGyncA4AWw03pBzoZdtnZGqx2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUCjRF0EQbpwmwyab9pf30RTCmqn84t0QZS4OMXhMdE=;
 b=NNLWH8/Tc4QW0ziHJ37bnS9qJR/2m5hUt85Ccj3ijmOTlwRSOvEUrgKz85AoxD23xTZVo0TM6Dddr5oDGOPLcjaq2bnW1wx9jGJG25cLn89FiydriEBk9PHlGVyesfBd9fp4j8N6o+HM34FSvnY6CG9u/cypp+xBAAtnCg/NRfSNUTl1GnlFmArg2lG4asumLL5/OMzC/+sWwa/xZlDAkJMl9FidXEQ0jrVZid21O8HcAAAMYU6u3Dy24dT79VwPdIbRjLLNFbgDc7NoXYpDTvWXdMk8mV59h7Hy+xSboVgD0HKouK89y213N2ga7vklz1wu3nYoDzJuFLyWU+Vawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7537.namprd11.prod.outlook.com
 (2603:10b6:806:348::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 05:11:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 05:11:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
 <dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcN02vT85paMQB00aFK032WJKPYrThNn0AgADtA3A=
Date: Tue, 4 Nov 2025 05:11:25 +0000
Message-ID: <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com>
 <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
In-Reply-To: <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: f42e116e-5d5e-4678-1df1-08de1b609a57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UEFEbXRXYWxVdDhLdFNIcWhiODV2MnB2N1dQM1BKbHRzNjgwQnVBUTltWGpG?=
 =?utf-8?B?SFVpS2RoQytoS1ZNVmgvTW9uemsrZGhYSFRBanRHYlFQeXNFM0luM0V6aFhZ?=
 =?utf-8?B?TmtVazAwU293a2dBeXZqSnZlQ2lXRkJOeVZSeUdzZS9tbytUdWgvMHFybkQ1?=
 =?utf-8?B?OE9zTkZnbVJ6RkpuREczSE9nMzlKV25SYUZrMTFQMzZKamxXUlY0cWszTVZi?=
 =?utf-8?B?aVBORHd3Mnp1aWJ4SEsrZkVBRlU0RnYrVG1vQkRVUlVpS3NPRTBVdkFsTmFH?=
 =?utf-8?B?eU01bjFBbjRFbVFmUlZYTyttdU5yOGZiOG9WZld3dXJHUW5nT3hDbjVXUUR1?=
 =?utf-8?B?Y0YzZ1pIeTlXbTRkMnkxUHZmUTY4ZFYyT3BWT1RBV3VhMEI3M1VlSGIvS2gx?=
 =?utf-8?B?NUtOdFpJb2UrZTFpZnZ5YVdBSURoK2tGT0syRitIMnF5ME9QV1lrM2Vld0dK?=
 =?utf-8?B?ZEFyaks4b1N6V01ET3hJeU1NbHNxaWxwSi9oempyYW9leTA5V2pvdHJya3Vy?=
 =?utf-8?B?RTQzYlk3bnV2NXo4UVdNQnI5UG5ZNUtIeUZtMElpRjBkNXZzbHJGUW9qNlJm?=
 =?utf-8?B?L011eGtYV2lyTElDV0dPQ2NRbW9JeVR1SmcwdW8wc0NIQjBtQUJBK090dW51?=
 =?utf-8?B?dzAxdGNNc2NTdWI5cllqWmF6SjB1MjBsbk1NemVqMXVTUlUrSEtYWDhRQkJp?=
 =?utf-8?B?N09tSFR3eXd6UzhaemlYcTFIem81MFQra2cwakp3cUE5Qi84bXA3NTNuU3dN?=
 =?utf-8?B?T3hmWDVnSHBCdCtDYkZOaWJyaWRrVUs0QmxNZWltMVdKNGduZDNVbTBQakQ1?=
 =?utf-8?B?MVF4SUpMMGVERFE4WCtMRFR1TnlGb0lWanEvR0thdnNtM1Z1alNQWkp0T0FK?=
 =?utf-8?B?aDlmWGVOSGZkOW1ObVA3a0tGRjV5NE4zVEdrMEFyM3pJNndsV0duUlZGZkZC?=
 =?utf-8?B?Mk4wVG81YWpxenVva3VhRlVKU3YyeE9acjNRTktYV0p6dVVLaDg0eGtDcFR4?=
 =?utf-8?B?R3pwcnVnMjVoK0JSZ0RoMDZ6SXR0RVJLREk0bWhMYk9YbFo3UzQwTVpnSjhq?=
 =?utf-8?B?SjBiR01kNFh2RTVqaEZTVE5nazZwNnlMSDZkYVJHdnZvc1lQQmtEOFFnMkda?=
 =?utf-8?B?alRaSUNPZVBjT2FsOEdxam9mK3B4dGdzVHFEZ3ZsbGhYUzlhZXozakp0SnF6?=
 =?utf-8?B?VDJHbkEwUFNkSDVxa09FU1Fpb1ZIU25pVnZwRnphYWllcTZkaFg2RHo1M0Jt?=
 =?utf-8?B?WmQ5ejFmaHB5ZnZqVEFLZGZsTzBhU3JINmNNV0pxVjNCenZaM0l3dnlZcFNr?=
 =?utf-8?B?YTdtUUdVUjNUK0FmbitvZlFCdXNFQlR6QmRIRUxqK3JnT2k4dnVWMEoxY004?=
 =?utf-8?B?UHA3MVUrRXVWREZIMEFNWEhWQjFsUjROMzFncUdrdGpGbWc2K2pkbVVCUWFm?=
 =?utf-8?B?UmpQZmxmZE5HRTlSOXVobGpqdFhmT3B5MVBjNlNDU3BQcHU0Rkkvb3Z6cTEx?=
 =?utf-8?B?YThYMGlmSlk4VnVVdGxRMFk0R0M0WjFvY2p5WXRKN3pRSitMUjFwYjVONkRU?=
 =?utf-8?B?ZGN1bE9FSHk0cTJvdmd0d1drRlRaUkUyTlB3OUtZcjlIT2EvREp3VmlxN1Zw?=
 =?utf-8?B?THlRRWFmWTYxa0RnQUxkWXhLYXdNOEd5N0NNKzlMVGQ5ZXRVSFM2TkpTVG9D?=
 =?utf-8?B?V051SnRFK0MzU2NjSjROdGVWMkZtN084blFROGlOVlg2U2hiOHhIT053cUNm?=
 =?utf-8?B?REx3NFZFL0hVUGhHYmlpUXNuS0dnbnFTdStMZ1ROVkxCcUp4ZERhUGpRUFhV?=
 =?utf-8?B?T0JyaWtTY0dCd2hqQ011TS9GQUlLNXFFTFRvQzhDa1NkeFJXOThqNXBVQlIy?=
 =?utf-8?B?SFlReFZNZUpHandINXR2bW9oUmw2WU10dEN1MG9CL2VLVWhiU2VSMUNGZ1Vr?=
 =?utf-8?B?R2lMbG1pVldadGYyUlRzTzkwYU1LR2g2QmYxM0hXVDZPWU5iK0ZqWnkrZHpH?=
 =?utf-8?B?b0pnYTBmR0JBT3Z4M3N1cEJzU1AxSUhYSkc3bWVONmtkZ2h0OGVIUGdpdCtY?=
 =?utf-8?Q?0Zk48G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nkk5WHhvQmVHbCtPM1UwM0dVZTd1VGpNZGxoeXRQM0VWbXZlakJOZERXZVFr?=
 =?utf-8?B?ZTg2VmdHZ01YSStrNlZnNlFpa1l3ODl3T0FQSHV0SitvaE4rbTFFdUZrTFhp?=
 =?utf-8?B?dEZpUll2cTQxdGQ0a3ZiS0hjajJlRkk0VU5uV2pVME9QQkJKREl2TGhPRXpD?=
 =?utf-8?B?TlRySitXTEZRSkk0R2hJTm9QYTBmLzAyTWRZTXFRS3VSQWJLOHMxV20zMFhj?=
 =?utf-8?B?TXFNQk8zaFR1aWhxRWliOUlaaklSTDFrbmlBNG53VWo2ZHZTbDlRLzNsN2kr?=
 =?utf-8?B?NkNObUpidHplc1dTNXlTc00rLytHTi9hTStIZ0tQQjdGZHk2ekpUTGJiSERo?=
 =?utf-8?B?d1NqMU5SNldXRUdRUnpiWDN5bm1SOFhCWGxSa3ozak5pdUxKaVJFUHBQa2Ni?=
 =?utf-8?B?YlFoREoxNk5qaHppMksvZStCM3NHc1ZZMWF5ZDNzVStLM3QwbHloMzA4eEZj?=
 =?utf-8?B?Znc0UTRxcnVaa3hqQ0ZsbVZ4Y3B3MU9yd0s1aytPQkZrbVFqTzJld0ZDcDNF?=
 =?utf-8?B?b0ZtbzJqNVlXNU81NDVQcVJhY1RPSHladjQ1SE51NE01NnRSOHMzRHg2ekN0?=
 =?utf-8?B?UnB2d1ZRd0hNN2I4eHI3UlhMWTRtU1haK2JyOVBQTUMzNGdlaXF5dWt2cTF1?=
 =?utf-8?B?b3p3Y0pubmUvWFUxTHl3N211b3BNSnlOSVBNdzVlTk1HZ1pGT1JQUk1WaUNC?=
 =?utf-8?B?TUErTTdCLytuMzlUVkI3dEJUMjZoVzZNSHRod3c1bVFTem1IVHpMY1g1MDFs?=
 =?utf-8?B?Y280bFVLOU9qRWtGZG94R2VPTG8yVmFCeWJ0WGVybHhUNnQzNDlxV250cVNw?=
 =?utf-8?B?YnUybCtHMm1scWF5VVM5b1hhL0t3OHNRd29TN3oxeGJacS9GRVUxb3YzVkFY?=
 =?utf-8?B?WkZzOW8yVmNsL1l3Y21vSUlLTGtaQUtMaGxGT2M1QVI4S1dpVFgrMjFSQ3V5?=
 =?utf-8?B?QzVmajhncllxZnEwR0lvTWlsN09IZWVaUExTMFRkanlGNWI2b2VST0h3dmhG?=
 =?utf-8?B?YkpQV1EwWUFRbk9tWDFEVlN2MUJZa0Y0TDE0bjZqa3RWdDdCaHhqVTBiVjl6?=
 =?utf-8?B?UXZ5dDNTTVdSbzFCcFc3RTI3dTcwQ3BqdUQ5WE9DQWpOb3VJNlI1djE3Vytk?=
 =?utf-8?B?Sjc5T1lqRlVzb09OK3VoVkZCbW9kcVZsdTlhVVJTbkJEMkhJN1JlTEkrcDJW?=
 =?utf-8?B?Yysrc3BTb0xUb3pkbFNTTm1FNWFjaUh3aEZPdTFqb25pSDZpb08vOXRwMXdK?=
 =?utf-8?B?YllpME1UeTV3OXFwbm5ESGY0dmZIMVg5NGgvV2IwRk92bDJrMlFXdWdiRkxt?=
 =?utf-8?B?K2hIcFNwRnVxT1Y0bUp2OWdLeGQxVWFlQzlQeHpiZzNIUUovYnJMaTF2c3E1?=
 =?utf-8?B?Tnh4R0tuVG5CTXhmYW91MENnaWpOaEk5dEZaeUFROEQ5T2JsZ21sYnhwRGR2?=
 =?utf-8?B?ZXRNSklSZ0taMW5MWE81Z2FXOE94SS8yOVYybDRzUzhhc3dTa0ZqYnVOeTcw?=
 =?utf-8?B?dG0xQWJGY2dscW5FY2JHYXRqVE5hSGtnZm1Dc2dRelBlRC9zMDZZZWp5MWVt?=
 =?utf-8?B?SndmZ2c3dlV1eGRjRlFMU2VxK0VPa1U0Nm5IV3FvOGFEb0l6V2tSODV1cVR0?=
 =?utf-8?B?U3pMSW5kSVZ0VU83eXlPUzBtQWlpUm50d25CWFFZamU2MkkrQUR4YlA4eUFE?=
 =?utf-8?B?bGJSODFzZURHZ05jay9ZRG81VHVhaEcxdTJERmpxcjdkSkpZSGxSMGJvZmFw?=
 =?utf-8?B?M1l5SlRsTzlYVFRDb0NvM0tWQlYrZ05hRVhEUnA1c3puYW1pNHZVUUQrdXJY?=
 =?utf-8?B?N0thUzZ4QUZJeDZmNEsxbkhkb0ZPMHgxRUlZc2Z3dkcwUjlkRTk0Z0dOUG1R?=
 =?utf-8?B?ZEZIVlRwc1Ztb2YwUFAyc2RoZEJweCtzcnpxeStWSnZ3RHIwNzVzT3dpc204?=
 =?utf-8?B?dmJHOVZvOXU4MTNrVUlPTUpZclJNVXhzL2VFenA3REhHY01KRFlrSzhkTGt5?=
 =?utf-8?B?dmpYczdjeWp2aFhKaVZiRW02Y1JEeS9GNXIvc1ZRN0ZrMFRFQjdlTWlzZkhF?=
 =?utf-8?B?bDdpaDc1RWtFSm85QjhXN0lLVHArSnFZNU5OUU1jamxReEMyNzZSVmQwRHQw?=
 =?utf-8?Q?Dbk+fUQFNjPamVb6LTau7AY2W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42e116e-5d5e-4678-1df1-08de1b609a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 05:11:25.3023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNAx2mTzzf8FifaqiWqooX09S03agFveVL+R2JQ5cjVDg86WxhsM6AtiDxYkrVwzHgLd8la+BWF4VSzOhTrQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvN10gZHJtOiB3cml0ZWJhY2s6IFJlZmFjdG9yDQo+
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHN0cnVjdHVyZQ0KPiANCj4gT24gVHVlLCBPY3QgMDcs
IDIwMjUgYXQgMTE6MTU6MjNBTSArMDUzMCwgU3VyYWogS2FuZHBhbCB3cm90ZToNCj4gPiBTb21l
IGRyaXZlcnMgY2Fubm90IHdvcmsgd2l0aCB0aGUgY3VycmVudCBkZXNpZ24gd2hlcmUgdGhlIGNv
bm5lY3Rvcg0KPiA+IGlzIGVtYmVkZGVkIHdpdGhpbiB0aGUgZHJtX3dyaXRlYmFja19jb25uZWN0
b3Igc3VjaCBhcyBJbnRlbCBhbmQgc29tZQ0KPiA+IGRyaXZlcnMgdGhhdCBjYW4gZ2V0IGl0IHdv
cmtpbmcgZW5kIHVwIGFkZGluZyBhIGxvdCBvZiBjaGVja3MgYWxsDQo+ID4gYXJvdW5kIHRoZSBj
b2RlIHRvIGNoZWNrIGlmIGl0J3MgYSB3cml0ZWJhY2sgY29uZW5jdG9yIG9yIG5vdCwgdGhpcyBp
cw0KPiA+IGR1ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBpbmhlcml0YW5jZSBpbiBDLg0KPiA+IFRv
IHNvbHZlIHRoaXMgbW92ZSB0aGUgZHJtX3dyaXRlYmFja19jb25uZWN0b3Igd2l0aGluIHRoZQ0K
PiA+IGRybV9jb25uZWN0b3IgYW5kIHJlbW92ZSB0aGUgZHJtX2Nvbm5lY3RvciBiYXNlIHdoaWNo
IHdhcyBpbg0KPiA+IGRybV93cml0ZWJhY2tfY29ubmVjdG9yLiBNYWtlIHRoaXMgZHJtX3dyaXRl
YmFja19jb25uZWN0b3IgYSB1bmlvbg0KPiA+IHdpdGggaGRtaSBjb25uZWN0b3IgdG8gc2F2ZSBt
ZW1vcnkgYW5kIHNpbmNlIGEgY29ubmVjdG9yIGNhbiBuZXZlciBiZQ0KPiA+IGJvdGggd3JpdGVi
YWNrIGFuZCBoZG1pIGl0IHNob3VsZCBzZXJ2ZSB1cyB3ZWxsLg0KPiA+IERvIGFsbCBvdGhlciBy
ZXF1aXJlZCBtb2RpZmljYXRpb25zIHRoYXQgY29tZSB3aXRoIHRoZXNlIGNoYW5nZXMgYWxvbmcN
Cj4gPiB3aXRoIGFkZGl0aW9uIG9mIG5ldyBmdW5jdGlvbiB3aGljaCByZXR1cm5zIHRoZSBkcm1f
Y29ubmVjdG9yIHdoZW4NCj4gPiBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciBpcyBwcmVzZW50Lg0K
PiA+IE1vZGlmeSBkcml2ZXJzIHVzaW5nIHRoZSBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciB0byBh
bGxvdyB0aGVtIHRvIHVzZQ0KPiA+IHRoaXMgY29ubmVjdG9yIHdpdGhvdXQgYnJlYWtpbmcgdGhl
bS4NCj4gPiBUaGUgZHJpdmVycyBtb2RpZmllZCBoZXJlIGFyZSBhbWQsIGtvbWVkYSwgbWFsaSwg
dmM0LCB2a21zLCByY2FyX2R1LA0KPiA+IG1zbQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3Vy
YWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gVjEgLT4g
VjI6IFVzZSAmY29ubmVjdG9yLT53cml0ZWJhY2ssIG1ha2UgY29tbWl0IG1lc3NhZ2UgaW1wZXJh
dGl2ZQ0KPiA+IChEbWl0cnkpDQo+ID4gLS0tDQo+ID4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICA2ICstDQo+ID4gLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgIDIgKy0NCj4gPiAuLi4vZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fd2IuYyAgfCAgOCArLS0NCj4gPiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgNiArLQ0KPiA+ICAuLi4vZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgfCAgNiArLQ0KPiA+ICAuLi4vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgOCArLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9tYWxpZHBfY3J0Yy5jICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmggICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYyAgICAgICAgICAgICAgIHwgIDYgKy0NCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyAgICAgICAgICAgICAgIHwgIDggKy0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyAgICAgICAgICAgICB8ICAy
ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgICAgICAgICAgICAgICB8
IDM1ICsrKysrKy0tLS0NCj4gDQo+IEZvciB0aGUga29tZWRhIGFuZCBtYWxpZHAgZHJpdmVycywg
YXMgd2VsbCBhcyBmb3IgdGhlIGRybV93cml0ZWJhY2suYw0KPiBjaGFuZ2VzOg0KPiANCj4gUmV2
aWV3ZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPg0KPiANCj4gDQo+IFtz
bmlwXQ0KPiANCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiA+IGluZGV4IDhmMzRmNGI4MTgzZC4u
MWIwOTBlNmJkZGMxIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiA+IEBAIC0xODgyLDYg
KzE4ODIsNjEgQEAgc3RydWN0IGRybV9jb25uZWN0b3JfY2VjIHsNCj4gPiAgCXZvaWQgKmRhdGE7
DQo+ID4gIH07DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nv
bm5lY3RvciAtIERSTSB3cml0ZWJhY2sgY29ubmVjdG9yICAqLw0KPiA+ICtzdHJ1Y3QgZHJtX3dy
aXRlYmFja19jb25uZWN0b3Igew0KPiA+ICsJLyoqDQo+ID4gKwkgKiBAcGl4ZWxfZm9ybWF0c19i
bG9iX3B0cjoNCj4gPiArCSAqDQo+ID4gKwkgKiBEUk0gYmxvYiBwcm9wZXJ0eSBkYXRhIGZvciB0
aGUgcGl4ZWwgZm9ybWF0cyBsaXN0IG9uIHdyaXRlYmFjaw0KPiA+ICsJICogY29ubmVjdG9ycw0K
PiA+ICsJICogU2VlIGFsc28gZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCgpDQo+ID4gKwkg
Ki8NCj4gPiArCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqcGl4ZWxfZm9ybWF0c19ibG9iX3B0
cjsNCj4gPiArDQo+ID4gKwkvKiogQGpvYl9sb2NrOiBQcm90ZWN0cyBqb2JfcXVldWUgKi8NCj4g
PiArCXNwaW5sb2NrX3Qgam9iX2xvY2s7DQo+ID4gKw0KPiA+ICsJLyoqDQo+ID4gKwkgKiBAam9i
X3F1ZXVlOg0KPiA+ICsJICoNCj4gPiArCSAqIEhvbGRzIGEgbGlzdCBvZiBhIGNvbm5lY3Rvcidz
IHdyaXRlYmFjayBqb2JzOyB0aGUgbGFzdCBpdGVtIGlzIHRoZQ0KPiA+ICsJICogbW9zdCByZWNl
bnQuIFRoZSBmaXJzdCBpdGVtIG1heSBiZSBlaXRoZXIgd2FpdGluZyBmb3IgdGhlIGhhcmR3YXJl
DQo+ID4gKwkgKiB0byBiZWdpbiB3cml0aW5nLCBvciBjdXJyZW50bHkgYmVpbmcgd3JpdHRlbi4N
Cj4gPiArCSAqDQo+ID4gKwkgKiBTZWUgYWxzbzogZHJtX3dyaXRlYmFja19xdWV1ZV9qb2IoKSBh
bmQNCj4gPiArCSAqIGRybV93cml0ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oKQ0KPiA+ICsJICov
DQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGpvYl9xdWV1ZTsNCj4gPiArDQo+ID4gKwkvKioNCj4g
PiArCSAqIEBmZW5jZV9jb250ZXh0Og0KPiA+ICsJICoNCj4gPiArCSAqIHRpbWVsaW5lIGNvbnRl
eHQgdXNlZCBmb3IgZmVuY2Ugb3BlcmF0aW9ucy4NCj4gPiArCSAqLw0KPiA+ICsJdW5zaWduZWQg
aW50IGZlbmNlX2NvbnRleHQ7DQo+ID4gKwkvKioNCj4gPiArCSAqIEBmZW5jZV9sb2NrOg0KPiA+
ICsJICoNCj4gPiArCSAqIHNwaW5sb2NrIHRvIHByb3RlY3QgdGhlIGZlbmNlcyBpbiB0aGUgZmVu
Y2VfY29udGV4dC4NCj4gPiArCSAqLw0KPiA+ICsJc3BpbmxvY2tfdCBmZW5jZV9sb2NrOw0KPiA+
ICsJLyoqDQo+ID4gKwkgKiBAZmVuY2Vfc2Vxbm86DQo+ID4gKwkgKg0KPiA+ICsJICogU2Vxbm8g
dmFyaWFibGUgdXNlZCBhcyBtb25vdG9uaWMgY291bnRlciBmb3IgdGhlIGZlbmNlcw0KPiA+ICsJ
ICogY3JlYXRlZCBvbiB0aGUgY29ubmVjdG9yJ3MgdGltZWxpbmUuDQo+ID4gKwkgKi8NCj4gPiAr
CXVuc2lnbmVkIGxvbmcgZmVuY2Vfc2Vxbm87DQo+ID4gKwkvKioNCj4gPiArCSAqIEB0aW1lbGlu
ZV9uYW1lOg0KPiA+ICsJICoNCj4gPiArCSAqIFRoZSBuYW1lIG9mIHRoZSBjb25uZWN0b3IncyBm
ZW5jZSB0aW1lbGluZS4NCj4gPiArCSAqLw0KPiA+ICsJY2hhciB0aW1lbGluZV9uYW1lWzMyXTsN
Cj4gPiArfTsNCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAt
IGNlbnRyYWwgRFJNIGNvbm5lY3RvciBjb250cm9sIHN0cnVjdHVyZQ0KPiA+ICAgKg0KPiA+IEBA
IC0yMjkxLDEwICsyMzQ2LDE2IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsNCj4gPiAgCSAqLw0K
PiA+ICAJc3RydWN0IGxsaXN0X25vZGUgZnJlZV9ub2RlOw0KPiA+DQo+ID4gLQkvKioNCj4gPiAt
CSAqIEBoZG1pOiBIRE1JLXJlbGF0ZWQgdmFyaWFibGUgYW5kIHByb3BlcnRpZXMuDQo+ID4gLQkg
Ki8NCj4gPiAtCXN0cnVjdCBkcm1fY29ubmVjdG9yX2hkbWkgaGRtaTsNCj4gPiArCXVuaW9uIHsN
Cj4gDQo+IFRoaXMgaXMgYSBzdXJwcmlzaW5nIGNob2ljZS4gQmVmb3JlIHRoaXMgcGF0Y2ggb25l
IGhhZCB0byBoYXZlIGEgc2VwYXJhdGUNCj4gd3JpdGViYWNrIGNvbm5lY3RvciBiZXNpZGVzIHRo
ZSBIRE1JIGNvbm5lY3Rvci4gR29pbmcgZm9yd2FyZCBpdCBsb29rcyBsaWtlDQo+IHlvdSBzdGls
bCBuZWVkIHR3byBjb25uZWN0b3JzLCBvbmUgdGhhdCB1c2VzIHRoZSB3cml0ZWJhY2sgbWVtYmVy
IGFuZCBvbmUNCj4gdGhhdCB1c2VzIHRoZSBoZG1pIG9uZS4gSXMgdGhhdCBpbnRlbmRlZD8NCj4g
DQo+IEkgd2FzIGV4cGVjdGluZyB0aGF0IHlvdSdyZSBnb2luZyB0byBkZWNsYXJlIHRoZSB3cml0
ZWJhY2sgbWVtYmVyIG5leHQgdG8gdGhlDQo+IGhkbWksIHdpdGhvdXQgb3ZlcmxhcC4gSWYgeW91
IGRvIHRoYXQsIHRoZW4geW91IGFsc28gZG9uJ3QgbmVlZCB0byBtb3ZlIHRoZQ0KPiBzdHJ1Y3Qg
ZHJtX3dyaXRlYmFjayBkZWNsYXJhdGlvbiBmcm9tIHRoZSBoZWFkZXIgZmlsZSBhbmQgaXQgc2hv
dWxkIGJlIGVub3VnaA0KPiB0byBpbmNsdWRlIHRoZSBkcm1fd3JpdGViYWNrLmggZmlsZS4NCg0K
SGksDQpUaGFua3MgZm9yIHRoZSByZXZpZXcNClRoZSByZWFzb24gZm9yIHRoaXMgY2FtZSBmcm9t
IHRoZSBkaXNjdXNzaW9uIG9uIHByZXZpb3VzIHBhdGNoZXMgYW5kIHdhcyBzdWdnZXN0ZWQgYnkg
RG1pdHJ5Lg0KVGhlIGlkZWEgaXMgdGhhdCBhIGNvbm5lY3RvciBjYW4gbmV2ZXIgYmUgYm90aCBh
biBIRE1JIGFuZCB3cml0ZWJhY2sgY29ubmVjdG9yIGF0IHRoZSBzYW1lIHRpbWUNCkhlbmNlIHdl
IHNhdmUgc3BhY2UgaWYgd2UgcGFjayB0aGVtIHRvZ2V0aGVyLg0KDQpSZWdhcmRzLA0KU3VyYWog
S2FuZHBhbA0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IExpdml1DQo+IA0KPiA+ICsJCS8qKg0K
PiA+ICsJCSAqIEBoZG1pOiBIRE1JLXJlbGF0ZWQgdmFyaWFibGUgYW5kIHByb3BlcnRpZXMuDQo+
ID4gKwkJICovDQo+ID4gKwkJc3RydWN0IGRybV9jb25uZWN0b3JfaGRtaSBoZG1pOw0KPiA+ICsJ
CS8qKg0KPiA+ICsJCSAqIEB3cml0ZWJhY2s6IFdyaXRlYmFjayByZWxhdGVkIHZhbHJpYWJsZXMu
DQo+ID4gKwkJICovDQo+ID4gKwkJc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHdyaXRl
YmFjazsNCj4gPiArCX07DQo+ID4NCj4gPiAgCS8qKg0KPiA+ICAJICogQGhkbWlfYXVkaW86IEhE
TUkgY29kZWMgcHJvcGVydGllcyBhbmQgbm9uLURSTSBzdGF0ZS4NCj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oIGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5o
DQo+ID4gaW5kZXggOTU4NDY2YTA1ZTYwLi43MDIxNDEwOTk1MjAgMTAwNjQ0DQo+ID4gLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3dy
aXRlYmFjay5oDQo+ID4gQEAgLTE1LDY2ICsxNSw2IEBADQo+ID4gICNpbmNsdWRlIDxkcm0vZHJt
X2VuY29kZXIuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KPiA+DQo+ID4g
LS8qKg0KPiA+IC0gKiBzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgLSBEUk0gd3JpdGVi
YWNrIGNvbm5lY3Rvcg0KPiA+IC0gKi8NCj4gPiAtc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVj
dG9yIHsNCj4gPiAtCS8qKg0KPiA+IC0JICogQGJhc2U6IGJhc2UgZHJtX2Nvbm5lY3RvciBvYmpl
Y3QNCj4gPiAtCSAqLw0KPiA+IC0Jc3RydWN0IGRybV9jb25uZWN0b3IgYmFzZTsNCj4gPiAtDQo+
ID4gLQkvKioNCj4gPiAtCSAqIEBwaXhlbF9mb3JtYXRzX2Jsb2JfcHRyOg0KPiA+IC0JICoNCj4g
PiAtCSAqIERSTSBibG9iIHByb3BlcnR5IGRhdGEgZm9yIHRoZSBwaXhlbCBmb3JtYXRzIGxpc3Qg
b24gd3JpdGViYWNrDQo+ID4gLQkgKiBjb25uZWN0b3JzDQo+ID4gLQkgKiBTZWUgYWxzbyBkcm1f
d3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KCkNCj4gPiAtCSAqLw0KPiA+IC0Jc3RydWN0IGRybV9w
cm9wZXJ0eV9ibG9iICpwaXhlbF9mb3JtYXRzX2Jsb2JfcHRyOw0KPiA+IC0NCj4gPiAtCS8qKiBA
am9iX2xvY2s6IFByb3RlY3RzIGpvYl9xdWV1ZSAqLw0KPiA+IC0Jc3BpbmxvY2tfdCBqb2JfbG9j
azsNCj4gPiAtDQo+ID4gLQkvKioNCj4gPiAtCSAqIEBqb2JfcXVldWU6DQo+ID4gLQkgKg0KPiA+
IC0JICogSG9sZHMgYSBsaXN0IG9mIGEgY29ubmVjdG9yJ3Mgd3JpdGViYWNrIGpvYnM7IHRoZSBs
YXN0IGl0ZW0gaXMgdGhlDQo+ID4gLQkgKiBtb3N0IHJlY2VudC4gVGhlIGZpcnN0IGl0ZW0gbWF5
IGJlIGVpdGhlciB3YWl0aW5nIGZvciB0aGUgaGFyZHdhcmUNCj4gPiAtCSAqIHRvIGJlZ2luIHdy
aXRpbmcsIG9yIGN1cnJlbnRseSBiZWluZyB3cml0dGVuLg0KPiA+IC0JICoNCj4gPiAtCSAqIFNl
ZSBhbHNvOiBkcm1fd3JpdGViYWNrX3F1ZXVlX2pvYigpIGFuZA0KPiA+IC0JICogZHJtX3dyaXRl
YmFja19zaWduYWxfY29tcGxldGlvbigpDQo+ID4gLQkgKi8NCj4gPiAtCXN0cnVjdCBsaXN0X2hl
YWQgam9iX3F1ZXVlOw0KPiA+IC0NCj4gPiAtCS8qKg0KPiA+IC0JICogQGZlbmNlX2NvbnRleHQ6
DQo+ID4gLQkgKg0KPiA+IC0JICogdGltZWxpbmUgY29udGV4dCB1c2VkIGZvciBmZW5jZSBvcGVy
YXRpb25zLg0KPiA+IC0JICovDQo+ID4gLQl1bnNpZ25lZCBpbnQgZmVuY2VfY29udGV4dDsNCj4g
PiAtCS8qKg0KPiA+IC0JICogQGZlbmNlX2xvY2s6DQo+ID4gLQkgKg0KPiA+IC0JICogc3Bpbmxv
Y2sgdG8gcHJvdGVjdCB0aGUgZmVuY2VzIGluIHRoZSBmZW5jZV9jb250ZXh0Lg0KPiA+IC0JICov
DQo+ID4gLQlzcGlubG9ja190IGZlbmNlX2xvY2s7DQo+ID4gLQkvKioNCj4gPiAtCSAqIEBmZW5j
ZV9zZXFubzoNCj4gPiAtCSAqDQo+ID4gLQkgKiBTZXFubyB2YXJpYWJsZSB1c2VkIGFzIG1vbm90
b25pYyBjb3VudGVyIGZvciB0aGUgZmVuY2VzDQo+ID4gLQkgKiBjcmVhdGVkIG9uIHRoZSBjb25u
ZWN0b3IncyB0aW1lbGluZS4NCj4gPiAtCSAqLw0KPiA+IC0JdW5zaWduZWQgbG9uZyBmZW5jZV9z
ZXFubzsNCj4gPiAtCS8qKg0KPiA+IC0JICogQHRpbWVsaW5lX25hbWU6DQo+ID4gLQkgKg0KPiA+
IC0JICogVGhlIG5hbWUgb2YgdGhlIGNvbm5lY3RvcidzIGZlbmNlIHRpbWVsaW5lLg0KPiA+IC0J
ICovDQo+ID4gLQljaGFyIHRpbWVsaW5lX25hbWVbMzJdOw0KPiA+IC19Ow0KPiA+IC0NCj4gPiAg
LyoqDQo+ID4gICAqIHN0cnVjdCBkcm1fd3JpdGViYWNrX2pvYiAtIERSTSB3cml0ZWJhY2sgam9i
DQo+ID4gICAqLw0KPiA+IEBAIC0xMzEsMTAgKzcxLDEwIEBAIHN0cnVjdCBkcm1fd3JpdGViYWNr
X2pvYiB7DQo+ID4gIAl2b2lkICpwcml2Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gLXN0YXRpYyBpbmxp
bmUgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yICoNCj4gPiAtZHJtX2Nvbm5lY3Rvcl90
b193cml0ZWJhY2soc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gPiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqDQo+ID4gK2RybV93cml0ZWJhY2tfdG9fY29u
bmVjdG9yKHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiA+ICsqd2JfY29ubmVjdG9y
KQ0KPiA+ICB7DQo+ID4gLQlyZXR1cm4gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGRy
bV93cml0ZWJhY2tfY29ubmVjdG9yLA0KPiBiYXNlKTsNCj4gPiArCXJldHVybiBjb250YWluZXJf
b2Yod2JfY29ubmVjdG9yLCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvciwgd3JpdGViYWNrKTsNCj4gPiAg
fQ0KPiA+DQo+ID4gIGludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiANCj4gLS0NCj4gPT09PT09
PT09PT09PT09PT09PT0NCj4gfCBJIHdvdWxkIGxpa2UgdG8gfA0KPiB8IGZpeCB0aGUgd29ybGQs
ICB8DQo+IHwgYnV0IHRoZXkncmUgbm90IHwNCj4gfCBnaXZpbmcgbWUgdGhlICAgfA0KPiAgXCBz
b3VyY2UgY29kZSEgIC8NCj4gICAtLS0tLS0tLS0tLS0tLS0NCj4gICAgIMKvXF8o44OEKV8vwq8N
Cg==
