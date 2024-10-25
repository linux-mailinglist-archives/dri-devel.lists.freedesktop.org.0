Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415C9B128D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 00:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F9D10EB9E;
	Fri, 25 Oct 2024 22:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/OjxQwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A710E157;
 Fri, 25 Oct 2024 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729895232; x=1761431232;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cvXz3xF9BZYU6B9NbhiijgIiOnmx5XBrL/TPWDDO82w=;
 b=Q/OjxQwK+5G27BZY85PYsJ8oAMnqjvNOFedPB52Q7K0p3hsXUY5NPBII
 4NUhHhXl4RdMflwrc1Lf5cJkxxMH9FoW8Vuwn7zDC3ixmHbsjpMWgKnCw
 qrBe9TBHXK5ABoo/Fjk7Yu14aeoDhQtq+JKuNS6zw5Gwq6rQea4FtC8mh
 p6DTL+lU5OkWuSDbHStdWR4Qkl0zoiNb/Vttr95VTt1Gw3g9/W3cI+jGu
 SfK3UfKighipkEj75L7isRAWwWLxraeVj33i6WZKA1QU6lckCWBM9gnvP
 rcb5jWCFMfL+LHGlQpQQPlQj0Ib37rxPUxKLMxWy0KnEUAU9zpQcSVDV4 A==;
X-CSE-ConnectionGUID: GR6d5+ufQ5KPPzqsCGnVyA==
X-CSE-MsgGUID: YidNeVivRkG7hJp2JsN5lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40195168"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="40195168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 15:26:38 -0700
X-CSE-ConnectionGUID: gp60qZxpRRanpFuow5KSmg==
X-CSE-MsgGUID: npcx7tQ2SOywTC5AjRpUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="104366915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 15:26:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 15:26:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 15:26:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 15:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFQUOP14OqluAUChtwhdBAlXwEbHOqE0nFRntQ8JLnmgbdXMqqZIGxJ9a79gUkMFo8KimYMN4G/Pcx/42A52Vna2HdDMS0ZUbVOADpmdbvr3v7SQYDCxL0G5ee54cWEhaPSYsKY1nx3883L/jIQ68H8IpV+DQsnZVajGe+vYxgjRlokeEXUI0faN0LipBJtIs92kQysTVZJzaOXz3o/KUeE57+TdXRJOB5+9lJOQRsXlZhyi3UE0qD6mEOBbMv5J8VIirRPgq5fcxcQBzh7nzvA2hu0ilX4bg78FFY/MdhNnaM1OBZOkDXPY9GbCkZfNxHxLi72XjfLpDBPirgi2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWCY2P/khehlryxxb33YkKV0M88o1wtfVd6UnNJ+cqI=;
 b=egohGYSi6eP3szXf1Tr+qhHJLuIdFHib3cxDijMmrQpiOtzA/DJw6aBs7AnUze1BP/pvpwAZ9mqD1YfnqiXPrIGNYFjzkvetkcKfhc5s5OqiDOIA0G7ZTYOOhRg41kBZbcoJ/kEGMqu670n5FmR7uVEuOB7Dk7RAe6Nl25bXRO0XjKs6GYUvHWLMPrm1sOuAZAWH09ywCC+2RExjkOqh+4AmRI8gE7Jx3AYP6h9bZED0ctXwzE58QA1yKaHqAF5wDZui1roO3T4Ez2YmTypxb2fnt2hZCX2e9uCb1Oqyfhf5UjmI3Ff3Q3a0fH9MWXTnASkCgQhzgAPaeBP68AVwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 22:26:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 22:26:33 +0000
Date: Fri, 25 Oct 2024 22:26:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next
Message-ID: <Zxwa/3X/KDAE3uZE@DUT025-TGLU.fm.intel.com>
References: <ZxqJS8bCWc9ZgIav@fedora>
 <ZxqeXxbcdVt8lN4k@DUT025-TGLU.fm.intel.com>
 <dfdd7040f846234cc4ec18d71e4e4746739c1848.camel@linux.intel.com>
 <87plnor0e4.fsf@intel.com>
 <f8b752348b9442f52a0f420818688fe9be5814a9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8b752348b9442f52a0f420818688fe9be5814a9.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b2d230-bb8d-418c-c26c-08dcf54414e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?agaUO+Q1MBI26THo1rdopmQYE+UaggCcAOHOGLtyKvRG1/lBBAaD28iYwF?=
 =?iso-8859-1?Q?2AepkuFaonuyjLTyWRUD6O2OR3IQkQNUZMJCz/i/56TJEwmvPgKfVdMrtA?=
 =?iso-8859-1?Q?UBnrh2dPOtagGRcdqZjf6F7UeJQgwQuG7ZcFv6VhQGMvjO0Ptu7hrR0mSJ?=
 =?iso-8859-1?Q?TUaqCEl324zHtpd2JPP0ZusA/wlXCg1bth/rcrheKnS+F6jMjPnOObZy2K?=
 =?iso-8859-1?Q?R/D4GG+kpUr88yA9aLuqIw5vk9FcD947SxKhKu9zewO1pHcMRYKdRlEx9s?=
 =?iso-8859-1?Q?N0Rs2mFvVn0D6Axna6iVkdAlOq1d/9eZPwNcMgs0/+sNQcp8OZDkhn3pNP?=
 =?iso-8859-1?Q?Ztcttaw4Gnc1jFznElzL4Q8UXEvgF78gPgWec0xRwzN3O4CtWp25lt7eEd?=
 =?iso-8859-1?Q?5hQ3uf+TLWkgH5e7fIsw+y3F3c+aRbage7JuTsfAiDLAOg2zomIwtweSN8?=
 =?iso-8859-1?Q?YQ4faxDrtGKinrwoHzsoYgRawvzYffKholKRRV4LV+9OQhuMef3kbr0+s4?=
 =?iso-8859-1?Q?3VYitJ88m2ugYc9+uxE2rVoYJ5CCF87MU3PWJ6/56gv8EeC1tFJm/7snmE?=
 =?iso-8859-1?Q?2An1+EAmw+J53mTrn1Dv0X1cYch8LI5bRS2pv3e2klMai+7PwhVNHEMlt+?=
 =?iso-8859-1?Q?s/ePkSXUSq4ePh5cp6Ge/IB+te3sL27GBOo6bd/nPv4OcQ/lU943OuOL/O?=
 =?iso-8859-1?Q?F5BopW1wCsbME+jvE7n1JORxjfxeAh7mNbq6OosPccqsVxjqbm/cZfmV3g?=
 =?iso-8859-1?Q?UfkBaQyPgoKfwf7koHDZrSCF+mmub916IIROBNCwpKVIZsbwMGD8dTJERO?=
 =?iso-8859-1?Q?i/Y66vhgtwxI+TFDQ+IM1izmPMwbLRMzn/qUu3FsrEqmVlASRoIM1VE1yg?=
 =?iso-8859-1?Q?Rm6KF4xPKdqTxaL5I7YbunwNf7OlB2cflQ7xU7/xL/QjRVapBE8RQmmH5u?=
 =?iso-8859-1?Q?+SUMujyq0sqWPfCXPQ3vA0QmXOat1xd1LwafB4ACMi4JT4aNbCOyn1PsjD?=
 =?iso-8859-1?Q?cORWCXmX5Q/tmGwtkVoc2t8n2QxIcJEsSSnlisEAi1CIOdYrflTFnnYQVY?=
 =?iso-8859-1?Q?6kbW9ISWwjIIHNh91QnS/+VRqwwPEsTkp5Llxn2ZMMfWQtr/y+5Ky+/QkT?=
 =?iso-8859-1?Q?BYghNBxAk7LXr7VnBRNOSrNvxIcKE/pnktHsXOCVFesz4qHV0sJFLgsOUD?=
 =?iso-8859-1?Q?/zjeP0h9yIbtGiGb36mR5JKFvs8dGKn1J6UcpUlS+63Ijd9LnTiu5Kvled?=
 =?iso-8859-1?Q?uR99ntKxre54ZSSARV/OIAREE349Nj1BZg0Dm0Dnckpq8rLQmg7i3qD5Mw?=
 =?iso-8859-1?Q?udBgMw/Y3obW4HZ2kjUaDK7r8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z4Yui3rGOTtlN81IYKQTtruRQ7K1cf8DV4WikaZxezzyzCEDQfupizIvSd?=
 =?iso-8859-1?Q?y1cVJMg2YSpuhiqIa6XJdQMftTw71UkNBWD82R9V7ytJL6lIY8k8Pi9HWx?=
 =?iso-8859-1?Q?RJNcKhraoMJO0z4pO3y4b6KUep/fBTFCNgEQs6PBaKF74Yx5gNiFa7uGHZ?=
 =?iso-8859-1?Q?11smfL3cUiPtxCxyOnmQfhjGPsNqrIDu/5sMrWkq29MsEUhjMsvnfN9Q/K?=
 =?iso-8859-1?Q?aGKkW4NFvGuKZbLWyYC9d1Uz4C+EPdKuvcq7umwqL/+Zv7bwTmGYlCvoFN?=
 =?iso-8859-1?Q?2CVvJme3URiV7Sn5s9AH6m+hSIZLfZsgAPoi7td6CaMEbV3oe7V5SwF6Fr?=
 =?iso-8859-1?Q?OdvKY6ObbrgwmzMfwR/HDtTKSJp8QKJ5dlq/+vkKPyFC7TFPgiHZ8rnPOE?=
 =?iso-8859-1?Q?COzbZAAiB7uvxRA5uNAVK10qN95dmRo2EqIbrzTTjYrq7GEsVYtvEuALgk?=
 =?iso-8859-1?Q?iaGnKZw9okV2rmyvrDO3EHz1WkL4chWWSH1CY/khC9EDjrX2hwS1jCUtd2?=
 =?iso-8859-1?Q?dedH+YUqRHEU945XsTIcNaYPP4QYMerOjdyzN40I1KcfwzDZJm1y/PbzAR?=
 =?iso-8859-1?Q?24drsqJa31BNzbyGWtEL26SeBP24rhBrdi8xBFpfmBo8ZFqFqavyR16CmE?=
 =?iso-8859-1?Q?rt2M2++yhiXo736UZKnXUdGbBVomN+SLHKoAudaFDMwyzyXOa1BmqD3e2X?=
 =?iso-8859-1?Q?m025RhbkQ5qoBm/fcSR9iIkDkwhsR5zpRogsAKO40Q9Ih7+p+uBqWPwweh?=
 =?iso-8859-1?Q?0TDdCfr/zIRokiTGmaDTGL4gplAe+5dNiihtz9taIBYGlCmsPsVpPsOK+t?=
 =?iso-8859-1?Q?6MWQQuRBDg1dn0tsbBT4CCXIwtNaraCvw70AmhxsBmtY8TzDNtkpefRLtU?=
 =?iso-8859-1?Q?dc4XCaaNRq3oDu+9dC5UKgGI7SlIGeQ8MghEuDis4+8x1SoOa1v3rbSQeA?=
 =?iso-8859-1?Q?UrCoGuO8tib526NtXq67hM4C4e810abrDyBJvAzBblTB5KjQba6PnSFo6s?=
 =?iso-8859-1?Q?gvLhoaeQOwxyxoyV7puxNC9hIi0LuS4sPOg0jtJVO9R9U6izELJ/tbZ/Xl?=
 =?iso-8859-1?Q?T6gtriCMRNFs9Pl2QvLKxWJTM0NdrKrx086Keaib59fylAgZLsIdh52SEZ?=
 =?iso-8859-1?Q?X2D1yR0VUohbwR5craszXjp1WwSL25aDZr7X20kYStNlrH8vf+rZaXSVB9?=
 =?iso-8859-1?Q?pSNOk2074oh0+CS515axwek/J9PPMMHYaLFF/ijyYWdZ3LICDVpwNTgxHz?=
 =?iso-8859-1?Q?HTfUmFB4LzSLW0ldXSowWDLFpNiuBfbwxS3Xsie/14fhxvOED2sjmwKHeO?=
 =?iso-8859-1?Q?Kv0BL4GnqjYOd007KBdtfaAtMszyCuh8XVywND/YvCZxlZWXNiJ6Gr+EvQ?=
 =?iso-8859-1?Q?S/9nm5LErksKieUkJ4jp7EUDYzZ72GY05mHdPJzLjOW2tKNXRlWHRs5KRk?=
 =?iso-8859-1?Q?+PxVA8MI80KY6f/7oMN7wv/070gVsIyR4+tyYOgi19A7QM3wZ8V1kBijGL?=
 =?iso-8859-1?Q?bWUBRo0mV+BY1K9MFPZuqhHw9eEpwvcgVYVgbkH8R6wYHnn+q6Sx8w6tRQ?=
 =?iso-8859-1?Q?CBQGQQbsiIyfG1W8nnAhaN47rYdGlNvcKjHKnV5HfhIRto63ulg8Z86VDw?=
 =?iso-8859-1?Q?HChDxfWFXN3t2fZ7sJLkNOHIrAMoat/e+KpdOi0NppGL6JpPnaEf2VoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b2d230-bb8d-418c-c26c-08dcf54414e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 22:26:33.8481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/NJX+f8VccrfoDMB6gD8ik2cm13ZcEGFh+HQjOEFf0SqsiwABIkX7F+G2KCw+G8xYfKfvt0jgB3JkZNmu4Npg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
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

On Fri, Oct 25, 2024 at 12:45:26PM +0200, Thomas Hellström wrote:
> On Fri, 2024-10-25 at 12:34 +0300, Jani Nikula wrote:
> > On Fri, 25 Oct 2024, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote:
> > > On Thu, 2024-10-24 at 19:22 +0000, Matthew Brost wrote:
> > > > On Thu, Oct 24, 2024 at 07:52:11PM +0200, Thomas Hellstrom wrote:
> > > > > Hi, Dave & Simona,
> > > > > 
> > > > > This week's drm-xe-next PR
> > > > > 
> > > > > Thanks,
> > > > > Thomas
> > > > > 
> > > > > 
> > > > > drm-xe-next-2024-10-24:
> > > > > UAPI Changes:
> > > > > - Define and parse OA sync properties (Ashutosh)
> > > > > 
> > > > > Driver Changes:
> > > > > - Add caller info to xe_gt_reset_async (Nirmoy)
> > > > > - A large forcewake rework / cleanup (Himal)
> > > > > - A g2h response timeout fix (Badal)
> > > > > - A PTL workaround (Vinay)
> > > > > - Handle unreliable MMIO reads during forcewake (Shuicheng)
> > > > > - Ufence user-space access fixes (Nirmoy)
> > > > > - Annotate flexible arrays (Matthew Brost)
> > > > > - Enable GuC lite restore (Fei)
> > > > > - Prevent GuC register capture on VF (Zhanjun)
> > > > > - Show VFs VRAM / LMEM provisioning summary over debugfs
> > > > > (Michal)
> > > > > - Parallel queues fix on GT reset (Nirmoy)
> > > > > - Move reference grabbing to a job's dma-fence (Matt Brost)
> > > > > - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
> > > > 
> > > > This breaks CI [1] - my mistake. Maybe omit these in this weeks
> > > > PR.
> > 
> > How did this pass CI and get merged in the first place?!?
> > 
> > It's now botching unrelated pre-merge testing all over the place,
> > e.g. [3] and [4].
> > 
> > BR,
> > Jani.
> 
> This appears to have been a partial merge of a passing series....
> /Thomas
> 

Yea again my mistake on the partial merge - will be more careful going
forward. Have RBs on the scheduler patch which will fix our CI but
getting conflicts on drm-misc-next so need some maintainer help there.
Friday so won't get this fixed up until Monday.

Matt

> 
> > 
> > 
> > [3]
> > https://lore.kernel.org/r/172981565466.1330037.6238046952250769671@2413ebb6fbb6
> > [4]
> > https://lore.kernel.org/r/172981849964.1330038.16133455483045565936@2413ebb6fbb6
> > 
> > 
> > > > 
> > > > We need [2] merged to fix this. Waiting on an RB but I'd like to
> > > > get
> > > > all of this in 6.12.
> > > > 
> > > > Matt
> > > > 
> > > > [1]
> > > > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140135v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
> > > > [2] https://patchwork.freedesktop.org/series/140406/
> > > 
> > > So this CI failure is a warning only and IMHO for drm-xe-next
> > > (6.13)
> > > it's not catastrophic. There might be a window in the bisect
> > > history
> > > where this warning appears. It's perhaps more important for -fixes,
> > > though.
> > > 
> > > If we need to wait for the scheduler patch going into drm-misc-next
> > > /
> > > drm-next/ backmerge we'd hold off this branch for too long I fear.
> > > 
> > > @Dave, @Sima 
> > > If you feel differently please skip this PR for this week and we'll
> > > work to get the scheduler patch merged asap.
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > > 
> > > > > - OA synchronization support (Ashutosh)
> > > > > 
> > > > > The following changes since commit
> > > > > 2eb460ab9f4bc5b575f52568d17936da0af681d8:
> > > > > 
> > > > >   drm/xe: Enlarge the invalidation timeout from 150 to 500
> > > > > (2024-
> > > > > 10-16 16:11:10 +0100)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-
> > > > > next-2024-10-24
> > > > > 
> > > > > for you to fetch changes up to
> > > > > 85d3f9e84e0628c412b69aa99b63654dfa08ad68:
> > > > > 
> > > > >   drm/xe/oa: Allow only certain property changes from config
> > > > > (2024-
> > > > > 10-23 12:42:20 -0700)
> > > > > 
> > > > > ---------------------------------------------------------------
> > > > > -
> > > > > UAPI Changes:
> > > > > - Define and parse OA sync properties (Ashutosh)
> > > > > 
> > > > > Driver Changes:
> > > > > - Add caller info to xe_gt_reset_async (Nirmoy)
> > > > > - A large forcewake rework / cleanup (Himal)
> > > > > - A g2h response timeout fix (Badal)
> > > > > - A PTL workaround (Vinay)
> > > > > - Handle unreliable MMIO reads during forcewake (Shuicheng)
> > > > > - Ufence user-space access fixes (Nirmoy)
> > > > > - Annotate flexible arrays (Matthew Brost)
> > > > > - Enable GuC lite restore (Fei)
> > > > > - Prevent GuC register capture on VF (Zhanjun)
> > > > > - Show VFs VRAM / LMEM provisioning summary over debugfs
> > > > > (Michal)
> > > > > - Parallel queues fix on GT reset (Nirmoy)
> > > > > - Move reference grabbing to a job's dma-fence (Matt Brost)
> > > > > - Mark a number of local workqueues WQ_MEM_RECLAIM (Matt Brost)
> > > > > - OA synchronization support (Ashutosh)
> > > > > 
> > > > > ---------------------------------------------------------------
> > > > > -
> > > > > Ashutosh Dixit (7):
> > > > >       drm/xe/oa: Separate batch submission from waiting for
> > > > > completion
> > > > >       drm/xe/oa/uapi: Define and parse OA sync properties
> > > > >       drm/xe/oa: Add input fence dependencies
> > > > >       drm/xe/oa: Signal output fences
> > > > >       drm/xe/oa: Move functions up so they can be reused for
> > > > > config
> > > > > ioctl
> > > > >       drm/xe/oa: Add syncs support to OA config ioctl
> > > > >       drm/xe/oa: Allow only certain property changes from
> > > > > config
> > > > > 
> > > > > Badal Nilawar (1):
> > > > >       drm/xe/guc/ct: Flush g2h worker in case of g2h response
> > > > > timeout
> > > > > 
> > > > > Fei Yang (1):
> > > > >       drm/xe: enable lite restore
> > > > > 
> > > > > Himal Prasad Ghimiray (26):
> > > > >       drm/xe: Add member initialized_domains to xe_force_wake()
> > > > >       drm/xe/forcewake: Change awake_domain datatype
> > > > >       drm/xe/forcewake: Add a helper
> > > > > xe_force_wake_ref_has_domain()
> > > > >       drm/xe: Error handling in xe_force_wake_get()
> > > > >       drm/xe: Modify xe_force_wake_put to handle _get returned
> > > > > mask
> > > > >       drm/xe/device: Update handling of xe_force_wake_get
> > > > > return
> > > > >       drm/xe/hdcp: Update handling of xe_force_wake_get return
> > > > >       drm/xe/gsc: Update handling of xe_force_wake_get return
> > > > >       drm/xe/gt: Update handling of xe_force_wake_get return
> > > > >       drm/xe/xe_gt_idle: Update handling of xe_force_wake_get
> > > > > return
> > > > >       drm/xe/devcoredump: Update handling of xe_force_wake_get
> > > > > return
> > > > >       drm/xe/tests/mocs: Update xe_force_wake_get() return
> > > > > handling
> > > > >       drm/xe/mocs: Update handling of xe_force_wake_get return
> > > > >       drm/xe/xe_drm_client: Update handling of
> > > > > xe_force_wake_get
> > > > > return
> > > > >       drm/xe/xe_gt_debugfs: Update handling of
> > > > > xe_force_wake_get
> > > > > return
> > > > >       drm/xe/guc: Update handling of xe_force_wake_get return
> > > > >       drm/xe/huc: Update handling of xe_force_wake_get return
> > > > >       drm/xe/oa: Handle force_wake_get failure in
> > > > > xe_oa_stream_init()
> > > > >       drm/xe/pat: Update handling of xe_force_wake_get return
> > > > >       drm/xe/gt_tlb_invalidation_ggtt: Update handling of
> > > > > xe_force_wake_get return
> > > > >       drm/xe/xe_reg_sr: Update handling of xe_force_wake_get
> > > > > return
> > > > >       drm/xe/query: Update handling of xe_force_wake_get return
> > > > >       drm/xe/vram: Update handling of xe_force_wake_get return
> > > > >       drm/xe: forcewake debugfs open fails on xe_forcewake_get
> > > > > failure
> > > > >       drm/xe: Ensure __must_check for xe_force_wake_get()
> > > > > return
> > > > >       drm/xe: Change return type to void for xe_force_wake_put
> > > > > 
> > > > > Matthew Brost (5):
> > > > >       drm/xe: Use __counted_by for flexible arrays
> > > > >       drm/xe: Take ref to job's fence in arm
> > > > >       drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
> > > > >       drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
> > > > >       drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
> > > > > 
> > > > > Michal Wajdeczko (1):
> > > > >       drm/xe/pf: Show VFs LMEM provisioning summary over
> > > > > debugfs
> > > > > 
> > > > > Nirmoy Das (4):
> > > > >       drm/xe: Add caller info to xe_gt_reset_async
> > > > >       drm/xe/ufence: Prefetch ufence addr to catch bogus
> > > > > address
> > > > >       drm/xe/ufence: Warn if mmget_not_zero() fails
> > > > >       drm/xe: Don't restart parallel queues multiple times on
> > > > > GT
> > > > > reset
> > > > > 
> > > > > Shuicheng Lin (1):
> > > > >       drm/xe: Handle unreliable MMIO reads during forcewake
> > > > > 
> > > > > Vinay Belgaumkar (1):
> > > > >       drm/xe/ptl: Apply Wa_14022866841
> > > > > 
> > > > > Zhanjun Dong (1):
> > > > >       drm/xe/guc: Prevent GuC register capture running on VF
> > > > > 
> > > > >  drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |   1 +
> > > > >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   6 +-
> > > > >  drivers/gpu/drm/xe/tests/xe_mocs.c          |  18 +-
> > > > >  drivers/gpu/drm/xe/xe_debugfs.c             |  27 +-
> > > > >  drivers/gpu/drm/xe/xe_devcoredump.c         |  14 +-
> > > > >  drivers/gpu/drm/xe/xe_device.c              |  25 +-
> > > > >  drivers/gpu/drm/xe/xe_drm_client.c          |   8 +-
> > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_execlist.c            |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_force_wake.c          | 134 ++++--
> > > > >  drivers/gpu/drm/xe/xe_force_wake.h          |  23 +-
> > > > >  drivers/gpu/drm/xe/xe_force_wake_types.h    |   6 +-
> > > > >  drivers/gpu/drm/xe/xe_ggtt.c                |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_gsc.c                 |  23 +-
> > > > >  drivers/gpu/drm/xe/xe_gsc_proxy.c           |   9 +-
> > > > >  drivers/gpu/drm/xe/xe_gt.c                  | 110 +++--
> > > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  13 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_idle.c             |  26 +-
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  35 ++
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h  |   1 +
> > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |   5 +
> > > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   5 +-
> > > > >  drivers/gpu/drm/xe/xe_guc.c                 |  15 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_ads.c             |   5 +
> > > > >  drivers/gpu/drm/xe/xe_guc_capture.c         |   8 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.c              |  20 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_fwif.h            |   1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_log.c             |   9 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_pc.c              |  50 +-
> > > > >  drivers/gpu/drm/xe/xe_guc_submit.c          |  29 +-
> > > > >  drivers/gpu/drm/xe/xe_huc.c                 |   8 +-
> > > > >  drivers/gpu/drm/xe/xe_mocs.c                |  14 +-
> > > > >  drivers/gpu/drm/xe/xe_oa.c                  | 678
> > > > > +++++++++++++++++++---------
> > > > >  drivers/gpu/drm/xe/xe_oa_types.h            |  12 +
> > > > >  drivers/gpu/drm/xe/xe_pat.c                 |  65 ++-
> > > > >  drivers/gpu/drm/xe/xe_query.c               |  10 +-
> > > > >  drivers/gpu/drm/xe/xe_reg_sr.c              |  24 +-
> > > > >  drivers/gpu/drm/xe/xe_sched_job.c           |   2 +-
> > > > >  drivers/gpu/drm/xe/xe_sched_job_types.h     |   3 +-
> > > > >  drivers/gpu/drm/xe/xe_sync.c                |   5 +-
> > > > >  drivers/gpu/drm/xe/xe_vram.c                |  12 +-
> > > > >  drivers/gpu/drm/xe/xe_wa_oob.rules          |   2 +
> > > > >  include/uapi/drm/xe_drm.h                   |  17 +
> > > > >  43 files changed, 997 insertions(+), 487 deletions(-)
> > > 
> > 
> 
