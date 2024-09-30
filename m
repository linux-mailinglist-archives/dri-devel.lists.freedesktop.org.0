Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793BA98A4A1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098AF10E0C8;
	Mon, 30 Sep 2024 13:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UA/Rd838";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BC210E0C8;
 Mon, 30 Sep 2024 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727702509; x=1759238509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Xe0+JIzkcrCya+iKYhRidzBt+jWquMZC9BFNpLjRa8=;
 b=UA/Rd838qOpGfs+j6YoOkVXPPpjngWMbCWQOAqU5qFqqqsZudYonM9Sc
 a6uy/KI5MNR7GO3tlOnZI8O3gSuONqToIQkHQh3+JFOnmf7cEspeEponl
 2Os4OrEfxsies8iOuy7Swlbc55q4H5vW1915ebEVNtc22pIpNdaUcMN07
 eN0dpT23uUN85NYGI5ZvT5cffYAKQP2kZCtz9joCQxrlkVdF0m9wRkuHs
 5ylYqELlYhlvG6X99U9DhoEpbzhfXVLGcCeazqlL4Y2jhqyKuy/5xM3Ry
 bGjqzMovs07iw031u2A9kUCH0VAxYWTr9PfD87bsnylI04tgHI2R2HaLg Q==;
X-CSE-ConnectionGUID: 4k9fNmFITPipW8kubLlRIw==
X-CSE-MsgGUID: 4P8pfp6fTUaktHy3nmylCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26913189"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26913189"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:21:49 -0700
X-CSE-ConnectionGUID: 8gK/UTbJQT6xERqT8JlaaA==
X-CSE-MsgGUID: m6mmFzwoRdGsLjWeHhN/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78126855"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 06:21:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:21:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 06:21:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 06:21:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 06:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0IM69D9+BNAY8s6rYNKXkPKZ/XizInNhsXcyBOGp8RJiKgDpcP+HMMetlHEwRQ0pLLW3UBXYarsOjXaiQKU+9EvfR/wZpReaQokk57kzVfIinpG3nPnShDqEb1Cxg0jkSRJm6gl2TwKiHtfRlBOXws0IQ7p2gZOrThjsvDSjadDFhyNyLRPmQCperITw/9vCIMW889k84VhMgvfoq3/uE58832Dked1Ef4Y29m3wjkuCfqsSfGjt7PW/UTcQNQ3JLOzIOk0qzBpq9q8GAdM4aC/noTKGC7jpaNJnTMVQGELor17G+mpJ1dulyLk/Xf/rsDsuc3/cJZOxmgjHIhFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U4xbMbKHeeID6MWtkv8LSDnejHKIWDhfrLu52q2fFM=;
 b=QSuS9dzG6ab2XRWethvqhEsO8fNrMuoWL9gjUi5p9NUViP7bIaupDcjNQWs0btQrngs96ZsGn+VGNki4dia6JK3OFBumj8F9kdZOzpSFVZtNXbpBQZAjNPA4PfbthUcRDcx8mHfSKU5p+KbfeQCVD3CGfl5Q/RV3ehIGiGfgEOBvLsRtZhNOR1urygV0wQwsVTSWk3R8X9OT+5cUsytlC72xtbHdwMZXoQfHfsXg3h3XXZT3A9Fm/voc0S2spT0adFkMMdWOuj+nqLbvjgEjWnQZjBId9ukUZG1tuf1D7DoPF2JFeH/hmWJGW9tX6Lar0CpaDk6VP3+U/ZqBdW9FoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:21:46 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 13:21:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, DRI Devel List
 <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/xe2lpg: Add WA 15016589081
Thread-Topic: [PATCH] drm/xe/xe2lpg: Add WA 15016589081
Thread-Index: AQHbEzGuDi/TXGXrFESgTdQNp4+HjLJwUEDQ
Date: Mon, 30 Sep 2024 13:21:46 +0000
Message-ID: <SJ1PR11MB6204DA0CC6F9F4BB51D2136B81762@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
In-Reply-To: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB7151:EE_
x-ms-office365-filtering-correlation-id: b7f659b7-a065-4481-cea1-08dce152d55f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?E8d+Feuv9kh0fYUXtOvPD0hZHBkdxVm6SonYHdLQ7G5hPREaNs7ybaT4HpGR?=
 =?us-ascii?Q?JWNHljL3a7JsvQoNHAKdTNRt8rhqRd1K3/GDpLAcMsg4cA4IbRgnBd1A3Pc2?=
 =?us-ascii?Q?uGP/H8/Se893oFNED6icBCA1djUbQwQz7mYXT2HlkLwojHIs2tXm02vhSQys?=
 =?us-ascii?Q?m/j+kqAHaXnrocrqHLoez92AVia1Y5u0wJ4UPB64K2EojWffv6uVTv3EWkvC?=
 =?us-ascii?Q?+S8IuDoWyiaBk/PO7EWEBcaC+uLeF5h12B5tU2lq0M7IBBfj9FZOe0FAxtMX?=
 =?us-ascii?Q?YuHd5V+X/7G3Ekj9HWOocDacaRQyLs3Zth7d34tmPOPHmr5EMEGD6UIYpmYH?=
 =?us-ascii?Q?ANjIZUHixgx/T75/Mt6oRW0V9USjmqFnAtqSxPcLT40ZYL9ICWYgQoSbQ2Fy?=
 =?us-ascii?Q?Y8C9m255qDD0tmjE+joIapWibuPjlfdbMb3SKoJnNGhRitCJpobLrTUhSwod?=
 =?us-ascii?Q?AqjGASfSCHH3u2wav/UlAUoNjqi70GC9r81+jvdac9RIl6+fQ6vfdGXfySVc?=
 =?us-ascii?Q?qvD21ikwc5+bOgfWmRq+kc5Pg8XWMw3gCrBdQ5SBqsYc4v6g31tGK0Tsxsfl?=
 =?us-ascii?Q?+SEA3NOZ0FjJSpPlTgZD49/iynJ68FYAuB8wmHBZjLOWHtFKnFtazI98JrcM?=
 =?us-ascii?Q?/BWJ1843ty8xgfsGiGl2Va8s3vIJ7a7HxykHkidDldPoDTQlWWbiXsd/AF+T?=
 =?us-ascii?Q?MumAtycxxQ9JfMTGuwzKddP4E7I53OTMg1lF0D7e3mXCYf8H5S4hGzl6oufE?=
 =?us-ascii?Q?Rmnl43sYaohn1ZyOSg8WhFLsR9qd6QrhrhE66OTBnd18uWLRQHuWWHN9cxNM?=
 =?us-ascii?Q?eIXC3xinh+YM+VBUzeZhlZj0NDPgb6vgEp00JoS/rMHkNi6Aovyy9x2SpCNp?=
 =?us-ascii?Q?NDRkgvGwVXCCdNQLQlcEs+X+8rFZS3jZ0Ukk67oKho2/FtMJSvH432r4ZryK?=
 =?us-ascii?Q?uSPRkQouCi1CIVOYe/1LLBeK6arT6VMVksxmL37i+wJg8NqS7pGwnafg+r+S?=
 =?us-ascii?Q?nQ8MQfArpx5xy3ZKBVx50EIlB24/O5wv6SnfzZ8fRuKh2FkvyRKikuTaW6pu?=
 =?us-ascii?Q?HxqhXdYksJEM6cd8QdPwIYy3T9nv6ISE8wbrCs6k0k5AJ0NbMqdEv/Sk0Uwm?=
 =?us-ascii?Q?/roSViZ8ikJrZs3Y+h13BFY0D86ASmEbglKmxEVPqCFy16/2XQ4iehJAbJJj?=
 =?us-ascii?Q?/EKQWR34HaDBkV0pOrG4jYkiiEvdFyZV5vTkdXUSBT1MY7k2U/mMTNLhIauf?=
 =?us-ascii?Q?9Ij91CDYOiCCpmffHbuaeNK1PNVn1A+GW0zyfFFh0zm+bwpEh4CGa6uaDOLS?=
 =?us-ascii?Q?IRd8Jti9srYYnGdHkbwAhogyz0iJSbNI3j87N/rWP43GwA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3e6S/ZcWO5wF56cHbtIfWsmT04/7OcKCe4zb17Oyql+QY73SS5JiFTRBnYRR?=
 =?us-ascii?Q?Ik3DByjXU4a5fILJm1x/93ltN+mQxnJjqFDiI88E8ilKhNgQfrqmQZfqhjpc?=
 =?us-ascii?Q?CwN8g237K15gPsssJ8RUL8BC5eB027BSgaf79gzCJbW0rpug6MLpB4/fr2dp?=
 =?us-ascii?Q?qrqw8kHCc6K0XzpNDGIiandMCcQLBKiIYU7qYbe5UzZt4FVJuBWdBDzJaskO?=
 =?us-ascii?Q?RpsKmlOKUqES5jfCH30ECV6txA0+CIN4JYHs2jkJF5va5LogwRUdiie9Zuxj?=
 =?us-ascii?Q?85OsxKWQ7ScBqtFFmlF9dpWu7F2y4qhoAC9w/EXwTu8w2B0NvfxxcXBgljjk?=
 =?us-ascii?Q?eAVEn75NvsYNHG+WW3532pGI73Jv58CmkPnDpglkbY/3TMic0skzg5/hiF0x?=
 =?us-ascii?Q?89263m2/sNZtbgxlv1PowA+I2enor6prrX9nAKXGb4JaQVRgk4Ail3YAVp8x?=
 =?us-ascii?Q?c2IAvL5o3d6yBIB/oCUKrnRGbRftwiBr9YU4fhX6GlBy8ydduqsg0+Xct4yP?=
 =?us-ascii?Q?c+xgR7bJw0sYkmRZRPgRHKzrX9mAgxOz4a1H43cdiWFGaLD98Os33V30pfn0?=
 =?us-ascii?Q?ErD0kAuTEoupV0HINRuT0pP36JiLHL3KXQDENu6TH2KsN0dVhn9aCk0o1hQr?=
 =?us-ascii?Q?1golXV5A7yV1rJ4WBXqNtzdCiJ1UV7j6EsRB9q2KpCqjGx4PHQJ4DEhDCOep?=
 =?us-ascii?Q?YgraOgIs3GBcPpUOeuQRSkieifx/VLytDWhJCsHJ/hI/bvqIQ00mShT0yZtf?=
 =?us-ascii?Q?M3ktUeGDTF6UW7fHuiDoQX3f1YeP/c/zEpCG254aOOZBN43a89WkJXszNtIb?=
 =?us-ascii?Q?3vpN14a9JXqZJQJ89Jvlo41GA+HS36QQfp9Bcv+5xU0Ce3ne7WogfNDlSGaH?=
 =?us-ascii?Q?tBQjMwBELnITp7lVnhIXWD4MZ9Mc9J9+wlNnMQdj8PTi+cLNDGPouCVWHNhY?=
 =?us-ascii?Q?VRaqoA6uqrgkODQVFIep19FXPeMMdLeRllNt+MYzhNCGPB6n8u4vfhaJ9g6V?=
 =?us-ascii?Q?I7Rpj8CWrY8QH5J2TP+9WoqJCP9eooHHGfZeSv18MikiK+GG1G8jKhuJiRrh?=
 =?us-ascii?Q?N0SyS4BCvLySu7FpLNHmoV34TTzzEqxGY9JPsHuVnDHb8OEQJ15x9H1R2gc9?=
 =?us-ascii?Q?77n1RLpEZDKk3U1T+7m6tBpwPxKeq/kCx2YpNevaa3g6/JSUfM4mJv1V8iM8?=
 =?us-ascii?Q?b9IL7BhFJMZEEVuskq3yUbJf+FXu7qjtf1spfVAucJI2m9r0WsPObfgXrGYY?=
 =?us-ascii?Q?cXGhtsCOoOD6x47qZ41PsTUzAyqxiyeGLqW75sGgH6M8j+1XVn+Tuvq/caJR?=
 =?us-ascii?Q?y2AeKI+yo2xlGQSdt6vBh33H8NSojoxXCj9k53wT8F7Je7+gYjPZBpSLpPhX?=
 =?us-ascii?Q?UI6IC4p3/WnsnTW6kTB/A2PI19x/SW9ltpt2htp/y7N6x8qpVyxvDplvhdfb?=
 =?us-ascii?Q?cQj/yPjttM8S28T5aDbAX+Ttx+K3JbflKk8+k9tgQ0LUqDEsv9NsBkknKhdc?=
 =?us-ascii?Q?b0zxWEy7c8Zi0715oIbGSWxWZzkMqJ1D7DGYUiF/6g6tlPvX8q63jexKQhs9?=
 =?us-ascii?Q?vIea3F+wU0ZCyQwIh1HEyh/3PCZMeyMdbfWN5TpZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f659b7-a065-4481-cea1-08dce152d55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 13:21:46.2673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yO71b99gAF+w1NSoUjR7qsmFMpQzkriBCn38XZ6bz1yJezZaLlj+2VTd/qSzQtB/oW+CtwoESSXF9IH4HaV5YYUlygKJPJVR/QTh8MI4HIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Monday, September 30, 2024 5:36 PM
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; DRI Devel List <dri-
> devel@lists.freedesktop.org>; Linux Kernel List <linux-
> kernel@vger.kernel.org>; Jani Nikula <jani.nikula@linux.intel.com>; Roper=
,
> Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Sousa, Gustavo
> <gustavo.sousa@intel.com>; Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Subject: [PATCH] drm/xe/xe2lpg: Add WA 15016589081

Also please mention "drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg"
Wa_15016589081 is for making uniform subject across WAs.
=20
Tejas
>=20
> Add workaround (wa) 15016589081 which applies to Xe2_v3_LPG_MD.
>=20
> Xe2_v3_LPG_MD is a Lunar Lake platform with GFX version: 20.04.
> This wa is type: permanent, and hence is applicable on all steppings.
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 22c148b1e996..2f9cde4b7d45 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -710,6 +710,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  			     DIS_PARTIAL_AUTOSTRIP |
>  			     DIS_AUTOSTRIP))
>  	},
> +	{ XE_RTP_NAME("15016589081"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> +	},
>=20
>  	/* Xe2_HPG */
>  	{ XE_RTP_NAME("15010599737"),
>=20
> base-commit: 0c8650b09a365f4a31fca1d1d1e9d99c56071128
> --
> 2.34.1

