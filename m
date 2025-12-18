Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC35CCDE54
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 00:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD5F10EB05;
	Thu, 18 Dec 2025 23:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/xBvFTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731A8902A;
 Thu, 18 Dec 2025 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766098913; x=1797634913;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EM1rZyhflnr7q0TRvDSOngyPu5NY3KHjUFnn3RCCcFc=;
 b=I/xBvFTZq/ve5iF6gMQ/nxmpBkz3x5Vc0EVDRHYHvL+F0HgN9FHJ+v9j
 fkGwGsmZh9+P3S5Hs3uW+fbIUfhfjTTApEXTpHxil7MiUJYDnzylcSH+G
 ArPDfekuK3hdsM5ybj4VQHg8bRBzFuXqXxT7cL/xOlI20y0l1pdGUg29u
 2v4qTid3XGYnwOB+9gZaMQtxcSgBoU5KMBD/XSTswk+WTFEhLe5H+zxk6
 9vdRvWN90qro2Qvz+L/4w/rAV0y36RG2ZfDZYdHC3qFAqkeL4boVxqA4z
 mYQEoAiDBL0ghUhqMimmItyYQa6ktbJhjf/UEWJ3uPMMn9zMpbiZXdp4n w==;
X-CSE-ConnectionGUID: DLal9YhGT/yFTWoq5VTyeQ==
X-CSE-MsgGUID: Ls+jF+o7TtecgUcDy/PIPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68218075"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68218075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:01:44 -0800
X-CSE-ConnectionGUID: DQ515uhWRdmmmh88TReOOA==
X-CSE-MsgGUID: MXG2ugSTTN6slf+xJASV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222123549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:01:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:01:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 15:01:43 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:01:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU1X3THCAjMepcHt+YjPdSDxwwvwjiq0/dbjTIy0X9ddfpZZkUg8u78CO3yvQ70LSLPQyNAGNZzGLuEStYx4iqffafAHENX3//Yi8NpdFG8HjmzEA1y1PtehYVc/2pJKkwpd/HZdo90eH5L8FnM11zvcy8VRI3rWgXcBg0e6SPlzQ83jRNVjvLeSy7K2T36EoxN0ha+/JxBQ+7l20JDfDgCEfrcbOdrUcUsb6QthAb3aRVOk61i4G6iODD/0dUakb6ACpK+p2aOCxCwJhbCYdBayIDygJsH15VUwGc9VL8Tk5MFdB1IPFc43AFCJ/rJxKNNU7EBtxk5TCHX9sIFFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po1mzb3Xj6LyDmyxicdsV2vM0DoAKkPFZ759sdkpzHY=;
 b=uT6GFqJ4fyQZH7UnMSWPf+RHSNxwtPgg4cTqBWY2E3IMOf+sH8RFs1xCAjpRhGrQrJYoX9Q/kG10EKPE+t+gotisoRmbTnqeJq1IS2qIi4czJyB3mpSo56Ham7VyNTfDH5X+qVA8q39wltHzhiLrxZvTgOuk+rUnKhT3aFrah6gaZFj57pU6Wc/oN21A0ZqbHAlRDyZUvRklrQR9g2Uwc0wpjBeokOhGlI91oRBritoOKQyirPoIF0OAK7Oiu79gLVNeV/g/Gxi7DxyBubLBfTlUxhKhRLzvZKn7q15O6pSGlU39AzFIufy+qy9S9Bjj0MXfous6P73WYmXubCP7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 23:01:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:01:38 +0000
Date: Thu, 18 Dec 2025 15:01:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 23/24] drm/pagemap: Support source migration over
 interconnect
Message-ID: <aUSHz1/Huuq8s+ae@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-24-thomas.hellstrom@linux.intel.com>
 <aURlt+pSrK4RXKsE@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aURlt+pSrK4RXKsE@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR06CA0052.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4162d4-c42f-464e-3888-08de3e89662a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CJEVvyAGmXREgeMP4L7vdwxRycrIAe/ORuTY5gWdzfMj8RMQI1Ln0xEV/e?=
 =?iso-8859-1?Q?0w1Y16KsdO0fwKOe2N2ukD/sKryb5VbBumr3PNNXzySOzL2N1jqrE9Oq+T?=
 =?iso-8859-1?Q?/C6dDRXrhYw5mHLKu66ru5W/5iyUS0ZOIDcDxhUCnrMqqKHV1Lo84R3JLa?=
 =?iso-8859-1?Q?j81lidFtOKIEXVGqHRNcBTczEu33X+bOl1o9HRPL9NHQWuwU82nj77LmLG?=
 =?iso-8859-1?Q?RWPgx0+Fo2M6HxCIpg3sgX3M4x/hyZRnnHhkBM4Dy3BTSiVmWQj7pFDlIu?=
 =?iso-8859-1?Q?ig43uViZ79ywGgEQkA0BB2QsNTfFoN3m/HLh786L9o3sVtY0vF6xQH3Iuy?=
 =?iso-8859-1?Q?sIknaCrKKt4DT6rZRULB9xbpDncM9OycNXeVtkQrUEm0jmBqv97byJ6Z/E?=
 =?iso-8859-1?Q?badZotmpnTr2YG1XORMYEHoG3AgaNVf71GT2u016dOCkJhd5t6qEti9u2c?=
 =?iso-8859-1?Q?svJqAWxTuquLgwAvplZSK8Q25G9+gEwUZfA+yizDXeb7yBKZGAFr58EpO6?=
 =?iso-8859-1?Q?4FXiZD5Lloj27aOE8JtmwjSYPXjQiph4C/5XUtu05j6WnhrvP/5Epdl0/n?=
 =?iso-8859-1?Q?p1m67pwlJ+9Z1bTzEm2JypSXedXZOlVwGnXI8ke1H4/9u6u2HtSuQje19w?=
 =?iso-8859-1?Q?Kclmeb9HBG1eSut5uLo55Eqp9VspExsFQVlo60Hxa7gBC9htD3naYpYNdX?=
 =?iso-8859-1?Q?UJb5AEPKJIs575TRfOYK55JxeRtTLtSvydC1MyXnxricRooRh5Xcx3otKX?=
 =?iso-8859-1?Q?OIWRAab5HMDU/Grqd7bt04rRZmNT5rwVYmvQRRiCHgC4O9YZBi01tILgOb?=
 =?iso-8859-1?Q?mUSprGWeDhX4Xv5hvY6QLdnyUssttPVvfb52MxQYK2yMI6ehLz51Wwxqe/?=
 =?iso-8859-1?Q?NrvgXZsYI/yqEgWz42evV+If6BbrZe94NOx+0zdZ1FnISpwJic/aKsazDE?=
 =?iso-8859-1?Q?1dnB562Fn7BpKhyYZTKrk/CCm5tptlv/5U1ky3G/sIApH1/3YRfIDl0Ulq?=
 =?iso-8859-1?Q?//MQ4zcW5jiZUgnMe9cibatk7TiC5t5mK0HmYCs5Cfont81MzHg1l5hCfZ?=
 =?iso-8859-1?Q?/h8depv4m7UrdSpm4Hsh6YWhOGF/2K97pD9DXXTCUmkdyIAeNUd32zQ4jH?=
 =?iso-8859-1?Q?C/2FvaVaFcw+GXP1UbbOorzzZJaUnQ0Yuj0sd7lSz8UdyOS5y2TKh8aY8t?=
 =?iso-8859-1?Q?W/eAdqYce6/EnXsFZj2JTSAlk53GOdPTKlA3X1wGSoXMxcY4k5WYyHNsza?=
 =?iso-8859-1?Q?qffGEbuEdzCKabGxv8klVt9kBcN5bnJSoJVe4yB9Q3uHzQrIVTIueuCx2C?=
 =?iso-8859-1?Q?VcutnmwOaM6ZwO9kMfGIS4yQNcdigZCFfPtwNk4kWyWsyD9Vi0cCVubRNA?=
 =?iso-8859-1?Q?Bbunxc0EYwbmjuOPEgF6sn4vyBRk3BZU+Rik90l7+ewaV/zwdLxVbmL7h7?=
 =?iso-8859-1?Q?e68euQtjvoYQjQsVMGsP559kGdevclnyYN/nHreIJx5VEoUnPWCX1yqAJW?=
 =?iso-8859-1?Q?1N1P/tH7u7hPhw7HzswRRa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ab2nnJ/g5KDeQ8/2k5EIxhK5bPOctILFZUTvg2sBbeV6upk/iiOEmYcxRV?=
 =?iso-8859-1?Q?1C0pJNnoJPhoG+meMld45bBUaCH91i/jwrR/s744GcDodLjHdle70LrR45?=
 =?iso-8859-1?Q?TCrY3hmTZ7Hg9xJ5HSUi3It+BUWHSWx6GwcH84zOcqE+QnKSF6JBTAZFcI?=
 =?iso-8859-1?Q?x4U/+xd27IwsdRTpBRseyG96ny8HoLHDLiPGY6yagVwTcSLCe0sPx/++5d?=
 =?iso-8859-1?Q?wLPs6KTcAkHP0wyzV7sbcyVhwTOhjmSEKXyVnkmbkD4fvAtBD8C23dETx2?=
 =?iso-8859-1?Q?2S51F0cbGdaGV1eUf4++ihF2VPuO/1bfRcA+iZIXTSypRDEpuWtrPsJZ0b?=
 =?iso-8859-1?Q?ofNW/KLwxf6ODqld5vRj5MvRovmO12f9VSL7Tth04Cnr53v5b15cl9qZ9h?=
 =?iso-8859-1?Q?PN9CsBd6ODDbm5bTtZKAIbWrOhPVij+Ynv0pb99UbqBUXz8NgAKwe919gg?=
 =?iso-8859-1?Q?BR8QKqUr8geOKt1cBY15qxq2Ek/8gnCW4bmQdrkb3E+OjqxXT0KET5YVu5?=
 =?iso-8859-1?Q?XMXePDQpT9g8iuO6cHsenyuFB3UB/6IoY2jtBX6/a3DlkNiuo7sZL0PjKL?=
 =?iso-8859-1?Q?N/fom6updoBnmO2qPQwxWf7rVC1v7MulyfgMRXB7O4tVROZ/fFxein17x2?=
 =?iso-8859-1?Q?7Mlf/ItF594woDon2/80FwHOkCHQEpzhkrIRSP8lAmkPXQKctUUh7ZS0K6?=
 =?iso-8859-1?Q?DLR03u9uAKfcYx06x7fDvjfjfvmT1/z2Ep43PZHIs7lgWXxLusPQwR/m0j?=
 =?iso-8859-1?Q?RFC2uHhCc8FLIF6npfLJxnbZIBbz0jPClG0ygnOp/UqfP5dAm62SFwXN6t?=
 =?iso-8859-1?Q?kI1NL9mkowTG9ML1vxFlGkLAFOBKDH9yAasRlK9wo+hktVBu3JMBbHxd/e?=
 =?iso-8859-1?Q?kwS8qqnPVgBKI7KJE20uvj7dw116hvCDl6Gu0Eos1FOERZN0hxPCiG0HQi?=
 =?iso-8859-1?Q?mAR4nUHS0c6DL8ee0oEcI17GDLbCAmojlImFgJ7c4woLTpHs7Qg3X4G9/5?=
 =?iso-8859-1?Q?tTbFWljyreHkp3tERCzqqV9nTFAl0q6YSlwKvqgG9CHm0ysPI4yti+bnGr?=
 =?iso-8859-1?Q?415lvPo+UzE7NDKUa0fJ2L4IWCIdqVYWu2amfk4SZZn013wTx+if2qjMRH?=
 =?iso-8859-1?Q?XvIuk4UqCUF5hgD/5RoX9FmA5958wcpmUgjQoKkdQ5VxRPrHG2Khatligd?=
 =?iso-8859-1?Q?5hdcg8dc5c+Cw7St2DLLdNMpEugpc7TsX8A64bZ6dZgyk2g8DE4yYIkrch?=
 =?iso-8859-1?Q?3fMJrWv70bIWTY5Ri9fHkiEi+w3yGqwLI+dKNyABUW1iqcXq+PbMA6sk9L?=
 =?iso-8859-1?Q?o+rsx5gtrkGKSZuQzWWfWblW8onE06Dfy5xDBuTYPE5MOIX+bQbXovjA3u?=
 =?iso-8859-1?Q?Lis0Hl6+PBrrHGwYVbP7UvFAbfM7eUfOQnuxmwJY+1/6Ut0s39Jr8r1FqS?=
 =?iso-8859-1?Q?8rrneiEiZhHb4DuNP+7NGt5/9itanCI9UXFNeKhP48z93+eaiCf1Mcc7+N?=
 =?iso-8859-1?Q?HqfEH2F/IXdkVp3jYcAYAVKRmwYmqSdUmBy0NCnonim61zLEK4Q2Rf8PuP?=
 =?iso-8859-1?Q?2TXahI3+uQLVleCmq7Co9t/oYFrPpK6irB47gjHTvMzek1xxHDQej6SeAT?=
 =?iso-8859-1?Q?kX8eahSPJd+f4FS/Nnu0EMkO56TkdkCXai6AzXeY53c6acHcHYyR35kA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4162d4-c42f-464e-3888-08de3e89662a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 23:01:38.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uD22cB9+puCfujCzc1Evn2ebSveBZ6APfUFYYx25oiQTvZxmf3CvpQ1di/iY/ufGpWi0HSl/biaGW5/9+ja9/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
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

On Thu, Dec 18, 2025 at 12:36:07PM -0800, Matthew Brost wrote:
> On Thu, Dec 18, 2025 at 05:21:00PM +0100, Thomas Hellström wrote:
> > Support source interconnect migration by using the copy_to_ram() op
> > of the source device private pages.
> > 
> > Source interconnect migration is required to flush the L2 cache of
> > the source device, which among other things is a requirement for
> > correct global atomic operation. It also enables the source GPU to
> > potentially decompress any compressed content which is not
> > understood by peers, and finally for the PCIe case, it's expected
> > that writes over PCIe will be faster than reads.
> > 
> > The implementation can probably be improved by coalescing subregions
> > with the same source.
> > 
> > v5:
> > - Update waiting for the pre_migrate_fence and comments around that,
> >   previously in another patch. (Himal).
> > - Actually select device private pages to migrate when
> >   source_peer_migrates is true.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 204 +++++++++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_svm.c   |   7 +-
> >  2 files changed, 170 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 09356d50b8d1..ba099aa7c52f 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -206,11 +206,11 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >  
> >  /**
> >   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
> > - * @dev: The device for which the pages are being mapped
> > - * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
> > - * @pagemap_addr: Array to store DMA information corresponding to mapped pages
> > - * @migrate_pfn: Array of migrate page frame numbers to map
> > - * @npages: Number of pages to map
> > + * @dev: The device performing the migration.
> > + * @local_dpagemap: The drm_pagemap local to the migrating device.
> > + * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
> > + * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
> > + * @npages: Number of system pages or peer pages to map.
> >   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> >   * @mdetails: Details governing the migration behaviour.
> >   *
> > @@ -229,8 +229,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
> >  					 enum dma_data_direction dir,
> >  					 const struct drm_pagemap_migrate_details *mdetails)
> >  {
> > -	unsigned long i;
> > -	unsigned long num_peer_pages = 0;
> > +	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
> >  
> >  	for (i = 0; i < npages;) {
> >  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > @@ -249,10 +248,15 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
> >  			struct drm_pagemap *dpagemap = zdd->dpagemap;
> >  			struct drm_pagemap_addr addr;
> >  
> > -			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
> > -				goto next;
> > +			if (dpagemap == local_dpagemap) {
> > +				if (!mdetails->can_migrate_same_pagemap)
> > +					goto next;
> > +
> > +				num_local_pages += NR_PAGES(order);
> > +			} else {
> > +				num_peer_pages += NR_PAGES(order);
> > +			}
> >  
> > -			num_peer_pages += NR_PAGES(order);
> >  			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
> >  			if (dma_mapping_error(dev, addr.addr))
> >  				return -EFAULT;
> > @@ -276,6 +280,9 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
> >  	if (num_peer_pages)
> >  		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
> >  			num_peer_pages);
> > +	if (num_local_pages)
> > +		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
> > +			num_local_pages);
> >  
> >  	return 0;
> >  }
> > @@ -328,6 +335,115 @@ npages_in_range(unsigned long start, unsigned long end)
> >  	return (end - start) >> PAGE_SHIFT;
> >  }
> >  
> > +static int
> > +drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
> > +				    struct device *remote_device,
> > +				    struct drm_pagemap *remote_dpagemap,
> > +				    unsigned long local_pfns[],
> > +				    struct page *remote_pages[],
> > +				    struct drm_pagemap_addr pagemap_addr[],
> > +				    unsigned long npages,
> > +				    const struct drm_pagemap_devmem_ops *ops,
> > +				    const struct drm_pagemap_migrate_details *mdetails)
> > +
> > +{
> > +	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
> > +						pagemap_addr, local_pfns,
> > +						npages, DMA_FROM_DEVICE, mdetails);
> > +
> > +	if (err)
> > +		goto out;
> > +
> > +	err = ops->copy_to_ram(remote_pages, pagemap_addr, npages,
> > +			       devmem->pre_migrate_fence);
> > +out:
> > +	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
> > +					npages, DMA_FROM_DEVICE);
> > +	return err;
> > +}
> > +
> > +static int
> > +drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
> > +			       unsigned long sys_pfns[],
> > +			       struct page *local_pages[],
> > +			       struct drm_pagemap_addr pagemap_addr[],
> > +			       unsigned long npages,
> > +			       const struct drm_pagemap_devmem_ops *ops,
> > +			       const struct drm_pagemap_migrate_details *mdetails)
> > +{
> > +	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
> > +						pagemap_addr, sys_pfns, npages,
> > +						DMA_TO_DEVICE, mdetails);
> > +
> > +	if (err)
> > +		goto out;
> > +
> > +	err = ops->copy_to_devmem(local_pages, pagemap_addr, npages,
> > +				  devmem->pre_migrate_fence);
> > +out:
> > +	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
> > +					DMA_TO_DEVICE);
> > +	return err;
> > +}
> > +
> > +/**
> > + * struct migrate_range_loc - Cursor into the loop over migrate_pfns for migrating to
> > + * device.
> > + * @start: The current loop index.
> > + * @device: migrating device.
> > + * @dpagemap: Pointer to struct drm_pagemap used by the migrating device.
> > + * @ops: The copy ops to be used for the migrating device.
> > + */
> > +struct migrate_range_loc {
> > +	unsigned long start;
> > +	struct device *device;
> > +	struct drm_pagemap *dpagemap;
> > +	const struct drm_pagemap_devmem_ops *ops;
> > +};
> > +
> > +static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
> > +				     unsigned long src_pfns[],
> > +				     unsigned long dst_pfns[],
> > +				     struct page *pages[],
> > +				     struct drm_pagemap_addr pagemap_addr[],
> > +				     struct migrate_range_loc *last,
> > +				     const struct migrate_range_loc *cur,
> > +				     const struct drm_pagemap_migrate_details *mdetails)
> > +{
> > +	int ret = 0;
> > +
> > +	if (cur->start == 0)
> > +		goto out;
> > +
> > +	if (cur->start <= last->start)
> > +		return 0;
> > +
> > +	if (cur->dpagemap == last->dpagemap && cur->ops == last->ops)
> > +		return 0;
> > +
> > +	if (last->dpagemap)
> > +		ret = drm_pagemap_migrate_remote_to_local(devmem,
> > +							  last->device,
> > +							  last->dpagemap,
> > +							  &dst_pfns[last->start],
> > +							  &pages[last->start],
> > +							  &pagemap_addr[last->start],
> > +							  cur->start - last->start,
> > +							  last->ops, mdetails);
> > +
> > +	else
> > +		ret = drm_pagemap_migrate_sys_to_dev(devmem,
> > +						     &src_pfns[last->start],
> > +						     &pages[last->start],
> > +						     &pagemap_addr[last->start],
> > +						     cur->start - last->start,
> > +						     last->ops, mdetails);
> > +
> > +out:
> > +	*last = *cur;
> > +	return ret;
> > +}
> > +
> >  /**
> >   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
> >   * @devmem_allocation: The device memory allocation to migrate to.
> > @@ -365,10 +481,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  		.end		= end,
> >  		.pgmap_owner	= pagemap->owner,
> >  		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> > -		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
> > +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> >  	};
> >  	unsigned long i, npages = npages_in_range(start, end);
> >  	unsigned long own_pages = 0, migrated_pages = 0;
> > +	struct migrate_range_loc cur, last = {.device = dpagemap->drm->dev, .ops = ops};
> >  	struct vm_area_struct *vas;
> >  	struct drm_pagemap_zdd *zdd = NULL;
> >  	struct page **pages;
> > @@ -467,44 +584,55 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> > -					    devmem_allocation->dpagemap, pagemap_addr,
> > -					    migrate.src, npages, DMA_TO_DEVICE,
> > -					    mdetails);
> > -
> > -	if (err) {
> > -		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> > -						migrate.src, npages, DMA_TO_DEVICE);
> > -
> > -		goto err_finalize;
> > -	}
> > -
> >  	own_pages = 0;
> > +
> >  	for (i = 0; i < npages; ++i) {
> >  		struct page *page = pfn_to_page(migrate.dst[i]);
> >  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> > -
> > -		if (unlikely(src_page && is_zone_device_page(src_page) &&
> > -			     page_pgmap(src_page) == pagemap &&
> > -			     !mdetails->can_migrate_same_pagemap)) {
> > -			migrate.dst[i] = 0;
> > -			pages[i] = NULL;
> > -			own_pages++;
> > -			continue;
> > +		cur.start = i;
> > +
> > +		pages[i] = NULL;
> > +		if (src_page && is_device_private_page(src_page)) {
> > +			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
> > +
> > +			if (page_pgmap(src_page) == pagemap &&
> > +			    !mdetails->can_migrate_same_pagemap) {
> > +				migrate.dst[i] = 0;
> > +				own_pages++;
> > +				continue;
> > +			}
> > +			if (mdetails->source_peer_migrates) {
> > +				cur.dpagemap = src_zdd->dpagemap;
> > +				cur.ops = src_zdd->devmem_allocation->ops;
> > +				cur.device = cur.dpagemap->drm->dev;
> > +				pages[i] = src_page;
> > +			}
> > +		}
> > +		if (!pages[i]) {
> > +			cur.dpagemap = NULL;
> > +			cur.ops = ops;
> > +			cur.device = dpagemap->drm->dev;
> > +			pages[i] = page;
> >  		}
> > -		pages[i] = page;
> >  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> >  		drm_pagemap_get_devmem_page(page, zdd);
> > -	}
> > -	drm_WARN_ON(dpagemap->drm, !!own_pages);
> >  
> > -	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> > -				  devmem_allocation->pre_migrate_fence);
> > -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> > -					migrate.src, npages, DMA_TO_DEVICE);
> > +		/* If we switched the migrating drm_pagemap, migrate previous pages now */
> > +		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> > +						pages, pagemap_addr, &last, &cur,
> > +						mdetails);
> > +		if (err)
> > +			goto err_finalize;
> > +	}
> > +	cur.start = npages;
> > +	cur.ops = NULL; /* Force migration */
> > +	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> > +					pages, pagemap_addr, &last, &cur, mdetails);
> >  	if (err)
> >  		goto err_finalize;
> >  
> > +	drm_WARN_ON(dpagemap->drm, !!own_pages);
> > +
> >  	dma_fence_put(devmem_allocation->pre_migrate_fence);
> >  	devmem_allocation->pre_migrate_fence = NULL;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 40401aa70dbc..7be4d129247d 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -547,9 +547,10 @@ static int xe_svm_copy(struct page **pages,
> >  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> >  	ktime_t start = xe_gt_stats_ktime_get();
> >  
> > -	if (pre_migrate_fence && dma_fence_is_container(pre_migrate_fence)) {
> > +	if (pre_migrate_fence && (sram || dma_fence_is_container(pre_migrate_fence))) {
> 
> Ah, I see this addresses my comment in patch #3. I'm ok with this series
> going in as is but in follow up we pass the pre_migrate_fence to the
> first copy job as dependency. Up to you on the ordering here.
> 
> So...
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I see you have changed #3, so this code and below can be deleted. Feel
free to keep my RB.

Matt

> 
> >  		/*
> > -		 * This would typically be a composite fence operation on the destination memory.
> > +		 * This would typically be a composite fence operation on the destination memory,
> > +		 * or a p2p migration by the source GPU while the destination is being cleared.
> >  		 * Ensure that the other GPU operation on the destination is complete.
> >  		 */
> >  		err = dma_fence_wait(pre_migrate_fence, true);
> > @@ -701,7 +702,7 @@ static int xe_svm_copy(struct page **pages,
> >  	 * the pre_migrate_fence. Verify that this is indeed likely. If we
> >  	 * didn't perform any copying, just wait for the pre_migrate_fence.
> >  	 */
> > -	if (pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
> > +	if (!sram && pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
> >  		if (xe && fence &&
> >  		    (pre_migrate_fence->context != fence->context ||
> >  		     dma_fence_is_later(pre_migrate_fence, fence))) {
> > -- 
> > 2.51.1
> > 
