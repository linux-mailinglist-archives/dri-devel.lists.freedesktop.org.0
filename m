Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC9CCD8AD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C610EB51;
	Thu, 18 Dec 2025 20:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVAOPwRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0110EB4F;
 Thu, 18 Dec 2025 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766090177; x=1797626177;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uyDEsd70cGNPjB7JdjrbzQ9YRVBgzulKbVdEcnPztSY=;
 b=PVAOPwRCI9Rap7W8leMUwr8ibqdM/SbB6gJeJO9n3stTIGyLVvENtLS2
 UT0YDlvXfW7aHWHc4dYW28TFecCSTDymmH1xZ6T45TOp35uubtNDMrlkS
 AAtIQQ7zD3w2CbILZ6XaXS6CIlgUDKuDPFKi0r45UmsgtGx27mI4ZGgT9
 KSD4Jh5jN+T+JlJ++0nlXEfWR1JhF+vQGi9RpO8gbeUbVwGkPDWZQg3C7
 URmt9juoFq3mZaYyZpF+ws/SxIaZ8gSsAVBvae7bF8YNK9cIMXmZByIhP
 tkxcQwKmosdxykK5/uHQgJBM0HaZvSTnZzzdxCl0z8OVsApNMtsblv/GC A==;
X-CSE-ConnectionGUID: KObDQ5ylQX+wIXJocVAloA==
X-CSE-MsgGUID: 67SSnnU5ToeLTOUOxQ8uxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68128859"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68128859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:36:16 -0800
X-CSE-ConnectionGUID: wh7lpsWvQnyT6VttIsTuWg==
X-CSE-MsgGUID: NDDXk84cRsiDmZVL2bLCQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="202861319"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:36:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:36:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 12:36:14 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:36:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb6QIxNHHO+mu5UocOI6RrS3q3VN1qDx3zula3n3HfBSjIlsM6sJ3fSLFCwghe2PtjC813oOSGy9tVJ1QQYmeus2iM9PkAmUKbiTere+0BeApbhC6qM1xh9Tq6O+a41oIUSbNMKyeUEXCbi0p7TUZi/T/a5ww0vQhLLPtLndS4acDnnOSh2i55ddRDRrZMQ6WNNQlPrIjt4Q9i2eqMrhw6ztOGQ7O09yoEpAJ8Lk3Poh41dJDEtWffb0zGlXxyOee1KT1ECurQTJafWdaCQJujE+5UlQdhXNe5hWzp16Hwe7KtZG516zKBukawNfnZus1vMd5o+da4WCvl0i1IdsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwzOoSwKvE+mQIqHIKGBI8yp5Rar2zUHLjoK9Fi5r1E=;
 b=ZA7oRZMoPy5/7SpLAE4XznY9Vm6hwithVsHcWes+z7PBm6rdfOm9RHmoUfsVzygrJZ4A2O68XdfkeJ2so0Vjy73Ek3irUVJFav4K9Rd1715vtkLVDeZG5t0nPpxof8LukUyPuGNLzAKx5E19DviCOz+3T1lcqui61BUWJuBWyA09aKRgrpK9EhNXUC/k7vVG81wM6rDWIslj7Y3VFttTwBNAPWnRV8rbGbEwVLjXv0GeYzE5HNWvZ1sW4JU+ngK7RSzZ2ath/pONvaYot7cerl+mI+fmImICljuAUnBP3cZYX1P/qUWOTOsOwlu9KXZyFMqG03qG7md5OcPosArCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 20:36:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:36:09 +0000
Date: Thu, 18 Dec 2025 12:36:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 23/24] drm/pagemap: Support source migration over
 interconnect
Message-ID: <aURlt+pSrK4RXKsE@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-24-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218162101.605379-24-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 939afe61-a34e-4fdb-4a00-08de3e7513b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BlGTvw+8gPP6sQVg7XsTZadBihHak9Ja99AaPw8AOaQX++j+iLBR/zpoVF?=
 =?iso-8859-1?Q?oQkb/ftBOZsw3EFgsJmUm1zCUi/uyGL1WWiOvDq1Tbyj3upNdO8xpWeoGK?=
 =?iso-8859-1?Q?u7WCITps9GSXS0oSBTLRJHhiUGna+vxRnYRY0p+g1U5+tXaQpkCCJjRg5/?=
 =?iso-8859-1?Q?5S+H6Rnxui3WsmV685u1NZ+mzpPUY/Y1iBZ7xBFJ9eiGpmMLkF5h3ZAPDr?=
 =?iso-8859-1?Q?Mb3U6FNhpIjjRcuVrNsOvzCb04decMLdf8q3ZhjmAWvTB1KvS9j7BwmMq3?=
 =?iso-8859-1?Q?9HXF4V+3/Z/Ik0GH/U7NjCHzQqG0OlKI/fkiHFwVQXLb4JOEQmsz5ewj9p?=
 =?iso-8859-1?Q?MGC1LzlqNxSnqz6ToecIqoO+fPwgSWegLeZ5ZMCVbZhZUybhbEvnhyAbXp?=
 =?iso-8859-1?Q?lsGfsGVXXthsu1ZVJE+l4JBbWbb2nXy0o30CKQ+py4yF3T9zf73D4WoXk4?=
 =?iso-8859-1?Q?freVj2EkEufMLjtRShh+JOKf+N3dQ/eFyJ11L26HmaTiVgHoWt9gLlpwXY?=
 =?iso-8859-1?Q?h40pMUWDV8SPa8FikB05FwZWVwfMfh0jK3ucyt5X8Ib96zM8E25ysaT/gI?=
 =?iso-8859-1?Q?L4jyQJcvc+woHnYFLOe+IUy8tIDbu1Jc+s9aeRb5iGZwCyT7LcyjxWg4Vr?=
 =?iso-8859-1?Q?7PacuFV8xouLJfdNkffY37VwAZAGiKN+fP4YVendrmVQ1u2eV+zm4YMsmS?=
 =?iso-8859-1?Q?NN7IQ4faMetf4uqPF9xQqN+kC7pVJOGfghmirRPss+8wv4303H+7btrjLB?=
 =?iso-8859-1?Q?FBuEp8jIXvYiUiGBpzxmVymZ4grlzgjAEOnoLMz1PYXaceWGb/tBlnSCxI?=
 =?iso-8859-1?Q?kvB3rjRVFT5OVmaEez0Xy7jQVzcLYi3w4fa760NbMf+KGo6yyGlnsOeEG4?=
 =?iso-8859-1?Q?LNPFQapLRHd6bspiFhwukyTjynh2qiyz0KsiKFDStV4X2JHpE28yV4JYEK?=
 =?iso-8859-1?Q?V65RbunUFZTX+QT6CzhZDAaI1hZHBDL1CgdoeDOWhRoIjJ4vCE7pEZK5R4?=
 =?iso-8859-1?Q?0N7ASNNe+uw+rD51vpMcz+Erlsomauqth1QAWMWYtpTmLiGBDAcQrIOZr7?=
 =?iso-8859-1?Q?yhh6bifMlpJP6Gzdx61+0uGGMEd+2grMfTuXsBuqG3+6AKKQyMwP84gGDA?=
 =?iso-8859-1?Q?9tpH05iy7+JaQSdpjkBThOgkK6QwbPA2vk1UcLTlvu6SI+8ITkEKElNbUJ?=
 =?iso-8859-1?Q?y5QEE0hbSRAuJS0dSuaJjSMj8C/h7XR0ZkHXjWousjYPy8g3KAZvpGBSgc?=
 =?iso-8859-1?Q?3YnpmkhtuCVVA27HS9Ur1YuHy9GxguoYtBsDU9bPx1wHBZC3KTLgCHq2GF?=
 =?iso-8859-1?Q?OhmQAz5KbXWxXDyOQB8OSA/ovc2lhJDL3IWjGbmPF/o10nHDOVfSZAS28e?=
 =?iso-8859-1?Q?gnr60QNxTXJCVOW/fHNzp1WRYOujKKZYzDNWmF1rJJN1Ryv1pSq1bEwh6n?=
 =?iso-8859-1?Q?FAvEim6LHz41yOgzRyMM0sEqrMV80NUz5NlbL8vIRjoVwJoPcSOLWZ71A6?=
 =?iso-8859-1?Q?wvaO3PayoBCWP48ZejfQ/j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MAzGQyA3o2FJcOt64agfz7AZbwg9hkCHTyEw45draz46L77CnmM2NhlP69?=
 =?iso-8859-1?Q?ghE+95cPnulwtPQLkQNOeS2G04ij7Nf/Cl/qXmeDHPVDJR8XEeoUdIEhzk?=
 =?iso-8859-1?Q?+0rvDvKBmKb87eKJarGiflAbJHCZ2MDl+TSCcYkOcnis+cPeXWzJg4agxK?=
 =?iso-8859-1?Q?jMSPKRJiS+gRqBdXF3mvPCLB4l4EzHCk5MPQc3hTvnOErJpMGxtaPiwdTx?=
 =?iso-8859-1?Q?YSY3ZIpDbxy7Gv3YXkqQ8dHI3OMnPmVtnAomIt5kKDFFVU6F5mysLHY3XA?=
 =?iso-8859-1?Q?VxG7jQTGpynOvMGMvPvM4PrCpO3UhuovyWEX9pBf3xi9Di1arMqep6LWBt?=
 =?iso-8859-1?Q?ht0b5wPeNSMlVCdJgOr0lxFQSfkNKAvd4sJgUKaI1s4S51AWlP3SHZdLPb?=
 =?iso-8859-1?Q?3s2xcz9pL+Cv6Ew8AN5XQy8HEeToOczSBD1jGelA4ePTDig5N1rFMDXa8R?=
 =?iso-8859-1?Q?sz84dHhTKa68ea/vl0DQYrZSi1ge1b+okW7TLVUpxQe+AdAVVYBWk+kz2p?=
 =?iso-8859-1?Q?B4lUaS5OxlJRRNq0Fghl3FMMpsx3kAW+D1jvH5q6RYV1LVRnuPCWAKOUAN?=
 =?iso-8859-1?Q?6eg+55llt4X74ss04JRcmG0OTW5w1d6EcwnwTuHzPRjILHYwUMfozVAbdd?=
 =?iso-8859-1?Q?0zNZQF88L9Co4xFFEKtrfmByNZNekOgWfdg+A9qfsJWQTemcYbaru5Z+r3?=
 =?iso-8859-1?Q?rUxdect15y4kyjW0uE//aAW9QY49fVJQuRWT5PjW4/rOGLb6T6cnXT5zFP?=
 =?iso-8859-1?Q?yBCE8q8fNS9SOxqPWlqCS+S3WQDx2044tdrOt3mnWSheSrp5izNsCRB4vB?=
 =?iso-8859-1?Q?RKjVBZ4VWrfglbLBqXvLZ4owWp/F/Xnmqiz9jX8EnItFSjAcjK5T1aNh3V?=
 =?iso-8859-1?Q?m7WguXzr9/4H7CArZXZOMh2o8PJue3oJEYQ5St38Y1f6pOblpmKw6fgxVL?=
 =?iso-8859-1?Q?wFpnqCYZzP3YKRvtajlLQHbOHdB+6ViCgLTCT9ZfgN9bA9eZ871MRt0H8A?=
 =?iso-8859-1?Q?VohReHbkDy91qtzztwbMlnLI3FECJQ18OqVP9mNgQG0w/ic6aCC1V5qmwC?=
 =?iso-8859-1?Q?PEwL8ajPErVEkxRY6Kop1NYNW1koZRnwrjAYMkrstLZI53c9fB2L6a/LNu?=
 =?iso-8859-1?Q?EGzXPsH8GjlgiZ/F4AJUul7GlxYkg8WtS8M9DzjcoSI8ahWAF01yBZdUwz?=
 =?iso-8859-1?Q?VaTmlR5ZHZICtHq5/x/iNSGDdi/ZRtmTt58aBWbvN4XTtGv26/OouNjO+F?=
 =?iso-8859-1?Q?/axSLsYQEvvB5m9+MDh724EV0QCryXxfdNMVLhcus/5aA3SWUOqzHZNatU?=
 =?iso-8859-1?Q?lmX6WMFR8O4QeqqCYhstgJbIZmmJ7UPTCe+KDHu9kEn15oVj9ruucFHHxy?=
 =?iso-8859-1?Q?MnGQQ0mQfLloT0xRriIUTtOuKFmAMhfWfm2zyHpSBnI0/uZ3KF0OASsAsH?=
 =?iso-8859-1?Q?/X8l5ldYb+KKQnLr0UP2U/6YqxBOZ4+rGLh6MXNI2aqf5g4bPEGHjonLdT?=
 =?iso-8859-1?Q?Ed9KHj9XsudzTqKuZvGyuCX0PVLOvChDGRocez9b8f3H7CFPFXXKtFOAdd?=
 =?iso-8859-1?Q?JMSb5hL0NmSYpH454Ts2VHtiehMe2qa1kOGvzIw7/LfZkPgQCc9/5HliQw?=
 =?iso-8859-1?Q?jYScV87g8vWiNCOi0YrS/TWSTnDs4Or4V2tVvUs99ERwqJetqWLxmnPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 939afe61-a34e-4fdb-4a00-08de3e7513b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:36:09.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFVuCeFZV2GzYAnAY3n58wI7D9TWML/w8941LOzadPkQOWrnVZPU0AfIhur2GS6IouWd5XBgs2UjzuzEbwhT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

On Thu, Dec 18, 2025 at 05:21:00PM +0100, Thomas Hellström wrote:
> Support source interconnect migration by using the copy_to_ram() op
> of the source device private pages.
> 
> Source interconnect migration is required to flush the L2 cache of
> the source device, which among other things is a requirement for
> correct global atomic operation. It also enables the source GPU to
> potentially decompress any compressed content which is not
> understood by peers, and finally for the PCIe case, it's expected
> that writes over PCIe will be faster than reads.
> 
> The implementation can probably be improved by coalescing subregions
> with the same source.
> 
> v5:
> - Update waiting for the pre_migrate_fence and comments around that,
>   previously in another patch. (Himal).
> - Actually select device private pages to migrate when
>   source_peer_migrates is true.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 204 +++++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.c   |   7 +-
>  2 files changed, 170 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 09356d50b8d1..ba099aa7c52f 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -206,11 +206,11 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
> - * @dev: The device for which the pages are being mapped
> - * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
> - * @pagemap_addr: Array to store DMA information corresponding to mapped pages
> - * @migrate_pfn: Array of migrate page frame numbers to map
> - * @npages: Number of pages to map
> + * @dev: The device performing the migration.
> + * @local_dpagemap: The drm_pagemap local to the migrating device.
> + * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
> + * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
> + * @npages: Number of system pages or peer pages to map.
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
>   * @mdetails: Details governing the migration behaviour.
>   *
> @@ -229,8 +229,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  					 enum dma_data_direction dir,
>  					 const struct drm_pagemap_migrate_details *mdetails)
>  {
> -	unsigned long i;
> -	unsigned long num_peer_pages = 0;
> +	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
>  
>  	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> @@ -249,10 +248,15 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  			struct drm_pagemap *dpagemap = zdd->dpagemap;
>  			struct drm_pagemap_addr addr;
>  
> -			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
> -				goto next;
> +			if (dpagemap == local_dpagemap) {
> +				if (!mdetails->can_migrate_same_pagemap)
> +					goto next;
> +
> +				num_local_pages += NR_PAGES(order);
> +			} else {
> +				num_peer_pages += NR_PAGES(order);
> +			}
>  
> -			num_peer_pages += NR_PAGES(order);
>  			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
>  			if (dma_mapping_error(dev, addr.addr))
>  				return -EFAULT;
> @@ -276,6 +280,9 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  	if (num_peer_pages)
>  		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
>  			num_peer_pages);
> +	if (num_local_pages)
> +		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
> +			num_local_pages);
>  
>  	return 0;
>  }
> @@ -328,6 +335,115 @@ npages_in_range(unsigned long start, unsigned long end)
>  	return (end - start) >> PAGE_SHIFT;
>  }
>  
> +static int
> +drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
> +				    struct device *remote_device,
> +				    struct drm_pagemap *remote_dpagemap,
> +				    unsigned long local_pfns[],
> +				    struct page *remote_pages[],
> +				    struct drm_pagemap_addr pagemap_addr[],
> +				    unsigned long npages,
> +				    const struct drm_pagemap_devmem_ops *ops,
> +				    const struct drm_pagemap_migrate_details *mdetails)
> +
> +{
> +	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
> +						pagemap_addr, local_pfns,
> +						npages, DMA_FROM_DEVICE, mdetails);
> +
> +	if (err)
> +		goto out;
> +
> +	err = ops->copy_to_ram(remote_pages, pagemap_addr, npages,
> +			       devmem->pre_migrate_fence);
> +out:
> +	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
> +					npages, DMA_FROM_DEVICE);
> +	return err;
> +}
> +
> +static int
> +drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
> +			       unsigned long sys_pfns[],
> +			       struct page *local_pages[],
> +			       struct drm_pagemap_addr pagemap_addr[],
> +			       unsigned long npages,
> +			       const struct drm_pagemap_devmem_ops *ops,
> +			       const struct drm_pagemap_migrate_details *mdetails)
> +{
> +	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
> +						pagemap_addr, sys_pfns, npages,
> +						DMA_TO_DEVICE, mdetails);
> +
> +	if (err)
> +		goto out;
> +
> +	err = ops->copy_to_devmem(local_pages, pagemap_addr, npages,
> +				  devmem->pre_migrate_fence);
> +out:
> +	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
> +					DMA_TO_DEVICE);
> +	return err;
> +}
> +
> +/**
> + * struct migrate_range_loc - Cursor into the loop over migrate_pfns for migrating to
> + * device.
> + * @start: The current loop index.
> + * @device: migrating device.
> + * @dpagemap: Pointer to struct drm_pagemap used by the migrating device.
> + * @ops: The copy ops to be used for the migrating device.
> + */
> +struct migrate_range_loc {
> +	unsigned long start;
> +	struct device *device;
> +	struct drm_pagemap *dpagemap;
> +	const struct drm_pagemap_devmem_ops *ops;
> +};
> +
> +static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
> +				     unsigned long src_pfns[],
> +				     unsigned long dst_pfns[],
> +				     struct page *pages[],
> +				     struct drm_pagemap_addr pagemap_addr[],
> +				     struct migrate_range_loc *last,
> +				     const struct migrate_range_loc *cur,
> +				     const struct drm_pagemap_migrate_details *mdetails)
> +{
> +	int ret = 0;
> +
> +	if (cur->start == 0)
> +		goto out;
> +
> +	if (cur->start <= last->start)
> +		return 0;
> +
> +	if (cur->dpagemap == last->dpagemap && cur->ops == last->ops)
> +		return 0;
> +
> +	if (last->dpagemap)
> +		ret = drm_pagemap_migrate_remote_to_local(devmem,
> +							  last->device,
> +							  last->dpagemap,
> +							  &dst_pfns[last->start],
> +							  &pages[last->start],
> +							  &pagemap_addr[last->start],
> +							  cur->start - last->start,
> +							  last->ops, mdetails);
> +
> +	else
> +		ret = drm_pagemap_migrate_sys_to_dev(devmem,
> +						     &src_pfns[last->start],
> +						     &pages[last->start],
> +						     &pagemap_addr[last->start],
> +						     cur->start - last->start,
> +						     last->ops, mdetails);
> +
> +out:
> +	*last = *cur;
> +	return ret;
> +}
> +
>  /**
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
> @@ -365,10 +481,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
>  		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> -		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> +	struct migrate_range_loc cur, last = {.device = dpagemap->drm->dev, .ops = ops};
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
> @@ -467,44 +584,55 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> -					    devmem_allocation->dpagemap, pagemap_addr,
> -					    migrate.src, npages, DMA_TO_DEVICE,
> -					    mdetails);
> -
> -	if (err) {
> -		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> -						migrate.src, npages, DMA_TO_DEVICE);
> -
> -		goto err_finalize;
> -	}
> -
>  	own_pages = 0;
> +
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page = pfn_to_page(migrate.dst[i]);
>  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> -
> -		if (unlikely(src_page && is_zone_device_page(src_page) &&
> -			     page_pgmap(src_page) == pagemap &&
> -			     !mdetails->can_migrate_same_pagemap)) {
> -			migrate.dst[i] = 0;
> -			pages[i] = NULL;
> -			own_pages++;
> -			continue;
> +		cur.start = i;
> +
> +		pages[i] = NULL;
> +		if (src_page && is_device_private_page(src_page)) {
> +			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
> +
> +			if (page_pgmap(src_page) == pagemap &&
> +			    !mdetails->can_migrate_same_pagemap) {
> +				migrate.dst[i] = 0;
> +				own_pages++;
> +				continue;
> +			}
> +			if (mdetails->source_peer_migrates) {
> +				cur.dpagemap = src_zdd->dpagemap;
> +				cur.ops = src_zdd->devmem_allocation->ops;
> +				cur.device = cur.dpagemap->drm->dev;
> +				pages[i] = src_page;
> +			}
> +		}
> +		if (!pages[i]) {
> +			cur.dpagemap = NULL;
> +			cur.ops = ops;
> +			cur.device = dpagemap->drm->dev;
> +			pages[i] = page;
>  		}
> -		pages[i] = page;
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>  		drm_pagemap_get_devmem_page(page, zdd);
> -	}
> -	drm_WARN_ON(dpagemap->drm, !!own_pages);
>  
> -	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> -				  devmem_allocation->pre_migrate_fence);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> -					migrate.src, npages, DMA_TO_DEVICE);
> +		/* If we switched the migrating drm_pagemap, migrate previous pages now */
> +		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> +						pages, pagemap_addr, &last, &cur,
> +						mdetails);
> +		if (err)
> +			goto err_finalize;
> +	}
> +	cur.start = npages;
> +	cur.ops = NULL; /* Force migration */
> +	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> +					pages, pagemap_addr, &last, &cur, mdetails);
>  	if (err)
>  		goto err_finalize;
>  
> +	drm_WARN_ON(dpagemap->drm, !!own_pages);
> +
>  	dma_fence_put(devmem_allocation->pre_migrate_fence);
>  	devmem_allocation->pre_migrate_fence = NULL;
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 40401aa70dbc..7be4d129247d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -547,9 +547,10 @@ static int xe_svm_copy(struct page **pages,
>  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
>  	ktime_t start = xe_gt_stats_ktime_get();
>  
> -	if (pre_migrate_fence && dma_fence_is_container(pre_migrate_fence)) {
> +	if (pre_migrate_fence && (sram || dma_fence_is_container(pre_migrate_fence))) {

Ah, I see this addresses my comment in patch #3. I'm ok with this series
going in as is but in follow up we pass the pre_migrate_fence to the
first copy job as dependency. Up to you on the ordering here.

So...
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		/*
> -		 * This would typically be a composite fence operation on the destination memory.
> +		 * This would typically be a composite fence operation on the destination memory,
> +		 * or a p2p migration by the source GPU while the destination is being cleared.
>  		 * Ensure that the other GPU operation on the destination is complete.
>  		 */
>  		err = dma_fence_wait(pre_migrate_fence, true);
> @@ -701,7 +702,7 @@ static int xe_svm_copy(struct page **pages,
>  	 * the pre_migrate_fence. Verify that this is indeed likely. If we
>  	 * didn't perform any copying, just wait for the pre_migrate_fence.
>  	 */
> -	if (pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
> +	if (!sram && pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
>  		if (xe && fence &&
>  		    (pre_migrate_fence->context != fence->context ||
>  		     dma_fence_is_later(pre_migrate_fence, fence))) {
> -- 
> 2.51.1
> 
