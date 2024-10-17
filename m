Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7509A1999
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 06:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603210E79A;
	Thu, 17 Oct 2024 04:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJo3+mID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C57810E797;
 Thu, 17 Oct 2024 04:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729138090; x=1760674090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fS+nhejbpaY9qhAyIYkJO2wmTM/gXk3Hl/cr0FDDQ4M=;
 b=BJo3+mIDczzaJAw2tRlzVH1pblptyS+cDRNJCh5BizhbYB8GUVQaFCS6
 kRSikr/oFI7gWhR8OpzR8CPaHSoOnYFZ+/gmEBmkqy/ZuvBvOlg+BfXW4
 Zc9+FEgrB2/I2JDEKmGdL2VcFddTw/s9jm/ArFxqQvLpU5FyOuSDyAskw
 nq/eqzjsVtEFT4omiy1v/TzN6JR1NvaIimhMKK0VLDeopvkVq4quQoAey
 dooLhtBAaBm2NkySMA88jSK28zLjfDhRSygHXexyl8z14sG7svF1kQkMT
 sXZDDfOpheL3Ro1yxKdFHDOGmKIwA2kxmPDg4s7X8+ymrQWyyklTGEVOa A==;
X-CSE-ConnectionGUID: TcBijWXETWCQZf9vdEJVHQ==
X-CSE-MsgGUID: 1hiYot0ISxK2vouaIFRyvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28490581"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28490581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 21:08:10 -0700
X-CSE-ConnectionGUID: DdPk1pwJRpGKatJifVMm8w==
X-CSE-MsgGUID: XD0FPlhBSr64yciK6wyqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="109232410"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 21:08:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 21:08:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 21:08:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 21:08:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 21:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyhAaYCSRjzo7Z6f2ljSphKeFUQhrZDXGbFZgT3wDwszZBPrcWqVeoH+FYuLZH1yYo9knTewyKJBCpdVEtAO/dj02O9JoFj9/nVseEfTLxpsHXeSCvldXRDXmWQTeznXqyIw7dTYGBVVTe7YGcLeYTZ8UMkPBJNByYlCsLGnKX+T4dd+caUxWSnnjHNZBeGMIfgMjuj92wwfi2PMXtnYOVnLnX6w8Fl1i0+JTowyAoSVV0JuX0n4Jd97UXXkz+Lyi7tY3S27OrbMTSuXhMrN0kgGmyhlt0ZsYeitgtABIyZFbi7WUos2HVaeSduH24ykARSFQOtoSBlJpnq+vXECLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vngaEFp2wDH/A9mUphw/BYhkn8ZqjjOq8extVTEw6nM=;
 b=GqNZPxY4qEmF+MAlDM/LBny4/kvH0D+rwV6wVW0jhsQjP6l3Ys1P6N8/XfgQrvx2zQdYsxRMKB22tewtL8YB+AIwAG2mvOlW+H3YTr2C2WWqCtsT9YFd2tFcXxE0ZF0d1IjZ3eRhE0lQ0PN1zgIVxdbn0CCwSy0JMQiv3ufFJ9/XIh8rOHm09J/JdF4G1VwwzeJAm4bgcT+cJUcyBmLzRusmDHrwYM+SA/BIt/tFdxnJ+1qOp/fEAqUPQ384wkhnJfhxcwSoP6SkTNg3tELEAIPgkjM3pqipabwLN2p+EuD4/pT4lfC71PanGcaa3z98+pSz9LpBeWXpH7DIKv5wXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 04:08:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 04:08:06 +0000
Date: Thu, 17 Oct 2024 04:07:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874j5bo0yu.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 459b8c43-fe87-4dc4-5c06-08dcee614dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ca/fj+pMSRZQa2/F4x+Xc49etKCiZLMAYMcbXaIJUiil1Q/S5dD0Cow6Jqpu?=
 =?us-ascii?Q?UqJHXbEx1dKh1M0MoAj1U11MoEARsqoWi4in1tV556M0nK5wUVZRltBL3oJd?=
 =?us-ascii?Q?BglnoZzaPK4x3qSJ9qo++LJXiju2dHojP94f6BIJp4pxFWW3T5h9b7rzJEsM?=
 =?us-ascii?Q?Z+xvJ6wRvjoIkBjSOFCG5/etOSk4WwSCRZuHbaNAPn0rqINyYLSWYuXic7BL?=
 =?us-ascii?Q?OClK+0RxxV+x7skR95xPOFLJU6dWjfAzS/YWE5FL3rmCWlpKw7H/wGEEokKE?=
 =?us-ascii?Q?gmSUVO/QlxkkNAd3E+jvoC2GKgK2pJDIY2lbfXhwsMqGkl+zQWrgTIAyjuac?=
 =?us-ascii?Q?rr58iynN5fbOmpyeDUYl5bf2VWFoRK07lxuPoJeQkuzQYi8WSJJVJhkOJaNj?=
 =?us-ascii?Q?tZvU6t02vtJaWNBGypFEKgKV7LRcoHkBlfh9VC7KtiPYql0P1ozXn6q+HLnp?=
 =?us-ascii?Q?4JbtCTGOcmdaPgPU/uuL4GLIixc/tpbl5vrn2Yq3xvy2GYhFUy7PfMvrYJIh?=
 =?us-ascii?Q?YvVq7JCQFNLor19g19Hnmnd9d2RoKwFhiwr+en9V1iCjor1NZr3P8A/v9fmu?=
 =?us-ascii?Q?7V2CCeC7Aj8cMQAesAhgIohioIcz7/QEKoumwaeuLJo6MBx7X2Gh1u3H0VW6?=
 =?us-ascii?Q?WNKT0XBIXIu6FYvpo3WPVxQ5/woy41yBlOvNmcNrN2evvXr5R9IM4V/iPFsj?=
 =?us-ascii?Q?9SdHtemTObuHNlrXYKslDnyZmkgYhbbY9a2t4qZ0RtaLHz1qRnI5LuEoX9ct?=
 =?us-ascii?Q?zfVlUKmuAvBI5VFbg0RvYhRW9iuPMX6zLuQmGiMZAgtLQoLhy+024dpW4bN5?=
 =?us-ascii?Q?SLHM1jTuMUH/4E9YCSKQVuKYaqswO/YuHIEJOat2pQzhglLNtesfoXQhu5fX?=
 =?us-ascii?Q?UDWfZFCBe3TZwAKUHLKICIStVnKfSY57h/nel7PTo4ofPdY2fpCUMxtXErp+?=
 =?us-ascii?Q?kSH3hYvnYv248Wvs1K3jYembM0kIC874ur1QT+Y2cvpgxOhUJ53nIY4Ad4Qs?=
 =?us-ascii?Q?2A6gtLdyPkSIgx5F6aYEy1WRRDMoNZGhsrhhKngGwjLxMBxr8mv0fOQXE7h8?=
 =?us-ascii?Q?nwiUOXHf0iwYFx1zfECby6IxT7pn7BwY/TarSGuAys5ULfbkUVKhQNf5EI93?=
 =?us-ascii?Q?mQBStntHqVRYX6vcmOtWf1xdTses8BwDautfiMBgDwz4Pw/m298Q5vOM0qRk?=
 =?us-ascii?Q?NbFRlcGwddI0EKQOhdwP7b4kDH8/36p/iXab2r52t8ewPJ3z/NCU/BVRLAQq?=
 =?us-ascii?Q?8FaYIl8IRTfw01jRVtM72QG4zFUiTBqRuwAtC/ZMOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YEotU7bmbOZxvUvQbQQ+999M23kG9KgGwg/WfcoV60iDxBaENN8KSHkCQHMA?=
 =?us-ascii?Q?yV7UvrRl9iCBwTpIObB4plvY7RHSQX7MALla1I1MnBQwyyC2rd7tv/Z3m5Na?=
 =?us-ascii?Q?vL9/cxZ4rDSv4N3NyUGVYGGrmZUrLedV4u4VCPSkDGzH7tiPKecdcMrJaxeQ?=
 =?us-ascii?Q?xMx2hPjaeTPiCf8RHvKxNTFEX7vuOUDrdl5OxCdSszCuCWW+PL3dHYRJ5vkf?=
 =?us-ascii?Q?DmMb6d2YK5IMH5fAcZcuBQiiDfHNFn+s+iGudgky+TPWyCqAcj0fFwAqker6?=
 =?us-ascii?Q?85YIl61DhJ1WshdoGFkbk217fPXOLwvUMQ3HhYgENJDwXdcC7nPqR5nGGVA4?=
 =?us-ascii?Q?H8yZe4TeDNezcazyLbqsivjOIJQX0IsCbwMJR6uas7lnR44aZKg+JfrOmqnE?=
 =?us-ascii?Q?FRSextrcFDrxdwReAZCa7FfM8kZUlhperLJgWgapu8uoPA9RM5c37K6tOnR9?=
 =?us-ascii?Q?GaF/fUWitMlpOJjabiiyRpsLogxU9YNJ0GLVUz1fIHvA0R4mkGahPV/Zasbq?=
 =?us-ascii?Q?eMn2JbluGgnU8fIbDaUBfxsom3w8qY5uvgOGGjTTqGQilJZLR93C06Gvy7gu?=
 =?us-ascii?Q?HsxDTWeFXe8WFX9uahrHaoxaxTXkXGh37fNcTEto0xlTyCM+k2RraSeoQpuA?=
 =?us-ascii?Q?g/xFUIvwQUHbpUSGXeql9xtJ5TNQzqx2WQRqH640+J09/c3tVGy7rI8IaEaM?=
 =?us-ascii?Q?XAM5JOJz5jKLuVGoAqdWBjhFPbeMjL6C1Sn4bJ/xrNCWiWeXVi+gMMgcrxF9?=
 =?us-ascii?Q?/61atn9Zcgm6F+x03ghVTAncWQXW2mVGnhKsH5ypBBZNF1zSnYEgxxc1qv4N?=
 =?us-ascii?Q?AzwgU/rTb5hLwbcOhueMENTwihWSMx801rYd/HQwsJp7LgSstFAJgjjRYu4y?=
 =?us-ascii?Q?HmFCFuPYcbkYAeABv5ccuvY/0/3/1ddDPNnpai8Pp/hn9nTp0412b0swRByW?=
 =?us-ascii?Q?o8dDvZES9CSSCnCjCX1lKKAudqQBK5W6YkC2qNXUxacqP7IWXl0BsCiSFOJh?=
 =?us-ascii?Q?Uqn+CVIMsCZaGYso+WMHQ7hjydXIqrLFaPX+RahXH/2h9ST/WFzpK+YaYZm6?=
 =?us-ascii?Q?JGLQiZzXsyhNh1Mrbacc8c441japeQQ9i/yqHtPz5vNhtIZpYyo3M4mrbARO?=
 =?us-ascii?Q?QSAHGcTKDcNdLllQtvXsXkb0LOZboFtCWyXWxza1z3RFwHwDp9ddrL0T/wIe?=
 =?us-ascii?Q?guIyaH43bbA4rxJqz+K/lZk3+5ozbi7MSdahGyrQeKmsOHZXZKXQ6lgQfYZ/?=
 =?us-ascii?Q?9X3bqBFC4LbV55YxdMjEET9U6OfvNOPs10Z98Rt6XMOj+WA+IdcrdB2AI7i8?=
 =?us-ascii?Q?ZkxvplvsuT3JyKPctoaPhpM3gQtEz/eboiMLBfQwu3EbHNu/DsW9WlXG5IBt?=
 =?us-ascii?Q?YNOt+8ZCZtALBx6r3cV0JplCAETWzRzLH96DK5gQDZvxhsJG0qBZlfogXdUu?=
 =?us-ascii?Q?snQ1CPHrNgHsVmgqpwQYvVXy37jJA1ePIRFgfsKRygquSuF0vlgh94C4PpoS?=
 =?us-ascii?Q?vFBbc0WfRDk4OsyQZ8NCTJuXrxBPbp3l/jjDWh4woUAHkzG96hJAFdX9b2kU?=
 =?us-ascii?Q?Kk2JHjar/N00+jshODQ8MMWZ3hC0Oy2Qx2V1o2wLNUgLmt+xGzKZro9cZ3Yc?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b8c43-fe87-4dc4-5c06-08dcee614dcc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 04:08:06.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqNs2mdY5qysJreJE/YaxP78hJOs39+qQb9O8/JqtJs+V8d0bAkbcWeQKsS2x9LwIwXkFjpDXGSKMdB3iL0eEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
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

On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> >> 
> >> [...]
> >> 
> >> >> > > +{
> >> >> > > +	unsigned long i;
> >> >> > > +
> >> >> > > +	for (i = 0; i < npages; i++) {
> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> >> > > +
> >> >> > > +		if (!get_page_unless_zero(page)) {
> >> >> > > +			src_pfns[i] = 0;
> >> >> > > +			continue;
> >> >> > > +		}
> >> >> > > +
> >> >> > > +		if (!trylock_page(page)) {
> >> >> > > +			src_pfns[i] = 0;
> >> >> > > +			put_page(page);
> >> >> > > +			continue;
> >> >> > > +		}
> >> >> > > +
> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> >> > 
> >> >> > This needs to be converted to use a folio like
> >> >> > migrate_device_range(). But more importantly this should be split out as
> >> >> > a function that both migrate_device_range() and this function can call
> >> >> > given this bit is identical.
> >> >> > 
> >> >> 
> >> >> Missed the folio conversion and agree a helper shared between this
> >> >> function and migrate_device_range would be a good idea. Let add that.
> >> >> 
> >> >
> >> > Alistair,
> >> >
> >> > Ok, I think now I want to go slightly different direction here to give
> >> > GPUSVM a bit more control over several eviction scenarios.
> >> >
> >> > What if I exported the helper discussed above, e.g.,
> >> >
> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >> >  906 {
> >> >  907         struct folio *folio;
> >> >  908
> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >> >  910         if (!folio)
> >> >  911                 return 0;
> >> >  912
> >> >  913         if (!folio_trylock(folio)) {
> >> >  914                 folio_put(folio);
> >> >  915                 return 0;
> >> >  916         }
> >> >  917
> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >> >  919 }
> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >> >
> >> > And then also export migrate_device_unmap.
> >> >
> >> > The usage here would be let a driver collect the device pages in virtual
> >> > address range via hmm_range_fault, lock device pages under notifier
> >> > lock ensuring device pages are valid, drop the notifier lock and call
> >> > migrate_device_unmap.
> >> 
> >> I'm still working through this series but that seems a bit dubious, the
> >> locking here is pretty subtle and easy to get wrong so seeing some code
> >> would help me a lot in understanding what you're suggesting.
> >>
> >
> > For sure locking in tricky, my mistake on not working through this
> > before sending out the next rev but it came to mind after sending +
> > regarding some late feedback from Thomas about using hmm for eviction
> > [2]. His suggestion of using hmm_range_fault to trigger migration
> > doesn't work for coherent pages, while something like below does.
> >
> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> >
> > Here is a snippet I have locally which seems to work.
> >
> > 2024 retry:
> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > 2026         hmm_range.hmm_pfns = src;
> > 2027
> > 2028         while (true) {
> > 2029                 mmap_read_lock(mm);
> > 2030                 err = hmm_range_fault(&hmm_range);
> > 2031                 mmap_read_unlock(mm);
> > 2032                 if (err == -EBUSY) {
> > 2033                         if (time_after(jiffies, timeout))
> > 2034                                 break;
> > 2035
> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > 2037                         continue;
> > 2038                 }
> > 2039                 break;
> > 2040         }
> > 2041         if (err)
> > 2042                 goto err_put;
> > 2043
> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> > 2047                 memset(src, 0, sizeof(*src) * npages);
> > 2048                 goto retry;
> > 2049         }
> > 2050         for (i = 0; i < npages; ++i) {
> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> > 2052
> > 2053                 if (page && (is_device_private_page(page) ||
> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> > 2056                 else
> > 2057                         src[i] = 0;
> > 2058                 if (src[i])
> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> > 2060         }
> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> 
> Practically for eviction isn't this much the same as calling
> migrate_vma_setup()? And also for eviction as Sima mentioned you
> probably shouldn't be looking at mm/vma structs.
> 

hmm_range_fault is just collecting the pages, internally I suppose it
does look at a VMA (struct vm_area_struct) but I think the point is
drivers should not be looking at VMA here.

> > 2063         migrate_device_unmap(src, npages, NULL);
> > ...
> > 2101         migrate_device_pages(src, dst, npages);
> > 2102         migrate_device_finalize(src, dst, npages);
> >
> >
> >> > Sima has strongly suggested avoiding a CPUVMA
> >> > lookup during eviction cases and this would let me fixup
> >> > drm_gpusvm_range_evict in [1] to avoid this.
> >> 
> >> That sounds reasonable but for context do you have a link to the
> >> comments/discussion on this? I couldn't readily find it, but I may have
> >> just missed it.
> >> 
> >
> > See in [4], search for '2. eviction' comment from sima.
> 
> Thanks for pointing that out. For reference here's Sima's comment:
> 
> > 2. eviction
> > 
> > Requirements much like migrate_to_ram, because otherwise we break the
> > migration gurantee:
> > 
> > - Only looking at physical memory datastructures and locks, no looking at
> >   mm/vma structs or relying on those being locked. We rely entirely on
> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> 
> I also very much agree with this. That's basically why I added
> migrate_device_range(), so that we can forcibly evict pages when the
> driver needs them freed (eg. driver unload, low memory, etc.). In
> general it is impossible to guarantee eviction og all pages using just
> hmm_range_fault().
> 

In this code path we don't have device pages available, hence the
purposed collection via hmm_range_fault.

> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> >
> >> > It would also make the function exported in this patch unnecessary too
> >> > as non-contiguous pfns can be setup on driver side via
> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> >> > in [1].
> >> >
> >> > Do you see an issue exporting migrate_device_pfn_lock,
> >> > migrate_device_unmap?
> >> 
> >> If there is a good justification for it I can't see a problem with
> >> exporting it. That said I don't really understand why you would
> >> want/need to split those steps up but I'll wait to see the code.
> >>
> >
> > It is so the device pages returned from hmm_range_fault, which are only
> > guaranteed to be valid under the notifier lock + a seqno check, to be
> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> > MMU invalidation which takes the notifier lock thus calling the function
> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> >
> > I think this flow makes sense and agree in general this likely better
> > than looking at a CPUVMA.
> 
> I'm still a bit confused about what is better with this flow if you are
> still calling hmm_range_fault(). How is it better than just calling
> migrate_vma_setup()? Obviously it will fault the pages in, but it seems

The code in rev2 calls migrate_vma_setup but the requires a struct
vm_area_struct argument whereas hmm_range_fault does not.

> we're talking about eviction here so I don't understand why that would
> be relevant. And hmm_range_fault() still requires the VMA, although I
> need to look at the patches more closely, probably CPUVMA is a DRM

'hmm_range_fault() still requires the VMA' internal yes, but again not
as argument. This is about avoiding a driver side lookup of the VMA.

CPUVMA == struct vm_area_struct in this email.

Matt

> specific concept?
> 
> Thanks.
> 
>  - Alistair
> 
> > Matt
> >  
> >>  - Alistair
> >> 
> >> > Matt
> >> >
> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >> >
> >> >> Matt
> >> >> 
> >> >> > > +	}
> >> >> > > +
> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> >> > > +
> >> >> > > +	return 0;
> >> >> > > +}
> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> >> > > +
> >> >> > >  /*
> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> >> > 
> >> 
> 
