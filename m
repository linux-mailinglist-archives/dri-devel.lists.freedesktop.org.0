Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A10AFE921
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E10610E7D5;
	Wed,  9 Jul 2025 12:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6Bv1xPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08410E7DD;
 Wed,  9 Jul 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752064804; x=1783600804;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OZ9W1k44Uc/nvXEcGkKPYd9Gz1ZAF8GPPNA2WX7kNwo=;
 b=V6Bv1xPw1myBFFvz2etmma4UMIuKuhac+YbgHn02gI1lD+yo0x7Rjq6C
 Cd53QusPCjnu9xTFbt5FEyFBkZ1zZJluWVudxEiO3AwPQiw7n4E5mvIRl
 5HmY1xOjEbU880hMzEzJ2yxiCitJmTq519+ESKLozB5bmqwgCbrb5yDxZ
 jU7R/hwymRQ/oHwHfZ4p+CyLMEtwyq9EDNvHsNpA0KSlI3ZS4Ad9eZoPE
 RBlEKaLdRcGLP39HTtF7GqztEyu09Pn48ZZqkJWjUBYXME1i5L4cspVik
 0JSQUmxCKfQqiOKnxft/xQF8GHZm95Uz2W3xGd0McPRMeY467V4z6LgFt g==;
X-CSE-ConnectionGUID: qFaRM6uGTU21vaVxkx2Btg==
X-CSE-MsgGUID: me3zDqWpQRaXcxZg6jEAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54252915"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54252915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:40:00 -0700
X-CSE-ConnectionGUID: uPZuy8vQTXqLBPPMdtkLXw==
X-CSE-MsgGUID: AcblrSmZQmKRPNdp66zG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="160032623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:40:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:39:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:39:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKFqQsM1AS67NLi3GCnsGYa4RxI3CzKLdNxxc3OfPuIafKFSCcwDFWU0a8xbSRcHdTDs88sS598A/eVwS9u/WFWlFSlVopnnPYIZrKS4VdgINuEIHY7NIJdXUy/2+EZdoozTo4MiWDup8ileQtyXVu4r3JpxwQs5Mxb9bvgTy2UhrS+uZ2mRUp05HYKrdqnpbBugY4WH3OnsmVSO+Lb535h1LdW00I4A6xxp+QRQMOpcurRNbJJkMiAepZUc6SThICclTnrNkQnr6qFxgLLAW0gycLOosBLMNoDHYjSJypqbRK4Jb+b5IRbQUg8/S4kAVMfGHnMhFflmw+zOZ6n6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7H+5mWE1luFFEcLAjWd/C/lOtL8yis9YEx7dEThvvo=;
 b=t+2t0IFl7oZloA0s5Je2+ZmkSSHEGdmW9E2ZTzJXNix/cVD/4JN/HMPGfvGFNwWNZrlEPJ/b/5H+Ieft6MHTixVvcTtnRxQoGSgi6lAtyrblD2xEC/8/vnh7oK8NyH71PZXd3glGNehIYE9vuZpzMLzkGip/hnHT5sCbtLfZ3aPvC5BboSZ3XAPNX7FWFMmsKS+zthPFphZYKSErsWI09luKg3DC++m7wZ4YaJSJOjG4dkzGIbxUheQr6OC9jHHQ8zDPGOFw26DZAnWQ08Nqk3xcmHnpRSx78N06uYlLVcGq268OuhKkFAB/aRGcvN+lYkySaRTloAXwYDIphcVxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 12:39:29 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:39:29 +0000
Date: Wed, 9 Jul 2025 15:39:24 +0300
From: Imre Deak <imre.deak@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aG5i_P7dqDEBBEzk@ideak-desk>
References: <20250708212331.112898-1-imre.deak@intel.com>
 <af1b1805-375a-450e-925f-2b0860216899@molgen.mpg.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af1b1805-375a-450e-925f-2b0860216899@molgen.mpg.de>
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH7PR11MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2d252a-11eb-4ec5-03c5-08ddbee5a5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WAtfqv80YJSPPJ4gBiXAlONktFYL+sGZdgg5yDn9k2jRE9KTpdFkSgrFOz?=
 =?iso-8859-1?Q?3zig1IkjSUgZun/4N7j5YG8Ztb9TksNyko30xx03SLs0n4IgxSTOT0mk0R?=
 =?iso-8859-1?Q?TQNATM/HXMVghwQ/7tNVBOjtRDXrJH33kw6m0JZKBkhjF/SHE9vi797TxB?=
 =?iso-8859-1?Q?fl5adIlVjsD06zieCL8t+iJ4+iTDYwFBysxHhg6C7OJG9mrEZqDf5kbkI+?=
 =?iso-8859-1?Q?LRKjiiAzYGBK+IqGF19PESjc9rk0iUL18UKKjLEtDR0KS+l/E9vsiloIz8?=
 =?iso-8859-1?Q?iRyEawm4EU+uNadc59Nigh9FmwiLfzwhmKhp0O5JEjjpCs4jc6Dw91Jsnw?=
 =?iso-8859-1?Q?wH7JiDW/cptm+bqrItRjuYu2vI1FNvZmt1zrvISPanmz822iJiuO4hu3we?=
 =?iso-8859-1?Q?rGBTgEmqJxcJqSo4POZGv5JtZK1LdJDgONscrKjGUGEY8rReIVvYzn+XQu?=
 =?iso-8859-1?Q?SGIxmovEN4UAoqqq903OfQq+0FVqTEv1GWTTsQ+iBe+Lo6wzGpAxulLH3M?=
 =?iso-8859-1?Q?zmh2yuhKOILr5VrJUuJ/sn3DDGuiO4SF0/mKiy8J6ZUL74lGH5gqD20rmK?=
 =?iso-8859-1?Q?XXULjz9LBRBUL6xIZ0ALYnoOxxmo1SnzE5dLR5IDpawTqT3IQQ1680icVN?=
 =?iso-8859-1?Q?JNP9TK9X7IdnkCdDh5Uj9mFFiR3ENdblLerfzxWZlHm5sTlZj2DSJ4Ii93?=
 =?iso-8859-1?Q?iRrhTiSQyMjAqU8px+4mj68KTXiAMauiEaWv1f1dUncztNK6Agwq9azmrE?=
 =?iso-8859-1?Q?k3JZONVHKousHihYxk9Sdkx8vM1+jOQ41toqKq/5uvBuR7FnrijaLeNlXO?=
 =?iso-8859-1?Q?HGnGKptBkjlvltA9Neyok2J7NiDFYZ6WHefL8dvcKpMKHy8b+ycSg/Lp1/?=
 =?iso-8859-1?Q?eM4Pbn07zBFFp3JPehP15gNMZgUzx7R+LVgByc1RcNH5MeF978S8vAWecW?=
 =?iso-8859-1?Q?+mkrErS2/wO3Iq/x1JJhGd7IBDH1qbbDfBmV8o+XLd6QAbfqUI1K7krGKv?=
 =?iso-8859-1?Q?81VwwmHwv/70fCyA7TyVBN/K+tN8ZuJRGrOmdsG+YyhHEM+a9EDTXxk7EA?=
 =?iso-8859-1?Q?g98MkJ5KNMzI8w5cDiKolWd8Q3YQam2W0Tego7ZY7ibhXwpZwkj5nob+Cr?=
 =?iso-8859-1?Q?n+EfuW9NTXyS3SbvmRjO8zcyt/4kgHzXlQgEfJ/JrmrjHZ5u4BXDPQ4bLr?=
 =?iso-8859-1?Q?2eNoVrRoi3h2vgEeQWuTkfniDhpOpQtu0iRHqLkYDhXV7vyHJr43VeOido?=
 =?iso-8859-1?Q?t/ApApXxE897qT5JCJ+vF1cCjo1Hy9ujCWXL8yem737AgB/XyDmzKPH3Ei?=
 =?iso-8859-1?Q?Z6HAuj3ERNH5EekBvtxpijzQ8ly0gK2l/nwGpi1kjEMlFFf/fxmMKlFouZ?=
 =?iso-8859-1?Q?q7QCAxaoKcQihHbdU8d8bEhHSAduozLF1uFQOF7susnlMxH/rYbWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SNomkIDhv7Bt60B2+bKudZnMD1C8ukYEHCxxilBWSBreupnC4vFr1bywag?=
 =?iso-8859-1?Q?9QCvP14q0AkhcXYbkX9r79rm9X6HP7PpVYn0H+8qmRA3IQ3/c11NoRpYJp?=
 =?iso-8859-1?Q?RZSWhxUKkvgiUOEOEyglMmHSkC9R6jKL3E5NO2aiibBzCLC4OH5m5b9KLd?=
 =?iso-8859-1?Q?q4SOyGS7t/5F+q52tjOS4Gw8sve8OMYFbZXQ8D9Bppsya/DpAo7luZqoMP?=
 =?iso-8859-1?Q?7PAzfjgXAiBvxbthoWvCxW5QcwZ2u4MdzNkY58LbP44y8glVF5y068qoOx?=
 =?iso-8859-1?Q?UaXIBbZz4fqNJJQFC4HWrc96AoxudpTqjpPgmkovLciXgE1tpx/el/sFO4?=
 =?iso-8859-1?Q?CdQp0xLcIzK8utE0fjRbYIbPHJpr8P6pzz3HJDAtpFzwm++ZFLZ0wxFoly?=
 =?iso-8859-1?Q?PKFt7PkR9J/098gMlug8anmBuK/yjAKgLIXhOzBM7e9jDGI1fC8hn3mZUr?=
 =?iso-8859-1?Q?1tQ/wLAhyJNgy7bJlYh//LqNvyc8rJ+k8Q92lsxBQUieJc9ryfjIfcJ18R?=
 =?iso-8859-1?Q?01+Hwnj/tkjkPWhX/ToLYefUfA1IgnYnCGoomlHZC6kR8t6tDqUPWBh+xm?=
 =?iso-8859-1?Q?61YJ9Kme003JZoJ62bE/K8/uBtH5eJOwducR0mbuV6j/2DF8d4aLcVvLVK?=
 =?iso-8859-1?Q?eGKBhtkPIjpGlCIGfLcp/VPnzCOqZsHNXz0K+QTM9b2Frr6PFqV5kpxu3h?=
 =?iso-8859-1?Q?lMjnl06WFsu3pLMckMmrLOwMOPvfJeIhtRwjCoisTwaNyDb3yBgc3i4Faq?=
 =?iso-8859-1?Q?y9oK9O3LgQPhzd1977dSkkOSwMXAtkoO5BeKKR/t3wjZOL3BZdAVMJEQfE?=
 =?iso-8859-1?Q?J3ZJGb7xLgCbnsy14LnOGwQgnPLTKziME6BQ8JypXqsIpdV33vwgwR/Rs3?=
 =?iso-8859-1?Q?A2Xo9nbO4YtFsw7Fy8Z2w8iNtIh6OlK1+rMk2RYNautBv2z94oaUx0YlBW?=
 =?iso-8859-1?Q?L0/zO7F/0dgP3A9FzRiIIgRixZkNjGf13uL4QjY2+tkSEX8nQLSMfVozz8?=
 =?iso-8859-1?Q?tpmb+sNirhfWrvsgT0YPbwu1mWHlFIGNCuM+VZU2bKplx/0UJBemtW7Z4p?=
 =?iso-8859-1?Q?eYpuYXte6VLc4BhC5z0EgxLWrAI90jnuLBv6/yB2fpnGaMepJdyWYd+kfr?=
 =?iso-8859-1?Q?UuI3yU9/b02063i1YKBlTvyDreaNPQzsow9r3hJoEpadZIS2x26pkDyXMB?=
 =?iso-8859-1?Q?j9Tr4Tb4dZMaFKsSVZDpTzaRfbiQ9aTZyoDaoUIaAx81weSy3mUv6sYNFa?=
 =?iso-8859-1?Q?xecQa0HeGttKP+uqYzajWuSRDBXBrmuluhQKdPZCbQLzIOwPyLc6idgz+0?=
 =?iso-8859-1?Q?lzcjAfR6wV3rNPZUXhuG+08zMlECoZ3P495KU+QgeIj5P2IeIiY/BuzgUd?=
 =?iso-8859-1?Q?akyQXjXYPKjbs9/zenpx93jOaxAO3r/KRgINEXuENVCdizGFUDvCDXZRA8?=
 =?iso-8859-1?Q?7fPEs9SiqLlaWQVXTlEncBPPFS/thHeEBUuQ+Wo2yWGIaWQ3JZo92fuJGs?=
 =?iso-8859-1?Q?UCsABOo5CpXfT15U82Hy+amHC/W/zBitx3OT0F+1wQ5yxrWZIybXKQtE5z?=
 =?iso-8859-1?Q?DtYFRmNdM7gXnKZ+a85O1f/Ptscg8eIvtfyXvimBw8sJajP2cuJTWqjve3?=
 =?iso-8859-1?Q?Co64CqNCRAm70v4WH3SFJUpcOhN9W6e5Yw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2d252a-11eb-4ec5-03c5-08ddbee5a5cf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:39:29.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDSOf2Y5v0qtv11Y8s8qLVf0gJQ8s9gKqUrolDPV11l8XNDWExOpsgG+Ngnkqt1I/tpIJVURxYyT8p6InFFhXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 09, 2025 at 07:57:15AM +0200, Paul Menzel wrote:
> Dear Imre,
> 
> Thank you very much for your patch, and the detailed commit message.
> 
> Am 08.07.25 um 23:23 schrieb Imre Deak:
> > Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> > DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> > DPCD probing, since this results in link training failures at least when
> > using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> > DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> > link training). Since accessing DPCD_REV during link training is
> > prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> > as it falls within the Standard's valid register address range
> > (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> > training on the above TBT hub.
> > 
> > However, reading the LANE0_1_STATUS register also has a side-effect at
> > least on a Novatek eDP panel, as reported on the Closes: link below,
> > resulting in screen flickering on that panel. One clear side-effect when
> > doing the 1-byte probe reads from LANE0_1_STATUS during link training
> > before reading out the full 6 byte link status starting at the same
> > address is that the panel will report the link training as completed
> > with voltage swing 0. This is different from the normal, flicker-free
> > scenario when no DPCD probing is done, the panel reporting the link
> > training complete with voltage swing 2.
> 
> For the ignorant like me, adding the debug log lines you deduced this from
> would help.

The following are the annotated events from the failure and success
cases, imo it's better to add this to the bug ticket, keeping the commit
message more succinct; can do that.

The failure case, using LANE0_1_STATUS for DPCD probing, from the bug
ticket's
https://gitlab.freedesktop.org/-/project/4519/uploads/e440bd79e44fe3442716078fb38fc396/20250630--dell-xps-13-9360--linux-6.16.0-rc3-00002-ga3ef3c2da675--messages.txt :

"""
[   47.429619] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=  5) 21 00 00 00 00

The source (driver) uses vs/pre-emp 0/0 ([0x105 0x106] = 0x00 0x00)

[   47.429942] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  1) 11
[   47.430289] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  6) 11 11 80 00 66 66

The sink inidicates that CR is complete ([0x202 0x203] = 0x11 0x11).
The sink also requests vs/pre-emp 2/1, but the source does not change
to these levels, since the sink already indicated CR as complete.

[   47.430305] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] Clock recovery OK
...
[   47.431025] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=  5) 22 00 00 00 00

The source starts the EQ phase using the 0/0 vs/pre-emp levels ([0x105
0x106] = 0x00 0x00), with which CR got completed as indicated by the
sink above.

[   47.431720] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  1) 11
[   47.432072] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  6) 77 77 81 00 66 66

The sink indicates that EQ is complete ([0x202-0x204] = 0x77 0x77 0x81).
The sink also requests vs/pre-emp 2/1, but the source does not change to
these levels, since the sink already indicated EQ as complete.

[   47.432088] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] Channel EQ done. DP Training successful
"""

The passing case, using TRAINING_PATTERN_SET for DPCD probing, from the
bug ticket's
https://gitlab.freedesktop.org/-/project/4519/uploads/a999486f52bc794d2923557334e297e2/20250630--dell-xps-13-9360--linux-6.16.0-rc4-00001-g072887dff624--messages--several-acpi-s3-cycles.txt

"""
[  388.585357] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=  5) 21 00 00 00 00
[  388.585696] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX -> (ret=  1) 21
[  388.586064] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  6) 11 11 80 00 66 66
[  388.586083] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] Clock recovery OK

Similarly as in the failure case, sink completes CR with vs/pre-emp 0/0,
but requesting already vs/pre-emp 2/1.

[  388.586725] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=  5) 22 00 00 00 00

The source starts the EQ phase using the 0/0 vs/pre-emp levels the CR
phase completed with.

[  388.587421] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX -> (ret=  1) 22
[  388.587774] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  6) 11 77 81 00 66 66

The sink indicates that EQ is still not complete for lane 0/1 ([0x202] =
0x11) and requests for vs/pre-emp 2/1 for all lanes.

[  388.587786] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] 8b/10b, lanes: 4, vswing request: 2/2/2/2, pre-emphasis request: 1/1/1/1
[  388.587919] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] 8b/10b, lanes: 4, vswing levels: 2(max)/2(max)/2(max)/2(max), pre-emphasis levels: 1/1/1/1
[  388.588035] i915 0000:00:02.0: [drm:hsw_set_signal_levels [i915]] Using signal levels 08000000
[  388.588319] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helper]] AUX A/DDI A/PHY A: 0x00103 AUX <- (ret=  4) 0e 0e 0e 0e

The source switches to vs/pre-emp 2/1 for all lanes as the sink
requested.

[  388.589007] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helper]] AUX A/DDI A/PHY A: 0x00102 AUX -> (ret=  1) 22
[  388.589353] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=  6) 77 77 01 00 66 66

The sink indicates the EQ as complete.
"""

> > Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> > the above side-effect, the panel will link train with voltage swing 2 as
> > expected and it will stay flicker-free. This register is also in the
> > above valid register range and is unlikely to have a side-effect as that
> > of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> > CR/EQ sequences and so it may cause a state change in the sink - even if
> > inadvertently as I suspect in the case of the above Novatek panel. As
> > opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> > training sequence (it must be only written once at the beginning of the
> > CR/EQ sequences), so it's unlikely to cause any state change in the
> > sink.
> > 
> > As a side-note, this Novatek panel also lacks support for TPS3, while
> > claiming support for HBR2, which violates the DP Standard (the Standard
> > mandating TPS3 for HBR2).
> 
> Unrelated, but a warning about this panel firmware/hardware misbehavior
> would probably be warranted.

There is a debug message about it, not sure if it would make sense to
convert that to an error/note message instead:

[  388.586203] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CONNECTOR:106:eDP-1][ENCODER:105:DDI A/PHY A][DPRX] >=5.4/6.48 Gbps link rate without sink TPS3 support

> 
> > Besides the Novatek panel (PSR 1), which this change fixes, I also
> > verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> > panel as well as on the Intel Barlow Ridge TBT hub.
> > 
> > Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> > i915 and xe drivers keep DPCD probing enabled only for the panel known
> > to require this (HP ZR24w), hence those drivers in drm-tip are not
> > affected by the above problem.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> > Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1c3920297906b..1ecc3df7e3167 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >   	int ret;
> >   	if (dpcd_access_needs_probe(aux)) {
> > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> >   		if (ret < 0)
> >   			return ret;
> >   	}
> 
> Just for the record, I also tested this on top of commit 733923397fd9 (Merge
> tag 'pwm/for-6.16-rc6-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux), and the
> flickering is gone.

Ok, thanks for testing it!

> Kind regards,
> 
> Paul
