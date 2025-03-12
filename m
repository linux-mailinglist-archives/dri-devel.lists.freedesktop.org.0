Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CCA5E1F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 17:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714310E2A2;
	Wed, 12 Mar 2025 16:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoEUlbzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB9510E145;
 Wed, 12 Mar 2025 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741798012; x=1773334012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8dRFnAxxp9QCg7xccifcbe4hRBBpBIsJu1sQowPeUWU=;
 b=LoEUlbzy7BbxitxRl+3TF47xLShUSpih+POLQ+kbGSwA3sIha5Xew+rB
 Rw41WXNeUboGc7CZo1rC4GdyE4Ky3SMwZJ/AO/Urlq1ikuZxYvR3JNjM4
 ttm3/boGgCe9RVGJ4hMAZsyCppVU7IUOkZugH8Fp3UBUAGSDiHWQZdx3f
 lZsmQR8FGLnh8NSkQ1mdgpsuhgKWfuSXUVI5kswKubnBQ60qe5Ean/Ro6
 sAsXyPaMADH1zogHSPQ854u3qvhj43c8JYZTH0vg1mhXlz7cKfkiStqRK
 IlstRHAhY7DcvYPSbgS+qnqb8mR/eKLeMrqCdqssQxbD3Bp+wYiRZtP89 w==;
X-CSE-ConnectionGUID: qcSLtqzeQsWD4RKMd6wtow==
X-CSE-MsgGUID: rtz1LebyQvm5KePV6r9QMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53537993"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="53537993"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 09:46:48 -0700
X-CSE-ConnectionGUID: 5kVrchP2QGa5ZVC2XP4QmQ==
X-CSE-MsgGUID: w4RoF++mSu6Wi9gFKLFH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="121609194"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 09:46:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 09:46:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 09:46:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 09:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivDa9THlAu0M5uOfCmS3C5BYmPU+dOluTlcCoEsfzPuyOZV2ksA19QuVbVNfRVLU/RNDd4Bw2aIKN4ZkYAGoreJdhy2Us4ggeTCtHGuUB9s6YXdKEa9VAy31lyWOsLJeh5DZVLPCXk+kYRZL4IgK+qH32DvfMyngEoBweE/Nuc2szbBdUI6gtRT0xsrzOAZxL1mx4XnexYpIDU7WCMEHp8n2+B9ILFK7A2yWM51BXRskmV957hg2oypwkrYBw6/h4OkFIp1LUPRd0fAw5CgTV7HX9GnmP4ghNzHYaBfOVPA1SjEFiKnTwu7PyIe4m+ewm+MbOMaXVZyfRVX1soa7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ5ult6cJa+/8XYGGSx7YKqno5eddZ94Rdo7XiOJR2c=;
 b=QqAeZDS2ak9oHQeK9ZwEyCgfvuYKuo4ZP+RiIWt1+P4veFtI6CIFwE3Yk9ecIL31vopvTUZ/19EoU1pXyCKNbxWtq4FkAzQOJGaRL7eok6YLRgwcL5bmxpLMfQeic1fK5+gh5EqWoJjkvkPeb9UtyuLxmfzMHxnbrElc4GJjP1MTy/2xf35h6fsc23O7UxKh+ZIrSAH/GgYafUVxJqYtHH13/YXav7RR2ZU46of9q5QbsaT27bQ3QrpJ0eXgQZMhfvVgHCHscjcwm2iYDQF39FFEh7FT5PIC3I7e8+wa7Zh055OFBRDBjUN1oA+sz7WrP9e6730Q8Q8bOmFUUfBcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 16:46:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 16:46:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Topic: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Index: AQHbkeCBSGJ7q++dn0eBzBKtzeyYB7NtXoMAgACalFCAAbqegIAABFgA
Date: Wed, 12 Mar 2025 16:46:30 +0000
Message-ID: <CH0PR11MB544492B87B9C80557CFB07BCE5D02@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
 <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
 <CH0PR11MB544407DDD988B9B66C0E501BE5D12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <CH3PR11MB87072343A480183FA06D30FCF4D02@CH3PR11MB8707.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB87072343A480183FA06D30FCF4D02@CH3PR11MB8707.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5096:EE_
x-ms-office365-filtering-correlation-id: b772ee48-442d-4bef-0544-08dd61857097
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?j1pOoryoVtQlFKkqcG8+TgazuvNePY4AhnYbBePE+Dm3zT+MLuwZL/992+TC?=
 =?us-ascii?Q?7nduOa9m5kD2C2jFNi0lQ4OPR0hIWoSilskJXaq6kQJOQodpEcbcCUIBDeeV?=
 =?us-ascii?Q?1xKYhM7Be1sWh03DheaZaxpvR/un5j8wu1EAuS0Xr9FGpw0lRi563CpLegEV?=
 =?us-ascii?Q?9llEJsQq0HSYV/fpuO5ensJpI7ViBjIQNcuzwzYn0eIA5uOcV8Q0+eyI3e77?=
 =?us-ascii?Q?fnj5/Lzg6Y4GCrSO7Ncg8Tttq3FvrKFJfcDgUObDt04WLL6cAUoE2gwyEali?=
 =?us-ascii?Q?uxFrpTY3y0IaeAPZ8W+77FymaYEWV8pIKT0iWUj+4DbaSXUWSBVEpY37p0FA?=
 =?us-ascii?Q?3Mz4acoUnfztZ+3kFnb+lkwmNxAw6FPN/c+pLI1ULf9288RIjYXguTf8eEwG?=
 =?us-ascii?Q?ag9BcVxBIhLzuK1TSB5zKk5IiEiWgKmo1lsQ+RlBb0T8n8Kwts+XhwbP2ofu?=
 =?us-ascii?Q?jRxVAaV2GnvYlUTRW8eHm4LqB4lltht6U28KGJ6mXPxhXLycXEbxg3HdHsHD?=
 =?us-ascii?Q?swij6WDvWrhpwJ20yM+BN55sUgc46nEmZHEiuUl7rh3n3zKdkR3PWoJVwOGU?=
 =?us-ascii?Q?Pvc/qE3VQdaWVITsw4uO4mKNlSzEN47CfiXzHJMSIDcr1zEf0y7GHBScBQ3y?=
 =?us-ascii?Q?94vdXypmrxKMOJxBXTx3ChWcOhpMjWmRG907rziEYytt3puAEHQIhvAQUnzu?=
 =?us-ascii?Q?henImTttLGzYmNVhqlaIpMApbfuQnTAfTVA1swqLb3iI655HTT1Qx1yicG4N?=
 =?us-ascii?Q?KELiG3bQyHZtGZanH5zySnyY3i7psmlU3UXzgYNI/9frSqmXBU6RVgJvJ0Ds?=
 =?us-ascii?Q?1rdyZQoJwxFc2ZK1L+fr0tva/khwm+cWUaGGj7+PFGIZIypVtyjtH/wSG7NE?=
 =?us-ascii?Q?IrMUXXTXvDpQBlbN3Uu+EQQjEj43ogVvCogOJhTcYVUO6+SEJonksqqm8SJp?=
 =?us-ascii?Q?Z52s1Vk4OopQCMRndPk7kKP6yeeu5VhrN3bUOmUfuikAAnfPuZ39gt+TguJx?=
 =?us-ascii?Q?ipS8jBjOUU6RWeEEIMp19iaedpHw0i/1wiTNArPqrCou//CAVRwTq/T4DfFc?=
 =?us-ascii?Q?VIoE2Ux9bi6HShNgIae6RGKG25l/rFMIfyVY1xQDaQB5XTx5Wj8uw0y6+1UR?=
 =?us-ascii?Q?EBp05tjCprOL9pBhETrxHLR/4ZKzOZE5UhYMEmkF9J8op/r8LMOG+jqWHBy2?=
 =?us-ascii?Q?ABZ3MuF26Il1om+NeKkBPqPUhv0zevGxDBUcDZmmC1/t3+0qVRFJDPX4wOov?=
 =?us-ascii?Q?/5WHWAQ3plUYH7OuAkRbXCWO9CH/lA8AQJ2gkVIfG+nZWVGC6wfYG3OPK8+q?=
 =?us-ascii?Q?4IKqmNH/plz3tJ3D0oo8uX4YPsPLFpnfjkxZRWS7i8bN06iU26FS53UwJKD3?=
 =?us-ascii?Q?wyMfAH3/VpGVcDW5uovozaIZsh6Jp0N/0oYMm6gjFOzuJgSBcAXIbgSd3D9k?=
 =?us-ascii?Q?kgXvtQDW0ToOiW1792OIDeEit4k/iT20?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9j6JBXC0EXNyz7v/IHnnbX1cYHFARCB8CuYDoM8sdl8hdmjEDLgg0jrqvecJ?=
 =?us-ascii?Q?HWtgyZxw8u4y/z50pCAMeiMPeVneZ09JtYf/UqxaxnI6/1yt2Gj+JAm2vV0I?=
 =?us-ascii?Q?80sWWByawy+U1whH4/wJkF1EFUnuhaCDmKXDWyk2vuLtumKj4+uWepRT8xit?=
 =?us-ascii?Q?CT9VpWK4SGCM4pt8rO+jk/C5Ccu8kC/KIbQMNm9Z2NB/WNmLwpaCQ4cwB6be?=
 =?us-ascii?Q?lOsjxP4xKXTjYZcSh00iLxf9mULwSDIL2NQ6LOh0tU1zQlpoCW9dteC3sInB?=
 =?us-ascii?Q?5C7WUkB+xjD18OppaJH/IEW7yCObQm7DN/oPi09ZWEdwA3pw9yEwpwDWYyHy?=
 =?us-ascii?Q?bNsWAAuA+dIcVKIV0zlRvgxg25mWg0XW2pMYNg0WUhbz4/vn/ZRcRNKGu8AO?=
 =?us-ascii?Q?2DzDSx6bTr4CDPXbIk68I8Kv4MVMgg22jySRLxkOg36UM/dny04lk/BS9Bhd?=
 =?us-ascii?Q?RYtqewaVKDufWHbZTSEBSY9eT4ZQ0eOAIm5eZROMbj9wNjX18q7RDMdm5xcf?=
 =?us-ascii?Q?jY/NDmOuNkE8Wvktazcyxexlm13GQKz/YArbT+19l39ggA2Rrz2xpCi+0D09?=
 =?us-ascii?Q?ysHO3X2+A3yD3ebJsXYxx29J+8EYmKjR8KHGEgow+jqqRV+7bUBhFiVM+rHO?=
 =?us-ascii?Q?dFoue2gj3CTNv9p1x3FrxcsTTcVViCOo1ztC0TyDLQ48GCuA1WvYIFZLAKXx?=
 =?us-ascii?Q?QQjxbao20H8Bh1l//KquM3ibe7P192dMcRKKDtvhAAc9BY7+gOnMvXtWc9xj?=
 =?us-ascii?Q?dr8wHGqGZtTyBsfl0WbW2mAH+EUcB0YG+nroyFnVL4yVyvC8gsWQ6ywfyPnv?=
 =?us-ascii?Q?Q9XV/qO97gKu79ZDeh9VyU4v4A5bqmVqc/n3VFL+/7NheNqsWsKORdXqVMGq?=
 =?us-ascii?Q?4cowsQmGfffYWx//u7x7FxeqYEjwCyOSU+wW3dCYwiFqioHzE/rvbAKiyCCb?=
 =?us-ascii?Q?/yzZV2RXJEIVEiF2FtGHAP0c8V5Y3v01l5SiEpSSJruIVVchw8VIvDDX2EdG?=
 =?us-ascii?Q?6QYVRzXJOczP3zYg70yLd5x0JD7gbl9Pi20MKR/QglB9yyJVnF1KKQSWQdMQ?=
 =?us-ascii?Q?ZZe+VDvucYW2YDazQ8quEJpLWsSVjiM37rnk0zYmNnAR/pCrSRxpNZJQr6U1?=
 =?us-ascii?Q?wNYQ9r2uCI6Vsegx+d6GMRFSha9vOC3Q2JtOUjkNjP58cXudm/hO4Vc2oUzY?=
 =?us-ascii?Q?IKLvvqormbjfpu1q3VRSm8lrwsIlbqLaewMbj5yowVepnY1ZHcRnXKtqDjGv?=
 =?us-ascii?Q?cp3lkbBhIjlKI7nBEJl9G+ALhPHWFuShFzH3Hc3LnDpn6gGFcqNoMRZPgB3R?=
 =?us-ascii?Q?e+l2ePQty2UapqSAp/bVDPH+bckTRrS0SCODSFWlpjhQHORP0eZUNRZipC+Z?=
 =?us-ascii?Q?R4eSe9yM1UlA8HRfgpeMQPWWxB5Gzs6eCYkKA7LrMR8gb3n6vCdlR3Sd774b?=
 =?us-ascii?Q?nMGOtol9132BpIol1b8ViFgBUNTQlfA8OIEpk1RsEDcYo+divCTo50010O2E?=
 =?us-ascii?Q?IcUvuaFohUp4ap7NZ3MshWKVJO8pEFxoSx6pC2c0MJ1VBjZ00lA+h8Ww2kda?=
 =?us-ascii?Q?PXXtKiUoTTmpCgchBrIq0MWxejNeYZG9eAo39bGX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b772ee48-442d-4bef-0544-08dd61857097
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 16:46:30.3598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxWTVlY44MB6lJliWjF3Zw6HAOqWOs4ztebCwG93kQonM2mRwwboRfRFAO/mGjRRzYAmpVLUscTNu/7DiA6T8Zbw4Ijwusih2rB2cHi3qGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
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
From: Zhang, Jianxun <jianxun.zhang@intel.com>=20
Sent: Wednesday, March 12, 2025 9:28 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.b=
rost@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Lin, =
Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
>=20
> Sorry if my reply is still in a wrong format. I have set plain text in th=
e web-based outlook this time but don't know if it really works.
>=20
> Refer to my inline comment, thanks.
> ________________________________________
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Tuesday, March 11, 2025 7:11 AM
> To: Brost, Matthew; Zhang, Jianxun
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg; Zuo, Alex; joonas.la=
htinen@linux.intel.com; Lin, Shuicheng; dri-devel@lists.freedesktop.org; Ca=
vitt, Jonathan
> Subject: RE: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
>=20
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, March 10, 2025 9:51 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel=
.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zha=
ng, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.=
com>; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
> >
> > On Mon, Mar 10, 2025 at 05:18:32PM +0000, Jonathan Cavitt wrote:
> > > Add initial declarations for the drm_xe_vm_get_faults ioctl.
> > >
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 49 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 616916985e3f..90c2fcdbd5c1 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -81,6 +81,7 @@ extern "C" {
> > >   *  - &DRM_IOCTL_XE_EXEC
> > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > >   *  - &DRM_IOCTL_XE_OBSERVATION
> > > + *  - %DRM_IOCTL_XE_VM_GET_FAULTS
> >
> > This should be a generic "get VM property" IOCTL, not a specific IOCTL
> > that only retrieves faults. This allows for future expansion of the
> > uAPI.
>=20
> Question from @Zhang, Jianxun :
> """
> But first of all, should we regard faults as a property?
> """
> -Jonathan Cavitt
>=20
> Thanks for Jonathan relaying my question here. I just feel it is a little=
 strange to treat "faults" as "property". Perhaps it is just a naming thing=
. But I get KMD wants to take an extensible and consolidated approach. Eith=
er/any way works for me in UMD.

I got in touch with Matt Brost, and this was his explanation:
"""
I can see that PoV, kinda a bikeshed but in general for query things we mak=
e them generic
and extensible to avoid having a ton of IOCTLs for very specific things
"""

I guess I'll prioritize reverting it back into a property get ioctl.
-Jonathan Cavitt

>=20
> Thanks!
>=20
> >
> > >   */
> > >
> > >  /*
> > > @@ -102,6 +103,7 @@ extern "C" {
> > >  #define DRM_XE_EXEC                        0x09
> > >  #define DRM_XE_WAIT_USER_FENCE             0x0a
> > >  #define DRM_XE_OBSERVATION         0x0b
> > > +#define DRM_XE_VM_GET_FAULTS               0x0c
> > >
> > >  /* Must be kept compact -- no holes */
> > >
> > > @@ -117,6 +119,7 @@ extern "C" {
> > >  #define DRM_IOCTL_XE_EXEC                  DRM_IOW(DRM_COMMAND_BASE =
+ DRM_XE_EXEC, struct drm_xe_exec)
> > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE               DRM_IOWR(DRM_COMM=
AND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > >  #define DRM_IOCTL_XE_OBSERVATION           DRM_IOW(DRM_COMMAND_BASE =
+ DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > > +#define DRM_IOCTL_XE_VM_GET_FAULTS         DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)
> > >
> > >  /**
> > >   * DOC: Xe IOCTL Extensions
> > > @@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {
> > >     __u64 reserved[2];
> > >  };
> > >
> > > +struct xe_vm_fault {
> > > +   /** @address: Address of the fault, if relevant */
> > > +   __u64 address;
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT         0
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT 1
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT        2
> > > +   /** @address_type: , if relevant */
> > > +   __u32 address_type;
> > > +   /**
> > > +    * @address_precision: Precision of faulted address, if relevant.
> > > +    * Currently only SZ_4K.
> > > +    */
> > > +   __u32 address_precision;
> > > +   /** @reserved: MBZ */
> > > +   __u64 reserved[3];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULT=
S
> > > + *
> > > + * The user provides a VM ID, and the ioctl will
> > > + *
> > > + */
> > > +struct drm_xe_vm_get_faults {
> > > +   /** @extensions: Pointer to the first extension struct, if any */
> > > +   __u64 extensions;
> > > +
> > > +   /** @vm_id: The ID of the VM to query the properties of */
> > > +   __u32 vm_id;
> > > +
> > > +   /** @size: Size to allocate for @ptr */
> > > +   __u32 size;
> > > +
> > > +   /** @fault_count: Number of faults to be returned */
> > > +   __u32 fault_count;
> > > +
> >
> > fault_count is implied by size.
> >
> > Matt
> >
> > > +   /** @pad: MBZ */
> > > +   __u32 pad;
> > > +
> > > +   /** @reserved: MBZ */
> > > +   __u64 reserved[2];
> > > +
> > > +   /** @faults: Pointer to user-defined array of xe_vm_fault of flex=
ible size */
> > > +   __u64 faults;
> > > +};
> > > +
> > >  /**
> > >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUE=
UE_CREATE
> > >   *
> > > --
> > > 2.43.0
> > >
> >
>=20
