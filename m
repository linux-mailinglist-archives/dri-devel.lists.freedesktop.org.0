Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797E0A5E7E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4A510E308;
	Wed, 12 Mar 2025 23:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IN0VT4vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EFD10E7DD;
 Wed, 12 Mar 2025 23:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741820453; x=1773356453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Pl/A6OZOzP1FciVNappVWkmGksNokHBdNIeBXZtzVCQ=;
 b=IN0VT4vRjt7XYvFxEKIQHmmD5iiglovET5/cz1/yzQBKwzGyodX+OsAj
 bAduJLn6AnyCOe+E63P3wcvBCX2UgPiH5et30yaYilJD4wU0u4VUth2uM
 qeValu4lLpSA8+1f8zcE9YeA7sqeYV9MoMajXsOu7RiaBDO78/FpsIS9B
 N0yC5eznXljDokNQlGo8cVKhdDRottI9zbnQNjpx+tIBExCzLAhtK+IBm
 yQwu4iYLRJfabPXTrIEbWI4YTu9jHhx9aIEX3xkAsighZ10h6wxyIcVMf
 7ljepoE3yUOq3FYrSZ5V3KbM6Vd3rWV9dxECLA8NGV1eUGhnVS6l8IyXS Q==;
X-CSE-ConnectionGUID: R5SHPML0TuWZpirvLdlduw==
X-CSE-MsgGUID: N9g4MEq1SRiDAJzwm5s2Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53571066"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="53571066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:53 -0700
X-CSE-ConnectionGUID: yWAf2mh8TjCXIrLixs7JwA==
X-CSE-MsgGUID: XT43lK2sRPi2XAKMvvJvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="120580837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 12 Mar 2025 16:00:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 16:00:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:00:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phrw/IIG7b9TzRjSbg6y9Ed+945wNZwdz8m1PmbOKWeSJgxCrM9Ik89DZGk9DUmx8GNvYIG1gReEH7ByF2cb447b1M2p1r8JhmFi59qN0n8Ne9UU4SOs0jKOYWbgTk80H7E32p6/NNVCoMU7TdmHHTzoMdbil0YfTikNpnsmUS6gNzXLq+bsOjHfaOgxq2zXpt0bfq1ZUtzwM68B0THxLgW33BShfh6fPtwzBcr7uisT8x2N9+l0TT+QsFO2G00WPtR1xQW5nL+tL2Ar1ISRyaBPPEhJ1JlH8tW1vEn9ptV8/Y0MaEM4IxtlAX6dJsUaGrdJ7IFGnRu1iwTd9xec9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K0+Ijt/56IoawP/qq7xkL5uj/o67iq36TByQongDKY=;
 b=cCnP3d+LxOorpFZBu+0id6lCZLDhrv7e5+3P4W56d1uGjwtRKf9bkoJGY5CAyXwzu7ikOmnG89oZ0hchYQnccrYZB35xa0kfAs49kEhHZ57QV99WVCoH4f8MBTNjChS5X+GhPA5MHKtFlmd2oi8pO/td7j7sZAxx1rVsGeyie5in//Lpi/8KNP0CjqgfNVNlLPC2G16BF7KIbXbBplMA0/SzRLhlrZLJofGy5KpGv8XkMAUXtMaguS5mpnE1t/qh+SxDsSXrE8tW6JockAdroD6rmFIhISOauhOmP75vM3MmlyZy/JmSvQT7Y80DLPzC/uEVe51hosTy/x4uqkTwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 23:00:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:00:48 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v5 4/6] PCI/IOV: Check that VF BAR fits within the reservation
Date: Wed, 12 Mar 2025 23:59:47 +0100
Message-ID: <20250312225949.969716-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312225949.969716-1-michal.winiarski@intel.com>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0177.eurprd09.prod.outlook.com
 (2603:10a6:800:120::31) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 971794af-d29d-4f92-5cf5-08dd61b9ba60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djRtUjYwd2tndyt6UTRNbWVzb1NRclI4THE3b2hIRXBvck12UDVuOTJSTU8v?=
 =?utf-8?B?eGx5bnZOMjlOVTVJT1V2dTJqRXkwdUhGNnBGU2lWVnIrUVI3RDNDc2FMSlZV?=
 =?utf-8?B?ZjcvUTVhSDZRRmo5KzRnZ0c3ejNEeW1zM1h0NEU4VmxwOXRwclVKSU1jN2xN?=
 =?utf-8?B?R3Qya0lCQ3ljSFk5QXdFWDl5T2lvbDlYM2VtSytzb0hOT1Fvem1QQzdTK3Bz?=
 =?utf-8?B?bnRhS2tDQW1BVGIwbmFSZE1yNWZMbVpNajdISHpmczQ1aWMwM1Jqb2ZFYXEy?=
 =?utf-8?B?Y291dFNsZ0ZUQ0VFOW9ZOGNIbTFaa0RyTHhoTHQ3MkR5NDhrT3Rnc0RLanh2?=
 =?utf-8?B?YUxJeWJEOERqZmlkSjFiZTdudmM2UDZ1WGlOOElkcDl5ZWN3YTdITnAzaCtQ?=
 =?utf-8?B?N1g1NCtpelh3YitLQ3J5VndMTGR4OTZqUHhwQ1dqYnUybkhHN3UzYVR3bWd3?=
 =?utf-8?B?QkhOVUI3cFRtWnh5aHNRVHFnYyt6MVdkOTVCdTRDb01QalBYdGI5TDZUR2Q0?=
 =?utf-8?B?Q2JNb2dFNERQQlE2dTIrMldIZkF5N1V5Q3QraVBVZzlvODFsck9iVFJQSmlr?=
 =?utf-8?B?TTExMDcvUER3TjBqTHEwYzhYcGlBNnFHYVJTaUJMZ2NvQ1hhUTZKRUtRMmZ4?=
 =?utf-8?B?RE84cVRXYTJIbjAwSVFCYmo5R1hHV0lUMUJTbXNGdmtGVklMakQ5ZTdvaEd2?=
 =?utf-8?B?UnhOVFhvcE9vV1kxMkdPS2l5RVh1VGUvWTY2UmtpN1JZSURBbEx2WmxmUHk0?=
 =?utf-8?B?Q21hNFZucXNvdkh1TThvQTE0dTJQdmxoMUlsK2o2dFBSNE9MdkhMTEIzTFBQ?=
 =?utf-8?B?dnBtb3ZPRUZmczZyTndFekl3QVZhSTBMNkFHMTAyNW5jdlpBcXJWdXczeVZw?=
 =?utf-8?B?aE1YZ1daQXhZbnVnV0htZVJmNitRSi9yY1JDQ0hQd1hRMk04OWdvNlBsMlAv?=
 =?utf-8?B?YUt5bTc3aXBabXhGK3pjclBFYkpkOE9UdVR5cnJrZW51dnJZRTBMUmNiOW5U?=
 =?utf-8?B?bHVhakFuY1lqZUNhWFpINWlaQnZlSy8xWHpqZEgzRk1kMGxmYVJKT3ljdWln?=
 =?utf-8?B?UzBwODM4aVY0MlMvZGlTS0tSYURyc0pPZ1A1ZVlsbnhDcnd4Sld3SGQ0MmY2?=
 =?utf-8?B?WjBScGQwKzRDQmhjZFpkTmYwT0grYjZ5bGV2TXE3TTVVNm0yMWdCdnZpZzNt?=
 =?utf-8?B?T0NZSzc3eG5IVVhqcWM5VTZDUlVOYndwMmlKOFFnVWpUNFpXdHJ0SmxyT1Uv?=
 =?utf-8?B?K2RIRW1iTjVIdTF2b29EV3UyNFo4Qk51VDM0cXZGMlVjaDg2ejM5NFIwcGth?=
 =?utf-8?B?RUQ0Y0szQ2JodWo3b3N0bHRTdWUwZnV4UFg0Y3Z0UTl0czg5WEFVZDJmTlZZ?=
 =?utf-8?B?eGw4RUErVm9WNkg5d2xyeXlUUmxVc2syVzFrZ3BXUDhBMUFHdit6YlhMZXZJ?=
 =?utf-8?B?WjNUclZ4KzJFZ09IaGwwbFNzSWdpMzdhVCs3OGdwOTdLdDBCaW5ta1QwcUIz?=
 =?utf-8?B?YzFEZXg1c0Z1bG10NWtQWFQ2Sm1YVzNVUXYxMzd2bWVUNFUxczEzUDFCY0RF?=
 =?utf-8?B?bHZieFVCd1c0WmZDbk4zSHU0ZzlXbXVhUEd5WHRaYWxkU3BJWHozeStJdGYy?=
 =?utf-8?B?SUdUQXV4MTdySHBJT0lnYlozOG5EZExjNjlDYXZlYUZ2U2VKdytBTHFiUG9q?=
 =?utf-8?B?TSticE44K3lhMEFkVXJyVzhtYlFzZHcwMEtBNXM4Q0pGWi9tR3g1MWlsTmRl?=
 =?utf-8?B?ZHhHT0p2ajMyU3piWGo3RnRPNVpHWkJQc1pMSmZSaXVhdXl1UVQwT3lVN0xu?=
 =?utf-8?B?Yk1aOUtncDIxMVZRaHBnZS9DaWI2YTkwMm9DNS9sZDl4bVdwUEtsYllQLzh4?=
 =?utf-8?Q?sVADQtOfVfS96?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS82UWlmTTlkRjAyYks0RCswa0c4aGJnQ0IzNHYxeUUzTUR3VVZMRTFiYkZX?=
 =?utf-8?B?MWViTTdRUjVyb3Vvbk9WTmwwQ0I4WWlPdnMveFNPVEJvM1JtdjZVUHRpTGJh?=
 =?utf-8?B?WEhKVVlrRWFoV0tTa1VFcUdZc20zOVI4WDlaU1BaWitLcTg5TU5VVkZKdUdU?=
 =?utf-8?B?NnNLTTRhYXdya2lXNzR0YlUvbk1zTVl2WmxaQUk3VGpLY3RrMG0rcGRsMzlM?=
 =?utf-8?B?VTFySHlKdjFPTUJ6NG1KQUdUaUgvaFREV0p1VXpNZmVHbU9OUmZvcno3eG9z?=
 =?utf-8?B?d3krdjZ2a3VLM2ZuMTFaS3orK25aR2pXMHN4SEVMajF2eHRrWnJpWkdDS1VS?=
 =?utf-8?B?R3Q3eFFhaVJKMndueVIxaG9JRzRCT2NscW53Vis1ZEVMQ0hxSFpNVXVhMkZG?=
 =?utf-8?B?ZWlYeFN5eGFQcVhGeElXN0VKQmhmbmx5VjdFL1FUYWVKMTA4ek1maTdzcWZP?=
 =?utf-8?B?MEE3Tkh3bWZNZEtCUE9kR3FGdEw5c0U3Q2plUzVydmZNRG40Vzl1VjVCQU9H?=
 =?utf-8?B?UEw0YmJRVEpSS1ZSdXgyNFQ5Mkpnb1QrWG9aV0lRVU9GVXREL0lZVUdGQ1RT?=
 =?utf-8?B?RHFJM0VsbnhxSUx4Q1lvN3VoOUw3dmpKbERGTzdxaHM2azUxeDBXeGZyZXds?=
 =?utf-8?B?ZVpJV1IxVDJmVEdqVlhXOUlNa0szaWtqVTZNamVIdjNDTlJicitLMTFFNGZQ?=
 =?utf-8?B?WWJsMSs5N1o1SVRJQ09pOWdXVEphckhLTndqKy9XK2Zoa0hNdm51Y21pZVZV?=
 =?utf-8?B?Uk9xUFdaQ1RxOWhhS1o3N3ZDbWcvSFJ1bWtQZTdKUWZBSXBXTHI4N24rNHF1?=
 =?utf-8?B?ZUhOTkhSTXdaVWRtVUthQVpnb1lEelZQR3VyY2FTQXBaeXRWTjU0eUxRMzhR?=
 =?utf-8?B?Qll2QUhEUFNkdmNFU0YvaVVFRis0MjVTSVlNRi9ORHF5RUhwRXBlNjR1RDZ6?=
 =?utf-8?B?VCtCcU12RTlTUWNSZlh2L3dtQ2ZaamkyeFljZmZCbXc1Z0tnSit3S01mbVQy?=
 =?utf-8?B?LzEzUVUvYUZ0L1BBSXh4d0RiVlYyRWE0T1dOa2VSSFFydzJ3eHBvZnZpcklV?=
 =?utf-8?B?WDRJL3JXeVJOU29pa3o0TzhQajFEVkNCNElwR1kvRm94NVdGajlyZ2t5VVVI?=
 =?utf-8?B?T3lqdG85N3VRaTBBOHpSMGp6aDJZSmlpb2hxUUd3UVBOYWdLNUZSeHpSeVVm?=
 =?utf-8?B?L1FDOUpqdlNNeHV5bjFqZTFUaHk2TUVXYzNVd084cS9TZDBvdUtXUGRMWXBs?=
 =?utf-8?B?R3IyRHBSempRK0xLVjdOMzlzL1Azalo3WmY5M3dLbVY5UEV0Zk55WVdDMkM4?=
 =?utf-8?B?YmRnaW5iN1F4TFAvd0RYVjNveFVNUHFSRFVaR3lHL1haVzU3VXA3di9yTFhJ?=
 =?utf-8?B?bnZmckNoTnVkemhPZ3BLZE1tR1ovaUF5VW83dndiS05NL01rUk8yT25ndXQv?=
 =?utf-8?B?TlZUSnRwZzFUNW5Dam4weUo4eDNMQzJsNGZuSG4ycWpsQzJHL2hFQ1BuMHBu?=
 =?utf-8?B?c1ZxRFRERkRjVWtVT0d5ekhCbGlBNDMzVzN6R2YwTWRJRno1VDRDYWNlOVgv?=
 =?utf-8?B?VDd1TGlHQnJ5cG8vN25RZTFycFBoZjI3U213a1RtZHc3RHZwOElibXNucStR?=
 =?utf-8?B?MzdrUzExTTRGb2dTSk1vTGs2OTZrdWp2ZnZKQ3Y4S01LUDlETlJ4OWVIVEdB?=
 =?utf-8?B?VGJEZW1XQWJsRzMyUkx0bVVjTXV3NDlxNytLUjh0Y0FLUGJRRDVrTHFiWHVl?=
 =?utf-8?B?ZlFWOUdZL1dzR0prdkFidGZ0azdEUk1yVnVhYzVrNWw5QzRpajNUejFQYVFT?=
 =?utf-8?B?Y2ZLZlNYcHJrSjRVN3hDTXJsaGg4S0RqQXYvbW5odDh5VEptT1d0ZHNyYnBa?=
 =?utf-8?B?OUtBZkxYVnM4ZkVOdmdFcEpJOUgyS09xbXBJMEovR1llaDBIMElZeUV2UGQ2?=
 =?utf-8?B?dEVmS3d4OEhNczJweENWbmw2dW9jYzQ2NDdBekc5Wm9rYWNjUVkzNXNNdmdz?=
 =?utf-8?B?S2lBb25LR0cyMkZZUlRWRnBZRkhrcUwydnhTaVdQcHpTdlF6dlV6Y1JMTzVl?=
 =?utf-8?B?Z01hYzcyQlEzV3NiY2t2OW1wYVZFVFBveS84MGI1YTRnMDJRLzQvTkc2QnZW?=
 =?utf-8?B?TU9rZ1pxOEJuVkpteGc2OCtNQk8zUWtkZktra1BFT2M3aFdMbmY1amc1cExG?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 971794af-d29d-4f92-5cf5-08dd61b9ba60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:00:48.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYXAPKpn7Y2XwZRNWMx+lekYmkWxYJmqt6Q9SU3LS56lKRlXpsGh9k1L6+7+WBOAvvjvQFq3/QoLqK/Y08AK+hKiUm2PuyELUPJZ/4zBbAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

When the resource representing VF MMIO BAR reservation is created, its
size is always large enough to accommodate the BAR of all SR-IOV Virtual
Functions that can potentially be created (total VFs).

If it's not possible to accommodate all VFs - the resource is not
assigned and no VFs can be created.

The following patch will allow VF BAR size to be modified by drivers at
a later point in time, which means that the check for resource
assignment is no longer sufficient.

Add an additional check that verifies that VF BAR for all enabled VFs
fits within the underlying reservation resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 7cc17e898cea7..d6d63083884e6 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -646,8 +646,13 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		resource_size_t vf_bar_sz =
+			pci_iov_resource_size(dev,
+					      pci_resource_num_from_vf_bar(i));
 		bars |= (1 << pci_resource_num_from_vf_bar(i));
 		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
+		if (vf_bar_sz * nr_virtfn > resource_size(res))
+			continue;
 		if (res->parent)
 			nres++;
 	}
-- 
2.48.1

