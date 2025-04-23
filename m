Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469AA97C47
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 03:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FAD10E1A9;
	Wed, 23 Apr 2025 01:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rh0m6J+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49210E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745372853; x=1776908853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MMPOrt+PepoqJfGIcd+0Ov5LlSvpiuY+LZq0um0isME=;
 b=Rh0m6J+06s0bs38SOYMWNzq+j/cR7sVpMpoTCNdIfRFXIWjsu1GiFCYY
 xrvChpLcUDxyX9QmZPMG7pwuAPq2+bEEwQCJt4kjjAHURLYNPOdOVWYD5
 5d7q5ibfo49mqWvIOcl3/kqaBCVwoGwb/D4JJd4AfSa3UidqrrKpiwHIz
 ARukEYGpp48zw8e9dgTi8krcujL9zQZKkeoiOY15oiPWtyFebT1hVrnt/
 /M3liVfWqJ76eEtm01wt68BQg5hlLDjpdwh6KWDdMXx0d101oBkWaD0fb
 UesJbxwDZV3taL7w5u01umkJMqRSQZlVoihbuAJYsenQ1duV0YszhwJcg w==;
X-CSE-ConnectionGUID: E/8IRXA6RiGYYJwJbCSbBg==
X-CSE-MsgGUID: LUJ3AViHReO6ESCVBF+yhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50611914"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="50611914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 18:47:32 -0700
X-CSE-ConnectionGUID: 0DnBx3ynSaOnclUQMPOZ8Q==
X-CSE-MsgGUID: anynhCdsQDyQAxI8NNw67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="131919677"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 18:47:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 18:47:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 18:47:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 18:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOR3jkPis2qpR8/c44udAoVRk0mizoKZ2Gdpq3M23z+09XIw51vpODzp8bTbFwyk9TDvvz92nJn1sgGP3hIoRc5sKSQbw1nvokRJno1Kf/abMOGjRvsvfdtwnRlANW77rj51Tc5kGais+97gZiEn9LH8kxTCEhb0Dm4mc0uvX07OMWe8x6F8hGTnLrqgPPhZU2MFIMxJyEERRPj8s5wLOgT0IY4fa5eCtmD3WiAe4L3uXtyAuHSVaPn4huzlTiGmvp9pyf6qp6q58+dTdzbDvTMDxPR3SRvZgcgN2wlRjWX/OvqjrqfS3Gs3zAp+I7dFdcCNUxvl7schBe/uuEVCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZQKA5xKfkgV3aD+h3+PBwei4IxXoV74V9imRSYM+o0=;
 b=sGsaEaX3+FWOJOdUr8GdlHZ2cZmQVhXvrcyWNP5O42/7Vw4MJgkAquTg6M58+2LyZ/dC9R2xs2DvamFuESe9VUvANhtU40oojIx8tTCHJIv/lhd54iErbCG47D+1BMFDhP3XGPgDUJiwb7Wjo9YcTojNnePgQqBuG8/H4UbbN8l8wccP2TLxefIijTWyyREoOsw4Dn/BvbISHr+k2D/qyijsBVFTGpyBLMKWUkYn9rQfVlnufIxBfDDdc6nCMXFAxZkT9+VsiXVQIsLqRsl3CKxYmEp84+pm69FSNN438vpMgCgPuyUTRfbGD71wOanF/H51qrG5sEAB//WNP5u0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 23 Apr
 2025 01:46:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 01:46:48 +0000
Date: Tue, 22 Apr 2025 18:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: force_alloc in ttm_operation_ctx
Message-ID: <aAhG2E8+0W6JHibK@lstrano-desk.jf.intel.com>
References: <CAPM=9txG6J5cAMcKJWE_Ya7HCdykQYeM=s5qmEwcTVLbF9qoAA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPM=9txG6J5cAMcKJWE_Ya7HCdykQYeM=s5qmEwcTVLbF9qoAA@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:303:dd::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f57488-3c4a-478e-4df3-08dd8208b5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uLr7coq2q6xroq683ayxkVMDNs/1ht/h+Z2R+663ojyKkz9eZh/JR8zWYpj6?=
 =?us-ascii?Q?lumf3/GZ4LNl6/ocapj17ug9ciVAsfLeEn9TKQq8WlRH4SIvmLtuSOy0PzpT?=
 =?us-ascii?Q?3jB2B03PpGrXLwnrXBQxcihuNyCzfZuLVyCBY+Rb1PdFlyJKX4IxSpfSYC7o?=
 =?us-ascii?Q?+q/0FCCNH66NseqwyfiQq/cdP8M60y800+L5iGuKN7Eu20dEd42ZWvnAgMvF?=
 =?us-ascii?Q?9ol5Is+Wq3pvpOUXvztzTstiqqc/9/U3IomilZWFJR9aE0+75gj6RYlxKlH/?=
 =?us-ascii?Q?eoca9vC0tmhPaSxosfTGE8p1z98cz7AU22BcLtcWiD5gC6HIgjzk89HZWMY4?=
 =?us-ascii?Q?mc7tOr75oUK13yCu3beu72QqgZbCErMH6BABgrW2mlrjr+v+z9M9WqiXvQGg?=
 =?us-ascii?Q?mdd3XVflngmL3v3dTYyqL4zb4p7CCP/3PHIw5I4McMT4OPnrJVSDP4+vN2w8?=
 =?us-ascii?Q?aYhojUY/9WfKyUJBc272A/lWRdGwbnI+XvgbTdkY9lM28HE0NvfZ6dBEHQRJ?=
 =?us-ascii?Q?ULq8uffcB+dhW4ZO6v/Y/ztveEzf8XiikmWAgdToAlvBB6/IPoHKHF+GgQ5W?=
 =?us-ascii?Q?nMShRgwGyWKIE7TKQUEDCOAuWO4+BNwrda3DmoiV1rWbXCNVHiGQ3W/klzv0?=
 =?us-ascii?Q?YWsXjhPKc4wCKCqzcrLOlnpaQPnQbDyTUOkL9bbbpGZ+OulPAeIp88FFr3NE?=
 =?us-ascii?Q?L0dJaFVda7vz99ul3aFD32uJrBLaNlh0Tyw1TJwfHfJvCE6vAXLBpTrZYo9u?=
 =?us-ascii?Q?K1vSj5R30yjouXgBE1C+CEhcLP9bguHZrtF9W11sv/WIuWVwkojwW0ZdhuCB?=
 =?us-ascii?Q?0fkgAK/fF4bmECYgXx3xxH+0znObcfShInkFoWq4riSuFLNAm34BK7m6fSER?=
 =?us-ascii?Q?yX/k6GoqJy+cmBL6J/tKupl9G6HyQrghV7RNUfaAGDKa055Pxh9oftmCLUnb?=
 =?us-ascii?Q?veILjo4gbrMtGrc5KhonNuDJg3F+5TUJT1g/ugyn02C6ceW+QYYhoXVz3T26?=
 =?us-ascii?Q?R15p1nVNJrzktZTsFyyyG4YaNuJyFlDMGMkEkot5/AFI08JGjXBe73azttd9?=
 =?us-ascii?Q?v8gNbX3itUvNkSU36b44W+ggl16oq8t4KFw5Fq/e5E39Gwh/+wyKHnCQRjlY?=
 =?us-ascii?Q?JHMVEfH/9MrrOPqep5Q7av2PQRM2WlScxyXuSfkXzk9dqaV5xtOGBjkSN63A?=
 =?us-ascii?Q?Kr+NpAqNxJZ3nCHP3/wWE32OvbecaigBr41no5Uj/a6uUAvuATfFT/cPJ/hg?=
 =?us-ascii?Q?ucX1DQhMDbznLY5v9OsM2xhFzPMHpid5UEqP/7r7MmS4MP2IQg233mf0VP9/?=
 =?us-ascii?Q?wZm7GLLSMWp6HsTaQ6bz5+EF/hsiT1Y1wUU80ULxhkgbz3nAgzfuC5/TyXjF?=
 =?us-ascii?Q?StrJGjnf6Pp+IA0gPuWuPbut/PwQ3RsDjGcU1s4AcTldsISaIMebAVq1+EzO?=
 =?us-ascii?Q?P98rzvrzPDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s9GWEthgd0/YogI1q6EqUJDetu2w0sbt0Uzn7wQ3l4BtDWqlkvsTyU21Iqla?=
 =?us-ascii?Q?6h3fQR0Fd3Q94E73wZfRciawD/+2VzgjZQL/DY4/TDiYkhsQ2vZq1hhD8Bc+?=
 =?us-ascii?Q?bJpjarwvlV4o4IszAoBcyVp0gQmAmcRJAT3XsEmNWBHNGYL9e86oEFBBw6wc?=
 =?us-ascii?Q?PyYbr/jao68irSk2DZ0qeqSwgA9JD5TYFfnjT+9J/HQz3oygfQFWwPKTAJsm?=
 =?us-ascii?Q?77oiwXP38r7xvWoME1QorWWqUfmW/br+xB5ji71lBRBPytDh8PVc3bn9k26c?=
 =?us-ascii?Q?yaVQraXfKbT2H+LmLtVGDvxZUPc14U3tW+IePrWf7hiIZBc3wg4/yNToTW+5?=
 =?us-ascii?Q?yqturBNGzMIWA5GTIO0G5sV0rvypiKhNRl4yiOz/td7hUClcHqF9Ad0P9eaN?=
 =?us-ascii?Q?VmHPzoOxDF9ocI2lQSHu9kAw9h7ibHcIipsgaqsnuG9GNWHOoqVzFmQU9/Jm?=
 =?us-ascii?Q?5/MlX5tM+lFyr4K0VVYnu7h4zJFkIZtBTeCKNvEuF0/XZlfR+TmjYQSvwIXW?=
 =?us-ascii?Q?np01KXBqN4DmVCI8PswZ0xB/jIwjY0zZvodvo9Bl7TFvz1P8rr7VbhaO0wxD?=
 =?us-ascii?Q?d+8Xts9lYrReM0+iwg5eddJM3HKogPzK6PeYc7RLPC4FswKcwqRhjwovK8qG?=
 =?us-ascii?Q?btC2XAl7tHpVYQ/tyTzEMRctNpsyV21Db5u8+G79+jP7hVny8n0l7y4UqJtl?=
 =?us-ascii?Q?Y+p+0XMfiYX5SAqOPa6XwdiUvUgaWdKbUrV74D+v7VhrfYpxuosZOeeRmB1v?=
 =?us-ascii?Q?Mmr21Rn0wFpAD2Q7oQjeKLcn0hNXyp3P/bbC7f3hB/P/WwELPxYDYVAlM5se?=
 =?us-ascii?Q?tWsh6DPWIxh5wo4GkNrQ38kzBYERCAgQeiseMTbHX9BSw4SrbLoC/jbVWE4I?=
 =?us-ascii?Q?G6Wj98cIYdoJL+/kscFd6lpakXIcm+zfYvKJIx8uZvbYl2p6dA0xBToPj/z0?=
 =?us-ascii?Q?abvAPd2kWChFApOaUB23ZCBoY7eWEq5r2jcDSw9XcffVeXvQuER8NwQ9wRD/?=
 =?us-ascii?Q?6SNeUYtTyFbfDXK9itggMTCMmwVVA4+t1Gs+5x+H0QJEY8a5bP4sCyuDsZ3g?=
 =?us-ascii?Q?J/YOi5VpM40rojtH5X5Bwq9YI7nNKKr9oiYn1tBykU30GiZkwEm6cf6bFVYL?=
 =?us-ascii?Q?TjHcX+B9vttqjjkrYpum0QV0qIm3QLD28v8vkELgU9yLhaGmXY7Ov/xAtXOs?=
 =?us-ascii?Q?wiwZZpwGWu8ruzp8iVkb2NBGvq1WRtgbxEvZnpTYdi2jS9kXufwOWYTMf/RX?=
 =?us-ascii?Q?ogjGotJ42h3g1jdFbzBcYTbbes1DTlNTki1kWYbag7jPlQwX4S+9332sqgxW?=
 =?us-ascii?Q?F/QJ1xJg67sO6MQPeZkGKPACOl+bmgWnYp5ZmYRTTMzAnk4/1dYz2L5Xhfji?=
 =?us-ascii?Q?zZl2AMA2s3bXrIJNHEudFkYP3LHczZn7DlQ3UJ0F8u6slUWFOM32qWsetYWx?=
 =?us-ascii?Q?Rf2YnfOANpyCxXFNTK131SsGjihgRT9hTP+bAOAX1Ws/J5rWTNx/TRB9Lxh7?=
 =?us-ascii?Q?tZ4pSSc/xykkTs4wwwY9kr/Sei2An25gQJ408PRzwOnwm/lSX+IFHa/KKMOu?=
 =?us-ascii?Q?fBXv3fcQpq9b4lTfgkIWa3wftQCSgmoVWpQQG2k227zw3Ox6+sEzeDj7bkiz?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f57488-3c4a-478e-4df3-08dd8208b5ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 01:46:47.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +whIa60N7Biz4Ga06d4Q09pgnZ/LGAbchBdpvXLslAT8dn1t0cE0cse8AGI3ZVS6mNbwqIRsLDmzxEUR5IAWLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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

On Wed, Apr 23, 2025 at 09:35:35AM +1000, Dave Airlie wrote:
> Hey,
> 
> Been digging a bit into cgroups stuff and I found this force_alloc
> flags in the TTM operation context that seemed like I should dig
> deeper, but I can't see this flag being used anywhere, places set it
> but I can't spot the consumer of it?
> 

A quick grep shows:

mbrost@lstrano-desk:drm$ grep force_alloc */*.c
ttm/ttm_bo_vm.c:                        .force_alloc = true
ttm/ttm_resource.c:             .force_alloc = true

We have this wired in xe_bo_evict() too but always set it to false at
the caller.

Matt

> Is there some out of tree patch or something currently being
> upstreamed to use it?
> 
> Dave.
