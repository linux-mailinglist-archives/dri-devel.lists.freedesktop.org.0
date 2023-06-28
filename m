Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C7740915
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 06:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16710E346;
	Wed, 28 Jun 2023 04:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04D10E346;
 Wed, 28 Jun 2023 04:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687925185; x=1719461185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dM8WrDNBGvjiDVvv35lBXPVGQ6cW3w37fY2gcyyxpio=;
 b=b3YRHE+4G3m9HfcJjIjxiVCfED5vg+H4+WhrvKT1wKEC6J/rF/GO0P1z
 DnhgNmNDLeFh80E008y6mkld+DZ3bGxWE5XsEVcbQBGXtbuE9S+UwHDIx
 NUJvGLdeiKL8FU7u7u8x6/KyPgX6z0S9iUNjmqPq19+GUEOJxNcDp+ylH
 ncKC0IawUTbqWO/GUGaqumuJkK+CYsooQWYK9YtIC8waezcsuZCGGWBZh
 otl5Ke0UbqLVevnZ+OifTruL5Un2qyjEOqaciu2IdWrHmIDMR6BiI/ilK
 6yC+/RtpKo4vPfEiRBLCQvtG+oj5Ia7A3GKGvVDKx7mfqNiTUgOxlNOL8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392437463"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="392437463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 21:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963435921"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="963435921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 21:02:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 21:02:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 21:02:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 21:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kD1uyQQgzDeZVqZyEMX9LLicBv4Warv27UU02pr9Rd+v20JQkHNvitzhjUk4Oip//brRs2XZbSJh9Z+AEBQ5VwwWXS9P4lif6wyuOIm3fgcjmEtfMmRDC1tTbuBUSTJ0vhPwSjIYIZMMEHOugtT8k99JgTQLA9KsdHSZij+I8/E/reE8JuSqVsWuH//UVIwsNX9TyaGsBFEK7hxnd91UwK/yRk1gtfAX2uApoC3RYdRUcYK2jwE7ImwwupCN5/AceSjOxxHHwLw8+T9KYRCxrLcjLsRMRU2vgJOslTnz+TbmwuULrLZkCixAW+rPo+xeI+5he0n8eCaZqP28R8B6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJgXAySYwHt39eL3Z7cLBLjoLg26IOyx9V2WTo2FOcA=;
 b=Y1+uRrVmdmAeKaPsbj/43Bix6/bkF/YKPqzE/YdmTd76cx7DZObE74nDL9bdiJUjKJ5qBVFiK4q5FD1SQNAkGfcBRGZdrM1SxlFNQR2rCuJgGAO1N5SIyY/3nV3T0GbGXPb0DeGpbqFGULMAskRqcNyvLmkgBoQYBIUaSWb0LY1TxSk1Jy6RTf2zNEAFrdXnPF0ajC8aAUrmpRgXQFBGnj6W9oRYE8d/TqZAd1reS09uiqot4EyXw+Yj0+UOUfB3DiuPlJSwyIZxycv/ajL6OBtl1H7yT5mAb4eB7cojnhiLuI3+lbYcglg96l+Cwgs0jkWNr2t69YrBowPSx9MeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Wed, 28 Jun
 2023 04:02:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 04:02:50 +0000
Date: Wed, 28 Jun 2023 01:02:43 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kenneth Graunke <kenneth@whitecape.org>
Subject: Re: [PATCH v2 6/6] drm/i915/gt: Remove bogus comment on
 IVB_FBC_RT_BASE_UPPER
Message-ID: <xk7u2ucaymz6t6fs4ldqnnoz4iyvweavbzurevsnaaof75jddc@gtdsrbqtxcvx>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
 <20230624171757.3906095-7-lucas.demarchi@intel.com>
 <1781954.dNn8tgRAG2@mizzik>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1781954.dNn8tgRAG2@mizzik>
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 0621a60d-5909-4df8-37b7-08db778c8a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTRar60VOkyXd+xQE7AstZiNpnKVr4JO+bFFFviAfqD4q2zRag9RDCrEJD8O0A0AhOrLNFwtYCNwhcFRHk3/sRE5T8b/xvdsrxAULE7KOr5PGZo0aoMwjUfZCv2mHo4Wt19RvzlEWrv7IdQlq+ze5hbVpLEyPpY4dOcxDFMu4lRJQFcSpAjmXi++DBTbLnJU/NY+kIvNskqFskie8GzD1R1smh0aH58E8hiU+2szcFtx4eJCxV1CH0cO7f2zuvqBW6Mfk2yGMK/OgPS0kgWn0BGWhyAzwbM5dwhltlFDPuERKvyB49QZXD2a3xXNfZSiE6nEvjCMi5eDrQ2HwKptAQtZp/F4/2ZyUML4eOxzOCEVIeO3oDQ2H6PuuxSFec0z9YE7uM9ASX9e6Wj/InjEBQxETwTb8EsLRdYY81ojBcHkNMi1oH1bp7MkY0QUTE5DtlOlzrGfv20LK5Uef5GS64BtyR39g9JFHEkpsXDQAsiZ6dFDNDBLYuBYbVXlGNzF3xdmnros1vsnvpm8bKjMxhQMqdxZ/MfI3BbwwhrgqijRFIdV+n9DTI8FPQA8LwMM21N6s/lcW9+xe2kBhtNG/4QqPEkOBaTj1WuTnMX94/O3iDtUbf1QBBHUcAFG2O7D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(66556008)(66946007)(316002)(6916009)(66476007)(4326008)(478600001)(8936002)(5660300002)(8676002)(86362001)(41300700001)(6486002)(2906002)(9686003)(33716001)(186003)(6506007)(6512007)(6666004)(83380400001)(38100700002)(82960400001)(107886003)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VecHYgokRVzTium4Ro71EzWyxz1yG3QPcRTqX0fDN5aWbYQSUCek3Kv2hmzW?=
 =?us-ascii?Q?Ct4K9JDCpTO+Dj2SSEwbhCm/trIoos8dgdsz/OpYzfHx/vit6xSJ//nvhMaB?=
 =?us-ascii?Q?CN/692/WK9in++0OGP1YUtuVPrXg99OXE4z7BHCRK0TWQ8FUkNaNvBopTstc?=
 =?us-ascii?Q?XzCVlk7z22ufHKQqm9GAWyaRx0OLlUb/yBpQEIwhA4H5OePyUi/+DbS3NIaS?=
 =?us-ascii?Q?ZaD7pvhSwhEDanq6Ox+0FxdvuVyypo5NbNA2usFt8CQPfqhrZKEX7yTgHHWQ?=
 =?us-ascii?Q?EyJ0aXqc5QwqmsZztNUE6qdMayIttEYWoyUViaGmiTW8B77ATI4/Ls7kXuMz?=
 =?us-ascii?Q?Fl++GMMVCu4jSHRjimXMYPMBpJpghpDW73ine7PeRHPM1a8wzvUGn4w06YPR?=
 =?us-ascii?Q?qUWId3rVgiauvAulINfmqIuOVo9OGyC/qBLHrFl3uDCul/59Q+RnQ6Qt9dLZ?=
 =?us-ascii?Q?GBxj6B8b6j41ZN/yLyhPfcsecqVyHMJVPQwMNjTk9bKV6V9YfwLAMallK2oj?=
 =?us-ascii?Q?GnelvTquPHI5oyIimcpfdtqjTUhecFBtu55NTUYw4vE0RNeGyZYfx6RuKpot?=
 =?us-ascii?Q?eC7Bfg4b2VN0Lg+eMCik/cPjNTqo2jYd08ULx6VLr+3vuOQ+MN1DbJg9v/oj?=
 =?us-ascii?Q?+Djvx1phkfjzdWj/9t4GETYCBEuiYvZx2YZflot1f6BWvEyknHwsLKV8CdET?=
 =?us-ascii?Q?e0m54tPgSGPismb1069pkFDeOclY4r6Yx7azUI7DtuXiSJZJuBMHrlmA4gkP?=
 =?us-ascii?Q?eadz/4IgG1BLmofsvoZcHTv8Yr2d3hVs0gqKN2htQieuA48qfVl5Sz6a4ttG?=
 =?us-ascii?Q?yd/F+IHNJGB1NSEOr51bT6QKeUmtp0wvjmWHH4MPJdQHeVM53i+IKhVZCPM+?=
 =?us-ascii?Q?azi3zL9VcS9WBZbOOAh5DT6AbnmWKVKxZ8auV7r8RvCwV9ZGQBeamfzqKJPm?=
 =?us-ascii?Q?LQhhIQlFsrBx9Oh+8VQwV0RqT7gmtd5PJpi540A+USSFG/gnxnFW562hT4sK?=
 =?us-ascii?Q?B7kc/GGgNp0368FB2CASO/8yLjdZmujfcE+7TcmgVbW5T4MqSZoD0oD5BHFy?=
 =?us-ascii?Q?i6PRf/L+1neb/bEOLlmZe8skZbT4QjuP2VtMpYFQmjadxdMv4VcDvF5evZjG?=
 =?us-ascii?Q?Zv9NJAE5h4F32AzssYpwU0PNeGzHJk8OTgHUAGFiEAvrmnQ0LURFDmwdf26P?=
 =?us-ascii?Q?BNI8sAksNd9RAuvTKvW4T+hLiEnfnlhurFXoORW+uUituPm2TMrNw51vytNY?=
 =?us-ascii?Q?4i1WmgGUW5MtJ8NTzfGdMiI0YM0ZsAEd0cpSKfnbQ4AXm9ETdccnY/OtBDdX?=
 =?us-ascii?Q?IVQxCkd6uXB+NI1hc34A9WyaYS8MBjwgasmnOthzEHHVLzy4XkYS1mv+1yYy?=
 =?us-ascii?Q?jh7fHPorkhzUJcTLkE8PcX3WhWLr+yfKTp+OOXByGb6GCVS7y0+l/GeXuO6E?=
 =?us-ascii?Q?tI+rKJYMT+DvFZTFBzyUbnTs2rC7VT21OwwHhz05tvusfI9pwLcNe9ZO1FGW?=
 =?us-ascii?Q?LIQfVOcjloenxTt11OSeGEd5L2pwEi4hijxxxaudsmWj7KMPOiNbGt5g0Pf/?=
 =?us-ascii?Q?LSACc6j9eXxTYshsvJyRjsobNhcZ3b0hl96qIRTnunnUGFWg0HryhKXBHVip?=
 =?us-ascii?Q?EN9aC13oGpeWz57fHddgoGcpYgs/mraaLphM50VlZcDO3joWvyWzg9ioiBhw?=
 =?us-ascii?Q?Sn2wKQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0621a60d-5909-4df8-37b7-08db778c8a6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 04:02:50.5959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5+o1azZEWmO9CixcjEzcWqJif4Oqbavg6Mhyn1k2J7T3gWMLHQfSVJHXAm9KOFbL1wWPn94lYjFH1VlqNAtGJr6ThQpb73dFGT9WP8V9t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 11:30:26AM -0700, Kenneth Graunke wrote:
>On Saturday, June 24, 2023 10:17:57 AM PDT Lucas De Marchi wrote:
>> The comment on the parameter being 0 to avoid the read back doesn't
>> apply as this is not a call to wa_mcr_add(), but rather to
>> wa_mcr_clr_set(). So, this register is actually checked and it's
>> according to the Bspec that the register is RW, not RO.
>
>I think you mean wa_add and wa_write_clr_set here (not mcr).
>
>One thing I've been confused about while reading this code:
>
>static void
>wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
>{
>        wa_add(wal, reg, clear, set, clear, false);
>}
>
>The second to last parameter is read_mask aka wa->read.  We're
>initializing it to the...bits to clear.  (I would think it should be
>(clear | set) to pick up all modified bits.)
>
>wa_verify seems to balk at ((cur ^ wa->set) & wa->read).  But...if
>wa->read is just the clear mask, that wouldn't actually verify that
>any bits were set at all.  Or am I misunderstanding something?
>
>If not, we may be failing to verify the majority of our workarounds :(

I can see it failing in some cases, but it should pass in the majority.
I think there's an issue when the clr bits are not a super set of the
set bits. For example, this works:

clr=0xf, set=1

This is what happens when we are setting a field. However it would fail
to verify for cases in which we have, .e.g

clr=0x1, set=0, i.e. we are just clearing one bit. Since wa->read in
this case would be 0, it wouldn't matter if cur is 0 or 1. It seems like
commit eeec73f8a4a4 ("drm/i915/gt: Skip rmw for masked registers")
is the one who broke it. Setting read_mask to set | clr seems to
suffice as then we would get any inconsistencies between what was read
from the bits that should be set.

thanks
Lucas De Marchi

>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index 848519b58e45..5fe85fad91c1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -666,7 +666,7 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>>  	/* Wa_1604278689:icl,ehl */
>>  	wa_write(wal, IVB_FBC_RT_BASE, 0xFFFFFFFF & ~ILK_FBC_RT_VALID);
>>  	wa_write_clr_set(wal, IVB_FBC_RT_BASE_UPPER,
>> -			 0, /* write-only register; skip validation */
>> +			 0,
>>  			 0xFFFFFFFF);
>>
>>  	/* Wa_1406306137:icl,ehl */
>
>In this particular example, since clear bits are 0, I don't think any
>verification is happening at all.
>
>--Ken


