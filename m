Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65779A1818
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9473410E788;
	Thu, 17 Oct 2024 01:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LaqE1P0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9B210E775;
 Thu, 17 Oct 2024 01:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/eTogdO9sqWlUk7jEsYQCBn/o4J41j3urE6LtVvlYJCC2eRqT+FFO8sTqtI3r1GEIAdeu9pHq34ouK6XdLJ3cuJuvPWI0uLoNzMMbHNNCp0xgzmm7iNvTffVch+IRGnloiL7iaTZz7DN5YuD8VbH0u50+br7I6AdhR8+Smv9Q50LAwqDBLA+EAS2xbLPKavTfAmddeK6acKC3QetoiTnRLuH97Mz5QA8Nrxqgyf4v7n7GHBmy2WneAzVJStcUa38B8JfRiZrCOnOMcXWNkE5swLPmI3arD5uENZnO5EpATvy/G5wLCVAAQmZq6IW9V/p51wrj2Lb44qBQJHqwIl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNB5+COyH9uGAPgEUJcQmboyzpi8mYne0O4Brw9iZAo=;
 b=G2UX8APLSYaSD6C2qWPeturPutQNKVmFAtTmXSDG5jUerUm5EvjVmSUfRB4xELJB8Madnazm8mSOBT6GDoRB1gxuA+6tPsuOGKc49iEJicIiKSazvtu0TZNipBV78FuJXYdNH0WeoDqm3uD70tgiqB8m6OhD7i+J/OJAHuXPTGRk1EiPj3HlMTYi8svxFB0B+Ep9W4aAOl42POeM/JV2I5nrGCQmfTsS7XsVcq2rT0U9qrxxHLN1VnKGPmrVsp1hWRBpdnpLxWqP5NQV1dWHpmgEX+6jgagUpj3x6PHaVL52GcNATb2h8FMbw1sOOSyqqpJ4fZA5pGmWYFb2lyk8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNB5+COyH9uGAPgEUJcQmboyzpi8mYne0O4Brw9iZAo=;
 b=LaqE1P0dWpbyHmQ06VwQLJMlbU0Q5tsuQBS2Dr3WEHYC3YItx6QoydJJX2J7vEdHtZkrXd2Xue/t2C2PrEkGjOEEcSRr2SPIbrTiyIJQz6NCSedUf0Yr7slOGUtvq6ASij1Z7sv6AffbRi9K5hBDMvmLigbfB1I0dXUl2ZPpnvWrKnKF74o7GPurCsdKF+OzuZDCadYCfGOp10S/00bGDJCLc7e8NPDr3TPo92iDnusl1oNlGbHL/aM+KQbHGVy4HDt/4O9ROKB7v4Gf/S7bBvwGs7K7HHm509mzsGANv41AEq6pKArLem1zGKRgUas5zzCBNvYQY48rXBUwirAS3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.31; Thu, 17 Oct
 2024 01:50:51 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 01:50:50 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Thu, 17 Oct 2024 12:49:55 +1100
In-reply-to: <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
Message-ID: <87h69bo5u2.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0095.ausprd01.prod.outlook.com
 (2603:10c6:10:111::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 627961de-e7e2-4f28-8ced-08dcee4e20d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVA/DFC/16lz5JZwj8xl6/Go+dg8OCsVci4ZQ0s6UNktWqvaFzqqHLTO+LK8?=
 =?us-ascii?Q?i+7PJa+e1Mutgt+QQ23x+XxRK/DG6MPgJCKE07PcCs3iLCYjjHX4nvULti+0?=
 =?us-ascii?Q?5AJeqWpD9m3EgsmvUD4fv3NKyucUbY4Nlxk21rww2Qn4Nk5WucnQB2Ta/Mc+?=
 =?us-ascii?Q?75vS+IiaUHTjX/iHRh4YVghK5hkInfb/WbVmEX68dan93zMh6ej1uaRRTFKf?=
 =?us-ascii?Q?cfoZos+frVKo9HHo3kUBMMDGnDGCmHlV5VHXLCkhhPvhpjLTzRjjqxHkl62q?=
 =?us-ascii?Q?CHzfZIRJV4/84sngDw5ph+BDXQia4ySKlDLExLjpeq6V+tQQrVQSryPOXWrk?=
 =?us-ascii?Q?r7ieOxzL4aefJNfbyS1G1NDnWj6EccnzZNtuA6t1IOJrjVo4kLr/hLIK2fzR?=
 =?us-ascii?Q?lfK0QmeRPPAUXDChxFgx4qCqMx4YTVro2GQszqyGdaBKQajSvYQTyRxMVf2W?=
 =?us-ascii?Q?f/PiamwuSb/QZdJKSOgbJYx8BRhNM7YuewFhA4FV2dJNoObHkj+LELIzNeM7?=
 =?us-ascii?Q?ZTzkW1kWO18CQVSmklcmjiSXtpsQn2nySmHZNqQRyYz7IIq7ssQU+631Yd7z?=
 =?us-ascii?Q?w2ry/kyrYR3VPQj5fiRS3HQKa9oyGKPTEFkgvZt87QaFjSoWju1013mbIRmz?=
 =?us-ascii?Q?7NRTCtClubBJlx5VDwsSge38yROooXuN3ho8SRc3W0URcyP+IKrt9i8dZQ1s?=
 =?us-ascii?Q?Gv6txdlg1jtECyuiTU3zCJPa9yC+IpLIRydt0FBSsSOvfVs43cKYTPAuO9yc?=
 =?us-ascii?Q?y2/KWAoZSFQo6vlX08MgFMsWI3nyK+pCw4ErhHwyXfz2kCHSFvqKWqY39VK+?=
 =?us-ascii?Q?b+RWsoT7c5WNyNTEsqeGzsd/gtINcbkVVAIEpIES+kF9YNRYpONDkPa2pM5W?=
 =?us-ascii?Q?OG6HGhIz5VoBXtvHFwWxyhnSHvCMLIDkbr3EZ+UxaiAY3yf3qPs3cg2v1Dlf?=
 =?us-ascii?Q?q3rJ+jA5kukJjCyio/XG11ziJPtAg0IDbUvEoqKudJsyIKoI597yhBTnozh9?=
 =?us-ascii?Q?RSY5L9cTmPv2gkP+Tx5CNT2DsVIlRstxgbhlSxOQ9+Dd6VjGVcE22XEkMsOk?=
 =?us-ascii?Q?9mwNYmQP2/qNOmq3d0pDB6fVeaQtUIlDEswue2WUcrUqz/m/+lk641aJOqO/?=
 =?us-ascii?Q?/kwF0AIUmSgS9tusALel366AgqR/sZIRVIGgTMW86hPdtcHwj/HDIMYTXUhC?=
 =?us-ascii?Q?UMGxD8QOUfcA5C2zbhr4nC/7QSEWvE44hJzVdFSblBpqMAIko8dUmVv+P3b7?=
 =?us-ascii?Q?944riiZ+Nm6J8kQBqI9tCsbnUjeD6bY/I1UuGcoEz/XHg203rD5YRZYkSMXB?=
 =?us-ascii?Q?4LCj7iOltZ3aywLSeQ9I7/vO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nauVmCPnrHvgUbIS2KjSeTPSgm0gOw2nSN1gpihSmdvg+h7D9UAXRzOUbEXr?=
 =?us-ascii?Q?0cohPbNPEOFb79xSyQmpP+XdjShmzUdmnGDH6ba2HPvvLIq8oUAyXms77FyF?=
 =?us-ascii?Q?aZTZHqe/i02C6NpJG5EH+YDYJLDL81p9vd9rKAqK0IkkvBg0qM7XmQoP0gBc?=
 =?us-ascii?Q?7UoYE4t8hVcFcRXSHr/QwMNe2Wj2+IumazYTcg+8zHwJVB5P8D1M4WdGIJ57?=
 =?us-ascii?Q?qu34/PHMNP8Wibkds/B5SN6O9Y/WSme6LRtq6g36XN4pMrRrhgNQJXGWw+wX?=
 =?us-ascii?Q?P5YgUJCjZJNRFEB4rLGGqEeR19x4lUodIFSP3Xqzv+3DjzioJSnP50SG1eXM?=
 =?us-ascii?Q?gr2XhA2RnJHGoll5BmD8IXt6tH1KCZpWWvbuHOPbP5aXO+gPfmjEHEG7M5AE?=
 =?us-ascii?Q?3ArswH2/NxiEbi51PuoxhLwEmDgd/GT08PIJvSVNimnAmDctQSfK/wagPVvy?=
 =?us-ascii?Q?24QzgEKEOgny460cfR7Vcg0D1oMQR4bBnq70jI/uXrkI2BjbqvQ7zHVagXiU?=
 =?us-ascii?Q?45gdpiJysNEUjSp0clhcfFWZ/h73U+8UwAcNvRtlO6L4zue13yZCtmKQiQGU?=
 =?us-ascii?Q?E+NEQEIqK3aeLwtP7EK0wuXGpPjRNOGMIP3l39NOMIGegqnzZQ3D62f1U7nu?=
 =?us-ascii?Q?qCHCWRCpduRiX1JEZ/HarQxlUAk/E63cnbscX3t4f8R3ZVbOwtaTUndw9WMk?=
 =?us-ascii?Q?nRyFrisSA8BbqjIG64iVLCZKx8pvVYrGLoX/7fM7vFezXAh+hbBoV/pOGWVF?=
 =?us-ascii?Q?12NvfnrtPxkhFy8uLwGJyJifOOz867jseE+H2eL1dXNwcgzii3CcrD+ANrdT?=
 =?us-ascii?Q?fJdDYOc7fBGvTYSmaLenLCczSEydN/RcFK2BmhyADfJeWhr1s9oOhQMmyjbH?=
 =?us-ascii?Q?hC/EVvFyT4JAM45VmqKpf0J43EskYev4xj2oSql16+lNOmE5p6Q5TvQf6Frn?=
 =?us-ascii?Q?G65VHflgYXWnjXigXw7+Y/cgJEWxuVeOJd746z4tW9Z3+DRGYkCfh2rgJR1m?=
 =?us-ascii?Q?umvBv8UItr4cyzxNT0qJK7x3ATRFv1Zs2nahKpoz3n6rxShJTTIc83cn7naY?=
 =?us-ascii?Q?rSNm+oOx7TpiMK4irtS3X7kt4NVE1q0/ChcPAfZlq6Tk5xqTTl2VjBmH1b/2?=
 =?us-ascii?Q?oTxPsUas9ClaE93ZtW+hxfmbse/IeXpnqVfuCRdThjP4cqIHFXj4UEg8p6yF?=
 =?us-ascii?Q?z7brEtGnRGfcg9iHhFwZGuxCxWP2fTV1DHV8YUYcDNTqKFjLaBFfBoPpfXJK?=
 =?us-ascii?Q?mMBhs3wruREvrejE4WJSePWXsEgKz/T31sOatoEwcsUHKHm/H6w1jPabNWZZ?=
 =?us-ascii?Q?u9StGxdDPw/wEgpKDeo68I6u9O2N7/AM10uRczVL8tyef94xdt4WJYcex/FK?=
 =?us-ascii?Q?snPR4NS9Sh7crWQ1mtcd3Ihve2PnZjFY155wB0LdNaOCnwgMqMmnkQwee+2b?=
 =?us-ascii?Q?cgWTQgo03VzdqNeXrPn08nIl84oPOynBJOVhgaHEcTkuA5lSOb7UemRqNxDy?=
 =?us-ascii?Q?9hyr76qTbEeKHu6TiAdc7JC81VAu6dTK2sEjYi49qeEqx1wV6W+gglpg2d+T?=
 =?us-ascii?Q?xi/wod1v7eCtLMUSoIFI33U4payYEa8BZB27QyuH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627961de-e7e2-4f28-8ced-08dcee4e20d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 01:50:50.8545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiUftJAszJfZg6eWO203qD2bHJDQbHpRmHpViOzaoiQw7QRhLZc84YVHzGDKIFwBXEgFvoWZITCLGjvexfBgYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958
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

> On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:

[...]

>> > > +{
>> > > +	unsigned long i;
>> > > +
>> > > +	for (i = 0; i < npages; i++) {
>> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> > > +
>> > > +		if (!get_page_unless_zero(page)) {
>> > > +			src_pfns[i] = 0;
>> > > +			continue;
>> > > +		}
>> > > +
>> > > +		if (!trylock_page(page)) {
>> > > +			src_pfns[i] = 0;
>> > > +			put_page(page);
>> > > +			continue;
>> > > +		}
>> > > +
>> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> > 
>> > This needs to be converted to use a folio like
>> > migrate_device_range(). But more importantly this should be split out as
>> > a function that both migrate_device_range() and this function can call
>> > given this bit is identical.
>> > 
>> 
>> Missed the folio conversion and agree a helper shared between this
>> function and migrate_device_range would be a good idea. Let add that.
>> 
>
> Alistair,
>
> Ok, I think now I want to go slightly different direction here to give
> GPUSVM a bit more control over several eviction scenarios.
>
> What if I exported the helper discussed above, e.g.,
>
>  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>  906 {
>  907         struct folio *folio;
>  908
>  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>  910         if (!folio)
>  911                 return 0;
>  912
>  913         if (!folio_trylock(folio)) {
>  914                 folio_put(folio);
>  915                 return 0;
>  916         }
>  917
>  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  919 }
>  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>
> And then also export migrate_device_unmap.
>
> The usage here would be let a driver collect the device pages in virtual
> address range via hmm_range_fault, lock device pages under notifier
> lock ensuring device pages are valid, drop the notifier lock and call
> migrate_device_unmap.

I'm still working through this series but that seems a bit dubious, the
locking here is pretty subtle and easy to get wrong so seeing some code
would help me a lot in understanding what you're suggesting.

> Sima has strongly suggested avoiding a CPUVMA
> lookup during eviction cases and this would let me fixup
> drm_gpusvm_range_evict in [1] to avoid this.

That sounds reasonable but for context do you have a link to the
comments/discussion on this? I couldn't readily find it, but I may have
just missed it.

> It would also make the function exported in this patch unnecessary too
> as non-contiguous pfns can be setup on driver side via
> migrate_device_pfn_lock and then migrate_device_unmap can be called.
> This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> in [1].
>
> Do you see an issue exporting migrate_device_pfn_lock,
> migrate_device_unmap?

If there is a good justification for it I can't see a problem with
exporting it. That said I don't really understand why you would
want/need to split those steps up but I'll wait to see the code.

 - Alistair

> Matt
>
> [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>
>> Matt
>> 
>> > > +	}
>> > > +
>> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> > > +
>> > > +	return 0;
>> > > +}
>> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> > > +
>> > >  /*
>> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> > >   * a reference on folio which will be copied to the new folio if migration is
>> > 

