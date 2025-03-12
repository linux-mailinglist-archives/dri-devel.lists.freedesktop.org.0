Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95383A5D50E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 05:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67910E6BB;
	Wed, 12 Mar 2025 04:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/XtXnSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F04210E6B6;
 Wed, 12 Mar 2025 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741753189; x=1773289189;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KjogwFK48+aqWMzBQU+orGOmy2WW4gNxzQ0m2uSpSlo=;
 b=g/XtXnSAzydKM6FuAbMX+74d/6SnZtjLB2QeAnK3npxN/X0ktqxB1CCx
 gDYmc9xap/3u5YUFfwtqL0PR9hbcd/uw1tMMPgB0J420LnS2ecfrFIHGr
 /Eq/1GGGAuJDlm8qiPB3uuU28qG9j+UUKWs3B6zUVcCKcoSnJb7W3iU7A
 sAV3280zC/k7Z8WE3BzPCAV8ILN1SlAPcamsLXuL0uM/QFj6lHMM0vnVO
 wAsq0ZxsLP+RRn74qWbv7NMLbyG5Z5ZUB79rORk/bLdlB9bQ5CaaShe1S
 KR3D7gAtR0GkhnCPxjSAPozhL+4Qov1jNABID9CWNMiUsA31wvXt4lwY7 Q==;
X-CSE-ConnectionGUID: hQ575Fv9TveBqQ+RD4snjw==
X-CSE-MsgGUID: MmSBn/F5RMqAD5DizktQ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53022172"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="53022172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 21:19:49 -0700
X-CSE-ConnectionGUID: R2t9oF/WQ56SJn7KhR/wOg==
X-CSE-MsgGUID: MznYOFD6R9uK7oc2yQc5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="120490418"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 21:19:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 21:19:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 21:19:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 21:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrOKwxk6px6b4qV5E6xtv8c0ZtVJFrXNbqX9cwHZhmuHH4eutyO5QFS2xeMMdPLmUdCOUr9PMklExAqDH9xtAVjIeRpzQFhfXmipWhPF8BRxSpGswprdizejjHGF4Y7g8XeMtkYvg4h1jgD9ams/izZcUx8HmStECLyGpLwTIqs6fGk8tEO4y3TNMpExux+f3m4ywWDy2g2veA+K9aiHAmnrXXynRlNgWptfSf17GAyWXh/sM+r6/EfXu1ByMBxN+bZcDJ61xkF0zM9DWHYa8fKHdLMBS8lOZbjzoZfmr9vlPG/E/JZHq/25ZS/DnZ5s0o8P/IuZZtDLWYcrxSZljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KgYHCxRKGpOk3iZOKhoxK7z8pZBPTk8mH3rcOn5bBY=;
 b=X3d0tZLzZzivJjqaJ40egMqD0/ATuUr6z+xQPPl1TLYjkXGdCkN/a4lBDQCo9iBllhUPZHFMkyw0Tfu6gSrQbce0nxpnTrvdpehmukmLR2zUWtuR1BJY/uywvx05K1jloFpY1T73APYS8rTauAG5azDaJx1694HJ5xHlURePHxy4TIh/z4chlyoVRUv6YqhAS5fvGIPDRcClQPPnJlr779yEh7QEc2vdd79EIRnlmFbWWmfsK8HoZeamuKFDAyLh58OQq1l/l/PBkMa262KifMzVZGa4ZVy8/4g9EpA9Jt01Lk1OYq3b1kIdGDTUBGT19SgTTtypphcPrdxYBckI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.33; Wed, 12 Mar
 2025 04:18:59 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 04:18:59 +0000
From: "Zhang, Jianxun" <jianxun.zhang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Topic: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Index: AQHbkeCBNr1za9vwG0GyIufnEkKJtLNtXoMAgAF+0CQ=
Date: Wed, 12 Mar 2025 04:18:59 +0000
Message-ID: <CH3PR11MB8707D3F7E90A416BD47DA1E7F4D02@CH3PR11MB8707.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
 <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
In-Reply-To: <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8707:EE_|PH0PR11MB5879:EE_
x-ms-office365-filtering-correlation-id: e5d31b8c-b411-42d0-968e-08dd611d038c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?MLj3hhF4sO495Qo3yn9CSURry7fIYmTNJ/yeYWDUlPr7GHCFVzC5DFU3uD?=
 =?iso-8859-1?Q?qsfj3LfUHrdSHPT8P/e5v9ebmxaTABI+eWK6sAX51Rp9m0zKSWoH7xZNk7?=
 =?iso-8859-1?Q?LDVXycguPS6SF9AYEg7VFnCNIX0sqoiDLQkoX+HPLtLl79x+dqIAxWnmYW?=
 =?iso-8859-1?Q?9+rjPxEmOntn6DUHksuF2pAdWwX5dcmAsN8or3c/qnRRP3szV2nBJYuz1F?=
 =?iso-8859-1?Q?jLx5fRTHIPt0zhaAOrxkvXuGfhfBfasLsKPxu5j81gm0TzspAzlaysRITW?=
 =?iso-8859-1?Q?bon6ZA1iNdcTidLZJDAV1tLMpOy216H+OWYG6G9vZLDLP4dIeLHbp3HfrX?=
 =?iso-8859-1?Q?XTZiKTNuYLftc9GkLxdMypzZQf/YBVmjCdN/vjx9FkyCOEpBEqWT1/rFgI?=
 =?iso-8859-1?Q?6Y0CliZq6escgXxiCW/5M8GuDbZUUcVkwdlP6HQueZqd55jMTDn/RZHsIZ?=
 =?iso-8859-1?Q?xR+pzQInWMz0b/IMne+B7H/1YWPTHnDDrPeKWd5tr7h0EDHjMXAXGfhk9P?=
 =?iso-8859-1?Q?2rWamnml5BnBLGfusGwTuPY3Z/6Wicb0bgoHXk463fCRpsdOs4NiCb9NTY?=
 =?iso-8859-1?Q?o9NLHuQbJPg2DvmIevCX5KPNdSO70dwqwboQ10CWdl3mBPWgL+/jWBy8MD?=
 =?iso-8859-1?Q?RtdBuT9bOnsy184WwBErldBZUb7Tr5DyhzViClCDON8fqOwKMFl9a1uQ5B?=
 =?iso-8859-1?Q?7OUUmL4FTrRS0L2LD0bu7bSE+nbetFedXutwCdLJr8VPonl7xosD1rWMWG?=
 =?iso-8859-1?Q?lKtUPXJsb+eT+SDgyOnuWY+keDQ77P3+to/0H2c6PgP13f/JowFhq1+VDA?=
 =?iso-8859-1?Q?RphKQZ8K4Ly1BP0qorcudyGQanb1a0r2zpunhd4ScYjChy/3gUVrKruTwY?=
 =?iso-8859-1?Q?oPSDWW3FJ4VheN+ZxARsdS/lgo7H/UHsuhZRy5VPqVTD1BdJSGBnoh8Z73?=
 =?iso-8859-1?Q?hpJyXe01ZfpXLkMH7Couw4IzsL6ah1/koWf/9K0Zlry2qCE6IA5mDFf8uY?=
 =?iso-8859-1?Q?QddAskozHaqexQ1yOojz6oh8412IaLFCbKKGHu0RGYSwLlO76Qp4qP4GQ4?=
 =?iso-8859-1?Q?ihCjTQVUk7FDUUDRGHK/MZYGnQMA8CQ0faLrOJzHO5VbJZpBGXNTzYJe3G?=
 =?iso-8859-1?Q?EauhdlMV7dOtX7r7B2RRNTlk+7WRNT1rnX0narlhicf4KG3KaL+naVozAz?=
 =?iso-8859-1?Q?0+0sS7cenulQiH/6H7FrnmJ1h7mBhybWrJhCtmWRZPpu3ojbbUXzrMxw+d?=
 =?iso-8859-1?Q?yMMmAqKjOjn8rBVxeho8KPOk1zWAHeOh/8+WT/4uxoihcvTW+hKpcju5FM?=
 =?iso-8859-1?Q?hzj+SDWHqihbgoC1/NkfWDM7DvzHk4q4uMSB9IrC3W75L0e9fzDlJes0BA?=
 =?iso-8859-1?Q?EOk/18jgLrJlrD4BHgFMeNqCsq/DeKwCiee36jDRl7qfGhF4PXPwICTaKA?=
 =?iso-8859-1?Q?P4QoLtKzKsereXe6tzKb4VBId1PnUoxPT/RPvfI7w2LAc75hGiJE6xftge?=
 =?iso-8859-1?Q?eqTv5ataD/XqX80OKCstrE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SlP9NkFFT7Fgp2ek4cpD+5N2xGgguATQ0txdhceYOtS61Cac1apHWDJi6J?=
 =?iso-8859-1?Q?ZCTK4XMbN4AUZ8Mua5LFTQANfpAQNaQb8lA05rZIS4lpwdaMbn2S2AZca2?=
 =?iso-8859-1?Q?QY1IzTMA/VfT0WLPuFkdRlRy/1FPdG1fbvuj6vo4Q7miKdqTglTIkxmklz?=
 =?iso-8859-1?Q?Ja8DYIcbEvYSgDsO5EIV9gh17hDf2mjOBaeZAQ7IR8OKOeH5Z27Mlz0kx2?=
 =?iso-8859-1?Q?HS/rOuRUckDLjGT4SOZUXUDc+zUpPhjkIM2wKciyF28Sp21BGw4kvRKH2c?=
 =?iso-8859-1?Q?GucJXZKpGM3sUavozFW17c97wuvdWHo0wW9CMmYlhTpDxl6LkrXdzZ8ods?=
 =?iso-8859-1?Q?c1lChnt2kyRBGc0BrGqJ1Ax8PFuSZ0a5qBACGhYwICbXsL9EgRGfvxlIWh?=
 =?iso-8859-1?Q?muJK8m7kNIqTA62eCOY6CXEgCJNxFeiXTemBX7Ec0IRax8P00EYh5v8B0I?=
 =?iso-8859-1?Q?TXVuVpHtCwWfDHPhh959xQ8iTwlSEE+APaoLKd1Cq864k5l4z7DvmKpl/P?=
 =?iso-8859-1?Q?Qn2yOsmV+awyJ096AFBFz6A5bJ/2Y8+itYDLzE5iz54ckAASgUvGbJL75+?=
 =?iso-8859-1?Q?92O515fjIyrKDlpoTmto6iSfTQNklOKhigd7MHyDL9LzZfoNB72PV1H5JN?=
 =?iso-8859-1?Q?smZprPBhpBjLi1f5KJga/G7BfXNWHgm37TSX5o9T3ZZXS+0AZBdgQCeb6r?=
 =?iso-8859-1?Q?xiv2ZDgJVo2cMExaNL4MVeN1zs/8sZI2Mt0kNvlxQ5vkxRq84bWaRpC4GK?=
 =?iso-8859-1?Q?KdMRRnQ6XyZ7S7MDkeFIHahKOs+6G44PjZdDKxwFYYEr+uRPX/Q/9WrZKq?=
 =?iso-8859-1?Q?/b9KojoXANr9WJAYDlX5JpvR2e/SkfcGTCVd9HGYHUDjFMSfoqua2i8X8r?=
 =?iso-8859-1?Q?6ZGm2QVdMM1JDo4oEiJj9CoQFscpXa8UZNXfTGT6tPj+XM6gt8ULBMG1Gd?=
 =?iso-8859-1?Q?9XlwvxdOTW4sPb+WxyqRxY/fK8/nI/NToJnd4mCG8hM+eluFotYtnLuTcT?=
 =?iso-8859-1?Q?DfVLNqlt1iLSiG0KnS5iDkcSC1lp8o8TKNL+t2l9vi5m52Ph5cCPuAY5G8?=
 =?iso-8859-1?Q?hPoXgnZa2idJdy1yWcztw0PY+mdcfK3/5L9Tw4tX3zu62c9FSJ7+uf8tGh?=
 =?iso-8859-1?Q?OoYbW9tqGHBuIrKgTqYpxMXndsyDceEM3JO0WCjARqGneLYPqR+unlNZ3Y?=
 =?iso-8859-1?Q?aPhzT4iHqPpyUIHApHS02fMfT+03M5vLKBH73GD7bclts4DrALQoyJNDYh?=
 =?iso-8859-1?Q?QqwYwptZ7F4ZHDrYJjS7M1p6mXgosNqQjm0jH9HR3Swq5nWuLUmZHmcXJa?=
 =?iso-8859-1?Q?mf0K6YlQgkqLWZiu79kyzaB9xMf9Jne4a2CsNwOHCjx/hwWigcF/7sRWuR?=
 =?iso-8859-1?Q?rXOf1qya4CU2W//JHo8VlfXzKbzuPTFADpLlRn1PSHXWjLQ2OVdQLgbRN6?=
 =?iso-8859-1?Q?FOLXG1UYEFpi/ZRBJXW9BNBZLFUCERSU+z8OBLT7pIRCIaEVMsehkMrZsu?=
 =?iso-8859-1?Q?xYCbiw8512ZRQPmEU1xomIwBZuQcUemz0aRZsSXrTSC0wRKWe+niksRTBN?=
 =?iso-8859-1?Q?XmM1D0KAwepB6YsdEFfky7VQi0Htg/XyaGM2GuURCTANBI0tG/jkC9rEYi?=
 =?iso-8859-1?Q?lhj8jVO6ipDwrqJ9C+ZMql2TrODuyrfMYv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d31b8c-b411-42d0-968e-08dd611d038c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 04:18:59.7500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuSbMFL2uV5f95R3kivEqTzeOAPo/3b8Jxfub1Fk6qoJw761uxYQmVALA4DrgENMbreNo07WPCAN2Wiy1pDZhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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

=0A=
=0A=
________________________________________=0A=
From: Brost, Matthew <matthew.brost@intel.com>=0A=
Sent: Monday, March 10, 2025 9:50 PM=0A=
To: Cavitt, Jonathan=0A=
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg; Zuo, Alex; joonas.laht=
inen@linux.intel.com; Zhang, Jianxun; Lin, Shuicheng; dri-devel@lists.freed=
esktop.org=0A=
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults=0A=
=0A=
On Mon, Mar 10, 2025 at 05:18:32PM +0000, Jonathan Cavitt wrote:=0A=
> Add initial declarations for the drm_xe_vm_get_faults ioctl.=0A=
>=0A=
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>=0A=
> ---=0A=
>  include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++=
=0A=
>  1 file changed, 49 insertions(+)=0A=
>=0A=
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h=0A=
> index 616916985e3f..90c2fcdbd5c1 100644=0A=
> --- a/include/uapi/drm/xe_drm.h=0A=
> +++ b/include/uapi/drm/xe_drm.h=0A=
> @@ -81,6 +81,7 @@ extern "C" {=0A=
>   *  - &DRM_IOCTL_XE_EXEC=0A=
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE=0A=
>   *  - &DRM_IOCTL_XE_OBSERVATION=0A=
> + *  - %DRM_IOCTL_XE_VM_GET_FAULTS=0A=
=0A=
This should be a generic "get VM property" IOCTL, not a specific IOCTL=0A=
that only retrieves faults. This allows for future expansion of the=0A=
uAPI.=0A=
=0A=
>   */=0A=
>=0A=
>  /*=0A=
> @@ -102,6 +103,7 @@ extern "C" {=0A=
>  #define DRM_XE_EXEC                  0x09=0A=
>  #define DRM_XE_WAIT_USER_FENCE               0x0a=0A=
>  #define DRM_XE_OBSERVATION           0x0b=0A=
> +#define DRM_XE_VM_GET_FAULTS         0x0c=0A=
>=0A=
>  /* Must be kept compact -- no holes */=0A=
>=0A=
> @@ -117,6 +119,7 @@ extern "C" {=0A=
>  #define DRM_IOCTL_XE_EXEC                    DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_EXEC, struct drm_xe_exec)=0A=
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE         DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)=0A=
>  #define DRM_IOCTL_XE_OBSERVATION             DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_OBSERVATION, struct drm_xe_observation_param)=0A=
> +#define DRM_IOCTL_XE_VM_GET_FAULTS           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)=0A=
>=0A=
>  /**=0A=
>   * DOC: Xe IOCTL Extensions=0A=
> @@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {=0A=
>       __u64 reserved[2];=0A=
>  };=0A=
>=0A=
> +struct xe_vm_fault {=0A=
> +     /** @address: Address of the fault, if relevant */=0A=
> +     __u64 address;=0A=
> +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT           0=0A=
> +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT   1=0A=
> +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT  2=0A=
> +     /** @address_type: , if relevant */=0A=
> +     __u32 address_type;=0A=
> +     /**=0A=
> +      * @address_precision: Precision of faulted address, if relevant.=
=0A=
> +      * Currently only SZ_4K.=0A=
The fault address should be no ambiguity, so I think the precision should b=
e 1 for page fault. Please correct me if I am wrong here. =0A=
> +      */=0A=
> +     __u32 address_precision;=0A=
As I mentioned in offline discussion, I suggest we add engine class and ins=
tance into page fault report. I think it is important to know which engine =
the fault was from.=0A=
=0A=
> +     /** @reserved: MBZ */=0A=
> +     __u64 reserved[3];=0A=
> +};=0A=
> +=0A=
> +/**=0A=
> + * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS=0A=
> + *=0A=
> + * The user provides a VM ID, and the ioctl will=0A=
> + *=0A=
> + */=0A=
> +struct drm_xe_vm_get_faults {=0A=
> +     /** @extensions: Pointer to the first extension struct, if any */=
=0A=
> +     __u64 extensions;=0A=
> +=0A=
> +     /** @vm_id: The ID of the VM to query the properties of */=0A=
> +     __u32 vm_id;=0A=
> +=0A=
> +     /** @size: Size to allocate for @ptr */=0A=
> +     __u32 size;=0A=
> +=0A=
> +     /** @fault_count: Number of faults to be returned */=0A=
> +     __u32 fault_count;=0A=
> +=0A=
=0A=
fault_count is implied by size.=0A=
=0A=
Matt=0A=
=0A=
I think we should remove 'size' and just use fault_count. It is sufficient =
for user space to calculate the needed size of memory by fault_count  and s=
ize of xe_vm_fault. In this way it is also better than just using 'size' th=
at causes everywhere to do a dividing op and check the fraction for getting=
 fault_count. Also, the only place to use 'size' is memory allocation. But =
I can imagine multiple places in UMD and KMD would need fault_count.=0A=
=0A=
> +     /** @pad: MBZ */=0A=
> +     __u32 pad;=0A=
> +=0A=
> +     /** @reserved: MBZ */=0A=
> +     __u64 reserved[2];=0A=
> +=0A=
> +     /** @faults: Pointer to user-defined array of xe_vm_fault of flexib=
le size */=0A=
/** @faults: Pointer to a xe_vm_fault array of fault_count elements provide=
d by user space */=0A=
> +     __u64 faults;=0A=
> +};=0A=
> +=0A=
>  /**=0A=
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_C=
REATE=0A=
>   *=0A=
> --=0A=
> 2.43.0=0A=
>=0A=
