Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62516C6BB40
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 22:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1F310E209;
	Tue, 18 Nov 2025 21:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSVzLDAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D25D10E1F7;
 Tue, 18 Nov 2025 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763500763; x=1795036763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rskI+tdB8a0ySZeHAJP94Pdhhoumwu2hp7X93JYh+CY=;
 b=BSVzLDAoBUr2BrNs+LGrSTbkujTBNCJ4wy3C6A3/MwiegPUcuKKbuwu4
 L3lCYFymQNqub7l+0gv5VMjABRNdvVO9urKPyx7kyu1ZiKr8I15iYXdAH
 WNEjB3ROASTpi7iC5fAyCNhnNuAx82/KPJSTNNTv0n+QRjWTuydiuipQ2
 D9ZM9l57A6yG7DBKac/ASHr6UQlkspk22o5rIa53hvs4RR6nHC1qqmMhG
 6AcF9DgLbtWLsLGICBOF/M+OxpDgmZquj0lVC6j+R5lSqI1YMcRhNKvAL
 H984iwii45kCvCjOj4d9l9NFzjGsQHKEp+eb0iw8fhXJNUSvKBOH/Fh1w w==;
X-CSE-ConnectionGUID: j7BPQfErSWKR6n5/aCTycw==
X-CSE-MsgGUID: XR0OywoNTVWU/TOvbMMExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65416244"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65416244"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:19:23 -0800
X-CSE-ConnectionGUID: aR0r3Te7SfyWdHM31Rs8/Q==
X-CSE-MsgGUID: NYXF7HwORGmRsrCF632XgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214249794"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:19:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:19:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 13:19:22 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:19:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypZ0h5AhlamfZ0naItu6h4cvka/6AOo6Yzv03V4uQYu6Z6PFYD0UNDHC+i7jt7UjvCBAWTmFUHF8eHlF7LCUH+et6ANucNKM5KL5LZEXZxHU+YeVy8lqO4BEk+z2eSYFfwSFp2WcYnYl+eKgTmhya/UrvAOJXDCaRNBJk109V4E+zT4g4TQWpaeJFKsodSes/3ZUZvz08AM1bYLT/aLnVoYbW2DCp/LOQVnBTY16rQEN9aWvqBlEAbAOTQHnQcqV4CMXb9dKQYxH/I9d09+H/znzP8NeJHDcNGKLU6YF9AomXcx4HkPZ65OEGCc8CI3wXatg32f0Bj3PHJXIXLjGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx4zr9dLPHRIdL9FiX3JpjFMISagTzbAQMrUnRD0GVY=;
 b=X0ppG+lRsyYzrYEswN4c8z0b2RmkD/04EmYKwQsUkl1MDRMMM8jUk1Nzs09XJ2Ec2sR+Xz/N1JAe7OOuDSVymlXwyv0P3sBqVZNqFdfkhSzW1xjt7aacZ9JYJNBM3faRXSYgj16jQSQhbEsehG92v+Zoa8hVjM6awQMBEiaurN3VHd7KyO46iTFn5tkoczuwGt1rH/es4LDbv9p25DRZ/4d+Nuu2d5Az6tyHR98x32AJ6sLeaGwAsiGTz+SZF+XyLImtOShQAAhUNkcV60OU2RYGhopvFBDA4kLitjh3Sc6Mef5ddWSrIoFXfwtICsTxP0SCzU0mCiVMehqqul4MWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 21:19:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 21:19:19 +0000
Date: Tue, 18 Nov 2025 13:19:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 5/7] drm/xe: Do not deregister queues in TDR
Message-ID: <aRzi1FH62llswW_C@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-6-matthew.brost@intel.com>
 <aRwVMM_RKyx1CKEI@nvishwa1-desk>
 <aRy0mFGX8sZ/CtDs@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aRy0mFGX8sZ/CtDs@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 768df39d-d1f8-4953-123f-08de26e822d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zUInlgQjDOTlvBDfNGluw9M3uqXaEWhwQlOzRhKPpiGQCntSN/5iuYBUoK1e?=
 =?us-ascii?Q?B2PkLGMcf9bfs4MttoBzkBtKmHUb2s+rXh+/aQegx51bxrUgePaFjhgYbhdW?=
 =?us-ascii?Q?Bsw8NZKCw7xWuYmjWZNKkkDPSGhkHaYbIYjys8eZb93NNU94b7Sz61pmaDWc?=
 =?us-ascii?Q?Li2G6tz1rKKZuaNnxjTGg/GxsCSztAe1PtWaSgqeyRxgQRCWpdTxkFcFtVVY?=
 =?us-ascii?Q?1PnEoAd8q+pDNzNWLUwdV9fGW3U9did/rYA4Ci0EUM0KIDOSJoSZ251KENtU?=
 =?us-ascii?Q?evXWhg44F+K/lGhPtH6KpD1G8KtpuOkKfPfdQlLBkcid2hP5WmSiqHvHBPdI?=
 =?us-ascii?Q?Su2+PcH269PErnxB6WW8x1VDDnGtAsLKeWgeOzkFZH9TzHK1nKOQixBELY+Z?=
 =?us-ascii?Q?5BPRYzNjQyl0JEnh2Q5KMXS4ZxX010dtTtsjPfplEBQ9gOykg2nuqWz3tjSl?=
 =?us-ascii?Q?xyuUYObBt7cZ+el/B3S9oniTeO4ML09AY3fFCx6WpyYMs+BygVZLLC/G6x0E?=
 =?us-ascii?Q?yAt4k+qJ8SCMQpFbHWbKvdPUXfB1q3BeBxDKytEDKmA6fzVKtis5fb0Qc5SW?=
 =?us-ascii?Q?Dg3lN4PPFiWpiYW1vqMLfFr6sc9WCy21GFE7o4r4xmuJESbMOWINmB1tnvhP?=
 =?us-ascii?Q?pW25WxMwjnytiXtYvMX+rX28SJH9nofJe9PNyZoKKcFdxB1IYOFrrmJtrYFC?=
 =?us-ascii?Q?yuZLMZf57PIR+uA0UwB9qJLjiZoBvpblDhwjE8cizEleNX5Og+ZhJ2fFqJci?=
 =?us-ascii?Q?PS+7EBg7K9jZ3jEuWOmDpuJPGMWIPtzLRZAAeSkvt+ysgj7p1bIDit6Dhgi0?=
 =?us-ascii?Q?w2g1vBzueARqUqoBg4YnAPrj7R6pAgywhKnGhaokef0qvNTgi2Weou2k0LCu?=
 =?us-ascii?Q?HuECdJl8upWLC7Q5gjtikNqIc7RhxNRQ6IrPsmqEARh3YZCYe/+GBd3vC0cl?=
 =?us-ascii?Q?MSUqYHdFUQLjPcy07v4K8PaljDliXgoMdb1xtdzeu3mRO98RY/RAlUhJMCev?=
 =?us-ascii?Q?uibjt+L56TlaQlr5aSwS4BbvSDFU8r64W1X22WB9YRrudgrnVpxe7KzqkHmE?=
 =?us-ascii?Q?OII3XRj/qJyFDPfJRzI0whpykL3ZplURM2fSA9/b7xVQuL1LwbnmxrK/kOlx?=
 =?us-ascii?Q?kJg9JFUb7VNkNLcyHCKJYcTu+JZut93A//Q/gqwnmFITR4HxgUowMhVHmmkI?=
 =?us-ascii?Q?AXDFq9xZkihB9gD5vCqc0RBpkljN+i9FHMiXB6uTRN1MoxJ+qNBR8n1bHUST?=
 =?us-ascii?Q?TxOFfsWjqNAoxYKrWSOAMavZ2BC9l9HMcs7SkNaTLUFlR7cKnT931FfPnjER?=
 =?us-ascii?Q?4fAF5REPtE+3JGP/0Q/C98euWSoYMsZhACDFb+D1ytVkuW1ZAht+Ro87eMnw?=
 =?us-ascii?Q?F/3pelQbJuT9kfF7uFmu41utDxMhwVaNDbBqW+vnoZk5FFiFgKV47lRhCg7B?=
 =?us-ascii?Q?om4rkhgAL20U/t/pajEtUpsEryXZF5ce?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FevG3QKy/VBwWAOn4S7t35hJACz1DTFPzKKcpWXckcr3o7LpU3KKXBDxe6dF?=
 =?us-ascii?Q?5AaPOU+4aeEErby8a20ExFUWW7Y9Z+3mseHv9GUxFMx1LxoFL8Ux4WalEgzE?=
 =?us-ascii?Q?MzEyetNXXgAh80vjEt8KsTq0q1XCIh36VeOZz//axDxfUpOd4SQjnsVYESlA?=
 =?us-ascii?Q?GLXXVPUjQbSbArb/Zo6jLVmAu1hNp+v1t1tUjAmnaEqqFkHMnkARamZspgZV?=
 =?us-ascii?Q?T4oW8qLWoD/M6j5yCw3JcFagp4mbq0zI+narQZBVdCE4dtiPtp2Qm4Z06Jro?=
 =?us-ascii?Q?wOQGpu7bd2pH1TO5+eM1fdY9uYnkIYtMihAQ+fOIBflSRsDtXt224IxyIBHz?=
 =?us-ascii?Q?5TqbqjLPfvT1xAze60bnoEdHnvdAXhVqxcloCldpcjU5bRmAHN7RDtXO4pkr?=
 =?us-ascii?Q?IpTUboXk5Jkwa/cbavskYMswjXF4tNdmnk3z006STYbfvDeqQ0nzBjsXoAJv?=
 =?us-ascii?Q?5owMg8/JRo5zqVwj9Oz4s0zYf3O3lykQ6UY7BHNHawheCx+eA1sSRlqD0cYg?=
 =?us-ascii?Q?iJHWvqHHtbRFISdtPKn3yv9GMu9hlFcAOiSE3LQ4oXRDSW9JbJxz24NnpQxn?=
 =?us-ascii?Q?hZSqN3cqg7jFgRQjRNjstpD+afHrz8jFaY13YbvvPqjiDW7ngXzvpM/pNiCG?=
 =?us-ascii?Q?V1BgaU+OCtiuSgDzsZ29fWAWAyyYmCIb7P6sWiTWSxUerbuOLUqueNgpi6Gk?=
 =?us-ascii?Q?aisGvtGpxblWRNJF8dAPHBx+GU5dNZ1lzXNcJJj5RprCwF0tN4GCW84uiW0H?=
 =?us-ascii?Q?97g1AE34LtiwPqvgWN4FY5Q9/ff1gRtOxbrMH4nuDqbUtMWKJf+pBg0++uTg?=
 =?us-ascii?Q?tNWArkfII7XBdXlFjK3NKaXvlNOSGgX4ogVbCJk4Y/1u9qX2yBx0UzFjIlN3?=
 =?us-ascii?Q?CYnlbI6d2o83SC9Cz3kWxKkQyN0lwpZRwBeyLq2cbyQdXdpOTJPFHJxoRVoX?=
 =?us-ascii?Q?buLMkUUSLDPpkdP8LcK7Zi6fe2EdstNo6Dwwl8w3reFOPMHvuN2UI+nmHeNU?=
 =?us-ascii?Q?9yN+nEVIgCzvw9kM6fyjoEgnNYK2f+TvVErey0RkOtlE7F9fZt4qvy3gr6jD?=
 =?us-ascii?Q?7qpKwBksYYEZHVmqCCxhxOCgOZqpabr+axiAGFPe4q2uWRDNCUvoG/pbxgU6?=
 =?us-ascii?Q?dciogQ3uKHOF4hKVUvoRnUjuro05xqA6SRRqPxrYmjDERYK1ZACZ4moR4QrY?=
 =?us-ascii?Q?98p1jdxaBPh1XIQNTSsJXk7S6JU+sq1/U0BD5xBWEKorIf+lidfMcSWjlzk0?=
 =?us-ascii?Q?hSwBOesMMUkQjNWEKKhh+lByHZC4bPWtrKvV3y2icsDMN9TDOhaqCHc5gLY8?=
 =?us-ascii?Q?3P6PFgmiGHecWcpdyPhrwg1yZcqtBw/o5JxI6GkcAhwR8d7sk8rfhxFXXaJa?=
 =?us-ascii?Q?OZf/MQ37lJGA/f2sTdomT0GDxuh9h8r8kpVTUtIQT/6ggdIOwRRcMOIE815C?=
 =?us-ascii?Q?n1jf10MWUuZsxHV1HqiZZcJNFcWgldl1XVWL3+ujArI48rHLqVChUp9RgOGB?=
 =?us-ascii?Q?dPNt6la2R+6GNnC4do46HPwDa0cHLjRqWsTvxJ1iIFE74fts4Mp47U5zcKWp?=
 =?us-ascii?Q?HiDfJZ7NXJd2Kbo7ogLqpFYg8JfWukMCqITYJNJJPRYs4qYisFbIEtQmS95t?=
 =?us-ascii?Q?1V+HsvUZ2d+Gw178jrAh6to=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 768df39d-d1f8-4953-123f-08de26e822d3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:19:19.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uQncCkBjp8Q9xdKryw3WyIQ+WdvSDGDFrfjnRITe257WPjiLYDQkw9UcPlmGvPBEgwwNhAf57+u+VECxLjQOWVGAuPqdZHr5pqiAubZZMk9Dga8Q0EBdcj/4F4lbOmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 18, 2025 at 10:02:00AM -0800, Matthew Brost wrote:
>On Mon, Nov 17, 2025 at 10:41:52PM -0800, Niranjana Vishwanathapura wrote:
>> On Thu, Oct 16, 2025 at 01:48:24PM -0700, Matthew Brost wrote:
>> > Deregistering queues in the TDR introduces unnecessary complexity,
>> > requiring reference counting tricks to function correctly. All that's
>> > needed in the TDR is to kick the queue off the hardware, which is
>> > achieved by disabling scheduling. Queue deregistration should be handled
>> > in a single, well-defined point in the cleanup path, tied to the queue's
>> > reference count.
>> >
>>
>> Overall looks good to me.
>> But it would help if the commit text describes why this extra reference
>> taking was there before for lr jobs and why it is not needed now.
>>
>
>This patch isn't related to LR jobs, the following patch is.
>

I was talking about the set/clear_exec_queue_extra_ref() and its usage
being removed in this patchset.

>The deregistering queues in TDR was never required, and this patches
>removes that flow.
>

Ok, thanks.

Niranjana

>Matt
>
>> Niranjana
>>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc_submit.c | 57 +++---------------------------
>> > 1 file changed, 5 insertions(+), 52 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 680696efc434..ab0f1a2d4871 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>> > #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>> > -#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
>> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>> > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>> >
>> > static bool exec_queue_registered(struct xe_exec_queue *q)
>> > {
>> > @@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
>> > 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>> > }
>> >
>> > -static bool exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
>> > -}
>> > -
>> > -static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>> > -}
>> > -
>> > -static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
>> > -{
>> > -	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>> > -}
>> > -
>> > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
>> > {
>> > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>> > @@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>> > 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>> > }
>> >
>> > -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>> > -{
>> > -	u32 action[] = {
>> > -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
>> > -		q->guc->id,
>> > -	};
>> > -
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>> > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>> > -
>> > -	set_exec_queue_destroyed(q);
>> > -	trace_xe_exec_queue_deregister(q);
>> > -
>> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>> > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>> > -}
>> > -
>> > static enum drm_gpu_sched_stat
>> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > {
>> > @@ -1326,8 +1291,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 			xe_devcoredump(q, job,
>> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>> > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>> > -			set_exec_queue_extra_ref(q);
>> > -			xe_exec_queue_get(q);	/* GT reset owns this */
>> > 			set_exec_queue_banned(q);
>> > 			xe_gt_reset_async(q->gt);
>> > 			xe_sched_tdr_queue_imm(sched);
>> > @@ -1380,13 +1343,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		}
>> > 	}
>> >
>> > -	/* Finish cleaning up exec queue via deregister */
>> > 	set_exec_queue_banned(q);
>> > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>> > -		set_exec_queue_extra_ref(q);
>> > -		xe_exec_queue_get(q);
>> > -		__deregister_exec_queue(guc, q);
>> > -	}
>> >
>> > 	/* Mark all outstanding jobs as bad, thus completing them */
>> > 	xe_sched_job_set_error(job, err);
>> > @@ -1928,7 +1885,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>> >
>> > 	/* Clean up lost G2H + reset engine state */
>> > 	if (exec_queue_registered(q)) {
>> > -		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>> > +		if (xe_exec_queue_is_lr(q))
>> > 			xe_exec_queue_put(q);
>> > 		else if (exec_queue_destroyed(q))
>> > 			__guc_exec_queue_destroy(guc, q);
>> > @@ -2062,11 +2019,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>> >
>> > 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
>> > 		clear_exec_queue_destroyed(q);
>> > -		if (exec_queue_extra_ref(q))
>> > -			xe_exec_queue_put(q);
>> > -		else
>> > -			q->guc->needs_cleanup = true;
>> > -		clear_exec_queue_extra_ref(q);
>> > +		q->guc->needs_cleanup = true;
>> > 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
>> > 			  q->guc->id);
>> > 	}
>> > @@ -2483,7 +2436,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>> >
>> > 	clear_exec_queue_registered(q);
>> >
>> > -	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>> > +	if (xe_exec_queue_is_lr(q))
>> > 		xe_exec_queue_put(q);
>> > 	else
>> > 		__guc_exec_queue_destroy(guc, q);
>> > --
>> > 2.34.1
>> >
