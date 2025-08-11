Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F86B2077F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9B110E456;
	Mon, 11 Aug 2025 11:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRPSGW2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80010E440;
 Mon, 11 Aug 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754911432; x=1786447432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QSL6u+AWIrg86FtBjNx/yMmauOAAjuXM7LCmaGkwAV0=;
 b=GRPSGW2tONB0zJqUGBgcVCt1w7Emn866KPuN9kW2gTmWTJ57JRiJ77Fg
 d2vCxh1BW32OPK3ZSYt8S2ToM2Pf1GzsobC3/HPRocq4KBtu117u1HQTJ
 jiC29WrmCnxXrFY5lIEIfzNs+akLlScjVvMko82F6EKd92dlA+tkOpOqR
 uOM6WfSgu1QXSsVfJhTixB7CpBdQkF3lYjJ9vwsov9qF+ej51HkZkDe7b
 I4MKnIyilPSFVCY5UMKmjpOaE5V81iEj/uSGYlWTYZgQMz0b0i3FRfBuv
 l2uymiYsnKvxkpNXFI3O26XI0k2XPNJsq9s/tyPVWSvHS0HdNMqki71+E Q==;
X-CSE-ConnectionGUID: cQD7nVuKRA6zqw5SK0+Sag==
X-CSE-MsgGUID: OydbktOeQUS55+uhrcdGtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56190672"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56190672"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:23:51 -0700
X-CSE-ConnectionGUID: K2zQogTETo2S5jnZxGK8Vw==
X-CSE-MsgGUID: ZNyxoOx3Sg2rVHMRIJRmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166199609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:23:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:23:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:23:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 04:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owPmflHKxKsqa3cWGRb3+geDINuI7ZPHziPx7lC0plXETaS5PtRnipckDk3YjFTqTK0tEKeTESS5e0vFtyT52PMl4wnjga2xBF7kIkpjV4kWlBVZY6f1QpN+1ScIwjmIt4mRXOUHwNBz2drqD3wJaT01HvU1LS/o42WoPh4m9ecda3Z31sb6pQuzq7K4eV2qeO7tYpeNDXXlh444/CtOVkdsB4csaKOGQ5kkA9xa9Igca5CSu/PVzFpgpWBOZJvKIHTm43WgVsPJ90d28iq2KflIDjESocRv1CQBEmJ4MOrTvDk1g+73rse3K/HfZzI/D3eIXxulU0KmPtSMTQR+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSL6u+AWIrg86FtBjNx/yMmauOAAjuXM7LCmaGkwAV0=;
 b=dfUE9zjHM/is3hw/xqOG6ygO0n3/vEiK/rnchcHxxt5czBgG+TKuwuHEj4cCziSLGFGVUKPwxelDgrTrplZLEMc3Da2eBwZj6Wjmah1wbQ2zmMS2LqEWgyUyJihqv+kYLwL1DgNi692aBBHFhpjFUjOdRPqxg5PyTqR3ZrdAUod7UTMUpQmoZKg1XSmA6/UajSTvoWBfGzLqfW8P+pRTE6/EcwyKUIqoOgmD0G/QpgrxJhdORp7OujbLaSbmVYCm7GpTq3HsUePy4OXCgQRn0HtI7JQI5QcN/af906H4sArKTk4JrUtGkm2/DnioBuABH3rrLo+6lLurh9yQUBAr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ0PR11MB5816.namprd11.prod.outlook.com
 (2603:10b6:a03:427::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Mon, 11 Aug
 2025 11:23:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:23:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, "kernel-list@raspberrypi.com"
 <kernel-list@raspberrypi.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
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
 <marijn.suijten@somainline.org>, "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "dave.stevenson@raspberrypi.com"
 <dave.stevenson@raspberrypi.com>, "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [RFC PATCH 6/8] drm/vkms: Adapt vkms writeback to new
 drm_writeback_connector
Thread-Topic: [RFC PATCH 6/8] drm/vkms: Adapt vkms writeback to new
 drm_writeback_connector
Thread-Index: AQHcCqJSGw9hLRcGGUCuHjxHfc4uMbRdNbAAgAAZABA=
Date: Mon, 11 Aug 2025 11:23:48 +0000
Message-ID: <DM3PPF208195D8D04EA6C19CE47313430EFE328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-7-suraj.kandpal@intel.com>
 <28e1e51b-759c-4470-aef7-6ccb116e3920@bootlin.com>
In-Reply-To: <28e1e51b-759c-4470-aef7-6ccb116e3920@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: 2aa6ad9b-61fe-4a51-8565-08ddd8c98a92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?TGJCTlBCSlRSUTY0dlVYektXUWVxT09HU2tDNjZpZnpYSklCSUlrT09Zak96?=
 =?utf-8?B?R1dEZDZ3bXpERmkxYXdURE80ZEJ6b0lCQWg2YmpzczM2WHdiUnk2SS9qOWdi?=
 =?utf-8?B?cHVqazkycUdLVDZpemJwVENlUitENVlPRkNPYXJBRTBSOWlBQVdWUFRURFJM?=
 =?utf-8?B?QzBlc1RER2pBM2tIWVlwMWowUUo3SVBqcVowU2Q2U1BUY2tWOTRrV0Y1Yk9X?=
 =?utf-8?B?L3Y0L0JPTU9TVmUvczFoV1dtQ1hjY2lublc5VjY5cVdXUzNmbzJSUVc4ZS9V?=
 =?utf-8?B?WFZ2bXNEcXdaOHUrancwZ3ZGT1owV012dUluOVlSUkJmL2tLMEVNZS8vZUVp?=
 =?utf-8?B?Rm1yWlovWTBXc05rWnFqajZTRW9xZWpPN2VHYVQxNlZXMlRJVFo5QlVadDJv?=
 =?utf-8?B?MWc3V3RuV0ZxYXlCRlVZVHppVHdmRkp0c0QyVkZNb09PeHVDNEFyV0IyOGVn?=
 =?utf-8?B?MmVaZWxkcXVPbW9WT2hlQ3daTzY5U0M2MXltM3pGNUNucDVLL1pZS1JvbmV1?=
 =?utf-8?B?cHFENEtOSmRpMFprTTR3ZmhtTVR0clRISEEzNS9HQ085WEtha0grdGVJWW9M?=
 =?utf-8?B?azVxUmo4d1Y4Uy9rLzYyNGVZQXo4bXdJNGc5OEdNQXpNMkVXN1JPRndLcG1N?=
 =?utf-8?B?Ym9HWlRldDNKVjRrdm1ncHlYU1AvQTdEc0N6L2h3dW1yUFM3NWUyVnNDY1dv?=
 =?utf-8?B?cW5odFhBcWozb2hPOFNkNWhXVGhPL0VnZHhldi9leVp1S1NGNGhJcFhtQ1JU?=
 =?utf-8?B?aTBGVXgxeVdwYTk1Mm5jT3ZCSExEaW1tK095VnJ4NlJ4MHBtamRJSGVnWnNx?=
 =?utf-8?B?djVJWlFHK1lUU0FuSUdUMHdWa0hSNlNMZ2twUys0MGc5REh0NkdpbGM3Qk1l?=
 =?utf-8?B?dkJ5TGFSbnNSV1c3YlprNElNUllCY2tjK3c4T3dCb05HUExFUWM0QmNtaVFZ?=
 =?utf-8?B?SGNMcTRzWUNTbWg1ZTF4SkNNbUdBMUZkbmZKMzBrMmNPbTMxajVCKzFSRGlh?=
 =?utf-8?B?U2kwQUJ1d0dlM20zVXlHL1MyeE9UczhmZHAzUXVpWVJrbnJnWXFvZjM0UXE0?=
 =?utf-8?B?em93THdTaXUrQzlGekJLam53eHlSTEpXNmFKNTVVVlRIeFpKWjVEYWIyemIz?=
 =?utf-8?B?MDhES1NRYmk1OTVBdUJjR3N6aXNzQ1BBVm1zdGJHWTN1cEVQOVJKdUxmelN1?=
 =?utf-8?B?emFaM08wc3pnSHdqMWJIdmcvNlZMSEZhYmJGb0Y4MTliUnlqdjdHWGFaYkFo?=
 =?utf-8?B?dDBOUGtSc1BoRWNBTlVoSlgrUWtIekI2SHUvRzh0TDlqeWwzbENLVzV0TExM?=
 =?utf-8?B?cm44WGNWb3lzMlgwME5MaHZnRE1tRnpaOWdWc2taNnN2SGFobDJCbmRsd2M0?=
 =?utf-8?B?b0pDQkJHSEpaUXJFYjJoQ1lLcmhhZWhzaDU1UDdGWnBHc0k5UWxaMzhNU0p3?=
 =?utf-8?B?OVNXVHJhQ0Q4bG91RDJvNGswR1RvZFB3YmF0VUdPSS9xbDhIdGFBSk9hWEdF?=
 =?utf-8?B?b0YvZUJENmxwTWNXdVF5b3Z4cGdsclhCdlBXRUVmSGcxTURsOHpVbWgra1lv?=
 =?utf-8?B?bU5PRk5obENpRkNjK2I5blNGWDE3c25BMGx4Qkl2aXlLSlRsZUkxNXdnb2xM?=
 =?utf-8?B?QzlwZTZqSTZlc2Z4Yk5DQ1pWdFEwcXpzcmRPMDEybTN1SnBXRkI5OUs0RkZD?=
 =?utf-8?B?OFpyWVpUR0lBejlUUjRib1VUd3QwYjhxTlkxck9oZUlJUXVobjA0aElXcUEv?=
 =?utf-8?B?YzZIYWw2ZFNmSWorZ0xETjUyZ2NPUUplNWlqekoxV3ROeDM0QXI4WTVpZHdp?=
 =?utf-8?B?ZUZqdU9kcGFoVzVXSUxBYStDSE9ldnZ1MGJJQkJ4UmJmMkRZVWw3TG5yQnZ4?=
 =?utf-8?B?dlhKUy9MREdDbk9yTzdRa0djRlVGRTVXckJ6dDU4K3NwZC81UTlDMVgrOHhO?=
 =?utf-8?Q?a7gWbb+dsv/gqgY+MN268vNG0683qy2i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1liaHBoMjFMSytXY3FWelQ3c1RUWVgxZ1lRK1c4TXR5L2MwTWJHMFNaVE9L?=
 =?utf-8?B?bGhhL3R6bW5vRXJwWWk5MHI1MkRKaU9sSVU1NWtEZ2tZc3R5dDFNZWRtZmJr?=
 =?utf-8?B?cEJFZlNpeCtnNVJNNGZIUUo4eDVQVDBDWXZkZ2V0Mlg4S3FHZ2xaRU81ak52?=
 =?utf-8?B?cE51WE8zNHEwaWVVczlBQlV2dlhiMW9qWXhKVDRmQzcvYUxZQnMzd3pwSVBh?=
 =?utf-8?B?K0w4c2loQmxOYWZnVHlramVHMG5lVnc3aWVIOHNxRUpnb2loQnlHSUZvK1ph?=
 =?utf-8?B?MGRtc3pvdmVLd2xNWDlmcFg0WG91ZFovckpLcDlZYzEvVExGS05jZ1BHZjJC?=
 =?utf-8?B?R2ZKU0k4MnUwU3MwMGxWc2EvRFFSYk45dHNuVkhnT0FiZzNVQXFDU1p4aDZD?=
 =?utf-8?B?TkhYQUg5MjFUdEF4WERlM0wwc1RjdjRnLzk0N1FQU04vT0ZrOTdib3BTVWZi?=
 =?utf-8?B?NzIybkxOZUpFQnVpVXNYaDl4UCtISHozUm9DdDJUV2VXZ0ZmV0pPRjZHcTN0?=
 =?utf-8?B?eHZJbXhZZGVHeGNKWGxUZ0dkdDZxa2tpdmRUR2FTQ280ekNaaGdpN1V1cGNw?=
 =?utf-8?B?WW0yb1FRVHBtZWtDS08zd3BOZmg5UVM3WjkrMFNVS1VhSXBObFppWjRDVGdF?=
 =?utf-8?B?R2ZwQk1Jb0xqc3BmSFVrTC9uSlFsUlI2b29CTkRUa0IxR2RISExFRzg3dVhm?=
 =?utf-8?B?ZnZudk5ZZjQ2NS9xTG1SbXoyUytLY3ZQK3hGZlJPalZUVytxWWMzZ1ZrbjR4?=
 =?utf-8?B?c1ZNM2VnT2VpTE95NU1Jd2pFckFSUS8zL0NKWnBRdnRGK2ZsZ0FlejByK0Fw?=
 =?utf-8?B?SzdibHJKMXlUczBMRCtmWVNkZkQ4Nm1OUHRxVURRdDhkcmM4c09ZUEttcko5?=
 =?utf-8?B?L1VoRkpQYkVwVHhSSk54MFlIWklQUitJTVVlOXNVbUx3dktvdWxmS00xMG5o?=
 =?utf-8?B?ekN2Z3A1amN5WXlIMGp4bC9pUXlWb2Y2R0lOVEE3MFhhVno1VWFFV09pOUd0?=
 =?utf-8?B?eHh2ZFQ0aEZLSGpXaG9qbXhpbXhIaDlKYzJMelZIbHg1ekxET2tIVDZoN2di?=
 =?utf-8?B?ZnMzWDg0Z09vdVhtbFIyUWdZcE1LQXM1U2lMbzFHNTVSWERkZTdBZS8vdEtq?=
 =?utf-8?B?MWhwWDM1cTNQdWJHTis1TXV0WXY2T2VxSk05L3dKZXh0NU5ZQVU3RGF2TlRM?=
 =?utf-8?B?cGRRdGJ1VmI3ZDhhWmpPSnBYR1hPUGZPVjM0NzlSQ3BtNm5hT3BZb2s1UU9r?=
 =?utf-8?B?Q0Z1NU9GcnN2R1RIQzA3dFMzUjBoeWJUVlNuczNOWWU1Rmg0RXZIN00rcE1T?=
 =?utf-8?B?dEpHblJZOE5iWmVHM1RkN1NHdHVwY1RJKzJYSnArVWRSc1hjeDkyemI1UFZY?=
 =?utf-8?B?N3VkUWUwUHZhajJIV2JuSWx2ZHpQK3kvOXNMTmpyc3lPblJTTlpyM0VSNlVK?=
 =?utf-8?B?cnplcyt1Q0tzN01CMnRYKzFmNFdRckl6R2VpSkthZUxudXljL3FlR0w5Z1M5?=
 =?utf-8?B?WmRBQWw1TVpEMnhUclZkTkJFRVFoMDk1ZUV4VHovZ1UwWnB5S0VVcThxbmoz?=
 =?utf-8?B?SEVrSXRqc2Z0OEdlYjRwSmFFNXhyelk0TXBsN25kUE8wZCt2SStSSEJvYnUx?=
 =?utf-8?B?K2dXMDlNK2svYnl0cmVHU25HektaTk5tMkVRem0ybUtVT1lhNCtLdEJPTjli?=
 =?utf-8?B?MmVReVBOTWJEL2JEL0JZYXdmRXFyckh6MlYyNVcvQXMwUURUU3dpc3drQzVR?=
 =?utf-8?B?Vm5Ga2gzU1AyL2l6NGtCbm1VUzB6UVR3QkhPeWxIbncxVFpwdEVjRlk3ZTNX?=
 =?utf-8?B?L2I2amJUTExEKy9NZHcwdzY2V1VhMjROMjI4cjY0ZlVmbFNvQm92cU9OTGpX?=
 =?utf-8?B?NEpuRnJab05RSlI4U3ZaaE0yMnA3TGZXaENZL0hQRURLSjRrd3VNbDUwUVZ5?=
 =?utf-8?B?TkxhME5NSEVsdzhHT3lPT3pvYWlrRVFqdEsyd29HZzFWdHBpWUIrTzRMa1J0?=
 =?utf-8?B?OHp6c3ZNQS9zdllXd3pwOUVpcDduY3o5ODA1TDZKVHphYjMrazVWWllra3Rs?=
 =?utf-8?B?NUZGNSt6K3QxWkp2ZVNTd2V0czNIS3owOXpUWmRnUmgxenB5bzVyTFBkaXk2?=
 =?utf-8?Q?jRm3bhWy15inlCAp6SnJCDbDj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa6ad9b-61fe-4a51-8565-08ddd8c98a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:23:48.0788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6h4avY+OakENxJ2RjYYDNgkqhGwV6AEVcLqUcyg+dEQ11dwvDIHH4KWYTMqmpt/QLdMXgaLdQbDjRfE4f0DAGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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

PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oDQo+ID4gQEAgLTIxMyw3ICsyMTMsNyBAQCBzdHJ1
Y3Qgdmttc19jcnRjX3N0YXRlIHsNCj4gPiAgICAqLw0KPiA+ICAgc3RydWN0IHZrbXNfb3V0cHV0
IHsNCj4gPiAgIAlzdHJ1Y3QgZHJtX2NydGMgY3J0YzsNCj4gPiAtCXN0cnVjdCBkcm1fd3JpdGVi
YWNrX2Nvbm5lY3RvciB3Yl9jb25uZWN0b3I7DQo+ID4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciBj
b25uZWN0b3I7DQo+IA0KPiBDYW4geW91IGtlZXAgd2JfY29ubmVjdG9yIGhlcmU/DQoNClJlYXNv
biBmb3Iga2VlcGluZyBkcm1fY29ubmVjdG9yIGhlcmUgaXMgdGhhdCBkcm1fd3JpdGViYWNrX2Nv
bm5lY3RvciBub3cgcmVzaWRlcyB3aXRoaW4NCmRybV9jb25uZWN0b3Igc28ga3phbGxvYyBmb3Ig
ZHJtX3dyaXRlYmFja19jb25uZWN0b3Igd29udCBhbGxvY2F0ZSBtZW1vcnkgZm9yIGRybV9jb25u
ZWN0b3INCmhlbmNlIHRoZSByZWFzb24gZm9yIGRybV9jb25uZWN0b3IuDQpVbmxlc3MgeW91IG1l
YW50IHRoYXQgSSBrZWVwIHRoZSB2YXJpYWJsZSBuYW1lIGFzIHdiX2Nvbm5lY3RvciB0aGVuIHll
cyBjYW4gYmUgZG9uZSDwn5iDDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gDQo+ID4g
ICAJc3RydWN0IGRybV9lbmNvZGVyIHdiX2VuY29kZXI7DQo+ID4gICAJc3RydWN0IGhydGltZXIg
dmJsYW5rX2hydGltZXI7DQo+ID4gICAJa3RpbWVfdCBwZXJpb2RfbnM7DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMNCj4gPiBpbmRleCA0NWQ2OWEzYjg1ZjYuLjEz
YzJhNWM4ZjU3YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dy
aXRlYmFjay5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc193cml0ZWJhY2su
Yw0KPiA+IEBAIC0xMDIsMTMgKzEwMiwxNiBAQCBzdGF0aWMgaW50IHZrbXNfd2JfcHJlcGFyZV9q
b2Ioc3RydWN0DQo+IGRybV93cml0ZWJhY2tfY29ubmVjdG9yICp3Yl9jb25uZWN0b3IsDQo+ID4g
ICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCB2a21zX3diX2Ns
ZWFudXBfam9iKHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiA+ICpjb25uZWN0b3Is
DQo+ID4gK3N0YXRpYyB2b2lkIHZrbXNfd2JfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJh
Y2tfY29ubmVjdG9yDQo+ID4gKyp3Yl9jb25uZWN0b3IsDQo+ID4gICAJCQkJc3RydWN0IGRybV93
cml0ZWJhY2tfam9iICpqb2IpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHZrbXNfd3JpdGViYWNr
X2pvYiAqdmttc2pvYiA9IGpvYi0+cHJpdjsNCj4gPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IgPSBjb250YWluZXJfb2Yod2JfY29ubmVjdG9yLA0KPiA+ICsJCQkJCQkgICAgICAg
c3RydWN0IGRybV9jb25uZWN0b3IsDQo+ID4gKwkJCQkJCSAgICAgICB3cml0ZWJhY2spOw0KPiA+
ICAgCXN0cnVjdCB2a21zX291dHB1dCAqdmttc19vdXRwdXQgPSBjb250YWluZXJfb2YoY29ubmVj
dG9yLA0KPiA+ICAgCQkJCQkJICAgICAgIHN0cnVjdCB2a21zX291dHB1dCwNCj4gPiAtCQkJCQkJ
ICAgICAgIHdiX2Nvbm5lY3Rvcik7DQo+ID4gKwkJCQkJCSAgICAgICBjb25uZWN0b3IpOw0KPiA+
DQo+ID4gICAJaWYgKCFqb2ItPmZiKQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4gQEAgLTEyNyw4ICsx
MzAsOCBAQCBzdGF0aWMgdm9pZCB2a21zX3diX2F0b21pY19jb21taXQoc3RydWN0DQo+IGRybV9j
b25uZWN0b3IgKmNvbm4sDQo+ID4gICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5l
Y3Rvcl9zdGF0ZSA9DQo+IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3RhdGUs
DQo+ID4NCj4gCQkgY29ubik7DQo+ID4gICAJc3RydWN0IHZrbXNfb3V0cHV0ICpvdXRwdXQgPQ0K
PiBkcm1fY3J0Y190b192a21zX291dHB1dChjb25uZWN0b3Jfc3RhdGUtPmNydGMpOw0KPiA+IC0J
c3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yICp3Yl9jb25uID0gJm91dHB1dC0NCj4gPndi
X2Nvbm5lY3RvcjsNCj4gPiAtCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRl
ID0gd2JfY29ubi0+YmFzZS5zdGF0ZTsNCj4gPiArCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3RvciAqd2JfY29ubiA9ICZvdXRwdXQtDQo+ID5jb25uZWN0b3Iud3JpdGViYWNrOw0KPiA+ICsJ
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUgPSBvdXRwdXQtPmNvbm5lY3Rv
ci5zdGF0ZTsNCj4gPiAgIAlzdHJ1Y3Qgdmttc19jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gb3V0
cHV0LT5jb21wb3Nlcl9zdGF0ZTsNCj4gPiAgIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9
IGNvbm5lY3Rvcl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+ZmI7DQo+ID4gICAJdTE2IGNydGNfaGVp
Z2h0ID0gY3J0Y19zdGF0ZS0+YmFzZS5tb2RlLnZkaXNwbGF5OyBAQCAtMTY2LDcgKzE2OSw3DQo+
ID4gQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcw0KPiB2
a21zX3diX2Nvbm5faGVscGVyX2Z1bmNzID0gew0KPiA+ICAgaW50IHZrbXNfZW5hYmxlX3dyaXRl
YmFja19jb25uZWN0b3Ioc3RydWN0IHZrbXNfZGV2aWNlICp2a21zZGV2LA0KPiA+ICAgCQkJCSAg
ICBzdHJ1Y3Qgdmttc19vdXRwdXQgKnZrbXNfb3V0cHV0KQ0KPiA+ICAgew0KPiA+IC0Jc3RydWN0
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yICp3YiA9ICZ2a21zX291dHB1dC0NCj4gPndiX2Nvbm5l
Y3RvcjsNCj4gPiArCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciAqd2IgPQ0KPiA+ICsm
dmttc19vdXRwdXQtPmNvbm5lY3Rvci53cml0ZWJhY2s7DQo+ID4gICAJaW50IHJldDsNCj4gPg0K
PiA+ICAgCXJldCA9IGRybW1fZW5jb2Rlcl9pbml0KCZ2a21zZGV2LT5kcm0sICZ2a21zX291dHB1
dC0NCj4gPndiX2VuY29kZXIsIEBADQo+ID4gLTE3Nyw3ICsxODAsNyBAQCBpbnQgdmttc19lbmFi
bGVfd3JpdGViYWNrX2Nvbm5lY3RvcihzdHJ1Y3Qgdmttc19kZXZpY2UNCj4gKnZrbXNkZXYsDQo+
ID4gICAJdmttc19vdXRwdXQtPndiX2VuY29kZXIucG9zc2libGVfY2xvbmVzIHw9DQo+ID4gICAJ
CWRybV9lbmNvZGVyX21hc2soJnZrbXNfb3V0cHV0LT53Yl9lbmNvZGVyKTsNCj4gPg0KPiA+IC0J
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yi0+YmFzZSwNCj4gJnZrbXNfd2JfY29ubl9oZWxw
ZXJfZnVuY3MpOw0KPiA+ICsJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ2a21zX291dHB1dC0+
Y29ubmVjdG9yLA0KPiA+ICsmdmttc193Yl9jb25uX2hlbHBlcl9mdW5jcyk7DQo+ID4NCj4gPiAg
IAlyZXR1cm4gZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoJnZrbXNkZXYtPmRybSwgd2Is
DQo+ID4gICAJCQkJCSAgICAgJnZrbXNfd2JfY29ubmVjdG9yX2Z1bmNzLA0KPiANCj4gLS0NCj4g
TG91aXMgQ2hhdXZldCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K
