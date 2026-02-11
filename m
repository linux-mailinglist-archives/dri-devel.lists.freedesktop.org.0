Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MvOMH2GjGmfqAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:39:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229FC124D9A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F04310E055;
	Wed, 11 Feb 2026 13:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ6DYsVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4358510E055;
 Wed, 11 Feb 2026 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770817146; x=1802353146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JRSOn98zmfkYoJ8Gah5OLFkfch7IyuKpOo1RyXTXh70=;
 b=NZ6DYsVGsFGb+uVEaYUu0dmizt0rGoFe+q45yie9b9/F7PxiA7uv1mQa
 gugbXugPQ4vJouuJ3kN1iJ28KPYbQTwvZkZK8wm5tEWb4gmoOK5SrhtbV
 DY2dannLyrzTQa7CO8eaMETcFhiIhjxGMuzSILk8m9pIworPuDzM2JD7q
 qzjo35uZPWLTGXPVIPtdNFqVgGkD5lZphJqAW+fxfweOKN17lFssww3LQ
 YyJH1LTOhH6J4SfZtYQxejv+qwMr6uX+0fubARJbF13PCmBgfsBrCKQuZ
 CIMQbXqjcq31vZEE5d40nsqCOmirvwf7z6KABXyBGL/bM/xCtoZ02Xyd6 Q==;
X-CSE-ConnectionGUID: kaYVW2JiSdWy2AxmkFhczQ==
X-CSE-MsgGUID: yHFRokxOR6+NnVHvyDD8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71862418"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71862418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:39:05 -0800
X-CSE-ConnectionGUID: 6iJIef2wR1e9s/T4eukfVw==
X-CSE-MsgGUID: yyWBN+5lSDWtZq4/hfIgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211632239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:39:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 05:39:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 05:39:04 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 05:39:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emMfKFk9/ke2FYFGTK/LFCCPIvNaxyreUGn69NftKGyzsGPAJ+cL4MzufcA+688AWYWg7mM2Nwkxr3m8y5YYrlHdBUIPSN71P91lRoIH9M4wEwsdVZJqIpHIUYSfRIG49pWQC33chjgxtw3Cfc5rBXrDfYMUWwXBfKG3b8vRIkN59/9y7yM+cqgCmAzLNuiQLY+QknrOHzjaJl2sK/HwWLtni7utj4kJCXxvokXAaMdDVgAvNAfRQuLbyRok/fhlu4G8XSjq0+bNBAoOmLGAfjQ3/bXxVGAWeqVHb2sugOAm0Vx1CtnPu4KAauuDUVICpDeOtD7APQb+eZQBdjPPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1akOeVcGx9gFvl+kVjiI1qalgshhvijwfcqm4NI66g=;
 b=Eu2N8xrz7kypGVxADfJPD0Y5ZNNVXcEqMDG4sAjCPnrMjw7B38IXph15IO6v2TD/gTtOyiYEPGGdg2SFE8o9eUC10h1k9KJZeGgpY/wHbsVzuzzWCKskb0YqIXvxjIU1AqSt3mEsdHw6QDBtgtEwuSnU5NVJo5DUgoh8+0t5UurpRYl175ySK8jDB+PRiDjCwENPcsz50ytU++PlxMnJYomcraSzQ0a8nSmmJ/bJvEBIPa6iaGrW6gnLQtC+MT1oz6+KKDs3zULp2kekpsJBnuRxzImiegLTGrwMC1/s3+cAg+xkUvWYa5MjJh+yE/yGq0SMuMRxe60Rc60Pqaw+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 11 Feb
 2026 13:38:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 13:38:57 +0000
Message-ID: <bebe5a45-85b0-4124-bc8b-c94527d00663@intel.com>
Date: Wed, 11 Feb 2026 19:08:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
 <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
 <IA0PR11MB73070E28F07D2BA29C5D5473BA63A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <7c83329b-a730-4e3f-b6d1-c41db4df3bd9@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <7c83329b-a730-4e3f-b6d1-c41db4df3bd9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0117.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::9) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM6PR11MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e576d9f-bb66-4e4a-74e1-08de6972e797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFlyb0IwbkZzaWJaZm5MNitIQ2s4V0RaNGRLTTNlMXNZRVBpTDNQbU5ocjRJ?=
 =?utf-8?B?aXhWVEZvVXBOMnJpNkRHTHdQNmFQMDFqeXVnV3lRNXNHS0ZVODNYWkVQazRX?=
 =?utf-8?B?OWdTYWtxSWh3OWxxZi9Qa0ZuMmNhWlZNaGZuMzZWNkk5NkZDWTRxMWtwQXBm?=
 =?utf-8?B?dUFGcHlwOXBvdk9VQzlheUdPZnZkNE13RUZCZkkrVnBDR1A2MjdYRHc4QXBu?=
 =?utf-8?B?bnMxZ2R5RDh1SDg0MW8rc1hOa1MzTzVJOTJ4UjlLNmtUZ0QvYUt5OUxYemVk?=
 =?utf-8?B?eVBvanp6cUErakJsTmVoNmc2SU8ya0I3MXREeVp0VzBvYUhvc3o4MklrRmZM?=
 =?utf-8?B?eU5kdU53ZnE3MSt1K0xrenRRdlM5Vm5vL2ppSWUrSlR5S3VjS09SbHhlbHg4?=
 =?utf-8?B?eGZkbTBiNDFQMFA1SG5QYjJIQk5KTWZNZWRGaTNzWEhweUFJT2tyQTUvQURx?=
 =?utf-8?B?NU5GL0FuTzJ6VU5nWFF5VWNScnJLL1BoWGNXeEYzMVdrem4zbDZyTUhybFJ4?=
 =?utf-8?B?Y3ZPVW9OeW1NUk0ybDhDOGp0VUIxUURTVGFDaS9LRnY1U1RrLzhhdStLOUth?=
 =?utf-8?B?SGVJUlVqZVo4UFpmTFRQcU9vaEI0NnZISzNKMk1NVW4xV1o2MGNYZDlFVEJK?=
 =?utf-8?B?bmNiSEtwME85d2h0V1NSUHhjRzRRcm5SKzlYRWxUTHVTd3lDU2ZiVWQzNWNq?=
 =?utf-8?B?S2w1WEhwOXllb3o5K1hnMWlrSDJiaTc2Zk1ZMVlMcGlZcXR2N3RjUU9MMzNV?=
 =?utf-8?B?eEdxZ2xCWDdISkNnbDB2T2Vmd21PbWhieDlPZldweVRJOU0rSGFZVmJ2UFdQ?=
 =?utf-8?B?ODRldjBrdVJ5Y2d3dmc1Z2MwdUZ0czk3eFBuaXAxVmdURmk3Y1ZSRGYyY0lU?=
 =?utf-8?B?aUpDRmxFSWNldTU3K2xNZ29BRjB0TXZhRjkwS0hYUDIrZmF0SURkV0JIZ1pa?=
 =?utf-8?B?Z3NyZnlKa3Jxc2tpSStKOW52dVowVjVvdTRaTEFEN0crdUdvdDV2SGx6QWZk?=
 =?utf-8?B?NGRjVWNJUVlJQmErK0NVOVkzZlhhOHV2UkErdlpPZWVxMTh3MEJGUUwwam9q?=
 =?utf-8?B?L2ZvNHV4azA1blpGTWNYYytleldId0g2WW9zR0ZPU3BMN3ErYUg5UHNWd1dQ?=
 =?utf-8?B?Q0VscFEvdzhlMS8yK0pLOFhsZ1kzdEk5NnQ3dktzK2tISWREWFhqeG5zVFhE?=
 =?utf-8?B?dC9oR2VGVUZiNU9uLzNHTFZXdGpzZTZ3WVYwK25rdisxTk41SE14TUJQd20x?=
 =?utf-8?B?RllIMTJ3MW4vemJvK2pDYllBTzlDUVk4aCtTdnBMc0JMa1dRWStqckZQVTZH?=
 =?utf-8?B?Tit0ajM5L2hVYXV2QkJkN3lqSmYzQXZGZk1uNFhxUEkrZE1XOXN6SVdVd29p?=
 =?utf-8?B?UE5rUWJTRHhWQWJZbVpwT2ZWRDA4RVpnVVpxOFNoWHVSVjVlWXpIQ2JPamt4?=
 =?utf-8?B?SXVDNUo1UWtIa2p3QUJvRVhTaXc5QlZPa1A4clpBYmFHQ2hqblVwWUxSWUN6?=
 =?utf-8?B?UVlqQklEbTdZQ1U3SEpIY2VNTWNlRFdpb1ZlRGxtd0poN2JmSU9RMGl4ZnY4?=
 =?utf-8?B?QThwdVkxb2JMY25hcWZWK0ppR3dnenVhM2ZYa1o2dkZaclNnUW13Q29jSHpL?=
 =?utf-8?B?S045Nk85aFdjUmg3bDU0TlVkUnZjVmRIV1NMUlhjcktWTjM0NTg4RnFyTlMv?=
 =?utf-8?B?NHNZbUpaV2RpY1VZME5qb0FuTVNWYWhHNEpyZ0Y0TmNxS3VGQXN6ZEJVWlJt?=
 =?utf-8?B?QkU2dGpIQnl4TCtQZjVXK3R0RTRlMFlFbkpSYXlVQWFrZzU5VkpoVmNsVHNY?=
 =?utf-8?B?OTk5dTVDM1IvWW9yMkFYU0VUUG9oQjl0U0dDaDl5Q0VoWXkxalhDNCt6UjRL?=
 =?utf-8?B?am9RdjJZV2c5VVpVQW1qdGV3TWVYN1RMYzNXTVdFZUVWZkVuQmVCRW9BTmdr?=
 =?utf-8?B?Skx2cmJBV1Z4QXhYeVpOTWtwTUd6YmUrN2NkbUFYT1VHbTBrWS9PQmJEV2ln?=
 =?utf-8?B?VXJFMDd6ODJRa2FIR2dkb1JOQ0ptNHBjTnJVZGFEd1dyRWkzTi9BZGNiYitx?=
 =?utf-8?B?RXBJdDY0elpRTUVKK2g1ekVhdUpxQTFHeHd3UGh2amFqWW1YTzdEWVh5Q2ky?=
 =?utf-8?B?ZmhlbUpvUjBDWDhTdGVnc0k3dmNxMGNJcTZHYW5VVWE4NHdQQW5FSTBmNWwy?=
 =?utf-8?B?eHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm1jTHVRSjNYckFxR24zUnRldlJhajRkZ1VjRXV2dmp5OUNIbTNiZmFQTzZl?=
 =?utf-8?B?L3ArUENEVVM3T05vRVZMeStjWlRINWpMcEhtSlBzRnZEQy9MRGg5d2t2QVpu?=
 =?utf-8?B?aTk0RWhvYXZGL2NOK1pGcGsvQitMV05qMXJuRURBRXJtWmtqOEptMTRhaTlw?=
 =?utf-8?B?aWxDME1wODJaTDhhVDBsa2VRc3VkUnc3WkFOSEFXc3pLSTcwNWZ1cW9PajU5?=
 =?utf-8?B?UjA4RUZXaUlYYVNMSnZuRmR6VUFmdmR1dm5DTXVRUGFWOWtBVXV3UVQ3RDNo?=
 =?utf-8?B?Qzg2am8rZWErV0Y1aUJCWjU4dnlURmY5dEtmOFYrcjBPRDcvUFhLSWhYaUNF?=
 =?utf-8?B?SjdEaWp0dkU1SzVHZ2g5Q3hXVXlKYUZHV01sbnFieHh5VzNmYjYvUGUrYXJo?=
 =?utf-8?B?ODFtWjd2SVpmZ00rbHFmR2NYeEQwSjBIZlhmdjU4UVcrN3NYTnBlZEZwSnJ1?=
 =?utf-8?B?WitxOHRnZWF4aVR3VXNldzE5Sy9BTU1zOVUvWG9YbEthQ0dBclBRbTJQWi90?=
 =?utf-8?B?bjJxNGcyNzUzQ1pPVVErVmxVNm03UGRsbGhreHdjdGgraENjNjZsa0pncnpM?=
 =?utf-8?B?R3VUS016RFB1OWdQNEJMZ3AwL20xclNkR3ZSU0RPS1BtNzVPWG9JS2x2U0FB?=
 =?utf-8?B?TE1vYUNuVDA4TWlNaktoOUYxbExLc3VnUGdOTHl2K2ovWWV6SkNHbDQyaFA2?=
 =?utf-8?B?bVNyR1VNN2lvUTNFZ2l1QmEycENncDVhMmFmRFVnMVhkVkc5d3Vyd29DVllL?=
 =?utf-8?B?bE9TQVZMRG11aDRtSWIrbDBzQmJJSjBkaTd4cjNEYWJGaGJZd0JGWDRYNHNv?=
 =?utf-8?B?ZGhsUG1Dcm5McklqaUE4elNHd1pET1hvRTl4SUkvQXFBbFN5YVRNS2JqSmZj?=
 =?utf-8?B?VDF1WXZQNHR5ZEZWSzFRUFdIL1J5RzVhelpoQ0tQTUpmL3AxaVU0NDk2VGRK?=
 =?utf-8?B?MFN3MHVhLysvSnh5N29oNzdnVVErK3I3YWNUYXZLMldSZHV6WUk5T2NnN0I3?=
 =?utf-8?B?R2VpejFrVnZBZ0tIUWRWYTRCbGowTzVqclhLazlzSW56bmJTajdUaDJOQXJI?=
 =?utf-8?B?a2lVYWxHYXRadEFLUXFNUGhmZnVOck95NHNVT0M1STlhZmVtZjdiN0djaEc0?=
 =?utf-8?B?T0V6RHFxK0RzZjNKWWN6aFRiQTkwdEdsTFJvOXl3cjFnOWxEVnNuUmJpVG9K?=
 =?utf-8?B?dTFseXEyMk9UMlVLVDMyRzNCcjhIc2F4bis5T1pYMjJ0ZDdjNDd0d3pZWTJu?=
 =?utf-8?B?U0htRkJmeDdtckttemgwalBxUTRTTnhwTlA4VExvVUQwNDF4bHV6cTVuK3Rv?=
 =?utf-8?B?V1Jqdk4ycnIyVXZsOXl4cU1yS3BVR1k1UTRJL05TQ1lrZWlDZk9LSjNpcWtW?=
 =?utf-8?B?WEJlWStFYzJMaTFRN3gwZDh1cEx1OU5WL2JKN2o3VFpCVUVaVjljdlFaY3RE?=
 =?utf-8?B?UzVtR0NhaHlGY2EyU0kvUi9HYURWbDlVOW9Keno0TlNYRWQ4QUluTjdwa3Nt?=
 =?utf-8?B?bUZrUmJNc0VYU2J0TWM1MzZJVWg0WlNMdWswTE8vN09NUis1VEVLU2tra2FV?=
 =?utf-8?B?NTRuYmFFOWRNYS96eHc4TzRXcWJyTmpVWDlsL0NsQmNWcUZ4cElHODRwTlFL?=
 =?utf-8?B?YVE3cE9rdHpDOHdzMUo3QzJVbEVSRElUOWdGUm5yRjdOZVMweGVKMGZMYUND?=
 =?utf-8?B?NjQzYWlRMXVuUkRwNm1DTFpiYWMrTXNEWmMxdllsQ2Z2a1dGVE83YlMrOXQz?=
 =?utf-8?B?dGV3VDJud2JyR3d1TGEydTJPbERMNWNTMG83WWJoL2tJOEQvL3JPU2NyY29q?=
 =?utf-8?B?RGtGcDI4Z1EzaDh0MnlrZ1BrM1dLVzFVT0x5aktveTRWa29ERE1sK1FLRnUv?=
 =?utf-8?B?a0JtdXZPdkkyYWxFQmNLc0FPWVhmOGUzd0RkUk04NHdwZjhRUElQL2RUT3Yy?=
 =?utf-8?B?cldhamVEUmxWaUxsRE1wN1VzeGFvYUhqbkY5RW5ZU2hFRTFtSE9vblpDaTlO?=
 =?utf-8?B?Sy9QaERhZVRWSTdRc3M1U3drVUdXaSs0QjJBNXhVNzFGald2c01haFdGN01E?=
 =?utf-8?B?R0wzc2IxeG4vYkxhMnU2VkpjYnozLzV1ekRaT3h5VnhkNHFSdEhURTFYYjdU?=
 =?utf-8?B?UmdWOVZUcVErN3hjUlZFanFCMFBZM1daVFA1VWo0MC8wTDJ1NVZZWXh1d3Zk?=
 =?utf-8?B?NFRNRmx5SUE3NVUvNGVYVkY5dGo4Z2Y2aFRpdXQ0UGRPRzlKZS9IRlFsNm9L?=
 =?utf-8?B?a3VqTG1FT244dWVDTkJCZysxazlQTU96MDRKL2pGR2ZPRk5NRktwODRua0lF?=
 =?utf-8?B?S1BLOEM5dUxJQnBVTElkb1NkZHhGdTZKVFo2dExmZmhJQ2tnbWlJQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e576d9f-bb66-4e4a-74e1-08de6972e797
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:38:57.0008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3/6NgqFP9gIZciTK/amlzMl/gramGXhn9ySQ8zRhmyq8wEvfBWfSQXjr6DMVwbUq7X537bRkM2jah7kZh2oJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,igalia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 229FC124D9A
X-Rspamd-Action: no action

On 11-02-2026 14:27, Michel Dänzer wrote:
> On 2/11/26 06:48, Murthy, Arun R wrote:
>>> On 1/12/26 09:23, Murthy, Arun R wrote:
>>>> On 09-01-2026 16:52, Michel Dänzer wrote:
>>>>> On 1/9/26 12:07, Murthy, Arun R wrote:
>>>>>>> From: Michel Dänzer <michel.daenzer@mailbox.org> On 1/8/26 10:43,
>>>>>>> Arun R Murthy wrote:
>>>>>>>> struct drm_crtc_state {
>>>>>>>>           /**
>>>>>>>>            * @async_flip:
>>>>>>>>            *
>>>>>>>>            * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the
>>> legacy
>>>>>>>>            * PAGE_FLIP IOCTL. It's not wired up for the atomic
>>>>>>>> IOCTL itself yet.
>>>>>>>>            */
>>>>>>>>           bool async_flip;
>>>>>>>>
>>>>>>>> In the existing code the flag async_flip was intended for the
>>>>>>>> legacy PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>>>>>> As per the hardware feature is concerned, async flip is a plane
>>>>>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>>>>>> For a given hardware pipe, among the multiple hardware planes, one
>>>>>>>> can go with sync flip and other 2/3 can go with async flip.
>>>>>>> FWIW, this kind of mix'n'match doesn't seem useful with current
>>>>>>> UAPI, since no new commit can be made for the async plane(s) before
>>>>>>> the previous commit for the sync plane(s) has completed, so the
>>>>>>> async plane(s) can't actually have higher update rate than the sync one(s).
>>>>>> That’s right, such mix and match flips will still consume vblank time for
>>> flipping.
>>>>> Does a plane property really make sense for this then?
>>>> As per the hardware this async flip is per plane basis and not per crtc.
>>> That's not really relevant.
>>>
>>>
>>>> Not that I am trying to clean up this. Recently AMD added async support on
>>> overlays as well for which  few other hacks were added. The checks that we do
>>> for async flip were all done in place of copy the objs/properties, but it actually is
>>> supposed to be done in the check_only() part of the drm core code. This was
>>> the limitation with the existing implementation.
>>>
>>> Those implementation details can be changed without changing UAPI.
>>>
>>>
>>>> As per hardware the async flip is associated with the plane, hence changing it
>>> to a plane property.
>>>
>>> A plane property would only really be needed for mixing async & sync plane
>>> updates in a single commit. Since that's currently not usefully possible due to
>>> other restrictions of the UAPI, the DRM_MODE_PAGE_FLIP_ASYNC flag which
>>> affects the commit as a whole is fine at this point.
>>>
>> Sorry for getting back late on this, took some time to collaborate all the feedbacks.
>>
>> We can depict the below 3 scenarios based on the discussions so far.
>> 1. KMD can allow a mix of sync and async only if there is a disable plane req on sync and no plane update on sync flips along with async flips(maybe on multiple planes).  KMD will send the flipdone after sync plane disable is done. (Basically flipdone will send at vblank)
> What would be the point of allowing that? The compositor can't do the next commit before the sync plane has turned off anyway, so it can just as well do that in a sync commit and the async plane updates in separate commits later.
For an async flip to start, the 1st async flip will consume almost a 
vblank time, so if compositor does a sync flip on a plane along with 
sync flip to disable the plane, the next async flip will still consume a 
vblank time. If KMD allows disabling of a sync plane with async flip 
then we can overcome this.
>
>> 3. With multiple plane async flips, KMD send flip done per plane basis to the user. (async flag per plane from user)
>> 4. With supporting a mix of sync and async flips, should KMD allow them and send one flipdone for async flips and one flipdone for sync flips.
> Again not sure what would be the point of 3 or 4, since the compositor can't do the next commit before all planes have updated anyway.
Upon compositor getting a flipdone on the async flip, the buffers will 
be unpinned and this can be used by the compositor for rendering or for 
preparing the next flip.
This patch series anyway doesnt support either of 3 or 4, just trying to 
understand if there is a use case from the compositor for this.

Thanks and Regards,
Arun R Murthy
-------------------

