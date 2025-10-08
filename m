Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0EBC38CC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B628B8908B;
	Wed,  8 Oct 2025 07:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceJIVwes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F510E765;
 Wed,  8 Oct 2025 07:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759908128; x=1791444128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFo1xWc43lnqVyUu1/sTK/TEMOQ0zJCL+cYyne2uM/Q=;
 b=ceJIVwesim3qohETX4iRYeMAUN9zQKTDPOI1mge0cEh72ldxRg6Znja9
 JBJ3oOTmhrEwUR5Jq6OnXZ6dbdI9L9Jt1ST+Mr2PBEzKr/NpPxYibaLb8
 qpvnLbRcSNItRreOCDJHtSEauwqUsKoS3YqJpGY01Z+ay+Jmj59+QDmCM
 edc3Ff4WUi0+iXkCY/LkyxZNPtJ27bJ4drK2VmT+7awSB1g+TDw3btBM8
 bAUglOA+wVJgIeFG97HFZs/IMDM6GQOoVe1UdtDX4Sduh8fcb/deSF7vD
 E3wO/NVr64wl5F8M6aeUdlmxAAb+BS3ng8OHZAF1KvIwy4XcwsFr4Yvk4 w==;
X-CSE-ConnectionGUID: nNrhFSBiTUGSM7OMDDKmew==
X-CSE-MsgGUID: 1L+vFZ04S82QXgutVsw3Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62011367"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62011367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 00:22:08 -0700
X-CSE-ConnectionGUID: Obij4yTNSoK4UYclQO3mKQ==
X-CSE-MsgGUID: l4XeQbK8QfW6ve+sfBWyWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="211014938"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 00:22:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 00:22:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 00:22:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 00:22:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgAuiYRLvv9Ey7Za/rp7ybAToGlKZZuJUJz/99cb7nJleQI5jLJZDX1mrhCe+SizLSh52gYVA5j+xa/jFzXpf30opnZFOjblekro5osr7qwjXCTmcEKPsIIh3zfVjQvhwwaBTmBKc5FchfGbyKzIhVIsuUNv3r6tw1AhXdWmc5rqk2PvD9QOXvZUGI3rXEhYUn4ZJQ0LSFp47JO46HMM1feI0Iv13fb9Dd1K0g9n60l6B154TocZuqH+PDdwkI8zNHikWC6UY+RvLLd0CC+AV/Q81kB9sgnA8R3I9ST+gWZtSB1V/1HNdKUmwHUSXvy8fUZT1ipQhEbIdqhot4XC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5G0r15fIbMkPinjesdOVd6xEN++0jy7BBcss+mCAgw=;
 b=UGZiOPGNbBvuhlRAjIso5vE7UOlT/yhFmp/Laq74yk0BYUXkTimuQR+xO12Sxm3Zwuf0SzjJ3nyXLQ+tgt5k7yQ4YmEd1x/74NcHFVxZ8KjmoSyk4+NvLeEdp2dGpzcLOoFYgFxG0JT/QzahNIwufyt7DKY3GoqeswAxCqfZZqGyfCtUyqzL6ua4yoRmt7ltPkFhdOy+wDYLzrnJmlEIVlaRAGe8CF0ZCfNFdHhh3PbNmqufze3hCmXsKNzc1dq81UN4r+JsIO/STcHl1CqV/L0npDvsX9kTqNXamOgsKtPuAUnxHGWdGETSk6i0M6V8f4oZLc1/6qArZsTQ6GJXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 07:22:01 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 07:22:01 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "G M, Adarsh"
 <adarsh.g.m@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: RE: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Thread-Topic: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Thread-Index: AQHcMp4pPcCC4YbDnUeseZTOpZxVM7SxyGiAgAYZzaA=
Date: Wed, 8 Oct 2025 07:22:00 +0000
Message-ID: <IA1PR11MB6467E47D1D61DE21DCC2B9EAE3E1A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-2-nemesa.garg@intel.com>
 <epzspujsf2o4wq5ykswe7a3hvrb3vy5wgenglfopmkuepyfstm@5kkpxstpyc3r>
In-Reply-To: <epzspujsf2o4wq5ykswe7a3hvrb3vy5wgenglfopmkuepyfstm@5kkpxstpyc3r>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|MN2PR11MB4663:EE_
x-ms-office365-filtering-correlation-id: aa6f98e9-485a-48c5-a75b-08de063b5f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?dAWZVPYUzV8oHTWPpIzSxlHFVa3BHf5m5gkznuguzdJqEuOHFONQTPdpkMZf?=
 =?us-ascii?Q?lQbFiqRLtYs9QS819YwG+FJqBJPMzoYXoV8a6daXZVf4VSE/sonu6J7mf0O6?=
 =?us-ascii?Q?EvnW31vf7rcozxW+s6sAmpGaQ8ctKw34RgHIv4GuHYW89b/1cIl/9TG7EOAE?=
 =?us-ascii?Q?Oa5o8lf+WGJZc9llQKtJPhVbU7z9gt6oVAEFIX+8EdEuSBuYQhfdyXtCsb+B?=
 =?us-ascii?Q?jpxKwTsj368u4DkvkztyAay7mD9sSteSPs+9hMzwnJKHA1Zexpa23TUezomA?=
 =?us-ascii?Q?e/DKOKtxZEriX4zYUk/yTL6k8+8RqygfZkuLsEXiswaLMDmjtI/nspoK9wIk?=
 =?us-ascii?Q?ifOdQDYDDeyi+N34EySHMHxIFCTgNTmH9Xya2eUehtLeL/hQoWZgcnF+HTeQ?=
 =?us-ascii?Q?xgoLPgMGTA3hdYcOUL/Xlx6GhAvV6dnwaRqd3ykSSTgXXV6I8w68r0wzsfL5?=
 =?us-ascii?Q?WMwpvkFsFSau+wEF7fdLHRUJ/6nOWGJYXxkjsrQsXC/qijwmRAdsPtaYo4Ln?=
 =?us-ascii?Q?yLZUUUdw6KFdcXOVf7wuBUY8XbE4F8NyFIcQYs60eO+s6UpR/QreDgB3SNRy?=
 =?us-ascii?Q?l+88Opay7PXD2BdlnY2ElFGUj7cyROUxhpD1xOjr6nZ3hxb2LXacQ3FI0a07?=
 =?us-ascii?Q?zENhe02Sx5dy7fANK2oT0jChHRy80zCeHNxXpp0RuFzk4x1rcSjv3rHaH0ex?=
 =?us-ascii?Q?V2+8bzUov3ApGn1LZwoL2mq+FcVD6dPmeG2y+IjErSMMHupeB1nmq//BFR+5?=
 =?us-ascii?Q?HrmiTCgZJkXjctViCmSFQjA2R+u50x5Zqgq1tkltUz9HRb0x4afPH3ufnAno?=
 =?us-ascii?Q?Ns3CA9g+SjxcP5XINRdfiioH6+R+bXRJnu8DeMmb78UI7cHDpHLDxoqufclA?=
 =?us-ascii?Q?1LiDWaIu83GPgGToy5xzwRhGPIrWi5FTU/mqHHdPkhfRiObBsBBrUoCumS4O?=
 =?us-ascii?Q?y7Ly4wz+HoXQbWaTb4HEuey9taauSCXD3lMUjcyDK9qzWTG6a5N1uqdEU71i?=
 =?us-ascii?Q?yyqmjUt8ajQORCI0nfRmRzWG0FMsUjSZb29fODkPRI5z4hbcv1Q2K/OVHlGV?=
 =?us-ascii?Q?4Ik3k9I22Jtg7miL0/e2vG2+G0Qv1IpE4eBrmwRgcQWAclE7TRTXfGQOOw+3?=
 =?us-ascii?Q?ArTY/Hdpg34b2K/0eDLPV/fAn5smCQyy74I+eHq/PqQhczxJEjXUTYmkPqIn?=
 =?us-ascii?Q?T8cPFMmR7giPzLHLCXxW19V5SvdYYeENKvVeEjoBeozCVD1/gaD7vR/3EY5o?=
 =?us-ascii?Q?YpZuNtQCv6wUXZPfha38qRIkN5fNRqTKdHovTUERxbHjU42Kgj5mJVoVBb8r?=
 =?us-ascii?Q?o8bCvdCs855Q5qk+ne0dFM5Qm0Lr8DjEArgkGMIFYLl9D9Wm0myGk9TcNq9S?=
 =?us-ascii?Q?gMNsbLtVpKR3zTzb/kfd5hSHKSIWamWCxZlGfTncgELxTEv6Z1lQDY3sBpt7?=
 =?us-ascii?Q?aHDDdn2Gn+H0SNMa7KgyloCJO+o16Oj4S9bZDSI7PVqqwIbXF0/mZLA1tIRK?=
 =?us-ascii?Q?s7Hga4Cpo4eJATdZ0iyrb8UvH5rk8ItUE0cy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qyaQn7Z7ge98u9W1YN1vtmqmjWIMBzClUuvTJ6Noyod1oVsb6slL1JdjSdt6?=
 =?us-ascii?Q?VBdfTDKk+5FTjhkWZrktbD5ieVuTv1mFBAJC/43eS9obfogOxk740PAkNoNl?=
 =?us-ascii?Q?1TCR66a9UBOLw3HXiILsLhPXgJukIzp/RiwKA++K6qUeECB4ZDxjRrUS43uf?=
 =?us-ascii?Q?mqiw2iYH634E5is+nRwB0ny/F1iPWc1/Q5u1VUfZsZDML0mAFnsrDI8xKwit?=
 =?us-ascii?Q?e/3PkR84foFZOSeMO01cobdm9ugfSSwLbXKywXVCziu8DrNIS3XUnQY+dnzF?=
 =?us-ascii?Q?wiBPlj6lFPVLd7LFug+C4gqb7mfZS8JeOWteN8YwY8+79puPnYP8Hy81c7Vo?=
 =?us-ascii?Q?kv9ueHeksFG+Lfv0pV0cwNNF1ONPZiGfIdCF+/CAtkZGWmm3+EaFHQHXaOf2?=
 =?us-ascii?Q?XKZtJok1vNP+vz7RU8hrRVpCeWk3Z92gVc05eNZ51ELmXir6Y4foEFaIcHdk?=
 =?us-ascii?Q?DXuIAsBOI7Y9G60YnKmtTVXtS0orr3CyUvJPNIcDm/tjnKcjlFJgf746ruVE?=
 =?us-ascii?Q?5ve3axr31092jpNj04jVFaCviFPwxDpGh6LglC5BLfswkWxS1goQXFTcDMTw?=
 =?us-ascii?Q?rLi6ptNpKJ/kmH0uIylupsrxnF0FRMOQ2KhptSHOphY2XojAXW0uTCVwz7nb?=
 =?us-ascii?Q?QBxqxVgi6cJ8y77b1aOcx87cVNtsP7DTkdESa6sZj8bHO6k/BWOWDXgF6xD9?=
 =?us-ascii?Q?+t8WN12p1xla+TW1DP8+7dMLGVM1Vgd09TCxvDex5W2SJ2aCLIyfT4IHoQkv?=
 =?us-ascii?Q?ZjvkBLYHyzThnoMceRpIndTM8MTitX4jKV+Ia6/Cl3ypKLfjWXfPmGLjmdK6?=
 =?us-ascii?Q?jttmskJ+55+lik6XyJ1U0YbohQVQLZU5E4gzdZOyRaYCZ5uhnGE2x5vb2mdM?=
 =?us-ascii?Q?dCFWVAwIQJ79q7z+qmtTq6Wg9qmAnoRMTcDExzc51PmAAXN+nY1VUPzI3vGP?=
 =?us-ascii?Q?rZRMCao7GLyzBee6TV37GYw6fla8SiIMRIWcGlwt0/8W+LJL2/tqpeCvddl6?=
 =?us-ascii?Q?uMquQ2Sr5aE9BPm/FqHqcphG9l5eD0Elknp/a0kxqCkQ5vwBiqLv0UQyAJ/p?=
 =?us-ascii?Q?SyjEpbhd+QB1aFxkve77+e3UCWkg3Mz3bS7IJoDPytMYt2pKeLoW0KiBmERg?=
 =?us-ascii?Q?hMbCfl77EUU6iWhzyrcqfQv4OgKsTMZlZJd5Yxn5weT5fwCjIVv6gNlUWyho?=
 =?us-ascii?Q?G1cMc+QSXv0T6hk3FMhQ253QqswK2fmUtPX4aJk3IQi4hE81JqhYc42WFaj9?=
 =?us-ascii?Q?ufNY4xIjIyDqxUkyF52toYniScUvl3YFgqIY/h6ezKy6K3T0MrW3V6rJeLJh?=
 =?us-ascii?Q?19TfKpSHli7ZLg9TCKl4pG9fAjNSgKAyYNl0Rs2xY0J2CBz3Jg2Xmveq+yDF?=
 =?us-ascii?Q?zjmgR+E+L5mNyqyGqXb0fU0fLlAKrKe7q7PqEVTMYGUu5B5vVKsVtFie0X5P?=
 =?us-ascii?Q?oJSP5L4rxs00kRjX/ZLRLE6RrnA2xDQY5pWDjD2LFdo5rukfTJ6Ho8CiIT/o?=
 =?us-ascii?Q?Qa6WD8iptzVvVhxaa7KbvQp0DxPNAZN/jR+LdZBJUkm8XSwdkLyq+RtXYqcU?=
 =?us-ascii?Q?wpSuHcSnAgpAjXvpLFZ7CyFNg56cdrI/6kLJHfw3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6f98e9-485a-48c5-a75b-08de063b5f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 07:22:00.6366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEOtqppifF53uNlLQ577TySjIzL+owNeb6s0/Je9bWO3aV96cw0FEdAVRDOcTLe1epn/dmXY5RcO2KI6WEKHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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
> Sent: Saturday, October 4, 2025 3:38 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.co=
m>;
> G M, Adarsh <adarsh.g.m@intel.com>; Simona Vetter
> <simona.vetter@ffwll.ch>
> Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength
> property
>=20
> On Wed, Oct 01, 2025 at 12:04:51PM +0530, Nemesa Garg wrote:
> > Introduce a new crtc property "SHARPNESS_STRENGTH" that allows the
> > user to set the intensity so as to get the sharpness effect.
> > The value of this property can be set from 0-255.
> > It is useful in scenario when the output is blurry and user want to
> > sharpen the pixels. User can increase/decrease the sharpness level
> > depending on the content displayed.
> >
> > v2: Rename crtc property variable [Arun]
> >     Add modeset detail in uapi doc[Uma]
> > v3: Fix build issue
> > v4: Modify the subject line[Ankit]
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Tested-by: Adarsh G M <Adarsh.g.m@intel.com>
> > Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> >  drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
> >  include/drm/drm_crtc.h            | 18 ++++++++++++++++
> >  3 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 85dbdaa4a2e2..b2cb5ae5a139 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct
> drm_crtc *crtc,
> >  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> >  	} else if (property =3D=3D crtc->scaling_filter_property) {
> >  		state->scaling_filter =3D val;
> > +	} else if (property =3D=3D crtc->sharpness_strength_property) {
> > +		state->sharpness_strength =3D val;
> >  	} else if (crtc->funcs->atomic_set_property) {
> >  		return crtc->funcs->atomic_set_property(crtc, state, property,
> val);
> >  	} else {
> > @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc
> *crtc,
> >  		*val =3D 0;
> >  	else if (property =3D=3D crtc->scaling_filter_property)
> >  		*val =3D state->scaling_filter;
> > +	else if (property =3D=3D crtc->sharpness_strength_property)
> > +		*val =3D state->sharpness_strength;
> >  	else if (crtc->funcs->atomic_get_property)
> >  		return crtc->funcs->atomic_get_property(crtc, state, property,
> val);
> >  	else {
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index 46655339003d..a7797d260f1e 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct
> drm_crtc *crtc)
> >   * 		Driver's default scaling filter
> >   * 	Nearest Neighbor:
> >   * 		Nearest Neighbor scaling filter
> > + * SHARPNESS_STRENGTH:
> > + *	Atomic property for setting the sharpness strength/intensity by
> userspace.
> > + *
> > + *	The value of this property is set as an integer value ranging
> > + *	from 0 - 255 where:
> > + *
> > + *	0: Sharpness feature is disabled(default value).
> > + *
> > + *	1: Minimum sharpness.
> > + *
> > + *	255: Maximum sharpness.
> > + *
> > + *	User can gradually increase or decrease the sharpness level and can
> > + *	set the optimum value depending on content.
> > + *	This value will be passed to kernel through the UAPI.
> > + *	The setting of this property does not require modeset.
> > + *	The sharpness effect takes place post blending on the final compose=
d
> output.
> > + *	If the feature is disabled, the content remains same without any
> sharpening effect
> > + *	and when this feature is applied, it enhances the clarity of the
> content.
>=20
> I can repeat my question from XDC: should we extend this to negative valu=
es,
> allowing softening (unsharpening) the image?
>=20
Hi Dmitry,
The un-sharpening or blurring is a very valid usecase in pre-blending where=
 certain layers (data
From clients) can be un-sharpened while some other layers can be enhanced w=
ith sharpening.
This helps give  focus to the particular content and suppress the backgroun=
d.

However, this current property is targeted for post blending so will be
applied to the entire frame on screen, here sharpening only is the intended=
 objective.

We can pursue a pre-blending solution to target the un-sharpening case as w=
ell as a separate interface.
Hope this is fine.
> >   */
> >
> >  __printf(6, 0)
>=20
> --
> With best wishes
> Dmitry
