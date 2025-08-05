Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4EB1B6A7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150CC10E47D;
	Tue,  5 Aug 2025 14:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gE26umXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F67810E478;
 Tue,  5 Aug 2025 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754404621; x=1785940621;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gUQz2m6xdIVD7l8tlHLt6uGk1o8mARYPG4o6R8KpOK0=;
 b=gE26umXJE8flvMsBuSp2Rvlj2e4v2rNsBOT1Ys8VF2OSeShGVLgHM0dc
 ynRVdLiyimnUJVCg4dV7K/mAql8PYlqvX0ic/ldF98BhNw3O0X+F34pdt
 ChYkr8u9gjd131UbsYZI6g9HjAE+9P6FGpp4WtUG7lYHV3+1ZMnURqDUF
 pxxWcmvNubfuqahyPR+Dj8UJCiaw853W3LOrcfb2tr7T6SQCu86YwT7NA
 Bk8GOZ2a2XY+dyj4u30G7hRTLVImp20AzwRgCLWCsVBp2Hqp0bPoYfmV7
 RBH5lYqLAWqGbGhDUSPLYd/tXbv+yR2frdhslfy1bLgmqJ39K9qjiJEr+ w==;
X-CSE-ConnectionGUID: ytKXQUVOSt2MVGCmbTZYlw==
X-CSE-MsgGUID: dftEbzEESQeiYapg/JkJ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56662107"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56662107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:37:01 -0700
X-CSE-ConnectionGUID: mXL1kSkHSti61HvxHaa40Q==
X-CSE-MsgGUID: 36nqrp6zTYGEOApeXLX3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168758401"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:36:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:36:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 07:36:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHbbm0poIjaY2hGRtGZbyM715/sV9GJcmlHTl0WLsSunQuNm803ux9Fb6W84v0CV07I9rOGdQBrSwhXkl7ZOFsRxIR5LBZbRjiAfb0SM81K5kp8S94VM8vnaQsHCKJPtV8jce8N/TawejdZB9ruY2uWlicWQxKAsUGjvgQOYsN4RlOQmavzFFwwW8wX4Y67yIAM/Sdzq+ROAdCBerxJ0soUXqFmSQbihlgpwdKvU0o/DLXDaCDXbQkrU3Eedt61N1YkJoush+3d6wpf6AWnZ3ZZMIGvA/qemvSwtHUXVj2gwKHPBok0S8s9nxDbOerNj91oKVM8+cza1jU5YLWK4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsNK0s3q7StAUEZoeqVhu0fTMbxn/qtHuV5RPzAmZx0=;
 b=x6cqK3UsMOSxnMGbj75xPZYk9dNEHGXUyDMi6OZyjem8wN+OWtUkWQDH+l/X0t98VIOZ39uEVIl0SXJIK8LkCbTV9dEy6CTnyf0K3p3ac2J57xV+jgpnhUZ19bRLa/u9dybokmosM6nnm45xdXeiR7QgNxFLXU5wDH4rM5dE/WZAhaV4gglJOTKCDogy1AhJWSFlTrNvCkIHx9ZuyYrw78IR4c7GGjh0imuCj60l332KYKQk/H19LuSvgBa+rXyerBDTxtDEGQztQQd1ec4y7aefvpV8VfdQG0EpdezcDglIGD8kFqrRNIyKJE/Y8Mscraj7tUBMWPL/WQ6ebLIARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 14:36:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 14:36:26 +0000
Date: Tue, 5 Aug 2025 10:36:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Riana Tauro <riana.tauro@intel.com>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "=?iso-8859-1?Q?Andr=E9?= Almeida" <andrealmeid@igalia.com>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <tzimmermann@suse.de>
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <aJIW5fqaglHROx8i@intel.com>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
 <20250731-jovial-realistic-mastiff-2ef2a7@houat>
 <13e90893-d0dd-4f25-8541-ecfe875c52be@intel.com>
 <20250731-excellent-octopus-of-acumen-ebfd30@houat>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731-excellent-octopus-of-acumen-ebfd30@houat>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 209b3c81-897e-4915-c03b-08ddd42d756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?o5rEVcU2ClOjDvfTpW4iFdMGrkVTr/vW7O1rJm+v9QmScub93P1gHf6J4A?=
 =?iso-8859-1?Q?hp0JWlyyfvbbGf3LKMXUrXgqI2aXlx4Z9VFqG5i0Of66dqccldLxqTCHIh?=
 =?iso-8859-1?Q?cB7ylnV1BNgShwW4BYDaWBRiXv1L2veyLJv44ZnwPDBAhfdzfmvoECgzrQ?=
 =?iso-8859-1?Q?WJscsOFUxc5dMK8aFkYwbIj1Tt1QyRqI8ZwuqHij/wob27p7DCE5qECCgo?=
 =?iso-8859-1?Q?fFmPnHvDciFkeDiMVm/scPYk8KByp5F22H5ekd4QBHfZYFrAwOwfMDpayl?=
 =?iso-8859-1?Q?/dooImsEapNot+5z432JF22nyldvOSblY8SQoaz6iqBKn2h49oJvdfTOS4?=
 =?iso-8859-1?Q?qM3BpyhN7Bc6B7d7MolsKebcCnXi28WEE8LvxdaLRuKH5Yk6fwkNi7eS63?=
 =?iso-8859-1?Q?hYJ35Qiy4295rtViB2haL8bOMnISfMSpRBDq57RUwOyzCUzQA6lPftS3+h?=
 =?iso-8859-1?Q?eFKJ2jSp/fiSUsKc+Isr9Q6JVmdM/Z3mNm5d3e9SlcutnKm3m89yWv+F+3?=
 =?iso-8859-1?Q?WvdN/VpiI/3FEhrUEA6Lg3J9AWg7Fj17WlIXIuQUTi+uscR5Jyq4ibElAr?=
 =?iso-8859-1?Q?jdODI48Mdw+jxp6ZtkmY1w8gHwE6heAic97gZDJjCwF05wKuEdHsu+m96x?=
 =?iso-8859-1?Q?DXNZUCmyr+ScwLc1IT2YPiIiLVhZ1Mk9fA6JtHUo11u6GJ7GeCRdkpTV6Q?=
 =?iso-8859-1?Q?8d2TP+B0zmP4dAsl5XH97LnM6wfkzyxdliqIvVKT2tLRVvi7gQUSV99Ymi?=
 =?iso-8859-1?Q?qdDDLTYIEdfc5uqFQfHraCl6WOd8hFbQBQ9NsFBicZPrkHDOKrBO9DxXv3?=
 =?iso-8859-1?Q?CW0bmD6zcznuvL1XG9qmABp9d4zcESVLyNV40XoAk0oPMsWFXk+TZVD7Po?=
 =?iso-8859-1?Q?s3+m543Mw81WWlfaoO2wpJnL+dlxdUwZ4iOJMnrqeokEXZJD3NfVtbnlVT?=
 =?iso-8859-1?Q?ZU1TYKXxSfIUNI5Ug65PYPDj169wLfWdOZqlVzp9tc/BHQisu3eBVtlb9U?=
 =?iso-8859-1?Q?YFhSzW3RfPHdcGFD0TK5FqjHlqJgW2qeZJZcmmXXSXD1CwN/amHbKsrAWW?=
 =?iso-8859-1?Q?dgU6RjS/oKKyfnMRHYMGmHC17w1AzFQMCDIKeQBd+4flUJeOiAsgahOHOK?=
 =?iso-8859-1?Q?qL7RBHhGepoKzRQKC8Oxn8nNwINgs5m4X3YepWajEYu9YgC5dTu+xbjyhg?=
 =?iso-8859-1?Q?zJ6Db6jGPi4OQK0vk8ObA/FQ38AUE8EkzBz7PF8bWl8/RrZNcPdD4vxBEM?=
 =?iso-8859-1?Q?1boCIRsxIKB7WL8ezNYPZlXtL2NvsPN5jm3NbtcEvVEOhANw0Z+jKAvvhy?=
 =?iso-8859-1?Q?QCKFS4F6audJyRRXeno9HOhpoU/NuEwt33+2x7tUz4a1+h3KeHkagAgWpK?=
 =?iso-8859-1?Q?ThWvH3p4R+MCtYskJIIung4Gqo8EEoL5FZiGwM8lRzInGDuY+flX7FfYIP?=
 =?iso-8859-1?Q?/j0skoZeVhsYatzKFOfugk0khVEJjMmF+Rho6wuh4q8l9/DaL6w2BpE3Oq?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O2p3lLCHWLIRAzwGskCEIlxXcyHF6geDbCdfmxtNlne1OaXnNoOKrO+47D?=
 =?iso-8859-1?Q?gGwTE3SY6k+AQAiLB31mGWDDJivjU1t6qZtPV/TjnShvpwfYJ+vHs4r3kO?=
 =?iso-8859-1?Q?OsxbLyJxUuydQ4l+LCxlOwXKWkGH1lzcKNziHyvoNMZqzW9/8NbD4EpDch?=
 =?iso-8859-1?Q?YYGAkySMLEbqQQ34bb0Hd68QG6vn3896VDoJ/dCgWycUPUw4js3Q6bpAUc?=
 =?iso-8859-1?Q?3feYysy5yn0Yk/n2Tt2jIO47ZuKzBnB7jP0/MnzDFDx67NCdJfwHNwvHtb?=
 =?iso-8859-1?Q?DmCv2IsMhdpJp3+JIyaMy7Oy/Kc0gbYt0W/RYBfcCQipPmkg0FurjyYVXQ?=
 =?iso-8859-1?Q?kdiFNYubNnhwUHeUnx7yJVFl3sWpTQU2/OKe4KrvyKYhxjKKcBEDpjIVBE?=
 =?iso-8859-1?Q?57tNHUxtyyJ2/lV6WC8utwD5ccCGKjX5G+NZ0D7l/5NaRTbJfzFXc6Rq2u?=
 =?iso-8859-1?Q?4dtPhXO3fcewi9pFTAqUExVhyB6XvT9TLXiYRynUcC5CsX4nsciC/tsqIH?=
 =?iso-8859-1?Q?dlwTpY3ZcaKTxz7T98fbxdbj/QRvug01CURTsCFjbm7hoqeX1b1S5Mty5H?=
 =?iso-8859-1?Q?OlkBoFpEYGcqqd/to49c0dfJAH/ZYZ3yXxyTGuVf4xRQtsf0Y1+FtCx55D?=
 =?iso-8859-1?Q?3GAwjXvESeXRwJ1N/nqe5crkNtxnA32d3iiT/IQRDqXrmQOd59cu1MiVSR?=
 =?iso-8859-1?Q?pYoNgZaehg2UOH8W7TdNgccTFRE+X5efkD++gpfcXZV7XFWZOK7say9Ga+?=
 =?iso-8859-1?Q?olR0F/W8X4glem8Bz/iCvRZJLXuWSwomNPMI1FV9e4LwASr+JCXETr1DUC?=
 =?iso-8859-1?Q?NdMtHV7c3ilD1nIb0MvzuoTsQ2mTyJywFbOAa5BPvkMeo3/mbWICoZx0kO?=
 =?iso-8859-1?Q?KIKwUjrFN7v31JUSpBu+bFoaIu0fl2wS+m+ixAIX3Sx6dBf7e2LlJHFq1Y?=
 =?iso-8859-1?Q?kDDKKUS3SPr+OIqJ/nzEWlRiHlvt5RvVhvQ8tdzQw5mR46hbsI50xBY1fL?=
 =?iso-8859-1?Q?tiXiA3lAV53MWiSUxP8cCLFr1nmw5Kmtr2uVcMyX2yjQMSqLKvItNX1ADa?=
 =?iso-8859-1?Q?B2WKBHlG2We2+tV40ZMzR85J3dzIYA5UI5LpRvl+dQwgKq0qmIareAdCH0?=
 =?iso-8859-1?Q?Joe7LGXaaZQ9YTXU2U473Xyija8I106pSSKe4bhEE5cZsWyAWlL4u1Ocws?=
 =?iso-8859-1?Q?8U2kTQGIottWUapJ0vA1jiUIemwoayMwSxznFSzzEJLk4WFE238sRV72TO?=
 =?iso-8859-1?Q?mswZwFDCWcu6eOwiz7GlaI0BaARm6K4QYbXY/D8X+VCr4vLDf8UoB2ywCp?=
 =?iso-8859-1?Q?2JLwxOoTbEMIDnPDGr2xEyTj655CmaJy/keAcbDxU8bsWDcsTIE7B1pUTx?=
 =?iso-8859-1?Q?V0JhgN1ZQd+TWpuvTnFyaZHaCfXDhp5a1wvWsyhaVna6DvLo7NePACETkg?=
 =?iso-8859-1?Q?sp5sKBekuSLTOwLEybDZ2/kAaGLb/8/2mwbRSW0bo2famr2uQsehOw+y/b?=
 =?iso-8859-1?Q?av4uCNrvfA9N1D6xILGmHkWi4V+9YlvZZdBitQytQ84ucMGl+jNxCYNlOj?=
 =?iso-8859-1?Q?qrPDszzN2I0v+J5TP6Q+c2hHJzzPRgX7RGqU0AcV98v8sHQmvxPtCIQ9of?=
 =?iso-8859-1?Q?lu9/TPjgijvlbpS+kA+x2iwFTLNW4anxP/cf4tYlPP5Ss0dr59+2VdPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209b3c81-897e-4915-c03b-08ddd42d756a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:36:26.8546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RDAzUxkNP4jDZca4peby5TCvfnKcCmSst5mLvs9n9ORV3PayE3V3dV4T40Ck8ec9KA9/npCd2fLqJdpPUEsrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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

On Thu, Jul 31, 2025 at 03:01:18PM +0200, Maxime Ripard wrote:
> On Thu, Jul 31, 2025 at 04:43:46PM +0530, Riana Tauro wrote:
> > Hi Maxim
> > 
> > On 7/31/2025 3:02 PM, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Wed, Jul 30, 2025 at 07:33:01PM +0530, Riana Tauro wrote:
> > > > On 7/28/2025 3:57 PM, Riana Tauro wrote:
> > > > > Address the need for a recovery method (firmware flash on Firmware errors)
> > > > > introduced in the later patches of Xe KMD.
> > > > > Whenever XE KMD detects a firmware error, a firmware flash is required to
> > > > > recover the device to normal operation.
> > > > > 
> > > > > The initial proposal to use 'firmware-flash' as a recovery method was
> > > > > not applicable to other drivers and could cause multiple recovery
> > > > > methods specific to vendors to be added.
> > > > > To address this a more generic 'vendor-specific' method is introduced,
> > > > > guiding users to refer to vendor specific documentation and system logs
> > > > > for detailed vendor specific recovery procedure.
> > > > > 
> > > > > Add a recovery method 'WEDGED=vendor-specific' for such errors.
> > > > > Vendors must provide additional recovery documentation if this method
> > > > > is used.
> > > > > 
> > > > > It is the responsibility of the consumer to refer to the correct vendor
> > > > > specific documentation and usecase before attempting a recovery.
> > > > > 
> > > > > For example: If driver is XE KMD, the consumer must refer
> > > > > to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> > > > > 
> > > > > Recovery script contributed by Raag.
> > > > > 
> > > > > v2: fix documentation (Raag)
> > > > > v3: add more details to commit message (Sima, Rodrigo, Raag)
> > > > >       add an example script to the documentation (Raag)
> > > > > v4: use consistent naming (Raag)
> > > > > v5: fix commit message
> > > > > 
> > > > > Cc: André Almeida <andrealmeid@igalia.com>
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > This patch needs an ack from drm to be merged.
> > > > The rest of the series have RB's. Can someone please provide an ack ?
> > > > 
> > > > Cc: drm-misc maintainers
> > > > 
> > > > Thanks
> > > > Riana
> > > > 
> > > > > ---
> > > > >    Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
> > > > >    drivers/gpu/drm/drm_drv.c      |  2 ++
> > > > >    include/drm/drm_device.h       |  4 ++++
> > > > >    3 files changed, 41 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > > > index 843facf01b2d..5691b29acde3 100644
> > > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > > @@ -418,13 +418,15 @@ needed.
> > > > >    Recovery
> > > > >    --------
> > > > > -Current implementation defines three recovery methods, out of which, drivers
> > > > > +Current implementation defines four recovery methods, out of which, drivers
> > > > >    can use any one, multiple or none. Method(s) of choice will be sent in the
> > > > >    uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > > > > -more side-effects. If driver is unsure about recovery or method is unknown
> > > > > -(like soft/hard system reboot, firmware flashing, physical device replacement
> > > > > -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > > > > -will be sent instead.
> > > > > +more side-effects. If recovery method is specific to vendor
> > > > > +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> > > > > +specific documentation for the recovery procedure. As an example if the driver
> > > > > +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
> > > > > +referred for the recovery procedure. If driver is unsure about recovery or
> > > > > +method is unknown, ``WEDGED=unknown`` will be sent instead.
> > > > >    Userspace consumers can parse this event and attempt recovery as per the
> > > > >    following expectations.
> > > > > @@ -435,6 +437,7 @@ following expectations.
> > > > >        none            optional telemetry collection
> > > > >        rebind          unbind + bind driver
> > > > >        bus-reset       unbind + bus reset/re-enumeration + bind
> > > > > +    vendor-specific vendor specific recovery method
> > > > >        unknown         consumer policy
> > > > >        =============== ========================================
> > > > > @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
> > > > >    be closed to prevent leaks or undefined behaviour. The idea here is to clear the
> > > > >    device of all user context beforehand and set the stage for a clean recovery.
> > > > > -Example
> > > > > --------
> > > > > +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> > > > > +consumer to check the driver documentation and the usecase before attempting
> > > > > +a recovery.
> > > > > +
> > > > > +Example - rebind
> > > > > +----------------
> > > > >    Udev rule::
> > > > > @@ -491,6 +498,27 @@ Recovery script::
> > > > >        echo -n $DEVICE > $DRIVER/unbind
> > > > >        echo -n $DEVICE > $DRIVER/bind
> > > > > +Example - vendor-specific
> > > > > +-------------------------
> > > > > +
> > > > > +Udev rule::
> > > > > +
> > > > > +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
> > > > > +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> > > > > +
> > > > > +Recovery script::
> > > > > +
> > > > > +    #!/bin/sh
> > > > > +
> > > > > +    DEVPATH=$(readlink -f /sys/$1/device)
> > > > > +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
> > > > > +    DRIVER=$(basename $DRIVERPATH)
> > > > > +
> > > > > +    if [ "$DRIVER" = "xe" ]; then
> > > > > +        # Refer XE documentation and check usecase and recovery procedure
> > > > > +    fi
> > > > > +
> > > > > +
> > > 
> > > So I guess I'm not opposed to it on principle, but the documentation
> > > really needs some work.
> > > 
> > > You should at least list the valid vendor specific options, and what
> > > each mean exactly. Ideally, it should be a link to the datasheet/manual
> > > detailing the recovery procedure,
> > 
> > This is added above
> > 
> > "If recovery method is specific to vendor ``WEDGED=vendor-specific`` will be
> > sent and userspace should refer to vendor specific documentation for the
> > recovery procedure. As an example if the driver is 'Xe' then the
> > documentation for 'Device Wedging' of Xe driver needs to be referred for the
> > recovery procedure."
> > 
> > The documentation of Xe is in Patch 6
> > 
> > https://lore.kernel.org/intel-xe/20250728102809.502324-7-riana.tauro@intel.com/
> 
> I'm sorry, I still don't get how, as a user, I can reimplement what that
> tool is supposed to be doing. Or do you anticipate that there's only
> ever be a single way to recover a Xe device, which is to reflash the
> firmware?

Well, clearly the documentation here needs some adjustments since it is failing
to explain everything that was previously discussed already:

https://lore.kernel.org/dri-devel/aHDRyZBkw-Qa_30R@phenom.ffwll.local/

Since I was already familiar with the background and history, I found the
documentation quite straightforward. However, I now believe it could be
updated to make it clearer to anyone.

> 
> What if in ~5y, Intel comes up with a new recovery method for the newer
> models?

the vendor-specific is by definition wedge-uevent[device-specific] + specific
indication. Either by log or sysfs. So this design as is is flexible enough.

As I stated in the previous discussions I was more in favor of the
wedge-uevent[firmware-flash] but that was too specific, single-vendor
and single-case. So the vendor-specific with further indication was the
chosen one.

> 
> > I'll add the link instead of just the chapter name
> > > but if that's under NDA, at least a
> > > reference to the document and section you need to look at to implement
> > > it properly.
> > > 
> > > Or if that's still not doable, anything that tells you what to do
> > > instead of "run a shell script we don't provide".
> > > 
> > > Also, we just discussed it with Sima on IRC, and she mentioned that we
> > > probably want to have a vendor specific prefix for each vendor-specific
> > > method.
> > 
> > This was discussed as part of Rev4
> > 
> > https://lore.kernel.org/intel-xe/aG-U9JTXDah_tu1U@black.fi.intel.com/
> > 
> > DEVPATH from uevent and driver should be able to identify the driver.
> > Shouldn't that be enough?
> 
> See above. What happens if we start to see systems with two Xe GPUs, one
> with a new recovery method and one with an old recovery method?

The log or device's sysfs will have the correct indication for the correct
device. Nothing to worry here.

> 
> Maxime


