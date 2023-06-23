Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421173AE97
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 04:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B2910E0A6;
	Fri, 23 Jun 2023 02:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B788510E0A6;
 Fri, 23 Jun 2023 02:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687487158; x=1719023158;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qA+729tfuBrOkW0iU7v4copZdS9qpkTbST16bE46u04=;
 b=PKpCx45i53jTeutewubs3xzBkyVoegcgouK2fYg61NO0lCllvRbZ+4nO
 /JiASzA05bNXvjSa/93VhVFuf2aBbrXL38qQCJnPSWBZFfiKN/n0eWR3G
 y+QFFuoqIuso+RLpMf5f6H41HCiyRtCEotCX4/ZrYswSIz04SpfQbygXF
 yfoG6OUxeDWVSAz+4QkQYrIZjGpCDW/vq5zQDF9MglWyBKBgljuawiFvi
 sgx8nRvJEAVcj7Qs7aa8lvPbpornR6MmgTbzeb8YvJoo3TWvJM3g5HUET
 HjqbKmvKLvhSOOHDKQ9ZxILAKg3UshYf0B3KK/HAod8YwU0uY2sISPlE5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447041077"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447041077"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 19:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="859681325"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="859681325"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2023 19:25:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 19:25:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 19:25:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 19:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMv62hqzfalSRjMYFpxo68kkh8HRy7ynXlSKZLS+61UVl0WzFzbJ2czCQCIHTAFC6XFeqyhmhgtBGJO7igQTbrdV/+ZoFh0X7vvAYmcvtS7bd4DO4BtSOMgMZqm5kB5qKlMex+lBsJ8aNjR3m+0K4W65MAW4wqt9me+ViB//tbilh2rdw3W/yZ43s6fwb08aJA6ziEHCxsHoRAImQP/t1U7i3V4HW1VR88VdHX0+2tEqBsxOcyBl3j+cMofk0l2hxhWrwwLfhChwuuc4p2EZsTbSn57ta6G/5JhfcWW9qKnCNzSM7pCzGNGHdvLdCJVKakFZdF/3eMHO0H+CPPQpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni39BrXFELcwps8TH/nFGFMPE4/CMVE1puUAO7rDm64=;
 b=JzTSnQbbgZzMkl1z1Ior5FANL/3nyyL7iadI9eQS2jGjAIUIHY2glX3LmVomhf3qKF99kz1Q+8buQ849OrMm4P4wBm4CsNAxQ9HHdMwh14kVgsibTtXTvx2J6KOLePr2H3etsyFIqU0e3rrh39iU7F5KLUp/UwvG55be5CkK2dB0y3SCmLukc2YdzWGuHG1wHsbGXXHN6TLQADiuVb9i9S4F8OCr7O2DHYtVCagQxytDnKa74zEzkCt7vECdVat3bR9Dcsw+W8t6P/lghFGB+qzjOENAPGhnqUrAvUbxqVTLm7RR/pCq+jAp2fHyzUf/tyhv30k/+fOAfqofIGwDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 02:25:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 02:25:26 +0000
Date: Fri, 23 Jun 2023 02:24:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <ZJUCdP1T+arh3M+H@DUT025-TGLU.fm.intel.com>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
 <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
 <c1f05169-dec0-22ee-52fa-c8070678394e@redhat.com>
 <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f61b01-b616-4f9f-a269-08db73911ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AU1+u8MPWGsL42cWBKkUiOtm0mxnTMQIz6sRPaEnwFQqcvXpmZqB/3gJV3B1MRe62Dd3kk2CVgMBqlotfTFKLhxsWKouD5UZs2h5fZLviLe02KvDL6h3FVlprHpim+5NzSNW0SNhdBp09/6aH/P8VvFpp7TQMQD9f19U/EhqhQdP0g+pfUBdJ+OgV35wPRur/ATmAFQeZeqUKhet03qJhvIp2YG7c7bKae81qR1ffdeZtDwMYs64Q5Mo0YyVGOStlur9YeSRm+gFAd2SMIMEKm50vH9KD8fCi5XSI7DurIU/M4F88tGwzRwclqND4Id6wywaPYaR3muJRDhQQeDgT2Ov345w5n7dmRimux4ZpECeRIybOx6nDSUoPz188DzxIYDdXthLB7YaPEvddHdFRBSB4j6WN+W2AkZh0/4IoUc2+5+gBYcaH/8GgmgEEkRvSFzd3xgLLl3NttrbgNBMKaHcfQ7067JQJt/PSn8NU6kl/7+uNLH8CTEn0KxCwMpXXkEmi5Jp9wJvq+7eVPW8Zf6+vcs+w1L7tEX3P2OJgxuy1vazFc0yqm48fuKcSF7U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(82960400001)(38100700002)(86362001)(316002)(66556008)(66476007)(6916009)(8676002)(41300700001)(8936002)(66946007)(4326008)(44832011)(7416002)(66574015)(5660300002)(6506007)(83380400001)(53546011)(6486002)(478600001)(6666004)(54906003)(26005)(6512007)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gm/86BGZ+YTcbnFMab24YDu+sqHkGIcmQwdhNTMektEM1F0AOOplq3NKrt?=
 =?iso-8859-1?Q?e9S+8s6d4KaqsAiH4efxEjDcNO7srw7hUSL55/IDRB9iusLPfK7O3vkrzg?=
 =?iso-8859-1?Q?UjMGTX7Fve0P5Iozf+fQP290v4mlIw8lVHDANg7xrXPyi8UUwPnyIB/fyk?=
 =?iso-8859-1?Q?M+zHzQuQWvZFSVNeMq36TT1yvsjYppfNBCNxasMpG3q2GDDARyqL/te6lY?=
 =?iso-8859-1?Q?c04yaaWVT9IE5NAG/Zds66d9vmf9sfYx5SZA0MwI/MslmKXsJfbyA7ZQ8D?=
 =?iso-8859-1?Q?PsvOjxeS5RGilKK5YBnlVezjGB8yKKH0svDxYOFO6IxWQuWU7VjhvbUcYO?=
 =?iso-8859-1?Q?nhJUvYzm+g3cZlWihm05AVxjCgDb7ppsqnFeeCj3lDT12kMv9rxMoHq4wU?=
 =?iso-8859-1?Q?mH74fTZ8K6EUvZvGurPdMVwT1SfnGnvXfTHf5j1KWRojptDbRgOQh1jLov?=
 =?iso-8859-1?Q?A4Wyd0coljeVWKb8lQ00xytNwYB6omOXeSP1q39pEZeu2kgvcPuoQpPE7G?=
 =?iso-8859-1?Q?8RpL2vu/gvoc9Mu16WanmUZANuzWd1rOfeFTumMKbdq1q5JtRrAEnRzDUt?=
 =?iso-8859-1?Q?IJbP76t5Jr1MghRvYHRAqOtbNZOGxbwonhWhAhxfJgLIisSMZ+cl7w+nuA?=
 =?iso-8859-1?Q?zAOuS8bLktzSQe4kmsTOuW2qunaxlevw8INIJLusSHGrhXAeuK6meLYYpi?=
 =?iso-8859-1?Q?SPZryK7IhyTxwX1DQfDpY1dkcZYfisVfaZ5qNW+zFT1tK/gH60N16e0In6?=
 =?iso-8859-1?Q?QEOnoGA/VMZrSbeIh3z7hf15djEPJsYHRY+F5mUn90Lp2GgP/HDE1X1W09?=
 =?iso-8859-1?Q?+uo53gq5FtEAaLgQpYx6kt6HCFVysz+JBGnOnNYdyjQAdcYs96foy49GoK?=
 =?iso-8859-1?Q?zYO6GnvhNm9t2thBwnpi20Z3adHBBQhkZlcY0SRNaM2HdBHRx4o9PQuE/E?=
 =?iso-8859-1?Q?2OeWiAN+H+Q8iTwpCNYYBATzu6VJCBUaYHKP1VgYrMFyt9khZeMRJ7oukL?=
 =?iso-8859-1?Q?lFlsR4wiNVM3DH6mISTcDjJ4vddlUxYiAtKSgzByJ3g3bVRn9B2gzoimMl?=
 =?iso-8859-1?Q?BIu22/mRDf9G7XNy+JUAVLZz/zZoF2GpKzTFdPIqw7dVeuSRAjkzxXs51S?=
 =?iso-8859-1?Q?sqDkJJOXwo2YKhWHcwu3GpWf+9SgcunGumAIV6HpNZumz1IfFyjiMgdj3i?=
 =?iso-8859-1?Q?fXEDpENPWENyJL96vv4kAMG0kj/BpWyGUzji+F8mEsrJq5n5ticcq8aCR5?=
 =?iso-8859-1?Q?YQsHRE7IC3MCnUMPilxe81NDs5KAmY3y78XobCnRVhXR+Y1m1z2sPQjTCP?=
 =?iso-8859-1?Q?LMZkfjUEmdk0MEML61SZyn1dadfcD5SXZ3sU3d4Kwk6Z7fRoj4dooagFUU?=
 =?iso-8859-1?Q?pNyndCf+IbHfIwjgRCc/7n7nKsaw8Ppnj4lEbo/Q8wVYRsYPhW1NM6WQdp?=
 =?iso-8859-1?Q?fsA7Iln2aE0vueqwmIgGEFDfWujwmPCydmhtJE4Nfryt5G80FpJzYe7gic?=
 =?iso-8859-1?Q?f3KaN1QVal3uHcRzrHyJsnU3cuLP7efT8PHInQW2Tc60+0/S/shALZ4b2E?=
 =?iso-8859-1?Q?bGz7do223O5dT37UTXm+d38x9AVzNqfbcyKy9gFLAOJYtIJUvC66jQTrdF?=
 =?iso-8859-1?Q?q0fWJg5vPwCK2xIgXjFm011ZG0CQSi/mXcM1DjaxZhQ4tVl1WvxumKxA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f61b01-b616-4f9f-a269-08db73911ae1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 02:25:26.4433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3wezvewqWsCJpjzqAoP/meS/Lb6IWwm8C0Tdhpyew54+D04E1iX7uDP99/LH3bzfYPYe0uCyOmMlw4KXkJMwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-OriginatorOrg: intel.com
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
Cc: dri-devel@lists.freedesktop.org, willy@infradead.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, linux-mm@kvack.org,
 boris.brezillon@collabora.com, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 jason@jlekstrand.net, Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 05:07:11PM +0200, Danilo Krummrich wrote:
> On 6/22/23 17:04, Danilo Krummrich wrote:
> > On 6/22/23 16:42, Christian König wrote:
> > > Am 22.06.23 um 16:22 schrieb Danilo Krummrich:
> > > > On 6/22/23 15:54, Christian König wrote:
> > > > > Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
> > > > > > Hi Christian,
> > > > > > 
> > > > > > On 6/20/23 08:45, Christian König wrote:
> > > > > > > Hi Danilo,
> > > > > > > 
> > > > > > > sorry for the delayed reply. I've trying to dig
> > > > > > > myself out of a hole at the moment.
> > > > > > 
> > > > > > No worries, thank you for taking a look anyway!
> > > > > > 
> > > > > > > 
> > > > > > > Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
> > > > > > > > [SNIP]
> > > > > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > > > > index bbc721870c13..5ec8148a30ee 100644
> > > > > > > > --- a/include/drm/drm_gem.h
> > > > > > > > +++ b/include/drm/drm_gem.h
> > > > > > > > @@ -36,6 +36,8 @@
> > > > > > > >   #include <linux/kref.h>
> > > > > > > >   #include <linux/dma-resv.h>
> > > > > > > > +#include <linux/list.h>
> > > > > > > > +#include <linux/mutex.h>
> > > > > > > >   #include <drm/drm_vma_manager.h>
> > > > > > > > @@ -379,6 +381,18 @@ struct drm_gem_object {
> > > > > > > >        */
> > > > > > > >       struct dma_resv _resv;
> > > > > > > > +    /**
> > > > > > > > +     * @gpuva:
> > > > > > > > +     *
> > > > > > > > +     * Provides the list of GPU VAs attached to this GEM object.
> > > > > > > > +     *
> > > > > > > > +     * Drivers should lock list accesses with
> > > > > > > > the GEMs &dma_resv lock
> > > > > > > > +     * (&drm_gem_object.resv).
> > > > > > > > +     */
> > > > > > > > +    struct {
> > > > > > > > +        struct list_head list;
> > > > > > > > +    } gpuva;
> > > > > > > > +
> > > > > > > >       /**
> > > > > > > >        * @funcs:
> > > > > > > >        *
> > > > > > > 
> > > > > > > I'm pretty sure that it's not a good idea to attach
> > > > > > > this directly to the GEM object.
> > > > > > 
> > > > > > Why do you think so? IMHO having a common way to connect
> > > > > > mappings to their backing buffers is a good thing, since
> > > > > > every driver needs this connection anyway.
> > > > > > 
> > > > > > E.g. when a BO gets evicted, drivers can just iterate
> > > > > > the list of mappings and, as the circumstances require,
> > > > > > invalidate the corresponding mappings or to unmap all
> > > > > > existing mappings of a given buffer.
> > > > > > 
> > > > > > What would be the advantage to let every driver
> > > > > > implement a driver specific way of keeping this
> > > > > > connection?
> > > > > 
> > > > > Flexibility. For example on amdgpu the mappings of a BO are
> > > > > groups by VM address spaces.
> > > > > 
> > > > > E.g. the BO points to multiple bo_vm structures which in
> > > > > turn have lists of their mappings.
> > > > 
> > > > Isn't this (almost) the same relationship I introduce with the
> > > > GPUVA manager?
> > > > 
> > > > If you would switch over to the GPUVA manager right now, it
> > > > would be that every GEM has a list of it's mappings (the gpuva
> > > > list). The mapping is represented by struct drm_gpuva (of course
> > > > embedded in driver specific structure(s)) which has a pointer to
> > > > the VM address space it is part of, namely the GPUVA manager
> > > > instance. And the GPUVA manager keeps a maple tree of it's
> > > > mappings as well.
> > > > 
> > > > If you still would like to *directly* (indirectly you already
> > > > have that relationship) keep a list of GPUVA managers (VM
> > > > address spaces) per GEM, you could still do that in a driver
> > > > specific way.
> > > > 
> > > > Do I miss something?
> > > 
> > > How do you efficiently find only the mappings of a BO in one VM?
> > 
> > Actually, I think this case should even be more efficient than with a BO
> > having a list of GPUVAs (or mappings):
> 
> *than with a BO having a list of VMs:
> 
> > 
> > Having a list of GPUVAs per GEM, each GPUVA has a pointer to it's VM.
> > Hence, you'd only need to iterate the list of mappings for a given BO
> > and check the mappings VM pointer.
> > 
> > Having a list of VMs per BO, you'd have to iterate the whole VM to find
> > the mappings having a pointer to the given BO, right?
> > 
> > I'd think that a single VM potentially has more mapping entries than a
> > single BO was mapped in multiple VMs.
> > 
> > Another case to consider is the case I originally had in mind choosing
> > this relationship: finding all mappings for a given BO, which I guess
> > all drivers need to do in order to invalidate mappings on BO eviction.
> > 
> > Having a list of VMs per BO, wouldn't you need to iterate all of the VMs
> > entirely?
> > 

FWIW I agree with Danilo here on basically all points.

- Having GPUVA list per GEM makes a ton of sense wrt eviction and
  invalidation. Xe had this list prior to GPUVA, after GPUVA it is just
  in a common place.
- From a GPUVA to you can resolve a GEM
- GPUVA can have NULL GEM (userptr or sparse binding in Xe)
- From a VM all GPUVA can be resolved via the maple tree

This seems to do everything any reasonable driver would need.

> > > 
> > > Keep in mind that we have cases where one BO is shared with hundreds
> > > of different VMs as well as potentially the number of mappings can
> > > be >10k.
> > > 

Christian - Can you explain this use case? It seems like an odd one but
regardless the GPUVA design still works we'd just have 10k GPUVA in the
BO's list.

> > > > 
> > > > > 
> > > > > Additional to that there is a state maschine associated with
> > > > > the mappings, e.g. if the page tables are up to date or need
> > > > > to be updated etc....
> > > > > 
> > > > > > Do you see cases where this kind of connection between
> > > > > > mappings and backing buffers wouldn't be good enough? If
> > > > > > so, which cases do you have in mind? Maybe we can cover
> > > > > > them in a common way as well?
> > > > > 
> > > > > Yeah, we have tons of cases like that. But I have no idea
> > > > > how to generalize them.
> > > > 
> > > > They could still remain to be driver specific then, right?
> > > 
> > > Well does the mapping has a back pointer to the BO? And can that be
> > > optional NULL if there is no BO?
> > 
> > Yes to both.
> >

In Xe we have GPUVA with NULL BOs for userptrs and for sparse bindings.
It seems to work rather well.

Matt

> > - Danilo
> > 
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > As you wrote in the commit message it's highly
> > > > > > > driver specific what to map and where to map it.
> > > > > > 
> > > > > > In the end the common case should be that in a VA space
> > > > > > at least every mapping being backed by a BO is
> > > > > > represented by a struct drm_gpuva.
> > > > > 
> > > > > Oh, no! We also have mappings not backed by a BO at all! For
> > > > > example for partial resident textures or data routing to
> > > > > internal hw etc...
> > > > > 
> > > > > You can't be sure that a mapping is backed by a BO at all.
> > > > 
> > > > I fully agree, that's why I wrote "the common case should be
> > > > that in a VA space at least every mapping *being backed by a BO*
> > > > is represented by a struct drm_gpuva".
> > > > 
> > > > Mappings not being backed by an actual BO would not be linked to
> > > > a GEM of course.
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Instead I suggest to have a separate structure for
> > > > > > > mappings in a VA space which driver can then add to
> > > > > > > their GEM objects or whatever they want to map into
> > > > > > > their VMs.
> > > > > > 
> > > > > > Which kind of separate structure for mappings? Another
> > > > > > one analogous to struct drm_gpuva?
> > > > > 
> > > > > Well similar to what amdgpu uses BO -> one structure for
> > > > > each combination of BO and VM -> mappings inside that VM
> > > > 
> > > > As explained above, I think that's exactly what the GPUVA
> > > > manager does, just in another order:
> > > > 
> > > > BO has list of mappings, mappings have pointer to VM, VM has
> > > > list (or actually a maple tree) of mappings.
> > > > 
> > > > You see any advantages or disadvantages of either order of
> > > > relationships? For me it looks like it doesn't really matter
> > > > which one to pick.
> > > > 
> > > > - Danilo
> > > > 
> > > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > 
> > > > > > - Danilo
> > > > > > 
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > 
> 
