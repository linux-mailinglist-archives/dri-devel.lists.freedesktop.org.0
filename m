Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557E730AC7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87F10E46E;
	Wed, 14 Jun 2023 22:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5010E46E;
 Wed, 14 Jun 2023 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686782004; x=1718318004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X3oM/hJmuaEqQaZ7oWRy5P6KizZHbnS2lHGxv26MKBU=;
 b=GKEyO0RHKoG7IKBBe29plMRe593KaojjZTW/oJo/Dtkbc5TFH3K0KK6l
 SbB43zjlOqQjnrv/qfzPx8LwLhxaIWq5JPfgPJXunICwdToqZ24lsVIRr
 bt21sZ+3AQWvfUFY6Dg6dtGQLA2g30UfjfKgYrNOcueo2DEmqDs0/EpIn
 SzHjCymgrPZWhyp/mc1gRLy0iAdlS1u+k0XrhkZAK1BCfjvvP4PRXenYj
 c70NN+AG3CY95I0//ZYiW6k5Upgjx7a0pkvtAacFrVRJ8IBjPTillWye+
 StdGsbi2XAY35IkakT8isluSHVQ+tz3KjnZt5sddZ3HUpCGsh8GuB6W6q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362126309"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="362126309"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 15:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="824990104"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="824990104"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2023 15:33:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 15:33:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 15:33:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 15:33:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbuAAakZSt/vkbALqrnFucbeCrXhGPkDNcHvRyiqIR84a3fVj7LeUGXWT3Ad4PUC3ZhuXw/YFlgAEKebXYBxREybx5neGUQ5sOwKYLcNOIOPJCDRG1TzPbl5S30eRhbev72pFUsHzxXfa4XbOdsp3GJcGmptFLF9jKRGAglHbKKTHDGHRgohXn+b8PNKhfe3qZiJnvZUXqrG14IXNiR48WHDRF7YWT7xodWSp7KMkZOZ/yQiyoKGaG0F5kWpfm7vNkVWCqIjXrcOYzk6EaM0qWVNK3ySvS7fc2GJYzYtETEJMsLj3Ib/iQ6MN7W7106gIXNwcQTLq3tVKJIR0SH1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMJN1IR42o5oCP3ceTzm+dbYKF4qxWrDNH2M95HWOFk=;
 b=nCZIert1u4iGd5TQA+SKrmC+dP6YURRBfK0IyR63PZligT57Cx3mFv5Hst3qv/ItuJQ+3X4tiNwSP3rTM6ZBDsJVeDB7R9p+WCfV07+3WgrsbR2YMRbbLa992qUnVcm+oHwAidxa+RGj53PdoKBSJj7vfZXsNprD2PzfqTAz9zyUmw2xWHyBRCoRPW/4WrvDxB5TwEcew3Ppc8ENCqP+xydtxllxE6k5dy/H8eXC+POB8It3LT8im6thp0bEI+Wiu5n7s0XiFX+PZNtlRCHnLpHy1sOXonEheStzmBu+p+Wg9u390Q+mE1AiuvUUhg8NqwhtQq8jyvwKkcsP7WIx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Wed, 14 Jun 2023 22:33:21 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::daac:2cbf:e20a:4f7d%4]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 22:33:20 +0000
Message-ID: <143b6ba1-4ea2-cd62-ceef-5acb263a2264@intel.com>
Date: Wed, 14 Jun 2023 15:33:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH next] drm/i915/huc: Fix missing error code in
 intel_huc_init()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, John Harrison
 <John.C.Harrison@Intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20230614204109.3071989-1-harshit.m.mogalapalli@oracle.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230614204109.3071989-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ac0f2d-51f9-42f6-679e-08db6d275b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKv/c6CMIOkMxXbDGAbB1Ie7D4jj4XzpYwNbDFYgMwo60N4sZVFhJGua57mbPsMPE/+G2FKQDZ5Pah+rLf5Hpa73z7+zsDa7OqSgyEjHV45NcprOjtPvsiVXivMS63FgPWaDWkAY9MbB8e6/HG8k7O+ndJFXAJUdddS+bNorXFZsDm+T5yYKQhLLtzmRm5iApOLIo1rgeUM88HG2MywpjgwCK1rPWwwd3v6o0soyaqbvnpKUP4B4hcNaL5bKhwEjCwwniWK/WVMunTDqNzEDyifr9gDsYoZ1pgZucEThEeZlL1kOrneqG7YhTXMPctdB2fvztMm9iZ1V4jyiwKJj/HGa34mP3dWB2SI6R9Dp0mnV+WCvlTQT9xAVndbCQx6PpOFHRJ3RoBuSJz2D9ZiySEnDByL59sERJSVcx8uIXr2Jeq0bHZytkgEbnHF5WCnZR8p/SecoJsXe0j+mUZMsKFKGF7wcR1KY6e00KkDBQsSmekDbw/2uqI+dqoaW2rrGStp9OzcHjJMknvyT7ZHy3FlDX1t3fneIolyMgQktxg9lukDDnSjSTwPqVtx9OR4fyVIUDLeaiB80waAeHUH/hfgMl4rCd0IWfsWDZ9FMc9UfxJ1+I1l4qKsoo2d+R9YHGApHq2uA31L5wqhLJE297GLDcAbOpfKSIHnll5srs4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(7416002)(31686004)(2906002)(2616005)(83380400001)(5660300002)(8676002)(186003)(8936002)(38100700002)(316002)(66556008)(66476007)(66946007)(82960400001)(86362001)(921005)(6486002)(6666004)(6506007)(6512007)(26005)(53546011)(36756003)(41300700001)(4326008)(31696002)(110136005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RHbGxMTnRoTzZoVENBUlVDWEtSZHZEWWpqTlM3dWpwQ2E1TEJNSC9BbmRo?=
 =?utf-8?B?STh6dUp3T1Eyc0U3VDZjTm1VMnVvN1AyOVFFRVoxMHhPUGpFSFZhTFpEZllQ?=
 =?utf-8?B?NHpHeUFrbGxBdS9RT3lxNWZjS3NJbkVlQnpSaTRKSDR6L3VxZDJ5cncwek1p?=
 =?utf-8?B?L2pGY1YxaXMwd3RMSGx6akM5QXYyeDA2TnRKaFlEUVljSEg2WUtTdFIzczY1?=
 =?utf-8?B?QzhZemhUZWUxbGlOdExPczNJYnpDVUtDRHdpZ1pmM2RVZ01uMkJKK1l6VThu?=
 =?utf-8?B?aXZQREhsb3o5eVF6bDE5SzJLZkxQRUU2NTI3RCtsdUU0RHprTzMwM1dNUTdx?=
 =?utf-8?B?MEV1WURwWE53REhraW4wUjBPZVdpTFcwNWVvcTVTSDJTUGhwWGIyZXltQ2w2?=
 =?utf-8?B?U2RVU1hRMjlUd1VwVndkQjFSeHdzdDhiaGR1ZUdmRjg2UUZyQmg0aTBvclo4?=
 =?utf-8?B?a1ZuZXA1aVpIMk1qRFJTM0R2YXhVdXhlUTl0eEgrUzNtYXJaWldhTTdsTDQ3?=
 =?utf-8?B?bE5iR3FjWThTYmk4K05rR0svZUM3amNmdTVzNzF2NDZRU0Q1SG9INldRUlEv?=
 =?utf-8?B?bjk3bVNDQjBsVzVkempxNVZBaTFveXVsTDkrRjdXa1dsOVIvcllFVExmK3Qr?=
 =?utf-8?B?QnRwMStNWGVMS1VFNFFYUGVmRkVaL3pIelRXbXZ0bnllZDlZbjRnUEZ6NTY0?=
 =?utf-8?B?aW51V29DUHZnL1J4dFpwWWc4Tk1DNSt2dCs1ZjVOZzZEcFFRdHRhQ0hCd2g3?=
 =?utf-8?B?SDR1TFJYZVMwRFlWdldjUHhOU2svRS9XeUVtR3hUTnl0Mk05T2ozbkNtZmdV?=
 =?utf-8?B?M254ejBxUHJmT3BhdHJ4a1BqWE8xeUFWSmlrbzJUTHVTK1dubGFWSzk4eDIr?=
 =?utf-8?B?V2xxRXBGTG1yWE9leW9GdERSN3ZmSEFjamxSZFJvbk83bEU3MVMxZ0crNGZi?=
 =?utf-8?B?clRtZ1lieTNHbERaZTVXRnpmNXdUOGU4MS9MN3FHOGc2ditqc1ZjdU9KbDRk?=
 =?utf-8?B?YmQrUkF2MVdkRjB6eUhKNk83SENzWVNnck1lS1lVdWRacmg5NDJkRkNjWERv?=
 =?utf-8?B?ZWVJbWd4dTNWOTcrMVh6VEx6K25NU0o0TjdOUFQ2U2Nya1lqV3h3YWUrM3Ji?=
 =?utf-8?B?dlVyTnhzWVA2a3hld3B0OGl2R0JYc1lLL1VSTTFvMTdQTVZKd2hEaWpIRUdq?=
 =?utf-8?B?dkdhazl6My96OHRDbFVwY3F5aFFBYTU5SmJ4ZjVhTlB4RkdLUCs0M1ZRSzRq?=
 =?utf-8?B?UnQzaGE5TVVJWHRmRlV2UmVvdll0RDNnM3l5azR4RFlNWXVIQk1TV3hyeURX?=
 =?utf-8?B?VzBjUWlUZFZuL0NVdFgxRVJCLzBOL21TTW8zMm9JNkcveHA3NmpQbU5UL2R5?=
 =?utf-8?B?bERiOWc1Yi93TjM5K2VaamRGZFI1SFJJb28vN3ZRNjVHQ3B3bGJnMXRLanh0?=
 =?utf-8?B?ZTVLWm85cXhrWHU0WjNteWhKcXNLaFRBdkdvZzlPZ01Wb3l6MStNbmdZb3lh?=
 =?utf-8?B?UE1WOXExUzBBTWVIdmpFMkM1L0NyeVJHSlFkUTBRRzlRUXVTaGdaeWw1SHRP?=
 =?utf-8?B?SWNiR0gwRGR2Mk5HRFlqeDIwZHB6ZHhhSGtsVlBneTFyblBOUmJ3NkFpaGlp?=
 =?utf-8?B?SitramhINUV6ZHQ5VFJuVmlOU2tvazJQTHdHQy83UGNNbWZuSXNBcFIwOXda?=
 =?utf-8?B?dFo2a1V1UVBrQWxOSXNVSE8xemJiM2V6RUpIWFQ4d3NKb3A3bnA4MDJuMHhC?=
 =?utf-8?B?VXg0dktadVhnay92NUZCTVVCS2FtaytBTlFjV1Q3T3NzdEVzWFdlZlBXWk1P?=
 =?utf-8?B?WVd2VE5SMGoxTzlsU0RVamdwaGFiRHpxL0Z5ZU8wTzFjbWl6SjFGdHpmNVhu?=
 =?utf-8?B?WU1uL2ExR2VySmdwQjlSa1VTd3lTSHljYUhFanpzTStOWmEvY25TWGxtcTNQ?=
 =?utf-8?B?MzdMcFh6R1Z0ek9OWTRQdW4xK0UwYWVvZms0eWZqVEh6cHpBc1UwUnBMZTNJ?=
 =?utf-8?B?b0pMT1YyVmIvaXcyOWhIejBYMkE3ZUJsSUtxdklCWkdoQWNLUG9VVU53OENW?=
 =?utf-8?B?TVpmdE42MzR6eTVIUk1VOG5EWGRZdG1FaExVK0M3WjRHVU13N1laSWNrMUg3?=
 =?utf-8?B?OGV6U2dDYVBQS0xPWXhuYUhaSDFLVmgydVprTis0bUt4eTVtMlhCd05vcW5k?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ac0f2d-51f9-42f6-679e-08db6d275b44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 22:33:20.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54vQY+5c3oFene5LAx6TTwJijg8zR4ffnxzn8QEzlAyByykrLjHCs7nCZkxPJnx2ld6421N9LIIh2//qaARAT9yfSA12FXX3cHmIoXX+hvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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
Cc: error27@gmail.com, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2023 1:41 PM, Harshit Mogalapalli wrote:
> Smatch warns:
> 	drivers/gpu/drm/i915/gt/uc/intel_huc.c:388
> 	    intel_huc_init() warn: missing error code 'err'
>
> When the allocation of VMAs fail: The value of err is zero at this
> point and it is passed to PTR_ERR and also finally returning zero which
> is success instead of failure.
>
> Fix this by adding the missing error code when VMA allocation fails.
>
> Fixes: 08872cb13a71 ("drm/i915/mtl/huc: auth HuC via GSC")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks for the fix.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

It looks like the patch wasn't picked out by our CI, so I'm going to 
re-send it to intel-gfx for testing and then merge it via drm-intel once 
we get the results.

Daniele

> ---
> Found using Static analysis with Smatch, only compile tested.
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index e0afd8f89502..ddd146265beb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -384,6 +384,7 @@ int intel_huc_init(struct intel_huc *huc)
>   
>   		vma = intel_guc_allocate_vma(&gt->uc.guc, PXP43_HUC_AUTH_INOUT_SIZE * 2);
>   		if (IS_ERR(vma)) {
> +			err = PTR_ERR(vma);
>   			huc_info(huc, "Failed to allocate heci pkt\n");
>   			goto out;
>   		}

