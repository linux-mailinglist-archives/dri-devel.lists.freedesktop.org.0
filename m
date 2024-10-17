Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA29A3081
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 00:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DB410E226;
	Thu, 17 Oct 2024 22:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bj9c7tn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F21410E226;
 Thu, 17 Oct 2024 22:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9LDWhVH+ty3FSRJqKAzm50fTZfTrGF7oBujYFcbpuw0af+EO8r45zw+0tp+2NckVsTaHEesWiYJm0TFz1p21sIJBEpqvodbVgAVH8CN1N26oLQHAzYGZA2V5KccvgTDwedAaKdSF3OWNAMciYZ8WidOk6i+hze4XLB417p1aJwyBOsAnsfe8e7AYuebA4+ZB0BEOcxXaT7mfztapVP4fCh2gdR0wiXjLUiLBekkKMzIY8qpNMpeAXZX6ZFYwy7oknbhf1Oi1x6c7MkqcEhNoTJ6YGyRoZ9MwOiPHTeEPu48O72Kl62tRHkmUHVSzrkbZCCOpbamJ5Wkelu5QYoAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Be8AsLgvZBKEQ/IiOzUDOq+uq7bpwoCoEYhReiuBWQ=;
 b=PzV5wgmZgi5GDd5vy2jWnkrr0pL1lPJM1v7AgK5jUKrqWcoJVAk8aOIc4C+kj0tfRlwoGS83hZQvNuEoCMdisgQ4Cbk3kAXlyFVSRTBkUDsh9/Rj3GaaoEcIjt+hFYM2DIwqnbsxOt3a8HxGcS2fPgEcDpaGIk9TbeLV3J/5jMb0i90Lqbvdt0V7Pld9xMuCltjkfC+QYwjY2kttkl3PeAQqNLl3KxeOdNGveGOcgbag6TDwEuRroLVzYuDUqhd+NKybWTsApmQxi5yXEmf4E7G4foSnyPC5xa6EC/zhR8+4+v0ucgxntNSGAXrAfbfrCxveNJ6l0Qwn4lBDkl0O+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Be8AsLgvZBKEQ/IiOzUDOq+uq7bpwoCoEYhReiuBWQ=;
 b=Bj9c7tn1mugMHABhx9FimyRmYcaXieUBgo3Qd7oLVfGubRmtUX/0lLDyHYsjkQ2P6aq2l3qO+SGsZPMexg6tI0pjcu7iDEzcRW3Nl38xFMX6GaC+dcsK9PBiLz6z9WT0+hsKpT9gFquT5QyCnDOgvmMHmmXSGDA4L9c89o6iMFJKlgCDi1c5BxjB0ccVi78spZosRb3eP5oUy9DX3V8K/UThz3ILfustsKa9l9rDddhgA96o5uW5i5tofwhd4ftMFcx23X+CqYvY1eAWZUpLvSirAvTSYoB8Xhm5ZyCtT6oJSCvJtyoF4iSLT3NO2MkKNIEWKbrGUHlyIhefz5CbgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 22:11:45 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 22:11:45 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Fri, 18 Oct 2024 08:58:02 +1100
In-reply-to: <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
Message-ID: <87r08emlb7.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0109.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 33406031-00bd-4a69-9746-08dceef8afbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvQmuJJOSNa2rINU1H2GOaMhpPcnE4wIXUWeYHE/kNQMHTa5P3T9SBn1cRCk?=
 =?us-ascii?Q?pvjXSqLcxTIz87Gfw2F1/kZpSdjsnW4LWoIXzEeHWsPOr3qR/JWZFSYF8jTU?=
 =?us-ascii?Q?dPi19xqQE0aYk63g+RwaRQ/IVJduUEfm8sdSUEeOYd0XNtEQORud88d/s93I?=
 =?us-ascii?Q?L5CcWopZnvL3v0h+ijz7Fc3pUMR0JEHT46yZwcoCvA/5aL7mUQyaeNIs6LT3?=
 =?us-ascii?Q?Gc5X6+zkQYsQwwE4U/M60MN9SkOO9dE7WetdyfqVFwK4NQRTZGcwrkRQxmGL?=
 =?us-ascii?Q?oscLRs37TtDMn6wblPrqHIMOMPPDmMZ1/ENhmYAV7YPmgtjwDeYLN2fbg58O?=
 =?us-ascii?Q?ygo7UEHhqI1jhqd2bLre8uOZlGlJ6B+rVrMGih4PI/4MHjNKJh1fVtBdl8jx?=
 =?us-ascii?Q?MZOXdWDm1rpaSQr3LfeE9IDOk+7UaeLFVIYd1suu6pCt9khGTjQKoA98Ku9P?=
 =?us-ascii?Q?wYE2Ni3xZJTazVZV0dAB3/ULCvcsX0h/esW9PERCFoYR1kBzhZsuDQX+H9TG?=
 =?us-ascii?Q?skT9F8A1h+9BXGEdNGe0n+n5nhxhrC76G2Z7re2JDP3LK916aMCNIHP0bVtu?=
 =?us-ascii?Q?bVSKlfJjlVNdXKYbFAZzKy9+cfYk6Y5U+hTSi11f5hlEzev4gqxeG1Z3QJvX?=
 =?us-ascii?Q?Ez/k7jUpYfvJYf1SK59lfaoUynJh5IVvvUbCWFoy9MJl2drlNJ0FP6yNF72D?=
 =?us-ascii?Q?0sZPOtZm1dk3nJs5dlNSNfnPfAuz53Lm9padKnsvjjUm5TI0GxRMs9uSt21h?=
 =?us-ascii?Q?Yfn7mfDzEtFe7uyslGvf87tW5WKnDwUmM+4veUiHOJGf9pBdgcXuE/NZqV8Y?=
 =?us-ascii?Q?EIPxZY38m+UR8ki9tAXBc9NAfXpzT+kJ2Je8hd0orsPbOPNAqkSKbFNwbb8T?=
 =?us-ascii?Q?3s5M9Ll9GIeM1fIsyXTYHm0Fdcy+O9oPdqaFnTrUI7kLnUYu3mPbK7X56hyu?=
 =?us-ascii?Q?OXd4lqg0ORNEH+gMruGGb1C2VFyLYULiD3alrg1qjWifN5WrdVyNF818Ehsx?=
 =?us-ascii?Q?rEWQE3DlT/YSBAv/sB64PC/CGEwotqiLd45sA6npimN7RTaXe+sht2WmkznU?=
 =?us-ascii?Q?mieTUNDBGxJUtBvQFEEeDlBLEE9gOf4UqzkYbuQRDg/2ijA33l67QysKnEqB?=
 =?us-ascii?Q?W/hyawKCMX6wTQxqrjjHgguaZD7c48aI2mgWg7eoSr/x74tlWxNKwjfVuKYg?=
 =?us-ascii?Q?jpePNGG82jn7R5laFFKTZGvgiQWvSEHmcSb0+fAiD/YC8Z6hddIdMeuN4yaB?=
 =?us-ascii?Q?JFj8p70YU/17zJ8IslE9EcPr6vc3iLDou/dt8kgXbMfsAIs562WM17VuC4+C?=
 =?us-ascii?Q?3V0ctO27Nx1YrNMwUIob4yKS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQyWfdCorT+EEWTNr9yAgaYYa7F7N94wJOnl3v37kvQKTUjXs5XAosWNKrTC?=
 =?us-ascii?Q?1vnpL6bvcihaQENIq2+zc9T3K0Bau9VyT+h3jSvoUuPuPYa/m4AZS87BF6UO?=
 =?us-ascii?Q?ZLgE1D8cBaeytVABvvVqDOUQn3tZO9pHlqkZe78VM0cNtqnIoTsZa7OCW+sK?=
 =?us-ascii?Q?6RE6tk4bJ9WO7ohmUhKRi4Sl+JrizXikG+ME0sai+b7/K/a2TIB68IfHEmaF?=
 =?us-ascii?Q?FvPnpgfzE3CGCbI4Cb9Sena3CX2fmd1AAiKyWquOHp8rnbenE6rLgwfIRDi9?=
 =?us-ascii?Q?VFL6iDvWwYowSVLHqYIg411wwTaL/OxAkCvfuLw0iIKDvnrfoTpHGmVMeTrA?=
 =?us-ascii?Q?JI1IV/oeWE+tM3XzgzamsFDGp6IcaS402NikYUcp6UdClWGdGdTMkGtYmoJJ?=
 =?us-ascii?Q?0pZutt0iPBERG2/H+eUPZebiJJP3Oxnt+8Fsluo0OlMTxwtp9H7rQim3tHet?=
 =?us-ascii?Q?6BZESusHnYnFDOPbkiUPsnp6qiITJFMjH13yvw3gp6zhv8hnLH0us/o4aYLW?=
 =?us-ascii?Q?ip24lXnVDb9rFtBIcruK9bvUib1uVWmN09TJ9Z/wHhTS+0aeyfEWfTl1yVwy?=
 =?us-ascii?Q?6Fdaov1jWVyLg1E6HU9s9gqpBtyyzFmH6BqrNmKTfNZe1TehWO4KDxyvl+q6?=
 =?us-ascii?Q?/f+OaL6ky1iz+OAPmqxhQLEZKe00o+d6TS4Me7Z+k36u2do/v46PuF/nmo/C?=
 =?us-ascii?Q?c6a+bLXF6hHf5+soep6feSAMAOyxTyrq95N9A6U+LGabwSZXPCwm+TwbcEU1?=
 =?us-ascii?Q?BECNSq6XPSWQOR/hE4mOHaX95Y/LTbG0gNIw8WT2mkxEDc30LAqt7SI2CNiF?=
 =?us-ascii?Q?lxH8iNXe7d1vtFYD4aZ0gUOaSgt+UyGytWqR0XbIN04y3s0DUSZmram2bGRB?=
 =?us-ascii?Q?9bZnFgdCWApIczxZFridL+CDZbWqmLFYL7LSZr24CIKbsWGWUAojHPIkYIT4?=
 =?us-ascii?Q?0+CxpRjys0of5wIr8P1eQ1LUof2uRZzQSRPlrZG/wSqMWsrg4g8xOEglqGxT?=
 =?us-ascii?Q?ul+r0kBdtHfObf6TdryCtltBPJjRzJMr6R+U/aHiTEpWw/+n1fLZsbNZgL0Q?=
 =?us-ascii?Q?DETZ6SMdPn0nDc8uVfF225jiziA+AwYcHpKO9zqIw5kYT2LIgPA9eYLMS489?=
 =?us-ascii?Q?+uaymSdk8u8w5o51E8sT6Ulf9zyQqIsB3+9q93UuO9kXYJBsjR5iTJ0m3DMD?=
 =?us-ascii?Q?MwJuh2XIVxCSz1LXmomXgbRbUpwW4xMFbT4hM8E3+TUN+g4d/kGTKwfsVubv?=
 =?us-ascii?Q?krrU1vcoaOtSfZZ+vG1ghkte+hnBBYwM/Uq8lY4SxyEY07mh9t6XrH1nSqOR?=
 =?us-ascii?Q?QXEH1y9FjqL6fMn0H+KXrxaXXe9/ScGaEeU3G8QbrG+9YeGUlYuXBkkyqIPT?=
 =?us-ascii?Q?UDYIMDrBigHf2HOYPnpFeKd2g7MuGQt0ecvAcIefaaOsyNM71PNJ/83Ey1Wq?=
 =?us-ascii?Q?9h/KiNBpvmSiMgHkg5+BRGH3y/oxkTydjpDD6sdRBC/HQr3Ubxkc7NOd8MYc?=
 =?us-ascii?Q?1RflL+khovYchQEtHwBUEP2WjwUr+td69j+WNHVURVME/hAYK9N0LPm2Mtkb?=
 =?us-ascii?Q?GWKcfBRGcBOHspERpnYdzCABhODTNRCuI7JcbhF0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33406031-00bd-4a69-9746-08dceef8afbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 22:11:45.0786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSA0AI3p6yl5kOYNLRvOzTqLtmpK5I8fSf9ollUwDtXKNXVFlwml6SJLLcURbYmyPRmf5svLtpovtoY8jXqU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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

> On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
>> 
>> Matthew Brost <matthew.brost@intel.com> writes:
>> 
>> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>> >> 
>> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> 
>> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>> >> >> 
>> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> 
>> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>> >> >> 
>> >> >> [...]
>> >> >> 
>> >> >> >> > > +{
>> >> >> >> > > +	unsigned long i;
>> >> >> >> > > +
>> >> >> >> > > +	for (i = 0; i < npages; i++) {
>> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> >> >> >> > > +
>> >> >> >> > > +		if (!get_page_unless_zero(page)) {
>> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> > > +			continue;
>> >> >> >> > > +		}
>> >> >> >> > > +
>> >> >> >> > > +		if (!trylock_page(page)) {
>> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> > > +			put_page(page);
>> >> >> >> > > +			continue;
>> >> >> >> > > +		}
>> >> >> >> > > +
>> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> >> >> >> > 
>> >> >> >> > This needs to be converted to use a folio like
>> >> >> >> > migrate_device_range(). But more importantly this should be split out as
>> >> >> >> > a function that both migrate_device_range() and this function can call
>> >> >> >> > given this bit is identical.
>> >> >> >> > 
>> >> >> >> 
>> >> >> >> Missed the folio conversion and agree a helper shared between this
>> >> >> >> function and migrate_device_range would be a good idea. Let add that.
>> >> >> >> 
>> >> >> >
>> >> >> > Alistair,
>> >> >> >
>> >> >> > Ok, I think now I want to go slightly different direction here to give
>> >> >> > GPUSVM a bit more control over several eviction scenarios.
>> >> >> >
>> >> >> > What if I exported the helper discussed above, e.g.,
>> >> >> >
>> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>> >> >> >  906 {
>> >> >> >  907         struct folio *folio;
>> >> >> >  908
>> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>> >> >> >  910         if (!folio)
>> >> >> >  911                 return 0;
>> >> >> >  912
>> >> >> >  913         if (!folio_trylock(folio)) {
>> >> >> >  914                 folio_put(folio);
>> >> >> >  915                 return 0;
>> >> >> >  916         }
>> >> >> >  917
>> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> >> >> >  919 }
>> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>> >> >> >
>> >> >> > And then also export migrate_device_unmap.
>> >> >> >
>> >> >> > The usage here would be let a driver collect the device pages in virtual
>> >> >> > address range via hmm_range_fault, lock device pages under notifier
>> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
>> >> >> > migrate_device_unmap.
>> >> >> 
>> >> >> I'm still working through this series but that seems a bit dubious, the
>> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
>> >> >> would help me a lot in understanding what you're suggesting.
>> >> >>
>> >> >
>> >> > For sure locking in tricky, my mistake on not working through this
>> >> > before sending out the next rev but it came to mind after sending +
>> >> > regarding some late feedback from Thomas about using hmm for eviction
>> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
>> >> > doesn't work for coherent pages, while something like below does.
>> >> >
>> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>> >> >
>> >> > Here is a snippet I have locally which seems to work.
>> >> >
>> >> > 2024 retry:
>> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> > 2026         hmm_range.hmm_pfns = src;
>> >> > 2027
>> >> > 2028         while (true) {
>> >> > 2029                 mmap_read_lock(mm);
>> >> > 2030                 err = hmm_range_fault(&hmm_range);
>> >> > 2031                 mmap_read_unlock(mm);
>> >> > 2032                 if (err == -EBUSY) {
>> >> > 2033                         if (time_after(jiffies, timeout))
>> >> > 2034                                 break;
>> >> > 2035
>> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> > 2037                         continue;
>> >> > 2038                 }
>> >> > 2039                 break;
>> >> > 2040         }
>> >> > 2041         if (err)
>> >> > 2042                 goto err_put;
>> >> > 2043
>> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
>> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
>> >> > 2048                 goto retry;
>> >> > 2049         }
>> >> > 2050         for (i = 0; i < npages; ++i) {
>> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
>> >> > 2052
>> >> > 2053                 if (page && (is_device_private_page(page) ||
>> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
>> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
>> >> > 2056                 else
>> >> > 2057                         src[i] = 0;
>> >> > 2058                 if (src[i])
>> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
>> >> > 2060         }
>> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
>> >> 
>> >> Practically for eviction isn't this much the same as calling
>> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
>> >> probably shouldn't be looking at mm/vma structs.
>> >> 
>> >
>> > hmm_range_fault is just collecting the pages, internally I suppose it
>> > does look at a VMA (struct vm_area_struct) but I think the point is
>> > drivers should not be looking at VMA here.
>> 
>> migrate_vma_setup() is designed to be called by drivers and needs a vma,
>> so in general I don't see a problem with drivers looking up vma's. The
>> problem arises specifically for eviction and whether or not that happens
>> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
>> issues there (see below).
>> 
>
> Ok, if you think it ok for drivers to lookup the VMA then purposed
> exporting of migrate_device_pfn_lock & migrate_device_unmap is not
> needed, rather just the original function exported in the this patch.
>
> More below too.
>
>> >> > 2063         migrate_device_unmap(src, npages, NULL);
>> >> > ...
>> >> > 2101         migrate_device_pages(src, dst, npages);
>> >> > 2102         migrate_device_finalize(src, dst, npages);
>> >> >
>> >> >
>> >> >> > Sima has strongly suggested avoiding a CPUVMA
>> >> >> > lookup during eviction cases and this would let me fixup
>> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
>> >> >> 
>> >> >> That sounds reasonable but for context do you have a link to the
>> >> >> comments/discussion on this? I couldn't readily find it, but I may have
>> >> >> just missed it.
>> >> >> 
>> >> >
>> >> > See in [4], search for '2. eviction' comment from sima.
>> >> 
>> >> Thanks for pointing that out. For reference here's Sima's comment:
>> >> 
>> >> > 2. eviction
>> >> > 
>> >> > Requirements much like migrate_to_ram, because otherwise we break the
>> >> > migration gurantee:
>> >> > 
>> >> > - Only looking at physical memory datastructures and locks, no looking at
>> >> >   mm/vma structs or relying on those being locked. We rely entirely on
>> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
>> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
>> >>
>> >> I also very much agree with this. That's basically why I added
>> >> migrate_device_range(), so that we can forcibly evict pages when the
>> >> driver needs them freed (eg. driver unload, low memory, etc.). In
>> >> general it is impossible to guarantee eviction og all pages using just
>> >> hmm_range_fault().
>> >> 
>> >
>> > In this code path we don't have device pages available, hence the
>> > purposed collection via hmm_range_fault.
>> 
>> Why don't you have the pfns requiring eviction available? I need to read
>> this series in more depth, but generally hmm_range_fault() can't
>> gurantee you will find every device page.
>> 
>
> There are two cases for eviction in my series:
>
> 1. TTM decides it needs to move memory. This calls
> drm_gpusvm_evict_to_ram. In this case the device pfns are available
> directly from drm_gpusvm_devmem so the migrate_device_* calls be used
> here albiet with the new function added in this patch as device pfns may
> be non-contiguous.

That makes sense and is generally what I think of when I'm thinking of
eviction. The new function makes sense too - migrate_device_range() was
primarily introduced to allow a driver to evict all device-private pages
from a GPU so didn't consider non-contiguous cases, etc.

> 2. An inconsistent state for VA range occurs (mixed system and device pages,
> partial unmap of a range, etc...). Here we want to evict the range ram
> to make the state consistent. No device pages are available due to an
> intentional disconnect between a virtual range and physical
> drm_gpusvm_devmem, thus the device pages have to be looked up. This the
> function drm_gpusvm_range_evict. Based on what you tell me, it likely is
> fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
> using hmm_range_fault like I have suggested here.

Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
fine for this usage and is exactly what you want - it was designed to
either select all the system memory pages or device-private pages within
a VA range and migrate them.

FWIW I have toyed with the idea of a combined
hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
migrate_vma_*() process but haven't come up with something nice as
yet. I don't think mixing the two in an open-coded fashion is a good
idea though, I'd rather we come up with a new API that addresses the
short-comings of migrate_vma_setup().

> Note #2 may be removed or unnecessary at some point if we decide to add
> support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
> now though. See 'Ranges with mixed system and device pages' in [5].
>
> [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
>
>> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
>> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>> >> >
>> >> >> > It would also make the function exported in this patch unnecessary too
>> >> >> > as non-contiguous pfns can be setup on driver side via
>> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
>> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>> >> >> > in [1].
>> >> >> >
>> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
>> >> >> > migrate_device_unmap?
>> >> >> 
>> >> >> If there is a good justification for it I can't see a problem with
>> >> >> exporting it. That said I don't really understand why you would
>> >> >> want/need to split those steps up but I'll wait to see the code.
>> >> >>
>> >> >
>> >> > It is so the device pages returned from hmm_range_fault, which are only
>> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
>> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
>> >> > MMU invalidation which takes the notifier lock thus calling the function
>> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>> >> >
>> >> > I think this flow makes sense and agree in general this likely better
>> >> > than looking at a CPUVMA.
>> >> 
>> >> I'm still a bit confused about what is better with this flow if you are
>> >> still calling hmm_range_fault(). How is it better than just calling
>> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
>> >
>> > The code in rev2 calls migrate_vma_setup but the requires a struct
>> > vm_area_struct argument whereas hmm_range_fault does not.
>> 
>> I'm not sure that's a good enough justfication because the problem isn't
>> whether you're looking up vma's in driver code or mm code. The problem
>> is you are looking up vma's at all and all that goes with that (mainly
>> taking mmap lock, etc.)
>> 
>> And for eviction hmm_range_fault() won't even find all the pages because
>> their virtual address may have changed - consider what happens in cases
>> of mremap(), fork(), etc. So eviction really needs physical pages
>> (pfn's), not virtual addresses.
>>
>
> See above, #1 yes we use a physical pages. For #2 it is about making the
> state consistent within a virtual address range.

Yep, makes sense now. For migration of physical pages you want
migrate_device_*, virtual address ranges want migrate_vma_*

 - Alistair

> Matt
>  
>> >> we're talking about eviction here so I don't understand why that would
>> >> be relevant. And hmm_range_fault() still requires the VMA, although I
>> >> need to look at the patches more closely, probably CPUVMA is a DRM
>> >
>> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
>> > as argument. This is about avoiding a driver side lookup of the VMA.
>> >
>> > CPUVMA == struct vm_area_struct in this email.
>> 
>> Thanks for the clarification.
>> 
>>  - Alistair
>> 
>> > Matt
>> >
>> >> specific concept?
>> >> 
>> >> Thanks.
>> >> 
>> >>  - Alistair
>> >> 
>> >> > Matt
>> >> >  
>> >> >>  - Alistair
>> >> >> 
>> >> >> > Matt
>> >> >> >
>> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>> >> >> >
>> >> >> >> Matt
>> >> >> >> 
>> >> >> >> > > +	}
>> >> >> >> > > +
>> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> >> >> >> > > +
>> >> >> >> > > +	return 0;
>> >> >> >> > > +}
>> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> >> >> >> > > +
>> >> >> >> > >  /*
>> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
>> >> >> >> > 
>> >> >> 
>> >> 
>> 

