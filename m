Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC78B1173
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7A10E1AD;
	Wed, 24 Apr 2024 17:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OrpLbOeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B790710E1AD;
 Wed, 24 Apr 2024 17:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkJNwnOVwpCzYdorP8/BQ+B869K0QIuH3RBHaGbhyuJzIlTNY18WstrPBMS9RS6YckIkVSsDZ8xh9yEaEb3t9+AD6Ai7Dm1P9Jx3SLRfbWdVbqDOBJNz5wGY38PjCGG/QJPv9fjp7ucj40uzUUlQGOJL3r8Vkosw7iAN+gQ9XBZBozvqrM2ohbG8W+cKbp6dxZ/XVFSvm6A/F+ktgH7yZkk+zZ1GSnc+IHDkvdvOY28+xDrBC5ZOyPGzPR2Cj3XyS3ga6NyEYL9M2RBPwTS6Oq+fNVMEGhz7Rug3+OSTwNUWm1SdZqYptoQE9bi8IR4al7h6wnp20lQ7Dnt2Fn2JhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0Ut/QTsWWxltCGzOzQLlqev4dFsd09i/fLT9p+rH2k=;
 b=VyY3tJTA2lQY3sk0aXfaOtGqSixmbI3H5Ox/0B9ZgA3oit2dHJs8QA5Rj9xXY/c+J+0KVH/qVmRQ3Te+oATwVT4PV9JVRhKWWanNfxJVQXWvU7C+ZVbAzyR784OaS+14yl3SaVa009NrGdjxusDR6J0N7AZjGFfkhHVXc7wTIF3y9Yu7SHvy9Hw5L8zxq28OnLmBrjKr0+irejvCyh7RczY27aZcrQaMwuPsAugNfukEwM+8ct/cpkhgXuif5p1pdm/WpADlCgPcNar/qd0CZRm8Ibhpluyp2AdoPxV4r5sFNoORVBV76E6PuibFZ48BDKeWMM9qKSVIqU7v6MBjAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0Ut/QTsWWxltCGzOzQLlqev4dFsd09i/fLT9p+rH2k=;
 b=OrpLbOeDzvmlz/oOxLeoR47NjeQjPl8if2aDI7IZRCZpvbCT6PlEsqHe8xIwHDvj0VGByBLBoff1smy6hkwRvgA9w7ttSNesQWaHckPHPR5PCedwW4rh6KTwjo2s28Y2RvZmEtMI4wlEkzmSY8MR4x57PUUQgdGdDTyqGoYxskPtNLiUTNJX2HuDyjo6guKpOZPsNjrpyrfp77dcAu3AiUL2C4pF/Ha6KsdCw0hIBmxKrIzxmstNx7Wl9KMhLHvWZ0uZyCeTn1qN4OrSUlgy3Z4IBrcPs9Kt8W4hljvw5KuRifNhLKGTQYOaZprClVczSaAs90RdrZBxVQUAiqthXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 17:48:02 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 17:48:02 +0000
Date: Wed, 24 Apr 2024 14:48:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240424174800.GS941030@nvidia.com>
References: <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
 <20240424135754.GK941030@nvidia.com>
 <Zik0xY55VBXbgJxs@DUT025-TGLU.fm.intel.com>
 <20240424164411.GR941030@nvidia.com>
 <Zik52U0wpajDGF1F@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zik52U0wpajDGF1F@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SA9P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::14) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4dc786-dc01-4a43-16d4-08dc6486afd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aGGQl+METhe+b05uZ22+fXnjQ7WviK+xctXUi9t+yZYXa2/ks2G8Ze7Reeno?=
 =?us-ascii?Q?MYjnOeH5j4sJN5zI2ix9OfYxp/MziAQbMdk37YH55fGyvpnxDfhUb8DFRhGR?=
 =?us-ascii?Q?3WeXUenGvYU8QvD9Pk3iQeR5Q7Pcdo6YuOCXDz4m7LgSbyDaPtBtsbxb04qd?=
 =?us-ascii?Q?uD4VdOPlXGbaudYR4TMlfwGLZACIYOaPofcBWAceGfocGj+pXgCIdwG8SP1I?=
 =?us-ascii?Q?2f+Ae0Avrnb8rjrdgRJcm9+JyUKRP5vPLtPmjVKNw6Sgor1FOhlViJ5M9hcc?=
 =?us-ascii?Q?CoggHzVcdlxFaJA6b5Or+uyp9K3j4n/QuGLAFaqRnmNNMRsevSp/pOZEythb?=
 =?us-ascii?Q?xjKn8tQTtYK9xmtpGeVADjFvUtCfUTdKbgC0I/426cwmNwRDMh/63Ytp0x18?=
 =?us-ascii?Q?q/XE4IAEs1vKlExDSEMizn8iYNf2KIqQo8RvP0GkPrLqszkLjY77/8XaSLlk?=
 =?us-ascii?Q?0Cypfyb87v8a/k1Z7sucXhG3+oBnm6lHPQqDLJ7D/993gJnEHC8XW5dqnZnC?=
 =?us-ascii?Q?h8Ik4lIKvWiYR4RRNxJn4bGrXz/NBkS/DD2pyaIRX+R9sfwP6b0LcRnhvyJc?=
 =?us-ascii?Q?iiLd28AzxNFg2z0n+XY7v9pBqb+OwLlzhbroNY13Z12Gu3idgomBCdLT4n74?=
 =?us-ascii?Q?mF5HflY1sp+YrE82v0jgzymuOlkPb8QxkDrJYD8kGmZjmwHWwzf2Xq/IUE/V?=
 =?us-ascii?Q?pzdCrouiv0ecldZGViYCxkYG/AzWTczv1Oq+B7n7u5iHSRbcrokBf8zV5UTl?=
 =?us-ascii?Q?sg/Hzpb/PQ9r+c9h4v2n8NgoFWC1lfH9eC4GUp5ZgfB1YPOXGKBI64fpk7B3?=
 =?us-ascii?Q?xLoSrgOWQbtvJ9TKFirtj5fy6w3UcBYXQC0obF/yVnLHOEKek769movFsufH?=
 =?us-ascii?Q?zoXP3aRrlVO6+cHG5CHaBOsGd6jMch2wDyNoYQvGWgaXa0E1KnfSch+/RQML?=
 =?us-ascii?Q?cl0/F3gDTQ0Hs5gWV/agTNWyjYC7qYqHbeRHvjWTOxA0BKSHFESgIPDAbySE?=
 =?us-ascii?Q?KkcPsmTYTDn5FVVbMJWoO1VuEl7gYp/93zCGhaUIlueiwtSzlDCVTLHKNxlo?=
 =?us-ascii?Q?Rv4M4VEYxIY5sc3qL39o7u9/rSYdxnc5Tt9Gh2DQ9iPIhdKx5oHxeTJDCj+w?=
 =?us-ascii?Q?6zjAt9aB74Ww+xpA//Kz/8NM6IV1HkU4xSs0YSkXF3+HYnGyQAZVtbOeeAYr?=
 =?us-ascii?Q?j+3LdpGQEFGJsKigrJdh8lwfchGKpPebF88Hrq2lnVE53Gs5EPYW/+N5q1Rn?=
 =?us-ascii?Q?6x3WrFDn2ZN9LIIvaqAYS9iB0oXxjrgsZj0IEtdH9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3ZTKVh1iaAAiTSq5JbnXfa81kOVY/fsdsxBMfiLnk3dIC/FNzM7rhuLe0g7?=
 =?us-ascii?Q?2lEUv0S8enAv06CktGPdFDIbUR4MgzP+KDUT2YIJ4mHmoe/Un9IP8N6bdumg?=
 =?us-ascii?Q?gBFbPVmnUtnmphb8N5i77Vy87tVMK8SlkYTFb/TVHnksdJOQWZ9mzMd9IQEd?=
 =?us-ascii?Q?V2USGMvl9NO1oU10IjLd9icYi6yMCbJE4S48/YMTHcqe8hYffzbiYMeJY7pw?=
 =?us-ascii?Q?8fbvKPT8BuNsACO9XJoDvcMC3qE5gDH6SjsB6ddSPrUWg6SKj8c4tjmQvy/h?=
 =?us-ascii?Q?+3aFgN3i+o4S6qbX6sm94UGGlmJ9Yz4ugKW3zlg9WCQ3Dh2R9XfL5+NigWAc?=
 =?us-ascii?Q?N8+0Bpi3IBJjM/oWN9Cd9L/m6/MRmSTG1VITsE/4I4lH6C8fi3+PoRGGeMGL?=
 =?us-ascii?Q?Z+BlDJ3WVhqHmXmEnTQIsFc0Bv27ufO8tf3ZFRouTwfougEjJww36/QH+8sF?=
 =?us-ascii?Q?w+QOdFSp+fSIhYTVrlIvB5XVotuoMEdcmEfb8RxRJ5wOPDVi5vdLdwylgU4Z?=
 =?us-ascii?Q?53iOmQPPWh6ueGUx6jbrxjuealD0gPRPHmW9t/1q3egXJXPdSgz09SPTj7EG?=
 =?us-ascii?Q?rz/8sRNygFbwIilSBapO2Ou4X0vGRc+a0QIGHFPYOA7Ek/x7W1I9yilinVxF?=
 =?us-ascii?Q?jZJlcMoel2y75AfM5AHbXmPnIpHoP55Xih3U+LrsKPsE8JtIk7apU3Dou7Mi?=
 =?us-ascii?Q?Relc4UdwjBeSbk1nJWmk/8TPxNx9gxidbUSXJeDkMgiSGlRXgAtScuxaMsJA?=
 =?us-ascii?Q?oHR7xVKTXIbLZThblyl08HnXiw/YbvQ0z10eT/5GbkDQungNfYqllGJGoxJP?=
 =?us-ascii?Q?ghvtw9MpB5SP6PAnTVQfGorbhojeeyAhg3pMKz/IT/FIIy7zaEPYjBHntmBA?=
 =?us-ascii?Q?MPYUJPnLoEWBj4hVD/DFfpe7TCJ1bFHjNNju7m6O7IPSJ+UmfTuUxqwhZt9/?=
 =?us-ascii?Q?1o5GivSfBoTW0xJBZFIJsbcoBtygGAabpYTQg58tQkRK0B/dVywyieOOpt5C?=
 =?us-ascii?Q?todBGQqRiDcZRutcbUe/cGV+itenCBuPlvMFya0+nk+PrgAuOaXNayjqxhcx?=
 =?us-ascii?Q?oBpWGTjQzHid307m+yuceXX8phYG3hjXlpL2Ty40iKY1tyJg5HnDXWDymAXi?=
 =?us-ascii?Q?PPV96EaEWjEXuPI3oLxMJgsfVlDD/0sUMhKjeKLx0WYxhckg9xlBiAKrELld?=
 =?us-ascii?Q?bZzEg5rCzQDd1SYneNBi4T4eHwx661DxquTkbiW1BxvzFP9KvKSbpiCLGJip?=
 =?us-ascii?Q?AnxOVztQs4fBvd3QIvS7sXkTSJHVDUi1OGIr1o6X+CmUTOZWT+1G0rPbC1Cp?=
 =?us-ascii?Q?VZdUAMn8Z5/x0KJ8SboYF35T0C6F4Dp3E9A/82uWf6wqDECGcihLaLFr0PuA?=
 =?us-ascii?Q?3MlVLcPvyG45iHab+xJjZU9hHfkKgiZOsYDsFxSilN7lNlhWf1PJOYe9hT/K?=
 =?us-ascii?Q?DhIMHZdk7X4Hs/fRAFkwQIvuNu+2TfdfWfB8f/ck9PFw0fusjb93k2Fi9l2N?=
 =?us-ascii?Q?ob14E+r+krVGBjnvbc6N4bG+6YSGDPkrc92B23pYRRNcRcEZSO9fIDdEtJTc?=
 =?us-ascii?Q?995zRkn/V6tQd4PVPAU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4dc786-dc01-4a43-16d4-08dc6486afd1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 17:48:01.9242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQITzOBEOJzfqrT5TIr4FVfc/8jb3CmADFTfIgCPwv0OwscU/VbHaHw9Xzi5WDyK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
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

On Wed, Apr 24, 2024 at 04:56:57PM +0000, Matthew Brost wrote:
> > What "meta data" is there for a SVA mapping? The entire page table is
> > an SVA.
> 
> If we have allocated memory for GPU page tables in the range,

This is encoded directly in the radix tree.

> if range
> has been invalidated, 

As I keep saying these ranges need sparsity, so you have to store
per-page in the radix tree if it is invalidated. There should be no
need for a per-range tracking.

> notifier seqno, 

? The mmu notifier infrastructure handles seqno. You need a mmu
notifier someplace that covers that SVA, or fractionally covers it,
but that is not tied to the PTEs.

> what type of mapping this is (SVA,
> BO, userptr, NULL)...

Which is back to a whole "SVA" type "vma" that covers the entire GPU
page table when you bind the mm in the first place.

> > > structure, along with pages returned from hmm_range_fault, are used to
> > > program the GPU PTEs.
> > 
> > Most likely pages returned from hmm_range_fault() can just be stored
> > directly in the page table's PTEs. I'd be surprised if you actually
> > need seperate storage. (ignoring some of the current issues with the
> > DMA API)
> In theory that could work but again practice this not how it is done.
> The "meta data" cover all the classes mapping mentioned above. Our PTE
> programming code needs to be handle all the different requirements of
> these specific classes in a single code path.

Which is back to my first thesis, this is all about trying to bolt on
an existing PTE scheme which is ill suited to the needs of SVA and
hmm_range_fault.

Jason
