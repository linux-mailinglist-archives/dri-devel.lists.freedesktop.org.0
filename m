Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE7AE12A1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826C710EAB5;
	Fri, 20 Jun 2025 04:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA1fLh5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CC510EAB4;
 Fri, 20 Jun 2025 04:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750395213; x=1781931213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lcYILiAPkQaX1gUFWiXbAAja3um3L4rZiZoGNA4aIv8=;
 b=CA1fLh5dF2KEJzUoznCPRrIX1GarX3g+LfayHQHxR++SFwc7IXDmac2l
 /LQ+J21zoEkD24JYPKYsIPj7SgsIJqhwH+Ed8NWg8UUgx/hhNs+T9CdTk
 giFmzntyoPjYSichUbnC8xwYUQHm1bMWCU/ARzhQcMfann+nOv1+YkxuY
 UcRKJg89ysne8poxHHKh4S8lEOg/oxR/uO4/zaAZV3y2mGhxVOQu8O+ey
 OhTy8JJT1nM0wmZ13BOFk4ceUlMFPJ1XAqP3HzhP2RtBxijisp8Rh+AlF
 iouc8tPdGhQjY6CQBYvMyNT2iZqYtOyp3ezXj9MRMt1fHu3WlO+cged1o A==;
X-CSE-ConnectionGUID: HCIITz3dQBmRdFpLE/Kw1Q==
X-CSE-MsgGUID: e6ZBF2l7TRWo5XR5LNkg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="55279254"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="55279254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:53:33 -0700
X-CSE-ConnectionGUID: 60r/8rTcRNip1oXgV090AA==
X-CSE-MsgGUID: lYMJzwVOSZixLxA1Fps1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="181830253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:53:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:53:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 21:53:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SppVrWAdvPv0Be7lw3gxsPrUCGn/AHzWTaR3wRzIDpscAnFjujQ3ukmAKCJXmq/etMOuDDc0pfSSFj3xMtpnn6vVk6EXZkCrwhlUTMdjUVvDCReVgip1Kxf3Z8FQ/snqjOZukl4OxD9CC/NCqgmACg4vV8hnG43eU6ZNT19ukF4xe6MAAiEMNbUOw1fTHxYn2+dE1fE1xPtfpF/mLBZpV4ACA3ikECz7L5FybZIyUIHbe9BLhnik4kzyuKA+WsBAhxvaQKyZ8PHh0KAWIqnFbXF181vDL37VAAwhTjFg98hwVlhuzVXgIZ0YbHYe4lzCs2hk62e1q/UxqHZcFZTqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeU8Hj4Pe0i99Zs4M0JQDiVXR34e5FuLv4ZCr6BPsGE=;
 b=AR29Dizi2S30EF8tE1VMHx7+atr3/nftTXOgXq0u68JLkIXf0bAI5fx86d9DA7wHRu1npcA3lteSW6a77e9jfmNHcKMoFsCkl0SwFUiMmiE1iZqrm2SGMXjtdr1lVdqg4MexeuWW0o+D7CjhruaGyPKAZzr0ybCMBXut0sqc7hnsqOuAApw39ng1OskkgzpnO9V74obyGEFhwmT21bS6bPjFn1k9nwm0uX6BLIhMAmxpekZRjQMJ/CBzr1uVq7ZyFWroecMwnFJnOY5ZNSlhnn0rMbndf4U7zdsJ6XIeXY61MO/nFiPFDgy/9P5/wF1sZ0bk5CLqA+3GmuFSyB839A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB4902.namprd11.prod.outlook.com
 (2603:10b6:510:37::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 04:53:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 04:53:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Topic: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Thread-Index: AQHbrPQsCPbr09ja/U+vv0jvBPBXnbQL4rkAgAAB1NA=
Date: Fri, 20 Jun 2025 04:53:30 +0000
Message-ID: <DM3PPF208195D8D784D6B49529CD251A527E37CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-11-suraj.kandpal@intel.com>
 <IA0PR11MB7307A074AEC006084B87C350BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307A074AEC006084B87C350BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB4902:EE_
x-ms-office365-filtering-correlation-id: 37e95730-b585-4441-f4e4-08ddafb66743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fRWF2nqpkPYMZvVazJuYkJnsZdf9mfVuJBwy1qpW78on5fAAhu6y9j7WspdY?=
 =?us-ascii?Q?98Zi6SF7i679Z6gUSe1XlvyxKpb4H8NL9SlXhq+J18Ht5gjg5PXbuNqJRqEb?=
 =?us-ascii?Q?PGxBlLi+z7sISpadG1h3oI4CFVgaGgYg8xHZl5slWazRczdJOQn4hZVBnMfT?=
 =?us-ascii?Q?n4VArdM2hNlmTrBaLuji/kqBvxVM2O8ZNR02xzx2a03pJGVb5W4eyJHwfF++?=
 =?us-ascii?Q?Jk9ddVgpkM2cgG0LYyy+MQalpGaiDnDKY4qqMwf36Hd0GLv2h8+5ktkv+MbF?=
 =?us-ascii?Q?VV2duSDrE69TQkhmqwU7ZSq/inBRUQV9HvXOPNimGYGps3bZGccsEAXCEfep?=
 =?us-ascii?Q?gQArj38eEhenPsJnBBapUoNVRF9O/O9Oz8VIZ66oOJTxd1mlsVsLRVv6pvxz?=
 =?us-ascii?Q?EkuV+B7+vnnIKdC7mDDzOb7cVhHcgiQaXPo4N4nY4+ykCh++JywkUnyROnDq?=
 =?us-ascii?Q?qwCZ4MKcBWcNhAp+UPzwFE3EgOlyzoS3S3vw+AOEgUcYcUSMbRhJMPy046Vm?=
 =?us-ascii?Q?HyhZbCf3m783B7KNNRR11L4E3iDTRquQHQ6AZ7rGjJ838Y+CobBZejT+WrGP?=
 =?us-ascii?Q?VYjb/J5Y0pX5s20yQuGNWzKLuXWoKBdRsraUKoUFX0VP11gPCq6JWGf4WcA6?=
 =?us-ascii?Q?PmfuUWPNPRxW07iCYEwtBLu0RgMHP0IDksqH45VcFRpKjgxXwsiVPh3eCTRK?=
 =?us-ascii?Q?iyeEI2uggGjsv4mzkPNzY+jzfKuGsAbR5VJ+W/Vd0WTSQmB+F1cR4ITQ7TMp?=
 =?us-ascii?Q?Xi7aACrjP6bAAuGjZipxn4xigCQZNMCO5JoeY/+ay8DE04DmfwfDkE0TruAn?=
 =?us-ascii?Q?IHjx3OLYuAMQyWlBBkJ8cFBj9cF/t3jDZHEyFdMzC/x9/N4LH3R+6IGkhnBt?=
 =?us-ascii?Q?6/AFvyK1qdc6ddwUk66yu9iHdZgz8dKsrM5JhQqPSAAd6j70Y6T2vWU3sxqS?=
 =?us-ascii?Q?rlArrVGYNaPUPvKUHTjmBheKwDBSP/0vaQvx6QziotjGVJmupkI9HwGBU9Q/?=
 =?us-ascii?Q?1GjnqKZS+U5E6TjS6O14AWkGzEYmLu5bVAFKKv+LPHI+w8LUgWSjuK3ZdSBx?=
 =?us-ascii?Q?1196Kem4O231MLzVShQJyTfhq+ExwLbpuAPpevmtfX7DJuqnmwkd5w4xL9JL?=
 =?us-ascii?Q?udjArJ/ywj4rDLMnq7TOIh8HbBkrQPdQ9aVNMqB7n6QsUx5e7g2yZTqS5Q0M?=
 =?us-ascii?Q?flbDgCb1Wv7vvZ0bscp0aDuX5UbQCU76+1LUb+nzxQmlExmG2tSSBTj0+Yu5?=
 =?us-ascii?Q?IWwN4Dad15TrV8MZ9/JlJrufQooST44Run/Svq0H88AXQMfIFOJ3LvQVuto6?=
 =?us-ascii?Q?EyIfEaon4YgyToCgGtj6iGvRXH7I5aqYRYkpChoozeNt1GaDnto4rLiv8eXV?=
 =?us-ascii?Q?u7OKr0Kkn0kByzgygyTxBDeOV3TLF17QOgnuBrDtzeeA+FGyWTrSPtr2Gb3X?=
 =?us-ascii?Q?2wFu8V/m7EhaK38tGT+gGHY35c92ky3ks8/aM+PypU84uRU9AtoatA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ncfiaCB+n19qtJLQxetgjHsDpfJ6PtLTIK0k/U/DDMwgh0HXX4t4MI0vgDW2?=
 =?us-ascii?Q?66UwaysglKJVdmPW3zQBvaapY+efHEZEKYknbKInrTPMJpBl1jnB/Fg9S2M9?=
 =?us-ascii?Q?ZzHqgYhPfmmiSNqs434YxSOS++iHkOObphWGysqfDbnhfUTifi8s2bN7/eH6?=
 =?us-ascii?Q?nrV+A2Yszoqwgil5aGedf8hKoIy5w5GGMJJe4l7I58RucyqI6bPtZUB7TWny?=
 =?us-ascii?Q?UpY+8y/OHYcOpISTcTPAseRNITBnjp/3bLY2q0W/f3bZo4/kk80MVdlE9ALL?=
 =?us-ascii?Q?zS7TSZp4S+nUoRNtk42bEL+57p3E3+BO0MXvQNf7GSpcpk/3PFVef7G8Aq4r?=
 =?us-ascii?Q?SVvSyGiUeh22bX0+epBjiiCmUrrbGLwADGHuH0AnFEsuKdvDduCWC1QmTgiG?=
 =?us-ascii?Q?JKHZ2Xmn9VQRqK21VsVqGbWM3UPSaayYfGlSsI/SxJRt4BN6OmohQhbTtvMS?=
 =?us-ascii?Q?fF7WgsZ1YkdhBndSjM1SsMmEQOKk8MXYSg4e2ArYJNoQ7REDTYdOouO12Jz+?=
 =?us-ascii?Q?bZ6jLi5/Uz8QtehncOgratqAncn6ypN2qOUZeuYEEw/FeybOmu60EqHa8S4r?=
 =?us-ascii?Q?eJmFayiL55e9If4NABLLIgCgWB6P5BK2MAET+Yp5CXCAzN4fmWPYhcAApnlk?=
 =?us-ascii?Q?9G0/aVWZNg7nvlggsJu3QY0r2sRpvsRNEw9KaSOx0MZgiWkQoH6v4ectCA1d?=
 =?us-ascii?Q?v5layAOJq7KOR3tsrb7DkKLhKn5yUgjcji8EHQG9DdeCOK4biFws9002jS7c?=
 =?us-ascii?Q?SS6a3lHRWZ3hTwYq5SOHf4UZcVBQRTHmkFdDepv/5+lCf24cXRrMvex4Rs0I?=
 =?us-ascii?Q?39HNgqu9nq468M39ACO4OoR7TEuKVNWkhVT1buE/LVIiK+xwwWBMA5r+A/6F?=
 =?us-ascii?Q?x254M2NEld7/tzc9pHcw4w7E64EBhlDVXzITJi/u6IujSbU6PQpaVEihNyZj?=
 =?us-ascii?Q?QhEORyiPO3svUtB+QWwXJSwOBCe9VQ+eFGnUyFn/0dR91CMjRLmGu/T9ENXt?=
 =?us-ascii?Q?zgCa8tSW3pjBauJyFG6tBUGeHjxB6n/X6WMhigpbny1nQKFhwugF22V3SDm4?=
 =?us-ascii?Q?MalrihvKbxsSQH2IURfbXyYsSVkJTjuNbA5jtkvGQBxp64uoANRi+sqwhYPC?=
 =?us-ascii?Q?UOaZte9cuCTljMqtze1IK+PukiNgWt1AyV5wUSUmPJA83w7mo0zgcD3/as4g?=
 =?us-ascii?Q?C9oJHy44J4qgvj86xKr0mvQ7vvT39an68E4e1wLQ6D0f4+hlQeiJY3LxO/FQ?=
 =?us-ascii?Q?AObNBdGjQt3W2QF0JDoDe0AytMV2P6oI6S1dKXbA7ESOjCi3G7Z3YMQaA4wz?=
 =?us-ascii?Q?i7hIBE3SHX19+Jrq2DKFGicGlZ4hjUhQqGvlGANK5/htIOzs8bUYpE60o2Z+?=
 =?us-ascii?Q?s2s9kC+yoFUzRqh6uEjc8DbxKVoNa7CL+t7/draS/n9aQJ2JEQ51BxLzpL8X?=
 =?us-ascii?Q?Fq1tfjjNwrRp6rjI6aWmijnI41kCNaHv21gr83pmrgzcqbJ5blnlVYsAYhbq?=
 =?us-ascii?Q?M/wMgZWmKZWtPtyOhyqL/0rKDy3Kjk+GBtS18S/4fhQDgagZT5HK758lsREU?=
 =?us-ascii?Q?cJBB2f6tKh3kZ5boT0Gwsaqg8VoWAXg4Tr36TlVb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e95730-b585-4441-f4e4-08ddafb66743
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 04:53:30.7622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cfnAgL3YP0W1/PQizECmWlJMQi3mGQGn84JcN6PiFh/fdBW0aJWXaGogFG6HCzu99RDUL7PKCnPcbgvc/KgMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Friday, June 20, 2025 10:17 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH 10/13] drm/dp: Enable backlight control using luminan=
ce
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Monday, April 14, 2025 9:47 AM
> > To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH 10/13] drm/dp: Enable backlight control using
> > luminance
> >
> > Add flag to enable brightness control via luminance value when
> > enabling edp backlight.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 0421b2ed9bd4..4e2caba8311a 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct
> drm_dp_aux
> > *aux, const struct drm_edp_backli
> >  	else
> >  		dpcd_buf =3D DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
> >
> > +	if (bl->luminance_set)
> > +		dpcd_buf |=3D
> DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
> Can the backlight control by luminance be used along with PWM or AUX ctl?
>=20

It does work.

> Thanks and Regards,
> Arun R Murthy
> -------------------
> > +
> >  	if (bl->pwmgen_bit_count) {
> >  		ret =3D drm_dp_dpcd_write_byte(aux,
> > DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
> >  		if (ret < 0)
> > --
> > 2.34.1

