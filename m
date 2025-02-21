Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D205A3F84E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35210EA84;
	Fri, 21 Feb 2025 15:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XpIWFlDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2589D10E2A4;
 Fri, 21 Feb 2025 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740151319; x=1771687319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l74U0q5pj6mZhXetNLmd96Jy2TzmD53cxRmpOvDNRE4=;
 b=XpIWFlDLf0KqBEVmVYgYdpC4IN8nSVaDD32lST29THihRvrDvtmR+lDj
 s1zHgwE744CSlNilSxpc9srfq7Lsyzvww2Wz5WIU68f8Vo5OvmvaOxbl0
 q9YV0i/wKNmy7g8nLdfIcJvQdLjhpoMo7T0LtdM9mQCUO/8wK1bwBGPhD
 YBSsHQr+irJCoMz1ZpsNc1kDdoxxNUVxbz7GM1E9gO9d0zJLFN9UuAKFV
 s/VUTlT/NcpYz+GGcHPs4gHE8R09uxyWlR+lhPD96N4lKDE2EE5socP98
 Ybmd5SJJ1RoLa/BpzdBWrGuzEDbSBkjOkje0+hVDhOqESM8rlguDlBKwB A==;
X-CSE-ConnectionGUID: t6K0ikVaTBKPzmhIeSxuzw==
X-CSE-MsgGUID: c4XwzHEmSYiHuTvFles15Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66336938"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="66336938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:21:58 -0800
X-CSE-ConnectionGUID: GVX3NwOZRPKqIG3SivKlxg==
X-CSE-MsgGUID: fwTjkV8YS5afFaxJI4KBcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119519707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 07:21:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 07:21:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 07:21:57 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 07:21:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssVmuUmcB7v6/XI5nW7h+Uj5nPrvuJZtK+5yCIbiJHo1rnPCPxAazrx3tYZJpiBVJl+4xJdyLZpIlrmWxngyH4BOrT1woL9jeGUiapF/0huxoyXTVJ6KH48+Ie+BYIm24WXTtzdbAH//DD2TlWVYEVxDhgRF7hFuL6lsePyebpVEdQz7Qm4F7rOHg4ayhpYtBNzYv7XnjSW808RMyH8iAKHDaDqauYYeh6c4M2mqlOHhji2/6jM/2H00PkCZ9EHZIuGdJvh2EyLA5U19X5MBkQR4DgoTwfI2clEVWgLKHno7m3B5Ez8QjUg6Zv+WvlwvxVYQvscIjOeqMV3ThA6vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30e4lmJv3Gv7krgUw6RV5ajSEf0bl9wWzxrxYke6AsI=;
 b=e7v510lu89Qe5KqtlkA3SPcxczRFy4X74NG3hBZxzbExPYDFth0BJGRDEtv06gtVaB2oTF4GRR9gN26ZOSh/B8/sQPZtwjg5QHfIZgR0qWuMuSDyGh+AkiQCLNKAbvjQ+iXaPYcpGrpbs+88SR73AnmpzpITu6eay5mqsK3rAjiMvSW6JQb+0ACkYgPtTauNgXy8UdBFef7bqz9FQU6tDd6FeHfKfiBtu8mm8Ieiuos3XhTIfMKoPmdFVH/uVA3QT32qQazyuU/KN19LNcwVuSTsBr7pIEdlCGh/4eigcycRSTxP91+lYBkYpKa4pQ4sJwP2tbuuayPVMJN3KUbcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:21:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 15:21:54 +0000
Date: Fri, 21 Feb 2025 07:22:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Message-ID: <Z7iaUA92rdgcQ/1s@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <3de5325a-147e-4126-970c-765884a1f6da@intel.com>
 <b04945011524a4ee614cd830928ceedf9f9b6293.camel@linux.intel.com>
 <Z7eIyFMKBeAHiPPE@lstrano-desk.jf.intel.com>
 <e8753d24-a0bd-4f53-bf56-d72475cb73ee@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8753d24-a0bd-4f53-bf56-d72475cb73ee@intel.com>
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ebea60-e9d4-4c0b-75cb-08dd528b790c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5rfMsXVvk1IS6qkDH+iLRu0lVSwgdPQf1/jr5Z3TZ8ymYrUohClmNrxD9i?=
 =?iso-8859-1?Q?w/qr+OcFjfxqOmAFdTPQ3Y8N/DUBsH3Tzkt1jh3goYCb4I0nUrtF05KIh4?=
 =?iso-8859-1?Q?j/AcDF2QhNldocVpLJ6m7AapdSv8vRFvgSb+SxDOnHgA4qbrv+F5H+ryh6?=
 =?iso-8859-1?Q?vaAqqDJzAM8o+/pG34JBxNuMJv3rrApMhcfKTkXRBdBKsY8h182ncJlzpG?=
 =?iso-8859-1?Q?3G7ZLnVOwpYRqIs+Eu3p3c8lqgj9eNEmLSCg44QJ/Isy82VxdLBfyxYYkc?=
 =?iso-8859-1?Q?kIifKDvwU6rW4VjnIwuTH1bC8vC0EQf6EfhPhgSrAciJSRe33YNKLuVRI2?=
 =?iso-8859-1?Q?buL8BThjajL2iFbH2poS7zRHOnRpnPTiHHSvzDVF6q0pq2mDHeo3osp1PW?=
 =?iso-8859-1?Q?E98cl/ALi9GMuF6TEgMMTD2vQ5YRJujDCPdcVCPpPH6FGO686cPqhsTeos?=
 =?iso-8859-1?Q?FwiourfFcc2jkVlxmHzAtCquNjpTIR9yO+ljCbczl/mr4sjnGo2BCxxcoP?=
 =?iso-8859-1?Q?Srr5OYUMVYq05M5JMCLkKX8WmjQoeXgdsVBD5qvmsEvTN4IPnK3ocwTD6L?=
 =?iso-8859-1?Q?Qf1LITaODgpGqIKYEAHCnwTSYpLkvFhvz9ZfFq0lHyv9sWsM0ZUWewSyCf?=
 =?iso-8859-1?Q?aUWlzCISM+xRtOVr/OacITeSJDx0tFQqF9kp+GnI6ZeOWwkUz+PRzFrmPu?=
 =?iso-8859-1?Q?F39EhQTslUmJDsKpKfiyVYE1ET24aajKZyrsaD3a/NoVJUN5tBHXrOoaYY?=
 =?iso-8859-1?Q?sZ+Bs8VR5JEGauwIciRe5HcdXmYHn8Qsq7LZzgC/jbPpjwbTdjaauTSNdw?=
 =?iso-8859-1?Q?3Y2FoAtAGyYUSQ+70hXm7d2t9LhCGBJdPs5XNNtNIiL4bmFA7DxMK/m1U5?=
 =?iso-8859-1?Q?Q3HSkdwyY7t6p6L09Ija/lzBiJKewZ+RjKsy9Oi5k+JMVbIdnIdd0DDNCm?=
 =?iso-8859-1?Q?k010MU091w/7LQcyFXeRoDWEof18DQxPusQe3OidNyuda/54E9gbiFqT6u?=
 =?iso-8859-1?Q?06n3Z3H6NBg83IK1KyUE/r7pilOLm8mYMYz5f9GvNNNs2V6bXwoCE1Abrv?=
 =?iso-8859-1?Q?Jbfo5QgBagtvhcUHdwMwAITtHyNw7DRrrdmqfU5LUzT+HRjNNsEpgWPdkN?=
 =?iso-8859-1?Q?HEMaFGhHlSdMZ1C6LZPMmC3TJhJ2/hcprhGkt/x4szjpUB0xkp5Ppa1vYo?=
 =?iso-8859-1?Q?GkXynO+TQYkKEbrDowRjde5k4y8Eys5FAGSb4GdY5pGcFswKjk4C8xfHiw?=
 =?iso-8859-1?Q?2MiSBpeGv2bKobhgvhLT/bTXhwVAvQuUuK2en+I228EphyLz5//CU5bnRe?=
 =?iso-8859-1?Q?fDs141Du9gWZApra9FBetpuffVUDsb+BatXuIJ6kmx6DlGzCWg/N69KvH8?=
 =?iso-8859-1?Q?2DVPGvLPPhPrEj0PUsRbakUpm7m9oMvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tzXzS42RkBf2e0L0slOXazNuHWvoFt25gwxGkAZt/AbLrQ4PNTASuEEek4?=
 =?iso-8859-1?Q?kwecgZtBq86ykBkiE7dbLLZm/a4ocOQKg8T21qjgyGpZEoZnaQA++RRjhe?=
 =?iso-8859-1?Q?cB/9eNcu+elGV3ksZdR5ivQ96KIokrwo+qOJWKGaWOcb+220uEvB3PYliG?=
 =?iso-8859-1?Q?i/6tKRFTlZjWF2jGKB4nUgMI/QSQ1tllRQq6F7RY5eeHQzgUoTEpxGovfP?=
 =?iso-8859-1?Q?icOyMtlLdYEj7Zb0AxQzAz6eWICk7CaArB4pYotyILPCEtacPEAHnhUN+Z?=
 =?iso-8859-1?Q?zF2oQbYf+yZWkeJ+0cnq2/jkSZ+fyaqioPycDZ5iAJ9Jt8z60IFHASrPU6?=
 =?iso-8859-1?Q?mnQ14MZ7GkVag+d4lG5xmqntQEHFco5BdZjSn7rsQ/OuCx/0EvZpaizA3S?=
 =?iso-8859-1?Q?6MPced2hQ//UktAZ3RNU1UpOyGsvlofxDoIOHyORbPfbmv5gbCXFF2xGZT?=
 =?iso-8859-1?Q?M22sBbQho/Osw+GR7sSt1N//gtEXabYbdWH3K6tTff8R1moPxht79qV750?=
 =?iso-8859-1?Q?It22iJIVX8Ylq7/lUiCNLedhVUM/lYWABjeXeaoOvC9NNuIO8pAO5ecJC4?=
 =?iso-8859-1?Q?WAW81w5P1cyYAtaMNCQU2B+hIaboVaO0A4yko2sG5MMUEEgp8V/BjHbBjO?=
 =?iso-8859-1?Q?eAcm0I3pB3fUBRjGZCTkX1zUBkBOFaefKhtuUS9lY1olHmvvxQimUN84TU?=
 =?iso-8859-1?Q?BVIZt3Zrr37Fc3eW+SYrqBWg6SLCMa2NWnXYx1wmHBkGFA2bYR3P5/CEUK?=
 =?iso-8859-1?Q?1iETNYQAfVwwb8wtpqpfKWS3TxPCYF2D+jxF44SAPPozxxo6iOhpXZIEKo?=
 =?iso-8859-1?Q?WH5cYxrrqzor8amRqz7SJwnDBGRt2/zyMSAb+wbg2TSDuxN5iqbCUFIyzO?=
 =?iso-8859-1?Q?0BWeg75e2yodYFFok/nuYtuDVnKn1UqFUf4ntKi+QmKpirzMa1m8Gxo5CP?=
 =?iso-8859-1?Q?ldZItIKd+rOMFCaVFIc6nYXW5139/aYDkkNneRCdMzKipnKqxOCSEcy2gB?=
 =?iso-8859-1?Q?6vp0Do5jJy7i9674SmmV7/XNReHjgHR1uLmsGhDL7LZ7p1tsyth/FOruHq?=
 =?iso-8859-1?Q?rZFhfN/mRyWrB0jhUijw5Ll/PGgEAenRk9NXIlCb9712Bb/9tMcvcaWoyn?=
 =?iso-8859-1?Q?izC4hVp9DsDNfTXcqWqtZJxl5EyD7PBfdPAZSe76Uolo2bsmAmF1/NhMD5?=
 =?iso-8859-1?Q?8F8ykJvMiw8ii68aNEiPdKFnv4BJi5Sb2SVvfsEr9hwX8cS01PVOgIRWHT?=
 =?iso-8859-1?Q?fB9GPfhrp267rcNTijPrcaMYefyfFjVdxJgl/KICTzjPOzMIPol4go9VOO?=
 =?iso-8859-1?Q?r82+J67KqGRmolZQl4+IgSWn1nHbSVXZqcqneFloL4BF6uUMZ0NLBpJio3?=
 =?iso-8859-1?Q?WJZkPRQM/kYnpPIZmKE3f9FulTr/E9cndyufWI6DRrXqrOjaXX1Kn1PFmi?=
 =?iso-8859-1?Q?SXgCy3Nz0GxcUF4V3fnbqOecTqCFbRlltmlAT+wb3Vyr+++JrXDLefvyeK?=
 =?iso-8859-1?Q?iKQXUSkGgHYab0QGcXme2ONzUgqaqW4fxjwgaqwL5nwAenIoMdnq16hwEh?=
 =?iso-8859-1?Q?GwI6W1ctRdCeXJA7xtN+p00bhhW3FGhLiUZ9jtkIYfCfQwxOSVNP6bt6ah?=
 =?iso-8859-1?Q?Hzdj38PAepoPShKfN03VES6rrWwVWOU6M2DMhEI4MxYs8Ucd+PWT/GJA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ebea60-e9d4-4c0b-75cb-08dd528b790c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:21:54.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uG1rtcEzMtrcdO3b8KuxMSjF3XwnSygH08kK4i/qfJ9G0ja3G4uUyRUd2N77YujNUjewwCjUYmqqZPricfp/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

On Fri, Feb 21, 2025 at 03:15:38PM +0000, Matthew Auld wrote:
> On 20/02/2025 19:55, Matthew Brost wrote:
> > On Thu, Feb 20, 2025 at 04:59:29PM +0100, Thomas Hellström wrote:
> > > On Thu, 2025-02-20 at 15:53 +0000, Matthew Auld wrote:
> > > > On 13/02/2025 02:11, Matthew Brost wrote:
> > > > > Migration is implemented with range granularity, with VRAM backing
> > > > > being
> > > > > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime
> > > > > of the
> > > > > TTM BO is limited to when the SVM range is in VRAM (i.e., when a
> > > > > VRAM
> > > > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > > > 
> > > > > The design choice for using TTM BO for VRAM backing store, as
> > > > > opposed to
> > > > > direct buddy allocation, is as follows:
> > > > > 
> > > > > - DRM buddy allocations are not at page granularity, offering no
> > > > >     advantage over a BO.
> > > > > - Unified eviction is required (SVM VRAM and TTM BOs need to be
> > > > > able to
> > > > >     evict each other).
> > > > > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > > > > certainly
> > > > >     require a dma-resv.
> > > > > - Likely allocation size is 2M which makes of size of BO (872)
> > > > >     acceptable per allocation (872 / 2M == .0004158).
> > > > > 
> > > > > With this, using TTM BO for VRAM backing store seems to be an
> > > > > obvious
> > > > > choice as it allows leveraging of the TTM eviction code.
> > > > > 
> > > > > Current migration policy is migrate any SVM range greater than or
> > > > > equal
> > > > > to 64k once.
> > > > > 
> > > > > [1] https://patchwork.freedesktop.org/series/133643/
> > > > > 
> > > > > v2:
> > > > >    - Rebase on latest GPU SVM
> > > > >    - Retry page fault on get pages returning mixed allocation
> > > > >    - Use drm_gpusvm_devmem
> > > > > v3:
> > > > >    - Use new BO flags
> > > > >    - New range structure (Thomas)
> > > > >    - Hide migration behind Kconfig
> > > > >    - Kernel doc (Thomas)
> > > > >    - Use check_pages_threshold
> > > > > v4:
> > > > >    - Don't evict partial unmaps in garbage collector (Thomas)
> > > > >    - Use %pe to print errors (Thomas)
> > > > >    - Use %p to print pointers (Thomas)
> > > > > v5:
> > > > >    - Use range size helper (Thomas)
> > > > >    - Make BO external (Thomas)
> > > > >    - Set tile to NULL for BO creation (Thomas)
> > > > >    - Drop BO mirror flag (Thomas)
> > > > >    - Hold BO dma-resv lock across migration (Auld, Thomas)
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_svm.c | 111
> > > > > ++++++++++++++++++++++++++++++++++--
> > > > >    drivers/gpu/drm/xe/xe_svm.h |   5 ++
> > > > >    2 files changed, 112 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > index 0a78a838508c..2e1e0f31c1a8 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct
> > > > > xe_svm_range *range)
> > > > >    	return drm_gpusvm_range_end(&range->base);
> > > > >    }
> > > > > +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> > > > > +{
> > > > > +	return drm_gpusvm_range_size(&range->base);
> > > > > +}
> > > > > +
> > > > >    static void *xe_svm_devm_owner(struct xe_device *xe)
> > > > >    {
> > > > >    	return xe;
> > > > > @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct
> > > > > drm_gpusvm_devmem *devmem_allocatio
> > > > >    	return 0;
> > > > >    }
> > > > > -__maybe_unused
> > > > >    static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> > > > >    	.devmem_release = xe_svm_devmem_release,
> > > > >    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > > > > @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct
> > > > > xe_svm_range *range,
> > > > >    	return (range->tile_present & ~range->tile_invalidated) &
> > > > > BIT(tile->id);
> > > > >    }
> > > > > +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > > > > +{
> > > > > +	return &tile->mem.vram;
> > > > > +}
> > > > > +
> > > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > > > > xe_tile *tile,
> > > > > +				       struct xe_svm_range *range,
> > > > > +				       const struct drm_gpusvm_ctx
> > > > > *ctx)
> > > > > +{
> > > > > +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> > > > > +	struct xe_vram_region *vr = tile_to_vr(tile);
> > > > > +	struct drm_buddy_block *block;
> > > > > +	struct list_head *blocks;
> > > > > +	struct xe_bo *bo;
> > > > > +	ktime_t end = 0;
> > > > > +	int err;
> > > > > +
> > > > > +	if (!mmget_not_zero(mm))
> > > > > +		return ERR_PTR(-EFAULT);
> > > > > +	mmap_read_lock(mm);
> > > > > +
> > > > > +retry:
> > > > > +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > > > > +				 xe_svm_range_size(range),
> > > > > +				 ttm_bo_type_device,
> > > > > +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > > > 
> > > > Just to confirm, there is nothing scary with the vram still
> > > > potentially
> > > > being used by the GPU at this point (like with an async eviction +
> > > > clear
> > > > op), right? At some point we have some kind of synchronisation before
> > > > the user can touch this memory?
> > > 
> > > Good point. I don't think there is.
> > > 
> > 
> > Agree - there shouldn't be anything scary happening here. The new VRAM
> > is allocated from buddy which doesn't have dma-resv attached to it (and
> > thus no outstanding fences) and creating a new dma-resv object. A clear
> > is issued and then we do an immediate copy but those operations are
> > serialized on the same queue.
> 
> So there is basically always a copy operation after this? Is is not possible
> to have completely empty entries on the CPU side such that there is nothing
> to actually copy?
> 

It is possible for a copy to not be issued if the CPU has yet to fault
in the pages. In that case only the clear is issued and bind job waits
on the clear via dma-resv fences in the KERNEL slots.

For the full picture, if a copy is issued it directly waited on in
migration code as we can't release the CPU pages until the copy
completes.

Matt

> > 
> > Matt
> > 
> > > > 
> > > > > +	if (IS_ERR(bo)) {
> > > > > +		err = PTR_ERR(bo);
> > > > > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > > > > +			goto retry;
> > > > > +		goto unlock;
> > > > > +	}
> > > > > +
> > > > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > > > +			       vm->xe->drm.dev, mm,
> > > > > +			       &gpusvm_devmem_ops,
> > > > > +			       &tile->mem.vram.dpagemap,
> > > > > +			       xe_svm_range_size(range));
> > > > > +
> > > > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > > > > > blocks;
> > > > > +	list_for_each_entry(block, blocks, link)
> > > > > +		block->private = vr;
> > > > > +
> > > > > +	/*
> > > > > +	 * Take ref because as soon as
> > > > > drm_gpusvm_migrate_to_devmem succeeds the
> > > > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > > > +	 */
> > > > > +	xe_bo_get(bo);
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > > > &range->base,
> > > > > +					   &bo->devmem_allocation,
> > > > > ctx);
> > > > > +	xe_bo_unlock(bo);
> > > > > +	if (err) {
> > > > > +		xe_bo_put(bo);	/* Local ref */
> > > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > > +		bo = ERR_PTR(err);
> > > > > +	}
> > > > > +
> > > > > +unlock:
> > > > > +	mmap_read_unlock(mm);
> > > > > +	mmput(mm);
> > > > > +
> > > > > +	return bo;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * xe_svm_handle_pagefault() - SVM handle page fault
> > > > >     * @vm: The VM.
> > > > > @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct
> > > > > xe_svm_range *range,
> > > > >     * @fault_addr: The GPU fault address.
> > > > >     * @atomic: The fault atomic access bit.
> > > > >     *
> > > > > - * Create GPU bindings for a SVM page fault.
> > > > > + * Create GPU bindings for a SVM page fault. Optionally migrate to
> > > > > device
> > > > > + * memory.
> > > > >     *
> > > > >     * Return: 0 on success, negative error code on error.
> > > > >     */
> > > > > @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > > struct xe_vma *vma,
> > > > >    			    struct xe_tile *tile, u64 fault_addr,
> > > > >    			    bool atomic)
> > > > >    {
> > > > > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > > > > xe_vma_read_only(vma), };
> > > > > +	struct drm_gpusvm_ctx ctx = {
> > > > > +		.read_only = xe_vma_read_only(vma),
> > > > > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > > > > SZ_64K : 0,
> > > > > +	};
> > > > >    	struct xe_svm_range *range;
> > > > >    	struct drm_gpusvm_range *r;
> > > > >    	struct drm_exec exec;
> > > > >    	struct dma_fence *fence;
> > > > > +	struct xe_bo *bo = NULL;
> > > > >    	ktime_t end = 0;
> > > > >    	int err;
> > > > > @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > > struct xe_vma *vma,
> > > > >    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > > > >    retry:
> > > > > +	xe_bo_put(bo);
> > > > > +	bo = NULL;
> > > > > +
> > > > >    	/* Always process UNMAPs first so view SVM ranges is
> > > > > current */
> > > > >    	err = xe_svm_garbage_collector(vm);
> > > > >    	if (err)
> > > > > @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > > struct xe_vma *vma,
> > > > >    	if (xe_svm_range_is_valid(range, tile))
> > > > >    		return 0;
> > > > > +	/* XXX: Add migration policy, for now migrate range once
> > > > > */
> > > > > +	if (!range->migrated && range->base.flags.migrate_devmem
> > > > > &&
> > > > > +	    xe_svm_range_size(range) >= SZ_64K) {
> > > > > +		range->migrated = true;
> > > > > +
> > > > > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > > > +		if (IS_ERR(bo)) {
> > > > > +			drm_info(&vm->xe->drm,
> > > > > +				 "VRAM allocation failed, falling
> > > > > back to retrying, asid=%u, errno %pe\n",
> > > > > +				 vm->usm.asid, bo);
> > > > > +			bo = NULL;
> > > > > +			goto retry;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > >    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > > > &ctx);
> > > > > -	if (err == -EFAULT || err == -EPERM)	/* Corner where
> > > > > CPU mappings have changed */
> > > > > +	/* Corner where CPU mappings have changed */
> > > > > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > > > > {
> > > > > +		if (err == -EOPNOTSUPP)
> > > > > +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > > > &range->base);
> > > > > +		drm_info(&vm->xe->drm,
> > > > > +			 "Get pages failed, falling back to
> > > > > retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > > > > +			 vm->usm.asid, &vm->svm.gpusvm,
> > > > > ERR_PTR(err));
> > > > >    		goto retry;
> > > > > +	}
> > > > >    	if (err)
> > > > >    		goto err_out;
> > > > > @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > > > struct xe_vma *vma,
> > > > >    	dma_fence_put(fence);
> > > > >    err_out:
> > > > > +	xe_bo_put(bo);
> > > > >    	return err;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > index 0fa525d34987..984a61651d9e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > > >    	 * range. Protected by GPU SVM notifier lock.
> > > > >    	 */
> > > > >    	u8 tile_invalidated;
> > > > > +	/**
> > > > > +	 * @migrated: Range has been migrated to device memory,
> > > > > protected by
> > > > > +	 * GPU fault handler locking.
> > > > > +	 */
> > > > > +	u8 migrated	:1;
> > > > >    };
> > > > >    int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> > > > 
> > > 
> 
