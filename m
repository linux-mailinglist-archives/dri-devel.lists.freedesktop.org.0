Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443BB53134
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C12F10EADB;
	Thu, 11 Sep 2025 11:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keUhip2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645710EAD9;
 Thu, 11 Sep 2025 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757591059; x=1789127059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UeMeyNkESfdK3wQDT/IF8mtOCW1BRa3eqY3kKTBxX0M=;
 b=keUhip2yJI1djkIb+3q2oGgwVP2cKpSjVIgSppztX1OCgRMs513TpdUf
 HPTbAFOYE5PkK+zM6MsC/7cMmkEBUpFo6ai8zFj2TrM7eTo18xNXiwPlo
 dxxIVmyiPgn6VmR7DKbeYVMHqgXAJSHB6ODBXMWf4mxdxI0iQpwEYjTlj
 qg2TY5MHkiizsfzmpWvhZv4P6GJHZXU73iWi1borXb390MqGHrIfVWxv5
 7N2b3GIywfBwlsV8p1GgFYbHPUkWI2xohp6OynYDcAReKucLf1H8Q6lp4
 82uEIkv8typDoXff7XuxFggBfmcHil/ceNzAHQx3MRDUrju8rRCCV7aJC A==;
X-CSE-ConnectionGUID: 0RPQw35PRpSD8Q4NJnBKLg==
X-CSE-MsgGUID: n/ghrVIpRe2DQrdVzy821A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70537975"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70537975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:44:19 -0700
X-CSE-ConnectionGUID: gJFAvSsdRnC3huhk6jwCzA==
X-CSE-MsgGUID: KMv03nt8Rm6Hr8LmW2qIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178874094"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:44:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:44:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 04:44:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvYdKSeu3IyVBInaPZ51yiKGnKZoITO3N8z+ZlWdHxOBXbmd8E8IIGicuUH7sseMt0hVkDJt4M5YT6IHq4dMO7KZOGSti06IShF1UPd97kA9ctCHw/kcIpDWNlX7qBWQbbf7Z6oYE7Al4bg6XqK9LGJQCL5WbCkke3iE/S9+xbj7Gnw6mhz/il6h4/2FpsCAb5jkJgo5/PxSOeU7c6N/LOAX2YeZX+E4wAHQu+JDbUdGTEaH2j+FpY5Lq1aeijoDMqaO3kWlFtdPub50gVodDuBCm79uJQR455EgEEgi+rws9cy9P4Yg5hPLpw4H6mF++XUaDYVvrMMC2mABtSlT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmDhSPKC0b4DVEGL2K7x3DwNua6qJDkWuMdjaxfU7Y8=;
 b=sEfIFqq0qGAF2RDKwxcDREn1jxuqLVhy7+dnhVGKtu/6DpyHESEqy3Eu6tL7uxe/BWGNhgzfl+DWuZLAIHsrg4yTepyuSoR385ULoOQHuJQ074SFfvIWOpRTUQAww79Ugbz+E5OQF7ZZUIhFNLHHh8y+6CFr6QBHjhWF7qPHarqnzxnX5Oj4XpF5DXJ5Ds7BntyJr3JCfowTyEIGgXZTD3h8QvG+ef+D3avCXaPKW6AOYAjF7ARZFLVKw+UR7b6YhlIZq6VIlMt1eh3v0sghMP8uzenpbjjuA5MFsocqCTiK1pqRuom2Dn6++OEDs/Wj/In7wwSysAWLxdMUN+53rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7722.namprd11.prod.outlook.com
 (2603:10b6:610:122::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:44:15 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:44:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
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
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Thread-Topic: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Thread-Index: AQHcIXGVIDatfl+Hr0KRZbXy9BD+3rSM08QAgAELFxA=
Date: Thu, 11 Sep 2025 11:44:14 +0000
Message-ID: <DM3PPF208195D8D0D1CAE876CBDADD3B82BE309A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-3-suraj.kandpal@intel.com>
 <nw4ehd7a655rzyf6g5yxb3z25en45esja2i5uowzy4wpmb2el6@orycag5iccho>
In-Reply-To: <nw4ehd7a655rzyf6g5yxb3z25en45esja2i5uowzy4wpmb2el6@orycag5iccho>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7722:EE_
x-ms-office365-filtering-correlation-id: 3a9cb5a7-f974-48a0-e095-08ddf12888bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oMzXR68ityLv9mcgj+N+mscq/QJgtbHcRysReMvqt6Lqxc+LMNaHF0KhG0oz?=
 =?us-ascii?Q?0StbGoVQ0uCXfZtIjcolqPJC3JvQpVHBpLCMbW1nd/SsksQRBsqrix6p+2fJ?=
 =?us-ascii?Q?DQwbg0YNzQAATjdChZTvM+HIvAIew+DLsVfV5i13cr3GZs5E+GR2EmBPuir3?=
 =?us-ascii?Q?lmLHwvFQ2c5tsyv83BEORK6++WcGVN4dhcAFA2cQ7aCZUgqsYxE578Qzi4CL?=
 =?us-ascii?Q?y/ikgll0eF7Id0Js8r8PWcsZ38l23dXbdEycVBFrvHdz59z0EptKgnO1xMjr?=
 =?us-ascii?Q?BA3BjU4korXSjAm02P5fHnvqS1HEaO5vRL8avvVRmDdnPCFHghCAkRIG0C95?=
 =?us-ascii?Q?2211fshVhYOIMdbfV/IW/k44Zuz9kQqUVVFCzx8+Jfb4CNR/sr5BBVniSvVN?=
 =?us-ascii?Q?DHTaLPQEUQUfDhhY4hLuuK8ZjREOvwouu64H4KZNOJh95mEsQ1JlUCFXUvSI?=
 =?us-ascii?Q?IyXM3festQMA7RUHMB5IsMRmBQjZTI8uVxtTd10yt+uuzpPQzh8J4/qOi9g8?=
 =?us-ascii?Q?5XfqEJ+TCbgfTDDqVwgBsVb+21bENkH6G7GUaIRvDRfuwKafzJJxU1DfYKSA?=
 =?us-ascii?Q?LU2jldFmynWQmMfR9F5oTiLrMeYoK31NcSKnBB9ocy/rs5CLiCPYKJUkGIc6?=
 =?us-ascii?Q?pSiiOMzOh7PUjqHOyQU+NEuE95fZK07AguKpAN/IpzZnPu3w84kdEJcugpnX?=
 =?us-ascii?Q?Ol1VDN3BX0pWHPIDk/f8m9YtwDk1zLNNXZBl2sgG/b10Cqj0q91KwSvPE3Gl?=
 =?us-ascii?Q?JaI3KguegJHWFtyG2zAwlfaUpqXM5IDEoJnuxbRmAqL2DwhfjaRUVeymoyjd?=
 =?us-ascii?Q?maEOWKAVYkqW1sgOvFEkFYrT+1KLkbPYCcQWDRlW5fgY7GqY0MqS//Cd8fQW?=
 =?us-ascii?Q?9eBXoBBOmppP8pJBzpujqMs8n/+cOuGoWfKIn75nmgKTsRGCeB3Xauyb0qNo?=
 =?us-ascii?Q?Z4LTUaRsOtpNRh/jS1yuPtU7a7SZTqhI1p/k7gGrotr+an10nz2ffLQ41/Fb?=
 =?us-ascii?Q?gXotlHDyl5AxvgTbL+qUwqxryPPNQ2SIxofWR82SmzvZOEqM5rphZcVBT9Oh?=
 =?us-ascii?Q?9E6ysRmluuRwDeRsCSyvYXPOJm0GktXT6WIdTOJCtdUM44TvJK/A6DmjCjE6?=
 =?us-ascii?Q?HIJedw2VZHbzuJkTCtFH4TJz6eo3LEw6MFNYgAvwBTxLRA3czj6yA+gS9KRu?=
 =?us-ascii?Q?QMhB01VC42N0PvFY0nGnYzqYXXoN/RwhKOZw088ZPCM8qHIWMUG3jHxLxG0C?=
 =?us-ascii?Q?zeBdUKmUxE8f6wT8aZ13Xq8M02OBrj05u6jCpj2xsVFcvvrspeZoicxF6ZGL?=
 =?us-ascii?Q?4eApqssXZ15WiaSNpKdJ7ScNYIa9eB8fgnn6aLaLF/UiKa72t8XQvXMOo0lo?=
 =?us-ascii?Q?Q0HvumLQ1FqLPusezEzRMkEuHSar/vk6ZSe0WDsM3WwAIwfsDO7evEQCp+GB?=
 =?us-ascii?Q?qYAxMKjEF5D1I+tUnoOG8suRUxQroqp9mSv7KrC+WVsPmfD3/O9LllGvHfov?=
 =?us-ascii?Q?ME245p+3/0W0Df4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?taeCMkFW74NEDX/BRY8xofacCa+hU8+Yd2oEBmU5ElbXQacKhin/8UtiUuEq?=
 =?us-ascii?Q?hb5ltZfeH9br8/mfPAR17B4uCUa/InthIlHDnAbAjYQRvtNkyUd/zaVZVKoO?=
 =?us-ascii?Q?YcdjO9T6xF0qQhnV8y2rYT6A5OZikZNaWWRrW3+0/hy28khPk4P7XIuulu/H?=
 =?us-ascii?Q?fu26hJfbEzfv4Nks+eYmylBoZ3tFFbAQBmDUdtSLTOCoiqNXqrkp9QA72RK2?=
 =?us-ascii?Q?EoVJ/xpH/Fs++bTAD7/bQY8SFjBUBFlzLcEpVbZfga7pa1k0kil3I1VXA4Yw?=
 =?us-ascii?Q?YKvHYZWkCPeSzK/+dGQpZDVlmgTa/MknxYGEphr6PQJsR85bruc1RAKfEfjH?=
 =?us-ascii?Q?bM1KSM5ReViFTDQkDg8aLRCDl/6m24dq/MjwMVdfnAFl5prEN/IM9WrCNorK?=
 =?us-ascii?Q?JjT4CuyBOKNPJNfZR5q/5WvHkfkDyvngZJXkeIhfmypBFIn+pzwTUzc5xixp?=
 =?us-ascii?Q?ypRPhjxBNcXJu5f619It4C0LdnI1Ap/lDdQIOEckLO9rycCqSMbsFmBen8aA?=
 =?us-ascii?Q?qm5XzwQaxo5t5GBJM89EyP2akHIb0xC3FI2kJbgeU42TmzTT8MMbvJLC6O9A?=
 =?us-ascii?Q?wuFNmmK8dZiFiMZ/9PnoqVMPR9wphOQgVEX41XViEFXMzr8bf3GzgJb/4IDI?=
 =?us-ascii?Q?1omJ7S/BsU+UdJJxX0h8wN5zrsrXDZsqKEyBsp9/I406xAxoiDEkEgFpfQ2I?=
 =?us-ascii?Q?x8ZTzWVtaHd3RleZwjmHnI4ALWoAtj2f3RFPnvHrOTF3BbJy4n8nWGFjYUR4?=
 =?us-ascii?Q?vE8gjg2nYdMlS51kgd9qWQzMPsw4yNF0qc3sZZkC3aQ9bK05N5IvmjkW8rmz?=
 =?us-ascii?Q?GuHNygcpd2grKqXgI0+NlMN1/AHIiI+pVIWGW8vdvP90J6rbj9OQsOU4DwtF?=
 =?us-ascii?Q?CHQOEEhsMhZEZAsRhBXebcyOGgo3AVnOuWFJoTDI8Kt4IkSDiSnSijWrXT5c?=
 =?us-ascii?Q?dWQJ22QAgI3Xo2sTyZFncjP9EF9OSED5fOW1WNlLSFhzJANiA6K7gJJ5xU0C?=
 =?us-ascii?Q?MsYLgnRBCwbpzQvQVuYihRVlEsPnA1CLA8SbIEwoZHqKaalJTzlKe5b9mSWJ?=
 =?us-ascii?Q?oLog2xAZvU1I/5LaOkr05u5SlMqndAkn2cQGOPG/7EUCbJheAgHtjRtMb/ek?=
 =?us-ascii?Q?U97iojcXEmIFVik7RgR5GO4An/26gfAYsSvE81xeIbjxbB54VbfNxw24Lqyd?=
 =?us-ascii?Q?Ny4c0wNAWIVC/i4NN7IOBb3+XYjdgP8ERdXSJoR7sUX0vu3SUabnyuZx0Xzl?=
 =?us-ascii?Q?KgpdJrgSFfm187HBfHsQP0t4OuXwgm2zyADBBpY3g8FcFqOjk0t3mrJUCz3y?=
 =?us-ascii?Q?zyB8FvTQFg8XdBVvTY2CjYiQpewKuMgeRgpkj07/eqduAmlaHw7in8NBT5Xw?=
 =?us-ascii?Q?oNcdVRLJlNPP/t5VHm+Dbxu4WgW52J9xG/Eh3wl4RpXMKpHrdgZHceph/pEw?=
 =?us-ascii?Q?MhV95MbpACE8uqxD0xOARMenbNcqRrZejXD3gGYT5kKug+20pvust4BIRvwJ?=
 =?us-ascii?Q?Mlf+dOIGk/67aFt2jpQx/laXb2h7LWIo4C2JNiFMbvXwJKdZ4rTjWGNzsG7+?=
 =?us-ascii?Q?B9FVoHp/W5AjJIdmU13FFegptr+95F5Gi5vYko7G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9cb5a7-f974-48a0-e095-08ddf12888bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 11:44:15.1438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CV5s7qOG22p1B86ORlH5j3CcUdZ4rOwBiqwlZ6ZYbB58BozBiuvY3jEK2IhVDQkeohZgbK1KusBRpfE315+sSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

> > Now with drm_writeback_connector moved to drm_connector it makes more
> > sense use drm_connector as an argument rather than drm_connector.
>=20
> than drm_writeback_connector

Sure will fix this.

>=20
> > The writeback connector can easily be derived from drm_connector.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c |  2 +-
> > .../drm/arm/display/komeda/komeda_wb_connector.c |  5 +----
> >  drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
> >  drivers/gpu/drm/drm_writeback.c                  | 16 ++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    |  2 +-
> >  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c  |  3 +--
> >  drivers/gpu/drm/vc4/vc4_txp.c                    |  2 +-
> >  drivers/gpu/drm/vkms/vkms_writeback.c            |  4 ++--
> >  include/drm/drm_writeback.h                      |  4 ++--
> >  9 files changed, 18 insertions(+), 22 deletions(-)
> >
> > @@ -338,13 +338,13 @@ static void
> drm_writeback_connector_cleanup(struct drm_device *dev,
> >   * Returns: 0 on success, or a negative error code
> >   */
> >  int drmm_writeback_connector_init(struct drm_device *dev,
> > -				  struct drm_writeback_connector
> *wb_connector,
> > +				  struct drm_connector *connector,
> >  				  const struct drm_connector_funcs
> *con_funcs,
> >  				  struct drm_encoder *enc,
> >  				  const u32 *formats, int n_formats)  {
> > -	struct drm_connector *connector =3D
> > -		drm_writeback_to_connector(wb_connector);
> > +	struct drm_writeback_connector *wb_connector =3D
> > +		drm_connector_to_writeback(connector);
>=20
> You can use &connector->writeback without extra wrappers.

Hmm just kept it around to make abstract the internal structure, will help =
with future refactors if any.
Its anyways a static inline function.
If that doesn't make sense I can do it the way as you suggested and also ad=
d a patch to remove this helper altogether

Regards,
Suraj Kandpal


