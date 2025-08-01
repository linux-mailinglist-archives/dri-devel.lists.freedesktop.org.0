Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBEB184CA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38A510E049;
	Fri,  1 Aug 2025 15:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYYxADIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FDD10E049;
 Fri,  1 Aug 2025 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754061446; x=1785597446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=utlf7NeJLtttsjFnL7FXB9WbMcb6cU2ooMklgbThkSQ=;
 b=DYYxADINvx/3/i+hnJ7Q44VMsnxaX0GTPqJeb3lldFPyXLplpRtDtIYs
 rBZO53aGQSxULaoKHg4wC0jfL1oJRqjnN1aGacIQY+OETzKYHKu97UEQx
 AjEd7u1F3/nBhk5CKpOqRq0oMFwT0Ss8+FiFNXDw6+DbnPdAbtknbZYNB
 jsCxtuc+iB2HOb7YGvTEx7ouV7VJN+S3+ecyYhX6IyOvsO0RWVL5ZWZiZ
 UGHXnf1D75cjYJtoI0lC6i9qokq5BOdf7tb7yCVSQHuqycIDavXuM2g+D
 7Lz2iYwI81cYIt45VozndVQ7tK6zdb2jQVWYwaNvzRzq4p5kt4QKu+TiZ Q==;
X-CSE-ConnectionGUID: JtIfUmfOQJOjUBOQAlOwkA==
X-CSE-MsgGUID: AM4WeJuATW6KRkLTKxGQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56494673"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56494673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:17:25 -0700
X-CSE-ConnectionGUID: m4g3ZigZS1aAi4j72uUA1w==
X-CSE-MsgGUID: JlhK3hm1RGCDcRhOFngwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168888032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:17:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:17:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 08:17:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD+6Uh1VeDz1Xu0KKK/O5LwYZzX/dhYh+fk8k2ffp/DmDR3exuQ+Q7SGHsKudIA5qnTB2SCs46ByMfUDxDI0eeotS12pRQQRtJMOPuKP4HpEQO1c6dTsMYgFNUq1Ss//qUm75VrHRCG480ULksmzSNzhx0SVrh6MZMSUI6tjdhNZY6S99ip4JeMJ83kw0h/XDRyJHGBxfuzxs5FZBVnMx/6e17GwP1QSfHdxKoYHcgiuAnNlwj5BJHxQ2QmrMfD/hlwbg9JyNKXhhffjZ38Pn/diM0s02Yb2efedRFjXtq2x1niNKCHo96TEWUmz2fYxrOjEyE4WtEeapkVdo/457Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHAR5F48ogXidU3fe0pOBn+XSwcb9BaM4AzfDmDwIhY=;
 b=l7aL5+rB2JXUFhQHIDWrc6+L04qq5l3IbTeySXh3z7yfMI+p1Fz075AQL/Yrr5EV9vgpUVxAFRflALzsp638sFp/6vn9zzFLAVNo533nzCGC7ip3MgIx/Dcf11pQc8dGenNFfOue5SVXf7Uo5Ry8JyTkQif4QPoA+Y7RvYmb1EAhLPsY8ELjQqXLRiYtAaUgoTe9cHOoGitZtgZSZZyTKlgZ/ZBXTjiDenjcjcRcc0FuRLLVHrzxBMPzM8QOGpeN/OE3RhOufhhL5L3tVOD94QJS37ZtoAjnnlPJ11r61JoQ67FDYbB47rOMWs+V2wkqwlC4JhPujSIBXg3sov+86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 15:17:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 15:17:21 +0000
Date: Fri, 1 Aug 2025 11:17:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to
 disable late binding
Message-ID: <aIzafHWskNOEcXuC@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-19-rodrigo.vivi@intel.com>
 <1f323cf45af3ba781d46d2e889f89bc26aa9b85a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f323cf45af3ba781d46d2e889f89bc26aa9b85a.camel@intel.com>
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 657e22ec-7335-4a0c-d0c1-08ddd10e828b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6Nv5gKrbPz+7L1qmxzVUXMWIvf7UPN71cc0VUc9PjigSURvaAq2YXoDxTa?=
 =?iso-8859-1?Q?52NKpsCufWfLQpsRLQSzPVqcoxR6OE2Mqzi3Snq8blHAJuVUmEdN1QRWfU?=
 =?iso-8859-1?Q?AiPVi75APITpmC/mIP4wPuGYHetJ8RQU9kkaQ1JmcN2EEbRkbZ09ZRR0ox?=
 =?iso-8859-1?Q?B1UjxkB7gK0YOgM5YI17L0af+3uD2UUFsFL4N0Zw/QATlef23IZVYk4GGo?=
 =?iso-8859-1?Q?BAeE8NB9qthwhoCF/1BufBbgXRnKXS3BsaTJWeD4GdjOHjzqqqeMZWtMYO?=
 =?iso-8859-1?Q?e9zkpZUMYPe9l8HVoguRUwIqZExJF14YV2wBKACi8GbzwbinZ5EuWieMZ9?=
 =?iso-8859-1?Q?N6cg+dEBpsIc0ZNzJA5OP8KaccUR5CG5i6xcaoharNVQ8B+jyxHtsI1SeK?=
 =?iso-8859-1?Q?/EYe2fu6OOxcTPXa4eJAJeJMAr/Yi9k1yo2FeJTYaRwidRAI8IrwV8bRXZ?=
 =?iso-8859-1?Q?bJxCc2r+PehAbzuboMaMabTdoVK7JO0CFxLvFVskJzf7yDIcywpqOEyytr?=
 =?iso-8859-1?Q?zNNbK7wK/YgccEI9CIRgpiGpsXK+K6oW7cgdAyvngJXPRRYOtM6zjt9PhR?=
 =?iso-8859-1?Q?kHdLqjrT5y5/KtFvqsyswdSM+AThS5OZsTlHd7id7zK5/TY3iJq9n301eo?=
 =?iso-8859-1?Q?hcQoczKc9aUTclFiHjhIdMzmJWl2Cn2fKYjRIPK5ksHTmvIkfdIlQfDsRF?=
 =?iso-8859-1?Q?x+/CXygNNkr8EYcUTefmWBYXsu9pvDj6sTCdOe5WW8ns6who6wFk3BHn90?=
 =?iso-8859-1?Q?7ckxyKwZw1fepyYCagmLCGQISXsw5Y18e8jS23c4LaLGv6d40rZyWQa6DX?=
 =?iso-8859-1?Q?7OaAaoEJzrkJ+erN/HOZ1ZcAntjaPntY0KvhOJjZLVUFF+39gwpJtemCbb?=
 =?iso-8859-1?Q?3lJmkq5xo5GzCBUJvAOwP4M8hjFxt2GEPwUNcHHKuWqDwnb51yZsbW4z+j?=
 =?iso-8859-1?Q?cGPsDrVfSmEqN3NrDvrzfuCAoyYmXmFHDS9mHFVnzfd+qJbJxPQFFPPbs5?=
 =?iso-8859-1?Q?rKRaipXuDgSMZnRL5aG0YOzKiZhgh/ZdtM9LMAjiwWn0t3p8MU/peAohGN?=
 =?iso-8859-1?Q?VDVcaXoYXJ74vqq7z6h6zIP9NUp3+5GbvCFnK2AFsMyvzaUfJKofHFi67K?=
 =?iso-8859-1?Q?BxchnCLP2u6BI5IeSoCAZeSyd2VsAW3mK7Vh/SVyLMP6GAnih7+3Q4qHr1?=
 =?iso-8859-1?Q?4u+ng7r0SOonV69QiopEYo+lMelYafIcsmPV+yar0+TIWGJgkW/7Wio1yI?=
 =?iso-8859-1?Q?NcGJNfWy82oaZs5RKbZiXCM6sPLkko9K0ZIyZG6UXuWk8atK7JUYzOis3P?=
 =?iso-8859-1?Q?rc5PbRYqGu9vH5lzgimPxsS0UdjkMNa9cB49ifG6rJVerQQrI2Lj4/XyYJ?=
 =?iso-8859-1?Q?al2UPGpZgkl75+V3YPS1wNYiYflBJL7oNKl7BK8sEVLfLkYT7MOQVSTtNS?=
 =?iso-8859-1?Q?7UfD8iRuHbZUoV6AlSYJfGrS36YPBsexgG9xsY3wpwJ7U41OyQvZ78a5i1?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/nuxWrMbiC8Mc9EZbO8P7tFizVf25uZp+4YZPl+pd0nVVomjTRExJdThFY?=
 =?iso-8859-1?Q?YHG2WKeaU5Ah04qZGIX203ddw12cwOLM1IwD2Ve7FXxyK2H3TourIJaGgA?=
 =?iso-8859-1?Q?zJKms1+rLmlquZEE+jc/KLM+bfgjW14maEYNNNHigtpaFvh7xLLJuhCrb2?=
 =?iso-8859-1?Q?GWy4oq5ZaieCYkYurL9hhPeqJn8hd+wetSA3tuIA8JyrFVEqg4oIzpjiW+?=
 =?iso-8859-1?Q?ktE4/xWS2Ye67F4vMu9+vENm3gIE2VInKA72al9oHRgkFQ38Q3qPQ0GTRD?=
 =?iso-8859-1?Q?2DBJB3hmg3Vu6IrchDOoJRwFp2PWjxMYvknvLUn/2sp19NfRlTzfWSQ2Q3?=
 =?iso-8859-1?Q?8fFdAJroe2d6p7WiZziMIaW2sW0yjvNvG1/7r+/sLtHDhsGiiZCE18C1Cj?=
 =?iso-8859-1?Q?LquJ1CeHK9XDP3Ff7rK+hWa13Yao1h07pS++JWQo35ZaLVNMSJ0fsB8AN0?=
 =?iso-8859-1?Q?Sn1ceYyYepE8Nmz5PSMwxwAc0ZNzPlmfzmuvt+EExpRHDSYfVX/ffGSJm3?=
 =?iso-8859-1?Q?7kFvqNM6okA4UEDPkj+6hyHdub9UvIdYdmQsii6weuktBq2Bios6YSAX7r?=
 =?iso-8859-1?Q?ZxmgdEluMy8beHT+zHnc4cyVcTECGWBf0A0OXstMjHm43TD4sNyQ9IBl3d?=
 =?iso-8859-1?Q?zluqfWowZ3bFPz9iF8kwcdadKJLm1YLkQBK3VcN/9okR1TCNwjP/E2mO6+?=
 =?iso-8859-1?Q?60Zh8PDM0CjlJoORY22qgVt/feuDAS0vV8moeUEeF7LOtrNAM9v21VTYME?=
 =?iso-8859-1?Q?gUvMmdQA2hlYzYJHFfCns1LujlGqwUAEqGHuU/W3VKTMyrbHVQUp1pc5zg?=
 =?iso-8859-1?Q?nQeruDNa0bOx5WizyW+ssFvx/9/ZW89u3vPw1Sa97AlD4RrP0iV97fphVD?=
 =?iso-8859-1?Q?ZC4qHH3SjN0YJjK7KZZeZF6/1PgeadCcIV3gJPux2K9Pq7zXpwUTjLh1gS?=
 =?iso-8859-1?Q?DwN85Dr2bMwp+0pO0Js4DsUUOyKYoZWWd5w2j0f3kD9DvWCTNePAxgscku?=
 =?iso-8859-1?Q?ko7Zf8VoriETAkYljg5f574+gmlHPTcNzsJPyfNtMBQ0lgRZuPBh4H3dW7?=
 =?iso-8859-1?Q?Vpxl3SwOviZ9kiglBQInANE9SexxxKmSZAWUhQQu2aEgtIJIY+xMhVSqWs?=
 =?iso-8859-1?Q?+2+I54bfA7lgNa4o0MOlkR5rXEXjFK1IxqrrBE5E2I61N8xZceYlw6jnmy?=
 =?iso-8859-1?Q?iXqPoY/yIwbAC8cauFGGlgCPEz/Xe90A+XzQBDxmGNwet4SEqBCce0g0FM?=
 =?iso-8859-1?Q?wiu30Za0Aa3tSsnc3ljnR8HwiPHyz+Aemq5DaL4wNtB0KP/qv00ujKN4wR?=
 =?iso-8859-1?Q?I6gaNhhxzEBVVWmSk93rIJHMD+WoprLa9ct4ZUSmjkHbP3DjZioBMHym4T?=
 =?iso-8859-1?Q?byep81DdSZ76ftbj+9simPlCm3Q0kdPqHnZRYadE5j4YTBJ0+VL9mrc9vI?=
 =?iso-8859-1?Q?Mz07jFDGh5AeQbAOW+iXdUqiZh3HA82unyUSCFzayVgzq02aDhFp6fbBEA?=
 =?iso-8859-1?Q?bB9GWqRwQbBfU8UEbF5Uutg7zCLTfGdeaZMDn3hdHnfnY5Q0azoToa9h8U?=
 =?iso-8859-1?Q?/If7lIfUZT78xc1myDP93km/eUMQe7QKO0B5+reo/HaNzLpgALfDMJrwry?=
 =?iso-8859-1?Q?irdkoi64PCqOvHf+dwalRa6TQgHGflEj5b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 657e22ec-7335-4a0c-d0c1-08ddd10e828b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 15:17:20.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c175BFQIW0iIBUb0nZi8UMS1YnqXlcDpcTgWjyC2PC/BsJo07BkGyXXcT/sI73IkwywQfEajuFSln6F9DWpMNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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

On Thu, Jul 31, 2025 at 08:03:36PM +0000, Summers, Stuart wrote:
> On Thu, 2025-07-10 at 11:08 -0400, Rodrigo Vivi wrote:
> > From: Badal Nilawar <badal.nilawar@intel.com>
> > 
> > Introduce a debug filesystem node to disable late binding fw reload
> > during the system or runtime resume. This is intended for situations
> > where the late binding fw needs to be loaded from user mode,
> > perticularly for validation purpose.
> > Note that xe kmd doesn't participate in late binding flow from user
> > space. Binary loaded from the userspace will be lost upon entering to
> > D3 cold hence user space app need to handle this situation.
> > 
> > v2:
> >   - s/(uval == 1) ? true : false/!!uval/ (Daniele)
> > v3:
> >   - Refine the commit message (Daniele)
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Bit of a flyby comment here, but would it be better if this was
> configfs rather than debugfs in case we wanted to skip this on the
> first probe?

Indeed. Configfs seems the best alternative for this. Otherwise
by the time we get to have the debugfs, the fw was already
attempted to get loaded at least once.

> 
> Thanks,
> Stuart
> 
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c            | 41
> > ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
> >  drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
> >  3 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c
> > index d83cd6ed3fa8..d1f6f556efa2 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -226,6 +226,44 @@ static const struct file_operations
> > atomic_svm_timeslice_ms_fops = {
> >         .write = atomic_svm_timeslice_ms_set,
> >  };
> >  
> > +static ssize_t disable_late_binding_show(struct file *f, char __user
> > *ubuf,
> > +                                        size_t size, loff_t *pos)
> > +{
> > +       struct xe_device *xe = file_inode(f)->i_private;
> > +       struct xe_late_bind *late_bind = &xe->late_bind;
> > +       char buf[32];
> > +       int len;
> > +
> > +       len = scnprintf(buf, sizeof(buf), "%d\n", late_bind-
> > >disable);
> > +
> > +       return simple_read_from_buffer(ubuf, size, pos, buf, len);
> > +}
> > +
> > +static ssize_t disable_late_binding_set(struct file *f, const char
> > __user *ubuf,
> > +                                       size_t size, loff_t *pos)
> > +{
> > +       struct xe_device *xe = file_inode(f)->i_private;
> > +       struct xe_late_bind *late_bind = &xe->late_bind;
> > +       u32 uval;
> > +       ssize_t ret;
> > +
> > +       ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (uval > 1)
> > +               return -EINVAL;
> > +
> > +       late_bind->disable = !!uval;
> > +       return size;
> > +}
> > +
> > +static const struct file_operations disable_late_binding_fops = {
> > +       .owner = THIS_MODULE,
> > +       .read = disable_late_binding_show,
> > +       .write = disable_late_binding_set,
> > +};
> > +
> >  void xe_debugfs_register(struct xe_device *xe)
> >  {
> >         struct ttm_device *bdev = &xe->ttm;
> > @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
> >         debugfs_create_file("atomic_svm_timeslice_ms", 0600, root,
> > xe,
> >                             &atomic_svm_timeslice_ms_fops);
> >  
> > +       debugfs_create_file("disable_late_binding", 0600, root, xe,
> > +                           &disable_late_binding_fops);
> > +
> >         for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1;
> > ++mem_type) {
> >                 man = ttm_manager_type(bdev, mem_type);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > index df43523e9043..88355adce1d0 100644
> > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > @@ -167,6 +167,9 @@ int xe_late_bind_fw_load(struct xe_late_bind
> > *late_bind)
> >         if (!late_bind->component_added)
> >                 return -ENODEV;
> >  
> > +       if (late_bind->disable)
> > +               return 0;
> > +
> >         for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> >                 lbfw = &late_bind->late_bind_fw[fw_id];
> >                 if (lbfw->payload) {
> > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > index 5c0574aff7b9..158dc1abe072 100644
> > --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> > @@ -65,6 +65,8 @@ struct xe_late_bind {
> >         struct workqueue_struct *wq;
> >         /** @component_added: whether the component has been added */
> >         bool component_added;
> > +       /** @disable: to block late binding reload during pm resume
> > flow*/
> > +       bool disable;
> >  };
> >  
> >  #endif
> 
