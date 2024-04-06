Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A189AA3F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 11:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BB310EFF0;
	Sat,  6 Apr 2024 09:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ans+EQno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DB710EFEC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712397554; x=1743933554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3s2WHPRKrG8/eXi00wjjrdzox1krgVX+acJhICg4xqU=;
 b=ans+EQno40Cq3wizjnfHYUDOFFRTsuoyS3t4/pdJ02WLj+0zHXTNMBrl
 9HxCsY7RO1gKRcLte4jXYpjflTdm38aY7Zt6X5xNJJqwt4wPIreIALrX7
 FdWXZ+UGInP3yut6Cp3tZac+XXdWglkfEYEGWlor9zqWfwUngkYQPz7PX
 jWR/ciBppBfNdxP1QRCmoVrCUjhEEYY5HgOD8E4y25guKJqzVAv4yRhJk
 VYLcUti3l1BJhmG4o91omw34L0PsdDm+vftM/gyCXtzx9KbrI7bt3mFtA
 O6C6+m8pdnu4DuKzbyrRF0GcifHf3N/6aFgEhboXjClUcfxEKws5iy8Au w==;
X-CSE-ConnectionGUID: GB2prWIiS/2F2coBfRWTBw==
X-CSE-MsgGUID: bEX2CURoQsGJyBU1Dt/RKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7823094"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7823094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 02:59:13 -0700
X-CSE-ConnectionGUID: 2SyurnzeSpe+Vs+c3Kfr7Q==
X-CSE-MsgGUID: wL3/32voSoGv5Atb7d5FuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19317061"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2024 02:59:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 02:59:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 6 Apr 2024 02:59:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 6 Apr 2024 02:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK+ioH2s8IoZUb6T2+gZSfOIaNp41tW/f9tsMwgDixHUL5O3dWxBlL3d0+0zGcMFd+Ksq9pm4Y/n4pWTbMlVFyu1RmlrlCHb6GSOtDGKiL2nddjwG845+WEPrFzMUSfTB8id6hFqnJh3vlnRWjlCqWVnUWfj/b/arQEoJ1fEVwUjYn52OcCYiUv6yFWbvOS6IsXT/gg8OO/RZFtDDFzglw6apuzjvN21Z14XDQ0ZiUUxIaxByDDMbDgwoBl9fBGWZ7Ptw0Er+Bfs6KGEG1dGDb7r+SuMrWUsYJkCqAr9JdKsvAO61bu4fBsljSwhmOpy0rd8JtshI3YYDN3jWbgKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY+RU/QQCHblKZIfWY3mWIsojCWPB13ePA7gfVfh0mk=;
 b=Kj1D3wAe2CHNxiM/Xppa7f2Ui5NqvXDqVzT8wv44kLmSXdst7afmWmyX2xcIVWKM8ES87RRDJvR68tTT+dZsrJhSkWq0NIB/7PUUnxIrDSzWqvvQqfMLuuA5ihcNKWnPIxhcWe9WNMUKPr4JiUnOblMonFSPI8zOKZRnfymkONkpulr3JxABTzpUxAHZPUaCvhbnmS2zIbdq5kQXMF+i+jpdIht2+aDFPE1yyMdri9VAJ7zhzttyXVznqItgT3EHkVz14V6y0tJ3Rq8gMEaJCe7W3BEiPAzbVzBVYSgGiAvDs768q5w0FuAZc7GSSkQGAFR/gR9/Usxo/r2srR59fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sat, 6 Apr
 2024 09:59:09 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::e014:f1f0:90ca:359c]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::e014:f1f0:90ca:359c%3]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 09:59:09 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: R SUNDAR <prosunofficial@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Nautiyal, Ankit
 K" <ankit.k.nautiyal@intel.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "quic_abhinavk@quicinc.com"
 <quic_abhinavk@quicinc.com>, "Deak, Imre" <imre.deak@intel.com>,
 "dianders@chromium.org" <dianders@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Fix for kernel doc warning
Thread-Topic: [PATCH] Fix for kernel doc warning
Thread-Index: AQHaiAeVilKG+DL4HEWKVC5nlpfKZLFbAeDQ
Date: Sat, 6 Apr 2024 09:59:09 +0000
Message-ID: <IA1PR11MB6348A4B755CE2AC214833FD1B2022@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240406094740.7143-1-prosunofficial@gmail.com>
In-Reply-To: <20240406094740.7143-1-prosunofficial@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM6PR11MB4611:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEGoWV9mbEAZsKHAr/WTtOpPkjvKNAjdSQ/KcPN/jn/q7nGDk6vcZPwuJczEYOegPnDaoNObgXSjdrO8xrnlL7mIWICAN6cYbQnIp20M4elGq9p/m+tlSM/pjI4/V12CyVcF05jper5pC7f40tstsVVPeJEPVgjWxVQNzuHvvx+3XYAExmvIH8DeHex2yT5KDSCJNiRCIOfqiuHEfYFVIABWUOw9d5YsMgfRjWMjgHXWh2xZi35AEvtsT+K1jFn05U2OK7lfRRHtX/d2joVd1vRPGEqFDs67hXUttWsJiZWVUum9RAhkc8IvvLxf/cO/zny0GI1Ln3PcJy7x0Qgd0TroQaoq9fIKcxcypiPScxUWShkGW3ecDfZXtdaC5hwb+MODblpod8zYQe2ayUsW6OH2IgehvHq51qQTnmZL6FLaawcWo8Mc4xLHXnEzSwFUUOLa1Av2nlwzjJBS50lSV5uJ+X74kyHLBmKkwIip3vCVpQk/LHQgEF+yh35kRFvmcV/Zy3vaZrFmm/FL2o+2nDfdZmqEiBH53PpgGxrAATUKNw8uhNvzmpoENyJcyG9+XxlCkm1JS8WfT95wOhVZx6v2fbGSJbYp2cSpTy/1S5ZPpgIjVYxm8exTgBxK1jPuY4dWT7GMuRxxixGFRTLiPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(921011); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?35bUvLvWrQVtlswS1UXBBqsjes8cURQHR8Nbdw00Ohc1RpJDVFRRLxAMIdg4?=
 =?us-ascii?Q?M+bFA/CpOMtj1y6mcCtDoifW/H1eT6jbvkVrOFqTHEq2vmRqsZHYI/9dS+pD?=
 =?us-ascii?Q?SR919xujAufewH9Vz/vmJg6pyZkjBGEVoi8kIsmx5eg3dXAUpace59myl/y4?=
 =?us-ascii?Q?u2ZlGVj+kS/SQAuWk8KDi+Xsivpalbeg6K8tWff8lDGnZLBbGvoxtdfMtpbF?=
 =?us-ascii?Q?4Wfe1wwwxDuFPkZN0migqaybPUg9BH6aahHb3bMp/7zr5HEp++ZK/BJLGwad?=
 =?us-ascii?Q?hVYEri7XXzDrWhpXDP60nYV+Ri8Z4tryCcqT8Cl5yJSXTfcgM5UBNftwJ01K?=
 =?us-ascii?Q?g2BuvHxHY5ITkFwoqH9/JRadPLnOcStTUt/6JDJ95xRDD1u0FvZBQO2CYcdB?=
 =?us-ascii?Q?oQLgMmy04YIuRse+TCQ4mw8IZVvv2lugJL0fcrbw1vd0OHB69QnTwukfOI2u?=
 =?us-ascii?Q?aAg/+QG5/PQ0+bvsD2l7GgokdCwTrdx14W++07JRqFeC/aUm7KBEND+1F1yz?=
 =?us-ascii?Q?OyHxpeR2YhXuSl/JJtRAfUYVDDQyf+uXsJuray3SC+g3myRH52AZVfZhKxA7?=
 =?us-ascii?Q?J3uTt0IbPXuBPGAL8h+ox2QT9wL8L8mDUVnHrgcMEgT9apJqEZWA4A/Asafc?=
 =?us-ascii?Q?nMMWccbMgk73tIa2vYjPvnIzw+wkzjUnhak6v+KVt1ylCbK5Iv51BoHpB7KP?=
 =?us-ascii?Q?HqcbyUrOfecDMtLA+NH9sy5Uk00z3++nlysHyKthK3pCIM+cex/pPMjHOwev?=
 =?us-ascii?Q?egKEmFlZPb3+vd6vqqJNC6ESC338FaEoDiY1Bm+jsNsdLwhnXNhyPerLTPaB?=
 =?us-ascii?Q?e7DtkOLauXkTlPvAo80VhqF4DRSpribPlAWTN8Eg95hRgzHiUx9WaL1Vjd1m?=
 =?us-ascii?Q?Y3cbvS/iQ1RofbNELfQVotBvVC/0ISJrIveHYdWcCy3KqZVZ0bzVv2K5c6oC?=
 =?us-ascii?Q?DhSwlg7LIL50sfmYJlEEp1tqM6U2FNpUv/bsV2XqhZ+YOUyw+tFZXi/moABP?=
 =?us-ascii?Q?wGHn7t0Lck/2A+bBB3w/AGlvPAGH6SijNyhnguFHcqYvQ8zZmti+t9w53oNN?=
 =?us-ascii?Q?0V/eqARdQVpiSzuzJ8b3Vqmx6ZXGXUg0AH4PiZK9YAHUnO5DPsnXRcq7l8Zg?=
 =?us-ascii?Q?2hDLUlAkylUpypPIV85rMbLaaNCmBWh7C1bh9wRY3TeKjOiJD5jq/qpzo31p?=
 =?us-ascii?Q?NZsX4M7PCpLR0fOibE5yCeYqhzoqxzVDVXRA6KPCh/k0cq+PcOkSSJWPaRCC?=
 =?us-ascii?Q?04zll3IosO0RzakrhXmOIBfeB9m80JQZocmtM8PcYqwmw2hr/T2eruEkinSY?=
 =?us-ascii?Q?B+nd7QfwO4IsvXn89XJoPll6MI0KpG6cviusfvY9v5M/AkSIbo5p4Vhe2yiH?=
 =?us-ascii?Q?H/UcmyJ1D67p2se26JVYdA5KHjQGs/U3IJLgrPuvZP1wWXS2R9+TKXTYLvDl?=
 =?us-ascii?Q?aLPusqD5oftWDxVrXxWedgZE88jXCYS86MkPYtAZL6yEgmoP2EAnVoD3LFSZ?=
 =?us-ascii?Q?rV0xJW1XM32VyawLotVhYWZuxupyo6V31Mqu06k6LMoWoMRx1Ls/HTe3fqlx?=
 =?us-ascii?Q?8CNSQYIkGUHAwKGJ3Z59++IgRa6ABp1qoMcxpWfvnv/UxLPX4M+KNv2AatDQ?=
 =?us-ascii?Q?MHtJleeZI7+LLeERyTq9YvU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbb174d-24e1-4f01-5066-08dc56203474
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2024 09:59:09.8124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhYpXihKVILdpmnlJkEoV74VO5WbqGwjqRGWtr/tLNb9N8o25t2bcZvHUxbrhv2rppPY+AiONQBQTnZjdNEQcYHe9cubyGFJ/EiWiwHygFrILDzNy1yZfuv6yYKPkCGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

Hi Sundar,

Fix is already floated and reviewed. Looking forward for merge.

https://patchwork.freedesktop.org/series/132061/

Regards,
Mitul

> -----Original Message-----
> From: R SUNDAR <prosunofficial@gmail.com>
> Sent: Saturday, April 6, 2024 3:18 PM
> To: airlied@gmail.com; daniel@ffwll.ch; dmitry.baryshkov@linaro.org;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; mripard@kernel.org; Nikul=
a,
> Jani <jani.nikula@intel.com>; quic_abhinavk@quicinc.com; Deak, Imre
> <imre.deak@intel.com>; dianders@chromium.org; Golani, Mitulkumar
> Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; R SUND=
AR
> <prosunofficial@gmail.com>
> Subject: [PATCH] Fix for kernel doc warning
>=20
> [linux-next] Changed enum name to field name to fix kernel doc warning.
>=20
> ./include/drm/display/drm_dp_helper.h:126: warning: Function parameter or
> struct member 'mode' not described in 'drm_dp_as_sdp'
> ./include/drm/display/drm_dp_helper.h:126: warning: Excess struct member
> 'operation_mode' description in 'drm_dp_as_sdp'
>=20
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
> ---
>  include/drm/display/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index baf9949ff96f..6799f57d635c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> - * @operation_mode: Adaptive Sync Operation Mode
> + * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
>  	unsigned char sdp_type;
> --
> 2.34.1

