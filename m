Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CDAFB534
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B9E10E499;
	Mon,  7 Jul 2025 13:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlLWdvSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16210E497;
 Mon,  7 Jul 2025 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751896297; x=1783432297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PCQ4CKWxzafRga33l5fb+iG7wNLUfGtuRjaNaD4d8Tc=;
 b=JlLWdvSLhClON+DrpYAhICESscbzkF6itkjx+agyI41O+0HTEBWnAEvm
 E8FKG5g4pwJNsLGVDQsM5oPM1BsPDjfYWMPUC2iX+eu6nfBjBq9IKmmqp
 tKFwe7cK7ZYBTOxUcXLsCTVXHba3r+BbIqQ1B0gTIKAJKRWe1lc2kAJII
 ttA4xp+M/PHe8vlG6uGS9GnyI9WF8Ol024k3y+DzIpEDl6Dkw+CHC/Fs2
 gJXyPkYyS8USPwVCk5mHR70D0XhCG7lorp3tY3BLP9FgjQnEFisW1xpeO
 Ta39LyukkBZRD2BicN0UNpyIWTkQzDDTBqRPTitjs6CAHBnrJbZP6iAuE w==;
X-CSE-ConnectionGUID: Rql/GMHHRSa1IxSlnLOIXQ==
X-CSE-MsgGUID: P/g+uv7QTRm9KJqj4ANwSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57886207"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="57886207"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:51:37 -0700
X-CSE-ConnectionGUID: /hCekNBmRtK2Qo9xmTh2Fw==
X-CSE-MsgGUID: tHSNJqooQAWoqlMmm5cpyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159761358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:51:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 06:51:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 06:51:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 06:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9g3ZJYGwyaqB8KwfNs20f4HCC2Ww8Uve0I/fdfFCZJRaM3fMaj5SfIQT1J+r74liezh7s5Z5LG+pyyRr0B1rw4f7d0DpYUG/wBjP1CleOoVuMS+uty4tQ9XV1hRBKusSYBnryV8fQZJHU3rzUWRkYGBCTSp8xiupQoLvvybItL6P5fANszuU38vRACS7G8W1Gyb8t6KN4wMbXrLU8Xgotuy0/lz5lFrOPOFZMgxRUCgBuSkMeVwNoVVt+RyKhr1hKeahzw7y1xpaR3N47QD12lpKlZfOb71og1qyx3J4RuhFpoUtey3ozLmf92Ei1o79rdVgMzLoVHNBixRYD/CaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgYCFpuNzW/uBVh0A8m/QaRkBq16FkQFr8ooZZLcWA0=;
 b=Wtko+RX9AoowChQxrykwZNjTcp1MalQFaj6W0n+0xK6ynLHzp480HB7rBwfAXkmU6X1L3FvHDqZfZEOtpZLjJrwnEgynNGu0XcbyYhZutEHIhf3DZ+4oZv2r29hMAJyXseFYFqUL4B+FmCf7XFhMZ+GRjpBOS/x0WU7LXNaUnygBRO7QAcv4eUkoMU2bBUykM9Zd57cSxtutFs3q3UUrscz0FvehVONs8gWekEv0bF9HDnSd0Mg5PwlSj4pWCZMEH4FPFsG4uZlpD2Yp6LVvmiV28Yh5pUzSdtKqJ9v6aWsEcochbNOajbq2dtyePoYSKECNvl39q0uIUKLzrt5gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Mon, 7 Jul 2025 13:51:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 13:51:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>, 
 "Nikula, Jani" <jani.nikula@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16
 bytes
Thread-Topic: [PATCH] drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16
 bytes
Thread-Index: AQHb66IldVtMRf95gkaMq/9aqmdQ7LQmtLCw
Date: Mon, 7 Jul 2025 13:51:27 +0000
Message-ID: <CH0PR11MB54448C1EA1427095093C0117E54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250702223903.3801654-1-khaled.almahallawy@intel.com>
In-Reply-To: <20250702223903.3801654-1-khaled.almahallawy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB5966:EE_
x-ms-office365-filtering-correlation-id: af1586b1-fbcd-4466-bca9-08ddbd5d5f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dOOfiyMrtxe4ssmr43UfQzdCvQjn7AZn0a7NYoXd7YITCp3xs2fCeOmYAiGs?=
 =?us-ascii?Q?yqn+y3FiNL5cOLKYMBy+xXe5hn+EsirZHwr5pGgyuE6a69aherML14wp2njF?=
 =?us-ascii?Q?kBBd1wrlbESnx+D9N7Qdp+oUhkdsfpycSGybHZeSpNDwGp+YEigbheZp7Oc3?=
 =?us-ascii?Q?rmEETI5eNJEZZCozm7zIrh4GJZZZ160QNJV5mh5e7ekaE1+PTsjdxvRsZnw5?=
 =?us-ascii?Q?iwRuvzBIcFf2xS9P7Jn/uJCX9mshBCEtFy6mLxHMItsqLH45S8ie1DCaTzAi?=
 =?us-ascii?Q?kX4v5TYRasLLMZbgZjfONqiVLXwrsaoz8ezaPURNjrID3latURxQRJzCxXRE?=
 =?us-ascii?Q?BWHqKUn8ekiCm+BKZsG/IM3Mu+2dnzdhFvCjoCRF98wxqinlUzEAm0Ty450L?=
 =?us-ascii?Q?v1Euvz+4RVcPh+f6bZHURtBeWjGXzL+JsyjFnEa61WdkS4CjiLsbqa25iJWz?=
 =?us-ascii?Q?WrE9e0NFmy0TOqnJ3DVh3PJMadDOh9K7kH71lTy2C9HJ7qqChkx2tYLJawSu?=
 =?us-ascii?Q?expoSu/FTMZApAo/6r0WY+Y7W7qrVU1dYbsK+XdGmCKHcUaKWCCvtzc4tZIu?=
 =?us-ascii?Q?MdAzosQM14yth9e0U+zqzlaW5sxNKtesq+FuH0K1JaqSCe7yhmTbWFXbrwFk?=
 =?us-ascii?Q?hgHIb6ne/gVePzVErfnc95pKfMCq83O+JwBgufcPSYMBrvu/E9fOnXbcMz4F?=
 =?us-ascii?Q?XCXcxUcpNtuau0a4HPR1gCfNVi9VXCLebNUJmJ9tdYMvcfDQvnnX2UieM6tG?=
 =?us-ascii?Q?GNF8+kItJJlPgb3dUuOv35Xt+WLwwy8E4LJQvN1zuHcUBpBHBaj0lK1nlts8?=
 =?us-ascii?Q?PyzbXsFneDahtd0UyEf6sYzXswZHKl/MN/ivPrAbefEWrq3wmd5Azf1Oe0X2?=
 =?us-ascii?Q?8WPxRaud4Z7qJpuHbhU9lIFDgN3mq9m9K1pYjsj1NvIDdwdTHnzpNvpEKkKh?=
 =?us-ascii?Q?tvq1MaaQ4W+zMH4n5ADQqfSCx574PKCC6xGrAudG/uV+xhggAwW28WPyMyzo?=
 =?us-ascii?Q?JkDwW2Xwyz6GIfQ6YDQ0Oku1yJHxKwmIa8wbyJptnUAKJbN8cSuVs/5nUswJ?=
 =?us-ascii?Q?bja97+8Wo5ho8Qe6+BZFbovY9ZOZyauW02rbSZZvpMW0DCu9JvLxJHy9Ivxh?=
 =?us-ascii?Q?wSNGfntJQ3aF6gG3EIVB6LL+eBkM6eRm3I6Cl9vZGcdNLXz70Rxm0yMPNpFV?=
 =?us-ascii?Q?tk29nPEGoHAcm1HwTh0psFFozG+24ZiV5z8XB+MaNfkODgdQqPHaeL24JnKT?=
 =?us-ascii?Q?1Rz6iJB9g3CSK5vgekZDvWtvgS0n6+sctD04Puv/Cf2oxeAnBDZC5qzanS/e?=
 =?us-ascii?Q?n4vsOfBdW9S6W8UGb/On3A/3+RmumKTIKWglzWVdQ8q8C/XXnXXvQkGUNl0t?=
 =?us-ascii?Q?6VCABYmIjSiUZRD0f+Q3OHrhuLHk1bI4SDRu92xMjPCD+ze27JzWwA+xqDLh?=
 =?us-ascii?Q?z1p7rjcyDaeunpXvpshlsU5+3r6e/hC34LvrZQ7p6DZYlLBB0FzwDw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lgUM3cjkphXR8dP6xGVZpVS814pzwPZNGsVEFzUeM2RiK/yI2EPkngCD11RE?=
 =?us-ascii?Q?7WsWJCMlnhwNAAq5h5sTiiXmtzvvYdvY8KD6xPx6r55KGp/wCDe7SBLgC8Wu?=
 =?us-ascii?Q?B1SIXUWB7cLmeWqvVm+nFPf4M0kqvq4ZzPGvOkr4Nt3mjFDEwAplGEwkzeNw?=
 =?us-ascii?Q?2147WAKdgTO464L7fFw+nlN5+mY3Iipq4/TEHbzz4iPcUzWkyEtoRcnAgPsF?=
 =?us-ascii?Q?zpE/Av6IsMD+i0g4eFL1eBdAsvhO3nGK7aBbC019uK7bObnZ/IQRdZk2Pgw+?=
 =?us-ascii?Q?cD3U5SJ24un5y3Tfwm7t2Ngv+byEFZCokFWWIwJiyqG1JyEaEEsYHwoDMCGB?=
 =?us-ascii?Q?4q7NHQKxU3vRtwdrEAMznCvZrQc+M0ZmHiWLqZCojHF7YexGCdrypLXruSEX?=
 =?us-ascii?Q?hZLjczMgWk0g08hd7I/+rsPcQJhezGzm8LtDfgeSio72L8PSVZdHS0wtYt02?=
 =?us-ascii?Q?P7hPwH6V7se8c0tCFwaRCeMrZEcnht5JDRcyIvsDrdNZ2iP2YxftJxS4HKHa?=
 =?us-ascii?Q?SlASc4eaoCH9+c7/5IMPBDVgiY3+I1uzGg/jPqNWe3NBnbMdwj7GE+vBxtAg?=
 =?us-ascii?Q?fSM0LjeOVMlJKuu0/3zyAXWF7FfHXepTlFUL8cHyouqScRdmcm2iOMpDVLuq?=
 =?us-ascii?Q?3m6HVAYOnPGx6TNT4IhTyMXCGqgVy5+oKKQ9NWYGvCQ4aRinvlDrjnQHNlmE?=
 =?us-ascii?Q?Eq7UAAl4oVfaoWg4ON/02oi5b39D8H3XHmnv+/OsQlhdx18tmLvdGrBslshJ?=
 =?us-ascii?Q?+ogf8U2Qt7iijOEM7nmnAihxn77HbENsL2eAPRGP9Ugl3N7i9Bobcwl9M4TV?=
 =?us-ascii?Q?8XhG8NBf5xx+6zCJqCuiryI4ZdR5RePiR4vmX1C3InLrSDaLsMd+VEGtO3cU?=
 =?us-ascii?Q?66kLxa2zw1Gwa/i0mfhgbrwQL7Je3+fuWEiqpYf3F5jOMy5Q5dy5vMRax9Ya?=
 =?us-ascii?Q?kNUhm0oatyhulFiqoF+I9pd4/87pWlD6AGsFVcTUeQtSpLZ8s6TzxBfFuTpi?=
 =?us-ascii?Q?6VNxDFY34/FhM2QQomOnZJ47dH86OEMr4TB8w3m519bhsfyTUOfuJi+QHApc?=
 =?us-ascii?Q?eoX7UuoErbfNZ/DJUm+tSbmVhLQtcWaW3Ko/f87Hu8/gu8QukSeV3TRCwXrP?=
 =?us-ascii?Q?qBAPik1yUqyhQDn5LSdxpmrV3kXzIYo1qyeo79RvUwQM2yNSEmkAhzfGsno0?=
 =?us-ascii?Q?9DYo0RMJHE2o2M0ufv/13OoeUzoPYNpnoA7sNkpfWXL+kUbgGYLeKSh9r5Bc?=
 =?us-ascii?Q?68UYc2NC82kjBMrs/GYdQoJhPJQzsD4b97VBW9i9KcyP+bkntU1xrznwxEfG?=
 =?us-ascii?Q?clsrBo+0tahrrVksdUmCATQcb7B3bv2YyxACAOwHWaVay590IqWkLbDbrXIF?=
 =?us-ascii?Q?kuSdMPbpjuwIDi2aXErbwu4oSswku7XfP8hf0zIrUQ90tW8cQ7kgajdN34mh?=
 =?us-ascii?Q?yKeWV6ERMMvxoA3WsrujVtTDVFiaTfHnxe5Uyek0t+kYDJyBFqNPPJk1JeYX?=
 =?us-ascii?Q?ER2JNKX473DP0r32MTH7e7g/Q6GJB9aWIyK2vbKp+VhyTaSSCj1v02xvkLCZ?=
 =?us-ascii?Q?MgigJx3+sZMP5flsnWNZs4BLT5y4EtfnJYVOK5QIt78gn3BqRWw93E3R7UR1?=
 =?us-ascii?Q?5cCf5zJgtwBbAfh0BRLsdCI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1586b1-fbcd-4466-bca9-08ddbd5d5f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 13:51:27.8370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4upf5oAIQgOuXBQ4quv9ZbetoZhqGWtmmqrZpEkHIWu1s1+yAhKW7zPgGg+ciKrV2FsgHd7mAHlxrzey8/xsiobo4jomxoeZAtXAOXH96U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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
From: Almahallawy, Khaled <khaled.almahallawy@intel.com>=20
Sent: Wednesday, July 2, 2025 3:39 PM
To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel=
-xe@lists.freedesktop.org
Cc: Almahallawy, Khaled <khaled.almahallawy@intel.com>; Shankar, Uma <uma.s=
hankar@intel.com>; Sean Paul <seanpaul@chromium.org>; Cavitt, Jonathan <jon=
athan.cavitt@intel.com>; Nikula, Jani <jani.nikula@intel.com>
Subject: [PATCH] drm/display: Increase DP_RECEIVER_CAP_SIZE from 15 to 16 b=
ytes
>=20
> Several Link Layer tests (4.2.2.1-2, 4.2.2.7-9) fail because DPTX doesn't
> read DPCD ADAPTER_CAP addresses (0x000F and 0x220F).
>=20
> 4.2.2.1 test states [1]:
> "Fail1: Source DUT failed to read the DPCD Receiver Capability field
> (DPCD:00000h:0000Fh) through AUX_CH before link training."
>=20
> 4.2.2.2 test states [1]:
> "Fail2: Source DUT failed to read the DPCD Extended Receiver Capability
> field (DPCD:02200h:0220Fh) through AUX_CH before link training."
>=20
> Additionally, the spec [2] states:
> "The Source device shall respond to Hot Plug event/Hot Re-plug event by
> first reading DPCD Link/Sink Device Status registers at DPCD 00200h
> through 00205h -or- DPCD 02002h through 0200Fh. If the link is unstable
> or lost, the Source device then reads the DPCD Receiver Capabilities
> registers at DPCD 00000h through 0000Fh to determine the appropriate
> information needed to train the link. The Source device shall then
> initiate link training."
>=20
> Increasing DP_RECEIVER_CAP_SIZE by 1 byte ensures passing the test
> conditions for these link layer tests.
>=20
> [1]: DisplayPort v2.1 Link Layer Compliance Test Specification
> sections 4.2.2.1 & 4.2.2.2
> [2]: DisplayPort Standard v2.1 - Sec 5.1.4 Source Device Behavior
> upon HPD Pulse Detection
>=20
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  include/drm/display/drm_dp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 811e9238a77c..960c9757ba76 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1681,7 +1681,7 @@ enum drm_dp_phy {
>  #define DP_LINK_STATUS_SIZE	   6
> =20
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
> -#define DP_RECEIVER_CAP_SIZE		0xf
> +#define DP_RECEIVER_CAP_SIZE		0x10
>  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 th=
rough 0x6F */
>  #define EDP_PSR_RECEIVER_CAP_SIZE	2
>  #define EDP_DISPLAY_CTL_CAP_SIZE	5
> --=20
> 2.43.0
>=20
>=20
