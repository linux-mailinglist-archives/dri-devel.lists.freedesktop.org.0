Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DFA849B62
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 14:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA0210E1F8;
	Mon,  5 Feb 2024 13:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9/mW/Nu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4DA10E1F8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707138448; x=1738674448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgWPOyPHHraEgrmhNOvuAa/UkERrgeudM39ll8KfujM=;
 b=H9/mW/NuHjADn9j7HJhx6tDA0dkwRd9B3r77StBA2zxT58bP4kc+O0dc
 +EbU81y5NRGW6nyqaEkur0W28drSgSqIHx3WLHOInDbyl4Ht3MqOTDZ21
 Ehx0n5+Uw1vZ3JSv73wGSTpxBtzgxx7N/OYT2IVmPFZV4Am6EzlFMoh4F
 dskExhE+8wRJCO9GB6VBKKZFIEbfmK1AWUa72EcEqKV/2n5X9ZPI1DVE/
 VqveDmAJnujK50YNw7JwVmuSiANrLNmOZCse70P47fgpbaRPSxIbVTx5O
 vb+5wfBFg+MzfxQz6ZqAUzK0q6alvgyO8u1JwPcgxkV2lVR+ZWMmNwhbA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="23001243"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="23001243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="710317"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 05:07:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:07:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 05:07:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 05:07:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 05:07:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWV/ykBFfswFOasJxJo8qXzVummLOU6j5eEa2kOJrEeMpb1C6dUUwDzLqqKT73vTfCGYa++evWRdg6d7icYlNkbjNxgZBARd6mH14BMm4VjTDEmdZStINbpzrVCDDcrAeWnr4EEpDHL9K+EqMmOb5QBiiufwVENkDKAWbaWpbN0ijGJEgkkSHty9iGyFRJGhWIjvHf+eaTGztAdacuLD9cw9Kjq54y/bqZaFP5SivHmM7+1fpO9IdWje1R9n716vHuq7thlM2p3m8XZWQzUUfNW35cLFXxgGt99YuCLdnM3gdJtQlb0OlhqB0Z/xqqCJYUJFmb9BFNecDTGewUPkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnG/TF1izYoHKmVe3/5tdlJiY5S44KYWHC/9n39saUY=;
 b=IyV7Gha2J81i1Yd75+zv/5/iF5fGjMEi5W56Y7vuBfvZP+9tpzJFYQWwmYapKuUc6c9lXNIq27PC78jnh6pUl1dhImMKO8v8cId9Cs09+/DTW0Tq29NYUs6bwfeuE1wDdGvCio3rDvbCbPrCTEm+vDPiA7nlxC+/x175ZamWOxOJrRXoe/CNQZiMlZ/UvYO7L2aKGOvogUnA3YuWMliFfmqLEDY1tWiM+wri9Rw3845X75v5qSyDNGZMFFQ/BrLPQegoVYFMN2JRqxdyUID9+1tqJY7FGPolwg7/4yDydvrHHZ75GK3S6Su3If/WY3ti1KPPjB2yMsBs4iQrR9AT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 13:07:18 +0000
Received: from BL1PR11MB5953.namprd11.prod.outlook.com
 ([fe80::45ca:3c6f:a575:a757]) by BL1PR11MB5953.namprd11.prod.outlook.com
 ([fe80::45ca:3c6f:a575:a757%4]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 13:07:18 +0000
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "gfx-internal-devel@eclists.intel.com"
 <gfx-internal-devel@eclists.intel.com>, "Wilson, Chris P"
 <chris.p.wilson@intel.com>, "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>,
 "Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Arnd Bergmann
 <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: RE: [PATCH 40/46] dma-buf: move dma-buf symbols into the DMA_BUF
 module namespace.
Thread-Topic: [PATCH 40/46] dma-buf: move dma-buf symbols into the DMA_BUF
 module namespace.
Thread-Index: AQHaVfMmWtnp8pJW40C7SaXhfFgq9bD7vAXw
Date: Mon, 5 Feb 2024 13:07:18 +0000
Message-ID: <BL1PR11MB59536157D71E7D6A14636D6A9E472@BL1PR11MB5953.namprd11.prod.outlook.com>
References: <20240202083153.2635684-1-kolanupaka.naveena@intel.com>
 <20240202083153.2635684-41-kolanupaka.naveena@intel.com>
 <2024020202-unthread-handed-0938@gregkh>
In-Reply-To: <2024020202-unthread-handed-0938@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5953:EE_|PH7PR11MB6548:EE_
x-ms-office365-filtering-correlation-id: 313d1443-faa1-4d67-820d-08dc264b61a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+E4P7+wb5yY2/KyR3fb09TJfPixHZa7SfnC5P0pCG+0i3ZeZhakAYPOS1X/Fk1Z1etcroOHThzdfeE6ivKKJybyWx2LAHeuIvA3iKc6ISYl5FbILTaL2AL+zIOZ+vkGlD0kEb3aumr1VVfYbOJzZ3d/R2Iq8P+1KkJkE8Ss8MZMaOA5tXOrJCnVQoPEPWOH6ZSBBiFyXInMZrC1SKsaOV0Hm7rIoVJPteCjYx1uGUL+I9UhCZkRflcqCYuvgpOzx8e5EekerniCHLdm0URA9WbeL6ZKPk8tt+VDI/lrphNX+s1YvqAH3f5CWi5xFKTusQauVy2r8UlRuiBYhJdAFJOJrJRFpTmNFGXKTsUEH31ARVG+Cz/JIsUnx0OR/vh9wvTvrPctK2vkSloisjHxPFEABbKLZfTAHcpbnt4m1G3YMuGARzNrreLQlc8Dm8jw4pqQMgYHJpN74aV3GlIsqOdgmV69DUzHE6xkzv4VvmXI0w0/g+bIntuEB1fzG8rQ5D7w4n/RfVlkzzzpU7BbsHaW4s71AfSm8t4CE/HnkKFqmtZBdgt+kIwAhHqjR0HLxyzIUpScLr7w6dosSI4Zb8ukLPMO/o3C2Ko54HrXC9ym99Gw2Ot/1xsyDsKrO8Cw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(53546011)(9686003)(478600001)(82960400001)(6506007)(38070700009)(7696005)(26005)(86362001)(38100700002)(41300700001)(122000001)(83380400001)(33656002)(71200400001)(8676002)(8936002)(4326008)(2906002)(7416002)(5660300002)(55016003)(44832011)(52536014)(76116006)(66476007)(66556008)(66446008)(66946007)(64756008)(316002)(6916009)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5PeoHJXEBdh6iT6A5zFtitzeho1EH7QYsW6JNWPJ0qvClcX9VZfxcyG7i5?=
 =?iso-8859-1?Q?d2lRBbjRyL0QxtdIj4PUca7v97AEulgR5eSHNLRpKVhieoUMHsbb6ZxxPx?=
 =?iso-8859-1?Q?S9K2GprNNj2f0RiA3Xv4CtvllUaHIH0zfcF0DLhnnYW9lNUIH/vIgb9Nzx?=
 =?iso-8859-1?Q?82fFhk0IChMk6d3PaoWzfgI2I5FuiMMTRtNJd+chIDgDuGJ0gaift1tF7y?=
 =?iso-8859-1?Q?4OCJAhekpsRzBAzJ158YFFMFpthNk1oN1U2Nw52Oa4951mImn2a7FKiod5?=
 =?iso-8859-1?Q?MdHwF2I0EgAremU/GxrYHZlb8MLpLgkihrHXOyq1vU7SNryHBRSPUJGy50?=
 =?iso-8859-1?Q?EqRGMvNyFY5Y/P8stgSI7LbeuEtKuSPp750lHnBT2CaxjzD2ChqEy9iFV4?=
 =?iso-8859-1?Q?7+TVe8gvtLLD3xI1Scoj2v9jz61unECBq4CZsliKW1JHFBQ5VpCw0I0HYs?=
 =?iso-8859-1?Q?RKEFNM6Opd4hASVi5wiiEQF3M8T9QM0/4GgYKyRjbMy5Fu1b47vjfEt8iI?=
 =?iso-8859-1?Q?Np9akTyf9HrwURVwLckn922LscIMTtn3nLKRZ7j+/fikGlZhydtfba02wk?=
 =?iso-8859-1?Q?8W2y3xG1wfM55sKE/8It+lwW3ttcNOUPefWwfs5ROlFBi/ajG1U9DN0bkR?=
 =?iso-8859-1?Q?gYRc7gdIW2XKe5QBioEO+LnHJv2etsUl9hYrq9jPSmrWioSA2LtaMEGZZC?=
 =?iso-8859-1?Q?hGJIXo9xGBcVIDH3CY4Q1AKpKA+rWNR3+oq6YvRsgmwCfXqh1OHGwuHG5+?=
 =?iso-8859-1?Q?ml7eCmvk89n0GIYzcA7NW3mcFS9dxy+LWM9HeB5fNvsJjA+yqghY35wxQB?=
 =?iso-8859-1?Q?djf8vlEEFe0ByZDzE4GLY290iMxAhNjSVwgH3Ok/3xrmwnnBpbrhS/Gktf?=
 =?iso-8859-1?Q?8k8DzZvlTmkKPPzeh4gubaH1kYU+SXIEXzLDR5H5wvuj67PeE2EcM2XHN3?=
 =?iso-8859-1?Q?k6xE4KSyCMVZLwsSdBp2J+YaSU91yojnW/vg/K0t627hBC3WaKGtgois3F?=
 =?iso-8859-1?Q?Y5RocENGscMA5EmhaXnMvpHHPPOAw7k1iaEWu/UEbaytcSUcm/aBgvASji?=
 =?iso-8859-1?Q?PFppyY0YPKd9A+s+9jQZrMSJj5pmR0GJPbxm7v/AF3xQMbP2S4bMTnOe/s?=
 =?iso-8859-1?Q?PBm1b8PTt57aU6ei4F/zEWlXv9PYAa7puZO+eXrEiI3KQUz+u0yWQwSgk+?=
 =?iso-8859-1?Q?5RdkzL0f/DbwK9r7q2vittKBSXmo4/wM3lnnYbKIgvROUmghZmbEusE9TM?=
 =?iso-8859-1?Q?DqZiy937JJKoV+jNrPFMRrNoorCBq1f05g5vKqtvMgwflc8jmaCFkC+YKF?=
 =?iso-8859-1?Q?R9Iv6X3s7NxrbswdqvsY/57DsHsVJjXdipZAey3P0IMZdpp+6ef/uCZ28M?=
 =?iso-8859-1?Q?/LrN7qZoGMW8LVQfXii1qBYeHf2rqZvA45Lz7zhxIwI2oET8lre3zZHJ1a?=
 =?iso-8859-1?Q?ZeQ7VfRntM2LnPd3V6R/zkvGDMGgmvZEy6kNn1hO6NhcWEGw1C2NuBtY96?=
 =?iso-8859-1?Q?dPpDy/TC7fJLu5YYjgCdf5g6U9+0zlsC117Sfv9V4cTmfEQP/iVAzfPCVB?=
 =?iso-8859-1?Q?p7YRjS+kNS4qpKg2HllupsjKq23toXfT+S/o5xQ+MBTq3352o0V46jokTn?=
 =?iso-8859-1?Q?brCQdwuuPdTaf7ObQ2Yygh/I6TN2mS8j57ZnJVEetkubL5M21pqmzpaw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313d1443-faa1-4d67-820d-08dc264b61a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 13:07:18.1719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dke1OpnSJa/13vPMvIkYh/TxVsBHsOL7sbRDe78WT1DMb9A9mqAEPTiLOWpdR16y9H/OIGC/yqdGO/Plj2ivZ4eLzo8XnJQQBqo80lu4Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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

Hi Greg,

Thanks for your inputs and patience in reviewing the patch.
By mistakenly this internal patch has been sent for review as the reference=
 commit ID is from opensource, email has been sent to those who are all inv=
olved in that commit.
Please ignore this patch as it is for internal usage.

Thanks and Regards

Kolanupaka Naveena
Graphics Software Engineer | GSE OSGC
M +918374415216
Intel Corporation | intel.com

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, February 2, 2024 9:46 PM
> To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> Cc: gfx-internal-devel@eclists.intel.com; Wilson, Chris P
> <chris.p.wilson@intel.com>; Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>;
> Muqthyar Ahmed, Syed Abdul <syed.abdul.muqthyar.ahmed@intel.com>;
> Sagar Chormale <sagar.chormale@intel.com>; Pan, Xinhui
> <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; dri-devel@lists.freedesktop.org; Daniel Vetter
> <daniel.vetter@ffwll.ch>; Christian K=F6nig <christian.koenig@amd.com>; A=
rnd
> Bergmann <arnd@arndb.de>; Sumit Semwal <sumit.semwal@linaro.org>;
> Alex Deucher <alexander.deucher@amd.com>
> Subject: Re: [PATCH 40/46] dma-buf: move dma-buf symbols into the
> DMA_BUF module namespace.
>=20
> On Fri, Feb 02, 2024 at 02:01:47PM +0530, Kolanupaka Naveena wrote:
> > +#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
> > +#include <linux/module.h>
> > +#endif
>=20
> No #ifdef in .c files please, this should not be an issue, just include t=
he .h file.
>=20
> >  #include <drm/intel_iaf_platform.h>
> >
> >  #include "gem/i915_gem_dmabuf.h"
> > @@ -23,6 +26,10 @@
> >  #include "i915_trace.h"
> >  #include "intel_iaf.h"
> >
> > +#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
> > +MODULE_IMPORT_NS(DMA_BUF);
> > +#endif
>=20
> Why is a #ifdef needed here?  If this isn't built as a module, it's not a=
n issue,
> please just make it simpler.
>=20
> But really, why is this a #define at all in the first place?
>=20
> thanks,
>=20
> greg k-h
