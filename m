Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6358BA9DAA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724D210E45F;
	Mon, 29 Sep 2025 15:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMl5u4Rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91C210E23D;
 Mon, 29 Sep 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759160969; x=1790696969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qgiyd4HTm535/Nl1r5bRi0BRwfTqNRmSOh/NKNl/uD4=;
 b=hMl5u4Rx6gvBY1EPX3BHTWOewP7hNWYyv8J27bY28FrVsRJ/32ywQit4
 wpaBu0uPzxn3DTIlq6F40eKStuLfOaejbCSSgVnxg/G6M1LW323vB7iYL
 0NTCzYPTU4Vy8pEvN8jqGX8eYkJzcFPdZ/rhwIsTr4v638d3GVyihr6/Z
 ib8uKEU944Czl90ZBsUywzG4Vj3oYblsYzi/c0oKSSP3i9a4yg+NZwM6u
 bPhAcPHU7dIt1dcToU0y2XgKx39dJMYndXhdtcaoSACoqOBDz013uRa1Q
 pQIWF7RWJdD7uJ0zwlN0eG9CHhf/M//g2d4hP5pn+cr7m8XVVsu+FXBxE w==;
X-CSE-ConnectionGUID: YpRV+1llT/S+Mfe8+EGQpg==
X-CSE-MsgGUID: n2affEF7R86cQKxVmoPtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61294550"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61294550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:49:28 -0700
X-CSE-ConnectionGUID: 12b7yO7xSpu5R0f4faehFA==
X-CSE-MsgGUID: 3cnmrPstRz27hfUoZ8YOWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177872874"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:49:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:49:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:49:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTnXT2tItNXqnST0RVEQDhtXV8ejnT8AihCefpI/pfWRUfgFxl0o3318p2srtH+8O7sLrgdaDR+r35FLeI04FIjrBlAQec4VTgY7uH/x2O1XPqSeFMN9rJVzYnbccNExXKgCJ/w61rT/vIDvjAnWP1jev3GGw+UY2wv0aFOD1Iemmn3z51RMIu03HCgxtP3aMdJun75AsY+FlWO3zUTijVzkdHoV4AhODZYi1dLvIMxSOHTL6JBurco3UEYmUN0aNrEpKFPPQNFBSg64fLqRiNfCPkV3D7CC28N95Zq4ULmsWDOqz3+KAuCYzR0T4MRr+qdlOVonzFmAMkZTxcLZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgiyd4HTm535/Nl1r5bRi0BRwfTqNRmSOh/NKNl/uD4=;
 b=cvr+ZJvw60hfuWri8g2Arr3iJQsAXuBX0NKn58JIl7iq+c61gFU3X1k7IyQghYIXvs656nNi/pvOzzeutrptSbLbTxq5fpXl/e7zXb7YEXDfm6/rfS2uIwn7hpZxZbs49qvs0bisGuvGrfbP2fHgmeVsvyUlau/CHtYeqEdghtsr8rnBHrlrgTnD31dskgF9mdb+3y0qe1Gt79ytWVMW8T2W6NlxhhlUqfMCBaf8fGCXuDVGE3XUl1AMlPHzNofYyhkemJSR2QRLmq11QGczLRSNcoU0BEHcwoE6GC4WJdbfq1KW4C4DawYbC5NdL6y5cPB1F+f2V+ODQxWUwa0aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 29 Sep
 2025 15:49:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:49:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Colin Ian King
 <colin.i.king@gmail.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing
 initialization of variable offset
Thread-Topic: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing
 initialization of variable offset
Thread-Index: AQHcLT0+zC6BHfrDfUSPedpdKHUZQbSjzrSAgAaH3bA=
Date: Mon, 29 Sep 2025 15:49:24 +0000
Message-ID: <CH0PR11MB5444AAF5F484F5F35522F994E51BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250924102208.9216-1-colin.i.king@gmail.com>
 <19cadb88-1b80-444e-a062-54f3f42c856d@intel.com>
In-Reply-To: <19cadb88-1b80-444e-a062-54f3f42c856d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 367fde05-9652-49fe-d155-08ddff6fc3ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Zlc3MUQxUU80SkxKSFgwOTU1RVZtcllBdW1yM2pneEoxQXU1L3FIRnQwU2dE?=
 =?utf-8?B?a3NFQ05scFduQlVsbmlycndMTFJSbnhGUWcyVEJyRGFtc1gvMDJaZEp4SFcx?=
 =?utf-8?B?N2QzQUZ3eHBFYmszcFhBSGVtdmhuTHRibXd3enROdlc5L0hNVDNBTGxHNUZ3?=
 =?utf-8?B?VEh6WmRpc2c4VnU4TnlQdkc4VmdYOTZJZFFLazh5TGh3RUc0OXorNmI1ZnJr?=
 =?utf-8?B?MVBjMy82dFNGOW0wRTBkWjBGdDFjbjBtc00xYzZVd0NjOHk2QmFFUWZWRXdJ?=
 =?utf-8?B?d1BPRDh0MWFoU05RYXJQN2pSQUZEN3hGejgrU1B5UlNESzFuWDBxMndsc3Z1?=
 =?utf-8?B?TkNzaVl5M24zR1NUeE5wQXdkTGh4Vkxwd2UrQk1kREc3WVhFOU85SGZEUUxr?=
 =?utf-8?B?SW9YYlBhcUc1WGxkMnNCQmEwU3M4QTV5T2F4K2M3YjA0K1hZR2lXeWNRbStZ?=
 =?utf-8?B?ZnluTVUyNlI1UVZNVndyVGJXSnNXeHhoS29uYk9lekEva3pKblNyMWlPN1dX?=
 =?utf-8?B?TmZtdlkwS1ZabnNyV21DZmpKbXRiOGF6YWZlQVRNUVY0Z0NvbWhOMjVLeHZs?=
 =?utf-8?B?Z0lERGsyNWVmazViNXRnSjZlb0FuVU1nSjhzTldkaTlub2dVVlJLKzI0R1kr?=
 =?utf-8?B?ajQwL2RXcEZCN3NzMDFBNDUxbkJIQkZaMlhHRHZuV29JZVhhL3E3ZlJuSjV0?=
 =?utf-8?B?UjJPOGxUQmVRdVBFYjdQdmw3N0cxWmpRSWRZWVBpeXdGaVpsNnBuTnRpODVs?=
 =?utf-8?B?OHdrWTIxMkoyQjJpdE5YRUd3QVNjUEtDcGc3U2l6MXUvOW5mTDJUeWg3MEhQ?=
 =?utf-8?B?YmNseDdnMnhqb2FON1lpOXYvWkRMNzFJdEc0UTQzRFRRMi9TTlpVN0RocE9E?=
 =?utf-8?B?OGJucVZRQmdBdmh6WGJTTk1qQ2pYNlZhRC93cVRwRWF5T3pZelcvVnVXOHhl?=
 =?utf-8?B?cklZSlZJZ0ZMSU9sTDRqUzFHQlFHYTBMYmJVVXFVL3ZoZ2ZSbVM4MElDUFcz?=
 =?utf-8?B?MzJJb0ljTXd4dEE0T05RQWFsL0dWWVlQZ3NwRFJKL2JxRG9IOFpielRHK3ZT?=
 =?utf-8?B?RTVoN3AvNzlacEdXL0pEQ09VZ0pob0hwZCs3bTdtenFQc2dtTDk3YTFlZVVG?=
 =?utf-8?B?azVNSXFIaDltdHphZll4L3o2SGQxL2c0YWhsUUVKY2pyWTkxMG03QnE4alc0?=
 =?utf-8?B?ekkrRzhGczl3OGl2TXpCMHQxaXV0eXZEZ1NmZWRGaTFkakxwOXBzVjB4bVd2?=
 =?utf-8?B?WGRpamJHbkxWWElhdWwxNkZCRnBlUE53aXdEc3lHQ3lEWHhWVDJwSTFVT2Rk?=
 =?utf-8?B?WHVYamdVRGtsNXFhWUxDYXR6bHY1eUM2ZU1JbXJkNVBDc200cWRMRWk2OUFt?=
 =?utf-8?B?RUpKZ1o2REdjRHg2VTgyTG1BaUdmVyszUnd2RnFhc2xqcWptbzJtZzVBUlQ0?=
 =?utf-8?B?TlJneUJTaDY3ZWpvcC9MZGRlaVlTTWt4OGRvYlN3UStSdm9GajZldVUyczQ0?=
 =?utf-8?B?b1VVOWRsbnlZTXhIUFNqSjdnWUF2bDNYdkwyMlFDc2ZMOWdhSm1VYzVPazJG?=
 =?utf-8?B?SWVCck42QnZIVEJxenJVbHlGdUoyZ1pEMjNneU8xWXFaTzdZQUk1Um96T3FI?=
 =?utf-8?B?bFJXcWtzZmJsanZsR1J1cUFabnQwZ0w2UTZCQUVsSW1aYW5NK0xUNWFvSGln?=
 =?utf-8?B?VDc3WEFwTDR2M3l4enUxVGVWSUk2QTlaOUJtTkVtbEZ2bjMycy9SbFZndHp1?=
 =?utf-8?B?Z1hTOTNETFBmWmozUjNXdGFmSU1lLy9KQnJXZHhrWS92VEZIeXR6a0VyZDUx?=
 =?utf-8?B?bHc0TC9nR2h5RnIwNTd1MnNrb2NEOEN2emxKa290ck93Mm92ZmJXRy9KbUpk?=
 =?utf-8?B?cXBJOVlvMEhUaTU5T2dRZk95ZDh1VllQVzZwdlRCQi80M2paN0N4VUJFU0N1?=
 =?utf-8?B?TWRHWThmd2dzb21pVzRTYWdBbkZ1STVsRGMxSFNFYlhDNUpFRmJFcFZKMGdR?=
 =?utf-8?B?Wk1xMXBTeGZvUWJMbDIxWUU5VXZuVmVKNStGS0lhTGdaU3hFcDFFK21PR0pN?=
 =?utf-8?B?eXZoOWVmQUlaaVFKQmdYVUFUa1h2eXZmNEtPQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG9DUVZzYlZweGZBYlpUSlN0NHJ2b1dIanoyRzR2WnlMRVJLWGdpS2FhL3ZC?=
 =?utf-8?B?TTB1V0VhYkJUK3BVdGhVaDRTNUlxcXdjQTJZWkowOG5YbWo3SWVhVTFjcXJa?=
 =?utf-8?B?b0ZsQ3d5U0x3VGh2RExVSmdBbXExcnpuU05LQTQ2cjJ5dnM2VkkwOUk4d0dm?=
 =?utf-8?B?R25kWHJwM2ExVi9aaXpBTXBaTXNHbEJKUjVtL255NFhMSGJWKytqR3MyQUE1?=
 =?utf-8?B?UTV0U09iR2grVXIxcW1ieVF3OEtINDYxTlJHQktaQkFISFo3NGpPd09SeWtk?=
 =?utf-8?B?R0ptYXdFdHNGZ3dvRUlSZC9CcjFtVWN0KzZabEVSeEQ1Q2R6cHgrY1BGZEVu?=
 =?utf-8?B?K2lTdk5qdSt2UTZIMjZLQXZYSGdyUlMvNXlaMUdNVVNHc1prL1ZzSVRXazkx?=
 =?utf-8?B?eVplSFV5MlNnSU9VVVBvc3o1L2hKdUprNWFpeFdFNlQwWExudFJNUnArY1Na?=
 =?utf-8?B?eHIxTDdxS3A3bXFWL0piY1lDZ015WWYrZk8xcXZaYzJwaVMycGEybm1GQWE5?=
 =?utf-8?B?dWxmYlErVTFlV0ViaDJ5RTEyRytCOUpwcDV1Q21EUGNqSXlPUHVnanJuakVC?=
 =?utf-8?B?QW92YkFwYzRBdFoyNVNQTk9ueXVGY3V6Z1hFSkxPUDZmWHFWZjM2RkJlRWRJ?=
 =?utf-8?B?VmNWZHBsOGlkc1NGbit6UlJ0UWJBRU1UUmd5ODNzUE9zc0tkeXlOQ2FlZWxr?=
 =?utf-8?B?YXRXNFozamhXOHZtNDFvQnRBWU1saHFETHNDWW4xRzBXOEtUMWN4OXByZU0y?=
 =?utf-8?B?YzJPWGM3VXpaekl1WG9WYWNZdW5SdEtsZ3JwcGh2clpDRlgxM09zcVp5cDZC?=
 =?utf-8?B?Z1pQRG1uakpVQTdnbm1HRUNKUjAzcE9ZSUdzNTB1dEZtanNSeUhIZnBEcTgv?=
 =?utf-8?B?QVhoeVhlMGE3aVFPZWh3RE5GUDBTWGdKNy9SbjBKTmlqSW9hYVl4dG8vQ3Nl?=
 =?utf-8?B?TzNMZXQ4cmdTRUVnYTFGZWpYTkl6NFFzTXFHUFF0bWJmK2RwK3MwbW81VzJZ?=
 =?utf-8?B?YldaOHJ6MHNKa0YzQUVlVVdYQW5FVmw4WkhoOXBKbWFRWUJzeEdKMVNuTGlW?=
 =?utf-8?B?cUhNTkVCT2JBUzRMNTNiSnZrOWFNZ2l0bGhUOElxL1M4anZUY2JMTkMyTlVE?=
 =?utf-8?B?bmwvamw0bm56RkVqN3ZRYmJIRllHeDhySTlJbGhmQW9XY0NvSHlISjhSbG5m?=
 =?utf-8?B?dC9ycnlrWm4rQUhtdk4yU1Q0TTlpWlpScUVVcjIwSTQ3Ty9JTXNtaUdXeVJz?=
 =?utf-8?B?NlNOdU95MURvOW5uSndRVnN1SDhYNE1USTd5dEx0SndDRlVyczUwTWtKbStI?=
 =?utf-8?B?cTlzMU1sclA5YVcyeVMyMnAyMUthNEgyTmNGWXJ0cElLOUlScGphYzE1YUd2?=
 =?utf-8?B?MnNxYUJoU2hVZXA1WTMzaldmTWRGUFYyZ2UwV2Q4RGZJTEQxWHpvOXhydE12?=
 =?utf-8?B?Mkh1WCtFdmliVmUzZTBJcUVyTGsyUlFHZWZlNnIzYUgvd2oxN3dDc2hYSVp1?=
 =?utf-8?B?RnlGY2dwR2tvcGZ4Mmo4TW1qamhrVTViakttd0gwanF4Z3RTN3lFaDc1MU9i?=
 =?utf-8?B?aGpqVENhWVJCRWFiQWhVbU5kdFVFZDBoUUtDSnNPem92c25yTTQxT3p0ZFRu?=
 =?utf-8?B?UVZkL3dFNklJbTlnRk1YWDRZMkM1Mjd3WENueHJnRFlFVXNJU2VtTHkyK0pM?=
 =?utf-8?B?UHNaZGlWQVhBVjU5N1ZJWkhBd2g0cmt1MFNyVndlY1pjMCtaNHRlM1A3Snlt?=
 =?utf-8?B?ZWVuZzhEa1BVcmtTc1M5TmdDRnpRWktWTG5pcldQM0FRdUZPUzFnVjMxbkNO?=
 =?utf-8?B?M1Y2YlFFVmY2VThYY3g3czRkS0NJYlNITUIrVU5YTGN2L080bkVLcFJkTUVm?=
 =?utf-8?B?QUVDSlVraThvY2V4VFRVdjJUVjBaWG94TFlqcElJQll3eVg0R05nZzBZei95?=
 =?utf-8?B?aEJ3aHpBcFBVYWRDdlFRSTNaeHZvOW5CSUpUMTdGZ3NhOTFDQ2x6NHdpOE1r?=
 =?utf-8?B?ZWQwVXpHbE83dnJLQml0SCtQaXhlUGovcnZIR3dsS0xUYkFMQkluSEM2dEI2?=
 =?utf-8?B?YTFES1BCRUpZNlBXdUw3Y3VDT3J6dDlWQk1GSXg3TWRkayt5b1ZqL3VBalE5?=
 =?utf-8?B?VUpLbnNxRmhuaVJJYWxLZGFzVzR4SHVMYnIrUDJSRWdkSGhUVGV5SisrSUl6?=
 =?utf-8?Q?5LOsPJzwTy6E4TXew/DQxAa24ilJV1a3Z5b6BS7n/BvJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367fde05-9652-49fe-d155-08ddff6fc3ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 15:49:24.5684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLGgziGgYpE510Kb3aAsv8zuIRyy5etle7enn3hVNQqnvlDzo1sJuk4li5+7UFnZKSLrdc+Lz5OEE2AHI+Q4Z4xQTfGid5wSM/wjCXXvGOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE5pbGF3YXIsIEJhZGFsDQpT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI1IDU6MDUgQU0NClRvOiBDb2xpbiBJYW4g
S2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT47IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRl
bWFyY2hpQGludGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxp
bnV4LmludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPjsgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0Bp
bnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXVtuZXh0XVtW
Ml0gZHJtL3hlL3hlX2xhdGVfYmluZF9mdzogRml4IG1pc3NpbmcgaW5pdGlhbGl6YXRpb24gb2Yg
dmFyaWFibGUgb2Zmc2V0DQo+IA0KPiBPbiAyNC0wOS0yMDI1IDE1OjUyLCBDb2xpbiBJYW4gS2lu
ZyB3cm90ZToNCj4gPiBUaGUgdmFyaWFibGUgb2Zmc2V0IGlzIG5vdCBiZWluZyBpbml0aWFsaXpl
ZCwgYW5kIGl0IGlzIG9ubHkgc2V0IGluc2lkZQ0KPiA+IGEgZm9yLWxvb3AgaWYgZW50cnktPm5h
bWUgaXMgdGhlIHNhbWUgYXMgbWFuaWZlc3RfZW50cnkuIEluIHRoZSBjYXNlDQo+ID4gd2hlcmUg
aXQgaXMgbm90IGluaXRpYWxpemVkIGEgbm9uLXplcm8gY2hlY2sgb24gb2Zmc2V0IGlzIHBvdGVu
dGlhbHkgY2hlY2tpbmcNCj4gPiBhIGJvZ3VzIHVuaW5pdGFsaXplZCB2YWx1ZS4gRml4IHRoaXMg
YnkgaW5pdGlhbGl6aW5nIG9mZnNldCB0byB6ZXJvLg0KPiA+DQo+ID4gRml4ZXM6IGVmYTI5MzE3
YTU1MyAoImRybS94ZS94ZV9sYXRlX2JpbmRfZnc6IEV4dHJhY3QgYW5kIHByaW50IHZlcnNpb24g
aW5mbyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0Bn
bWFpbC5jb20+DQo+IFJldmlld2VkLWJ5OiBCYWRhbCBOaWxhd2FyIDxiYWRhbC5uaWxhd2FyQGlu
dGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0
QGludGVsLmNvbT4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiA+IC0tLQ0KPiA+DQo+ID4gVjI6IEZp
eCBpZGVudGljYWwgaXNzdWUgaW4gcGFyc2VfbGJfbGF5b3V0IHRoYXQgSSBvbW1pdHRlZCBpbiB0
aGUgZmlyc3QNCj4gPiBwYXRjaA0KPiA+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfbGF0ZV9iaW5kX2Z3LmMgfCA0ICsrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xh
dGVfYmluZF9mdy5jDQo+ID4gaW5kZXggMzhmM2ZlYjJhZWNkLi44ZjUwODJlNjg5ZGMgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jDQo+ID4gQEAgLTYwLDcgKzYw
LDcgQEAgc3RhdGljIGludCBwYXJzZV9jcGRfaGVhZGVyKHN0cnVjdCB4ZV9sYXRlX2JpbmRfZncg
KmxiX2Z3LA0KPiA+ICAgCWNvbnN0IHN0cnVjdCBnc2NfbWFuaWZlc3RfaGVhZGVyICptYW5pZmVz
dDsNCj4gPiAgIAljb25zdCBzdHJ1Y3QgZ3NjX2NwZF9lbnRyeSAqZW50cnk7DQo+ID4gICAJc2l6
ZV90IG1pbl9zaXplID0gc2l6ZW9mKCpoZWFkZXIpOw0KPiA+IC0JdTMyIG9mZnNldDsNCj4gPiAr
CXUzMiBvZmZzZXQgPSAwOw0KPiA+ICAgCWludCBpOw0KPiA+ICAgDQo+ID4gICAJLyogbWFuaWZl
c3RfZW50cnkgaXMgbWFuZGF0b3J5ICovDQo+ID4gQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMg
aW50IHBhcnNlX2xiX2xheW91dChzdHJ1Y3QgeGVfbGF0ZV9iaW5kX2Z3ICpsYl9mdywNCj4gPiAg
IAljb25zdCBzdHJ1Y3QgY3NjX2ZwdF9oZWFkZXIgKmhlYWRlciA9IGRhdGE7DQo+ID4gICAJY29u
c3Qgc3RydWN0IGNzY19mcHRfZW50cnkgKmVudHJ5Ow0KPiA+ICAgCXNpemVfdCBtaW5fc2l6ZSA9
IHNpemVvZigqaGVhZGVyKTsNCj4gPiAtCXUzMiBvZmZzZXQ7DQo+ID4gKwl1MzIgb2Zmc2V0ID0g
MDsNCj4gPiAgIAlpbnQgaTsNCj4gPiAgIA0KPiA+ICAgCS8qIGZwdF9lbnRyeSBpcyBtYW5kYXRv
cnkgKi8NCj4gDQo=
