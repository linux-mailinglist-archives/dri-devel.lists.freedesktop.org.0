Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FAA596CF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DEA10E1F1;
	Mon, 10 Mar 2025 13:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXLXmr0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED5E10E1F1;
 Mon, 10 Mar 2025 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741615073; x=1773151073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BxX/yHJCGz3VWYMfL1zxERG9qjPMg5jafLRdt4w1GMc=;
 b=hXLXmr0tTUsk9XnyI3i8NesiU55Am6xLmhcE5gMeMaxe5MBh4YlhGDkG
 t2cqMfYhJ3wsidCIi2bokCxKAlTlGjdBnUApiZPn2XFdn8DryvaYFJc0B
 w9Qv84f0n+vjDPH21yQnHwC4o6393fS2Hsg7yWyJUMBaAhd4I7esTAn0e
 sEVKYfGvq9uA9noRRbM2zSqilbZYf3I6JuFKKvSaX4bDvDFuH+zBuSe76
 8KhPUMjiaPVkWtUeyDo8ZNfF/3UCQZyvEXU/tH1tAXxQ7xTlDygwweIdq
 ziMq5g8XQmyJT4Aq4JqiiNpLP6duoBl4LLKu+53vnzgZ4+dYmmA3bCKdT A==;
X-CSE-ConnectionGUID: OxkpRuzBQyuoeluTLbQMiA==
X-CSE-MsgGUID: 6Knf5Ul8TrWFhWfQjlT/3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46520236"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="46520236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:57:45 -0700
X-CSE-ConnectionGUID: faZfB5oLSA2TDzKVzRpijg==
X-CSE-MsgGUID: qZztUBmkRIaGJp0HEeBBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125052265"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 06:57:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 06:57:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 06:57:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 06:57:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvUdHR9ioTJrfAyay1rspoPXW5HM+FOQHyjQh0nVpvo+Xygt3j3D+ziFfPKAzVDNWvIE6TqlSAuIvbCycPTwRAc7O6eUsDz7G9rHLPFsM+fAakX5qT4VIAkbp53/IBq35ijyDSFEHDOp6IV4A2FpRr41XNBd2EG8guoi5gPLTKi6lsLQmyqhTyqDdZ4ysivcjcaLaTNRm1hMSQn7qzyD1ONSrqafavt6J9wV3ZJeeUa1Ep/2+PwSCpjWsFiumyZ2JvfAmllBW9ollDFNyjInH9Ultc/sxQr35xIbjoBNaWhpgY+Um7K/jY0SpMRIhyFogMWHc6GnA4jZC4jpf+VV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkLd3cKL5Pekz1hz4AnEfsuodMkptusnwHDRLRnIpx4=;
 b=Lmy/qGJd4H3QbNtxU8ZJJC4fj+PIOqxPBXiZqOpsvMzyE41w2khPlSvOPQ0Oq+7YaFIdUyxbtzedi7MLLpJbodf+Bd33g1tgpF5ag9trouyqNPWYdoaeih5cJUNPjxjk+Yr3NMOfz205QQJd6mXqy4QMzFWi1XRWn4dBQ+Q8VCROSruvA8OY5VIlohmM7Y/UZh/dQPnSqcQWIgSyR/ennYwux98LfpqvLBw7NV3jP/9H+8CGbD6D/yipTFaRLozPUocbKywyrDWNijMFWhaTDNryM+ruqp8MwWkCNm7qcaRwvI4hLlyayJrP2Y5xDamvhutN/+hvIrA7wXXXqM8O8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 13:57:39 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 13:57:39 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Thread-Topic: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Thread-Index: AQHbj7IUkkIlv4pFsUm1/smw9E7KL7NoUREAgAQT9ZA=
Date: Mon, 10 Mar 2025 13:57:39 +0000
Message-ID: <CH0PR11MB5444DC656A5DCD0F1AA2449BE5D62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
 <BL1PR11MB5447C81DA54DC962C590BC26EAD52@BL1PR11MB5447.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5447C81DA54DC962C590BC26EAD52@BL1PR11MB5447.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8185:EE_
x-ms-office365-filtering-correlation-id: d13981fa-343c-4d1d-f893-08dd5fdb8511
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?N5UCK7zWIvAx2nyIaZonRsIr076hxBSPlkRgZp7YHz4Fgx3MA1yszKGEaFqa?=
 =?us-ascii?Q?PiOJc/coih9L7NaMm3oRtBarsfCMtEKDcNVCM3qgLfqiDiLkkYSc4T40L1NZ?=
 =?us-ascii?Q?1TzAhoSTcchK+/RvydVnVvUpq7WnhS/BYgx5saENFQ0uosTX+qCQBWtd/Yn5?=
 =?us-ascii?Q?FCd9BdaRij1VgrzEWFMUFFJLAUMNQSDhsJYHjY+7fmPSRnmqAO4Ml2ZU5hlg?=
 =?us-ascii?Q?YCW9Hiz13nkwPHft596JrawrcmxEy+J3l5ntYnVkFfNr9xqYx0jCyw+VKVKP?=
 =?us-ascii?Q?wlL6mraxihAEdlFHSFrMR9qW12X21wtsqnJCZbcsEMeRSIDG4q8/bOslssXv?=
 =?us-ascii?Q?nDpkjV+fiERWJ+WsSKxgs2Jm7a7Y8BZMcQq0/2FsWIjB1AYNdwHNSlr4vRq0?=
 =?us-ascii?Q?aJw+R93vrqQlR90og+EL0qEahviQAedSbTKVAooe+W9esG6nJF091/YZuyMh?=
 =?us-ascii?Q?4RXRbH0D3nR3E1EIpK8xJ+HQ2C1iLP8MgeBwEi6/uyjByh5oKtXq9P8OYwsQ?=
 =?us-ascii?Q?iUUNJEwfOGpM0yGQDzpVzq7wdypejmG+jhmTX6FYjhGzYj8RSGeTN4Xv8ymE?=
 =?us-ascii?Q?AWym4Nu/GgcCBMdFYDLro31evaj77Y7vKitKhMFoJowX4wcEU9zddZ8F4uHy?=
 =?us-ascii?Q?X7iMtpuCA756CVzRJHrsQ24ZuTIKzO5LYFybs7je3nQq6H/tpKYflnaQceQX?=
 =?us-ascii?Q?p8BqTLmiMSMtYVhmN8i8wjXha++CmoZT2AvjjHbmrEHnAxtiWl4/3xe3dYBf?=
 =?us-ascii?Q?TJqwWmcGoi4OOi94Y45iDucRwe+A/eoZVUoi3QQombIpJTGu6dRbqN6nz9Nt?=
 =?us-ascii?Q?b2aEreLLcR0C1HPXBndsj+/9uTn01kf6QzgNzcwLv5SC8OcscdF7F5f/5EtL?=
 =?us-ascii?Q?xuQDHVamZJCqOQWdtcHyME23KH5sJhGZc2CM/Y85td3Myc4jgboYJHpGZImH?=
 =?us-ascii?Q?XC5BSoM++I90Ts9o0CoZ8L144MkrAbGaU2xaVTG4Vk2rscU+LXeUE102nBmD?=
 =?us-ascii?Q?yeS8xmT8J6x28Ql2QNsRlibuIwHHcanypvb9vk06Q01XiVSTuFukwXU35NlS?=
 =?us-ascii?Q?pknZG1hJiBd+NOdRQI+rr4GpGxX1H9Q6EN+xLKGqgvfoFgb36j3Egpb0Y8j0?=
 =?us-ascii?Q?8I/XTxmT0vk8NrKrUtcKlenoOVfA/ee1/ZpJx+e9LDH6sgMBpPGvYLa6pIq7?=
 =?us-ascii?Q?8KGOUE5SDfzkPMVTmsrMX5WyfF2EKJ1h6mFePj5dCAJb9F1E9f94d7YkWCn7?=
 =?us-ascii?Q?oLnqIICa1w4jf2nSKLWfTvw3zr+zBfKgAXr9/eoqsCKpw4CFcL78Te8VCxPs?=
 =?us-ascii?Q?aIL+MQwTvyzkvdGjHeNCH4kipm2/9XW8xu5f6us4pFcFucz/qceHn0g0VMm9?=
 =?us-ascii?Q?zElbtpza/yrI6dZBcc7bjSY4xPmO32DEIl5rNFWx8PBOVMTnoY/yWMOvy5bS?=
 =?us-ascii?Q?m/axQv3qwU3K0cZPtpw7JKvuQdOJQReh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oz8J3KOdahKydlrbrogiU8IP6mJjpzPfon9psOHDrkRzw20sLcQxEcBpliyi?=
 =?us-ascii?Q?F9yKwfinHS3w4I7jPPjelMfC3ydGnm5ElOPjUJZ2LmD5TBb1qlPUYjJeEPLI?=
 =?us-ascii?Q?npiYOkR1LnlQQeNWbdSxcz3Qq0owxjZJk170VflTGdjYt/BxQQL7BOSBNJ93?=
 =?us-ascii?Q?pXH16Q6ZUIFO29/73oIbhMd10yKiSNXIEanCSVGRqcuqi+CfkcuW5zcmM+4k?=
 =?us-ascii?Q?xqwiE8xmTHDLQHrcsoYap7cqE7Ph+ZnOh/LMkHEhkAkxviTVMfGlYpZU/qvq?=
 =?us-ascii?Q?pOzB9AL/rTyv/UwZPjyhWg8fdm6X2yutKpNx9ro+BMs7iWu21LpIdahSNQok?=
 =?us-ascii?Q?3uHvEjvbRKuGQmE18Y18hcgZmPz+5vSGR7Xth240IyzlSnwnxvfHWICHdjqW?=
 =?us-ascii?Q?U0wRQKawqFIrI5T+TufyY3bZtL1J5dLKlAtiyxG6h7rMDLrsnWi3fkYyMl1t?=
 =?us-ascii?Q?Pj1YFmSbkEHpOxHfddJUo6aCNeT1lwOWaZ86yevotN1wD5MkD0SKJuRHGpNs?=
 =?us-ascii?Q?Wqh/qpHa/VVTw7NNkgy1i6Zf95/phpPpSCgBqS7f4oWsKSUNTpFp6xGQUiAn?=
 =?us-ascii?Q?m63nUCXE0AkvRi81Ij4Re137yvltEugjdX3jvFbUYbPqMP3MhzCtQNU7sa97?=
 =?us-ascii?Q?OOHMaF9sO/F0MTxb88TpZmedqjqIwZS9svDJJSPFOxr45ExdNslnklh9MjGE?=
 =?us-ascii?Q?x+nQKRnfxsV4QaJZBpMlr+2UgztyuxfRQS89cJJJDyoOQIA1sDtBp8R0P1li?=
 =?us-ascii?Q?kuGBW2pGWosOlhGxVN7o7p8Sk9rs8YnYnnUDFWm3p8XXmsL7K01WqG1H+cDZ?=
 =?us-ascii?Q?FTW0XgQfywZMnhYBxPJzinRSdqw6V7697JlAm25ty7X1lrUXYYp+mWqNAnC+?=
 =?us-ascii?Q?c6zLISSjL28puUQFDjhYMuaHsIqixp6BP8fPU086/n/SM9vDDGO1vrCzMuxe?=
 =?us-ascii?Q?1pkpKzhw04JQSx+fsyQACwekLl8aiw3QQLwIRPflSpSQVgRoq9PYrckUw0UY?=
 =?us-ascii?Q?vceozOJWBmoJo+GWtEwg8MTxVGcxIG2CHKMUNTGSKRN6HQ96WmTTTmslwzJo?=
 =?us-ascii?Q?UHyRH/1FSqN4YSuf/4Vt1SKCdul+Pa08kXZ6KUkJk8Rx21Vl6UBE6j5sq4I1?=
 =?us-ascii?Q?T602ost+rUU0RfrYAq/aLTnRZCb+TVvBKoZ8I87j/Uwa3zhsYXv+x+aTPIT9?=
 =?us-ascii?Q?cqfKQ62WkiNpQEF9KM4EMFkR3oSep99IXZ6KAROgjhaO68+OEgujaAue4A8H?=
 =?us-ascii?Q?L9BU0wdVktH6Nrc6id168O1bE4KO3W8hpfkAAI/vUwmjDcA1XEgd5kvfvz7a?=
 =?us-ascii?Q?aMJ9vbV99QqhuY/k/A25lr/zkhccDmOl/JmgxWgTtjXZ+BVCHHhQBNbkwxUz?=
 =?us-ascii?Q?Y35KGnK4n+YVhlP4clc/BCNUtC6w1RtBN867/EWNRR2+QA3qMupGT9pT4qFM?=
 =?us-ascii?Q?I3rZLO8s9byWjfRcSz2bFpury91U1UJdFPNF1EVgCD5VS6VAKvrNUDGDO0Cq?=
 =?us-ascii?Q?ZkUYjPUr5sPkm7no7A+kELPESvwYdQ8wATqKynin/J/yNHH4b3i4+zENBF9r?=
 =?us-ascii?Q?AWz25YvC6KJTt5d7V/MSkAWRGkacXGFTVOe/gBax?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13981fa-343c-4d1d-f893-08dd5fdb8511
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 13:57:39.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/xq5c0650ezjqMfGkH/m89b8L4lGeQDksNV88D135DHLRCYJyjUNnqgFR+2XlOMGW2/2c5VLeeD7rkwnaB1vtD+Nl4FdZxYvNrBVGEa2O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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
From: Lin, Shuicheng <shuicheng.lin@intel.com>=20
Sent: Friday, March 7, 2025 3:26 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; dri-devel@lists.freedesktop.=
org
Subject: RE: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
>=20
> One generic question, do we have test case to verify whether the function=
 is working correctly? Thanks.
> I think we could have IGT test case to trigger the fault, then have anoth=
er IGT test case to query it with this new uapi.
> And make sure we could get the expected data with the new uapi.

That's the plan for the future, but this series has been so in-the-air for =
a while now that making
an IGT series for testing it didn't make sense, since the uapi itself could=
 change at a moment's notice
and render any IGT tests immediately obsolete.
I'll create IGT tests verifying this series in the next two to three days, =
now that the uapi has more-or-less
been accepted with very few blocking notes.
-Jonathan Cavitt

>=20
> Shuicheng=20
>=20
> On Fri, Mar 7, 2025 2:41 PM Cavitt, Jonathan wrote
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen pagefaults.  Only failed pagefaults are saved this way, as succ=
essful
> > pagefaults should recover and not need to be reported to userspace.
> >=20
> > Additionally, add a new ioctl - xe_vm_get_faults_ioctl - that allows th=
e user to
> > query these pagefaults
> >=20
> > v2: (Matt Brost)
> > - Break full ban list request into a separate property.
> > - Reformat drm_xe_vm_get_property struct.
> > - Remove need for drm_xe_faults helper struct.
> > - Separate data pointer and scalar return value in ioctl.
> > - Get address type on pagefault report and save it to the pagefault.
> > - Correctly reject writes to read-only VMAs.
> > - Miscellaneous formatting fixes.
> >=20
> > v3: (Matt Brost)
> > - Only allow querying of failed pagefaults
> >=20
> > v4:
> > - Remove unnecessary size parameter from helper function, as it
> >   is a property of the arguments. (jcavitt)
> > - Remove unnecessary copy_from_user (Jainxun)
> > - Set address_precision to 1 (Jainxun)
> > - Report max size instead of dynamic size for memory allocation
> >   purposes.  Total memory usage is reported separately.
> >=20
> > v5:
> > - Return int from xe_vm_get_property_size (Shuicheng)
> > - Fix memory leak (Shuicheng)
> > - Remove unnecessary size variable (jcavitt)
> >=20
> > v6:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> >=20
> > Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
> > Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > CC: Zhang Jianxun <jianxun.zhang@intel.com>
> > CC: Shuicheng Lin <shuicheng.lin@intel.com>
> >=20
> > Jonathan Cavitt (6):
> >   drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
> >   drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
> >   drm/xe/xe_vm: Add per VM pagefault info
> >   drm/xe/uapi: Define drm_xe_vm_get_faults
> >   drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
> >   drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
> >=20
> >  drivers/gpu/drm/xe/xe_device.c       |   3 +
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  64 +++++++-------
> > drivers/gpu/drm/xe/xe_gt_pagefault.h |  29 +++++++
> >  drivers/gpu/drm/xe/xe_vm.c           | 120 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h           |   8 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  20 +++++
> >  include/uapi/drm/xe_drm.h            |  49 +++++++++++
> >  7 files changed, 260 insertions(+), 33 deletions(-)
> >=20
> > --
> > 2.43.0
>=20
>=20
