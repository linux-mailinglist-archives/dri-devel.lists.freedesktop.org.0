Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16502AB3C35
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339210E446;
	Mon, 12 May 2025 15:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cL2kZxHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2389710E36D;
 Mon, 12 May 2025 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747064095; x=1778600095;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gGhqWBoBilE7mH17MPX9VsZqPRmmR+2mk9uC+olHhio=;
 b=cL2kZxHwXBPsyo7uyVB7GVwhK0Aq78dENpUQhgF1vBq0jYty9cNXWqX7
 D8DtdUgZhcMjyutsbDGmZRl6lDihOYdx6KeRnINhxeKxLxNfSa6zqSluC
 u6pxWGXId+mKvpUhzM26XBLR1HCKyEMdiBNSkCxlAfpmz4pkJl0nfFTPA
 sY8dpHFi5AJlg0JG3AUaM/lO4a5+cKd/GLCD6xa18Jl4YHdjep2QiWww9
 D5gT1dhxnvM9H/Or80EsYIXN+9N7rf2mfN/hdO0ARCrMuAZQ77PhvSEEB
 +QjH5o37iC46EOPuWDySrPrT9cTFVvoBTW6dlsSlE/SGYmSrqwk3qrWAE Q==;
X-CSE-ConnectionGUID: Bo4XsPupTKGluQvxtww+rg==
X-CSE-MsgGUID: 09rgmQh5SbGBSSAfxw1Giw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48736817"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48736817"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:34:54 -0700
X-CSE-ConnectionGUID: nT3kMNbbQ3K9M0c8dyfKKw==
X-CSE-MsgGUID: dofz1QrwR3OrA+ihrwSFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="141459053"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:34:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 08:34:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 08:34:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 08:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbWIPartWz5T/aKVQ4ozwvRHvlWQQLh3JUaDoQ+mkdhtbXRil47f7U3JoW43jCiDH6Fhxd3Uwg6mJKOpkOg1RZY7zFsrVLy6lj/H9PjvuEsrcexqTHl+/AJbPiYIRqtxezy8uOd5rL0YJ5EiQ9fwtGqsPBtxlzDyVPBAip6p2ulX0NaPD2KJeYIts1D1m8gX9W+QqcDn8x+uqJn4p+V/AijJvf2Ov9W2oI0i02Q5Ep+BvUzdyz9kap7OLME6KdU+PmtoYr/Bq2cgIZxcitJUETQPSXitIpdN4K/1H6Nm3xOo1fj5A/nFIbva1uh9+PQNm9nAjdGF81YQ3a74BdiHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK+5CGFyAbprm6k/CoNOo9x0XMwUwQN4zeB3tBZpvKo=;
 b=nADqBtVYy8Qo4vi7Kl2Noxx+hWxa+lOEsbC6JztsHDTrTb7JyBFVR3C1S1NXtwGUDleUf6776I1pvozzd4MhK5tGTA4ltyOi7PtLVsG7U5umrD6bzPP4CRfWO/9stOGjb5iDUcgjMnGwFrFLj7POG6PdikFbngeQyRKvnVRMONmUcE2oKhHkrER9OTlg/A27BBB8b4TzJopTWQk5oHNgng+N2GCWDZ0EawRcNnlFO+uHfgNn7/QEdyovBSjQxjSvNhBdC6gTLr74Fe4h9Pxx+xWvK6khfDOPnjAOmv/nfAhPVkLAayOhinjCpZ+cJFwVbhH/vUwRcLra6rT93LYYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9108.namprd11.prod.outlook.com (2603:10b6:208:567::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 15:34:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:34:50 +0000
Date: Mon, 12 May 2025 11:34:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <siqueira@igalia.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, Raag Jadav <raag.jadav@intel.com>,
 <jani.nikula@linux.intel.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm: Create an app info option for wedge events
Message-ID: <aCIVFMcJB6T4IjW8@intel.com>
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511224745.834446-2-andrealmeid@igalia.com>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dc44e3-5c83-485c-3113-08dd916a8870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ee0qAhppleLD5UZYdrG338hzzpsva+YJO5gt6z7vzncux7AoZhQt9YDOwW?=
 =?iso-8859-1?Q?oxgleJYMXDm3KxJJl0/7JZpBgnF2/IWW0yjeg+OXxZacahTbD4ykmGGjK4?=
 =?iso-8859-1?Q?STNIFLVzMLd8av7QbjhI9vAb8AMNQb5mpekaE3SehrucBCZ0SyOHdQgssx?=
 =?iso-8859-1?Q?rC9VBMxENz9K6APmQ3Vkh5WCo6pV9MVi0BnXMqf8vILwMW+CXA3D8Diptn?=
 =?iso-8859-1?Q?EUGTRJKLFbnRK2LjWhm7XXJZ2pCHkdtNWh5NVIqz3j8Qt78xpS2E6Hgq3C?=
 =?iso-8859-1?Q?Vdfq9tDLQLeU9IHoMPlSpMAB51k6ahPyFBSC1LZmMErfB/LgsGyiyBezH/?=
 =?iso-8859-1?Q?dMzad7z3i7J7PuVA1SgQ9qdW7ETicmxZef4fG16SbNnYS0918UFikVO/x8?=
 =?iso-8859-1?Q?VhhQ16+NDsQbn0aysvLI6NeQfwsSglqyfv3YS+4L1fgLqqaROvWiSYSGaL?=
 =?iso-8859-1?Q?aWz9CFrqb90ov5Z28aUEj4UWB8r9BtH/mTISTGlVAk3gpKUbAI9qfbchKS?=
 =?iso-8859-1?Q?KBxuazgl2yfpwR4jr48A/wl5VA7J0aRiRqPzVMqyVP5V4bPIxh6jCcNr29?=
 =?iso-8859-1?Q?iEKIJ9pdLd9FHeQ5bAHqcQyMJN15Pdj7miwEoKpXOxuWcDsT1tOaqDHL08?=
 =?iso-8859-1?Q?PmCTtrHIIkNnAE/0sLiiHEbKbafaQDgtweS/394P59AgFe7wCB8YDqte6S?=
 =?iso-8859-1?Q?Kzfn98HebUHSBkoyv8rolE7zcJxTsit5naoEc5MHQMQhBSGOm+7K3dVjfB?=
 =?iso-8859-1?Q?+bCL7g0fOSY20SURwuOhETSYEthecYJw5FONqkoFH7PLocKbWrdecS2Gl4?=
 =?iso-8859-1?Q?JVDWcSYDhp8Kf2oO+ttMtughzueMNvNPa4IwicXYGxfHK/yaT8O9cr5ACT?=
 =?iso-8859-1?Q?BdVIhO6MzK5tseP/H3H24vN3Y5hfUBMnioJt+AdPBvB2SpUP1o9XQ/YzMA?=
 =?iso-8859-1?Q?CKR+ZVMe7VQIIktGoPFhFXvUZ6/bHWmNzBN+WBKuPKbbtRx7PwISHsnQ8t?=
 =?iso-8859-1?Q?dboKTnYlaDZklmlRbpH37CDRvolVueKQB0IkoHGDV92H6HzKkBRFIfQyCO?=
 =?iso-8859-1?Q?Nc4NOAgUbmm2v3ylol0/66v/uLyhvskWLu/ajpKxXlPU/qWZ1zCKLO2rJr?=
 =?iso-8859-1?Q?FCr7fsYq6P+O1Pi32F60UN/g3jKduhBD8q/Np2pHM5F3/HD3L7C3wY223l?=
 =?iso-8859-1?Q?ST+68WtXfJNYLATqt1BCiiiRkVMUh5dExIHd9ZchCPKaKbjIyZGp8Su5Mi?=
 =?iso-8859-1?Q?FCKwv756bQHUAihMh1YxboKr7YhShzf0aLv38tPhBBoB4/F+1E+USpmBbA?=
 =?iso-8859-1?Q?/3zpIDuk1qm0dYGv4lUs/aNm689pmDls2jG8nTNOKigKmbYyg1OIrhH5Pu?=
 =?iso-8859-1?Q?RFXIFHl7Af9utqvcGkpbJpf1HamNJl3JRZ4kfCYYdWR2hGFwirVVI0uSqH?=
 =?iso-8859-1?Q?LuIJFF2YTpIiBY7uRcRk7c3fm+TmwcLJ7LyWED4O4JtllRZdt5s1bqkk/A?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iQd+7musFuOORmlEZTTAgC00JBgp+GZFD3iwMZCUKSfiUjvH6k8OeLZm9O?=
 =?iso-8859-1?Q?zQEFapI9Tj2NnMzTUNo8MT/c9OmaR5IViwYRy5rjPLaWZrsb1MmFG81fxw?=
 =?iso-8859-1?Q?eB60jryO1TKzeo8X6rOKEAOacFXIEFqcZmubbAFJGDR6gMARPkdrJVFNOH?=
 =?iso-8859-1?Q?p+osxVd9NiJ/CvTqArvW+GKT7zY19UT6M2LjvItOCMc81okJ/KRxSDDgc+?=
 =?iso-8859-1?Q?ZczKJrh7vetCuLwQbNNa9WMY14WthJlzgyh9CMkzjLAM0wlFQxi697Dgw0?=
 =?iso-8859-1?Q?z/uDDuxpoJiRag0bV0LZj1isU4CHsS7mqD8NQ1gbW++qmGXfnZcqYBab5h?=
 =?iso-8859-1?Q?Fh15lyMjU+ABNcCPwdq3WFea/AY/yyDgPw1SwuEz43ObrQAjYV+0kbGAfN?=
 =?iso-8859-1?Q?yJh4SRSEIaVSaeAMZDOlreflleOOHv/RRS65CqLzlViGfJGt3SwMJuWQwC?=
 =?iso-8859-1?Q?sYmArSWzEAlT998JDyl61YVXqzF2zYIVf1cRt/yGqs256XdcNDTJCommRV?=
 =?iso-8859-1?Q?YGK0A6xtrNnv6nWbbIrp5SVlzTPDdOmeRBHZ1ZcYPFAaFkGP8usZR2EQ7k?=
 =?iso-8859-1?Q?miRHARgtwKw7Vg9cIKaO6xFXZYSvC+YA/37SxnwHTQxQ+9F03dm/RQZgBC?=
 =?iso-8859-1?Q?Xj248/n2EY4SzSlOR5qMh1fObx2niGB2ZvMJifYpahYSpe6vciUboib3wS?=
 =?iso-8859-1?Q?ZIEIkGDfFWdVhpDLK6kPGoWwKt73RL613l0qQRZvn6NdiQxiHAVPRWg5b1?=
 =?iso-8859-1?Q?rTEP/TUBLj/spvZ0YUDoQ68z+hho1hgJJNAIvobZ41MMjoKRmY+DrqX6ra?=
 =?iso-8859-1?Q?BZGrKpznS4/dT4Xo8qlHIoiIBTm4YQTqfaEYc/U2TglgySLs7Dyr5mJGwX?=
 =?iso-8859-1?Q?Oe4s+LB/PP9VknCj4qtPnH0d6Welxq02QMciE4QAoHrr70eOMlPc9PQncR?=
 =?iso-8859-1?Q?dZiNdo7TX0T5Lns/f8/LoIIr6E7W2Cfnehg10Hj6fg0pcMysrOWvuiKH+6?=
 =?iso-8859-1?Q?VsjnaOQdK/I73Y1RUm+dYDkmWiN+RTbM+k8+ufCi+fIXGlBmbg3OjcSc2k?=
 =?iso-8859-1?Q?yxz2FUv1dhsEE65mx4nu9WQ+161MibiR91UBDd2A1vTekowQ3mfySTjULk?=
 =?iso-8859-1?Q?IacmCct1N4yvyFevSmzCC4Ly8/DkvJo/zrNltwdpt0vc00UyBNCdDJDChR?=
 =?iso-8859-1?Q?56/PFqo+OkieN6em26r/3CGcTI/XRbhWNKsEy9+KwBRa6rVDXIxwU4c2eG?=
 =?iso-8859-1?Q?dmrpbE5b1Eb3/QyJUVeS1uXanek+NMGzjZbPYjx3osTLLTnWVEATL+puxa?=
 =?iso-8859-1?Q?TOSi0zVGzsuvydMelxCPp+RbJzdiLUO1eDE2BTgIufqBmzjeR7cDYnfmUV?=
 =?iso-8859-1?Q?8UVFEwJsctMesBMSh/GEshuFCcXNTc01UuvkB667skp54hcsQnOt/ZCiDt?=
 =?iso-8859-1?Q?vCTiJgllG7p2tXSE3NnxDDC4TPmKAz6nJh+tfl5QTivS1jARHe2SBp6mpi?=
 =?iso-8859-1?Q?pBWJQ3ixFqENdzUzjH/E7uNf96icdS3sDtvDeDErzh5eQZimcthEz5jn6E?=
 =?iso-8859-1?Q?AbzdoVtNuGtK8ej8gEjxMTDXe5VWQRVYFgJXXx9x4tw3PYlQ+9TJ81R8f7?=
 =?iso-8859-1?Q?IqiDQrKlanMDK5z7jzFAxxTpecb/WsFsxJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dc44e3-5c83-485c-3113-08dd916a8870
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:34:50.0889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7HSbnHxlA0L/wx0gilzKciOXZiBfuZaE2EKLcU/RXLOdqLOcNi2pVrqXxql7R6BY0UTOdu4/Zxp+7CrD2YMVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9108
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

On Sun, May 11, 2025 at 07:47:43PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when `PID=-1` there's no information about
> the app caused the problem, or if any app was involved during the hang.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                  | 16 +++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             |  3 ++-
>  include/drm/drm_device.h                   |  8 ++++++++
>  include/drm/drm_drv.h                      |  3 ++-
>  7 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7f354cd532dc..c8a51418d0e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6216,7 +6216,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
>  	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index acb21fc8b3ce..a47b2eb301e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -166,7 +166,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3dc7acd56b1d..1816ef4251e7 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -542,6 +542,7 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty app
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -554,13 +555,14 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
>  	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[32], pid_string[15], comm_string[TASK_COMM_LEN];
> +	char *envp[] = { event_string, pid_string, comm_string, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +584,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> +	} else {
> +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> +	}
> +
>  	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_dev_wedged_event);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index dbdcfe130ad4..ba1d8fdc3c7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1448,7 +1448,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
>  	else
>  		drm_dev_wedged_event(&gt->i915->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);

(For future) I believe we can later modify the gt_reset handles here
to get ctx->id when we are coming from reset paths with context and
NULL when we don't have pid.

Perhaps one possibility could be strings to make this flexible
'pid:%d'

'path:debugfs'

But just a brainstorm kind of idea... not a strong feeling or need.

>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c02c4c4e9412..f329613e061f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1168,7 +1168,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  
>  		/* Notify userspace of wedged device */
>  		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);

similarly here, for the paths where we come to the wedge declaration from
exeq_queue, we could get q->vm->xef->pid...

But again, no blocker from my side. For both i915 and Xe:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	}
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..b87401d5079e 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,14 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +/**
> + * struct drm_wedge_app_info - information about the guilty app of a wedge dev
> + */
> +struct drm_wedge_app_info {
> +	pid_t pid;
> +	char *comm;
> +};
> +
>  /**
>   * enum switch_power_state - power state of drm device
>   */
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..8fc6412a6345 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -482,7 +482,8 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
> -- 
> 2.49.0
> 
