Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5061583727
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBF710F27F;
	Thu, 28 Jul 2022 02:45:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161C10F0A9;
 Thu, 28 Jul 2022 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976327; x=1690512327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r5lOj3MAnEo5T7hm8Mf6yPLumcWQMxNQ0PCXlT+BoUI=;
 b=e4dMJZRyHJ1NTN4gRDFyJkmw9f6fyc/rV57Pof13ObFTJ1iJfz0ZsjX/
 ETeGh2ZNiDLwiYMshc5mAjkhlkgNr64yt83JTp+qsDHpRx060NePEjax9
 1eP5iBv5iws7xmOsddNpsFX8NwRvvY7z2naFqQuwgIrr0YgFmU4FPB+G7
 a/LflZszZ/r5bIvphDieoWLclOLtOxynheiy8qkws/DtTRsEQigH2dY1x
 XcOe18XcSIA2bW6r3N0xDZ+/x+BKq51/xTt2wOX0nURg7RcKPi2nFw9VG
 qar3n/99akTxOjYW2Xqx7w69bK20RWr/7uO+3XaOfyz/ME2FQNOAs1DfS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="275283440"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="275283440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="742899137"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2022 19:45:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 19:45:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 19:45:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 19:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3TYREyXoD8ABbZqcl4XeDv9hlMEN/pv6H4yh6GSeWw/gnujUrgQXOzVuHHhKhUdeW0hS3FDa5mVKLpESsYqQXNjlCCx+NEIASMdDZkPsGNgU8cXNhxAHC1pB/9DempV6aFDs5r633DqAxjb5w/hMY6eXFUaJPzEsDqODLIha4UDmM1xLwBxIRTiDjopJYbRhoUIprGTwvTGBBUc6J8LY7eFqwsvDUPWf3pjJIDwNTkO25qDFFVz8yg/HbJKdjmOEboEgLdLsRObPPPcHqghWFSpK1io8dYSnZXwYpezZGNP+X+tRzAAexn/4CqjFa2Kr4oefiDAtQXLjMbO1rsI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpGREcYDHXo8LzeldWXE2um/J//MTGAH8yprRFjFVFA=;
 b=Kr7x2Vu7832KhUQ6wTOCYsPqPI//GnboDeIGfBxVBMtYvqnYuV1NylLhibNcODkXGvDq4xUibSRovVIEnmsFmTJ15x9CqYyDO06Leo62ZMoBajuC+1wgga3HgYeoVXukM2vbKMvlrUeBOyuCXatn6bD+md2UsbS0hWXwsa3Y4eKsnYv0khLOQtKABUH0sBL3ASYd+7wT8fllzeEDlrQXrKIg7BBi5YkO0JHSRGXJ1PgQkhQyD1nBKtLr79c2hdSOWo/4lbMNQVDUyjDjOah7qQ+RDJPcUonwZkp4gPQTUzTON9onMtW/lijZwn65TCzfkaRe5Wrmqjye3Vu3rtqTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1376.namprd11.prod.outlook.com (2603:10b6:300:1d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 02:45:23 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 02:45:23 +0000
Message-ID: <ddcd8ff4-4439-a560-9901-51120e603da6@intel.com>
Date: Wed, 27 Jul 2022 19:45:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] drm/i915/guc: Fix issues with live_preempt_cancel
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-3-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220728024225.2363663-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ccfe3f4-c2b8-4cb6-f668-08da7043381e
X-MS-TrafficTypeDiagnostic: MWHPR11MB1376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLA2z8qQwkAXMV/tQ7inHBbnlLYstb/Lsg3CcRmepZQ4RG/pzm3+36oEqVjl+3ZZeuV/AdxiU6/CCgDWpRH4ASbhzBhDLVXvi2/Qs4/jlcpQjC3arz1lFVWHQ4cZCpV/N+YD2IO9P42wSu0aE4UfMxzXP91/H/JPNsBnVfaDGiYBD4cswtjoVBc1eR5iN9z/TrjD7NMNJFsc6OuyF+wqGbNyfCYn8qCq8eqnYRC7DW5kqSvIy15rKRqbCuC28qiohzjObfSUFFoxi/xDdF/+2jmbRsa/1/5EPnfPGrOIoNY0q4Crm3l1LjGBZzdzokCCTta2+GXM6DEk2toA72ynK5l1uDYWkAwuWuJwN8CCO2XSLg84LWzIHSoqIgZNkKInEQ66YGinTn/bS1rEjSopE1wnN4zT8VwLOMIv/SrTCZ0vjucLcKyuKFV59YnCyYm2WP7eF+Y5KlhsSrszACQtHyxHltIHVECzUyWBV9SZKg2TTyCRB+yiy5LPiAHsrVH0w6p4yK9onrr9PuYyomsQzwF/Br68hHMI3Eh6TCV9bQhxqdcU+JwF/lCzH8rm4rQU29NX11bWCjsL4GjdtbyDv9E8XyKciqQjHNipDaROZblIX9HZHdEIhuukwFJ8hTkqQY8JLVKI7ZQ2cLjiDnTcApB/DImQM7z1bqsNVUH52ZLBD6XS+pOiETffNdaScUx5KVX3uTW0hkTCiBJqHAricJTOOX36IL2dIt+HlEtkD5FVCLpgWy1s2w3a20RMh4HGH4eloWGQmGWgmVBgIQlK9ViyLSFFjhsQoCMgK3YSBDcsvhl3RFe9yMfSh0nUu7biGd2kpB+6J82/pPN6kY/ikQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(376002)(346002)(396003)(8676002)(450100002)(4326008)(66946007)(66556008)(82960400001)(6486002)(66476007)(5660300002)(2906002)(8936002)(38100700002)(2616005)(186003)(316002)(31696002)(478600001)(41300700001)(86362001)(6506007)(6512007)(53546011)(36756003)(26005)(107886003)(6916009)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhLWGpJNzVNc0ErZ0prZVRLOUhjQWJCV3NZN2ZVSmVtaFJVY2hIazN0ZGJI?=
 =?utf-8?B?OHdmK3pKY3p3L2FuTzIzS2tESjJLVnpOME51QmM3dkgwYnJ4NDZ4UWtES3FG?=
 =?utf-8?B?ektRYlFkR3IwSlM5bDFRQVpyc2tSclh1Q2VYMFljb2hXYnVvMi9xUGJtU0Mz?=
 =?utf-8?B?UVpJaEtFMHN4Nkp6Lzd1b1loTkNmWHNZLzdQUmZWdWk4eVorakZUMVpiUjFM?=
 =?utf-8?B?SHd0dXprOTltS2VMb2M0WmpCRWJnYVI0T01VZkgvWE1MeERUUzFJZTUrWC91?=
 =?utf-8?B?cWZTd1A0STI3RURQdk5RSXJmRlV1eUg2RTROcGhsRDVwMmtod3NpWHJWdWFu?=
 =?utf-8?B?RkpXYnFEZmdYZy9TNkRoa012VmhaWEZEV201dzY5dTJERkdpaWUxZTd5NDBk?=
 =?utf-8?B?ZGhVc1VKRnFZYnZmUm5FVUpDSEdCVi9VUy94bHJWdGc5ZHV0UlF5clQ2RXVJ?=
 =?utf-8?B?eC8xT3RBZUhkWFVraHpOYkV3Uzc1SnU4VlFiY3BiNDFRRUV4Zm85V2Jpb3Y5?=
 =?utf-8?B?RnhObWNsVmlSTGVkNXdGaEx1eGw0ZDFJQ0ZUblR3Q2ErcXhLV1F4MUN3bGF5?=
 =?utf-8?B?dmg1Vnl4OTNaV3lpVENzdVptbHJaL2lWYVR0MWZJVWpFSzlneFROTTF1Rmk2?=
 =?utf-8?B?eW5HR25GZUw2Y0tmbVBsSFhaWWtyaXZVKzVNbnpwQTlDYmxqTkt4Ty9CRFY5?=
 =?utf-8?B?dVdnbERrR3FHNmkxV3ZpZGJqYnRVREdSVW9mOTh4d2JFSnpLSW9Qd0tncmdh?=
 =?utf-8?B?cXpiWFRFeStaNFFFRlRqVFlpVnhmTXYyTkE2blYyZTZtaTVyLzdOY09DMVZk?=
 =?utf-8?B?Y2dkdHpWV2IvR29pbk8vN01walo5KzA4MU5MdmUwMUF4TERBSFpXZnJtSlo0?=
 =?utf-8?B?ekZ1ZlJRZGlVcGNUV2x6RG1mN0xRQS8zZ25xQVNzcUptU3pzSVR4M2VSN0Fr?=
 =?utf-8?B?SW9wWWc2YzVuV1pwczdJVGNYZTl3V2FnbGNlQnNyS1lVYkdvaFV3akt3Sll1?=
 =?utf-8?B?dGowQ0xLYjFESzhFZ3laUDQySEFuK0FxcmhFbkIwRUxrUFJ4N3gvRmpORkxu?=
 =?utf-8?B?VmMySzhBL2pmQ0tUYkl5SGE4c0ttRG5rOVJ6eHUwN1BMMFdRcVEyd2JyK1Qx?=
 =?utf-8?B?L3Blb0Q5dW1LZlJzbFNUaFAwVHVpL0JuTi9nYmd5dXpFU0JOUjlqdnhyUi9H?=
 =?utf-8?B?eWxaNktGWFlYR2VBdEFCSjI4ODJrWm1JK0hBS0FXYVg5ckJHKzZSRVdtbEpn?=
 =?utf-8?B?djBHQjdadTJKaDhxaGRWZ21OaDNpUmF2Zk9LR05VSFFLK3gySXVtZFdJZldq?=
 =?utf-8?B?QVI1bzhrc3lRcWVtdjdSSW5YQzduTXJuMnZibkZDZFB1V2JLbVlVM1dwRlFz?=
 =?utf-8?B?TGFvTG81cE1lczA5YUVmcHBXc3h1VEY0Y2VTdmRxdEQ1TUh1c0hrN25JTVZn?=
 =?utf-8?B?KzhHVEs0ZFg4MWZPT1hXM29nT0JHR3NPMnhrTzBaOVpvMFpjTzFuRk45V2Jl?=
 =?utf-8?B?QWxjY0JWbEV2dlduSDNsc0VWTlZGL3dQVzArLzlHV2NobjZyb1RTV1lIZDYz?=
 =?utf-8?B?c3E1alozZGx2UTFPSlhMUmpFTUhuMzVLNDZCd0RkSW5zc1NaUFVkMUpveWdn?=
 =?utf-8?B?REVxb2NJc0x4YWthdGFkZkZyd3laZis4RnRLZWpKeUtQSWxxdE1ORCt6ME9F?=
 =?utf-8?B?ekNoYjBVNkVaWnFRSDhhakRkeWp4bkFzTDFSMEsvVXNiTFVkbkFndHlnZThC?=
 =?utf-8?B?ekMrVlh0MVBZclQ0QnJGZTFTaVBqYmppYzhDb3FleE45TmZKQkZRc3djMmEw?=
 =?utf-8?B?bUdVMXBXZng0VE9oYXZudklvMktTL3piRHJvOXh3c1JPcU9STHVzRkpVK2Ix?=
 =?utf-8?B?WTBpdEh3Sll4L1Zydm1EVERGYXFJSFY4K0xkVG4yU3dQVDJJbllYNWl0akR2?=
 =?utf-8?B?NHNMbnRJV0pWM2VRZXJ0b2V4ODR5V0xpN3MyZEdYSDRHb3JMV0FpVjhYeGM2?=
 =?utf-8?B?VHRrU0pEY0ZZaThyQTByZGczSkJja3lGZ0pVMlV2TUxxc1JvZzR3dWJ1eERQ?=
 =?utf-8?B?dGpuSGU2aFE0YURBRXNaUldsZlRGNURYaGFEVEVPZTIwQ1VBejkxL0hoOFUz?=
 =?utf-8?B?L3c4K0tNdGpJcGt2bGlNV2d4RzVENXdaT2o3ZzV4ak9GYlFHMjJmRmpvUjY5?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccfe3f4-c2b8-4cb6-f668-08da7043381e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:45:23.3956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8Pk2rxrn5fteNSZ9gp/Td93ypIUwby+m494T01VGP/FAk+4MGnglwQPTu/c54liCnbtSKgbuty7Uu/KlDYIsdY10kQiiuK8XZ3thcQMLUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
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
Cc: Matthew Brost <matthew.brost@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2022 19:42, John.C.Harrison@Intel.com wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> Having semaphores results in different behavior when a dependent request
> is cancelled. In the case of semaphores the request could be on the HW
> and complete successfully while without the request is held in the
> driver and the error from the dependent request is propagated. Fix
> live_preempt_cancel to take this behavior into account.
>
> Also update live_preempt_cancel to use new function intel_context_ban
> rather than intel_context_set_banned.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/selftest_execlists.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 02fc97a0ab502..015f8cd3463e2 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -2087,7 +2087,7 @@ static int __cancel_active0(struct live_preempt_cancel *arg)
>   		goto out;
>   	}
>   
> -	intel_context_set_banned(rq->context);
> +	intel_context_ban(rq->context, rq);
>   	err = intel_engine_pulse(arg->engine);
>   	if (err)
>   		goto out;
> @@ -2146,7 +2146,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
>   	if (err)
>   		goto out;
>   
> -	intel_context_set_banned(rq[1]->context);
> +	intel_context_ban(rq[1]->context, rq[1]);
>   	err = intel_engine_pulse(arg->engine);
>   	if (err)
>   		goto out;
> @@ -2229,7 +2229,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
>   	if (err)
>   		goto out;
>   
> -	intel_context_set_banned(rq[2]->context);
> +	intel_context_ban(rq[2]->context, rq[2]);
>   	err = intel_engine_pulse(arg->engine);
>   	if (err)
>   		goto out;
> @@ -2244,7 +2244,13 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
>   		goto out;
>   	}
>   
> -	if (rq[1]->fence.error != 0) {
> +	/*
> +	 * The behavior between having semaphores and not is different. With
> +	 * semaphores the subsequent request is on the hardware and not cancelled
> +	 * while without the request is held in the driver and cancelled.
> +	 */
> +	if (intel_engine_has_semaphores(rq[1]->engine) &&
> +	    rq[1]->fence.error != 0) {
>   		pr_err("Normal inflight1 request did not complete\n");
>   		err = -EINVAL;
>   		goto out;
> @@ -2292,7 +2298,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
>   		goto out;
>   	}
>   
> -	intel_context_set_banned(rq->context);
> +	intel_context_ban(rq->context, rq);
>   	err = intel_engine_pulse(arg->engine); /* force reset */
>   	if (err)
>   		goto out;

