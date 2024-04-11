Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D104B8A1BBB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 19:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C1F10E978;
	Thu, 11 Apr 2024 17:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mn5a5XFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187FD10E8B3;
 Thu, 11 Apr 2024 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712856859; x=1744392859;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ht4theg5w+PVO0y2rfy/rjvmYK9heUT7/QiLbI6hXy4=;
 b=mn5a5XFHA8HVGvGgWEMvY2PMw9sfN1Ln399UYrc+9wDsSqTQ+B+wzpDJ
 ejpq94iEiuEmfeFaKFyn22kqY5TBZSESsYCYEjigKUqSScH/LbvDfWAhr
 Rlcpjs0R8kQsRTsgBr9pELR5dYpYYBJwhghjk01mhg62ZBoihGit6vx+l
 AtTBAJILg6d9OvgVuxiomEiH9b9bduL8e9X2S7zCE+gYtREhOPfz0S8L/
 LztUUCzK8Yi4s1s/AnfVSead6t67zCQfTLNCzmZBlCtwJdVSqZrVpDKqz
 K5rzSbxgoifRRH+FJWfLPxegEPWtVz5LGgpFz4emAdVyy0K66llF/JpLY g==;
X-CSE-ConnectionGUID: IGlft0A1QLe1ws3DjBfQGQ==
X-CSE-MsgGUID: 0DvdLc8dQ/iknIDJqsahmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="33681760"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="33681760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:34:14 -0700
X-CSE-ConnectionGUID: BQUd6NJCStas9B2m4VlOoQ==
X-CSE-MsgGUID: StgpC9/tQyKfRIRYw6G8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21571805"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 10:34:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 10:34:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 10:34:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 10:34:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 10:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtBUuwMzU8O56zqBIZWcr2I1t7m+fhv5vlKzAh1UQtrCn5CSaQeM7X9QJDQj1qNnzrUEWKb+MzwAK+ZeuCwHqIFeEVcKE0EJXUhkQezPrIUe6VFUL/mRFS08DbmecxP2vx8uk5HMm2oZ+BC7VTmUqFlit/Mb2zJsT3pqRzexixEZTvq4kCcexSKYRLBeGOhuaOR3Qjl+tgn3WFpOCpufKRk4yoP67koGEVvXrufKB5f6sCou9PgcD3JpLQNQ9igMqpGjo+G8t3q3dr0/afFikoSaPTu80dqacJYCLfkatF/3qR+azJ0vq7uWSi02mcLh3scpPmV46fvUIzQP418wMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkvgfIsInL8awEpe9KrNBsPlKGFCzn30IAfeS75H/Co=;
 b=JUZRovWL8s2/N/aYdZTnA4foyeDxuPkRlVk64BK7SsUDwwZaHUmY7CFXAxA+hS9/anIWIOldCxJpqOMjqbJLA42GOCDzQ8jCImcAwjGWSEq0EnZhw20yXGe+k6zBgDysWVaBFG4NelTzo0JiM7KJBzAjU/lsVGvKiRrTRAdxzbh5mzqo6bwuaphWsZRa+srXHbWc9P4kkZAAaGk5BrZX6Gi8gmdJpOdIvqkNBwQyNzhF4xyA99YtXtSrnAAF8huGEmYdlVO0aSYbAZQCk7BiwU3nmqcxbDmMC+bT6uo1BbRZlDdyRoqIgKRe2Erex+ET1DGNBARe+NkM/kMVY6KRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.23; Thu, 11 Apr
 2024 17:34:08 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 17:34:08 +0000
Date: Thu, 11 Apr 2024 12:34:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <ewvvtgcb2gonxvccws6nt6fqswoyfp4g43t5ex24vpqwtrxdzm@hgjoz5uirmxx>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffbf948-f336-43af-4baa-08dc5a4d979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBWjKu+q9IFhpGYQadeW8PVYw8htNk0WbMYhYm9CmV9h8bpK5iLqxe7pnCPZ5/MCdN6uLzUsvFSf9tmOrp1pNh45O4Fb1bXSFswJ4S0jxJY6CEbUeeQ357vrMv9c6kBms/THD0JkuzkNX4wAQTi/VQiviLfkakmGuGrm+qal5mVDwN6hs2umS5wHvncZ7HKnxu8G3jB9mkbAX4L9eY6gTHfkKFB1RqKxUo4jzBAHxkKdy+BvbzSBoYF3segPm6c7Cm5b36sDqTTulm/AxD4Og/uLvqcfz9/AB/Z9ADcBtCrCy0RSkT8PB3HXV1H9pEDvoXRJAN+gSEma8UQZfZKoYAfTunmxck9RCZ7b5WLDMAMAeOVm0WKc9S5ZBDbjipfq2yN4aTFhrUqPl3E3wtz7EWLyifEWCxYBdaKq+wMIWG4YCB/pTfKk+myXcfUWUVneWfc8HRm7tm2QDWycDAYi7HZgH+guRxYO5nN9rYnmYvAbAKsQ85VUO8mY0yeLAvbc4zWbYTDbat4BRAj23zJkQBtsrOLdNcnacaPzAw/NWFqVaNH+q3UuzEhZyNdl8viSAfp+vOuoeTwRDNWNMNCTOUsCRyqMyl5uyxDVrKhBGys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5LftVHSiE9rWVJvesuJIcB9Ol3eNJYp0Qdxbd4YVfXPQ4FnDx4AhS7Cu5Kd?=
 =?us-ascii?Q?BqVxsS6J46nLpzWHMZYAde3tbMbLlWSN9j5c1bc8OoVWI8uJ3GdZG6vaVUQi?=
 =?us-ascii?Q?KLwdAe6A9TLL69n/wHjRJPDCmtONRGxAucAaDYeS84HMcuQpKwtZdzP/n8ab?=
 =?us-ascii?Q?gF6BpDWWqzEHdDIpbXNhzcLtmb0c4e3Lkd+Rr7IQHWesXXPXgdfQIpZsW/7K?=
 =?us-ascii?Q?HEUZX6e1U+hLj0/67A9R1zRCj/jF25tu6qPiRZ/mImptYiujzZPQSVeHT0ki?=
 =?us-ascii?Q?JQoSh4Q9Rdz5AbSMScTcOX3Y8ZMofT8tkKYWDakBSDgAQPR5k5CuBiAN2LhV?=
 =?us-ascii?Q?eZcvoQLti1/uEyYp2mLH1DTJHpr7maPTF8LmQ6FejC67hARp2NZgwl+7jO5Y?=
 =?us-ascii?Q?XAW1IBtWoQpOp2QE3YtiIiuGUzYYr+84iDFzcvKi+/FEVgx3NXNk7tlqggvO?=
 =?us-ascii?Q?wG1ynY+dj66LqP4CKNLd4038yu91EGCg3nK4vZ4anvdzdUNXcUxxsWs0Eb8H?=
 =?us-ascii?Q?uTs5BDN56+lRr6la+y9T/ibKRHe8OcYNKFU3Lu8VXoO1lhPRrTU4InAh0sRH?=
 =?us-ascii?Q?161f+L5uUvp13dKiLHzMmEI1qAychkwH7mov9H/q/LQLO2q1aGLeTAYcSDQ+?=
 =?us-ascii?Q?9hBGoeVCWwH0c0SmZaf1KWySQ3mfGnGpgbWZtsxJZ+gYVqsVPz9D7EL2pOW3?=
 =?us-ascii?Q?+Oe9btN1/kNWiLXm9Bs1wcLOhMIKFKgjjSxpWWqOb+GmdQk5Z9jOqIATuE3k?=
 =?us-ascii?Q?fqMEQgeVhE6F8wHr1cfutkagPzvbDn3Wia/7r9R6RRucpauLrsewfmZKj5qk?=
 =?us-ascii?Q?WXrF+VuEkYy2TULVl7kXvtQbuMhDM79Ypiv+TwBWewsXriPSrfvGl2BjuPG8?=
 =?us-ascii?Q?oKFjAw61hTbKkxiAubtBbS6/+LXYKhTii5frCJU0rAfDjjV3cU0aiF8bwNxY?=
 =?us-ascii?Q?rHJWvM7U/F0ZZnO6SvMIb5uc9xviZp7CYPygop6cl0XLESGwf0nEiUdo5Sa8?=
 =?us-ascii?Q?xAAYh3xNVRInVUkQJ/+VrF8IES6F1RpYXbOfZ6rZuclJRTnOQHSRyoYzkHOd?=
 =?us-ascii?Q?wkSI7AUgPXOm5FWF4Ky4EjzYI9DgfpCEqb5r0NFrwyVfmB+lflVYHSZZtId0?=
 =?us-ascii?Q?GevOa3zjHes9ygksFXX1gXGAugYnCLKdINku2KcK2qGrUY+2+LnmgxsDkXPr?=
 =?us-ascii?Q?Y433S2dZbPQjK0T5eru3MePp+86r0dTuPzHX2rSOPhy5GGTpNt3IaTV9utq3?=
 =?us-ascii?Q?ywQYGCBgGbBNBxkAEKq643ubB9DpZUtwbxIId7sKkUyC8wY7YjPJL8gMLz34?=
 =?us-ascii?Q?fWKRyK7lvyQK8qIVgMrhyaxVUsnJz2sHKTgqbD2LpYnvtcJU7TsWEQQo5K4c?=
 =?us-ascii?Q?iYC+0bY4ggs9AAN9RWaEk+dzFnaEklYP+pw56sooVqvUK9WO6JumroAX+AcD?=
 =?us-ascii?Q?nHHldjCN6mWXmCzqzccWdgQNEwksyRX6U4CF6fW3m/IryJX8YVT9UpZ7hbIl?=
 =?us-ascii?Q?CtKzHCfeHZR5lwOir3gKEzSy0v/fLjQ66HKYnJF0+oh/Zq38Nd7QvfLd2Hol?=
 =?us-ascii?Q?2Dop9GrN5zhNy3UlxTFMsWdJq8anCtFZo8HI/0NZ3QgV6paoc0BkEzs25S/E?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffbf948-f336-43af-4baa-08dc5a4d979c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 17:34:08.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ut1dHdJFu291UvNppEts/nsHKP4fitmURW2qbIdIeX13pvQfK7ChqyMhPgsspURMntnyW/DRxloUonbwz6PQSXUXLSYjAzlTa7CdoKU3bGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

Hi Dave and Sima,

Please pull the drm-xe-fixes for this week targeting v6.9-rc4.

Just some trivial fixes, mostly from code analysis.  The last one
doesn't trigger any issue for now since the register is not used for
mmio. I decided to include it, because it would be a silent prereq of
any future commit making use of that register.

thanks
Lucas De Marchi

drm-xe-fixes-2024-04-11:
- Fix double display mutex initializations
- Fix u32 -> u64 implicit conversions
- Fix RING_CONTEXT_CONTROL not marked as masked
The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

   Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-04-11

for you to fetch changes up to f76646c83f028c62853c23dac49204232e903597:

   drm/xe: Label RING_CONTEXT_CONTROL as masked (2024-04-11 08:41:54 -0500)

----------------------------------------------------------------
- Fix double display mutex initializations
- Fix u32 -> u64 implicit conversions
- Fix RING_CONTEXT_CONTROL not marked as masked

----------------------------------------------------------------
Ashutosh Dixit (1):
       drm/xe: Label RING_CONTEXT_CONTROL as masked

Himal Prasad Ghimiray (1):
       drm/xe/xe_migrate: Cast to output precision before multiplying operands

Karthik Poosa (1):
       drm/xe/hwmon: Cast result to output precision on left shift of operand

Lucas De Marchi (1):
       drm/xe/display: Fix double mutex initialization

  drivers/gpu/drm/xe/display/xe_display.c  | 5 -----
  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
  drivers/gpu/drm/xe/xe_hwmon.c            | 4 ++--
  drivers/gpu/drm/xe/xe_lrc.c              | 5 ++---
  drivers/gpu/drm/xe/xe_migrate.c          | 8 ++++----
  5 files changed, 9 insertions(+), 15 deletions(-)
