Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A397D7E01
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 10:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2710E770;
	Thu, 26 Oct 2023 08:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559B010E770;
 Thu, 26 Oct 2023 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698307419; x=1729843419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qMt5ZPojg75JkAqXGf7jIl0RxhOEj13z6uep9k/4hfc=;
 b=iaW++oTfsqLRfMESsn7D6jUK1l4PrDOtjRwvgJzx/9c3se6NK/UtVVM/
 iMHPXJunWn5GfYu0wNORpVBomxcQXYStgHmnz+WyNiEn7I73bZAKlnf5T
 BFacJKBy8mS+yTO6y7HCuWOfXbjdJp46OxcHyNNyPOkH8OjjIM8yGTpuj
 v4ecJ0h6UgiK+PgaoD/YtFq5YXb7x60XIr3ars8GoDqNqM/LrEJ3hjX13
 a23Swg8Tlic04nNvyvKqPtq8mliCaaHJ18vu7DGox1yo3ZlFzL9+bVfKk
 plFqt83wMRfwulihPk7ij7cB1ZQyJvoahk/IwW2Js+oWc3cAcMTdaKBC+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="279182"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="279182"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 01:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849839867"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="849839867"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 01:03:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 01:03:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 01:03:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 01:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk/XDtOzqGX9PEEnqmPuhIXpoFKf2rLBMA+bTXSnOOYKJsNgqsy8SLkFJGew5A7miyRgPuFt7shGPRocAHNYRC9rhzbOVtHArtZXWCJtLxoOdoRS1GcPDOrW/BX7SzbpTEO1uJ4qLDwD77DatSBRijoKuUyr2iRjn+nh1vfVUyDXygGs2SjDHgTSwXR7XfYnDfdL8lnqOUsQ5l/CK3Qe0IUmGGedpQWboOkDMnGyhoZp9laNE4eDzaDKy7FFhEZu4H8sqY0oVAYjSPdUbagwJEmTEMiaqOSkTU/s8y+BFHFQ/I7FtckTnWxVlNOrYhPDfbGEw9LWfQtOhLt6q+hZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1P/fS0Vlqi5Nt8eecP4n+1FwAAEYHC2se5GcWCjn0r4=;
 b=K5/FpDik3hH7fy7L92+Io3ggqBmzYWs/B0597rPEKy+uuGTFCEnWjvhvrbTFRtglcIcNzZcSfwAr+gwvHeXqL1fEN+rURYolW9RICKCLNFgqTUZEf2Nm1YsfE9UL9qFQ/shJ+30AqWKo7kvNkFHu9ebu3epLrhoM5qlDepebaNUwf+SnLctoLm0XGk/fRHoPpcjlVc02xe6A2VuW3MdCRZ0ifAL6jMv4chPLEu2m8QPR1hmj81QWnwvVzr3iQ6GhT7J5CDmDjp/o2p4y+0T78bb+tWFjXeI+yBgdmrii39H7K9Aj6NdDrtjaFYyK1zqyNlWyYpw29jYzGS66mheUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 26 Oct
 2023 08:03:34 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::bbfc:d1f2:512c:2f97]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::bbfc:d1f2:512c:2f97%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 08:03:34 +0000
Message-ID: <adbd431d-39b7-8026-bc38-4741bc037ef4@intel.com>
Date: Thu, 26 Oct 2023 10:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/gt: Remove {} from if-else
Content-Language: en-US
To: Soumya Negi <soumya.negi97@gmail.com>
References: <20231026044309.17213-1-soumya.negi97@gmail.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231026044309.17213-1-soumya.negi97@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0349.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::14) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|IA0PR11MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1ac768-8773-43ac-227e-08dbd5fa0c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uevMFAYI7CYQ5njHqkaFYu5LU6kbfGSewm02GGLJGS5ySHstZ7kHsv9o1PFu3+wMCS0xGJD1ya0NS3DjH36HMS2QcqMKTcYsUm3JN/BcIuafNYHvul/TKva7XikkDkDsHKB8DR8Dfb2F20ff1Z2QQo//boH1m4bdOdWfXT+Ewh5B3UJI21pMRCtBxhO96rfYpKKiWTppy96Lqvqy4m0/A4bvuCyAYVzcHGV6vAy8HVC1P1PEOQ0alm5G+Zg60MswNAasuy+15a9aaK2YMEXlinINcnl+ORL+mmF0UdH1U3W1ZqsVh+pb0XtkEFG3CygGjkkcLIcltYHcT4HYtFP4IUXQMzhjL8JpEQVhxiWOvAEN6Dne6xc4HT1YegX5Z+NE8OwIZ8LxBGCsoIsqU8tBwO7axKB/3qumVfsFUsmEyJMi9xLoXOXs355IUOY5V6YOu9P1haXYymvF7F59D07xinoL0KermIeR5cWEVrLJl7iddDZvhA/cw6WQyptZwkCd5OoA0KLuzqJZLFRstWxHaQFUlxKmMEx1dddUkr/b+WV2Uk46veO94aX4Dn8bl/kZLyZfPgLMl6QaCo2ucRhonuRpmMVNNzSSVJ6K7kYAHsEAGj3UMkTN0mKFrY6stXP1AgB3yodzK3k6j5cSNlc3HOrAcQM+cz5CSOQlu11BLMlkK2DKJgR9UQD9C9IlthfL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(83380400001)(316002)(31696002)(36756003)(41300700001)(82960400001)(86362001)(2906002)(5660300002)(44832011)(478600001)(6666004)(54906003)(6486002)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(38100700002)(6512007)(53546011)(6506007)(36916002)(6916009)(2616005)(26005)(125773002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVRydjBEMjRRM2Fmdm9vQkx1YWNWZGZYdXJyQWZUMzcxN0hBWHR5UUs1a1Ja?=
 =?utf-8?B?eENiWEhwR0JlTElKZVRIRUwwWEFLb2lva0tJZXJtNE9WOUhveS9hUkNkQkZM?=
 =?utf-8?B?eVMxZzUrcExxOUkweWFHZ3ZNY2RkR2JVcS9aZTFRd2ZnSTdWN0tHc01lQ09m?=
 =?utf-8?B?NGE0b3pmQnJKclk5Qk9iSlJkeWtlSFplR0cwYlJuQ1Rvb2JrM0R1Y3hyV3lN?=
 =?utf-8?B?WXd0N2NEb0dTak5VcVZTVVI3SG5lZmRHckVURmRmdktBNnBLOE5DeGNWVmF5?=
 =?utf-8?B?SzIrcFRQcnRBQVFSTTJ1VFlLU002dTBEaHh5YmxKTU1GUmlQSnQrUXlQeUpH?=
 =?utf-8?B?SHowZkorT2pzUXJLNFZjTE8xdE9Fa3JZcHREdUdaZkJ1T2ZvUkZiaU5RZmJw?=
 =?utf-8?B?ekFEeGttdnFJZ2JKdURSQUYremh3QVVBTWRMV2xGWk8yN2FOMk9RellZT3FQ?=
 =?utf-8?B?VWo2K3M3K0VnK29FTkViZ0JOeGhwakxMb0hWajlYdEwxUFo4YkxBalZxTnVu?=
 =?utf-8?B?WEtJWXFtUEtXakNCOUtNL01NVXdNc1IzZkp0VTlkY3A4c3RzRmtMcVFoTXZv?=
 =?utf-8?B?ejh6MXVxUThVZzd4R0lLVDN5ZlBrLy9UZlcxeTdQamhlU2NrWS9NYWwvYjZV?=
 =?utf-8?B?elZCbkZleFhFSmFveU14cm5BK3lTc3ZTaHZibXE1WUxHMmR6b3YzOWVuaXI4?=
 =?utf-8?B?VlUza1hUcERHZ0k3K0Y3OVBVR1h4YmFPU2NqS1BBVjExcmRVN1MzaEJ3aVV1?=
 =?utf-8?B?azRwRmJnejVxSWovUEZVVWVaSnZNMFhoT1AzdTlzUVhPSFpVKzVsejJtbnVP?=
 =?utf-8?B?RjE4enFMZE1NUytsWW92MC9LdWt3SDFtb1pPcVpyY20vQ3pwNXZodkg2TVZG?=
 =?utf-8?B?c013L3V3U1F6ZWNYcjFMM01HWndXWjl5T0NiSHdxbitiRittZHg0dWZIZjhH?=
 =?utf-8?B?WjRlQlNxSWFIQlFmcDRNb2YrUHFFNTg2WmRvTUgrd2JrZkp3T0FzeUgvSGZF?=
 =?utf-8?B?SnBWeXlGZUlzWjFESXhnTmRLVmd5Rmtyc2xLeFdCZWJlcGJ6S2UrZXpDNjlP?=
 =?utf-8?B?WC9SNUR4ZXVaTUhNSFhadDhJNUR5eWkwZ0t4NTBQaU04alFyeC9KZ2ZRbk94?=
 =?utf-8?B?S05OamVvK0hMU1djaGhUK3U5bFRjM3lnK2xYb3BPNUtPSmtmVExmM2Y3eDBz?=
 =?utf-8?B?UWFHaEMzZE9aMFNOeUlMb3V2K3FraElJMThKTDlSTHVLQU13NEp1b1VFMWpC?=
 =?utf-8?B?UTdldkZldEc4UERuMVRjYlpJYnhoRjFOdW1wNDVCdVgweVB6SytzREI4OWdT?=
 =?utf-8?B?MVB0R2JKRU5YcU1weVVNNFJBVFJNRldEL3VqOWYrdXc4RjFscW52aFp0cXlv?=
 =?utf-8?B?dHFyNXF5VnNFWGJaRGx5alRTb1dITGdZYXFvdmVCdFMxajBlSWZlMEkzQkpa?=
 =?utf-8?B?bWJxTkVOcWcxTyt2aFEzNXpTQ2pkZFMyUHdIUHp4T1BRZ1A0M3Q0RXQ3TVQz?=
 =?utf-8?B?L01maFkrN1psdW5vL0szQ1pPdjBMSll1YmRmUENoaHltL2U2VFhueEtlTFJr?=
 =?utf-8?B?R0dFWVFrREN3MFdxMXh6VTRQV0NnQ1dNNmlBbzVpVmwyY1dreUxMb3hwamR6?=
 =?utf-8?B?M1dWMjdqRFlCQU1WV3NSNSs0M2MyOE1oNldadzZwUGNrODUvOTdHdCt1ZUVo?=
 =?utf-8?B?ZTdoSjMwcFJsdkZUMzZQaEd3VzJoYUp5eHFOTFgzR2FOSlgwcmdiYm5VaFpV?=
 =?utf-8?B?OTRqUjJhbTY0aFgxNStqTWlwZW5mNkxsVkUvd3p6ZVk0WnpVYkgzK3l1bU1s?=
 =?utf-8?B?NFhabGdLSGMrZkRvZWNPcGhhVWxtWTRBNkdBcXgrMVZ1c0p5Sm9pQ3BVYXE0?=
 =?utf-8?B?bXNCL3VkUUQvOVVaSzVCYmNLcGhGdWpaUk9qVW9jM3hhYW8xYlhHQ1k3ZXVE?=
 =?utf-8?B?a1A3bHJMd05pOEltdnpWWmlDaFlVeDd4Z1dNeEFKRk9GaE9SQy81eWp4SE9v?=
 =?utf-8?B?M3BoRy9Qa1B0NTMvTHpPcE9qVjhyMWVZMEdOc1Q0VHplZkVHbUtLTGs0QmV3?=
 =?utf-8?B?bmhmaTh1eXk4UlF5TTI5NnppdEV2MjRTRDdoRFZGcWU2emljWVZiazlQbHhU?=
 =?utf-8?B?SWlrQW9IYU4wS0xWZ24zdUxMRWV0Qy9sZVR6TXFYekJTWHFMS1Mwbnh2T0xt?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ac768-8773-43ac-227e-08dbd5fa0c96
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:03:33.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVGV1AtrlX1N1gU2y/LowmA+U0Qo8SlNGCiDSru+d0Z5NPha1/lPNMO4c0mYYyhbSaXI9kfmDa0X0tUytqoBmO/mnomD0lWw+MUgCbm3Fsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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
Cc: Andi Shyti <andi.shyti@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26.10.2023 06:43, Soumya Negi wrote:
> In accordance to Linux coding style(Documentation/process/4.Coding.rst),
> remove unneeded braces from if-else block as all arms of this block
> contain single statements.

I'd just keep the description simple, and say that braces are not needed
for single line statements.

The patch looks fine to me. Andi, if you decide to merge it, feel free
to add my ack.

While we're here, I wanted briefly discuss how to construct To and CC
when working on i915 code. These are not hard rules (and some developers
might disagree with me), but suggestions on how to get the right people
look at your code and reduce the noise (decided to drop maintainers;
they'll be able to join the conversation from their subscription to ML)

First of all, if you work on something in i915 that only touches this
driver, you should submit it to intel-gfx, and there's no need to
include dri-devel. You can, but that mailing list is mostly used for
changes that are either for DRM or impact other drivers.

Secondly, try to include only people who are directly involved and
potential reviewers. You can CC maintainers for bigger changes that
require their involvement, but here, it's enough to include Andi, myself
and someone who added this piece of code.

So, if it was my patch, I'd have intel-gfx in To: and Andi, Prathap and
myself in Cc:. get_maintainer.pl script might've added a lot more people
there, so I'd move away from using it, and only include developers that
are involved or interested in your work. You can always reach out to
Andi and me before sending your patches, if you have any doubts.

All the best,
Karolina

> 
> Suggested-by: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 1c93e84278a0..9f6f9e138532 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -226,16 +226,15 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>   	gen8_ggtt_invalidate(ggtt);
>   
>   	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> -		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc)) {
> +		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc))
>   			guc_ggtt_ct_invalidate(gt);
> -		} else if (GRAPHICS_VER(i915) >= 12) {
> +		else if (GRAPHICS_VER(i915) >= 12)
>   			intel_uncore_write_fw(gt->uncore,
>   					      GEN12_GUC_TLB_INV_CR,
>   					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> -		} else {
> +		else
>   			intel_uncore_write_fw(gt->uncore,
>   					      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> -		}
>   	}
>   }
>   
