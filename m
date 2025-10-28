Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17948C13415
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BD810E59E;
	Tue, 28 Oct 2025 07:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH6fyVMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D1610E59C;
 Tue, 28 Oct 2025 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761635455; x=1793171455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q6tRJL68Sw2bsn9/86bZuaOtIgglkVub/I82gt7l/B8=;
 b=PH6fyVMFi867gu7QmmJCukOWIdTCN/98fWyRAECdNSpw3or23Utty7m8
 qEPcliMIYgs0pRVDW7YNvYubH81Q2pJbRiv4YaP81xacjP/3QfQnJj8UQ
 M676T/ie+fUoNXtQAMLRLU4yGy316Gzw8CUVv0ruCxEM5t5sn25FQHe7P
 rdqdTVtfQJjGhX3c1cPb931yDzw3+dm0Xwo8J9fYrW/lOnDbEx193fw8B
 X/SOr90oMHO4EI9tt5GxN+9SAr0cYx07wvaH4kV+v8LN4dzNe6r7axo7g
 JNBLy6ziWHnb9HJ6tXs00A462bZ146p0uEgSfhZ5t4lCbxqHRV5NpxtXg w==;
X-CSE-ConnectionGUID: 8slCQ1Y5TgaPjg16CngXdg==
X-CSE-MsgGUID: 0f6K+O/QRn+nYV3jlHKNCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75071871"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="75071871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:10:55 -0700
X-CSE-ConnectionGUID: grGCrZC8QNO0DgQToDBpBg==
X-CSE-MsgGUID: tVZ0MNT1R/SiUzxjlx+xkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="190392587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:10:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:10:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 00:10:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu88Ly1noLwcxfEX1KnQRNO2rZPwHh3BK8LSCvRLtyQJn/r5WJ+dXQ/B5dtcI4an5g1DA08XYGbSmbgnzxsGtsI4Ti5/BwgznZ4Cm4f8XlJ+jDXKv8SYxwU46Tcr1tXi1ht9XweVJSdXfUlN6w7eFQ7Dv48QrdkYueLeaLyEvxFLolL3y6pmq3rTEyEuCmw66KpiVdMKW7av99P+6DBUGgjwEig6BrV0kLP+suN4kULLUMVS8ulJr9Ch3PeANJxebUv2+PR1rAbFBpDm7IdUiXFVBh/H8v3a3UuKJnk0cxKXR7JUrqyCL6yrPiLEx/eCJEFi4uqrkLNDPpvGOGezXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oH+pnWNFEGjtxl2GymI7dKIUC1mqPnN8fuInaeBaDM=;
 b=VMYJXUUyaRO1obmUne+38LaGR7ryMHp1eaWoRfBi1u8nIQ1NZ19yNzqIMHCtcFzEfCDrctCXuYW5WDpkBPstluXbOm6EW/koDpzVAzXBkPJBP+w37ReCNqHz2iFTlOmyY38p7daqQxJgSTXXTQdmm90xnsBOmM6BQOXkV1Hnl29l/SIBiQDyfgvS8HMVU6Duoc3nw6n1KSwo1N8iIPyIc+OxlKf20lSRA03Ml6gSsnebCUua/YX61WVYB6iQOP7gXGfJs+w3hnjMgtK8BrWYQr+qxAL4pE3N735ZnVRqkoMKMtaKRVUCIgZ1PkFJdUT/yfA3h4YUqU/6+LMzSj68Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 07:10:53 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 07:10:53 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Alex Williamson
 <alex.williamson@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Brett Creeley
 <brett.creeley@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, "Cabiddu, Giovanni"
 <giovanni.cabiddu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Longfang Liu
 <liulongfang@huawei.com>, Matthew Rosato <mjrosato@linux.ibm.com>, "Nikhil
 Agarwal" <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux <qat-linux@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Mostafa Saleh
 <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi
 Wang <zhi.wang.linux@gmail.com>
CC: "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Thread-Topic: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Thread-Index: AQHcRHIzZu3aR6gqcU+9pKJDnI0eqLTXKs7Q
Date: Tue, 28 Oct 2025 07:10:53 +0000
Message-ID: <BN9PR11MB52760B8E135F7E048773E4D28CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV8PR11MB8699:EE_
x-ms-office365-filtering-correlation-id: 6fea1896-003a-4d06-a29f-08de15f121f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mma07SoRpuRU7M5sy5IX9r4EIeR8ezcRHw3+xC61TE90oOo7maFMwqalfKIL?=
 =?us-ascii?Q?P4hDBOvJL+QlEjlshKlDJ65bbSioxxnfCyyl02BslAGSzawD3iZs3yLIVlsZ?=
 =?us-ascii?Q?0nM6TwHDSQwj7LLAx9/qUzr4MqlrGhvr/j+jMM6wiB4eTL445M1X28BDsRz/?=
 =?us-ascii?Q?0y1JfMWN+7jzlvWPQGv1H54uld9YcJwGUAO2+DaLeLImgZUdjh14SuHyQvQn?=
 =?us-ascii?Q?S4JzyQm50y47QtOMbwP0cuQdQK367jJW3l2pdgeez2a5mLMDsRqcMljjJYLL?=
 =?us-ascii?Q?mYWFZIoK9ZpWN3c7hVb3MxxZNfRQZsAcuQz9R5tviUiLroaz5rp5YVyHIjsx?=
 =?us-ascii?Q?RQMGkmQG++QJZxH1472D8SEoul6/bLUNW9yfsQnRDVZc+02RDjfb5/Nj0t9I?=
 =?us-ascii?Q?Mnsdzx6EQRO+2B5BpMW5KxqhtyMiExeAvpI8A9gZwtcal8E3DTikjxYtuPco?=
 =?us-ascii?Q?XY7msJhk8ZBgYglGvPVbgejTQCdd6OtR695nqKVnIiUZIh8LnBNr5PASyk/P?=
 =?us-ascii?Q?ei+QOrqVpInTdINanMJqyBIl9FdGKzMZKXz+fQ4b5P0LsH28yzBtZ0nDackx?=
 =?us-ascii?Q?shTtyF6CdphMNWRIgZKWqBl23FZ7GrI4MVdwbXP4kH9CqZASEJcTb+eJyrDT?=
 =?us-ascii?Q?I5+1JlBMgsGr11GQn0QYP17iZ3m2Iw7eYDubkCKn5QiznC8imxXNybQj1nbD?=
 =?us-ascii?Q?nUPhgdx52Qrga0PFNvPaNFvlFwEEFfXjiSAJZf4yeFnt+gsxhUdeecSWtM1/?=
 =?us-ascii?Q?hwhUsLtWptbmLFtznoTgPWzC0AVPB50lGhTKhkOGYdzIBh+g842rE2Xu7Ig/?=
 =?us-ascii?Q?x6U/1sphPu/6uSQZJFI09Im6yJNOFzVxGaPwy3kjSJq6t0aAmrTwrQuNB6LO?=
 =?us-ascii?Q?zhofTe1lGvYWzPPpotCSyu/V0Hj/seimkLct98YT6Z3oKWAb48hevaqalEXM?=
 =?us-ascii?Q?Rf8f+3pE3PvsPxZ/0HkrEJM6sr/mJBxPycMu6PXhwbG9K87n1HDA6t5KZ+8x?=
 =?us-ascii?Q?B7kjbJO97dc3wwJu2JLTA0YzduaW/10wHewO7KfAfYI0DW8AtCwLHs5FxbTk?=
 =?us-ascii?Q?CqrvTPYQMGaI7VQFw7AVyLUT2rWgPzSMf3M5ZI1cqJgTe7Zr0kdPzmTjEtLF?=
 =?us-ascii?Q?2RHTW713XTf1qF6tyw98I2YPvRxp8uySPeiglBYFo7of+xhfphhK5jLgUy8B?=
 =?us-ascii?Q?2Kde/i7RGlNAk7794FEIrKpvCzbbQteC/wqWpB19qCmvXCS6KjdOZuY697hz?=
 =?us-ascii?Q?xIz9fXwCv5OOErSVa9TCPQhTwCaVwjyrJe1W/W58inlGEq8ci5yHOjESm+U0?=
 =?us-ascii?Q?8V9ktZHEOajSHwMNwAPl9nFZLLcUpMCSdkzdzwOD3aDeMDK4bWwqZbOIHY3+?=
 =?us-ascii?Q?yqUVYfKkWlM+KKR8+eyFhKLiP5X6Nlhi1w0Sl750ZRuFDtsEkKhWYtftmM2Q?=
 =?us-ascii?Q?Ki4pJDtJeQYrz7JqIa7lYztcniuCc0actDOmN62g9LnjMYs4KLxzYhUVmh6+?=
 =?us-ascii?Q?Kbpn5PVsvvfgmr4/n4/LHY31iX9vlj6CqWnBwJNqv+Cup55Gp1EvyCI++Q?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AaE2M9mU4PZZV6GqzXksKru2+cKfH/HIob3jgcMFVizzhDjalirMSoh71V3d?=
 =?us-ascii?Q?J0E4AoMUz3v/45mS91RhDxldayl/3dwEyAC/4EIXk7rxMRclIldcCeNrEF3x?=
 =?us-ascii?Q?goQjDMeqnDQBUNFt5dTuatntnKpxbFi/yrNnPIkcA7nmbY4ILq7MWvwQGCca?=
 =?us-ascii?Q?1DBrb1owjhCrqYZqRGOjfuqLbCrO/dIqMXDHDcesovwb2HTXrHpWDOPRoSZR?=
 =?us-ascii?Q?4Gu5V3AH0N+ObHFf1qzqQRV9a25ZbBIu7rqaunQgZD0ZvMrJItN0AGt87ys3?=
 =?us-ascii?Q?sDSvhhzHjqvq6RUXKO9dH0rFC06fzgn5B1Y4JKDR1bKULk5j3H7SlXNweBGN?=
 =?us-ascii?Q?XwWXHm479TTUaqeeK10TZfoGh51ZGFL174NcK82edZ2BtZlsLp70t5OyUtVN?=
 =?us-ascii?Q?7Myx1SQbVZeydOrOgkXG+P/OL6OGGWBQ9FJjvbLaVxm02XZbxanOTW/DG3Ou?=
 =?us-ascii?Q?0pC3X3cV2TmjdfvmBzvvy1lEyT+js3i1jZG+rRVy0/BrZ4bksJxX9nQ+AT5S?=
 =?us-ascii?Q?u/yGTbHqShMsRvoscB1EhoYBZ4BRgT7ynBV8rcu6hVOR51Jz7sv6ucu2UFlf?=
 =?us-ascii?Q?GeLA/fto90MHKVuhHyubjJ/y1sfdQm2jUiL0OEKrudZx/j4/JA/4725N0BvY?=
 =?us-ascii?Q?GV7vW8YDP+d8+NTJ8PzRZsRJz7RBAScnqVgCZQkcgF/Q0frh19R+kuxvUG3e?=
 =?us-ascii?Q?KeDDOE8gjZUxA5PAMw1m0G5ABoYbj8cxJnUYzvuAp3wNZAKE+XF/76f0blFr?=
 =?us-ascii?Q?mTFk31aU1CwdXrnruuFKnfGyqpeF5dmQNLNECpIMeFkc8GPMKwbTWQXs58Wd?=
 =?us-ascii?Q?FgfkxekZ/+I7ME/6BTlZPWs8jfhXT9onCKayszbLvgZHq6ISY4J63lyviaGY?=
 =?us-ascii?Q?C7hSBZmmpJGksq0BQS9n/SiaE5itYbNn+883c7Zr1xZcmSg3k65QdlfNbWsX?=
 =?us-ascii?Q?/SdK9PY6/lVVUCFlT0C1JQyfmo2uJtnd2vVYRjnDr+qrxNs/EzK64kkv50KK?=
 =?us-ascii?Q?Y52Nt8qP7mLlZ7myJKT+brANotPQbg2bCf1dN8hbdAfi2KFYQNLq/SILONCr?=
 =?us-ascii?Q?VNQu8xhJkBvv4L+re88sIctD/R49SNie6iCCJn5TIJeAMs2PHO+OXalIoObC?=
 =?us-ascii?Q?npDNehsyT6QEAzUDclytPg0btpjAWzCFigSpYQSv/niYM99IxqFaIoukF+Ph?=
 =?us-ascii?Q?xqPq0isdrBE3mf1lvB4JXFSe9nenyj3Ekz5hTKDk4aRuCDZblotRaOwHtJy+?=
 =?us-ascii?Q?5wgq1npAZKh26d0EUr9Bqwg6R6wHmec/NgPw6yri97At/diaDNKtHUTz29xj?=
 =?us-ascii?Q?So7bmDaKHCylP3ItX+PrN/S28hnh8lYmIHbIrNDBB2wvprJCi1EtxbSvn7Iy?=
 =?us-ascii?Q?MgnZt7yH3luR7YjF92E7I+Ep6QbJ6tEHLbppJ7CKr7unBa0fuyarHcmtl6NV?=
 =?us-ascii?Q?VeLYfGAHUcbr+ALOFD1fl5q5pxHDXFy40TWRTyB0vtohj7jgWiuU997YmCku?=
 =?us-ascii?Q?rZ6CUIZ8GUO/64rMpHblR5D+OjBgwMPZj5VV/2uNB9s4vWYwyu/YWXAGQr3A?=
 =?us-ascii?Q?iTLG7mQbcjOUgX6xWbCbFnjVeiwP83z98GtkVs+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fea1896-003a-4d06-a29f-08de15f121f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 07:10:53.4103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SUMvAm1dkA+msxkJolZWiVE8NNuwaeWTITt2h2p56z4LWaaXqjoP1QN0Oj1+21FpNKFccBYMdTbGMCiapCj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, October 24, 2025 7:09 AM
>=20
> There is alot of duplicated code in the drivers for processing
> VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
> which provides a struct vfio_info_cap and handles the cap chain logic
> to write the caps back to userspace and remove all of this duplication
> from drivers.
>=20
> This is done in two steps, the first is a largely mechanical introduction
> of the get_region_info(). These patches are best viewed with the diff
> option to ignore whitespace (-b) as most of the lines are re-indending
> things.
>=20
> Then drivers are updated to remove the duplicate cap related code. Some
> drivers are converted to use vfio_info_add_capability() instead of open
> coding a version of it.
>=20
> This is on github:
> https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op
>=20
> Jason Gunthorpe (22):
>   vfio: Provide a get_region_info op
>   vfio/hisi: Convert to the get_region_info op
>   vfio/virtio: Convert to the get_region_info op
>   vfio/nvgrace: Convert to the get_region_info op
>   vfio/pci: Fill in the missing get_region_info ops
>   vfio/mtty: Provide a get_region_info op
>   vfio/mdpy: Provide a get_region_info op
>   vfio/mbochs: Provide a get_region_info op
>   vfio/platform: Provide a get_region_info op
>   vfio/fsl: Provide a get_region_info op
>   vfio/cdx: Provide a get_region_info op
>   vfio/ccw: Provide a get_region_info op
>   vfio/gvt: Provide a get_region_info op
>   vfio: Require drivers to implement get_region_info
>   vfio: Add get_region_info_caps op
>   vfio/mbochs: Convert mbochs to use vfio_info_add_capability()
>   vfio/gvt: Convert to get_region_info_caps
>   vfio/ccw: Convert to get_region_info_caps
>   vfio/pci: Convert all PCI drivers to get_region_info_caps
>   vfio/platform: Convert to get_region_info_caps
>   vfio: Move the remaining drivers to get_region_info_caps
>   vfio: Remove the get_region_info op
>=20

for the entire series:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
