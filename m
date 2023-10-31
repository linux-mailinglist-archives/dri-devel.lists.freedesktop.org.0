Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC677DD800
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 23:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEBF10E5D2;
	Tue, 31 Oct 2023 22:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E6A10E5D3;
 Tue, 31 Oct 2023 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698789736; x=1730325736;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sFBpTVH/U4oDmmMdkBfuJPH1pmgMKF0e52L8ENsCqR4=;
 b=neH/dYo+RkUXgPiVZ8OCRZF4BiNY4F2R3zyJP3JZxJUybxmIffDd/TeL
 GZGhG7ezSbjn2CE1CiOZ4Vn40vfx/QZgFrGzkSRy1U44lbSQ4JlSZF0CR
 nmDwP5C44GVSRaWEYMHfP+6uDQNaba2p3L0reX/daNXojslKorArWYhSR
 veKiBl0jYTtmgtp4Sm27YymvGeX/BYOKklH/N3TzEXT+bLbe3AHUXeWwY
 WBTT4+SRb9/4ZOn1+RqmJWl8eCtrP0XidzCKbwZ6Wuuu3FRYT+6h/YHbo
 jPdMYdE9d2MDtGMjq+ebMLhonhx+2TLHANnCM56p+zXH8sob1yw3SuxEA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="391250921"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="391250921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="8456323"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 15:02:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:02:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 15:02:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 15:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuVmzfSWJu4axdSDFGEKWT4W/wyqK2teHjPnBdsJC6zmfzHrLEjv/TfnTAbM079RZkgFVg46WZ1MP6OFYjVgnqKnRMrBYT6lxGyFumqw+hIZ7UDYMWUnS1ViresUxDIjmGwXXYfS/2EbzLs66ISvBE2Eyj6K1cdNx6ubfwuC9AYHbCox65nAWg4mRw8gjnpO/jaMpWX0sbi6vy7dQ4dnAoRcvEg8V/aiVDdAqJBN2B4kdPp28xtqgYYv8MqPj1QFpUOTKiNpK9wyHe4HVBhvy5umCmn90Re8eHDqzQHgObCvTDDA0/alX3wl26CG0GnreUg9rcQz60O+v0QXovwsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijlSaPEXT8l7O44YXHfSthZHvl5StunGD/F74gTl42k=;
 b=CvFhPvSyWy1TAK1UFIGZX50ASULyfrbw5ACXBU7bKY0jj+U02DX5LqTBE861xQJlBtb49eCCewushMiFwVNE4HbMuqMOw0A9sBbJZmADqUPIhdUCjIkzSgum8U/+sU5CcmzxToNCs6AzX/6j5DDPnY2Wz3khvdnDSOLUBupuLwc5ZOvbIUB6kQuPymkWfVBKw1QjYllqI7JlhUVtM/6kPStbdUlB3fRSzs07M93/ZdBHHwwThM1OGZanyISoB1OikL5X/8PG8weDqeHuvlW3aFR5lrbQpP3RScJvrsJav9JZqltTY9ubn6paupd9fd7wu4wIfqo8p8YVCOKkeZQOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Tue, 31 Oct 2023 22:01:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6933.026; Tue, 31 Oct 2023
 22:01:49 +0000
Date: Tue, 31 Oct 2023 18:01:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: VM_BIND locking document
Message-ID: <ZUF5SJ8q7WKGU36x@intel.com>
References: <20231022180236.5170-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022180236.5170-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: c53ebd77-e775-4573-6009-08dbda5cfb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHok3svabI4jYSociEDia1ODzKSGTWMXQ/jasaDCapU7dmQ1KxQ11yOs+vk8eXyD9pBMhY2zt36rcKXpL/IHNhAgSQcKsI3qx5husiN5Fol3AI3lZlFEceo5k1NMtdaTHkf0m4dx025NgsjlAUeHZbU6k5kQrvzfnljL4trm4nFkUH/h2CMua7/1zxPoMqwtNV7PDfs3ow/LkHS06UC8eePZX/7095MxKU3mm/kj+oejjm2nuAInTOP3YwhYxJsbULCNXIFIHN2WV7uKd37m/RP5BFq4x9eunkmkVDkanv/w4bZRpRWf1TXvLhVU/04RYx955DGM66o78ngXSqZhjoNyoHM+3air0Fl8X2KjUTLmCbypasjqfRZ9Vaq2xkOV/opOJEuLeOqXSkaWV4PMxUFRWFBuVDUSyzqTaCgW/G52DoW+or59GKhf0C/wXekUo4LpQFioUIEEJf+HFWWwkueuzlmfMRL5YYlGY9is8tvB6CDnyfO9TQx2kN86EuRsaycacB+oYf3nO3OkS3L/9Hj+Sh9y7zYlj9MW0Xt1/Zsknjk3afnrnTpik4mVyuxYHORHuVtKKfObkCdDZ+3QGelx8gccobgYJ/e3Fvi23C3NC3/lxxZ6YFcI9VLRsDo+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799009)(82960400001)(86362001)(36756003)(6486002)(2906002)(6512007)(478600001)(41300700001)(30864003)(8936002)(8676002)(44832011)(4326008)(6666004)(6506007)(83380400001)(66946007)(26005)(2616005)(66556008)(6916009)(5660300002)(316002)(66476007)(66574015)(54906003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tfLCiy1NTgTjz0vUd89j3gzAmo/kMHWbE7ORr0UbTEY2drgfneGB1fgsHU?=
 =?iso-8859-1?Q?1bdENVR8gpxnANs0tXqSKstxp8SdVJ+nV5foSLY13xqHPJOYHbffat/R+o?=
 =?iso-8859-1?Q?6kvNA9vbc2RON2BS1eNGCwYlNbZNe17bCwtdAiFsan+EKBKar43asZPF0Z?=
 =?iso-8859-1?Q?dh5LcE2WU8a/a6zMJwTCoIdOEjvjKX5pmX8G92iC4biuL3MKY10Cz4KDTK?=
 =?iso-8859-1?Q?J6GRM8bEMf77w9hnon4egsjVkm2DKwY8Ri3o0mGFQVN8N3inmyeDL1vX/j?=
 =?iso-8859-1?Q?92OXQJkn8QXwcY0tKc/6S2Pr2xII7sX8SirONhgEWFo/jrr+NcGU10YNH7?=
 =?iso-8859-1?Q?mZN62H5IflenMylke6gBuAoyq9cpimVM9n6CeR6+lcpZUXmdlfUWOB1ZhG?=
 =?iso-8859-1?Q?NG1Mt7HN66xUnXNFVeNc6wpcn1AukBQSPFrUcdVuKZ4AZEMvmegxXPAkDH?=
 =?iso-8859-1?Q?hgzkYTijqkrBW8uKBRw+/3nAB0cZH6aThx9skWoFCsdApyseAjpUNc7gGS?=
 =?iso-8859-1?Q?Fm6W4+KJInyJNnPs7fX3Q34uayEL1mkUjRQcwNTpFy8h9P+neZ1r8inT5m?=
 =?iso-8859-1?Q?H2buk+Q3dM0EArpVi+ZBUVaOlta6L8CrWHP1vSgM0wu7HUjW7g5tXdUTAJ?=
 =?iso-8859-1?Q?NANfjZdbhaKTcqqWwL0MKD6X/G68W7CHMyxwro+1U210PrDa3oPKN3IBxk?=
 =?iso-8859-1?Q?l4vAo7CGsohBNORYTdr2aMw8A9VB90vf0eGVItZuvk4dw2CzPkpL7nU/9G?=
 =?iso-8859-1?Q?35MO1z/PUAzYlsYmMxkR5qc4zH+v0B3umxDyFIF//+u/vGLhIBjADsotoT?=
 =?iso-8859-1?Q?ffJBA1Tz5LKiHtGADg9OCLfyGBiwPluyigUY6Pf92UGGYqbMZfN95IGF5L?=
 =?iso-8859-1?Q?s8wdP/nVwzZwHPfYlGtpC/+DilU5I79Oikte/3Mo7KD+sVgd84QcM8uIlL?=
 =?iso-8859-1?Q?PNmeRSFSLaVrx98UIEdpV3GELPSaqucKecCF92hHJJ8tjnmkvSksrlgVR4?=
 =?iso-8859-1?Q?Kp1GYg7Ne7VdNcVQUFD2IQGtQjNnSLS1GP96FIET7HLrcsFE/RZhJbGhJL?=
 =?iso-8859-1?Q?NrexOMpgidK2SZhvNAq14C3WkyHNF2TpVgniJu66oVor4ynhwhHJjcQvx1?=
 =?iso-8859-1?Q?g+eOJjARibeyh5sc/rTPT0eDSOVMNb1LkPIWZOha+Q19WT2WnQc9nqdZH/?=
 =?iso-8859-1?Q?/j9IEXbwJLxSI3wuSL5NXAwDbZr9BAUB8Yc6BfgPw1O6gw9pZLIF+oRVzj?=
 =?iso-8859-1?Q?FVZYIworgimPlo6XHpMVC54gU+IsMvX3N0wwkrVWp/Dw7cuJceIKraPyci?=
 =?iso-8859-1?Q?817I/Pf+k5ViCfN66NaTWUabq2iuTlz5ZAEcWhIncmVJ/ORMB5t/cV88RG?=
 =?iso-8859-1?Q?10IgkdIIX3mWWko+egDY9UlP78TMa14clBtW9fWM6GamrbCMRrxMxLsJP1?=
 =?iso-8859-1?Q?bJ8RqDLlsV8jJDRUsk5jDmu/V/yITLj+n1krSa+JtvBClfCvjQb2D7mlG9?=
 =?iso-8859-1?Q?5S1vJ1Z4gePA+JgZZgdDoiCWEtG2sxGgAvgftl4sDQVsIM8HsIq1OhwD/c?=
 =?iso-8859-1?Q?yjjMLqSNoM5HiSfvYnks2ZKnlHwy+ILzGSGs5SNlgtg+aVSzFvTYNpSRmC?=
 =?iso-8859-1?Q?X0SKOnyzK3hZjLPGil/Wu0Iz89uzPRkuFN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c53ebd77-e775-4573-6009-08dbda5cfb31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 22:01:49.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95NjIIyZBfjcNlZtePUyj/J9HISZ7V8T0hDiTVU6Z5TNDLyiArZOs/0aVQJAOQXuMcxSkNCqrcq0lAogcwFHsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 22, 2023 at 08:02:36PM +0200, Thomas Hellström wrote:
> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
> 
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
> 
> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>   (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
> 
> v3:
> - Large update to align with the drm_gpuvm manager locking
> - Add "Efficient userptr gpu_vma exec function iteration" section
> - Add "Locking at bind- and unbind time" section.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-locking.rst | 494 ++++++++++++++++++++++
>  1 file changed, 494 insertions(+)
>  create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..c290ff4287fb
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,494 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +VM_BIND locking
> +===============
> +
> +This document attempts to describe what's needed to get VM_BIND locking right,
> +including the userptr mmu_notifier locking and it will also discuss some
> +optimizations to get rid of the looping through of all userptr mappings and
> +external / shared object mappings that is needed in the simplest
> +implementation. It will also discuss some implications for faulting gpu_vms.
> +
> +Nomenclature
> +============
> +
> +* ``Context``: GPU execution context.
> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  context.
> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with
> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a GEM object or anonymous pages mapped also into the CPU
> +  address space for the process.
> +* gpu_vm_bo: Abstracts the association of a GEM object and
> +  a VM. Note that if only one gpu_vma per vm and buffer object were
> +  allowed, the state stored with a gpu_vm_bo could just as well have
> +  been stored with the gpu_vma. For the purpose of this document, each
> +  GEM object maintains a list of gpu_vm_bos, and each gpu_vm_bo
> +  maintains a list of gpu_vmas.
> +* ``userptr gpu_vma or just userptr``: A gpu_vma, the backing store of
> +  which is anonymous pages as described above.

something strange after the comma, but my bad english can't allow to pin
point what. Or maybe it is right and the problem *is* my bad english :)

> +* ``revalidating``: Revalidating a gpu_vma means making the latest version
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals.
> +* ``dma_resv``: A struct dma_resv (AKA reservation object) that is used

maybe s/AKA/a.k.a ?!

> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a GEM object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary order.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is local to a gpu_vm. Shared gem
> +  objects also share the gpu_vm's dma_resv.
> +* ``shared object``: AKA external object: A GEM object which may be shared

maybe s/AKA/a.k.a ?!

> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +
> +Locks used and locking orders
> +=============================
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_vm's
> +dma_resv object and hence the dma_resv lock. So even with a huge
> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the gpu_vm is
> +  partitioned into gpu_vmas. It can also protect the gpu_vm's list of
> +  userptr gpu_vmas. With a CPU mm analogy this would correspond to the
> +  mmap_lock.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c`` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount, however this allows multiple
> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas needing
> +  rebinding, and also the residency of all the gpu_vm's local GEM object.
> +  Furthermore it typically protects the gpu_vm's list of evicted GEM
> +  objects and external objects.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is
> +  taken in read mode during exec and write mode during a mmu notifier
> +  invalidation. The userptr notifier lock is per gpu_vm.
> +* The gpu_vm list spinlocks. With some implementations they are needed
> +  to be able to update the gpu_vm evicted- and external object
> +  list. For those implementations, the spinlocks are grabbed when the
> +  lists are manipulated. However to avoid locking order violations
> +  with the dma_resv locks, a special scheme is needed when iterating
> +  over the lists.
> +  

   ^^ spurious spaces

> +.. _gpu_vma lifetime:
> +
> +Protection and lifetime of gpu_vm_bos and gpu_vmas
> +==================================================
> +
> +The GEM object's list of gpu_vm_bos is typically protected by the
> +GEM object's dma_resv. Each gpu_vm_bo holds a reference counted pointer
> +to the underlying GEM object, and each gpu_vma holds a reference counted
> +pointer to the gpu_vm_bo. When iterating over the GEM object's
> +list of gpu_vm_bos the gem object's dma_resv must thus be held,
> +but if it needs to be dropped during the iteration, care needs to be
> +taken so that any gpu_vm_bo, and the gpu_vm, if dereferenced
> +while the lock is dropped, do not disappear. The easiest way to avoid
> +this is to take a reference on affected objects while the dma_resv is
> +still held. If iterating over the gpu_vm_bo's gpu_vmas, even
> +greater care needs to be taken since the gpu_vmas are not
> +reference counted. If a driver accesses a gpu_vma obtained from
> +the gpu_vm_bo's list of gpu_vmas, and the GEM object's
> +dma_resv is dropped, at the very least, it should be thoroughly
> +documented how the gpu_vma is kept alive. Otherwise holding the
> +GEM object's dma_resv lock also around unlinking a gpu_vma from a
> +gpu_vm_bo will ensure that doesn't happen.
> +
> +
> +Revalidation and eviction of local objects
> +==========================================
> +
> +Revalidation
> +____________
> +With VM_BIND, all local objects need to be resident when the gpu is
> +executing using the gpu_vm, and the objects need to have valid
> +gpu_vmas set up pointing to them. Typically each gpu command buffer
> +submission is therefore preceded with a re-validation section:
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // Validation section starts here.
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +	   // The following list iteration needs the Gem object's
> +	   // dma_resv to be held (it protects the gpu_vm_bo's list of
> +	   // gpu_vmas, but since local gem objects share the gpu_vm's
> +           // dma_resv, it is already held at this point.
> +	   for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +		  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +	   remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +   // Validation section ends here, and job submission starts.
> +		

   ^^^^^^^^^^^^^ more spurious spaces

> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(gpu_vm->resv);
> +
> +The reason for having a separate gpu_vm rebind list is that there
> +might be userptr gpu_vmas that are not mapping a buffer object that
> +also need rebinding.
> +

(pausing here... I will continue the review below tomorrow)

> +Eviction
> +________
> +
> +Eviction of one of these local objects will then look similar to the
> +following:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> +           add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu_vm's
> +dma_resv lock so that ``obj->resv == gpu_vm->resv``.
> +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict list,
> +which is protected by ``gpu_vm->resv``, that is always locked while
> +evicting, due to the above equality.
> +
> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before eviction,
> +Since the eviction blit or copy will wait for GPU idle, any attempt by
> +the GPU to access freed memory through the gpu_vma will be preceded by
> +a new exec function, with a revalidation section which will make sure
> +the gpu_vma is rebound. The eviction code holding the object's dma_resv while
> +revalidating will ensure a new exec function may not race with the eviction.
> +
> +Locking with external (or shared) buffer objects
> +================================================
> +
> +Since shared buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm, but will rather
> +have a reservation object of their own. The shared objects bound to a
> +gpu_vm using one or many gpu_vmas are therefore typically put on a
> +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock. Once
> +the gpu_vm's reservation object  is locked, it is safe to traverse the
> +external object list and lock the dma_resvs of all external objects.
> +
> +At eviction time we now need to put the gpu_vm_bos of *all* gpu_vms a
> +shared object is bound to on the gpu_vm's evict list, but we can no longer
> +be certain that we hold the gpu_vm's dma_resv of all the gpu_vms the
> +object is bound to, since at eviction time we only hold the object's
> +private dma_resv. If we have a ww_acquire context at hand at eviction
> +time we could grab the those dma_resvs but that could cause
> +expensive ww_mutex rollbacks. A simple option is to just mark the
> +gpu_vm_bos of the evicted gem object with an ``evicted`` bool that
> +is inspected the next time the corresponding gpu_vm evicted list needs
> +to be traversed. At that time the gpu_vm's dma_resv and the object's
> +dma_resv is held, and the gpu_vm_bo marked evicted, can then be added
> +to the gpu_vm's list of evicted gpu_vm_bos. The ``evicted`` bool would
> +then be protected by the object's dma_resv.
> +
> +The exec function would then become
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // External object list is protected by the gpu_vm->resv lock.
> +   for_each_gpu_vm_bo_on_extobj_list(gpu_vm, &gpu_vm_bo) {
> +           dma_resv_lock(gpu_vm_bo.gem_obj->resv);
> +	   if (gpu_vm_bo_marked_evicted(&gpu_vm_bo))
> +                   add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +   }
> +
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +	   for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +		  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +	   remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo)
> +           if (object_is_vm_local(obj))
> +	        add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +           else
> +		mark_gpu_vm_bo_evicted(&gpu_vm_bo);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +.. _Spinlock iteration:
> +
> +Accessing the gpu_vm's lists without the dma_resv lock held
> +===========================================================
> +
> +Many drivers will not need to access the gpu_vm's evict- and
> +external objects lists without holding the gpu_vm's dma_resv lock,
> +but some drivers do, for example due to asynchronous state updates
> +from within the dma_fence signalling critical path. In such case a
> +spinlock can be used to protect manipulation of the lists. However,
> +since higher level sleeping locks needs to be taken for each list item
> +while iterating over the lists, the items already iterated over needs
> +to be temporarily moved to a private list and the spinlock released
> +while processing each item:
> +
> +.. code block:: C
> +
> +    struct list_head still_in_list;
> +
> +    INIT_LIST_HEAD(&still_in_list);
> +
> +    spin_lock(&gpu_vm->list_lock);
> +    do {
> +            struct list_head *entry = list_first_entry_or_null(&gpu_vm->list, head);
> +
> +	    if (!entry)
> +	            break;
> +
> +	    list_move_tail(&entry->head, &still_in_list);
> +	    list_entry_get_unless_zero(entry);
> +	    spin_unlock(&gpu_vm->list_lock);
> +
> +	    process(entry);
> +
> +	    spin_lock(&gpu_vm->list_lock);
> +	    list_entry_put(entry);
> +    } while (true);
> +
> +    list_splice_tail(&still_in_list, &gpu_vm->list);
> +    spin_unlock(&gpu_vm->list_lock);
> +	    
> +However, due to the additional locking and atomic operations, drivers that *can*
> +avoid accessing the gpu_vm's list outside of the dma_resv lock
> +might want to avoid this iteration scheme, if the driver anticipates a
> +large number of list items. For lists where the anticipated number of
> +list items is small, list iteration doesn't happen very often, or
> +there is a significant additional cost associated with each iteration,
> +the atomic operation overhead associated with this type of iteration
> +is, however, probably negligible. Note that if this scheme is
> +used, it is necessary to make sure this list iteration is protected by
> +an outer level lock or semaphore, since list items are temporarily
> +pulled off the list while iterating.
> +
> +TODO: Pointer to the gpuvm code implementation if this iteration and
> +how to choose either iteration scheme.
> +
> +userptr gpu_vmas
> +================
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and with proper accounting pinning might
> +still be a desirable feature, though). What we need to do in the
> +general case is to obtain a reference to the desired pages, make sure
> +we are notified 
> +using a MMU notifier just before the CPU mm unmaps the pages, dirty
> +them if they are not mapped read-only to the GPU, and then drop the
> +reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages,
> +and make sure that before the next time the GPU tries to access
> +whatever is now present in the CPU mm range, we unmap the old pages
> +from the GPU page tables and repeat the process of obtaining new page
> +references. Note that when the core mm decides to laundry pages, we get such
> +an unmap MMU notification and can mark the pages dirty again before the
> +next GPU access. We also get similar MMU notifications for NUMA accounting
> +which the GPU driver doesn't really need to care about, but so far
> +it has proven difficult to exclude certain notifications.
> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +`this document
> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> +
> +Now the method of obtaining struct page references using
> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means
> +the gpu_vm's list of userptr gpu_vmas needs to be protected by an
> +outer lock.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   // Exclusive locking mode here is strictly needed only if there are
> +   // invalidated userptr vmas present, to avoid multiple userptr
> +   // revalidations.
> +   down_write(&gpu_vm->lock);
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq != gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +	   dma_resv_lock(&gpu_vm->resv);
> +	   add_gpu_vma_top_revalidate_list(&gpu_vma, &gpu_vm);
> +	   dma_resv_unlock(&gpu_vm->resv);
> +	   gpu_vma->saved_seq = seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->saved_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +	  goto retry;
> +   }
> +
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_shared_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_write(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr
> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again to avoid locking order violations, we can't
> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +	  // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +	  mmu_interval_set_seq(userptr_interval, cur_seq);
> +	  up_write(&gpu_vm->userptr_notifier_lock);
> +
> +	  // At this point, the exec function can't succeed in
> +	  // submitting a new job, because cur_seq is an invalid
> +	  // sequence number and will always cause a retry. When all
> +	  // invalidation callbacks, the mmu notifier core will flip
> +	  // the sequence number to a valid one. However we need to
> +	  // stop gpu access to the old pages here.
> +
> +	  dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +		                false, MAX_SCHEDULE_TIMEOUT);
> +	  return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the
> +page-binding before a new GPU submission can succeed.
> +
> +Efficient userptr gpu_vma exec_function iteration
> +_________________________________________________
> +
> +If the gpu_vm's list of userptr gpu_vmas becomes large, it's
> +inefficient to iterate through the complete lists of userptrs on each
> +exec function to check whether each userptr gpu_vma's saved
> +sequence number is invalid or stale. A solution to this is to put all
> +*invalidated* userptr gpu_vmas on a separate gpu_vm list and
> +only those gpu_vmas on the list are actually checked on each exec
> +function. This list will then lend itself very-well to the spinlock
> +locking scheme that is
> +:ref:`described in the spinlock iteration section <Spinlock iteration>`, since
> +in the mmu notifier, where we add the invalidated gpu_vmas to the
> +list, it's not possible to take any outer locks like the 
> +``gpu_vm->lock`` or the ``gpu_vm->resv`` lock. Note that the
> +``gpu_vm->lock`` still needs to be taken while iterating to ensure the list is
> +complete, as also mentioned in that section.
> +
> +If using an invalidated userptr list like this, the retry check in the
> +exec function trivially becomes a check for invalidated list empty.
> +
> +Locking at bind- and unbind time
> +================================
> +
> +At bind time, assuming a GEM object backed gpu_vma, each
> +gpu_vma needs to be associated with a gpu_vm_bo and that
> +gpu_vm_bo in turn needs to be added to the GEM object's
> +gpu_vm_bo list, and possibly to the gpu_vm's external object
> +list. This is referred to as *linking* the gpu_vma, and typically
> +requires that the ``gpu_vm->resv`` and the GEM object's dma_resv are
> +held. When unlinking a gpu_vma the same locks are typically held,
> +and that ensures, as briefly discussed
> +:ref:`previously <gpu_vma lifetime>`, that when iterating over
> +``gpu_vmas`, either under the ``gpu_vm->resv`` or the GEM
> +object's dma_resv, that the gpu_vmas stay alive as long
> +as the lock under which we iterate are not is not released. For
> +userptr gpu_vmas it's similarly required that during unlink, the
> +outer ``gpu_vm->lock`` is held, since otherwise when iterating over
> +the invalidated userptr list as described in the previous section,
> +there is nothing keeping those userptr gpu_vmas alive.
> +
> -- 
> 2.41.0
> 
