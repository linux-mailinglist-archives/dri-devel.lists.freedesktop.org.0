Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7E97DA42
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 23:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433BA10E868;
	Fri, 20 Sep 2024 21:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzLb5uu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E33310E135;
 Fri, 20 Sep 2024 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726867530; x=1758403530;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lVZ6ITWmIYiTIUVnDuQNe7P7Xl57wgpZtygFNhH6t3U=;
 b=XzLb5uu7YO05MGhxt7ER/Jvn3m1U5/0zDGrASivs469Vhv8FTTkaf2Z6
 H7yOWS2aC9srSFmDgtTqgVDBoHVWS4DpYeWX7R8TV6QJMGpUEkHMeX4gJ
 viXtLgjtM+Bnsj/lT97+hmW/fmJb+IKtE8Bnd45Bm5QZNOeG4d23pmuh/
 OXIz6N6OKGpuwnbnO3pZL4NvK+abpaM8IKeCzjtpgz3FsbwHzLIq3nYA9
 KfB0g8e1juapVX96DM5+WUh3c8fngSVE3EOvvf1TkUS/OqXQubYAKVDL4
 kF513/fnp4o9VfoeLWNKMHWnXIu67mM4c2qIBM1fPxlDZGNKH5MQ/TZqb w==;
X-CSE-ConnectionGUID: 8fPsnUdnTbqQKP5phAZxZA==
X-CSE-MsgGUID: Goy6kjzKSa+NQTODpemdXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36476087"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="36476087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:25:29 -0700
X-CSE-ConnectionGUID: mQIDnTDuTQS4b05SWl1GSw==
X-CSE-MsgGUID: rZ+6nc6DQ9mwJ5SW6YTXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="70575012"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 14:25:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 14:25:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 14:25:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 14:25:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBXLonZLdBcSrmlzTAcUlrIwynC1AHtouvRci8q2cSkC+cp3/cxxVVthJIi8oYRkVUMG27kXkNWkrT+92yPYk2l508gjV+R42IDsRrch1asnGZEqI3Z0QRCbhi7zjpwovrHupK3oy/bqbpR51YoiwZJ91Ehh+6oxZGS/IISfJ0/G2Hdaw4j/SGXVjwj+lQ7aS0CU3g+xFYWctdqgbGzKL8dWM98FITLbJW5cs2GvkHnoWYZ5CLTqLZGs4YiMDccfF5/EQ5iRmwxAgfHkHsC3eM+onfREWc7x80ar/QBJNtsmO5micKLDi/yvGdNX2vrmNSGDLSELwOVjNSQ7Cs8I3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcRDXuqpgLkLAVWdcFLVKrRyazvzXnU/oh6iMoBZY28=;
 b=UMjKyhT4ubd1KR6lpbG7AO8/imTrHepoT8uIO1b0mgSnhb1RqlPw+/I6wSr5Zr/M7jC+XptbqIDwIp7X6QBHURX1swpjKQ4i7INoxr1PSSE2EslPWXJ4zJSt6saC0prK2ANdd43Gw24ySBq3aBwY6egRK97z6evijRPF5PAIXt4McgbjbpfXP8OfItK8snKwd63Mk6chWMp3bNZI+JSaAyQEl5ShsGHuDfruxJQUszDZzriCXGtSa+gkUrWBPNtslR3lW2vKzV8ufJcEMrWlmwoh9wXHi4UR3T4z9WUsW8DmAb60aYVXQt8ZxPK03rv28ihBKa9OLI519+7GNcjxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 21:25:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 21:25:25 +0000
Date: Fri, 20 Sep 2024 21:23:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Felix Kuehling <felix.kuehling@amd.com>
CC: Alistair Popple <apopple@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <simona.vetter@ffwll.ch>,
 <Philip.Yang@amd.com>, <akpm@linux-foundation.org>,
 <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f9c0f5-f375-4d8b-fade-08dcd9babe15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qQdfqNQX0dTs2f8wi4eX37CxVtk8QVIS5KF93QsYH+EGnvVM2SQ9SJIi4P?=
 =?iso-8859-1?Q?8rFm/v0pKMcEHMaq1/jVr9SLS/SUsl/ZJ2Ie1YBXh+w9JNyUlim9jHOafu?=
 =?iso-8859-1?Q?bRJSpAq3VZV44qBYud644ipWe56g+nFpFjsZ/V1dxIUvignta6lNjcNqCJ?=
 =?iso-8859-1?Q?B0UinIs/s+hLvQKu6aKARswwY8DMdbX4Iyv9M23JtibLn7XAVSVSzsOCLB?=
 =?iso-8859-1?Q?Tbd4s+0neyh3qFG1AtpjK5cpLIVFkl5ZGmoWEqStIuYxWL8hPfl6lD6J4E?=
 =?iso-8859-1?Q?vc2t3C5gCsUSdEsUIcpka044Ua/fvgESjxG4d0tUcC4RDCs0FI4fIQhb28?=
 =?iso-8859-1?Q?FtmvvwctVOLwNMOUABPKgTNpvUiA3ID9Omm0yHtfZqSzb/KLxfIGp/q8mf?=
 =?iso-8859-1?Q?HVFa6/B3t+WbA42kRkZ/2tem+UaXx9CyiPuM/MoZ3JBDS249PD+J9HHb6w?=
 =?iso-8859-1?Q?Ei13B89aERvF3Lzzfw6LLfPqcaG4UWExW77QxILnY2Irh107gaw5U+4Mf9?=
 =?iso-8859-1?Q?HKjIN46Dk2j2hjOhp13z37LPiCyaFUqjgF+i1GQaCAWeogaKzuZJOxuXhJ?=
 =?iso-8859-1?Q?nkTnk001Nbn5/YRvYtmQCPyxgCEPuHJvZ6VgL3yF1gQk8XnlrmJl3XhTtY?=
 =?iso-8859-1?Q?E2sBiit9ief8BI6EA+eKBzwbBunc5xgCOjEZQKVI0tA5vWEdEyN3GNloJr?=
 =?iso-8859-1?Q?zz8p0mHIXGbM4UxBkoYBNZk3W9oh0G7vLGuUzjTaA54XxLHxgR8ZzdF6q8?=
 =?iso-8859-1?Q?+QVn3sQPIvX/hXuX7gq3rGWLYFfDe0Nof/+YWuUlDyjzLZY6UJ2+IIfT6W?=
 =?iso-8859-1?Q?9nyMGkHArfegcqogree8SDH4w4JQhtKTABG4u98gNJKNbUEsdpNG5nn+ji?=
 =?iso-8859-1?Q?OPf/2/RRa0cG9HpEGhLkxstFB3jtnQu0t4HZ2WC1rfmV0jJZWeWeZGLxxC?=
 =?iso-8859-1?Q?XXHqhVRQ+eGZs3FngqXvZUKl4aX180fzKp5pRHET9LGmnZtG7oC1A1dqi9?=
 =?iso-8859-1?Q?KutONDFwV7KlnN1EYCU8LGP5v3pkHZup4epstwFBE37DQMIl+56YZDLbHc?=
 =?iso-8859-1?Q?L5F4qvWavL5nLA+2qMUJVtm7ZaO3LWv+V/2bxfwfqi1fX6S03Rsw5z1Y0R?=
 =?iso-8859-1?Q?Dz9wTvF5AKoWhAVxb+zXzTVc198sCP0rpI5qbiC4UPfvGmHlIoZqhEUelc?=
 =?iso-8859-1?Q?tryQZ/0FMSoiAtzkyOU9gRtBPpFo7YQTCBiLPsmpH/v/oyfYhnwLIaCJUZ?=
 =?iso-8859-1?Q?en+P6hjj4XJ9KYViaSo5Px6Uyp1Pa4CmfLdRlDCsJNMVvMMoHAwABnPbcB?=
 =?iso-8859-1?Q?AURW9JRkQ02TGtbatm1ytWV9qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vu8Ug4iSxYM08YXTD9CAdrE2HlGdHUWxICbg5KK506G2CYX4l5kouUMKAX?=
 =?iso-8859-1?Q?I+RSvqLAshmemPdwlHz+rn4vwdhAbA0eYoZXwrGnwBc0v0ISYQC/CPTYcT?=
 =?iso-8859-1?Q?wzNmTs/IaAnNuhl+7YkNPM8nB72s+h5QraJFto3xE5kWLxO0BiWQSne44+?=
 =?iso-8859-1?Q?Q1t1/F5016J3Nq0nY2fA3hHwBK2JAvnJy7xbi2SH7I3IcqMXxuOMDqnvV2?=
 =?iso-8859-1?Q?HJagfMGmMkAbJ+hmOUPcnqJoXmyI6Cq/KFuIabSyy6WGPzdQGkIqhzapAc?=
 =?iso-8859-1?Q?L8BSUpG8dG3IpQIbRBVuABcTnOa9xVIcZIEfQniOs3iCnSIC3fahZ/epVO?=
 =?iso-8859-1?Q?TmHnHcCiCzRb+dw05ZNoQSO2Ip7soBJzxcve6oDS90f+GW+oo3L+qA4w2h?=
 =?iso-8859-1?Q?/IwN1H+KCO7t1aRo50VcOU0ki+mqdO0yjybDSGQnMxt3awDUR7k2dqS06B?=
 =?iso-8859-1?Q?mF0FTOH2hf4dkMQptvWSHyQHzIcTvaQntca9/fqo8IOX3XzVK1wv5j1uqU?=
 =?iso-8859-1?Q?0lXT6QKM3wm0JQJ9RvSnh+R4lZIht/KXI8R10bUUyqvPSu66pNAXvaHmPI?=
 =?iso-8859-1?Q?D7R++YgSKAQaKs8l38T9VgDzc6CiZmpJI+fzG9HnVq6ar6tXr1XDDOFXq6?=
 =?iso-8859-1?Q?rehIkYRWRcdoLL0O1K1IfYXZznOJRx6vxJ6tPWEyJSuLLbqcTOfC50JP62?=
 =?iso-8859-1?Q?5VdEbvtf1EFjwQ4HXUZeEr4Rb35Ymhto+rc/3kLzs1qL5tVppAqi1uOWzI?=
 =?iso-8859-1?Q?PU+F2GhTkUtCmjEAvuDkDCKs2WyjarjfbgYGODpHo6XHrHs7vQHQU94PmV?=
 =?iso-8859-1?Q?q0uPV1iaTuYAbLSSQEXVYVGqxqH2vUs6N/B+Ih0VWij+54jYwMxmpRthZm?=
 =?iso-8859-1?Q?+FsidjIIqQG0pEtSrnmJ3WGzq1Mj03gXlNRDLeAMCK/3LxwTfiKySCHmHy?=
 =?iso-8859-1?Q?iUPmKv7D9sEX8oaWsWK2q1xc/uOxIrr1W9zsxHaK2y7sBMytc3hiclgqsJ?=
 =?iso-8859-1?Q?19feQS4vvQGS9Tb/Ypgsz//Mt8xQRdUBsidIm0YA9/JYe43Amg1hFEAqjj?=
 =?iso-8859-1?Q?Vg5E9PaS1u8rLu6FTtQrrUdbpaEeCUyzY3fm6vWqHVCT4TpzPBNHsdVr7A?=
 =?iso-8859-1?Q?fDFqP53cBQ3ZxZLtII6gWvP3fWTszuRaweq/QO5PVG00AuO0tW3JFz9ZOd?=
 =?iso-8859-1?Q?xzBLh55c2ItT7Aiz8jUgWnvpGkgJ2N1PKXitZ2gJ1X0wUaRTXxKkbe2DB5?=
 =?iso-8859-1?Q?QegaUM6Jc7DeZ1KBajtjpxoYqB9X/cSrVW29mHkRAkHpnD804nLWfGAMEk?=
 =?iso-8859-1?Q?jZrkPhhsOrMBwsuDIIR3gDyqAdN674Xc7TfXCwrwjer461g/tXIPYmh+hN?=
 =?iso-8859-1?Q?jCoGXX8nPhF4B+48Zwoi8Lg52G6IRhHhZwvUdrXkL8RNrLXV7rhebFVnrD?=
 =?iso-8859-1?Q?9RBNcqMTAbrZ0Zvsl7VUW5HwsIsMJ3KF+6BEX4bLylpA3h+6Zqm6zJxe+r?=
 =?iso-8859-1?Q?+UlF2p57Qdxds51/psx4gQmRqvZ8adabBC/V99gXtY56QyEPFIdfGv/gYJ?=
 =?iso-8859-1?Q?OEPGtw1QTycaznb+tEmNO+5Eu0gk4ZnqwPqBjxrp9VC1qy2TGhsbL8d8iq?=
 =?iso-8859-1?Q?7IdhbjifL8dgj2H6bexD9bx8Wcm/YEzy9Y4Ka14vXpIlOFbxDvFxX66w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f9c0f5-f375-4d8b-fade-08dcd9babe15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:25:25.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8+yjGAVcAiNXeywW6UnbLCHNE7T4lJ77fLpNBgAzt4l/0/gEdqHpzfetxegJZq4u6Jp3bJwAiTJUELkioSpxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
> On 2024-09-18 11:10, Alistair Popple wrote:
> > Matthew Brost <matthew.brost@intel.com> writes:
> > 
> > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > 
> > > > I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> > > Still a driver.
> > Indeed, and I'm happy to answer any questions about our implementation.
> > 
> > > > but theoretically it seems like it should be possible. However we
> > > > serialize migrations of the same virtual address range to avoid these
> > > > kind of issues as they can happen the other way too (ie. multiple
> > > > threads trying to migrate to GPU).
> > > > 
> > > > So I suspect what happens in UVM is that one thread wins and installs
> > > > the migration entry while the others fail to get the driver migration
> > > > lock and bail out sufficiently early in the fault path to avoid the
> > > > live-lock.
> > > > 
> > > I had to try hard to show this, doubt an actual user could trigger this.
> > > 
> > > I wrote a test which kicked 8 threads, each thread did a pthread join,
> > > and then tried to read the same page. This repeats in loop for like 512
> > > pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> > > for it to livelock. Without an exclusive lock I think on average I saw
> > > about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> > > thread won this race.
> > > 
> > >  From reading UVM, pretty sure if you tried hard enough you could trigger
> > > a livelock given it appears you take excluvise locks in migrate_to_ram.
> > Yes, I suspect you're correct here and that we just haven't tried hard
> > enough to trigger it.
> > 
> > > > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >   mm/memory.c         | 13 +++++++---
> > > > >   mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> > > > >   2 files changed, 50 insertions(+), 23 deletions(-)
> > > > > 
> > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > index 3c01d68065be..bbd97d16a96a 100644
> > > > > --- a/mm/memory.c
> > > > > +++ b/mm/memory.c
> > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > > >   			 * Get a page reference while we know the page can't be
> > > > >   			 * freed.
> > > > >   			 */
> > > > > -			get_page(vmf->page);
> > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > -			put_page(vmf->page);
> > > > > +			if (trylock_page(vmf->page)) {
> > > > > +				get_page(vmf->page);
> > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> > > > rather than do this and then have to pass all this context
> > > > (ie. fault_page) down to the migrate_vma_* functions could we instead
> > > > just do what migrate_vma_collect_pmd() does here? Ie. we already have
> > > > the PTL and the page lock so there's no reason we couldn't just setup
> > > > the migration entry prior to calling migrate_to_ram().
> > > > 
> > > > Obviously calling migrate_vma_setup() would show the page as not
> > > > migrating, but drivers could easily just fill in the src_pfn info after
> > > > calling migrate_vma_setup().
> > > > 
> > > > This would eliminate the whole fault_page ugliness.
> > > > 
> > > This seems like it would work and agree it likely be cleaner. Let me
> > > play around with this and see what I come up with. Multi-tasking a bit
> > > so expect a bit of delay here.
> > > 
> > > Thanks for the input,
> > > Matt
> 
> Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
> Christian and myself in the loop with future patches in this area.
> 

Will do. Already have another local patch set which helps drivers dma
map 2M pages for migrations if SRAM is physically contiguous. Seems
helpful for performance on Intel hardware. Probably post that soon for
early feedack.

Longer term I thinking 2M migration entries, 2M device pages, and being
able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
finding migrate_vma_* functions take up like 80-90% of the time in the
CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
ideal. Seems like 2M entries for everything would really help here. No
idea how feasible this is as the core MM stuff gets confusing fast. Any
input on this idea?

Matt

> Regards,
>   Felix
> 
> 
> > > 
> > > > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > +				put_page(vmf->page);
> > > > > +				unlock_page(vmf->page);
> > > > > +			} else {
> > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > +			}
> > > > >   		} else if (is_hwpoison_entry(entry)) {
> > > > >   			ret = VM_FAULT_HWPOISON;
> > > > >   		} else if (is_pte_marker_entry(entry)) {
> > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > > > index 6d66dc1c6ffa..049893a5a179 100644
> > > > > --- a/mm/migrate_device.c
> > > > > +++ b/mm/migrate_device.c
> > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > >   				   struct mm_walk *walk)
> > > > >   {
> > > > >   	struct migrate_vma *migrate = walk->private;
> > > > > +	struct folio *fault_folio = migrate->fault_page ?
> > > > > +		page_folio(migrate->fault_page) : NULL;
> > > > >   	struct vm_area_struct *vma = walk->vma;
> > > > >   	struct mm_struct *mm = vma->vm_mm;
> > > > >   	unsigned long addr = start, unmapped = 0;
> > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > >   			folio_get(folio);
> > > > >   			spin_unlock(ptl);
> > > > > -			if (unlikely(!folio_trylock(folio)))
> > > > > +			if (unlikely(fault_folio != folio &&
> > > > > +				     !folio_trylock(folio)))
> > > > >   				return migrate_vma_collect_skip(start, end,
> > > > >   								walk);
> > > > >   			ret = split_folio(folio);
> > > > > -			folio_unlock(folio);
> > > > > +			if (fault_folio != folio)
> > > > > +				folio_unlock(folio);
> > > > >   			folio_put(folio);
> > > > >   			if (ret)
> > > > >   				return migrate_vma_collect_skip(start, end,
> > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > >   		 * optimisation to avoid walking the rmap later with
> > > > >   		 * try_to_migrate().
> > > > >   		 */
> > > > > -		if (folio_trylock(folio)) {
> > > > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > > > >   			bool anon_exclusive;
> > > > >   			pte_t swp_pte;
> > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > >   				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > > > >   					set_pte_at(mm, addr, ptep, pte);
> > > > > -					folio_unlock(folio);
> > > > > +					if (fault_folio != folio)
> > > > > +						folio_unlock(folio);
> > > > >   					folio_put(folio);
> > > > >   					mpfn = 0;
> > > > >   					goto next;
> > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > >   					  unsigned long npages,
> > > > >   					  struct page *fault_page)
> > > > >   {
> > > > > +	struct folio *fault_folio = fault_page ?
> > > > > +		page_folio(fault_page) : NULL;
> > > > >   	unsigned long i, restore = 0;
> > > > >   	bool allow_drain = true;
> > > > >   	unsigned long unmapped = 0;
> > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > >   		remove_migration_ptes(folio, folio, false);
> > > > >   		src_pfns[i] = 0;
> > > > > -		folio_unlock(folio);
> > > > > +		if (fault_folio != folio)
> > > > > +			folio_unlock(folio);
> > > > >   		folio_put(folio);
> > > > >   		restore--;
> > > > >   	}
> > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > > > >   		return -EINVAL;
> > > > >   	if (args->fault_page && !is_device_private_page(args->fault_page))
> > > > >   		return -EINVAL;
> > > > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > > > +		return -EINVAL;
> > > > >   	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > > > >   	args->cpages = 0;
> > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > > > >   }
> > > > >   EXPORT_SYMBOL(migrate_vma_pages);
> > > > > -/*
> > > > > - * migrate_device_finalize() - complete page migration
> > > > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > - * @npages: number of pages in the range
> > > > > - *
> > > > > - * Completes migration of the page by removing special migration entries.
> > > > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > - * before calling this.
> > > > > - */
> > > > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > > > -			unsigned long *dst_pfns, unsigned long npages)
> > > > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > > > +				      unsigned long *dst_pfns,
> > > > > +				      unsigned long npages,
> > > > > +				      struct page *fault_page)
> > > > >   {
> > > > > +	struct folio *fault_folio = fault_page ?
> > > > > +		page_folio(fault_page) : NULL;
> > > > >   	unsigned long i;
> > > > >   	for (i = 0; i < npages; i++) {
> > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > >   		src = page_folio(page);
> > > > >   		dst = page_folio(newpage);
> > > > >   		remove_migration_ptes(src, dst, false);
> > > > > -		folio_unlock(src);
> > > > > +		if (fault_folio != src)
> > > > > +			folio_unlock(src);
> > > > >   		if (is_zone_device_page(page))
> > > > >   			put_page(page);
> > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > >   		}
> > > > >   	}
> > > > >   }
> > > > > +
> > > > > +/*
> > > > > + * migrate_device_finalize() - complete page migration
> > > > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > + * @npages: number of pages in the range
> > > > > + *
> > > > > + * Completes migration of the page by removing special migration entries.
> > > > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > + * before calling this.
> > > > > + */
> > > > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > > > +			unsigned long *dst_pfns, unsigned long npages)
> > > > > +{
> > > > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > > > +}
> > > > >   EXPORT_SYMBOL(migrate_device_finalize);
> > > > >   /**
> > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > > > >    */
> > > > >   void migrate_vma_finalize(struct migrate_vma *migrate)
> > > > >   {
> > > > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > > > +				  migrate->fault_page);
> > > > >   }
> > > > >   EXPORT_SYMBOL(migrate_vma_finalize);
