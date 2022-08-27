Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B15A336A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605D510EAD4;
	Sat, 27 Aug 2022 01:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3273010EAD4;
 Sat, 27 Aug 2022 01:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661563172; x=1693099172;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O9yAwDz0Wfu9FYcAbaPUR3DoI5qKCYDSEejXfAKLu04=;
 b=gtE9Jios2st9E0Lhz5CyPNh81OIFgK1+s/Meo+I2ARHvo1zPG6p/qLfr
 o1bG6IEyDzrg71Ha+WihsW2cTA8TNxY99x9xshEB4hL2SUJMkoOlxk3hs
 6LDaJ6VBDIqp9JvtwkN5Ic1/Q2LMDIbAnmPKXN2vdPuZY66OhN3eH+/4Z
 RZpxoOjv5bIsuprliMr9Vq859EAmH+qSVZctl/0WHLkcgjhE0ng1iAcHY
 sih1ySXqNclwPkzda2/e7nmaqx7NofCj/O2538vQNHjAu/rB0Sc+wMbLB
 ZEY9r3Kt8mv0ingE7bw+9yzTEtgSKTcJNKAFo9hKshn5O+GQjM5mRK21a Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="380927476"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="380927476"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="714171811"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2022 18:19:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 18:19:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 18:19:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 18:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl8fgUeD89Vdv/H6IpROEgdDSd+gvp0sIA+vZJzb9ukW2rdo9j+HcRh/l0CGu1AX2KXmq7JbMUSNJSlpv7e0P4EpE4vPGKEWQlbFfpuZtCw7xxZLoS0Yi1q5CjaPRL8XySAN+WDIkcA3NSFVfEK4ZnP20NO9lmUyrf4Vdz5y/Le4Z94kGtqW2W5mAtRv60IAu0tgJxJoxvVJEfQICl7j7hEC0d+JBGHC74Sjw4m0aNmkz/HgcKge7HwFbqlDnDwpmnqFmgVk58fH3ow+Wt3IdbiUdhTUqexN5nyv3JZ+kSbfbmiqUgB2Z/88LLE9Ayh9Y51ZKVG3wpboCcsd7TMq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBkkufVmKpfUVHnNquAonpMv34F2wMDTgXl+4RkyPa4=;
 b=bW0pP9cjqfy8DKn6pEz5xK53Soob+gAoDXKZTF4g6oaJbR1SyEVG2PWA1TCVCewXzNUbMxw9JY7+zDU5Tk9J5io4fC7vyGebTVheRIcxkHnaphFpPFUDmxANKkafOe2ZXFXwlda8wNpGmHeE76e1PUWLXgWD5hnqd+PMuoqjM6IDSZuyK4OFgvku8eY9DI7tdNqvxwiaUgLXjVBlhpTFYP/tK/7+6H2t5csYd+Oz+gEI1iu1U1sHwj5fOu8T7yrKcKEpsxSYzgB1wvUfR6UE2+tC1Vtf0ZDjWGw+KgpQuqXFCYLnMkOsx9VdFlGlBQhbHJMlnCaBDxwgsJD4hhW3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Sat, 27 Aug 2022 01:19:29 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::d078:34f1:873f:a40d%6]) with mapi id 15.20.5566.015; Sat, 27 Aug 2022
 01:19:28 +0000
Message-ID: <90e4132a-e765-7b2b-2570-db2137b38de2@intel.com>
Date: Fri, 26 Aug 2022 18:19:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH][next] drm/i915/guc: Fix spelling mistake "heatbeat" ->
 "heartbeat"
Content-Language: en-GB
To: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220826081058.1605094-1-colin.i.king@gmail.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220826081058.1605094-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a7269de-b03c-4a4e-43a2-08da87ca3022
X-MS-TrafficTypeDiagnostic: DM5PR11MB1435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k5mHO/8i+tJshC9CSpFgAUmrIv4zkJTQV/6x25TZ303ZW1le/6BdU8S4W1Uz63FzltEfYSQizYV8VTlle9vIqTLmCrlDkZYm/1eO6imnvRcqn9Q2pNx9c6C1uViSnPxXFsKAkuvBRpMBsXbB3EkGaXwt9M1jCz1/wt/ewhPb9QiXvPTZ+KfOQF3Vwel4DiLdHlaBB/t06e/82ZRwiOs88vgPPurcvsyiG863WeX+2NQAH6CRkSlRN+15bHBkKpqrUQ9nLF04V6EmirK0Ra4m7Tsnr4WWquDJd30DCD8eg5YA4wheXww2wifLSTS3WenSdZitx7E9VaH9sIUirQxy1YQArSdfPnTXt9kF9RMIpjZfm5WHPkGzO1LMXJnqkV3+xodz/R/K+eRIb0jRu1YlnODYr70yemi5kNoVJn0R3NUK4M301LpDHxOhLcFs2W+9Qz50cyGS6OOjwCIf2k+eq9qPphYAfLmHThpIhqi7+2O+GWbbVNbW2ttKYLgDk/It8auynOZg+1fAtp6mwfBvp25G4oQvVsEQxlTHU5EvOPpDFEu3IpudT/DTx0//vuiqyLKyLxMdqp4o73IZ5g0skheAvosPuIHe/h07FR7fWy/+KyFwtuL374664tlhWQvTVHvzwnaaMd5haamERL5HWQNbWpfmNe2RYqjDY21fDVS1MIUTPo6u0u/TSyua27OYuiezlqhYb3eTmXhKqoCmINDBbvqi7hjmxo2scEu9NBjC+mgyu1p7EXKgxF1AYJHQWNu+zvAxlDa3sVY9fGsBys7vjhDpeBtHGb2aoA5TkOZzlJlkBh/vC4REEKI37eKG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(26005)(186003)(66556008)(36756003)(66946007)(110136005)(66476007)(7416002)(83380400001)(4326008)(31686004)(316002)(8676002)(53546011)(8936002)(31696002)(478600001)(4744005)(6486002)(2906002)(6506007)(6512007)(5660300002)(41300700001)(38100700002)(2616005)(86362001)(82960400001)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdoY3ZoQW9ZNW5na3dSRHBPWmhiamxGRGF4QnY3M054L21oZERzTCtCSG5K?=
 =?utf-8?B?UHdvbFN4bUtqTVQwb2tzQU02bzFPM3VZVytNZjJhRU0vQm1Cc09EQUFPeVFI?=
 =?utf-8?B?R1JHWVhFNktJSGJzSkg3VFJzWk1TMytlTkdwckNZRWhteDZjS011Tkh5YWov?=
 =?utf-8?B?WXQwVFlBOW9TcE51VnVqUUowR3lkY3JQVjdITDhCTEpBV2NpVlFuUWV2c1R4?=
 =?utf-8?B?eTkvWWc2NjBQQ0VOU2toWFJnVnpXRS95Z0VHZUNVd1JlUE1lUGxtbzdJZFZB?=
 =?utf-8?B?b2N3ZkhzT29aTkF5Q2lZR2p0VHFlYU5hZU4rV0JqSHV4TXAzOThkaFRxajVQ?=
 =?utf-8?B?d0JxckpvWWp6RzRUbWF6a2hFeEQ1YVg1cURhS0xZbk11b3dVcVgxdlJibXl2?=
 =?utf-8?B?RkM0QTFZczBzKzBaUVJDOG1VRmcyQnZLV2pZMVV4UVR6MmozaytacjRqZ2JQ?=
 =?utf-8?B?V0ptWVNKRVR6b1k0bGFQMTlvTmlOdysralEzWWRzTjc3ditZKzJ3SlBYS3NF?=
 =?utf-8?B?aE9paDJwbjdjUnZYVUF2c2tWWmloa1c0OHREdWVlMmJTV3ZaQ1U5eU8rN1Zo?=
 =?utf-8?B?cVdia2p1ZkFBaUJTM2VFQk9sVWV4NmVka3dHNXd3SEViUkZFUWpweG9NcDdj?=
 =?utf-8?B?YkdmazY5RXFWWjNzSll4VW5ZTlc5RjBPMXRGY0hDaDBsTXBiODc5RnAxWkxv?=
 =?utf-8?B?Zk1xWXpyam9xWXE1WExHanJjNUc1b1JkSjhyUW10NW1BUHB5UXlpREJTTUl5?=
 =?utf-8?B?Q2dIWlExLzVBZEhBSXZ0RVJ4OEp4RUVlSEU2c0l5bTNQS2hybTNGK1AydGVE?=
 =?utf-8?B?bmpjVzAyUUNUTExYMWw0aUorVXdZOUJIdFU4WGtFV1FOZGJsK0t5SDVHbTJa?=
 =?utf-8?B?U0JoNG55dW5PN1VjYkVUYWc0a2J0MEh1OXdMZTJyTXAxNHQ5UldYMTYzY1Z2?=
 =?utf-8?B?S2ordUU0TmZaUEdSYmxFelJQeDVSb3Y2OVlyeCswcDFlN0ZtOHlxUWZBNElz?=
 =?utf-8?B?L2NERU5XdnVDaW9HTUhGSVl5c1FuZ1FSZWR3dWVHZTdZOWpaYVJXR1BXU0Nv?=
 =?utf-8?B?Uk5zbmxRdmYrNnA1c3ZiOGxQeHI1Zm1MUDFBems3aVRMbUJPZkx0R01qNlBx?=
 =?utf-8?B?R0diTGJBVXNrN0xkeDdubGZiV0hZT0JLS3hCeFhlenVhQ211K0FmL0tPVWhS?=
 =?utf-8?B?RDNWWHV4aFMyaU01UC9SVjBtN3NyNHJpdFczdmxnNW1kTG93M1FNSzZWUjB2?=
 =?utf-8?B?T1pBbXdoM1V5UnVCaEpBTTZ3Z0laWjNwRDk0Z0E5cmRrc3R0bVVwMUV0bUhO?=
 =?utf-8?B?cy9oZkZTemtTbmtGSzl0bjNJWTlYdUN6NUpBeGROOEZybk1hQ1J1OVZNclg2?=
 =?utf-8?B?RjdqWjBhSXpqeitIYldsb1BzNWVFODA1T3ZQL0lVZ2FxSmtYTy9NbEdTOUVo?=
 =?utf-8?B?bUtwRnZNNGgzdjZNOFBvaFliYW5iWjA4OGR3MjNoMExmd2twZlcrZ2JBcFlZ?=
 =?utf-8?B?dnE0cmlKMG1iSXBwN1lBcldPdUZFbHVWdXhmVlNLbzZIZEsvQ094YWRRNEw3?=
 =?utf-8?B?cmdPR1VpQ2xmM2JLeUtDbmF5a0xIMkNFRm1vZWs1K0xkeEtrMXdBb3VRcS96?=
 =?utf-8?B?R0ZzQ00wWnpkL2s2clA0OFF4b3NzRHQzeFRoSVpNSGJjMUUwZWFhaEZVeHQy?=
 =?utf-8?B?TWxYWS9tcjdVRzRIWkkzYjRuTE5ZRmxYNjBZbm9QaHpEbmlZQ2R2dExzTmFr?=
 =?utf-8?B?a0NFUEZVU3kvWndDZTMrZmFhV3JKS1dFcm9KcUVUQzJVWDQ4cWdqM3BxREFT?=
 =?utf-8?B?U0ZUdnlvcWlQS2RxenRubXE2VjFXUWZGODBybHNiODdtY1NncHBkNVFEOW5K?=
 =?utf-8?B?NFdQdTBrUW4xaTVYSEJsTzNlSGQ1QktkWjIwZVJmMmdUREdpSWQ0R0pFODh6?=
 =?utf-8?B?YkRZOVlPeVVRZVp3cjgzS3ZkODBNRWo1Si9pU201aFFhaGNvNittcmdSTGFo?=
 =?utf-8?B?WjFYeEl3a2JWcGdKR1VCTFhTcVMvYUFEd0tSbzd4T2paRWd6QzFrbXdEcDkx?=
 =?utf-8?B?RUxmczdmSHVKbEg4b09xNGVrRmp2dmtzQWd5RDgyUzB3bmlCakdCOEYvS0RR?=
 =?utf-8?B?UWpKRmprbVBwSW0rZE9QZVZUMXR5RlZlUEp2VnJKcmpDMDJsMGxidE5CVEx3?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7269de-b03c-4a4e-43a2-08da87ca3022
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 01:19:28.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3KdOOnWNQOMDDhoEzbAT7PYqJ2QrxVIaDFdG1fGUS43//D5sqo6L4OnKLItF0dMKRfyXIzw/3aY4+9Vk7gRCDg2pdn7iNxKuAWP30Se0HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1435
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/26/2022 01:10, Colin Ian King wrote:
> There is a spelling mistake in a drm_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> index 01f8cd3c3134..d7857cf7c08f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -61,7 +61,7 @@ static int intel_hang_guc(void *arg)
>   	old_beat = engine->props.heartbeat_interval_ms;
>   	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
>   	if (ret) {
> -		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Failed to boost heartbeat interval: %d\n", ret);
>   		goto err;
>   	}
>   

