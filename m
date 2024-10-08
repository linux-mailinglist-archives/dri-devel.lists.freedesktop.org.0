Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16C993E65
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 07:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE210E45E;
	Tue,  8 Oct 2024 05:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcUCTONb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAD410E203;
 Tue,  8 Oct 2024 05:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728366013; x=1759902013;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fm3VWAHiD5dE5KPfsC0I9Pb6RN+MUSQWPHPJZ28ucRA=;
 b=UcUCTONbBUSxw/qAe6KAa95H9mNGH561PBvXeI/FMHCg0dEZfDXdWp/0
 h0ZtWYUV/eEKrscYPHjnsquCP/DtIURTBb1XZoChC+/JWbsTdrBFDn2aS
 AIBm2EEIiGDvHlFR4CHHQXRBb2Haq7RWSQQHR5E/m3eS48boc7MGZhu/k
 tLV6IHxDw//4ZxDIcGEM6O+M4fPmDkFqErr4mBfgk6IlkV2aL6k36Wzoh
 rP/LQnM53QFrHELtcXNrztt3xyt14SfIAHHMtn/rZPm6qhrMJ7fli3krq
 /ox76FI2CmMF28XbHGE7kcDzEdpgnvEG1PQQGBrprLXyIcxXZ//Qvu4EB w==;
X-CSE-ConnectionGUID: 7q2s591WR0aCtt2GfZKyAA==
X-CSE-MsgGUID: RYRzTL61TkGPvb/o2s2bTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52944033"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="52944033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 22:40:11 -0700
X-CSE-ConnectionGUID: 5q3X1lktS926/+etgauLLQ==
X-CSE-MsgGUID: 1pNjsQE1QKSegO6JltDCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75956604"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 22:40:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:40:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 22:40:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 22:40:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 22:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk6sps0uwtBpqC0dNRviGVF+YPfzz9ROFQz7cWH8Rv4w/rTyVmeqb/sT5N74IuwSuczaBdInkmboNntK+pUENvXNtnKyUxxUItPDQQLsxKBCV8irtL8gC7ovL8KPZetN40GBMWeTf99BoL6+GkacWccPo1V0hJ9MKOIwTL1MebfkZqGvGIHgps4JI8d2LkENDJayydkS4ZDTekifSc4tyTNLf2puYfQOciyYvrf7PTpRCY8yb26vFRN7OVD3A2IEa5QZ5sclDcYMgQbLaDNT/TY/9m38lVHUcj3VLfW7TMLgyhNlemx/ZBZYhJUEEVJMWiyLk1cquJiQSiRKxKaQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfroFoUIdRzAXMOG8duY5Kgd3QnhXO1k2F9UxTvEkJY=;
 b=Z1iL6ZD+MjqIuniCp+dWxGmz3NxwCAsVLA1+d7eP2M2jGkA/i21RCvc5xQGPMdOoIjjElLi6UpRobNWF+fZKIvQ+kLc353fUvDfr6Emb08OwG5I312axln6HagzlhSuE+NT9pORQMB3bMVOqTkHT5wTNRpJj1Kpt5iAC4MK9aSu9xsQ8AzsufqDhL63kNOgp6Up7t+8WyCHBbfVI9BQTx2wKF3xsRAS8z46QZ4ZDGRVyt8BoYaFqtMtpQMyRKRchHObWAzMbdLt8NF9R6Ku+b+3lfEEmVYq3zHnxNy9j+bdN5N/PMOa05Ulzy0b21iRkAcstOg8OhkNZKJr8EMZbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 05:40:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 05:40:06 +0000
Date: Tue, 8 Oct 2024 05:39:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>, Felix Kuehling
 <felix.kuehling@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <Philip.Yang@amd.com>,
 <akpm@linux-foundation.org>, <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZwTFqiuQDjHVHZdD@DUT025-TGLU.fm.intel.com>
References: <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
 <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
 <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
 <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
 <ZvP3pWjVviMdezuy@phenom.ffwll.local>
 <ZvP79hb-0HJMvhv-@phenom.ffwll.local>
 <87msjfcq7l.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msjfcq7l.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c53a2ed-3589-4553-af3d-08dce75ba8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EAYJsXEHRdcQxUoI/9ZrbAz4D519erzKWz5YiEap9Nu+4Imj1ubANbgdIa?=
 =?iso-8859-1?Q?+FtQrFGO3YtMl0HQJ4pAK18/kFXqk/EhRYgVflJmbjZobuVgVlpGodsMtL?=
 =?iso-8859-1?Q?2Gp2P17knQcH6QStxv0uHobmr9T2W7eHjAFV/Tp3MGkGSQOcILo0GadnZi?=
 =?iso-8859-1?Q?S5qH4oY9wWc699EOE9FrGXuwNzWzNwTaTlEFN6gyQr8ps+aBFKu0/UvU/w?=
 =?iso-8859-1?Q?AcNBIeIalxHFlpAF6CIw3G+wZyJkhBbZ81vnQbi9yG4QqEHQO6vhDlejlB?=
 =?iso-8859-1?Q?fv0nlNvvx6LHBQDiYzcR+qGQuyfD0K3Rde4wSUmTpWji/+v8l/SLLsnd9B?=
 =?iso-8859-1?Q?f4tz82Ah4nyi0ccrgV6vh3IAGbEUah7R3LD53LJdAEWQPqiUpvTdPKDpul?=
 =?iso-8859-1?Q?KpWceylXsMY5P3woc0GT6qtLsGS8PC0toiy7GhErxOdsU7ZNJMX38EtVNv?=
 =?iso-8859-1?Q?DEQTS1e5ieEMZkeYYVKTAri75wCB6YLEOWD1OBQHqJAmUO/TW9Ry7PkVSD?=
 =?iso-8859-1?Q?5Y4zID/JV2RHdCXCSyzyZJ1kVvIBUHzNTIceX1k6TPLVHe5NMALoQhSdpN?=
 =?iso-8859-1?Q?Wx/aBmflWMpDgyXCTxKjLFk1nastH2S78oyM9rWn5o/Fu8TYOieSyb+dyK?=
 =?iso-8859-1?Q?taLteMvLHkybP/8qTArMlLcPxR8o/XJba+fN1T3cXbSNQm5rgwcfr1s8La?=
 =?iso-8859-1?Q?QhhPqaCENglKCfu6C97hiNG/tLr/+mzj4udD4FSz9doceinvp0NplA2HeZ?=
 =?iso-8859-1?Q?4NwuICjdYlvI9RWDhqda41EaiZukAQW0aW9esEeNFfVhDniOCQ3UmAosK8?=
 =?iso-8859-1?Q?d6Vt9rOUHhOihAqqQ6MTMkY5ayZNQ3SGtu0wSQY9OO64OwzZEX9s4Nr2aL?=
 =?iso-8859-1?Q?i60PtnEXW/VjT8MD3XbiaOlVOUVVCxmrRKVaVmB/px7AY5a5fDvn4kpiBQ?=
 =?iso-8859-1?Q?s7TlXl98CiiealcD16V2BmvRgra4DSstnCD9b3tqhlbzwjDKFf1rN5UOD7?=
 =?iso-8859-1?Q?X8O0GVncZQw/xKeenSzdYQZwnI+avUkS2rG8qALNYMkRrGEZqdjw4Q7QYE?=
 =?iso-8859-1?Q?zNzKQS3QQTODOTLs5dyODr/ye2UJkUGAQyX7FTe/y1v2AAVLpjEBfqmUyh?=
 =?iso-8859-1?Q?xdl8gCtQ7eaLB5yxAcwOGNgKkqeJ46CD26NwDlpqZrveatT8H/KOJ8M10l?=
 =?iso-8859-1?Q?YfoRGuu5ebLHnmPKKWRilZ9YNE4YS0wnc8ygIfZAiSv0HxYDikqGCA3H1T?=
 =?iso-8859-1?Q?7jfsPrL3SC3faO+gQicrEnotByOACwcaBwK9y6zr8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5X/4zVkgHYG0WcUWlHUaxl0YxtPywiSkdjqyM86NPl9B7YE2fl46xPBgNu?=
 =?iso-8859-1?Q?PhUbnqXWrKa0R1I72ovHwELCpkamgYC9L+iti2sViD1TqlFdZ7Q2YmHqKL?=
 =?iso-8859-1?Q?Hest68bT3RbUet3cItJQ6qVBH7XpWTwgZcL161LyKNi3fmqPEkLXYq3sVm?=
 =?iso-8859-1?Q?WdjPia6xZjltAnUsh6Kmo8cFkEjiYKm2KTHG00o/M1Xi6E0j6oePPwfCGG?=
 =?iso-8859-1?Q?ie2LktJFS8wieSYh3MHizHuKVasPpzOrAVECoBdGI1zmzMgdg16EzvDmf7?=
 =?iso-8859-1?Q?3/xOl7jvrOLKBkRSj4lMaL89n8k1dxPmbxU+tUYYeF46X8BWhJF1T/Bd0k?=
 =?iso-8859-1?Q?tShkS/Is9WbFakQSczM5BUIDEsLLZprgTA7dzVlS0FcvfNn0jUxGXE24+g?=
 =?iso-8859-1?Q?obgWRd9CSbBxxvkCbXopoUkWLai3C7YO6ahyCNjuksPnV07OAVizjWRMRc?=
 =?iso-8859-1?Q?Jc7QeO2bD8Z5b4QnSJ/ihf29ERXMLrSDtFPjGHUcvA+S1/50NUG/aYmZ0B?=
 =?iso-8859-1?Q?hnBAwa/OZKK94jaHUUtzrWj7ev+FZedcJUZ0V2W+nPj7nZmOvUlztb2xYP?=
 =?iso-8859-1?Q?oED35Qumy4vjXyhdIAu8TRKnng9Kv9AETH17VAt6bIRQO336KCb5V04Fip?=
 =?iso-8859-1?Q?CTPwcYY/kpmEphjqFupQCeZX1oVVk0N47EhPQaDT17UZcDA6nFUUIfIfWK?=
 =?iso-8859-1?Q?V49PW0MvojNbSXphbOPJ4GZOBrSBz7OL1ZnuqYtv1g16PbqRdO01qECxWz?=
 =?iso-8859-1?Q?n+yFZE1E+OxBwa22HkW0j716m/K2u1YZKGDaEr5qcJ4QyXn/4eA2+Vmmj6?=
 =?iso-8859-1?Q?0hRoRnP/cXFT4798M/GJmB9VncmiGSraAVI4dTOMcFMTaPkNEg+kEzBhS8?=
 =?iso-8859-1?Q?KGOEzvjVn8P1RYK7vFHf/l+35PoE24o19Q3fOPnuQE3HS5YqfupnEb5HfK?=
 =?iso-8859-1?Q?ilLM6qQEgkARmHX4xDUHlJqSaIrsRlgXUPW6UxXS43LqNpnCr7+PMBhmri?=
 =?iso-8859-1?Q?BP5jiO6uDCBeNHSC5XIKClQrsah14eUQkB1+aHf15rKNDTvJDOPy9/YlYb?=
 =?iso-8859-1?Q?IiyIKd9I4QR2a7i8gfmH58aV2TXpgWX8VmyHWe9HqSbfoxLfZC8g5H6SyM?=
 =?iso-8859-1?Q?1n/zd/e7QqVDGGJZ6ziX47mhGZT4bbaESm5g/rWOGWzrxFPaI70SEi+OMc?=
 =?iso-8859-1?Q?/MjGJ85OyVvzEyYiGT6aFdxIZy9s2S6m3edDqCSh9koiRZ3MR7RUr+ku74?=
 =?iso-8859-1?Q?hO9lOy/SmNyt5aeQLCkrrLuHLWyhh6BAIV1R2SKUHwVKUoDKHeVa5YATGW?=
 =?iso-8859-1?Q?WKj2tmTqKPRUl43t65E0Zy62QQfiF7IwUaPo6ia1BVtJngoYaMevxg8gFz?=
 =?iso-8859-1?Q?Wzh3Z/tw3ptVj7DZvrrOA7Wfhd4ogzezoC4SU9VlIFmppxm5NeVhoyj1Vp?=
 =?iso-8859-1?Q?4WarO3YEwC/MvJ8T2N4ajUb8zZX1+uZfE1T3IrOqsuLgvs23AyBqqIO8VX?=
 =?iso-8859-1?Q?T6nXyEGvReKgtyM7+v+6qmYGp764Zav5oM48MCOyXIUadudmQ+6C5Ijyzu?=
 =?iso-8859-1?Q?1Zcd72I22nNgKBExMzLE56QKcXdGQ2qjk/B4rB/BMOe1vPVviKrUia5m70?=
 =?iso-8859-1?Q?Neah4GNEcye9OamShL1aJeRut43Rxkp0NrCEA0prT2tClVDLjEFwhLnA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c53a2ed-3589-4553-af3d-08dce75ba8d9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 05:40:06.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bu3OyjsdTfUHyMbdhkJH1tiZMCjXaPvPYs/qbCiO7xxHuMi1sbNyFkGfu4SDIRsqEKTmrbYC0XGSHGaoPzC5RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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

On Tue, Oct 08, 2024 at 12:33:51PM +1100, Alistair Popple wrote:
> 
> Simona Vetter <simona.vetter@ffwll.ch> writes:
> 
> > On Wed, Sep 25, 2024 at 01:44:37PM +0200, Simona Vetter wrote:
> >> On Tue, Sep 24, 2024 at 04:42:19PM +0000, Matthew Brost wrote:
> >> > On Tue, Sep 24, 2024 at 01:48:29PM +0200, Simona Vetter wrote:
> >> > > On Fri, Sep 20, 2024 at 09:59:51PM +0000, Matthew Brost wrote:
> >> > > > On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
> >> > > > > 
> >> > > > > On 2024-09-20 17:23, Matthew Brost wrote:
> >> > > > > > On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
> >> > > > > > > On 2024-09-18 11:10, Alistair Popple wrote:
> >> > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> >> > > > > > > > 
> >> > > > > > > > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> >> > > > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> >> > > > > > > > > > 
> >> > > > > > > > > > I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> >> > > > > > > > > Still a driver.
> >> > > > > > > > Indeed, and I'm happy to answer any questions about our implementation.
> >> > > > > > > > 
> >> > > > > > > > > > but theoretically it seems like it should be possible. However we
> >> > > > > > > > > > serialize migrations of the same virtual address range to avoid these
> >> > > > > > > > > > kind of issues as they can happen the other way too (ie. multiple
> >> > > > > > > > > > threads trying to migrate to GPU).
> >> > > > > > > > > > 
> >> > > > > > > > > > So I suspect what happens in UVM is that one thread wins and installs
> >> > > > > > > > > > the migration entry while the others fail to get the driver migration
> >> > > > > > > > > > lock and bail out sufficiently early in the fault path to avoid the
> >> > > > > > > > > > live-lock.
> >> > > > > > > > > > 
> >> > > > > > > > > I had to try hard to show this, doubt an actual user could trigger this.
> >> > > > > > > > > 
> >> > > > > > > > > I wrote a test which kicked 8 threads, each thread did a pthread join,
> >> > > > > > > > > and then tried to read the same page. This repeats in loop for like 512
> >> > > > > > > > > pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> >> > > > > > > > > for it to livelock. Without an exclusive lock I think on average I saw
> >> > > > > > > > > about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> >> > > > > > > > > thread won this race.
> >> > > > > > > > > 
> >> > > > > > > > >   From reading UVM, pretty sure if you tried hard enough you could trigger
> >> > > > > > > > > a livelock given it appears you take excluvise locks in migrate_to_ram.
> >> > > > > > > > Yes, I suspect you're correct here and that we just haven't tried hard
> >> > > > > > > > enough to trigger it.
> >> > > > > > > > 
> >> > > > > > > > > > > Cc: Philip Yang <Philip.Yang@amd.com>
> >> > > > > > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> >> > > > > > > > > > > Cc: Christian König <christian.koenig@amd.com>
> >> > > > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> >> > > > > > > > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> >> > > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> > > > > > > > > > > ---
> >> > > > > > > > > > >    mm/memory.c         | 13 +++++++---
> >> > > > > > > > > > >    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> >> > > > > > > > > > >    2 files changed, 50 insertions(+), 23 deletions(-)
> >> > > > > > > > > > > 
> >> > > > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> >> > > > > > > > > > > index 3c01d68065be..bbd97d16a96a 100644
> >> > > > > > > > > > > --- a/mm/memory.c
> >> > > > > > > > > > > +++ b/mm/memory.c
> >> > > > > > > > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >> > > > > > > > > > >    			 * Get a page reference while we know the page can't be
> >> > > > > > > > > > >    			 * freed.
> >> > > > > > > > > > >    			 */
> >> > > > > > > > > > > -			get_page(vmf->page);
> >> > > > > > > > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > > > > > > > > > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> > > > > > > > > > > -			put_page(vmf->page);
> >> > > > > > > > > > > +			if (trylock_page(vmf->page)) {
> >> > > > > > > > > > > +				get_page(vmf->page);
> >> > > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > > > > > > > > > This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> >> > > > > > > > > > rather than do this and then have to pass all this context
> >> > > > > > > > > > (ie. fault_page) down to the migrate_vma_* functions could we instead
> >> > > > > > > > > > just do what migrate_vma_collect_pmd() does here? Ie. we already have
> >> > > > > > > > > > the PTL and the page lock so there's no reason we couldn't just setup
> >> > > > > > > > > > the migration entry prior to calling migrate_to_ram().
> >> > > > > > > > > > 
> >> > > > > > > > > > Obviously calling migrate_vma_setup() would show the page as not
> >> > > > > > > > > > migrating, but drivers could easily just fill in the src_pfn info after
> >> > > > > > > > > > calling migrate_vma_setup().
> >> > > > > > > > > > 
> >> > > > > > > > > > This would eliminate the whole fault_page ugliness.
> >> > > > > > > > > > 
> >> > > > > > > > > This seems like it would work and agree it likely be cleaner. Let me
> >> > > > > > > > > play around with this and see what I come up with. Multi-tasking a bit
> >> > > > > > > > > so expect a bit of delay here.
> >> > > > > > > > > 
> >> > > > > > > > > Thanks for the input,
> >> > > > > > > > > Matt
> >> > > > > > > Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
> >> > > > > > > Christian and myself in the loop with future patches in this area.
> >> > > > > > > 
> >> > > > > > Will do. Already have another local patch set which helps drivers dma
> >> > > > > > map 2M pages for migrations if SRAM is physically contiguous. Seems
> >> > > > > > helpful for performance on Intel hardware. Probably post that soon for
> >> > > > > > early feedack.
> >> > > > > 
> >> > > > > OK.
> >> > > > > 
> >> > > > > 
> >> > > > > > 
> >> > > > > > Longer term I thinking 2M migration entries, 2M device pages, and being
> >> > > > > > able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
> >> > > > > > finding migrate_vma_* functions take up like 80-90% of the time in the
> >> > > > > > CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
> >> > > > > > ideal. Seems like 2M entries for everything would really help here. No
> >> > > > > > idea how feasible this is as the core MM stuff gets confusing fast. Any
> >> > > > > > input on this idea?
> >> > > > > 
> >> > > > > I agree with your observations. We found that the migrate_vma_* code was the
> >> > > > > bottle neck for migration performance as well, and not breaking 2M pages
> >> > > > > could reduce that overhead a lot. I don't have any specific ideas. I'm not
> >> > > > > familiar with the details of that code myself. Philip has looked at this
> >> > > > > (and some old NVidia patches from a few years ago) in the past but never had
> >> > > > > enough uninterrupted time to make it past prototyping.
> >> > > > > 
> >> > > > 
> >> > > > Cool good to know this isn't some crazy idea. Doubt it happen anytime
> >> > > > soon as I need to get a working baseline in before anything then start
> >> > > > applying optimizations and help in get other features to get the design
> >> > > > complete. But eventually will probably try to look at this. May ping
> >> > > > Philip and Nvidia when I have time to dig in here.
> 
> Apologies for my late reply here, I have just returned from vacation.
> 
> We (Nvidia) are actively looking at this as we have the same bottle
> necks. Mostly I've been doing some clean-ups in MM to make compound
> ZONE_DEVICE pages possible.
> 

That's good to know all of us (Intel, AMD, Nvidia) are in agreement this
is a bottleneck and needs fixing. 

> >> > > 
> >> > > I think the big step will be moving hmm.c and migrate.c apis over from
> >> > > struct page to folios. That should also give us some nice benefits on the
> >> > > gpu side, since instead of 4k pages to track we could allocate 2m gpu
> >> > > pages.
> >> > > 
> >> > 
> >> > I think was thinking just encode the order in the migration PFN like HMM
> >> > does. Really only Nth order entry in the page array needs to be
> >> > populated then - HMM populates every entry though which doesn't seem
> >> > like that is required. Maybe having a folio API makes more sense?
> >> 
> >> Both I'd say, as a first attempt at least. An array of folios, but only
> >> populate the ones we need and jump over empty entries. A bit wasteful, but
> >> eh it's just allocations.
> >
> > Ok thought some more, I think there's two things going on:
> >
> > - spot contig memory sections so that the gpu side is more efficient and
> >   can user bigger pagetables and stuff like that. this is what
> >   hmm_range_fault does.
> >
> > - optimize the core mm book-keeping by working on folios instead of
> >   individual pages. hmm_range_fault does not care because it doesn't grab
> >   references or lock pages or do anything else interesting with them, the
> >   entire synchronization is provided by mmu notifier retry loops. But the
> >   migration code does do a lot of expensive stuff, so it would need that.
> >   For hmm_range_fault it's probably not so important, so maybe we could
> >   leave the folio conversion of that to later.
> >
> > I think we need both, meaning:
> > - switch to folio, leave out entries as NULL for compound folios
> > - on top of compoung folios still track contig ranges so that the gpu side
> >   can additionally benefit when e.g. 2M pages are split into smaller
> >   folios but happen to be contig
> 
> Definitely I think the folio approach makes sense and I was prototpying
> a series to allow compound device private pages and to migrate
> them. However I got caught up on similar questions around migrate_vma_*
> API (specifically around whether to allow splitting/merging) so never
> got around to posting them. Probably the simple array based approach
> makes sense though.
> 

If / when we (Intel) have time to look at this we will reach out but
seems like you may beat us to it. Happy to pull in code to test out and
with reviews.

> In any case to get something like that merged I'd been asked if we could
> fix the ZONE_DEVICE refcounting mess for DAX (as it was the only one
> still relying on the off-by-one refcounts for compound pages). The good
> news is that series[1] is getting close to merged, and as a side-effect
> it allows for compound ZONE_DEVICE pages so extending it to
> DEVICE_PRIVATE pages to allow THP migration shouldn't be too difficult
> and was going to be my next step once this was merged. So it's nice to
> know other people might care about this too.
> 
> [1] - https://lore.kernel.org/linux-mm/cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com/
>

Let me look here.

Matt

> > Cheers, Sima
> >
> >> 
> >> > > Once we have folios at the driver/core mm api level doing all the fancy
> >> > > thp stuff should be at least a well-contained problem. But I might be
> >> > > dellusionally optimistic here :-)
> >> > 
> >> > I think it contained in the sense is the DRM SVM layer just allocates a
> >> > THP or large continous device memory and hands it off to migrate layer
> >> > and that layer does the right thing. The 'right thing' here I believe is
> >> > a decent amount of core MM work though.
> >> 
> >> Yeah that's what I meant, once we have switched the interfaces to be
> >> arrays of folios, where for larger folios we leave the entries in between
> >> NULL and have some appropriate iterators, then the driver side is done
> >> mostly.  The core mm side to actually make use of that will be fairly
> >> gnarly though.
> >> -Sima
> >> 
> >> > 
> >> > Matt
> >> > 
> >> > > -Sima
> >> > > 
> >> > > > 
> >> > > > Matt
> >> > > > 
> >> > > > > Regards,
> >> > > > >   Felix
> >> > > > > 
> >> > > > > 
> >> > > > > > 
> >> > > > > > Matt
> >> > > > > > 
> >> > > > > > > Regards,
> >> > > > > > >    Felix
> >> > > > > > > 
> >> > > > > > > 
> >> > > > > > > > > > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >> > > > > > > > > > > +				put_page(vmf->page);
> >> > > > > > > > > > > +				unlock_page(vmf->page);
> >> > > > > > > > > > > +			} else {
> >> > > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >> > > > > > > > > > > +			}
> >> > > > > > > > > > >    		} else if (is_hwpoison_entry(entry)) {
> >> > > > > > > > > > >    			ret = VM_FAULT_HWPOISON;
> >> > > > > > > > > > >    		} else if (is_pte_marker_entry(entry)) {
> >> > > > > > > > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> > > > > > > > > > > index 6d66dc1c6ffa..049893a5a179 100644
> >> > > > > > > > > > > --- a/mm/migrate_device.c
> >> > > > > > > > > > > +++ b/mm/migrate_device.c
> >> > > > > > > > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> > > > > > > > > > >    				   struct mm_walk *walk)
> >> > > > > > > > > > >    {
> >> > > > > > > > > > >    	struct migrate_vma *migrate = walk->private;
> >> > > > > > > > > > > +	struct folio *fault_folio = migrate->fault_page ?
> >> > > > > > > > > > > +		page_folio(migrate->fault_page) : NULL;
> >> > > > > > > > > > >    	struct vm_area_struct *vma = walk->vma;
> >> > > > > > > > > > >    	struct mm_struct *mm = vma->vm_mm;
> >> > > > > > > > > > >    	unsigned long addr = start, unmapped = 0;
> >> > > > > > > > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> > > > > > > > > > >    			folio_get(folio);
> >> > > > > > > > > > >    			spin_unlock(ptl);
> >> > > > > > > > > > > -			if (unlikely(!folio_trylock(folio)))
> >> > > > > > > > > > > +			if (unlikely(fault_folio != folio &&
> >> > > > > > > > > > > +				     !folio_trylock(folio)))
> >> > > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> >> > > > > > > > > > >    								walk);
> >> > > > > > > > > > >    			ret = split_folio(folio);
> >> > > > > > > > > > > -			folio_unlock(folio);
> >> > > > > > > > > > > +			if (fault_folio != folio)
> >> > > > > > > > > > > +				folio_unlock(folio);
> >> > > > > > > > > > >    			folio_put(folio);
> >> > > > > > > > > > >    			if (ret)
> >> > > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> >> > > > > > > > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> > > > > > > > > > >    		 * optimisation to avoid walking the rmap later with
> >> > > > > > > > > > >    		 * try_to_migrate().
> >> > > > > > > > > > >    		 */
> >> > > > > > > > > > > -		if (folio_trylock(folio)) {
> >> > > > > > > > > > > +		if (fault_folio == folio || folio_trylock(folio)) {
> >> > > > > > > > > > >    			bool anon_exclusive;
> >> > > > > > > > > > >    			pte_t swp_pte;
> >> > > > > > > > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> > > > > > > > > > >    				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >> > > > > > > > > > >    					set_pte_at(mm, addr, ptep, pte);
> >> > > > > > > > > > > -					folio_unlock(folio);
> >> > > > > > > > > > > +					if (fault_folio != folio)
> >> > > > > > > > > > > +						folio_unlock(folio);
> >> > > > > > > > > > >    					folio_put(folio);
> >> > > > > > > > > > >    					mpfn = 0;
> >> > > > > > > > > > >    					goto next;
> >> > > > > > > > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> > > > > > > > > > >    					  unsigned long npages,
> >> > > > > > > > > > >    					  struct page *fault_page)
> >> > > > > > > > > > >    {
> >> > > > > > > > > > > +	struct folio *fault_folio = fault_page ?
> >> > > > > > > > > > > +		page_folio(fault_page) : NULL;
> >> > > > > > > > > > >    	unsigned long i, restore = 0;
> >> > > > > > > > > > >    	bool allow_drain = true;
> >> > > > > > > > > > >    	unsigned long unmapped = 0;
> >> > > > > > > > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >> > > > > > > > > > >    		remove_migration_ptes(folio, folio, false);
> >> > > > > > > > > > >    		src_pfns[i] = 0;
> >> > > > > > > > > > > -		folio_unlock(folio);
> >> > > > > > > > > > > +		if (fault_folio != folio)
> >> > > > > > > > > > > +			folio_unlock(folio);
> >> > > > > > > > > > >    		folio_put(folio);
> >> > > > > > > > > > >    		restore--;
> >> > > > > > > > > > >    	}
> >> > > > > > > > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >> > > > > > > > > > >    		return -EINVAL;
> >> > > > > > > > > > >    	if (args->fault_page && !is_device_private_page(args->fault_page))
> >> > > > > > > > > > >    		return -EINVAL;
> >> > > > > > > > > > > +	if (args->fault_page && !PageLocked(args->fault_page))
> >> > > > > > > > > > > +		return -EINVAL;
> >> > > > > > > > > > >    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >> > > > > > > > > > >    	args->cpages = 0;
> >> > > > > > > > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >> > > > > > > > > > >    }
> >> > > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_pages);
> >> > > > > > > > > > > -/*
> >> > > > > > > > > > > - * migrate_device_finalize() - complete page migration
> >> > > > > > > > > > > - * @src_pfns: src_pfns returned from migrate_device_range()
> >> > > > > > > > > > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> > > > > > > > > > > - * @npages: number of pages in the range
> >> > > > > > > > > > > - *
> >> > > > > > > > > > > - * Completes migration of the page by removing special migration entries.
> >> > > > > > > > > > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> >> > > > > > > > > > > - * before calling this.
> >> > > > > > > > > > > - */
> >> > > > > > > > > > > -void migrate_device_finalize(unsigned long *src_pfns,
> >> > > > > > > > > > > -			unsigned long *dst_pfns, unsigned long npages)
> >> > > > > > > > > > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> >> > > > > > > > > > > +				      unsigned long *dst_pfns,
> >> > > > > > > > > > > +				      unsigned long npages,
> >> > > > > > > > > > > +				      struct page *fault_page)
> >> > > > > > > > > > >    {
> >> > > > > > > > > > > +	struct folio *fault_folio = fault_page ?
> >> > > > > > > > > > > +		page_folio(fault_page) : NULL;
> >> > > > > > > > > > >    	unsigned long i;
> >> > > > > > > > > > >    	for (i = 0; i < npages; i++) {
> >> > > > > > > > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> > > > > > > > > > >    		src = page_folio(page);
> >> > > > > > > > > > >    		dst = page_folio(newpage);
> >> > > > > > > > > > >    		remove_migration_ptes(src, dst, false);
> >> > > > > > > > > > > -		folio_unlock(src);
> >> > > > > > > > > > > +		if (fault_folio != src)
> >> > > > > > > > > > > +			folio_unlock(src);
> >> > > > > > > > > > >    		if (is_zone_device_page(page))
> >> > > > > > > > > > >    			put_page(page);
> >> > > > > > > > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >> > > > > > > > > > >    		}
> >> > > > > > > > > > >    	}
> >> > > > > > > > > > >    }
> >> > > > > > > > > > > +
> >> > > > > > > > > > > +/*
> >> > > > > > > > > > > + * migrate_device_finalize() - complete page migration
> >> > > > > > > > > > > + * @src_pfns: src_pfns returned from migrate_device_range()
> >> > > > > > > > > > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> >> > > > > > > > > > > + * @npages: number of pages in the range
> >> > > > > > > > > > > + *
> >> > > > > > > > > > > + * Completes migration of the page by removing special migration entries.
> >> > > > > > > > > > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> >> > > > > > > > > > > + * before calling this.
> >> > > > > > > > > > > + */
> >> > > > > > > > > > > +void migrate_device_finalize(unsigned long *src_pfns,
> >> > > > > > > > > > > +			unsigned long *dst_pfns, unsigned long npages)
> >> > > > > > > > > > > +{
> >> > > > > > > > > > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> >> > > > > > > > > > > +}
> >> > > > > > > > > > >    EXPORT_SYMBOL(migrate_device_finalize);
> >> > > > > > > > > > >    /**
> >> > > > > > > > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >> > > > > > > > > > >     */
> >> > > > > > > > > > >    void migrate_vma_finalize(struct migrate_vma *migrate)
> >> > > > > > > > > > >    {
> >> > > > > > > > > > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> >> > > > > > > > > > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> >> > > > > > > > > > > +				  migrate->fault_page);
> >> > > > > > > > > > >    }
> >> > > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_finalize);
> >> > > 
> >> > > -- 
> >> > > Simona Vetter
> >> > > Software Engineer, Intel Corporation
> >> > > http://blog.ffwll.ch
> >> 
> >> -- 
> >> Simona Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> 
