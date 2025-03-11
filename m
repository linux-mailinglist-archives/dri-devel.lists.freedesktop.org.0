Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5144A5B8DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 06:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA0310E100;
	Tue, 11 Mar 2025 05:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LttAcm9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977D10E011;
 Tue, 11 Mar 2025 05:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJYSoxdmGqct8NQpYEUs+N/YC1lPq0q+A9aJy7khsM70k6cg7w001eU+0lLWjSMSED3F70+jnLh/wGBC6XeS8SKiPv/XeDCmzRAxZGgYfNclNtzpRhRysWPOYZi7Hh5fQlt9AIXwQ5fFb0NvclKar8q19B9y54i2vaOQG+UAlZ+g8+dHS+edw+uPnmNH2xG6CXxWpVh8FN4qDBg+736cw2hqCUBRr87v9HRkNny7HQk2y5txY+zf2tctWaceeyn9n/yymvoXVLsZV/ibgHXHKkdcJSI04b1YmsAwVQHHrPFNb8SGh5Xxv/UvsEQ+R6BOnF/9QhbbnAnEX5Wk98kBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54adK4GQMIVneA7wT+l2vGzVk0FH6mmIiF3divPfbuA=;
 b=hFMom3i8B/Rj7QKc72ZItL+NUU8SR6HLjX3tC3/tJduk46amBCXwgQIfIUeOm5KjNcNKqjBxphLCOSiJYHaxnHM5TJ9Dw5tHuw0mJE7tUNnOrbt2mcnIsfyFM/jeirr0Sm8gt128QjR5Wlwr//YpQ0HlQhkq2hTff+Q1DrUKPJKRUm1LMpSDOknD3CJ6ncKxj3Vk27IXQFJtPK1jy3YeJL7l94H9kZlZlx9Sths56OC3SBCCzNvZsuhoKLaO5xh2Q/3/dV7XeWt0eSBJGxjg4MGCW5VmPEumg1sXY+NsMFszgX5P9AnW5ohWfBc0th/g45QlxWH0Avso0ADoj+cDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54adK4GQMIVneA7wT+l2vGzVk0FH6mmIiF3divPfbuA=;
 b=LttAcm9DwZyWhSRAS/LaBrW/RjgrLtNDHPyE6gKQREpE7AuOoPo2m/XKmR0/TwAH1CDzw3h8I2j9AF1jO9Su43qY0vFXiUTjcPU5p8UGHG1mUv6PWlgkWUPKaESLmRdaW5GDeKDWy1XUBCtnC5YeGWbwB+du7Ekigr3h1HXcg4mHvWNNOh4bZ8RLkwa9F4fNB2WFO6O3Q74WCXEGllGgE8TfMMnp1TayxtPbXpzBSW00wrbFBv5I3UL+DPxYt6dN5kKQiSlFIyLr6ZnI6dZUFetvHB29CPi/kt6JW1SI2b4Ox1cU2aUPmLTNmzmz6qIR6pXdk83Ogvq63aIZXDgSIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:58:01 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 05:58:00 +0000
Date: Tue, 11 Mar 2025 16:57:49 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Dave Airlie <airlied@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>, 
 Balbir Singh <balbirs@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, 
 DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <kk4fmefhwnis4lwlvssgu6t54o5mkahgyz4cm3wjh2hgtriexh@x3xseg5v7nrm>
References: <20250307122954.1ab65809@canb.auug.org.au>
 <20250311131214.530934a4@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311131214.530934a4@canb.auug.org.au>
X-ClientProxiedBy: MEVPR01CA0003.ausprd01.prod.outlook.com
 (2603:10c6:220:204::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 49068d9d-793c-4c1e-3f57-08dd6061ae26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V7iVb75IxU+2uVLSdkd9iJASdwtPqHm4Q0FK6UE7LV2zsAQboGmNEPiiu3rx?=
 =?us-ascii?Q?clt+cEJalM6SU8yWH10D+Ks/Vy6QT5Au+qOTy3mSEYGOoxcCAXpw9NtfMnKZ?=
 =?us-ascii?Q?ir+v0G0GMGWYCsEhxBcD1eDYpDRv07gYYXyZxWBLSsfk+VLr1MXR0tvXqPHx?=
 =?us-ascii?Q?AE8u7SRZVJ0K4x6oN++70agPqlj/lAARUe8MePJZ++ku4f6tJyrriutgmCj2?=
 =?us-ascii?Q?MY62VMpjqroIf4DF+Vaf48f6jfmMG4YbhKSlKDfs2jkHJAx0ZskuUcmTMBb0?=
 =?us-ascii?Q?q9qeflbIoZ9NEdcSFKLFs3SSpiRom74a9d83qPbkGCWikh09yiOPXfYHvRzb?=
 =?us-ascii?Q?OqPzF39YlzPx0hfhjLEDYCcAznL5aG5v9CSSBz0KYrFXpugyj/hCiq2dV4Dy?=
 =?us-ascii?Q?udRC1X762asxOM+jUEVtaQFE8JCprNWMf5y5jSvpcqJuRFHMHgiobEMGfgKF?=
 =?us-ascii?Q?3+361BGSUqHrodhjgSq8LAPLdkEUCYMtGnqTRhFLTEX9fisGVQqESpJN3k9T?=
 =?us-ascii?Q?s0jMaBgde3im6QaTtPgckZA7/qwN9s24Hr3fw7e4hyYd7N9Xpe2FPI5FCOaH?=
 =?us-ascii?Q?cq9dTxWSlK5BIPK8ze68DHqISYpw93O3WZfKH3+ptt1rq/HU5CYsnqukIFjX?=
 =?us-ascii?Q?BcU43f6VVl0CkpsqoLdT0gvQbR7zAADIIPnKDJ6kB+dpy67pGgJ2iUBUnXrt?=
 =?us-ascii?Q?A96q04Zb1Mofsdj/GzRAdldu1d+OXHSIld7SHOsd0c3PFU/YAJGD3nMcylYC?=
 =?us-ascii?Q?tGtngAjdXCgiiuPbLn/xQB4rAjOGxaFlZurZKo8PlMnAt0/ls99lR074MAS9?=
 =?us-ascii?Q?BU27oc5dbGldJAiLgYrrYR9bodTCyJQy+Nm/lpuGSYdtUnhPo36vokgPN2/O?=
 =?us-ascii?Q?XcCCs/SBeA1knLFm1vpa5yOkjgFFu7whktiE+JqKZNrGluinJf8CoylemF2/?=
 =?us-ascii?Q?4Gx85mV99NZdYTFth60lVbk21SlhH0JK4f/Zrn6IkvZCfu2SRY8MkYOpRlps?=
 =?us-ascii?Q?RxRHUAmc2/D2rIwQvimsqpSAC7NESKN3zxc9RmkKQLSmcdEFRKNKF+WLE3JO?=
 =?us-ascii?Q?BsxW3ZiRHnMAPtPDHUt0XzB8ennsQc0ABxbZqbWL9UJgVXnSuZ7u745T/dUH?=
 =?us-ascii?Q?lKApS4x7uJGH26v4nxcxDdmBNWXewa3zBJj1SDJGnOlefsg8VHI0nYiwwHuM?=
 =?us-ascii?Q?u9nSS/D76p/tDus41x+udJh0JXCEgBfnAZwGydQZKmjv7+rpI4lbA22yhPnS?=
 =?us-ascii?Q?0fSbVn33WlIPgnEoI34IyCqn5ujwIt+STrjT9J7Zua9WzIoyHQwgto2SNVNz?=
 =?us-ascii?Q?ZFUORYihMs1fj0yE04eH6mL0qtyv8+Qd9W56tlKy9dI5KM8whst0oPR7EuSV?=
 =?us-ascii?Q?OzgnHURunThg/iXSSmwPc+eQEylw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pexou/Eu/wPkez/DJYpjegEm9XMfZa5gLdl+09Kls99jW9fRxoV6YCKdbUiv?=
 =?us-ascii?Q?NjelrBAOpCQQ9+4C6QCM2y+cVq5ucQvxYn70m5wCtWNiPcDfq5EVi4daeT+J?=
 =?us-ascii?Q?cQVSJjVi6Mk7FxULHSOa7kIZPcW14dqPYgnAWYm1waVCXa9TtxoxY5DjuR1Y?=
 =?us-ascii?Q?VoDeDKkIXZCeg0w+6iYUyhD90zueQTWeLf3z6SU+IfwUSNUfdbkWJJv4xprA?=
 =?us-ascii?Q?easW/pbbGB1vZ1VRsyM60wrpLR3m1u1/Ye0dCTk2r914G7xk1TTGvvdctEzK?=
 =?us-ascii?Q?qRhGxjdqSC/IyRLaqerzjvEdWzH4XR1Mh+DWSnTjtoYklT/G3l1M89aa6ADe?=
 =?us-ascii?Q?T5jzb831uAdtPbxPPAiD86F8SRMUYySBQQ9LXj0fM83ZpDiDl7vj1z3lP91M?=
 =?us-ascii?Q?ysQn0FzVfXxbuQ8fmziuB0Vaws9AEAgnd6AV/lGl0zIln9bRM0Nq3yne8XDu?=
 =?us-ascii?Q?Qjsp+U6+FhlFVXgISVByHOb8idfkz0MSGm16tgl5aWJ7HASlWQ3gWTgP+csQ?=
 =?us-ascii?Q?LLsDba9pSfJ40vgyjCnFNK1Bn2QYzbFiS44MbawAb/CaLBy+btyaGwjGrRSL?=
 =?us-ascii?Q?onlTe2BRG6GnzOBGmj8s8omcCEzPzHhDmrp2rxT0cbqe95zgqy24dgz5nF9p?=
 =?us-ascii?Q?edjtaiWpNlF1soR+bh2d6JwLIEW1uXuZxaEOpWsGbwmq/ZuHT1n4ZA13NoBT?=
 =?us-ascii?Q?AtZVxtWno8zhvpNQYwqOxaBJDzu2OLctx8jIn6QhuPtR+nuRi2Ho+nQYKpun?=
 =?us-ascii?Q?EMhN1W5wyftQwqklF4+wBMsHLqPhDAndSNd4OJTqohsbp71vXJ7VM/4tTsGp?=
 =?us-ascii?Q?0QxsZ3r0BGndujyhmkuLm56Xyf2VSb4q9w136MIpyZdp8iPAwCdX1rLOQtZb?=
 =?us-ascii?Q?SA38cwCLGun0kx9qboMaLLFBto43fT/vworj4nODwh9NbVQHRuUtFyUNnfAZ?=
 =?us-ascii?Q?cysbfQuPxdgLSjr6RLDGjHr1j9r+hyGrv+S6GgJPYWqowSa3anYCV/uFnk3v?=
 =?us-ascii?Q?UPFxHD9jCR3y4ZAtIe+aaQGsMlthXvKZSVQA6iSZLcqw2BYl6Bm3eCgQrmBv?=
 =?us-ascii?Q?CGTiWV5p68p77WpKQZjXGJETC6GsDPxFrpEsKb33ukMTwTMFem/Nr1tXhp3i?=
 =?us-ascii?Q?8qicoB32AGegB6yrjxSMaD/gEPa0+yfT2R5clsnLhl/bjjyt6AUmi2eniz3Q?=
 =?us-ascii?Q?U0OeWi4kZ3EgkKTSpPWLvDvwvs6D+GUGi91h3ivy3W85mbG/TATWuOHu63yc?=
 =?us-ascii?Q?KbcyTjqkLjT+8klIC4r75d15CH9V9JpmIR0ZhUBCkBUTieyUObPwPjRS5bhI?=
 =?us-ascii?Q?d8Pzwrb4ZB43L6y5b6tx1P6zll29m+LkDYccjPcQGL9EfyLPsf+cjokwmvpm?=
 =?us-ascii?Q?gAx4uA7dEO6hWtuM7U8iroadwL+2Ext7znLiHPuZKtqixHhvkCwqXhaJ2We/?=
 =?us-ascii?Q?q6rJghGcsUryW+a5250mIFGsnReujKa8V5dPOgGn9oszIr48UxveUAevaaf/?=
 =?us-ascii?Q?BQouwIhty4neeRsfuTqK1wWsczdKTb07jyecyFOFOrr64CQFIZah5mmDjOA5?=
 =?us-ascii?Q?dHaO+P3+JuPYUhAxhZHMHIfehlZxm8THdJNAaWBZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49068d9d-793c-4c1e-3f57-08dd6061ae26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:58:00.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hFSTMVgJR8sVIFgPaCSpSR1iiBcHDvvS2i135lVsY/5wLzq19iqTlB6Ip6lpPpzqXoFKHTEcYeRCxJ/2mlO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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

On Tue, Mar 11, 2025 at 01:12:14PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 7 Mar 2025 12:29:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > Today's linux-next merge of the drm-xe tree got a conflict in:
> > 
> >   mm/memory.c
> > 
> > between commit:
> > 
> >   089b22f60a0f ("mm: allow compound zone device pages")
> > 
> > from the mm-unstable branch of the mm tree and commit:
> > 
> >   1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
> > 
> > from the drm-xe tree.

I'm not sure what the process is here, but having either reviewed or authored
these patches I can add that the fix up carried below looks correct.

 - Alistair

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc mm/memory.c
> > index d21f6cded7e3,59b804f4bf3f..000000000000
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@@ -4473,11 -4348,15 +4473,16 @@@ vm_fault_t do_swap_page(struct vm_faul
> >   			 * Get a page reference while we know the page can't be
> >   			 * freed.
> >   			 */
> > - 			get_page(vmf->page);
> > - 			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > - 			pgmap = page_pgmap(vmf->page);
> > - 			ret = pgmap->ops->migrate_to_ram(vmf);
> > - 			put_page(vmf->page);
> > + 			if (trylock_page(vmf->page)) {
> > + 				get_page(vmf->page);
> > + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
> >  -				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > ++				pgmap = page_pgmap(vmf->page);
> > ++				ret = pgmap->ops->migrate_to_ram(vmf);
> > + 				unlock_page(vmf->page);
> > + 				put_page(vmf->page);
> > + 			} else {
> > + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > + 			}
> >   		} else if (is_hwpoison_entry(entry)) {
> >   			ret = VM_FAULT_HWPOISON;
> >   		} else if (is_pte_marker_entry(entry)) {
> 
> This is now conflict between the mm tree and the drm tree.
>
> -- 
> Cheers,
> Stephen Rothwell


