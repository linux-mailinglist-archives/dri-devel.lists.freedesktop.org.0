Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B101C9C868
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0C10E6AE;
	Tue,  2 Dec 2025 18:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxBom++k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3A10E6B3;
 Tue,  2 Dec 2025 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698599; x=1796234599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+s8vyV6N70hRxFhPY0eXaUV6lH2/QZg/rwsqdyKIp5s=;
 b=OxBom++kQAs1J9sHuuJSEydXvWAb7Gz1oZF5d7Odn9WAzWUTemZzOFlN
 EKnHD75n9LwnKggoALOGXYB4LXIQHEupafY/EC6m3zJeUOEBvdxf5vLdN
 8HqwA/76dijJ2p3MFlamWAiD2JiXuBf3fymJurN1qh6HJa5H6xtAUqcVn
 a+ik0qvsQsFSjuJVXEtSfcpJD5vM2Roao5K9ZOBpvoX6NJPUYN0oYCUfl
 oOFOfS7YEUYlWsbhVLOpqc3a+1ROWMa4ESqWYs8MiBEwrBJd/PYQg2gtq
 EEcPsYzoewvMuWB0k1cm2dKINvAqUQoURJk6mKlCTCMbQE4OWeWEqMDbe w==;
X-CSE-ConnectionGUID: IthCefvwRXG1IZZfoAqwIw==
X-CSE-MsgGUID: 4UtYhnjIQoWO9Tu7eWvakg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84277098"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84277098"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:03:18 -0800
X-CSE-ConnectionGUID: NeWvzrU0SlaHjVkQfNjBKQ==
X-CSE-MsgGUID: xrv9VTQ7SiW4a4O9GHSbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199389549"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:03:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:03:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:03:17 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3o0Ws7tNK5EPpcs+MUAKFChsZ/CnK5gqynPajkA04SelKfRjr7bkSsrm4Kj7XcM3LYXyK2pS8elc2VWGngamkS1OOpOV66eKJvS7psTy2fOfpg8T6HGPn+wwKDdMKziWHyqt7cEXYnkGAgdrSDW6SZ/hhKUDfme8Fm03TiEQsMZONCdLeYvIqVit/9A21FIztVZUap+WHFhMazqeebyoWnXcB85wUcLRlRzKCGaK/FauI253tj6kho99wdXfDvurI89GeChXzbCkLDQGuWaGzd0ifjrzm/xSudpwO88nwo14XOT5ZL3MhTu4qf51HdMz9ZRoUygoUy+XZ1UW7RK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIJ02cOJR6z5d6DFz5RYNdpgkfhtTa+V9njLgStndrI=;
 b=N1vvjYBL3zkoS/dd9CtAHgX54YkusfXOue16T58vFw9oiON9A2yYJwoz4tmYTNaJRVClpHUyo6DfmCN8j2dpP0HCQ/0blQc/Gn15OiZSvTyct7OxzFyhaja5W1/dhaHFKqT7F91sw06tr6iAQbxBa3Kz3JmocOtLQ0A9KWaK/6XVatygExpHAnNfmDXFAlWWDQuuO0P7OYBBDfZqeOJo1vXiAf76A1TwyR2l9OEjib/1zGAxxArR+NpFEh7lVW0qp7TBon03d27upcHJIVZZwSMFmo8H/0/s4VO/HU6nzAxnHmgKoYb7RiML9jWJ1rzjpivr/0PvrNLjCAJHeN0Kzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 18:03:13 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:03:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHcYx4Guf3P1lH+7E6YJG1reIhwcLUOm9wAgAAATwCAAAeeAIAAAVrA
Date: Tue, 2 Dec 2025 18:03:12 +0000
Message-ID: <CH0PR11MB5444E98F298B983375F67CBDE5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-9-jonathan.cavitt@intel.com>
 <aS8hsmKCc18aGtM8@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444CA5E17BC165FD91D7892E5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aS8oWAVebZAXNZ9f@lstrano-desk.jf.intel.com>
In-Reply-To: <aS8oWAVebZAXNZ9f@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4527:EE_
x-ms-office365-filtering-correlation-id: 77bb14bf-2483-4613-a4c7-08de31cd0f70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?46cdbC3SGkgc066U6GNsCZl5mDCgLLUsyW+ykwTzSNkPMzI8SA5AcKzFIjXT?=
 =?us-ascii?Q?ayMmLKUYWMHJnUIWpoBmzoo+Fxt8ReTidUqPZXrb5xH7hc+R88xgVcTdwgb0?=
 =?us-ascii?Q?aLrNwFyrr7YOl2PPNpmEQthT3U6jK0i5oEF5GrlGDggsQG+ySXlVEo0OeYXY?=
 =?us-ascii?Q?RzA0/nBWrxXoUyLbKmdp5IoLCvsOQAYzcjZCs1WVWxkwUCfaiznFqYQRt6is?=
 =?us-ascii?Q?RUAz74KFsScQJjVNOmdzMeF8jJ3qsyJQvWvpTpqKrxCekebaG4A8/pjfO/JX?=
 =?us-ascii?Q?Cj6oumVVPZNqbNOYlRuKLDrP0hyHvFKMptcNTp1Cuhuwps+ZxCr2WBqMscYC?=
 =?us-ascii?Q?uipdCXTo6+FCi7c3E7IklraIxciACHC/6nweJfLyWQelsW95EDNub1389z5k?=
 =?us-ascii?Q?guOS8a2u4LMxzImg6q/Sy3AsPjofa5FOLsNHn/FaZruKKNuqvHuPXY63NYVM?=
 =?us-ascii?Q?gfu7P1Wt0QGwBIfXfK3lheHNFlRXLpmYZhjAcJLaHnre3MYEll0TgsHD+M/6?=
 =?us-ascii?Q?teF7kNA3cpjMScKDkFRmEYHxB/yerdGxNbhXHUAq/Sf6j6TI1oiByvCq357D?=
 =?us-ascii?Q?Bc2Zs+rdlR9lxt2IZla657OpCHP8nInz786/0A2MTc2Jy7XKBG8M7gh7gNcv?=
 =?us-ascii?Q?JvIVKBScuJIYxhBa1Tf5881TTu5NXFQsdAND9R2/zfH8tp5AEJtj1e98u3KA?=
 =?us-ascii?Q?fwrV4tTSQog8FpyOH63Uceyz6OFAcCppLKUZWrUMXStW4ZG/tl1cot4XkssN?=
 =?us-ascii?Q?M8K650etYHCMTE6/T1+HGgIt31ZOaiUD1YLwve54ZGC5RgfifuQPnmLASRnc?=
 =?us-ascii?Q?HvYKoscfuWPNQwCjiSGCL6V9i1qc6taZGIeD7Z3jRZQpj1KXp3U1vhRDGToi?=
 =?us-ascii?Q?/dg1vgTqtNkojcf2EKlkihfjRlERyY7lZmXIj8Ewu6IdaLBWBph9PfgsN9vs?=
 =?us-ascii?Q?orB7oRA/JjdhmH6H6zaLXLBT8VtW0W2TJTsHvSTWJLcopFw+CZO1vcyycxxf?=
 =?us-ascii?Q?43Ro01MAQySQs7yxCVPVr+V4CVVKubiWlAP0kpkrX8MPS3ZOg8NXcHdekZTR?=
 =?us-ascii?Q?I2izDpnxoBJ1ybGiCF1cn1+YWNQvwQ0Lsbjr38n6oV8aAgGmscbJ22Mri+su?=
 =?us-ascii?Q?MnXylMJ3FMw2367yRWzbMxpCQwBEf2BUCXapwhVBLeObpmf6Kafn1wBss6Wo?=
 =?us-ascii?Q?6mbl6lE6fxxVxj2/yhcHAcrO0nxvBmfi88ai0KmvZK80cmYvSxHRBDDVfVYT?=
 =?us-ascii?Q?pzorgpjGc/OEEdLeVdMEfvOU8CRFjSvYgZSiEaeBGhYWOWOrcymr9HYVLB9J?=
 =?us-ascii?Q?edhee8snjbii9lc9I5b1R4qk0l+e8CtdmdTEpvbkZt0f1sl46l9Ee8DXzR28?=
 =?us-ascii?Q?kyJQUujMtRMPcd6oZEZ8gLoNOcKnLi59kactSRTGJvUXYANZ44O+d3VkfsTF?=
 =?us-ascii?Q?9aDb+HXXu8yFudig+7oyKcCR6K94ONb63YhmCkvZUIU3j7l+2kZL0YKT0Knf?=
 =?us-ascii?Q?4qjfspdZt0kfBi2Bx15EvIL014pHjtsHoZt5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0QHkRI0eDFForEkJSMCwN6FkpGTvgJCazPYJBgH86sB+UCNsCLb63prj2LyW?=
 =?us-ascii?Q?2FcacacZQgQq6uHKB5U0n2nzF7uH7CD/hKbeIMuwZsvzQ5tOIFU3ty35L9SC?=
 =?us-ascii?Q?H2h3PEpQ1PnEoNEmlRR3VL2ea8J9amY48lFFBuFSQnIAe1WN0Gwkdpqrcjka?=
 =?us-ascii?Q?2RgbjFKSTSz7qX3MWdJrrHHwNkRMkAYyqheDmAjOI81nZGkueL0aWBquG1M9?=
 =?us-ascii?Q?kiVCSvmElDmm/kqxhns1AYNtIGArsxWB8gIikaqUoLlqclmBarobuKT3RyYl?=
 =?us-ascii?Q?GfRTISDesT437FFXBCk3u2YC4cS4r/Xaa0cYglywPr4AOTBWogTrHQ75ud2s?=
 =?us-ascii?Q?+IotGNUduN1AS/X9cePgE5IYCN8a90Jc8l7mv8AcCUZ36CDmO5nQwTRlO99o?=
 =?us-ascii?Q?GU1j81MSBMiTisVGL/reDIXUlq5T8mTWo8vvafeHLAWc6K5rAS7G6PAHhUwV?=
 =?us-ascii?Q?sYPHXSuKOD5xUmzALcnGrehj3cd+Z5yf9n6he0XIoxrbT88wYp0IxcxTXaO5?=
 =?us-ascii?Q?4Zt8mLxrx2EiRXeE7wnLBrd988SDsAmahQYeGomXoakCD6XyoN3ghA0SdLin?=
 =?us-ascii?Q?Ey2vnpG8jXA2BOxCMt4IsFR4VZG9rNTWykj9+iFYgzcFkzxKr80qz3T4Psmx?=
 =?us-ascii?Q?eAlN3tE9iyPdXKihlesV6jyPKBeNTKCPsbIYvEFP80g5j1tG02YYGRXE0qv6?=
 =?us-ascii?Q?M5fjmDVw6tFzEhruKwb9ZjevZZK0M9OAoGi7pyMksbPYolVWzVg1zws1OVwX?=
 =?us-ascii?Q?Z98PccTROmDahmeOvc0+kOx2MNrkfyrozzSAyoqzhbnPgZ3WyomNm9mckKSN?=
 =?us-ascii?Q?xF5orip5yEilcSWt43/FNk+sUiO/WIFpPNx9HF7AVe0idf3R8m42tEF+AYYB?=
 =?us-ascii?Q?FWXUYNGhazySMlQXFq6YNMk4AXaNL7hJGyjPPn6aD0B6ShEUcdeEeF9QPSCu?=
 =?us-ascii?Q?6KLxO5REyRU+PYAHgrO2E0VOTDJALpEUgApX/o672KEN1+wtsXANkybtXjKd?=
 =?us-ascii?Q?LWXkQUczpTr0NmGpAcRZtkyulkSxXd9cST5EZPmLrFv0blfbw2ZZZWZsECyg?=
 =?us-ascii?Q?AjLXBFHk2RImmwtaylNf1hzICFXGnQV+DzGuCYYDRs6K5w5maOyhfamqQwym?=
 =?us-ascii?Q?s057PFKcHx2Shdd2iIGmlWY9ryE2AgbsvCXonRlRMq9beWO1+4jgqfnqDPHh?=
 =?us-ascii?Q?QmgY9Zk47Q/IaVbjwBbx2Gl2MT2zaVVr3POoJviNdIEJGSFDH/DSNRSVRxsn?=
 =?us-ascii?Q?Ov0hdvA96t2Wb/soee5FpxUbCzgrNCaUSmXwaVGXeS4aWrBOJxATn+5uvfpH?=
 =?us-ascii?Q?n7Lqkq5yX9WvMpC9K/ZrPVg2OKgJ6xJ7nTM6TLYJhH12WatY5MV3b9FYX3mq?=
 =?us-ascii?Q?yIvqVuc7p9VSLAuLBjsnSydv1gZT2XwzMQt2KkNOP5VShZHIOP6CL9K1OYO4?=
 =?us-ascii?Q?kCJJox4pCv1zmFqWeI/Pknl+HFCTGNJNZs41DpANqDfcJrAJnXWvPruLZeG/?=
 =?us-ascii?Q?qio9PTLHac9zFOCqJ7lnPYz0YTnn+sG3OGB7SZlalgXyjlsWsXUJIvrLPap1?=
 =?us-ascii?Q?ClEGweEvhIba2BJEySdIjN/ay268Bol+ZT54j2OpriiZnGdzdK6bHhHwyGf9?=
 =?us-ascii?Q?uuq+HAxflcMZI0aSz9ZThvL8EXu9X9uCkoBT1LUdc+wV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bb14bf-2483-4613-a4c7-08de31cd0f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 18:03:12.9804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbKHND0dwjQytODuAVdxlShMKEsKmakAwUIyK/DZYXY5pV6jX+dt+k87a16oYvqvKQmbB8ag+BZY6WgTSjnwZ4IBtwkMLEjyTZpgMbse/7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, December 2, 2025 9:57 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
>=20
> On Tue, Dec 02, 2025 at 10:47:16AM -0700, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>=20
> > Sent: Tuesday, December 2, 2025 9:28 AM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@int=
el.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Z=
hang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@inte=
l.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczk=
o@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.j=
adav@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matth=
ew.auld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
> > Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
> > >=20
> > > On Mon, Dec 01, 2025 at 11:55:43PM +0000, Jonathan Cavitt wrote:
> > > > Add additional information to each VM so they can report up to the =
first
> > > > 50 seen faults.  Only pagefaults are saved this way currently, thou=
gh in
> > > > the future, all faults should be tracked by the VM for future repor=
ting.
> > > >=20
> > > > Additionally, of the pagefaults reported, only failed pagefaults ar=
e
> > > > saved this way, as successful pagefaults should recover silently an=
d not
> > > > need to be reported to userspace.
> > > >=20
> > > > v2:
> > > > - Free vm after use (Shuicheng)
> > > > - Compress pf copy logic (Shuicheng)
> > > > - Update fault_unsuccessful before storing (Shuicheng)
> > > > - Fix old struct name in comments (Shuicheng)
> > > > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > > >=20
> > > > v3:
> > > > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > > > - Fix double-locking error (jcavitt)
> > > > - Assert kmemdump is successful (Shuicheng)
> > > >=20
> > > > v4:
> > > > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > > > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > > > - Store address, address type, and address precision per fault (jca=
vitt)
> > > > - Store engine class and instance data per fault (Jianxun)
> > > > - Add and fix kernel docs (Michal W)
> > > > - Properly handle kzalloc error (Michal W)
> > > > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > > > - Store fault level per fault (Micahl M)
> > > >=20
> > > > v5:
> > > > - Store fault and access type instead of address type (Jianxun)
> > > >=20
> > > > v6:
> > > > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> > > >=20
> > > > v7:
> > > > - Fix kernel docs and comments (Michal W)
> > > >=20
> > > > v8:
> > > > - Fix double-locking issue (Jianxun)
> > > >=20
> > > > v9:
> > > > - Do not report faults from reserved engines (Jianxun)
> > > >=20
> > > > v10:
> > > > - Remove engine class and instance (Ivan)
> > > >=20
> > > > v11:
> > > > - Perform kzalloc outside of lock (Auld)
> > > >=20
> > > > v12:
> > > > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> > > >=20
> > > > v13:
> > > > - Rebase and refactor (jcavitt)
> > > >=20
> > > > v14:
> > > > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> > > >=20
> > > > v15:
> > > > - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> > > > - Use guard instead of spin_lock/unlock (Matt Brost)
> > > > - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
> > > >   instead of creating a new helper function (Matt Brost)
> > > >=20
> > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > > > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > > > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > > > Cc: Ivan Briano <ivan.briano@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++=
++++
> > > >  drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
> > > >  drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
> > > >  4 files changed, 131 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe=
/xe_pagefault.c
> > > > index 0b625a52a598..0fe092226d0a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagef=
ault *pf)
> > > >  		  pf->consumer.engine_instance);
> > > >  }
> > > > =20
> > > > +static void xe_pagefault_save_to_vm(struct xe_device *xe, struct x=
e_pagefault *pf)
> > > > +{
> > > > +	struct xe_vm *vm;
> > > > +
> > > > +	/*
> > > > +	 * Pagefault may be asociated to VM that is not in fault mode.
> > > > +	 * Perform asid_to_vm behavior, except if VM is not in fault
> > > > +	 * mode, return VM anyways.
> > > > +	 */
> > > > +	down_read(&xe->usm.lock);
> > > > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> > > > +	if (vm)
> > > > +		xe_vm_get(vm);
> > > > +	else
> > > > +		vm =3D ERR_PTR(-EINVAL);
> > > > +	up_read(&xe->usm.lock);
> > > > +
> > > > +	if (IS_ERR(vm))
> > > > +		return;
> > > > +
> > > > +	xe_vm_add_fault_entry_pf(vm, pf);
> > > > +
> > > > +	xe_vm_put(vm);
> > > > +}
> > > > +
> > > >  static void xe_pagefault_queue_work(struct work_struct *w)
> > > >  {
> > > >  	struct xe_pagefault_queue *pf_queue =3D
> > > > @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work=
_struct *w)
> > > >  		err =3D xe_pagefault_service(&pf);
> > > >  		if (err) {
> > > >  			xe_pagefault_print(&pf);
> > > > +			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> > > >  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> > > >  				  ERR_PTR(err));
> > > >  		}
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.=
c
> > > > index 8ab726289583..dc6c36191274 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -27,6 +27,7 @@
> > > >  #include "xe_device.h"
> > > >  #include "xe_drm_client.h"
> > > >  #include "xe_exec_queue.h"
> > > > +#include "xe_gt.h"
> > > >  #include "xe_migrate.h"
> > > >  #include "xe_pat.h"
> > > >  #include "xe_pm.h"
> > > > @@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct wo=
rk_struct *w)
> > > >  	trace_xe_vm_rebind_worker_exit(vm);
> > > >  }
> > > > =20
> > > > +/**
> > > > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > > > + * @vm: The VM.
> > > > + * @pf: The pagefault.
> > > > + *
> > > > + * This function takes the data from the pagefault @pf and saves i=
t to @vm->faults.list.
> > > > + *
> > > > + * The function exits silently if the list is full, and reports a =
warning if the pagefault
> > > > + * could not be saved to the list.
> > > > + */
> > > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefaul=
t *pf)
> > > > +{
> > > > +	struct xe_vm_fault_entry *e =3D NULL;
> > > > +	struct xe_hw_engine *hwe;
> > > > +
> > > > +	/* Do not report faults on reserved engines */
> > > > +	hwe =3D xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
> > > > +			      pf->consumer.engine_instance, false);
> > > > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > > > +		return;
> > > > +
> > > > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > > > +	if (!e) {
> > > > +		drm_warn(&vm->xe->drm,
> > > > +			 "Could not allocate memory for fault!\n");
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	guard(spinlock)(&vm->faults.lock);
> > > > +
> > > > +	/*
> > > > +	 * Limit the number of faults in the fault list to prevent
> > > > +	 * memory overuse.
> > > > +	 */
> > > > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > > > +		kfree(e);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	e->address =3D pf->consumer.page_addr;
> > > > +	e->address_precision =3D 1;
> > >=20
> > > Can you explain what address_precision means? It is a little unclear =
what '1' means here.
> >=20
> >=20
> > As I understand it, "address_precision" captures the case where the pag=
e_addr in the pagefault
> > is not precisely the address accessed that caused the fault.
> >=20
> > For example, assume a pagefault occurred due to an access at address 0x=
7fffce.  Our current
> > implementation would report that address as a part of the pagefault str=
ucture, so we would
> > return an address of 0x7fffce (as that's the reported address from the =
pagefault), and a precision
> > of 1 (to denote the address is exact).
> >=20
> > By comparison, imagine if our pagefault reporting system reported the p=
age the fault occurred on
> > instead of the exact address.  Or, in other words, imagine if in respon=
se to a fault caused by an
> > access to address 0x7fffce, the value of pf->consumer.page_addr =3D 0x7=
ff000 (the page the address
> > is located on).  In that case, we would return an address of 0x7ff000 (=
as that's the reported address
> > from the pagefault), and a precision of PAGE_SIZE (to denote that the p=
agefault occurred in the page
>=20
> s/PAGE_SIZE/SZ_4K - PAGE_SIZE is CPU dependent thing.
>=20
> We actually report faults on SZ_4K grainularity via the GuC. See
> PFD_VIRTUAL_ADDR_LO_SHIFT and how it is used. So what we likely want to
> do here is update xe_pagefault.consumer with an address precision field
> and have the GuC side populate this with 12 (if we are making this order
> based) or SZ_4K is the actual size.

We can internally store 12 to save on space, but we should report SZ_4K
to the user because it's more intuitive.
-Jonathan Cavitt

>=20
> Matt
>=20
> > and not necessarily at exactly that address).
> >=20
> > TL;DR: 'address' denotes a start position, and 'address_precision' deno=
tes a range.  The reported
> > pagefault occurred due to an access somewhere between 'address' and 'ad=
dress + address_precision - 1'.
> > Since the address is exact in our case, the range is 1.
> >=20
> > -Jonathan Cavitt
> >=20
> > >=20
> > > Everything else LGTM.
> > >=20
> > > Matt
> > >=20
> > > > +	e->access_type =3D pf->consumer.access_type;
> > > > +	e->fault_type =3D pf->consumer.fault_type;
> > > > +	e->fault_level =3D pf->consumer.fault_level;
> > > > +
> > > > +	list_add_tail(&e->list, &vm->faults.list);
> > > > +	vm->faults.len++;
> > > > +}
> > > > +
> > > > +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> > > > +{
> > > > +	struct xe_vm_fault_entry *e, *tmp;
> > > > +
> > > > +	guard(spinlock)(&vm->faults.lock);
> > > > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > > > +		list_del(&e->list);
> > > > +		kfree(e);
> > > > +	}
> > > > +	vm->faults.len =3D 0;
> > > > +}
> > > > +
> > > >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of=
_binds)
> > > >  {
> > > >  	int i;
> > > > @@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *=
xe, u32 flags, struct xe_file *xef)
> > > >  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> > > >  	spin_lock_init(&vm->userptr.invalidated_lock);
> > > > =20
> > > > +	INIT_LIST_HEAD(&vm->faults.list);
> > > > +	spin_lock_init(&vm->faults.lock);
> > > > +
> > > >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> > > > =20
> > > >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> > > > @@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > > >  	}
> > > >  	up_write(&xe->usm.lock);
> > > > =20
> > > > +	xe_vm_clear_fault_entries(vm);
> > > > +
> > > >  	for_each_tile(tile, xe, id)
> > > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > > > =20
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.=
h
> > > > index 361f10b3c453..e9f2de4189e0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > @@ -12,6 +12,12 @@
> > > >  #include "xe_map.h"
> > > >  #include "xe_vm_types.h"
> > > > =20
> > > > +/**
> > > > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can =
store before future
> > > > + * faults are discarded to prevent memory overuse
> > > > + */
> > > > +#define MAX_FAULTS_SAVED_PER_VM	50
> > > > +
> > > >  struct drm_device;
> > > >  struct drm_printer;
> > > >  struct drm_file;
> > > > @@ -22,6 +28,7 @@ struct dma_fence;
> > > > =20
> > > >  struct xe_exec_queue;
> > > >  struct xe_file;
> > > > +struct xe_pagefault;
> > > >  struct xe_sync_entry;
> > > >  struct xe_svm_range;
> > > >  struct drm_exec;
> > > > @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_v=
m_snapshot *snap);
> > > >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_=
printer *p);
> > > >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > > =20
> > > > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefaul=
t *pf);
> > > > +
> > > >  /**
> > > >   * xe_vm_set_validating() - Register this task as currently making=
 bos resident
> > > >   * @allow_res_evict: Allow eviction of buffer objects bound to @vm=
 when
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/=
xe_vm_types.h
> > > > index 3bf912bfbdcc..fff914fb0aa6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -20,6 +20,7 @@
> > > >  #include "xe_userptr.h"
> > > > =20
> > > >  struct xe_bo;
> > > > +struct xe_pagefault;
> > > >  struct xe_svm_range;
> > > >  struct xe_sync_entry;
> > > >  struct xe_user_fence;
> > > > @@ -165,6 +166,24 @@ struct xe_userptr_vma {
> > > > =20
> > > >  struct xe_device;
> > > > =20
> > > > +/**
> > > > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > > > + * @list: link into @xe_vm.faults.list
> > > > + * @address: address of the fault
> > > > + * @address_precision: precision of faulted address
> > > > + * @access_type: type of address access that resulted in fault
> > > > + * @fault_type: type of fault reported
> > > > + * @fault_level: fault level of the fault
> > > > + */
> > > > +struct xe_vm_fault_entry {
> > > > +	struct list_head list;
> > > > +	u64 address;
> > > > +	u32 address_precision;
> > > > +	u8 access_type;
> > > > +	u8 fault_type;
> > > > +	u8 fault_level;
> > > > +};
> > > > +
> > > >  struct xe_vm {
> > > >  	/** @gpuvm: base GPUVM used to track VMAs */
> > > >  	struct drm_gpuvm gpuvm;
> > > > @@ -302,6 +321,16 @@ struct xe_vm {
> > > >  		bool capture_once;
> > > >  	} error_capture;
> > > > =20
> > > > +	/** @faults: List of all faults associated with this VM */
> > > > +	struct {
> > > > +		/** @faults.lock: lock protecting @faults.list */
> > > > +		spinlock_t lock;
> > > > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > > > +		struct list_head list;
> > > > +		/** @faults.len: length of @faults.list */
> > > > +		unsigned int len;
> > > > +	} faults;
> > > > +
> > > >  	/**
> > > >  	 * @validation: Validation data only valid with the vm resv held.
> > > >  	 * Note: This is really task state of the task holding the vm res=
v,
> > > > --=20
> > > > 2.43.0
> > > >=20
> > >=20
>=20
