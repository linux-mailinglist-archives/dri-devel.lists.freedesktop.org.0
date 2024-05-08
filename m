Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B48C05EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42F1129A5;
	Wed,  8 May 2024 20:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTekMJwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1BF1129A5;
 Wed,  8 May 2024 20:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715201630; x=1746737630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uY+VYFpwPfo8uSdrB1jBQ9kFzi61ttDNz0J1tR0RBt4=;
 b=lTekMJwajBIcgYpW4yoNH1dhBuhk3Mo+I83eti85rCEmo3bPYJXp1ztZ
 pUqflAgIovUPfx0ZUdmzGfalqJZ77zuebIr9sHD3tQEttl0zf9AUjq69h
 aswe0JNa5+XHJmEe3qmBcCCXSeDsdK+VLMv2MKAuBCwAhKvk9czeY729f
 yN2+8jhtRthsS/XCFzT/4y2inQz+ED8mBGZIyq5DxFHJFMuOK50LrEH1X
 KPITPHVFlfrSqYgXM7xACIWww2gL/5iwU8j9FLaMWW3bquULqLupNFyt3
 6ywKC/C6XwjZDxnlNFhu2pD65OO6keufS8bynt86Ir1niTpeXRD1Q2S++ w==;
X-CSE-ConnectionGUID: 4Eehcg1dQo2ZRQlOw9JfqQ==
X-CSE-MsgGUID: x2NuKciSRMmhn8S0quRGPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10959129"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10959129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:53:49 -0700
X-CSE-ConnectionGUID: R+6E4B1RSmi6kQgjTzCHsA==
X-CSE-MsgGUID: l2Cs+s2XSJqmAATZrD0TFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29096341"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:53:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:53:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:53:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:53:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYtO23Z6hDW68mfRFs7WOJHxR/PRAYcGaeADkOC22lciM0No1dNuCOmqDXP7b3GkjSkc6h8giJEr1DU9h02aqHmvpF9Rd04tnLwPJNdU3U6TFKSQnAm0juvK4ByMh9K1jr8D4TykUA+9y0UNQdc97S13TReRA0JYBBnBBNHSt9snrKZlEcuN4AvoSTfMUff216rqZulIq20cV5l1Dd6Mrkk2zxkfwYY/uAmC6zdLusRD45yGZWNfmelzIQSRfn6Zx4tNwo/MLQA8OF5b7HvCMTGs2XcOw4Os45AXjgDx5+D1tJg79mr49TEuxlH1/7/U9qhsAeCrJyO6r+mizUVJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg0cSI1iBrJ5vvAf+EiCwU1DH5cePlX47Z3w2L/DQdU=;
 b=oSqLReaesIAJCe6KqXyexXjGRJdAnPf1riH501Dm2SE9IdXDq3W6U7m6FBDdsyQe5T573qH2UZv5c6QHVa3no6iGhOcBgu2Gp+0vutC/XBSLDSSfhJ1uDAYjGiZh1nXuBZvWP/miCQueRUgNn4t4ONDktC9C1iujIXsi0juYwHhJ0eDpRGtBqVWlmK8xGYN5wjCxx+mVeQ8WYNRENVLF+L/LEXVMxuhDFe2EB3jAPB/Vtsq0Pvam0J8cYPkMCbOV1Cxvd0Bydm6FGyKXqyb9Uz1EpWLHTao8yzygwMYDDe+2VSdxMfZh27i469WP7SMayRu6dszUinG0HURr8Hl2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 20:53:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:53:45 +0000
Date: Wed, 8 May 2024 15:53:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, =?utf-8?Q?Adri=C3=A1n?=
 Larumbe <adrian.larumbe@collabora.com>, Rob Clark <robdclark@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 6/6] drm/xe/client: Print runtime to fdinfo
Message-ID: <h2xkygfdjfmjzb7i7i6vec7o6zbslfdrjdm6lutpn4plicggeg@h6cyouletta4>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-7-lucas.demarchi@intel.com>
 <ed28cb4e-a417-4255-b034-778dbfdaf6ec@ursulin.net>
 <xwp77yi7y3e3f6eyqf3qqeawsv3nh4db4vwmok3pccdddnimce@n7rts73arupp>
 <88d6eeee-fa6f-4e5e-9304-22df8fb0f63c@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88d6eeee-fa6f-4e5e-9304-22df8fb0f63c@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: aae1b173-84f9-4077-c096-08dc6fa0f3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?albPOeYkjdg9VpYiUXnBiWnl6fwJhmt2F6iUf0Vsp95xYviZ9yUgqpiZdC?=
 =?iso-8859-1?Q?8E1GVazNtpllW6M26/DSlg2uC3rLKDNVi2FnEqa6j/jPuvG837dvayXyCt?=
 =?iso-8859-1?Q?n1ZP4zGHaLgEwrb0bzfyNey264etRa+QbwvQYKbBc/G+7xrwd2h9EAC1O7?=
 =?iso-8859-1?Q?/sVU5Kmkq+yNms1CBcfvyCibG16Fm6yhVhZwblvDxRQafyTrP6Y1LuY6/y?=
 =?iso-8859-1?Q?I7Qts30O+aOLnMfxPjQ9g3jKTO3jVIvmaUxGbkenu05ta2g3BQ4iMfXMp9?=
 =?iso-8859-1?Q?VtFkAklpgZMYLX/mpovvjmrhUJ7Mp7Fm2jC1TFnT3mEfzFQHYjeIJ07f7J?=
 =?iso-8859-1?Q?ET8pBXsGkz0tvxtGg2zPZ/L4Nvo8dDLUi6+hTiIg/spxViQ4QXtews4a8C?=
 =?iso-8859-1?Q?Ch7KXPyvPBdT5g5NedTPdgkklcHs+Af/cOEx6h40Lvatx7NVZC0pxBZA0I?=
 =?iso-8859-1?Q?woG4qmhoRdlcqShONG5aOP9y6R6dyEcrzrWa4l4vfixsf/aoqK9nrKKJKz?=
 =?iso-8859-1?Q?z1iX6ovWH+W7RrkNj0lRyk75P23BaBku2SgipU1p2WT3gz3foXitDSn75o?=
 =?iso-8859-1?Q?b5SMqqzV0FYIg0RibaXYLj1dR1uo88G4yLrO3yru0+Sj1pIpFhMWWTX0Cz?=
 =?iso-8859-1?Q?sdg6jGRJZ/rWC/plcXkbxjDOzZLo3rMANmbVe/Z9pfxvEQVu4f2VPwLY4U?=
 =?iso-8859-1?Q?Ng/x6ntoCm1ZS6QyW4QvEw9i/yTSOusSsPWU1hyo9lbIBRTA8jhAQN0i7x?=
 =?iso-8859-1?Q?VGdPjG4okuA/YS750t7DJJztdKFWq54PMaHP2moaBnoGoNWmKSIClC3gfS?=
 =?iso-8859-1?Q?n4Xs9J+z696QjndDhNQLm/f6YFZ0FMNhr0dL/7OafkvKCIhlQa6EY1/GUN?=
 =?iso-8859-1?Q?GXyJVkKIIsV+QoBlWeP6kDSKKCv9h1tbbqq1PrLiLxNvQ2ohjSgkp+P2g5?=
 =?iso-8859-1?Q?Nip6KITc/u+MDzMjkD4/risRGKIRUoZZTDQZsy3Pk9PkLOZ3MHxgxMyR6E?=
 =?iso-8859-1?Q?gOHEuFQ+v2QfNvZNuHaYnq3LmZHutPcp0lW/LPIQNyMyie/OFPUjfhSd5U?=
 =?iso-8859-1?Q?J4mEZmWBA3YkfSdtlEKQQ2PxuILt8WjWnhcdE9lZgScUBuXoNfzXwIp/CG?=
 =?iso-8859-1?Q?R0lZxKOmMLwM3CISRIn/bH35HDno/4S2bpm90J10DptS+R5XykOzbcy+ES?=
 =?iso-8859-1?Q?GuGxB2vrYdHlo8Y8UQLlCtD9KNCGJltDk0bpyoId8xJtb+YIBS64tljQLt?=
 =?iso-8859-1?Q?ymU9yJbf9l49DtdbIcDg6HzV75aUXl/l2D0Iq8hmwzgjyw33sfQP0Nwe6x?=
 =?iso-8859-1?Q?+aWdnGpyE7S2heNOM8NHm9Mh4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vthcabuyRRZ/TkIsCgV11UEivLlAtm8mAAwLF52mMslFY2AEseC73qZ05c?=
 =?iso-8859-1?Q?XEPglLWG7qISiq/9KcpQmV/WeIeZuy8OJT0gVecH1ZDxqVtPDCgX5MC3YY?=
 =?iso-8859-1?Q?VH09XRZX8LheZ2wgU1/mX5kuBphDQ9jBoOXtNoXSeJC/lrBT5LohBgZf00?=
 =?iso-8859-1?Q?QyNnNp4jtDbkxmsGA8nRgtVcmIdV4rxXtL16z7Qki8QtRshjIXEY3jQd6j?=
 =?iso-8859-1?Q?AhHvE6h62J6P+2i5SqQsawr2f0vWsCcHGl312kFYLTE2Ot+Y/iqc99JqD/?=
 =?iso-8859-1?Q?8jpExC8lGIqhY7IgkHvz5De+ji33mjjRcKL5BrWz9Q7rXzyUVqMZo+Y6rE?=
 =?iso-8859-1?Q?uA/kaHYt3dideeIOm0BJk8fsRYCepqeAzHRAoweaePXx9EnawvLZNtiREB?=
 =?iso-8859-1?Q?TMGnO+F2YtO1u+Qb/Mh1rl9QlZ0pdPANFKPp/0l/AocjrjaB4hLXCGbuQ/?=
 =?iso-8859-1?Q?8GTqMhKSOwkDOQacJ+SWCeyiiYui77I0XjhwGNvSvTqipRN4AitfXrzxEZ?=
 =?iso-8859-1?Q?YEg3o926ufuMc9fNnmGQToG7/Yte3zZOcK0HYzlDov7qOG6i8LR2wGF/bn?=
 =?iso-8859-1?Q?7uYczGvl/onYeDtVS3E1NTLjDSZUnT1VyUExJzuG76Y1NOZ+a6C+/NIE1L?=
 =?iso-8859-1?Q?kNOgqN84aVGK9tAVp0xVLInos268mAcrzXJNzGIT6NBXG7fU5ZrjOwWEyx?=
 =?iso-8859-1?Q?CtSwl8odcW+sR7VBRaatkTPfy3eOh72NS48vTk5kSsgS5GWaaBAY303Jx0?=
 =?iso-8859-1?Q?jURolSdC7GvNl2c4J3YGGndhBhG/TNKUbz67MNTktT+iEHUkyOmgQ6O1lT?=
 =?iso-8859-1?Q?blnJ45xkE0I1kdzf3SokfXxyIEJAemWVUNNjTmK8UZq148JFAMrkffvmI5?=
 =?iso-8859-1?Q?FLNd+BrWrtx+tBO4dh/w8WlxpefPrP6Zj6BiC9kbs5aC8HhnfB2BeIqbzU?=
 =?iso-8859-1?Q?LoLCHgBrGIRS9505nVFqafk+vk/y+vQ/mY8jEjIKpaELq0IF68kWi8j6li?=
 =?iso-8859-1?Q?uIBAAQP/gnac8MX2lZNXjoq3jO2OUNKQHXzv6N7ab0HJ0pBPlNygu3rdmX?=
 =?iso-8859-1?Q?jci52V36QinHJO5Dj9CZZ0Xt9WSXTtCQLVtz/dPTU722Azm2tES9UtLikW?=
 =?iso-8859-1?Q?wW2t3BXkncooRqOYpOPYicqKJjNHwGO5PuTAEkqGADO1xR1GbdCt6Rqc4r?=
 =?iso-8859-1?Q?Xz96WtZ1BoHnmA3TU5iD7DJCDwRo3yBf1+X+7wKRNfXUT7vt649Gs7iVaN?=
 =?iso-8859-1?Q?RvCsPQywB33pRN0B0mxQ/eEUOZrTU20b40QOrFQbS2s1Wa40NibM1YE3aC?=
 =?iso-8859-1?Q?XrDXDffp54ClSecjNklRjPFkR5HHsuYFxdj9yDxkZ9iUDAuSnn99GpiQTQ?=
 =?iso-8859-1?Q?jMHo25eFzAMp3/7SGNt7VYMHX+SbfkH5zr16ryF4YE0N4DJFyaP0qj8/I1?=
 =?iso-8859-1?Q?1clC+ad6NVmNgwWacDw3RCF/4AzYe760upu4fTKclK1KAso3dycFD2cjZn?=
 =?iso-8859-1?Q?plsGOxii9/pU2xyugnFcr5NhKSsYvO235EK+fKfEEYCHgFBl0bLIjVuWSU?=
 =?iso-8859-1?Q?M/NPNFDAx+Vm730+VkvlXenyGHVfSccDfmA0Dm+1DPBIHIp4xgXeQu4ryE?=
 =?iso-8859-1?Q?Imi1+SbP3G6afCqV7Rob80LHMvMQsxE2HC0gjCgMWQczzQUyH5zJO4Vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aae1b173-84f9-4077-c096-08dc6fa0f3e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:53:45.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/VwNa7PuI/XfqaDqXhvNwb+WHpmh6Gz1fwn7tZRlz6UMMQvKuR6TiTY2S8jO9+i3LgahvFdAy/MBg+il2ghDflI5MQBvvasODC1YCy/wcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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

On Wed, May 08, 2024 at 09:23:17AM GMT, Tvrtko Ursulin wrote:
>
>On 07/05/2024 22:35, Lucas De Marchi wrote:
>>On Fri, Apr 26, 2024 at 11:47:37AM GMT, Tvrtko Ursulin wrote:
>>>
>>>On 24/04/2024 00:56, Lucas De Marchi wrote:
>>>>Print the accumulated runtime for client when printing fdinfo.
>>>>Each time a query is done it first does 2 things:
>>>>
>>>>1) loop through all the exec queues for the current client and
>>>>   accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>>>>   that, being read from the context image.
>>>>
>>>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>>>   time has passed" and that has the same unit/refclock as the one
>>>>   recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>>>
>>>>Since for all current platforms RING_TIMESTAMP follows the same
>>>>refclock, just read it once, using any first engine.
>>>>
>>>>This is exported to userspace as 2 numbers in fdinfo:
>>>>
>>>>    drm-cycles-<class>: <RUNTIME>
>>>>    drm-total-cycles-<class>: <TIMESTAMP>
>>>>
>>>>Userspace is expected to collect at least 2 samples, which allows to
>>>>know the client engine busyness as per:
>>>>
>>>>            RUNTIME1 - RUNTIME0
>>>>    busyness = ---------------------
>>>>              T1 - T0
>>>>
>>>>Another thing to point out is that it's expected that userspace will
>>>>read any 2 samples every few seconds.  Given the update frequency of the
>>>>counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
>>>>each exec_queue can wrap around (assuming 100% utilization) after ~200s.
>>>>The wraparound is not perceived by userspace since it's just accumulated
>>>>for all the exec_queues in a 64-bit counter), but the measurement will
>>>>not be accurate if the samples are too far apart.
>>>>
>>>>This could be mitigated by adding a workqueue to accumulate the counters
>>>>every so often, but it's additional complexity for something that is
>>>>done already by userspace every few seconds in tools like gputop (from
>>>>igt), htop, nvtop, etc with none of them really defaulting to 1 sample
>>>>per minute or more.
>>>>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>> Documentation/gpu/drm-usage-stats.rst       |  16 ++-
>>>> Documentation/gpu/xe/index.rst              |   1 +
>>>> Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>>>> drivers/gpu/drm/xe/xe_drm_client.c          | 138 +++++++++++++++++++-
>>>> 4 files changed, 162 insertions(+), 3 deletions(-)
>>>> create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>>>>
>>>>diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>>>b/Documentation/gpu/drm-usage-stats.rst
>>>>index 6dc299343b48..421766289b78 100644
>>>>--- a/Documentation/gpu/drm-usage-stats.rst
>>>>+++ b/Documentation/gpu/drm-usage-stats.rst
>>>>@@ -112,6 +112,17 @@ larger value within a reasonable period. 
>>>>Upon observing a value lower than what
>>>> was previously read, userspace is expected to stay with that 
>>>>larger previous
>>>> value until a monotonic update is seen.
>>>>+- drm-total-cycles-<keystr>: <uint>
>>>>+
>>>>+Engine identifier string must be the same as the one specified in the
>>>>+drm-cycles-<keystr> tag and shall contain the total number 
>>>>cycles for the given
>>>>+engine.
>>>>+
>>>>+This is a timestamp in GPU unspecified unit that matches the 
>>>>update rate
>>>>+of drm-cycles-<keystr>. For drivers that implement this 
>>>>interface, the engine
>>>>+utilization can be calculated entirely on the GPU clock domain, without
>>>>+considering the CPU sleep time between 2 samples.
>>>
>>>Two opens.
>>>
>>>1)
>>>Do we need to explicity document that drm-total-cycles and 
>>>drm-maxfreq are mutually exclusive?
>>
>>so userspace has a fallback mechanism to calculate utilization depending
>>on what keys are available?
>
>No, to document all three at once do not make sense. Or at least are 
>not expected. Or you envisage someone might legitimately emit all 
>three? I don't see what would be the semantics. When we have 
>cycles+maxfreq the latter is in Hz. And when we have cycles+total then 
>it is unitless. All three?

I don't follow what you mean here. *cycles* is actually a unit.

The engine spent 10 cycles running this context (drm-cycles). In the
same period there were 100 cycles available (drm-total-cycles). Current
frequency is X MHz. Max frequency is Y MHz. For me all of them make
sense if one wants to mix them together. For xe it doesn't make sense
because the counter backing drm-cycles and drm-total-cycles is unrelated
to the engine frequency.

I can add something in the doc that we do not expected to see all of them
together until we see a usecase. Each driver may implement a subset.

>
>>>2)
>>>Should drm-total-cycles for now be documents as driver specific?
>>
>>you mean to call it xe-total-cycles?
>
>Yes but it is not an ask, just an open.

Ok, my opinion is that we shouldn't. Just like we have drm-cycles today
implemented by some drivers, but not all. I'd consider the drm-curfreq,
not documented in the drm layer as something to be fixed or migrated to
a driver-only interface (probably not possible anymore as it'd break the
uapi).  Problem I see with turning it into xe-total-cycles, is that the
moment another driver decide to implement they will either have to use
xe- prefix or xe will need to start publishing both keys.
As said above, I can document that it's not expected to use both total
and maxfreq as it's currently the case.

>
>>>I have added some more poeple in the cc who were involved with 
>>>driver fdinfo implementations if they will have an opinion.
>>>
>>>I would say potentially yes, and promote it to common if more than 
>>>one driver would use it.
>>>
>>>For instance I see panfrost has the driver specific drm-curfreq 
>>>(although isn't documenting it fully in panfrost.rst). And I have 
>>>to say it is somewhat questionable to expose the current frequency 
>>>per fdinfo per engine but not my call.
>>
>>aren't all of Documentation/gpu/drm-usage-stats.rst optional that
>>driver may or may not implement? When you say driver-specific I'd think
>>more of the ones not using <drm> as prefix as e.g. amd-*.
>>
>>I think drm-cycles + drm-total-cycles is just an alternative
>>implementation for engine utilization. Like drm-cycles + drm-maxfreq
>>already is an alternative to drm-engine and is not implemented by e.g.
>>amdgpu/i915.
>>
>>I will submit a new version of the entire patch series to get the ball
>>rolling, but let's keep this open for now.
>>
>><...>
>>
>>>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>>>+{
>>>>+    struct xe_file *xef = file->driver_priv;
>>>>+    struct xe_device *xe = xef->xe;
>>>>+    struct xe_gt *gt;
>>>>+    struct xe_hw_engine *hwe;
>>>>+    struct xe_exec_queue *q;
>>>>+    unsigned long i, id_hwe, id_gt, 
>>>>capacity[XE_ENGINE_CLASS_MAX] = { };
>>>>+    u64 gpu_timestamp, engine_mask = 0;
>>>>+    bool gpu_stamp = false;
>>>>+
>>>>+    xe_pm_runtime_get(xe);
>>>>+
>>>>+    /* Accumulate all the exec queues from this client */
>>>>+    mutex_lock(&xef->exec_queue.lock);
>>>>+    xa_for_each(&xef->exec_queue.xa, i, q)
>>>>+        xe_exec_queue_update_runtime(q);
>>>>+    mutex_unlock(&xef->exec_queue.lock);
>>>>+
>>>>+
>>>>+    /* Calculate capacity of each engine class */
>>>>+    BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>>>+    for_each_gt(gt, xe, id_gt)
>>>>+        engine_mask |= gt->info.engine_mask;
>>>>+    for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>>>+        capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>>
>>>FWIW the above two loops are static so could store capacity in 
>>>struct xe_device.
>>
>>yes, but just creating a cache in xe of something derived from gt is not
>>something to consider lightly. Particularly considering the small number
>>of xe->info.gt_count we have. For something that runs only when someone
>>cat the fdinfo, this doesn't seem terrible.
>>
>>>
>>>>+
>>>>+    /*
>>>>+     * Iterate over all engines, printing the accumulated
>>>>+     * runtime for this client, per engine class
>>>>+     */
>>>>+    for_each_gt(gt, xe, id_gt) {
>>>>+        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>+        for_each_hw_engine(hwe, gt, id_hwe) {
>>>>+            const char *class_name;
>>>>+
>>>>+            if (!capacity[hwe->class])
>>>>+                continue;
>>>>+
>>>>+            /*
>>>>+             * Use any (first) engine to have a timestamp to be 
>>>>used every
>>>>+             * time
>>>>+             */
>>>>+            if (!gpu_stamp) {
>>>>+                gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>+                gpu_stamp = true;
>>>>+            }
>>>>+
>>>>+            class_name = xe_hw_engine_class_to_str(hwe->class);
>>>>+
>>>>+            drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>>>+                   class_name, xef->runtime[hwe->class]);
>>>>+            drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>>>+                   class_name, gpu_timestamp);
>>>>+
>>>>+            if (capacity[hwe->class] > 1)
>>>>+                drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>>>+                       class_name, capacity[hwe->class]);
>>>>+
>>>>+            /* engine class already handled, skip next iterations */
>>>>+            capacity[hwe->class] = 0;
>>>>+        }
>>>>+        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>+    }
>>>
>>>More FWIW and AFAICT, could just walk the "list" of classes 
>>>instead of
>>
>>xe_force_wake_get() is per gt, so the alternative would be... loop
>>through the gts to get all forcewakes, loop through all engine 
>>classes, loop
>>again through all gts to put the forcewake. And we also need to consider
>>that an engine class may not be available in all GTs... example:
>>vcs/vecs in MTL and later, so we need to track it globally across GTs
>>anyway.
>
>Forcewake is only needed once for the gpu_timestamp, no? At least I 
>don't see any other potential hardware access in the loop. Hence I 
>thought if you could have a known engine to get the timestamp outside 
>the loop, you could then run a flat loop (over classes) avoiding the 
>per gt fw dance. Your choice ofc.

makes sense... I will try this and run some tests.

thanks
Lucas De Marchi
