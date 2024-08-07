Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6A94A6F4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 13:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD5B10E4C3;
	Wed,  7 Aug 2024 11:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbn6Dm+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0A10E4C3;
 Wed,  7 Aug 2024 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723029967; x=1754565967;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xPAnNZViRMQ5TZ0qGuNjO0Z8NyokCUVNpFP8qz4f2Tk=;
 b=lbn6Dm+QVLiY14NxTXZverWtoX2ZUSplypcFJAslQDSBHBWvA+8JpetT
 6U/6hmoGnShsCiSHSL2sH00oum2npdoADV8ZlIIhLdkI8Xn7aFafZXik8
 GOsm/SaPdHjcdfTZm3laEc7gCia3jGUPwIdK3c8Mcnhd9AIl2PyIqYqI3
 O5txXBJ3U9zR8azVnmLr183Y3AK5ymbT16Tt6BfrtL+SKn1bsmhoc62+7
 1P1v+WwKAr0gPfj5jEmb4XS9gWcuv2UHN6MJcZlilB3r3TXA07sydWdC6
 +ATz4xGi7I114LPiePfTT2O5VARi39ZuqyGIwRo6wSNS3LkIzsVg4LZol Q==;
X-CSE-ConnectionGUID: MD7UGALdQ9yG/1G0/ijZ5w==
X-CSE-MsgGUID: IW4mCgbRTd2k8NlAZndFzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20673492"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20673492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 04:26:06 -0700
X-CSE-ConnectionGUID: LWupY3cBSb+wYh9iDv/c/g==
X-CSE-MsgGUID: BmtQ2JbeS6a7EmNYv4mSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="56769821"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 04:26:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 04:26:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 04:26:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 04:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c80Zp0rNZWUfKwswX8xZGzZp6BoNXYJxUNKowAN9hPA31Mqg/PX8HZ3z3Yl5DEnN/T8qmw4uLHnz3baTCx4YF+8DEu3aLcmcWP7zHjyXBG3x8lY3w2YBUGOUNsiVBvZKFX3stJnJW11XOLLFPQMVNQ8o4+/862X+pFDN7V83nP7cG/CvFeUP0rkibqurD9y0nEuHvaA8eUPlWxoY9GcuJb21+HgGWMhxVDFCRVaG2q+AsIpn1UGdAN4nXXt+ZJY7G3O2oPqFU3LTzQtJzs7eDhS2Fl4n/tKiX60x3F7RaGSyVH3Ii+C+fdxF5BnRrH90MwwaJyy1RxspOOkBk1cVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSrJW/wKyg8D3uN8knQJB4L0kO0vNRxAwk6IXTAyTvI=;
 b=Ck+jcuFmeSCG7mC8hX7suZlPG9PIBL2Ou/fQbio2XTWl99Fq/i36siQGudBojFZB6C6GoW78QE/FFs9vAkMhjeP4R1GV0uYlX6kTNDJccQqgTCRFFO4FMCXGOwNSKGTbGReW37MEnsmQQ1OIvERyPbGBHrkRfNhubYFx51K5L258Q2ZRWBudIpVn2AyMYhXazpvkIJC0+6WDFnDSBA+WfCyErUCskJJlvgpPBc+IPxYxwvocmEoQ+vwmLkWNLMYzbi0vjl6utNr2LIAdhv9pt8HW4jjlKEIsbQHxwkrQND5XGCnvQWm6ojz9BsYS6POVH5yo4yaI1gtXdZLs3b21vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 11:26:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 11:26:01 +0000
Date: Wed, 7 Aug 2024 06:25:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, William Hubbs <w.d.hubbs@gmail.com>, "Chris
 Brannon" <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
 <gost.dev@samsung.com>
Subject: Re: [PATCH 04/12] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Message-ID: <qdirhnr5fhey4zyraeymvyy3zkglg33fgjiigmsn34nwcuoir4@bxcnqgolwakw>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-4-4cd1ded85694@samsung.com>
 <CGME20240807015044eucas1p1998fac358d6afafce6c58478c2834d26@eucas1p1.samsung.com>
 <67ahzgfa63gs7ybbunthdiwodlaihzqerb5xmkrgfgrbmghjmw@d57hhuwaf53i>
 <mhrznemgfocotpgkyze7l73e6237wygja6lrvmodeka6ehbkgc@h6fzyrcsmci2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <mhrznemgfocotpgkyze7l73e6237wygja6lrvmodeka6ehbkgc@h6fzyrcsmci2>
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: e905c79e-4023-4e26-884e-08dcb6d3b783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8XzpQQ+/L9ZseZtjcpx1quqWC87ge6mQCjcfzW+UESuVfX026cq5PdCiqVuz?=
 =?us-ascii?Q?83oWgrGgoc8bjmBjVpYdyQydgncYfU1dHFxcl/CLkmXCQ9JjfLjV2Sq8X2NR?=
 =?us-ascii?Q?WpEBzBEzeNBr6CAuyA1OTCSM7V/D7w9koDAlMAjejTLPi9NnoqIBcglUkErB?=
 =?us-ascii?Q?+h9QARJUhDVYyzlqeu3qDnPXN0ajBK2EcdDZY/rUwd9V3UldrSZ68/Bjpjx/?=
 =?us-ascii?Q?WhKo/i+681MlOx4XUxVUwEYltWLnjzj2EJJinR+hIDIE7iyb85inOh4xbLUi?=
 =?us-ascii?Q?o8ddVPal3VDunf3srUDiDPCevRpPOQt7bvEqY0lFfAElJ1cmB/tlifYsNxWf?=
 =?us-ascii?Q?z4RxA03ZVi3nRprsAt/QTGO2tq4NUBq60wCT0BdUMnTS4TOjFQAkT9rqwryz?=
 =?us-ascii?Q?20ScoYOfmgTaW+MioGcy0cI8aYw4H97cMPkWGkXoKK1q7+0MdduOTN0vfPdW?=
 =?us-ascii?Q?/xEKTbPR1BuzrQXstSHrv4KPBT8wq+a5A6xz3HcWHQx7fPID11XURQsebBQQ?=
 =?us-ascii?Q?ZpNNzhZ8uAtp51w7GZ5YZHa0hrCSUWl1Rjnsvn4+vTdrY4m3epqM3xcorrTG?=
 =?us-ascii?Q?gbDYV5+eP2CiKf6xI4ojHq/pbt1IRQnPA7tDMlAhT3TNdO7v7mekEUy+fV7D?=
 =?us-ascii?Q?pRpuRTvjFWzQ0JHnBbTtDTIK5ZO0tHuMKHD6wPksp7OfxPh9sD0uN2xB43Cm?=
 =?us-ascii?Q?GXxEciMivKav3HmXF6dOwSYkD5GXrsizjJrQmvcVTLAAXNsmdRyszTsdPkdA?=
 =?us-ascii?Q?3DoM2ZwX0pcqhIUuwSpecc43NHvJeEpNs1EwisrlXwjOsY5HdXP+oCVoVIL3?=
 =?us-ascii?Q?HFfPHASA5DaLP+lZVhueO560X/U+YNNJiE56kXdgNaN5/YzJ9vH2ZKxUUdGo?=
 =?us-ascii?Q?og26ldZpPixyhHIZppCN/NntpmNK+THKFtmSMb4pUmm5/+PljNFvSHY4AAKU?=
 =?us-ascii?Q?fuqBwMnU7bzCj5fCcB/l8qAnergj9kYVKd0HqzjVxe2RNaiMM9EBMCAqf8Xg?=
 =?us-ascii?Q?OrtU6VVniP2ilCfLyveY+kQxtmt3nqTeABn1XnW3EFlPOwagW8wy3HUTT9wG?=
 =?us-ascii?Q?PMrPv1wBSNSlbDoOwNe22hcby9JeEQM7tIhdDY11Bwn50sQIxscnAl7ETr9r?=
 =?us-ascii?Q?2bI7mUpwIm+jU5j9FAnpNCcSPdqsalFp/5OiArZ+iR3aKcYaAm8dXFCfRL0n?=
 =?us-ascii?Q?8Tdk+bBakxN2pWSUvyr6PC8YXqjHRCJFOilaakpHtwJPUxktGLxUOFK8nwpM?=
 =?us-ascii?Q?JNu3lSABH5n70wyTqvNwAMhcK/dS+UuWqaSkUqdAJEvFXkLNWKqY+geGc6CD?=
 =?us-ascii?Q?Cjwlk4coTOiTlDRa2882jJdUXk4LQYZZ/T8DjXgTmDa9Tr9NB0YQ+5I8Kblu?=
 =?us-ascii?Q?F78dCXMHxgeA47uK3FAUyOPwdrlkpPy2C8rUrjQ5yosMjaRy9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KoWGkOzpF0YMP6shCOhxGJi9FVOkoxteRkFIJHN00wQKqf9w6JAhdta+A2F8?=
 =?us-ascii?Q?9GsvlkXzYFV1dm44M9C/Ln/mb9fEjvWs256YTXy/Vcl59coM6vkoNTDnVnIQ?=
 =?us-ascii?Q?ZLHQ/62gTG4VjZW8kkgHUa1HjSx6mxV/X1Kw+niYKV82fYrqMDQcT/QXlCVB?=
 =?us-ascii?Q?422SPaAhKsw4/M6g1l1qEnc/nTsrD0MxLjWhiJ3LjWzOOU2UmE8Yivs+5+xx?=
 =?us-ascii?Q?5/Hp9ki/8ML4mcMeB5pVXvmuTrDy/6ls0bIB9gz71PSw2GDVz0mHJ+Q1RVEh?=
 =?us-ascii?Q?UacvShQdsz4j8td7ADbx9ucYOE+2QixoPUJbiI1D0n5/soRCQ7lpPTYh002/?=
 =?us-ascii?Q?hgnI/rV/4zODzpRkTb8JOHUnrEEft2NW27C5RMuslp7ObclNoNYgtwps4upu?=
 =?us-ascii?Q?53+a3hdLLpzx/gaU2Lwaq+9A/K7VLlCEVEKqZ82aflSNv4BfmbV6qgThkCfp?=
 =?us-ascii?Q?CK0utOITlj47KkrLO19pxUwXSxynWj6coE++QAk14DOvmSFbxm/o7orrvPK5?=
 =?us-ascii?Q?A6Jm7mj9EkMvTpjNUBxgpnfD3KZo0ozjyMJYPHjRFe+vp1HHYt3UoSAS6970?=
 =?us-ascii?Q?ucpZJ2DOTq9UWH5iAhGff/MhoEjkpluDIUX6aUOCiJAX5zixi/KMdOBaapqK?=
 =?us-ascii?Q?3+rVdCOes3tOx1jKnEYg+edFRctP+jmKakCb3fg6N62GiGB8PWlrsTwpunkC?=
 =?us-ascii?Q?OMbABD8VSFMCRQZmhE0e4KAtEoCuF8sb6kWGPEYOSAvQVEWV/Hd0AvT8Ady7?=
 =?us-ascii?Q?87pC6R7yTMYbP/bARrLy/6bRK+mCS447lU6MjKRfzUSdJQ76zV0brdvFb97P?=
 =?us-ascii?Q?0yAIKa9idBBCjb+q2PxJPiTCIazUtBJ2fOAhpTAVRbMfeWP4m8KgSaVdr0mF?=
 =?us-ascii?Q?eArWlqxwG92007Qm9bcVfWwdPOxr/cWD0RedU7pBTeK42ainA7G0D9B5GbwW?=
 =?us-ascii?Q?Jw/H7k74gibyi/Dcm7SMw24n4tOqw5vo19TfXfw0+K+I55KeZszk0tNhDLjm?=
 =?us-ascii?Q?GVYchn5HQOdZ5FClVFuJ0w2OblzleoN5BRQ4albEV0FbLPdf4ppcYj3fhbmh?=
 =?us-ascii?Q?Dy5om313kTrGVZKlEqIRIDsMjEmwxkY5udbEB7BUM4acLS3HByeZjdVNzi+X?=
 =?us-ascii?Q?0U0Peo09F9igDW0pZ6sqxuUmp1gVjk1KgiHHyyWiacFi7pE+933f8tTpba6W?=
 =?us-ascii?Q?JdQcJaGUwCkHWRYmcAHsHbeyqraN4wa+y5m8UT4Z64C0QlEf3ApbtJmsGVB9?=
 =?us-ascii?Q?Xzw6Y0s6roh73Y7csA8kTvYxmgciVtWWFY9mkamghN35cwYi9B1yUY05xsk2?=
 =?us-ascii?Q?h0l1BIykwNXb7Y7QaVV/yINk9sS3WAcUKSsluHIZE5FzWLmZSs5kM8rlbtNR?=
 =?us-ascii?Q?Bk4fcFDNTd8FMgnvE89JeRSWa+0pPP4Rj3FKDAn6N54iDwnYS0wXOb3V212M?=
 =?us-ascii?Q?6hmk24A34N5VaJZiDIIExwVFLqahsSHAHUrlIdopmPzDOPBNrEAU9fQU1M2j?=
 =?us-ascii?Q?SE8x8/+i87yxwbiz1K9dwZfitR1gFgR1xYMJ3EK/sMSGqLST74dycU6x4z8+?=
 =?us-ascii?Q?z98i7W8t9aZhN4YY4zdnhHpOKZG3nTF7+YjmGFvfrsrWl12IS367VpmekjIW?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e905c79e-4023-4e26-884e-08dcb6d3b783
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 11:26:01.5460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbOEwf7b7/LCHVszQ4RKzaE5QnhCIScLQPfGetqeljuNyZJBp216ZpjvYlCmqiXtkVOXaPKY7WkLtwTSPP4zoVCAEOSe/gCDm917liQGB4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
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

On Wed, Aug 07, 2024 at 08:13:51AM GMT, Daniel Gomez wrote:
>On Tue, Aug 06, 2024 at 08:50:09PM GMT, Lucas De Marchi wrote:
>> On Wed, Aug 07, 2024 at 01:09:18AM GMT, Daniel Gomez via B4 Relay wrote:
>> > From: Daniel Gomez <da.gomez@samsung.com>
>> >
>> > Use getprogname() [1] instead of program_invocation_short_name() [2]
>> > for macOS hosts.
>> >
>> > [1]:
>> > https://www.gnu.org/software/gnulib/manual/html_node/
>> > program_005finvocation_005fshort_005fname.html
>> >
>> > [2]:
>> > https://developer.apple.com/library/archive/documentation/System/
>> > Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html
>> >
>> > Fixes build error for macOS hosts:
>> >
>> > drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
>> > undeclared identifier 'program_invocation_short_name'    34 |
>> > program_invocation_short_name);       |                 ^ 1 error
>> > generated.
>> >
>> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gen_wa_oob.c | 8 +++++++-
>> > 1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > index 904cf47925aa..079b8870c461 100644
>> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > @@ -9,6 +9,12 @@
>> > #include <stdbool.h>
>> > #include <stdio.h>
>> > #include <string.h>
>> > +#define PROG_INV_NAME program_invocation_short_name
>> > +
>> > +#ifdef __APPLE__
>> > +#include <stdlib.h>
>> > +#define PROG_INV_NAME getprogname()
>> > +#endif
>> >
>> > #define HEADER \
>> > 	"// SPDX-License-Identifier: MIT\n" \
>> > @@ -31,7 +37,7 @@
>> > static void print_usage(FILE *f)
>> > {
>> > 	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>> > -		program_invocation_short_name);
>> > +		PROG_INV_NAME);
>>
>> instead of doing that, can we a) include stdlib.h unconditionally and b)
>> add here a
>> `static const char *program_invocation_short_name = getprogname()` so we
>> don't need to change the common case and just handle the "build on
>> macos" as a compat layer?
>
>Does this align with your suggestion (v1 diff)?

yes, just a nit that in xe we keep the includes sorted alphabetically,
so the stdlib.h include should move up one line. Other than that,

// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

... assuming the rest of the series and idea about building the kernel
on macOS is not pushed back.

Lucas De Marchi


>
>Note that static cannot be use here.
>
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index 079b8870c461..b3add20ccb01 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -9,12 +9,7 @@
> #include <stdbool.h>
> #include <stdio.h>
> #include <string.h>
>-#define PROG_INV_NAME program_invocation_short_name
>-
>-#ifdef __APPLE__
> #include <stdlib.h>
>-#define PROG_INV_NAME getprogname()
>-#endif
>
> #define HEADER \
>        "// SPDX-License-Identifier: MIT\n" \
>@@ -36,8 +31,11 @@
>
> static void print_usage(FILE *f)
> {
>+#ifdef __APPLE__
>+       const char *program_invocation_short_name = getprogname();
>+#endif
>        fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>-               PROG_INV_NAME);
>+               program_invocation_short_name);
> }
>
> static void print_parse_error(const char *err_msg, const char *line,
>
>>
>> Lucas De Marchi
>>
>> > }
>> >
>> > static void print_parse_error(const char *err_msg, const char *line,
>> >
>> > --
>> > Git-146)
>> >
>> >
