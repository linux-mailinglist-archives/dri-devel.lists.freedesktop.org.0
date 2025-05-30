Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D01AC9831
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 01:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB7710E1A8;
	Fri, 30 May 2025 23:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRvWlpfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6428610E00F;
 Fri, 30 May 2025 23:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748648269; x=1780184269;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M2SxGD+Vdgizjw+aDcFDmu2y6/GaLyM2j7lLdXmM5Wo=;
 b=RRvWlpfu+fsqwKcUNYPJZ4793UVgDO9OWBzd81xs0kJ91l88SUKWXUK2
 dro6RwxkaIHrrM5QVMs3aFeQfhvqPo0pRcGkA4duWAHpniU+q69kdUftX
 9dFxxotGP2nud90g0jOtXR42fmbj05xtvnQlYIYw/KMoP/5sXYdQoIOR2
 y9m8ueYQCZE6dDANTOm//GCAyI0N7jhUmtLUtUitooi5IrutfkDE8hsLP
 rVEFRbUeZjXBZ9wJqADfkDlPWy5VedhHHKFBJ9+LMXfn0n2TmnSN6u4G6
 D7JbiQhzxsAgE0ykQM+I1GtpZcgLrj+HVHWV5nJRl9uEWy/Bf8YHFBz71 g==;
X-CSE-ConnectionGUID: 8ly2L9YsSWeFtcxTT2ewNQ==
X-CSE-MsgGUID: 0y3iy1PwQfWzZza1OJ+hQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50442901"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50442901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 16:37:47 -0700
X-CSE-ConnectionGUID: RnE327wIQM+HhSOxb7euqQ==
X-CSE-MsgGUID: YudQ+yiFTKuVUSBPtfagFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="148870823"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 16:37:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 16:37:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 16:37:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.62) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 16:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeGQ25O6mpU3eSuoOoEnHSNoz1KSHXGUO+NpctSq+uANM8ndLBwFVpRzGVh8JrF9iJKB0bkly8qGpipFRv7nESLGh3sJbIEHyKRt/Icb74LfHKnQIIe02SxkedCBHK9/Pnhza002AJ0p6zyGtZL99z7Z/bH9HJg2Q2F1zHnhN2aN3rolCqaHU1BLsa/0INNgn4JftwVQ14eRWsEK77+bd8Xs1qJTll5Dntycsy7ueeVKHfldzREnyCo2gNla2PBDUpuIaZd2THYcYxiVKtq9+xt7qI5cg0usD/+K98cnsu/kI8tpyNLW3zDRAfCCr/WMkG5el0vtW/UqMP8fycdYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoLi7HsZ0glEt7FnxsIcWu+XZMJutLToFIcBmjg7OIg=;
 b=X6OkuOgMI4T8MwBLOipUu/43shsvXzv8u0kNGaUkwYcFsy5pGJKUnOXgprLLNx4iczM3gUcGiCGivl4iquwT6481v09h7Cv37oi+IN5FiGkOMLTsXSmNkay0Hb/h9bQ7HUps0PYI242+0IU8mhWq9bA0IJ7GXDLS7ZStLxBl7yglaos9awBN1d6O7oiA6VVLK4nxwVWBtmMAJXdRpVJdxwhXGxyQLwwFaUD1IYp9cDVL6ULdeizj3VD9a0u8oX9YB06jom3hSTPXVyHHFhhBCfeTv0//Jr0R4EZ19S4I+Ae+xIwIOq2/HYarpSrRIB3E87xEGaDtDQdNqNzIzaigAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 23:37:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 23:37:32 +0000
Date: Fri, 30 May 2025 18:37:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] drm/xe/bo: add GPU memory trace points
Message-ID: <jk4e72grdri2d47hu4idgpjmwgge4vvojvz5f2dzvh2izf5clg@4bc6kc5ddnii>
References: <20250521224239.856298-1-justonli@chromium.org>
 <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
 <c5a7ed00-cbae-490a-86ba-e94060097760@ursulin.net>
 <d83d2f3c85c8aaf9a6e55457ad7744f9f19d9b65.camel@chromium.org>
 <cf88959ee067702b2cf0b12877faa1c0476f6805.camel@chromium.org>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf88959ee067702b2cf0b12877faa1c0476f6805.camel@chromium.org>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: bac63493-cbf4-4ed6-02ec-08dd9fd2f31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YUeoUW5wXEKe8NPoXjtnCZsOzAilJKiDNJfUfKWMRYPHrgio5BrXrkAMm9?=
 =?iso-8859-1?Q?QJbFTkpNlq3gxv/dpNh3sq3+mhSkLn232wmh0Kvmb6D8nh4vbiCWvFRtHu?=
 =?iso-8859-1?Q?DKLdbRLCRmY1lNgr/oqL4aUcWNLSaeLDXS2dfB/qVvpoNZ2JziDlK4bWev?=
 =?iso-8859-1?Q?/SzL3aO8q7eSBWDBc5YcvuWgVrgvfv/gWhQ86OYBJkycEg8F6JR29jKjIb?=
 =?iso-8859-1?Q?99ynSTzZmG2BReNFRVh4WzmnuTDaK4wMbYqZR22Be4vIg/qk7arJIceJZb?=
 =?iso-8859-1?Q?I5oES9zP5ueirYa24cXfCOs1D68kE5dcn6QbMYb1DPjdm1Lg2Q6b9MvbmQ?=
 =?iso-8859-1?Q?vgmEl4+xqcqL5eyW6jLrFQhkyoxL9iTNJ3bCw9vXxAR4n3aZjSeJ7KnspM?=
 =?iso-8859-1?Q?t682Xo7fByufmiLnq47YKLGY2i/AtC5kJexraeW6pDSJIAwkUSLo/k1kq+?=
 =?iso-8859-1?Q?AgJAqDjTEnxMuFjv4UV5w6g18o+yVBaxE6VfTO2GwdI/oeMhui51fjQ2Mm?=
 =?iso-8859-1?Q?EySZ0dHu+Fqg3dMRq8xp5HYAMPOk/5rVIkzmY6VpzH4Jpf2BkcZ4YahYVM?=
 =?iso-8859-1?Q?WC7dOdbQ38RcfqPVE6LVhqHfZPGF19kvAnUzZ0AJk/AbOpwbLGGFycDsHC?=
 =?iso-8859-1?Q?K+wKflFgDzm06JM7pFE/HHS/TIvl+NNWwNAPtFT/E56OJr3ynPGM20iupE?=
 =?iso-8859-1?Q?MmYWRmTjERT/Vgmxk4p7YL+l3V5oOyrMf97135aRj98a0EWl1FJudpH1kx?=
 =?iso-8859-1?Q?6W7u1LZfMLFvC8IHeCJyOIuTtni+dMUcOXwLVTzBDz2ZrKEiKgJIuf76zF?=
 =?iso-8859-1?Q?Wihz0fg/5uhOdYWdKRTZuO6nbzWnq9pUlcbXmyvFfW/Or+H/WigGu0flGV?=
 =?iso-8859-1?Q?6Mpr/6RqNW+fUPxtwIQqdPWN0DCSCd3qhVSv0dq/KclUFoW//939nRJjl9?=
 =?iso-8859-1?Q?vwDQ1/Sg7/nc0x6DYViIM8p8WVBp+TUYXXU5d/Dtkhr4epufJP2GILyjPE?=
 =?iso-8859-1?Q?ljw7dipGH3DXSx0RBQ0bqFInMeaiLgz6jJLmQpG/h5rkfwfD20orki2mgp?=
 =?iso-8859-1?Q?lz17CqDVPwiYoMuUmcpmimh100Oe8d7h8FLg6G6K7w/pYgJ+otAVUytnFU?=
 =?iso-8859-1?Q?5Rdw43F0Lechgwcnl1jjz52FKtZ9YoFgeTuLES31Fc7RRSKhPXiqUWgNUv?=
 =?iso-8859-1?Q?uWcM47HUlyfm7BlABR8ovKe14gfMdRPDL68mK+WW7+gxid4WYTjdxjUJAi?=
 =?iso-8859-1?Q?lycSr5Mww31bhqJMbmYymAqya+Dk8Dy5SWgaF99/Lj1FLQiWnMWUEp9irO?=
 =?iso-8859-1?Q?XNrCEuX69+XxhK1857eL7XqpQvEZy7o7JllJiHPjthDqZdG1Y8FpAwtUv/?=
 =?iso-8859-1?Q?zih+fldEfsXCA907VNpEzNHd5gKtY1xGBfBvbCdOT08Q3KfNpoaX05ecoe?=
 =?iso-8859-1?Q?ofDZtFuZsmkmIMC/Au2QpVfL1JXIUAL1DONz1lcE5shFhtIAHVZkl7MCa0?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?r6YhylRE8uHIQH/wc9lMxww5sKBwTm3pNzpL1feT/AZGa9JiYGLcFdf+0r?=
 =?iso-8859-1?Q?PsIPt5rTKfoXjUdS79EBTdqekGrAWSZzAPBhYkFLoondP7NuWFJAI1WehS?=
 =?iso-8859-1?Q?VZ0lfhEhE1p43qoQXzbharvqAG79SUHWCjqxEDHTujl+vQagnMbYs99icO?=
 =?iso-8859-1?Q?n83/UQLJK9TOzOGHWHvVnirZaioYWf5FJ7RLfqygc68PCBvdzcjrXYXGbH?=
 =?iso-8859-1?Q?+zsUjEpZD13WqaMWyDOIDmWagPEkXVpkLyF7fCKb1cbDHki3o/12swJ9nV?=
 =?iso-8859-1?Q?HikC10JBMovAUHES/E7aqSS8UELaYNDREhb2D8wI3Nr0E1O2QCE90miAAI?=
 =?iso-8859-1?Q?5qUOxaB4EpFM2seCFAQvJrjDy27egckVECZgXGFByrGi0U7Eybn1tob0V7?=
 =?iso-8859-1?Q?/PYBXdswQLGYmhm0MLF4TZg9hYpnh0r+mYwly3EBnVgTth/DvDjXHH3ACH?=
 =?iso-8859-1?Q?ZCJMMRBLutT20nG7bjjBob5P2NYrnZovlfBRGJ9JKatgpWaflm5wgL/7jk?=
 =?iso-8859-1?Q?WM/P1s6YRQ0fsZ8yzmxv0Tbn+ONaKWPIHcO/RiupbF9wCe7xRcGiAlEViG?=
 =?iso-8859-1?Q?v7XgLMD7/QKqfSlJ7QdZCriT4aEeQ8XYHrtnJ9IbEke7htddH0kW6ujJh2?=
 =?iso-8859-1?Q?hlpxC+cSmEtzMP0Obxd9l3cXf3biuD+AZkRzpyOQSvWGaa472SckwcrX1U?=
 =?iso-8859-1?Q?AyCIRmlXHB+zhIO7+V2QYPxPsZf/Q33+fxUX4K+m8rUnvhW3uc8PLevB0G?=
 =?iso-8859-1?Q?PJwW68A1K9MJne19XNkScGNddkhAQWXMCSc7ercSWQLBAI7ftjARR/hvQx?=
 =?iso-8859-1?Q?GuO9jpZUni9gya5QEHfBz2YAgNC9y3+AJ+zDhJYzpCVAwDq3StirSlY77p?=
 =?iso-8859-1?Q?WtaWUSXVX4Je+SSjNMqLIGqo5f+dyByCdNQOwWI4RtnJensw0rJFa4Mdyh?=
 =?iso-8859-1?Q?QeS+S/eZM/NLdFQsdMZE0eoBwF/9QMsYbqYckF5ItlWozksqaUsyzvKhxA?=
 =?iso-8859-1?Q?EZKvL/ZKq8CzZHvU0B6zljZhWF3+2AX8nyDwGYv7hSdqWyn7bq2p3Uz7Pb?=
 =?iso-8859-1?Q?cxU9iIB+P/5lJmKiKVzkwIB5YPKMK0v4h10WURHPes8e6+PIo/msmsfKZr?=
 =?iso-8859-1?Q?uAvCIm32Aait/ud0dLsWPwyN6VivObbFigXIYsJlCtpN8QlpfTREbOYXcp?=
 =?iso-8859-1?Q?Jpzj5UoeATU25TV+8vl+Hpn1MHbCp1uLkAZpYGjTscAUl8efTUlFIAx6HS?=
 =?iso-8859-1?Q?vJeJttALVFjJDYtOuOpSgOPt7d6j0yR+8/AQ/q9IeIHD3pIkaidZ1lYv8u?=
 =?iso-8859-1?Q?KmovE5A4aCcShssKpBPM751wpiNRrbREnfirCrli7SXvyjdke2qH4F/i+e?=
 =?iso-8859-1?Q?01SK6Q4m6P8y7KggKx9F4z6n7yV7ogP1khiYShn/F7sDbV+4Q0WbVvSZXm?=
 =?iso-8859-1?Q?atqsMUuReEvrcMTmBIXiZ2nounva9riA4zPEj+2XrQ6EVjza9KC/ZtU1pE?=
 =?iso-8859-1?Q?9PMB6cD2kc9dpixNNsl1PwO2+2IfcrdO8h9K4v4pT2BkDkqOQZYy+NHzDH?=
 =?iso-8859-1?Q?S3UE95pNoW/oCtHrhz8Br12Pv7Vho+lrDokU7vrNcz3DR9y9TnjMJhREMW?=
 =?iso-8859-1?Q?yMXl+olHocO56AgfxG7SRkxdmZ8ACOwzPtYC3LypVr7GpERTZuaGcSZA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bac63493-cbf4-4ed6-02ec-08dd9fd2f31d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 23:37:32.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo4oY5Wb+GLk5jw2cMEXvRhldRJsPSHwb22sin0BXfsY9kN8qC7TYl+m3rjvf5mZ7km5YMz9mXbpi6bnB41B1+AYHmyX2IXlz3b3aVAH54E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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

On Wed, May 28, 2025 at 08:01:21PM +0000, Juston Li wrote:
>On Wed, 2025-05-28 at 18:34 +0000, Juston Li wrote:
>> On Thu, 2025-05-22 at 16:14 +0100, Tvrtko Ursulin wrote:
>> >
>> > On 22/05/2025 15:50, Lucas De Marchi wrote:
>> > > + dri-devel
>> > >
>> > > On Wed, May 21, 2025 at 10:42:35PM +0000, Juston Li wrote:
>> > > > Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for
>> > > > tracking
>> > > > global and per-process GPU memory usage.
>> > > >
>> > > > These are required by VSR on Android 12+ for reporting GPU
>> > > > driver
>> > > > memory
>> > > > allocations.
>> > > >
>> > > > v2:
>> > > > - Use u64 as preferred by checkpatch (Tvrtko)
>> > > > - Fix errors in comments/Kconfig description (Tvrtko)
>> > > > - drop redundant "CONFIG_" in Kconfig
>> > > >
>> > > > Signed-off-by: Juston Li <justonli@chromium.org>
>> > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
>> > > > drivers/gpu/drm/xe/xe_bo.c           | 47
>> > > > ++++++++++++++++++++++++++++
>> > > > drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
>> > > > 3 files changed, 75 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>> > > > b/drivers/gpu/drm/xe/
>> > > > Kconfig.debug
>> > > > index 01735c6ece8ba..2371eeda0afd5 100644
>> > > > --- a/drivers/gpu/drm/xe/Kconfig.debug
>> > > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> > > > @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
>> > > >
>> > > >      Recommended for driver developers only.
>> > > >      If in doubt, say "N".
>> > > > +
>> > > > +config DRM_XE_GPU_MEM_TRACEPOINTS
>> > >
>> > > is there any particular reason to make this user-configurable per
>> > > driver?
>> > > Why aren't we making CONFIG_TRACE_GPU_MEM configurable (if
>> > > needed,
>> > > but
>> > > could just depend on CONFIG_TRACEPOINTS) and then drivers just
>> > > use
>> > > it.
>> >
>> > Could be done like that too. Msm does unconditional select
>> > TRACE_GPU_MEM
>> > which I thought wouldn't be acceptable so I suggested making it
>> > configurable.
>>
>> Ok yeah, I don't see a reason to make it per-driver either. I'll make
>> CONFIG_TRACE_GPU_MEM configurable since we don't have
>> CONFIG_TRACEPOINTS or CONFIG_TRACING enabled on GKI.
>>
>> Juston
>
>Scratch that, CONFIG_TRACEPOINTS is enabled on GKI so we could do the
>depend.
>
>But now that I think about it, CONFIG_TRACEPOINTS seems enabled so
>commonly I wonder if we might as well just unconditional select like
>Msm as Tvrtko mentioned and then not have to deal with the #ifdefs?

we are trying to remove the selects... they are too cumbersome.
See e.g. https://lore.kernel.org/intel-xe/704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com

We should **depend** on other parts of the kernel, not select them.

>
>If that's not acceptable, I'm leaning on just making
>CONFIG_TRACE_GPU_MEM configurable.

sounds good to me.

thanks
Lucas De Marchi
