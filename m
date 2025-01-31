Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CFA2382C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 01:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375CD10E0AE;
	Fri, 31 Jan 2025 00:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hg7kyGH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDA10E0AE;
 Fri, 31 Jan 2025 00:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHVxRaxdXReKPkblwI8TQ5Op8+o1UyK6jE52NE3e1LUQCWbpuj/D+Ssu+CLobNTmvuEaNABipL8rWHb9AjgH6BztTn7MNXBc/vPH+iGuYWFFkXoMdeU15Udw+gniovtVWJGJ7K16hF9MISQtDd2ApBaUhOCV9Kt+ltUnSmneUZTqxRMV2+6rB6c4OwG/fZfjH8oBI2CJR1te4EkTHTCfK64kqr6+2eNlZL9cafhgbZT9fDzrcRriyAdaVvT9VLMasUgy6pUoRwTjvezEBpiSTbuKVrGaBil/uMZ4B3Dq29NU9NZdsMvORY62ObfNMTOCL7WUYvwQKqtoB7Dk3rkvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRMdJJoA29B4ez05quMoQqpAns6LAzSkBykr/ZCenoc=;
 b=MywqGmXdEIsViXnuYmGRVHOCBCcfpgEZ3UmBaZf8QEmAshbb6U8NsGUb2wbbxsb4814OjaG/HB7fSS1pmBm7nmAhf2O8RzFcuBk2Z6b5hPCCyRFQRlE6UKaUSKivJ/3Jo30QLJC3ASRftZ98gJYmh1YCX+lo+V5MQToyP+6wx7IoIW5jY1ZYgkdYw8VAaTso3BDh11QLAt27HcpvPmPlf2ENAaQijJcJiCba5FXmcmvvW/hRpCMcKJr9qnTuZsVaTPlM9NVDsuhbhnLjRTRCnfhY79SelETdPE2c2ued+YkaWC/LQltTOJdRqUqrf6NHWjInlOX0zCiuoROAuSvoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRMdJJoA29B4ez05quMoQqpAns6LAzSkBykr/ZCenoc=;
 b=hg7kyGH7uyFGzks+sfb6PxikNGePzEfdyVrjRro0g2yWPNs/xFY9XuHbvaKP/be71AtgxZn2dP7hlp6Rj1F8sSsOEvavDY7ZPAj9mDN/KmLzJ1VKIRg1csJGvon05FnxesIIRZGczBVlxJE2klWeI4DlmXsmAjue5lLEyR1Hv7up0hFuOVvRtlKsUJA8EgDyyxcFyJv4JlZdfbx/Yg3ibGwQVzdHG6gMKvjB8qIJDYTX5eHjzZYCzeQrkkVUIOJlcErVR19oDmTFxjyHlHIzxACZjn7/leG+Jr/UT7muVGkR7pUCqxQLKewyr80bRsumcUc0TY3qyh2U8RGzHg0aiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.17; Fri, 31 Jan 2025 00:20:38 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 00:20:38 +0000
Date: Fri, 31 Jan 2025 11:20:33 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>, 
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <6moaipt4rmc62ijy2rtjbmzb5phgjpygxgqeic3bljydlwhxls@qqzuqbvs5gnh>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <Z5tXzV0vcKJg_wuM@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5tXzV0vcKJg_wuM@phenom.ffwll.local>
X-ClientProxiedBy: SY8PR01CA0010.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::34) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9ec5bf-430a-4775-1ab5-08dd418d1664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVGOXxcc/GuzkJrDlZn+swJTNIXoDx2QLNYnSvRBitXWfDH+C8R5bK8VHsu5?=
 =?us-ascii?Q?SPil/fnDB+/8oO7IFXYVhrGzez0JzgRLOuFIWQuPN37GBCGDnkCGm+PLV4ER?=
 =?us-ascii?Q?fb6A0A9FEdzXA212Mv9xpTu1ypgAiGXc8PGxCxPmFMFsdj0YY8gDx464yYlG?=
 =?us-ascii?Q?8Ct51ny66g7Ujkf2jbIJGDsAO4RE+CVAri3qaRInXwdGP7fO7NggjQhuJeW8?=
 =?us-ascii?Q?acXbQE6WPO10bVKGF6gPBx3mnPBMyrI+mdClu4coqpjaBY97Y2OPInj6d2J+?=
 =?us-ascii?Q?nIsUZ8GY+7pcfaWpikoa/QERr4QFWuipwpzzgT0lU2AgCkI4FLu2zhmnJ8Ls?=
 =?us-ascii?Q?sOoSFzE7dqOt2UK6ysMYWGqPBHPeOikX/exRyzbYyKNnUllqNi47c4WjjLw5?=
 =?us-ascii?Q?pslG6gFAJkt19VBpCOJ0tmZARHZKST2L5JEeoaunqmzEaVKzLJCPib8LQPxn?=
 =?us-ascii?Q?gsWujUv+3/gLyAfRUkp6yopWLw1RxTXkm9Sb1lgQ4gsqY23pb0G4DmpPSl+T?=
 =?us-ascii?Q?eeagnCYSS7vG2wPvHu2V1fdyxckob2H2OmVxBV5gg6fm1ILw1NUh2FdUAj1U?=
 =?us-ascii?Q?lq3x2NkcKkt7wtFODxID/r9tzQ2zOPhXTYUwWzd8JJ7/f9+MDG5+VEZTMxEW?=
 =?us-ascii?Q?qdf63ujRqzrEMs3b6HPQpKL1bfXRFUUUJo42A7i9ulsVQDlCOX83TjlfOEFK?=
 =?us-ascii?Q?IXlvcQ+gC3IVZOwTZ/+8NwOOx/ZsPpzKaq6S9pRpHiAOBhHCRI5MmQUmAMOo?=
 =?us-ascii?Q?Y4y51k++v250f6rdBwk4btpz4cUK8+cBVpkvPJvK7DARZfWal44fGuxJdw0P?=
 =?us-ascii?Q?73ZrlcyVW0lwBd32QgHh49107rO3DQfH0Em7UE1yew4WnstyJAut9xhZnIi9?=
 =?us-ascii?Q?BjBKZ7ZtTTeysaHXMZ+ms96mCXFREj36tR2iq0/huivKZnUjiBe609Pv6/Az?=
 =?us-ascii?Q?kOAp93TdBbF7MEjIRp8rFM711Khblvtd7Ota6NjXhvJLg0NXkLAgVFz197dm?=
 =?us-ascii?Q?CwOD5yiWm49DqF1oJIPmxP+xxsme/LsYejDpAxiO54BE1i8233yuMnIGmqQZ?=
 =?us-ascii?Q?OAxKTTR8v7YJhl4ppRPukt76aGTk0keNq/d1RSzIOSddfHxlCZ3VdprZuNh0?=
 =?us-ascii?Q?a/TLWcPxlJNvrmMDt9LERzzaywdRN+fPDdr1hXceCx+pmzZ63Ea+g/OicDmQ?=
 =?us-ascii?Q?UHa2hIUaNKBDzymELvY7Mbp8xd+oW7PTAh3ocnNc8yBgdjaMx+7AFkz3M3ya?=
 =?us-ascii?Q?fFPJsjc072tpZ3AKtHic8H8hZlje6K6H6LAKDN4KVuPl1BIebEugYobrm86k?=
 =?us-ascii?Q?o1fJl98K9AJ1Sd+pbb4dA/ofKnHPEIokSyjp8DeL3u8sCvEp2ArJy065MEmR?=
 =?us-ascii?Q?PnzXr0byQr74/4ZuxX8V20Y5ChTCMi0Z49dmfvSV+MjAYKMkGy29dgcXfygK?=
 =?us-ascii?Q?XeOuhc6BNzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LdDbuY3wsavjHUNC3HXJuOSLOjISN42B3CfpIUol6yO0uaVj5WdidxYPwSat?=
 =?us-ascii?Q?GN4mPJrPdmyIfCc/sZXVmdLSjtSk0SB35yZLmzc8ExxFxGnLNvcxIxMD4RMp?=
 =?us-ascii?Q?lreXubNC2aGp60eqskxWdMS2fCy7aHdkt9WcPaLNHMjcr9iGdcLEatsDjDsf?=
 =?us-ascii?Q?pu4TTeOhiOkX2twmGUGuIbAii58aVJDGWyoTvVG0HHkGizTlDBkSc1kqBgCz?=
 =?us-ascii?Q?Z2tCLFO7pKuu2RkTfTUFjYB8WKd1PeOJSZPXKaswMo2TTuUtNYoI0VxYdVUj?=
 =?us-ascii?Q?E4/+jpux5a29SuvtLmPqDJimsi3pN1lzOgOGcR3UeD8n9A+XdCe1qCphuIF0?=
 =?us-ascii?Q?0m5pqr0LVZhvO8Ch/8e5JHhpJqaNrAKscZ+jWcGt3Vr7EGfw5aIqoCmnJf42?=
 =?us-ascii?Q?Q8HfZXV5GkUP7PAGYYa2l5G/p0FG+nfAEZ7DkgYNCPAr5YqVp1sKlEe02HwP?=
 =?us-ascii?Q?sym3ptNJtyCI4L3natrQ09iIWw44IU8WAsMG+e3TYQAS6Pc7c1IaEZ956i9U?=
 =?us-ascii?Q?rqYH9tjFho6LbqwzY3l8TUgG7s5rqKYeTNh+uiaBsXLB6vZ6jGAfyyohJJdj?=
 =?us-ascii?Q?g8OAjGZ1zhYYmZgtCzHFN8PLBbgzQ1TUOPUpF6pzOjgo7OsuauqMByg3TcIX?=
 =?us-ascii?Q?i4EUzINBkw4XueRag5c24snWejhLnevX2B8wpqRHGmiUTITXdH8WmyEYloLb?=
 =?us-ascii?Q?wrh292iOVs34qdBMfjwe7BE4dKIsscLBW6R1O5msw9lW5bcZU26WW9ojEyPd?=
 =?us-ascii?Q?V+8WNeOQQXnYPyNxgjpuk68ezMig3QCU5yucohTx2W5cjBGEBTuJdBEmDvl9?=
 =?us-ascii?Q?8V6XKv3we22ldwEKrj/Z0uVGoKIq9ESUlmVhR54IL9ygWAeZCNpkGReDsHtW?=
 =?us-ascii?Q?30Hzkh9TQ6u4xOSQu9BpeJ5aj+f+JdPsdKSu2G1cvZi7l1cuzbWuE90tBx91?=
 =?us-ascii?Q?hoEz7VRJUR3lZgyZmrvtv0cLVijSzZC89YEyMIalFPEqvoCbGYNlCNMdRJlw?=
 =?us-ascii?Q?tKOnDdBWiFnqzUl0upoNr6eOJoZ+yJbAMo2/QY7BNGD5wjX3odRwKUXnp5nE?=
 =?us-ascii?Q?8VmYJdHaLOvEc9c76C2hqWn5FJ9FYFJ96ni2rirr4g4vP9pGnzIXJY8UPziZ?=
 =?us-ascii?Q?l5UnFxxumJHZ2WzYyvToFksqnbMEqAF28vdm6Sud6rl5IVnxQJK1ODLBChiP?=
 =?us-ascii?Q?zxZHUGCHiF8eDlSEpq3g0B3Dzu0u8X9FReGRIpMDpGTFp6FcfvWmxP4fBmD0?=
 =?us-ascii?Q?PmMj75PVpNvGRiyZVK2pBJLZaI95ATKpHYl4kaQCxMpf4woDvTucI8nGu1S2?=
 =?us-ascii?Q?5EQ3kkKRLTxQlsyTimD5fBMPHZaIsGe18RfivspGQmIFYrBfnIqVSrF8l40x?=
 =?us-ascii?Q?1PVwfAuLjb9ldowfX3F5ti9K93PHRSqiPdt7CW0sYPs2ROZ+bzm7hGlj5Gsm?=
 =?us-ascii?Q?Rv1T8LJ3zCt2cxLr9U9mzTXJ20ZtaYA6USbmF4qC2ypcG41dI0k+VQvjAjzr?=
 =?us-ascii?Q?u3wL6CSRmvfFwLzYQRvlOZ+KY9442H96GUYy4tuTJColS7Z0q9K8mMkBeMYZ?=
 =?us-ascii?Q?8KvFAJqd0tyO8Lz31aBq8Bzljslv7qhJUwgZJlv9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9ec5bf-430a-4775-1ab5-08dd418d1664
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 00:20:38.1491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdkrfGxBiXU1VgF5EweJLKEXJCL2sJLUdNwSR5dudQwRSZy82y/BZwphfkhjzOXNtMMDdCc33CCSKgJIx9LSHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

On Thu, Jan 30, 2025 at 11:43:25AM +0100, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 11:27:37AM +1100, Alistair Popple wrote:
> > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > Let's document how this function is to be used, and why the requirement
> > > for the folio lock might maybe be dropped in the future.
> > 
> > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > the GPU got a chance to make forward progress by mapping the page. Without it
> > the CPU could immediately invalidate the entry before the GPU had a chance to
> > retry the fault.
> > 
> > Obviously performance wise having such thrashing is terrible, so should
> > really be avoided by userspace, but the lock at least allowed such programs
> > to complete.
> 
> Imo this is not a legit use-case. If userspace concurrently (instead of
> clearly alternating) uses the same 4k page for gpu atomics and on the cpu,
> it just gets to keep the fallout.
> 
> Plus there's no guarantee that we hold the folio_lock long enough for the
> gpu to actually complete the atomic, so this isn't even really helping
> with forward progress even if this somehow would be a legit usecase.

Yes, agree it's not a legit real world use case. In practice though it was
useful for testing this and other driver code by thrashing to generate a lot
device/cpu faults and invalidations. Obviously "just for testing" is not a great
justification though, so if it's causing problems we could get rid of it.

> But this is also why thp is potentially an issue, because if thp
> constantly creates pmd entries that potentially causes false sharing and
> we do have thrashing that shouldn't happen.

Yeah, I don't we should extend this to thps.

 - Alistair

> -Sima
> 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >  mm/memory.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 46956994aaff..caaae8df11a9 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
> > >  }
> > >  #endif
> > >  
> > > +/**
> > > + * restore_exclusive_pte - Restore a device-exclusive entry
> > > + * @vma: VMA covering @address
> > > + * @folio: the mapped folio
> > > + * @page: the mapped folio page
> > > + * @address: the virtual address
> > > + * @ptep: PTE pointer into the locked page table mapping the folio page
> > > + * @orig_pte: PTE value at @ptep
> > > + *
> > > + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
> > > + *
> > > + * The folio and the page table must be locked, and MMU notifiers must have
> > > + * been called to invalidate any (exclusive) device mappings. In case of
> > > + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
> > > + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
> > > + *
> > > + * Locking the folio makes sure that anybody who just converted the PTE to
> > > + * a device-private entry can map it into the device, before unlocking it; so
> > > + * the folio lock prevents concurrent conversion to device-exclusive.
> > 
> > I don't quite follow this - a concurrent conversion would already fail
> > because the GUP in make_device_exclusive_range() would most likely cause
> > an unexpected reference during the migration. And if a migration entry
> > has already been installed for the device private PTE conversion then
> > make_device_exclusive_range() will skip it as a non-present entry anyway.
> > 
> > However s/device-private/device-exclusive/ makes sense - the intent was to allow
> > the device to map it before a call to restore_exclusive_pte() (ie. a CPU fault)
> > could convert it back to a normal PTE.
> > 
> > > + * TODO: the folio lock does not protect against all cases of concurrent
> > > + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
> > > + * must already use MMU notifiers to sync against any concurrent changes
> > 
> > Right. It's expected drivers are using MMU notifiers to keep page tables in
> > sync, same as for hmm_range_fault().
> > 
> > > + * Maybe the requirement for the folio lock can be dropped in the future.
> > > + */
> > >  static void restore_exclusive_pte(struct vm_area_struct *vma,
> > >  		struct folio *folio, struct page *page, unsigned long address,
> > >  		pte_t *ptep, pte_t orig_pte)
> > > -- 
> > > 2.48.1
> > > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
