Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8BBA8EA8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73BA10E3F8;
	Mon, 29 Sep 2025 10:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWzgoWoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D610E22C;
 Mon, 29 Sep 2025 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759142862; x=1790678862;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GAnoci7+Gs94Sb9RgQ+sS2PEyp0QFWSqyRxFambzHvQ=;
 b=hWzgoWoMgEaSwYYJTysQYtJHV0WiB/kJefyTmXGrPM44PMG0GXTbBjcg
 u1f+GxeYdCR11+iLn5qhtEvaawbAGmGn1RXdhvqEzvIz1EhtRZeXp3/7Q
 Emb5uV8+dl8/NutNUkLPrCdsNYw2oXsU5wOB75mFZbIWAJma2okm6gnQj
 TXO1+XqWNKs6kOMOp+64cq//C5h5TqKX8dWBwyBJYQHsljyEBxHrt7GxF
 cMSJ1dRXy7sqa5o5ET42hq+uVbRkHahV4eGUwCja1J3WeUn9EVhruwJ7r
 daQlzS6NKg5rxKeT+COuLNcovcr+Z5ro2xldN6uL6B8REiQ58uxQoneMl A==;
X-CSE-ConnectionGUID: svY3c2CUQeunt7rKvxrEOQ==
X-CSE-MsgGUID: 8faL/4B9SxKlCI2yCxC7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71626683"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71626683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:47:41 -0700
X-CSE-ConnectionGUID: bEEM6YkQT/e8GiimXOFKUg==
X-CSE-MsgGUID: C3vj96OsTeeW3Lygn9CkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182197035"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:47:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:47:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:47:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al1bwbkekrx8FQZh9KNiuqEtYeyFpHlT+34AqvHGaCrTrq1wr8iv4HDi30pLbENBh4z+RD3S6VzFhn2RK8PL7lw0ogXHqZSws/DMEVfuOJEB5960HzzcB1H3IkLVPRzAlPEgz8PjiNL75VChcP8jUTKOCLg//bYooK1Y9YI59k859Q1cHIwxuJHf8vjKN1CGkdZgo5cbQMZDyklaiDer66tTOUFdnRo2UwE6siMH8PQPIpLMr/ZnnS01CQfxgnN/cjl1nvRh9VU1FDtHSAME8DuMJPMOisRZ0brJVkW6g0ln64u+II2c51951xQ+tUaqd5aAYaRMmEu1CDmv9NaDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbHDIiOkod1zrWDD/SIgnyI29gpxviG0JW4wBdMEX7o=;
 b=hS4FN1XnB4ebP+XdH9sCg8VAJxfPsRKBQR+bj+2dinZw+1/XNfdo0exZXbOS4pxgKIswfFtIMvW+zrId0g66Y0HK+D3O63E+RfFPs59WLq2sAW011FWTsazoqK/SeCrISf/qRhMaiq6ax/bmmrB0/qbVV5YhkTOiKldexN1dsQP52fhKPOM3+VWHrhQLaHLedlokBSotp87UnZu16f4UL05G4BsK8UW3+xP6wjrQJVC/Z6FwbvGBYydAvzDJ3To5oMvFu1opjesT+X3hl/3woP4HycGnRNQ22QU0tlHBad3JeH/kc1K+lxZJvdbPozdmfDaCTMgUwhCjmcgPema60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:47:38 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 10:47:38 +0000
Date: Mon, 29 Sep 2025 13:47:29 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNpjwQcvbQL0Gu9y@ideak-desk>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <aNpbf4HJDrtbsuex@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNpbf4HJDrtbsuex@intel.com>
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e69e07-5333-4d79-1316-08ddff459859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rXLubqWAukuHEkP0ner9vsq3fzeo467FsOtX2BYkil7Ca7oWfnFG6xBWVM?=
 =?iso-8859-1?Q?PqZBCiXFw/IlxhBND1MoA4w44kMqQlMzghNu52das03td2LXTEJf/Wymee?=
 =?iso-8859-1?Q?85HQLD1JdwW/yuxop5DToX7kQMBsGQi2ojC58ysaeYR6N0I33HLqhuNC1b?=
 =?iso-8859-1?Q?NjLDGC9agIYXvG6lRZgV8Wl+9zz8l2FFBa23sU4PKKFGO2VRd2KWQy6Sdm?=
 =?iso-8859-1?Q?jXWouNHZR9NPNHHQvjjLDzdrA01OobuMtswE1qF/3XbJJyYdMMdj991SYi?=
 =?iso-8859-1?Q?UEpc1cwcdulmrv+FQUgNsaHCe9kAjkg9hsXVYNTfFol0e6n7dm544jPsr5?=
 =?iso-8859-1?Q?ERhLK2Bx2vZj5JQddUQzryVOH30W5aGfFtoBgDjYhNlarn7gcB0wyAFTQ0?=
 =?iso-8859-1?Q?BxHrAbfu/8SxlThpFTFO+OVaLLjkuSyiAzGNG1G3Ipedh2Yv3TkywyKBnm?=
 =?iso-8859-1?Q?ODS/dC84E+dxj7C/rAd1R00up/rTVIfSPzTAh6TrjsHNDVOZQO1d+MFLSN?=
 =?iso-8859-1?Q?EXjGoEUjRe0UVI2kP8uTtXzv/iY+Z99ndVpBUXCb/mBFy+tyHhG6z9YtFr?=
 =?iso-8859-1?Q?kNvnHJtVMBPlklqIBdE6w3owGNSm55cpLHNZEe4JnJZhpQBfkwwaViRv6y?=
 =?iso-8859-1?Q?tm9FCieLDETgK78rtb4mXZLAxf4RKzcHbhl6mU0MiEZrYpRrAWTPZchu2x?=
 =?iso-8859-1?Q?TNXvVH+aF5t6qktD491J/3CQmr8FRicIMSoWOdM8nc/hZDHmCpRaQHQCRE?=
 =?iso-8859-1?Q?+mgVdZxy4flrLNTqCWsTxuXUZM2vrYpH3GxboRM5Hp1x3R2uheFSw11vWZ?=
 =?iso-8859-1?Q?J6L7lVEGXZIUotfhVRNqaF6HvJ2R3PxpCoQCZvjUJX7D5aW9dHQaMF4XeL?=
 =?iso-8859-1?Q?1rpl7Xh9ptfBnKIhKEFgfD7LUvjKImu1MgU4LcxAH2OC25iawrYZzXx8Sq?=
 =?iso-8859-1?Q?DXggdnJomvYDdFv6WnPSwAfuiKZD4NHyZ2m0/dbXe0S9fsa/4+etbjjJnV?=
 =?iso-8859-1?Q?3uM2egwNQMRyO1BeueMVbwz1ndb+d0/NmBP7Zz4KSUL66v87MvNGB3lw5C?=
 =?iso-8859-1?Q?Zqqk9Tbi+fjPUFMf4udTFhcP/2U85nql1xswR4kHUNARB9OeGEljLOpCWE?=
 =?iso-8859-1?Q?ecU5RImyispjx87WJGMPIq/h9tZU1T7xDc7C4p6VJXCs0PS5v/oUCggMoc?=
 =?iso-8859-1?Q?q6U7ZIUfOnus/uwkDjUT7HU2TZFWf3RA3rqPlzf+a+ES/CeNrSgvRFP4nq?=
 =?iso-8859-1?Q?oCKf9+2fznY1kLpudWytZgk3KhjcWPfYf7zSmu1laBeN7Gs6KygHqK0bsJ?=
 =?iso-8859-1?Q?c0OmZnlnabgxLaUas2MX6/vvcGJT+ncFV2BTS1yeCvhhakG7w8W7NKARpJ?=
 =?iso-8859-1?Q?eyH2DKKRZZGkX3CBprIFEgxb++RqJJgM3jmrhStORBVICSpQDn/oITm4FQ?=
 =?iso-8859-1?Q?ExVZuRJbDoi34fVfQItw/GKtRvswGIhcBsYIH3AxtY8zYSKEbXJU0hPS7f?=
 =?iso-8859-1?Q?PIE8TrAWN+Oxw+TFYOKBs2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Be2+/QDSQnyLss7N7e8AlXguQ5j5clbIac+6ifSEefiL882FuE/lM/Imuy?=
 =?iso-8859-1?Q?riMJ1NloAb5GcP52PnGV0nhxBzyCnNclEZfdNY8n2XBVtG1p1snRWKeBfW?=
 =?iso-8859-1?Q?PBda+/FXYA7svApZJU+dBEPo+yxDJgYVSQ2ZVqbaQskYA5ZEJWW2Qlw4bB?=
 =?iso-8859-1?Q?LppkKRzduqJln/DL9ZafzXp/m6DTQb13nI27c0Rl0B5my45CpCcjcLVZFp?=
 =?iso-8859-1?Q?ooo4sebfj2Jpi3Lzp9Qr9AA9aXAwUR2LymGKxwtBa3J4zX+wOME2P1c40+?=
 =?iso-8859-1?Q?XHgy+p4GDxbZmRI9gPU+cOrYVyDr5nGw1RfS+6KQx5SjjSz2wiEeVCvw83?=
 =?iso-8859-1?Q?3lBYOdg3VXkC/cxMkFpchX11RHqY2GFBopoNjxdEL4ozlVgqc1G3n5Cv3S?=
 =?iso-8859-1?Q?I8SAT35e+A8V/AL3i66pQSVGLeKecsQeHdtN/ppX+r1e8Oj5wdRACvKg6V?=
 =?iso-8859-1?Q?qeq+izWkqh8crg9j/jAOpv+iHPd+08/oPtUb3EbAp9+Kv6DvXWBWiShze3?=
 =?iso-8859-1?Q?f/seRc4Xsk2R7sNiID1R32thdu1gdtRQdH/nQKv5SqME5xZBuSwRhhzKUe?=
 =?iso-8859-1?Q?SQhxmjty9eQ7/jaS8bIRXosppZl/YlTQWSsIRn86rR2kGCaZeKPa/nbF1l?=
 =?iso-8859-1?Q?T7u2/vq1XPG4pABeR3VAPyZrzi6om1x8VCz1vB3mu8H0wBexmpWxKQ/8o6?=
 =?iso-8859-1?Q?bQpBl3VwKZ0POwtrX3biJJXZ5OLDQYbqAJzlRe6tTRwgXDUSpnWf7FjJqJ?=
 =?iso-8859-1?Q?8Rx+H7hkA91j338VRHV18DyHdxLR9LxCL4fB8Q9eJfbXPny+kqWzno9rcF?=
 =?iso-8859-1?Q?ieOkPHPUX2tD2F0E6bRnLWY9rZ6RPYhA9dln14fJJR4Of9b0SyueCGRah9?=
 =?iso-8859-1?Q?zPJorIBaVzvuTN525UeV7XYTZJgOWd1RAxPAi1fIV5QsrJMhpOxI/TsIuX?=
 =?iso-8859-1?Q?6zbRADJWgyRmHaPTVJN4kahQdDDQFPqGqJlhkPLIXikeIr32NX+2n9RsCV?=
 =?iso-8859-1?Q?W4TaK17tzTSOGhyWtW8gk2mlcr4jnEWvyjQOpwJOWlKcaRK3Tj797dYfMj?=
 =?iso-8859-1?Q?p5YewW6vU3LptiFjPqYzqD1RIQmO4XcXKhErJ2tAjlWFhfriRc8ifD3hns?=
 =?iso-8859-1?Q?VBaB+NYfjW2iVkj1rEVD9/5OkP+owMQmvBnC/TYIr2XzmbR9lNt9BOj91g?=
 =?iso-8859-1?Q?UiEDB7cUtLXZxgFR0wPI2sYWK4ieM/S4NHBySAr6kt4bnfyBiUG9IPw6sB?=
 =?iso-8859-1?Q?i+qAPPpsdAMq+EUGHC+wrdXZ34aZX+JFokgTxYRuNeeK0TIQFTZBmbrwdk?=
 =?iso-8859-1?Q?ToZhqTv50GVRuLXS3zXx3iqVBgm/rBmtbIH1rMU8QxO1mQdldwqE9Pf69P?=
 =?iso-8859-1?Q?jInvYVJ1YvCN6QhbScMwGtYQzkIntF0opXoJRwM1PqDpecCwwAZehdrwut?=
 =?iso-8859-1?Q?6B204g3Anm3a6TQbbIkp4/JvSOdHwFrgvM2hwZY3z0GzPPo/SEhNKojFc2?=
 =?iso-8859-1?Q?6cpFwy7EZTQVE/5zgwNYkG0RBx3j5gqkIr3wMxRDScvtnY5lWXVPx9ZC8k?=
 =?iso-8859-1?Q?WM5lheTwfLQaKGvW1xCu7x8cs027Htmv2j+FxOvmEXS+BuFA641PSA5ghr?=
 =?iso-8859-1?Q?Kj51eG5NWqrePllS9FxgQmCBATHbNzOykNFVtPHTvG6H21ZzEUzJyHzhMx?=
 =?iso-8859-1?Q?FviCxWsGo9ky7qd9sMYMC6DJcEKNKkI7Ax+ylUd7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e69e07-5333-4d79-1316-08ddff459859
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 10:47:38.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OO7t4IgnbpQ2vG2Nd49eO9TSxCvuP/PaC5PQg6sd6SgPCK5IVVStOPWKhngBF8SejYkI1LEM8VirenBwlgb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 29, 2025 at 01:12:15PM +0300, Ville Syrjälä wrote:
> On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > Add helpers to query the DP DSC sink device's per-slice throughput as
> > well as a DSC branch device's overall throughput and line-width
> > capabilities.
> > 
> > v2 (Ville):
> > - Rename pixel_clock to peak_pixel_rate, document what the value means
> >   in case of MST tiled displays.
> > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> >   drm_dp_dsc_sink_max_slice_throughput().
> > v3:
> > - Fix the DSC branch device minimum valid line width value from 2560
> >   to 5120 pixels.
> > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> >   name to peak_pixel_rate in header file.
> > - Add handling for throughput mode 0 granular delta, defined by DP
> >   Standard v2.1a.
> > 
> > Cc: dri-devel@lists.freedesktop.org
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> >  include/drm/display/drm_dp.h            |   3 +
> >  include/drm/display/drm_dp_helper.h     |   5 +
> >  3 files changed, 164 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1c74fe9459ad9..6084ca7fbe263 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2844,6 +2844,162 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
> >  }
> >  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
> >  
> > +/*
> > + * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
> > + * Appendix L.1 Derivation of Slice Count Requirements.
> > + */
> > +static int dsc_sink_min_slice_throughput(int peak_pixel_rate)
> > +{
> > +	if (peak_pixel_rate >= 4800000)
> > +		return 600000;
> > +	else if (peak_pixel_rate >= 2700000)
> > +		return 400000;
> > +	else
> > +		return 340000;
> > +}
> > +
> > +/**
> > + * drm_dp_dsc_sink_max_slice_throughput() - Get a DSC sink's maximum pixel throughput per slice
> > + * @dsc_dpcd: DSC sink's capabilities from DPCD
> > + * @peak_pixel_rate: Cumulative peak pixel rate in kHz
> > + * @is_rgb_yuv444: The mode is either RGB or YUV444
> > + *
> > + * Return the DSC sink device's maximum pixel throughput per slice, based on
> > + * the device's @dsc_dpcd capabilities, the @peak_pixel_rate of the transferred
> > + * stream(s) and whether the output format @is_rgb_yuv444 or yuv422/yuv420.
> > + *
> > + * Note that @peak_pixel_rate is the total pixel rate transferred to the same
> > + * DSC/display sink. For instance to calculate a tile's slice count of an MST
> > + * multi-tiled display sink (not considering here the required
> > + * rounding/alignment of slice count)::
> > + *
> > + *   @peak_pixel_rate = tile_pixel_rate * tile_count
> > + *   total_slice_count = @peak_pixel_rate / drm_dp_dsc_sink_max_slice_throughput(@peak_pixel_rate)
> > + *   tile_slice_count = total_slice_count / tile_count
> > + *
> > + * Returns:
> > + * The maximum pixel throughput per slice supported by the DSC sink device
> > + * in kPixels/sec.
> > + */
> > +int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> > +					 int peak_pixel_rate, bool is_rgb_yuv444)
> > +{
> > +	int throughput;
> > +	int delta = 0;
> > +	int base;
> > +
> > +	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
> > +
> > +	if (is_rgb_yuv444) {
> > +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
> > +			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
> > +
> > +		delta = ((dsc_dpcd[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT]) &
> > +			 DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK) >>
> > +			DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT;	/* in units of 2 MPixels/sec */
> > +		delta *= 2000;
> 
> That thing really is very poorly documented. The DSC spec has a
> note about possibly needing extra throughput at the right edges
> of slices due to some alignment reasons. Maybe this is for that?
> Dunno.

I assumed it's for the sink to be able to specify the throughput in a
smaller granularity, so the calculated slice count is then also closer
to the actual requirement. But yes, could be for another reason too,
I'll reread the DSC spec too.

> And the fact that there is a delta just for the 4:4:4 throughput
> is also rather weird.

Yes it is, but that's what the Standard says, unless I missed something.

> > +	} else {
> > +		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
> > +			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
> > +	}
> > +
> > +	switch (throughput) {
> > +	case 0:
> > +		return dsc_sink_min_slice_throughput(peak_pixel_rate);
> > +	case 1:
> > +		base = 340000;
> > +		break;
> > +	case 2 ... 14:
> > +		base = 400000 + 50000 * (throughput - 2);
> > +		break;
> > +	case 15:
> > +		base = 170000;
> > +		break;
> > +	default:
> > +		WARN(1, "Missing case %d\n", throughput);
> > +		base = 340000;
> > +		break;
> 
> nit: that looks like an impossible situation. Could either nuke
> the default case, or if the compiler/static checks are dumb
> then get rid of the 2...14 case instead.

Yes, the compiler should catch an unhandled case and atm the default
case could cause an an unreachable code compiler warn. Will remove the
default case.

> Anyways, for the series
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks!

> > +	}
> > +
> > +	return base + delta;
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_throughput);
> > +
> > +static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
> > +{
> > +	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
> > +}
> > +
> > +/**
> > + * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
> > + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> > + * @is_rgb_yuv444: The mode is either RGB or YUV444
> > + *
> > + * Return the branch device's maximum overall DSC pixel throughput, based on
> > + * the device's DPCD DSC branch capabilities, and whether the output
> > + * format @is_rgb_yuv444 or yuv422/yuv420.
> > + *
> > + * Returns:
> > + * - 0:   The maximum overall throughput capability is not indicated by
> > + *        the device separately and it must be determined from the per-slice
> > + *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
> > + *        and the maximum slice count supported by the device.
> > + * - > 0: The maximum overall DSC pixel throughput supported by the branch
> > + *        device in kPixels/sec.
> > + */
> > +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> > +					     bool is_rgb_yuv444)
> > +{
> > +	int throughput;
> > +
> > +	if (is_rgb_yuv444)
> > +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> > +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
> > +	else
> > +		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
> > +						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
> > +
> > +	switch (throughput) {
> > +	case 0:
> > +		return 0;
> > +	case 1:
> > +		return 680000;
> > +	default:
> > +		return 600000 + 50000 * throughput;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
> > +
> > +/**
> > + * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
> > + * @dsc_branch_dpcd: DSC branch capabilities from DPCD
> > + *
> > + * Return the branch device's maximum overall DSC line width, based on
> > + * the device's @dsc_branch_dpcd capabilities.
> > + *
> > + * Returns:
> > + * - 0:        The maximum line width is not indicated by the device
> > + *             separately and it must be determined from the maximum
> > + *             slice count and slice-width supported by the device.
> > + * - %-EINVAL: The device indicates an invalid maximum line width
> > + *             (< 5120 pixels).
> > + * - >= 5120:  The maximum line width in pixels.
> > + */
> > +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
> > +{
> > +	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
> > +
> > +	switch (line_width) {
> > +	case 0:
> > +		return 0;
> > +	case 1 ... 15:
> > +		return -EINVAL;
> > +	default:
> > +		return line_width * 320;
> > +	}
> > +}
> > +EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
> > +
> >  static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
> >  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
> >  				  u8 *buf, int buf_size)
> > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > index cf318e3ddb5c5..e4eebabab9759 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -258,6 +258,8 @@
> >  # define DP_DSC_RC_BUF_BLK_SIZE_4           0x1
> >  # define DP_DSC_RC_BUF_BLK_SIZE_16          0x2
> >  # define DP_DSC_RC_BUF_BLK_SIZE_64          0x3
> > +# define DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT 3 /* DP 2.1a, in units of 2 MPixels/sec */
> > +# define DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK  (0x1f << DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT)
> >  
> >  #define DP_DSC_RC_BUF_SIZE                  0x063
> >  
> > @@ -1686,6 +1688,7 @@ enum drm_dp_phy {
> >  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
> >  #define DP_RECEIVER_CAP_SIZE		0xf
> >  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
> > +#define DP_DSC_BRANCH_CAP_SIZE		3
> >  #define EDP_PSR_RECEIVER_CAP_SIZE	2
> >  #define EDP_DISPLAY_CTL_CAP_SIZE	5
> >  #define DP_LTTPR_COMMON_CAP_SIZE	8
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index e438c44409952..df2f24b950e4c 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> >  u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
> >  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
> >  					 u8 dsc_bpc[3]);
> > +int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
> > +					 int peak_pixel_rate, bool is_rgb_yuv444);
> > +int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
> > +					     bool is_rgb_yuv444);
> > +int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
> >  
> >  static inline bool
> >  drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> > -- 
> > 2.49.1
> 
> -- 
> Ville Syrjälä
> Intel
