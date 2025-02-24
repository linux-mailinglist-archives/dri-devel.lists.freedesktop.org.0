Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F668A427D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5AD10E448;
	Mon, 24 Feb 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+JRNoGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615D410E448
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740414301; x=1771950301;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S0f0SeA9//9d3397+ZbQns9AgShcrngiWgCKUiXQlRo=;
 b=Z+JRNoGrSQLcy2FOmB6dPk8YN6d+sAPt0Et9I8vUbwhdrI0fVe+qvRQ8
 lc/4ytnMUgPO6eCRST6Y2Y9SLqONuZOUx7Sx8XBWpEzwGg2RCg3MW5vAs
 armrgEBhqXEWV5rA8QBXgyiN6gBVe7+phwnRMqdeoirjfgT+aK6tWMuY0
 xtFnQX6ngy4I36FI7r5gibmz/s19g6SuJayVg/LkcG/hWRQGt7KEq7N3g
 +4CwIax/UV6yduc2snknkA4ftpJNITrQnH7dQwEzpDCDVVtAMJJVMUaZF
 gYk2fsWx4ZW1F4e0DMNpNdhgC1j7DeRi8oYPYHyKsaXlCrUL4TWK0xwF9 w==;
X-CSE-ConnectionGUID: 5alyHmLBQsydpRtoAPXaFw==
X-CSE-MsgGUID: ABgT+IgCQZCYg+6mlZDQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44004850"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="44004850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:24:44 -0800
X-CSE-ConnectionGUID: cCT8yrVIQoSi/5QVj2QHqw==
X-CSE-MsgGUID: xTj+zMUaS3K8Fbi+8F/j8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116732378"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:24:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 08:24:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 08:24:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 08:24:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOfYi30oCeF6eKQc4YI/50N7aPxKMGILBqQG+0P/E/fGmL8AOcBw5ltTBe9s2KTooS4vRrpjda1ehU+OzRr7NYVNwgpls4UjMW3L7zmCdiH9hJ5TNE9AqzToupvLKhJ3KjOhCscproFLZnbhY1ZVZM4EtI1WYwiFypkA/u++PrCB42Kf9NwKAQzmKLbUz3aZydB2K7wZ4LJvocCsa2hWGAf2lfoqZi4RCC41yXTi0FzPlSqdLN9IzxNvclEzZHxjZAS1971oThj+VN3+PDIpeBxMFH11g6PJdCPeyy73+yY8qrVNTkMWdRtoN46PeKR77F9+2QLyPpeelaDor8KiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5JBE7c7pJyr8DsQLtClBIC4uQZTkr1xtC02ELEv6ys=;
 b=DjeUiVAGly7Zpo/GmEvWe5p6F60xZep7CLS6W0L0NP9Cl7W05axScLlSjYlvTaZhdtEugXvX/P+GSTnEZJ2O1RlRS44WElZBkhFa61XBPeo6UDPRanskI/7SBtBnRcZcyVCx4R5ygQooNbu/vj5FSa+VOK60CKpskdu7NR6OlkKbF37Dw1ZLYOxef4dEEaBezzbzfItn1HojYbg2jKR/8yopXbY7sTAYqo4c76HG0/jKl90a1+55acxrAvMxxQPxFG0Fh45gVndv0t8dmHhk9/OSNaZKxl0wDUuWXePnqVQDSnPdFYae+1jFax4rpIbJW1wsYPSU2IKW11LSvrehzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 16:24:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:24:08 +0000
Date: Mon, 24 Feb 2025 08:25:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <phasta@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] drm/sched: Adjust outdated docu for run_job()
Message-ID: <Z7ydaE4JmNcvzjJw@lstrano-desk.jf.intel.com>
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-4-phasta@kernel.org>
 <12c53d41-21c4-443d-a572-fd22c3cc56ad@igalia.com>
 <1457e985f88e02cd04b2152d2468a65b7a513e63.camel@mailbox.org>
 <cfef8bd7-f335-4796-9d4f-93197bb3fc2d@igalia.com>
 <Z7yFpZMCFINhEht7@cassiopeiae>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7yFpZMCFINhEht7@cassiopeiae>
X-ClientProxiedBy: MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 561a9e57-2abf-4024-5bad-08dd54efaa15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XqIauXiAv1DO9Uk5Prev7CpM7Ut/2qCfFwxuyJaaDNeu5zL/6JJ1Nf4mMM?=
 =?iso-8859-1?Q?mltrZ6XHb2WIivI7pACtBKeI1d0qJWbMRtJyZRIh0yN5DA4u2q4pIE7Ywh?=
 =?iso-8859-1?Q?UA7djx82JKtqmgh6J/OvSZwklkeGZ77AKkEmhK3ZKMeOi9muJ8TDh/HJIz?=
 =?iso-8859-1?Q?hzLyDOg56LKdIz4QrIuLJgCT+hylAQkrrtiWzjw6EzamRUsm6U9prsB5wp?=
 =?iso-8859-1?Q?CD6oyr3pemI7w+XDCxu1yMWFVlD1oStN68LJyY3+pWJzRzp3qRxlcU8pF1?=
 =?iso-8859-1?Q?tPfJIx24N1ACQ+zGJXXaBGXa5qzFmq9fn2AnTjQrbZ1gHEhPb3ranGUMSW?=
 =?iso-8859-1?Q?qM5LFd3Awu+CqQo94i/almcEtW+6wg9UG9LFMQWGU+IBFqS2hHemQ6DjBc?=
 =?iso-8859-1?Q?ZL8XA6AZYJiEBcy9B6z1X/AVW/FvNn/nhByyBlv/gtWwz6RllgY+QSWStD?=
 =?iso-8859-1?Q?amE5n6OJGREMz6M+irY1Nu+kIlq6s+rbDH3D9EkongcBNOgQi4X0nkJOHC?=
 =?iso-8859-1?Q?KSPbJSeeoEEQZO68Xdye0J9LBrif19PsMFNTEHhScFXAXrepbzenfo29px?=
 =?iso-8859-1?Q?3yiwpDsoOAEdXR59IyNVgjVhH/in1sc1uvMTYs1Bqx9eLHII/AkTdKwv0n?=
 =?iso-8859-1?Q?v10TjX87rJeFb0zZScy8hriGBJOZ0MMGwx+zRueumjoeMoWEqoDciVFk2M?=
 =?iso-8859-1?Q?LAQMmt72s2cQZrf6c/gRBjWU8akQadDy5iu+CUT8HzE2S3SonN8dPbuibj?=
 =?iso-8859-1?Q?dYm27R7oCOfl/qboPXAL1BxiRxy645aZRZmxn/LbtNf6ifsbHD4tivMWrk?=
 =?iso-8859-1?Q?JUy8Paa0nA6QXut0cJGyyLheugdSHzQRETnl2tLE5ObWIQqXtLmy/AyCZw?=
 =?iso-8859-1?Q?GbhRYD109ejRxT4DgQvog93iVRNlc4mNdGArsbdNJp3n42VsIqAub0FxL2?=
 =?iso-8859-1?Q?Z3139fi58hVJwOMPCGopK5j6Do9l4lKNF5prs5jasFlyE9ZREpDyerJT+2?=
 =?iso-8859-1?Q?B719d4bZkcq3EobZxW9arr916V+yYHC04AOw72ZKTYewRcjIDUvtS7tPjN?=
 =?iso-8859-1?Q?dX74hTi5D21WRm4fk4GzMeRJ7orofOqir/C7ZAnMbuTLjgmwmeGdxolcrk?=
 =?iso-8859-1?Q?IRzMmf5MbbWDC8+UP5smYAMlduW7F/DXeKGx5x4KhVOv7rCGzLjg55TB5Q?=
 =?iso-8859-1?Q?zj3abHn6ayGvbdFUXBMZ4oScCtSL/D2ybPF8GyiZ8Ik5T3AuLmLOHk9PC7?=
 =?iso-8859-1?Q?5HrygRpNCcbo41X3uNQbt+irfkujUlkWR6PLb6qTN8ojiPMDkxPTNaEfiV?=
 =?iso-8859-1?Q?rkCmLfYNCk+eN+moHyqkXSTqp/AbTbABVGY5VLGSUcipJFsbd/zKQPAz4N?=
 =?iso-8859-1?Q?eDVSIxlBVQthWMq2OurX752tPafW/OvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gtvOgVb5ScrLZ9osMYxMcmjJNkuwl7y/Fp4CufiQ8Cr+okfA1Mh8lFAy+8?=
 =?iso-8859-1?Q?3Q4vMSQ0plBTfRCjOFo/vGnhz9uHqrS0pCQvGodEU7Q/ZIzSnlQ/pUihwb?=
 =?iso-8859-1?Q?FQLE0CG2sDVVBkLOBJDZLr218fJCCV6KpB6lZVMizDJpnYeweEooYr1I38?=
 =?iso-8859-1?Q?TIPauZGm/cOeSd6JfCvD2PWQPY85IbC1EcR9jVqWeF1lUaJWzArWHN2IXA?=
 =?iso-8859-1?Q?K8tbAFyogAarQCTuJhzSGVuiVsTDSEOshmRxlxsF9/E4ZyQH2Kwg1yGGUI?=
 =?iso-8859-1?Q?2Q4esn9VusOlewLU6WL4/p567Kwvzk4giutj80C8/9EJJGVkfjkEGeAuy8?=
 =?iso-8859-1?Q?djHip/31t2y2S3Y9TyNOb4TZ5IQTL6moQsIOsl75t9KCN/ZNUNXnPintCA?=
 =?iso-8859-1?Q?wJDSK0z3RJ8KdweoXIXrWHXzc6pLjtH2oZ09vYnynBNOrnxMCQtEOomF9x?=
 =?iso-8859-1?Q?3xv3g3gF3SaLlofqAKMuUl3jA0/PyrJfangVmnW+CELyBBOe+Y/vf8N84s?=
 =?iso-8859-1?Q?XlECmNF4esW+rvlYM9VqYdP3ASf29IcwkNnqlu8xyqsaAOdfnp9Hhwle93?=
 =?iso-8859-1?Q?StEqEw1dl/3urZyOltYMj00sJG+I+dBEr+Pzgh3a4w5HpHB2T3SBRrguau?=
 =?iso-8859-1?Q?vmI5SgU4WXEJoz82HCT0I7ZqIfi+zvlyUmsFyosiORBR5aeowHkj7Y1wWt?=
 =?iso-8859-1?Q?5kkTdlv9vmuP75fPkX7wmNz6G4Qf7lsVrkFyVZb3ZwqLj1FLZSUSaVCYqG?=
 =?iso-8859-1?Q?2a3885h3aVIEMUJxx8lVORKNHYGIQ35K5qxZp+oC1wkV5zkGBgM4vkzDx1?=
 =?iso-8859-1?Q?zMt71KYF3lET/YqdUXHeWvVhrz3s4QPkdv4U6tBn7Zya6FYfd8WH9qmzIb?=
 =?iso-8859-1?Q?qHfVpdau/jdDnE07OhmGSMwbs70hUS8Yg0N9BPXniESEG3b23bHkW4ChLT?=
 =?iso-8859-1?Q?7rVC9p7PpYFe/Z8Hl6Zf0EU0dIZMZHsIkr2Io1e9wWcERJGuZ7dvxEDx+S?=
 =?iso-8859-1?Q?+BCf/sAw9yyLpgqzF++4FHKpAhSj8Jg13F7Y0QZMMz9KHSWn59S3cP6zWp?=
 =?iso-8859-1?Q?cIrON+Fa8JWIDH5sxtbnLleJCo1V2o/Al3m1IxBJyYFtkYjJYEVwpqahVU?=
 =?iso-8859-1?Q?Y7dHAeWAtM47PeQFHQWGROCslzpIiDmpj9b8Xh/hmmZuUaAt3MGbcjcJNV?=
 =?iso-8859-1?Q?kjahhZG7g8g39FIjSjqvtfsnGruFIKc04X4w+XskDxLR4+D11gJ1cnV4Ma?=
 =?iso-8859-1?Q?UIbdKmBTt8n8zbxhZ6wK7nqN8Zu9eQJR6m+PUPfeyJ7N7aTece3+4OJygJ?=
 =?iso-8859-1?Q?DJ5J/AoHrS5m6fpqViObVJi6Cuzp3Kops+2m4XlMZuSaoj5qo3XrR2tNi/?=
 =?iso-8859-1?Q?XVoHMVW4Ms3Z/0pVxIW59yEFEGjr6i/uTI2hkkc/vsKVPVu9ZLE0q4SdPp?=
 =?iso-8859-1?Q?oXGmFxW0P22WCQJ+nm+ADZmzPJmp7XABDnQz2B3ciXzBef3qNfxbhBXxqY?=
 =?iso-8859-1?Q?WLwzSd4mvbZtHdCbl75xPJbn7IN//8OKLr3Bzinwy4TSDbnva2udjkBLL4?=
 =?iso-8859-1?Q?ZeYFkpB73ne4Y9XVSQbMi69aCir+243h29kEgqZkNui4NNA/dm+ESLHYaa?=
 =?iso-8859-1?Q?D9ptlTUFOnbBrL9iW6a1Het7qEr5LwUdbmDrZV5AJ5AZbFRM1F1g/tqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 561a9e57-2abf-4024-5bad-08dd54efaa15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 16:24:08.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owtEeJMYhhCdL8MFIPxtJuKAMLCTkGmntEcWG19jxvDO0Tykvc+CWMUue8kr1jbTtq4DZcavSuhICmi850AzlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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

On Mon, Feb 24, 2025 at 03:43:49PM +0100, Danilo Krummrich wrote:
> On Mon, Feb 24, 2025 at 10:29:26AM -0300, Maíra Canal wrote:
> > On 20/02/25 12:28, Philipp Stanner wrote:
> > > On Thu, 2025-02-20 at 10:28 -0300, Maíra Canal wrote:
> > > > Would it be possible to add a comment that `run_job()` must check if
> > > > `s_fence->finished.error` is different than 0? If you increase the
> > > > karma
> > > > of a job and don't check for `s_fence->finished.error`, you might run
> > > > a
> > > > cancelled job.
> > > 
> > > s_fence->finished is only signaled and its error set once the hardware
> > > fence got signaled; or when the entity is killed.
> > 
> > If you have a timeout, increase the karma of that job with
> > `drm_sched_increase_karma()` and call `drm_sched_resubmit_jobs()`, the
> > latter will flag an error in the dma fence. If you don't check for it in
> > `run_job()`, you will run the guilty job again.
> 
> Considering that drm_sched_resubmit_jobs() is deprecated I don't think we need
> to add this hint to the documentation; the drivers that are still using the API
> hopefully got it right.
> 
> > I'm still talking about `drm_sched_resubmit_jobs()`, because I'm
> > currently fixing an issue in V3D with the GPU reset and we still use
> > `drm_sched_resubmit_jobs()`. I read the documentation of `run_job()` and
> > `timeout_job()` and the information I commented here (which was crucial
> > to fix the bug) wasn't available there.
> 
> Well, hopefully... :-)
> 
> > 
> > `drm_sched_resubmit_jobs()` was deprecated in 2022, but Xe introduced a
> > new use in 2023
> 
> Yeah, that's a bit odd, since Xe relies on a firmware scheduler and uses a 1:1
> scheduler - entity setup. I'm a bit surprised Xe does use this function.
> 

To clarify Xe's usage. We use this function to resubmit jobs after
device reset for queues which had nothing to do with the device reset.
In practice, a device should never occur as we have per-queue resets in
our harwdare. If a per-queue reset occurs, we ban the queue rather than
doing a resubmit.

Matt  

> > for example. The commit that deprecated it just
> > mentions AMD's case, but do we know if the function works as expected
> > for the other users?
> 
> I read the comment [1] you're referring to differently. It says that
> "Re-submitting jobs was a concept AMD came up as cheap way to implement recovery
> after a job timeout".
> 
> It further explains that "there are many problem with the dma_fence
> implementation and requirements. Either the implementation is risking deadlocks
> with core memory management or violating documented implementation details of
> the dma_fence object", which doesn't give any hint to me that the conceptual
> issues are limited to amdgpu.
> 
> > For V3D, it does. Also, we need to make it clear which
> > are the dma fence requirements that the functions violates.
> 
> This I fully agree with, unfortunately the comment does not explain what's the
> issue at all.
> 
> While I do think I have a vague idea of what's the potential issue with this
> approach, I think it would be way better to get Christian, as the expert for DMA
> fence rules to comment on this.
> 
> @Christian: Can you please shed some light on this?
> 
> > 
> > If we shouldn't use `drm_sched_resubmit_jobs()`, would it be possible to
> > provide a common interface for job resubmission?
> 
> I wonder why this question did not come up when drm_sched_resubmit_jobs() was
> deprecated two years ago, did it?
> 
> Anyway, let's shed some light on the difficulties with drm_sched_resubmit_jobs()
> and then we can figure out how we can do better.
> 
> I think it would also be interesting to know how amdgpu handles job from
> unrelated entities being discarded by not re-submitting them when a job from
> another entitiy hangs the HW ring.
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20221109095010.141189-5-christian.koenig@amd.com
