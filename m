Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB999B7404
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 06:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328EE10E04A;
	Thu, 31 Oct 2024 05:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZD6G1f6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BCC10E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 05:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730351280; x=1761887280;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dz6kppLpUtOWeTAR+d6mzW8jTo42l+6SK8EgZaUKvYk=;
 b=ZD6G1f6pWhZUQorZxCQvHQZ/HRftvWDZhgsePT4UPwb+1sqLKJ+9du6v
 CHtmu1IqyCtV7pEtvnmhW5hCfXNLVKlLOeXZiBNWhYfxx51PZ+5jpxXUP
 OLBVMT5DRUvIg7VoyGFDJS3hePFO3W2YuYxHbzqqUGryH89tMWw00G1ey
 hEtKyw9LCk88fy2hgkgDre8t5w/QLccJ1beeGY4NmPBmH0hp1besrBJIQ
 seTB8KBc9Ow3vm7qgdI38TJRXeBKGDNi6hjn5KLi1Tk1ZSUUZw7uAjGj4
 yqTXHE0QhZqAljogYOg007WO8a+jBfr3vuPXus3AykBq0vnRzUxGW8xpP w==;
X-CSE-ConnectionGUID: igmq3xNsRbGBlczluXvzdQ==
X-CSE-MsgGUID: FqUxkmr1SM6hTMG8WLuZEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30184027"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="30184027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 22:08:00 -0700
X-CSE-ConnectionGUID: c3IpgHE6RjiHixS5V+WRlQ==
X-CSE-MsgGUID: TJWe5BhWQFmwPbFXFs+m7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="86453930"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 22:07:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 22:07:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 22:07:58 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 22:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYC45D4p71RDm5Cxrf5oxId7jt3k+DFieqBoDp5xFk1VDvyhFdY3yhDupCC7DaIpqvT5+RFw5WoejAazof7ALc4/UNaeFNbuIzU1iS7wkzpWjDClWutVj69weY2h0j0ca4nX4yhz1fmgvR8z4JbzgisF//yjgVVy+4HJeJZV2th2UhfYozOLxw+I1h7SFj8SfVCJK68mRzGxrqW4J1iaqvKeq0+AY0A9hK0R5PVfPQEKbt8fOuXSU/jjHsNs3L6Zm1M8UYWCohKIR45Od+I4WYtCzY5T9uPqqq1Rt2w5K3UvpforKVhVP4G/Or1Ew/WNfL0x9rX7DlQ3svxs4wQOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz6kppLpUtOWeTAR+d6mzW8jTo42l+6SK8EgZaUKvYk=;
 b=mJvsBmqKlLmIaoa+MUFZj04DeADlFa88O4gOeRSOhtcv4zwmDZtQEYnBHf2v+8gALrNQ35wuQObbpTVerKtZPLINSHm4JJ5j+CjDKLWCXSod1eZjdmF8lLIN50KJFCZqztRh7wZnkScRz4hWlLyfIfwFwOWfcAWRDmJzvHJlrDUoPNsKminSpvsHUH9TcgkyxDswBh19V6rwif4lmZiyViCdXxGfnmCJN2xR4/sHWj7yK1yxLVaO9jVnhMsY+sVKGUYFe2/j7e3ak+tI04UFt8pMAHnGLwDLcuu2mIabcdU3fz4yES12tg2w2vdiEGuzqwERwU40CrW80tk/7AaT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 05:07:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:07:55 +0000
Date: Thu, 31 Oct 2024 00:07:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <kouwyypgqthwklgdlckavoasu3bbjmustsxp3sncztztijmykd@djnbwa4sm4wz>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
 <20241016120302.GP33184@noisy.programming.kicks-ass.net>
 <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
 <20241022215210.GA31953@noisy.programming.kicks-ass.net>
 <aj62ufd6pjv74bhxsynyxvir3s5jdncsljczoucdjvibfkglp4@22nc72qnhpa2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aj62ufd6pjv74bhxsynyxvir3s5jdncsljczoucdjvibfkglp4@22nc72qnhpa2>
X-ClientProxiedBy: MW4PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:303:6b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 356451f0-cf76-4d8c-16ee-08dcf969fa67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Rj2RvtRNrpcwXde9CWokkEyGV/47K6ZbROn8QAV6IAm20fflgUAkW9P+9SQ?=
 =?us-ascii?Q?HTcpns3DLCux6VkyCd2bjLEmtVOswY6dAYxA627U2keNdKg2hQEuK/3LcDxx?=
 =?us-ascii?Q?x+RWYpPOmym8tcw4YJdTKNWGdCFSF4TwzmSJYxQpShoQUZXao9RLehUyPvCu?=
 =?us-ascii?Q?8kk8ijTft/CZ9Ayo4lhm9yWmkLZx65puVIYw4BGyPuHBCkRm0dRQmpw0R3Dl?=
 =?us-ascii?Q?kSp3jKD5lyBddnoCU8rMrGtcyy975BjEwE0VLFE92op1pcoTvVx9+AFgvDdM?=
 =?us-ascii?Q?Z8gQcb25Fz0mrLhL39lMKSTniFvSO6eu9FWtn6SFrgIb/adjvDxvzvsa3Gxh?=
 =?us-ascii?Q?wK2UaKf3h2Y9uDIJAnHOlJDJN5Y6uADBV8LW0mnKabRsHp0FDTOXcbKg/HA/?=
 =?us-ascii?Q?JdORbtkGTM7R5XuWLSqOnUipGArCcZWLFt9RuEQNjZl031fvGMfcYqNOkPkA?=
 =?us-ascii?Q?zevFAOPBDvaXCGuRWi34o4NExvNA/N/odODy16xoFMs6TlI5E8u4zM70rGpK?=
 =?us-ascii?Q?kdBKb09HU1Ay83OsPcMfGKfOvYtZ3v0k1taVwrJXIzQK9cptQbyfvuOgVHU7?=
 =?us-ascii?Q?dKWv+P1pQLS+l59abR1xit+in8gcfEy5KPKUYXYZA+OhOZy7lupx/HdTjikG?=
 =?us-ascii?Q?oKvP7N+5yBsvvDoySCqHmT9YQyHJr+694z5ZENecVt0y+mB/O4g+pZ0JhjHy?=
 =?us-ascii?Q?T2u6CxgH1dTvvere2vKQiMfyDvq44Ify3XAOlWaim22RsTIBak3GwCxdyx0w?=
 =?us-ascii?Q?JMpk1hpZmNkZZ8rXnGx5k1GsL4/8C5+lKuQ2MjZz4XpE/V6ic+wL6bFvk+SI?=
 =?us-ascii?Q?tUxshpdz8GOHb/3UUCATgzaAwDDS5/P0Ze8hnXZeuzt03eUuPPnM6d9f4xFN?=
 =?us-ascii?Q?/FwRfLBhp1Mo9Dw00cDWg+Sk7UhVnjZER9+aksJOVu6hQaevauUhwQMfVPix?=
 =?us-ascii?Q?+NikZfQAFWcNEl/A1c659yiVUMNGP9x4POsWEWhJVlDN9K8xkKdtoEQJX5BA?=
 =?us-ascii?Q?yQeI7WH0xohnBRLlrPmerSjcv+id6S8PUTUtJCvAP3lt517XUo60EQVQcTIr?=
 =?us-ascii?Q?YX6fE7cfd0u8WPb6PX8FHeG09hxN4MmedEopzafDekiPDlS602FB3WuZh4Dx?=
 =?us-ascii?Q?wpIYX4dS3t13W0GWJTaanjML2iZwTAK0AlJgHKhjfZNux/UpH+YZFDV6YqMg?=
 =?us-ascii?Q?SY5yDH1wHRpXKztGvLxjYjrR0dl9GhajwDKBo9wh/Im4p0T+ZlBVAVGNg1Us?=
 =?us-ascii?Q?iDWjye+un97bi9giKv0GzTn3a/X0g0XohTMzzHDkqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nI98fK8FssBk57AozJFsxyM+Xqy1+Ut7HZK7FV/QYRuhJJih4QGZKXVKroOr?=
 =?us-ascii?Q?c3sasWmvgoUpZQ0a0N2BCJzBf8K47s0363854UHRLFw7zzlQoMuNuXn9EFba?=
 =?us-ascii?Q?E6FtZEuWFyeAuuM42wLqfAmkzlOdVUe2O4Q4bZohhWodPjTPyTc4ZMgTD2zr?=
 =?us-ascii?Q?ijLET2I2PrfzUn2zDDBUIfczuzdl6eu20Qwdm0JFJqPhReNhXCmp786K8iGE?=
 =?us-ascii?Q?co6vWb0P6Y76QdX/kNkAJv5CWfbWkHwN0L5v3rCGG2L7lcNZBFkm9UICUsQi?=
 =?us-ascii?Q?gxxPH8c4+xlZWC7AjoSuryJt0R86sHTnlIF3x33zemBgoE+NhiXlFxO1yO95?=
 =?us-ascii?Q?c2IRZ6HpBom7/O41pc9aVrsGboor9rjG6l0tRG6Fm2TTyuyFYaQsfszrlYMm?=
 =?us-ascii?Q?yf59QBzEfjePrd5E1kpdOOLhxUBkq2EEgdEw9hWK56vGwY38XUiBnPk1twBU?=
 =?us-ascii?Q?U7sbjf3MdkLTEdnsAJvZKZC64pWuVfOnrobtXLF4ETnCjyqJ2av0qkTObr6m?=
 =?us-ascii?Q?GKPj8jP/RwgCWfaSMyOhqVhaWPhA1s+cVBhSdj+TAyj6C00RWAPwxkfix6iB?=
 =?us-ascii?Q?O0W4pnYGbnq23ugQByoC7yWYgGU86nrYHv5kpmARmF0bRFq/vrS4xom5HA6N?=
 =?us-ascii?Q?tNTGF4LQVRXcA7reh4QJEo59bf6ydnjsPfo9JPVIAqHXGpY3UVFj/9sGDmbt?=
 =?us-ascii?Q?sdHUvzxNhK9gm9o2bo6tBBL9q6/IipKIYUzfX1YulobGQzDks/tDRtMI+WWo?=
 =?us-ascii?Q?Bjf/YMNjlCO89ndFc9TOypoger7kLBviYlOTtijDJ6vma9KWa32ugizK+ADm?=
 =?us-ascii?Q?S9ditrym/KmOR+utFSlfm3ph2w2nm6HSMx5RdXHtAnl+F8nds1kic9Lk7hpB?=
 =?us-ascii?Q?Pm3x+xOqqL26vxMADO/lTMJBPCAr+n5Zxz/pCyEr5IbSxdfv9F+yioahm9U8?=
 =?us-ascii?Q?1EUygbP8IjUl7ucudioiWaBey8OMaR4TQEYb8IUcAqijwe/GKNvPRnrPnhhm?=
 =?us-ascii?Q?y0hcmxFvzEeHBsYpxk8BaAPDmo7QDSHO0kNzqWyu/GMmx8CHwUOrfsTpVMp7?=
 =?us-ascii?Q?BVIfOg4VVSVqDuuG1jpM+ipOPEVHDZ60pC4wiDmXvio30bCB7mAc9q1PyA6C?=
 =?us-ascii?Q?+9To/6cA9+m1V5Mq+A+vCz1ecRu8oveLdrSarBmxcpeM1EVBM2IIdHyWOXCh?=
 =?us-ascii?Q?i9OvW621NdtP+GgDp+trjXFYs2t+UPGau807wnCXn7Ah6DXY46NnsXJvLW6M?=
 =?us-ascii?Q?JWXKGtvPq2Rsb6wFudcs2PfNpZiHi9kaSek6KE60sHCiIjITFedMUUCSFNBa?=
 =?us-ascii?Q?MoXNiOkmWKNdKoNjXj6Qr7WCDipDwqUq6q/c5XNIW1fCrPwtR3B5eBpNcdLr?=
 =?us-ascii?Q?reGRpG1Q6kaVShy3XrbkqhY49I6qndWK/VDgT7rfVI12LfrSsc18kjW4jthL?=
 =?us-ascii?Q?GIvcP7nCfgrtmM33NtVZrmKi1oBE507wud1B7Pk8oDWjqN59O7LbGEJkVQ+L?=
 =?us-ascii?Q?38gOve1Fg4yLpOCHV8oRRNiG43LsA3K2EWSEhtjISjlpN1pCpp8vRRpJ8ueh?=
 =?us-ascii?Q?vlI4Oht/ZSK3Zf9iCA9MKyul/MWwnMUQjQnXs+inAyrtv7U/ZAJeBu3I1Tb5?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 356451f0-cf76-4d8c-16ee-08dcf969fa67
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:07:54.9982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++OH8C9XhySqlldff0UnBf2yUzc0+1zwbg5Q7F43nJJdaM6xsPm6NaaM11E+0ep3UgUvL8K5zW8rEf1TsJlDnpSBAid11OnyJxxefBJ7tNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Wed, Oct 23, 2024 at 12:07:58AM -0500, Lucas De Marchi wrote:
>On Tue, Oct 22, 2024 at 11:52:10PM +0200, Peter Zijlstra wrote:
>>On Fri, Oct 18, 2024 at 02:46:31PM -0500, Lucas De Marchi wrote:
>>
>>>I will give this a try with i915 and/or xe.
>>
>>Less horrible version here:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
>>
>>I've just pushed it out to the robots, but it builds, passes perf test
>>and your dummy_pmu testcase (for me, on my one testbox and .config
>>etc..)
>
>It passed for me as well with both dummy_pmu and with i915. I have some
>changes to igt (i915/xe testsuite) that should bring some more coverage.
>I minimized the pending test changes I had and posted to trigger CI:
>
>https://patchwork.freedesktop.org/series/140355/

Our CI also didn't trigger that pmu issue and the test could run
succesfully.

I did get a report from kernel test robot though:

https://lore.kernel.org/all/202410281436.8246527d-lkp@intel.com/

thanks
Lucas De Marchi
