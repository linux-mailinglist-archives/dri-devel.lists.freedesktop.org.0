Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB28B48643
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40BF10E1FB;
	Mon,  8 Sep 2025 08:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2jxrkRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2A510E1FB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757318483; x=1788854483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7FGOzdemfV4mExseEvjve5SA67UfVh39yNPH385jsus=;
 b=F2jxrkRqOy84/39g7mG85ZH8xPIgu+LvWEAlmAS6CmyJAph9TcKb6XE/
 lcEeTziOt7tSyAB+07xyoInnRjAmZclRerY453SB2smrnrKtIjNyfsCG+
 11vFrr3wHLNmx6W4y2eSc4DXQHJLc+oP23VQuXMeXHgEivw0MNOq1eP7Q
 9pNyPxgG2MqoxJtlGjTO5xQ6K7vVLqhxEllpBFQT73XsUpxWVtT4SR8iw
 S3C6bI3TiUkVgLi9bcai99w7izZmvFHoERQj55KdpKOSSWNRVF5xOnbdg
 5uqYQHUIgdV/+vBIi/uJub0Xdql29mbXECXtSNsUzO0K3goQevo5Wl2ka A==;
X-CSE-ConnectionGUID: Z9k9ptTgQa2PskEPIwd7kQ==
X-CSE-MsgGUID: 9GQSu3/NSF+C0zQeDoGnaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="77186202"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="77186202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 01:01:14 -0700
X-CSE-ConnectionGUID: IR08uNglRo2vkrwtiZxLvQ==
X-CSE-MsgGUID: 7ehUL1jjQmekRufsBelSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="172595867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 01:01:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:01:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 01:01:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:01:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJnGhFn0uczl75Ajhn1bLqB7bQedGyCSTaFF4zP9N994QkXZg4+cqJyoUNxSEhu99B+jmWUXMlab5zsftiARqCQqLKBLEMfHMBkaJvZOZYJagpqXvIZLJhs94rfD+ht6rB7EUFSqORXkCe5+k0GGDWqY1pux1+d2FylSrBYlexYCpkOehF85yZMHA5BfWsK+Ssu9q/A8vAx1/l76uWSTJW0IuwUqPAyCf2hNce5d8dRY91n2gPC0z33JAYVj/ZzziUQWOuGX8gNUm/K3YBi+8VjvXqkICAfXiivU3YB+IzHIZ6+l1an6/qoR12h2Sj0bH6UAAUIcPgnnKdWkLeBODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FGOzdemfV4mExseEvjve5SA67UfVh39yNPH385jsus=;
 b=NDbgK8jQvGJuD1PJcGW0FLvsvAV8qxcaG7IbiMiLeB9qidlv/5mVqnxQhkyeHuizuTA4L5+RyFq1DSvVRc9+Dhaz0A/pTPF3ICEiOO3W6CjG+jngI6QyjE/K67B5IEMcbw4JZcY8KqAd4n7+V/ZmWZ3vZEevzcZJZlvW2Ea+hG91bESRHjPQjdF6YmFh9zK6AnSp0m15tpQ79gm7C57NljRkpBSUX8B5afBc1HA8wTE4IDsscROob4TTT28h+THW0ee8Kmo8npbgSs+Aj/dl+jUxheusTFvEeQSL+mAWcLdv1YdXQsI6PvdCaD/sMklAoih0zE7oystXAfC0d+RD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 08:01:09 +0000
Received: from IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::7fcb:5ca0:942b:bfb3]) by IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::7fcb:5ca0:942b:bfb3%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 08:01:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: chelsy ratnawat <chelsyratnawat2001@gmail.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix logically dead code
Thread-Topic: [PATCH] drm/amdgpu: fix logically dead code
Thread-Index: AQHcH3HeoZ59KgrjP0m/3ZZbhcpGZrSIr2FAgAAg3wCAAB3DkA==
Date: Mon, 8 Sep 2025 08:01:09 +0000
Message-ID: <IA3PR11MB8937348831C8129D295DF5D0E30CA@IA3PR11MB8937.namprd11.prod.outlook.com>
References: <20250906210412.39904-1-chelsyratnawat2001@gmail.com>
 <DM3PPF208195D8D439BD3D6D24A2E912932E30CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <CAOeBcHM27XOBow+eshY71VTTtma=H7dQfRoHvQFwESkT5dFfpA@mail.gmail.com>
In-Reply-To: <CAOeBcHM27XOBow+eshY71VTTtma=H7dQfRoHvQFwESkT5dFfpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8937:EE_|SA1PR11MB8859:EE_
x-ms-office365-filtering-correlation-id: a9854d3e-bd13-456d-7edf-08ddeeaddefb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yms2d0VaZVRicFlTN1JpR2RSUnZaaHoyeHAram1Jc200U2ZGTElqY1dVcC9o?=
 =?utf-8?B?M3FCMytKUmt5V2JYV2RLR1FDZ1gzb3JlUUp1U0lGdG50dmtlYzJQWWFNMmYr?=
 =?utf-8?B?UFR1T2lkb1NPTmtxOFM2SjZ5bUhPdzQxNTNJcDdlZm5mWi9wekFxeWVla253?=
 =?utf-8?B?ejFSMXhyWC9hT1FuVGZlcWtGU3BVU3VtUW16NE5YaXc2L1haTmR4S0R6c1VH?=
 =?utf-8?B?b0lDTmk5VmRLZnBrRHQyTFBkZjI0VFNSNThpcG5mM2g3WXBuc2MyT0Zuc3gz?=
 =?utf-8?B?amI5OWVJeXFwRTIweHQ1M3YyanU1bWk1Y1ZBenB0VUpwaGxIZFgzN1J4WjZt?=
 =?utf-8?B?U3I3VlN0TFV5Y08wdkhMRHdsaEU2WEdkZ09LajNadHF5c1pWMGdiSjZxWTJH?=
 =?utf-8?B?aDhRM3JLcGFNcUN4bmhCMmF0SmpSc04xSEJmd2t6Y3JvZE9HS1ZSZ2RJWjFG?=
 =?utf-8?B?R0I5NkxMSnYrdWpWR28raFcvWTNMZ2s2d2RZVGhSbFdORTVZbjVYUFRwZ2d5?=
 =?utf-8?B?bHdHNkVTZEM3aFpWamNGQ2tZeEszMm90dnVqMU5NcmlKT0M5eWR2Q3E4NFgz?=
 =?utf-8?B?SlJtV0RLbFNBVk1GWjdRNXZVS1FoS012eVpVNWF0YUg1QlpYdFFRY2d3UTdq?=
 =?utf-8?B?OEVIZDMvQjdXQ0R5YXZnNjQ3YUZZVjdESDk5aWlSUnBJbTk0UzdQVS9oMGpR?=
 =?utf-8?B?Wlp5VWFrTmtJcDJTQnBzN3RrMXdqK2x1ejVkcHNlcWUycGVIRmVTdUlTRW50?=
 =?utf-8?B?ay9VcDVJcTJoK3IwUlkyNEhXNUNvQW1nY1BGQVQzQmE1MnNkVW4yQWpncUor?=
 =?utf-8?B?Y25WQ245WHRJb0gwNEpZRmZDWEdRSU9OTnFaeUx5TGdRdDFFeVl5WGFDOWcv?=
 =?utf-8?B?ZFp3M24xUmtEUnFJYjlCV0lsU2tqTTJZSWRmdGNZd3dVWm9LVnlMaGZMeTN1?=
 =?utf-8?B?Z0F1MWkxL3VJMmVmRytZeEhwK3lSZHROSThQV25mNVNYd0YwT2pneG9YdUFo?=
 =?utf-8?B?S1dFOUswUC9rZkQvbDdMZStFejJ4VUovZmNtbFEzajNuT3Z5WlprUDM5SmN3?=
 =?utf-8?B?cjBTNDk5WDZ1YXFFZklMOCtrRjlKdE1FRjE0VzQ0L3RnZGthdmw3UnZReTRY?=
 =?utf-8?B?NHgwS3pJV1RmNGFjOHlpR24zNWRDRzJYRUhVK0RVbXk5RkJHQzNLay9rVUsz?=
 =?utf-8?B?ZzVNS1ZyMmV2SWFRV2Q1K3pJRG95Rkt0MDJWUzhCdE5jWEpBeW9OQ05FS2Jr?=
 =?utf-8?B?cElFMmxud0Z1SGxMSXU4eGh2RVhiNzJXRStVRzJRazhBZFpubEV1LzBaVnM3?=
 =?utf-8?B?RFliWkxJZU9pQWx1L1E2OUNQWS9sck1GTEZrN1JYV1R5Mzg1M3NMaUFrRGRk?=
 =?utf-8?B?QU1pKzJGdGwvcGZ4bXF0d0NnOXBWaHA5UW9lbmp5aXpSYWFtQTRIcUZvL1ZZ?=
 =?utf-8?B?Z3doL3NwMlhCZmZOVDVNNjVQMkYvb1YrcUZZbjVqNExNd3paNU92VzM5SEll?=
 =?utf-8?B?MmpuNUQ0OXdBcWVLOXdrdHhzdFVUVWRscHptSEJWQXhsVHU4YVgyVE5XMUxp?=
 =?utf-8?B?eGZ6SjFBVzlWQkNsMUdTNERVUmR3RXAyaHNZQ1JEK29pdCs5Q1VNQldrYnR0?=
 =?utf-8?B?V2lhbzVxRTBOTm5Ha1FDZnRPSkVwVkZ0RzNVM1ZpY3psU1l5QXB4UFdQYXlp?=
 =?utf-8?B?dWc0ZFpuU1JIQlQxeTZOLytWdGY2ZjhuaXh1TGwySjBUYVp5cmZCamVzQkh2?=
 =?utf-8?B?TmkyNWNEOHExM3FGV0JaSjlVendIWldIck85amN4eXdmSzFWV2pWS043YzhV?=
 =?utf-8?B?bXJ5c2xFUjAwRUJlZDdWbUg4NnEwdkphWGFpK3YwdWNHT2lHdklkVk41bGVI?=
 =?utf-8?B?LzhoeVh4cnZ0ellpamdkRGpDR09tTS95clNCZnRDQkFkU0QrRmJ4bTRXWjk0?=
 =?utf-8?B?UCs3RmErWkhmeTMvRTlQWmtJdXBYZ3ZjWFRFNld3eXhKUGlaaUJXOWsyemJX?=
 =?utf-8?B?WXB3NXlzOFRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8937.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anR6OVNxZS8rTzAzbE9CTncyV0t2Yk5SdjR5L3NodW91UEFPbEt6VVpIaHJt?=
 =?utf-8?B?VDFiblJmRWZqazFLNG9UbVRLL2s3YjNrR3dJdmoySi9zbE1taWZvRk11M0Z2?=
 =?utf-8?B?ZU44a2pZcmNFQ1paNmEyVGFWSDZnbnBQNFd3ZFNkbDR3TFJvMEVoL082ZnAr?=
 =?utf-8?B?emNlTmxqNDltMzBzMmpzR3A0d2xhN2JCc0kxOXVyc1hTNkJVWm9LZ0ZsUEQ1?=
 =?utf-8?B?Z0piZFFpZTM2OEE1RjNTNVloZUJhdFMzU3hMdEthU0RwRXdTTmZGdXFGUmQ0?=
 =?utf-8?B?Z3ZVOFZGZUdHQVlWWkVXcDNZYURuY1VqOHJRZ0ttemJnQlpaYlNUOVRWNUZE?=
 =?utf-8?B?YzFaUXpnanMvVnNUQVZONVlWVTMzQVdEVDVOcUczZ0dJdmw2U1JtQldnSy9M?=
 =?utf-8?B?RFg0VWMreFJ1WVdmU2ZwaS90ZlhiRTJsOTdhYW5sRkRuTGdwT3FoRm5WQUlC?=
 =?utf-8?B?NEdiL0FJcU1KZ0Rsc3JVVE9jTUdpZC9tSkhZYXdLektRanJ4eVM0WDhmY1ZT?=
 =?utf-8?B?NHFiQ1l1V0JnNEROT2pxQzNSbGRvZXNGNGVzT05BbmRMS0h0bHlOU2hNdmZJ?=
 =?utf-8?B?UFR3MTBOcnFmQ2Nhc2xNZ0hqdHdJSHJFTk1TWVVscjNlU0FuclgvZWNTMVF3?=
 =?utf-8?B?VzlOaWJJOFNTNzNRYXk1a2JrUWZuZ1psWGwwcjBleTMrZ0ZEd01MRjZQSFcr?=
 =?utf-8?B?RGJ0OGFxWDFDekpXTWdNV3p1T2Evb3NXeVVsd2xGTXd1dmFhQzREZGFNMmEz?=
 =?utf-8?B?ZXIyYWZFZzJJVnE0SjJZd01uUWVjcDRDek5FOVhKdUdFMk55Y1Bpcmp2QXRa?=
 =?utf-8?B?Z254Z0pha0o3WCt1WXoybEVsaThPY0RqNTFXc2IyaUlKNDFZM3RMM0NmUTEz?=
 =?utf-8?B?dDkwSDlCdEdCcXhhOEN6eFMzdVkrMDVoeTVkNUxTVlBQVzljSG4vNmROSGpT?=
 =?utf-8?B?YUFEbkw2ZUpRckYxUEdFNFhDY0VobUdBK2dKd1dtNVZrYjU4WWZmd3JyU2pr?=
 =?utf-8?B?Mmx2bFYveEhLQWVjNnAxZmVDTERNenR3TEdQR3lvbFdZU1RuRHp2QnZBL2Jm?=
 =?utf-8?B?bmQxSFkvbSt1ZWdrbFFqNDNwTzE4UStIZHg4VzNhQ3JTdWRWcHBHK0V5VTRQ?=
 =?utf-8?B?Q2RLaVlNVmJINGN4Y2c1R1h1RjM2RDUxbGVJWmdOeW1ONEJadDRVZVlPUWdH?=
 =?utf-8?B?OXFPUVFCdUZ4QXZtODBnUlNBQVFtcFVhVHVidW5xQW8za1lvcWFndEJjcmdk?=
 =?utf-8?B?bXJTVThHaTBONXluekpOWTQzNDU0b3pJcEFLYmtiT1FCMHArOWhCSm8rckp1?=
 =?utf-8?B?UmY1WGVhWTFoQXJPUmFoQUFUSzMzdjI4VXlGUm5ZcVc2WTlGUmN4U2JpRFJI?=
 =?utf-8?B?am5jaU9SUGcvVnVjYnpCVGRIcjFWMEpoa1hLZTcvQWM4YTArc2FTOTc4bjRw?=
 =?utf-8?B?eTFFMWdGWE9MbVFUV21uQnFIdHkyc3Y1cEVNQnpmQVVrUis3cVlnNGZVbVl0?=
 =?utf-8?B?MXRQTlRrQXhaQUU5WXBmMXdNcG9CUEFlbG93VTFtVTBKbkw4M1F2ME9CQkRU?=
 =?utf-8?B?OUJRbGc4L3o4K3JrYmlYdGlXc1JFc3dRZ1o5MXd5WkZLZ3RjSXA3ZWVpbmV4?=
 =?utf-8?B?RlNvUTBwT090bUZMZkg5RUdIcjh5RU9iTXQ5a0FKbDM1NFRLRjJaQ2szbHNP?=
 =?utf-8?B?ai9RTWZ1enVGR3ovaXUycyt4K0lEVHVJS0RiZFVweksxcmRiTTZrb3E5ZjB5?=
 =?utf-8?B?QnV1VSt5S1IwWTlFUDN2UGxEc1NsZ2p5SkFzV2hMaWlpRFBJM1FZcmNBNmxp?=
 =?utf-8?B?VHB3a1owTjJkWkZES2dGd2FnV3lXczBBOFBjai9DVHpLU2xPbEwvVE5yVllR?=
 =?utf-8?B?Zkt2b1QvS0FseGtiS29KY1NpZzNvT2E2NUZLQjZxMlhDNVdDNGIzdEQyRFZB?=
 =?utf-8?B?WnJvN3dvY09XWTBuMHV6U3ErZjJRYXVWRDE0Z1pPb2lVSXUrTE1nZVZlbFov?=
 =?utf-8?B?Ri9SeDlBKzlZamx3ek91eDB3SmdUa1I4ek0wWGlJaVA2N1BydjA5TTNlWVgz?=
 =?utf-8?B?eG1DMFZiaUNLL0JiazJZVzZFWDZDNDhUK0lGTEYyQjhlMFFmUDFtVFpzWFRB?=
 =?utf-8?Q?ojh0vGp1Q0kCB7WrF3rd4XhKu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9854d3e-bd13-456d-7edf-08ddeeaddefb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 08:01:09.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jy2lwCBSOyHM5vmESRrSLfLQfp5YsDek2XnITxH8Lg2YeQQHXEz7hCEAxAEPYXw9S3eF3EhrJfjSwMQdpkmVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
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

DQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBJIHdpbGwgdXBkYXRlIHRoZSBwYXRjaCB0byBp
bmNsdWRlIHRoZSBjb3JyZWN0IGNoYW5nZXMuDQoNCllvdSBzZW50IHRoaXMgaW4gSFRNTCBmb3Jt
YXQgcGxlYXNlIG1ha2Ugc3VyZSB5b3VyIGVtYWlsIGNsaWVudCBhbHdheXMgc2VuZHMgbWFpbCB0
byBtYWlsaW5nIGxpc3QgaW4gcGxhaW4gdGV4dA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0K
DQo=
