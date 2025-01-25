Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32CA1C1DF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B5A10E230;
	Sat, 25 Jan 2025 06:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWx4GNmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E010E230;
 Sat, 25 Jan 2025 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737788126; x=1769324126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2FUrbu484g4OWhjb3aaJ1tWeiBsl5Kv7f36Zvzj7bsk=;
 b=hWx4GNmVOYstwrXa2kxhT6NcFscREYHONQ66dtztVVSqnME4ZoRlsl6h
 z6gfcFmKLMXsSYI22enRTOVW2Xr5eDkqYChHl6WSWbYf62ldHqCMbNtiC
 /cE+sTpfNpFEJ0V09YqOkw3euU1q6kAcsGCJ5aqRlCABxbmVUwnxXBHZt
 ZP0jLGgO/VrCEhQcLzJ/qHwA8itvB8IKEE6jlyJYclTNv2g8e/HePviw8
 KxNFqaq9i89XN3qvuQyjyASEO8SHmIAdOhERxiwKTBpkjnbgOBqJSzgZt
 /3dUG0B0DiPaniGa2d8hv1FhEJBqDQ1LgoKNjm/7m75ksyLEHAgf/kCrs A==;
X-CSE-ConnectionGUID: uyxBaGeiT9qV3z/53u17sw==
X-CSE-MsgGUID: pCqif6kaTBS/OYqciTbiMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42256189"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; d="scan'208";a="42256189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 22:55:26 -0800
X-CSE-ConnectionGUID: rnUSDf1PQfG0hYuwEh+k2A==
X-CSE-MsgGUID: yseHPyO1STGVOKnYtWyyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113104799"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 22:55:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 22:55:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 22:55:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 22:55:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sni1y33Xg+jTPZo/Wa6Y1O3J4CHPT4BgX76bhN67yYy93BPOR0DMzVwsxtbT1d+9wO2i0cS9OkcgdQvT3Jmvy/s08ACmqHxVwO/qmULZL4W5E8HaOH7E5ZpVVEFoypRJQ0k/42KVtJSjV9Z6N91taUTf2EHCYFtR9oUvJOJ/FSfG1wKK13IwSYDWRGgfDi5OT2Q1dNBan8qMltLosA1hfPQ+qkQF6pXL6L3tODuZW2w1sqETQoNK4ayNGfwFyFv8S+Gx8uN+h4G5by4GxCMgfEuUGQnDAgqxa48LAr7p+Mtx8n6zqGN63JeePDTM+03SFYYWSVYnBwfbJrrWn40O/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0ovtj0peQeNQZd/CVgCWbiFLna5hkXdrnRfqIvS9UQ=;
 b=poa09kciAvCzqXKwTVCWEAHqyBE6YFyldcqFZgOKVuH3EyDgd5gmdUlfnBBGIpeLv1mdxNTPFRVlCIEbhQgiR+GA/Hr0bzTQIag3qe/9qtigCNLHgyUOBGS4NEvs1EFm8FeEGliSUCyaHTOubVvsrnBpmARNmsdyDVk4uPd752oYCzCvFgYVHbz96bURaYpj+vFlKzX90icKpShFx8Ww/WEj5L15Sr12Y1gwaeaABnhQIUWUChNuPQiWg8evb+NeduP5o/nlpAvau7mEcsV0gsn+Y0pPjitlO4MQi5+lNKeRWWQcciq4OcJNWTWkdw/wELoH4Bwabve6PA+JBHepkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Sat, 25 Jan
 2025 06:55:23 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 06:55:22 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzhgFMA5eT/kS28E0OXJhdlLMgNIsAgAJivbCAAXgNQIAB0sQAgAFFscA=
Date: Sat, 25 Jan 2025 06:55:22 +0000
Message-ID: <IA0PR11MB73072C33CA9E5584C0654467BAE22@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com> <Z461PqtBPu2z9GPh@intel.com>
 <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
 <Z5N4ko2GqOhCvdMJ@intel.com>
In-Reply-To: <Z5N4ko2GqOhCvdMJ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5868:EE_
x-ms-office365-filtering-correlation-id: 2bbf76be-84ed-40c8-b791-08dd3d0d3d2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7aIAkwKcg1ZTfG4ZadWwLbf3riJxflIZeZRTO+N7rgvmBZQDMO0+D1wUNP?=
 =?iso-8859-1?Q?O4Lh054LhJZG6DQqhbmNW5uxg96yyrZPqGfsKKpeEPSMm2TloVmVzeYVRU?=
 =?iso-8859-1?Q?b6ZgoeGfqdMt+GYceldpb9hHEVLHPMVDVBrOAAdDEX5cngIxEM4WtEQp6g?=
 =?iso-8859-1?Q?oykA0inNyRdDoWynAgLWZRKtV7ucTIUvkUWgO+BdN26zI+x9RDHLpPfRJo?=
 =?iso-8859-1?Q?IViROVz9UTAbeMY8s21Fq70nX/OtT41Tmv03Q5OaDKN2fnnH33lrLHVUcU?=
 =?iso-8859-1?Q?CYyz8205N4kfKn7J/1iD7GK4jRxq1y06GHP1XB83/GyyqnnFTUL1khpxBK?=
 =?iso-8859-1?Q?jQ7iEVYLWZcIXY8oEkkorCNGXRnGPmM9yTXFmmYeAIU1K5a2UrBprrO73Z?=
 =?iso-8859-1?Q?zOJBz1HFqOcFE6kYsoVTsWbaemir4YS57Y+5B8O9oypJNxVFObOtgaNrBI?=
 =?iso-8859-1?Q?XdRxPgSnRsK8VULWSBdrYS2Y3M2IkBPLq/3jBJSYkuTrQ0DvVQP7jYQnM5?=
 =?iso-8859-1?Q?emT0TTC5OTAE16Or89AU7G0QJ4Cb3g0592xCg2xgxmRqL4fYzz7ficpA+f?=
 =?iso-8859-1?Q?zlJnaItJehtVXoPBJ2uUQrlc9YoBQKTm5C28BJiYBCMB1HG1bpl8nRcKXa?=
 =?iso-8859-1?Q?nOfvrWl7BtS/+mkF92qYHKXOQfeazfkazsfIrFN6gW4x9IQ9CEyLY5mIcE?=
 =?iso-8859-1?Q?RqK+2j/c6JVbld1IrQm6z8h3moqhMu5gbGh4u43mCG5Wj63EBjHZZsDJX4?=
 =?iso-8859-1?Q?kl27dZypo819F63/efrLp3xJAMBVgUmE2Fe7fcThI78S6t8hpgzSFidDDT?=
 =?iso-8859-1?Q?TjNW7WdUdlnTxh7P1PEDtwKOrMoq8rtFRZ2iLoQ0iI1LCEwpAuIIHcR5eP?=
 =?iso-8859-1?Q?k71wGdm9jpnXXW+dJxiXE+0gkI4XhFQm/TAkfmLY36jzOrazB3BSJf1tkf?=
 =?iso-8859-1?Q?zRGSMsZEdDUYL12DipJ6Ca7I+L+N7gi2+K+ECePKtHfGZDPfr8luerL68r?=
 =?iso-8859-1?Q?BCVHaLFoGdBmdeSp9MrDIZqUh3U47WvcoN7eVa99ozQskExB0z1ks3GSnf?=
 =?iso-8859-1?Q?Z6pVBa0+JOxuHOvHJ+rsS15Bw4fiULkmieVs5/N9wbjq158cUxDJOMPbsF?=
 =?iso-8859-1?Q?5j+LrKhFa9loiegPR/SHwQLoXhaCAyQUfY7VBnxGUyo+V0enxAf7YdQsXf?=
 =?iso-8859-1?Q?J3Ur1+3cVY2KxXAGd77i9I4uqtESK2zkBLXnh7JTzrwigaR2GT/dg5nGGT?=
 =?iso-8859-1?Q?dxI3Q/g9c00CNy43UUHreG/TDyfNWOBgSLtB98mgkF3MWMIEOSMmmJmsdY?=
 =?iso-8859-1?Q?xNf5Y9XiwHi5T2Sj9+NSMFLiH/fx8mNc6FPqRcCfjy5ifXU0B0rTt1Ch0N?=
 =?iso-8859-1?Q?hov4yfJRpBd5PcsdMQDmrpZ1NjeWWyOLthF5kKWqJcapbhvORqAdqFkmCM?=
 =?iso-8859-1?Q?Z10P75U+77jIltZgGq/82tJJw16xkOcO9bC7H2vSdEp0fOURanttxgo+pB?=
 =?iso-8859-1?Q?E1E9CaeVfn4DZe9jGNUTF2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0kH8r19ZsCtWgrye7gJLU/pHpJ76wWiEg39k+0w9KLN92srA+jObZWS0Am?=
 =?iso-8859-1?Q?I7iY0D23tt8lHtZz0n2mZtfNXQKzRfg0ej9EydC9WRyrCLvejiNn9ZQFk6?=
 =?iso-8859-1?Q?jfimeQ1ySHLPcOeulDaTjIESZUNzl80P+0mqZpuh9QZ4OvQpS8rvAZ2jjg?=
 =?iso-8859-1?Q?Sr+RzcV3Cb2wVYZOPCm4X7xUFwDrV6rXlL/YX222XNKNxriq0wJVFFyrKD?=
 =?iso-8859-1?Q?HC7Emz6cyZktVclKNsfRVfKW3vfVXr3i7ZhOwZ1Hfj7+EKfSmnfFO6Z7z8?=
 =?iso-8859-1?Q?CYvMFXDeeVy8oEUgZaGpkGQfPaCGFqtMRe+AYZ+onysPyAid2nTWdDrYYC?=
 =?iso-8859-1?Q?cmiJwWnCkV1YRFF/hf2d3lqqDOT0K9Y79/yeI6nlrD6gwpHyXrUw8WNn0n?=
 =?iso-8859-1?Q?idBs/a0wPfb/AFZY9TdY99sIWp+vOgeSHftjk2qYUtvICT3+JpikerpA/y?=
 =?iso-8859-1?Q?vASuyJ8a45cT139STRW3RR1Lnx8ypPsWavpxMlon4n/Cnh0gqLCRYm6OfW?=
 =?iso-8859-1?Q?88KJIYLZGYJDavd4RZV41CT1QRH4gu1CTb/ISMk2SFjg2bINwwKVn7Rftw?=
 =?iso-8859-1?Q?EcXpByFZsULxc9W+phiqn8JgtNSZSzO3tSWVfkrTYeO+4g6unfAwbAmNnJ?=
 =?iso-8859-1?Q?hcmPVXOnCT0orycEzRWhYs64ExgwBD0mhDlkRis40JgUnzCWqVjJBeW4xC?=
 =?iso-8859-1?Q?bKi1DVuDzIOepjeu7AiWdSEJMWOEFSdmVa+9ZpQE3I3JBLNxzb0k9ly4NW?=
 =?iso-8859-1?Q?7xNVKfcPi42cmwiCwdEwDDmdxwC5fxoacjkEPGD1jUy35JuHT5dSLU4/c9?=
 =?iso-8859-1?Q?CTMqE6KoP2jsIBRsenRu6ZJLI8ZllfSyMjCZoCslYK6/2rMvse4GLT/QMj?=
 =?iso-8859-1?Q?QLynW3hFuv+l6986JDPlvkNtQ+DXuZhUhiGaS0AwK05TDv5LNk+NXl+Oaz?=
 =?iso-8859-1?Q?WkyGL25dvlDP/hBgJGPNuZiNjq4neys+X1Pn8+NyUEZ5LefEOOaRdUoe5n?=
 =?iso-8859-1?Q?Ne6kN8DOInYd4vVyFcsOuaK3bXN9XnwaztMxkx0qiBx6Iw5gZEO0Tp9Qjv?=
 =?iso-8859-1?Q?MZrdxj0Sd/GtuH98ECTqNROCbs79z719QqB+Y4b0R6Z2zPzc4Zi7CSSt4i?=
 =?iso-8859-1?Q?j/EvWOYABZrX2F2uL9EddjCLqqcKRtQy3pPMgn5RRwm5j8FamNLLxPd3vi?=
 =?iso-8859-1?Q?/R9igEcGxSoHSCjZNh5XRKyXzbKYF9lT2nDW2z6J8SpNlIXuX7SbHm3t36?=
 =?iso-8859-1?Q?MyQjtB5koXSJkXqM1P89HaVvQrzdEpC2j+uwrKDs60VqOZ0VUIXpD0wcJu?=
 =?iso-8859-1?Q?j+NGnDloClxulmA1oLNhW3YlO1ro8VDC+ocSCq9FcPes5GdMyA4Ifu1Cih?=
 =?iso-8859-1?Q?thsAUCkSgYLA6zhEMiZt0g5noGv7EgyIthm6t2ZqE0IRFzHDBypE/0PM+f?=
 =?iso-8859-1?Q?28OcRe6JfEXTWcQu3h3+tmgcgKhWPTQACtcHfOPC/VQMCetXraNjTxZEqy?=
 =?iso-8859-1?Q?Yl/u5QlTDkwcPl15yQTKUrE+vz2iQ+qYMhgjZiogodszYmrzLSGRQjaxxL?=
 =?iso-8859-1?Q?Twsx811bCjmH0HDKpuD5sVuoPVtBwJfr18f5rojw0CNt1UgkuRg0cKORD2?=
 =?iso-8859-1?Q?Siu2BGaMyliyUbtFwOFmWW6+eZBPscVugvadita2FLMSEOQuSC6K4lUEnf?=
 =?iso-8859-1?Q?CSitSulHE3m55ttGizGwyLEqYCf2A1OLxuH5ZnFw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbf76be-84ed-40c8-b791-08dd3d0d3d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2025 06:55:22.6122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQskWt9tpnMfPPvprs7ruueynLf/ZU0tlJBY+rY7jFHdIBFquTUfMk+x0nwieBvzfEnZXyEF2OxsGjhMqQDSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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

> On Thu, Jan 23, 2025 at 07:47:14AM +0000, Murthy, Arun R wrote:
> > > > On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote:
> > > > > Expose drm plane function to create formats/modifiers blob. This
> > > > > function can be used to expose list of supported
> > > > > formats/modifiers for sync/async flips.
> > > > >
> > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_plane.c | 44
> > > > > +++++++++++++++++++++++++++++-------
> > > > --------
> > > > >  include/drm/drm_plane.h     |  4 ++++
> > > > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > > b/drivers/gpu/drm/drm_plane.c index
> > > > >
> > > >
> > >
> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a90
> > > 6
> > > > 8
> > > > > b31c0563a4c0 100644
> > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > @@ -191,7 +191,10 @@ modifiers_ptr(struct
> > > > > drm_format_modifier_blob
> > > > *blob)
> > > > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > > > blob->modifiers_offset);  }
> > > > >
> > > > > -static int create_in_format_blob(struct drm_device *dev, struct
> > > > > drm_plane *plane)
> > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > +				 struct drm_plane *plane, u64
> *modifiers,
> > > > > +				 unsigned int modifier_count, u32
> *formats,
> > > > > +				 unsigned int format_count, bool
> is_async)
> > > > >  {
> > > > >  	const struct drm_mode_config *config =3D &dev->mode_config;
> > > > >  	struct drm_property_blob *blob; @@ -200,14 +203,14 @@ static
> > > > > int create_in_format_blob(struct drm_device
> > > > *dev, struct drm_plane *plane
> > > > >  	struct drm_format_modifier_blob *blob_data;
> > > > >  	unsigned int i, j;
> > > > >
> > > > > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > > > > +	formats_size =3D sizeof(__u32) * format_count;
> > > > >  	if (WARN_ON(!formats_size)) {
> > > > >  		/* 0 formats are never expected */
> > > > >  		return 0;
> > > > >  	}
> > > > >
> > > > >  	modifiers_size =3D
> > > > > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > > > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > > > >
> > > > >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > > > >  	/* Modifiers offset is a pointer to a struct with a 64 bit
> > > > > field so it @@ -223,37 +226,45 @@ static int
> > > > > create_in_format_blob(struct drm_device *dev, struct drm_plane
> > > > > *plane
> > > > >
> > > > >  	blob_data =3D blob->data;
> > > > >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > > > > -	blob_data->count_formats =3D plane->format_count;
> > > > > +	blob_data->count_formats =3D format_count;
> > > > >  	blob_data->formats_offset =3D sizeof(struct drm_format_modifier=
_blob);
> > > > > -	blob_data->count_modifiers =3D plane->modifier_count;
> > > > > +	blob_data->count_modifiers =3D modifier_count;
> > > > >
> > > > >  	blob_data->modifiers_offset =3D
> > > > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > > > >
> > > > > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_siz=
e);
> > > > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > > > >
> > > > >  	mod =3D modifiers_ptr(blob_data);
> > > > > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > > > > -		for (j =3D 0; j < plane->format_count; j++) {
> > > > > -			if (!plane->funcs->format_mod_supported ||
> > > > > +	for (i =3D 0; i < modifier_count; i++) {
> > > > > +		for (j =3D 0; j < format_count; j++) {
> > > > > +			if (is_async ||
> > > > > +			    !plane->funcs->format_mod_supported ||
> > > > >  			    plane->funcs->format_mod_supported(plane,
> > > > > -							       plane-
> > > > >format_types[j],
> > > > > -							       plane-
> > > > >modifiers[i])) {
> > > > > +							       formats[j],
> > > > > +
> modifiers[i])) {
> > > > >  				mod->formats |=3D 1ULL << j;
> > > > >  			}
> > > > >  		}
> > > > >
> > > > > -		mod->modifier =3D plane->modifiers[i];
> > > > > +		mod->modifier =3D modifiers[i];
> > > > >  		mod->offset =3D 0;
> > > > >  		mod->pad =3D 0;
> > > > >  		mod++;
> > > > >  	}
> > > > >
> > > > > -	drm_object_attach_property(&plane->base, config-
> > > > >modifiers_property,
> > > > > -				   blob->base.id);
> > > > > +	if (is_async)
> > > > > +		drm_object_attach_property(&plane->base,
> > > > > +					   config-
> >async_modifiers_property,
> > > > > +					   blob->base.id);
> > > > > +	else
> > > > > +		drm_object_attach_property(&plane->base,
> > > > > +					   config->modifiers_property,
> > > > > +					   blob->base.id);
> > > >
> > > > IMO the function should only create the blob. Leave it to the
> > > > caller to attach
> > > it.
> > > >
> > > Prior to this change for sync formats/modifiers the property attach
> > > was also done in the same function. So retained it as it.
> > >
> > > > The 'is_async' parameter could also be replaced with with a
> > > > function pointer to the appropriate format_mod_supported()
> > > > function. That makes the implementation entirely generic.
> > > >
> > > If the list of formats/modifiers for sync and async is passed to
> > > this function, then based on the list the corresponding function poin=
ter can
> be called.
> > > This was done in the earlier patchset.
> > >
> > > > >
> > > > >  	return 0;
> > > > >  }
> > > > > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> > > > >
> > > > >  /**
> > > > >   * DOC: hotspot properties
> > > > > @@ -476,7 +487,10 @@ static int
> > > > > __drm_universal_plane_init(struct
> > > > drm_device *dev,
> > > > >  	}
> > > > >
> > > > >  	if (format_modifier_count)
> > > > > -		create_in_format_blob(dev, plane);
> > > > > +		drm_plane_create_format_blob(dev, plane, plane-
> >modifiers,
> > > > > +					     format_modifier_count,
> > > > > +					     plane->format_types,
> > > > format_count,
> > > > > +					     false);
> > > > >
> > > > >  	return 0;
> > > > >  }
> > > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > > > index
> > > > >
> > > >
> > >
> e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> > > > 369
> > > > > 894a5657cd45 100644
> > > > > --- a/include/drm/drm_plane.h
> > > > > +++ b/include/drm/drm_plane.h
> > > > > @@ -1008,5 +1008,9 @@ int
> > > > > drm_plane_create_scaling_filter_property(struct drm_plane
> > > > > *plane, int
> > > > drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > > >  				      const struct drm_plane_size_hint *hints,
> > > > >  				      int num_hints);
> > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > +				 struct drm_plane *plane, u64
> *modifiers,
> > > > > +				 unsigned int modifier_count, u32
> *formats,
> > > > > +				 unsigned int format_count, bool
> is_async);
> > > >
> > > > I don't think this needs to be exposed to anyone.
> > > > __drm_universal_plane_init() should just populate both the normal
> > > > blob, and and the async blob (iff
> > > > .format_mod_supported_async() is provided).
> > > >
> > > Ok!
> > >
> > For __drm_universal_plane_init() to have both the sync/async
> format/modifiers list we will have to add new elements to struct drm_plan=
e to
> hold the async formats/modifiers.
>=20
> No, you can just use the already existing format/modifier lists.
> .format_mod_supported_async() will filter out what's not wanted.
>=20
Agree, to populate the struct drm_format_modifier .format_mod_supported_asy=
nc along with the existing formats/modifier list should be sufficient.
In case of async for the struct drm_format_modifier_blob the elements forma=
t_offset includes the list of formats supported by async only. For this we =
will need to have the static list. So can passing this list be done by addi=
ng new elements in drm_plane specifically for async.

Thanks and Regards,
Arun R Murthy
-------------------
> > Then upon adding new elements in struct drm_plane we may not need to
> pass a function pointer instead of is_async as commented above as well as=
 this
> new elements added in the struct drm_plane helps out over here.
> >
> > New elements to be added to the struct drm_plane Struct drm_plane {
> > 	U32 * formats_async;
> > 	U32 format_async_count;
> > 	U64 *async_modifiers,
> > 	U32 async_modifier_count
> > }
> >
> > Then the functionwith below changes it will be generic and no
> > exporting of the func would be required
> >  create_format_blob()
> > {
> > 	If(plane->format_count)
> > 		/* Create blob for sync and call the format_mod_supported()
> */
> >
> > 	If(plane->format_async_count)
> > 		/* Create blob for async and call the
> format_mod_async_supported()
> > */ }
> >
> > Is my understanding correct?
> >
> > Thanks and Regards,
> > Arun R Murthy
> > --------------------
>=20
> --
> Ville Syrj=E4l=E4
> Intel
