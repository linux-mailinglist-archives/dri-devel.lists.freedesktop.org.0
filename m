Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D150C5A07E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768AB10E939;
	Thu, 13 Nov 2025 20:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeRbZMHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB24410E939
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763067454; x=1794603454;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uplf0VEfGL591yGKppCMIAjUOLGjILXxre/FCty+5K8=;
 b=NeRbZMHjovse/9ybLd0aQR1ZPlLnNAw8x25RmpPAa5VvdIXc2Enk7ZAb
 xT8vhsjjM7DlMEe4uakyNhHZxfZUwnnIlyUaRCubBM6VBzu5/NG+ebaRy
 eXGJ/g+wFCZOTNUjD+br5HWDlt3YCFNj0ahxjbT1FNlHNGyJYCDHYu28G
 rx7znEaM+9B1GNV9ci4LoxZ1K6XKDUHYFTSMoDJ3LFvd3daoGuV+4vV/s
 u2S0zHE/mFGLbjJQ4m9paPdhyj2SbwRbQgL7ex3h46tAQmDWfeuUMlFOK
 fRSwviI8cFPpolrsUaUs+Ra4U2l73C8Yhh5isjMdtWSGHcVtgKn6nA0i6 Q==;
X-CSE-ConnectionGUID: Czdb31oPQXGF3rySDp2nBg==
X-CSE-MsgGUID: ro4dOwZnSnCLNCKRHCCT7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65318412"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="65318412"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:57:33 -0800
X-CSE-ConnectionGUID: ojSiQsoOQZWa+6rMzyM2bw==
X-CSE-MsgGUID: GYTUWcuuQm66AiFIV/O5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="190030260"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 12:57:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:57:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 12:57:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 12:57:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkXkVyQ7W7Mbt7AfnUSGTKRNtx5Qvp5+Nj69KMR9ZQzXmSHnyTT0/ovg7Qh5BYNcz0IUDcQSwzVDPIvQdm5gzd924OeeYJWJqVS0oW9KdI2xS9lkyTrU8UEwUvbJ9mi3dZGqkZZKeBmqYYdcTJ5UhPUqdtJZgp93C+qjTQnHouEeP+97TkSIetWvxMnpzPM3UBQhl33syf3JE/a50XBhnff9WPyyACpbDIkVQ9vd/Cy+xSIPr9SCi0v6zeOCLwYWjLbgNECRPKI1kV8Z+tVjj+Km1gj/bq9h8/0XIk+dXlp52GG+1kDQjWnuK6QQd4ZkhrfbDt4QZZINty7uSjVQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uplf0VEfGL591yGKppCMIAjUOLGjILXxre/FCty+5K8=;
 b=Q47HqQhp4U3rHaVFqSddBWmRTO0SbcKbsNSC9693/o4LaUOmPkNpwPh2N/Q+/ifbdI7z2nnDTyYLS0rSWx8mbKvjY0RlxxSylwWmfGr8zgc3LkYRjU2wnO3BPsgwwMfnq0mCHrj4lTj6PYGAaCTGs/fJhnd5lsw9i12om4zMjiNldRx0doIcxXQnDPgNERCZ5/DrhgM0sJeH1l303xNuuF0/QDBI8HMrffX4KCRz1wCFk9xYjuHoZSgiOKq2czDwLq5hjifNdDjFnElIqVYrfpsDQbt4uQckqCOPNwIwFOKFObycdRp3dR7LGj3RFC37pt15xYjg9icCUjXRAB4hrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by IA3PR11MB9254.namprd11.prod.outlook.com (2603:10b6:208:573::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:57:24 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9298.012; Thu, 13 Nov 2025
 20:57:24 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Nirmoy Das <nirmoyd@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>
Subject: RE: [PATCH v6 1/3] drm/virtio: Freeze and restore hooks to support
 suspend and resume
Thread-Topic: [PATCH v6 1/3] drm/virtio: Freeze and restore hooks to support
 suspend and resume
Thread-Index: AQHcU8/X/R5fx7DF9Ua7wulWP5awYrTxGHYA
Date: Thu, 13 Nov 2025 20:57:24 +0000
Message-ID: <PH0PR11MB5112FC9F662A7C8283A9D202FACDA@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
 <20251027205323.491349-2-dongwon.kim@intel.com>
 <a8d33ecd-7be6-4ee1-8aa1-00edbcc739bf@nvidia.com>
In-Reply-To: <a8d33ecd-7be6-4ee1-8aa1-00edbcc739bf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|IA3PR11MB9254:EE_
x-ms-office365-filtering-correlation-id: 2fdc77b8-c98f-49f0-d508-08de22f73efa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dmJWU0c2dWpUcFFxdWdYbzVXMFlOQWI4TjRrWHNCL0I3cmZWQ2VyQnhjQmFa?=
 =?utf-8?B?d1BjeVpHMlZPSmJ2OWNybUdudzY5YlFtSzVBYWI3cmZmUUYwVTQzSjFua2lP?=
 =?utf-8?B?cXZuTU9HbUdRQ1BlWWhFUU9nY3VnZlJiOEZSSjhjbWc5NUpBN3dPcVZaRGdv?=
 =?utf-8?B?ODRlMXp0Zkh1RFh6ZkhsNk8xcFVqTHhmc0pyL0RXdUpzQTRYcWIrdjdSYng1?=
 =?utf-8?B?dzVOMUROdzFCRW55SWZtaTFOMDdEbWt4aDVSb25McVZ6dnhBQTJENzNqS2JJ?=
 =?utf-8?B?aUY0WGg1MWplVXFPTDdvaENNeE83NXJtWitNb05mYmtWcFlGelZPMEV4bXhn?=
 =?utf-8?B?MGNMNEZEb0JjWlJubHdydFFZUk5ZOXVzNm9SeGpsRDcydVNxQmxHL2svSFQ4?=
 =?utf-8?B?RDRzUUMvVXg3UW5KNENud3VtMU4xY200TmozS3k4NkhnK1lTMzVOUXRaUjFO?=
 =?utf-8?B?cGxJNGFCUm03L0lMY3E4a2xSZXBpbGtudy9KSUNUaVI1akcvTDdXY2xTbGp3?=
 =?utf-8?B?R0hlTitUb2FPWlhiSWVRSktFZnRSRzdKYzNZWUVDZ1VLNFoydVhCbnZLWUFE?=
 =?utf-8?B?ZWFWS3VSdVFJMXZoQ0hpd2NBcHBqYzdBK2hlOURXaG1aUGFjRWhMcWd2Um9a?=
 =?utf-8?B?RUlsN2lTR2hGTUU0aHYydFJsVXZCL3E5VDQ1Q1Ivd1BISlN4emxtWUo5Zkdl?=
 =?utf-8?B?M3hjTWZIbkVCd1JIeFhScHpIK2VpSUdhQnhJcWovaHI4ZjdNM3pOMS9kYUdv?=
 =?utf-8?B?aDNkZFdrWUNBRUZsYXZ0UWM5cUVzd0ZsVjNqL2xNWWlzM0d5ZzhNWVJqRHpV?=
 =?utf-8?B?KzEyVElSckxZSVFyYktuS2FrbEhHM3I5endmUmM1ME5BZm9YM0FOVkRzbTBJ?=
 =?utf-8?B?cC9XQkRvR0RXUTJlc3YycnRUYTlrbE0vT2w1MmQyRzJmQUJObjZkWHhmbFdY?=
 =?utf-8?B?blFmTzlWelVMUXVXSXVHeEFpOFR4dStPY01lNjdTU3B5Zll3NDcvdGNxVklS?=
 =?utf-8?B?UmVxOWJZaWxqVFdjekJYMlNUdi9VbUJ0ZHFWZG45aVA2QWtJMW1YNHpIcGZN?=
 =?utf-8?B?TkpIVGV1cnBDUzYzUUtjNHBPZ2NWZTQ1NzBUV3ByUjZxSnVGNzRQZGdRTjQw?=
 =?utf-8?B?MzVCS1RaTTlrMm12Y01EdUhSVHdwYkx5dVlpanRNWXVUdnV3cGkwWjl5OGxs?=
 =?utf-8?B?YUxMQkxlNkF5NjdQNHBDVjd2V1JXa084bjJoN01ObDBuajlqa01rdzRtQjVN?=
 =?utf-8?B?ams1S0x0NExzNWZTL1I3UWVyakk1NHg4WWEwZjBRZWJ6TGZpWlZZelFrQWYx?=
 =?utf-8?B?T1U2TjlhL3JERTBpeVhhV0s4cDBHTXdnb2VnMStqa0U1RlY1Vm51aitQUnNk?=
 =?utf-8?B?RTBIRXJRaUxnRGFFNkxkd3UrSUVjUzl1V3ZLS0J2NXBtT2ZyK3FkTjlWekIz?=
 =?utf-8?B?WjFpTUI2QzBySDZoeGVYbTdPWjFreGUzKy9ZSUJxZHFMM3dhSEF5Q2JWQ1Q2?=
 =?utf-8?B?MDhhVjYwTDQ1dSszU2RrSVNEaXhGc0krVytHOFc2YkJWckp0aWxaUVVPMTBG?=
 =?utf-8?B?SlhNT3NGVHJ1S2RRZE1Jc3BhUktFTHRtcDV6dkVRSVZVUTltbWQxVE0xNldB?=
 =?utf-8?B?MFliWllaOHkvYm1HdXVhd0dVRVNBeFpseFNjcGxqajdTWFZUZWl1N2ltb1pk?=
 =?utf-8?B?S25ndWducmRnKzJoZFBxTjdwODVCd2N5MHRzN3NWREFFWnRMTzEwR1plZ3hG?=
 =?utf-8?B?Yzd0YjhxREFnUzhiaElrbzk3RTN3bXlPcXZwN3RMeCszNU5SUjRFV1FnVEEy?=
 =?utf-8?B?R2hEbFVKQitmV3FHYW5XcVplcms2UGtYZ1F4aHdhNktrY1F0VU5pR3ErTG9V?=
 =?utf-8?B?b2dsV3pVbE50enJKeHV4SGJjWVdscnFuNUp3c08zeUhCbFZZY1lCclFSRjBH?=
 =?utf-8?B?dGcweTRlTkJYRy91K25kWWhNUG92aE1WR0pVU1NJbC81NUtIakw5UHFLSXY3?=
 =?utf-8?B?NEk1aXY0bHhuRDVNb2RDQjlVQTl6Zm9uY1Z1UWoxTE0zMkY0cTJlQ3BPMHNr?=
 =?utf-8?Q?CJOuNS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG9tSm9HRFdIUUFVLzlUd3cvNTRXS3lseFlXOUd1QTRrcnlJellVZ256QU1Y?=
 =?utf-8?B?TldWUXJ3a2lQUC9RQjlJVHdrUDJSejN6aXBaQUdvQUlDVnRXc3B2Y0NWcktk?=
 =?utf-8?B?Z3pTTWx3bVhqYU1UcE1WSDlTK1p4czdqQzRYbWlJaFB3TUVkRlFlM1A5UEZL?=
 =?utf-8?B?dzhabXZ2VklOMExlY0ZWZjZzWWdnNW54U05pQi9jRWUvWDZlSXc4RDZQMDl1?=
 =?utf-8?B?eGU3L0hMcEU4bG1CU003ZGMxY1NTVld1R3pFYU5iMTNvTmFDcW5tZC91UUpm?=
 =?utf-8?B?OVhrZml0aUZBeWIyelU1d0tiSmdDTFVld2NKY1ZqbHhmUG0rUU5TU2x6d0t5?=
 =?utf-8?B?MmRxVUE4K0JOWCtaMHJBTUV2T09icUhZb0FYQ0hyUVdqQkZGSXlzQXlmZWZj?=
 =?utf-8?B?MEgwOFMwYnJQTnlYcVNoT0dMWW50Z3F5YVBSSnh6c3FUUFN1VTczbzQzQkJT?=
 =?utf-8?B?YmhPcURLL21EYWdzamV3T0N6elA3Mk91dmdudXlPNjBxbTkwa3ZQQy9wUXRX?=
 =?utf-8?B?aksvSDJPRmg1OGpBMm1ud01VN3JML3ZjVU54ZVV3ZUdVUmtpUVc3NmJZUk94?=
 =?utf-8?B?NUtMdkVqRGgvVGNTS1NGNXUwTENmTE82Z1ltUmtxQTZQcnd5NmlCRDlhS2VP?=
 =?utf-8?B?SklyT3BtZGdkdURtbU1OUGNsYkJSMjJsT3FuWUxWR01lVldsVGhpRWgvWHVS?=
 =?utf-8?B?eWQzYlYxY01PcUh3L3Z3VlR4dnl3SVdteStpeGlIeUZUWUhySkpRdno3dGJr?=
 =?utf-8?B?Sy81OHBOc3NUa1F5V09tck1XYm5KL2ZBd2l2NWFleE5JbGRmL3ZETkYrNkNT?=
 =?utf-8?B?aytMWGk4VTdiRTI2RmJkamFDZHVkQlB0WXRzcnR0bEFoK0grVUNIWFgwNTFp?=
 =?utf-8?B?UUI4N1lJWnFZcmpXOGovdDVrUzdZOTFRY1VINTVjWFU0MUZlWU9XTklpZDE3?=
 =?utf-8?B?bmJXakxxeVZqajhkaGMxa3psMFpvQmx2V3IxVnZKU05ESmdvM0EzZGp6d0Vz?=
 =?utf-8?B?SlZPa2xxSjJhQUlVN2Z4eDNzVHdZc3d6Rm5naWxPL0NxSlRrMTZoSTJya3g4?=
 =?utf-8?B?UmM1SU44QjJFZytuUUk0OTJmT3VKVGUyT1Z4UGh0RWZJZlNxTDlSYjgwQVox?=
 =?utf-8?B?S3IwRHc5bkY2SUgyUVlPbDQvSGF2eUtpL2o3N2Q4bjBxaFhCNisyUjUxUFdz?=
 =?utf-8?B?N2RjZUJDUW9OWG8rMkxpQkNodzdOeG9ZOW9XU1ZLQStGOTB0QXhFZFZlYUhs?=
 =?utf-8?B?SXJLZEYrWmhiUk5HOHB6U2hQcEJHbGxZa0VrMjdZa1dySmd6Ny9taEdSczFG?=
 =?utf-8?B?aWFKQzl0SFpPeGQ3Y2RVWkFubWV2S0FNZENhUTA4czZ1amtwS1Y5ZG8yellq?=
 =?utf-8?B?bEo3Y0RGd1lIdHVCcFE2T3F3anYxbDdIQ1B0MjNXakN4QjRDamU1d0RDYXJH?=
 =?utf-8?B?SDIwbTRiWHJvZkxvamFEdHBJQnNCTi9EdGpoV0VJVkNpTTR3ckZKOVo0dmU1?=
 =?utf-8?B?bkZDRlZiV3gwWGJ4QkNVWEhqTFIwQlQvZENEVGZrS0Nwc3hISUNRSTFWay9k?=
 =?utf-8?B?V0srQWtHeThnNUhNQmp3TGtidVBwSkZxS3F3UVlKY21jQjBpbkxpTUFhaHdX?=
 =?utf-8?B?V1hDZzRmVEJuakFXYVRzaDNLOEU3alRDTWVUcllYTk1jQTNlcStjTFJ2clho?=
 =?utf-8?B?UURzQTdOek93NGIxV1VTdmlLcjhFbzc4RGI0ZmF1ZUlhNXh0bitaOFNiM1RX?=
 =?utf-8?B?d29NMDZvVmdQckxGL1BXLzEwZjkzNXFjS3JhNUhpQm41UTVBTk9SUm1ZL2pI?=
 =?utf-8?B?OHhCVW14Z2J1MDZyQThqRGtjOVhuQXFqU0QrcDRaaUJZRnNEcjRPd2pKNSto?=
 =?utf-8?B?c2JndGVkaTVIUHUwNzRtWUp3L2hKRUw4RTNHWmlVUEtXeXMzbkplMWE2bnNB?=
 =?utf-8?B?Q0xKeStYOU95SVRyWWR3d3JPQ01wYXRTMkNHK1hicmdhM2JvQ2VmSXk2bk9P?=
 =?utf-8?B?MmZ2ZW80U1lJTkhxMlFPVFhNUXhhWjFxQmh2ZEFpQjNHUWVocDFTRDZUNDJ3?=
 =?utf-8?B?dTd2ait3NW4xa1UwekQyZDJxa0lRZksrQm9aTEN5enRTTUNzZ2F0OGZ5OGZU?=
 =?utf-8?Q?0WyKAuYKZOZAoMUVIbMvNIH2z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdc77b8-c98f-49f0-d508-08de22f73efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 20:57:24.1741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0nPtU2IqKXr39E8Ur35oYlM69QXfR9mu/0YfOxsdkA1QcZ+0ECKN7PeMD8AJxCJ+AHGLOICohQKRPc2o9/Qpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9254
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

SGkgTmlybW95LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pcm1v
eSBEYXMgPG5pcm1veWRAbnZpZGlhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAx
MiwgMjAyNSA0OjI4IEFNDQo+IFRvOiBLaW0sIERvbmd3b24gPGRvbmd3b24ua2ltQGludGVsLmNv
bT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRtaXRyeS5vc2lwZW5r
b0Bjb2xsYWJvcmEuY29tOyBhaXJsaWVkQHJlZGhhdC5jb207IGtyYXhlbEByZWRoYXQuY29tDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS8zXSBkcm0vdmlydGlvOiBGcmVlemUgYW5kIHJlc3Rv
cmUgaG9va3MgdG8gc3VwcG9ydA0KPiBzdXNwZW5kIGFuZCByZXN1bWUNCj4gDQo+IA0KPiBPbiAy
Ny4xMC4yNSAyMTo1MywgZG9uZ3dvbi5raW1AaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IERv
bmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+DQo+ID4NCj4gPiB2aXJ0aW8gZGV2aWNl
IG5lZWRzIHRvIGRlbGV0ZSBiZWZvcmUgVk0gc3VzcGVuZCBoYXBwZW5zIHRoZW4NCj4gPiByZWlu
aXRpYWxpemUgYWxsIHZpcnRxdWV1ZXMgYWdhaW4gdXBvbiByZXN1bWUNCj4gPg0KPiA+IHYyOiAx
MG1zIHNsZWVwIHdhcyBhZGRlZCBpbiB2aXJ0Z3B1X2ZyZWV6ZSB0byBhdm9pZCB0aGUgc2l0dWF0
aW9uDQo+ID4gICAgICB0aGUgZHJpdmVyIGlzIGxvY2tlZCB1cCBkdXJpbmcgcmVzdW1wdGlvbi4N
Cj4gPg0KPiA+IHYzOiBQbGFpbiAxMG1zIGRlbGF5IHdhcyByZXBsYWNlZCB3aXRoIHdhaXQgY2Fs
bHMgd2hpY2ggd2FpdCB1bnRpbA0KPiA+ICAgICAgdGhlIHZpcnRpbyBxdWV1ZSBpcyBlbXB0eS4N
Cj4gPiAgICAgIChEbWl0cnkgT3NpcGVua28pDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+ID4gVGVzdGVkLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPiA+IENj
OiBWaXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogRG9uZ3dvbiBLaW0gPGRvbmd3b24ua2ltQGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyB8IDYwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuaCB8ICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyB8
IDIzICsrKysrKysrLS0tDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZHJ2LmMNCj4gPiBpbmRleCA3MWM2Y2NhZDRiOTkuLjY3Njg5M2U5MGE5ZiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMNCj4gPiBAQCAtMTYzLDYgKzE2Myw2MCBA
QCBzdGF0aWMgdW5zaWduZWQgaW50IGZlYXR1cmVzW10gPSB7DQo+ID4gICAJVklSVElPX0dQVV9G
X1JFU09VUkNFX0JMT0IsDQo+ID4gICAJVklSVElPX0dQVV9GX0NPTlRFWFRfSU5JVCwNCj4gPiAg
IH07DQo+ID4gKw0KPiA+ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+ID4gK3N0YXRpYyBpbnQg
dmlydGdwdV9mcmVlemUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpIHsNCj4gPiArCXN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSB2ZGV2LT5wcml2Ow0KPiA+ICsJc3RydWN0IHZpcnRpb19ncHVf
ZGV2aWNlICp2Z2RldiA9IGRldi0+ZGV2X3ByaXZhdGU7DQo+ID4gKwlpbnQgZXJyb3I7DQo+ID4g
Kw0KPiA+ICsJZXJyb3IgPSBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQoZGV2KTsNCj4g
PiArCWlmIChlcnJvcikgew0KPiA+ICsJCURSTV9FUlJPUigic3VzcGVuZCBlcnJvciAlZFxuIiwg
ZXJyb3IpOw0KPiA+ICsJCXJldHVybiBlcnJvcjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlmbHVz
aF93b3JrKCZ2Z2Rldi0+b2JqX2ZyZWVfd29yayk7DQo+ID4gKwlmbHVzaF93b3JrKCZ2Z2Rldi0+
Y3RybHEuZGVxdWV1ZV93b3JrKTsNCj4gPiArCWZsdXNoX3dvcmsoJnZnZGV2LT5jdXJzb3JxLmRl
cXVldWVfd29yayk7DQo+ID4gKwlmbHVzaF93b3JrKCZ2Z2Rldi0+Y29uZmlnX2NoYW5nZWRfd29y
ayk7DQo+ID4gKw0KPiA+ICsJd2FpdF9ldmVudCh2Z2Rldi0+Y3RybHEuYWNrX3F1ZXVlLA0KPiA+
ICsJCSAgIHZnZGV2LT5jdHJscS52cS0+bnVtX2ZyZWUgPT0gdmdkZXYtPmN0cmxxLnZxLT5udW1f
bWF4KTsNCj4gPiArDQo+ID4gKwl3YWl0X2V2ZW50KHZnZGV2LT5jdXJzb3JxLmFja19xdWV1ZSwN
Cj4gPiArCQkgICB2Z2Rldi0+Y3Vyc29ycS52cS0+bnVtX2ZyZWUgPT0gdmdkZXYtPmN1cnNvcnEu
dnEtDQo+ID5udW1fbWF4KTsNCj4gDQo+IFRoaXMgY2FuIHdhaXQgZm9yZXZlciwgYWRkIGEgdGlt
ZW91dCBoZXJlIHdpdGggd2FpdF9ldmVudF90aW1lb3V0KCkuDQoNClllYWgsIG1ha2VzIHNlbnNl
LiBJIHdpbGwgdXBkYXRlIGl0Lg0KDQo+IA0KPiANCj4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8g
bWUuDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gDQo+IE5pcm1veQ0KPiANCj4gPiArDQo+ID4gKwl2
ZGV2LT5jb25maWctPmRlbF92cXModmRldik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgdmlydGdwdV9yZXN0b3JlKHN0cnVjdCB2aXJ0aW9f
ZGV2aWNlICp2ZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gdmRldi0+cHJp
djsNCj4gPiArCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBkZXYtPmRldl9wcml2
YXRlOw0KPiA+ICsJaW50IGVycm9yOw0KPiA+ICsNCj4gPiArCWVycm9yID0gdmlydGlvX2dwdV9m
aW5kX3Zxcyh2Z2Rldik7DQo+ID4gKwlpZiAoZXJyb3IpIHsNCj4gPiArCQlEUk1fRVJST1IoImZh
aWxlZCB0byBmaW5kIHZpcnQgcXVldWVzXG4iKTsNCj4gPiArCQlyZXR1cm4gZXJyb3I7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJdmlydGlvX2RldmljZV9yZWFkeSh2ZGV2KTsNCj4gPiArDQo+ID4g
KwllcnJvciA9IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfcmVzdW1lKGRldik7DQo+ID4gKwlpZiAo
ZXJyb3IpIHsNCj4gPiArCQlEUk1fRVJST1IoInJlc3VtZSBlcnJvciAlZFxuIiwgZXJyb3IpOw0K
PiA+ICsJCXJldHVybiBlcnJvcjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4g
PiArfQ0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gICBzdGF0aWMgc3RydWN0IHZpcnRpb19kcml2
ZXIgdmlydGlvX2dwdV9kcml2ZXIgPSB7DQo+ID4gICAJLmZlYXR1cmVfdGFibGUgPSBmZWF0dXJl
cywNCj4gPiAgIAkuZmVhdHVyZV90YWJsZV9zaXplID0gQVJSQVlfU0laRShmZWF0dXJlcyksIEBA
IC0xNzEsNyArMjI1LDExIEBADQo+ID4gc3RhdGljIHN0cnVjdCB2aXJ0aW9fZHJpdmVyIHZpcnRp
b19ncHVfZHJpdmVyID0gew0KPiA+ICAgCS5wcm9iZSA9IHZpcnRpb19ncHVfcHJvYmUsDQo+ID4g
ICAJLnJlbW92ZSA9IHZpcnRpb19ncHVfcmVtb3ZlLA0KPiA+ICAgCS5zaHV0ZG93biA9IHZpcnRp
b19ncHVfc2h1dGRvd24sDQo+ID4gLQkuY29uZmlnX2NoYW5nZWQgPSB2aXJ0aW9fZ3B1X2NvbmZp
Z19jaGFuZ2VkDQo+ID4gKwkuY29uZmlnX2NoYW5nZWQgPSB2aXJ0aW9fZ3B1X2NvbmZpZ19jaGFu
Z2VkLCAjaWZkZWYNCj4gQ09ORklHX1BNX1NMRUVQDQo+ID4gKwkuZnJlZXplID0gdmlydGdwdV9m
cmVlemUsDQo+ID4gKwkucmVzdG9yZSA9IHZpcnRncHVfcmVzdG9yZSwNCj4gPiArI2VuZGlmDQo+
ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgaW50IF9faW5pdCB2aXJ0aW9fZ3B1X2RyaXZlcl9p
bml0KHZvaWQpIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9kcnYuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oDQo+ID4g
aW5kZXggZjE3NjYwYTcxYTNlLi4xMjc5Zjk5OGM4ZTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oDQo+ID4gQEAgLTMwMCw2ICszMDAsNyBAQCB2b2lkIHZpcnRp
b19ncHVfZGVpbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiA+ICAgdm9pZCB2aXJ0aW9f
Z3B1X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ID4gICBpbnQgdmlydGlvX2dw
dV9kcml2ZXJfb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUpOw0KPiA+ICAgdm9pZCB2aXJ0aW9fZ3B1X2RyaXZlcl9wb3N0Y2xvc2Uoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0DQo+ID4gZHJtX2ZpbGUgKmZpbGUpOw0KPiA+ICtpbnQgdmlydGlv
X2dwdV9maW5kX3ZxcyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2KTsNCj4gPg0KPiA+
ICAgLyogdmlydGdwdV9nZW0uYyAqLw0KPiA+ICAgaW50IHZpcnRpb19ncHVfZ2VtX29iamVjdF9v
cGVuKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBkaWZmDQo+ID4gLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9rbXMuYw0KPiA+IGluZGV4IDFjMTVjYmYzMjZiNy4uY2JlYmUxOWMzZmIzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYw0KPiA+IEBAIC0xMTQs
MTUgKzExNCwyOCBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2dldF9jYXBzZXRzKHN0cnVjdA0K
PiB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsDQo+ID4gICAJdmdkZXYtPm51bV9jYXBzZXRzID0g
bnVtX2NhcHNldHM7DQo+ID4gICB9DQo+ID4NCj4gPiAtaW50IHZpcnRpb19ncHVfaW5pdChzdHJ1
Y3QgdmlydGlvX2RldmljZSAqdmRldiwgc3RydWN0IGRybV9kZXZpY2UNCj4gPiAqZGV2KQ0KPiA+
ICtpbnQgdmlydGlvX2dwdV9maW5kX3ZxcyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2
KQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCB2aXJ0cXVldWVfaW5mbyB2cXNfaW5mb1tdID0gew0K
PiA+ICAgCQl7ICJjb250cm9sIiwgdmlydGlvX2dwdV9jdHJsX2FjayB9LA0KPiA+ICAgCQl7ICJj
dXJzb3IiLCB2aXJ0aW9fZ3B1X2N1cnNvcl9hY2sgfSwNCj4gPiAgIAl9Ow0KPiA+IC0Jc3RydWN0
IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldjsNCj4gPiAtCS8qIHRoaXMgd2lsbCBleHBhbmQgbGF0
ZXIgKi8NCj4gPiAgIAlzdHJ1Y3QgdmlydHF1ZXVlICp2cXNbMl07DQo+ID4gKwlpbnQgcmV0Ow0K
PiA+ICsNCj4gPiArCXJldCA9IHZpcnRpb19maW5kX3Zxcyh2Z2Rldi0+dmRldiwgMiwgdnFzLCB2
cXNfaW5mbywgTlVMTCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4g
Kw0KPiA+ICsJdmdkZXYtPmN0cmxxLnZxID0gdnFzWzBdOw0KPiA+ICsJdmdkZXYtPmN1cnNvcnEu
dnEgPSB2cXNbMV07DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4g
K2ludCB2aXJ0aW9fZ3B1X2luaXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHN0cnVjdCBk
cm1fZGV2aWNlDQo+ID4gKypkZXYpIHsNCj4gPiArCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXY7DQo+ID4gICAJdTMyIG51bV9zY2Fub3V0cywgbnVtX2NhcHNldHM7DQo+ID4gICAJaW50
IHJldCA9IDA7DQo+ID4NCj4gPiBAQCAtMjA2LDEzICsyMTksMTEgQEAgaW50IHZpcnRpb19ncHVf
aW5pdChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwNCj4gc3RydWN0IGRybV9kZXZpY2UgKmRl
dikNCj4gPiAgIAlEUk1fSU5GTygiZmVhdHVyZXM6ICVjY29udGV4dF9pbml0XG4iLA0KPiA+ICAg
CQkgdmdkZXYtPmhhc19jb250ZXh0X2luaXQgPyAnKycgOiAnLScpOw0KPiA+DQo+ID4gLQlyZXQg
PSB2aXJ0aW9fZmluZF92cXModmdkZXYtPnZkZXYsIDIsIHZxcywgdnFzX2luZm8sIE5VTEwpOw0K
PiA+ICsJcmV0ID0gdmlydGlvX2dwdV9maW5kX3Zxcyh2Z2Rldik7DQo+ID4gICAJaWYgKHJldCkg
ew0KPiA+ICAgCQlEUk1fRVJST1IoImZhaWxlZCB0byBmaW5kIHZpcnQgcXVldWVzXG4iKTsNCj4g
PiAgIAkJZ290byBlcnJfdnFzOw0KPiA+ICAgCX0NCj4gPiAtCXZnZGV2LT5jdHJscS52cSA9IHZx
c1swXTsNCj4gPiAtCXZnZGV2LT5jdXJzb3JxLnZxID0gdnFzWzFdOw0KPiA+ICAgCXJldCA9IHZp
cnRpb19ncHVfYWxsb2NfdmJ1ZnModmdkZXYpOw0KPiA+ICAgCWlmIChyZXQpIHsNCj4gPiAgIAkJ
RFJNX0VSUk9SKCJmYWlsZWQgdG8gYWxsb2MgdmJ1ZnNcbiIpOw0K
