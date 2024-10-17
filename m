Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD039A1959
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4D110E2E9;
	Thu, 17 Oct 2024 03:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KMXt8AqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0410E2E9;
 Thu, 17 Oct 2024 03:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o20L+B0FJWPczSv54aFbVXSLUxc4xmXc1sM8hYysNoBoH94/iHhHfvUUzt+c6DUhD8j6g3f2IDFVIPLSGyPM8sHB5ByVeUUcZ0anYh2JLdp61MChHKzd5RwZYKuw04nwG+G+AWaAcnWx3a/RdthIphVA8dHEVT8ewX1s+mxT1a0GP4qZhkRkXV1/Iu30Z8HfG9Ruf7atEa+dDbSrgqxNJRgHun06umkArKfnJcPl0+XAmMyQObXfYnieTQb7YCZL+UndP2n/wXBxBMH+t1RkbgLn3n1SacgMZRgmQyTPC6KrW19NAaGwy9ZYY6tKoRdkuJRIYorM9Ootfs851Paz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaCPJ707hWBNpEpEMPz6JqiO6UPFhzyBdjEc+lqdj10=;
 b=lsxIszkXA/DOfMgI2Adh51ooYmEGnF4MeeawEXvUHz2UGvrHGabbgy2eW/xE2ftrJb3tNJGiCudGOXIToeD9A01mc8HS0bACswPZ60Aw96ibvXEbGVuaOmenH66yI+bhtKGiSyRawo/npkuWyBkhPfWLmQdaD2FsZWSmOhKlGbAD+2H40zmyzWEO3210LviE72n3/1EMzXdJaIj6WdA3+W7tqYNTFyecggOdOvlFeKgpuPlviPiwGFq9D/1yYdf9YGaSg9hqu8oeq8b54YseFrlOSIVTENJBaPeyN6O8OMp6G3TuKasBRsSTEldHWzIpJm3qzOe3s+M0gbjhJP1BXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaCPJ707hWBNpEpEMPz6JqiO6UPFhzyBdjEc+lqdj10=;
 b=KMXt8AqNZwGv2hA4w8IwNK8Q7NWe7t+Pqt+zoCFgyDBs8Gn/3QnnyXvBok3O4errXUfRozgGTHrWCdLaIV5r31qDE2J6DkyLdvjq3uosE7E4GbqmL5nVVdfuU5s9BnRbH5d/l/NNLKRTs5FQJnTERukYCEIhhgLX+9QlyC7urAcv3b94EMUKKEgOv+y7CsDmbaDsLEjhxzjFWisK2/uqtHW+dSvH1X/vU2rhf5H6WD5FWpZ+FfMcD167GuadULK5dOBaWUS/jC2DINnXV9rD6M63SgkF/3X/2jhe9jNZXcBCva9ON2gQBD1rqUCh+a6f2Ood0ORvHoQGGLiBEaetGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Thu, 17 Oct
 2024 03:35:58 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 03:35:58 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Thu, 17 Oct 2024 14:21:13 +1100
In-reply-to: <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
Message-ID: <874j5bo0yu.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0099.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d9541d-07ff-4ce7-c8d6-08dcee5cd04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6AzaJiLfMGpLHA7EyMbxBtPzubzAV2esaVTn+XyxESE5MKWXSIea6IsQk/vk?=
 =?us-ascii?Q?OflADCp7MGQ5nzDsDD+j7Jodp8lpot5+dDZ8wOX3Dow5D92JsWcym+Jpk57U?=
 =?us-ascii?Q?xSKwSdJSugjEQbF+Rs5uUr0L1rnNL69R5Ly4As/lQ/c1IKq+JZ6pl8thvKhm?=
 =?us-ascii?Q?T4ECbP6IkR3cWb5t4idaHntRhvTpnxI1gBGkvJXecceUaAP0CZxoVSA/r4nm?=
 =?us-ascii?Q?KBSPQG1tofJB/J5N4z4Kwg/Dc1VAaPFQKJ5iW4ynYW8+qWCtlhutI+dnxDNn?=
 =?us-ascii?Q?dP+PWTfcqXQ7Ri5pdr7vsI7TyWfShPLvJu73pQPxlq+QBeTBozBvaN/cC4a/?=
 =?us-ascii?Q?CfdP/EpfKcXttiUFdIZbqIRYS2qOof1C3E60K2swRG++sEsnFqrjZy63pmFZ?=
 =?us-ascii?Q?uXr9zXbIRzXoq477yR6iHTnk4TkRZn5jN+BOPYAqsVpWV6AjXck9XjUu0Aee?=
 =?us-ascii?Q?T2drNi1o2xcOLS0o32TLkWSR4TF+1jLBdwr7HGKv0UV1T71NgnG8nOv8WULD?=
 =?us-ascii?Q?uGCJsWMcDWi5mRmhKjWJigYgCPR4xfHnEuKdNChUVub3s0H+XyEPUUfy6daI?=
 =?us-ascii?Q?coKF0VskJh7tGYnM+aD3q7lu169mbE9WB6zs9G5R6LcTRHb+ve5UgfsvUgRU?=
 =?us-ascii?Q?6LUTFX67XBhcAYGXZHT1GyhbwYFdx6tgOmYdrBYRA2lOpXy4qrHh0/IcdqCa?=
 =?us-ascii?Q?8Cv08gdJAtx+icA8VQa2vduYyYzGNtBW2CGZvPPkWAtu1441Ao7JDDKNDhUv?=
 =?us-ascii?Q?CIfbw0TrIZHz2/s6unhx1DHS79IFkEp2uiespC6rXkulRY9FRhZxkcSAjFNv?=
 =?us-ascii?Q?6hkweVYzPCbcqPST+FQN2xUfNljsZBUdouIIFSvgs2cLEXeu2KdkUhru1DoV?=
 =?us-ascii?Q?qVeQHprEm1DL5kL9UadnW6dvcmT4VbqFpIpeMEoAIRbYCv8uvLacFdvQG3og?=
 =?us-ascii?Q?/z6sW2GBWbhLI+TdUft0MgUwdHvEOxDbRP8Po+XJvuVjCTkq46EBau0Q2F1V?=
 =?us-ascii?Q?b7RQaGmva7kLkmuEZAPgC6vShGe8gVN4+o3MhSrfa6ojWjk74vD7aA0weNpD?=
 =?us-ascii?Q?0/OchTpSJJOUlZ93c+EobCmopu4jXg5bWS5nS2rV7iF5xixPZ+DfCFMC9uwR?=
 =?us-ascii?Q?osQq8mTJxBq4anpeUqSxvQWDmNN3YcCvWUBLiMD3F+UuBd8dGr2v++rpFgh7?=
 =?us-ascii?Q?OrrsbP8CYHDaiVX88NK+FdAxb0W5z1yhfMSIlD5VtEqTVRWWvHUrOF5cSoaB?=
 =?us-ascii?Q?xXgan5aWd4HZX05y4jIQ/WvH65Sptg2H1VlNlYfFVxjK6FYNEJaF5NwBC/gk?=
 =?us-ascii?Q?oOggLvHMTQzLEYRRTsuwu9f/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DnNp19NFwJXb313pDLL9TUei+uTdxhRmEW/0uBBwx4yTRLDk8Nm02bfZ70ik?=
 =?us-ascii?Q?nrkXKwxMOKZ1TtsqO7EIBmCZdy8T6QnRxLQmC3XmDJz76ve/QfwK0MsMn795?=
 =?us-ascii?Q?qABdlJPvQQ0j4DWJi4Wq7yeJ55QlOvZR8c1F/XI4B/wo1WrY2GZ9wtI9JWqZ?=
 =?us-ascii?Q?U1pXDbEdJk2hiGvXIAJWlWgvPFEEn/mzcaWhWeOe+Vk5r0CZI4nrjqmOChm+?=
 =?us-ascii?Q?jJ8xo69/dKt9RFHyeFBGfz1rMpEo24qyCVCZNCS8J79/EaLqUet/ENnf18gf?=
 =?us-ascii?Q?b1nM0WIEtLozV6I/dqPYZFP9eKXRHmg0eCpK2S4cbXtCTJVM5C93nI7iAhUE?=
 =?us-ascii?Q?QLW+z6UEPqmgmSO4shGLGtUEP491Cel79giqkwk/S/rhpU0Xv9o+4zGlLvNb?=
 =?us-ascii?Q?ZNVadjNboEaJRGr0GTGEE5BRMCnpZqRPEX+EHXR/fFMWWkE1SkcbO9J/6Fd3?=
 =?us-ascii?Q?sYl4EyEZfltge26HdVwrM4bCgu/nPAn6q95lO4rL+xjgTVLs7PnjORQ6yz2v?=
 =?us-ascii?Q?5bHu/rYfK51Nyi6swTbF1vsuQc/jHywQSH5mpf87+7fF5SQnyGNUeekUTmrU?=
 =?us-ascii?Q?QLoPVdmmmTtwpf0t5vL/FZcrsJZeZy5KwrtWYH0bthn1Wa9zk3C02eGivz20?=
 =?us-ascii?Q?6uTp9DZoY9I/5Yq0aLzkO3I2lH5bz2YxwXnhScZWhsXCfbLLW8jwXGIRw9z7?=
 =?us-ascii?Q?v2/ndewrZQa1ixzuRI+A+q+8UIu6OAJmpMRTKK0IzR4OO3fNJK/sJq9Yqai7?=
 =?us-ascii?Q?xiw8KXY9zpxYDoXVIkdu56ciYlhffoaGlMdfmXn868yfJUWXDvL2cdo+as75?=
 =?us-ascii?Q?fSDnOJwTX2j6cmK+L92nRXmUNQvIDD2sYDSr2KFKf+28C6MxorGJrs4/ppga?=
 =?us-ascii?Q?Dnzuz4/CdyWeELurgl2agu0DSPkfJ1EnM04lse7nmnbtScUEUUzW3+BAgv1m?=
 =?us-ascii?Q?m0F/VX9mYnQ5jCX7sVlUoR2tFYedA0H9Y2nbQM4TCSZY9FRbiJUCWUYYRR0h?=
 =?us-ascii?Q?NjV7UktS5k7jJ8uzBu3S+onMKSceW890EJMW1R3mYaqMlQ7+Kwk/hCEUyczm?=
 =?us-ascii?Q?FL0HMLib92dYZzq4+OOrF4C7YxoY69KS3ge/xd9cR03HypuBUl2Cb8YTFya/?=
 =?us-ascii?Q?4h5ZJgcdkhrDb8k+03s+Tnk8EuWOEvKtt7IbXX4U9aKZaA4zvjGtO1ZKZ5Pd?=
 =?us-ascii?Q?LvbHPwFW7vDosBHPUqrijO/2fmy7rqMCNqoaQooEQiweyjQvPrsnZBupmPm7?=
 =?us-ascii?Q?XyhHuqQeQ2vHVNZeMommcrliNPx4qPwlKDIZ9nZEwdCQVCj6IxUbCmC/k5pD?=
 =?us-ascii?Q?nCLOK2u0DmWR7MEe7GITv1fo4YdTQR2OqO5Dr+spn72LJFPdlUxHNC9aW8qc?=
 =?us-ascii?Q?CJRtgwQlIlNAS5cpJNkRBEFNYJyX0WBPq5TA6heDwjxuTonk8qetiDEseg6m?=
 =?us-ascii?Q?mvkFpr+sjy2fhjI6BwCMzzXM9LY/liP4f75xcsgufj770Ey/HapTRdTV8mDa?=
 =?us-ascii?Q?ukv7EzS2in63wGhPoWyEKsU/TB258wDIVxM2x8RBadgmnydO+4umz9KM4V2W?=
 =?us-ascii?Q?oN/40OyC4VwcEcFESBXrRl7EhSXef8Xyv6dA4FPP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d9541d-07ff-4ce7-c8d6-08dcee5cd04a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 03:35:57.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i65gm0ZqXuZAJITfjbPFER8QXmuZbhPOIzrxRg6W4H66b/a/eVtXi684jbIrRkAYtWJM7XJPHih9EkjFvTWgxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
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


Matthew Brost <matthew.brost@intel.com> writes:

> On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>> 
>> Matthew Brost <matthew.brost@intel.com> writes:
>> 
>> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>> 
>> [...]
>> 
>> >> > > +{
>> >> > > +	unsigned long i;
>> >> > > +
>> >> > > +	for (i = 0; i < npages; i++) {
>> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> >> > > +
>> >> > > +		if (!get_page_unless_zero(page)) {
>> >> > > +			src_pfns[i] = 0;
>> >> > > +			continue;
>> >> > > +		}
>> >> > > +
>> >> > > +		if (!trylock_page(page)) {
>> >> > > +			src_pfns[i] = 0;
>> >> > > +			put_page(page);
>> >> > > +			continue;
>> >> > > +		}
>> >> > > +
>> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> >> > 
>> >> > This needs to be converted to use a folio like
>> >> > migrate_device_range(). But more importantly this should be split out as
>> >> > a function that both migrate_device_range() and this function can call
>> >> > given this bit is identical.
>> >> > 
>> >> 
>> >> Missed the folio conversion and agree a helper shared between this
>> >> function and migrate_device_range would be a good idea. Let add that.
>> >> 
>> >
>> > Alistair,
>> >
>> > Ok, I think now I want to go slightly different direction here to give
>> > GPUSVM a bit more control over several eviction scenarios.
>> >
>> > What if I exported the helper discussed above, e.g.,
>> >
>> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>> >  906 {
>> >  907         struct folio *folio;
>> >  908
>> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>> >  910         if (!folio)
>> >  911                 return 0;
>> >  912
>> >  913         if (!folio_trylock(folio)) {
>> >  914                 folio_put(folio);
>> >  915                 return 0;
>> >  916         }
>> >  917
>> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> >  919 }
>> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>> >
>> > And then also export migrate_device_unmap.
>> >
>> > The usage here would be let a driver collect the device pages in virtual
>> > address range via hmm_range_fault, lock device pages under notifier
>> > lock ensuring device pages are valid, drop the notifier lock and call
>> > migrate_device_unmap.
>> 
>> I'm still working through this series but that seems a bit dubious, the
>> locking here is pretty subtle and easy to get wrong so seeing some code
>> would help me a lot in understanding what you're suggesting.
>>
>
> For sure locking in tricky, my mistake on not working through this
> before sending out the next rev but it came to mind after sending +
> regarding some late feedback from Thomas about using hmm for eviction
> [2]. His suggestion of using hmm_range_fault to trigger migration
> doesn't work for coherent pages, while something like below does.
>
> [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>
> Here is a snippet I have locally which seems to work.
>
> 2024 retry:
> 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> 2026         hmm_range.hmm_pfns = src;
> 2027
> 2028         while (true) {
> 2029                 mmap_read_lock(mm);
> 2030                 err = hmm_range_fault(&hmm_range);
> 2031                 mmap_read_unlock(mm);
> 2032                 if (err == -EBUSY) {
> 2033                         if (time_after(jiffies, timeout))
> 2034                                 break;
> 2035
> 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> 2037                         continue;
> 2038                 }
> 2039                 break;
> 2040         }
> 2041         if (err)
> 2042                 goto err_put;
> 2043
> 2044         drm_gpusvm_notifier_lock(gpusvm);
> 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> 2047                 memset(src, 0, sizeof(*src) * npages);
> 2048                 goto retry;
> 2049         }
> 2050         for (i = 0; i < npages; ++i) {
> 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> 2052
> 2053                 if (page && (is_device_private_page(page) ||
> 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> 2056                 else
> 2057                         src[i] = 0;
> 2058                 if (src[i])
> 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> 2060         }
> 2061         drm_gpusvm_notifier_unlock(gpusvm);

Practically for eviction isn't this much the same as calling
migrate_vma_setup()? And also for eviction as Sima mentioned you
probably shouldn't be looking at mm/vma structs.

> 2063         migrate_device_unmap(src, npages, NULL);
> ...
> 2101         migrate_device_pages(src, dst, npages);
> 2102         migrate_device_finalize(src, dst, npages);
>
>
>> > Sima has strongly suggested avoiding a CPUVMA
>> > lookup during eviction cases and this would let me fixup
>> > drm_gpusvm_range_evict in [1] to avoid this.
>> 
>> That sounds reasonable but for context do you have a link to the
>> comments/discussion on this? I couldn't readily find it, but I may have
>> just missed it.
>> 
>
> See in [4], search for '2. eviction' comment from sima.

Thanks for pointing that out. For reference here's Sima's comment:

> 2. eviction
> 
> Requirements much like migrate_to_ram, because otherwise we break the
> migration gurantee:
> 
> - Only looking at physical memory datastructures and locks, no looking at
>   mm/vma structs or relying on those being locked. We rely entirely on
>   reverse maps from try_to_migrate to find all the mappings on both cpu
>   and gpu side (cpu only zone device swap or migration pte entries ofc).

I also very much agree with this. That's basically why I added
migrate_device_range(), so that we can forcibly evict pages when the
driver needs them freed (eg. driver unload, low memory, etc.). In
general it is impossible to guarantee eviction og all pages using just
hmm_range_fault().

> [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>
>> > It would also make the function exported in this patch unnecessary too
>> > as non-contiguous pfns can be setup on driver side via
>> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
>> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>> > in [1].
>> >
>> > Do you see an issue exporting migrate_device_pfn_lock,
>> > migrate_device_unmap?
>> 
>> If there is a good justification for it I can't see a problem with
>> exporting it. That said I don't really understand why you would
>> want/need to split those steps up but I'll wait to see the code.
>>
>
> It is so the device pages returned from hmm_range_fault, which are only
> guaranteed to be valid under the notifier lock + a seqno check, to be
> locked and ref taken for migration. migrate_device_unmap() can trigger a
> MMU invalidation which takes the notifier lock thus calling the function
> which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>
> I think this flow makes sense and agree in general this likely better
> than looking at a CPUVMA.

I'm still a bit confused about what is better with this flow if you are
still calling hmm_range_fault(). How is it better than just calling
migrate_vma_setup()? Obviously it will fault the pages in, but it seems
we're talking about eviction here so I don't understand why that would
be relevant. And hmm_range_fault() still requires the VMA, although I
need to look at the patches more closely, probably CPUVMA is a DRM
specific concept?

Thanks.

 - Alistair

> Matt
>  
>>  - Alistair
>> 
>> > Matt
>> >
>> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>> >
>> >> Matt
>> >> 
>> >> > > +	}
>> >> > > +
>> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> >> > > +
>> >> > > +	return 0;
>> >> > > +}
>> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> >> > > +
>> >> > >  /*
>> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> >> > >   * a reference on folio which will be copied to the new folio if migration is
>> >> > 
>> 

