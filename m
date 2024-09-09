Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B043297241D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 23:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D159310E6BD;
	Mon,  9 Sep 2024 21:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwAeB1cX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699810E6BC;
 Mon,  9 Sep 2024 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725915800; x=1757451800;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pCfidbB6IaaJe3NEqodDQ1Ea2vCJdkm1evLbVtB7jHI=;
 b=ZwAeB1cX5dNn3GRwPrSU1DJ8pDgNHc0Z09W/6AUXAoSNytZQEuCBCUi3
 s/xF9wDVuw8e8QGztIMm+o4CY+h2GQHOSaG41TpUYTEqMSEl1zFnN7ayk
 /Z3fYgXjUIVf+/4MmH5t2eNZJB/ICROpgIhRGs7IUr7BwRK7P6hOsEmiS
 vWROVkSUmbEK3VK9nibPCCrlNGCJRUesp0gJnEzo+E2YFRI3kunvtYMIB
 mF8N7mlPHBTxTEm/JJU9YC4BTq0c05nRuUxE/QWrp8VKdhVu+Ha+bPGOk
 HTYVAayMXcpv/HWgovLsDYgr6KZ24Q8GRZLaM4UnaAyqF90GudJsJmaed Q==;
X-CSE-ConnectionGUID: oNAglO8nSkmeOk21kHAEOQ==
X-CSE-MsgGUID: LWgfm6ODRu652Rs9pQ4qYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24136644"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24136644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 14:03:20 -0700
X-CSE-ConnectionGUID: YeV2wyd4TdGNzVtH7dQYVQ==
X-CSE-MsgGUID: orYi+dtQS0eiXircu+Mt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="66417566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 14:03:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 14:03:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 14:03:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 14:03:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 14:03:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml8lE8w1oCh/RCANxovGYv/IX0qawAMpLOAeStKG4B8dPxU+gHNq69RLBWQpioMp++rvM/kulqB6wFtOQ/awzsjyTrAlVZ3sCOFiwJ8emnLxU7Lz7jx6mvKzGzCG8EfTO3HGNY/eGXUIXrNCOt/3xqHj++Xp7UosiJ0n8zZSUoh06ar21/PqnK5Qy4ulyddbpVz95FyccS/mVTi0J7qntwK+7IqGb0XpyICOvWsiymn2hDn6FT+I26mqgdlOTzgSNlUvOXwstx3bU/gv/qfBvt4EDcHeAlWl8+aPjgWWLeeOH+bEZ/7bIRnfMgdv3oX8Z1D+PULqcN8nS9e2/0YMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0ttfIvJYprtjymt9swsoJjwd0YcMkUxneYVZYAQpWg=;
 b=j4FcvFBDR3dVE9eUJGkc7WuNwF7ZUJ5DDXPFRK8x7QeBRYP1uNE5nmyLyoYpvc/dqqLogcMqzLR88LBtGuOxFcoLb+vDboZipQg5Hwn5VZ0fbh0XLUTLUbTn4xyYhBJa4s42K68ieiCOITNFLstVS9U/daiIJeaPcG9xc3pO4obOd9vvkAVzqKUOzaVznKFzja8KR9BqqAPOMFhGHFPCq0lgaIcbjD9VX2n4XG33zu7qb/cpLhwqmmJEO3bvIUNf7gsyJS49Zylb4CvlTPMsbno6uipdOqlI7NuHwYyC5pZZhXenx+Pfq284c/fiepJZVlipvppmWhY3h/8YIaxxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 21:03:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 21:03:10 +0000
Date: Mon, 9 Sep 2024 16:03:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-gfx@lists.freedesktop.org>, 
 <linux-perf-users@vger.kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] drm/i915/pmu: Lazy unregister
Message-ID: <s6r3lvcejptm7pflxknuoghn6nossopvgvnicmnj7mob7mdxhb@gq2juj4lvgw4>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-7-lucas.demarchi@intel.com>
 <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
 <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
 <20240724124105.GB13387@noisy.programming.kicks-ass.net>
 <6n2zgfqn5sn6borrd7hfbbavq75ht66u646sdxlq44spbirzru@yv3bxtd2x55t>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6n2zgfqn5sn6borrd7hfbbavq75ht66u646sdxlq44spbirzru@yv3bxtd2x55t>
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b16f45-0305-4777-a357-08dcd112cfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TyzAg85Yn6AsiKnX329Htg4DHsKeREdNC/1nowNqzlZgLGNTo3Cw9zhQ6LT8?=
 =?us-ascii?Q?tjNrOMQdrgEgVH9vyQcWXxwdkvFVXJywpbh8lFZi4/yHBS+R6Liit8MHm1F1?=
 =?us-ascii?Q?S6AAGIkCp9pA2xEcLva7kSxhoM9jb9VWjk5pR1+v18DcUDjzfwTaccGvVS2q?=
 =?us-ascii?Q?3XS+ztrOYe/o4aJHFUwgnQo+//z39DxVF5WJ6AtjkGXrQW1GOSARVzz0fmb4?=
 =?us-ascii?Q?jgwM/Cz2+xbyUbcafhqGVhHpcQ/Tip8ZiKHpZ+1TfdDGzqorEFUuqKX+NjbG?=
 =?us-ascii?Q?euaJhmdCau3oIvTOM+qHAxO5nN0WvE0QqimyU/G4KwQ9hPDjxYwOlwJQOAyo?=
 =?us-ascii?Q?iUFPCicJdNwfys49uNQxQLqRmPWjMJV2DbuvYwZt7GVi5H2PeRgbuYwG3Hby?=
 =?us-ascii?Q?HKIotc3XXH82jSPxgFS2oxQ2RUW3YTM0QBILYGgXXYuh/zeYiiiM/TjBiGD2?=
 =?us-ascii?Q?JdUf4IY2/KkgYNIUjCxnd5l6WBQtuZcQfhSfC/qC8xns6RTNtY2me205VqaE?=
 =?us-ascii?Q?SUnmxElbwtYJzWyUhLRqrn+azZE182O8uEgqt9OwVXVFQ+uvs/0zw6HDBls6?=
 =?us-ascii?Q?Dm0lXzYw4RhtXzmYlIE0xfYO6pSSIbUQ9BlD/oo0p5K5QiNgrjLNYioaNjJN?=
 =?us-ascii?Q?VJxgHfl+T4w7q5VivILIMcgsdzcSIkvVjG4IixUfilXDel0AkKx7AbcC/rcC?=
 =?us-ascii?Q?qrp7BYJ8K4ri4OwSAVdoybtjm+HCooJpDqc7OhfBC9XBp2DljChGmb0WCtrJ?=
 =?us-ascii?Q?plmT9K8QKzgrQ/csdCT5TCYWNmbMJRpvchVkfgWF8W+Cijhk0601zLvi95kq?=
 =?us-ascii?Q?+C5Yhnw1Lj/d0UmzB/l7PzhRjdz6nrDVUgfEfxr6G4zUfC73nE1apDjQ/mh6?=
 =?us-ascii?Q?QGUpBop7efp05RpJxyUg+4i0WBs1XjzctMpjwlpfhjfG/KIk1UjSRiHZVMon?=
 =?us-ascii?Q?615vVFiTEQyCphMfKeIvVK1dhhBxRr832tngPD/nXzB5rO9cKRMgHPslOk7g?=
 =?us-ascii?Q?Bm8sSSzH3j53kDqEivpLxJsULbT6i+WNdde6ue/GMNgSwumvvYNbGjo1D/gb?=
 =?us-ascii?Q?C5XlPmM0VGme0qUhB7BskUFbGCrdyTB7mb51jJaQDHJ0mcpnoWNgvPuCxiOi?=
 =?us-ascii?Q?e5pNceofMZJGh1D1uGoCIbB4s08OFB+63GRQ6MaJTmtqvUtMvethHz01x7Zv?=
 =?us-ascii?Q?VJ72bG0E5kimEEc9fyEkRxICRDspz8uWfR1VXmJEVNpvVNv3akC1V7k26EJz?=
 =?us-ascii?Q?C6PN6sUCO74rHaTBOeKliloPWbGUeJ+Xs/dLnEnEQWhNmjfFgJpTMuRbnEye?=
 =?us-ascii?Q?JPqi6VFQbSLUOef1WnW8qbc9bveSXo8VHn35k060Y6ZgKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06ir7efkmCGqDSrei1kVvM84G+wlGRZh16rFmZJuDW4/j9/MbQBYTJOrs+/H?=
 =?us-ascii?Q?FmGNkhOlE2U21H3WhwQUtpee1efasvXWeUvbzuwLnVumLmEuCAVzIfCcIa2E?=
 =?us-ascii?Q?aZikQcWkLAwk96+w4cRp8WhF5UR+hhNTwhIfqMS/QPXX6gXvxlQS95LkhZ/K?=
 =?us-ascii?Q?l9/D4HlUt4wgtthmbM7SguMu5wfGT/TlKFTcJgIQEA7iShsnNSQiKX5A4bPg?=
 =?us-ascii?Q?1wszd8Ni7I/yyuLr7zb3QUMnRzUud7HZJieZvN/0hRsT/iZqxIJaa4Urtpb9?=
 =?us-ascii?Q?YMyKxPe3zoQcpL7f9sb8KThTnu/RE9GCc0wFzI3fSmqaDTMhmpfURCWfIYDx?=
 =?us-ascii?Q?77Qm4buQHabEM9fyYWWvNyMkf3+2+8CvD6YhH/NteE7lB5UgOcdSZZLgNXa5?=
 =?us-ascii?Q?Q7jtLKG4CSfth/7OFkDciBAP1G1WzAG64OOU24caQVp4lBpe1i4RrvyfwYt4?=
 =?us-ascii?Q?l8ZgC//k0aj1hACiUqgxf6Ypyx/5NWyX5J15qI74RS460lb/AycKUfq19KX7?=
 =?us-ascii?Q?xnMoSFv1F1UNQ53sMM2V0njRvf7GmdH0z1WqLb98kOKJXfIGRCHAskecwuYD?=
 =?us-ascii?Q?9YBL7xGx3oBoPt48JXQIX+14L/5+CCm7C00EmZ3mS/5lprFoLPkR82MpfFWM?=
 =?us-ascii?Q?jUnXPoAmzJoxW09guhmmT+YzUBEvAiVsflUK6//e0KjmJN+H7z7smNHtaN3F?=
 =?us-ascii?Q?41hma3qjDYf4F+l+gIqy2o9tLDq2rfaQDb1k6A687hkLV5wN9J3opU/IxAoH?=
 =?us-ascii?Q?UYeP7WWHFpoWWRcNNYnE2mQd9aFwuibmwljqkbTfvA6TeSARNbGsKxyh7H9A?=
 =?us-ascii?Q?y+XYcsNKwWLM5D/6Rydyy4dDsBCRkdCPpr9oXrpLaFFE19oRr7UbXt1L7uRE?=
 =?us-ascii?Q?voaOfS2gFriamum+VqsIPnPLHjiBMfY7GwfZroki6bY9H8c6/l5qJ7JRDaWP?=
 =?us-ascii?Q?K1H+fpEBD4/z577v5WG8634HxkEq0CQfzZsaajClvhpxmJXOfBBfM52AcoAD?=
 =?us-ascii?Q?FtUssCNcE7XBQYLwmuYpKPLB5Zte/Z8rjYguYKENjzH2WZ8wBwTb88rDTXHa?=
 =?us-ascii?Q?49H8j1WDZsds2DzQtYTjWEy0HItJZM0uvkXANSNfpcuGxn/fcgg5IoXHed+5?=
 =?us-ascii?Q?GPOIjkI/UbK5PneUMm6rtGwEuXYksm+8ezA6O4L1AUsBeMA4Y9F33ioAiqP7?=
 =?us-ascii?Q?ra4o9ILTzdEYZZvimrKeqgV8iZNAxjVREAgD9sQe1nyJUWEQO66tElRMc08O?=
 =?us-ascii?Q?qlpQGgGmchwZcfTnCBbFtRyjPwP5unT0ufoBkb0RDNd3VLhDA7/zYlChkiq7?=
 =?us-ascii?Q?RJHiew77ClcXbGTOBCIGHanxNjkG0W3VZZ8oJKXn46EYDn6fPjJqgT7jn08U?=
 =?us-ascii?Q?jxkbZ1XxEzVdyX4ueQmPWvfzkUoYwNRqJJXu+/3WY2xF2D76FFdWh+HLwEnJ?=
 =?us-ascii?Q?23Jx8rwlSaHetgnCI3VF1ZnTlYaaomWDSFfNVIriOHRVhlyfhE0521rYmzIz?=
 =?us-ascii?Q?EdNbP28yxhqeIKxyiY5ZHaD9WwAtts80DK/rz42HO5qOnNr+s85rqO/ZsAZ0?=
 =?us-ascii?Q?YWOOZUm+ygYnyAokZLX2b+1roN9T0YLlE2z9D7/ty53mo8d4M2meW+s/buVD?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b16f45-0305-4777-a357-08dcd112cfdc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 21:03:10.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkPPRvWCVjdcm8rNTlz6c6k6KEhRiYkGcwLBtKoa0M0dL/4IlbcSq2gt0rmJ8Eba46ps/ln5eoXzEi9vB98uquv/i4QMJ/06tqPdJV+WoBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

Hi Peter,

On Wed, Jul 24, 2024 at 10:39:57AM GMT, Lucas De Marchi wrote:
>On Wed, Jul 24, 2024 at 02:41:05PM GMT, Peter Zijlstra wrote:
>>On Tue, Jul 23, 2024 at 10:30:08AM -0500, Lucas De Marchi wrote:
>>>On Tue, Jul 23, 2024 at 09:03:25AM GMT, Tvrtko Ursulin wrote:
>>>>
>>>> On 22/07/2024 22:06, Lucas De Marchi wrote:
>>>> > Instead of calling perf_pmu_unregister() when unbinding, defer that to
>>>> > the destruction of i915 object. Since perf itself holds a reference in
>>>> > the event, this only happens when all events are gone, which guarantees
>>>> > i915 is not unregistering the pmu with live events.
>>>> >
>>>> > Previously, running the following sequence would crash the system after
>>>> > ~2 tries:
>>>> >
>>>> > 	1) bind device to i915
>>>> > 	2) wait events to show up on sysfs
>>>> > 	3) start perf  stat -I 1000 -e i915/rcs0-busy/
>>>> > 	4) unbind driver
>>>> > 	5) kill perf
>>>> >
>>>> > Most of the time this crashes in perf_pmu_disable() while accessing the
>>>> > percpu pmu_disable_count. This happens because perf_pmu_unregister()
>>>> > destroys it with free_percpu(pmu->pmu_disable_count).
>>>> >
>>>> > With a lazy unbind, the pmu is only unregistered after (5) as opposed to
>>>> > after (4). The downside is that if a new bind operation is attempted for
>>>> > the same device/driver without killing the perf process, i915 will fail
>>>> > to register the pmu (but still load successfully). This seems better
>>>> > than completely crashing the system.
>>>>
>>>> So effectively allows unbind to succeed without fully unbinding the
>>>> driver from the device? That sounds like a significant drawback and if
>>>> so, I wonder if a more complicated solution wouldn't be better after
>>>> all. Or is there precedence for allowing userspace keeping their paws on
>>>> unbound devices in this way?
>>>
>>>keeping the resources alive but "unplunged" while the hardware
>>>disappeared is a common thing to do... it's the whole point of the
>>>drmm-managed resource for example. If you bind the driver and then
>>>unbind it while userspace is holding a ref, next time you try to bind it
>>>will come up with a different card number. A similar thing that could be
>>>done is to adjust the name of the event - currently we add the mangled
>>>pci slot.
>>>
>>>That said, I agree a better approach would be to allow
>>>perf_pmu_unregister() to do its job even when there are open events. On
>>>top of that (or as a way to help achieve that), make perf core replace
>>>the callbacks with stubs when pmu is unregistered - that would even kill
>>>the need for i915's checks on pmu->closed (and fix the lack thereof in
>>>other drivers).
>>>
>>>It can be a can of worms though and may be pushed back by perf core
>>>maintainers, so it'd be good have their feedback.
>>
>>I don't think I understand the problem. I also don't understand drivers
>>much -- so that might be the problem.
>
>We can bind/unbind the driver to/from the pci device. Example:
>
>	echo -n "0000:00:02.0" > /sys/bus/pci/drivers/i915/unbind
>
>This is essentially unplugging the HW from the kernel.  This will
>trigger the driver to deinitialize and free up all resources use by that
>device.
>
>So when the driver is binding it does:
>
>	perf_pmu_register();
>
>When it's unbinding:
>
>	perf_pmu_unregister();
>	
>Reasons to unbind include:
>
>	- driver testing so then we can unload the module and load it
>	  again
>	- device is toast - doing an FLR and rebinding may
>	  fix/workaround it
>	- For SR-IOV, in which we are exposing multiple instances of the
>	  same underlying PCI device, we may need to bind/unbind
>	  on-demand  (it's not yet clear if perf_pmu_register() would be
>	  called on the VF instances, but listed here just to explain
>	  the bind/unbind)
>	- Hotplug
>
>>
>>So the problem appears to be that the device just disappears without
>>warning? How can a GPU go away like that?
>>
>>Since you have a notion of this device, can't you do this stubbing you
>>talk about? That is, if your internal device reference becomes NULL, let
>>the PMU methods preserve the state like no-ops.
>
>It's not clear if you are suggesting these stubs to be in each driver or
>to be assigned by perf in perf_pmu_unregister(). Some downsides
>of doing it in the driver:
>
>	- you can't remove the module as perf will still call module
>	  code
>	- need to replicate the stubs in every driver (or the
>	  equivalent of pmu->closed checks in i915_pmu.c)
>
>I *think* the stubs would be quiet the same for every device, so could
>be feasible to share them inside perf. Alternatively it could simply
>shortcut the call, without stubs, by looking at event->hw.state and
>a new pmu->state. I can give this a try.

trying to revive these patches to get this fixed. Are you ok with one of
those approaches, i.e. a) either add the stub in the perf side or b)
shortcut the calls after perf_pmu_unregister() is called ?


Lucas De Marchi

>
>thanks
>Lucas De Marchi
>
>>
>>And then when the last event goes away, tear down the whole thing.
>>
>>Again, I'm not sure I'm following.
