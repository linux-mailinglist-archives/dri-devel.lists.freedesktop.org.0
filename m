Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD70B84F2D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7813B10E1CF;
	Thu, 18 Sep 2025 14:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktVnduWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166D510E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758204168; x=1789740168;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sZmrKwkIyzBNZTTHPsV1zrE2zWV0cjLyZEvw7tOBmvQ=;
 b=ktVnduWPaKlKoxC9UatuRNIKbSHh0vRni5eOq6ycVUx28qpZOffH+tk0
 fgGXtSWPlxIH5cXDS3ihaMMJiVfco+Yvi3dGZBE4nExmycxSNeQOCz0xi
 eZ4TT/EBTOC+qHqeE7cEQoPOuoe7yPsKCug9UzKlpXueJ1sX6mxUqMDv+
 m1QLLZ2XHRp8UWmyYrkSz+IdxwzUkiyzShxjX/mx5/YsgF+OP+1tY0vFY
 3YMbpv+wOdwy5UGIHh0F8o33PIXz8IdmmlIQ7GjOYszVd+h/yBH+aW4qW
 5pXbiWihPbG4UB66NfKzVOQXcDUU03kVLLwiheSxeottioKe67uv9/vFq Q==;
X-CSE-ConnectionGUID: ib2cgvvJRXuMd2kmFoP3TA==
X-CSE-MsgGUID: WqTTScVkToCwX2AoIwdCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60684196"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60684196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:02:48 -0700
X-CSE-ConnectionGUID: CPWczG9JSye6I+s3ZfRZdw==
X-CSE-MsgGUID: DBMkKts4TVaehNBvzGP9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175120547"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:02:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:02:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 07:02:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 07:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW1dkEd6JYx/A4XLmpSkOEFll3xWZqib34Jhnf1+S/n0WgKHiMnX8ME7mQFzfMpizdQYOVc1QH6E5Jw25FyKAV7NX4w0vgPpM2QACzhRI/wMvXDIPv+/4hGr6wGW9vjFaxVjcT1DO33oowXL/gNCozwB6P8w8v2b08DM3y64WFBUe78g7qbHiK4AlOWwkZqOpzSbxer1c7n1pqYqojuVxfAa4iGEYX8TMKECxB77bPQbMmgu/gJ8OS/KZA+uRnAxm4/5vLWStPIDbPhufl64wHSk9elpbXFdZ4xocSXhWjrsZJEu+YweilzKQT8oUuSFpmq/AkrncYsDrgyDfa4uXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHlQ7TBR1cqFqB6QZKDOHBDASC2F65AuAf5W79KkoXM=;
 b=KMyEn+EcpUpfx5Hnkd3NlkbsrjLg7u8laMveGAlJ4DKvDtGoUWKoSRVE8q0sAlBF/hc0WoO3tY9DwvGZKVkCQSGar35OsyDU3FEX0mlgjcilg4/a0uWDizZOX2pes2QD8dsxQisSPdJ22BYn++dXev9+GjZbFOEu4JMzFLqZk9N5x6T2Wg27wjQSQEqo1TDJBtbajiC+jtdZUHjs9ngFxGtCaioM7SDdBxmWsFteNeHqK5ZeFRizvzLSUfrANR3q+idQGTT2wVmzAax90tC2hKpqmykZfBNqeWN2mleEVndXjpihTViThUslp8Oh0aEiGyKyI+Qg6FDTg2h4ifjrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 14:02:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 14:02:39 +0000
Date: Thu, 18 Sep 2025 09:02:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/3] PCI: Release BAR0 of an integrated bridge to allow
 GPU BAR resize
Message-ID: <aa2hao5kxnim2z2lkbg46bxea6f4w5tlfew2anyesoeufforku@vrojv32yarwg>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
 <20250917-xe-pci-rebar-2-v1-1-005daa7c19be@intel.com>
 <b460e7bd-4496-14c0-87ad-6b14639bff0a@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b460e7bd-4496-14c0-87ad-6b14639bff0a@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: a36d5019-9ff8-4482-71aa-08ddf6bc0635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?l6fDq+hbHW4/XGhaX0NmbRFt2AOO+Nj2PpoBPFOdZ3P1/jaSSIAy19ZO2T?=
 =?iso-8859-1?Q?P3n0CTJDQTGCRF5u6QSu0p7SNtes50BzvMyXouylGft0/B4hBZ9Jz2z0OY?=
 =?iso-8859-1?Q?CTT30AIqAy1dh50L5jIMtvzj3Jil2TX/pv948GXEMhosf8LrC6RJgiy6Kp?=
 =?iso-8859-1?Q?SqjSyX0zeZFK+JKQzAXKIzn1FNWFby0kEZgCKpjoSonA0jT3ZcJapikOQ9?=
 =?iso-8859-1?Q?U3sIf9Hu4qsTRNTqVWjQEnCwG4AQpykqLX4MCkKp9uz7jnR+faiw0xn8mX?=
 =?iso-8859-1?Q?wgJe3qsW1M0BQATh7n/Ylj8y8tPiURtvWbg6CR0ho0vnBpwu3cUHnhhZLI?=
 =?iso-8859-1?Q?vFA3c9RMDjysckVxntvDfQlN6U2lFV16w8iajx9HXJWztAF8hliDONat4e?=
 =?iso-8859-1?Q?iU+MJ8gL9+YImQRTBmaETULY3hgLEd58uD21/MVdPntlQ7Z0zMDE5wQh0E?=
 =?iso-8859-1?Q?ykEwZuLzgClmH7ob8qRrYbwRefNLYlPT5rwtbrD+l5g1JXDv0nDqhEZsFq?=
 =?iso-8859-1?Q?8dE4jQoiRkPLVTbLdt4n9BW6SJSGUiQmlQSUFf9d1gC8lzpACO8IzKH4kg?=
 =?iso-8859-1?Q?hvkg5qqnd3l4a/32QFTA45/i3kdaKn1+NswCuxbxAAeyzrQlTjOp5VeaeS?=
 =?iso-8859-1?Q?EWgmvVGJyOUgh4WwfSgSdOnCG7JbAs9KlDm/xWy1sSUS3eGd6rHHEcsUiA?=
 =?iso-8859-1?Q?/jz6aIwW+wEdzVShNi9tJTaCpVuTSfDUDwZ9ucJIhnzGUhFd16KjXb0tzT?=
 =?iso-8859-1?Q?cHQwae5ospbn9DF6Kw5foK+wqK7FuSuyyVtGyTmWZ02ZuL+VStXU9IZSFe?=
 =?iso-8859-1?Q?Xwk84tU68inOdggzm76IP3JjXKLTJGkScbJybvJ7apXqDDA3hSxTLGSpMb?=
 =?iso-8859-1?Q?rdpTfmzBwehlO7GTMojf4tPuJ/DY5OX/OcNTMKiO4+LvtvcQt8jTj3HGm/?=
 =?iso-8859-1?Q?fAPnA43YMcPtf5QmOZ6WtFl5EFx/SJ1q96D2n8+gBOA383c0I9F7pB3yq5?=
 =?iso-8859-1?Q?ZYj+rLnM7UEgcTSWgOTJwt4Xojxo1e12cthKeA7/Xxtq8rZGrrjz14NRKf?=
 =?iso-8859-1?Q?0OZrAdZljp05RJeO0UE8YnIWNMrseJPql6s0dcF1HMEt7N9w/67yzhKEru?=
 =?iso-8859-1?Q?Nh06g7+Y1zCNvswKEQ6yQ8WZZYRQlUw3qk3NZit0WguZ6ts0JlLAURdKZI?=
 =?iso-8859-1?Q?CUF0ficmuN7MRUejUHTc1ySav412efTTcoj/laI1OCm7oHODAtdXqGNQBK?=
 =?iso-8859-1?Q?TfmJOFvAKBtRL4jsy0HXGHFy0LUxJbtqZJBEMQIaC4vQ90/3MjHW85MHlP?=
 =?iso-8859-1?Q?AK80wHWEN//7t4LoedzYBxUN4hzx0JytcCj0ZOlYTNkRiTb4QYkCm/jG0h?=
 =?iso-8859-1?Q?hnrEJSoFDBspIwH4z1CcQItGYwl5jJ9dAonWoFArd9+Ymc+zlqxOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JOUkJkGfPXfK+eyUEIs8GrW6Jg2wU7E7BNXAaQ6/BJSmVnsN7ieaiXMXSN?=
 =?iso-8859-1?Q?wero8F+OgFnRF5h9+HOR/SCblWN9hgGj4hAt1SZrAQi5I77Y3WxR8Q6NGU?=
 =?iso-8859-1?Q?nBN71zSau0iswQx+iglcK5vGPyoqbZIgkyTClov8gEtHZnBMvHV9HxND+j?=
 =?iso-8859-1?Q?M1mWBYDNV4LH1zZOtkgk6gCbItDSI4bQilcd0Zp4DgLqYv8xmlS9ZERQIV?=
 =?iso-8859-1?Q?cwpID24ZkBvH2EJPlEyI9b7LJVKe5Oi5btvPtJV5jehvC/j/gXIFR8tBah?=
 =?iso-8859-1?Q?Z1QAh9i9+zGRBLD1iwL3OOtKLWaF7x+0XMKAEX5OZ8bpsFncjSxagFGDLY?=
 =?iso-8859-1?Q?4Zj7sofUNhygpi2ZazwztPVC6wlOJ9AgvOuN7cDWDIw/NSS+hxNdJJCMQN?=
 =?iso-8859-1?Q?yzg2r9a0ARvXv+MybfIeKKZRYsrZCWb5tFb0Vg+kIz0sUO72rbMss8izyl?=
 =?iso-8859-1?Q?DcR5mZKxWcAbG/CjWYqKL/E29RcUK5nHU16utAY0XdFR2BLbS+e2E8DH0r?=
 =?iso-8859-1?Q?46N7vXDET0LBVOQQ4AnEZV62AlINnWEc1I4J9QUJc6jhMAXCp7cWKPxJR7?=
 =?iso-8859-1?Q?Y5OvdILI42iAF+sSK/r6PdvfxnXM7AmkfFysL/u6l886BNLTAZndHLj2Ub?=
 =?iso-8859-1?Q?mZyZSfYbCDByQD1bJRXXL/YL7ggOsUQWxmnWPiwHB+Ard8fJULDxYt2zET?=
 =?iso-8859-1?Q?mRtxgE3AOoiFtEzq6M5UX5jh+5VGhgN2TF2vnHf6XgJLe9DIVZzgRpGo1R?=
 =?iso-8859-1?Q?gnyQ33lvnB21fsQXXibCfgM/gx2p+2ymb1+Cs6ygvtlk9DShCk5awCFb9T?=
 =?iso-8859-1?Q?YbI0vN6pL/LgX6mHzHClD+UVjymnX+RTHZ2j5h3vvLJp82pGmUrqJhyxRT?=
 =?iso-8859-1?Q?7pf5+4YUaz4NzwoDnGwXCGPtim1p5qO560zB8rBfSOYy/GoJ2+gXBsOWvx?=
 =?iso-8859-1?Q?afWxF/UKK83pZS+qghQS2rfzf1FWtwaf2gRz5hhaiRRCFlw3nPIlDT6Eok?=
 =?iso-8859-1?Q?gLk1hnISJ/HgT680ksOeoYo8EhtM1anD+lAVQD3o3KWVkBHzN12GVFf2Qo?=
 =?iso-8859-1?Q?VmtU0tqaMHpiQ3xq0jwJaT9kT4h1VjtTdiWNchJrdmEBUE+jPufX4Gr4vu?=
 =?iso-8859-1?Q?b88M9hlbhMH2lAzMm+xXdlHMcf1L2h8nnrbYYpctLbNixeQUYWugqDPeJ+?=
 =?iso-8859-1?Q?fx5lHeCjRxi5ugyxWKVkwcAvPLZ7A+v1WR3Yp146xq4ghE0D9bVNf2Z0dM?=
 =?iso-8859-1?Q?m8b2T4PzhAuY3MGwaXcy4fP15v/YYO90d1l2ZTO8TwqO0Tvm1u8/PNrbFe?=
 =?iso-8859-1?Q?YbmQ11E8iJgnPa5xKakaLqhUFqN2sQS2Eo43kesiYJ82idA8UDKZ4IMRf2?=
 =?iso-8859-1?Q?ndsQDp7Eqj6HWDWnQZEA3Tg7iWdlrmc4FaS467QyJ36wXHVrWBf8unARBz?=
 =?iso-8859-1?Q?61YXl11ZC7VVOKWiwVW1qQDBhhYeK62Zd6OopKtomOQnPpvwvKbjV8KL8G?=
 =?iso-8859-1?Q?FJZFFMi5lSvq20IsV5aVJwmipfdkclRn5rYQ788186lKOnSXIGNO/IZ1+W?=
 =?iso-8859-1?Q?4wJtOaerRVeyL/BxnN7AoSe1FmuqbF4cRRYUQ7Vf9ZbrPj5Yjh4YSwkm2m?=
 =?iso-8859-1?Q?kfLZilV9/yMyBY/KPVXhLqMYvIpEJAJFe87/OWPFOhn+JMZpM96cjysQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36d5019-9ff8-4482-71aa-08ddf6bc0635
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:02:38.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Stgt4uh5fTkbvSESRvjm+r5XSSfhT0hO2y4jOyzs2+JLjjUwpTwO/xv/F388aXDuw7T0mpgsZ5eMoXLp4Ss62k118NT+oBqdFPrdJSiQj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
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

On Thu, Sep 18, 2025 at 02:45:17PM +0300, Ilpo Järvinen wrote:
>On Wed, 17 Sep 2025, Lucas De Marchi wrote:
>
>> From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>
>> Resizing BAR to a larger size has to release upstream bridge windows in
>> order make the bridge windows larger as well (and to potential relocate
>> them into a larger free block within iomem space). Some GPUs have an
>> integrated PCI switch that has BAR0. The resource allocation assigns
>> space for that BAR0 as it does for any resource.
>>
>> An extra resource on a bridge will pin its upstream bridge window in
>> place which prevents BAR resize for anything beneath that bridge.
>>
>> Nothing in the pcieport driver provided by PCI core, which typically is
>> the driver bound to these bridges, requires that BAR0. Because of that,
>> releasing the extra BAR does not seem to have notable downsides but
>> comes with a clear upside.
>>
>> Therefore, release BAR0 of such switches using a quirk and clear its
>> flags to prevent any new invocation of the resource assignment
>> algorithm from assigning the resource again.
>>
>> Due to other siblings within the PCI hierarchy of all the devices
>> integrated into the GPU, some other devices may still have to be
>> manually removed before the resize is free of any bridge window pins.
>> Such siblings can be released through sysfs to unpin windows while
>> leaving access to GPU's sysfs entries required for initiating the
>> resize operation, whereas removing the topmost bridge this quirk
>> targets would result in removing the GPU device as well so no manual
>> workaround for this problem exists.
>>
>> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: <stable@vger.kernel.org> # 6.12+
>> Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/pci/quirks.c | 20 ++++++++++++++++++++
>
>Please include all relevant people into submissions. You've left all PCI
>receipients out (except me).
>
>I also recommend you leave that part I put under --- line into the
>submission as it explain my position on why I think it's reasonable
>interim solution as we don't expect it more complicated solution to be
>something we wnat to push into older kernels (perhaps mark it as
>"Remarks from Ilpo:" or something along those lines so it doesn't get
>misattributed to you).

sorry, it seems `b4 send` that I recently started using behaves
differently than git-send-email and doesn't accept multiple --to
args.

Lucas De Marchi
