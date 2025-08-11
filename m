Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78AB2042F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5130210E3FD;
	Mon, 11 Aug 2025 09:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMC4+SAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9164610E306;
 Mon, 11 Aug 2025 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754905629; x=1786441629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PT3JpixPVcUqdsIH3vpv6lCaFGJvEIGMNHWoLfaJPV4=;
 b=YMC4+SAA4zBcASFfOT0qSpEeIi5cLH2veL1CGTRTYW9jrVVcWblY81Ij
 922hCkr32AzUafnQ+OwILm2hT1YlSLnSFTjTcaweYeifkfbfJSfq/BQwh
 6BNSzUrml9cEe0LakYYELDJOzZGHRLq78TTyLOO8Kk0ooUYSw/zf7q8Ta
 p6Vi1xvbINJHCJavAmZ6f/4/zv1coOl2Si843YGX1VzcT4CBaRFB5tH8K
 m3Bm4XPK1SSdgQgEggGP6eujPZ+YGnR+I+GlZRTfz7d1mQ09sf8/Y5KcB
 frd217bxrc3fKkA1fAGk5RKbq1onSekqRJqa/XtLSxHw3M1Bs4b25jMps A==;
X-CSE-ConnectionGUID: VoYfaF24RKO4uhNn7Pb45w==
X-CSE-MsgGUID: mlUtgDD1SrWlBiCKKqzLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60998712"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="60998712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:47:08 -0700
X-CSE-ConnectionGUID: hP2Q8vwsQYe0C0jbZIoLxA==
X-CSE-MsgGUID: /asd9P3fRC2jrvjomky5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196870418"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:47:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 02:47:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 02:47:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 02:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkwWYsP2THWnGjqbgU33AqQvi4MmwgRXwCyJNjYXWCxWvWRrz0gcRBnx4eeZ5c8R8aXpPipQVn0/CyJuMY2S8eHGEPp0Bh9ezABpMoQlbWu5gZVAUX0teQXE+TLFYGAeu4mbXPQL60jlx0uM9nEXb6UXTy8MAmaEqJrbVaPem7ox9Eg2l3oRpdkincl6MxORIYmIiecfLoyVrGwFx1LNSRzfZEwGHtzGhHKjxW55gIEv+eU4NKlMOxNKLyKFziZSZi2IP2BWzoFN+yGy0Mdzj3WcfkSENrjUjDzOcget/5rWfvqzx/T65YXWQG2Iinj6Htg9GSXvwcjx4GjZpCWfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT3JpixPVcUqdsIH3vpv6lCaFGJvEIGMNHWoLfaJPV4=;
 b=ACHLkQEwoNG63sHIFPbqC8i6/43YwHHmLcBrcwYhf9FlLLs8ndyKuUeRRmZCpvn6qV0iKkhfEoR3t24J1Brc6DcwtI7b1TqDp39INAroYVUhOWBZgluJkOc9ebAQw2jWC1Zrcyd1ZR4kXTv8XvRauBagmAfNnBxyE7iUvgzLC0/O1FHXzeefiCtOc7yOOgTPLIvuvKoN7VJtuZaeARsSCujSd/NQ9/HSLvxW6W3M1qqPf2S4jn92HzqhfVTr1SbB3x+s5d6sKNniaKjL8go+ysDJ1uTaU05NyF9gqcZY07Vwk55U5tEohTJUHXX0TSRP7jZOF7x9jxClTdtCVF222A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Mon, 11 Aug
 2025 09:47:04 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 09:47:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "dmitry.baryshkov@oss.qualcomm.com"
 <dmitry.baryshkov@oss.qualcomm.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new
 drm_writeback_connector
Thread-Topic: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new
 drm_writeback_connector
Thread-Index: AQHcCqJbEMpGIAWMvkCYSpJ0pKoI97RdMo8AgAABYXA=
Date: Mon, 11 Aug 2025 09:47:04 +0000
Message-ID: <DM3PPF208195D8DB9C9690300904F07722BE328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-8-suraj.kandpal@intel.com>
 <20250811094004.GD21313@pendragon.ideasonboard.com>
In-Reply-To: <20250811094004.GD21313@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS4PPF691668CDD:EE_
x-ms-office365-filtering-correlation-id: 28b7d4e7-27dd-4189-aa06-08ddd8bc0775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SFRGRElSejRjc0F1Sm4xVkVzVXRUVFN1RmNEMFRsRTNsTUxabk1qRTc5VG05?=
 =?utf-8?B?V2Y0U3VKam9oWjFhY2JJaEh2U3ZnbzVOd0U2SDBmUzJURFdOa1lUSmtRUlZI?=
 =?utf-8?B?WUtrdEJzdi9Pd0hHdWVnQWgyQzdPWnFhL29La3hvRVNqRnRXVzFFWGJIby91?=
 =?utf-8?B?Z2VMNDYzWTZYeXRrNkM0SjV4SFByQThpb1VNc1VNQStTRWJoS0NraWRqVXRX?=
 =?utf-8?B?SWp1RzRnVndnMDJxS0x5c1NtUm92OHoyVVhMVmJqdjFDY2t2ZEhUcGFDTmV3?=
 =?utf-8?B?SVNIazR4SW9DVUNJZm5oeUtwSlpieTFPUDZuSkpwMzVxTzhrWEhlOG5nbnFl?=
 =?utf-8?B?VGkyQ3hLOXp1Z0IzMFdsRFg0a1pRanUvMXNHbnhaazhIRXZBbFZZRHRxTDFD?=
 =?utf-8?B?SXR4UkZUbXVQVFhUT2g4RE1rdlZoMWNwTExMWUhrNmpOUlZucks0a1p4VnRS?=
 =?utf-8?B?aTUxQk0rMzd2RGRtaWlBakFWYVNiT2lTS0NRQVZjcm5MSUkxeUpmK0pKR1NY?=
 =?utf-8?B?QW9sWVdHSW53UU4vQWVJTmREeTFxNFJSOW5ERXdNSVB0NUFyNmhUSFZ5eXhS?=
 =?utf-8?B?LzJtTEpsZDJPVDlxQUtvQzJGWHJHcWxXR1FReE5ScVFCdmUvd1RsT2w5WVNP?=
 =?utf-8?B?RU9DYlJ4djNSbUZZMTdKbHJjb1kzQmJTMEFCU1UxSzUwQVNGalBvSm8xSUhG?=
 =?utf-8?B?MVRwMHZ6ZURtZk03R0pOSFo3RlBpcUVwalRPOXBLRzZsRlllaGJBMTR5S2lp?=
 =?utf-8?B?UC9Sd0tRdWpOUWtCRVhKRWc5dWZzQmhNRUt3cnRxV3YrYnRUMDh5ZWp4YUFX?=
 =?utf-8?B?TUlaL21zQnQ3Nk82cjhzT0ZHam04bFlmNURIRnlpY1pseDFDKzBRNHM3SC9M?=
 =?utf-8?B?WWViNFVhTlFub2Z0V09VdDBzQ2RDSGdFRDB3V2lJYm0vUFJFYTlTaUhLUmdP?=
 =?utf-8?B?d3hiNmJkeGtRYzZLQ1lnakFFRFFoSG0vTnc3OWtyZTh0bExSTitqSFVteE5R?=
 =?utf-8?B?d0N2RkFzRnQwcjFXcmgrUEprdEhmTlFJNUdWblYxU0xGR3ZjUnpHcnBvNVJv?=
 =?utf-8?B?enh5YWdyK2Q2bGdUd3VxeGJMc3k2SnF3YU9pTDY5M1FYS3BPVjYvN2N2bUhl?=
 =?utf-8?B?SThjU1dDMFB2c21QelUyNkhQeWpaREJqREZUbGNwbEY1Z0pLTGY0Vm5wMGZr?=
 =?utf-8?B?Yk5JZitpL2NJa1ZpeHkvM3M4M1duUVV4bmJ3NjJQOWc4eUFsbk1NYlBiUGRJ?=
 =?utf-8?B?bVZ5OGpveXp1aEMzZ0M3a0paaDVMaFViU3lmQW9Ncis5YnpxNXJwWE8xTTNs?=
 =?utf-8?B?aHRHTDdwZkI4RzB1dkU5aGtuWWQvVmNFaDZ0MnJ5am8wdkxoVytPcm9nZ3gz?=
 =?utf-8?B?RlJnOU9ydGpEM2hLeWZ0NkRnMzFiaGw0TjlyNkU5aXhhRkRtY0E0ZU85OG8v?=
 =?utf-8?B?ZHpKUHMwcmgxU3ZxcEtqZVFtSXpBSlFLQVhOcmN5MENwYnI1NHlOdjdjQjBr?=
 =?utf-8?B?NzdialZwY211V1hyN1RnTVNXcEZFWjF2bVFsWU05c3g3S3JxRjVvaDRTVXhK?=
 =?utf-8?B?TGpwUWIrbUMwTTlxakFFRjZQR3VkMUxpNXRuODB0SWRrSmkxMXhURWVLKzBu?=
 =?utf-8?B?bkZjVEtFbEJRWndPRWs1WHpEUXRqenI3eGlJQ2NPKzlxZVUyRk8yQUliaVNE?=
 =?utf-8?B?WEZXQVdyMEFMS3lJVWxrOEFEVlR4Nk00ZldRY3pNM1M0MWlYWXJwaitjcFdH?=
 =?utf-8?B?Y0NsZURsSWIzazhMWVQvVWNJcGFIdk9hK3llSWNYVWVKWHFBY0FDSkY1ZE4z?=
 =?utf-8?B?N01WZ0YzLytCNnpCZ3lEQU5QNkpyS1ViV3B5T3NKVFh2SS9hcGpCSHB6aWY2?=
 =?utf-8?B?cWpRcTAxVkpMMmhXeUdZbmZUaVlJRjNhaXVQRW1uTXU4dmlpZHlvWVIvUkNu?=
 =?utf-8?B?cVVNeUZuZzNLVjlZS1R5ak1jUnRoK2V4OE9FNDhmT2JVRlNxMEF3WkcvdEI1?=
 =?utf-8?B?VytydXlheUlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVg1QzZVSVkzb0Vlcm4rVmJqTzFYbDNpZ1E1YWdZNENxcFNuV2F4ZjRDRFFy?=
 =?utf-8?B?blRWU2xueEF0ZTRXM1VZWkNyR0duS2pxaG5UaVdLS1JCSU8zQnRmanA3MVMw?=
 =?utf-8?B?L3JFT2xMczJHRmJhcURmSWp6MzVNVjhiRmlFNnVjZXNWK1BFOHIxdFBCclpP?=
 =?utf-8?B?eGs0MGFtRVdkVUtHVUhuWG5tcWdwNWFSK3liS21yL0ZIUTg4cnBsblh5UHlo?=
 =?utf-8?B?YXdLTTFPZ0JZenU4M0ZaRU1YNWYxeW1mTFN1cmxNaDVObm4waFVwWHBWV3JD?=
 =?utf-8?B?MnBvWHQrN2Jrd0poYmk3TkYrSmVpZ1ZUV2s5b2szQ1dnOXVTOFMzRnNWZDBl?=
 =?utf-8?B?NDNsOU85Y1BYMlJKMlFUaS9OcU1ZeFBNRzdjdTEyeFJxTElSY3hpQlpoUHFT?=
 =?utf-8?B?YWlQZDZZY2Z1S1dMRVpBTHNhNFBUKzFZNDMxa3hEeExuU1Z3U3BRc2NCRlBp?=
 =?utf-8?B?RGh6MFBOandEL1Y3RHN3cWI0MXVBMDlvSVBDS3ZHTnlKUmlpRG1sT1ZQRU1v?=
 =?utf-8?B?ZktQRlVYVmgrKzk5S0UzZ0Z0NjY3L3lVTzBESHIvMFpzd0k4akhJL0J3Z1E0?=
 =?utf-8?B?bU9PSkRCRStyaThhV0l3Q2lLR1NIaCtNZ1lNODgvd1JMeDNFRy9nOFJuUm1J?=
 =?utf-8?B?M1NyQVlvTmEwUHFYMzBxcWZhT081eUZoU01LSURnTFZnd3lZcFpHV0RiTEE3?=
 =?utf-8?B?ai9KT1FSNzVGaTNOMG85Kzl3ejJ3LzRBTFcxaVY5emh5d05RY3JBWUJSWHVK?=
 =?utf-8?B?R2VFYkphVElNRWpwV3Nsa1FVcUluQy8vUGdBaGl4anpkUWd4VnVsT1lSQnky?=
 =?utf-8?B?QWhTa1EvZ1hXQ3RvVm9ERDl2YVR6TzQ4cXZrQm9aQ2ZGSGxXcDYycTMzcDcr?=
 =?utf-8?B?VTl0eEdCWURQbzFLQm4zUkVSOE0zbHJIMk5oRjIwOVl5S1dHWHl5YTlvMHE0?=
 =?utf-8?B?UUl2clJjWDZrUERuVk5ZSWZmdlNOMWN1NmJtL05kODMxUitSbWZBWS9UNHZZ?=
 =?utf-8?B?cXNUZGlSTzRUdjZTYWNncG1NRlo1UU9TcHZCeFFTUWRtYXRwV05UZkQ0eUN3?=
 =?utf-8?B?ZElMdGR3Q0NaaDdjWGtBNzVLQzRYK0NLWTdtUkd0cmNneEE3TnQ2RXRucWVB?=
 =?utf-8?B?bjZRYzNBNmsxUDZFZlZ4bUNjcTJETEdMWDRHdjlTTXdBQlh6Yks1dnNOcG11?=
 =?utf-8?B?RTZzMnY3WUs4dDQ4M2F1MU1kandOZ1NPYm03aDRLUUczZlF0NkpBajk4WnNk?=
 =?utf-8?B?T1FKM1pJRmNKYzFXbGgxeGd4VlQreThaWGx4UnhKQlJSUTFoZzhrUWg2V2Qw?=
 =?utf-8?B?N1lxZk1RRTdTdHFOdmF3RFYwWDgxTzJQckNZSlFsd2xUMXZudVlzLzIrRkc1?=
 =?utf-8?B?QlROMy9HaEQwYlNTazZkV2xZUTU0OGRIM0tNc01SWWtMTDI2MjRjc0YyZDdO?=
 =?utf-8?B?R2JIRzZuQzFQcWhzdGdjck9iUGxHOGpDQ2dra1Rnby9Ta2I3TjJ0YVNkeXV0?=
 =?utf-8?B?clY5ZjZmdGxVTFMyeExUU2NwSVNQSndmdUVCTkhVNXoxMFpxVUZjR1dYS0VR?=
 =?utf-8?B?cUVKWStmdUEzdU1QeWU0SDh6dzNFRExLUGsxL0d6Q3Z1RzE0THRzSVZkcUg0?=
 =?utf-8?B?bTlXN2h3WlJQdDc0VnhveUg1eTlwVUtWb0lVQlRJYWEyTFFJTExCVDg5ZkJw?=
 =?utf-8?B?NCtkcUMzbmxWc0ZDY0NvN2xCYk84RXI0dmlPQ1VCbUZpRkN1bEtqancyZEVa?=
 =?utf-8?B?TndDYWgxenByOXB5a01USUZqUm00MElGRjUwN1ZBM0pKT3dJVmpkZG9URUZ2?=
 =?utf-8?B?RjlyVEVQaGY2UGZtVm00OTJaRWlRaEp0TmROMUtleVBKbFBzbVowa1dIcVhs?=
 =?utf-8?B?VHhUdE0xblcrbThQdjc0ZStHWlAwTlh6SkltZU8wQlNBQXh2Qy9idjloK0lV?=
 =?utf-8?B?enNYUHJneWdNeHJ3bVdJVUExemtjSnZiSE5IaUR3MmxqWW0zeGtWRTNyelFO?=
 =?utf-8?B?ZUVEWG14UUxQMmtFQ3NLMUx5dlRuRi9WcVNqMTR6M3FGMFZJMy9hbXlPNVlD?=
 =?utf-8?B?YzIrZFYvWHpCWWlYOXZtWmNIblBudEpuQjRtR3lETWRIV011Q1J1bk1WZFFM?=
 =?utf-8?Q?yUIwS7AMoAM/xtunhI0ViACet?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b7d4e7-27dd-4189-aa06-08ddd8bc0775
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 09:47:04.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjJ61OKSV4O/L09Gdnzw3pgHboYrM7m9DFtvyVE2jJak8KSp/d5X4zzKE7KV93m1tWHEk/2tYApmIbxXnrEyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
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

PiA+IFNpZ25lZC1vZmYtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9jcnRj
LmggICAgfCAgNCArKy0tDQo+ID4gIC4uLi9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfd3Jp
dGViYWNrLmMgICB8IDIyICsrKysrKysrKysrLS0tLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5oDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5oDQo+ID4gaW5kZXgg
ZDBmMzhhOGIzNTYxLi40NTdjODAzZDc1YmMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2NydGMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9jcnRjLmgNCj4gPiBAQCAtNzIsMTEgKzcyLDEx
IEBAIHN0cnVjdCByY2FyX2R1X2NydGMgew0KPiA+ICAJY29uc3QgY2hhciAqY29uc3QgKnNvdXJj
ZXM7DQo+ID4gIAl1bnNpZ25lZCBpbnQgc291cmNlc19jb3VudDsNCj4gPg0KPiA+IC0Jc3RydWN0
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHdyaXRlYmFjazsNCj4gPiArCXN0cnVjdCBkcm1fY29u
bmVjdG9yIGNvbm5lY3RvcjsNCj4gDQo+IFlvdSBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBkb2N1bWVu
dGF0aW9uIG9mIHRoZSBzdHJ1Y3R1cmUuDQo+IA0KPiAiY29ubmVjdG9yIiBpcyBhIHRvbyBnZW5l
cmljIG5hbWUuIEknZCBrZWVwIHRoZSBleGlzdGluZyBmaWVsZCBuYW1lLg0KPiANCg0KU3VyZSB3
aWxsIGxlYXZlIHRoZSBuYW1lIGFzIHdyaXRlYmFjayANCg0KPiA+ICB9Ow0KPiA+DQo+ID4gICNk
ZWZpbmUgdG9fcmNhcl9jcnRjKGMpCQljb250YWluZXJfb2YoYywgc3RydWN0IHJjYXJfZHVfY3J0
YywNCj4gY3J0YykNCj4gPiAtI2RlZmluZSB3Yl90b19yY2FyX2NydGMoYykJY29udGFpbmVyX29m
KGMsIHN0cnVjdCByY2FyX2R1X2NydGMsIHdyaXRlYmFjaykNCj4gPiArI2RlZmluZSBjb25uZWN0
b3JfdG9fcmNhcl9jcnRjKGMpCWNvbnRhaW5lcl9vZihjLCBzdHJ1Y3QgcmNhcl9kdV9jcnRjLA0K
PiBjb25uZWN0b3IpDQo+ID4NCj4gPiAgLyoqDQo+ID4gICAqIHN0cnVjdCByY2FyX2R1X2NydGNf
c3RhdGUgLSBEcml2ZXItc3BlY2lmaWMgQ1JUQyBzdGF0ZSBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYw0KPiA+IGlu
ZGV4IDk5ODZhMTBlODExNC4uOTVlNjgxMDYxMmMyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYw0KPiA+IEBA
IC00NywxMCArNDcsMTIgQEAgc3RhdGljIGludCByY2FyX2R1X3diX2Nvbm5fZ2V0X21vZGVzKHN0
cnVjdA0KPiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ID4gIAkJCQkgICAgZGV2LT5tb2Rl
X2NvbmZpZy5tYXhfaGVpZ2h0KTsgIH0NCj4gPg0KPiA+IC1zdGF0aWMgaW50IHJjYXJfZHVfd2Jf
cHJlcGFyZV9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yDQo+ID4gKmNvbm5lY3Rv
ciwNCj4gPiArc3RhdGljIGludCByY2FyX2R1X3diX3ByZXBhcmVfam9iKHN0cnVjdCBkcm1fd3Jp
dGViYWNrX2Nvbm5lY3Rvcg0KPiA+ICsqd2JfY29ubmVjdG9yLA0KPiA+ICAJCQkJICBzdHJ1Y3Qg
ZHJtX3dyaXRlYmFja19qb2IgKmpvYikNCj4gPiAgew0KPiA+IC0Jc3RydWN0IHJjYXJfZHVfY3J0
YyAqcmNydGMgPSB3Yl90b19yY2FyX2NydGMoY29ubmVjdG9yKTsNCj4gPiArCXN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IgPQ0KPiA+ICsJCWNvbnRhaW5lcl9vZih3Yl9jb25uZWN0b3Is
IHN0cnVjdCBkcm1fY29ubmVjdG9yLCB3cml0ZWJhY2spOw0KPiA+ICsJc3RydWN0IHJjYXJfZHVf
Y3J0YyAqcmNydGMgPSBjb25uZWN0b3JfdG9fcmNhcl9jcnRjKGNvbm5lY3Rvcik7DQo+IA0KPiBN
b2RpZnkgd2JfdG9fcmNhcl9jcnRjKCkgaW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgY29kZSBoZXJl
IGFuZCBiZWxvdy4NCj4gDQoNClN1cmUgd2lsbCBtb2RpZnkgdGhhdCB3aGVuIEkgc2VuZCB0aGlz
IGFzIGEgcmVhbCBzZXJpZXMgb25jZSBJIGdldCB0aGUgQWNrIGZvciB0aGlzIGRlc2lnbi4NCg0K
UmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiA+ICAJc3RydWN0IHJjYXJfZHVfd2Jfam9iICpy
am9iOw0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+IEBAIC03MiwxMCArNzQsMTIgQEAgc3RhdGlj
IGludCByY2FyX2R1X3diX3ByZXBhcmVfam9iKHN0cnVjdA0KPiBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0
aWMgdm9pZCByY2FyX2R1X3diX2NsZWFudXBfam9iKHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3Rvcg0KPiA+ICpjb25uZWN0b3IsDQo+ID4gK3N0YXRpYyB2b2lkIHJjYXJfZHVfd2JfY2xlYW51
cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yDQo+ID4gKyp3Yl9jb25uZWN0b3Is
DQo+ID4gIAkJCQkgICBzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYikgIHsNCj4gPiAtCXN0
cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjID0gd2JfdG9fcmNhcl9jcnRjKGNvbm5lY3Rvcik7DQo+
ID4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0NCj4gPiArCQljb250YWluZXJf
b2Yod2JfY29ubmVjdG9yLCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvciwgd3JpdGViYWNrKTsNCj4gPiAr
CXN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjID0gY29ubmVjdG9yX3RvX3JjYXJfY3J0Yyhjb25u
ZWN0b3IpOw0KPiA+ICAJc3RydWN0IHJjYXJfZHVfd2Jfam9iICpyam9iID0gam9iLT5wcml2Ow0K
PiA+DQo+ID4gIAlpZiAoIWpvYi0+ZmIpDQo+ID4gQEAgLTE5OSw3ICsyMDMsNyBAQCBzdGF0aWMg
Y29uc3QgdTMyIHdyaXRlYmFja19mb3JtYXRzW10gPSB7ICBpbnQNCj4gPiByY2FyX2R1X3dyaXRl
YmFja19pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSwNCj4gPiAgCQkJICAgc3RydWN0
IHJjYXJfZHVfY3J0YyAqcmNydGMpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBkcm1fd3JpdGViYWNr
X2Nvbm5lY3RvciAqd2JfY29ubiA9ICZyY3J0Yy0+d3JpdGViYWNrOw0KPiA+ICsJc3RydWN0IGRy
bV93cml0ZWJhY2tfY29ubmVjdG9yICp3Yl9jb25uID0NCj4gPiArJnJjcnRjLT5jb25uZWN0b3Iu
d3JpdGViYWNrOw0KPiA+DQo+ID4gIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+ID4N
Cj4gPiBAQCAtMjEyLDcgKzIxNiw3IEBAIGludCByY2FyX2R1X3dyaXRlYmFja19pbml0KHN0cnVj
dCByY2FyX2R1X2RldmljZQ0KPiA+ICpyY2R1LA0KPiA+DQo+ID4gIAllbmNvZGVyLT5wb3NzaWJs
ZV9jcnRjcyA9IDEgPDwgZHJtX2NydGNfaW5kZXgoJnJjcnRjLT5jcnRjKTsNCj4gPg0KPiA+IC0J
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLA0KPiA+ICsJZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfYWRkKCZyY3J0Yy0+Y29ubmVjdG9yLA0KPiA+ICAJCQkJICZyY2FyX2R1X3di
X2Nvbm5faGVscGVyX2Z1bmNzKTsNCj4gPg0KPiA+ICAJcmV0dXJuIGRybW1fd3JpdGViYWNrX2Nv
bm5lY3Rvcl9pbml0KCZyY2R1LT5kZGV2LCB3Yl9jb25uLCBAQCAtDQo+IDIzMSw3DQo+ID4gKzIz
NSw3IEBAIHZvaWQgcmNhcl9kdV93cml0ZWJhY2tfc2V0dXAoc3RydWN0IHJjYXJfZHVfY3J0YyAq
cmNydGMsDQo+ID4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsNCj4gPiAgCXVuc2lnbmVk
IGludCBpOw0KPiA+DQo+ID4gLQlzdGF0ZSA9IHJjcnRjLT53cml0ZWJhY2suYmFzZS5zdGF0ZTsN
Cj4gPiArCXN0YXRlID0gcmNydGMtPmNvbm5lY3Rvci5zdGF0ZTsNCj4gPiAgCWlmICghc3RhdGUg
fHwgIXN0YXRlLT53cml0ZWJhY2tfam9iKQ0KPiA+ICAJCXJldHVybjsNCj4gPg0KPiA+IEBAIC0y
NDYsMTAgKzI1MCwxMCBAQCB2b2lkIHJjYXJfZHVfd3JpdGViYWNrX3NldHVwKHN0cnVjdCByY2Fy
X2R1X2NydGMNCj4gKnJjcnRjLA0KPiA+ICAJCWNmZy0+bWVtW2ldID0gc2dfZG1hX2FkZHJlc3Mo
cmpvYi0+c2dfdGFibGVzW2ldLnNnbCkNCj4gPiAgCQkJICAgICsgZmItPm9mZnNldHNbaV07DQo+
ID4NCj4gPiAtCWRybV93cml0ZWJhY2tfcXVldWVfam9iKCZyY3J0Yy0+d3JpdGViYWNrLCBzdGF0
ZSk7DQo+ID4gKwlkcm1fd3JpdGViYWNrX3F1ZXVlX2pvYigmcmNydGMtPmNvbm5lY3Rvci53cml0
ZWJhY2ssIHN0YXRlKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHZvaWQgcmNhcl9kdV93cml0ZWJhY2tf
Y29tcGxldGUoc3RydWN0IHJjYXJfZHVfY3J0YyAqcmNydGMpICB7DQo+ID4gLQlkcm1fd3JpdGVi
YWNrX3NpZ25hbF9jb21wbGV0aW9uKCZyY3J0Yy0+d3JpdGViYWNrLCAwKTsNCj4gPiArCWRybV93
cml0ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oJnJjcnRjLT5jb25uZWN0b3Iud3JpdGViYWNrLCAw
KTsNCj4gPiAgfQ0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQN
Cg==
