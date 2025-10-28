Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E1C1374D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A139010E0A6;
	Tue, 28 Oct 2025 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grKK84Xc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0910E0A6;
 Tue, 28 Oct 2025 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761638995; x=1793174995;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yflT/EMQbmye9+CFHy/eYRuZc4ngEM2zw2f+ITJGHP0=;
 b=grKK84Xcnpq922JIidRK18uNoJWMSfpGN+C767QUTNnSraoKdZSFZ2ds
 HnCikZbCHmMoiH2xKC1ZY6AKm6dTNQVF3z1i7sr7gS1Udl2xTyNT61ZFP
 7ZL2jH4TXfBhpMow/Vz/Iyp7WsrB+rpcBpp92udaXhMOC4p8VMlsULKcz
 UKTHtP4vq+OhFZIUjiLiWajtDO0y5KS3M0UR86KZzJU35EJD70cki7S02
 DvpmXQ3zp0FZ8nbvzQhXikmQk/zDwWMbVr3KfXSgCmHYPZY3nRl2gRjNO
 yeHXiqlk7e7jfGHRu58CT97VOezDdAATHMXBSq56pKBA6MJdAgN4zwrmg Q==;
X-CSE-ConnectionGUID: qODUMNVrSiuEW4zM42ZgHw==
X-CSE-MsgGUID: e9xvYTDhTgaQhmKj4pZ/2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67375100"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67375100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:09:55 -0700
X-CSE-ConnectionGUID: YiDF5oNjSASYxZ+2+ZQv8g==
X-CSE-MsgGUID: LEJYehdQSsyONTI2F9qDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184456665"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:09:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:09:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:09:53 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq2Gs49+v0n1bGbe/gK9UQYdzBaWPaCrEGkmeEgo/EwWktlsIjx4fBIx+kSjG1HUUf+KGNLIt8CjgSZ9n4q2meAim3YNJBYHNuJaIh+mjmr3nepSrBfTCPvV/hqv9Q5owAQ01RDaD7dUmCuivPP0ypEAAED+/GiIM4h7nTsHiClIW2iZ7gZZrWFTA8rmNHXJNUY+GCLH7FB62Fw+0+7vHyBhHmZT9LRKoK5UfSQFJPL9fByCKRLZeat44VnVUvsISRJnc+7bd4TFgeAyp/u8sAG3+dy48BzMojqK5TbLA5Gv4YHsGhC/wWof1bsr7pB7Q7VJbZxN/Ds3fyQKsnsSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4P4RACY8bnbOB0CMjSoJcBY2vqeLSq2GP6XnzPBSXg=;
 b=iVp9Cd5DmlQwRrJGZ1F5TM3AdCvVBqtROWLigY7RClVSbUnKdBCPYrXiwV1r3f4gFbnZNuqHlNpsT43OaryOf3IQ2Zgc2uJI0Y5SOTMAEkBEHf7UL3wDkfse/KqcZqPYi3DRB7/wRy2fYcc3R0lT1LyO1dAvTLbPZBm95u2oJa1oeYPxNJFnURrZdI3Mtu97zUxkXaeS130Tps/sjX7Iihj/jgRchZQdd+jrLfBebpFk0NdLN/68udcW0snbGvjUw29M5YIuX8jY9c39uJ6XRFj5y93kq3I2vdz3IINuV6i2UI/dFvwU5rMiRZEiBbS/nHFWjjAnvp4hhg2FjMHTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM3PR11MB8681.namprd11.prod.outlook.com
 (2603:10b6:0:49::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 08:09:51 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:09:51 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 12/24] drm/i915/color: Add framework to program CSC
Thread-Topic: [v5 12/24] drm/i915/color: Add framework to program CSC
Thread-Index: AQHb6zD3hlSVzdqpU0+RorebNVCgNbTX7K2g
Date: Tue, 28 Oct 2025 08:09:51 +0000
Message-ID: <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-13-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-13-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM3PR11MB8681:EE_
x-ms-office365-filtering-correlation-id: 786a6f84-c49d-442e-6d4c-08de15f95efd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CLfokffIZAQ9uwn1N1sO9EhzmTAOxgoYgyw7462ZC9kYh5KPyh4cXBhWRrYu?=
 =?us-ascii?Q?76uRmx5tNm9BT2SKa3kwjz+U0etfPcHEbMzUHy5+CwVpIAk5Yx/nm312yRqr?=
 =?us-ascii?Q?ETvi2rBlf10nPuDfo2+hBoo86mcZNqZzY9YrEKsuwHyL31Q2p1KMS2vHXq76?=
 =?us-ascii?Q?R7kr9hVi5w4R+rr3cUyJz3W7uk2ecOD7FQx3m/M0ypeLczbZ3CL8r8B4Yzth?=
 =?us-ascii?Q?uo3HL0/GhrDDTX1q80HsTKczgw0LBXM6b9YBibbliKDHoTKKqsGMWAtriq2I?=
 =?us-ascii?Q?+ipNQaHl7xud+Gfnxzcw6GYk+wDSPswCBRt/RZ4HNgGfH26MKbIiHQG6mgEd?=
 =?us-ascii?Q?OF+JWHlMHozH9U0YoUW8FJu9g+o7yEGa5cN4Kl/M4zHWifTp+x5uUxldz4UI?=
 =?us-ascii?Q?fboB7yvLyIyMHGMY5uEnQdXjV3mlsSqrjbaIKiSL7nmRFzkLg1AHGVf55b+w?=
 =?us-ascii?Q?S9/DP/inqvnEkOEZJrsTTse3h4ECdQ4a5S+7DR1GD00JuoXS5duG0M5OnAlS?=
 =?us-ascii?Q?0ldE6cqNbmvMq1ny2IoufCYflHVjWwS8yNTL8aQGWAKRcpfA2SUxZH71CAJl?=
 =?us-ascii?Q?FNe/PqWu3jnZO7hQRGglGdsgTvSvZNSUK2vjwCGdjzw3tJPrkC9AeAA35BDP?=
 =?us-ascii?Q?F1Nc2N9NFW6KoINYjCRYC3hyZULUsVTNN1zxRD1S+EAsYRaaY1It/uP9C2nx?=
 =?us-ascii?Q?Auo58PuoVmr5GybjSUn2VndQehIUyh+0Cpha+MD7L8UtZ1PLmFLaMrng2RXV?=
 =?us-ascii?Q?EbG7xT2cf5oFgqBgtCPpY3HYx4J/Kz1bm1TsywQAo51+4gxwUEJgiwu80gVJ?=
 =?us-ascii?Q?pJgNRRSLfPE1wjk8sx16XLjuaGxh9mq96y/bX9r45IKWH5mr80njG80FUh1t?=
 =?us-ascii?Q?g7zrifCWdsDGE2MSmo2gHJXa+To5jkUajWUt1RxHAzcCdWWeWXJfc8Zd6HfL?=
 =?us-ascii?Q?+ChpnVYPHQdWGVXyhsYEOaZsvZtaUHgwW48l1aluqVJlmNvJDEDcp6WgyMrw?=
 =?us-ascii?Q?MR4cv8N6yZwHy0LIkpB92ZEG3szWbC203JB92y6HJJbh1U04koBlQY8vdodE?=
 =?us-ascii?Q?72XAXk6OmFxfkw9zMbOTyYT18cjJt6Db/0pY8vJSTPe9BFTPAeQNqlk7L0wZ?=
 =?us-ascii?Q?7vNLj/iKAU9xolUPw5GAzk+LahGfGMThlqbC9pwNYAjVK1Mknhj1Ajx52JOz?=
 =?us-ascii?Q?L/zhQrKquMFrpebxuplh78cTJYkaH3KBV0Ig+lh4nMB2V8nyLFrOoynbB/ZJ?=
 =?us-ascii?Q?f80mEIY8XpLG5kHKPj0jclRVcm0cxkIVEK55CsPBpWEm1MTqh7W1+yfTEa7d?=
 =?us-ascii?Q?Nss4crd5kOKU6iEWB1Fi86YUkvlGRklqEFR6srb0CJEsUr3FOiQjzHmHyyEM?=
 =?us-ascii?Q?+TtAtR309IOD4X5hoLQ5cjOWEyZ4q0p20t4g40CxCQSo5HtFr3+Vp557AlLc?=
 =?us-ascii?Q?3mXClltbMK4tr+8EcGFgxZSmaXYr+hgUlYmb1ZQ6+XSv/jshZitt9MFUZCCO?=
 =?us-ascii?Q?HJc1PtKhlRe57H9b35PRu9smn4Y9zkOLLbzn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3LLiMBuR9U387+4AGkzl5NFNTYYZB/YsP9eJ5bwhBg+hy9Gb+aGW3QPAW2D9?=
 =?us-ascii?Q?g5H1pqjs5imD0/V0Un9hWNhl3/AjuP7rGxPU2sVe9eWji4d62gkc8O89TsPY?=
 =?us-ascii?Q?xGKNrwEHSwGXyUUsPLN6Qv+Y7xqRrTnMUX520O1y9/jlJFL/GN/M5/7LgDUN?=
 =?us-ascii?Q?fO4sjVoPZxNQX4umLwMgr90jmvvdwj9fXuTEVp2i1x+ZREV4p5sxyHnQtjf5?=
 =?us-ascii?Q?mGQUgkofsP1dfMPqephSS8gwHuuNs/vbC1y+axRkmCVyP+YU6K14DLZx5+Ty?=
 =?us-ascii?Q?mO709IQHoqeGhLHGCbaeQFiuF/Qqexq0eB8mxPdFOq7+AqXO3zUNOxjKoFzT?=
 =?us-ascii?Q?lfglBT5XRmfCmFP+EuCkD6trLH8Lh3ATigySQuemGyL2Kzxw5HT4/gvIkfrI?=
 =?us-ascii?Q?6k5ffcgUimNtr+AToZBSVB5ZMekglU0jdfh7K2SzpO1INTWmWo82NCteRAg2?=
 =?us-ascii?Q?PWoeZA+3kgR8IILMMVL4q12isyAILRrauCFBqFoOJ+YX1wd7LtaRU4TR3Qlv?=
 =?us-ascii?Q?pMvagah40y3idWnRG2zmVG2t0SmlL9KO9rD342NoDPpgd3nSxw3tECkCRtA4?=
 =?us-ascii?Q?s3Iwv2mdFrRDY7UjopXLlptBX2LWwmXA9xB31lk+ezVBHkJIP9fQ7voO3gSd?=
 =?us-ascii?Q?r/zE1k3Y/Rpi0KhBXx7/M0RtDfeBwfqOxSykJhIuyUVAzLRaYst2wWHhlWhh?=
 =?us-ascii?Q?1ZAn2tAhm8fNET/HThdP6eV4qlM/fll4te0LfFYexmQrXPVrjxLNrT9++yGF?=
 =?us-ascii?Q?EUQknFhl+/UO2JxUUrYnz5YLq37MDqPj7Ws/++lPz1tvbIM3ODmdIofeDuoY?=
 =?us-ascii?Q?SxYXjEmQNWy34le/Vmx2YUAJvFsM0T+B6sPte9sqTjVIDjevJf0NWmvSRY6/?=
 =?us-ascii?Q?hLcNd/nOqRMdG26s8gDcCO6LWcH7Z+YgMYSNUt3nH8qZAyxT3cw7q5NoZNLu?=
 =?us-ascii?Q?AgkKnMrpWXMZcOF5Z7r1+c0Ukd1pnx+uP8anm7+aOFehKXsvIi9AisKCBkC1?=
 =?us-ascii?Q?juPvKLmcjT/PAeifxzc7B/dao9qZzRG4U0Lfmw/U4ma9c2ktgEVaubVefCR8?=
 =?us-ascii?Q?O0mPaO/cc4HF6kEgjdgrycocCbZENOOwrxGuMww/+2/doV/FT2FBqJr6sr2d?=
 =?us-ascii?Q?8nNI2pgweBd8MEzIHuhRvYn0UdCZ0jc8VJGDX5Kvm4sOoSrEp0FXSyoXxQBw?=
 =?us-ascii?Q?04sOQwirIo3y1Fwo40yZpIDCag/2Kn2MYXkzfLURQ5ml0G44DfUEO8WVuqkd?=
 =?us-ascii?Q?5ciX1I3O82mF0kenSd0uZ3KWpQcpG6IpE44W9Bu1q6UpvKxhWdp99a1IXViP?=
 =?us-ascii?Q?yFpGYodYzi2j/4RUIQf+N2Cj306UUeXl/U/iBLNK0DJrRBSSl7pKOkqG5qv2?=
 =?us-ascii?Q?hXs9O8dsZBPiH1yRgoksL1XbD2VlrK4y9Q97mRe5ziuqSu2tmEgqVWVBo14u?=
 =?us-ascii?Q?PKDySkmBMmRQqJad31JKCAJnmaX8i2tI0MR0JzTU9KHJo+iU5v/uqNU+yVso?=
 =?us-ascii?Q?Wq2D44Iz0F9YM3AALUpBpLcl8hWXiWF2fOaFQ0TdtQCJYCYEiUC3E/ZR1HhB?=
 =?us-ascii?Q?ljt1U6e1wxWUivtCpGDE4uC0QlS/CZrtbk70PT2C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786a6f84-c49d-442e-6d4c-08de15f95efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:09:51.7337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6sicQTSJlblrtq5HWq7/tU3mBLile1xSqGMqm8XJ4Ac78CZ22lh9I5VU3wYYv5TOa4nuMIBcKdFTbOhMhVVew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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

> Subject: [v5 12/24] drm/i915/color: Add framework to program CSC
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add framework to program CSC. It enables copying of matrix from uapi to i=
ntel
> plane state. Also adding helper functions which will eventually program v=
alues
> to hardware.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 14 +++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_plane.c    | 39 +++++++++++++++++++
>  4 files changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 363c9590c5c1..7c53572f729b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3967,6 +3967,20 @@ static const struct intel_color_funcs
> ilk_color_funcs =3D {  };
>=20
>  /* TODO: Move to another file */
> +static void
> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state)
> {
> +	/* CTM programming */

Add TODO

> +}
> +
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state) {
> +	if (plane_state->hw.ctm)
> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
> +
>  struct intel_plane_colorop *intel_colorop_alloc(void)  {
>  	struct intel_plane_colorop *colorop;
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index c2561b86bb26..420d596dbbae 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
> intel_display;  struct intel_dsb;
> +struct intel_plane_state;
>  struct drm_property_blob;
>  struct drm_plane;
>  struct drm_prop_enum_list;
> @@ -49,5 +50,6 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
> struct intel_plane_colorop *intel_plane_colorop_create(enum
> intel_color_block id);  int intel_plane_tf_pipeline_init(struct drm_plane
> *plane, struct drm_prop_enum_list *list);  int intel_plane_color_init(str=
uct
> drm_plane *plane);
> -
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state);
>  #endif /* __INTEL_COLOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 4b5124a08cc9..c709df0cea9e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -634,6 +634,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> +		struct drm_property_blob *ctm;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index 36fb07471deb..cc8f3e15c82e 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -380,6 +380,43 @@ intel_plane_copy_uapi_plane_damage(struct
> intel_plane_state *new_plane_state,
>  		*damage =3D drm_plane_state_src(&new_uapi_plane_state-
> >uapi);
>  }
>=20
> +static void
> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
> +				 struct intel_plane_colorop *intel_colorop,
> +				 struct drm_property_blob *blob)
> +{
> +	if (intel_colorop->id =3D=3D CB_PLANE_CSC)
> +		drm_property_replace_blob(&plane_state->hw.ctm, blob); }
> +
> +static void
> +intel_plane_copy_uapi_to_hw_state_color(struct intel_plane_state

This should be intel_plane_color_copy_uapi_to_hw_state

> *plane_state,
> +					const struct intel_plane_state
> *from_plane_state,
> +					struct intel_crtc *crtc)
> +{
> +	struct drm_colorop *iter_colorop, *colorop;
> +	struct drm_colorop_state *new_colorop_state;
> +	struct drm_atomic_state *state =3D plane_state->uapi.state;
> +	struct intel_plane_colorop *intel_colorop;
> +	struct drm_property_blob *blob;
> +	int i =3D 0;
> +
> +	iter_colorop =3D plane_state->uapi.color_pipeline;
> +
> +	while (iter_colorop) {
> +		for_each_new_colorop_in_state(state, colorop,
> new_colorop_state, i) {
> +			if (new_colorop_state->colorop =3D=3D iter_colorop) {
> +				blob =3D new_colorop_state->bypass ? NULL :
> new_colorop_state->data;
> +				intel_colorop =3D
> to_intel_plane_colorop(colorop);
> +
> 	intel_plane_colorop_replace_blob(plane_state,
> +
> intel_colorop,
> +								 blob);

A break here why keep iterating if you have found what you are looking for
I think I am seeing more and more reason to have a separate file as Jani ha=
d said
Called intel_plane_color.c

Regards,
Suraj Kandpal
> +			}
> +		}
> +		iter_colorop =3D iter_colorop->next;
> +	}
> +}
> +
>  void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
> *plane_state,
>  				       const struct intel_plane_state
> *from_plane_state,
>  				       struct intel_crtc *crtc)
> @@ -408,6 +445,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
> intel_plane_state *plane_state,
>=20
>  	plane_state->uapi.src =3D drm_plane_state_src(&from_plane_state-
> >uapi);
>  	plane_state->uapi.dst =3D drm_plane_state_dest(&from_plane_state-
> >uapi);
> +
> +	intel_plane_copy_uapi_to_hw_state_color(plane_state,
> from_plane_state,
> +crtc);
>  }
>=20
>  void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
> --
> 2.42.0

