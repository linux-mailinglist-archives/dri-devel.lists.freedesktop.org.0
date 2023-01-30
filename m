Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1D68138D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 15:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5EE10E267;
	Mon, 30 Jan 2023 14:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E104010E255;
 Mon, 30 Jan 2023 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675089694; x=1706625694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=++3PF7h2W3i/JKBpjPb9341odld6d4O+1waJz8l2kc0=;
 b=HGB8+HdB92imVBI2LAOXTjtGgsknLKTMRlDld7vOUTTOIbI2vj1AItTI
 nCAV5OwCTF44Oej3R3yIo13Qx+9nwX2EejMpmxJkjECZNy9bY1QEzyx4o
 IdVnb25bEF//JtOvajtc3hyaAPx/l6fYKsiFwuYT9EzJC69tlO6iacitD
 FzBRe5jI6YUiiaXrug6wwnbllc90ANmEsSkfDRqxjZnOEQbqSh4YXCpSj
 gxtndoPuDL5asSqERMQ+ldQmFtHTwv98NGQD41oQHLejZcoS4pvg0ORk4
 Qyz50Y7OhB3JnV/DTDlbt6tjgWmXAZRyWZ0xUdHSlXHtOMvPNYE+NMXBL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329684843"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="329684843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 06:41:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="666098176"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="666098176"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2023 06:41:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 06:41:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 06:41:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 06:41:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Giwwa2pD6pPGlUNM/fEdpJBibpJRbaF3lGvIIJN/XjwrEBzyfE4qtEfOIa7REJJLQmgBiA2vyewesEHhVGIdyxKnERZXNnWIp7w4R4Fx8qv74joJBI8n0CuJvqm0OECZa88QLruQpreI371of8Gpqch6ZQnx1Acw7DfM540zz0F/iwzxJ9nLrGHv80+1HRWESHZf3PEjE8Ml02eLxiYcSyGwSWHxJiLTIsn2mzcblhN7VHyU5q59SzqvVyGlIYRjt/kyZKLL4Lz7pJTiwBvWHP/Y1TnX7q1D4s+GnztsOKD+pvNQO+22MfwSrcGuQj83uLKoDTTLSRq55fYEbrJZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz8edlo2X7jftbjchzOI/YaeWt5VKVXmA5B0l6MRkzY=;
 b=hSpoX1rPVJc3F1if6iTixOabw+M97MCGOO9Vr4ZjubLPikGZe1MFsLZzeNJghSsB4aKmOLL5Pck3CYi6IWgdvT2rII8bzbvLt4jb8359+wuWGMTdigqXXZ1fWXQC1IXgTvQiTJLeGzlkKZL4MJMJtvwpfR2rULMM/3d0YH0YNVISUp8D/LrVBg1phBjLppGFjQkWq9DMy8lJBd35bUDOnE4rSP3ABoYfDqKum6WIYt/vAkuVDZTPpSUToq6VfoxETYNHvefvsAQw/wALSLS3jw/K5RTy9hGomgUrgJ3lqtXPF/N4+D/NAo8hqxlEM2cexLCO1J+mMgXwYalm5/duUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 14:41:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 14:41:31 +0000
Date: Mon, 30 Jan 2023 09:41:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y9fXFrJp/N0cit18@intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
 <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: c2963117-0975-4490-3d07-08db02d0139a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8l0WUgHJPEXJiWy+6XPU8amEWob+XI5atYWRsfmTiBBcs7DkYyN0oDX5VHtDIliqiULzY8BsP6q34xBeHgOR2JZpAKBmKdIlF6wdOdJ3IrMRREW6vy4NrKR+MmLqNF1ZTCO73hfFjp6R5IoaFxhyz25GotndFAeLvTP9WRd+FXQRikaPFRR6Vy21G9buL/1lD+am3D3kJV9e/axMMlaBGOYKDRAcv5IN479RbLYDrnUf5IU3q6RnkTzNt0zP5ogzQRzzcEm3qDFT6KtDYL/lDxDYeltqujVbQcna/JJZclhS2d/0JN0T1nIryFIPszkTARRtOE0hVJ6ZpLQSlNqKYQ9Km5LBuJGoQbnKHHcvVEHlUzJotJS8+uaPdS+6Jn3uXTX9ATEh4jwy0QpJge80jVD6iqFdzC9nq4kVJpv8SKkQVWs8bHfTqjajdS1zcFKtttcpdeYXd9FbJKtVId4eEJnSyIu63jJiHgNdBAgNKkM7BwmAYmtO5PeTK/buHIvgeDAiJCQSV1On+j5yWiMlqgNXQqRdH3YLVvyYmnSOo5QIkUIC1060rDx0AQsdppdQBcjjXMclBHf5a6GiDZVEfdkBqrC+IeD6uLLclff2s75wwMfNU4jjx8eKMHjW7B8u5PozU6y/QN4LPHVhNcne95w92wGV0Vol3TWG/s+LVCBY2SaP0KeNj0A2IVR7WMcA/d7s+XCjixn2AlclD0bCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(44832011)(83380400001)(2616005)(86362001)(38100700002)(82960400001)(2906002)(36756003)(6506007)(26005)(186003)(6512007)(478600001)(6666004)(8676002)(66476007)(6916009)(66556008)(8936002)(4326008)(41300700001)(66946007)(6486002)(54906003)(5660300002)(316002)(226643001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O89Mz95J5Vz256ee88TWsHxOmz00MGsCAFoHfxb7QyTeWNlF1GUwXAIt+jES?=
 =?us-ascii?Q?OBvQUk8FAHoEtup21okUfwxEM9+gwHJ0Ga4aR8QUxq/6IrYN9cGIARZ3L3kO?=
 =?us-ascii?Q?UOPz+XcHOI5tbjbkENOKksB7zAvoYrLRRuyXx0L1wLuyLgren03W55AS2sMe?=
 =?us-ascii?Q?oHnvJGeSBgktDOg1NQrig7xBoyW5sHEWQ+51RbeCfLPAK3POmIURX4qk1k28?=
 =?us-ascii?Q?RouAqa3nX0XchQfdAL41JK/k4vAb/WlfH+BlT+Psvy9XvNMNrtKlO5MeDfJb?=
 =?us-ascii?Q?Alq9BjpkZzD+GfrDpPwB0J5WQgPkZKKzbf29WrvFbnsuAj9OVl3MQhSd7J1b?=
 =?us-ascii?Q?07IVwe7OwQk8RK4WGWsq6ZkWR3c4DAY96NgVb5gIUfS+ZR2FtNTuDSj/hBMF?=
 =?us-ascii?Q?iUI+jYHAOhlv2RCnEFGHPP3N85puLHdorNUD/JvTAAB2R2dvE0/36GhuL5yE?=
 =?us-ascii?Q?rn8X+z4DCXdfr35qmX1aCtxIXIFpxfbGclQFDO5WNvXTWsFLwq6U1WCTUy2R?=
 =?us-ascii?Q?BwIJYhj+0Vgfxkd7BuIwqriTkWSSVhW8KlMeGsILQEKdk5OiS/UZT7ZMJbng?=
 =?us-ascii?Q?JeUu7Kb9ph5xdLmmI2seaugkIYpzS4a5klI7eO15H7UTFAo6m8T3eO154ClI?=
 =?us-ascii?Q?wKAwzYfQHdGsq7fPwtTWRciTw5VRjxwh1XF7EPyayMfMTs791FYP9HPls+xm?=
 =?us-ascii?Q?UIPvPWY05asFSS0Y5zOGHTUxKHhSFb0SaBBIH6h/pgGKySVIVit/w9EJ+5sY?=
 =?us-ascii?Q?a7Xi3sui+1P36yHqTY9Oex3coB2TLG2nNMyTbs74kp03rzA11hNzw/KUBDzd?=
 =?us-ascii?Q?OhECij0bwNu7qXgXo/H/8+0BEaCIItay82wOL5NckVPQTvOmnO81+qR31LAr?=
 =?us-ascii?Q?ShP8nuVOS0Gm0rO9VVjg8LfTM0rsApxKMQHwl5zJfjDDMZcXOAGpRJ0hI079?=
 =?us-ascii?Q?qRIaMWcU5SvDvtZ77AxZNPFjZxG3TUlpsS7231CAFPMoBjZy6dniQveNG1mm?=
 =?us-ascii?Q?cd0GkFqBsEUVBrjTM9PGdxzRf70mThhb55jXUeCOPK0UT0+vzwk2+H3N9sIO?=
 =?us-ascii?Q?i84n+kwjTFFguaToLjlnZVkPa/ZjHYhG3rGbjKDGGfAHaSIKQ/A6Ijmq+Zds?=
 =?us-ascii?Q?6Cgad4ZF+aDL2KcDKl9j5Ma7glxc3zkP+X6U3azQ0xLoMqXYnSBNmoyP0geF?=
 =?us-ascii?Q?C4jjULa1z/RXHL8RGZC/H6ShOxHvWjotlprTi8XmHViKhOspY3HGL5SN8HfO?=
 =?us-ascii?Q?eS10/JkKXgsY/Uen8miqrrvQOFraQQCvjudVAuh7secQ1LLrJLk4XwrITMbd?=
 =?us-ascii?Q?MqiVM0wqkop7urp/rnXsID/VOLDQ/yg8vHp5tRd7vz92R1W0PxiEwyovWUvK?=
 =?us-ascii?Q?4DAgv8ZKMsq6rQU39S9+B4IgTM+QCAXj08HvUuooKJFReOWZ8tryaFqGXk5W?=
 =?us-ascii?Q?YW7L1v+WfyOIRqVCVmKG2YIRnD2gMJ+g4G6fNKpJbbNBd+rd7k6VHmNveuZ9?=
 =?us-ascii?Q?PbanNaDED5F+Tcn+rkGj4rL6cCkhVYFfu3BTusESZQAnaFYnSW4H7j/kDM+B?=
 =?us-ascii?Q?IclAAaCI5Unve89tcHcqWpQygy9K5plll52i4uwFZm/AUgK6oeTgTHFYQN43?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2963117-0975-4490-3d07-08db02d0139a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 14:41:31.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apQWFB5GAMVF0FCrvurkrzausHeLcoSZqagu0P4fdVnbJbStMa7t+Bq53eLKmPWdDnG8cQ+st7MxejVPHwwlhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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
Cc: Andi Shyti <andi@etezian.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 09:48:31AM +0100, Andi Shyti wrote:
> Hi GG,
> 
> thanks for the deep analysis!
> 
> > Hi Andi,
> > In the call flow invoked by intel_pcode_init(), I've added brief comments
> > where further clarification is needed in this scenario, and a description of
> > the suspicious scenario at the bottom.
> > 
> > -------------------------------------------------------------------------
> > intel_pcode_init()
> >  |
> >  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
> >                        DG1_UNCORE_GET_INIT_STATUS,
> >                        DG1_UNCORE_INIT_STATUS_COMPLETE,
> >                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
> >        |
> >        +-> skl_pcode_try_request()
> >              |
> >              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
> >                                            500, 0, true);
> > 
> > -------------------------------------------------------------------------
> > static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
> > 		          u32 *val, u32 *val1,
> > 			  int fast_timeout_us, int slow_timeout_ms,
> > 			  bool is_read)
> > {
> > ...
> >         /* Before writing a value to the GEN6_PCODE_DATA register,
> >            check if the bit in the GEN6_PCODE_MAILBOX register indicates
> >            BUSY. */
> > 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
> > 		return -EAGAIN;
> 
> what if we fail here because the punit is still initializing and
> will be ready, say, in 10 seconds?
> 
> GG, without going any further, we fail here! The -EAGAIN we
> receive from the test comes from this point. We don't fail with
> -ETIMEDOUT, but with -EAGAIN and the reason is because the punit
> is not ready to perform the very fist communication and we fail
> the probing.
> 
> It doesn't mean, though, that there is anything wrong, we just
> need to wait a bit before "taking drastic decisions"!
> 
> This patch is suggesting to wait up to 10s for the punit to be
> ready and eventually try to probe again... and, indeed, it works!

As GG, what I still don't understand is how this extra 10 seconds
wait helps... have you tried to simple add the 10 to the 180 and
make the code 190 sec instead?

> 
> Andi
> 
> > 
> >         /* write value to GEN6_PCODE_DATA register */
> > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
> > 
> > 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
> > 
> >         /* In this scenario, the value
> >            "DG1_PCODE_STATUS | GEN6_PCODE_READY"
> >            is written to the GEN6_PCODE_MAILBOX register,
> >            so that the Busy status of the GEN6_PCODE_MAILBOX register
> >            can be checked later.
> >            (When the value of the GEN6_PCODE_READY bit of the
> >             GEN6_PCODE_MAILBOX register changes to 0, the operation can
> >             be considered completed.) */
> > 	intel_uncore_write_fw(uncore,
> > 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
> > 
> >         /* In this scenario, verify that the BUSY status bit in the
> >            GEN6_PCODE_MAILBOX register turns off for up to 500us. */
> > 	if (__intel_wait_for_register_fw(uncore,
> > 					 GEN6_PCODE_MAILBOX,
> > 					 GEN6_PCODE_READY, 0,
> > 					 fast_timeout_us,
> > 					 slow_timeout_ms,
> > 					 &mbox))
> > 		return -ETIMEDOUT;
> >         /* If there is a failure here, it may be considered that the
> >            "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
> >            completed within 500us */
> > ...
> > }
> > 
> > int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
> > 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> > {
> > 	u32 status;
> > 	int ret;
> > 
> > 	mutex_lock(&uncore->i915->sb_lock);
> > 
> > #define COND \
> > 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
> > 
> >         /* the first trial for skl_pcode_try_request() can return
> >            -EAGAIN or -ETIMEDOUT. And the code did not check the error
> >            code here, so we don't know how far the __snb_pcode_rw()
> >            function went. It is not known whether the pcode_mailbox
> >            status was busy before writing the value to the
> >            GEN6_PCODE_DATA register or after.*/
> > 	if (COND) {
> > 		ret = 0;
> > 		goto out;
> > 	}
> > 
> >         /* In this scenario, skl_pcode_try_request() is invoked every
> >            10us for 180 seconds. When skl_pcode_try_request() returns
> >            -EAGAIN and -ETIMEDOUT by _wait_for(),
> >            -ETIMEDOUT is returned to a variable ret. */
> > 
> > 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
> > 
> > 	if (!ret)
> > 		goto out;
> > 
> > 	/*
> > 	 * The above can time out if the number of requests was low (2 in the
> > 	 * worst case) _and_ PCODE was busy for some reason even after a
> > 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
> > 	 * the poll with preemption disabled to maximize the number of
> > 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
> > 	 * account for interrupts that could reduce the number of these
> > 	 * requests, and for any quirks of the PCODE firmware that delays
> > 	 * the request completion.
> > 	 */
> > 	drm_dbg_kms(&uncore->i915->drm,
> > 		    "PCODE timeout, retrying with preemption disabled\n");
> > 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
> > 	preempt_disable();
> > 	ret = wait_for_atomic(COND, 50);
> > 
> > 	preempt_enable();
> > 
> > out:
> > 	mutex_unlock(&uncore->i915->sb_lock);
> > 	return status ? status : ret;
> > #undef COND
> > }
> > 
> > ---------------------------------------------------------
> > 
> > If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
> > and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
> > GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
> > invokes always fails. if then it does not make sense to me why this patch
> > fixes it by just waiting 10 seconds.This is because if it was called with
> > the flow described above, 180 seconds is longer than 10 seconds, so the
> > scenario you mentioned is also covered in the existing code.
> > 
> > To describe in more detail the second scenario I previously commented on:
> > skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
> >  1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
> > BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
> >  2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
> > of 1) does not complete within 500us.
> >  3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
> > and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
> > skl_pcode_request()
> > 
> > If the reason why this problem occurred is because of this scenario,
> > shouldn't there be an attempt to increase fast_timeout_us used as an
> > argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
> > returns -ETIMEDOUT?
> > 
> > Br,
> > G.G.
