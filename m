Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB8CF8043
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301E510E4F2;
	Tue,  6 Jan 2026 11:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSJvewAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804F10E4F2;
 Tue,  6 Jan 2026 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767698500; x=1799234500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RiJNO+IShFmqthjv8mnXRfXTNcg4asHzPD3Nhdi6zo0=;
 b=LSJvewAXb4Wv0fi91IY1dGhwCwzUa7pQEta6Jxz3m9dimgx94OgkT1bD
 wz8LQ47XvtitnxnYSSVxCm84LV8EqkR/G9b8+20mZlHaENVy0pP1RH0te
 4aUZyA0V3E19MCTD0QSttbtDv+6AcQbrbkY6rE+TNkoyOY/fCRMeWUoIn
 fMAAtzaqKZQcfpY1UNy3rVO0jkRz66O2RdzGQjzTt+rNM7hzHXhVV9L1o
 v73a7NchFeJJ+mPVnrBx8BnjihSxWipIC2D+0NVCG3HKSuCHAMmHMkJFN
 1lZOLEUAQbQmW9Em2GFWTD2eqQZwuOzDJAZoPywWmX+/x6ngFoZHtj/uO A==;
X-CSE-ConnectionGUID: 73JZqbC+Tq65L6YtTUgThQ==
X-CSE-MsgGUID: +twk4115SCizWQjDpYQMJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69043675"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69043675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:21:40 -0800
X-CSE-ConnectionGUID: CNl3WUumR0O+sBfpN8YZEg==
X-CSE-MsgGUID: FN9sVNZCR0Wg93ChfqhCpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202528392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:21:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:21:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:21:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+r6+OFWvdDdA/gylZZdi2ICRxmNr81lGgMn1piCudrhDKCZL4wMJoVytTevvp/RgguL3CXFgcZI0c5W/xjIaX/YBZMs96k32gk83JgMph8zdQlCH2iKo1HZ6E0rD4uQT9MFGpeJ2uOVutAk2lM0aWg2HP3NNIKl6cSed+QU4fkEhEjtZBBKjva4rBJTnQ+sfl7y3+RMFqX7xXUqUkJG5Og/QRJo6ROayneBv3prsTEqa0fhkgAs9vOnN9L0IrfnqXzGytx8HxMVGTAPtf31GIx1bhFZhEqibRKuAv0YKs4Gi8b0XFYMtxTHoTMHXUeSttrKv6+qzKMtPnQdpT2jrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFVrDqIiafqSl61jD6AVatE2wAzvTt1cPUx0o2Y7U5o=;
 b=NdLbnXVEdCGMFLlt3kuf/uTGEfzWmx4TGv5Ul9LO3awJjQXQyIpH8oOZsIsa6IOcQUP5RJa99tOZaCBqIkgLsoR8GR1420LbogIewrowxhNPKQQaM4mbGrG2uqnL4ptZiMrv5fEHMyzEAF5bP40oHZE2cZvIX4SxyTnWgkL1mNbfN13NU39vpepraCB/JLLMKL77e7VfzY1S1VY2YI2vnk/FgvBlVI+eNxAG3+ja4Kc4Jdd628YI3CHCepdj6p+0emHLs81RolVz3U3lc60tbbQTjcjdAmeLOjZtH4LvgvInUVKyZG5vKhHPRuIYXpoUN+xnQm++Wpke5/0Rr4ITgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:21:37 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:21:37 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 11/13] drm/vkms: Remove drm_colorop_pipeline_destroy()
 from vkms_destroy()
Thread-Topic: [PATCH 11/13] drm/vkms: Remove drm_colorop_pipeline_destroy()
 from vkms_destroy()
Thread-Index: AQHccLcKgbHwhN+JTUSXbqiEMU7TEbVFG5Rg
Date: Tue, 6 Jan 2026 11:21:36 +0000
Message-ID: <DM4PR11MB63600F2AAB396FF3633C87B3F487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-12-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-12-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: d7aa9fdc-74a7-4e40-d320-08de4d15c18d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?U0WFlY6WHU8JhvfnSejr+OAsPOI5LjjleAjoXlem1WIgi+vwHQqgLDSpocQe?=
 =?us-ascii?Q?t111Fl8hPPvxZaDtelCWWirQ4sNAtmeVzsEnVCc+YpyBeEDOtXAfS+9+Ipsa?=
 =?us-ascii?Q?9k8jOiLneUFjb6G6DJDOGljTSi3zg4CJXX7E9toufmtFJudEGQ6L2xLK0An5?=
 =?us-ascii?Q?vjMpFhX8le2P87g9ui4WEyvepLw/HEaMKgs7fT5TbVDbpslMIsxaYVbT+L7o?=
 =?us-ascii?Q?VkSDInZciTrF+CSKB1Z2tHkt8hK7LExIrFP0hNpXDKm1qbs5OMmjm9cgtgla?=
 =?us-ascii?Q?U9ESxwZ0O+GP5jqXez6y8l8D5V1yJTt5lF6pqWgYTkR897O9zte87580urmh?=
 =?us-ascii?Q?w53fwdqvzh7cazssdkTbACY3xBH3rnC2YZIPGjgAz6PR4pIIgjt9Jvwuszd9?=
 =?us-ascii?Q?GQuigG7IlnPI6dn2Ddc8WsBux1BG7TTpoUI3dIz5c4fQD6SJthajaty7S/ay?=
 =?us-ascii?Q?65KJ9UWE4Z6HxdAd8BnETus5SrDfoGr9yJaGdONuq21eYZ/7zPMlqWoDfQ5f?=
 =?us-ascii?Q?LJ/7YWR2FbvH80Umbh3TFfjvUsppFyK4tMIZR2dK6ePZFhp0tEpFM4vnv/Wt?=
 =?us-ascii?Q?Jmi21gb/XUdKucKaI5n7LDxqL2gWBfWeI+f0xiVx+Os5Y3Z7NfItxgMmvj2D?=
 =?us-ascii?Q?h0ZQiN65mnvtJfQgmWiY2GB1jYvGAAiCmwllRMTE+6/TcBpdNA19qEN4/cWL?=
 =?us-ascii?Q?puA+q11cnDHmZey4IcmSv1V4CPrqDYZ8iETMUXAWV9lVE8s7PAWP370btHMT?=
 =?us-ascii?Q?lPrFpRrPsy/Yr77KfdXfdWuzbNKR1Y3elk3iCIxiykGkLypgnmhnTOATj64i?=
 =?us-ascii?Q?Ua3RsCAWQVq0uAlUlFuc9rhuWozHsqUJaU1ZjY366vFndwnGqM3xHjtFDVIv?=
 =?us-ascii?Q?5jD6epYGvA3zha7JzHWtCC3qq9IIYbeK+5xQ1EVD/77cXnF5rHuOcQFWFvi0?=
 =?us-ascii?Q?KdH4ocHXYrfz0N8hHvLZaZSKBIKT9qbMyg8ufjpiPIEyh9OrBFZ7Bsf+mvac?=
 =?us-ascii?Q?bIEEAGR7LhoxZcL4dbEABGgl5CweuZ0ozjOP8siSLDmF0CGFUSejd9HXYDnQ?=
 =?us-ascii?Q?LbvXx9kEYLHEsauIE3nNDRx7vh12nQ58NwOfB8wZcAGwJVvCB72ICjZDyxTd?=
 =?us-ascii?Q?utKwn/B0S/dO9pRUNI/F73rYi4ZpdGcs3kc2KX7vaOWNEj/s6q7E6LoE7/wo?=
 =?us-ascii?Q?2q8j1kfmYiVnpOokrW0HAGtxHqBfVZL7K9V5eGu7whhF++vLORntwFxxlqer?=
 =?us-ascii?Q?YhvI7x7pQHwdortnhpMMBfzmCUMmauacB23DEV91NUBA4+sFTytbMW6w6kcf?=
 =?us-ascii?Q?ADpEK9STadWu/PrrHVjmS+WnuyvoGFgs3/rwvWMchDOUl23dLSwq8B4oOsLN?=
 =?us-ascii?Q?6nMhumrNrUpzBPC9+7gWYyA6Nqacw/rsJZ6/vUDEsXgVCZXnYnxdEFJfoEHv?=
 =?us-ascii?Q?Is7Uv9UG6Ly5bdq9N2wnhssV8doglgtkNMb+PGmv6WqbBeX39dSzaK37tT9R?=
 =?us-ascii?Q?XLsMic4z0d8n9+3TCMABIfLZy+Nid5G6zFri?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qyOBl69nby/lzHyPzUEntyGcAPxAT0ZhsXaEEY3hcY8973/OrBzbX/wE3ut9?=
 =?us-ascii?Q?42gXqPysX2rpdSs2iBEAUSCSDFmG9qDqOpxaTY70eFTIsunO1NI/lciiOijn?=
 =?us-ascii?Q?yHZ/0YbZTUULhfXyYVeD4PrLnltLOIvTeFreDA97Mzu0OtkP2fVFStHxnVxv?=
 =?us-ascii?Q?/W9enuahrKiDppV8KaO+Mqn3biK5F4+Yttj2LOTxBlEGKEqD7F1gxG9RyW5V?=
 =?us-ascii?Q?lhUbwwC4hXIFCbFxoFvfVY+J+upHLtqOgAOuDeP/j3rM1PQT1MDlKjFIvgmz?=
 =?us-ascii?Q?pty8/D1TFJngp1fSnIc22duO41GeHGvQnO/IHpqQ4ti6n/FfGCELkuNCL6l2?=
 =?us-ascii?Q?UxIjVGjyTA4WNgbWrYQ12hY4Fqy0R0+OgxxQzkN5Zg20cH/BQUk06NU0m+Ad?=
 =?us-ascii?Q?5TigLGuA8yBDUsIUaewkkttUDu6Rnz063DHIehoGoG0mSSB3wY7+kOUr0izi?=
 =?us-ascii?Q?j9xj1M3N9ZZKPdc1hgcLYCzMdaAKiC6L36WhchQnlAsi9bSjkgs4WgftiPx0?=
 =?us-ascii?Q?aNU9E29m1OhGpnSh9aABTkwxilf46SGPsKkjaVCcHNzBmO83eLbJBhh5IJO8?=
 =?us-ascii?Q?bT3KgzSPDf9is7/du8cvnVkhySlD5YZDanAD9BDU11jRKe5olSl512HQMaCD?=
 =?us-ascii?Q?Q3bXM+lk9UYKM4fn2Q2raku9pkLmLVZR+KQvCWCcCEMYDH/hi8ZdONpD3MST?=
 =?us-ascii?Q?VfFM/PlaQJVxlp7o2c4z0ySgQd/SRd6R5hqLtgemKvnDhDneQirMjxJdqQ+y?=
 =?us-ascii?Q?2TyJ4qVrZpnLiCi3F0PiiYigR+IDnYhkBUJcudeIAzI/BSLJQOBujb5UuhR3?=
 =?us-ascii?Q?+Vgau+3Ro/Po6kVMY60MQlAua+55z3T7gzNfZ9WjPaQi/9R4eZM42hidJqhu?=
 =?us-ascii?Q?QPNE5A29Cedo83J337hzkbJBAostE6JsEYt3z3poq01KHcXbfGv9E4PI0UOT?=
 =?us-ascii?Q?tOU0z3o+kn3Rh5CgyvGtS0eRXyOY080hy/rPy8dnG72qTCDTYe+On0cD2onN?=
 =?us-ascii?Q?v7rRoKM1OtUcQ0oin8UqLQ8QExDxLrz362UQaWlaXw/xl4Ru4foMkSIwD5U8?=
 =?us-ascii?Q?MQ5zkZaPBo8cSILJNXCF9pGU+GabgHVs79vA/Bw66Zl48JrV5ufTDhquO3Ls?=
 =?us-ascii?Q?QfqYnshlEQfsbj7dOYbVTMUsB0GT6tNLfB1MFmX2dqiEl2bp5H9kCeIeeK4I?=
 =?us-ascii?Q?Qr9xeNQxxH1sEm8K5qensgnbHf1V9/8dk0WeUW4Jx2vSEYyaGaMnKRFkAOf1?=
 =?us-ascii?Q?pGGub+RmCbmXEQ1rLJCRh7727nDEUhPPIoEj8ovvdgO2r02gunPL59IlmlHh?=
 =?us-ascii?Q?Up2Zas4T6YO11uhwKl5OOWF6iPDNe1q2pFOiRenjRLDFQmYIePjcMVxQpjc9?=
 =?us-ascii?Q?z3ULMSbx4kfmXf/MqP7MfhXsFf6iDW019/fFZALb/dMyPCUomPK/Tw5PVtyY?=
 =?us-ascii?Q?eqsLl6QYlf8FwOHjC8cjLmjwq6S5tcBsCQh6f4jWNSXZx6MWCgwo7RgTR/tT?=
 =?us-ascii?Q?RhXTSqZpATOJV8aeaBQd5yoiSpLJ0EhhWHk3kFDt5L67gyxcylzjA2rFrKw8?=
 =?us-ascii?Q?2c9aKuc5LoGiAKsbZo87gZ0y+0yKx1mF+wYegCZA/OhXyBNnwG4/uzvhEe/C?=
 =?us-ascii?Q?dM/3sOQE3PaywGYUQbSe1mQCZlCVdz0r7M82tJ+kPxhPhSrjzXVcfi2z3SzR?=
 =?us-ascii?Q?5RU3ot0CotpHuYBItLfd8yK0IEteLh516m4Td8KiBpbt/QafsVTeHP82WsJE?=
 =?us-ascii?Q?3IED+91rfQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7aa9fdc-74a7-4e40-d320-08de4d15c18d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:21:36.9802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0u4Xoqvy5FDNwmFnqXJKybErmn5u0dSxXqMx0sJdW6ry5pDrxCXD5NP4j/zX+McfxPh+LvlitEUHYbx34HCVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 11/13] drm/vkms: Remove drm_colorop_pipeline_destroy() fr=
om
> vkms_destroy()
>=20
> Now that colorops are cleaned from drm_mode_config_cleanup(), remove
> drm_colorop_pipeline_destroy() from  vkms_destroy().

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index dd1402f43773..351e17b5885c 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -258,7 +258,6 @@ void vkms_destroy(struct vkms_config *config)
>=20
>  	fdev =3D config->dev->faux_dev;
>=20
> -	drm_colorop_pipeline_destroy(&config->dev->drm);
>  	drm_dev_unregister(&config->dev->drm);
>  	drm_atomic_helper_shutdown(&config->dev->drm);
>  	devres_release_group(&fdev->dev, NULL);
> --
> 2.25.1

