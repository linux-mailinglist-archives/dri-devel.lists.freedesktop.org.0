Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19B97D000
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 04:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8B610E2CA;
	Fri, 20 Sep 2024 02:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE7p37fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659F10E0A9;
 Fri, 20 Sep 2024 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726801016; x=1758337016;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=QIws9PsrAMe8QynYpmrZ1FlMPaWdRYIpk24u6JHA+9c=;
 b=bE7p37fiLZ4Cgk7CVV39xZstt4sozQsZThbsmRp1DdBoC1qzdO1Ed9qr
 l4Z38aloXVbGDGXuTJDlzkOXhI7Nf2cb4Orm0Ew0FL/BON/3gOPl+OGVV
 cvMMq3X0yXyDjlSUpSNw1dWEPh7qjjUpewGn0WZVNt5CpYLMAGnibrGFv
 IyffRrr7P2R9bLgFjRseVnC3LtXsn7Kr7FCnGyCLzhe7BPm2KjJRMFeru
 nWOfVNEa9OZsMGSxF1S2ZVeDGpuAGVrkm0ttJL06lCYcOEAA+87GXZ1v5
 u1yAddc8vQatNOu8wXqXy5wbCoh+3KVa/St1u/pkovem6qveltyVRBsXz Q==;
X-CSE-ConnectionGUID: X3w2Y52cSxe89yMzP7XdMA==
X-CSE-MsgGUID: u6hFGnnVQYKLY1Rtfcob5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37171866"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="37171866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 19:56:55 -0700
X-CSE-ConnectionGUID: iOO5mBy7QWukFTXQYi2XlA==
X-CSE-MsgGUID: ijc8Oo/kTDm3LwHF9UNHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="93415895"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 19:56:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 19:56:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 19:56:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 19:56:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 19:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynEsiFWYpJ+vAKN6thYjRDsYXKpxiP7hmL4dBeBF6NnkUHM0bpZS6FnbER1MvHgA9eqw95dxhahtIghuhcKEUtEjm0RVUrPmzSCWFTRXzp4rCJ2mNYb9FdzX397s/+IofLUbj8cufT4xr6YNtP2w4KTkAgcl9Jd+j437BPmUq31BgmNU8KUOq2tRhIaYG3DlGA1cwvx1FH6Lt16kFnU1/wqJzxJEGjzSb3wK1qKIQP1SDneIuA6mVtUkz9gom0TX9n+YRG1E1/HtNoXvciCmyoKqaxl5rv3Exx45SUqBtM8Hhdkq6wM2xXUzRSgIXjcUR+0SalB/gEZppj4dun7U5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj8f4BhgvwZtPIl2IMLN8QiNCdSfHoCK1DY5Is9CIgY=;
 b=ITKBU+qimeYLH7sTe4ZnbXE5Adfe+TcVYLduCWDkmKQCcJG/aUZOPTC7iFAh1Opn15kqL1SWhgpfBFNBi3Wo2N5QQKhGM02dqQK9PZs7h/DfSRDkqGuh112YVHrubiFqHOFcs1zUr2WWHlmgwR2tLDCJJUuEUEPgWFOCW/l4L9L0Hw8gcUN7TmNN2jRyISG+8yoQFir2seVnXXUlQFY/EEkP3gipooVXAm4XxRWjIm+VXAYhi56QsvD53LP05uwdEgiP8rFniecNiGE20zJT9ROElDk/G9J8iXSdoyf3TXwC8IVU0caOu0W6pwUDaAzXGPtdeitYGMva+LGotYkxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 02:56:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 02:56:52 +0000
Date: Thu, 19 Sep 2024 21:56:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <lr6vhd7x5eb7gubd7utfmnwzvfqfslji4kssxyqisynzlvqjni@svgm6jot7r66>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edf3d00-a841-45a9-4137-08dcd91fe10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DknzjWBZ/BHzvWuFX8Wx8sT1Rn/x0J2u31ihpP//LihjdBqe7PVoJr2mzs?=
 =?iso-8859-1?Q?ioZlKqc7xCMOxdSTYU3gvbQkzJWlzCkHrUT7SbOSKB96a6CeOyujA23kSB?=
 =?iso-8859-1?Q?rleYXc0a4woESc6fnsyQ2Ww/8YbWpzVdBEZy/MDUvraSVcYI33whs6q8by?=
 =?iso-8859-1?Q?nfbBh9DOA3jic75e+58MBUS5gZnONDHJbd0RaSdZyCrGjK8ZdfxgkMNEti?=
 =?iso-8859-1?Q?JGEvWd3ngxbe/e+8s927YMozLgFNwvECnIjXcS+7sJQCQZS8iFzlj06FjI?=
 =?iso-8859-1?Q?ecvGwOTb+1V/UqZX88JPnqKruFVti4rxAiDXQfPYiDD0DaSvN0L0TNVEEz?=
 =?iso-8859-1?Q?tSWi+if9IkjvwFCaEvOCAEmBV0swJy91eZxTqlNifGaZsbBRMKEpVWSRKt?=
 =?iso-8859-1?Q?YhBhdIlmECYhy1uFYCIrgbfq/zzr6ZDXpRjzS2d6ueRfe/UClRNwaIq8Af?=
 =?iso-8859-1?Q?S40U59aD+cFMWccCpuy1VAcpNHg+8M1c5iO4eEBApOg52ivwfjX9QEbsV9?=
 =?iso-8859-1?Q?yoD9BzrSdYk9CttacPwSk+es8z4+bK3s3Tt3NJTAzZmgG/JFgICOaSeROW?=
 =?iso-8859-1?Q?vpd55Q9/vS9EHmCx2YxRT1QowjSY9M3k7Vrve/Xn8Mlhe63tRnVZfPe/sB?=
 =?iso-8859-1?Q?eeWpVGQxPg4mjYZzM1c+JH9y4+2hfhNxTG/vvx1lqeazI/KC7VWp9jFXSe?=
 =?iso-8859-1?Q?51DzJNsni+4uYux9cWhf4ZUbMHc8aTeuCDWUIC/wIFobYCZiD93yHNUp07?=
 =?iso-8859-1?Q?eqnbT2Z/NO1LVG9WHJJ8S0N1Gnmp8W5p7+qrIBilTgFKpQpXPKFsX8vaao?=
 =?iso-8859-1?Q?6FnXN66Kn4It9UbUCL1prkjwwZbzO08Fc8T0lALEI1UFDEJAbFx0pk7GNx?=
 =?iso-8859-1?Q?wsUn4q/GFoHqE3M5MPg/M+BC62FvHAEYerMEyg0zF1KRTCyHU0gc86dX0Y?=
 =?iso-8859-1?Q?8NzGjiwJKYkEoFQthicz5y5Hc6kA8hhUaM8D5tnuieO8x9eS1uTgjVbc75?=
 =?iso-8859-1?Q?CrQl0mz6nyP/TxAB4gVngs1y6rZ22TCFHhS/xKYxcAE0TVeyYkUk9KgKZC?=
 =?iso-8859-1?Q?uHIo0I1MQMz27P4EgwC2H60eMZHxEQfQIWXgUc4qJgKiBo/H6ocE5iRcT7?=
 =?iso-8859-1?Q?NYYc33KLy8IN0H7UHw96cOeas3x8I9ryqsUuVHK1x5sxBQrO1ZWwULlftz?=
 =?iso-8859-1?Q?EXey6Fke3PQkBkLyZsG6rtH6BChapP9QYqexDbSZ+XjKWkZtLeerS78LQN?=
 =?iso-8859-1?Q?RNPfjs+n3ntXAoICyjdrlF+BdfJq4PBmdMr9aGAYPXnF80wieIKmzpaQEQ?=
 =?iso-8859-1?Q?oY08iyrgs6CQPkvHFIbLsajyoiWZ14neajdo1ilie8E7NTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N5PXBVJUlprIXiFSdHz5dVZYSaPVv8ew2C/+DDrd0hWYqut0eLfIfxjDCj?=
 =?iso-8859-1?Q?WinHSN/L+1intr7eboEnzQatdNtKGtin8jEnY+Ofs5ujqu2S5Guu74iEtI?=
 =?iso-8859-1?Q?saE8HacK137TDaoNwYbL7m13x+PunjsRJ7xFrzlA8DDtgEgex8tvAQ07Y4?=
 =?iso-8859-1?Q?Q7Ey2BP+hFDdFlGLK0IXJ6h16mB30Hvp8fYArDNI0J5Nf4BgJeYF22L0JF?=
 =?iso-8859-1?Q?n3ejGisZKepdaXFOi5DWrpkbCtkEuGzMMIkTXdfXnOsg3blFpenuzw4Up4?=
 =?iso-8859-1?Q?TYR0QPD+WtwwMfm3CIDW5oQHNNlFf0L4lj0G2Ix38CAsLJRwKrNtaVAJMr?=
 =?iso-8859-1?Q?wqhupf5ZYwonlrRFPWTVKTdpW8tN9DVQHU+FMV/29cLoJVZ/oVuWlY9S/G?=
 =?iso-8859-1?Q?dOR0wz3IA4sHNti1PrM1aqUpwcRNMvkY2qoe8fAXlRFPt2V7NVNPzxMaKX?=
 =?iso-8859-1?Q?BlwtaSF4EPMlxedvao9LWmdX7RTn9zfzNaOm55V0ZQoObBBukahISkRPWL?=
 =?iso-8859-1?Q?1lToI/lsokgEv195gcNnIcscC8iCvGizVUDyLXxKeDZfcK478Qtz2RdlN2?=
 =?iso-8859-1?Q?MGB9kqsNEeykv0xHhJ+tWBZ1FNCsF6prTPrsXlX1kNDAElUbtYoO7tdNpX?=
 =?iso-8859-1?Q?xnSn0qCa7n61P1jihNi7hD3XS3Sz++cHIhfTBIW6l+3Ufhsj769AtzMv1X?=
 =?iso-8859-1?Q?xZfB+s9ZUCFpsw6BguNHZHe0qzWuFc7wbNmAlbhRo/egjztphoxTuxuhYl?=
 =?iso-8859-1?Q?My0YuNdgusbB4XA2kNTZ6sFf+uWGVLhTj7DB/fVgKlKOeYzsXuYy7xGhuf?=
 =?iso-8859-1?Q?1sXdl/psh513qtsoimCPlXwJDn833mFHla3ozCfBc4CEaqbDUsrYTCzAlA?=
 =?iso-8859-1?Q?aWbWcGCdnhPR3NL/GjUD2oCEHmP+TbUxxCbzcit2kGSM0EvblTD/uLeTdW?=
 =?iso-8859-1?Q?goQJNFpfxLUI9TF4Dltx5ZszsUnURB3nSHbHa5qU0hj6P2sA6ONEzvYag+?=
 =?iso-8859-1?Q?FOVo7shW4+9DsuS+6G4NCUa3UdgLAcKX7VDVnlXs4ICDU/aYxG0IvUVbau?=
 =?iso-8859-1?Q?vgEHqWFgf0i3Flj3Z5P9XZGLTiYSGYBIq0aYr3sL0LW3GD8YMj+JMXxqcb?=
 =?iso-8859-1?Q?iJDUgLwHU4Ga962H9wjENzjqIUnZONdoSpUlo5VzfO6WBZ2Mv0SDTHx2cU?=
 =?iso-8859-1?Q?7qDfq9p8SONYWHo/+N7zswiRHmRmv1IApEss2ugjnOlU2AeYGmWkuBOlWz?=
 =?iso-8859-1?Q?VNwcJkjcntNc3nf7mu16k46n2DhCMNEUKyfhzWgrj8fkegeODQrVEIJjL4?=
 =?iso-8859-1?Q?8ArDWmbg4fm/47O1vaT8dvwAUk88fjKMk+60WXQTosvZjm0VTyqS8vB1ff?=
 =?iso-8859-1?Q?4mua7rZmnsN/GG/UuwPBaKTSAKJwc49lyz7NwxMKdyCIXX+/L+sZ/NYJp2?=
 =?iso-8859-1?Q?4oVNO02PgpS/VJGH0imJ0OQpSMXgikty55iiCK2aKwFwf/c5hYYPEj2CQx?=
 =?iso-8859-1?Q?AILEsrKsvb0Bacf/EPjhEY/MLwT6vaMiWYAdXa4H6RBHrVy+tiIW6Gtjrs?=
 =?iso-8859-1?Q?781Ed3y7RJyaiql1l5xRgtxny+bD4TwgrYTDctdkSz7n60BUUumhh/DczD?=
 =?iso-8859-1?Q?v9IVqF72ge8KVCGHEVV2zIuaAFNwoELY2uhtS7FzRw1xJIN50y7CIPxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edf3d00-a841-45a9-4137-08dcd91fe10d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 02:56:52.4443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oq1TCVIShOcQRLGEp1DoDJfDIQ6nShsHVJ/0XkOMLG0PMzZ0ppS+NYUJJZCEK7ayyM5cxDDZLyYUQAPdiJS8cw98BgTI2m72Q3qSKmuRkUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

Hi Dave and Simona,

A few fixes for 6.11-rc1.

Thanks
Lucas De Marchi

drm-xe-next-fixes-2024-09-19:
Driver Changes:
- Fix macro for checking minimum GuC version (Michal Wajdeczko)
- Fix CCS offset calculation for some BMG SKUs (Matthew Auld)
- Fix locking on memory usage reporting via fdinfo and BO destroy (Matthew Auld)
- Fix GPU page fault handler on a closed VM (Matthew Brost)
- Fix overflow in oa batch buffer (José)
The following changes since commit ae2c6d8b3b88c176dff92028941a4023f1b4cb91:

   Merge tag 'drm-xe-next-fixes-2024-09-12' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-09-17 14:53:34 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-09-19

for you to fetch changes up to 6c10ba06bb1b48acce6d4d9c1e33beb9954f1788:

   drm/xe/oa: Fix overflow in oa batch buffer (2024-09-17 23:31:59 -0500)

----------------------------------------------------------------
Driver Changes:
- Fix macro for checking minimum GuC version (Michal Wajdeczko)
- Fix CCS offset calculation for some BMG SKUs (Matthew Auld)
- Fix locking on memory usage reporting via fdinfo and BO destroy (Matthew Auld)
- Fix GPU page fault handler on a closed VM (Matthew Brost)
- Fix overflow in oa batch buffer (José)

----------------------------------------------------------------
José Roberto de Souza (1):
       drm/xe/oa: Fix overflow in oa batch buffer

Matthew Auld (5):
       drm/xe/vram: fix ccs offset calculation
       drm/xe/client: fix deadlock in show_meminfo()
       drm/xe/client: add missing bo locking in show_meminfo()
       drm/xe/client: use mem_type from the current resource
       drm/xe/bo: add some annotations in bo_put()

Matthew Brost (1):
       drm/xe: Do not run GPU page fault handler on a closed VM

Michal Wajdeczko (1):
       drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros

  drivers/gpu/drm/xe/xe_bb.c           |  3 ++-
  drivers/gpu/drm/xe/xe_bo.c           | 14 ++++++++++
  drivers/gpu/drm/xe/xe_bo.h           |  6 +----
  drivers/gpu/drm/xe/xe_drm_client.c   | 50 +++++++++++++++++++++++++++++-------
  drivers/gpu/drm/xe/xe_gt_pagefault.c |  6 +++++
  drivers/gpu/drm/xe/xe_guc.h          |  6 +++--
  drivers/gpu/drm/xe/xe_vram.c         |  1 +
  7 files changed, 69 insertions(+), 17 deletions(-)
