Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D10C82C6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 00:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEB310E325;
	Mon, 24 Nov 2025 23:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkJc5uDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522910E32B;
 Mon, 24 Nov 2025 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764025753; x=1795561753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rFMkxEJYtP9I04/fEW5184Wg7uqHYIl6Kadzci4xaqU=;
 b=gkJc5uDEi2hPMdrcCEK2q+5zmVJDYYCTRYjavqPtULZHuAXwND1dJoC3
 l5mx3MC1KDCZJ6cA+xp8z/x84gT83JIwjNYWAS3ME92vvI16b3lAJ4rfJ
 W0cYvzRppK/fRgZBQCPpEFJvpU2ZuOcbxt53ogvdTGUKy3w67yURwpNZa
 OXDwQpP/qqFw/0ALLU9M7rCUdTKPB/MQIAe/hqh3cmsxERs0TqOmR1+0k
 z3OBU12dGgBE70wnFT4SeJywIvPo3xHNxLwSijYQDlwzG+r4bRS7hnaKT
 8giIiCM/z2Sho903WDLoZydqXWAN12RhHgU8KwcN6+gl6+rcNwdwRHb6J w==;
X-CSE-ConnectionGUID: 0uDdOukYR/uqQXFN2v5yjw==
X-CSE-MsgGUID: q4zyjrxmSgi/k79QnB/vnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65923879"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="65923879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:13 -0800
X-CSE-ConnectionGUID: jC2OKdiEQNCEIXeMbJ3uiw==
X-CSE-MsgGUID: BvcmSaiwQdePxw77Ya72KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="229739041"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 15:09:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 15:09:12 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 15:09:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFTv3Bb27k2110UZuJxBuNEur6gc0faN4A71SW2jp+A8NHKQmrMU7TKQRZwPQUktAl0HbnqTFWcIkMWE5M9AQMEVvU/995h5WnpRtm6ViAi25XupqmXbYiiAS17jfVxc47V/Bz+8mxaiRnFF+nl1hg27X7jqTCcxH+VOzRRF0zBoQx6yOO8/BeswJ6PBMA+UBzunlKSg9jpFh+DsbXwmc9vwN6bzzMXDS4i8hUSlSoTARhnmCYbEJG0opM5XWR1XJ3u+Ttxhgl3VuiIxu6/Yr9xzORZuZXHJ+BqlNmhA/BjvOIfOVtoGqDc8gNi6QeC+YOG/pcBN3vmwEVWR0aRRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUpOUeqM9kCoKM1CfOCgA8+YQPtw3nVEBDtNZKNKZa8=;
 b=qGA2WRtejQJ5osdXyhzUzVPhazh+p7JJgV5UJ3Bk1twZB95So64/mJyX/BF8i/l/6Zsrm47iGmaTgg8PZtyB5lUcO1MT6vnWbjME/gcilsICS9sXJQR9pKKsirW5JXmFp0d9uMoDQmAzwQX/7HQpM+ELkL4yolOyjXdwaMXVG2SCdTqsa27g2A5cx8Lm+UYJiBDEi1aCWgsucYI4HhjKhVzn5Hu8A7wiV19C7cd4IT3zyU1m+t3qMkfCpV8KXhph2/iEZIxzyW7lw7KnSt+duFUZxIZssAVasUQ6X296newM6G5Z/5Iry2yOGfOGeOQ78ZtclOuYKWtqvQxCj5y1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:09:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:09:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v6 4/4] vfio/xe: Add device specific vfio_pci driver variant
 for Intel graphics
Date: Tue, 25 Nov 2025 00:08:41 +0100
Message-ID: <20251124230841.613894-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251124230841.613894-1-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: 102687e0-ac9f-409e-7a69-08de2bae79ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWpYVDBYMGU4a3pzc1BaRXh2NlNLOThDSnNXZkZHaW5NcnFaUVFDSVBjdUFE?=
 =?utf-8?B?R2tGOGFsUDZoZkZBdmJPY1lHeThTRkdUQk1aUHo1bzJsbmhqdkhXRmJaYXFq?=
 =?utf-8?B?TzdVMVN2MkgwL1gyTDVmUENBSjhmOFpDaldlWWFFVmZPeUFSdzYrTk05ZlE5?=
 =?utf-8?B?c1VDZXRkeDJFUXJma3BzL3JBTytkSXFNWGJMTmJKTWp0RGY3NmlHeFRRU3pR?=
 =?utf-8?B?dVVXZkNGbDhrWmpnOUVmbTdiOXg4clFMNTRkZmphSC9XNDBYUEZ0SGY4U0FO?=
 =?utf-8?B?Q2cvdjRuS21lZXNaQVlnV0o5RWZuWURmRm0yb0Jhc2NSNFJPbm52TGh3RkYx?=
 =?utf-8?B?b1VQbENMNTB6YWorTWVPSUU0K05CMndvTmdYYmpYSnV5cWUwaXpvSXRyU2tn?=
 =?utf-8?B?TGdIR1BXMTVIODR1UEN0RlhzM0RwYWczOUJwMURQWC9NRmV0ZnZHQktPRmk2?=
 =?utf-8?B?c2M0VHYwNTAzajJTNFZiU0t6b1ZnZGl6bmk4SzlxZW5VTitzeWpQYnNaMGhF?=
 =?utf-8?B?Mmk2RC8vSHY3RTJUWEFMcENLamNaRkdqek45N1VrdXhGVnV4THZXZkI4Z3ZE?=
 =?utf-8?B?Vmp4bktVSkVaTjlEeTcyQ1hHV1ViOGlHVk1pM1ZxWWlybmtVY2VIZmt6a3BG?=
 =?utf-8?B?Q2dHajMxY2ZTZkdpRVAycUFpV09STkdJSGtOMXRUa2dZN3ptZW9yR0lpazVS?=
 =?utf-8?B?MTVTME5BNm9paVZjd0FjdTZTQngrUGtYNzFoOFdWVm0xbkJ2VzZTcVpHMjFq?=
 =?utf-8?B?cFdUa2RqVGgrV2ZRRTZQNFM2T1RiaVJ6VjdrTW5hTmlIVW8wRFVSQ0ZibUtP?=
 =?utf-8?B?d3FPSllhUlN6Q1VJWUJNM2JtV2cxNHRxa3dpa1ErQTBUMzVjV3krdG4vZWZq?=
 =?utf-8?B?amp5QTJrWGFUR3dUbVdiSzZsQkNKZnBPWFMzMmFBWVMrNEQyQXBjbHdoeVlB?=
 =?utf-8?B?RmJXRDVJWGx0cS9iTU9iQ09aam1rc1pUSlN4QUlxSUwwcjBuaCtFRW5rdExx?=
 =?utf-8?B?ZzBCS29kUmxyeEE0ZjF5Y1FzZENNOThORWpVc0NJYnpuYmZXWS9id1lzbjhP?=
 =?utf-8?B?bVU2QWs1K0lkWm0zYWFQYTVoUHMwM1c4WXlUb1hmaXNra25yNTJ6dVdPZGk2?=
 =?utf-8?B?ZGxnWXRzOUdFTHdualA2NHdPSnhCQzNzazBuYmllbllDelBaS2NEWmY5aTV2?=
 =?utf-8?B?M21RbFh4WmtEOXV2S1Q4cUN6c3hzMTc3ZnpjUiswR0cwY3BoVlFERER4bDdW?=
 =?utf-8?B?MGNYaVptcmJHUnN5K0k4Y080cTFxc1RvOUN6T1NwVW9kZTQxNC9TNnR4RXhv?=
 =?utf-8?B?Z3JETkxJU3JYLzg2Uk94aTg3STZvOFRQK1VYTVJocGpFWURFeGg5cXhmWGY1?=
 =?utf-8?B?czFzZkYwSXlYSXFzbmk2cGFqa0pKN3hlZnh1MHRXOW1Sc0xVWTI0S3p1c0E2?=
 =?utf-8?B?VENLblY4R0ZiRjd2WGxoWk1MMExkTlJ5alo2NVRoeGZVVk00ZmZUNVZsZzJj?=
 =?utf-8?B?ZlJQUjJqM054V29WRnRiWkQzZHhwSjk2OFNPdXhmWWl3b0xMS3NTci9ySUZv?=
 =?utf-8?B?RzdSN09OVHExQXZNQnJrNy9RK0Q1bzhhNmtneTVLSjF3aXhNYkZsMFZ0QjJL?=
 =?utf-8?B?N04zMzdMbHk5TGZVR2lSbElianZxY0dINGxqVjhaRm8xdDdQZ0FEdU5lMnFX?=
 =?utf-8?B?cUlzVUxPNDNVeUIzSk0zSm5kdncySS9PVFozcm9vektkVVlSaHNHZ080R09w?=
 =?utf-8?B?SjJkSjNnRUZRVHg0emh5bDc2LzhRZEpnRDUycmdXQjVTUkpqMHhveVQ3L2I4?=
 =?utf-8?B?YzlHODJmcXVrM1VacHE4SzlDT3VBajV5NDk2OFVGYXM3cHR4VFBNTUI3aUZ4?=
 =?utf-8?B?U0gxVHJUMk1XdzlQZU1kWmRzaVdSRmI0b3NLUjdZWG9tMW1VZEhBRDg0SnpN?=
 =?utf-8?B?aUdpUW1tMmY1TEsxR1kxa3dYdTdKQ3ZSU21sUTJXMnZSRzg5ZDdMRVM2Rkpv?=
 =?utf-8?Q?ZMsLx/4kiiw0HnMkCj3VQJ3WhBSmEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpOWWVWSXc0R0E2amZqWUhXTEptbHcwM28yeTBYdXRxWDVtU1pzZm43NjZo?=
 =?utf-8?B?YjhPakZCcEp1ZWFDMFdyTG5CT1llaFF4bjRPMEtuNEtBc0Y4WlNKdTVmU25X?=
 =?utf-8?B?cDJXZ2RQdWdNY1VYWFRGK05YZ2tyakkxTjNYb2hkMmU1WWQvMDVvYXJZbU5y?=
 =?utf-8?B?V3FkU2ZmR09HV3pBakFxaXZCSGtCQTFXTjlzdEpGSFowbCs4ZkNpN2pBRHd6?=
 =?utf-8?B?QWYzRDl5UC9ZL3gwdk5JM3dvSUdZa3hHNFJYOEhiMUd1ajlEZDdET0R5MmVT?=
 =?utf-8?B?NjdYZnpFVlN3MVQ3Z0xneStVTjRWdktqQWhTYk5BR2piQ0dlYmdiSHpxTEZW?=
 =?utf-8?B?bHdjRVNIb1N6dDc2QzE2aTB0S243TWJVeHF1QUtCR1pjbmVOMmx1QUJhOUFW?=
 =?utf-8?B?Nkhzd2RYSUxzNnY1RDNZM3oxblQzeXBVY0RzV0t1ZlFjbkF3Z1VMR2ZPTC95?=
 =?utf-8?B?RWUrK3lLWnJXd1N1Z1krWEJvclRWRkNrYitmM3hoWWpFWksvbjhqbFZOcEwv?=
 =?utf-8?B?M0I4clY3OVd0RE5ZODl0ZXFLNjNLekRiQ1IwYkVQNVNuUUJaZUM5YU83VDRQ?=
 =?utf-8?B?L3hzM3VjSWo0OFBqaEdoMjE4SXd6OUNlbmw3ZHlxVmM5TlppeTlYU2IvYXVx?=
 =?utf-8?B?V1ZoOGpUd29XbWhFYWNLb2lTMHp0ZU5pWHZ6bnNRZGdWVlBtOFJtS1pTTE5S?=
 =?utf-8?B?bEp5MGJpZ1dTODkzOUJGYlhQYjNmR2piOVRGRExTKzhMSjAwSGJ3dlV0UStO?=
 =?utf-8?B?cjF6bENGQXpjUGJQLythMmFOeWFMMEN3ZTNoVjg3ejc3WWJUbVo0UjUrU09r?=
 =?utf-8?B?V29BeWNPT0FPOHo5aG4vWkI1QWEwU3B0a3o3bVNQUFcra2ZmTDB4d05yWloz?=
 =?utf-8?B?a28yUllUeGZIcUx5VjF0Y05EMFgyNmt3MkZybm41dy8yKzMvV2FYR3hIQzRl?=
 =?utf-8?B?N3MvRlBNZ3JEUHJLeE1WYm94RTRzeWVEYkkrR0JUbnBReVhTSUdMaUpPQUZD?=
 =?utf-8?B?NlMyTnJJNGpxL1lNTHppdFYvMndqVXRHWnVBTkFzMENHVFFvRGJXSDFnVTV3?=
 =?utf-8?B?REJmU2VBck9Vd01Xc2NCaUNzWXJEVHNzWDZSMlIyekQ1TUFVejdmR2Rta1Bm?=
 =?utf-8?B?SXFmWmdpWjlndXhFRFVqbW50clFQVklKRTA4K0doUTJvRGN6U1VKbXlDZjJN?=
 =?utf-8?B?SENLcUo5K0ZqZ3ZYYmJ1NGxtMlArYjJRUjRRbm1vczZJOFZxQkYybzhRMnUx?=
 =?utf-8?B?Q29aT3ROaGYwZzJrRWJSTHZYS3VkcWdOQkVWa0FGeWM2bTd2KzlYMytJZVEv?=
 =?utf-8?B?aitla0FiV3ZOREp0MGpMbzVqaUs2MXVtYlhpNmRDZHBXNE1lQk13bm1MSW5i?=
 =?utf-8?B?OFJhNTRqREZWNGNCNFJRN2h1ZEFXTldNTW1Tb281ZVJ1aEZWV2V3S2dmeW5C?=
 =?utf-8?B?aFpKOGRaNHA1Ylp3M2hvU2djQ1JMTXdlNExPZENzUmNPU2pTbzA2dXJKbGo2?=
 =?utf-8?B?c01WV2ZpRmxod3Z4N2hiZWZ5dmdUMzNIem9rRy9hK1g3L0ppaUgwUzgxdERZ?=
 =?utf-8?B?Tkt5d2t2TkplUnZja01YZEhjM2dIWEZtY0pwdVhIYUV5MVU0dnlFeGZhNlpE?=
 =?utf-8?B?WFMzUmpmZnRoUEg1NDV3RGNNekRCVUtvdjNqOTZSOE1UMytsVXdPUkNvWVdw?=
 =?utf-8?B?OE95WG1LT0phWDlWUDlWZTYwclBSMGpPeFJEL2dmUm5WNlp2L0NNdkRQeEF4?=
 =?utf-8?B?WlpSNjI3NnpGMklBSEdrbW44TEg3NnBJRjczeE13T2J4L3VoR0VIUFQ4Rlg3?=
 =?utf-8?B?Nml1R05YMm1OZFZ2Z2EzT250ZHI3SkVxb3l3YTF4VlNpWVBhMkd6N2Vhb054?=
 =?utf-8?B?ZTBqUnZlRnFWVXVSaTB2Z3dZYlNGSmRHYm45RzVnRS9xU3RBUkZHM0hScDBP?=
 =?utf-8?B?bHRkYmQyYUNvaVJYbmt2TDlSV1dRZS91WWFYbXBmbDkyeHdlMkJRano4ellJ?=
 =?utf-8?B?RkJrZXhkcXpxbEw5VTBLbGcxUmZpZUN3eSsvbHhqYmRoLytuSzltUy9OblFs?=
 =?utf-8?B?NGk5NHRhNWlmMVpDOGtoSHFVYU1RRnRiVHJNQmhabUw5UEYvdWhXQmhtOTdm?=
 =?utf-8?B?NzdqUStJUWNaRWxPakl5WjJQL25kR3pDNFZjRFMrb1RYbmxERTdVYkN3bFRO?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 102687e0-ac9f-409e-7a69-08de2bae79ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:09:10.3775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF9QqLFQttjbFfHsEPSUaUc8pqrq+Jd12YdCcjdlpMgWzsAMDyFmeQwUMrXIxK+E8AexbnbYDMKdxX+Qa6hIz1/IIvETZM9wyDRo4bZQ9eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device and uses API exposed by Xe driver to
transfer the VF migration data under the control of PF device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 568 +++++++++++++++++++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index acc951f122eaf..adb5aa9cd29e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27025,6 +27025,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..4253f2a86ca1f
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables device specific VFIO driver variant for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..ce0ed82ee4d31
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <drm/intel/pciids.h>
+
+struct xe_vfio_pci_migration_file {
+	struct file *filp;
+	/* serializes accesses to migration data */
+	struct mutex lock;
+	bool disabled;
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+struct xe_vfio_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct xe_device *xe;
+	/* PF internal control uses vfid index starting from 1 */
+	unsigned int vfid;
+	u8 migrate_cap:1;
+	u8 deferred_reset:1;
+	/* protects migration state */
+	struct mutex state_mutex;
+	enum vfio_device_mig_state mig_state;
+	/* protects the reset_done flow */
+	spinlock_t reset_lock;
+	struct xe_vfio_pci_migration_file *migf;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	mutex_lock(&migf->lock);
+	migf->disabled = true;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_put_file(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	xe_vfio_pci_disable_file(xe_vdev->migf);
+	fput(xe_vdev->migf->filp);
+	xe_vdev->migf = NULL;
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->migf)
+		xe_vfio_pci_put_file(xe_vdev);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	mutex_lock(&xe_vdev->state_mutex);
+}
+
+/*
+ * This function is called in all state_mutex unlock cases to
+ * handle a 'deferred_reset' if exists.
+ */
+static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+again:
+	spin_lock(&xe_vdev->reset_lock);
+	if (xe_vdev->deferred_reset) {
+		xe_vdev->deferred_reset = false;
+		spin_unlock(&xe_vdev->reset_lock);
+		xe_vfio_pci_reset(xe_vdev);
+		goto again;
+	}
+	mutex_unlock(&xe_vdev->state_mutex);
+	spin_unlock(&xe_vdev->reset_lock);
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe_vdev->vfid)
+		return;
+
+	/*
+	 * VF FLR requires additional processing done by PF driver.
+	 * The processing is done after FLR is already finished from PCIe
+	 * perspective.
+	 * In order to avoid a scenario where VF is used while PF processing
+	 * is still in progress, additional synchronization point is needed.
+	 */
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	/*
+	 * As the higher VFIO layers are holding locks across reset and using
+	 * those same locks with the mm_lock we need to prevent ABBA deadlock
+	 * with the state_mutex and mm_lock.
+	 * In case the state_mutex was taken already we defer the cleanup work
+	 * to the unlock flow of the other running context.
+	 */
+	spin_lock(&xe_vdev->reset_lock);
+	xe_vdev->deferred_reset = true;
+	if (!mutex_trylock(&xe_vdev->state_mutex)) {
+		spin_unlock(&xe_vdev->reset_lock);
+		return;
+	}
+	spin_unlock(&xe_vdev->reset_lock);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+	.error_detected = vfio_pci_core_aer_err_detected,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->migf = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
+	 * have the capability to selectively block outgoing p2p DMA transfers.
+	 * While the device is allowing BAR accesses when the VF is stopped, it
+	 * is not processing any new workload requests, effectively stopping
+	 * any outgoing DMA transfers (not just p2p).
+	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
+	 * will be migrated to target VF during stop-copy.
+	 */
+	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
+		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
+		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*curr_state = xe_vdev->mig_state;
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	struct xe_device *xe = xe_sriov_vfio_get_pf(pdev);
+	int ret;
+
+	if (!xe)
+		return;
+	if (!xe_sriov_vfio_migration_supported(xe))
+		return;
+
+	ret = pci_iov_vf_id(pdev);
+	if (ret < 0)
+		return;
+
+	mutex_init(&xe_vdev->state_mutex);
+	spin_lock_init(&xe_vdev->reset_lock);
+
+	/* PF internal control uses vfid index starting from 1 */
+	xe_vdev->vfid = ret + 1;
+	xe_vdev->xe = xe;
+	xe_vdev->migrate_cap = true;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	mutex_destroy(&xe_vdev->state_mutex);
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_init(xe_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_fini(xe_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = xe_vfio_pci_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+#define INTEL_PCI_VFIO_DEVICE(_id) { \
+	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.51.2

