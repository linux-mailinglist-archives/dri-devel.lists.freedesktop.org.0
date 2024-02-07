Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E384CC7D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FBB10E2DC;
	Wed,  7 Feb 2024 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lah87/mU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FDB10E2DC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707315556; x=1738851556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9uBLmyoRt2NLOnzc5jwxR4F5JWZAVlez4i3ODS1OozA=;
 b=lah87/mUt2P1ZfQd9SpJo64c1L3TlxDI3mgRs9fj60Awkgcq3W1nkgaa
 4sZ2BBpU4JMaYeOYWaZHgLQb5vVdQZs2Vw16M+29o+QhRUniIfpUnFmkH
 HPC7lypCo9HXvypc7UESWaenD5HhQ6O5PLOsoFgR60DwZXclZc8wKTt9N
 jQ130Jee2FALZLaKQrpycAXKxgC3tYuyWdC9V+Hy41Vc+fa+MU3Gq+kjB
 x5cb459AuyiQgb0aTskEzZdzQ93RVTtnAomBhHJOgR0TOqbNHMS3RsVQD
 ssNNVWcqfGRoPuvcv6RlPIgYwwuVjqgXC3UDCQqRuIq6G2K7TzM73x1HF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12082863"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="12082863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 06:19:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1344124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 06:19:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 06:19:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 06:19:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 06:19:12 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 06:19:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5R5fg2mV20403BMpRsQpBw3UqtzbkgrIMItng2JONK+CKqIzNIpSjm0qjuMqv9WR9GiuCSLcHahP1iKRSgWnrPiVHL8kNcUfrrdkNgEMlDsabCE02aRyRdn/o5KczhHC7Qo7ToT2/FVXxJigtA/knZidUKnTaUOW0GlwHbX1kKgOcVQ86IIT5IsEiLHG1AYx6/sN1EMx+vLwFoKuI2QFSH/E0dQeRhWP+nW6GcPmYWFQwMplfabBgnzr/77vt073/rfBB/ReiOoX+jlM28nUzSTQBKiRQ3y6RHK3SeXvRln2a300INgguZJB9H35L9KL3MBvDD6PfreGsWWA1507Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j8d9G8K5uI59Th6VHiejzv0KwT+enGxd2paY36czzY=;
 b=ZmAEDfPI5U4x137ev57uAka4WU0QcZP0PQl4K3UBotjTxz9t6ejy3bBN+Jqvi+e4JBkltjD/unFj/2a6NXgJxj7HrBnbt4MaW/F4LIZuivHZO7FZqXrryJFzMIjIwKUQUvy0Y9Wf5RwXGTK1oCdwTgcw8M91r657vr/pPeEeYXyjhUNMMG/xkHQ1MXJiBb69jY5FyXdD1hkDpnbdPSlfZbZerfQkaConhVyFM4lEbdAD6ffxznu3QLa2PxYektSeZNM1m7OUok+x+p1+uM9ryZOibo6+zmIqX5Ofq9gmbag9PFX4J8N8glzeRjSPdE+vSnzu9Bi6Fp6kIIvaWwwVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 14:19:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 14:19:10 +0000
Date: Wed, 7 Feb 2024 09:19:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <ZcORWwiYB4srvLyE@intel.com>
References: <20240207171719.7d15be34@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240207171719.7d15be34@canb.auug.org.au>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9cc741-b28e-4353-a20b-08dc27e7c0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Rgwi+PhvhQ+He5iLcWJOdO8DR5N3LkffZiXfzIILpRguqQMThXjY408nqLuLYA2Ri4fmf1AQsDoAUr949Oz61Wqnr/mtdDVZSMTd2fBS1U2nB4HB9A+IssmNj1R0UNMn7MnlrSzI+qoIfWoHYj1TlfGuqSz3z1sWr3MS/qfnfxK5ITY2Hw6mVqXvks+o6ChTQAmv2r3T6KtEnw0QSzri685F5HecOSn8Ufl5+cEVefpr4l/3kOu8vC7lTclsqtqpaF3VNt8qsztMXIIGvqXn9VcPlzaqZ1SxzrfqMzhMN4GuXCdcGOinh35fEyRQgSwvUFW2SEmGkKgZLC82ij/dvMics3s3ooJAMUHGAQggUk1l6dJIFwOtMOtV+TbUK4maHEgQ9bxVDQ489WltPTioH11yBKenJ93ONr1Y44WW7uFcSl6bntG/BbCS6o+nIJ9nLveO8SvLCkAncr2+XuUI4vgauVazfpzw/6ip3V5gEcoq60Tas1FV6z8NKUC5AS3Xal8ZYTk6JEl0JVpWSWtWrEofG2NR9cwVhgW5gZ8whwO6EUj5mR9ZPwIg9VQoSsH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(82960400001)(66556008)(66476007)(316002)(6916009)(54906003)(66946007)(8936002)(6486002)(478600001)(86362001)(5660300002)(44832011)(8676002)(4326008)(4744005)(2906002)(38100700002)(6512007)(6666004)(2616005)(6506007)(83380400001)(26005)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HuqePgdiRc6WaLVc/aqpbHjkW0L0dnv7L2tazc8EYjdU7in/iqHcd/vxL+74?=
 =?us-ascii?Q?Vj4d+tmbkaYL4Ap7xRlnTSLzI+KScBZoqgV2SyT8c8cPW4DMIWZCmfdb/fIc?=
 =?us-ascii?Q?a50o3QsPKsYfiqOQHxtnxLyY6j4nzam1OC/+vJ22NTOaIfq46LTKx+QlcD+G?=
 =?us-ascii?Q?1+gCV6n2BEnNFPjqyiDUyrQUHA3KEcOESeR6ZSI4aLIz+qw0KZDKg7moRXuW?=
 =?us-ascii?Q?eZ8wj0llnXjFHH0aHuz98uxRSwptj+G834BJ5VKsR0aAA2hdHZFWX7L91N7X?=
 =?us-ascii?Q?y8wHinqChwTw2cxiivccGWi3RhHFi5BNYM2Rg05y6YtFBJsDyF2Y96JM8uM7?=
 =?us-ascii?Q?mf6PSVIfugtTHHJiAXkNX+VAtW9iPKMvPTkdtxEtYaOXMjsIw9+xvykKetJP?=
 =?us-ascii?Q?oeJOfo2d8lusSQ8lOAYy7rhdSe57TdLDuSdXiMsVC+kT9WR1LDsXx3am8JUb?=
 =?us-ascii?Q?Tc7Nxac014VoAOT/Il9OZbHxqXU2S5CO72pOZm2Ju2XoS7qOEsc9GWhkCbwR?=
 =?us-ascii?Q?309UNkIwDh4jYN0y8FBE47YTYF5xwxghpY/Oxwlb3A6kYflf3X/KCviozjDi?=
 =?us-ascii?Q?tJBSaXRxXz7ZYtXVPBckj+1x1eUn30OJBkFbUfTX2Dj09DW9am7za0G1hM/V?=
 =?us-ascii?Q?q2uJKFFnKUEulKm91iXLJI6jzdZjAJkjSowSagvQprm3VVXkXqNi+fR8WJEC?=
 =?us-ascii?Q?pfGUChJzPC7mm0IF3dTizO4Rhm0b/WXVt8BigqvMAYNq70S+JlEZjBKq18Ep?=
 =?us-ascii?Q?bMy1P8+albBwih04D0wQhQrioFUnszbyXpYSe8GUnZHBiM9bC/+XYYMfSH3S?=
 =?us-ascii?Q?2wXRRpi8Smwqc9yzowPOjEQ2h8IFwzSGsles6QJeVyxxkVDKWAzpHC1DAS7q?=
 =?us-ascii?Q?s9jIimEGKOl1K5T2XMKUQvyylkfyz+tfGHx0EFVplddjGjbme3kdMFKMf6u2?=
 =?us-ascii?Q?RCeWN9F+p8mHzYgVbAfwsk0JQXTOuM3nF/317Saz7l0j52G4ijg+1sjdIfnA?=
 =?us-ascii?Q?KbfMGi24Q5LfzSuDeS5tktvqc6pUNTYDzDKLeKYo8nCdUXBt0ViaeKoKYggx?=
 =?us-ascii?Q?JGgyUbVj7LBqB3rsIL9bim/VfCyQm3/FLBD4D5EHvTfftEgAsdHbuCxewqx7?=
 =?us-ascii?Q?PkaqQhCM4vSO5dnUZI+jYwCYUkLJpBxLRtmUiNFmxbaa0ZRPHW1gfpjjwcB9?=
 =?us-ascii?Q?ZqOtQcDW/xK7SoPmRXq9WNJHP19/BNZUovu2HEho9IMrUMlt0E8vE/9GF9A7?=
 =?us-ascii?Q?SJk1F2Vfqj5pY3fiNb0PJ+waQGuSkWXeu9wJ8vWJdkpjSTKapmYBHdg0S4Aj?=
 =?us-ascii?Q?iKyxhVFBRkxHGnXrmXsPGH/2W+5GHpuqCHfTvSt3aXvdh/tl7+x/87s/3Lcg?=
 =?us-ascii?Q?Rw3BL16Xi3kLxZBZjaB/TmxAZyihg+GUtVCjfuhXsTcDLSvQOymbQtIYEN6w?=
 =?us-ascii?Q?0/CC7rQsrfnWA6uTVu5199yVnVSqetBEzPfgMG/Zr/uJjH+oDGrdSDcRH2iZ?=
 =?us-ascii?Q?5/A7AnCBBaWm7pjRBvSmpUfFTQrgVoaPqPa9RZM/Jj0KlJadO7zcOLm7G1MQ?=
 =?us-ascii?Q?9hettry2qlYsmglKVx/7fTRhPtIGOZzjLYgHGaAh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9cc741-b28e-4353-a20b-08dc27e7c0e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 14:19:10.9419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9niLodv40wHyRqkfg429pccHD+HYSWow386nXxupelERXDohQXR16l89NGZ7lhGQWKjYdnxdyPsUtKt4M/fnuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

On Wed, Feb 07, 2024 at 05:17:19PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to nonexisting document 'gpu/rfc/xe'
> 
> Introduced by commit
> 
>   d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")

It should be fixed by commit 70a46e1fda3b ("drm/doc/rfc: Removing missing reference to xe.rst")
that is part of drm-misc/drm-misc-next and drm-misc/for-linux-next

> 
> -- 
> Cheers,
> Stephen Rothwell


