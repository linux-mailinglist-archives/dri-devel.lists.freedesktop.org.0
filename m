Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B800B9ED8D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5994310EC29;
	Wed, 11 Dec 2024 21:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPMcWVGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466AF10EC29;
 Wed, 11 Dec 2024 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733953341; x=1765489341;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Iv+V6hK4QxB442OZkTU0xHhWGYQkkDtO64hqSGP3V2U=;
 b=gPMcWVGOXwZ/Zb0o5qWuX570MmkV5jCHdW2pdh5wj9a8t6//97K5udtg
 n5K+5xDgPOqF7G/yFmm2FBg2V0LSY9sJRBi+V8Z/2O+mfk3FoTjKlzZ+R
 FRbYUvIe8LNVF8QJslI/DtaibrngmvdL3V3ojDAKEWghB4YIL5Zb2Evew
 GLlewf3ay/N5nZJRJD2hgy7ClQ7+fEuf5ExR+X21f2Hif8gXen84fmVlU
 Qz0AzYmzcZRdFOuvWCvvIbUo8tgqzTNTIla363cb54kEv67djUOO7ZW8e
 KE9oy3rLoWksWU+fNOHT9nwuCyxBhToZSeVYMQkr+VqvRoGRzggUJ2XIj A==;
X-CSE-ConnectionGUID: eBRBd+SIS3qK8HTqzE0zWg==
X-CSE-MsgGUID: uHRO9QKkSUeou3LUkDFEWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34490706"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34490706"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 13:42:19 -0800
X-CSE-ConnectionGUID: 3RuoqbnNQKOWwmr08lg3dQ==
X-CSE-MsgGUID: stIK3KBhSlK9ysBhlocCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="96175376"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 13:42:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 13:42:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 13:42:10 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 13:42:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgl0ddTJOtuxPnncsv+/0Gvd/f8HK2KXk5c15XN0fOKHriXhmUiyrFXN9cFMXNh3WM6Ol2vX/d4A2MURS7pnClW0ABlht1gTkXgvzUoub3bZ4jM8Qqi+HW7vNK1YL5AurZjSf3aUMG2tOdoUgwDQzbAO1UkBPiRTul+LG8B5G5xOtxeAkZdL9Jcuobz1cm+Q0PR/lKPZcNEvMAjp5ClPHMbDg5/SR0cZ8EsFBAy4JXfki+yaXdEkICvl2N1CYzJT4Z0WB7AGDDp/CCuZF8/LsYbAs2YDRWtaXP6J1Q2fvH3SoD22TLEbUW0woBJSDOQYOYWTWkqWIiaLxjD+kuINWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmIdZqJcJ875PjkIhQ0xQp6AGr+A+l8cUHux3sqXpGo=;
 b=L3F8NFKYoS5kf/a27uWG/K/EUtdf757JSnJa5ux/OeJ75Gq9+cqDi/Nqs07mV4Zo4zC6VUq8kIpn/INpLsBKrWzkvecx4g3QC+7PonzZTjktvKxCV5bmy4Ho2YNZbekmiZVaYoWLq9SLmzq57bMjAl8n4ih4vXLfnEu8EEPHDYlfh7pnwwvKEwi/0Aht69kbDIj0azRelmtSSFn8QsTwL6f57GcFk7kLs6QiIxouTKAmvRRzZLsmClZYadbi6tKR8veyCOQrHNQFPwmzoIseuSVCZdilA3d0X7qJyq7IGKMdwXF5vltohJnsdx2ZjlwCVZ/bF9czCg7QVzLamAcC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 21:42:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 21:42:05 +0000
Date: Wed, 11 Dec 2024 13:42:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 23/29] drm/xe: Add BO flags required for SVM
Message-ID: <Z1oHV0F2sjhY1YsF@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-24-matthew.brost@intel.com>
 <a2377c7b0cacc4c437a0defdb410565b774e6250.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2377c7b0cacc4c437a0defdb410565b774e6250.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0100d1a7-c521-462d-68e5-08dd1a2ca789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iNo2QJXc99A93kPFAmZ5/L+22RvcF9ChB0fhz0kMj9M6oSQ/1slamVcZ+n?=
 =?iso-8859-1?Q?k75vF7qzOJLG2DU+voENkd22sXA4FVMC4fYZ9lh4bKTEFZEerMTkR0A9pJ?=
 =?iso-8859-1?Q?unUb1MVlllf7XdKxcKq7sIafzACvA+5x8/xsbmXYylRGAWYSiIYmGOqua4?=
 =?iso-8859-1?Q?5E07vS3osHpclBKsqp44s4w2dGNRRkWmasSYSNNMv1NJK/MDO38Z1UIy0P?=
 =?iso-8859-1?Q?K7jSOcbHVRj6S5IBa8X518Wb9a5XPpNDbdZfXJCmlRjRnBWgaj8OWdhUGT?=
 =?iso-8859-1?Q?zbCBrBnwkCERB9891jVV6pG0ZuHORRjLn5pqH7+PaKNzodJ6rf4L8KqskO?=
 =?iso-8859-1?Q?JHQDkAMGuOKCAO6AizP12P7z/PTsgEuRF82mReXlh7s3ILXZkRSCjFCTZe?=
 =?iso-8859-1?Q?YC6mQ7tU+Q/2/KHWUrVlVz4XKejrvPbOz7i1ARqkbVo2gVfDEjMxwy3Sdt?=
 =?iso-8859-1?Q?X1tiCkd/xUmfmO5YIQH4ZEt24ASIKU8qDp95y/e+/aShONfHtHsGhPjvW2?=
 =?iso-8859-1?Q?Itx927ptu/9/ElAyY9Y2k7E+d4vQOboExWTWn8vzArYByi8j80h1K6oTDp?=
 =?iso-8859-1?Q?KtiH57ievPEx9fEG8LeSdSrQ82flKnnTVPsgk/xm7yxuwzY+hZVu61wGzO?=
 =?iso-8859-1?Q?FfgesxeG6RlwQrfxkwoinG6sHamJM6DfPv9Pav3Tqu0SYP0xBtiCVWzq4I?=
 =?iso-8859-1?Q?ree6qtX2h433HgR9jeacTXwQIau7ScPjgkeNcLDQ3HzCW0ZMyThpV7c0O6?=
 =?iso-8859-1?Q?h4igTBap582DjiHZ9Tkf9b1qmve779CjH9AM5ijK/U7J4AiytwxVQaSPSp?=
 =?iso-8859-1?Q?rJo91sqZS9l/BVWzhBmVH/bkhd5uwBsicqf3Xtjvc+S++4FgkhGtdGaGuo?=
 =?iso-8859-1?Q?t59buob3BQteOwGcQei1sLAlG/ac5tMZkdNUBDuDWVKRP54+qdbzcH9i9z?=
 =?iso-8859-1?Q?OJvcBagtbZTaeuDMOKoOp7S0ZB/jKsHdFLSRWBVuT2duNAYt2+fx0//Gux?=
 =?iso-8859-1?Q?b6kXJOueQzHhvs0RomDTH2cG+arpnWGuB46wDEIsyDVpxo4W3gKG28wq8n?=
 =?iso-8859-1?Q?U1eRyK1FZLGG50Kd2BCGwoUHIOCowMrY9VvxA5sO5Xs2es9GJxwE4Fb6f1?=
 =?iso-8859-1?Q?/Fc73npanKSpWdDOvjvgKAha/6wmq1V+bHAXl+pBqy17oSOHxsHcTqwuyT?=
 =?iso-8859-1?Q?gnz+AoFsbiiotQKjySy6gm5cLH/MvPMXg+bZhBTWtDWncRchOOZOQ61UYm?=
 =?iso-8859-1?Q?up6ITONB1QK2uKbPELJbQy2NCRyucwIp9A6nQJESVQnG5VuYh5IKy82LxC?=
 =?iso-8859-1?Q?toe8UXj+iRfqVKcKtCgE9Hht5G/OZ1tTgocz7tosY3/Z6c8uWgQfFQA6xm?=
 =?iso-8859-1?Q?Cp/7SuIwueeunsTW1uWoXf48zFaDwJqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IIuxF1hB6UAi+9Jb90IqVWcSOz8oXBpkol4ZBLqT/Is9rXRSSx1t68U30c?=
 =?iso-8859-1?Q?jWdhIEDdDs1GObFAbGACex3fZH+omP1PqWXAbg7QFhYxYuyf8wRb3IK+Na?=
 =?iso-8859-1?Q?8uB2RqN70XWTBEFwUYZveNzab0EswwDz4ExIJ8je8KNCfxnurmlRRcaNsJ?=
 =?iso-8859-1?Q?umJhIWiQ5PMb9ISZJtGckKV2PDld7OTe6E545VAj3ySNpCMfjE+rtYEfpG?=
 =?iso-8859-1?Q?HnWJ54M5E4VhIeE/c6o4z7tp/YcskMFzltG9IE0FoL6B4FgakKHEsgN4Lr?=
 =?iso-8859-1?Q?syN27YOOCiwVETafpIG4Z9hQpmloIb8W2PSj1Hbt7UZbDYKxKV1ko5LL9a?=
 =?iso-8859-1?Q?i4MX0XTKwXz4//qmk4/rotLduwyEM1TuMXt/iDUZetJ5h6UlOz5Twc2LGy?=
 =?iso-8859-1?Q?mUz6uYTqw4Bg3Px41tsoiQ3uVUtv5DhYzIG7iTqBGVYrKcyMUgagziFtbX?=
 =?iso-8859-1?Q?pwZEjnyQkXKyPUCesX39E0AFfsxJZAYXawtRznYt6+W3Kx5t8qz+h9/axg?=
 =?iso-8859-1?Q?GuPILpMJXQHsHoZDPzf4I3JKLZ3ULF/4lj7+Zd5fsDNdI3dooBq8Sz3acI?=
 =?iso-8859-1?Q?TAnUmAHMwCg2ebW3EC+4iyJYRKtS1gAdEYguzu6I1Wn29D6sKs/AdpNUkS?=
 =?iso-8859-1?Q?2pNMQ2qsu/LMu0PR1PTLjvUf5XPl+zW3ptlfZQl8rzWT0AcSLFvbw3cPrr?=
 =?iso-8859-1?Q?gJ6JxQ5niyNcC4tfm/ID9x4yhMO3aiFTvHbxrECrrf6er11Tn+Fn98r1l3?=
 =?iso-8859-1?Q?T+FEny2jgQDKSRxqOjtuGeK3cEWRBX7mNRDSlYLFRseL21UL2U7tdIdvjz?=
 =?iso-8859-1?Q?Qx/zIQG0PvuNnXlji50WOzN7maxBfiX3PGb/2c7/12IE9GLV25rvD+13Fq?=
 =?iso-8859-1?Q?h+39Aq2R5nErGHaKZO/O7w+LeMIufyJLHVsukuKnY6ff9DnCOUx81FX5RP?=
 =?iso-8859-1?Q?8ScSa/05E2IVqd5a5G+urDnFQi98KnGMDSFYBVi8GYvShefx7uSpMImYUj?=
 =?iso-8859-1?Q?30v5AxEA3g7UyxSFc2QUVp/IapFA3M+Eo+5Pe6+zQzjq3oJC681Wss4KHt?=
 =?iso-8859-1?Q?eh6C4EawfZzXBIVaGH5RJgC0xegCo3jorIEjRNgvWfpdpmQnqmC3yEzef4?=
 =?iso-8859-1?Q?0LAGwwHAq/87ysCobHBo8RNJrZuNHVvKZk4N2wqjqbO9LLXcqKAbXMIo4w?=
 =?iso-8859-1?Q?csQbhvlF5Yq/MtGNyQrT1aGgwPAArGLqq7oV62Chg1RGfkprYpyP75akGo?=
 =?iso-8859-1?Q?CvjaAA5PTV2ASXzl/XJiHHnldlDYvny+5d9akRALa4Vzw+0DdPXfNt7gg1?=
 =?iso-8859-1?Q?AML1yOMZdticY/v4SAqUetvoXXdcfDrZAKWTAMDoemIoCODsMbyhebZwuu?=
 =?iso-8859-1?Q?VkCYIp3sII56sko62LS+3RGfkFa19UesTU0SpSD5zb9glRd5ttDG7LQtj8?=
 =?iso-8859-1?Q?mirCSsHhL++NXJe126K0I95nAzykmmnbwK2qtuenlA5O0JAaUpyQeMdXAK?=
 =?iso-8859-1?Q?dwCw3DVq9DGrKghXd4Z97uOmuWpMnZsqC7vO4kZab9v9nEtopa1MEJDtXp?=
 =?iso-8859-1?Q?LVcst6A3dBPPWSEJuxSNjiWTIVhJH5MscLu4zVPNtxphBsJJOUkUnp+S0y?=
 =?iso-8859-1?Q?ynH8lAyUq/W5YetDZXiT2Hl+6h0QUryCLjT9MnMzkw7k6/IIm3z6DYIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0100d1a7-c521-462d-68e5-08dd1a2ca789
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 21:42:05.0056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7HZgdwYnWkXBAx5OP9UgV6BITyZLlTYLmxqzMxUAi/o+IZHzShMnkbOWLhm937j5ZSQKtFYdqAb4HU71Dt6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
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

On Mon, Dec 02, 2024 at 11:44:47AM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add XE_BO_FLAG_SYSTEM_ALLOC to indicate BO is tied to SVM range.
> > 
> > Add XE_BO_FLAG_SKIP_CLEAR to indicate BO does not need to cleared.
> > 
> > v2:
> >  - Take VM ref for system allocator BOs
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++------
> >  drivers/gpu/drm/xe/xe_bo.h |  2 ++
> >  2 files changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index a02d63e322ae..dbd03383878e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -685,8 +685,9 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> >  	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo-
> > >ccs_cleared) :
> >  					
> > (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> >  
> > -	needs_clear = (ttm && ttm->page_flags &
> > TTM_TT_FLAG_ZERO_ALLOC) ||
> > -		(!ttm && ttm_bo->type == ttm_bo_type_device);
> > +	needs_clear = !(bo->flags & XE_BO_FLAG_SKIP_CLEAR) &&
> > +		((ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
> > ||
> > +		(!ttm && ttm_bo->type == ttm_bo_type_device));
> 
> It should be worth adding a note about how clearing for svm bos is
> intended to work. From what I can tell, there is an option to clear on
> migration from system to vram if no system pages are present?
> 

Sure can add a comment. The migration from system to vram doesn't do a
clear currently because when 'check_pages' is set we only migrate CPU
faulted in pages. If we remove that, then yes we'd need a clear on
migration. 

> >  
> >  	if (new_mem->mem_type == XE_PL_TT) {
> >  		ret = xe_tt_map_sg(ttm);
> > @@ -1145,7 +1146,7 @@ static void xe_ttm_bo_destroy(struct
> > ttm_buffer_object *ttm_bo)
> >  		xe_drm_client_remove_bo(bo);
> >  #endif
> >  
> > -	if (bo->vm && xe_bo_is_user(bo))
> > +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags &
> > XE_BO_FLAG_SYSTEM_ALLOC))
> >  		xe_vm_put(bo->vm);
> >  
> >  	mutex_lock(&xe->mem_access.vram_userfault.lock);
> > @@ -1301,7 +1302,8 @@ struct xe_bo *___xe_bo_create_locked(struct
> > xe_device *xe, struct xe_bo *bo,
> >  	int err;
> >  
> >  	/* Only kernel objects should set GT */
> > -	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
> > +	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
> > +		  flags & XE_BO_FLAG_SYSTEM_ALLOC);
> >  
> >  	if (XE_WARN_ON(!size)) {
> >  		xe_bo_free(bo);
> > @@ -1493,7 +1495,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> >  	 * by having all the vm's bo refereferences released at vm
> > close
> >  	 * time.
> >  	 */
> > -	if (vm && xe_bo_is_user(bo))
> > +	if (vm && (xe_bo_is_user(bo) || bo->flags &
> > XE_BO_FLAG_SYSTEM_ALLOC))
> >  		xe_vm_get(vm);
> >  	bo->vm = vm;
> >  
> > @@ -2333,7 +2335,8 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> >  	 * can't be used since there's no CCS storage associated
> > with
> >  	 * non-VRAM addresses.
> >  	 */
> > -	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
> > +	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
> > +	    (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))
> >  		return false;
> 
> Can we support CCS with system allocator? Perhaps add a TODO comment if
> so. I figure it should be possible if we resolve on migration to
> system, which we do on BMG.
> 

Honestly don't really understand how CCS works, so unsure if possible.
Can add a TODO comment and we can circle back.

Matt

> 
> Thanks,
> Thomas
> 
> 
> >  
> >  	return true;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 7fa44a0138b0..caf0459d16ad 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -39,6 +39,8 @@
> >  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
> >  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
> >  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> > +#define XE_BO_FLAG_SYSTEM_ALLOC		BIT(18)
> > +#define XE_BO_FLAG_SKIP_CLEAR		BIT(19)
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> >  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> 
