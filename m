Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48713BD604D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1110E14C;
	Mon, 13 Oct 2025 19:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp9lEtYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D04D10E078;
 Mon, 13 Oct 2025 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385555; x=1791921555;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CBvOjAkDryKJDGqPNVNu3z5MH3RGflpGTBNvXhhlRiI=;
 b=lp9lEtYBZnYTwFGe44e9t9LusKnKBH/M22KyMIgE96gBuciPjWu/cHGA
 DOOTlrS8naVZoZhA5bKNIDEWRcUjTugMm/vp6DjnzgrT8geVyOOEv/MiV
 h2ch6M49L2Q3/wbvw8pXUNIz5GYHTr3OPgsBtQBh+zZDZ7VvylukQBiyd
 Eba+Qm3BEDL5gTxWLwOmRQ2yUDGp434xLgvG1mYwAD2B4tqhyJRdxs4Dc
 2EMfVVmapWWJDKVcfCrWc9KhG7+rJJluRZw0TLdEBqOE0MBEswaJ2g1OO
 mGuhEGSF93Irz1PkC61hK/OMpmoAA60TBKcFJlHHBNCZ7awYOpF59GqJs Q==;
X-CSE-ConnectionGUID: eD7PZwAHRgaZV81e2FY8HQ==
X-CSE-MsgGUID: QD0HzqXNTEawSC4VZH3vgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="87996130"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="87996130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:59:15 -0700
X-CSE-ConnectionGUID: WWCOkOORQzS712uQz+qHPw==
X-CSE-MsgGUID: a8/AuhqPSiGkj6zpxlUmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="182461133"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:59:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:59:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 12:59:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVpBbltat0o+RzMAn0qcrFVubi2MJ2a/NI7XPHt5Q+OF5/USM8qGZIzAvTVtdJtNenYutCNazMPPhVJQGq/A+T//9Qm32SuqFY8+FbutJNl4YVt81rPU55f98wQk5DnGzzb4gf2MP/Q/SxgNWWyRhdsFdtL+t2RiynnzMR8mWstKuq/eH+YRTtAeyv9JbiVL4zav/bN2aPatMHbiAt+p0yQ2UOcS0CmwTtvYBbo97lLqLmiiaoGb0V1wvzx/Vj4J0cDw0wDUhrsPsfKsD2NFvHYArxyleeLhHiJaS29aEezbYY6vDHYe0G8Du7wqJAFWUgZGX5+81zNPwUgXrogyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCHqXsz6dxrD8rlfhBBZ4oUqvJYb/mB7F1Zh7K7DzRU=;
 b=sb4VNIajPkEtjXOVT/vw/VT8dQMwTTDTkM6Q5urL7bx0ktT43yYitshfRN568QTftL6P5kcRA21klSAEq546YVFgDRGDCosNVIoGgAAUU8EjZI0cD20BDP1+08Ng+93J48WeHhVuROqMPgWQ8wgnwCXQWwQfB9Rmu2h9NZpiFZh11ykht+EGG9hSbDmWRZi5NLtq/zAl7mZeqEHPpfefGhlvO7EsBMtnRlEalenz7P/vMYRMYoR15tpT+ongKHLXEtP5G5t88yF0OulNn+wvWI0b1GOiCo4bSqjaSXGd/hYHGBQuYNGNPFDhHOuU2OJYpo+J+JrPKhE2/GIMh+FMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:59:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:59:10 +0000
Date: Mon, 13 Oct 2025 15:59:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: xe_guc_pc.c: fix DOC underlines
Message-ID: <aO1aCNMPKTNZta4V@intel.com>
References: <20251013182827.733781-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013182827.733781-1-rdunlap@infradead.org>
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 380e724d-709f-4ba1-0d0e-08de0a92f9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZqL2i+fHnVTT9k1CBW65qs9YX3JXl/EEprvx5z9a6OgMSIwknKLg3uBIaZ?=
 =?iso-8859-1?Q?vLFmeyHi6yS/5DfyBymCKTen5mEGNp+acw3Ik+bndSndRq6/WNKP9JdiE8?=
 =?iso-8859-1?Q?fOYrWyYp+4vf1Te5HD61yeMSZUXXT16JvAtLgBBubAD0bqQxGS276sQFkG?=
 =?iso-8859-1?Q?ZH0chfTGpbA3cnCRo68pHY+4ZYKpc2lLOJjhQh1Dn+2AC7Yiy5bQTpDbWW?=
 =?iso-8859-1?Q?hgbCvQj9Qf/To8CbLKvKjsPmvc/niOcGM7mfHBxL5D+jyf0DGAxTBJ56SC?=
 =?iso-8859-1?Q?CIdKB/pB5Zc56gvBciizkSbkzKBn6Sokc/ykAqX8TID0zZG90wW7Uoa2ll?=
 =?iso-8859-1?Q?qWLB9gJ8N0PC9tcjCst04SbnZB6sev4dO+qaY+RHBovtFrQckSaLR4jRCn?=
 =?iso-8859-1?Q?v5dxHfRfX47tR+8UyB6RiTv+EuVaBJrblj4cFNOTryWowocjbYNBZjoJiR?=
 =?iso-8859-1?Q?QFhM3Zg+mRRFV7AW2TnSj1JUmt6Cc3UJbuvytYfJNibiuxEZ/xiGm+WoVY?=
 =?iso-8859-1?Q?b/OMJ5Svm0VcpT0nRYLLPQ9YbhfO8qCY6Xc7M1a68CIWKZttIMoZZTy0u/?=
 =?iso-8859-1?Q?f790dcH2lDOBXwtK3ldvFx4esARsBqG4FTZxFtXE/OgWsUjkMEdqYxQUTc?=
 =?iso-8859-1?Q?hZVPjX10CGyHACJJPs6WirXttA00kBJylBSkTiYHgV+8HkxJN3IjXt1OJy?=
 =?iso-8859-1?Q?2/NLeec8zGb4EjfJfHNzvWNLddguRvaNEqE6mFsoD4x553aGhkHkMaWB+B?=
 =?iso-8859-1?Q?WkZTq/c4iFPSQOcfUT/CODplLlVk7a9TyS6/Z3iesy31ivJDrjSfeXPVHa?=
 =?iso-8859-1?Q?uwm/KFxg4zPv8GHq0mb6TwqYBECLi5l7QFcOSUBuofV/Tcnu/KWZPWJAhE?=
 =?iso-8859-1?Q?iGNrqsVB85wIdpgppE+1QknFb7hxGTcBEgV6fh22DdLtvlo9tZ95Adxa+u?=
 =?iso-8859-1?Q?tb7l0HE2qCoOEIfFMlhW8j+u9PX27VTzyPT7yh3Kw0TyP4HKlztmQ7+Van?=
 =?iso-8859-1?Q?3PxBMSIXAbu5y7Kin3X6wfgF26IZdLzpiwZnp6rliHrMrmxNhzAQoPHPpe?=
 =?iso-8859-1?Q?KUhEDpIXaV1odfE8bhAerYETgaFjACq6/a8sXixl9mBIpraTQ2Y/XgOJrB?=
 =?iso-8859-1?Q?lZ9+PzzcSUHUdJiyhgl71mfhDkbQItV/tKo7/xZ/nUZI9Hs4yApd1g6NsW?=
 =?iso-8859-1?Q?b2rClicMfGykV7Ifoe/wcZZbGEjun+HL1eGF7WYbxYQHUxvCMW42HGbN3C?=
 =?iso-8859-1?Q?pAYvzLG5GXRhyuQn21p1bvhTmgnNlmkjitw097qTS9XnGZfwk22RinAuzd?=
 =?iso-8859-1?Q?AoRMCcs9tq2GFbGDSS3XVWVjC4tzRrgQH30Fugv4XEEi1YYTsVX/PKIBiP?=
 =?iso-8859-1?Q?PLcg0R7r8aTjnZZq93qdgMbuZUSjnOWfepqpNwIOPpz60fdIhX4XQL9ySO?=
 =?iso-8859-1?Q?JXWG/9FDDSnIfkvMLkvu02y4GprJ80iu9ZwGrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MBrVLwOmnb4Gh0oPMQTudGx+TY/pHeu3e9IHu/l40fyetDcUO3jPJIN0Wh?=
 =?iso-8859-1?Q?AmQwsg3MYFb4YqTAA8/RsNmu8mOI3DOU0ujXa8VrBTCHRVFIv1YMcbVH80?=
 =?iso-8859-1?Q?oaUjWgJv1i4VmFYW7rYzq32LG9cGRCkPX3ICTtYN/AOgJPR5i8yqYtcjaP?=
 =?iso-8859-1?Q?psBkOiSVg4FWQNRBwkl808ZYjOrfuxpD/cb/BiXGYYg+oAZ7c8liuhWOCD?=
 =?iso-8859-1?Q?EIlM0UV7Ypd2o2fSU0dm4qIeIuF20QRHG6tbOS74EoIZ8FHUpzxkQ86vL0?=
 =?iso-8859-1?Q?xFdulXHDT9uuklk39gx6rE2RCasPgVFkx6GFbK5QLNcYRs2BLwK9IL8PPf?=
 =?iso-8859-1?Q?+rMyoiuCXKZZn8RN4Z0zxmzGXACkSCvebcgh2jntirLx3tQwKRE1/Yusil?=
 =?iso-8859-1?Q?TLQEpmYUOZjhBwHK8YshYrSGWTngQXEfcCG774tWRvRGtUlEUccD3VVrCn?=
 =?iso-8859-1?Q?HYHYw3BUO4iN7kKc42yPDN4COyX/rhBePJ+4WbeMGh78/8WeWPEtyRKj/r?=
 =?iso-8859-1?Q?kBEYH8N5ptyekEZQBp+r1SU+92ESSzN70Ac6Apsa6Exxc5BqlnspOQYy80?=
 =?iso-8859-1?Q?TvimbYiD0qjordjXyRYm7bhOfQiMwQBMF6jOZhDJpzQPMKIRT4NwfhAwkB?=
 =?iso-8859-1?Q?FnGd4neZLazpMnw9fw1AmVXSUzwSU2SnEjPzwSLn+n3aTWTrh4UvBrs3gm?=
 =?iso-8859-1?Q?I1C9rCfhtdD37GQlvwPTN+ZGsjnbyHenpqIW1BQivnViWsC6bE1UFYivw9?=
 =?iso-8859-1?Q?oup7/ZCQT/L1p/Z1WIHS36NN54e8GRB/2j5gnAc8BgjAD5SFI0GWPa7Nom?=
 =?iso-8859-1?Q?RAO+OeGlJ5gtQTHgTm6KauCgM4HwtBb2XlGT0Jlh9vrTvdDS60fA+jEIXD?=
 =?iso-8859-1?Q?zrun85q6qOpdZh5oxAPf/15HqNIQL0enFg2tOL0fFxxa5irntwlO1YyZb8?=
 =?iso-8859-1?Q?t0jZ0zA+/FjX43gNvoZaApPZEwysDb8tc5+rp/hdGXFZW1xyW1C9SLlaPq?=
 =?iso-8859-1?Q?AXzesiz8CDDuyBrJDlfRCHkPfAhngs7q9pqDqdpd7IcRSGgN5JWN9hOpQf?=
 =?iso-8859-1?Q?47UQdYElQ18FYYh+2+R5+1ByQa1c6H6Z3/648943ZxBlpb7W42FEh5P2UI?=
 =?iso-8859-1?Q?4IIv6cKlua0DM+SrG9QHBX/wGe/DUWEOQqCGLh4qmlJieX15EcIGfzITBN?=
 =?iso-8859-1?Q?SpGK2uwOLahiDu/oZuidmsqKaLR710395J48ip4GKscH4wSiluycoAvi0Q?=
 =?iso-8859-1?Q?Gk1HSGYPczHXS3r+txn4C7zE2lnWVZ+Pm+DeqTpGznStcbhiSxIaOGRFmC?=
 =?iso-8859-1?Q?GD4oVEBDd/b86nnT/VaqJ6mI3HpjjjuCmwy89Ln/uenY28nOdq4CISTxyJ?=
 =?iso-8859-1?Q?7qwB61t/OE/x21Ln0oxQ3Pbt2TPQM7A5XV4CjTpbqDRJ1kRG/s4mOBtbIp?=
 =?iso-8859-1?Q?pXb7O4II5jYXFNmbws8H/7MacFDNhPHfpGjHfomiFum/Fza9dyLgtmM360?=
 =?iso-8859-1?Q?HJrXMzhf9GlGjd7mX6kOjb9RXtiHBWWg76dhP1Xf5P1aUGVh3ERVLGyUcJ?=
 =?iso-8859-1?Q?ZCe0Gx8M3EeEfscrEGThkGbAM7QE0W5TOg2+E6KFszXWpX7TmCz8C8QPI1?=
 =?iso-8859-1?Q?0ZYQMDJoEiexJXR+fHiUnq2pw/VntnRuIxChs8BERd/pJjCnunkutWeQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 380e724d-709f-4ba1-0d0e-08de0a92f9c0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:59:10.6844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOqm/FyiPb5wLNeel1c6kJjG3UV8by4MwTCgGzy+VxWsWbnJnFwXO4hgZX6Kt0wEj+06gL+QS056MP0W4BpJdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

On Mon, Oct 13, 2025 at 11:28:26AM -0700, Randy Dunlap wrote:
> Apparently a recent change in docutils has made checking of section
> heading levels (underline style) be more careful.
> 
> There are 2 heading underline style errors reported here. Repair them by
> changing the underline style from Chapter (using '=') to Section (using
> '-') since they are used within a Chapter already (in xe_firmware.rst).
> 
> """
> Documentation/gpu/xe/xe_firmware.rst:31: drivers/gpu/drm/xe/xe_guc_pc.c:75: ERROR: A level 2 section cannot be used here.
> 
> Frequency management:
> =====================
> 
> Established title styles: =/= =
> 
> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
> (up to Docutils 0.21, these sections were silently dropped). [docutils]
> Documentation/gpu/xe/xe_firmware:31: ../drivers/gpu/drm/xe/xe_guc_pc.c:86: ERROR: A level 2 section cannot be used here.
> 
> Render-C States:
> ================
> 
> Established title styles: =/= =
> 
> The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
> One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
> (up to Docutils 0.21, these sections were silently dropped). [docutils]

Nothing against this change, but I'd like to understand more on what has
actually changed. I have docutils 0.21.2 here and I cannot see this error.

Perhaps it was a temporary bug in docutils 0.21.0 or 0.21.1 ?

rdvivi@rdvivi-mobl1:~/linux/drm-tip$ touch drivers/gpu/drm/xe/xe_guc_pc.c
rdvivi@rdvivi-mobl1:~/linux/drm-tip$ touch Documentation/gpu/xe/xe_firmware.rst 

rdvivi@rdvivi-mobl1:~/linux/drm-tip$ git status
On branch drm-tip
Your branch is up to date with 'tip/drm-tip'.

You are in the middle of an am session.
  (fix conflicts and then run "git am --continue")
  (use "git am --skip" to skip this patch)
  (use "git am --abort" to restore the original branch)

nothing to commit, working tree clean

rdvivi@rdvivi-mobl1:~/linux/drm-tip$ make htmldocs
Python version: 3.13.8
Docutils version: 0.21.2
Using alabaster theme
Using Python kernel-doc
rdvivi@rdvivi-mobl1:~/linux/drm-tip$ rm -rf Documentation/output/gpu
rdvivi@rdvivi-mobl1:~/linux/drm-tip$ make htmldocs

then I only see those ugly but expected hwmon warnings, and none of the
issues described here.

> """
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Sorry for the resend. I didn't have .gitconfig present so parts of
> this didn't work as intended.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-next-20251010.orig/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ linux-next-20251010/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -74,8 +74,8 @@
>   * connected power conservation features in the GuC firmware. The firmware
>   * exposes a programming interface to the host for the control of SLPC.
>   *
> - * Frequency management:
> - * =====================
> + * Frequency management
> + * --------------------
>   *
>   * Xe driver enables SLPC with all of its defaults features and frequency
>   * selection, which varies per platform.
> @@ -85,8 +85,8 @@
>   * thus saving power. Base profile is default and ensures balanced performance
>   * for any workload.
>   *
> - * Render-C States:
> - * ================
> + * Render-C States
> + * ---------------
>   *
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
