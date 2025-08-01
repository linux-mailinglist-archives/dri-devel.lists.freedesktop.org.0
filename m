Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0BB183D3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D55610E885;
	Fri,  1 Aug 2025 14:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXS9wZ7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6E910E863;
 Fri,  1 Aug 2025 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058785; x=1785594785;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s22z49TSXW1sLf+E4aHagrZnxZ6SJ0nBL3CEni4Egus=;
 b=GXS9wZ7OFanIogYwqt51OSax7hynjkNyarDG1li0PvmFpRQBRffd1Axl
 CzLGlNDCQDCskNG1WMDleRi86KiiX+lfUU6Apz6bddW/na5ha6sUa5g8o
 EljTXlTdUIQLZETiT5vD9Jo0IVab6GUETZcGWcOxKHyGClMg5Hq5ns/A7
 AdZNDij6VGnCxPcxMosGMQsaXrMdVXtNN7gJ/WyooJczvi2FTCINwlV/r
 QhFgCkhwru75nEIoAYJeAxOuXUJzuNUgQXOkET8i5Uzh0yQcQxN52UsHJ
 1WDUkQ6U/nUfHJkqifIWOtf0wJwSxSS+jqrwxrj0ZtQIgM3nIQgk/Vort w==;
X-CSE-ConnectionGUID: hzsRBbkcRDuMMzjRteiqhw==
X-CSE-MsgGUID: NwDya5cxROm5yiVzyCxuKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56486679"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56486679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:33:04 -0700
X-CSE-ConnectionGUID: nBJS3LqTRg+VJATt5p5obg==
X-CSE-MsgGUID: H4Uozt3PTvCrdvD6vzR8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163508569"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:33:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:33:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 07:33:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRj54zJOtxDv6T9ENazyai6VAQqFIG5w/5C7Vpl9hd6H1m4GFrzHd3SntZm9x60nq7u5lrxkAItqzHDfeTyK4l38h7Ny3MlRSnXoVkNrZkrNX0SxokHPpLifKSOqSq9hgyMwtbFBIr7NVCk9/brjb7P20JWwSxbg9BuRQC6frfbx4PhHCPm3etNYhLgQKKP9hZWXz5BFppNsiFMCdCIv2cwmN4/6egynM/EOrHPzPBGrAwTODsp+z1GYsoqkIzv6GHMz6VOcmDPiJRfekFO0rVm3d9EAnsqziVezYcu+J14h5CSx5HczTkkUPeTc6gUf2UdTtpp6xR0A0MZvoaESqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1f9yA8MK/8jsGE3gs5LH+ZwV6czdLQcyLM5vhkwIyg=;
 b=qnIKs25LnbzYl0Q0Nwy9e5twA0Hit1M9QVllz84MzgR0j63F2vHOG+iR2OJHUoPrKQk3XOvBGQvTxYINYjvDzYkijveGpnG+Jowy9hifjYGtN9wVf5nmb9eZHVftzWIE/LerU+1q/vlz5N/4Y0dmhWhy0TNxbL6YYAVKCbB9A06+HO8Zy6Xn0tDM9zF7N2H8pKBPJGo9ekwZkJ6UEAZ/fYqWwzl/yw+0HpqV2RNSSG8excCTUrAKMB/jS3IBHQ0uKWX4dRZTs5cfeEOsbm7LAiJR1SV2uJP9LuCwcJFaSflMvUWJl50aILs//6OM9QucrqeCQGDbCwORBappdHp2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS4PPF2720D4410.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:32:33 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 14:32:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?iso-8859-1?Q?Ma=EDra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 03/28] drm/writeback: Define function to get drm_connector
 from writeback
Thread-Topic: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Thread-Index: AQHb/SGaZSHpeNVOa06DzLV6J9usq7REWNGAgABFs8CAAYSngIAHFUdQgABoVQCAAETuAA==
Date: Fri, 1 Aug 2025 14:32:32 +0000
Message-ID: <DM3PPF208195D8DC63FBA1BED2E42E28671E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
 <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
In-Reply-To: <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS4PPF2720D4410:EE_
x-ms-office365-filtering-correlation-id: 6c53e986-4f17-4965-3622-08ddd1084090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?udotxbc3ysJe5Cc+MtrP+TbhuPVVA8LSlMbzGub0fP5m32QuqrVodKrcMK?=
 =?iso-8859-1?Q?eZ55O8iEocIdPnVQ/OmnhD5n03iel3bEA46T99HoEKz0OV2We3GGbuxKHw?=
 =?iso-8859-1?Q?ngXG2TfDfeQ7o9vuYdgYYY0Wg8oE5q+fPXDwcaEgQovt4fpe7yV8j8m97G?=
 =?iso-8859-1?Q?R9i36159xT6bXt62SMHINXA5XjoreFUVJaiTlWMPx/jGgB3yirKd5Q3nCv?=
 =?iso-8859-1?Q?5hG59e4TzGfku0HGEejREs2U5EHWKzDfzMtFfhN5NbWKoBxiVWCCZDlC3M?=
 =?iso-8859-1?Q?pfXfe6KDOkqyR1OJ/iV5NdEJ9vFP45BegdrNx1WOEov+iZqemznp4HBsnV?=
 =?iso-8859-1?Q?Kw1MKrehl3ALQ0VXM5wEZXYN6DJaJqcnlEUKlhRpeAbBw3PuWrlhED7eCk?=
 =?iso-8859-1?Q?djGROvayGSp9uasH7YDnUB0G7LMk/K1z3QBpNAMBQH5wzjMWMN4YywFAT1?=
 =?iso-8859-1?Q?CEEVfNKZxk7TWF9ap1keOHf/BrUGOmMDD6TYqAWXxiP1vColRgdwtoXJ2V?=
 =?iso-8859-1?Q?vAYtyJ54gJqYrU5KMDs3ii2ggIzridn8SLSLXANioz9m1IsCK/7R+9Ajru?=
 =?iso-8859-1?Q?ao+fzCTZm7NLkm8tNkE+ss8ygl75w1A/nHOO05kdWlEto0DOn5KbYv5FAf?=
 =?iso-8859-1?Q?fD2ywYFH2MeakxZKZsBoBaPMYDfrKLtCiZX9PuaQOTfW5xlfixzumjXMNv?=
 =?iso-8859-1?Q?YNyajsMZcV+54NW7PX3ihEtKsLiXAoJFaveCxqUn3KrK1/UcaKBWTNUJ1q?=
 =?iso-8859-1?Q?B25uwQPP4Xq+T7mkRAr5Y7+zBs05x+dOJWx0/Kr2tkK5Qp8iWYNfTWIJHe?=
 =?iso-8859-1?Q?gEQzIaKTbINDPt3267s2CONIEb2ZU1NlmiRyDFUn57pCd9z+jPIvzZg8Tl?=
 =?iso-8859-1?Q?7+dJfAttAVDw9aP4w3yrpYZhFjPUR+k6AeE3NDhefFAnLZ07vUyRnQk0f0?=
 =?iso-8859-1?Q?0HgQoU1YYVFzTQI26TAi8GC4xDlS4VfmVKd22fbS0EufBxrEIgy/5v3uj7?=
 =?iso-8859-1?Q?agvyGv/zrGkPyxRr4InP6lW0aMTlcLJ4XarMEQKdgv50AC2we/ITOzS/wI?=
 =?iso-8859-1?Q?1TgIVLPZuEjtHDHtXnWlB/+3E6JZX/0CW3sm34YtSd5KjMqbnZAOfRusUv?=
 =?iso-8859-1?Q?PaPTvEDd4y0/nqqofQHCwK5MoSx5+XZJN9wekrGSrhEI6JW0c+1l0WvgXF?=
 =?iso-8859-1?Q?zrcXG8gwDZLjSeHbJIp9QU7K5/sbUbWIa57s7zxQCH9U8L18xwYPl8P5y0?=
 =?iso-8859-1?Q?sYpkJzfIPilLbBFt1uiNd4G9DiBCyuXUpq8LoC1W+So3Hz1tJH2DasqM1L?=
 =?iso-8859-1?Q?Kgbt8+sxwzhgIsn9P0/cyPssoUQnqDzfHs2BW4cobVyWiwG5lIYCVtto1q?=
 =?iso-8859-1?Q?V7ruS7yfcfi2a3LdN4oB+K9AFOs/NHD2ykDp2yn/T5dls4HhtFDVLFE9Il?=
 =?iso-8859-1?Q?azaPDrG2Q70GsU8iIFfZNuRAzrOxK3L2XCpD9u2zuJbYuW5/Cr6kJyhLTY?=
 =?iso-8859-1?Q?f3cbhokLtkHlb3tQLE1or0hHrj4RE6qnRMdoRrS7J3XvXmNU9Yjd+ppEhO?=
 =?iso-8859-1?Q?OADewCU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GRAQ60P67vqamhkFDlVB5bEIaXmjE9IzCl/dg5Hf+sO3UG6sRu8HmE6ECg?=
 =?iso-8859-1?Q?f7hqFPXXPDRe8cvMuI//dHyzChetaaSnPbmPjMJ/HPN17hfGRMXRzgvcgS?=
 =?iso-8859-1?Q?oEoh1F+DGdRWXc0mEUQz/xCOYAAgn7gKjc3SUXDc27GI51uDLuFt3/Niix?=
 =?iso-8859-1?Q?XFDIByM60oTvgJQ/vR6XJwRqBd67YlQyLGehCSGFlDCrKb1EtJYQk4xpkI?=
 =?iso-8859-1?Q?N98mxVXdOMhDDNUpSWaoBwy1wtOc1rpgO21tSSyuSJ+V2nczg7tZS6LuuB?=
 =?iso-8859-1?Q?vHCkt18PMFVMdeVunWCE8OUeNBy3OglD9+eN6zx1i0cJ5LxRfDq/cn+oqG?=
 =?iso-8859-1?Q?84olaGsiy8A7w3VXgQ/zw30V3BTVQqoaTib9ERN3GVPv6c0WNS1sU+LLxl?=
 =?iso-8859-1?Q?rU2IqbDa36+r7Zh6ZS5b+8U2MFWXtZ1C8n1o6EjuXKx1ZljFjqBmzQir0F?=
 =?iso-8859-1?Q?ngDQqbRP9nvMH1Ur7112ItyloEoN/q0RdZV24iuiSvJuOBkDFrHTDy+BN4?=
 =?iso-8859-1?Q?VTYwH8c+Gr5xDFxS86qQsG7YBS/hOOk79cApTvz/5Z+W9Um+nmiWaecApY?=
 =?iso-8859-1?Q?Nb+oMrFVpEhYeZOpNUpBH/xl4bItS2ryAY7MwUuMHKdAvcRSy+vJuwqqxC?=
 =?iso-8859-1?Q?+y+nvbhUz2cjsqKGT7EZwu6Pj48gdzggf2tWWeTBe0f+V82aKISAZ8nqwW?=
 =?iso-8859-1?Q?0MTfMu1kaOxTKt9E1KJzbN3tsF/P40EfQt6ERAR8o7FPUI08E+z2/n8NIa?=
 =?iso-8859-1?Q?bel3IBxbCkL+R4Tn/Mzn5glsUu3IRA2xhhwIdwpxls82nAbAh0kyoBdoc+?=
 =?iso-8859-1?Q?FB2j927/D0m2qzIrqHSMr143QHZM6E1hrl2De26ELc2QyGNA6XOKbsatP3?=
 =?iso-8859-1?Q?xYXWlxlKSdb2palhHsLFOTHZnUesHm99CjXkGfdtsMqEf6R05HkGy1ZPBW?=
 =?iso-8859-1?Q?xENMb0gk8U2cCSgTjlhZf5SQraqfaBuq49MRv1yVs1PO5cTb26ZOeTcJ4j?=
 =?iso-8859-1?Q?8795/DqqtsQ4sqHdbWtIWEDLWZUPvoqJLxQSgp06I6Swdy20cFM+k8yNf3?=
 =?iso-8859-1?Q?aqYj0+fmWR7lUFORNpeaUrYOOGgehSLcgQsNBvND2UdWLSjyLx76utv/AN?=
 =?iso-8859-1?Q?mgjQe2eMpcEUC10mT0KiF3xdGB8W5qoFQbiX4ksFvB0s3FEGXqSBWfQTZY?=
 =?iso-8859-1?Q?ppIzDlwceGz3WrFZIA22i4qKJsH9358b7cQyb0pjrLOpwR40VkpkLhGtep?=
 =?iso-8859-1?Q?Fo5/LseQamvSIAaOPwUlr4LO35I6qF64uieJlq0bivcovO1xWUwdfuIl2l?=
 =?iso-8859-1?Q?cOkaFohDtXdPRsrO2ta4VEn3pLmZBZ4P3m+w8vMLs63xnhG7TDFG06g8vQ?=
 =?iso-8859-1?Q?xw2ec3CqUFtPkPKUtyixHKjqXf0GvUPoOmtW9+bIG0q77spMHAisyhJR2m?=
 =?iso-8859-1?Q?6RuGmEFsiJAY9kjFgpT2HPrLs4uiyxiKCF7+rf+spUiKYwwVtFE/SbVSd/?=
 =?iso-8859-1?Q?TahviSQ449mJwVSEPdEsJeG5+2qAUwEossGM05BaHuWHphPBnZvfn8Dag2?=
 =?iso-8859-1?Q?hzoLeTQy9sJX8T5t6kwQiYRPr+gkwybrgvg4cVpNK7G/aLo4a9WOjLFGEA?=
 =?iso-8859-1?Q?wD9l9eLGeEDVaPPz2pfUQgkpdutEjpOGXG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c53e986-4f17-4965-3622-08ddd1084090
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 14:32:32.9265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fXP3gFeTubd2GrYv6qg2k0h5Xui2YWCkN/8dYXA2Yugm3tIbawsk98/Ic+WwlHLFoWkOUQN9nEo1vkRXPwcwow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2720D4410
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

> Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
> drm_connector from writeback
>=20
> > > > >
> > > > > > Now that drm_connector may not always be embedded within
> > > > > > drm_writeback_connector, let's define a function which either
> > > > > > uses the writeback helper hook that returns the drm_connector
> > > > > > associated with the drm_writeback_connector or just return the
> > > > > > drm_connector embedded inside drm_writeback_connector if the
> > > > > > helper hook is not present. Lets use this function and call it
> > > > > > whenever drm_connector is required mostly when connector
> > > > > > helper
> > > private funcs need to be fetched.
> > > > > >
> > > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_writeback.c | 33
> > > > > > ++++++++++++++++++++++++++-------
> > > > > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > > > > b/drivers/gpu/drm/drm_writeback.c index
> > > > > > e9f7123270d6..d610cb827975
> > > > > > 100644
> > > > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > > > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> > > > > drm_connector
> > > > > > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> > > > > >
> > > > > > +static struct drm_connector *
> > > > > > +drm_connector_from_writeback(struct drm_writeback_connector
> > > > > > +*wb_connector) {
> > > > > > +	const struct drm_writeback_connector_helper_funcs *funcs =3D
> > > > > > +		wb_connector->helper_private;
> > > > > > +
> > > > > > +	if (funcs && funcs->get_connector_from_writeback)
> > > > > > +		return funcs-
> > > > > >get_connector_from_writeback(wb_connector);
> > > > >
> > > > > The get_connector_from_writeback() and
> > > > > drm_writeback_connector_helper_funcs should be moved to this patc=
h.
> > > >
> > > > Want to keep them separate since they themselves introduce a lot
> > > > of changes on of them has use introducing a new
> > > > writeback_helper_function
> > > structure.
> > >
> > > Let's see how the series will take shape.
> > >
> > > >
> > > >
> > > > >
> > > > > However it feels really awkward to make drm_writeback_connector,
> > > > > which is a wrapper around the drm_connector, to use some
> > > > > external DRM
> > > connector.
> > > > > A quick grepping reveals API (which you missed) that expects
> > > > > drm_writeback_connector.base to be a valid connector. And it
> > > > > would be very hard to catch sunch an API later on.
> > > >
> > > > Also seems like I did miss the fence_get_driver_name one which is
> > > > an easy fix or did you see anything else.
> > > > Really don't see any other problematic areas
> > >
> > > Yes, it was that function. However it is a nice example of how easy
> > > it is to miss a call. Likewise anybody else changing the code might
> > > easily not notice that Intel driver uses drm_writeback_connector in a
> strange way.
> > > >
> > > > >
> > > > > If you want to use DRM framwework, while retaining
> > > > > intel_connector for writeback connectors, I'd suggest following
> > > > > slightly different
> > > > > path: extract common parts of drm_writeback_connector into a
> > > > > common structure, and use it within the DRM core. Then provide
> > > > > functions to fetch drm_connector from that struct or fetch it fro=
m
> drm_connector.
> > > >
> > > > Causes a lot of changes in the drm_writeback_connector structure
> > > > causing every other driver Using this to change how they
> > > > essentially call upon drm_writeback_connector. This API was to
> > > > provide more non
> > > invasive way to give everyone another alternative.
> > >
> > > Currently drm_writeback_connector is documented and implemented as
> > > being a wrapper around drm_connector. You are changing that contract
> > > in a non- intuitive way. I think there are several options on how to =
proceed:
> > >
> > > - Clearly and loudly document that drm_writeback_connector is no long=
er
> > >   a wrapper around drm_connector. Clearly document how to distinguish
> > >   those two cases. In my opinion this is the worst option as it is
> > >   significantly error-prone
> > >
> >
> > I think this is already done when
> > drm_writeback_connector_init_with_conn is Defined
>=20
> No. You also need to update drm_writeback_connector documentation, etc.
>=20
> >
> > > - Make sure that the DRM framework can use writeback without
> > >   drm_writeback_connector and them implement all necessary plumbing i=
n
> > >   the Intel driver. This can result in singnificant amount of code
> > >   duplication, so I'd skip this option.
> >
> > Hmm Agreed.
> >
> > >
> > > - Separate writeback parts of drm_writeback_connector into a struct,
> > >   make drm_writeback_connector include drm_connector, new struct and
> > >   most likely drm_encoder. Implement conversion callbacks (like you d=
id
> > >   in your patchset).
> >
> > Again a lot of changes to other drivers which everyone will resist.
> > Something like this was tried previously with both encoder and
> > connector which was not accepted leading the patch series towards
> > creation of the drm_writeback_connector_init_with_encoder.
> >
> > >
> > > - Rework drm_writeback_connector and drm_connector in a similar way,
> but
> > >   use writeback structure as a field inside drm_connector (similar to
> > >   how we got the HDMI data). This saves you from having all conversio=
n
> > >   callbacks and makes it extensible for other drivers too. In fact yo=
u
> > >   can use an anonymous union, making sure that HDMI and writeback
> > >   structures take the same space in memory.
> >
> > The idea of not having it inside drm_connector was that it's not a "rea=
l
> connector"
> > and we should not be treating it like one which makes me a little
> > doubtful on if the community will go for this.
>=20
> Well... It is a "real" connector, otherwise e.g. Intel wouldn't have to w=
rap it into
> an intel_connector structure. I think this is more of the historical beha=
viour - to
> wrap the structure instead of adding data to it. HDMI connector showed th=
at
> it's much easier to add data, so I assume it would be a preferred approac=
h.

Sadly the drm_framework does not treat it as such and again as Jani had poi=
nted out this should have used
drm_connector and drm_encoder as pointers within drm_writeback_connector pe=
rsonally I can go ahead with
designing either of the 3 designs available but let us get a consensus here=
 on which design to go for since I had floated
a RFC for this design to get an idea of which design to go for before comin=
g to this design and doing the final work.
Adding some more people here to get the discussion going.

Regards,
Suraj Kandpal

>=20
> >
> > >
> > > My preference is shifted towards the last option, it follows current
> > > HDMI subclassing design and it doesn't add unnecessary complexity.
> > >
> > > Yes, this requires reworking of all writeback drivers. Yes, it's a
> > > price of having your own subclass of drm_connector. No, in my
> > > optionion, leaving a semi- broken abstraction is not an option.
> > > Whatever path gets implemented, it should be internally coherent.
> >
> > Well to be honest this has already been done with drm_encoder which is
> > placed Inside drm_writeback_connector with
> > drm_writeback_connector_init_encoder
> > so this is not something very unintuitive. Also I feel messing with
> > all other drivers by changing writeback structure is the more error pro=
ne way
> to go about it.
>=20
> This is what we frequently have to do: change other drivers and depend on
> developers testing them.
>=20
> For the reference, currently only the following drivers implement writeba=
ck. I
> think it's a pretty manageable change:
>=20
> - AMDGPU
> - ARM/Komeda
> - ARM/Mali
> - MSM/dpu1
> - R-Car
> - VC4
> - VKMS
>=20
> Yes, it requires some effort. But I think that it's better than just maki=
ng
> drm_connector part optional.
>=20
> > Also it will be understood that
> > drm_writeback_connector does not contain drm_connector to those using
> > this API as it will be documented. So its not really the semi-broken
> abstraction.
>=20
> Thinking in OOP terms, the encoder is just a field in the struct.
> drm_connector is a base class for drm_writeback_connector. By making it
> optional, you are definitely semi-breaking the abstraction.
>=20
>=20
>=20
> --
> With best wishes
> Dmitry
