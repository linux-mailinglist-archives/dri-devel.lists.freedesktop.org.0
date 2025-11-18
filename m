Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29818C67AD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C474C10E233;
	Tue, 18 Nov 2025 06:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C8qtTMdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8510E202;
 Tue, 18 Nov 2025 06:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTFGoSZO9sQal4i/6DxqX7Bf+QzkPHdqPa9PZz7zpKAEoHSPTE5PGhi4fNyOcLEsYn2OU4n58b/OQ945yP/M+WLEIW/45XCXTbr9RCKYN/BSReue4RRd9Y/BbhuOs8QxpzKnqKvSgQlD7EFzuwKNRrNCDPxaxSg1/DlI145sb00B5xkPAd9/a7DylmrwIbquheObTOptR3zhrM+vRwukibGL3ejncW2z/DFLnLNZRKFeHCQPR8BYUHqYUsJk6bX8UFak+6/vGsfDF09jrODoGgQZ8viHykda0CEUfmycvyOTHj938LiG8iJe4B2kn071v4sl9quRFlFZKw/iDaNVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM8dnmt0KCStX9c9hnUgHlLSWBfEy4Eps3VeCh7ku+I=;
 b=Pe0SXbXjJ0+Qgoepl0P1RJjakIyuYk+ObN8ln/qJ7OQD6CB81g50lIkHPcN8flallJo9uw7Gn+Qg3Dt7H6R2+2fLW0aCSzxRL7RHDEdpK7q2FSZS0mLXIyEnzbyn0fHNw16/S+aArxd2PVV6rWFl9uD5RisPQhaQV8b6onla3UCVxfREa25m4kD6RDmq8zTqHXOrEH2N9BMEhjde1yBtrn8WbEYGozxu3uVmZfh9XGXedtbFYdeskp58/ka6RX+/72YkB7uCe6yzwYdxeU+ACv1nWP3Uzef+M6oDbf5QBm0KZj3Kj+WBmklYIDQd9R6TKNGbj9xVIch5AK/4GuFhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM8dnmt0KCStX9c9hnUgHlLSWBfEy4Eps3VeCh7ku+I=;
 b=C8qtTMdZwGG2EyOR5bv7LBXBm6oJUVxFTmDVDsb7kuOU1cKRPoUsPzLvCoMFz/lkmk7T3uFoH9Je4E/FVZ1zBqfpeoTQtsxLMuQrhOSCt0u/R0f6WJPYZKIScRazP7pK1hMqZ8jW8OGvCoevc2On3tfAiFbcImB5xEyX8auZOeRpq2WPiKjB1Da09yKc+weQ6Pn5dbkuyerdbT5wdNZ1cTePNKCOSeGejgjyvN9EcM+JZ82DECOmrpkitBJxRpIneOFa3QtRYpA0lvSi4kjvjMFIsEdktdE/2eHtQn5t5ZyQRFUZ7Aqq7CWJZ+90zBTgyI2vfu/ilXueGAIC45QiPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6433.namprd12.prod.outlook.com (2603:10b6:208:3af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 18 Nov
 2025 06:15:52 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 06:15:52 +0000
Date: Tue, 18 Nov 2025 17:15:47 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 felix.kuehling@amd.com, Matthew Brost <matthew.brost@intel.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal" <michal.mrozek@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 00/17] Dynamic drm_pagemaps and Initial multi-device SVM
Message-ID: <gdveezxmqazqdyuyy6kpca7kfppxkackmcms6xrfcya2acqzat@jd2yjghp5bcm>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SY5P282CA0019.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: c867532d-0d15-4156-74a2-08de2669ecbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5wnc+RHM3QPT1ZMs8HStnvJ8nvBi7JE94uEGMQMlw4ldD4y/hTPZTjx8Ss?=
 =?iso-8859-1?Q?KOZJyOSJ/WXgFsN2VDX/lPduPjaYdezuMWCiF3buYuajvmqGnNT4fFWtSO?=
 =?iso-8859-1?Q?vmqImCKnt/I6f7SiRczRY1+IlNDKetJo9NZRPdyOB82od/6Ypt9WhVrOWw?=
 =?iso-8859-1?Q?P4EREDM+PfxyyY3d7SPPydI+YFU+tuPtyAKg4cQ4CQfFq9MLagBB+MDJSD?=
 =?iso-8859-1?Q?qN2aqqZjRXbJfGTOktKgq9p6F4lTXu5sgt5CuJG1Ws9C6AOpvNNgGK6PIj?=
 =?iso-8859-1?Q?dwRnjFMXPOuZ1WF/+rswaTNqxSoeSt/8/qPdG/hYn/7CWl2MTzUg1+Lf+C?=
 =?iso-8859-1?Q?EidYmvNnK5yoYe6+UAzYBGMZv2ciMdrzTAaaJges/FqjmBMmudzzleiQMb?=
 =?iso-8859-1?Q?97M2pPZiprQEoiIOBnRBgtFYYctH7sqCs4bPm/9GunvAm7Lu0A3XU/cqL2?=
 =?iso-8859-1?Q?CSIqd1w2xUZVGGHpQfZhSxjTT+QNozRoEPHziFreUXY0vNMpyYvUThB7Rb?=
 =?iso-8859-1?Q?7nmDLBxHFe2wFFe+1f5tPzZCsvio9EPop+Bq8NlkSFcrXUke2T9kCULDnB?=
 =?iso-8859-1?Q?o0oe/APxpso68XrPF6LPnEhWLmVQBHBYXp18IjT8VKK3el7mmtuz47UVEI?=
 =?iso-8859-1?Q?0WAmPHlwf3vSvAeA7fVc9Dix5O2gYIosR5OF6QqvwnUCE3L+VuLPXgGsL8?=
 =?iso-8859-1?Q?gHjZ6hc5lrdgTt+Ce6ndeqzuo3OeZocICohSHqFXB3HdDFMP30rc0u/qkw?=
 =?iso-8859-1?Q?6vvsTgZvtORa9zEEDobaxdMmESjkdCXJWqMiIfckBf+/keDXmgah28WRvy?=
 =?iso-8859-1?Q?Lv5EpBADACZpbVtAPkmG/lErPDDCzoBf3r060iWzGOdASkQvLu72a/nUNk?=
 =?iso-8859-1?Q?sCGLyGaLGfCAmRQGuGml0PoxwaQFVR1d4oC0JozHcGYng1wKNM1MUr89MR?=
 =?iso-8859-1?Q?i4ZgLP4cjKWBbwR38aNaNMZzMVwFa8suzl8cnkpbINLUnwaG2vo9cF1ybT?=
 =?iso-8859-1?Q?rwXyEnCaz6A/oHbhw0xqLMMyjR8fWvZsUVV4cKTGHQjhSOlBmOgrtKX7WT?=
 =?iso-8859-1?Q?Fpaqavk479ZeCfuKhQFp1hQQZQ3J+7LyiaeKm1T2+zgYy+G4j8HotnVJgK?=
 =?iso-8859-1?Q?yN5FWHbfvg2Z2O0AfwL544jF3qVslKD0ZZAthmneZxX1XS8KEDJrc++Q4c?=
 =?iso-8859-1?Q?H6fg2ekq6Eump8glagxy56WzDZlINFbjeV7SUa4MTjeZ5wPniOXqDQPB4f?=
 =?iso-8859-1?Q?RtokIO+BoFdH352VQFr2G5ILHMCjdVn2worR+VZAl4kOOvyScGn1AOxOOG?=
 =?iso-8859-1?Q?Z4V7WLneI4wEpD3YLCEcwe8mmHtT44TWzOY9oOJ8/FOv/GdC4T1TdG8e5m?=
 =?iso-8859-1?Q?lnUrky3fNMeapvu2HBweHLzb3ZeMiJn4nD5jz2xlXSgt64wXK++UVTtcWC?=
 =?iso-8859-1?Q?ZPBj2aJf8KkofmT+33FO6t8rKWM6nCmvymK0YSSCDUkDnT/OB6tx3NBAq8?=
 =?iso-8859-1?Q?AHbPy9N6mgf5FO4tnoNvtC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zRsflFcTrrKl1AHAXkXgXc5N/2zyfHbc9dXChrEyYdgZ4tnbW2Biw8qUq+?=
 =?iso-8859-1?Q?l1juVbzz4WhKY9DxNcwNJ1VlGj4vC+/c0BWBl98A99+XdbT4iH96avAQh2?=
 =?iso-8859-1?Q?VsQJhiSLjAKow4OravDY85t19pOjXTJGwt3m2UVT//re3Ns7LxXMs0XQeV?=
 =?iso-8859-1?Q?jcLsHPtq3FKWqk9VbvXBrdtpGz1nu1HVmOOpUWqMCqQakPNZkxuWVHQHSv?=
 =?iso-8859-1?Q?tGYrD8NkSOK1dUL7to3H/Z39f1FZIF3xc3JjX4Au5vjIKl1vGlcNUHxnzo?=
 =?iso-8859-1?Q?humiC/U1gmion/yQdDalhGVt+fxkv9I4zCSwSYUMQhuPqqHws/DQoGQ6I1?=
 =?iso-8859-1?Q?p/oXvnlc1/ZzEN9ZjnqQPo3rQQ7AffWO2h9PuH+w4b0uiIGmNu4Qoohih5?=
 =?iso-8859-1?Q?FsZcBz3e3pOeNOUwwuMGAl2bLj1askDlQL2RkblsW/QEbH39XKGGDVwunI?=
 =?iso-8859-1?Q?YZp2ffpOtGXDhKppjCnoPo4oc8690KSkVTB3ahjdAKHiJOoX45jqKZRrHf?=
 =?iso-8859-1?Q?SdrO1yZrjzalDKbQGsvHIAILMacMa65w5ZWQIM2bksGzae4OCS9LOqU9mq?=
 =?iso-8859-1?Q?kbhHpdiZKXdV4jXknXnX5mAF9SzkcVIjSgrvVrQBqoYLOHN+IlTWlcTeDj?=
 =?iso-8859-1?Q?7KmIZE8ELr3u2S7/M5MxmtaPyO9meew70u1HNjPUp3OZeUkjEVxJEMz3sM?=
 =?iso-8859-1?Q?OTIoggEDOf60gPcVfUdot6bvHOZtoHyMz7u8b/uei6aTy1MJ1cE7wywE11?=
 =?iso-8859-1?Q?xWZ/poLeub9lHMPd2IjmJTzUnCWK4Mb/Xw6TGPQtJCOb0BzgLODFCiP1F0?=
 =?iso-8859-1?Q?pqE1UL+P4LECJ2A4ISQhjQADK8Y6mEp2y9fSJEKO4c7rF+Hw1B+eUiIbiq?=
 =?iso-8859-1?Q?fTVjJ0PlCgGNLE7oDjnEzOoFBEzTC7O4jJqFC+mpQkb7AkdzOQ1FV5XVXY?=
 =?iso-8859-1?Q?r/i+7brTw8mogeYvpE3BX6azNims3c20qaNCBGk7U1nCvfO9tgDJeJVt50?=
 =?iso-8859-1?Q?He6VlyXVY2jly/IZt6As2hzEHiC7fmjTu3jL0KFXn3vR4Gm+WrvraxuJUp?=
 =?iso-8859-1?Q?pg8V5NWkOp2/9PKlZHza8k4t5Bc/Sc9qswiVlZ16eoBzw+uSvDHnUnMQuT?=
 =?iso-8859-1?Q?BAw3R8xoWY3iLqle63PIphdRXtvWksI1G9fgBrEx+6kDgQ1KCyMg4X00kj?=
 =?iso-8859-1?Q?Q5g1UfuSG0I/F2JAkR8C/fJki4lTmVW6Pn+08+zLfq+81aNlGF3SGYy7DE?=
 =?iso-8859-1?Q?jOCZ64Nc5ckyixCr3xSL17EIaHYEsNju5VMbRzkDRBAgrhoG5KdVesz0rT?=
 =?iso-8859-1?Q?M940iOue1EJSDjlCVcIOR743hb9iUSmTYg0OPI/vVfy6/IYUNHwb8WrIbG?=
 =?iso-8859-1?Q?H+DvBv3guA9oezpT6m4mioEOCdCripIS3L6NjUeRt6BU++np6/pUDacn+W?=
 =?iso-8859-1?Q?p1j6X6daHhKjPuAFeQeE5uuOrk7do6scVsDsCgPZrbLsG8dpHiKq569QHw?=
 =?iso-8859-1?Q?kZs2IUSLOp/e5eu4bkX20vIBJY9lEkb02cbbzXE0EC2nGyfWVXh0kbY/xq?=
 =?iso-8859-1?Q?w2R4E0aKwomyLw8VXudgcDsEkeBXsN0+AXyqzHQX/khee71BaZWR6a66Qu?=
 =?iso-8859-1?Q?ZzIvr9G+aA0bogUjaGLQxhDunOeS+lvo8z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c867532d-0d15-4156-74a2-08de2669ecbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:15:52.2648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XY97MDzjdwD8Fx6LJveLZ4m87PyLBjvwfvAvh3lMAAdapP2aFaXnO1ZwSxE8J07vFmhvsQXSY889okfFxErBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6433
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

On 2025-11-12 at 03:43 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> This series aims at providing an initial implementation of multi-device
> SVM, where communitcation with peers (migration and direct execution out
> of peer memory) uses some form of fast interconnect. In this series
> we're using pcie p2p.
> 
> In a multi-device environment, the struct pages for device-private memory
> (the dev_pagemap) may take up a significant amount of system memory. We
> therefore want to provide a means of revoking / removing the dev_pagemaps
> not in use. In particular when a device is offlined, we want to block
> migrating *to* the device memory and migrate data already existing in the
> devices memory to system. The dev_pagemap then becomes unused and can be
> removed.
> 
> Removing and setting up a large dev_pagemap is also quite time-consuming,
> so removal of unused dev_pagemaps only happens on system memory pressure
> using a shrinker.

Agree it is quite time-consuming, we have run into this problem as well
including with the pcie p2p dma pages. On the mm side I've started looking
at if/how we can remove the need for struct pages at all for supporting this.
Doesn't help you at all now of course, but hopefully one day we can avoid the
need for this. I will be discussing this at LPC if you happen to be there.

 - Alistair

> Patch 1 is a small debug printout fix.
> Patches 2-7 deals with dynamic drm_pagemaps as described above.
> Patches 8-12 adds infrastructure to handle remote drm_pagemaps with
> fast interconnects.
> Patch 13 extends the xe madvise() UAPI to handle remote drm_pagemaps.
> Patch 14 adds a pcie-p2p dma SVM interconnect to the xe driver.
> Patch 15 adds some SVM-related debug printouts for xe.
> Patch 16 adds direct interconnect migration.
> Patch 17 adds some documentation.
> 
> What's still missing is implementation of migration policies.
> That will be implemented in follow-up series. 
> 
> v2:
> - Address review comments from Matt Brost.
> - Fix compilation issues reported by automated testing
> - Add patch 1, 17.
> - What's now patch 16 was extended to support p2p migration.
> 
> Thomas Hellström (17):
>   drm/xe/svm: Fix a debug printout
>   drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
>   drm/pagemap: Add a refcounted drm_pagemap backpointer to struct
>     drm_pagemap_zdd
>   drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
>   drm/pagemap: Add a drm_pagemap cache and shrinker
>   drm/xe: Use the drm_pagemap cache and shrinker
>   drm/pagemap: Remove the drm_pagemap_create() interface
>   drm/pagemap_util: Add a utility to assign an owner to a set of
>     interconnected gpus
>   drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
>   drm/xe: Pass a drm_pagemap pointer around with the memory advise
>     attributes
>   drm/xe: Use the vma attibute drm_pagemap to select where to migrate
>   drm/xe: Simplify madvise_preferred_mem_loc()
>   drm/xe/uapi: Extend the madvise functionality to support foreign
>     pagemap placement for svm
>   drm/xe: Support pcie p2p dma as a fast interconnect
>   drm/xe/vm: Add a couple of VM debug printouts
>   drm/pagemap, drm/xe: Support migration over interconnect
>   drm/xe/svm: Document how xe keeps drm_pagemap references
> 
>  drivers/gpu/drm/Makefile             |   3 +-
>  drivers/gpu/drm/drm_gpusvm.c         |   4 +-
>  drivers/gpu/drm/drm_pagemap.c        | 354 ++++++++++++---
>  drivers/gpu/drm/drm_pagemap_util.c   | 568 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  20 +
>  drivers/gpu/drm/xe/xe_device.h       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_svm.c          | 631 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_svm.h          |  82 +++-
>  drivers/gpu/drm/xe/xe_tile.c         |  34 +-
>  drivers/gpu/drm/xe/xe_tile.h         |  21 +
>  drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
>  drivers/gpu/drm/xe/xe_vm.c           |  65 ++-
>  drivers/gpu/drm/xe/xe_vm.h           |   1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 106 ++++-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
>  drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
>  include/drm/drm_pagemap.h            |  91 +++-
>  include/drm/drm_pagemap_util.h       |  92 ++++
>  include/uapi/drm/xe_drm.h            |  18 +-
>  20 files changed, 1898 insertions(+), 237 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 
> -- 
> 2.51.1
> 
