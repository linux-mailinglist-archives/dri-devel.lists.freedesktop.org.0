Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B4B12B7B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869910E2BD;
	Sat, 26 Jul 2025 16:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeTQteJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7EB10E28C;
 Sat, 26 Jul 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753548093; x=1785084093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HlUQ/E4xseEnVvVIHH94Vspglj0D74w3PqsLd4HJJEk=;
 b=QeTQteJpOr54aq679VUNEgKiR65L2no2HTsUa2D1blsE/gYFg1Ppw+tC
 XYs9v5BpPb2eD74GOq8E2qm6lLoX7otWAWvt11APiWU1RjR63KpSsgThr
 jAanu2l8ISBsp/iFd7dsjURU7evy5Qpg5Wm8KAnKsmkd2YaVoVu49WX+/
 W1TYl0EtXs/iSMNOSnHCskGbZAqoPE/STy6UwVCPjXvxlcS8adWGd0SRK
 lYxf4P+0qc/Z59P+3xS5qvKq2jTAkMnFqMUrZTSGmCnWl//+8R2d9B2S9
 YPpgTFL6jda05Ja3QMmaiKhS4BqXvHT/2Gp8hx59UfyDOPXg3aVbBc4CM Q==;
X-CSE-ConnectionGUID: MvzegUa7RQaIeqTfz6wqAg==
X-CSE-MsgGUID: 1r8EEsrnR2Ssn4lZFFyVhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55067171"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55067171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:41:32 -0700
X-CSE-ConnectionGUID: mI4phBmbSlaqEhqLHQL28w==
X-CSE-MsgGUID: hVMMYReQT4SQs6LPNodQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165867615"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:41:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 09:41:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 09:41:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 26 Jul 2025 09:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2o71x9M31mu0f0Y3wEnuZNLQCVFS5stAqvqSJC20qJ6plj1vq7A0eXtZF44cfFeRsu49NaPT/OKF/SXn4sHrOv6QaPmAb9Tmf/5MXOpqcHv/TlRJlpOiE97I6WuGtY0/rnX4l/ocrGSaSjoP6M/FrQLeXsm/Tejdnhg6Il2s15/gIIcpXf45J3AKrPgWmam+GEHlNlrzrzyFvsMpPN0yOja48cEmoIpDEp+j59Mh2WjvNI9iFLXD34llglPYgqANvidFNLbf8Ov5NwruT6pRHPa7uIMiQCqOggLDFbsiem8oLeBlArehFauC821PmJCWhrrIRKRShGs3+fKnzDwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBIwnvdTxmwJPwGieOeQa7iKcTzKtzoEA5pQdXyiLUA=;
 b=eCX1tcUvKIBzE46JCxT8RrDnWwyTM7fKwnZ2CyCfVz/vAp1/D/Mz+Cc6mm2pTkeYsYFFALzWScQfDxp9LoSV5fuiJv5pGPFklIYj/9hRwqvMrm2+N4textEZ9yYJUasaEXiYlAdMqHB7VpqRLoSN5cmoaHzBUu1jlaCWY3kvHjwaXQz+8cPGel8j6P1Ywgk8xx6+tAdV2UBfWnRgQxM1WZ++bx8ncDRZUOyRppCA1AdMLDzE3tSkjXTaaOp7HbUUNDhkdb3BlRgiw+XS93D0C/LQMozmp/K1e9fsPHtro1WljQspG4smhniOASk7KNeXTUeReIh//FJnPo1OUK8nFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW3PR11MB4556.namprd11.prod.outlook.com
 (2603:10b6:303:5b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Sat, 26 Jul
 2025 16:41:29 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 16:41:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 01/28] drm/writeback: Add function that takes preallocated
 connector
Thread-Topic: [PATCH 01/28] drm/writeback: Add function that takes
 preallocated connector
Thread-Index: AQHb/SGYtL728s1ZVUOjuiaVyaINHbREU84AgABI7dA=
Date: Sat, 26 Jul 2025 16:41:29 +0000
Message-ID: <DM3PPF208195D8DB4B4B18D41EAB4FC3CBAE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-2-suraj.kandpal@intel.com>
 <tglzdolw5nxc7tbscpfjcvx5jiydbghvouws7fl7xqryh7q5c4@klo5yncolqah>
In-Reply-To: <tglzdolw5nxc7tbscpfjcvx5jiydbghvouws7fl7xqryh7q5c4@klo5yncolqah>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW3PR11MB4556:EE_
x-ms-office365-filtering-correlation-id: 8afe8c98-8057-4622-dce1-08ddcc63454b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kPME5fVoQd5L/cTlLGAZMP5Rqfd2r2mm4fdhr+y1Sxfl+L/z3ktztsdL++z6?=
 =?us-ascii?Q?WP+UVnCzw+UF9A8YlE/RrERrqRV+r5AmfTtPwecFcc3wc/LHMwRaHpbCoepj?=
 =?us-ascii?Q?RzGvrR8eggmvL7C77opCbzWmGzM6/LMsWnPAzmUx4cGY36NX6qZkGMmZpe1s?=
 =?us-ascii?Q?i/rVuuwAIf+IlziDn3vi+40i0heOg9ilonmpWrujLUiF3Bz1ImMmCK15nodj?=
 =?us-ascii?Q?WNOCATlqYMVmOOQ/rnO2IXtCFY9Bff+yYizFp8blPlPGcmmkt0kISA8YizA8?=
 =?us-ascii?Q?NFIB+Ic0sM8hL7731mIHJV/vm/q57PXud9T4aOdyKH2Ruscboq80lnSfUtGo?=
 =?us-ascii?Q?SRWsDHh1aERKlhOii1g/0T+VMOnmX10CqEp+JfvpPRs+q41tTcjgYRDixMRi?=
 =?us-ascii?Q?i09xaeAF2sSE95lDPy7Ir6j/ivfkCTKp/Fnq1+r99zDeuhE1wLAMUYpo264S?=
 =?us-ascii?Q?1Zj1V2PrEf1WOf5/nNlgLpzYr2us/mPk6cG9KEcJ01z95D4c7k4DiXhpTi/N?=
 =?us-ascii?Q?kVC2kwdlX4ACHNyyO7D1jQ4ympNQJpJaHLjQcZE8IG0UKPWGyyx4GltgCRQK?=
 =?us-ascii?Q?nMZcxhaF+wLvv1XA3oQa8wX0qUu2OahH2cwfVaGMBn0tQ9DUj8MDhhC6kyMx?=
 =?us-ascii?Q?ZqzIcZRKRQUZONBO06RyPBVdt/VamnPFi+/7ieGd8kz4QEbZq6dULoSCKNB5?=
 =?us-ascii?Q?qN0rHSbkKkgrL6ORwU9xmLpLL3S1B76dDlI+uGiZrnRpn/EvV3ygP4heDi99?=
 =?us-ascii?Q?uCy05WrQ4oH2r97b6FVk3TfNlIZWe7muuekT8s1rjZc2uLkrGW1UmRPa7SZm?=
 =?us-ascii?Q?wNxfpUITbDFo+9ZMGCo2NFmuMp72gEAccOD8yie3TQVU+JCSH2bJOEIemLEy?=
 =?us-ascii?Q?oEmsgWlMgy26zH72RbxjnZi/SGb4avrO7qSKPSlGWW8+v8Esl6qajirml0jK?=
 =?us-ascii?Q?UGLtX7deaKPv9THwCOHZtI6pMQxd+uYG81YU4PPp+lo1k+AC13ZvcscCDND6?=
 =?us-ascii?Q?hUcKR6D44E0othaG0RtT4g/B6WDeEoX9xjv96OAL0u5BmbgqF6h04cbR1ObE?=
 =?us-ascii?Q?MLtyK8pQIm0RIG9Td7xwGmQd3QILL34bVx4UpMZIXf42y2kdLxchvJIwGMya?=
 =?us-ascii?Q?xgjwHdG9oa541SP+bBqVtuIiFzOcRBvhA3VX2+Z8hYyOgXD3fBwEvsczGsbF?=
 =?us-ascii?Q?ZL8qXbqwoJDc+DrCqsCGb9LmrMjyHlpnSifqbExDiY2kyIDV2cJEGl6zK6/u?=
 =?us-ascii?Q?JxBXCikDiT/1F5FhmpB+8U+rwcSgtDetndH6SsRlNzTr72JNOHolJZZKrp1a?=
 =?us-ascii?Q?k6WqTLqL8HT2h5QRJuHPtADK4DEgkPFeaK5Ybj3Elb0C1kJnZiTACtcpw9N1?=
 =?us-ascii?Q?O7Ys8uX/ehNaUUQYrMwVD1i2baYsI+aV6wpKrq4SLLjqXMu/7QRyT1k6xrBN?=
 =?us-ascii?Q?6SuTD3rDn6dTDX9AZP+nAklxGPpeHuSQcCfjFNjnETO57DeBLCwUKA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?64UDsHe82IIPsIgaKq/vbT8S2h7Q0l27PzkgEwzFl429/RbbcD9RqlvsBqK1?=
 =?us-ascii?Q?wx1bkY6G3JmwtynIPIVGgAJwWXdKFdSf9ZPGoD00V3zlvDBfhspEKvOQsOla?=
 =?us-ascii?Q?0HB/f/5Yv8GPwWDw0PRDcHj1dQzx4TImYF06GjlylcXY7Mnuklhnr5io2/10?=
 =?us-ascii?Q?47SK4rXOoNNR05cTmG1B4XKDinD9J4Jx8g/Zd96hORhpif4T/XpMCd2IQdlD?=
 =?us-ascii?Q?mXSdIWqDNS3ZgJy7Wwe2ZYKab9Cx9J5DQ237sWQas13CCJnaWvBKxYFKHY46?=
 =?us-ascii?Q?kjV4ZbltzAWF9aSmGDA7RtvYrQvAkOZ+RwYSSENGNlkcrPnxhVvL/GVZ/Olr?=
 =?us-ascii?Q?WCkdRZxXdw+DYwkvnxcYW3RCXpU1zGO8x1mhm248a1xiy76/LURFYW+f0u4I?=
 =?us-ascii?Q?d9azc8Kh0S8xywpwhCUnILJsqCYokrc3YkQdndshe/nAnx40f6oYnBGC25Qf?=
 =?us-ascii?Q?4z/aSGCmC0UJAZcAS13lWmb5RpFD5NJDT/s/l0CylfZfbDWKRhWwcVEuy2ac?=
 =?us-ascii?Q?xFeVOCE3DyRTYC5tyvooy/8e6oYGr9to17+edKYcnSD4rrCD1ZI5wHIhd+hc?=
 =?us-ascii?Q?ruZ5sNYxUsrL/URLHaaeflY8tv1R7xpZsILHeNJWAFXq2JUkNPLaSwDsnclu?=
 =?us-ascii?Q?8c/uucS9/yNPGr8G6tzp2TnYbuhXknPRMfTd0ZJCYLRinnLgag6U88QokkBE?=
 =?us-ascii?Q?Mobxs1+/JqKsYR6xvBFpI1IvnJKQIhu4xD3bOhXzwfsSFCgzKWXbuGwT/r+V?=
 =?us-ascii?Q?J6r24odnuf3ByIv+7QP9av8fxYURZkvJyZg8Cx0s48eDAtFnTrpNjuZ04mRG?=
 =?us-ascii?Q?bsTysPg8kpcwvqQL+ZylChlqnpVcaFp+yRdy7u/pztqkxH3wABiLeiwe57q3?=
 =?us-ascii?Q?kjM6LkT80DkuQGV7EGACoKQ/roILxZDgKoBDQp7eSYrLpbusdv5EVX5PJgsf?=
 =?us-ascii?Q?OTM6J8qvcmhTIbjjxqbe+76zZ8qW/pFhAAQ8tHltsI2val25XXgzGdKlxEoK?=
 =?us-ascii?Q?py8eCkZrpawVmq7r76M7HQX01s0VQcs92LvwL5Jxk7SL/p12l1Dl1+a1GSP2?=
 =?us-ascii?Q?ghirV/FJR8O3D+0iB5xJ0l8+bM1GL7OtsZj16lpjPXsiL+Qc2kt7jy49nFOG?=
 =?us-ascii?Q?PiKpOcFXa0btHFR8fpnrNNF6jSnZc5dXIkgT8fpv7Lc+nzXrJjmUWmgzvfzw?=
 =?us-ascii?Q?fzYCKuo4/jQwnKDPIcSTr2XJbdRuEvEz8KWQKD6Ec9RIUJpavdPyZH6zcOVM?=
 =?us-ascii?Q?7gVz0kVwoxmlXmGQbbNAMPe0rsmENZwJ6E4x6u8pel3I/4gON/FoN6Vpgb9s?=
 =?us-ascii?Q?fYCZ6hMqMTPPgFodL0EcU86T6/XJYXyI/fLE7y/XI2ag7bkChzmL124Do9GG?=
 =?us-ascii?Q?8W/Olz42d908dhbduHj1qusK8ZQl4XZeEVyGM2TcORZLCQSeU+WbF9N8Cv1y?=
 =?us-ascii?Q?JsueIpvCDDZV7Q1zl69NiK2RzKneINE9eRpCht3cAeS+7ElxaOsrX/lNpCd8?=
 =?us-ascii?Q?VcHC7JpFlC1IpupHs+YVRF3SO6YL5Q9mudoryp7EpcQDz728MZMJNf918YnH?=
 =?us-ascii?Q?6Z0b86JfS5YiqsZLNIC9bK+C9e93L9xpAhN21bu1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afe8c98-8057-4622-dce1-08ddcc63454b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 16:41:29.2565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8p+dyNW8YLUZPiFQy8wGQorg4TabcE6smwLMMbCVG+y6X/wNpoICLxQJqHDnP9D/kTaalh0ZE9Bzzbhs+5oERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Saturday, July 26, 2025 5:46 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes
> preallocated connector
>=20
> On Fri, Jul 25, 2025 at 10:33:42AM +0530, Suraj Kandpal wrote:
> > Write a function that takes a preallocated drm_connector instead of
> > using the one allocated inside the drm writeback connector init
> > function.
>=20
> Please start your commit message with describing the problem.
>=20
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 76
> +++++++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     |  7 +++
> >  2 files changed, 83 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_writeback.c
> > b/drivers/gpu/drm/drm_writeback.c index 95b8a2e4bda6..fa58eb0dc7bf
> > 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -416,6 +416,82 @@ int drmm_writeback_connector_init(struct
> > drm_device *dev,  }  EXPORT_SYMBOL(drmm_writeback_connector_init);
> >
> > +/*
> > + * drm_writeback_connector_init_with_conn - Initialize a writeback
> > +connector with
> > + * custom encoder and connector
> > + *
> > + * @enc: handle to the already initialized drm encoder
> > + * @con_funcs: Connector funcs vtable
> > + * @formats: Array of supported pixel formats for the writeback
> > +engine
> > + * @n_formats: Length of the formats array
> > + *
> > + * This function assumes that the drm_writeback_connector's encoder
> > +has already been
> > + * created and initialized before invoking this function.
> > + *
> > + * In addition, this function also assumes that callers of this API
> > +will manage
> > + * assigning the encoder helper functions, possible_crtcs and any
> > +other encoder
> > + * specific operation.
>=20
> Why?

The problem would that not every want can have a drm_connector embedded ins=
ide the drm_writeback_connector
We have a restraint where all connectors need to be a intel connector and s=
ince the we are not allowed to make connector=20
Inside the drm_connector into a pointer this gives a good alternative.

>=20
> > + *
> > + * Drivers should always use this function instead of
> > +drm_connector_init() to
> > + * set up writeback connectors if they want to manage themselves the
> > +lifetime of the
> > + * associated encoder.
> > + *
> > + * Returns: 0 on success, or a negative error code  */ int
> > +drm_writeback_connector_init_with_conn(struct drm_device *dev, struct
> drm_connector *connector,
> > +				       struct drm_writeback_connector
> *wb_connector,
> > +				       struct drm_encoder *enc,
> > +				       const struct drm_connector_funcs
> *con_funcs,
> > +				       const u32 *formats, int n_formats) {
> > +	struct drm_property_blob *blob;
> > +	struct drm_mode_config *config =3D &dev->mode_config;
> > +	int ret =3D create_writeback_properties(dev);
> > +
> > +	if (ret !=3D 0)
> > +		return ret;
> > +
> > +	blob =3D drm_property_create_blob(dev, n_formats * sizeof(*formats),
> > +					formats);
> > +	if (IS_ERR(blob))
> > +		return PTR_ERR(blob);
> > +
> > +	connector->interlace_allowed =3D 0;
>=20
> This function contans a lot of copy-paste from
> __drm_writeback_connector_init(), which is obviously a no-go.

The whole point is the minore difference inbetween then and how it derives =
a lot of things from the
drm_writeback_connector because of which this looks like a similar function=
 but is essentially different.

Regards,
Suraj Kandpal

>=20
> > +
> > +	ret =3D drm_connector_init(dev, connector, con_funcs,
> > +				 DRM_MODE_CONNECTOR_WRITEBACK);
> > +	if (ret)
> > +		goto connector_fail;
> > +
> > +	INIT_LIST_HEAD(&wb_connector->job_queue);
> > +	spin_lock_init(&wb_connector->job_lock);
> > +
> > +	wb_connector->fence_context =3D dma_fence_context_alloc(1);
> > +	spin_lock_init(&wb_connector->fence_lock);
> > +	snprintf(wb_connector->timeline_name,
> > +		 sizeof(wb_connector->timeline_name),
> > +		 "CONNECTOR:%d-%s", connector->base.id, connector-
> >name);
> > +
> > +	drm_object_attach_property(&connector->base,
> > +				   config->writeback_out_fence_ptr_property,
> 0);
> > +
> > +	drm_object_attach_property(&connector->base,
> > +				   config->writeback_fb_id_property, 0);
> > +
> > +	drm_object_attach_property(&connector->base,
> > +				   config->writeback_pixel_formats_property,
> > +				   blob->base.id);
> > +	wb_connector->pixel_formats_blob_ptr =3D blob;
> > +
> > +	return 0;
> > +
> > +connector_fail:
> > +	drm_property_blob_put(blob);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_writeback_connector_init_with_conn);
> > +
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> >  			 struct drm_framebuffer *fb)
> >  {
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index c380a7b8f55a..149744dbeef0 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -167,6 +167,13 @@ int drmm_writeback_connector_init(struct
> drm_device *dev,
> >  				  struct drm_encoder *enc,
> >  				  const u32 *formats, int n_formats);
> >
> > +int
> > +drm_writeback_connector_init_with_conn(struct drm_device *dev, struct
> drm_connector *connector,
> > +				       struct drm_writeback_connector
> *wb_connector,
> > +				       struct drm_encoder *enc,
> > +				       const struct drm_connector_funcs
> *con_funcs,
> > +				       const u32 *formats, int n_formats);
> > +
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> >  			 struct drm_framebuffer *fb);
> >
> > --
> > 2.34.1
> >
>=20
> --
> With best wishes
> Dmitry
