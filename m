Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF477C204B1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472E510E979;
	Thu, 30 Oct 2025 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pHcMTKhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6227110E0A1;
 Thu, 30 Oct 2025 13:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIEQMyJ2B2Qy+U0GbUGnqnb7bR00g4pQI99Z84PLjGOfQLJAeNvpR6DDeHOnHcc0dkzRBroafVeITSoKiQJK7vXpzIkdDFa1MH0sxer8Bg8Ox5XWBFgIgj/973/4I6vZt4VqBEPLLaziNIvQ3Jrn7lvLs9mKCgDlWADMycSeXN2B3e5Jq6V9E9UgtwbJFyGS8BaGwRRyH6uueLWqUZkxblic41WLXSqhI69r5jVrhIyiuYCtOYCY4DR0GwTgRRFu3aXq6sdciKHjHLtmnMhPORxz23/oubXIAVC42w905BDPGj66MWlBYWnw2l3FA7VL6r4SMRjxTdGSsxvmcHLwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYuZ1ZGkfgeKAgIM9XJ6Xynej5SzcnnkUBLkvXPPXyI=;
 b=hp4ICbWKh19m48zRzDt9UN4T98le5xFs/c18clIYfWVGM4xcCFkvVOWS3Yn0TsWosdrYB4wz1W7BgHlJEoS/DxEASy6lDfHlBjkLhBYgAo/gWxCQbfrJjox9tB+OjLjeKKzqW71GKDoaMQQJ+aPlHKtUgnweMPUclcsezizzG18dR70uE2HUZ6YMKUt7BEaDBZP10rwqO/P7IGJCiWqqQETqiDPfgAAl6uC59qZ2qfnvkoMUwCURYSW+7srVBt92VRySlQUAToKWfNMFiUlqnhMxgpqaCT4UHwJnRkYy8azUqUHy1ldDAIvVK/CIoIO7phy4R1k0uXLUScZluDecJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYuZ1ZGkfgeKAgIM9XJ6Xynej5SzcnnkUBLkvXPPXyI=;
 b=pHcMTKhkezZjRcFY/0CO+FWybmoAe8rmHSJ/poZ7NwC4fFH8xX2BvCBxD9a6SMNbU1ZWylhP1m9WKQ0HgkTdeU4pmptF3DapNICOkZL+bF/OMBs0yeL4tBDQmEtCTWAXbzbm4HZSK7XgnwKwWLFGrhE3EJW+uIGrXUwm8D3bxDpvhQDKsvtTssk4j1SYaK9KMFllEzKnkgjE7GkCgTLfawelqkTyesM1j8O7A+/aT9AivJ19SAPHcvjmzBuqU3q7rb5akyjIT+ezttfXfA1UfhapjFABZpiHIOtCBPx3cHhwlmr6ueLCjjAfmPsBAG1D3CIr07TGFmBNJiiOCPz9wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 13:43:13 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:43:11 +0000
Date: Thu, 30 Oct 2025 10:43:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Message-ID: <20251030134310.GR1018328@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:208:256::8) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7b1106-b0c8-4e5a-8545-08de17ba444c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J+kmN+LK1DUJ6wjFSyeUgOdsIEhM9iRl/cFpzw58hLZqjabkgtMrfftznHwy?=
 =?us-ascii?Q?kb5cr6U46201WKzWhvQ3LSfzglJMoBBaS0bUp+6hV8CbBZCqNzFwwWTSCDHb?=
 =?us-ascii?Q?yvXxIgXAMq6ZYDvrc4UgZmE9os3jLdVBwIwXL5J+xIlxOqKgcU/nOHWB76SX?=
 =?us-ascii?Q?AOVuVZqXPjVc7lpaVXT9nsOPEVRRfPWSnozAvwkSascPhQEwCCesVJy1MdK7?=
 =?us-ascii?Q?VyTKCZWqH5rq894AeO5WYW6uiORp6uk+NWbnQwQpQQIFh+MKAuOBIUsdrVXB?=
 =?us-ascii?Q?paVjYqohNhjlsgmZIwrMvVbU9n2MwxpWYWo4weHj3qg2Td/VCzfyb9QKVUGj?=
 =?us-ascii?Q?ujO8RN+tF4igMfoHeOfIcNj09ECjSpcZHsCGCOL2jOng2IEpq9BTMy2DG+za?=
 =?us-ascii?Q?kX/nSkS7bGz7OAp47KJkXCjZKNqFCi7jepO685DR6HrcLJniNokwhjaIsAqN?=
 =?us-ascii?Q?FVuyJXZaftKcb9QGKC3ipbDcpfSfE1jcj6XAqNX3FGN4jkY/7fT3d1J+Oz7R?=
 =?us-ascii?Q?huiR/koBMaFfcJs2cpqUfualK4vRQzbynhNraqf3m5cJ0T2SSOFcdseGvqzc?=
 =?us-ascii?Q?Sk0NuFDA0VC5XOPJPv5C7guZyZefxwn4X6FICWOJOx9jXZ9fkJzZ9RgUeYpU?=
 =?us-ascii?Q?DwvS+cl+X6asymVPQveHxDRIAp4NVNn602xZUQYxdTPOR/M1cFkyITtzEdKZ?=
 =?us-ascii?Q?E0NvrCI76mkUL49DK4ljEf4jSJ+ryc5eFxmDOekFeLBTiEJ5Txcf96ggzKd1?=
 =?us-ascii?Q?FDgMuJN8eH0ObZO3E6Omdja3ZI6Jt/Aah5lAtqqomoLZAJ4h8RK1i/e4qSYJ?=
 =?us-ascii?Q?tOgBUeZbo+yYzuP4Z/y2RH6H0SdKZ2/zbsoK/ALkgJ9XMXTdNCX44m6eDINE?=
 =?us-ascii?Q?OTchNHOp7y80B270Zy6e/0w3hvHwGLOj0dsz4pZSVJSelqoYuX8FKO9Dtxrq?=
 =?us-ascii?Q?EC310Va/BKuAT3FKQ/wNeiUcEuR4XT30lMi4dd12J7o3S8vna1ORztEbD0tU?=
 =?us-ascii?Q?vbZPNlvY4PnYInksLtq5uZvj4EMeeD4Cnytx/oml3wQAzEvGqy6Z0x1Fl9s/?=
 =?us-ascii?Q?CqC7asHa1MWIYbumhGh/UYfvDw7yZL38eMb1fdSStcJ1B1AQN1J1yviH4X0G?=
 =?us-ascii?Q?SxsZKEkC23k7jxtYtwsZe9qUH3VyOlJ8wqbA02VGUuBF3exPoZQr5slb5E0y?=
 =?us-ascii?Q?lCX53rF/IzLftM7VeCa32Hyy0EkGWknz5OKisHfnE7h3WVejmvwjhwnn84Pp?=
 =?us-ascii?Q?3cpr2FATvOvXGMxZj1xBGxiMIj5o6Wj9xIjmYloMbKH6XZ+M33VnQSDkJoqS?=
 =?us-ascii?Q?ZLieg97yLh1BBf/b+RP1DnnihRtWlHcayvAz+PyH+CqMfIEudzCGijrNVlzw?=
 =?us-ascii?Q?CJpZMma3jcl3A1c7WwWFpc6MJBDYbsE3YY7XuJs9lmckDByKc+Zm/Ym2xVCU?=
 =?us-ascii?Q?bxuL2kfun8U3mz17Z3SeB5K2nza5Mr/9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOfWCw060f8CZDPvETtZU0eH14zOpeV3BNAQvJNkBUF2Gvtr5nBQ8bTAxm1Q?=
 =?us-ascii?Q?nt17w3+W36DBmUVUZf5Trzh+tEUqYRb7UAngiw86yFgCnpo1WRkFI5gzYiAZ?=
 =?us-ascii?Q?BNxjgSI4H4YVNZJXXldqmnkdeDt/1J9mVoUuCTDxLQGTeS0Qx9dQIfotL7E1?=
 =?us-ascii?Q?1KFnDAWNyAkW3/CGulYph+qJHppBS28bpRjOwktDjIxyu5Zequv4c029k2Rw?=
 =?us-ascii?Q?9rocerCI+S+dz2Gki0wo8k0ZYcwLsqEWYYinYEMvf3Oo9lxG0JR4ubnuy1A+?=
 =?us-ascii?Q?Dh58kn24ezs2HlNc/H8tuelIqS+0paOyCQhXNekmLuvnm8SSNeChMbiCSw1R?=
 =?us-ascii?Q?JTEDEJqN0pdwwHsOhDG4FeaQRNp2QMnvFQfbWW6QB5sr4/udSLC+id21XCGS?=
 =?us-ascii?Q?ruR70aOGCqX7uV/OCL5EYTAIM0lfsSwjC64gnCfdl/bCy+18BGIGkUlPXp/D?=
 =?us-ascii?Q?C1gV0Ogq5qiSeIQpxiB/tqsk4An9VNGnDJ303jw73CjhDFP0L5UusaUbtR3R?=
 =?us-ascii?Q?ohHIscpn2EDYDlaRUPvtTTf0QGgR3oGb8nQfGe4HCv6/6u3373cg//eoFORl?=
 =?us-ascii?Q?UWp6vG40oMvKkCNW/uOIBB7d/91LpnxIbUpcF3m3GcTRTWtG6vkOeiOH5CzZ?=
 =?us-ascii?Q?vJT21geoaM7TSahp9VqimQe+alh4+2hh2qi4nR+Yx2ZTUA4nrGf6m/73SUdF?=
 =?us-ascii?Q?dreRcvalfW3GTICOtClC6JPaqqUEz+uqZCIOpS4899QJMqS3s8sJksczWBx+?=
 =?us-ascii?Q?YL59EeePAcp32cld7R9irRTtPvHEuaIt9OgevEEhAK1+LO+rPqGTn/HwnqG+?=
 =?us-ascii?Q?dQFi3oynl0B0fe7DXTiXE7GWa5OEVYtUDBlZO+qgFxJUqkOCaVa6bLCW0LFA?=
 =?us-ascii?Q?R1I++lVFOv9ZJIXVWufy9lFSudgkriEzRksK20z2QSLirwOnFQ8Ibur8iwRf?=
 =?us-ascii?Q?3h2tjXdHYZvMocL5wFpb2fIO3T7d8bqrHj1DvYeyEIrTBZez4vMLLUtFPYk+?=
 =?us-ascii?Q?T1MDPptf7y648D2212VwLvPYJAkFgjqPWSzIwauP7eOWKB4rj3MsB2EnDpeK?=
 =?us-ascii?Q?mdSzCCwI+HJ+j66FKBi010ZsObZwCTWdC9aYGA1CYq7vspz+lTN5ONABHdWh?=
 =?us-ascii?Q?YR9w0WJK4GvCJ9FgrPnIyHSDgfw6r8qVAan5Bcd2wYbHJnCHiYq0HvJXqhgc?=
 =?us-ascii?Q?ewWmM9gJWbmpwKF86vKlYGy68E9q5bMAZLvRdgFIaTzVnh9cYjGZg3WUoCXx?=
 =?us-ascii?Q?hjs3Rip8Y+kIE89NDXuuUT1EBDS6zYIqgCO7uc5h4WE5aI1ihB0JWCcgI8dJ?=
 =?us-ascii?Q?R6n7+N5iRoifX8eO2dR4j8DY8Ee0qP23OzPnaQajOnrmK888RX2JlKzy+fGL?=
 =?us-ascii?Q?zpaP17ARTOYFcT0Ib/8iUjtvHtUgodbN9Se4H0ZINH4t8nAbbEo+ocKfK6B6?=
 =?us-ascii?Q?/ykOaActVYURGbDrTtxqK+k6pnlM3A+pSDXHis3u7KPXHldf640jJjuONGJX?=
 =?us-ascii?Q?g7vKV1lY4V1Avg4tcxxVBo0fa1uGLZ8wrcFmgl6zQBaH5sTpUiHRCQqfWTlh?=
 =?us-ascii?Q?D4DgRfjAAcnqXLrpWa4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7b1106-b0c8-4e5a-8545-08de17ba444c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:43:11.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUaLv9YnM+gULZTI5fZqwfID2kooSKJU6o/Let2mUmd2uLdyYJrhpT/+LBCP8Zah
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
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

On Thu, Oct 30, 2025 at 06:17:11AM +0000, Kasireddy, Vivek wrote:
> It mostly looks OK to me but there are a few things that I want to discuss,
> after briefly looking at the patches in your branch:
> - I am wondering what is the benefit of the SGT compatibility stuff especially
> when Christian suggested that he'd like to see SGT usage gone from
> dma-buf

I think to get rid of SGT we do need to put it in a little well
defined box and then create alternatives and remove things using
SGT. This is a long journey, and I think this is the first step.

If SGT is some special case it will be harder to excise.

So the next steps would be to make all the exporters directly declare
a SGT and then remove the SGT related ops from dma_ops itself and
remove the compat sgt in the attach logic. This is not hard, it is all
simple mechanical work.

This way the only compat requirement is to automatically give an
import match list for a SGT only importer which is very little code in
the core.

The point is we make the SGT stuff nonspecial and fully aligned with
the mapping type in small steps. This way neither importer nor
exporter should have any special code to deal with interworking.

To remove SGT we'd want to teach the core code how to create some kind
of conversion mapping type, eg exporter uses SGT importer uses NEW so
the magic conversion mapping type does the adapatation.

In this way we can convert importers and exporters to use NEW in any
order and they still interwork with each other.

> eventually. Also, if matching fails, IMO, indicating that to the
> importer (allow_ic) and having both exporter/importer fallback to
> the current legacy mechanism would be simpler than the SGT
> compatibility stuff.

I don't want to have three paths in importers.

If the importer supports SGT it should declare it in a match and the
core code should always return a SGT match for the importer to use

The importer should not have to code 'oh it is sgt but it somehow a
little different' via an allow_ic type idea.
 
> - Also, I thought PCIe P2P (along with SGT) use-cases are already well handled
> by the existing map_dma_buf() and other interfaces. So, it might be confusing
> if the newer interfaces also provide a mechanism to handle P2P although a
> bit differently. I might be missing something here but shouldn't the existing
> allow_peer2peer and other related stuff be left alone?

P2P is part of SGT, it gets pulled into the SGT stuff as steps toward
isolating SGT properly. Again as we move things to use native SGT
exporters we would remove the exporter related allow_peer2peer items
when they become unused.
 
> - You are also adding custom attach/detach ops for each mapping_type. I think
> it makes sense to reuse existing attach/detach ops if possible and initiate the
> matching process from there, at-least initially.

I started there, but as soon as I went to adding PAL I realized the
attach/detach logic was completely different for each of the mapping
types. So this is looking alot simpler.

If the driver wants to share the same attach/detach ops for some of
its mapping types then it can just set the same function pointer to
all of them and pick up the mapping type from the attach->map_type.

> - Looks like your design doesn't call for a dma_buf_map_interconnect() or other
> similar helpers provided by dma-buf core that the importers can use. Is that
> because the return type would not be known to the core?

I don't want to have a single shared 'map' operation, that is the
whole point of this design. Each mapping type has its own ops, own
types, own function signatures that the client calls directly.

No more type confusion or trying to abuse phys_addr_t, dma_addr_t, or
scatterlist for in appropriate things. If your driver wants something
special, like IOV, then give it proper clear types so it is
understandable.

> - And, just to confirm, with your design if I want to add a new interconnect/
> mapping_type (not just IOV but in general), all that is needed is to provide custom
> attach/detach, match ops and one or more ops to map/unmap the address list
> right? Does this mean that the role of dma-buf core would be limited to just
> match and the exporters are expected to do most of the heavy lifting and
> checking for stuff like dynamic importers, resv lock held, etc?

I expect the core code would continue to provide wrappers and helpers
to call the ops that can do any required common stuff.

However, keep in mind, when the importer moves to use mapping type it
also must be upgraded to use the dynamic importer flow as this API
doesn't support non-dynamic importers using mapping type.

I will add some of these remarks to the commit messages..

Thanks!
Jason
