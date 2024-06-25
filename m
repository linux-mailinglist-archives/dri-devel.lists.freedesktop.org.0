Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2B91695C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 15:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68FD10E64B;
	Tue, 25 Jun 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caDS/GL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD6410E64B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323414; x=1750859414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/41q3b/P9RVL7c8sXrYzlsiduffElswjgCRriLEoHpA=;
 b=caDS/GL//4LQBaK6hhU5zAWvOpoRmn+530m5DTw9Po6jVpOLJeQqNQ/0
 7Md8B6UWT5FUU4gps8G62J9GJU6SIqe/eRIS9e5UdMtYN89O+7gvAdZ/e
 Ra8Qtsu9KLJ63H+J6iBd1/LFftk+Lp+lTpAwkKWa2biHQcCa2Q5IZK0Jl
 VZWLb4KSp0qxCDo9KL9f+eW1VA9XAJqaGGQ5wOh7hiIvGH+PCWfcrgiIZ
 ipnuU4gem3uM47BC5vSlCVyzbzveBq1/5QsmLkBaLmk1dIGqqz1yxSyrn
 5ncEDcXJk1jla9+XPyCFyZteH9qabXI6j0WBUGnJPDG0c7ka1LSYkUHV3 w==;
X-CSE-ConnectionGUID: H5+7cczERSqZ/eRsgueNow==
X-CSE-MsgGUID: /LtL/dUXS6mg29oltZZ68g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20118919"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20118919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:50:13 -0700
X-CSE-ConnectionGUID: +51SVKRuRreki5TD/AGtsQ==
X-CSE-MsgGUID: NP1co+6mRFeYghyprAs58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43539320"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 06:50:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 06:50:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 06:50:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 06:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asUrKJY1VOA9Mx4tr2wV7+WO46fjZca5YcyTeGHMPzZUPe83VW3AORGjYOfXdDnOsaTSiVgXW6HvfG8hfQOPBk6N72lSJ4OwpTEbo/BgIrD10109hxpgv1CNjVWD2yfBVV/cNwVJmIIuL+tZmmn7HI3qTa3mSOPP3wPFyTtXZk/i4lKXRmzs5WpKnNN97PZB/T2oRpqJiWLWzqYGE8PBgKzC94f+Tlon1cmzCIntr4Pp9R2pZRHxL5RkbaBhgIpAD2Ah16iHCUYaUytK/A/Jf0rncDzBu3u+/U4mXGSV4Titq0SpMOxuwCXXuiGfs32prYaA9obxXNdWiW8ab+xIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh+Jokw8S39CicFXtL0Mxxzo43gS56+5kctC0wNqUs0=;
 b=Pd2VJTu7jTj2x6VcMfSSzsrW0jHKEOc/2AbQz1j4OVjQd3iV7Pg0GbtGb3QCzf8j1vAFw0s8er07VaBM5rnvP/zsuJ11tSovhp04sUMU+oEA8ye8jKlY1C0u7yUv6lpPnHKFOmWjfVtlVsANaNHLi3VRYwBdOS2llFhTFsLmOgeYygLL0NYY6duUCu8FQnto4QJ6lhCmj4LMvrbnbSWm+F7vQE03Ziv5LiV6Q01C3Nj9dCP4CqyXZT7bZ8JrzrM+XPy6xktv6bqhdb667eSfnHCFo0vrViSRLbzTxo4MX4hS4UVFnnRHpjwqMSO4S8fhqZz6Yx0JfyFvy1rwuOWJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by IA1PR11MB8173.namprd11.prod.outlook.com (2603:10b6:208:44e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 13:49:43 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 13:49:43 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luck, Tony"
 <tony.luck@intel.com>, "Wang, Yudong" <yudong.wang@intel.com>
Subject: RE: [PATCH 1/1] drm/fb-helper: Don't schedule_work() to flush frame
 buffer during panic()
Thread-Topic: [PATCH 1/1] drm/fb-helper: Don't schedule_work() to flush frame
 buffer during panic()
Thread-Index: AQHasy7crBeDoIP7ckWNGUsx0I55mrHYo+7A
Date: Tue, 25 Jun 2024 13:49:43 +0000
Message-ID: <CY8PR11MB713430B4E2F925B88430784B89D52@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20240531074521.30406-1-qiuxu.zhuo@intel.com>
In-Reply-To: <20240531074521.30406-1-qiuxu.zhuo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|IA1PR11MB8173:EE_
x-ms-office365-filtering-correlation-id: 9d016e52-fe72-48a5-e058-08dc951dab2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?Gs2KdqBFwYQfoO4YQ0o31xPDG1ehOi1Ja08eBHiPrN3xnvJUTVWHa5zlUvcL?=
 =?us-ascii?Q?gbf5nRj/w5843wLVg9LI8gAEFNhyz8HTEL/a+kJ7f4GbhOC1XquVPj20fYqZ?=
 =?us-ascii?Q?Xi8sUIHfFT1/AUtAvnVY60afnmY5wh0Ekp9JqiP/V1giii55ouMIo2FBwyAd?=
 =?us-ascii?Q?8Qngn+XGHa8mMuoAGlKqeriQpg8WZoLBG++HXPL1CFtkKrjPsLc5RiJLGTZP?=
 =?us-ascii?Q?3OQQgY215ABmMw4pgVJklXiU4K+m6ndfh+o/bvFkQUowHrDmtG2IptXouGW5?=
 =?us-ascii?Q?19sha/2NLj6ZrNrAvlALHBB0ZunENLByL3QTIgQzRxy2LKMOAEKKng0DJoCj?=
 =?us-ascii?Q?641aOQeNQFBKnGh4IHZCAjN/+s6NIsTj5L7QwHAy0EyzEUhO/Q7BJsEV4ggD?=
 =?us-ascii?Q?xLHlsoAF6LDAF5RJHcdc4ysgx2xRZq5iRneQHRaHSsaQNUsamJ89+RwIyI0p?=
 =?us-ascii?Q?ysc9Wq17MynpITWy6oveHjfo7PnRBi5IRfwdVC3a39wrjYR+Gtsfg3cdKjAW?=
 =?us-ascii?Q?T/sfEzlzoxuxiYuRj7ixn5WNbz31b2tUV4sawD6mfFShPy7SfR8a2UMYFNCh?=
 =?us-ascii?Q?MuCZ1OjWJGh2p5AQ+QTVSsNNKSmrs9UyTKnVx5gwSH4C2ft447eAEYJJM0Wo?=
 =?us-ascii?Q?rOCusGm6WWRrq6Llz/GX9WCfEKKIn7+rrKD4T9EXPDFHtchtW4w/0zrfabet?=
 =?us-ascii?Q?11uw96Pv6AcAQKQdbAbFudSz1Q0hKg9tY4Bh/6TdnftyH3JsTdLW/cdgMg0v?=
 =?us-ascii?Q?idz0IJMgilXDklK79Lli7Cgd0tnHpSFG/aAZ0XTtX/za/E+PFwnJCCpSsTV6?=
 =?us-ascii?Q?HHLaCGFz9ZAO9ggoWFNhPOugcuUgLvNrpbQbeF1FZRr3/pojx4kvuAsamM1B?=
 =?us-ascii?Q?mEcDuvEDwfbYYQ+t9/RmW4YQrpJrzgwTAffAQnyhZuPBPa+Pb440GHyky4J2?=
 =?us-ascii?Q?LKH9dBOTq+NxS09AuhKispdHfZB1BDPKrzKmNIfXhPCHe9OQgUCsqSt/t7/u?=
 =?us-ascii?Q?jXhxubVxA4h4rzBgVINf1AT++EUY6Ie981SYMhDfPB+0c2mTem3saKZvRNbx?=
 =?us-ascii?Q?2TI0BHNvylLwcD9CQrueBOC5mdnP7eDSXn9NoZrwqFO4b+lOFNLLDDrfJH1B?=
 =?us-ascii?Q?S0Y7nlXRbY6xOXx8854ofDJfe6EsbyOaCAuRG0pfpLaEtyLw9z/X+FVVJotL?=
 =?us-ascii?Q?eC4bEler3cW2INaoYZU6JN5wbgurTj1Q6m6oZ2A+v5/e3prPgx4cHsXvX3XH?=
 =?us-ascii?Q?E0Zo3Hrk5ucsl+2TMU6APXk/qquCfTlReoc90rcAvISJ8AXSGsfwiA1woF5l?=
 =?us-ascii?Q?Fug4vPMFkrKKf52X+AC44juMQ7AniTUzf2ikGHfoMRbAhjA1xyJlEAuFR9kB?=
 =?us-ascii?Q?0eLsh68=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7134.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IjP1/8btxECcb/MYk+ukye2Z9u1JeNHZUn0igRoO4ABD++ZUNJnRH/+8DtAG?=
 =?us-ascii?Q?fr6W2eLCO1roLUKh7nS/0pfz3wKzUi6B05sYZaLKmK9mLJ6aFpp0ntERd9r3?=
 =?us-ascii?Q?UknR+zG2adHHuFHohFVM9IGGMppC1xC1iTuR5POd5HKY3aanBtFVIXqSFWH7?=
 =?us-ascii?Q?VAaCxs/x1zuK/r7nlrseI7/dO2Em8a+cYwvnNd9SwE8jGcKFofhSBsD82aLH?=
 =?us-ascii?Q?boOkHId6vsZfbgk3MrCvMoed/XT+oOqx3OcQLFMmhOK9GtPs5g7fzmT0KR7d?=
 =?us-ascii?Q?rlp90csz+A/mahofWLlD43vo8OeipSDGNswVbxDLBP7tFWTsS83pUsgYwaFt?=
 =?us-ascii?Q?mOSGoeQMb4dV42vVOisvdMbft2p4oPvpL6Nfj4B1LIuIbv5hvsP1yPog27Kz?=
 =?us-ascii?Q?yYGjgG9XOYZYTAre9hXnxfHvXU9dFPfpNHMzG8p7nLmLOvkPs5CrS/ny12os?=
 =?us-ascii?Q?4/ri9YWJF97QSosnbY7vtfeL+lHmQazC1oYGFQpL3jF9ITvsJgxF/nyb5GPp?=
 =?us-ascii?Q?G6ZWMgwlzLhIMfQC5N4UYF0LRVbR+zUGcfVUgEMmPE5RDSGKNLEP9kQ90Mib?=
 =?us-ascii?Q?wxezc7RmVQABLhdAEKqW9TIgyMlYHxZwKJYLyxmnDkEw0+BZ7jaPlRsPNLif?=
 =?us-ascii?Q?WAMRP8YbIGw3fQE1YEF31HO44ohduF8spOmH7KvAZqImd99VZsSm0l0W0rJ2?=
 =?us-ascii?Q?SxwYwG/N+USVmEOg9DCc5UjEwEnFFV6hzpetYJRO2y4SZFMEPDTk25R/mg0e?=
 =?us-ascii?Q?+W2bNHFCXZxflujDNu/i0nvUq9WKFJkrEI/tPC3Zt8YMCZhaP2wbLM//kvWt?=
 =?us-ascii?Q?fWg5W6E+dUco3yHIeQdFDZwJy/77iYpYZYC7GjptaJEkM9PyF/eRf3iJncjl?=
 =?us-ascii?Q?u8RgNK3W/d2x+hxsJNEq5fz8ghUCltUCCtWG5YgPkhZinj0bKYEGcMa71eyS?=
 =?us-ascii?Q?SpNYsq+RWehM3r7L6EPIGKg3/riyj2A2dFwsXXiP8PXRm1YU7f978PRhPU8R?=
 =?us-ascii?Q?1mRPIGWjDrNSiv+bipDaB2zlfLgEJow40rkoQc33qdoAMDBbpf8NN4XcQlgG?=
 =?us-ascii?Q?vSJjvpQh/xTDhBUTj5RVpkZEEjinJnhjUGSRuQ+krBA7XLUoB/2QPx+Kwche?=
 =?us-ascii?Q?dZBz/TNZWL41kZbAV+eO84heEs6DkdQ0CrYlyoDjZKwn5QBfUoG2ftKFFksm?=
 =?us-ascii?Q?ej134qgY5gGc4zn7WeD5+d4vNCUclqV7JwBdbyLF0YJCJQt2txcAl2JwDdSS?=
 =?us-ascii?Q?F39Twj00X+BMO3aY96OFksV0WtLG3RQOvCZYpPbnm1zSNwGgyaRpsJf+Hpr8?=
 =?us-ascii?Q?BUkT3kkFTldmAzXWdsN9KSvthyySglZIMpNEieW8xV0diGKUMwAUy5D+W+EC?=
 =?us-ascii?Q?yhr1e8JqLlzlbSWntS3/97em+Eog61vEmCdsRvozybH3gocgz15ErWSLAXr/?=
 =?us-ascii?Q?yh2Z/E9GTSIJu0WX/8LifNENaoMy1VakDgh6WPDhDrQ5FYbk7OUhk6Sh8KQN?=
 =?us-ascii?Q?NaYSj3WMi5sfGeSTpcHEEjEeeKebzBKhTDO0JvlZvbiUc3la8bWEB6GKKhH5?=
 =?us-ascii?Q?6QLOECj7nLKNy//uCRoxN7YdR//ULLtO1C/ALNaO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d016e52-fe72-48a5-e058-08dc951dab2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 13:49:43.8149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WpGivCleRVK0+VdBqrNAMQjXde6XQLZFkmQAMAg5gz8HGIUUtvxMnLZiQRnTyJjv+KEzWC6Vy7+RXPrH/AamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8173
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

Hello,

> From: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
> Sent: Friday, May 31, 2024 3:45 PM
> To: maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> tzimmermann@suse.de; airlied@gmail.com; daniel@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Luck, =
Tony
> <tony.luck@intel.com>; Zhuo, Qiuxu <qiuxu.zhuo@intel.com>; Wang, Yudong
> <yudong.wang@intel.com>
> Subject: [PATCH 1/1] drm/fb-helper: Don't schedule_work() to flush frame
> buffer during panic()
>=20
> Sometimes the system [1] hangs on x86 I/O machine checks. However, the
> expected behavior is to reboot the system, as the machine check handler
> ultimately triggers a panic(), initiating a reboot in the last step.
>=20
> The root cause is that sometimes the panic() is blocked when
> drm_fb_helper_damage() invoking schedule_work() to flush the frame buffer=
.
> This occurs during the process of flushing all messages to the frame buff=
er
> driver as shown in the following call trace:
>=20
>   Machine check occurs [2]:
>     panic()
>       console_flush_on_panic()
>         console_flush_all()
>           console_emit_next_record()
>             con->write()
>               vt_console_print()
>                 hide_cursor()
>                   vc->vc_sw->con_cursor()
>                     fbcon_cursor()
>                       ops->cursor()
>                         bit_cursor()
>                           soft_cursor()
>                             info->fbops->fb_imageblit()
>                               drm_fbdev_generic_defio_imageblit()
>                                 drm_fb_helper_damage_area()
>                                   drm_fb_helper_damage()
>                                     schedule_work() // <--- blocked here
>     ...
>     emergency_restart()  // wasn't invoked, so no reboot.
>=20
> During panic(), except the panic CPU, all the other CPUs are stopped.
> In schedule_work(), the panic CPU requires the lock of worker_pool to que=
ue
> the work on that pool, while the lock may have been token by some other
> stopped CPU. So schedule_work() is blocked.
>=20
> Additionally, during a panic(), since there is no opportunity to execute =
any
> scheduled work, it's safe to fix this issue by skipping schedule_work() o=
n
> 'oops_in_progress' in drm_fb_helper_damage().
>=20
> [1] Enable the kernel option CONFIG_FRAMEBUFFER_CONSOLE,
>     CONFIG_DRM_FBDEV_EMULATION, and boot with the 'console=3Dtty0'
>     kernel command line parameter.
>=20
> [2] Set 'panic_timeout' to a non-zero value before calling panic().
>=20
> Reported-by: Yudong Wang <yudong.wang@intel.com>
> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c
> b/drivers/gpu/drm/drm_fb_helper.c index d612133e2cf7..6d7b6f038821
> 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -628,6 +628,9 @@ static void drm_fb_helper_add_damage_clip(struct
> drm_fb_helper *helper, u32 x, u  static void drm_fb_helper_damage(struct
> drm_fb_helper *helper, u32 x, u32 y,
>  				 u32 width, u32 height)
>  {
> +	if (oops_in_progress)
> +		return;
> +
>  	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
>=20
>  	schedule_work(&helper->damage_work);
> --

A gentle ping on this patch.=20

Updated with recent error injection test results:
- Without the patch, we typically reproduced the issue [1] once in 100 cycl=
es.
- With the patch, we tested it on 3 systems and passed a total of 1500 cycl=
es.

[1] the system got blocked at drm_fb_helper_damage()-> schedule_work() with=
out reboot.
      For details, please see the commit message.

Thanks!
-Qiuxu

