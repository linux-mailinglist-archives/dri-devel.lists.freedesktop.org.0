Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560499A351A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 08:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DDA10E89C;
	Fri, 18 Oct 2024 06:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/s/Ezgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C0610E896;
 Fri, 18 Oct 2024 06:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuzETRqMLnfukHiF/1Ae2zpP2JPasEKYE7+PQTS5het9sFZsviewt3HSMWDI36GafWh+4AresmsGfPdVbdmktLgcjQkHSBGKslxX2cuT2klVaid+ze8FmykJUvqjdeHPteEO7TWlmm1YnPZitJwVGqnvnGmsemi0m2AQsLF0yI+ACMrkl9V5KL8VuLB6kdsSMumhXoteWE/LCjRNzc9KgrxXSjhe0zImVkXDmF60YCD/lUrucn1NhgrjMri5+MMnuuGy8yIUcyGEsViE4xrzuZaqYkCimRHp/HqUWFjWdaABaqhX6mFpiBksOk/KFXOJjvG1ggdNCGq1RQH7oVSjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H0Kka/kbhNwsGMGeIgdVt4c9k7mM6xZPN9pAgBdENQ=;
 b=tciGc1kFmGSvLF4xh2aY+C8Dxrn8BWL2UxfSX/W96aCJ5+KAvPRhnAAXep41lQoSodPk7kDLu5pyEMbpQA2rlsIoyqBoEaqkv9Cb/CDfgWctkH9pypcRbDHcnmj/KCyiqlPMKtZwKm3BZxM1bKwmCKjI5pqxqRoOoT+tc67q6MMdYT1lNzINpUY1NEtlZqoH0gNqlwDfUVSGH09EgQbp64iopZOEumHNnHtCXE/OXeE6rKvQPMe32J19U+zT/yo9v74iIIWpKXAE7Ob94R1eGFGALj25DFTCcJQlW9Lp8enJc5u5JeOTuqox69+1BUE81EYye8aIOunCRLRlCKKYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H0Kka/kbhNwsGMGeIgdVt4c9k7mM6xZPN9pAgBdENQ=;
 b=X/s/EzglwK43/lP0tVJv6zYLhz4Rtj6U5bpmaNVBk1wvWtcarHCTsdBiOk2dJc3WFA4SUE3YCSAydczfp0IWSF7sGP9p6F4w6fQVHvkMy0jnt61RIzbcsMXcg0FbiYsssTGc5OWSRt06T/AFbm4Uph/7G0H2U3g/GtaRnv6zS0TSMK7vqQoVzn3sVUlpevoNCxFcGySqEdUpC2/icmAM3wDmq2Ei2e13BgZd3Q3CgI38x84XX1hqCBI/0/OA8Db6WwSwwLxXYuX15pP4s5bphnrTe/StjWkZBS2gyKDYsZdaGk430HrdPe0F8nEIWXhHW4BsPbb+9KdGd1Z6lcjJtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6371.namprd12.prod.outlook.com (2603:10b6:930:f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.19; Fri, 18 Oct 2024 06:09:29 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 06:09:29 +0000
References: <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Fri, 18 Oct 2024 16:59:05 +1100
In-reply-to: <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
Message-ID: <87zfn2lz6z.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0012.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: df4d4ffa-97d6-40ca-14d9-08dcef3b6d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cSvEoeKEb+jjoGrzEnyAz+dw8EgF8BcR4QFyL4ZyoE7DEqbB05bO61cTivHC?=
 =?us-ascii?Q?/bTDXMdsYasPVaG5quv5vmlc6CcpTR9T/009iMzacDdNS/hxwp7Ns09lpjEz?=
 =?us-ascii?Q?zRpXcVBnci+5N6Eq8bX+O8xlnEZDP/j8yZTBrshJt0fx9VGY5bkQBB3+/55b?=
 =?us-ascii?Q?vIvJRQnSIzud5ZQe3EN8fL7zfO8a/GkjDoT7FkENY1Wny9q2ahnRq3rmCY9g?=
 =?us-ascii?Q?nwwUd7+Q97VlDGRwyj9i6IprvXMMHM/eFwDa5yP/oGSKhWX9k4xfbD5DIFbg?=
 =?us-ascii?Q?krxlPkrNcyvA0wcVin8YargE6jDl1b9b36vZxjwMgqRHCd5/dGPhlSXIg9k3?=
 =?us-ascii?Q?tPqK6v8vmP1LKMDXIWJtwT4xOhKG9fr3WJwqhv/kNCVTmSiQnCvxLXTg2Hb1?=
 =?us-ascii?Q?yDY32rvUYNL2G309jXqRoxT7pGeXzpj084oX5/oL2IyKchJURLnybq3DpiCu?=
 =?us-ascii?Q?H7QqiAIq9ig/WuUxA6DCfXb6viBGEHLjH8IBZGBR+3D/k1JQVZmSCljpQRrS?=
 =?us-ascii?Q?afBVJd2M8rg3maSlTJ2a+7YRJXxomVbqDEn03zjE85RvFEJkGS/shRvL8M6f?=
 =?us-ascii?Q?6s9yG84KPreZm6kEDOCMjAA/JY85t6Gg14Eh6GMw9yw9Yn5uhHPSItyQ8q3R?=
 =?us-ascii?Q?l5wSOSx8+n0uD4fyxyZPDsJLCkR9vTXhfEorSvR53OJSD2JUGeXmgAr/vOM2?=
 =?us-ascii?Q?CFHebAQadrjJPkGvJgLkfE531zNG/bUWGpzh1M91AcuYEzmdeQ8DVi/zb7x4?=
 =?us-ascii?Q?Qyp+vbqYiYXNP2jDmLQX5eWZxe40s6CPD3AOrQLjCpFXvqWr6D5hcQcqRpX4?=
 =?us-ascii?Q?4xTem/NASVf2YNm94gvJVlmCZQE2ppZ8dbek/SGJ4G/BWWXdhWMU1IhPOBOM?=
 =?us-ascii?Q?EFHmtFhKGcvFG5AVPwzSwn5r729jsGCqx89kozcwV6YYs7mLqsTcPboOeqm3?=
 =?us-ascii?Q?3+Td8wIGeVORqIsBEPClYFKA9DL6SIiBvdJ+01zMeuBGK3+aVzj4JPVjWFOx?=
 =?us-ascii?Q?Zj0Xg/gKH33iWfBDt1Aj6xva+sb+foKE0RfgfoeEfVUVj1/aiavJp7O+yTZo?=
 =?us-ascii?Q?mP6ablLaSxkEGlN6mBUXTEGOO7xTH4xoMU3ixzaEm1OBSbxspt31RCdtKWwH?=
 =?us-ascii?Q?jwQQ8hxvt31LoLbSOKNAIdxMSkAyH5Afr+c67//xfCKMpmoN7NcAg+/QLLO8?=
 =?us-ascii?Q?c8ugfI5hKQBOWnyLzu6etkAgIo0AZ5utlVcXrBsZHd+l4xuw5u+HhUVx6QS3?=
 =?us-ascii?Q?c5Uly8FjrTVQnqjjtCQ1J7bD32pRGF6OD1A3ILAxCKwJd6uhNmX+93XFR3R0?=
 =?us-ascii?Q?cY+kN1vYhgVbNx97rNaR8LJ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N5Bon2RK6YNXMoeXKGpERWPmsN7Bl78v1O+mqCC4qqVTvSYo28gf40FvgofC?=
 =?us-ascii?Q?sUP8hs7p32u6qXaCjAffC7G/NlS9MY6C5nD3pFbnR0uX7wYjjfLx656Kjk6Q?=
 =?us-ascii?Q?9mVlI8GRyjfENpmjithy69cJoMJM1wUKEJrj/D+Xj/mRyeWVzmf5Z+PF+AcC?=
 =?us-ascii?Q?BtarHMwWFbhWYONglax2suHTDWzB2Y8OpI4EIknqw+S2RY6q5+Dgw8C+KMVC?=
 =?us-ascii?Q?CTZ+gw7+P6TyL32ow7Sa1NlplL4BK7JcY6j+BeJWtT/HMvuq8p23nG1w96cV?=
 =?us-ascii?Q?yyAOzWGVrkg8BC8kbpbrHnpfS2ds4PDMs3DVZDY2Xc6RGEWhhkpjV3ouKD8H?=
 =?us-ascii?Q?K2SAGeYDIQ6IA4B1snfXnJTAzRbnc0QvvCvFxCMVq/hS4fu1ofHaOyaNOvnL?=
 =?us-ascii?Q?9l5jhBB5jKc8Kf5n+Z+ohFkvPakk5Q+yeKJE/yJZeGXW1g9uGwWvawP9JePh?=
 =?us-ascii?Q?ObTP2nIGAIkxucptZ73ENvGOSYlfmIW1BS+1sNaAkcZtMZqhaRLa33nr1IuC?=
 =?us-ascii?Q?x1CtdF5sjtWuwDJDhHkvqrY7uSfFEYkts0Jkfy6H9ti1bo6hQLRfyLGDpfJ7?=
 =?us-ascii?Q?8GvAj4Cy32CKdAioFfkFvEuJdFgELbtJaXP60IwuToicy98SFA3XT+nLyjSS?=
 =?us-ascii?Q?EptOIIzxb5s9XoFqtmm3rV1wHmDCh7MicwCfJpNXWNBclbJqjSFqoXRSsNAx?=
 =?us-ascii?Q?6wXib8vOtD9Z/Bk5y1PyxnZxWDUAJ9zJxIqVim/secDuIFSsJWt2tPPhdyZi?=
 =?us-ascii?Q?omXGoSVOTvJON+p9r34fJHTU+rvO6Qxbbedg2KBugUzhUV3EIkoPft9ubKwI?=
 =?us-ascii?Q?Wwhfq4HSnoL3HOd8S2VYA4NWd3t50uE9yDLzsOzxjcth4P8ra45bw/MLUsCl?=
 =?us-ascii?Q?aNCBt92QCVns51nly2/XiFwa+PGhgBDrGpQdynvnrtMUVR//UZVnnF1L0h/q?=
 =?us-ascii?Q?Sxn40nbLdMD1VogSOqQR0SnAgS2Azn56K3Cw8RSHYzDGc8b/BSYu9I+F40wW?=
 =?us-ascii?Q?F93mRODLhKo6ZmKaS21OGzKap4rNk5hywEXIAuL4a9T9o32+ZhwJJD2mDpKN?=
 =?us-ascii?Q?GPE+YAjjP8DbmHCZqVPROpewJV4dCR9cxveYFqNa6JAP+HjQ+Zo8O7k057L2?=
 =?us-ascii?Q?MqxBF8YZohH8CvHJc/uWkZqOrNokfsmCwIzgNxV3HyeQ1GTQYA86sSbVvdWN?=
 =?us-ascii?Q?EXXnhD1HDjcCw922AzLZNwMjyJ6AZZsYpFWm0NKwaslPF3sQVg+DZPKjts75?=
 =?us-ascii?Q?XwTsG5ISRG0tLur9tWDQz+7Q/CStHfmrd2kqzwybTD2WoP0dIN8hitn72EU9?=
 =?us-ascii?Q?oTwlP+QxYqQD90HGplOQNTAT49+v8ucSctqH0DwThPp35IehdE0381RqmTxz?=
 =?us-ascii?Q?ONJTkH4r5KUI6C/r2/mpIbRzZBwxyG9o7iN7zGZcdF+qAZ9fe77VYn9Ar6pl?=
 =?us-ascii?Q?cpXuG8DXenrDZ5EqHpw7V5h/sPbmD4EhpLoHIKE4qmMmsosvmgy3knRGJGpJ?=
 =?us-ascii?Q?c6xhp8IcRoTTpaY8HMiB4a9SGlkJFqjeuFaLEhRNC01f5jlgvliAQEBVDdLV?=
 =?us-ascii?Q?+1a6vlzJDxMEyQWnGtODfqf7I+omacmcMPsDFsO8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4d4ffa-97d6-40ca-14d9-08dcef3b6d28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:09:29.4578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSMsAhyb9KavCCAa8LonHZ6pFyGpu7WxMAJp1TiD25DHQ8tWgaOm2sc8LcXVM12qkNEqjZy9lG4Mkc2V+6PfRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6371
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

> On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
>> 
>> Matthew Brost <matthew.brost@intel.com> writes:
>> 
>> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
>> >> 
>> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> 
>> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>> >> >> 
>> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> 
>> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>> >> >> >> 
>> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> >> 
>> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>> >> >> >> 
>> >> >> >> [...]
>> >> >> >> 
>> >> >> >> >> > > +{
>> >> >> >> >> > > +	unsigned long i;
>> >> >> >> >> > > +
>> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
>> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> >> >> >> >> > > +
>> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
>> >> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> >> > > +			continue;
>> >> >> >> >> > > +		}
>> >> >> >> >> > > +
>> >> >> >> >> > > +		if (!trylock_page(page)) {
>> >> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> >> > > +			put_page(page);
>> >> >> >> >> > > +			continue;
>> >> >> >> >> > > +		}
>> >> >> >> >> > > +
>> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> >> >> >> >> > 
>> >> >> >> >> > This needs to be converted to use a folio like
>> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
>> >> >> >> >> > a function that both migrate_device_range() and this function can call
>> >> >> >> >> > given this bit is identical.
>> >> >> >> >> > 
>> >> >> >> >> 
>> >> >> >> >> Missed the folio conversion and agree a helper shared between this
>> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
>> >> >> >> >> 
>> >> >> >> >
>> >> >> >> > Alistair,
>> >> >> >> >
>> >> >> >> > Ok, I think now I want to go slightly different direction here to give
>> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
>> >> >> >> >
>> >> >> >> > What if I exported the helper discussed above, e.g.,
>> >> >> >> >
>> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>> >> >> >> >  906 {
>> >> >> >> >  907         struct folio *folio;
>> >> >> >> >  908
>> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>> >> >> >> >  910         if (!folio)
>> >> >> >> >  911                 return 0;
>> >> >> >> >  912
>> >> >> >> >  913         if (!folio_trylock(folio)) {
>> >> >> >> >  914                 folio_put(folio);
>> >> >> >> >  915                 return 0;
>> >> >> >> >  916         }
>> >> >> >> >  917
>> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> >> >> >> >  919 }
>> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>> >> >> >> >
>> >> >> >> > And then also export migrate_device_unmap.
>> >> >> >> >
>> >> >> >> > The usage here would be let a driver collect the device pages in virtual
>> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
>> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
>> >> >> >> > migrate_device_unmap.
>> >> >> >> 
>> >> >> >> I'm still working through this series but that seems a bit dubious, the
>> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
>> >> >> >> would help me a lot in understanding what you're suggesting.
>> >> >> >>
>> >> >> >
>> >> >> > For sure locking in tricky, my mistake on not working through this
>> >> >> > before sending out the next rev but it came to mind after sending +
>> >> >> > regarding some late feedback from Thomas about using hmm for eviction
>> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
>> >> >> > doesn't work for coherent pages, while something like below does.
>> >> >> >
>> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>> >> >> >
>> >> >> > Here is a snippet I have locally which seems to work.
>> >> >> >
>> >> >> > 2024 retry:
>> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> >> > 2026         hmm_range.hmm_pfns = src;
>> >> >> > 2027
>> >> >> > 2028         while (true) {
>> >> >> > 2029                 mmap_read_lock(mm);
>> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
>> >> >> > 2031                 mmap_read_unlock(mm);
>> >> >> > 2032                 if (err == -EBUSY) {
>> >> >> > 2033                         if (time_after(jiffies, timeout))
>> >> >> > 2034                                 break;
>> >> >> > 2035
>> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> >> > 2037                         continue;
>> >> >> > 2038                 }
>> >> >> > 2039                 break;
>> >> >> > 2040         }
>> >> >> > 2041         if (err)
>> >> >> > 2042                 goto err_put;
>> >> >> > 2043
>> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
>> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
>> >> >> > 2048                 goto retry;
>> >> >> > 2049         }
>> >> >> > 2050         for (i = 0; i < npages; ++i) {
>> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
>> >> >> > 2052
>> >> >> > 2053                 if (page && (is_device_private_page(page) ||
>> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
>> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
>> >> >> > 2056                 else
>> >> >> > 2057                         src[i] = 0;
>> >> >> > 2058                 if (src[i])
>> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
>> >> >> > 2060         }
>> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
>> >> >> 
>> >> >> Practically for eviction isn't this much the same as calling
>> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
>> >> >> probably shouldn't be looking at mm/vma structs.
>> >> >> 
>> >> >
>> >> > hmm_range_fault is just collecting the pages, internally I suppose it
>> >> > does look at a VMA (struct vm_area_struct) but I think the point is
>> >> > drivers should not be looking at VMA here.
>> >> 
>> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
>> >> so in general I don't see a problem with drivers looking up vma's. The
>> >> problem arises specifically for eviction and whether or not that happens
>> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
>> >> issues there (see below).
>> >> 
>> >
>> > Ok, if you think it ok for drivers to lookup the VMA then purposed
>> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
>> > needed, rather just the original function exported in the this patch.
>> >
>> > More below too.
>> >
>> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
>> >> >> > ...
>> >> >> > 2101         migrate_device_pages(src, dst, npages);
>> >> >> > 2102         migrate_device_finalize(src, dst, npages);
>> >> >> >
>> >> >> >
>> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
>> >> >> >> > lookup during eviction cases and this would let me fixup
>> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
>> >> >> >> 
>> >> >> >> That sounds reasonable but for context do you have a link to the
>> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
>> >> >> >> just missed it.
>> >> >> >> 
>> >> >> >
>> >> >> > See in [4], search for '2. eviction' comment from sima.
>> >> >> 
>> >> >> Thanks for pointing that out. For reference here's Sima's comment:
>> >> >> 
>> >> >> > 2. eviction
>> >> >> > 
>> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
>> >> >> > migration gurantee:
>> >> >> > 
>> >> >> > - Only looking at physical memory datastructures and locks, no looking at
>> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
>> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
>> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
>> >> >>
>> >> >> I also very much agree with this. That's basically why I added
>> >> >> migrate_device_range(), so that we can forcibly evict pages when the
>> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
>> >> >> general it is impossible to guarantee eviction og all pages using just
>> >> >> hmm_range_fault().
>> >> >> 
>> >> >
>> >> > In this code path we don't have device pages available, hence the
>> >> > purposed collection via hmm_range_fault.
>> >> 
>> >> Why don't you have the pfns requiring eviction available? I need to read
>> >> this series in more depth, but generally hmm_range_fault() can't
>> >> gurantee you will find every device page.
>> >> 
>> >
>> > There are two cases for eviction in my series:
>> >
>> > 1. TTM decides it needs to move memory. This calls
>> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
>> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
>> > here albiet with the new function added in this patch as device pfns may
>> > be non-contiguous.
>> 
>> That makes sense and is generally what I think of when I'm thinking of
>> eviction. The new function makes sense too - migrate_device_range() was
>> primarily introduced to allow a driver to evict all device-private pages
>> from a GPU so didn't consider non-contiguous cases, etc.
>> 
>> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
>> > partial unmap of a range, etc...). Here we want to evict the range ram
>> > to make the state consistent. No device pages are available due to an
>> > intentional disconnect between a virtual range and physical
>> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
>> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
>> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
>> > using hmm_range_fault like I have suggested here.
>> 
>> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
>> fine for this usage and is exactly what you want - it was designed to
>> either select all the system memory pages or device-private pages within
>> a VA range and migrate them.
>> 
>> FWIW I have toyed with the idea of a combined
>> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
>> migrate_vma_*() process but haven't come up with something nice as
>> yet. I don't think mixing the two in an open-coded fashion is a good
>> idea though, I'd rather we come up with a new API that addresses the
>> short-comings of migrate_vma_setup().
>> 
>
> I think that would good. Here we actually need to lookup multiple VMAs
> and have a sequence of migrate_vma_* calls as it possible for VMAs to
> have changed after the driver range was created. It might be nice to
> hide the VMA lookup from the drivers with an API saying collect and
> migrate all pages of a type in a VA range much like hmm_range_fault. If
> the range spans multiple VMAs that would be hidden from the caller.

Ok. I wasn't really considering multiple VMAs. UVM and Nouveau don't
really have a requirement to migrate across multiple VMAs but if that's
neccessary I think an API that hides that specifically for working with
migrate_vma_*() might make sense.

> Matt
>
>> > Note #2 may be removed or unnecessary at some point if we decide to add
>> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
>> > now though. See 'Ranges with mixed system and device pages' in [5].

As someone not very familiar with some of the DRM layers can I ask why
having virtual address ranges with a mix of system and device pages is
hard to support? It seems to me that in practice it might be quite
difficult to keep a VMA range as exclusively all in system memory or all
in device memory.

>> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
>> >
>> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
>> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>> >> >> >
>> >> >> >> > It would also make the function exported in this patch unnecessary too
>> >> >> >> > as non-contiguous pfns can be setup on driver side via
>> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
>> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>> >> >> >> > in [1].
>> >> >> >> >
>> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
>> >> >> >> > migrate_device_unmap?
>> >> >> >> 
>> >> >> >> If there is a good justification for it I can't see a problem with
>> >> >> >> exporting it. That said I don't really understand why you would
>> >> >> >> want/need to split those steps up but I'll wait to see the code.
>> >> >> >>
>> >> >> >
>> >> >> > It is so the device pages returned from hmm_range_fault, which are only
>> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
>> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
>> >> >> > MMU invalidation which takes the notifier lock thus calling the function
>> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>> >> >> >
>> >> >> > I think this flow makes sense and agree in general this likely better
>> >> >> > than looking at a CPUVMA.
>> >> >> 
>> >> >> I'm still a bit confused about what is better with this flow if you are
>> >> >> still calling hmm_range_fault(). How is it better than just calling
>> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
>> >> >
>> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
>> >> > vm_area_struct argument whereas hmm_range_fault does not.
>> >> 
>> >> I'm not sure that's a good enough justfication because the problem isn't
>> >> whether you're looking up vma's in driver code or mm code. The problem
>> >> is you are looking up vma's at all and all that goes with that (mainly
>> >> taking mmap lock, etc.)
>> >> 
>> >> And for eviction hmm_range_fault() won't even find all the pages because
>> >> their virtual address may have changed - consider what happens in cases
>> >> of mremap(), fork(), etc. So eviction really needs physical pages
>> >> (pfn's), not virtual addresses.
>> >>
>> >
>> > See above, #1 yes we use a physical pages. For #2 it is about making the
>> > state consistent within a virtual address range.
>> 
>> Yep, makes sense now. For migration of physical pages you want
>> migrate_device_*, virtual address ranges want migrate_vma_*
>> 
>>  - Alistair
>> 
>> > Matt
>> >  
>> >> >> we're talking about eviction here so I don't understand why that would
>> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
>> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
>> >> >
>> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
>> >> > as argument. This is about avoiding a driver side lookup of the VMA.
>> >> >
>> >> > CPUVMA == struct vm_area_struct in this email.
>> >> 
>> >> Thanks for the clarification.
>> >> 
>> >>  - Alistair
>> >> 
>> >> > Matt
>> >> >
>> >> >> specific concept?
>> >> >> 
>> >> >> Thanks.
>> >> >> 
>> >> >>  - Alistair
>> >> >> 
>> >> >> > Matt
>> >> >> >  
>> >> >> >>  - Alistair
>> >> >> >> 
>> >> >> >> > Matt
>> >> >> >> >
>> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>> >> >> >> >
>> >> >> >> >> Matt
>> >> >> >> >> 
>> >> >> >> >> > > +	}
>> >> >> >> >> > > +
>> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> >> >> >> >> > > +
>> >> >> >> >> > > +	return 0;
>> >> >> >> >> > > +}
>> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> >> >> >> >> > > +
>> >> >> >> >> > >  /*
>> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
>> >> >> >> >> > 
>> >> >> >> 
>> >> >> 
>> >> 
>> 

