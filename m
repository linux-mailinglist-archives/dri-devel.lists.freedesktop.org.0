Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D77EB59D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263C110E1D4;
	Tue, 14 Nov 2023 17:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1B110E1D4;
 Tue, 14 Nov 2023 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699983416; x=1731519416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fNnTbsJR4DeKGhM/MIlAdYE9ebINwkQ+QbsWzWi3UYU=;
 b=h36GmuOOVAuaAwKdh9E0FZ660RXxrF4eBWLU6pTw3fCDPSstjnkWbyDg
 Xdu2kBB7h/L7/ROf8ZzC2mPIUewoQT74oeZH3r8HSN5Unp0tR4UlKzTIb
 E1Rcb8eDDQcP4aO966RvnKvBZqroZeIHH8iLJz1FZPHIUAvGnXrVvn0Q1
 BakuuJMxRTN7I4NIGFKVOtNAQU/GbV7YTZqDaAt43umLF62x4sB/WZnlz
 VZh/VmSokyHaRVjcj2Nsg15klaWRBZY3ZY7pwwHd5wqc7Vjj1Dq84WyTn
 UXtSAP8mBYwVkpjWKBA4yiudEWQ1mmbbfi9YAaMGJc7Cfy0oIEmQzYpyI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421802889"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="421802889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="6129284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 09:36:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 09:36:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 09:36:51 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 09:36:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afxn+a9YIhWkfrZJ3Dw/8MJOYi5ukB+ioiB7Pz+OWTYItSIN6Fh42m80lAQdyknObUMe0R6XojcUJI9tPsf5KJnilRcH71q/7JRmIDtxR2ONcFch2mFb3Kwrpltq3/qbbiPiVai/0Qq48r22k+J4/NHr41jhB0DgkK/pebn7YNpOWQk6XY6lUz/G1Lu67td1r2tYS7qQjBiCguddb+JcbdS3TogwQL6b/3Uy+4MPgMEIfh0XWaw2dRUXyDjydZRKQDaZQGbQcceRF8GTJ63VTyR5T3qLpqjdw2Be4GAWJNUeGgKgUX8W2f1nrX691l+ctWvzYwC0oEObEMbn/kyu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RuEECixd1mpegZpVUbW4Anjt3vsPzAr/ruRFDI/rMQ=;
 b=Hmxf9jXG25QluXOZ0xC8gHrhMvgfklS8opqEw4lK4Q5UukBGN5ppkubT2xT6lo5axzWHK+siCRdI3gQ/rvcxqQAhJJJnxx68VQAperIxO0iUvKoW7pSjFtjIx61XtRRLWEOdK/4bPo5ZJO5/JramWgPE3e0ltnAjbOYdg4do2et0tLWiSkaZP/m+hHnksU3pyg7IId7LiCgPA0RB8JQqvX4PEFw2y8vS/k1ySmY7BHDLj40D2DYqFp+fpqx2/wjEqMPOitOf+CXfq4Erjt+13PM88D83GlvK0YUfSlMuPcyvSik5u1uvoQMerf8AYrrUJgByNWwQROIWsSYs/nWiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Tue, 14 Nov
 2023 17:36:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:36:47 +0000
Date: Tue, 14 Nov 2023 12:36:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Message-ID: <ZVOwK90yt1gRz3EL@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
 <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: b4644652-3905-44b5-fc48-08dbe53846e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RhJ9CyF0sOage6zlhiql1rqWRddNl9B2o+6XlqAxuYlypKmyJqjTmYEDFnOWlAtXeU/CRdA9JkLJEutBJcZGR2GK2IsFjZniimo5e1vLFCPFfpzQJkjTmNeLgMhiF7cFeZUt8gXw1tATkp7aHC3Azw7HzUxb+BbWiKDUJX25IkVbMeKqnHsmmyWn2KjZ3vy7uCy63OToEAdb0jez19Smg2Q11oS/f4A9mj9t+rOIxV8T/8nXSRhsnXBAWPDDMuuAr/3sI/Z3jGCa8tHmB73iNiejwykSRf0Oz/0F+rFzBxEShwPvZvx3ErHS1diQlZdqZOAli2Gn8L8XCUL7P93g2Go98c7pG4IuKOY7m7pnFIljZ8zTbioS6Z2ijwbBOkVMKq3jkS2tRLJOwFPryDf4EJuDqf83Ec6rvZF0cBHQY9T9OFbWF5jnCp5ENsGz+48FUkPXk4WTMbEgIb3oJscwvTygKIJ7JlxKk9Y2fA760/F+oXp2qla+fgv/YyXhGIJaJtw+u7a9UYFXiTcGlgge31tRESCWgOqyshu6hr6UR7ftfJUrxjM8X7CowBFoQcC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(44832011)(86362001)(2616005)(41300700001)(15650500001)(5660300002)(2906002)(4001150100001)(8676002)(36756003)(82960400001)(4326008)(8936002)(6486002)(66946007)(26005)(83380400001)(6916009)(316002)(6512007)(6506007)(66556008)(6666004)(66476007)(38100700002)(54906003)(478600001)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8QvIich7QYNVEGmfruBwU0F9U7g8AA8gU6Q9qObabjtWpV9ATH2qm59+iP1?=
 =?us-ascii?Q?qgjUK0iAagwb8cOrE5Xgk2iIFmGxft0qP9c/vVkEVYP+XJxQH5babEhfaQ5f?=
 =?us-ascii?Q?p0NUgLCQmu0fUvwCaN5Glbw7sEjYQAQ9xijApqdZNa/7Xz+bI7TXw/nR2Yg1?=
 =?us-ascii?Q?9ehxega6Qaox5FUyPMsyUKM4ZZzLnD6XnOIic8kq9srSgxWRoZ3EnnmKsLOh?=
 =?us-ascii?Q?NsEaNHHpRcj5+8Bw9Mi57SLkIKyY5HP7EIuqjcxScikKKvcvIMdvB5kjNhk2?=
 =?us-ascii?Q?UWe41jbqnAGNXe4FndTmSfYxR2LwY6qLxcwOZYoiOfg0BDMTmypAoAqDnMMK?=
 =?us-ascii?Q?+ZSLDdjcO9uY3eYDqHVj5CSbY1fogualbZic2cHmpjgBll/AkL3S+ZIcaCLl?=
 =?us-ascii?Q?ED0Wc+oPT1v6wTDMgzSVuZLgi4nLj+eyF5fbATZ3vQY4gfZjkfQM4CiN/RR2?=
 =?us-ascii?Q?4hwIuDClV8uTTyPTTzFsPhpG/H7BoAXwwhJlHm6UHOhrPZUK+kFPtog/xstd?=
 =?us-ascii?Q?mb75ICCIMmJZ/l5AgJKD05dCzwvgoi2yoAkp733NLHkX6Div1+aEh2rDvzWZ?=
 =?us-ascii?Q?dz61W2p+yA2v0I4rABtFHENSGJzk19Gb5esLSnvFrEhR6hvHsBOJJ+HCy7mg?=
 =?us-ascii?Q?z3V5F0U8I0YxRjTmUrnJPn8c4dN557t/u2bXAQTvbl1ASV/edYb8oN7PDYXe?=
 =?us-ascii?Q?O/CoarsQB50SmXLZoMA+7g/4L2ij++1vxlfeh3nOQJxDkw0FFI4T3RXhGY2l?=
 =?us-ascii?Q?Xoa27SSZ/EUkbPzEOrnZ1OnD3ejB2kt7nRG/9YtbGY7XjjMje6EGVnwkdEAR?=
 =?us-ascii?Q?+N2QdHqF7YCuV7/p7Cbrx4mBpQdr9sfdCzlKwDjvh6DyvA0+Vi9+kqaXuRbR?=
 =?us-ascii?Q?FujrFpqUfQGdop7iPdCeUvnyAXywKDuljeAsxsz8YKF9YLNVx7HW6Di1PuUO?=
 =?us-ascii?Q?akwBoSponm5pz+9mrjgsxMk1DpGQNyZvdNrjdGCC7bjUdrcW2si30dEpG7N3?=
 =?us-ascii?Q?Q+mhPg6lDzA2c4TSZskEVbT+wdhwVRbi8nVdItbQ9eu3pZag/5Z0SApcvLqj?=
 =?us-ascii?Q?9CoNtsGFSzM8f4rpLs9wzwzA7wZZ2XNL/vAf9u3ypSHljUTktuJYaVrOqY4D?=
 =?us-ascii?Q?6mEU/qPodpmRNZfOo771KrVzYtdlLQrLKOaEHMuBwYvKrN7GbQx3QYw1IAxG?=
 =?us-ascii?Q?yOc+MhxHb/Amr2n6t4ZjCxOcOgjVUvep6sF7PWCDrYC9vs+SExf7iP1mAQHp?=
 =?us-ascii?Q?snPAm83pKSsscK6zdkmVzKbVnln+YBW7J69KL1eTCnDyF8s+XFSyWBcTW4Ob?=
 =?us-ascii?Q?91/UsROxC+s3E6A9cvU+CY1JSqSyTyE2609ADGvTE9LzthaTVn2lg7+ZftNC?=
 =?us-ascii?Q?LEqkrWZKAYSR+fGJLi7hk1q8RkbUPxBF3EcI9zEBG+0RIABdvXUB6r1FPWTb?=
 =?us-ascii?Q?Nyarc/RMv9NGHqX2VdBa3DThN3pr3ecxDqjHUDgkLWfSFkd/4WgkIGtMCV9P?=
 =?us-ascii?Q?moo80MqZ7KZOYB6s+64KKWt3gu6HseReArckuPPetSuC+U/WzZMRvZxP0pF5?=
 =?us-ascii?Q?CsiY2EkcLF834W9cdmzM1zlY0gerlBSx+Jehrwyz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4644652-3905-44b5-fc48-08dbe53846e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 17:36:47.6344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfXmF0xqPm1leshWfY99h/kY25buf09prQpPzFP3cl5MvfiiJ6FVbA0tdNEuJd3KU3w+6sU56MySKpnRli/8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 05:27:18PM +0000, Tvrtko Ursulin wrote:
> 
> On 13/11/2023 17:57, Teres Alexis, Alan Previn wrote:
> > On Wed, 2023-10-25 at 13:58 +0100, Tvrtko Ursulin wrote:
> > > On 04/10/2023 18:59, Teres Alexis, Alan Previn wrote:
> > > > On Thu, 2023-09-28 at 13:46 +0100, Tvrtko Ursulin wrote:
> > > > > On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
> > alan:snip
> > > > > It is not possible to wait for lost G2H in something like
> > > > > intel_uc_suspend() and simply declare "bad things happened" if it times
> > > > > out there, and forcibly clean it all up? (Which would include releasing
> > > > > all the abandoned pm refs, so this patch wouldn't be needed.)
> > > > > 
> > > > alan: I'm not sure if intel_uc_suspend should be held up by gt-level wakeref
> > > > check unless huc/guc/gsc-uc are the only ones ever taking a gt wakeref.
> > > > 
> > > > As we already know, what we do know from a uc-perspective:
> > > > -  ensure the outstanding guc related workers is flushed which we didnt before
> > > > (addressed by patch #1).
> > > > - any further late H2G-SchedDisable is not leaking wakerefs when calling H2G
> > > > and not realizing it failed (addressed by patch #2).
> > > > - (we already), "forcibly clean it all up" at the end of the intel_uc_suspend
> > > > when we do the guc reset and cleanup all guc-ids. (pre-existing upstream code)
> > > > - we previously didnt have a coherrent guarantee that "this is the end" i.e. no
> > > > more new request after intel_uc_suspend. I mean by code logic, we thought we did
> > > > (thats why intel_uc_suspend ends wth a guc reset), but we now know otherwise.
> > > > So we that fix by adding the additional rcu_barrier (also part of patch #2).
> > > 
> > > It is not clear to me from the above if that includes cleaning up the
> > > outstanding CT replies or no. But anyway..
> > alan: Apologies, i should have made it clearer by citing the actual function
> > name calling out the steps of interest: So if you look at the function
> > "intel_gt_suspend_late", it calls "intel_uc_suspend" which in turn calls
> > "intel_guc_suspend" which does a soft reset onto guc firmware - so after that
> > we can assume all outstanding G2Hs are done. Going back up the stack,
> > intel_gt_suspend_late finally calls gt_sanitize which calls "intel_uc_reset_prepare"
> > which calls "intel_guc_submission_reset_prepare" which calls
> > "scrub_guc_desc_for_outstanding_g2h" which does what we are looking for for all
> > types of outstanding G2H. As per prior review comments, besides closing the race
> > condition, we were missing an rcu_barrier (which caused new requests to come in way
> > late). So we have resolved both in Patch #2.
> 
> Cool, I read this as all known bugs are fixed by first two patches.
> 
> > > > That said, patch-3 is NOT fixing a bug in guc -its about "if we ever have
> > > > a future racy gt-wakeref late-leak somewhere - no matter which subsystem
> > > > took it (guc is not the only subsystem taking gt wakerefs), we at
> > > > least don't hang forever in this code. Ofc, based on that, even without
> > > > patch-3 i am confident the issue is resolved anyway.
> > > > So we could just drop patch-3 is you prefer?
> > > 
> > > .. given this it does sound to me that if you are confident patch 3
> > > isn't fixing anything today that it should be dropped.
> > alan: I won't say its NOT fixing anything - i am saying it's not fixing
> > this specific bug where we have the outstanding G2H from a context destruction
> > operation that got dropped. I am okay with dropping this patch in the next rev
> > but shall post a separate stand alone version of Patch3 - because I believe
> > all other i915 subsystems that take runtime-pm's DO NOT wait forever when entering
> > suspend - but GT is doing this. This means if there ever was a bug introduced,
> > it would require serial port or ramoops collection to debug. So i think such a
> > patch, despite not fixing this specific bug will be very helpful for debuggability
> > of future issues. After all, its better to fail our suspend when we have a bug
> > rather than to hang the kernel forever.
> 
> Issue I have is that I am not seeing how it fails the suspend when nothing
> is passed out from *void* wait_suspend(gt). To me it looks the suspend just
> carries on. And if so, it sounds dangerous to allow it to do that with any
> future/unknown bugs in the suspend sequence. Existing timeout wedges the GPU
> (and all that entails). New code just says "meh I'll just carry on
> regardless".

That's a good point.
Well, current code is already bad and buggy on suspend-resume. We could get
suspend stuck forever without any clue of what happened.
At least the proposed patch add some gt_warn. But, yes, the right thing
to do should be entirely abort the suspend in case of timeout, besides the
gt_warn.

> 
> Regards,
> 
> Tvrtko
> 
