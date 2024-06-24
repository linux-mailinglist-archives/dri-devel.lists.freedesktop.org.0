Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3E915923
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEEB10E0F9;
	Mon, 24 Jun 2024 21:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KldwuH2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AEB10E010;
 Mon, 24 Jun 2024 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719265067; x=1750801067;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ixyw7/SBpXzkZdFIihS7BwMJjQkV/kSqA23a2HfZKlI=;
 b=KldwuH2RtLak/XVXPb8e2tnAbZK+i+0BA27Bx16Y3Ddz3T1LybSJKOJp
 JFyONLEuR05a53xK+hB6uhxhmFzEGcSbqiRl5kcdrDKAoI1NBLX9zdOmT
 OW8T/44O97dK8vwh+h/1WzhdeHhPDG0B61OQdW3MWu6y2jONVuBYnjMgC
 su0YWIgsPUKSvBnyYxw6JFKYHaOSN5BUHFlZE2qKMONECeDk9uThqABOc
 Ui/tiZOjcztBrWVLfFnQmoe+18vGSUts0ifDaUJUsx2ShbraL1SHwcc8J
 ViCfuS2oktcR0tvP0KdFLwvDn1SH6sSuI72EQtwgzoAcBfpyVM7ho0CwY Q==;
X-CSE-ConnectionGUID: ww5imCl+Rx6tGdHSsizVnA==
X-CSE-MsgGUID: WUDVPQrGSTqwHuNkNAuTAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16084311"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16084311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 14:37:46 -0700
X-CSE-ConnectionGUID: XVAdVJ3nSzGa0+rv5/Q7Tg==
X-CSE-MsgGUID: 5kmGA7pmRgaKPtNCbYHsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="47966280"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 14:37:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 14:37:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 14:37:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 14:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBOgVKa3wNiccOWiQ2BOqjM5bm44K7J456DvdM5dCMHBkQdpmkEpdcOIyaMWE1hWZyxQobOZy+wZqOSjC5NKlneoaqxAqIYjPII5993s+8OtbntP1RB0Eog8K6Wu4tX9pNVtsjQvksXJa8phrxUULryvjc3qQgMdD/iYtFBBXMq/yJR1ilhMm7rbjg5LW+FtfdzUFu+YYi5P1BQE1EIAC/6UiKLwXirz9JgWIuEd0bN2HiIPBMZX0mjyjlGx/Nuu0Y/fGlzCzdZRA3L8lBLiRpw8OfYQfwl+aFa62a47MtTq+cjW/qNjHTfHm7fv2erUuS5TCkNThW21IuS10Sc5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nof6cS+GWSfypgtEXR2kJizKQ5/h0xd9u9CRzaffazE=;
 b=W3gNscimI+fJRBy/uhakGjE2UXOPv2nKy99XE9b/VaxzauHZaKXSVCDCNARHw56WYuAd2Z3aRlXfEGscuGp99eajh0Qx0Q+a4v+ICMotgsAr26X+riEWZfKkTE5vzhbiB+E7hZL9omwp433x+naa5SFBOF9eM2B6g/JkfP25OZz/RWyTd/vbDKWq/wtFMTM4JijfT/DMvmYcsRTcgneRfCH0CdHFUUSiFy3dlA2U5KfdRWXzknNOEB4hpMpbfJLkKPkmPl7rjYCEoDj1jvBmPYVHFFGkofU+wCHd/1TGGKf6cv0gHX70q7yIfrj/92nN61hN7y/hann+i5OXOtlxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Mon, 24 Jun
 2024 21:37:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 21:37:43 +0000
Date: Mon, 24 Jun 2024 14:37:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Pallavi Mishra
 <pallavi.mishra@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Effie Yu <effie.yu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jose Souza <jose.souza@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Message-ID: <20240624213739.GU2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0052.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 244b9c6c-428c-4669-080a-08dc9495e144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NYMlvCBeCAaKH1S0V1cQS0eXVyRSAcYedLix0r2q5eudIgqXJHmGvfjWji?=
 =?iso-8859-1?Q?hS8Ivc1ZFFu499ZLQqln0XPuOIITE8ZngENh+4z3CrMsOOV7Nu13hWFuq2?=
 =?iso-8859-1?Q?FtR7RDtnqDGtKkVVjGmQvdFayJLr1nMjjxpt9cK9aFKVLeYOMOoT4N10+3?=
 =?iso-8859-1?Q?15TumdiNi9bWKLz4jd4qyk3bZa6MiCzrvM7ImNRQffaLCNa1MO7GhVPVOn?=
 =?iso-8859-1?Q?HA0/T7j1h+fFyh5ARlfd3Xr2Fw/PxYYio/oJaPbidMPcfA2JUCgzW4Z//Z?=
 =?iso-8859-1?Q?0pZk77ouy95P1BO/198ZmnftM2r3gErd5WYItxaSVhaFIMK77HFDR+HJJb?=
 =?iso-8859-1?Q?gMsxlqRQccZt9D9mBSZYyuJ/fXOJrtMwlffvD/ZOsPiLFtQjIMLlKBm+3l?=
 =?iso-8859-1?Q?pW6+acFNMIblOoN4A6wWvnDBCjrnEBzMucDcnBzCsSd/sm+mzQxR3XdVJc?=
 =?iso-8859-1?Q?WB9rdSvRuP3EkWy+i2twsf4ETVKgABq2St5kv05IdjvlYrJhlTZIdhOwkA?=
 =?iso-8859-1?Q?bngSIZvjfAVjtn5BRKnT2imbxEbr0NzWnXhK+IEf/lb2bid1MVVswKYc0+?=
 =?iso-8859-1?Q?rhnWJMsO9nuo5/YInbBE5aMkIbELrhyvZKQCODKNDaGAOAfQLV4rrhAdaB?=
 =?iso-8859-1?Q?NtZLFKOkKKkDpVv4O6726mTlZQyATBpilSeA2S9cYntQO+A4x6irp8fOfP?=
 =?iso-8859-1?Q?usVhoFTfMEIbOCV0ClVRJakAvw33rHr4LO1o6W+lW1wDIoxGDs7KjhhSoa?=
 =?iso-8859-1?Q?djGTY/pJit+mshX0Q38MZyPtKO5tGKMQYKUNifiNvfSmdhcP1Bbj2A6yH2?=
 =?iso-8859-1?Q?yHp75aLPQaIDvE4VB0ZbwVshb4/l9xU/axMV5/bOld5fKYoufBhLb2f6dg?=
 =?iso-8859-1?Q?Cw2IoRbhAS4P1UZfl/YjL1EmYgi0qcFRVGNLXKG8ANo06hyLlWYgNJsxfG?=
 =?iso-8859-1?Q?ynOhKPkuI7S4BhIS2ynrbC3qNeWHFKVsdqxH9sggUPOZFziMmkFAMgT/1B?=
 =?iso-8859-1?Q?rqF6oGQ1Qeos9X9dAmYhGdjX7RI6hLFhCMYXNOPpXjx/IQSi5gBGSGenzY?=
 =?iso-8859-1?Q?l/7nIJVjZ2h33TgoSEpNFToYtaTBxm4V3+PzrVEEyo4Yy6Y703gC+5XT3L?=
 =?iso-8859-1?Q?D832JkikMID6kbHI6o82Yg2dSz//4k8tk4UFB1ftjV28ounWHPC2eFk2gN?=
 =?iso-8859-1?Q?An2yBK7pSVDgfl2FYKnkQSVF2MJL8il+9Oqz2JpUKzVV8DA204FPZybBlE?=
 =?iso-8859-1?Q?unoyE5FrTNL7r7CP39GzToUsprNlwwh8sCkcRaIhi882s8iYtiaEMKmOnw?=
 =?iso-8859-1?Q?y/SqIz4L8bgg1Hdv0l8T/7ppQ3Scz16WGHUHGSwci/VxnBSg2axe4ATJol?=
 =?iso-8859-1?Q?VrgEWBPmhs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+MgsJuED7KiEHsXCdXm9i93dVeVRWligQ8GV86oZfjIDVutMJMG9fCr5R0?=
 =?iso-8859-1?Q?nuNLqKFkue8uv3tDAE54JNCKHFrdy3l2Zbr2NOzruPzKmmiUx6PwjghB2+?=
 =?iso-8859-1?Q?KS4CeWpuWpx05Vby0DExN3pxNSlPK5CJZChM2Q/pKTwq8rAUBNod4Txzej?=
 =?iso-8859-1?Q?vO8ydpRw9XwNGMhnkGVMZPS8iO9j2o5OyxzA9CKUpthedAilwoeUsf+8d7?=
 =?iso-8859-1?Q?BDLCH5hZNmBn4hRqN3vsstRMiopIuPnfecpP4Pdb1BQQ7rMZynFpN9cmxL?=
 =?iso-8859-1?Q?leR0BIrlQZ1SkyoXT8Mrk1hTgLQ7O2mbbrvLZfxKnNZoq5ddXur0wby0fs?=
 =?iso-8859-1?Q?QMiDyMIgdn1+hEFvGivLCo50tJ1bA7AwOW31sNbACXiOAqVmXMI5dcBasK?=
 =?iso-8859-1?Q?03XHfhmydhlg4JfBv90iUTFK846RKIBYv/3iND4HFyDOiVUi1IiqBupipF?=
 =?iso-8859-1?Q?iWnaQBclVpj1HPjA8/2WGN97gwy7tbmfEdUksvXkkeajikcqNmd0QNoS49?=
 =?iso-8859-1?Q?Adfq6NXY2F9u7wsAmlpPR6is06UT1PqOk1mw8I74cMOxw6ph4kwdzxq8uf?=
 =?iso-8859-1?Q?OqDZqJcUzOeOxrRGcvMJ60f5ftMdWaSyX8G4QP782oUc9kbWhqR7FOgzvG?=
 =?iso-8859-1?Q?ROWcshbp9jeWLVyj2s6MPonCgJkufb/2Y22PtTPWCfi1bFHK8K/bMB1oX7?=
 =?iso-8859-1?Q?5EVXMmtjIyKOoYULnPipPWV8mSJqPHpaw+V1wwFQ5XzbkVcldMmHCgqr59?=
 =?iso-8859-1?Q?G5I/0zqC4MdCduJ2FE2Z+29HDVM+XyC9BLHb/jtqM+QplZSpHrKZlt88FL?=
 =?iso-8859-1?Q?JwuVp0+X9SKJevevyH4OceSznMMHezwgDOOCkue9nwWBk6pDOQwlFbTyP2?=
 =?iso-8859-1?Q?x2z7jPTXcZP9YPGb6e/5UqNWFljKLT32DLqVrcjekUtJiD1J4CfhwBKuzi?=
 =?iso-8859-1?Q?aSMwOP+aEmEHWKB6UdtnIs9Y8+tN0yWiTUH8V7mG0YvfhLkWUagPGwcJFf?=
 =?iso-8859-1?Q?+DHclPKxVr4ZyB2o0US14pDcqBJJadikKKkqMjoiFuuQekDx/7BVGN6eIn?=
 =?iso-8859-1?Q?HdOZ+PtwjnYY+fG7SP/6l/kKfARS1vurSyapHwyIGHWgmpGso79BWjpcPx?=
 =?iso-8859-1?Q?s7vahXtGJwnFBzMts8YR7Ovyca/vSanGheRKKit/mhqexpA2YNrZ4fQYCE?=
 =?iso-8859-1?Q?5CjBTunBwPfzDO+s4eX74I78WjT2O31qwk+yeyaswZhFCkMGVfZ/HkW+A8?=
 =?iso-8859-1?Q?3cg174sqHRKoHL8g5ZbgdNBGNPAoz10Sw3ukGkyJdETwcNNX07y3K7kivO?=
 =?iso-8859-1?Q?0Yzwf30saIwTzqE6BuSJk4a9nYGCkS0qXyK9CeLbNdBx7rh62UVFXL+H/T?=
 =?iso-8859-1?Q?Td9gEgzC48k3Hycyze6K4cau8wyx6zzUyBCBtjbvnN+UbUfFiwrUZX3yCW?=
 =?iso-8859-1?Q?WFw5BUYYMyaC7YYGwp9aJ1xW/MU1vKnverDhFsfxZnGOLuE/furQcznKN1?=
 =?iso-8859-1?Q?OwQqa/iG5BWoIhE9owNrf1XtF9AvgXOCbklTEyKBsfVgJ7LPBWgvu55VNA?=
 =?iso-8859-1?Q?+HrmWS+tcyWmyLBGAIO/t2+zQHzcAEW5wcUi1wqFCti1Ey4KHphrYzxBJj?=
 =?iso-8859-1?Q?tBgXT1ImSBCbvn1znj8cFBrdxi3Vzr5Sb0RkHHo1eOi5+ORxe1AhtyLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 244b9c6c-428c-4669-080a-08dc9495e144
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 21:37:43.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehhF2CWzo2ND1O4Oe4+lqu25DZJuDD1cQcSts56Emd9hhTJWzM2lCwWtNwLvsZFXwLx5fCeGkwB8vpQKKsf0vBYFSLzsAX/aYz9Mzwim8Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

On Wed, Jun 19, 2024 at 06:39:04PM +0200, Thomas Hellström wrote:
> The caching mode for buffer objects with VRAM as a possible
> placement was forced to write-combined, regardless of placement.
> 
> However, write-combined system memory is expensive to allocate and
> even though it is pooled, the pool is expensive to shrink, since
> it involves global CPU TLB flushes.
> 
> Moreover write-combined system memory from TTM is only reliably
> available on x86 and DGFX doesn't have an x86 restriction.
> 
> So regardless of the cpu caching mode selected for a bo,
> internally use write-back caching mode for system memory on DGFX.
> 
> Coherency is maintained, but user-space clients may perceive a
> difference in cpu access speeds.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 47 +++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 +-
>  include/uapi/drm/xe_drm.h        |  8 +++++-
>  3 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 65c696966e96..31192d983d9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -343,7 +343,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_ttm_tt *tt;
>  	unsigned long extra_pages;
> -	enum ttm_caching caching;
> +	enum ttm_caching caching = ttm_cached;
>  	int err;
>  
>  	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> @@ -357,26 +357,35 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>  					   PAGE_SIZE);
>  
> -	switch (bo->cpu_caching) {
> -	case DRM_XE_GEM_CPU_CACHING_WC:
> -		caching = ttm_write_combined;
> -		break;
> -	default:
> -		caching = ttm_cached;
> -		break;
> -	}
> -
> -	WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
> -
>  	/*
> -	 * Display scanout is always non-coherent with the CPU cache.
> -	 *
> -	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
> -	 * require a CPU:WC mapping.
> +	 * DGFX system memory is always WB / ttm_cached, since
> +	 * other caching modes are only supported on x86. DGFX
> +	 * GPU system memory accesses are always coherent with the
> +	 * CPU.
>  	 */
> -	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> -	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
> -		caching = ttm_write_combined;
> +	if (!IS_DGFX(xe)) {
> +		switch (bo->cpu_caching) {
> +		case DRM_XE_GEM_CPU_CACHING_WC:
> +			caching = ttm_write_combined;
> +			break;
> +		default:
> +			caching = ttm_cached;
> +			break;
> +		}
> +
> +		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
> +
> +		/*
> +		 * Display scanout is always non-coherent with the CPU cache.
> +		 *
> +		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
> +		 * non-coherent and require a CPU:WC mapping.
> +		 */
> +		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> +		    (xe->info.graphics_verx100 >= 1270 &&
> +		     bo->flags & XE_BO_FLAG_PAGETABLE))
> +			caching = ttm_write_combined;
> +	}
>  
>  	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 86422e113d39..10450f1fbbde 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -66,7 +66,8 @@ struct xe_bo {
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> -	 * objects.
> +	 * objects. Exceptions are system memory on DGFX, which is always
> +	 * WB.
>  	 */
>  	u16 cpu_caching;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 93e00be44b2d..1189b3044723 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -783,7 +783,13 @@ struct drm_xe_gem_create {
>  #define DRM_XE_GEM_CPU_CACHING_WC                      2
>  	/**
>  	 * @cpu_caching: The CPU caching mode to select for this object. If
> -	 * mmaping the object the mode selected here will also be used.
> +	 * mmaping the object the mode selected here will also be used. The
> +	 * exception is when mapping system memory (including evicted
> +	 * system memory) on discrete GPUs. The caching mode selected will

Was this supposed to say "including evicted vram?"


Matt

> +	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
> +	 * between GPU- and CPU is guaranteed. The caching mode of
> +	 * existing CPU-mappings will be updated transparently to
> +	 * user-space clients.
>  	 */
>  	__u16 cpu_caching;
>  	/** @pad: MBZ */
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
