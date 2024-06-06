Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D48FF2AD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF21F10E293;
	Thu,  6 Jun 2024 16:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2dbcnto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036510E293
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717691940; x=1749227940;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EMLUGu0tDQp/fOI3I7M5Xbn0IM/ktNPz5vsJA8coVcE=;
 b=Y2dbcntotC8Rh3x/UHFlMS2veFNjDBzQdtwVU7t3AzJhfBlHZstnAZ7Z
 zan9gSQdnMi3Dzpo9yRTOHGR3RWJFwUd4M7NhuS/rQD3+3MDZ9QgL+DL+
 yF9mDPe/aSMNij+6YKVRuqvOrgAmZnz/DS/3fMH0NqT4dZnAcVYjVYArB
 RylnwR9CdYxRF/PalRkAN8DKnCMQbu3Kj+xPzfS68taZqrKb7yGyPCPMk
 GkvaTgwsf3grhrY3N8JjHZJByxIFHpDvsfO/uyw9X4NgzGl59fF7TE8Az
 hMnRyVRdoFZrIbY8uVI3gTnLrN4S8YxAxfZZbJ+w8x7bWiuJ5GDILOa/6 w==;
X-CSE-ConnectionGUID: rNBcZG+cTEKnGaMJ23d+RQ==
X-CSE-MsgGUID: dHWfQknSRtGqIhI2UaxeAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14530945"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14530945"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:39:00 -0700
X-CSE-ConnectionGUID: QZUjZ4RTTyC3j0y4eECvUQ==
X-CSE-MsgGUID: tFMxXC6xSBmcKTUQcvGJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38474285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:39:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:38:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:38:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjbxl2/yuPOPvV0xzv17EJVGH0rLxJKjSb0wG6Ez2/wRzxKpkilp4ueUa/acHD1irkKni8ovQAUMvZOxnfHSnnNzOjOg5MMnYI8UGrtv4Ip0hTU9agqpZLcJJFEPpx78MuU7N0fmRPo92NNnSiN0yrv76/NT31h1l4+g+IM7ijcR40HBJFm9315oeIpeT4rDjADfLWm6UjHPSeEXk2chs0ehuKxZZrZFBjIG5TwWzAgOyR2TQhrkTNmgATsIRicgLZ2wsdcu78xctUa+SSf5iDuOFC9jIaUnisoPZ/pjvtPqnHZ/uGLeLp2PI+jLvbIBKUmf7mLCEpx/iQrkePmVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkFZbIC0kWcdlEsjkJTmGrd8688xk0IeVuJEOurLS3U=;
 b=ZnbAY6Eq4sTxg5gLj7Ts50pR8i3MHUGCTfmJq1eaTsvZJySxoZYozpK085ZauvUbvwQsk4wbdxhwq3RRhyyl2BWEDRZF1FOgEnJHBUkhHlKgJBZ8oNEY2qcu+fQ6Xv56PqD9wQbRY5YdTatyua/gCuCfO9TAishUPOkLxLNRppaUhRdh0IXCmiBFwhkOXzFc/vVOZPzBBhzDMW2+4GXtSme+RJOZ3HMcL5YHr0sP5LtpW+vmpwewkXM3bp62TU04mpf8NNcytACDg5+dH3Add/B4cDscDtTlj2LJLr8vW5DI7WzuzkATCV8W1ToSVKYxGpCfmdrfZ8IVmlsWQk0eaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.31; Thu, 6 Jun 2024 16:38:56 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 16:38:56 +0000
Date: Thu, 6 Jun 2024 16:38:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <alexander.deucher@amd.com>, <ltuikov89@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
Subject: Re: [PATCH v3 1/4] drm/sched: store the drm_device instead of the
 device
Message-ID: <ZmHl6vOuibYSeUv3@DUT025-TGLU.fm.intel.com>
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
 <6f4e7b5f-7af8-4245-a927-37ebc2789868@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f4e7b5f-7af8-4245-a927-37ebc2789868@amd.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b38bd2-0e71-40bf-6178-08dc864728a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005|7416005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sSoN8hsH+OGJ3cAdka486vWoLiHrUwuxzgQY3NPdAegHOjFhROusagQyKs?=
 =?iso-8859-1?Q?U4aUqOEjoh8mn7gPDS0/6y2Rp0du2jHvtSVRq9kzcIbwBkjtz7AFOzfu8v?=
 =?iso-8859-1?Q?llbmIRvuQUn2R4eTt9KR1DSAm0Z/LzHagHSjSUz36pez1nIOdt3Av+N6GK?=
 =?iso-8859-1?Q?xPs6jk61Tvt+IXcLDh4IXecjG7UXSysjgzfVXAuT1LDIB1vRjudV3OGCqS?=
 =?iso-8859-1?Q?IMHBkkieBHbNnU3XOv1FYg2hGPkbUOoJeYduTehcn3ry4Ace+G1JelNUDs?=
 =?iso-8859-1?Q?VoZd8kVHVhr2CT+vdGP/l8KjC1hHUgo4C6jLnRf5wLFY4gzs+Jc50u2W14?=
 =?iso-8859-1?Q?vp8MFG+S7CCDVWVc/6PUmAf//5NAnG+Nk2ECR0wmQm/51W+mUjYQ/I5Ncl?=
 =?iso-8859-1?Q?Dx92aVYK2PPAPvwGMkUm79QvXhOGUMDWOpnqavH8Zk/x5phg3tCb3Yla0g?=
 =?iso-8859-1?Q?ZzNZr2Z0pkgFA0OeyoHeLGN2M29Lzgl00HcDWHkF8RSiqCO6G63p29vFVv?=
 =?iso-8859-1?Q?I+JPdiEoWEuzz3RScqbv6s/CsAw6sMwWthgvodMgLDe2P+uK2K7y8lVfcF?=
 =?iso-8859-1?Q?r3+t5ZzWhR/iS3YY3rCWMzb7hIcf7cnuaiDih5hMAXFeuNynYdCpQY+sEe?=
 =?iso-8859-1?Q?V6CCsaw41b3W+CyPtePN+9xaIvyH++j3gQ7H18/hN163qLcx9iyZIvHOvD?=
 =?iso-8859-1?Q?OMV5UfPjoChIONum374fliY3E37GDukNJ256FakbjclUbGJ6/T00Ox/41n?=
 =?iso-8859-1?Q?AppRjah4bWdgp7HvRsdQYMVsDLHRXNPXELNsuAHWz7TP9dRSM2piIB6nTJ?=
 =?iso-8859-1?Q?CJR0TN87AGnbEfWHSVd6+WmUmA4nJGGwEhVlyZyxJGMEnQWIUj73Ft3sED?=
 =?iso-8859-1?Q?2eZMnnsi+s+oxqAea1sQZZsKjIAzOsF/9SrcCoagZNYwmUl40/2UoWaB5s?=
 =?iso-8859-1?Q?b0fnfPaPAdykzNdBDuZXcDhY8AG70LMuClwKKnz57RT39iJMishosSLFPO?=
 =?iso-8859-1?Q?oVRQIq5nwz+MQMndp0ZFj02kggQrKFNLJ+oy8lMflmBx1Jnbczw2Kk8tBS?=
 =?iso-8859-1?Q?v9DwAtbU3zi34x2F9BJvJwRaYj3q/WF6NLtEac6M+MKa5QowTyS3dVg5e2?=
 =?iso-8859-1?Q?GbJyltijAPFS1aLt5wzdZdkSpAgbwAf6bvlcKEHuLV+9cllhvrUyekwc27?=
 =?iso-8859-1?Q?7B3r3eeQznv/CTWjAykc0mR6xm/ehQzYVD/a+hVJI8HDOVAgNMOFcBub4g?=
 =?iso-8859-1?Q?UoqS1cMBoMMD3VEZlmL3HG6xM2pDG47R+L7cehS95VaKOgVZtaAKcoH8nt?=
 =?iso-8859-1?Q?Zm5GulzuiNPeNYIo2biZzOtnTbjcaNDrYT6KHagTW0qCiVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?acDMmHFtT2WhZnxxaIbOZOvJcTMajAyerIFkoVoReun2z8IlTYQbkuBPmH?=
 =?iso-8859-1?Q?+GCZNJwSu/Vpf8JJs64KbNaYKhqpmYbqG3RUcv/EsofAj/BGJUGZl8c/G8?=
 =?iso-8859-1?Q?N+jk1Y8LUpqXcwIV0P/EwwzxxokCfgUVsWUW61qp5N9yKKqZevIPPtSyzw?=
 =?iso-8859-1?Q?wRevz+ITlbN63dSh12ipLjA44NP6AvTet/5A3bC3JTUfQBr8A5gbG3pl6t?=
 =?iso-8859-1?Q?o37CsxQawZihZJLHmpc8WoxTwstmVGYPRLkEp49JU2YS5wcFzus6rOjVVD?=
 =?iso-8859-1?Q?uv/gSTLCAPPiqb8HWuM9g6ohJ2r/pmgtgRH9cuThs9obB11cPERvaQsKqM?=
 =?iso-8859-1?Q?VKE45Wozg3lRBKsq+YW0Y38aQW/BdCdkLlwRG3YyhgvmrKsRTPzDHXWAbe?=
 =?iso-8859-1?Q?DW86YYObz+klwyhPP7nvfrMq0FUIwbt+Vmz1Y1VLQeGHJD27Jathlb1+je?=
 =?iso-8859-1?Q?+a+0xGFcq+2rCND69WIFTD6Wx4oXxcn0TR6XJn2ZFMQZAK5/SwrmC0s8sl?=
 =?iso-8859-1?Q?717vI/AScORaobcsTPxSBnbnimEwqJEfvcKxhKDHuMfkX3kr5IonYx5UHc?=
 =?iso-8859-1?Q?li9I7XYZkURE/LpnyNwNxyfJlIWIY5kLn2LfdbHFCVQOIGM8XhORbpal6c?=
 =?iso-8859-1?Q?ljHiWd4V1mf+Xeqc6EPiFK8PTCjnh2uF0o1PQO4Q9dXi2SrG292TJwl4En?=
 =?iso-8859-1?Q?zx1RKPuAi0/+dLzRT/MfrZKoH96lfbE3jbOoB06BIA6OgGDcgLvb4XRHrz?=
 =?iso-8859-1?Q?NRsI2jR8eNmN6vqoToFCPX2HJ99Dwf1gH6U+C35IOu+Fme4c0OFKpFCmLz?=
 =?iso-8859-1?Q?qY45t1pOfnlS4O9sR7Y7N4yU0ZiMV3aBOhC6J/bp3OSVllo4sAlalosMtL?=
 =?iso-8859-1?Q?Ui8F5IhP1OkJDVUvzNP67YyFv/njDwBeNSskR3lAed6H1IZ7DmYTOvn3lb?=
 =?iso-8859-1?Q?mi78NqHzPCGht/Y1NqDUtTgTDSXWs0y5/WO54DyL6GfmbSWioYtQ9DtnRH?=
 =?iso-8859-1?Q?looKpY1eVPGBuptSogf8n7j/CHQregGWsTKfR5VPD0vgRNWYeLVwm+dkDN?=
 =?iso-8859-1?Q?b9A2dFx06DILn1F4E23ld807Vs2et5fu49wd3ktejMy96i0PIYarQsEy0z?=
 =?iso-8859-1?Q?wJVVX7g3FLCV/Xc7Mgf7tLkQDDWHsNjacVyBlhN47qZwsZ/fkGENqqsiBM?=
 =?iso-8859-1?Q?LkUOoK0zhYgqnTRLzjaK7lpOsCednxQSL2/t9mixGBNZlpkZUcelo35QuB?=
 =?iso-8859-1?Q?U21f9LKjany99MnVwoOsC26JDJTNYdUrKLQYthmK5wJfXDkEpMyjfxfAaQ?=
 =?iso-8859-1?Q?jZ/vZS5rX1QlxZU+GkYMiKBQkEbjO9Az8UUwgb2jWkR8zxp+Hgs/aDPSvK?=
 =?iso-8859-1?Q?p+gVTA7ilt2lajcf+55pDbd0jO2xpshAREYNlG/mPos14YNtX5VQ/V6In8?=
 =?iso-8859-1?Q?LspvSXWXWF/c+lIhz6NXoI9oeccfeVaMJtP1W0HFQowxvi2H5VQMfRzWV6?=
 =?iso-8859-1?Q?Gqd3O/2W9wkBaioERn7VvDh393fYh2bE5Ub6MR31LMZpBQlK52ZuVA5mIi?=
 =?iso-8859-1?Q?cmvsbfX+iixt0i+s2s64AdiuJ8zwo6smdpTvRhuR5UGFthObO8zTYZSLuQ?=
 =?iso-8859-1?Q?AkpO9USb9kuKR9W7GDfftsym4nEWXj/Ewc+YFWPTSAbZVofrocTUPONA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b38bd2-0e71-40bf-6178-08dc864728a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:38:56.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpPB/VPYEmGE3peiZgton0TNPyX/lHBwXRyWCbC+/k6+Snbcy2XPX+mbRScEksmREXTNoPjy4fyGYjl1bsvxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On Thu, Jun 06, 2024 at 03:18:14PM +0200, Christian König wrote:
> Am 06.06.24 um 15:06 schrieb Pierre-Eric Pelloux-Prayer:
> > When tracing is enabled, being able to identify which device is sending
> > events is useful; for this the next commit will extend events to include
> > drm_device::primary::index.
> 
> That sounds like a rather bad idea since the primary index is really just an
> arbitrary number and not defined for all devices.
> 
> Why not use the device name instead? This way you don't need this change in
> the first place.
> 

+1.

Matt

> Regards,
> Christian.
> 
> > 
> > Since the device member is only used in the drm_* log macros, we can
> > replace it by a drm_device pointer.
> > 
> > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  2 +-
> >   drivers/gpu/drm/imagination/pvr_queue.c    |  2 +-
> >   drivers/gpu/drm/lima/lima_sched.c          |  2 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_sched.c    |  2 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  2 +-
> >   drivers/gpu/drm/panthor/panthor_mmu.c      |  2 +-
> >   drivers/gpu/drm/panthor/panthor_sched.c    |  2 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c   |  2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c     | 26 +++++++++++-----------
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 12 +++++-----
> >   drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  2 +-
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h      |  2 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c         |  2 +-
> >   include/drm/gpu_scheduler.h                |  4 ++--
> >   17 files changed, 35 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 932dc93b2e63..7f2a68ad8034 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2738,7 +2738,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   				   ring->num_hw_submission, 0,
> >   				   timeout, adev->reset_domain->wq,
> >   				   ring->sched_score, ring->name,
> > -				   adev->dev);
> > +				   &adev->ddev);
> >   		if (r) {
> >   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> >   				  ring->name);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index c4b04b0dee16..c4345b68a51f 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -138,7 +138,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >   			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), gpu->drm);
> >   	if (ret)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> > index 5ed9c98fb599..cdbb6c01e952 100644
> > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > @@ -1287,7 +1287,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
> >   			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
> >   			     msecs_to_jiffies(500),
> >   			     pvr_dev->sched_wq, NULL, "pvr-queue",
> > -			     pvr_dev->base.dev);
> > +			     &pvr_dev->base);
> >   	if (err)
> >   		goto err_release_ufo;
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index bbf3f8feab94..db6ee7650468 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -526,7 +526,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >   			      1,
> >   			      lima_job_hang_limit,
> >   			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, pipe->ldev->ddev);
> >   }
> >   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 9d6655f96f0c..3a4b3816f2c9 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -101,7 +101,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     num_hw_submissions, 0, sched_timeout,
> > -			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > +			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev);
> >   	if (ret) {
> >   		goto fail;
> >   	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 32fa2e273965..386839bed8a2 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -419,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
> >   	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> >   			     NOUVEAU_SCHED_PRIORITY_COUNT,
> >   			     credit_limit, 0, job_hang_limit,
> > -			     NULL, NULL, "nouveau_sched", drm->dev->dev);
> > +			     NULL, NULL, "nouveau_sched", drm->dev);
> >   	if (ret)
> >   		goto fail_wq;
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index a61ef0af9a4e..28c7680a8dbf 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -875,7 +875,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >   				     nentries, 0,
> >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", pfdev->ddev);
> >   		if (ret) {
> >   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >   			goto err_sched;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index fa0a002b1016..b9c5b500b7d1 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -2293,7 +2293,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
> >   	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->mmu->vm.wq,
> >   			     1, 1, 0,
> >   			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> > -			     "panthor-vm-bind", ptdev->base.dev);
> > +			     "panthor-vm-bind", &ptdev->base);
> >   	if (ret)
> >   		goto err_free_io_pgtable;
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 79ffcbc41d78..47e52f61571b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3043,7 +3043,7 @@ group_create_queue(struct panthor_group *group,
> >   			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
> >   			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   			     group->ptdev->reset.wq,
> > -			     NULL, "panthor-queue", group->ptdev->base.dev);
> > +			     NULL, "panthor-queue", &group->ptdev->base);
> >   	if (ret)
> >   		goto err_free_queue;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 58c8161289fe..194798b9ce09 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >   		 * the lowest priority available.
> >   		 */
> >   		if (entity->priority >= sched_list[0]->num_rqs) {
> > -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
> > +			drm_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
> >   				entity->priority, sched_list[0]->num_rqs);
> >   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> >   						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7e90c9f95611..74a2fe51e653 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
> >   {
> >   	u32 credits;
> > -	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
> > -					      atomic_read(&sched->credit_count),
> > -					      &credits));
> > +	drm_WARN_ON(sched->dev, check_sub_overflow(sched->credit_limit,
> > +						  atomic_read(&sched->credit_count),
> > +						  &credits));
> >   	return credits;
> >   }
> > @@ -130,14 +130,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> >   	if (sched->ops->update_job_credits) {
> >   		s_job->credits = sched->ops->update_job_credits(s_job);
> > -		drm_WARN(sched, !s_job->credits,
> > +		drm_WARN(sched->dev, !s_job->credits,
> >   			 "Jobs with zero credits bypass job-flow control.\n");
> >   	}
> >   	/* If a job exceeds the credit limit, truncate it to the credit limit
> >   	 * itself to guarantee forward progress.
> >   	 */
> > -	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
> > +	if (drm_WARN(sched->dev, s_job->credits > sched->credit_limit,
> >   		     "Jobs may not exceed the credit limit, truncate.\n"))
> >   		s_job->credits = sched->credit_limit;
> > @@ -701,7 +701,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >   			if (r == -ENOENT)
> >   				drm_sched_job_done(s_job, fence->error);
> >   			else if (r)
> > -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > +				DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n",
> >   					  r);
> >   		} else
> >   			drm_sched_job_done(s_job, -ECANCELED);
> > @@ -797,7 +797,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >   		 * or worse--a blank screen--leave a trail in the
> >   		 * logs, so this can be debugged easier.
> >   		 */
> > -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
> > +		drm_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
> >   		return -ENOENT;
> >   	}
> > @@ -1215,7 +1215,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >   		if (r == -ENOENT)
> >   			drm_sched_job_done(sched_job, fence->error);
> >   		else if (r)
> > -			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > +			DRM_DEV_ERROR(sched->dev->dev, "fence add callback failed (%d)\n", r);
> >   	} else {
> >   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> >   				   PTR_ERR(fence) : 0);
> > @@ -1240,7 +1240,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >    *		used
> >    * @score: optional score atomic shared with other schedulers
> >    * @name: name used for debugging
> > - * @dev: target &struct device
> > + * @dev: target &struct drm_device
> >    *
> >    * Return 0 on success, otherwise error code.
> >    */
> > @@ -1249,7 +1249,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *submit_wq,
> >   		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name, struct drm_device *dev)
> >   {
> >   	int i;
> > @@ -1265,7 +1265,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> >   		/* This is a gross violation--tell drivers what the  problem is.
> >   		 */
> > -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> > +		drm_err(dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> >   			__func__);
> >   		return -EINVAL;
> >   	} else if (sched->sched_rq) {
> > @@ -1273,7 +1273,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		 * fine-tune their DRM calling order, and return all
> >   		 * is good.
> >   		 */
> > -		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
> > +		drm_warn(dev, "%s: scheduler already initialized!\n", __func__);
> >   		return 0;
> >   	}
> > @@ -1322,7 +1322,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   Out_check_own:
> >   	if (sched->own_submit_wq)
> >   		destroy_workqueue(sched->submit_wq);
> > -	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
> > +	drm_err(dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
> >   	return -ENOMEM;
> >   }
> >   EXPORT_SYMBOL(drm_sched_init);
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 7cd8c335cd9b..73383b6ef9bb 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -740,7 +740,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", &v3d->drm);
> >   	if (ret)
> >   		return ret;
> > @@ -749,7 +749,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     NULL, "v3d_render", &v3d->drm);
> >   	if (ret)
> >   		goto fail;
> > @@ -758,7 +758,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", &v3d->drm);
> >   	if (ret)
> >   		goto fail;
> > @@ -768,7 +768,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     DRM_SCHED_PRIORITY_COUNT,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", &v3d->drm);
> >   		if (ret)
> >   			goto fail;
> > @@ -777,7 +777,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     DRM_SCHED_PRIORITY_COUNT,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean", &v3d->drm);
> >   		if (ret)
> >   			goto fail;
> >   	}
> > @@ -787,7 +787,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     DRM_SCHED_PRIORITY_COUNT,
> >   			     1, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_cpu", v3d->drm.dev);
> > +			     NULL, "v3d_cpu", &v3d->drm);
> >   	if (ret)
> >   		goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index dece2785933c..dc81e9f39727 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -336,7 +336,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
> >   			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> >   			     NULL, NULL, q->hwe->name,
> > -			     gt_to_xe(q->gt)->drm.dev);
> > +			     &gt_to_xe(q->gt)->drm);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index e4ad1d6ce1d5..66d36cac82a0 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -61,7 +61,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> >   		  uint32_t hw_submission, unsigned hang_limit,
> >   		  long timeout, struct workqueue_struct *timeout_wq,
> >   		  atomic_t *score, const char *name,
> > -		  struct device *dev)
> > +		  struct drm_device *dev)
> >   {
> >   	sched->ops = xe_ops;
> >   	INIT_LIST_HEAD(&sched->msgs);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 10c6bb9c9386..9a75457813f2 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -16,7 +16,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> >   		  uint32_t hw_submission, unsigned hang_limit,
> >   		  long timeout, struct workqueue_struct *timeout_wq,
> >   		  atomic_t *score, const char *name,
> > -		  struct device *dev);
> > +		  struct drm_device *dev);
> >   void xe_sched_fini(struct xe_gpu_scheduler *sched);
> >   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e4e3658e6a13..b9c114f2c715 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1208,7 +1208,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >   			    get_submit_wq(guc),
> >   			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
> >   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > -			    q->name, gt_to_xe(q->gt)->drm.dev);
> > +			    q->name, &gt_to_xe(q->gt)->drm);
> >   	if (err)
> >   		goto err_free;
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 5acc64954a88..0ba8716ec069 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -539,7 +539,7 @@ struct drm_gpu_scheduler {
> >   	bool				free_guilty;
> >   	bool				pause_submit;
> >   	bool				own_submit_wq;
> > -	struct device			*dev;
> > +	struct drm_device		*dev;
> >   };
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> > @@ -547,7 +547,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *submit_wq,
> >   		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name, struct drm_device *dev);
> >   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >   int drm_sched_job_init(struct drm_sched_job *job,
> 
