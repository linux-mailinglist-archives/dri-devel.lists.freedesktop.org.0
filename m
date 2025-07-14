Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604A2B04840
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 22:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B13610E34E;
	Mon, 14 Jul 2025 20:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc8HieDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D455B10E0A9;
 Mon, 14 Jul 2025 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752523662; x=1784059662;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wZgj9+ZxBdm+uRB7XZAlTv0qSM1pvQXoaDCm/stRZGw=;
 b=Rc8HieDxY9UdMGYTVzax2l6v2kWFL1BKdCvmO3vdHLlqKCkiK1oEM1Th
 fnmaPiqdLkjBoQ8WOuiS0nWgseEJ0OLHkNKe5n6XAY6mjfI6DZoGrjQ8g
 dTBozq5cS6KKggLMw0FzsdCmyiDmegy9wKFWf38Yawdqegyrd2FdJiAWP
 pAdpyXNpjdXPj+Pwdl4lEU6USNKiw3ZNG91bKs0+e8J9yLoXbeL5hqHte
 NfiuA7yidTdp6JnTaLoZwKQR8EYtG0dNzap9QP75aLnjsS9KEp31vZHFO
 TXSulUHSD/kiM6wRK66uK42xvXfA+SlSoIdpjvTltdBt+Fcq0joNLUnEk A==;
X-CSE-ConnectionGUID: vZTY8tpMRmaLtHCyVgR/kg==
X-CSE-MsgGUID: s9xsfw7HQhGaDa0GERePKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58535790"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208,223";a="58535790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 13:07:39 -0700
X-CSE-ConnectionGUID: b8CmtA6kRTmADq/WM/WBtw==
X-CSE-MsgGUID: fenqIuW8T0KCpICrWPnfmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
 d="scan'208,223";a="156663300"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 13:07:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 13:07:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 13:07:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 13:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlRwfFSeGX4CJzzZebtKdRaivZbfwnB/zVnoLEqLOcoyAb2Co4IYBbndJjntQIzUru1Ons4oqTwG2GfCn56VUJrsiRkPl6vBHIukPRGpakMz/YcXht9XeeECTmgxyOYxPPzr+K1NDLoJ9wBm8lc/6ecVem0kDorOIaZNdo8RSCNuraAOgd3+WPfOWpOxl8FUsuE1ShF8EWSAlPKjwZ31wt5CwxO41gwLocHwUw8sX/HeBv5O+dwo0j4Gu9vg+iK4DSQzhIG3nHtsUAVTR4N1Sb6XklxWEJQhD7uQZjP+7GlvaMD52h2x9ae72po8+K2Wq+eXMNJ9y9TmR5s/JtGYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqTm+2csQuWOk56GP3JMXOEiFPBMD2cq/tweSNJhFwA=;
 b=PMv90eVrJoii58nrm5R7cURF9hXk9yNYg9wv0s+JSOnYgsSm++adw4PENHpgPO3h1Z8I1ghEQopRJ5cXGU03q7gpp84I1WaG5YKiPALXAfn2GabMLlUZYaFNDA72aFfSaOH7wOSmXFHSUQ2m9xjk/zcPaJWPwTzn8aa+tTNTGIQ+xgv2qByR/kCrotW4ANW7R7SFfSeYfU0cBONz6hbtT/YvFz04hggu1r7xfYzuE3Dxsgd4TZOKVhNIYmt4zbH0oqkzfSuQIq7so183BKjHlBAzBHQ4fHu3mufW0VeDuHebMBDFZQTw6DrYTNsKHKtnB70U81H/nTwhyDmnNZ6mVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 20:06:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 20:06:59 +0000
Date: Mon, 14 Jul 2025 23:06:52 +0300
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aHVjXHZ6xe4WHTJI@ideak-desk>
References: <20250708212331.112898-1-imre.deak@intel.com>
 <aG-j3NuvQCwLJKCO@ideak-desk> <aHTGkoRydum652gC@ideak-desk>
 <6588c619-01b6-4df5-9cc1-27a96efb76bf@suse.de>
Content-Type: multipart/mixed; boundary="vu5ppELU9aAmIgfQ"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6588c619-01b6-4df5-9cc1-27a96efb76bf@suse.de>
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2903aeed-9490-4439-61c2-08ddc311fd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7416014|4053099003; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OMwWUalNXtXq10n7w4EIA9FCZj+lqWXo7+LC9bm1BnkSehCITi7dqstIN4?=
 =?iso-8859-1?Q?9SZNhsmrvweWMZD4z00sAYJUQIiYGX0Q5/kNmltF9hM1o32A2FLLR+mPY2?=
 =?iso-8859-1?Q?z8r+baDGzAjaVhJtGoYZz2KXtSoM+MOUP+3Czgimy63j6ibqOqSnfnrffp?=
 =?iso-8859-1?Q?xAWATmFIKzA4zSr6QtsWODWJg033Ptyk68kU1MPLXqh5TPoxC+1ot5ML/r?=
 =?iso-8859-1?Q?Y6MnAuERo1KKh/LEeCgdf/Oe42IUMjnlvB7M2fOHl5/ggPt5LPDLGumuoS?=
 =?iso-8859-1?Q?+fPkGDofuAzaDn0cTYzrHxACEBwmEvDZhSzoXHdgOiVKKRQa5MleGsTrjP?=
 =?iso-8859-1?Q?3d4hvFwJ6BqNkavERgyupUY/lWKz0LHpcW/oCxIsClQVBVzAzAGgh4Hsg0?=
 =?iso-8859-1?Q?HSgzx0OaZPtM6K6IhEzzENc8yB1L5E7vfHbbhc/hm4lEhiPWTNRSFEZfMV?=
 =?iso-8859-1?Q?p7D43VUsZlYYP797sEQxOeSZBmRESeHkp+P/QYRAyd0iS5y3/ZHeIAznW4?=
 =?iso-8859-1?Q?Rq10GYxRMCG8kR0rDxDCdMOQlvaCP79G+oBePyrWQF6sbor8kUI/WSAWHO?=
 =?iso-8859-1?Q?9y4o5cWFgbwT6ppLvhqUr9Gy7D5syNWdGXv4OqqTbvfoDablWlxQ5/Ve3r?=
 =?iso-8859-1?Q?i2G6DhEiJdyY5uwWyyp+G+JAEaIp4Z9DQhALpA5oxgwdYZtrFg5sUz6Gv3?=
 =?iso-8859-1?Q?UtWZIHOQkQx9ksko4OiI50/wV5AwfD/kxTLMjGu2uZgFexoPjX8Kz8MEOQ?=
 =?iso-8859-1?Q?X7hINICsLuNTW/bP8XoHG8vLLlMrjH/vYSSuhE+LHp5JVI5rGoQEeOVHJs?=
 =?iso-8859-1?Q?r5MOqAlikDuxH40/dFP4t36yr7pz5LlrtDmEV6vR26sAc6u1dp7y62+fVe?=
 =?iso-8859-1?Q?7DV7a/GlxpfwwVKEZjsICI0hsJtZHtfU2TAYBIA5WJps/+NRz/uoQmkTx5?=
 =?iso-8859-1?Q?qg/fsF4qlGKbyzuc0relEuma0mkQx6gTpWLQKzlqNgoZoTGF+MayKJUYi3?=
 =?iso-8859-1?Q?Ik94uKngiHb55E/xPgmhHanizhrrGBm/teHLsWPOERSJKACaLEeEp2iCpQ?=
 =?iso-8859-1?Q?tSwL7DeYt3UkNgYEpIqgxGJ26tdYwueeFOS/sGTTpMkQZczo1q+s37130d?=
 =?iso-8859-1?Q?5FXHQ9Vl9r8LyU98QL+HfmgK/zwPZvBJozD3dcuVys/zkOOaU6llr3jkrh?=
 =?iso-8859-1?Q?nkDI4mJSkij/3nzIM9CSK8XQ256lrQBDLuO74wu7aPiKUbbHrVBrJ/15mt?=
 =?iso-8859-1?Q?jiONmFC7jNjLsVjLK/rViyMbTxI7YbeOKB/lFoZUJAtWDY0jIX84DQkqwN?=
 =?iso-8859-1?Q?EFfLQ9gNK2W1QipBhrjn5WsMgQ+rdbRhFl7+93NmyDl/s2EJS4wP7N5Omr?=
 =?iso-8859-1?Q?iLPVwDoJdV49WAf1Tr76EWA8olBvivCL2o4USvsa6r0YWTFfNRMj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7416014)(4053099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2Ti22LEC7tLebKWMm/VIp/uQH/j/VLAlZw+h800ZAEtb1AugkMM2zQP+Ue?=
 =?iso-8859-1?Q?vJ8y4SdkgYMFiYFRGwClDPlF+mUNj2iLuALiTS3O9Ub+8XohVBblySJfPL?=
 =?iso-8859-1?Q?mRUPuWW+wC/us5hXYJacBOpu0qG0WMrG87ewYLqpcSGgQ4wfjspfnEWeik?=
 =?iso-8859-1?Q?He+/4gbXeP5FrADCe9wIxy7o+sjdOmOVtAx7iQK6V+cLe9s0ymz78+wm5W?=
 =?iso-8859-1?Q?BG65+DGzSjOcwnJ5eKG3TLDYyvHkzDRJ0hym48M3eL6MaNZ12Eek6bnrwy?=
 =?iso-8859-1?Q?VDgaij4CBYA7NuIxrZ1/B+9CmEw2hSgF0SsMrl2oo/Iv5yN69q4O8qFZI9?=
 =?iso-8859-1?Q?H9wobXTr7vKkziZfVdOw28ntDNtSGV6fl6XcXLsl/oK8DstGJHcdiheVOv?=
 =?iso-8859-1?Q?+8hWxMhXTXJG4tu3J1PoW+ja/GpUOe6LTVg5UMLkVgCR/E67u+vzEIkq/i?=
 =?iso-8859-1?Q?B9VE5VXZqAWnFkA1iFG/8RvnT49QD6gPaubvJ3mXKQMBHwXnU4v9Bhz6Ji?=
 =?iso-8859-1?Q?pOwesrQTI00jNOKmeZcGQUe7KiqDugLASmf0sC3aEGQVu7oyncghNFt1AI?=
 =?iso-8859-1?Q?cme9kGKosimCh+FKWi1AQUDOZQzXIdpHU0YrUePsSDIa0YbM9y1BL9wHlL?=
 =?iso-8859-1?Q?1sQMe/A9tTEqH6W0eIcuM4Z9AGBhaUn8erf16ZgDNSzVwuFDQSijJaP71E?=
 =?iso-8859-1?Q?NKZqyAP/PqZP0AGSDaALmAvUmU1jmsab7qDLvIJsfAEYQ1VpZhWSnycAzL?=
 =?iso-8859-1?Q?fneOgxsHOktDuMnp96mHIHHK9niOJgOTEVXIK+oBH50S5fFugaeDkhU7AA?=
 =?iso-8859-1?Q?874noJNSAn23GOdOhu88dK4WPm0ElgsTjipvoxYyFjsBYC5r2S6e1rwra3?=
 =?iso-8859-1?Q?CyblbEMTgqCtZ/1GQJDQvoyjtsM+4lgrvbQRyfwmNnb+q0gCZZ8DHbaJ3J?=
 =?iso-8859-1?Q?WZ5JCJq3Kjsh6Q5IbGl9IUTzxdX59mOsZXY+5u4G175rliQLhA6KPKVGYM?=
 =?iso-8859-1?Q?Nfk381sNUf+LJ305j3SD8IthXWdphoMln7GywFOE6VvqFrOj43b65wJJPv?=
 =?iso-8859-1?Q?ZS5NiwgZYYzi5YK4BEo2FU63/M+xoxDKLAEBdp8QQXeX36fznhkOXufguO?=
 =?iso-8859-1?Q?b1L438ubAXjaV3Cc8KqX5WVbWDJ958sQRtOvvrS8a4rlIem9OXXU5lswt3?=
 =?iso-8859-1?Q?H8klVEFM7+nQjYmxaDk1NS+fgXblKbrzGMBB+cAy9HJKPacQV6FfqimNAo?=
 =?iso-8859-1?Q?aTCddwv17Tp9iJD6LM0XnxlIwoNE8rN6Zu0Ldz0mnubwbR0CxPNM3uF6OV?=
 =?iso-8859-1?Q?JjieoBsl6+HYNjUcpwQfB/yfGkeSpgXciR4TI11VPevzMwYb59uux7CWBz?=
 =?iso-8859-1?Q?Ge9Uys1Y3hc7ReY2rMe7iI1jQCNFZNawpiM0FdvEBk+MZHgyj53xYrjDVG?=
 =?iso-8859-1?Q?bvGix57qJURg6YUWmzkuVWCgjWr+II6e+EAGhGTJwlpla/ysJZFD8GxKHZ?=
 =?iso-8859-1?Q?GOnvTHETEEib70vuPaHp2BduZBJZOVionRGhhHearsxpgw/bMSoY1bUJAj?=
 =?iso-8859-1?Q?aEWXkkKcVIzTz5/69y1jR/VxmtPJurOASJ59ONmzPxw45Oq08KCiaD8qVQ?=
 =?iso-8859-1?Q?/p9uJG7BbbgB6HSZHh4ZURzGVCOW6Ar5ekbKO+nsGwYWCxfdw9MrnIJ3A6?=
 =?iso-8859-1?Q?Z/c1eyyASgqLtPcwSB6f9HrF70VAu44gNjMorLCe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2903aeed-9490-4439-61c2-08ddc311fd8f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:06:59.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k0xekhbnrFcylDBYj7WnHwQdAgCl4qs7wXcsfJ8KdYRfvGeXG5DeTQJy72k3rPOwkEXTNZFaZP8DqDLrpo/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

--vu5ppELU9aAmIgfQ
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 14, 2025 at 11:00:08AM +0200, Thomas Zimmermann wrote:
> 
> Am 14.07.25 um 10:57 schrieb Imre Deak:
> > Hi,
> > 
> > On Thu, Jul 10, 2025 at 02:28:28PM +0300, Imre Deak wrote:
> > > Hi Thomas, Maxime, Maarten,
> > > 
> > > the patch this change fixes (commit a40c5d727b81) was merged via
> > > drm-intel and is also part of v6.16-rc4 (there cherry-picked in commit
> > > a3ef3c2da675).
> > > 
> > > Are you ok with merging this fix via drm-intel as well, so that it could
> > > be still merged to v6.16 before that's released?
> > any objections to merging this patch to drm-intel? If not, could someone
> > ack it?
> 
> Sure, a-b me.

Ok, thanks.

I pushed the patch to drm-intel-next, thanks for the report, testing,
review and ack.

I'd like to request that this patch be applied to drm-intel-fixes as
well, so that it can still make it to v6.16. To do that, the change
needs to be rebased on drm-intel-fixes, I attached the corresponding
patch.

Thanks,
Imre

> Best regards
> Thomas
> 
> > 
> > Thanks,
> > Imre
> > 
> > > Thanks,
> > > Imre
> > > 
> > > On Wed, Jul 09, 2025 at 12:23:31AM +0300, Imre Deak wrote:
> > > > Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> > > > DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> > > > DPCD probing, since this results in link training failures at least when
> > > > using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> > > > DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> > > > link training). Since accessing DPCD_REV during link training is
> > > > prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> > > > as it falls within the Standard's valid register address range
> > > > (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> > > > training on the above TBT hub.
> > > > 
> > > > However, reading the LANE0_1_STATUS register also has a side-effect at
> > > > least on a Novatek eDP panel, as reported on the Closes: link below,
> > > > resulting in screen flickering on that panel. One clear side-effect when
> > > > doing the 1-byte probe reads from LANE0_1_STATUS during link training
> > > > before reading out the full 6 byte link status starting at the same
> > > > address is that the panel will report the link training as completed
> > > > with voltage swing 0. This is different from the normal, flicker-free
> > > > scenario when no DPCD probing is done, the panel reporting the link
> > > > training complete with voltage swing 2.
> > > > 
> > > > Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> > > > the above side-effect, the panel will link train with voltage swing 2 as
> > > > expected and it will stay flicker-free. This register is also in the
> > > > above valid register range and is unlikely to have a side-effect as that
> > > > of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> > > > CR/EQ sequences and so it may cause a state change in the sink - even if
> > > > inadvertently as I suspect in the case of the above Novatek panel. As
> > > > opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> > > > training sequence (it must be only written once at the beginning of the
> > > > CR/EQ sequences), so it's unlikely to cause any state change in the
> > > > sink.
> > > > 
> > > > As a side-note, this Novatek panel also lacks support for TPS3, while
> > > > claiming support for HBR2, which violates the DP Standard (the Standard
> > > > mandating TPS3 for HBR2).
> > > > 
> > > > Besides the Novatek panel (PSR 1), which this change fixes, I also
> > > > verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> > > > panel as well as on the Intel Barlow Ridge TBT hub.
> > > > 
> > > > Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> > > > i915 and xe drivers keep DPCD probing enabled only for the panel known
> > > > to require this (HP ZR24w), hence those drivers in drm-tip are not
> > > > affected by the above problem.
> > > > 
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> > > > Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index 1c3920297906b..1ecc3df7e3167 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> > > >   	int ret;
> > > >   	if (dpcd_access_needs_probe(aux)) {
> > > > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > > > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> > > >   		if (ret < 0)
> > > >   			return ret;
> > > >   	}
> > > > -- 
> > > > 2.44.2
> > > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

--vu5ppELU9aAmIgfQ
Content-Type: text/x-diff; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="0001-drm-dp-Change-AUX-DPCD-probe-address-from-LANE0_1_ST.patch"
Content-Transfer-Encoding: 8bit

From d468740cb8688070ebbd534c2849b49729ae2af8 Mon Sep 17 00:00:00 2001
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 9 Jul 2025 00:23:31 +0300
Subject: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to
 TRAINING_PATTERN_SET
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
DPCD probing, since this results in link training failures at least when
using an Intel Barlow Ridge TBT hub at UHBR link rates (the
DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
link training). Since accessing DPCD_REV during link training is
prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
as it falls within the Standard's valid register address range
(0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
training on the above TBT hub.

However, reading the LANE0_1_STATUS register also has a side-effect at
least on a Novatek eDP panel, as reported on the Closes: link below,
resulting in screen flickering on that panel. One clear side-effect when
doing the 1-byte probe reads from LANE0_1_STATUS during link training
before reading out the full 6 byte link status starting at the same
address is that the panel will report the link training as completed
with voltage swing 0. This is different from the normal, flicker-free
scenario when no DPCD probing is done, the panel reporting the link
training complete with voltage swing 2.

Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
the above side-effect, the panel will link train with voltage swing 2 as
expected and it will stay flicker-free. This register is also in the
above valid register range and is unlikely to have a side-effect as that
of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
CR/EQ sequences and so it may cause a state change in the sink - even if
inadvertently as I suspect in the case of the above Novatek panel. As
opposed to this, reading TRAINING_PATTERN_SET is not part of the link
training sequence (it must be only written once at the beginning of the
CR/EQ sequences), so it's unlikely to cause any state change in the
sink.

As a side-note, this Novatek panel also lacks support for TPS3, while
claiming support for HBR2, which violates the DP Standard (the Standard
mandating TPS3 for HBR2).

Besides the Novatek panel (PSR 1), which this change fixes, I also
verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
panel as well as on the Intel Barlow Ridge TBT hub.

Note that in the drm-tip tree (targeting the v6.17 kernel version) the
i915 and xe drivers keep DPCD probing enabled only for the panel known
to require this (HP ZR24w), hence those drivers in drm-tip are not
affected by the above problem.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/r/20250708212331.112898-1-imre.deak@intel.com
(cherry picked from commit bba9aa41654036534d86b198f5647a9ce15ebd7f)
[Imre: Rebased on drm-intel-fixes]
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d..ea78c6c8ca7a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.44.2


--vu5ppELU9aAmIgfQ--
