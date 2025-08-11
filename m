Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F4B20715
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589B710E27F;
	Mon, 11 Aug 2025 11:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmzbqeN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A373E10E465;
 Mon, 11 Aug 2025 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754910854; x=1786446854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4hsDkPjuobDRUc5iQWDVxPLqzlrjCOa7SO+LfQ6UKxY=;
 b=AmzbqeN6AdMVv31cBepjM1VZ9iEJfuDNKToAqRGsqtUix+wGdsZ4FcMQ
 eHDQ7e8/PHOAIq2MGNKn1Wl8MxrPMw7QS/LRgyJzDNS9IVJF/IW3cRJyl
 KgnpG/rrGb5MX/qADa/uuJtX37H3V4TuUxX8nPL8d0MhUT1etliDRASFY
 mKWprnS3gqUt2dsgFF9hXlwTL3LC5lbYb/R6dLX5TV8hhrJ4DTk+Da0dY
 OAt3ajy19aZa/8Jsf7Ik/FgOT2XqDaE0mn64YU/f94wPy055SsUvkJjSk
 soJHZQiAJrF8vmjWy/pFERQdfaLfDwYwyeZc8A1eTj0J5VXqXdp/BHUW2 g==;
X-CSE-ConnectionGUID: cEJlFfRHSCaTVeNToxU+Fg==
X-CSE-MsgGUID: wncwGwlUSkuYNtd++DxHJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68530032"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68530032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:14:14 -0700
X-CSE-ConnectionGUID: 81qI/zB7SSyqEHEtZbleFg==
X-CSE-MsgGUID: apw1fLxMTJ+779oGyhEUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166687691"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:14:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:14:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 04:14:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 04:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNCOD9MK7ybQlYokQfOvzoNXPxIUmCV2zJuqSt6gs7APaLPPRPe4C1MRTmfDgJ6pQCXEzsVTrDDVXvqAkeqaLuyG9U42WEh2Ja9YqcrJlF5XjRx6/YIrAo23nsPOW8IMK52uK/2Dl2FuUwIlK/sadjQ343qrDiQVLy9yurS6bP/ikYVpgM5YMqupT3SFZJFkU3b1kElpmQDyMvIFZ2t6Wm1X8UtBkPkkOWhe/YtGPppTZD61hYwjMsLdgp/0cM3VAsVJJq3AKXxHlXn5SG874W1ldLRzMwbXaOQiXd+SyQrjMH2TkaBz+vjqlpAPJE3EyU+Tae9kv36/A6gBMmh1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK1RGD2GL4LPgVAY3isAcWflPUlaCATAhbipx1pHWjk=;
 b=q985Vzx2tDr2mxzhkiZP8N3e7+12sDpeabh6qNxfz06QZ8rkYb0+y2M6vAZueDz/6/CgJ/HsKQquFwIxMMu3KU2ZlL47XpdJ+dwKfaTI6doRp5W0UvoFTQM5uAX/4CdlHzPvQFUtPiM2rYhcxEHwOEZBs4muEOHBs7D29BhwCerrI0Jl4L8QQm6R0K989HllbptaxdzTfSBNTYzb6zR4pc3jXUVJkh6qYx5Ck9g9vS9aYZl2ImZp8rstQzHLPa3fWIezZ/gvhDI1OEtBb6ZcHFFY3/Pz1ve4HY+rIY/BCVCkALZ7jyipapeeBWWzkyy34VtBrpEvEWKGN4RqfD8+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ5PPFBD6B1667A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 11:14:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 11:14:10 +0000
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
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdP/qAgAAMmsA=
Date: Mon, 11 Aug 2025 11:14:10 +0000
Message-ID: <DM3PPF208195D8D3A33723FD7C3AF6544C8E328A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <g7ny277cnctr3edw53qyutiyv3yxah2m7pulg2u6gud6f2gla6@micq4aliwx3i>
In-Reply-To: <g7ny277cnctr3edw53qyutiyv3yxah2m7pulg2u6gud6f2gla6@micq4aliwx3i>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ5PPFBD6B1667A:EE_
x-ms-office365-filtering-correlation-id: 1761b0b4-a6a6-475d-50cb-08ddd8c83206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OGlT9bQyy8soD4Rn3Dd0+uTf0wLEYu77a3lCogYj0fW6NfI/kHCneuFAwm3m?=
 =?us-ascii?Q?QB6pdSIgmgfIoU63UaNnzfBgL66uqiahsTUE3Cj4xNZsguQZYqPF+hytB7G9?=
 =?us-ascii?Q?I18o0DoMUG1Ud90N6do9wtwsP8uwDVAFXAkt3dKbRcvTbiR1u5PaLwnO/1ba?=
 =?us-ascii?Q?93If5N28f8Rm4XwO4WfzHMDxc9AuJoymTWz+o8cxgIOvO3kr+NHiv3tRFQ+N?=
 =?us-ascii?Q?VS6urY09T+ACr3goOCzL/dPpmJzENxwdQl8UvFAYhoiwlI2Lm8qmGES7u7/5?=
 =?us-ascii?Q?5MiVz2ZohkYN6XbdzcgXCGfKUgQaeSNYVjyQnk9lzBqvDJXwVwhoP+X9+bdU?=
 =?us-ascii?Q?WZ1HybXA+P87DuPpOXdwGxVEJSK8oWs+O36TpJaa+PWCbowYAtPertd3NoJc?=
 =?us-ascii?Q?dBRIBnDvdxN3mpnV9ZETk4L39T3Z6Hv1FaaJIT5YDYYYes6NV7hDumLRXZ8s?=
 =?us-ascii?Q?n2leLAA2DzvaILohuIBnGbB1ibGZfABTNieoARrT0zcTPeKBf0VFEbaF4U8D?=
 =?us-ascii?Q?+9oe0asHTWrbiorDzoklP/MAMs/rKvB+kNpCnneEAqMOCKD44SH19UPPXExy?=
 =?us-ascii?Q?Kz3fNwSUpLFDhwYShYoAgiqm3oTcLBpiLDwJ8fYMijGAb1Ckiy6Oc/kZoZTi?=
 =?us-ascii?Q?XATWOeQi1wW1BcmhaKqTJGpr4tGzzyLj/j2wmsdN5+13BFi+MgaS5ljzofmc?=
 =?us-ascii?Q?l+lpV6YnylMNJ428fu8GUQXPVfZquW2vaZKr+8z0ZRuqbfdAavJ47ecr8CnQ?=
 =?us-ascii?Q?N4FbcfRqTAWjj034+OYYf17Ys361l9zzBauLuZTPENsaddkF02we6KLNLgZt?=
 =?us-ascii?Q?F7wn+BAXA+wAYk5jvKiOIbvHEjpVfvivuqZw5USFZDgsAT5trEzSbKu8AHAI?=
 =?us-ascii?Q?xKjI+X9YCUI06DZ05ktgHNPtX/eDRwiOsFgSeDqrOY9zHWOqFYuff+197DXt?=
 =?us-ascii?Q?i+TDkBdIkc3DGVB/poCHpaeH6ZGbmql0iFFtfYYbp5liNxix6n8bHrKqNkPj?=
 =?us-ascii?Q?Bx8G/QiX5CZzFjZoAOFh/p6xXb95Hl0FqOY6KC8Tqz0ZQkuL0ByAG/H6Rywt?=
 =?us-ascii?Q?rjgLDr+hfFZeypVMWgS4F/AtWmcnamUgU8r10L645x88qNTGS3Cp9wr08kXC?=
 =?us-ascii?Q?Z1YEZHXtcXiHlnTRf6E2qb+5fltWfMu5PmSFT1XFSWInUQHK8Un7cYz6lbzj?=
 =?us-ascii?Q?VbV3r6JauKE11DRl87y6cDmDTZMDC3f1o6lYONzq2chmc5g8VcsCF9oV8WbC?=
 =?us-ascii?Q?afJZPl4pCaZe7DdeUf478POkYEfv5ai4SfOcN5tLHlFCyRd9ebiBHuC3jPp4?=
 =?us-ascii?Q?PQPfDYx10jqevnhKxraBVnWP+g5hf20gPCJNsSvdhs03pA0fITmIiJePuW07?=
 =?us-ascii?Q?D1aVOa+a7apJ/50yqo88FS2fNNAGc14DsPs0tnoKay3U1hnlpLBSKuRW/ar8?=
 =?us-ascii?Q?sOnOc2ibgWPa+CJAq4tte8kvC4aOwrh5UJIkTis2wElNvbZ6ZOAflw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y5Cuu9Pqmpx81jmtLdHG2Asr4EzwsXXiYy+ZMMyh7ijau42ntGN+r43EMQO1?=
 =?us-ascii?Q?M9zGOmzPHrAyR0XY30DnM50yszpYjU1CpBuKOvcZSj2EUamjsujT+5bbN7i5?=
 =?us-ascii?Q?u+HUJnpUvFZzT+CIWLcd7RwN+kPP3zRSbXjPqLgFXbFDXb8OGUaf4sXGZDnV?=
 =?us-ascii?Q?CyUeJYtjaHDVXSAnVHEA28EWZBZ/DbYQ9k2j72na4zzPmNkYwfKuH3dHMV5B?=
 =?us-ascii?Q?2ylM89xgBCyfgSZxsxfa2ThvfB+EomU1z2o9VU48+/sYfv9hieM0Y8rdaXjn?=
 =?us-ascii?Q?dzKZ10lRHxVXsfn7CRmYGFkTIaBBCz/KX4jsunOqGRn9YmO/2VfVwU+zdJK1?=
 =?us-ascii?Q?Gy/j6v1fKoGAGDHONninw3ZBJXy0XCLKuaSaClHF1a6DW8zRhOC37DsAlOYY?=
 =?us-ascii?Q?HjFbC7JVMjvqb2fBpgO5jCqrdLCMdOlhhJbuvmWdPBWkbEpobXT2XLZ+Aou7?=
 =?us-ascii?Q?ZO4Jl1DYDEt1g07TagCwAYWezTmC2GWCPyJnu9TGBsNEjYebuENrs3RQ0+M2?=
 =?us-ascii?Q?wXtKSxJ4p3uQqAdFoa71YMfVNY4EkUkLiybE8DdOwB148rGAOoGEVeuIgx1j?=
 =?us-ascii?Q?eXQw3ReTjaBU59eejV+BP4NeXB/viswrGCA/hi+68QWtViTLNztRwOiMse2I?=
 =?us-ascii?Q?heKZfK3rM7CDmkkO6wnz1bK2znZp/LziFm/bYJfRuWHe7hBox7lBO37KLGVg?=
 =?us-ascii?Q?+s/jDZaLpDT9GOHj2O5ZRZpTw+R+2+3n1zi8TvG9JXtoi3Y/tcYSjMGLVRfL?=
 =?us-ascii?Q?YDZtAc2n9vQ8Jg4PLe0rGT6lBNUSExub0tS40SKB4ocLo6DoEy45cdJZZVMp?=
 =?us-ascii?Q?oHuRAuAsT4TGxPJCaqCFYjhdFUwuTx+WxOf2hk7hRhqCOr0CJSILoq042kie?=
 =?us-ascii?Q?Zf8OG0onGN458/pXFIqQTgI1eZd+yLv0AnsjSStjf3I0oNW7xfbF5mWlQoso?=
 =?us-ascii?Q?GrpFHfJohYrkjl4zLFA5fVfbLKxILbwkoFEXjvzQiEcDl/715fDsBvW2s/KK?=
 =?us-ascii?Q?FaHqgK/pEkhDp+970HjXr2De0vN4tbcZ/p0vHY85Ka7tKSzvEVIyI+fDCysT?=
 =?us-ascii?Q?XRr8b/K2C07+ZdxNdgV0Knew1Vj1h+7RNxdzoPOWLDQS7n+w1YJJFwhnlmUj?=
 =?us-ascii?Q?g03on898z8TkkURxvcpy7yJqSIiSjWB8eZ7nj45Oas4Qg7muEuhhwXllkFHD?=
 =?us-ascii?Q?8PA7UMfJit/j7ZaTZeZW5WvyJ3SXtrCDHOPrLrZ6exQ7haHyYK3O6zoY70aM?=
 =?us-ascii?Q?aBkX8hTBZbfVZW3OZqsK3hawgvvRM7OE1mTVTw4j5jAcvYa/4sPN2sa+q1iB?=
 =?us-ascii?Q?atVgd2JXVI+lqyaIeCD7Ft/A9RYkAKkAnp5UoKuaDEupG5Q89oremh/GGbxg?=
 =?us-ascii?Q?NkcvPB17iBLUn7Hy3GmmIb1Deyxm8X24lyj8xfhh380QxZ4MkUt7FaGZruKK?=
 =?us-ascii?Q?m/nGVseCTlUvs1fSExXE+vypQX/4lA4Cps6ScPRauWcDll9q9qhjWGVXRC25?=
 =?us-ascii?Q?kRolOW23OfjIpsRJd5p8y1DKXtfnHfyis5pbZxp/oEvIbGU/COwk/YxXeOGY?=
 =?us-ascii?Q?hhME1iNTgaU6IFkxa0D+n6OtYkWSwtVTMFHAqiH2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1761b0b4-a6a6-475d-50cb-08ddd8c83206
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 11:14:10.0310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ufk4MMHDlVs50obdkTeSnAziw6NNEOv6UlwlhaycHPja5ZydvIKWqyX2/ZyQx0NsG33fz7g3IdC03K81kh/4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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

> >  static const char *
> > @@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct
> drm_device *dev,
> >  					  struct drm_encoder *enc, const u32
> *formats,
> >  					  int n_formats)
> >  {
> > -	struct drm_connector *connector =3D &wb_connector->base;
> > +	struct drm_connector *connector =3D
> > +		drm_writeback_to_connector(wb_connector);
> >  	struct drm_mode_config *config =3D &dev->mode_config;
> >  	struct drm_property_blob *blob;
> >  	int ret =3D create_writeback_properties(dev); @@ -269,7 +272,8 @@ int
> > drm_writeback_connector_init(struct drm_device *dev,
> >  				 struct drm_encoder *enc,
> >  				 const u32 *formats, int n_formats)  {
> > -	struct drm_connector *connector =3D &wb_connector->base;
> > +	struct drm_connector *connector =3D
> > +		drm_writeback_to_connector(wb_connector);
>=20
> Please pass drm_connector instead (to all init functions). It would make =
more
> sense.

Was thinking around the same lines too let's see how other react to this RF=
C series.

Regards,
Suraj Kandpal

>=20
> >  	int ret;
> >
> >  	ret =3D drm_connector_init(dev, connector, con_funcs, @@ -339,7 +343,=
8
> > @@ int drmm_writeback_connector_init(struct drm_device *dev,
> >  				  struct drm_encoder *enc,
> >  				  const u32 *formats, int n_formats)  {
> > -	struct drm_connector *connector =3D &wb_connector->base;
> > +	struct drm_connector *connector =3D
> > +		drm_writeback_to_connector(wb_connector);
> >  	int ret;
> >
> >  	ret =3D drmm_connector_init(dev, connector, con_funcs,
>=20
> --
> With best wishes
> Dmitry
