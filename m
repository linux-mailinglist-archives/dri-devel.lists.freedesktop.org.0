Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDE9D2AB9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF810E676;
	Tue, 19 Nov 2024 16:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acuxVzYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9477010E1C4;
 Tue, 19 Nov 2024 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732033334; x=1763569334;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NMnuU3LRNpzUxVR6tmn0TzWr+C4jemr03Eic1PG7rJM=;
 b=acuxVzYMBH56GGgrzAZlCV6fzX38hlpkxM8fx6yHIM1tFD78B5uDqbFk
 ZuYbnWC9Oq5G3vTumS9ItiwkRpvhbumja41cMb53IeMWEclBZWzPYmNLH
 o03r4mlxFY6ZODIw+eEbcG7Jk8o32lh/avx4KYDFJn9Wpz9szM7B6swRX
 nN9cIJEtREs7ZYmMk/GV7BVlzm3xB1axRlI+BGgjv4JQd+9iRbJtSklOE
 o2Nhvc8TfQxvUFBRpdiZwAVu05VhTwS/ltca6P3QkiFc4h9pva1Nw9qPu
 BddKJKhQqPC/MoRovdZqZj5phPdQ2Nyqpb8a0QvwLa9wrfre1ndCruJXU g==;
X-CSE-ConnectionGUID: WomYo5H/TESYo8XiQ7uI6A==
X-CSE-MsgGUID: CmmkZ2MqQ4erVzoklfpKzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32103206"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32103206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:22:04 -0800
X-CSE-ConnectionGUID: /x07fPM/ReeonCNLRlocOg==
X-CSE-MsgGUID: DpMDlrV7QyuQ7oCg4iNSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94534489"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 08:22:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 08:22:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 08:22:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 08:22:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TklHtZDCRhZO5B2uoevBKW1mn4C/TJOi9E8iaZwKHR5CRk2pT/2DoF3e72pKhEAQvw112PDKmb4s84E2kG/j1dbR0cA8EqBPiULaymTu/5kOqGjkIX8vpLMFIukXQTC1NaIkMV7GsrUVStqqDs7YZ+JMmF3w2fDKDFdZvcQUM0TLJcXTvuwKf8UdGjIIyt5+zXxfXAf9NTN+HVExn7dDG8jD8yfG9/r1vzV+QFHAcAcvpz2x6GEQGCZETMJ6U9I6PjvHUSGIcjFrrKsRWNrOD2KEE17NXi/6d4ZanIzujDqJBRGH1E4Y8UaIPHg10ER9F+7kQSwAUGa8Cx8v+6zb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZLxBr0hKernd54JLJFaOSlXNUGEBfY2POR01QDDUj0=;
 b=MFIw3Gp32yvuA5zwNOcsNe7i9RQ/pL5uavMNLau6TUiglFtCBDOYbU/Eg7D6b8BER8mYPirQu9Sn5p/S+cRv+RcagW0BR0/5G/e+rzunvFIzENxMBT9dCYkdxRSucRNJPZhnCpI1rw2ku5ShSodyK/hOat2l7PPDbzLoTJzq5cYxkWJ2Jq8suRSu3fg2OSzeiY9glyPKdWkEK6ONGWyvXL7vXtOefmf3Zhk56nwTavj3S2S5rtGImzTEs2e0oXNW0SbNGwk7FqcgA/wvIRKRD5syuN5rn1CXx7AROem7pdDNz8Q98p27zmDjK/GkKD5nOG7oP+NXcOa+ZX2Ssm0xoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Tue, 19 Nov
 2024 16:22:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 16:21:59 +0000
Date: Tue, 19 Nov 2024 08:22:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 07/29] drm/xe: Add SVM init / close / fini to faulting
 VMs
Message-ID: <Zzy7S3y74c6qT4yf@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-8-matthew.brost@intel.com>
 <4b221f9cfb35637e96cddfd8fee6cee45c98bd4d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b221f9cfb35637e96cddfd8fee6cee45c98bd4d.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: bc05ccb1-1bcd-4341-3951-08dd08b64b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?J7bww3KJmqnqD33IbajNMgCCq0FMc2gu+NRMQFqSoJN3USuytAMlLuJzwb?=
 =?iso-8859-1?Q?zh3STslgyhf+IgNFAj2lZyEQJpNyt2nyIplrewIf43Wps8uVUXnKUlBzVV?=
 =?iso-8859-1?Q?OZEdsnGN+1LXevwaO1z4rUvxRthexuuDa0OSOFiOam1bPQhB5LPQEeQaqP?=
 =?iso-8859-1?Q?Hmtz+bpKm8yuuREjqf4u24c4GjoxIJpzokQbEwaaYo5QsjDeLjRjSROTXp?=
 =?iso-8859-1?Q?EW5yrFCBsVTX8PBbO7xHZ+xkntSMCs0ELEMTbhJ/06oTllIEPFT8Yb2lm+?=
 =?iso-8859-1?Q?25NGolqQei2LbV8gMEJeHM/lod+I3KYQZLp0Rb0cEKHvw8iVL4CAQa4q8i?=
 =?iso-8859-1?Q?4owZmicVVrbdOEBlblbjKhwUUZFfXpvIDlMP3zy8PiScNQbLh5DgKVOlYa?=
 =?iso-8859-1?Q?8S6ZoXc6CF+YuACKV0egfecTjW0no8O1WAyevBmjxffSX912khn1fFlovv?=
 =?iso-8859-1?Q?asIWnvyf+4cS20nXjjJx1YyA37eu/wEEKxuvbNSneNS8mzQcBUM+gENZ82?=
 =?iso-8859-1?Q?UoEAP6hKFhleSWZniHS99CD+Hn9FgI8JsFX3L8TFRDnwzeckF1HDKuGZxQ?=
 =?iso-8859-1?Q?JuPyqR+qUYM1P0j9zNBf5ICh/AhwIKORmbaIspRV99P4MzrX4pgiLFeK2C?=
 =?iso-8859-1?Q?reBQAAFNTn7NSwg/kAbIzC4xY1i5DaceuXaiEuRoEDO2G4p5QnNRsJw+0V?=
 =?iso-8859-1?Q?ufXs0a3XwU62g8sInGV3efYSchIslD/VJlb6dr3BA64kdbL6kxmaw2XUGO?=
 =?iso-8859-1?Q?A5laSGqWMIi1Qby1ZTjtsIBJ9uJvZXxAq4pPknSvYCTA5jv11RyfQSwUkB?=
 =?iso-8859-1?Q?1XOEyklhEu96PaNqzL5bPuRefXlSes52YICvpNUqGz/hrlEiZx5UGexCRE?=
 =?iso-8859-1?Q?GI5RPIm+FXrSo+6ZKaFcV8uD3K3gudPrfoSD9tfMURA0M2UdELCU/PIcSA?=
 =?iso-8859-1?Q?cGLE3OvPoE3KfeYAAXQBLxYtCfZNGINKove6AwE1i5ZNTF/l7mhKk7d91F?=
 =?iso-8859-1?Q?EtEZoVuS0kZOCFWovhTERwnhimueZJwbJmJqq3bYjAY5tydCdlUbzuyNbY?=
 =?iso-8859-1?Q?t5HXOWeXb8g99hsJruR7aGTOa/kAsbUJBkrNw1lWCSqvS1nkt3WbGd2Qq+?=
 =?iso-8859-1?Q?mU0loC2AToSWzhNYy1x1P+RTT3wpE8xZJHUNtcwLLf7o4TuP6BuLTTIJKC?=
 =?iso-8859-1?Q?5fwu8pYhjhuvkiVCPKM1xk2vciJJt0xadnxsoQ3+ohkPYKGxcCkdFf2kG0?=
 =?iso-8859-1?Q?f4plRYXH042WaFger0RJhuH0cVH2rnvl3cbNL4m68wQyko47ts+WPsCRtu?=
 =?iso-8859-1?Q?gbgdtuhUn1p3QdDMSKbDKve2j0YyVxmdm5Lhe+ODDcHAh6i6CTtTUhA0h0?=
 =?iso-8859-1?Q?ene0pXhW20?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GZSEIlUqvINqcIFE4/fqUAOX52NMbNoJmZn430d0edZAAM33YKGlne+Wq8?=
 =?iso-8859-1?Q?PzsUpcCyybRoN2Qbr3nMAvnSauzZ1p1ggb18qFEZf3oGLSzOpH4MOa7gHZ?=
 =?iso-8859-1?Q?QwHxkCSFIGkmKo8qkaKAYEdr+GFjlyigoq3cXx/6XGZc4C6zLW3mntqE/e?=
 =?iso-8859-1?Q?hpz+pb0WsybbHQI9Ww7+XVVCogv9y/MUcRwFsGBtWj8cqRKUeSqSh+IEWl?=
 =?iso-8859-1?Q?4YYdmiX0X/heZJrEcvvFwuhskCCkm3yxbjJ+yhzz7jeLzmaeVSEQrmAQ3g?=
 =?iso-8859-1?Q?zBXjZrFmNNsjVCNDfrPSOUxL8JcGYY5ejpnPwupJg28rQCgR3a1peCrC3L?=
 =?iso-8859-1?Q?iafJH+gK6wAkQkcQs3z8VooIBragF8w7EEMAqXKBIDg/wQfktWAakrBqyQ?=
 =?iso-8859-1?Q?MAaYGFZKs5aj+KSI/ZuvO06VORrSgPMec/Obrf9UWfhwt+llC2CemX7YC8?=
 =?iso-8859-1?Q?QRQuGPlzxLeJaFieK1lltcqlcc+oNIMbYYzgRAItLgenN8NMYv8Tn7Y6IP?=
 =?iso-8859-1?Q?3PQcGEqSuZ0xiRnRKf69HjdumPUQz5oOikO08jkI/BzcF8GGmfiOWoEA8k?=
 =?iso-8859-1?Q?a5VeAxnlTugLQnf8UcF+i6m8QCicvZA4k5Ur7Q/y9x4XkjR4+fwRA7aCM2?=
 =?iso-8859-1?Q?C0x6UK8nf9WYIVpRFr1qxzw/PCK2CWGfXJWXJWqPTDneQB5wCFFOzWQ+8T?=
 =?iso-8859-1?Q?Ku699nsNymelANzLE1dHg//0HoNpkE7gGXysbTmsei5oi+5y2dGly6fgiO?=
 =?iso-8859-1?Q?dmECwZI+QnzcDpSfEcvvVQ6djL2mcAnPtIQxVhbODD2YXoZ1wWwQsCJe7r?=
 =?iso-8859-1?Q?+zUlPqFqwi5c0Sy+KcLsIzSgF1n1uUBw2BUCFStWOafrTM+QJGsITvu4LK?=
 =?iso-8859-1?Q?Yu8iHtZvr8KzcIK0XhBHv+CIipCgTmuMKgaF2AyAG7BAaHZqzSscHpv5kr?=
 =?iso-8859-1?Q?SpFvq7LuDTG9HN8pVvCTBGD8RjciRG1O80+vnlSDPmII6fdrtj3yVF0xbB?=
 =?iso-8859-1?Q?ydtNkAdKz2glFbVrqTJjQBS2WNTzP/m32oBvfvoPh/95OI3anzEwjlp4OA?=
 =?iso-8859-1?Q?TGJReSZdFt14AvpHf4A6+ijGvXMjOO7Q/Myvx09SUark6NwGhufJmiFODp?=
 =?iso-8859-1?Q?EwJw9F+eyxT9RJV/9HJrNEjclR460nz91xN89IFGqjV1MF4hb5ljFyZwVx?=
 =?iso-8859-1?Q?WeX4MDyRTfYjOBoskSzVtV7hbtptKdoCfLsswx4W4r/1E6t20LXiUK+uUw?=
 =?iso-8859-1?Q?kErGZ8NJzjvF7Cwrh6B7FozkD8IhqdUsZ+w4f9pbji4wWoWIxgNegtidKT?=
 =?iso-8859-1?Q?yvdFXrdNOrEC21UeIbqtdqnQpj6sZu/68UIOTJe8BZkygPAV6HiQQr9slS?=
 =?iso-8859-1?Q?pmYPuKcbAB5/yTXHJPJ443hqWUD1jffkLSZP94Ny/RYs2unQvgPD9pu82K?=
 =?iso-8859-1?Q?o9eThcT0vc77iSBOuRklkff1DSJnpr3t1DyXh974mwVX0YwweQJx/mNP99?=
 =?iso-8859-1?Q?DAXEP/2hEU9DrQ7faaMqXZjynn+PKplbOpy7y9658zEa/tV3RPxbp2pPNV?=
 =?iso-8859-1?Q?ka408CBQOUVM1MZnfeqh+LlFNrcQj7Ilqtc03Tb8/TtO1tvbcRVah2sZWL?=
 =?iso-8859-1?Q?0Sdi6SVfigoboceY90ivzAbxRRTvFcycgU51zjzGBzx/f1RqD1C62TbQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc05ccb1-1bcd-4341-3951-08dd08b64b4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 16:21:59.7941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAfAO0O8NSdoMNtjvGS1Xc0irkUBFZHKEKWlcKa9YesVxEs7gUFd7VDwhCrpgCFsbT2Eto1VHpdRCEtwFLULiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

On Tue, Nov 19, 2024 at 01:13:26PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > Add SVM init / close / fini to faulting VMs. Minimual implementation.
> > 
> > v2:
> >  - Add close function
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile      |  1 +
> >  drivers/gpu/drm/xe/xe_svm.c      | 46
> > ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_svm.h      | 15 +++++++++++
> >  drivers/gpu/drm/xe/xe_vm.c       | 12 +++++++++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++
> >  5 files changed, 81 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 8d991d4a92a5..c3e85bcfd4d1 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -96,6 +96,7 @@ xe-y += drm_gpusvm.o \
> >  	xe_sa.o \
> >  	xe_sched_job.o \
> >  	xe_step.o \
> > +	xe_svm.o \
> >  	xe_sync.o \
> >  	xe_tile.o \
> >  	xe_tile_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > new file mode 100644
> > index 000000000000..57b740367843
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include "drm_gpusvm.h"
> > +
> > +#include "xe_svm.h"
> > +#include "xe_vm.h"
> > +#include "xe_vm_types.h"
> > +
> > +static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> > +			      struct drm_gpusvm_notifier *notifier,
> > +			      const struct mmu_notifier_range
> > *mmu_range)
> > +{
> > +	/* TODO: Implement */
> > +}
> > +
> > +static const struct drm_gpusvm_ops gpusvm_ops = {
> > +	.invalidate = xe_svm_invalidate,
> > +};
> > +
> > +static const u64 fault_chunk_sizes[] = {
> > +	SZ_2M,
> > +	SZ_64K,
> > +	SZ_4K,
> > +};
> > +
> > +int xe_svm_init(struct xe_vm *vm)
> Kerneldoc + other undocumented extern funcs
> 

This whole series going to be missing kernel doc aside from GPUSVM.
Aware of the issue, will fixup all kernel doc in next rev.

Matt

> > +{
> > +	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> > >drm,
> > +			       current->mm, NULL, 0, vm->size,
> > +			       SZ_512M, &gpusvm_ops,
> > fault_chunk_sizes,
> > +			       ARRAY_SIZE(fault_chunk_sizes));
> > +}
> > +
> > +void xe_svm_close(struct xe_vm *vm)
> 
> > +{
> > +}
> > +
> > +void xe_svm_fini(struct xe_vm *vm)
> > +{
> > +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> > +
> > +	drm_gpusvm_fini(&vm->svm.gpusvm);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > new file mode 100644
> > index 000000000000..979f2322eeba
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SVM_H_
> > +#define _XE_SVM_H_
> > +
> > +struct xe_vm;
> > +
> > +int xe_svm_init(struct xe_vm *vm);
> > +void xe_svm_fini(struct xe_vm *vm);
> > +void xe_svm_close(struct xe_vm *vm);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0d887fb9de59..b11fb0ac9520 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -35,6 +35,7 @@
> >  #include "xe_preempt_fence.h"
> >  #include "xe_pt.h"
> >  #include "xe_res_cursor.h"
> > +#include "xe_svm.h"
> >  #include "xe_sync.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_wa.h"
> > @@ -1503,6 +1504,12 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> >  		}
> >  	}
> >  
> > +	if (flags & XE_VM_FLAG_FAULT_MODE) {
> > +		err = xe_svm_init(vm);
> > +		if (err)
> > +			goto err_close;
> > +	}
> > +
> >  	if (number_tiles > 1)
> >  		vm->composite_fence_ctx =
> > dma_fence_context_alloc(1);
> >  
> > @@ -1548,6 +1555,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	xe_vm_close(vm);
> >  	if (xe_vm_in_preempt_fence_mode(vm))
> >  		flush_work(&vm->preempt.rebind_work);
> > +	if (xe_vm_in_fault_mode(vm))
> > +		xe_svm_close(vm);
> >  
> >  	down_write(&vm->lock);
> >  	for_each_tile(tile, xe, id) {
> > @@ -1616,6 +1625,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  		xe_vma_destroy_unlocked(vma);
> >  	}
> >  
> > +	if (xe_vm_in_fault_mode(vm))
> > +		xe_svm_fini(vm);
> > +
> >  	up_write(&vm->lock);
> >  
> >  	down_write(&xe->usm.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 1764781c376b..bd1c0e368238 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_VM_TYPES_H_
> >  #define _XE_VM_TYPES_H_
> >  
> > +#include "drm_gpusvm.h"
> >  #include <drm/drm_gpuvm.h>
> >  
> >  #include <linux/dma-resv.h>
> > @@ -140,6 +141,12 @@ struct xe_vm {
> >  	/** @gpuvm: base GPUVM used to track VMAs */
> >  	struct drm_gpuvm gpuvm;
> >  
> > +	/** @svm: Shared virtual memory state */
> > +	struct {
> > +		/** @svm.gpusvm: base GPUSVM used to track fault
> > allocations */
> > +		struct drm_gpusvm gpusvm;
> > +	} svm;
> > +
> >  	struct xe_device *xe;
> >  
> >  	/* exec queue used for (un)binding vma's */
> 
> Thanks,
> Thomas
> 
