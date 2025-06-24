Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B72AE71A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4A10E628;
	Tue, 24 Jun 2025 21:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwSS94Kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EA310E627;
 Tue, 24 Jun 2025 21:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750800996; x=1782336996;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YfBWlY/xXJw0lMfUjYr+BkUeIOQRPO4V6CzqJQxOllM=;
 b=QwSS94Kg0y5KhexkPfp6cj8SJIwZvJQJp/I8MBFHNEwrcT9n4RElhkoX
 1A/8HYUaRiZxYvRZmbaVA/cDjAP9AfyUnQ0gzpHZrAa9QMWQ17xCF4Bg0
 Nm+b1Fs3tli7GG2ly32Z1hSI+bOFFm4ePHKDM3o4xVy8A/LIS/DqhiAtr
 vOXH+Vi9j/NGXPM6nZDjHDQZQHjl7jPBdbW0vgO+cCCXj4tT0NCcI1Fw8
 GVIzRpxnZBSaHz3uwika2nRUL87A+4t87Nq8bHrxaKWFDp8x+XnDzY3nF
 Golj5pmF4qhlPZpUX89nn4GiWeK+mD5sUILjlGjmiVAyWEjusxncWvHf5 Q==;
X-CSE-ConnectionGUID: irBL1nuXS4eEKpFp5HjGLg==
X-CSE-MsgGUID: qZ1BzwLbTtKrVkrZv3jatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78479765"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="78479765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:36:36 -0700
X-CSE-ConnectionGUID: gv6uc87tR2S3rDGQajCWrA==
X-CSE-MsgGUID: kbpkjooxQ4OoJrp1tG0rHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157799861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:36:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:36:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:36:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxhmp2e6H5FZBxoit7G3vJiUsAyWfU6srq7VcUUB6XZpG7Z3K+nxzmgTJKFzsfWDnwQ7BrJzyxH5/hxbvZPXXBZXYWiGCoYXAwMF3RHhRXzbT2Otw1Av+fQaFVvZW0YC8a1j6N11s+tLZdAPLUkSZFzw2LIWa6QpbHOsflrChUZ11NBkM7jG2RdFUXlylhPosZeUbnsv7XszlvvnNEL7jI4bXEueQ+jzCsMb912KrEarcKzflRq6pbJMFOIvs15dv0d8ezPryl3+JZr+qeh6meHxxvXooCeFdNwpVoFWNp9U2fGrCvjqaVTo2kjSM9yL0x+j/I78lL/MMK1HcphmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN2BZI05M2ba979NMtNqUCsEwmI967E6nl+IYtmrlaY=;
 b=mHaiv8NBK57Geq6IxnauLFjHN5xgzWE7BESTRRpZa/pFbrcvSM/xTjBvqL2PYN62rjeNex/u5mjpF9SEDyghpvWOcrfW1dGIvHAxu2VIdaZid1UUhY3inkcmE+X9rh7FGujaTtE55ZWQQloSranV/xwYshAfb4gs26UJX7DkHvcsYgECVrLXpeAz+jafbVXkxLGaZlpuvWd3hAf2rynzxKT3LYiaREh9HMsE+Nbi/kYRWR+cxiNoNS8fl8ihhsH7ic7BLz9Gqbwp5fcsU7geu6T38PRu1vFn7EVpmpfpCv8scFf0aF3sfazD+K6M0gob+FO83sQzto0FLH0EdqI2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 21:36:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:36:34 +0000
Date: Tue, 24 Jun 2025 17:36:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
Message-ID: <aFsaXXKZSBPrcYJb@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b99b445-ce76-41fa-719c-08ddb36730b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5lLfR4VaT+80MOfw7YOGV90OLHLJ9sL2PxD8DoW2doYZDr019eTTVk6PAC?=
 =?iso-8859-1?Q?zGeS3dCDnXryJ9j3elY7TRNetmV1tMzoAoSgLsIlL7E3nnakBUxKLMeT4H?=
 =?iso-8859-1?Q?17QGevJj+xZqIhT24sgsHMghtSlTwWpBV2bCNjvGQHTt6CPE1/PhsyF0qP?=
 =?iso-8859-1?Q?L57uy2/zXtEGs4fWcfkIUDXJ+lKmvk1HHdrkQXIOnQ++gN3/gPUEAkXJnD?=
 =?iso-8859-1?Q?/pr76QkJdx1iI8f001hSQzDbYsw2hQ/fwAaVnudTCgBnLD1CkN9mpNtWjl?=
 =?iso-8859-1?Q?Mh9VHd3O941WiUhRgCg4X4soO36zhnGIl3FX/0aJVGJMpLVSgPb/Kmb3tH?=
 =?iso-8859-1?Q?hPlfJCuFXl9C+ghb5wCwkspAhGj1to+AwXKDwwELlagwtyl8LQemDmVLaO?=
 =?iso-8859-1?Q?OTQXKO3hS6l4FBJWGO3jB24U4l0356XiuF0m881/vZYjFBNaXeH3izNP7b?=
 =?iso-8859-1?Q?kvxmmt3kWEBikNCFQSAqr/eEtnXvTja1UNQkqfl5XwXSl4ZgG3Z5DvIJz+?=
 =?iso-8859-1?Q?SAeLcBIY+kg2RHfVnaouzWICpDAwT1teAG+WKVHbStxDlhSEO6o+0dCkdM?=
 =?iso-8859-1?Q?631oKAJ1MzVCvypbHjPhp6VYNYYrR6b+P0fOP7tCsO38aFH0L8aIBhOrMJ?=
 =?iso-8859-1?Q?15bvB2w4LQw0URHHiE1R5KP42Xu/X7h5MTUcatVW9kC3vGWSfMeTwZH+hq?=
 =?iso-8859-1?Q?EmEM/b6V6Nr9ccx1IAjVHivxTkRWK+Vd0ndLrtmHYYWp1w3MwNiqQOaPSz?=
 =?iso-8859-1?Q?BKDBPGAwqJWu86XG03GkMlA70rgMkygpG5LMER4M6vfHpkXxhMLHbbmAix?=
 =?iso-8859-1?Q?8I1KlJPWtfnWiRMcEXoYWBYnll86cEdere5yf/SGZe3+TY5VtV0ti/A2Hs?=
 =?iso-8859-1?Q?mtQiizcYB4nF8OLLLZysh3z4l30dAbvEMO0nUQMTV5+V/Az3o+9uy5LInK?=
 =?iso-8859-1?Q?dQeTv2/35jdN1VYYvW0bpgUv7l8uEYPgCZTlOdVamvSi8cCihf5XWQcNrX?=
 =?iso-8859-1?Q?X8cy+U8pygiHp04mLbDyCWk0HsTOgtorxPJprbhK7puZO/9+2GgvmSQzVj?=
 =?iso-8859-1?Q?eMkXhY8au4dj2no/iWvmselkueEfkriUImcH4SGF+kDJ52xcLGDKZkA2K/?=
 =?iso-8859-1?Q?dese1C0EPE+bUmYWv5IUG6S2e1yCKFEGcTBZagnnCpd9YpiDbf4L5nglf/?=
 =?iso-8859-1?Q?X3pnsK+0LZfqx55hlr/UPj0b1Fij1oguyHX8j3UdYGlv/lK3yjAYq91GJR?=
 =?iso-8859-1?Q?u2xIUVa881zIX/aEKZXPjIWG4asd0hPyhzVoXG2Vr0GaTxGo9XDxwXwx6J?=
 =?iso-8859-1?Q?LgdkK86h89lwCiACursqN8miaaIkhcB5wALw5g4f/FxMAyvLP7QnS2B3EN?=
 =?iso-8859-1?Q?rkzErOUsTWsX0HcE/GsA8+OzHeP9+PQA43nj/pU3VNbK5nfEyBcFJRX13A?=
 =?iso-8859-1?Q?/XWEaPorg/urBinH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KlVnVI37PYSI66xGliddZVfyiGhhXNhJ9FjV82gh2dGCbbxW/3Pf2oQvPw?=
 =?iso-8859-1?Q?vOGGODI/o6deUpfck/j5EbPj85B4orsAQtQ9dnooYGn8arSldd5CYQa9Me?=
 =?iso-8859-1?Q?HvwmqdSEwyF311feYn+Z8KAtF6v72W6xcdWyB7gfSWA2wYExp9PWKj2yzz?=
 =?iso-8859-1?Q?dIujwoDLLUPLxq7rdZ9f4EFp+aMx7KnPql6+EmvTybYNP//NDs4KjXV5t+?=
 =?iso-8859-1?Q?m8CCBA8kXwR0o1dQBhFlp6Ob6YvQBrFe2C+yP7PCyV13iey5OKnc7NU4Pr?=
 =?iso-8859-1?Q?9W32L1AjfFzIqDGX0RgpBy8GSqHH3KIrXHFtkdMkmYFc/E3WTeLMWNsKnt?=
 =?iso-8859-1?Q?3PLv6AJO6WOxzZrJ4HAYNU/GeEAaFVkyXNd/0FqLYLsJ+R9kl7X9PcD3RW?=
 =?iso-8859-1?Q?Asbqzm4zHefu+DBk8IXHPHwK9AHJBJBWUCHEnVJjkUBx0SrjycKSckHmUm?=
 =?iso-8859-1?Q?8gaM6SHt0jRlkvhMS8OLPOn57iU+5kQsvXTxwIPotlr1mHnRHXsfLxUY7Q?=
 =?iso-8859-1?Q?ozO/7j2BZauhXykC1tnXrAfJ2WmM4GL08bwcQO9sZ0alY4l1/+/lK1S9En?=
 =?iso-8859-1?Q?8dOw6aD5M8+hHsAFNCxZpYH9Inw0KcNtNPzS1kp5bMg1U/r/XEtXOSz204?=
 =?iso-8859-1?Q?Yh8Qd2CibzxNjtk9/irHACpZGVds1DyqyqVlnbM3s1AW6KhyBAdizr2lMR?=
 =?iso-8859-1?Q?fKPImUAPWifeLIfiXyL49aVQSJ+mcJl/wuRwuOLopkYfmPHfa75wsdnDNE?=
 =?iso-8859-1?Q?vgKZdqWsAMHPcjBQmvHN5bDvNQrAjApuNNZJZX5s3T7l91nCezJdMae/Sc?=
 =?iso-8859-1?Q?cLrvW+EpWrTERxfEIlGQzfdesSXZKG8v0/mxgx/SHCef7mNmrgNI9669sR?=
 =?iso-8859-1?Q?Gs8gZjFTYU/Pyj0sgZMx6eE1CzXLDXXAPnOyxZNY3rFI5O4zjQ36ULRLEJ?=
 =?iso-8859-1?Q?dFLBc9WiV+5ub2H0TJeawEUuZZDEMRjtjDvIppRbGlaeNy04Gk/kLl4Iq5?=
 =?iso-8859-1?Q?4ExyGd4YsqYhY+YLPog9XU4jREBmOVvM23vSuQAQZMQAHmvIxfPb/vmWJ8?=
 =?iso-8859-1?Q?33tk+uIPNtLVujSl1hOkIcDHdoiYAdQvEVRlbScVdbs8MlzVvsznqqMBj9?=
 =?iso-8859-1?Q?qLOZFA6QNGR+9rGuNXzXZteypvtXyZVkfxylnupC/F0q7bxx+3IiWpyI7j?=
 =?iso-8859-1?Q?Tf6/5N/rVhGKDnukqJeP8mCU7gPbhsIF5qaS9LlEHHveLSX+6fR3m6g48F?=
 =?iso-8859-1?Q?41SC7qPgpdwmshDN5KfhAYCZrw5bvgKw/NKRq1wnAXygqG1z78plZXfQok?=
 =?iso-8859-1?Q?vZYln2+G/znT8ZqfifY8Ru0YRrTG89LpoQyhyFnNtwaRdBjdQeB6iY+/bt?=
 =?iso-8859-1?Q?1y/TQSqV0WUM8IuApYRF9bwhtQyNSDsM7Sc0/+dPka8ekgpE0WaJ3bCdLX?=
 =?iso-8859-1?Q?lIWIGFl0K9j0I2vQE6qiBETpc4csk5Vg4tuf+y8aSOSl+5kQ/waU1MWcTE?=
 =?iso-8859-1?Q?M3CtmnYpsZHMIr0IEkUfvYFkxLVM+bcmUVmrLoAbTseFeKJdjxIr8pirtl?=
 =?iso-8859-1?Q?vw1zbMVpphR/Qnz7kN/Ua8g4npfhTBcJ1aKVl1kGU//MI0oP5M5e3DXHKE?=
 =?iso-8859-1?Q?qvekhnKiTn2GxjUgOnxHnjT2DuyvaVtHzI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b99b445-ce76-41fa-719c-08ddb36730b9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:36:33.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPg63oS8Zzw6Nxrs1vGJun9cLmG54u7K4WlZ66wp9NfnOE1EkuhubK/yJKOMCcovheerCCwIoJKdvv5BpSK7BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
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

On Tue, Jun 24, 2025 at 04:23:31PM +0200, Christian König wrote:
> On 24.06.25 16:03, Riana Tauro wrote:
> > Hi Christian
> > 
> > On 6/24/2025 5:56 PM, Christian König wrote:
> >> On 23.06.25 12:01, Riana Tauro wrote:
> >>> A device is declared wedged when it is non-recoverable from
> >>> the driver context.
> >>
> >> Well, not quite.
> > 
> > i took this from the below document. Should it be changed?
> 
> The wedge event basically meant that something unexpected happened during the lifetime of the the device (crash, hang whatever).
> 
> It can be that the device recovered on it's own and nothing needs to be done (the none case in the documentation) and the event is just send for telemetry collection.
> 
> But the usual case is to trigger a bus reset, rebing or even reboot.
> 
> > https://www.kernel.org/doc/html/v6.16-rc3/gpu/drm-uapi.html#device-wedging
> > 
> >>
> >>> Some firmware errors can also cause
> >>> the device to enter this state and the only method to recover
> >>> from this would be to do a firmware flash
> >>
> >> What? What exactly do you mean with firmware flash here?
> >>
> >> Usually that means updating the firmware, but I don't see how this will bring you out of a wedge state?
> > 
> > It means updating the firmware.
> > 
> > Series:  https://patchwork.freedesktop.org/series/149756/
> > 
> > In this xe kmd series, there are few firmware errors that cause the card to be non-functional. The device is declared wedged and a firmware-flash action is sent.
> 
> Ok, so let me recap that just to make sure that I did understood that correctly.
> 
> You find that the firmware flashed into the device is buggy and then raise a wedge event to automatically trigger a firmware update?
> 
> Why not fail to load the driver in the first place?

We already have that in place. If during the probe the fw machinery underneath
identified something is so bad that it needs to be flashed we boot in the
'survivability mode'. The device is not discoverable for any gpu command
submission or memory management, but only fw flashing is possible on that
mode.

This is on top of that. If the fw machinery had a bad unrecoverable error
and decided that fw updating is needed.

> Or at least print a big warning into the system log?
> 
> I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.
> 
> I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?

The goal is not to do that automatically, but raise the uevent to the admin
with enough information that they can decide for the right correctable
action.

Thanks,
Rodrigo.

> 
> Thanks,
> Christian.
> 
> > 
> > There is corresponding fwupd PR in work that uses this uevent to trigger a firmware flash
> > 
> > fwupd PR: https://github.com/fwupd/fwupd/pull/8944/
> > 
> > Thanks
> > Riana
> > 
> >>
> >> Where is the rest of the series?
> >>
> >> Regards,
> >> Christian.
> >>
> >>> v2: modify documentation (Raag, Rodrigo)
> >>>
> >>> Cc: André Almeida <andrealmeid@igalia.com>
> >>> Cc: Christian König <christian.koenig@amd.com>
> >>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> >>> ---
> >>>   Documentation/gpu/drm-uapi.rst | 6 +++---
> >>>   drivers/gpu/drm/drm_drv.c      | 2 ++
> >>>   include/drm/drm_device.h       | 1 +
> >>>   3 files changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> >>> index 263e5a97c080..cd2481458755 100644
> >>> --- a/Documentation/gpu/drm-uapi.rst
> >>> +++ b/Documentation/gpu/drm-uapi.rst
> >>> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
> >>>   can use any one, multiple or none. Method(s) of choice will be sent in the
> >>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> >>>   more side-effects. If driver is unsure about recovery or method is unknown
> >>> -(like soft/hard system reboot, firmware flashing, physical device replacement
> >>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> >>> -will be sent instead.
> >>> +(like soft/hard system reboot, physical device replacement or any other procedure
> >>> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
> >>>     Userspace consumers can parse this event and attempt recovery as per the
> >>>   following expectations.
> >>> @@ -435,6 +434,7 @@ following expectations.
> >>>       none            optional telemetry collection
> >>>       rebind          unbind + bind driver
> >>>       bus-reset       unbind + bus reset/re-enumeration + bind
> >>> +    firmware-flash  firmware flash
> >>>       unknown         consumer policy
> >>>       =============== ========================================
> >>>   diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >>> index 02556363e918..5f3bbe01c207 100644
> >>> --- a/drivers/gpu/drm/drm_drv.c
> >>> +++ b/drivers/gpu/drm/drm_drv.c
> >>> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> >>>           return "rebind";
> >>>       case DRM_WEDGE_RECOVERY_BUS_RESET:
> >>>           return "bus-reset";
> >>> +    case DRM_WEDGE_RECOVERY_FW_FLASH:
> >>> +        return "firmware-flash";
> >>>       default:
> >>>           return NULL;
> >>>       }
> >>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> >>> index 08b3b2467c4c..9d57c8882d93 100644
> >>> --- a/include/drm/drm_device.h
> >>> +++ b/include/drm/drm_device.h
> >>> @@ -30,6 +30,7 @@ struct pci_controller;
> >>>   #define DRM_WEDGE_RECOVERY_NONE        BIT(0)    /* optional telemetry collection */
> >>>   #define DRM_WEDGE_RECOVERY_REBIND    BIT(1)    /* unbind + bind driver */
> >>>   #define DRM_WEDGE_RECOVERY_BUS_RESET    BIT(2)    /* unbind + reset bus device + bind */
> >>> +#define DRM_WEDGE_RECOVERY_FW_FLASH    BIT(3)  /* firmware flash */
> >>>     /**
> >>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> >>
> > 
> > 
> 
