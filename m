Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9DB05D35
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3394010E5C9;
	Tue, 15 Jul 2025 13:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKCpuzu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9F10E37B;
 Tue, 15 Jul 2025 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752586935; x=1784122935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ams39bzue8uDbk2vwZqN6w4UfLgF5VEaeHLBEOvrGko=;
 b=PKCpuzu/VpL4F7YSl2IkAAzKIC5ZNuZ314Khr2pndFssgvFhqEafFN2S
 LVb0XxBYIP54g6U9xGgtJnyGlj+tsVa/SqMjeHNC91phkU2irWrSRgq61
 KSNIwjXZvmaTxjnd6xan2VowTr9DNEitFNr8RYU3fp25I8WEBIQNM4HXB
 +8dkHhkFTwqXin7OkKXrFQfUTQQiL/tze8vUhMT3srFjLuuMnf44tEy06
 lww2VQV4tOTEieRpXLTKLbn8V6hnv3b43ltYNkr2nXuMeGyF3PFW+nCtM
 V8Fmy0ENLXsDgv6yDuQXe2385LdmSdh3iyAoLYPvjLhLOVemciJqEldyH g==;
X-CSE-ConnectionGUID: JoYfQf1HSLyvwguTYcY4wQ==
X-CSE-MsgGUID: VGU4UZGDR9iPSTNlf169IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58462108"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="58462108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:42:14 -0700
X-CSE-ConnectionGUID: iHom+LjzQVWqeZwVRD0c7Q==
X-CSE-MsgGUID: La+VCTzUTQuSLRYuV9evOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="180928654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:42:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 06:42:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 06:42:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 06:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX1z5OHYzMRuW/8pipJo9GdpdQ4TyuHrKa36cvyQ5do+BCZr9WNu62myUMDEyUGt39ZvjFvxXC3OvVwxWwSCPJs9A5Jd3n510W4EZ+c6+Dsn0KR41V0rtnmeGc3AugxO3+toyYpZIriJSH2ihhwnSIQGvnxEYGWPOnGVXFz1m8OM+ncXAg6PXiDe772edfcIQHkNMzcGv0tlEdvt+Y8kH1nWsD1yObYEec9LQ1KRjx7vK2NdBe7pDgI1Xe/6wlCcO31nrRqhfR5FqZIDS0zCNjeLYpyhRWyoyLZL/k2qpZHAqVm6GHTESun9jqS3dhYRCTHHVvZlmyqIajDODPTV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00vcCzFuqtdMofONVatUU+BOM+/VPMlG3nOUho7VsAU=;
 b=C+0gsTxRR7yRPSA5SjzNp4V0FXYxmPVXipYcwVBKYRYVpz53hM9loTq015WQNrG/vaxDZdoizoxL1FSzFJOI38dYSB8q+3L+oDSoZJUo5gQ14z2mmcvtIIexR/njdd3+rrc0QxY8dkqeHhF+jzh4T5mo/6hEEDbXJE9HfIhoDaSl9Z4ZLyyd0mzk1NAVUU7lcZgC2tSTq80Nn8Fz6htVuhCLZPRPlHUySpEySOW0uieRl7Vx/PzPNLPQcva9ai/gG4jcIaWiCd2Bwmfvd0CP6XukIPE7GWqEL2Xbu5TdFj3GV9sbxtE/X+YuYYKOxEHfcaCoYPh10vqtu/R3Gcx4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 13:42:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 13:42:06 +0000
Date: Tue, 15 Jul 2025 09:42:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>, "Jonathan
 Cavitt" <jonathan.cavitt@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aHZaqpX3z0z6eE-W@intel.com>
References: <20250708212331.112898-1-imre.deak@intel.com>
 <aG-j3NuvQCwLJKCO@ideak-desk> <aHTGkoRydum652gC@ideak-desk>
 <6588c619-01b6-4df5-9cc1-27a96efb76bf@suse.de>
 <aHVjXHZ6xe4WHTJI@ideak-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHVjXHZ6xe4WHTJI@ideak-desk>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c92e118-5a29-4f3b-f7d8-08ddc3a56353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BsivTg0geUjvDgRItKCq/iGpZ9SnBOPuuYcStqK1CY3yMQfVkZD1R73rCB?=
 =?iso-8859-1?Q?RSTHTwH/wm3j+WC4I8r0ZJooDG5UVJuoHj17eXtsdCuSEHvXvieZ+tNdGR?=
 =?iso-8859-1?Q?xlBg/fv4r/MwZo03Tu8/KJAT7QpTcWk2K0GXxOFyZlCgnwAzw6FwC1hno4?=
 =?iso-8859-1?Q?WyWMW1ZTtIQbXjNk281xXHR6YGGfAzgclXtqh9XIlRfGL6TiBXnr7f2RZD?=
 =?iso-8859-1?Q?2V/og4UeZhFW57RF0PnrnUKl2VGR94uxd+y6x6V0h/G0qeSK3463XwBGn0?=
 =?iso-8859-1?Q?hhiMmcOlVRShbIxtMqOvvI3zWfKhbpaUWmOj63lcOuuIJNn4T4CukxrPx9?=
 =?iso-8859-1?Q?k7YY2u/WbHmxJPSVMSuICuzpadqS+u6gRcVE5NHGyqa/33F4YuarPN+I6W?=
 =?iso-8859-1?Q?9FQmQ8eT9D4ahDZBsN37tYRaECxaMBzxTuyU8jZ9lhzhxXMcO57CbyrHlc?=
 =?iso-8859-1?Q?+9pQn05Fis28MdgZjz4wNzwd36z8eEdqG1KPIz0lzlFqPj4AVmG68WiX8J?=
 =?iso-8859-1?Q?X6bwYR8n7hh2y5xd1ZvNEhpyDWmQqlbT3xPcmtlK++ulqFERvEc+zfiOov?=
 =?iso-8859-1?Q?TjXyYPsQhYS+ajEUnoW06NVA+gtlmXj6NbqoDeIncQL8gxaCZOMqAri3yN?=
 =?iso-8859-1?Q?RKRjM5K/yMzAG2fnbt0oysZKr7pocBZwbvUcYFRUYBIH57Wic82pDnLKXO?=
 =?iso-8859-1?Q?Ts/X7UE1OfqciG5S++RIGOm6RlksJzQorXqi2Z3YzsPcLtUSsiaxSFQwCq?=
 =?iso-8859-1?Q?cRf0w8rNuAmnz2pJB1VYMiKHc/+3VNiz2UOmygK5im5O3mS51T6aqh1ua0?=
 =?iso-8859-1?Q?IeKb5I6wQbziK2xEJxaCl4nP1tFgB2FjNgVB6lBQZfsUvVETAW2AGxEqbm?=
 =?iso-8859-1?Q?TWaHrTpqJAS2PVW9aWZhY67/OFg9NnjHGKTGhD0pIYj42Tix79oFZGfQSJ?=
 =?iso-8859-1?Q?ZZQ7LxqeP4w7VOvJXvKlx1eFdVc8lRk2mk12JGKCcLQav4nM+p9zl2iJa1?=
 =?iso-8859-1?Q?HB5Con3U2i4hNRDDQsmiahFoTUqAycc/jZS4bAG0waW9bkE5Gixj6pERtL?=
 =?iso-8859-1?Q?A2iKFQvpI2wNd2RP+OZQzTNBdag5jxrZ8K0kihy7XmhPG9XAHjtzxhwvCJ?=
 =?iso-8859-1?Q?uRHdfE5SscnfIb/E4DyPZT1Fb20R5sFdzyEkUuPCBiUcR/UGCf8DaUA95Z?=
 =?iso-8859-1?Q?vQ0MccQmKk6OMSjPCaCYgb1DD9hh17Cwkak8DbC5/AqiHWFIciqyvgYOnV?=
 =?iso-8859-1?Q?o6fU5joQdWqKyf+XE+sBy5K4QgJyVHjzadtQ5+R5y3LzWfAp89DdROlJAX?=
 =?iso-8859-1?Q?BcZDBJdnbw1BgMtjDHgrUB/lB77aVmmjKgeexz9JGe+VHTjKohjve6vOUD?=
 =?iso-8859-1?Q?DKMUgk++dTlxhe5iOyJnfMADI7DE3tMV/1Fj9Q2gwlojQgDpedTR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?i4oMC3O99spl9L6K16z0OD7IOeuKJxKjNxHNzxowZUCr9QBWdO4xOU8Umm?=
 =?iso-8859-1?Q?7FMn3QNEug9cE6I1kS/l3ktM4T3nuNA4jXiUPse6K4ca1OWzU7IezIzqZN?=
 =?iso-8859-1?Q?1QpCjfJnIDYQUv/fH3ix7KMB5L08xpoLPB/h5hGAt47whtLa5ALsXc5UJc?=
 =?iso-8859-1?Q?XLhnNaDK2KQJVyP/mS1OlzX8Yx0xCWIv4IrPODUbeV+sHDCQmzkxUCvlQ5?=
 =?iso-8859-1?Q?yaCLOQDJkvxJ9XXSU7rcY+DJJjKoUmws4MSHr29PNxGi6bbL+081Po2/NL?=
 =?iso-8859-1?Q?XyZhD5Kyiq/e8UKYOUhrxuZMtXnb150TlcMDcf112nkyNAe3vjncLpprHL?=
 =?iso-8859-1?Q?bqxW6v18eJnm//8XQAAk5qNpbZNCXEsc1EVZiwExhef5qBBjkpNd5Dvbxo?=
 =?iso-8859-1?Q?CR3SJk8kJzG6QTl5xj8plbxmUVZuTBuQwXr2/F8n08aAo/pcvCcf+2tXdd?=
 =?iso-8859-1?Q?N/8H2zBrhK315YEzjEsKiqTwP3b+6TInYMG4F+10+9q6ma3XfskISWffHE?=
 =?iso-8859-1?Q?Dik1QsX8mT7h+fzCltaRtyWiMNL3f+1XhCxijjjaA1tIjc++eFZQxZ/Q2H?=
 =?iso-8859-1?Q?oLYfFlGf9BuqFYt1zsaZth9A8cz7vAFNx5zdpeigzJigK8q9wNd3m6+4OY?=
 =?iso-8859-1?Q?V/60GZS2RBU9ztldzFc7rZuwZ5Yee3LyB0F3ksTrG6CVtWbyP3oK+vjzq1?=
 =?iso-8859-1?Q?17TTV9FOCHuJgS75sBXUTufRcPWSucGA/XAHnDt5fsCyBbnKFSyu6Zi0xj?=
 =?iso-8859-1?Q?5Kwa+ZYN6cg7LuqN7UxndlyqK0Y2jfDZyymO37Ft0CHrMigySNgIET6euI?=
 =?iso-8859-1?Q?35jto24HpnH7R4k1+raXbPWxKBDKEtxf2P7CCA1kGB3MWgDZbvK4VBPoiN?=
 =?iso-8859-1?Q?E/HjakjEFZOKb06rWMYI9wkYII8BYpp03QPJAI8QpWblGZtrCSoW86+xUZ?=
 =?iso-8859-1?Q?vxYjvY3EuChNZ/GN2lkbkKmPIRD7IKwv75X4sfN69suNUNw+oKDXgMLF52?=
 =?iso-8859-1?Q?s51sh52tohyIU/atre+wMLf7/tb78JF3EfKb4qPMUraUbpeh3Or9dHlThg?=
 =?iso-8859-1?Q?Cxra9jm2SYMGH93yzazcuyaaj/KyYqD8jlHuK0DzXX39NBkmXJStJxtgfA?=
 =?iso-8859-1?Q?93UI/1qBIk7HnQb3Hc/eHn5JZ+Bb8JuwUeBd5BJtWZMAc+iXz0104jHq3A?=
 =?iso-8859-1?Q?ZIk3Qvq1HVLTwt9c+2gSrigrshm45OTZe2jtgP9NylHtpfQA+uybXRe5J2?=
 =?iso-8859-1?Q?ysSQWW2UD6PLUUGcNzupRrf8AOqvPaJ3ACin2rqklyTnIqd+mDEcI0lgvV?=
 =?iso-8859-1?Q?vlYbc2W2ycwCOmEWvdiT2H15//iCJGVDweqUw1jUuLi2P9OgGv/n3UPY7u?=
 =?iso-8859-1?Q?Z7AX3k2YasztoYKgXS5GBOAUb/d36DL3Lyx4kjeovYsVJ5bTNvd1MN1i+c?=
 =?iso-8859-1?Q?/XkUzpEQoLD1M0sIOTseZALRypIQ+B9ITBqXR02VAIs0HpAysK2fQfVXk/?=
 =?iso-8859-1?Q?Q96zKFaDA/K+KufqxRAkisdNiJ8H+Ecpqg9PB0HZxzTPf9NzEvYZhDkTzW?=
 =?iso-8859-1?Q?+Affz/rh0slwiO7in/DgwBQjnx6sYAc8gWVzugdpohmlYBZl+HFbvYoUv3?=
 =?iso-8859-1?Q?AWqj+ljLBPLJsHOqNlcqjfuZP73iwSrntw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c92e118-5a29-4f3b-f7d8-08ddc3a56353
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 13:42:06.2174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxYliW8i8xBgI/O/fgpmVs32yJHjOGZaXoXldnMDrH3AfDahYs7oW0ENMEQJWmFW925qziP44b+5u2tP8MJEiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
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

On Mon, Jul 14, 2025 at 11:06:52PM +0300, Imre Deak wrote:
> On Mon, Jul 14, 2025 at 11:00:08AM +0200, Thomas Zimmermann wrote:
> > 
> > Am 14.07.25 um 10:57 schrieb Imre Deak:
> > > Hi,
> > > 
> > > On Thu, Jul 10, 2025 at 02:28:28PM +0300, Imre Deak wrote:
> > > > Hi Thomas, Maxime, Maarten,
> > > > 
> > > > the patch this change fixes (commit a40c5d727b81) was merged via
> > > > drm-intel and is also part of v6.16-rc4 (there cherry-picked in commit
> > > > a3ef3c2da675).
> > > > 
> > > > Are you ok with merging this fix via drm-intel as well, so that it could
> > > > be still merged to v6.16 before that's released?
> > > any objections to merging this patch to drm-intel? If not, could someone
> > > ack it?
> > 
> > Sure, a-b me.
> 
> Ok, thanks.
> 
> I pushed the patch to drm-intel-next, thanks for the report, testing,
> review and ack.
> 
> I'd like to request that this patch be applied to drm-intel-fixes as
> well, so that it can still make it to v6.16. To do that, the change
> needs to be rebased on drm-intel-fixes, I attached the corresponding
> patch.

pushed to drm-intel-fixes. Thanks for the backport

> 
> Thanks,
> Imre
> 
> > Best regards
> > Thomas
> > 
> > > 
> > > Thanks,
> > > Imre
> > > 
> > > > Thanks,
> > > > Imre
> > > > 
> > > > On Wed, Jul 09, 2025 at 12:23:31AM +0300, Imre Deak wrote:
> > > > > Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> > > > > DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> > > > > DPCD probing, since this results in link training failures at least when
> > > > > using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> > > > > DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> > > > > link training). Since accessing DPCD_REV during link training is
> > > > > prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> > > > > as it falls within the Standard's valid register address range
> > > > > (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> > > > > training on the above TBT hub.
> > > > > 
> > > > > However, reading the LANE0_1_STATUS register also has a side-effect at
> > > > > least on a Novatek eDP panel, as reported on the Closes: link below,
> > > > > resulting in screen flickering on that panel. One clear side-effect when
> > > > > doing the 1-byte probe reads from LANE0_1_STATUS during link training
> > > > > before reading out the full 6 byte link status starting at the same
> > > > > address is that the panel will report the link training as completed
> > > > > with voltage swing 0. This is different from the normal, flicker-free
> > > > > scenario when no DPCD probing is done, the panel reporting the link
> > > > > training complete with voltage swing 2.
> > > > > 
> > > > > Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> > > > > the above side-effect, the panel will link train with voltage swing 2 as
> > > > > expected and it will stay flicker-free. This register is also in the
> > > > > above valid register range and is unlikely to have a side-effect as that
> > > > > of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> > > > > CR/EQ sequences and so it may cause a state change in the sink - even if
> > > > > inadvertently as I suspect in the case of the above Novatek panel. As
> > > > > opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> > > > > training sequence (it must be only written once at the beginning of the
> > > > > CR/EQ sequences), so it's unlikely to cause any state change in the
> > > > > sink.
> > > > > 
> > > > > As a side-note, this Novatek panel also lacks support for TPS3, while
> > > > > claiming support for HBR2, which violates the DP Standard (the Standard
> > > > > mandating TPS3 for HBR2).
> > > > > 
> > > > > Besides the Novatek panel (PSR 1), which this change fixes, I also
> > > > > verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> > > > > panel as well as on the Intel Barlow Ridge TBT hub.
> > > > > 
> > > > > Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> > > > > i915 and xe drivers keep DPCD probing enabled only for the panel known
> > > > > to require this (HP ZR24w), hence those drivers in drm-tip are not
> > > > > affected by the above problem.
> > > > > 
> > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > > Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> > > > > Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > index 1c3920297906b..1ecc3df7e3167 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > > @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> > > > >   	int ret;
> > > > >   	if (dpcd_access_needs_probe(aux)) {
> > > > > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > > > > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> > > > >   		if (ret < 0)
> > > > >   			return ret;
> > > > >   	}
> > > > > -- 
> > > > > 2.44.2
> > > > > 
> > 
> > -- 
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> > 

> From d468740cb8688070ebbd534c2849b49729ae2af8 Mon Sep 17 00:00:00 2001
> From: Imre Deak <imre.deak@intel.com>
> Date: Wed, 9 Jul 2025 00:23:31 +0300
> Subject: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to
>  TRAINING_PATTERN_SET
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> DPCD probing, since this results in link training failures at least when
> using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> link training). Since accessing DPCD_REV during link training is
> prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> as it falls within the Standard's valid register address range
> (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> training on the above TBT hub.
> 
> However, reading the LANE0_1_STATUS register also has a side-effect at
> least on a Novatek eDP panel, as reported on the Closes: link below,
> resulting in screen flickering on that panel. One clear side-effect when
> doing the 1-byte probe reads from LANE0_1_STATUS during link training
> before reading out the full 6 byte link status starting at the same
> address is that the panel will report the link training as completed
> with voltage swing 0. This is different from the normal, flicker-free
> scenario when no DPCD probing is done, the panel reporting the link
> training complete with voltage swing 2.
> 
> Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> the above side-effect, the panel will link train with voltage swing 2 as
> expected and it will stay flicker-free. This register is also in the
> above valid register range and is unlikely to have a side-effect as that
> of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> CR/EQ sequences and so it may cause a state change in the sink - even if
> inadvertently as I suspect in the case of the above Novatek panel. As
> opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> training sequence (it must be only written once at the beginning of the
> CR/EQ sequences), so it's unlikely to cause any state change in the
> sink.
> 
> As a side-note, this Novatek panel also lacks support for TPS3, while
> claiming support for HBR2, which violates the DP Standard (the Standard
> mandating TPS3 for HBR2).
> 
> Besides the Novatek panel (PSR 1), which this change fixes, I also
> verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> panel as well as on the Intel Barlow Ridge TBT hub.
> 
> Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> i915 and xe drivers keep DPCD probing enabled only for the panel known
> to require this (HP ZR24w), hence those drivers in drm-tip are not
> affected by the above problem.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/r/20250708212331.112898-1-imre.deak@intel.com
> (cherry picked from commit bba9aa41654036534d86b198f5647a9ce15ebd7f)
> [Imre: Rebased on drm-intel-fixes]
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index dc622c78db9d..ea78c6c8ca7a 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  	 * monitor doesn't power down exactly after the throw away read.
>  	 */
>  	if (!aux->is_remote) {
> -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
>  		if (ret < 0)
>  			return ret;
>  	}
> -- 
> 2.44.2
> 

