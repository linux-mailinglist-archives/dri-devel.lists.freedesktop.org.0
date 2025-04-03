Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120EA7AC32
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5573A10EA96;
	Thu,  3 Apr 2025 19:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iffUdwwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404C10E2D8;
 Thu,  3 Apr 2025 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743708910; x=1775244910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s2DhPRhY7AQGI8MltRhKhUCquULLmSAHQ6JQHFamh1I=;
 b=iffUdwwqe/jobiC7wwaUG5h//AtxvKm9PfB+5pr8djPT/KcfLfOtu4z3
 Ba0Vy49t0TOC8wcpEH1z3kuR7t1YxiaVmBzyAkMVghEhYCzleBRBGqiO4
 fzjVtSk/PVPCQtbA5EYUd+D4ZiM29VxlV6bqQ8BufxjWKcGUb+I1ZUNPc
 B9e61GWmvzPLjEtKkgjnX9Y9EDL1fojDH0R37QyYE226V+IE5gSnGhUd+
 S3Ldjit1m0nYWY6m3YZcfgl23Ugj2PhzCFtMmiXqcEE8SA/Dfc3cN3L1K
 pk+8DaMLUIC9/zltYGdtrKwS90msC3oPuWNNTkqMrevOhfRcx0A4f14HN A==;
X-CSE-ConnectionGUID: wjeryBD0SnGNnNzEpPSR4g==
X-CSE-MsgGUID: FRpiLkg2QsyejjZOpRJnfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56509327"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="56509327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 12:35:10 -0700
X-CSE-ConnectionGUID: lDk2zrswRVO/eN/14hld3Q==
X-CSE-MsgGUID: kWM7jFQ/QzWY5tKiTak0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158088923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 12:35:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 12:35:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 12:35:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 12:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEq6gkPAs0bPlw4PIb5vVocXMKBAZWGBXXmXW0Rt6TpoU45+5nRwYqdwN/t/dtO3A4GQ8mBJS36sL4/PkCjCWhrO7JZ10Oj+OcftNBpyYjiWG7pALRBfgw/2M6jQx1949y3cpgM/O5eGXP1W89Q/aJMJV/8U1WRNDwdlefwywIOF44MDEXb8nc1+JnsRXJ8f8GT8rw3VnwpPBFtsX36xeJBVGMFQ5xv/fhKM8BR5tMR5AKKjJT3nQSrQR6Mo4yK/qPsAhGpwZqVnIxii7tR46WcBhWDAICYuYBhHvG6Ytu1enAuRlIBleCKnEOz1jTxtOm8Czuz9x15Izab9rifrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzUHra9ZOrjN/tvFN6SeR+3BfA33Q7uYKSaeUCQXr1s=;
 b=G8HnQOOEouTjF0WoF2Z8xAZb3+fsYvVOFpTh9FQ+QHob034gkroubKfMYmyseKa1Wj0qc/83VjQibODCXIKh7583fhUzsXU3TGwOd7rUXgECLWi3dTB3UpdCP8CdKxoAUwIf9MHnrxFiCBwLZnf+vT0N+ZQDVYPN5+8suEqhlYV7eO4tT1oJE+i6HR5tXIy/4/gIGCiOiXfe7KDad07SioJvQbDfnPGvL3oGtWJYQBg6yAnYkusNpP37Z0nECUTEmNMLr9MOSZHg4+TMUo8lvUk8B2BqSHd/qlvlOaCtqPywwOvTvCSqE2FnCypV8lwvcZtGB73wxNQgBhDAe/GalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 19:35:05 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 19:35:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Briano, Ivan" <ivan.briano@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbo1UyMiUnphwNSUmsPzSU9KFF+rORBYeAgADvv1CAADOxgIAALwfA
Date: Thu, 3 Apr 2025 19:35:04 +0000
Message-ID: <CH0PR11MB5444F888B537FD5500EC09F4E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
 <4wixf3hmhcu43ikzs6omjez5wo3tzkaiox2vz7gbi7qe3uru7p@xexdfeqdptdu>
 <CH0PR11MB54447DCA3471E094766A32A1E5AE2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <idjt3qjfdvutxogngwjldus46xn2vbbr6juitybuwpmf47vthx@fv7ncchxb6c3>
In-Reply-To: <idjt3qjfdvutxogngwjldus46xn2vbbr6juitybuwpmf47vthx@fv7ncchxb6c3>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: c5dbb425-feb3-4bc5-821d-08dd72e6a257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?E495UgPCTE6F6rKm47Yg7eJuMjgXnCSb0D2eGx6fnPnYB5ecWhj1AkXi3FRa?=
 =?us-ascii?Q?qS588AR4j+2dIGP1YL4jah6XAre7alMX9fLdJU0wbGIWSAokbjXOI7lsIfjA?=
 =?us-ascii?Q?gpzTo9JRtvuOb2e4ImhUpg5+b17U9OSBf6/0TFufTKnLVekkBigk1hYUNx0I?=
 =?us-ascii?Q?TnPQT1Qu4PTwmR/7dEpYMyBy42QWUw+NbELsLs4ZWwwE+KYD3QnPzBJwdkxC?=
 =?us-ascii?Q?beak/PqZ96hzDB7UfCg1pFTyuU2/h/iOlh0WzeFpdg6+LdPVFr0JzkmA1+TS?=
 =?us-ascii?Q?QohCOpRtiUZUdwWcEv2SmRQ/5SlybaBRg2ilZRWbGNbcU8h/s+J09FULztq+?=
 =?us-ascii?Q?STYAlxwLOg9TDV/0tkcsd2qXYUuZy7kHZRp/QpXeyk8Lcw4IAFZEwZ+wWy6d?=
 =?us-ascii?Q?I1LSMncNZu3Mh6Kq9a602vIGB4QkMK6DG78rBYdD2MyECy0KUangdcX7HTbr?=
 =?us-ascii?Q?6kCyk8WoG3gEecanP2nBZoY9tAf2uZ8PARRGbsOZdp0ZmOHwPGp28uNWyqCB?=
 =?us-ascii?Q?LlsC3DFdLvkOFGC6gfbHbeb9Z5en+RrajjZvAiDMUXlFO93Q11uaoIPQOcRY?=
 =?us-ascii?Q?Tn6V1VEq5XdSclRtrdareFl4twXmxnL0m+7r4vLj5N4prv6o6vr0S8VkctdU?=
 =?us-ascii?Q?/Bfnn0llK+TLkYyhJJbd/c91M8cIVM0GmCi7q90e5IGx2+OSroeLfsteKZZD?=
 =?us-ascii?Q?WqTeNt7qAE3PLu2v5Xqtwa1HeTYv2U2+BeCNNoNcFRqqtSMGKnlW6MfCvM1s?=
 =?us-ascii?Q?J/Z1wzZLKKAgOqn9HZ3UBHO1pe1VHOPzPwzFthcFiJaMmAMNnrYvmpI+PxLL?=
 =?us-ascii?Q?mN1vUzMxMCgBt4fPwnRs2F6pxLCLHRvFcc9STpCgi0uQj8V/h/IfjFnUH6ht?=
 =?us-ascii?Q?bUlbwqEzPsiPGxFh3fvcHZmZzovrESe7rd2a/l3YsWLyWUnH2rro0HXbSMl4?=
 =?us-ascii?Q?FxTqsKWPTZC7hYpvTA50ksZ8fhu8WfYa3FRSe1kzecRGiMl+kSfGMn0WDk0A?=
 =?us-ascii?Q?vv2DBNeg88dZ5fxWG6pvnk/0qHyCqXC84JZw+VUhAeZ88gkrWCcSb5Xmdzw9?=
 =?us-ascii?Q?1WxB6OhdoC9Mh7YnZPqhMcwbPf5dwbMiP8eIeMuM6FMvwGvfjBK+gD0Zqkc/?=
 =?us-ascii?Q?/JryB6PfxBStASDiPQFXkD5RbXpLal/rIWOR/zHQMIs3t4DgmCwGE/HhQMs7?=
 =?us-ascii?Q?iBEl+77wM09hX2yH+RWFBfAxpdJkuzq6wh3VUCfgU2KU8v4Eaunwdjd+Jclx?=
 =?us-ascii?Q?snwkuT8OIWI+0CgzVFpMRzN/B+7wK+NujkcnNW/zER559cUzCukMjBfh3xYR?=
 =?us-ascii?Q?FIJEdh7sAHJt1ivYVarQAKTeoLMi3uWk9NfKX7O6+rbyogj7GAx3p9K1k9PE?=
 =?us-ascii?Q?1qLCr1ZSGUeIL8vp//DYaXX6kVii+6m7Y+FP1nLSlNbK9drJjqxxBIHDL5VX?=
 =?us-ascii?Q?oeSdWCw0epV+Kx41Yc/t+kVpW0pzdmXw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ju+UwxyIQCNlPsf43HekL/aw8We7o28mBeTct5GCwrdrkEyFJKb04dUU29L4?=
 =?us-ascii?Q?AaAgBGQsupOZi3HtDQADBzUa4fYI1Vp35XeOfGRIpkSTLawQFQ2Zpy01XC2R?=
 =?us-ascii?Q?XcrtQKnSm/WI5Q3rYEkp4hF4WQSZvSLtKadmuUEQ4tvmR1lLH1Rnuv9shpNP?=
 =?us-ascii?Q?RIh9Ci2e3ri0SfzJs4rXkzKeNKG+0kMaAmt/ynw6a+QR//8YJqxK7pdU33M+?=
 =?us-ascii?Q?/wQQr91QA80zAJ/ax1/Z5IxeLqN2J76oyw/IzBMXFojqptUvJvrccWAu5JJO?=
 =?us-ascii?Q?lw3BC0Ypa+cH5U9V2+S5tPD7V7mVAvH3E/gexrbp3pwyo6Mdfhi5E+jV5JB4?=
 =?us-ascii?Q?Ms1+fNv8zZrnEp0X2ZdtyKlvH0K7RnJQu9bb6a6pxkkTYdaifGklzm74rByn?=
 =?us-ascii?Q?RVpcZ3KsejN7jW2xv2R4zEIG1XPdnYZazDFJMR1t5CJYI6wOLW7sQM29Bt69?=
 =?us-ascii?Q?ISujfy2FX+26jQA/DGPK5kGQNaeVUXTZYhgPMrRmFwBe4BQejJlkMoU9hBvB?=
 =?us-ascii?Q?/r8HX2LSrEaeuMfwdUNSyufRiXndvi/03bILCDKlqpX8M6/xD4ERq/oUUvTb?=
 =?us-ascii?Q?eIVUyzxVyJaMneXL/N/LEUD0VZr7zqsw3yzs3oA5y+3NjbCTw1GSTbjJAOCt?=
 =?us-ascii?Q?3f1q94j3oQluc/SrrB27O4DWccHUV5d9zCjB8UF+0zt/Fm8ml+iUydtI/98Y?=
 =?us-ascii?Q?MM9ooybp+x+9MdwCQ7fE4rG051U2BZ3AIZ/INnqZuJRmKD8apAKXSUdr941i?=
 =?us-ascii?Q?v//jQDoz7SbW2BAUzytYZYfuUR3dkWgJUcZPo2yQlHSzZja4Fj17w/0tp0A1?=
 =?us-ascii?Q?feN59kLCZ92JpC2BWQIUjdCfSoetjZlQYaELWKamR8Gm+zkIuzLVTwfpRCI9?=
 =?us-ascii?Q?klsx75bgbNdggMWRD5lCiuU8YY85YkcM99+bb1iTeDU8Qio1wOjvelJ5QRhQ?=
 =?us-ascii?Q?PXWU/EYAU8nzQvciCQFTk+7nkiJp1QH7Qqf6v/FEQCF+Yyr6hMTDwN+Q8vNK?=
 =?us-ascii?Q?vARsn/Jq6gKRLjRgPRa9mF6MPHRP79WfHpSn2+OYeW3agx5unbEmKVmIjg+U?=
 =?us-ascii?Q?2k2R9CsOgSy25Uy9i6AdQ2pLPHV8kAZY78Cluh2nJcT5XB+2U/c8quY0qriH?=
 =?us-ascii?Q?QhT3n+NiQc+OoiD2xoYyqV1CReOFbQJl4I/mtzCHBA4hsMIYADGbdIOM9gYM?=
 =?us-ascii?Q?MsTYik8JT9gHSlRcQQOLVnCw/a7D6T42uLKFmlVCRC9dF6ArZRUkzoYJq9FV?=
 =?us-ascii?Q?Y4zpw43oPoN00BkmMqzOlYExJguzWFTTc35ZRLT732VTaNUhUEh9pylJDZf0?=
 =?us-ascii?Q?WqZol1M503WwRxkQasVEDmKYQNbzgMITnRwurckDNx4UrB/mUvPGVs2ivezF?=
 =?us-ascii?Q?U83b4oWIq7dENDaYZ/VyybjY4ck4u6TzpK3tjtEx8Vy6ZbobR/O/lEBPyS1A?=
 =?us-ascii?Q?2qrwKw3yTKVSVDFV5aI2pj3pApG3Qr+/f92/UfU1/UkkqByG8JZx+tkR7TgK?=
 =?us-ascii?Q?HkMUH5IDtsI7EWkofyn5GmOfT62y+T+4WOBp5IG45fHYvGfQzu/qaRDqnp7E?=
 =?us-ascii?Q?PuJNMz3JWOrXJETEs0GpvRgw79TOG1xDEHXEdiOQLbGQUBXL7B7layuZZ5fS?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dbb425-feb3-4bc5-821d-08dd72e6a257
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 19:35:04.7738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggpL1oXhuA5J2t8CNAhFz4lX1eoKjJPwZiQRSeBcAhayrNfOFVElCELIoV2jJMpmaefS3v/zTn2C7e/SR6CSvDtEYkWCJc286z/8jcU5ilk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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
From: Briano, Ivan <ivan.briano@intel.com>=20
Sent: Thursday, April 3, 2025 9:46 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <jo=
hn.c.harrison@intel.com>
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
>=20
> On Thu, Apr 03, 2025 at 09:24:47AM -0700, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Briano, Ivan <ivan.briano@intel.com>=20
> > Sent: Wednesday, April 2, 2025 4:22 PM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@int=
el.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; B=
rost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@inte=
l.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedeskt=
op.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <mic=
hal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C=
 <john.c.harrison@intel.com>
> > Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
> > >=20
> > > On Tue, Apr 01, 2025 at 10:26:54PM +0000, Jonathan Cavitt wrote:
> > > > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPE=
RTY_FAULTS */
> > > > +struct xe_vm_fault {
> > > > +	/** @address: Address of the fault */
> > > > +	__u64 address;
> > > > +	/** @address_precision: Precision of faulted address */
> > > > +	__u32 address_precision;
> > > > +	/** @access_type: Type of address access that resulted in fault *=
/
> > > > +	__u8 access_type;
> > > > +	/** @fault_type: Type of fault reported */
> > > > +	__u8 fault_type;
> > > > +	/** @fault_level: fault level of the fault */
> > > > +	__u8 fault_level;
> > > > +	/** @pad: MBZ */
> > > > +	__u8 pad;
> > > > +	/** @reserved: MBZ */
> > > > +	__u64 reserved[4];
> > > > +};
> > >=20
> > > Are the possible values here documented somewhere or should be just
> > > follow bspec for them?
> >=20
> > I think bspec is currently being used for access_type, fault_type, and =
fault_level.
> > However, I can add the possible values to the kernel docs if you feel t=
hat is
> > pertinent.
> >=20
>=20
> It's more of a question of API stability. If the HW changes how it
> reports this, do we get different values in different platforms, or do
> we want to fix them here?

Revision note applied: Added macros for access type, fault type, and fault =
level in latest
revision.
FYI @Brost, Matthew
-Jonathan Cavitt

>=20
