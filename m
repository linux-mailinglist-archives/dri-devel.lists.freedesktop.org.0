Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616556E1275
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95510EB7D;
	Thu, 13 Apr 2023 16:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BC010EB7A;
 Thu, 13 Apr 2023 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681403890; x=1712939890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qeLUC/fBRVITbLV8ENVpcQO2oRHDckd4hgNmZWKm1mo=;
 b=FOxWXNJPcgrQE2Ugh6LwHDUizS/Xy1f5it+8lAxsCl9DdKIjagmYoLzb
 tKtJWJczqrTknD5A8rLyhp7acOrfw0UowzBuDctyU7OGgALFK7NwqVgrz
 G8EfO82WqdPuNHIF2TAN3ornIG0gabTv6hwhmJ5yhWBAZEt5uiQmUmgXI
 utM33c/VcjmFDW/cK3OKx6U3D+TI0klEdQQYYgbe1InvI4+eZbVB3/WC3
 e5x1q6Ff97pkirDixf++C0oNkzvnEVk+Obwf4OjmLUJOM30IBXATuxfCq
 KdeXPFpiUPFXNY6p/TqXSlnDzh5DSgHFgVTRPv1ZHSH2obKAxzeL0lWOF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346942790"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="346942790"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:38:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935662248"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="935662248"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2023 09:38:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 09:38:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 09:38:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 09:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i30aACQoTcglzb41+0piwH5QmcnweZBNefkVuZIoo6hoaQus34bhueF0EBd3m2dIZFOvvxwqGfTCb/ZPINK8Ecc8mNIJR2BFr2TuzQH6+tBlNxXKiMjehYgwzGvDSLthWYrW4n/5KPvydajIL+B9TdLeeQaJk47h0/pShUbrwiZdzhTgRx3xtOEaCMrZte3IO9FDCulWFtdx5dZyYcCik7Vtu3EKoJOq+o1Kz7rXTlQa/WcUI5kmOPaaUI0SZRbIOez9VloTSUri6eNxwxO50uWdaz1dApr5R+eWT8im9VPmSK3braBVIY9Ao+WoCf8V19ZwNZemLCwFqZ8dZhMw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ma0Ew9aVcLCsY1mscusLEtr0ii0WcgAOOLvmDexT3k=;
 b=Q6fb1RIyNzvZv7LvYhQQCbA63f6SRQKwBkHHTQsRVd2ADDdJREaqV3p8xIpWeZ5al1yHKZAATOOks8B//F3I3UmaVxNQGdhdeLwj187fWlvSnZbUr1BFlWfBjTTEVhnUN10vBOQMgXB4y+Jkag2kwoDJV2PbtnVeMzlVl3afwcS8DY+4n/9edvzftCn5/tCRR+GQVc5F5b3YPPtDklI+3SM1ZImtMFlqoCK9ohe5TCLRwnVJVbJF+tDn1fYHwACfx/fzJDu93bwBbe6yHMIz5iFZO5cjBja01iQXalmUn/ty7Z6ovozGCGZmyqRVJf8jSkz/FwsCVsk+7G6n0RTXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 13 Apr
 2023 16:38:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:38:05 +0000
Date: Thu, 13 Apr 2023 09:38:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <20230413163802.GJ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
 <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
 <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
 <ZDgrhNNSCn2bzdfm@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZDgrhNNSCn2bzdfm@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 338b0f7e-61db-4d0f-d6c8-08db3c3d7494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHZfzBnIzgO8AOSq6a5pNrNA1XgSE9m2CtTq6rR2it43H+tlx7R5VSnDagebg6O30RIKBMeqokKJ/xA4+oPs25VCthWirqhnVfb+hAzi6BfiH0YCJ6ugtmySNyidU5SSuvEnxoPTAjfjmzq/QSu/Ym20V9lsy5o9lEgdu31xU/luhqA4HjiBxDGrWNCklwiI7rkuBOoVC2ZQxkFFpK27/+SrTpRCy4MBMGKPZSfT/zJmdVpQ0w7Oy4CnGwS0gjcNLwhvgg0CchreJI5qu0EoywfNkrpMNMcwsRZzjunQfn7upE6OGOQT+/D2LqGgjUBk5hj/LjtXtPQF/PG39IFrG8SqJWTWuarcQ1MW79Tnzo4DEonDOjKxNfbFwOAms5e6wc4eTz3gRX3MxuTDfDVqxxI9NGx3h7mDUtHWSL+HrACspYneQ1NMqbWLaNAXEawFyWRBvlWpZnPqjvNpbbELLdWJEKNWYALGWg0d7EQDQN4JF5koV1HahIDqYu8mfVUdAgJLkOjsUpoZw9/khgQO2cPjSNmcki8GA0OgOG7Rxm4pTWwirLfg7CShABrNYYgo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(33656002)(83380400001)(6486002)(6666004)(478600001)(66476007)(316002)(41300700001)(4326008)(6916009)(66556008)(66946007)(54906003)(5660300002)(2906002)(82960400001)(38100700002)(8676002)(8936002)(186003)(53546011)(86362001)(26005)(6506007)(6512007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+pQGHHwWb49aYYfeTyqeVkJTNOPQcTxZkmkmstePnymCudr2C8HhmGeXqS8?=
 =?us-ascii?Q?THY/8uCZk0zyoY4jrDxn+2laxaTM1eQ6W9H9lX62AGGMARZqb0L4r3KquprN?=
 =?us-ascii?Q?0SmJSnRmNE2MwKbT3o5gMG3ca5r/7H07kQUGEjOVjVF9TQv48TYQaFLbRJ+y?=
 =?us-ascii?Q?Jv56CFlt/x3jhMYxIOlJXCdLIYUCm1AOWgYH7RspCZEMx3jeBR0Vv0Ai6pV8?=
 =?us-ascii?Q?7RfaSzCLkQ1ELQLhxA62ADarLaRJhWnd68i/zn/M/YIv9N+QBF6a0mVCfqRW?=
 =?us-ascii?Q?/ThVC8Vk/EzvXENW1R22yCyXGBR0o8sYlUGDsUHl4x78ivGtRou9hV7UOI8z?=
 =?us-ascii?Q?M+kvaik+OnrqIg0gsrDFP7muZOOV7qFkCYjaW2LO2qclbKIXHNY8OtlBPxRt?=
 =?us-ascii?Q?C+2QN6/u+Kxj4UvEjw+YLB6hKZ+llgpKX5ichXOFUEFeYUtkyXqIkCCILCXV?=
 =?us-ascii?Q?qEPmBP8yUZPMa8pmR+oy4GZ5eFdtEvqZedWOrvzPCJVVHtKfGmgKrEhagl2C?=
 =?us-ascii?Q?19ncrRDPSDTYHC6Qmw8uN2uyCSmhqR1C0hglKYV5rozKXCtHSoSaAHvCeZLQ?=
 =?us-ascii?Q?3kVhONXnDEQSO9sYwhgKGjl7O2c4DjUE8Ce/+10plLqsBxPA8b50wETc5CPX?=
 =?us-ascii?Q?sfHEf+e2fMpEYBwqwLKktPJmvdwVvmgbh2uPJ/mB+BXL7oUlReo4v3ccBqV5?=
 =?us-ascii?Q?bdzW4Wavmk9rXvfKB6vTZyBtaLo47uQ8glufWrF/FbDsOAUBPCoxiotCyrfb?=
 =?us-ascii?Q?Wyyl8hjErlbUQTsLbV3tYwaiD4ROR2ogDztiFhAtOeHntEp8mc5428zFMt5u?=
 =?us-ascii?Q?wf5ErbG4e1gOqaMtYDf+5DHl4sds0sSjUAxhmu4cWTYFlNxpyNELiSwAAfsN?=
 =?us-ascii?Q?/pOAZJ4UygSYENvxsgImr9Fq+xSstP0Q1TXLsmu2kh82+K7+dVB+X4t+hoK8?=
 =?us-ascii?Q?k1lssIMSQ8YeLvsU0XtnASXWgxG3XF5BDhqPxVu31zTd92PTfaO2U+K3ihWu?=
 =?us-ascii?Q?fi1xyJrYAnUZBP9s5wwFqAy8NArULP+qd22PGfs+sS08pvogdIFZxW7HFPix?=
 =?us-ascii?Q?nQMVb9JxotDF0avwlbrO3TGDe6ES8M29Iuo6+kfjC1RrrQn4zYNKsOZLWmS3?=
 =?us-ascii?Q?qkYa9HXpuVCZx1ansKHuWMhVG5lsVMtdvR49HgoV2IMNRrlVNOpK+xGXJRNx?=
 =?us-ascii?Q?GbGMODKX+eKR2OtL2VPkecPbAleIpjjK6gIhig8C7IFdeMV13/zwiG8e135p?=
 =?us-ascii?Q?StGcmzb3RG9p24fqMR880ZnZo1hGnl+CrTyV3EvLLUMm8uJmTuk4watszpAe?=
 =?us-ascii?Q?lbBtbpKbhE6LymNTwm8ifVFtUPRYrYqsCjE75KgJ1i8Pa2NCjcCRAJdVTnLU?=
 =?us-ascii?Q?fBwQWir3UEuBqNUe8qdL3ZRvhSzm/t0M5ZVHkBH6ilccjzR/XfolIP5bNawv?=
 =?us-ascii?Q?cvMxqCyU5tnLReMk1kayaTWumIgwG4/NlH0daZodLDXr4ICHydDt1E0mn4Hm?=
 =?us-ascii?Q?w7tNgdtTlupv3fc26DuysQromvkxl5gGamp7fvIYeirsn9gjXFKjLkZ0jQMU?=
 =?us-ascii?Q?1HOSNT/RjfDMMz2opqtskWzuaMLq4DYLjfvjMxLlyX45/mesqIppINR70UVD?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338b0f7e-61db-4d0f-d6c8-08db3c3d7494
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:38:05.2568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEygk03J8h33C4rO1hoszmhcq90JZjYBWBOLx/hrzQyxtpCuHVMViZq4sQrcSb3sV45Z8jVK2WXJbYKpQzDGjrSnaY1u+Op7OYipYuOiC3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 06:19:16PM +0200, Andi Shyti wrote:
> On Thu, Apr 13, 2023 at 09:03:29AM -0700, Ceraolo Spurio, Daniele wrote:
> > 
> > 
> > On 4/13/2023 8:52 AM, Matt Roper wrote:
> > > On Thu, Apr 13, 2023 at 03:56:21PM +0200, Andi Shyti wrote:
> > > > Hi Tvrtko,
> > > > 
> > > > (I forgot to CC Daniele)
> > > > 
> > > > On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
> > > > > On 13/04/2023 10:20, Andi Shyti wrote:
> > > > > > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > > 
> > > > > > In multitile systems IRQ need to be reset and enabled per GT.
> > > > > > 
> > > > > > Although in MTL the GUnit misc interrupts register set are
> > > > > > available only in GT-0, we need to loop through all the GT's
> > > > > > in order to initialize the media engine which lies on a different
> > > > > > GT.
> > > > > > 
> > > > > > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > > ---
> > > > > > Hi,
> > > > > > 
> > > > > > proposing again this patch, apparently GuC needs this patch to
> > > > > > initialize the media GT.
> > > > > What is the resolution for Matt's concern that this is wrong for MTL?
> > > > There are two explanations, one easy and one less easy.
> > > > 
> > > > The easy one: without this patch i915 doesn't boot on MTL!(*)
> > > > 
> > > > The second explanation is that in MTL the media engine has it's
> > > > own set of misc irq's registers and those are on a different GT
> > > > (Daniele pointed this out).
> > > Assuming you're talking about MTL_GUC_MGUC_INTR_MASK, that's not true;
> > > it's just a single sgunit register (0x1900e8) that has different
> > > bitfields for the primary GuC and the media GuC.  So I still think we
> > > should avoid looping over GTs; it's actually much simpler to handle
> > > things in a single pass since we can just determine the single register
> > > value once (all fields) and write it directly, instead of doing two
> > > separate RMW updates to the same register to try to avoid clobbering
> > > the other GuC's settings.
> 
> if we handle exceptions in a single pass wouldn't we have many
> exceptions to handle in the long run?

I don't think so, it basically boils down to something along the lines
of

        if (MEDIA_VER(i915) >= 13)
                val = HIGH_BITS | LOW_BITS;
        else
                val = HIGH_BITS;

        ...

        intel_uncore_write(val);

which isn't really any more complicated than today's logic:

        called for each gt {
                ...

                if (gt is MEDIA)
                        bits = LOW_BITS;
                else
                        bits = HIGH_BITS;

                ...

                intel_uncore_rmw(bits);
        }


Matt

> 
> > > For pre-MTL platforms, it's the same register, except that the bitfield
> > > now devoted to the media GuC was previously used for something else
> > > (scatter/gather).
> > 
> > It's not just the GuC, the VCS/VECS engine programming is also tied to the
> > media GT (via the HAS_ENGINE checks). It looks like we unconditionally
> > program VCS 0 and 2, so it'll still work for MTL, but if we get a device
> > with more VCS engines it'll break. Maybe we can add a MTL version of the
> > function that just programs everything unconditionally? Going forward it
> > should be ok to program things for engines that don't exist, but I'm not
> > sure we can do that for older platforms that came before the extra engines
> > were ever defined in HW.
> 
> This is more or less what Tvrtko has suggested, as well. Looks to
> me like replicating some code... anyway, I will try and see how
> it looks like.
> 
> Andi
> 
> PS Thanks Matt, Daniele and Tvrtko for the feedback.
> 
> > Daniele
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > I sent this patch not to bypass any review, but to restart the
> > > > discussion as this patch was just dropped.
> > > > 
> > > > Thanks,
> > > > Andi
> > > > 
> > > > 
> > > > (*)
> > > > [drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
> > > > [drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
> > > > [drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
> > > > [drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
> > > > [drm] *ERROR* GT1: Enabling uc failed (-5)
> > > > [drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
