Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1069C90D9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 18:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46DB10E2BE;
	Thu, 14 Nov 2024 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz3SZ+gZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB710E094;
 Thu, 14 Nov 2024 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731605520; x=1763141520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T9BgjJVpW1pQHyOCaAkceGxZn3lMaWfwmJCwJL14QR8=;
 b=mz3SZ+gZfRKzYFnDuCOg5nI+wJwtPhOCqEX3TSAiBBL+rkkW4cdyFFxT
 UPQdGCDNYPwb8+ijN1nXZ9FB4wIe+qjxHFkDqK9yJNxOh/dXm9/lYevdf
 gnbhAFeXn2Lh0GILdRLxqNb+rl9R4muhNv51fuGawa5aqdocvCVv3Q7RS
 noUwv1rBvbk0w9zlucxAfxP0QJuOZVGAVtkTsA9tGMX5Jsqc3S6McWQbr
 xvAW1zcw074ztQnp7FYAuqOvN8w5PbRS3ZTswNFLOQwz7dK0jdHTVmVdi
 rmip0/IuFQI41vzh+NY7Y+G48j/Cl7NJCKY5pOim7AiIBB8ZTPp61xcqs g==;
X-CSE-ConnectionGUID: Kv0Rvb/fQSWITkRKGUsa8A==
X-CSE-MsgGUID: zWzR4s4eTVql6/2Q0bySgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49092553"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49092553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:31:56 -0800
X-CSE-ConnectionGUID: 8uH9baBGSi2MlmIhI3JWBQ==
X-CSE-MsgGUID: KcIoPoqPTxiuUmf60LIPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="89048210"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:31:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:31:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:31:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:31:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZgQUJtlYDNkQOOFwcKuawReqLM0xqI7FAtTqSVb+u7cqbtG4FAVbtBPxeqZXlWgLknPZns4OcYdpcxKjfFnoJFJ6LBLHruJr5aKUlSIic3wVDD+aftJU3xCr6akn9EgE99WbpU8Oe3XJWzBHf2TPpQ0Uz/kw3Jch1jvE7xywv3wXuYvMpS1UeO2Oe8yBLEVvuvhMh3QNRAG2q+MdrOUQ0zxleHPDEpk+uhhChLst9GT8xvIKOWaqWaQpKAqwMVALdSn8Suon+46FrFjsfoNC4C6tncyfVQanCoZeq7VwybW8+xDE44y/0qcEVtFFc5iULl02LmlDM4FEcphrsXIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMetLVadpkGCTvYTXGnsDWpQxnK4X1oZbTEzPE8IVoU=;
 b=VpwWdqkEbAHKrrv0DBBqo4x+EytU4fE7DmJVOtxcUa1tva9zDfkvj7A3y1HiTenKc8cH+1BYta4V+veto19MGKZ7CFGTFEP8RgA66xpp4C3PPTgp3huQNXEU6kouxWPd075HWepdePeFvDvyGWx7sAJlvgMKNJTomKwWY9coq+IodhyDvhgV14oIc/BxAWxpCreUZzagPQKOIEBe0T8VJDykmVM2DuLCHvBe+j8biLUhOXY0hj8BMiR2b+bfKeR9CqsZ36zsA1w36LGZFoTqkOgv9iib142lItNctoypYOBa4oxOy7g7qwbeQJ1jCxqNguewAdZ+aX58phUEx+/ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 17:31:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 17:31:49 +0000
Date: Thu, 14 Nov 2024 11:31:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
CC: <kraxel@redhat.com>, <airlied@redhat.com>, <alexander.deucher@amd.com>,
 <zack.rusin@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <virtualization@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: drop unused component dependencies
Message-ID: <ozyt6iipkdnapd5kzs7szta7m6ddhpaukhjqxpkym5dqad6w7s@6iyixhrzaxny>
References: <20241114153020.6209-1-christian.koenig@amd.com>
 <20241114153020.6209-7-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114153020.6209-7-christian.koenig@amd.com>
X-ClientProxiedBy: MW4PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:303:b7::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4f4ab1-4807-428a-cf50-08dd04d23879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?O1EHe4gkofTnWpXPwVgkiemgRT6tq1mtDZhRb3lJMPd6ke9d5BKq0V/HNo?=
 =?iso-8859-1?Q?1MseBAz/yASM94U7Z2XAYvAesRifJKFJZuupohqG/rgOh4CIy/yBtUN7Qr?=
 =?iso-8859-1?Q?KNvyy1pfNzOaTzk2i033z8AE3KLFlONU/FhepHngJtorqfWFDZxsxk6afl?=
 =?iso-8859-1?Q?PurSMFDJDQf+KcD62zd4GqAoFADmzn0u0HLI871M+tX2u4T9swfP2e7LWm?=
 =?iso-8859-1?Q?01QcED98KlpN2wrZ9orjUefapqS/Op7YPJFel9PvtcodW0pmkW27kTHvMS?=
 =?iso-8859-1?Q?GMUMERgn8yw4AKAoX3y59qF3hVVpwJlHy0jJRQDYvLKwI0hhlJHB7lohH1?=
 =?iso-8859-1?Q?x/Rx9TT5wwnN1mUr2apsmLPpwWSSge0KNyOpmVY8couQYYNjXupcMC+8QN?=
 =?iso-8859-1?Q?ELymJOs0o1Myh31tzKH5M/a5okDkOfJ+cQE1DFcXKfgsGNUl36RfL5YNzy?=
 =?iso-8859-1?Q?6K7JYosg8+hCzy2Zi8bBp5ofQKqeyISRpuM1eBdSdAA/4EXYqp+O/AMCVb?=
 =?iso-8859-1?Q?5nY3SsqxWRT17r7CqWexsFxZQYRn5wSpznYxh+B79+9Qe4RVetvCa8ug8w?=
 =?iso-8859-1?Q?TAOOIymJObtogBPYDFWk/T985UgbNc9R6UoyKpP22b8UYcLWtNCVEklYxI?=
 =?iso-8859-1?Q?IpiwtKb2agNaxhXZIAPhokzNuE8WMMR4EFS6euoKrNWSjyMLbawPk6V33V?=
 =?iso-8859-1?Q?UI2lbji2zqpCoV28XQN90aRGul/SyCcu8+gEjUApFkFinooacvpZZyE8/y?=
 =?iso-8859-1?Q?VunvPtx0n5soDgh8WscHX7zK7FwEdegAZ8txf6XpnsnNr83o4WPlI43ULT?=
 =?iso-8859-1?Q?UYPqLLSPQSWBP/gOUhHQ+6vtbx1ZaI35RQAhMjbrr+mxH7Zs+mrmhjP6lw?=
 =?iso-8859-1?Q?t8HijVmaKu2//BtC/ixaOUQTh9gMmRkt3+SsE6QjF5C0u7tiTSKdPfVu8m?=
 =?iso-8859-1?Q?FT9YcgNK/k3pgYEX/1F3Sj9YfKO65CcieWX1s3t5RQfeXhhmiikqkmvuDE?=
 =?iso-8859-1?Q?j0DQsCyphBj7xuQSVs/QLg2qa5gdlEzRy/KrDuQqthgaFouwDDWhYvHZ24?=
 =?iso-8859-1?Q?vNuPP9nk/1aSucRBwzrlbvUnGEYNFv7LrJIoxM37B87scMq6AKjhHhnbg5?=
 =?iso-8859-1?Q?hueWx/bI5GHEDI7Iua1NBfx0V+AQLdiqbF1UdMY6cp2U5+5me12QC9iN0w?=
 =?iso-8859-1?Q?3iLjBvPZQN9SKy+E+7TILXuPS30jM/OTAeXDgKbBW0TG+ZD7IWKGX0F69w?=
 =?iso-8859-1?Q?wGX+haWLb7RuA/YpGY3kUYLeFNFdiiYjruUdqna72qzDOWdkt6CjKPC/6r?=
 =?iso-8859-1?Q?IYJI/twBRseI/yhGTLR9vOZKKvYKaq+Bnk56BzXFgRyCURV3o3jNjbsFvI?=
 =?iso-8859-1?Q?adFaCubYsS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jbf3sPjqevfs6LYpjbrOm/tMf1iVdZgA3eQZZuof4jGVmlE/nbo7JSMfP2?=
 =?iso-8859-1?Q?keUH0F0QCGX6MRYazBDnqzb9tOkUcE2k4BC7uI3GG330E1JQTkVQhLfuwj?=
 =?iso-8859-1?Q?7jPj4w8cwv+geFvsf32Mxu7zSo6crzno8qzt4A8X1dVQ7lM9zw95PbFNgY?=
 =?iso-8859-1?Q?mrX+vScGHaJA1h3bPnzliL5D4S/9l6s2HJOn9+0/3zKkWBJakrv4g7kaMY?=
 =?iso-8859-1?Q?0k+ZsIAVDd/YZxdEwsv/XO7mcVK0sJPl37xIBigF5TgfX0lJs29omxmksH?=
 =?iso-8859-1?Q?Y1ebc/BrqfFBGLdP9XZrzxRjEdrAFvEzgIt6CaNOEGxcAwp0IvikgijGgv?=
 =?iso-8859-1?Q?lvMkdl+tP4ygHvVXK5YibWBft/QviRWwPZz3+H9hnXT5SxskPg8Tgbmxeh?=
 =?iso-8859-1?Q?XUvVq3mukz5xsBXppGtl+5ABcM8jZ9RH3hOY4rAWnNrDMV+cOJh6qPZiJa?=
 =?iso-8859-1?Q?fubFTNAQOZ2TcW4iRqksp+PztUNxVG//qfsgLK8j4tsFy0Y8QeccvQp5cl?=
 =?iso-8859-1?Q?GiGVtsNmtQFkz0pFA/j6MCcQPHbliMXhZw2y8SOSIm/7EQX2oQHoOm6kxR?=
 =?iso-8859-1?Q?eClsXvGvJ6SgzKve7/jx9eBd/7hkVWvkAwV4USZ2gY7ogbzyo5wQroKMCd?=
 =?iso-8859-1?Q?Jn0xIJPX3501MI/FzRmL45SWLZUw+PLsoCQFl/Oqb5JIA2VIewEnEdfWi/?=
 =?iso-8859-1?Q?/alZROJQLiGVWrOGLcbTWPyBpRNm57sz9dzkpZF6KObHdZaepc/ytzGBW+?=
 =?iso-8859-1?Q?wxTezsFnxdZxEa76THMWH2vUb5Hy/s/sDf4hunsDxLbl7QY+89dAX1p4HW?=
 =?iso-8859-1?Q?SHx6T7nsEyMT1eqprhNWr66C8PhqQlI1lOOet8NDI6/Ay9Oqc0i6euE6qh?=
 =?iso-8859-1?Q?qmxuXEutxwtAFBdqfTaDr8/lb7YN74B23Lt48+BxPoJ42WcavEixI56XGI?=
 =?iso-8859-1?Q?rd87BFnVd/UzHyLN4WrstYFT5wI99dIX/uSx5McA0/TwRK4ZKA+Z3+iIos?=
 =?iso-8859-1?Q?NFE1NWQqD9jvRe9XWZX0gg5wopV7BtQUgWKOxBL43M/N3VqWv20XjcF6Si?=
 =?iso-8859-1?Q?XFlpK0e7M0rwX/XwpiMrc8QR5z2SYqUMgZSdA4YDDJ6XwqiDlLolBk/6OJ?=
 =?iso-8859-1?Q?Zyz1csrm/i5m7eORGnEA/gXoO48V7Qc9HccxzQxbeimetN/wBV3m6bRPtx?=
 =?iso-8859-1?Q?KJWTEPbwxrIVVdJ3wcU9iVRAxt9IiFHDwrWJ+92mcxGxsgzDzX9h4GpPkn?=
 =?iso-8859-1?Q?2qpqAIFPEOouM7haI2vG8C4BKt67yfEFS578+sfIdIm6uqDkEXTfvZNUHs?=
 =?iso-8859-1?Q?1zQRPIxLd8Uo8SYmHVvHUETfG3znrWkG+xGi3bm1nAHpq9cjTn7K074d5+?=
 =?iso-8859-1?Q?rJnuXDDpdCnIByuFQe4x4tSpzMN0gZj7ZbO7WeM9ACaKiNHAE8/TsQVRmQ?=
 =?iso-8859-1?Q?Fy0TWFqwP4JXLxgv7hkHyc8jL8bH7xGY7vr1LQI5aqWHkRCpvlpp5Lfh9D?=
 =?iso-8859-1?Q?dm7wBYMPsplF1xiOIST8gBaCIwH62VkijTlbK00AdnHhxFAI6HRF6R2j+o?=
 =?iso-8859-1?Q?obgb6mz0GOkQYOyVvfvqDUf+E7R+eXnnmBfKQ2Q8KkGzTlW+WeJWXe/2ol?=
 =?iso-8859-1?Q?+GcTfvrvYLl/WlXEh0D9F2YOZgWQjaMtNhBgt4KzuFz6XfDoIDXy1jfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4f4ab1-4807-428a-cf50-08dd04d23879
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:31:49.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F11u1X7QkymQPsaCH5m7redrAmFoIOq2+7CqnSRQaF+XCLHw8MdYLezhjuJDIwTMAQNxjxk3ZofUyMZu9bUCALDuUPpel5vKjgecNszoBrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
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

On Thu, Nov 14, 2024 at 04:30:19PM +0100, Christian König wrote:
>XE switched over to drm_exec quite some time ago.
>
>Signed-off-by: Christian König <christian.koenig@amd.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

I guess you will want to apply this through drm-misc so you can merge
the last commit. Otherwise let me know and I can push it to drm-xe-next.

Thanks
Lucas De Marchi
