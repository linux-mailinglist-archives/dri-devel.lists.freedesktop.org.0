Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C258A9A1A3F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 07:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DE810E1C2;
	Thu, 17 Oct 2024 05:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="srVDsdTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005F510E0E0;
 Thu, 17 Oct 2024 05:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn9+FNwFh0e5RcFGTvdMQQDtKc21Ht+HIhpktjdMHZDhBwzE9l44qzdAsObWEfrvbcvyfpy7TSbQ4EZw64P/FZFXUfwHjz+CaxR/Xce/MEuTatS5p99dmCMlFaNE5ILCOBBuHa8OYr9GeiQsiIGd7OiDqFbTrWnsSZcmdMvhT55cW0XQh/X+ogg+MeB4ONzGStDhXcxkmsheau1Xy/nONXUdtUA4Kd6tqP9os0v7OJHQR2QjDEKY38uhDAH4zDy+GUghW7a9N7msBkkYx9k4EowyIVFtN70e4ihYGBNh4zsaRWZmt+b7FyIbRC/4an6RP5vGXOJIyFab+RDtXzrdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pabZf04SYCkAvMYSGsZdcU+m9B29eovEusc/FetGzAg=;
 b=tSM4/Gr2oDv8paJwRLtZT+pmROzdTtKMFMt/JfcNba1aE28+FYKJFW5fHA9nPrwEZZsYTkPQCJiQpQTY00CjxmTeZKw/TAGV64ZnFiwbwM9UnUtoDRZKQioGVwOMTqeQfeonLnm1q3nLD/dzHsXKQI6qZnHbU6w1/qGJkDI82lu0dCE5i72aA5AM14LDBJNzdoTVaX+OJi1FgnO6CQ6nAfv25jWMWFcKATQ1fsg9DjlsBsgNy71UVqcie37xg8/UrdF2Z0ADQJ2VXyLJ1H415PNlhZj9crngw2aIuGlfmq05pAc9YIwz7j48mWRfaKjNvL3rZd0JOxLuXwuNhKLoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pabZf04SYCkAvMYSGsZdcU+m9B29eovEusc/FetGzAg=;
 b=srVDsdTlzuSbrqcYHc7h0EBU/yqQOuT2Yr+cLpx4ts6mm1yO0wPvz7duusx5PnL1oVblw5KbOm1Y+Kz9aaapA/NIADdtvlC0nmeB4pV1KPspO8AMfGqee9VE8KhQzqpSgQkIJTpsQVsBgdWxzKjMuyOLFa+cNYVY+8JctF8ZTnwJ5coS3FYbpnghA4fYj3EvsTyvj3Esd8dCm3WmJF1pwjYWln9KLmuvNN6zdI41iPYM9nHEQmaO6lvlahgz0u3UjOXvx+H+kLfae0CxlwqvG9Xcn1rDw125xuxASzeqXXggUPpVbb8W5tEVVtykBF+D8PhSyYxtwWvaqwx6KLdO5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.30; Thu, 17 Oct 2024 05:50:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 05:50:27 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Thu, 17 Oct 2024 16:49:11 +1100
In-reply-to: <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
Message-ID: <87zfn3mg69.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0022.ausprd01.prod.outlook.com (2603:10c6:10::34)
 To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 5deb0aae-6dc0-4f09-9497-08dcee6f99f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7pFzH7n9QTJlXs4PAVP2VVlQZsMuJQCIxed4LFM6uXnW3WyMCaXwfrzEsTy0?=
 =?us-ascii?Q?0ng4ycPzRzVGT8Jm/23UobXmQKrWb5+U8dRaHddErgbVWGieVJ5qJS17VwxY?=
 =?us-ascii?Q?BaU6s5UY9qw2uI16FsJadHR5Ybs7hTBMpMQwbJLIN3CDQDlHB4gEgADuZ2aa?=
 =?us-ascii?Q?Chuj1n+D0P5RZQYq8xkSW92UfmxreylwnD57iVzd5bGpyJNdtq15RYBZxL8C?=
 =?us-ascii?Q?S34hr0FL6LZBbxMtfIztutY4jQAY7M7XHDOaWhtPSPcLfYbbxtBqb93T4ct1?=
 =?us-ascii?Q?ckudksvPLvzCfcXkY3S1aHzbAfHsBBFMesgM5vWNIpmpxAG1iWlW2m4K4460?=
 =?us-ascii?Q?WUTzCQuuK+2+dlF61m+Joec6Y2dX/gXXpIb2IOn0HLsybabXkJiidf1uAZ1X?=
 =?us-ascii?Q?RU9uGa3reFk8TmhdxZYvrj5xHe5e8iKm2WV0jkap3wKirfTfD6ZNkFzFjsG5?=
 =?us-ascii?Q?FSxeaXV4DA1kDX9zsR6Y8L0vGbo6Rw75BqzWXKrQyZuMSfy4FJclTyG7CDWT?=
 =?us-ascii?Q?OQBYPjxGaDcqdSkjDFQYIG3w538sSuL/mqe3VX2yzE4rW66Rr6kYq1GDa5JL?=
 =?us-ascii?Q?mhq01hDmRrsZZ1XDz0A9X67iYLFAlJ4cZ/dMNJYNQEYiY7fuMwftHnjZcmbs?=
 =?us-ascii?Q?bPkiR/aZ59jn/8K6989/7cmo1WyWMHBEQogne5ufropKETbyfEerAgHq4xq1?=
 =?us-ascii?Q?W0yRFtGjJjHRbCtyDBROn30YrHSBIrc0fRIjXJuFGM+YuiB2mIjzfY6uq1Kw?=
 =?us-ascii?Q?0G4iNiLBEYX2rIRRYsWdAgWrPSWFDsIqpPx2K3sCpAxtbwL5Aqcozq1dVVVr?=
 =?us-ascii?Q?rX7aH5FHkf/MoSzojO4VGcdF0PW0f29n21fx1QwSSkTbxZ2DkJBzegwOYdcU?=
 =?us-ascii?Q?34oSy8I7cXzzXyjq+F4mNsjfcMkVYAwBJ0KvvE/kp9d68YzqwMU7xNBf9P3C?=
 =?us-ascii?Q?ooQBIHwW+X3HxoUvQ1ZYwKITeribzMKWG4D+gb0jFOlvYT/Z1D2U0Q6BwbFS?=
 =?us-ascii?Q?6v+iKjMIfz/839P81wSf6SOyIF4oKXTI9vZnXS1hChe51tSIAl2SMrxaiLBh?=
 =?us-ascii?Q?maEB78XeLfeGnFMPL1IhL/s98W4AyeSr++1bdcPZ5dWb2pLTjhjzEc6V8+Vr?=
 =?us-ascii?Q?jPZgoZm2f7oTrLyi2l0jkDfuk9SH7QSNfkMiZslzL6MKnzKo2OJwqx8MD2xi?=
 =?us-ascii?Q?m37X7kuVAJKwRves6tqR+VkJrQ0AM2VIUuEHrIOif3evr6HdzrogdZfq2bFb?=
 =?us-ascii?Q?02pDrxjp/ULyk3Tk896cK7Gm9+qGuDMm/DYPJcX95PsOgZVFpOHXitonwVYo?=
 =?us-ascii?Q?hnCieyp407PTv95Oed85s7tA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HAxOr7V64GTG5Vi4u7SlZsuL92gUJKUIrp8Dcsvjr2Kw7ooIXvnt83vrsNI5?=
 =?us-ascii?Q?mCPbIVOB+tbJSwKA9zeuqgaOeC3MmhxzKm4qxGjjN0w8G8vclTlBLNdNSpwC?=
 =?us-ascii?Q?LONNPhjfxkOXniIRu6zDJFQ5X7XveMBXXeRc/ZETfZS79Ucf9C6b5JS1sVLL?=
 =?us-ascii?Q?PIYdlXB228Q+CbRKgznspNr7SZHkYpapagYkfzZBIo6lS61g3KHN1VXbAL2C?=
 =?us-ascii?Q?HX85SYmmKBO2nUPfOut3B/suFrL45JC+eIMk080g3nNgJ1scDv7Y3UVrlO7V?=
 =?us-ascii?Q?xPNNqlgQw2034PavggafmgNScxk/sU1ufvDJ7cAr7DwBKoqpCD/S7bf7gWiO?=
 =?us-ascii?Q?FxlixX5jU0VxfwQD9FCAA4mBgE4Hgppohu4CB0cU2OqdXbD/4UiAeHYHX68/?=
 =?us-ascii?Q?uEU5lUrnCExQWZOTmll0AchqN6zpA8AE1G3izpvqVQTLDGmbeP5J13EIbpPt?=
 =?us-ascii?Q?XJdIfqcy0A1I5I1pP2Vn853yY9hP9ojQa8HJtP/Vplsth1mPJYJVcvKTakPo?=
 =?us-ascii?Q?tDkeCjFchn2HAKWlGE7EzVbPQrtmlHRMafuwLEpJ6ZiZBOTGj1h3yqA8UY25?=
 =?us-ascii?Q?9c8x639itfQQ410q6R3hlR9AR0vOBDKJ4TUfIUWUg8cQqgw/ynQ54GmfUPO9?=
 =?us-ascii?Q?X6tiiMCQf4aNS6KfICqXqLsieo82CTbE5x+2sEzPiq7vJ+0x0k036pjnGzM9?=
 =?us-ascii?Q?Td1cDeLZJYqk/1VEgITbVFFnOnQjUgxHVcsqzY2AbVAQ/nIReAFEV+R6LMpB?=
 =?us-ascii?Q?Mta0wojpIDJe9P/2ICbkm+d6JbpX7epib4MBwhKrNZ+1/KZ8JXDha94cqdtm?=
 =?us-ascii?Q?WpHW0Be++6nMXq7WCQRcg+YNPygwixo2sHL3aMCXYXBcNjC701gySCYPenR8?=
 =?us-ascii?Q?5JkyBSJK9he9gKIhTxS/EYb4w3FiDTE+hHfb1NpEfDZabxGfsDUYS/rVtjCw?=
 =?us-ascii?Q?u1O0DKBvNaQk1Y/q5SPJak0K25vUk4al9MM+l0mYpg6CZsE1vHfB7xWlhO1S?=
 =?us-ascii?Q?E6AUol5eiM/JKIzIkylGA2821riJFdkhBsLpTEzQyC/9dLzGMGfaqKdTJG0u?=
 =?us-ascii?Q?8IbOgga3N1rAWlMm+mgX2Ed+uoT1mnEESQcG3fUChSd21LzX5h1gXGKxX9VX?=
 =?us-ascii?Q?eFLEA3NWs00fgpKgpfhC+QCTuAvIoPyA2bdPVJRnJHXZ1GI8TXyZiK3Wpu2n?=
 =?us-ascii?Q?a0hCB8zzfgoD3Hh1Q8CEOeImUiyEMcQp8G357qeXVMSVCZVdHtKXfKdWDzsx?=
 =?us-ascii?Q?FzzHJ/De7PGJPiBtX4jksjz9JnScFs/D4bcO4v5+1WiAkerqSguJtuq43RXS?=
 =?us-ascii?Q?a8ME+Pr2k8tUNGequATxW/tyXurh0hStPtpWLvY1+ZRVFCi4cBiQ6GTTaMfE?=
 =?us-ascii?Q?0rfbwEiLBLEnF1/r94eGkuIiCQn+OW474nKaMfjIUp+zFcDcn7sXblWjapdc?=
 =?us-ascii?Q?kvgC3v5P7B4weqgsauiq4FsOe2QB+iCUO50g37cE2k/lYXnXk3mvJO2HUaNS?=
 =?us-ascii?Q?L8UpNLeMv7OZfYre+wYvU0D6MP1kKRiDd6zVuGL+VnkSX9Vf2k9uR2l22XPM?=
 =?us-ascii?Q?6ta8rHiBGhuBxQAOtPULbnqnTgYQJymC4F4qrfPt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deb0aae-6dc0-4f09-9497-08dcee6f99f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 05:50:27.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvfHZAqFY2RibULgDH/LYIwOHg8/Fx/1XBbVuJ4Lc33Y8SDmH2ku6BXxjeTwUzC3e1itbl0iuK1ZLMEqjNcMhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691
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

> On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>> 
>> Matthew Brost <matthew.brost@intel.com> writes:
>> 
>> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>> >> 
>> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> 
>> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>> >> 
>> >> [...]
>> >> 
>> >> >> > > +{
>> >> >> > > +	unsigned long i;
>> >> >> > > +
>> >> >> > > +	for (i = 0; i < npages; i++) {
>> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> >> >> > > +
>> >> >> > > +		if (!get_page_unless_zero(page)) {
>> >> >> > > +			src_pfns[i] = 0;
>> >> >> > > +			continue;
>> >> >> > > +		}
>> >> >> > > +
>> >> >> > > +		if (!trylock_page(page)) {
>> >> >> > > +			src_pfns[i] = 0;
>> >> >> > > +			put_page(page);
>> >> >> > > +			continue;
>> >> >> > > +		}
>> >> >> > > +
>> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> >> >> > 
>> >> >> > This needs to be converted to use a folio like
>> >> >> > migrate_device_range(). But more importantly this should be split out as
>> >> >> > a function that both migrate_device_range() and this function can call
>> >> >> > given this bit is identical.
>> >> >> > 
>> >> >> 
>> >> >> Missed the folio conversion and agree a helper shared between this
>> >> >> function and migrate_device_range would be a good idea. Let add that.
>> >> >> 
>> >> >
>> >> > Alistair,
>> >> >
>> >> > Ok, I think now I want to go slightly different direction here to give
>> >> > GPUSVM a bit more control over several eviction scenarios.
>> >> >
>> >> > What if I exported the helper discussed above, e.g.,
>> >> >
>> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>> >> >  906 {
>> >> >  907         struct folio *folio;
>> >> >  908
>> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>> >> >  910         if (!folio)
>> >> >  911                 return 0;
>> >> >  912
>> >> >  913         if (!folio_trylock(folio)) {
>> >> >  914                 folio_put(folio);
>> >> >  915                 return 0;
>> >> >  916         }
>> >> >  917
>> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> >> >  919 }
>> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>> >> >
>> >> > And then also export migrate_device_unmap.
>> >> >
>> >> > The usage here would be let a driver collect the device pages in virtual
>> >> > address range via hmm_range_fault, lock device pages under notifier
>> >> > lock ensuring device pages are valid, drop the notifier lock and call
>> >> > migrate_device_unmap.
>> >> 
>> >> I'm still working through this series but that seems a bit dubious, the
>> >> locking here is pretty subtle and easy to get wrong so seeing some code
>> >> would help me a lot in understanding what you're suggesting.
>> >>
>> >
>> > For sure locking in tricky, my mistake on not working through this
>> > before sending out the next rev but it came to mind after sending +
>> > regarding some late feedback from Thomas about using hmm for eviction
>> > [2]. His suggestion of using hmm_range_fault to trigger migration
>> > doesn't work for coherent pages, while something like below does.
>> >
>> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>> >
>> > Here is a snippet I have locally which seems to work.
>> >
>> > 2024 retry:
>> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> > 2026         hmm_range.hmm_pfns = src;
>> > 2027
>> > 2028         while (true) {
>> > 2029                 mmap_read_lock(mm);
>> > 2030                 err = hmm_range_fault(&hmm_range);
>> > 2031                 mmap_read_unlock(mm);
>> > 2032                 if (err == -EBUSY) {
>> > 2033                         if (time_after(jiffies, timeout))
>> > 2034                                 break;
>> > 2035
>> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> > 2037                         continue;
>> > 2038                 }
>> > 2039                 break;
>> > 2040         }
>> > 2041         if (err)
>> > 2042                 goto err_put;
>> > 2043
>> > 2044         drm_gpusvm_notifier_lock(gpusvm);
>> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>> > 2047                 memset(src, 0, sizeof(*src) * npages);
>> > 2048                 goto retry;
>> > 2049         }
>> > 2050         for (i = 0; i < npages; ++i) {
>> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
>> > 2052
>> > 2053                 if (page && (is_device_private_page(page) ||
>> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
>> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
>> > 2056                 else
>> > 2057                         src[i] = 0;
>> > 2058                 if (src[i])
>> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
>> > 2060         }
>> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
>> 
>> Practically for eviction isn't this much the same as calling
>> migrate_vma_setup()? And also for eviction as Sima mentioned you
>> probably shouldn't be looking at mm/vma structs.
>> 
>
> hmm_range_fault is just collecting the pages, internally I suppose it
> does look at a VMA (struct vm_area_struct) but I think the point is
> drivers should not be looking at VMA here.

migrate_vma_setup() is designed to be called by drivers and needs a vma,
so in general I don't see a problem with drivers looking up vma's. The
problem arises specifically for eviction and whether or not that happens
in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
issues there (see below).

>> > 2063         migrate_device_unmap(src, npages, NULL);
>> > ...
>> > 2101         migrate_device_pages(src, dst, npages);
>> > 2102         migrate_device_finalize(src, dst, npages);
>> >
>> >
>> >> > Sima has strongly suggested avoiding a CPUVMA
>> >> > lookup during eviction cases and this would let me fixup
>> >> > drm_gpusvm_range_evict in [1] to avoid this.
>> >> 
>> >> That sounds reasonable but for context do you have a link to the
>> >> comments/discussion on this? I couldn't readily find it, but I may have
>> >> just missed it.
>> >> 
>> >
>> > See in [4], search for '2. eviction' comment from sima.
>> 
>> Thanks for pointing that out. For reference here's Sima's comment:
>> 
>> > 2. eviction
>> > 
>> > Requirements much like migrate_to_ram, because otherwise we break the
>> > migration gurantee:
>> > 
>> > - Only looking at physical memory datastructures and locks, no looking at
>> >   mm/vma structs or relying on those being locked. We rely entirely on
>> >   reverse maps from try_to_migrate to find all the mappings on both cpu
>> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
>>
>> I also very much agree with this. That's basically why I added
>> migrate_device_range(), so that we can forcibly evict pages when the
>> driver needs them freed (eg. driver unload, low memory, etc.). In
>> general it is impossible to guarantee eviction og all pages using just
>> hmm_range_fault().
>> 
>
> In this code path we don't have device pages available, hence the
> purposed collection via hmm_range_fault.

Why don't you have the pfns requiring eviction available? I need to read
this series in more depth, but generally hmm_range_fault() can't
gurantee you will find every device page.

>> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
>> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>> >
>> >> > It would also make the function exported in this patch unnecessary too
>> >> > as non-contiguous pfns can be setup on driver side via
>> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
>> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>> >> > in [1].
>> >> >
>> >> > Do you see an issue exporting migrate_device_pfn_lock,
>> >> > migrate_device_unmap?
>> >> 
>> >> If there is a good justification for it I can't see a problem with
>> >> exporting it. That said I don't really understand why you would
>> >> want/need to split those steps up but I'll wait to see the code.
>> >>
>> >
>> > It is so the device pages returned from hmm_range_fault, which are only
>> > guaranteed to be valid under the notifier lock + a seqno check, to be
>> > locked and ref taken for migration. migrate_device_unmap() can trigger a
>> > MMU invalidation which takes the notifier lock thus calling the function
>> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>> >
>> > I think this flow makes sense and agree in general this likely better
>> > than looking at a CPUVMA.
>> 
>> I'm still a bit confused about what is better with this flow if you are
>> still calling hmm_range_fault(). How is it better than just calling
>> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
>
> The code in rev2 calls migrate_vma_setup but the requires a struct
> vm_area_struct argument whereas hmm_range_fault does not.

I'm not sure that's a good enough justfication because the problem isn't
whether you're looking up vma's in driver code or mm code. The problem
is you are looking up vma's at all and all that goes with that (mainly
taking mmap lock, etc.)

And for eviction hmm_range_fault() won't even find all the pages because
their virtual address may have changed - consider what happens in cases
of mremap(), fork(), etc. So eviction really needs physical pages
(pfn's), not virtual addresses.

>> we're talking about eviction here so I don't understand why that would
>> be relevant. And hmm_range_fault() still requires the VMA, although I
>> need to look at the patches more closely, probably CPUVMA is a DRM
>
> 'hmm_range_fault() still requires the VMA' internal yes, but again not
> as argument. This is about avoiding a driver side lookup of the VMA.
>
> CPUVMA == struct vm_area_struct in this email.

Thanks for the clarification.

 - Alistair

> Matt
>
>> specific concept?
>> 
>> Thanks.
>> 
>>  - Alistair
>> 
>> > Matt
>> >  
>> >>  - Alistair
>> >> 
>> >> > Matt
>> >> >
>> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>> >> >
>> >> >> Matt
>> >> >> 
>> >> >> > > +	}
>> >> >> > > +
>> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> >> >> > > +
>> >> >> > > +	return 0;
>> >> >> > > +}
>> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> >> >> > > +
>> >> >> > >  /*
>> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
>> >> >> > 
>> >> 
>> 

