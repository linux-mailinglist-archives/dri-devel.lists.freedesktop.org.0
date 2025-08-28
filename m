Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F40B3AB74
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBAB10EABD;
	Thu, 28 Aug 2025 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OL/W7dVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE3D10EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756412249; x=1787948249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V1YAzmkEFq2cM0G2MwEzMXLCu0itEoLuJFc6yROEJo4=;
 b=OL/W7dVd6Wu5j+u5+PALe8TYB3RsVCEpnbXze8vBAuVzQRO1sKcFr9iQ
 TSFOh8zBUkn2q8rMRSxXqldVSNTmX3g3tOUDTV6zw6tj8lbiABD2pgiW/
 BuXMHYI1DCpblJvzi8ZjjxqXeinnQwn77oTmpSYMtQoOyhSh45iuIv2SA
 5MYEFi7yfrT/SbMFE6tZX2gBHlvHqj7uqpxaKrEoVP++4dqNz8OjaOUlc
 j7KNK2XQd6tlHzPX3Bub1q7lwfOZXFajTw9hLFBWPgd9RiZsfELK3+RXS
 x4Y25vzSZVWf41QTR8IeeIDOzakRVcA9Oh9Nn5IHKXZ3gztEVWYPnXDsQ A==;
X-CSE-ConnectionGUID: 5n7Z0Ut6QRinSWsKrSnG0w==
X-CSE-MsgGUID: Dk1+bbibQhmQKJBwKRQKdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84098423"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84098423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:17:28 -0700
X-CSE-ConnectionGUID: LfQhajQ/RZSySb2VUI6BtA==
X-CSE-MsgGUID: EFy2F6JKSeqrHzRDMBH0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169508494"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:17:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:17:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:17:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.46)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM2deR+YnhEiEBhnhdgxzMNo18QxUPI7raWXc2sOuSsIFCd1TOboL0lKeW053tTSxTz9zS5Mis/CH+ZotSPI3Z1h9zIMQMQ1Cy7+jA1d6zJ76n8PnoVTtuc4WqOrt961mJnU4Z+ZTxjFYuHD/tEWPIS+fuz3lYlAwItv92526Sy7sNlwsFH+3WI392XBAxjEK7YhbPbiP/BTUoq6MLUC3Wr4vcZ10SK+XrDme18dCQZPkgXf8v7ZKNdzgAwGYErT9MojYUkvvOi0FFDmJT3fLJBNkDYFjwdH1DIjCiBci4eHcei27hdrIIZBXcygDOIMWgrd8IzJuX091EIRU9UuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=un9RRGpNAz75NjJGtt1X/QNHUDR1oFdn+eCA5KrtrOs=;
 b=qc9PWmh+29jhrtYQ90LtHmuAheES3fns/ccJxdaRXuABXvfakFRv/JNDdmqgWF89MxzfmmLKShL5rkFm/2ozkgimHBSajt0maG4gCaXhitPcPX0hKVc5WYjPZFXQhw8jIw19rJMgBZQBqYpmgX3kE+j7P4xLVsFGkMIosqxw5h0HDnbqQGk4fv7ffhjkhZuKufw1jC9xNI9rnjSX53ei713Dp3XGH0yyovZlvcqGKb7DCe1gjfcq0QkKdxxysnMm8G/3y0uSsAReuZyfd02Y5N/HlwxCQcknU6pes8ar6Z+QlhtWKZ30wJ9b4SDMH21x8he7AukMJNzjIJMbCGjaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH3PPF681F257FD.namprd11.prod.outlook.com (2603:10b6:518:1::d29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 20:17:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 20:17:18 +0000
Date: Thu, 28 Aug 2025 13:17:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: Balbir Singh <balbirs@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
Message-ID: <aLC5SC7jUgUE2rKh@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
 <aLC2bfpIQo/a22gr@lstrano-desk.jf.intel.com>
 <00d58bba-7695-4f72-8ebd-d2db23fccec3@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00d58bba-7695-4f72-8ebd-d2db23fccec3@redhat.com>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH3PPF681F257FD:EE_
X-MS-Office365-Filtering-Correlation-Id: 5063b14b-0542-48e1-606e-08dde66fe2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LqZX3kyZ+AtcleJUyp9ku/cOzImoEDyzhBXZrSVZM1wayP3cApt3FiA2Wj?=
 =?iso-8859-1?Q?Fa+HqKx3Oco6vBqjggk1y1d+KBNLYvCkYdJwP0YuT6+3BfZHtVPXHWpfCm?=
 =?iso-8859-1?Q?gnjoQJGFEtAnK7LvBFKroP1Jf6JAhbY3W4bjo/yxtQabA0jvdIhDrkRV53?=
 =?iso-8859-1?Q?UvEgZlQgZXqVAUq4z+E3Ib6RXc/29MtVYl5b8+j6RsUEuA5620cT9vwMVb?=
 =?iso-8859-1?Q?yzJ8xg6VfudfuolVxn6ugszVbWDfXedsIz3EyBOqROcgY6lu7l7qCs/5Ro?=
 =?iso-8859-1?Q?UoNexhfU3jxifu3muJeGGua9j8OJyDIw34VA0GE6wQbFubS8SG00rKrnr8?=
 =?iso-8859-1?Q?NVl0riJvcdGMS9CMB5pQ/WbnsfalNSqPd8FgvzE7N6U/N+HKo/4RDuGJdL?=
 =?iso-8859-1?Q?YreUGnm6ZoGenQNthJU6fydXGCeilpBWNXU3ux3Vm2oIgP1rYm0+uhk/wK?=
 =?iso-8859-1?Q?KHRJh2mS6QscTu/vyKWCXHV//K0tUOE3+BZx8iIxYRTN6WudErzAYs4nyZ?=
 =?iso-8859-1?Q?JZlj4/uQlnX3KuN4z2KIM2jIQd6vernB13xWULLpk5ICU9qTUCD10a9lWO?=
 =?iso-8859-1?Q?oxUqlINJbu50xWLGAOpO2T0L5FGxtfwM7s7HoxmWJzUyYziUXxElFIBVBu?=
 =?iso-8859-1?Q?3GHmK7m5mISAfnwEuMDdVurZGOiIWl27Re5mNDf6KLqhYp7/Doq8HyUS+X?=
 =?iso-8859-1?Q?6S/2GO/hlL1y8xBp3FUNnviPZBPjKmV1QtzJLFW/RRTp2BpmTP4D8Wl7G6?=
 =?iso-8859-1?Q?LJXJBVxnsohC5KJpHcN1mRhyRk1mircwlTuuewE7+rCgTginxpPz9fUzNM?=
 =?iso-8859-1?Q?Ir9wzuUTw+DX7bEP7yqFVGZ5v6N6NMMjfq9mQi61i3hJDmz2ObNs2RKjUk?=
 =?iso-8859-1?Q?11Fu4MXfRphWSxset6dCu4ZrKNrbpHZdneAsqhd3y5h9ucSrl9YZSETYR3?=
 =?iso-8859-1?Q?ls8RxzmicZfL3XaOi9MjPiZfjKe7aAc/Ya2xYdv/OU5xcwM4LZzxO/4Zm/?=
 =?iso-8859-1?Q?O16MfCTQWGvG3b4iWm+mZYI0O2X6tZnv6uFYf1dnP6DYS4whTdeLeOYrUL?=
 =?iso-8859-1?Q?QnhpUaY7M/4IqAoQeDA/NDDj2y6c2Eaak6QKphemZQXfG4Lq0Bjh6gq6AN?=
 =?iso-8859-1?Q?P2Z8DnVu8QAmGmUWOch6K7tcUG27uxrSuUCm1HkUhC3L125hT7Cs0h1ozS?=
 =?iso-8859-1?Q?84lzx+W3YoQL1WySg6p88NPYVCMRrlrKirrv6Fj6HtT1ROkHwDbYNKxJVs?=
 =?iso-8859-1?Q?ccJjWzOCz7xQfZOCgwaoxIZ7ZYjW4sF8QMiqwBItw2J7XkFNjS0bHhPVK9?=
 =?iso-8859-1?Q?MCjGPhfQOJrggFW9jY5oqG5E+wId5L267TeuuPDuCmRVbFWr1lbN043qYo?=
 =?iso-8859-1?Q?7GSDUVZWh88fktyfYvL4zObDH5XGqt3m8FLOGZabOFH3VgpuV9rJRbgJ4I?=
 =?iso-8859-1?Q?ze203pveMcX+UKVTthDxca1tA6FSfCKk53rWP0o/7W2FAj08RxNPWw1idC?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EQbHDUk5roU93InJznvYsTLaUVYvzvaQo6FBYfGL9D/OrCk9XA3hItl/O8?=
 =?iso-8859-1?Q?GPE2JlqhwcZawbN5yWWe+taH+U9N+rJA/4MPYoe1wCo9L+kY+JZj8WRHYR?=
 =?iso-8859-1?Q?aoiX/YEdKNsYtKPdtmT935oZ1Ui2AU4gSLq9i9msC72Q+jtieYbioIWaJH?=
 =?iso-8859-1?Q?DKjRojt2P6BIh/RWvlk0OrJtu6vVRrGhGKOsISIKvmsCwVBCNvE+wxdaqB?=
 =?iso-8859-1?Q?ajvnrDqu35UgWi2ekiqwLB5vqODSTkXkWLPK7/PTD7ubQAELrqrdunlE1t?=
 =?iso-8859-1?Q?M3nexnUBZmR5oHdh5L19EqiaAYAOUzaBIPMA/JKxtMewOQGPvcrH1qCx14?=
 =?iso-8859-1?Q?Du6K6lVpYl/DAu1qRocF+FayoQ0LlEN394yCVd8sgiHYZEMa36v+VkHPeb?=
 =?iso-8859-1?Q?vamqt9v7q1vhWzAUyb5Fw+OzSHIBjsCY29bBIt9blDI+ILeHobz2YFtqhO?=
 =?iso-8859-1?Q?yCo2J0elQa78HAAv7VHAsYZMVsYOWJxne324R/huDcxF+RtpUQVsF+/MYX?=
 =?iso-8859-1?Q?RZgjvSLPPBnPJv8Ngnp0pgCT6lJF8WO6hXskpJeqZ+Ox34gWkyfb1bEDD5?=
 =?iso-8859-1?Q?sWgmgnLencuzqtHdrTSx5aG9xcCfcbZ4Y0qVECNaG/kBQ9kC+H4oN8GGUe?=
 =?iso-8859-1?Q?oCfPfTB3c/euojEe27k7HyldiK0x/ZF3sj800ct4b6i8tpMq50QkHz5ojD?=
 =?iso-8859-1?Q?lrqc7O71h4o/iQEazmdX++g/SbGT8biqII3jzleOAu9xci6tTnQ2wZAt++?=
 =?iso-8859-1?Q?u/5XVJD2A7G8dqt92+ou4i0ypUeevH008THqk8w2PLmEUlbPlddhU+Nab+?=
 =?iso-8859-1?Q?F0cJNWQrXyariwCT0kR6u+uOrvvpgr1kHQAgM1DLGOGunMnM7mgR7rB+ry?=
 =?iso-8859-1?Q?szlaJwQGwJPY3c9w6y0lK6CDK4tO60sDB044CEMih+rJUcDqm3hh7Pjr8W?=
 =?iso-8859-1?Q?+i2i/j1hdq8TXj1USJkSMU4N3CGzPfNPfRNL4SZENRzXA9XSjw9NeDT15O?=
 =?iso-8859-1?Q?1ViRo4CxJdQvut6RN2rzlcEzy/B689vYMM1nJKK0kxP5Es2wa3C6Zj+mGv?=
 =?iso-8859-1?Q?5abHJ5cIOlvJFeMWy2Viwa5QN9/70A4OWZXhr1MvGbDqUOTfLZ8F6j4/jq?=
 =?iso-8859-1?Q?HiU7smnf88WJwfa8Y+oxNFRVja89DERt4fAlVdHfuCgtWx0LzQ/9FY48y6?=
 =?iso-8859-1?Q?rAqYBvMbuxQr1/7tZ0Wd4WfKj0wf0Mf+hoUgwi2NsvoNDJLSs3wQcoUbse?=
 =?iso-8859-1?Q?cEoP2U5vHt0inqwrB0Raa6268Qd1j3E/0WSx0ptjxm14QGyJWBplHYXQ9b?=
 =?iso-8859-1?Q?IHv6aBcPpmuMnHztUAbE99UxZ1xxBPPlkzo4QmxH0pcgLCyPe6j88B5xsl?=
 =?iso-8859-1?Q?Q/xZ+KE8U1oN73/HVEZ5CxIX8w5oK+YZOAAJEUagHRcUOkReH9+izDROVy?=
 =?iso-8859-1?Q?PlCGWbD/CAC2E8P8f8L7m3mGtSun0JTXVH2Hh5MqlQ5c2ZF2SZuHgAmvcc?=
 =?iso-8859-1?Q?gx1i6cazlC0KAiRt1gZtptZb1EDJ/LBp5tFYwdniNgmAKzp2Icy9aJPOao?=
 =?iso-8859-1?Q?v3Wt+vJT69pyFI+PPiwAsnsWiecGYFg7PSWnhr1AXA3igs1Uwj0c2hu4cI?=
 =?iso-8859-1?Q?Dlnd0voSMD5qFk7fY7Ra+QcXN8K+YSE2SPVFubt0HcVYupoH4kTiTnzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5063b14b-0542-48e1-606e-08dde66fe2fb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 20:17:18.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CleKWPe6VjSAzydgOvEcf4wcQSXVHI0dZBaBk1NAB7/R0iD2hQdO9fSkcDFh1x8S+F9a8H8Xx7h8wgB9oZ9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF681F257FD
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

On Thu, Aug 28, 2025 at 10:12:53PM +0200, David Hildenbrand wrote:
> On 28.08.25 22:05, Matthew Brost wrote:
> > On Tue, Aug 12, 2025 at 12:40:27PM +1000, Balbir Singh wrote:
> > > Make THP handling code in the mm subsystem for THP pages aware of zone
> > > device pages. Although the code is designed to be generic when it comes
> > > to handling splitting of pages, the code is designed to work for THP
> > > page sizes corresponding to HPAGE_PMD_NR.
> > > 
> > > Modify page_vma_mapped_walk() to return true when a zone device huge
> > > entry is present, enabling try_to_migrate() and other code migration
> > > paths to appropriately process the entry. page_vma_mapped_walk() will
> > > return true for zone device private large folios only when
> > > PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
> > > not zone device private pages from having to add awareness. The key
> > > callback that needs this flag is try_to_migrate_one(). The other
> > > callbacks page idle, damon use it for setting young/dirty bits, which is
> > > not significant when it comes to pmd level bit harvesting.
> > > 
> > > pmd_pfn() does not work well with zone device entries, use
> > > pfn_pmd_entry_to_swap() for checking and comparison as for zone device
> > > entries.
> > > 
> > > Support partial unmapping of zone device private entries, which happens
> > > via munmap(). munmap() causes the device private entry pmd to be split,
> > > but the corresponding folio is not split. Deferred split does not work for
> > > zone device private folios due to the need to split during fault
> > > handling. Get migrate_vma_collect_pmd() to handle this case by splitting
> > > partially unmapped device private folios.
> > > 
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > > Cc: Rakie Kim <rakie.kim@sk.com>
> > > Cc: Byungchul Park <byungchul@sk.com>
> > > Cc: Gregory Price <gourry@gourry.net>
> > > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > > Cc: Nico Pache <npache@redhat.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Dev Jain <dev.jain@arm.com>
> > > Cc: Barry Song <baohua@kernel.org>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > > Cc: Mika Penttilä <mpenttil@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> > > ---
> > >   include/linux/rmap.h    |   2 +
> > >   include/linux/swapops.h |  17 ++++
> > >   lib/test_hmm.c          |   2 +-
> > >   mm/huge_memory.c        | 214 +++++++++++++++++++++++++++++++---------
> > >   mm/migrate_device.c     |  47 +++++++++
> > >   mm/page_vma_mapped.c    |  13 ++-
> > >   mm/pgtable-generic.c    |   6 ++
> > >   mm/rmap.c               |  24 ++++-
> > >   8 files changed, 272 insertions(+), 53 deletions(-)
> > > 
> > > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > > index 6cd020eea37a..dfb7aae3d77b 100644
> > > --- a/include/linux/rmap.h
> > > +++ b/include/linux/rmap.h
> > > @@ -927,6 +927,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
> > >   #define PVMW_SYNC		(1 << 0)
> > >   /* Look for migration entries rather than present PTEs */
> > >   #define PVMW_MIGRATION		(1 << 1)
> > > +/* Look for device private THP entries */
> > > +#define PVMW_THP_DEVICE_PRIVATE	(1 << 2)
> > >   struct page_vma_mapped_walk {
> > >   	unsigned long pfn;
> > > diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> > > index 64ea151a7ae3..2641c01bd5d2 100644
> > > --- a/include/linux/swapops.h
> > > +++ b/include/linux/swapops.h
> > > @@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
> > >   {
> > >   	return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
> > >   }
> > > +
> > >   #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > >   static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
> > >   		struct page *page)
> > > @@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
> > >   }
> > >   #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> > > +
> > > +static inline int is_pmd_device_private_entry(pmd_t pmd)
> > > +{
> > > +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
> > > +}
> > > +
> > > +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +
> > > +static inline int is_pmd_device_private_entry(pmd_t pmd)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> > > +
> > >   static inline int non_swap_entry(swp_entry_t entry)
> > >   {
> > >   	return swp_type(entry) >= MAX_SWAPFILES;
> > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > index 761725bc713c..297f1e034045 100644
> > > --- a/lib/test_hmm.c
> > > +++ b/lib/test_hmm.c
> > > @@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
> > >   	 * the mirror but here we use it to hold the page for the simulated
> > >   	 * device memory and that page holds the pointer to the mirror.
> > >   	 */
> > > -	rpage = vmf->page->zone_device_data;
> > > +	rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;
> > >   	dmirror = rpage->zone_device_data;
> > >   	/* FIXME demonstrate how we can adjust migrate range */
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 9c38a95e9f09..2495e3fdbfae 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
> > >   	if (unlikely(is_swap_pmd(pmd))) {
> > >   		swp_entry_t entry = pmd_to_swp_entry(pmd);
> > > -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> > > -		if (!is_readable_migration_entry(entry)) {
> > > +		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
> > > +				!is_pmd_device_private_entry(pmd));
> > > +
> > > +		if (is_migration_entry(entry) &&
> > > +			is_writable_migration_entry(entry)) {
> > >   			entry = make_readable_migration_entry(
> > >   							swp_offset(entry));
> > >   			pmd = swp_entry_to_pmd(entry);
> > > @@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
> > >   				pmd = pmd_swp_mkuffd_wp(pmd);
> > >   			set_pmd_at(src_mm, addr, src_pmd, pmd);
> > >   		}
> > > +
> > > +		if (is_device_private_entry(entry)) {
> > > +			if (is_writable_device_private_entry(entry)) {
> > > +				entry = make_readable_device_private_entry(
> > > +					swp_offset(entry));
> > > +				pmd = swp_entry_to_pmd(entry);
> > > +
> > > +				if (pmd_swp_soft_dirty(*src_pmd))
> > > +					pmd = pmd_swp_mksoft_dirty(pmd);
> > > +				if (pmd_swp_uffd_wp(*src_pmd))
> > > +					pmd = pmd_swp_mkuffd_wp(pmd);
> > > +				set_pmd_at(src_mm, addr, src_pmd, pmd);
> > > +			}
> > > +
> > > +			src_folio = pfn_swap_entry_folio(entry);
> > > +			VM_WARN_ON(!folio_test_large(src_folio));
> > > +
> > > +			folio_get(src_folio);
> > > +			/*
> > > +			 * folio_try_dup_anon_rmap_pmd does not fail for
> > > +			 * device private entries.
> > > +			 */
> > > +			VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
> > > +					  &src_folio->page, dst_vma, src_vma));
> > 
> > VM_WARN_ON compiles out in non-debug builds. I hit this running the
> > fork self I shared with a non-debug build.
> 
> 
> folio_try_dup_anon_rmap_pmd() will never fail for
> folio_is_device_private(folio) -- unless something is deeply messed up that
> we wouldn't identify this folio as being device-private.
> 
> Can you elaborate, what were you able to trigger, and in what kind of
> environment?
> 

Maybe this was bad phrasing. I compilied the kernel with a non-debug
build and fork() broke for THP device pages because the above call to
folio_try_dup_anon_rmap_pmd compiled out (i.e., it wasn't called).

Matt

> -- 
> Cheers
> 
> David / dhildenb
> 
