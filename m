Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68EBA21326
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 21:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D16810E3E2;
	Tue, 28 Jan 2025 20:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfbeKZTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1438E10E3E2;
 Tue, 28 Jan 2025 20:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738096434; x=1769632434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l0r7u5ToR/V10OYWRmSZcgckahm75ZrMN8+YapEMoDw=;
 b=hfbeKZTL2u9G1coB0KnuSCbCuJynD/bUUVYWGI0UJbcMonoRzy3JZjB/
 /C9qZeLfHvRs9BJmwuysxVWQA6BJZrkq/DvBDqcVTUP3rH/pY89o97qLa
 MTpHptn/WAeo7BjJhMGRCyd5kSqshbtILPTb2gqZwtn4MaIPbhcawqW90
 AfO8oKkK+4ZqzuKMu2XbO+neU+ISsuwHz6Sg8/IOtEU2Tlp6JGr9qrKOz
 QeDSRAQezwfZOmFXf6W8wUjS194P5mbo/tAl/ABUDx9EMpxNJpAmybcyz
 PfD2XiMbpqgL2nU9D749WdfKigrCnk9VpK6j9kkRDx/3EMoUevsccBHHr A==;
X-CSE-ConnectionGUID: O/RW6wL+QMWF3N54fW8kZQ==
X-CSE-MsgGUID: AQ1zF/OvT2mpD+eW2W8aCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38298862"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38298862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 12:33:53 -0800
X-CSE-ConnectionGUID: lerNPjTCRNGfYJnj1cag0g==
X-CSE-MsgGUID: YXECawqLT9G3elcKxAOWHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109369685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 12:33:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 12:33:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 12:33:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 12:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzFr0J9y9bDzdg/WijlhXEN6Ahj2cY2A4QtpHq7z7ccKGYN7cc30/BG31wNTBdeu8JU6qV+twUNq/3GWT2qWvUoECuwdQWMu5hAZb2I6nv40eBk2bRbEysfE5bccjBRK5AkbxSG56q595ytzDM+yttrkGFbvlDZ9F/ZmkkeZK9YwrbeAPi2k1QStcmIMSAFQH2Ozfdr5kp0QaUKVig1lPFy9ZT8cQ5Pm+AA5c/og2pw2hnrJ1pKAryPn9hLJ6BdfBz1yV2gMad8n1LStV0QbGzaeDhoEMRwDPwxSXaCJPV7mDKmSFZh3klekBqtOVsJ3/+zTXzd2kKzQlgOCQOcTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0r7u5ToR/V10OYWRmSZcgckahm75ZrMN8+YapEMoDw=;
 b=oeqFsJUpqMpz1wy71UX/QFoTfcGR1WWkXbphQsI82CYYihmbhI/kbDWH7mzpcp9CaG7pwtsN6+FL7xfnaD4KqXiBDHd1odX056lXFr+RUrURCWi8vl3kM0Jyodr2pf+TS1uXJVHksaDcU/+IYBc9Q/BBCldE9DVEVPtcu41fuAWacalWo2gaU4eb0VydvGDbdOBvYpdi9HD/WQA/h+VZVQIoxEjDBA8itN1PiapH63bF3yd7kS9LtbSs6DD38AAnln0D1vRjM0HOrUsBz7bIgKOOBo2Qenyc5R6Ei66Nri3ulMU5f1w0cLgtwJAFeMVa/io2kClaaaCYtjZ1AMw58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 20:33:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 20:33:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
Thread-Topic: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
Thread-Index: AQHbbDgGDTaaPjTtmUG4RFIM4/GwLrMh3GCAgALMcQCACAaJAA==
Date: Tue, 28 Jan 2025 20:33:36 +0000
Message-ID: <63d88c33779555292f4f273e987ecf22e368f5e9.camel@intel.com>
References: <20250121190935.1984508-1-alan.previn.teres.alexis@intel.com>
 <Z5AqpemmzmBX2755@intel.com>
 <e638a05b471aef03e692d224f039446e757c6e55.camel@intel.com>
In-Reply-To: <e638a05b471aef03e692d224f039446e757c6e55.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL4PR11MB8848:EE_
x-ms-office365-filtering-correlation-id: b693a5f6-bb56-4c90-f97f-08dd3fdb0ac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MzZiajhrck9yTm5Bck1iVnJqbit4aXY0b3prOU5UY21UQmo2ZjFQVlhqdXhS?=
 =?utf-8?B?Mk5hMytVamR5VmtGOUk3UTdydW5CMGRaWXl5Q0NFZmRNWjg2ZnVlaFo3NXU5?=
 =?utf-8?B?anlnaENMc3VEOCtIYm51VWhHbGJwQ0kxZ1ZkdWJVMXdPNHlyTFFkcWVHbmlv?=
 =?utf-8?B?UG1SZ0E0SHFpRFFOdnVZam13dzhnRk1pMnYvNmRjbldaZWR2V1lxcEhTUzYr?=
 =?utf-8?B?T2JYWFN0TmJvTXpubWt5VDNRS1JjeW1lc0Q0bmxwYzRNRHpIWEdvSlVuaGN4?=
 =?utf-8?B?NXdOKzZRRVo5SWk0aERHVzRDeTFIMUlMcjFQZFZhT3d3Q0xoZlVPNER3UWZt?=
 =?utf-8?B?YWhwcy9WRE43dWw0OU9DMU11bWM0d3M2ak53RnU2cTEyclY2c3RyNnhOa1Ax?=
 =?utf-8?B?Qzc4Z2tMOTF2dmViNmpHbnZOWXZwNjNJcTZFaEpKSy83Sy9qdTF1NndPY24x?=
 =?utf-8?B?Y3pWOWNvVWpuVE10eUxTUkFNcThBM05GNVFud2JRTGpJbUZIVWpibmFscGxD?=
 =?utf-8?B?emtUY25Bbm5ESnR6TTRvM0E4SGZQOGhBNmdPTTBTRGJiS3J4VkVJQTdJajI5?=
 =?utf-8?B?VkpGYmtkOVpFTURnTWZDK0xoaFRtRVQxLzNUWUcyQldiSWR4bGliMEUyOXhh?=
 =?utf-8?B?UHQ0bzc3NS9ZM0tGTkRjNFVvaC9yVW5xVU9wdUpJTUFiZ0VFTm5GWnJQRWJk?=
 =?utf-8?B?WVVDQUtDczBCM1RaSTM0TStPK0Iya1hYUjQybEs3UGVSbmIreGtuRnlIS3NY?=
 =?utf-8?B?Q3pldU5YK0R2ajdLQURDU0twZkU5ajkweFF2V29ndnk5M0JpazgrUE96WXdi?=
 =?utf-8?B?bDRwbkt5aHJ2ZEhVS04yL3dlRC96ZFQxcnZJTDgwQStjYk03cElkdThsU3pn?=
 =?utf-8?B?Y3lvbWtKc3lhTTlXcFJ0NlM3UnVxeDVsVXZscXFadWhLRExaMHpsSFVSeXpO?=
 =?utf-8?B?eDRsbkkvbEVSbnRuWks3dEk5Z2RVL1dhanFGdlo1cnJaRGo3UHRIVVlCdDZ2?=
 =?utf-8?B?Y0pVNjZSWlZZL0dyUkwxVHFqRDQxcXB1azFyUWQvTk5ZdCtPRzF3MnpIMmZS?=
 =?utf-8?B?VlRVYW0zbUZYUm9YZGpyYlNvT2FEbzJGVkVNOUtOOTdocVoyK0YwWFdKWjlY?=
 =?utf-8?B?RUs3VU9aa1Q0QlMyM2plWGtkWDRIUEVtSUVoSjVQSlpPSHJnTVNsVnBlZmlB?=
 =?utf-8?B?MUFuRno4dEpLSUJ2U01LZnRubTFRaW9OQVNidjk4WVBSV0hLMDh5SE5SU0RB?=
 =?utf-8?B?S3U4YzcwSkxNbHU0LzhoSkxDZ2crSWNVZ0Y2OFFaN0RTQ3BnaldIa2tTcjlW?=
 =?utf-8?B?YTJZc3BDQjZ0QWIvNzVqL2VLbzVBMUpNeEJYNG55NzJRaXRoM1d3NitvZndr?=
 =?utf-8?B?Q2lGbW9pMGM5WVhDaTk0b0NTalM2ZzZpS0tMU0xIVWRUVFdDbUk2V01MMEFv?=
 =?utf-8?B?UG9KRTc5YkZUNDl1Z0pEbElHL3hhaVVVUXlsOFJSTUJSVWpmejlIcWtFWGhm?=
 =?utf-8?B?c2ZhbEdxOXpmZzJQeWtlc2J1RlptTXJPNHVZbWN3aDA5SW5Gd3RjVWE5ZUdX?=
 =?utf-8?B?U2JkYkx4dnBSem9pQ2NJNUg0bHpIbk5EbUZERzZYU1grZGoyKy9ZQmNBV0Zq?=
 =?utf-8?B?Tm9KS3Zhb3orejNWaXhwcXBuS2RkaFNzc09IWjZaWWpXMjBZSThHc3hDT3p4?=
 =?utf-8?B?eTZ4cjVvaGVLZTJCV1BFM2ZVeTRxN3pETGtUT0I3SzdkbzltWUxZdm9FRGxD?=
 =?utf-8?B?Y2tKNWp1MmhpSTZXcENpU2ZhWEdKM2VHWm42b3ZOSTM2NlJucjA3TkVOTHNC?=
 =?utf-8?B?UWgxeVhXbnY1bTBBR3d6ZG9VeU5FSUtmc3dwMEJxY0dhNEkxVVZkUFc1WTFh?=
 =?utf-8?Q?VXyWtt9GjHxXm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R083RzJSRFZwUW9qam9oWlhKa1hscjB4c2pVR0t4OUpHcUR6eVBNWFJibE80?=
 =?utf-8?B?ZmFVclBUbkNFSnRqd2c5V0x6SWhDNFlmRk42OGY0amNHY3RqRUNwSFBSaVRO?=
 =?utf-8?B?SSt6Wis2aVVGS1h1OHBwL0FYU3VJR1ptdjBLdXhhYUU1Q2VJb1JNSXAxdnFC?=
 =?utf-8?B?NG1tWVNMUld6TkZ2RXBhTHJ3dE5DMDYrWGx1MWN4eW5MS05icy9BUS9wQUh3?=
 =?utf-8?B?bFhoVFkrR3IzNTNCbmoyYXFibUJGR3lHN3dTbzlFUEtRakJrN3VBaWVNNUht?=
 =?utf-8?B?SFhha1g0ZXZpM0RHYkxtU1VmeU1jSk5iVHB4d1hYeFhrbHV5eVV4ZWo2S3RH?=
 =?utf-8?B?L0RCUHFsZUVVeWtiVVZLMFhCMmdrZWtKV0xISStsbTNmSVdmbUNmUmdla2hq?=
 =?utf-8?B?UzVWOVZtK21YN3B4T2Q5TGljcWx4bW93ZWZoTndLbUdHQlFrS1RwTkhoY3di?=
 =?utf-8?B?WEIrTm1VN1FrVWtVTm9IMEsxMmx6SzR0Q3k1TGN0Y1V6cWpONXVQOU5OUmwz?=
 =?utf-8?B?cmtaYmxROXhXb1pkUHZmQXE3Wnl0dFk4NU5MeS9XT25aWktEMFlJaGZES3Y3?=
 =?utf-8?B?S0tlcUY2dDdVUEJtS29OTm9OVW9ySkdQdCttWlk2VEdYYzFsd3RicWpZMWxE?=
 =?utf-8?B?bDRLdi8weFRBYmZSWlFqTlVkdjMwaUNOaWxOQzZnamE3Z0FTV2RKL1FuSTdO?=
 =?utf-8?B?dEMva3cwRWdEOS9KQjdQbFFqbG8xZjFRWm8vQlg0dkplL0VxeDgzR0JmRGpQ?=
 =?utf-8?B?TWY3dUgzVjZPeE5WRkhxYTdiRmJTajY0S09xdHJBTzVPTDBPUjNMUXhLa3BJ?=
 =?utf-8?B?cE9lNkdNUnhkUUhGd0sxckZ2Y0F5TXVXcGs3TGZLeENwY0Vzd1lzWHhLdUxw?=
 =?utf-8?B?by9laTIxdFF3V3pnWEZDeEhQWHNxNGFqVmxRaGsxMUkzVXpXc1ZIZ1hkV2lS?=
 =?utf-8?B?dXF5Um1zcSsxYUNNZkJ2UnRjaHZsNEhsNis0NjFXWXhydlFPdzRZeXMvTm9s?=
 =?utf-8?B?OUxRR3NTdU1BZGtlSDI4Q0xoZG81ZU9YZEtDQk03blVFSmRTVmdNMHdrNk1s?=
 =?utf-8?B?VWRhLzhJR2JyQWtia0N6TDRHNmMrWlBtbTdOMHk4Z25HUkVWTkxFU2RYcFVz?=
 =?utf-8?B?dU9wMm95MlFHOHRwL1E2ZS9aTWgrbDlpdmhDaFJhWC82MVZYd3pIbWxLV1FJ?=
 =?utf-8?B?dGZqRVpVYkY1SUFZQkdKOGFtVlR1MlBBSk5kK1N6MVBsMmQ0U0NSRVpjanM4?=
 =?utf-8?B?RlExNzNDM01XZHFqZjR4ZWJoTk9sR1pFd1pRRVN0YTBkNFlHbzExSG1kZmhr?=
 =?utf-8?B?b2RISGx6SUJYSUprbWFNOWNZZE5yZEdqaTZ1Lzk1MXZaZUU4aGFsZTNSL0Y3?=
 =?utf-8?B?OG9zcjQvTFVDaFFDZWxVTXZsMHZiODN6TnBHR0lHR09nOHBwWGI3V3JVODRt?=
 =?utf-8?B?YmRXTWt2NjZBWXpMQmVibGNGR1BXV2pHMGJvd1hIRTR0eVZtNmU0RGxtdmU5?=
 =?utf-8?B?NGU1RUl1a2NKNkJqSm9OUjBtcWdDckhkKzIvU1hGbm9Odm1uTzFzMEpEVW9u?=
 =?utf-8?B?ZmtXaG1JKzAya1lDL0p4cWI1ZkZHMWhFVS9aSi9ncjFkbzV2alhMejdiUlU2?=
 =?utf-8?B?eEpzUjFWTFJFblRkcnlUUVQzR2R4ZFh0RnQ4RmlFVDE0RzVZTE9SanlCMDhv?=
 =?utf-8?B?cXB1Qk1BQW1yRFU5UWFxcURHRUUwbUhXalcvUFpJdmd4Z3pQMEpFTk5nM1BL?=
 =?utf-8?B?U1AwR2tTUHFNV2taOFRYcFZNREhsNHQyQmM0ejJmWXhqVDdqQ2szUUpucEdZ?=
 =?utf-8?B?MURTL3pkMTVvMW5qOU9qTVJNZFNWb0h4djV1SmlraW9tRkJMcDRqSytXYzlj?=
 =?utf-8?B?ejVjazJnTDFpS0Q2b1ZzdUVmdU5mc01tY2EvTnZtVS9Rczl4bnVUekdsN2tZ?=
 =?utf-8?B?TXFoRmwvRjQ5R3lrOHFoTlNmVVFlWkFGV05SMHBpaGhKdXJtbmp5eHdHL3JY?=
 =?utf-8?B?MVZSeFEzY1BwUWZhSWtUVk9SQUN6RDBrWHdZdjNybVNKVDNCL1lkWi82MHo4?=
 =?utf-8?B?ZUtmUmIvN1h5QmFBVWpDZ0wzN2FuaGgrK2wrZVNxYklMRFhVT0xQM3lkMktz?=
 =?utf-8?B?dkdxRVB6bFJhcktwUUNEd0pFNkxRdll2eXdCN1V2RkhiWk1HUm81MUJyQUtG?=
 =?utf-8?Q?ncbtbTTiHXmDuYBiuvjabhY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <743FF608F502FE48925956952B36617E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b693a5f6-bb56-4c90-f97f-08dd3fdb0ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 20:33:36.7533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KdHR6emy62mroLm5cIGwPwR5y3yb6vyE0wYMJlvDc9h48LhGxIglJBTL+INwK/gKMeg/weLJligb1Z2i2D6K5bqKszAJCFSKeGqeiOnLaaNraMtHWPOKKORhbxvqYyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
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

VXBkYXRlOiBuZXcgVVJMIHdpdGggbmV4dCByZXYgdGhhdCBpbmNsdWRlcyB0aGUgc3BsaXQgLT4g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDQwNTAvDQpiYXNpY2Fs
bHkgdGhlIHNhbWUgc3F1YXNoIGJ1dCBpIGRlY2lkZWQgdG8gZHJvcCBzb21lIHRyaXZpYWwgdGhp
bmdzIGxpa2UgY29tbWVudHMgYW5kIG5hbWUgb2YgZnVuY3Rpb24vdmFyaWFibGVzLg0KDQouLi5h
bGFuDQoNCg0KT24gVGh1LCAyMDI1LTAxLTIzIGF0IDE4OjAxICswMDAwLCBUZXJlcyBBbGV4aXMs
IEFsYW4gUHJldmluIHdyb3RlOg0KPiBPbiBUdWUsIDIwMjUtMDEtMjEgYXQgMTg6MTUgLTA1MDAs
IFZpdmksIFJvZHJpZ28gd3JvdGU6DQo+ID4gT24gVHVlLCBKYW4gMjEsIDIwMjUgYXQgMTE6MDk6
MzRBTSAtMDgwMCwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gDQo+ID4gDQo+ID4gQSAnc2VyaWVz
JyBvZiAxIHBhdGNoIGlzIG5vdCBhIHNlcmllcy4gQ292ZXIgbGV0dGVyIGlzIG5vdCBuZWVkZWQu
DQo+ID4gDQo+ID4gSG93ZXZlciwgdGhpcyBwYXRjaCBpcyB0aGUgc2l6ZSBvZiBhIHNlcmllcyBh
bmQgaXQgc2hvdWxkIGJlDQo+ID4gc3BsaXQuIEknbSByZWFsbHkgc3VycHJpc2VkIHRoYXQgc29t
ZW9uZSB3ZW50IG92ZXIgYW5kDQo+ID4gKnJlYWxseSogcmV2aWV3ZWQgaXQuDQo+ID4gDQo+ID4g
RXZlbiB0aGUgc3ViamVjdCBvZiB0aGUgcGF0Y2ggZG9lc24ndCBtYWtlIGEgbG90IG9mIHNlbnNl
IHRvIG1lLg0KPiA+IEkgZG9uJ3QgZXZlbiBrbm93IHdoYXQgdG8gd3JpdGUgaW4gdGhlIHB1bGwt
cmVxdWVzdCB3aXRoIGEgcGF0Y2gNCj4gPiBsaWtlIHRoaXMuDQo+ID4gDQo+ID4gUGxlYXNlIGJy
ZWFrIHRoaXMgaW4gc21hbGwgcGF0Y2hlcy4NCj4gDQo+IEdvdCBpdCAtIHdpbGwgZG8uDQo+IA0K
PiAuLi5hbGFuDQoNCg==
