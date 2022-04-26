Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95A510240
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32610E307;
	Tue, 26 Apr 2022 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D118A89DE5;
 Tue, 26 Apr 2022 15:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jw1Ua0bFwVtsmkQTE7hR47zwAHck+Yfz4lDtWjQ6NMc4uqv0qNDWk9gCiRTi1W7zTi43KFdA0h/xiKnew7C5RZ5fZ1OAypFVaeAgTh9AFOggBZ+x/XW3qNZECIJ7P3tQEdM1GiacYietRpoo7d1MC7GEeG4cK1vOmlwHtZj052h3db+rAcAVjed1Y2Vi1mZZRXmhXCGUPa+4NMUAy7mcPRkdJASn/UX2jvjB58n1KkJgRzQ3+PpMJszEeqcSVRc5pW8fOu040NkKB8SFFbl0rpfaSYG81y5PG0/5ebuatJak2C5Ijmi8Z9mDR81fnknj5mYu3YCZwrcwVPd1CuGyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ7hmyRiHpg4VDNCoOFwMwr+0vKk8CsINM5rn5jVenk=;
 b=cSSCr05GFzBGeHDeZGHXcQPQGW26kGcTPNUqOfN5Ad2rW2txv2yExqiikQpmgxkRT+gShDcZ0XlxYpZK2c2KsDnnBmj7SrXlUOmsxk4IInkJcQf+TuAiuR/AwUo8CdI1NLsmCzwD/qTaIHaQ+QBym8l32vncLuLOTr5oui/N/7/6IqaQMsMRoQtsnpcuzoM2V8HCbDXK37vnlLWAOgwkCXTx+f0PbaBM+P48qo3h0T4M+mWrtSLIIMtKVfRS5f5YepFQ0ETTmu/vnxpRCBYdjhCaZrKAYxC9i89UpTuSTRbovJ439LQvvRkll8bR8SbeO4ysu5a6JM3brm0ECd3FNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ7hmyRiHpg4VDNCoOFwMwr+0vKk8CsINM5rn5jVenk=;
 b=ghBeNaTFQVELSNkpbdh6TiYZB9MYuOfgKDAbF2XnEdoTg6Sr4dIPDtwyWBhgWJ5jO6KzJc29vf0GtAVmGG4ngMQ6wZ7HHZa8mHW6+rDr5m81gN1j9AaYbvnaS3RWEwV4P5BfwZnVavlvaE4VG6ECuSZcZNNjtLAXdPFuHCmhyygHFG1dhkTfO6C03bfgST3pXg8WBsdShAPal1WudI2UGBqAyN7D20m7QZzDYrOVn2h0wOtFSJgjrEu3rGYYwaav7hRBsGhqU+0Nem97glnWGW6+jI9tu/dyqJxjHBc5DT2iPRjhpPvlH+e8o2JGNP9ZLmHzZPIS7fOsasZJImertQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 15:53:19 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 15:53:19 +0000
Date: Tue, 26 Apr 2022 12:53:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20220426155318.GQ2125828@nvidia.com>
References: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5cf6773-e7a2-8ba8-4cde-0bb14007bc6b@intel.com>
X-ClientProxiedBy: BL1PR13CA0271.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::6) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e45027-ea87-44b7-1ff7-08da279ce277
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6292:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR12MB6292E70D092864DF1480F89FC2FB9@SJ1PR12MB6292.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CfkYfP3nIqq3pCCdiiF1NhRFbQ3K8qxuK32nUtPCPaGXeLpHqcaU3NAKhmcVlteNHMJ2OmwHAWRNwmOcCufSmeP0cLl6IPAYZ7Kb4F5SIlr34fQDvwVGASpRyOVtgBF9igL5GzRfEUa6OwKelIW42GvszySDqszBee0nRd2sxA0KVedO8vIvmkjOwfNArNAgo+Vwz98DjMuTfEDq8wH4k9onw+GrASjJ9MK3nRs92/4ox8wJ7uvsp/Oj6KjQEvTuEy89EG0scOaS3r5iPJVmumg5DhkybRW1v5ak1TM1EYNXQS5GNnyRjI+wIo5r0KSBac6GDFqNek18VnaozbTqQHd9ys6rgw+6RfLoHYQMcL3efpDLmTeEEQh7KgrFUTlpuGXdG8+BHQ4aNEnWBn0uqe6a1tuzwGAZrxPpv5U/JlgBUF6vNICVhh1uEa2cPH8v/W3CwV4Ptc4Tnx1zPWDdyKFq8bWp5IwW8vKg2wTxvW6qd9RL5GmV8WnSIlTZ3GdVkEE9WCA6fW5m3IBRt26x9ZgsbeeFRp4Rp+vp5Dqq+fUecF0KisTok2B25W2u+hkrcw+be4/4RL87/e5se3MC9j/S6wwgvABozRRUYMTH1a4xEOQG5OzaLcLtcXoCdSkqGss0rCEH4b7RR/SpojyjHW9SnczO2jLne9HeZnwlGjPrvZTUkw76cqDfbdYDuK5JIYbnfFOYrqfSYT+34ZBL1878hjqmnZZdqzd+Vgbk9Hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(2906002)(33656002)(1076003)(26005)(8936002)(6506007)(6486002)(966005)(86362001)(508600001)(186003)(6512007)(7416002)(5660300002)(316002)(38100700002)(6916009)(4326008)(54906003)(8676002)(36756003)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bxqqY8w+h1y6yoHLli5Z6lmChgVpQE4+RZal09Jds+crNyboh7MCoV6YbaBs?=
 =?us-ascii?Q?4FEYHxEVqiDzxwiNtrKqZ0hU11SRZz6EVpZf+6vr3OwjOtOfQ50oikFE+jo4?=
 =?us-ascii?Q?jWC5A34ipEHq/mIZoiMb2JbjqvGvALny49+0nv4ZReR25rKzOzQ8YewaQi/z?=
 =?us-ascii?Q?Vd0IjnXUkEO3/3V9IJCVObUMY2O30mxXXweyEBysoUBotkEptRrgqdYNgHXf?=
 =?us-ascii?Q?BzXgE2zvDhlIyedqQo+W65/Q//j8+h/u8Z1TY/itRBp+DzJBCWG1QmOOvYyL?=
 =?us-ascii?Q?slPlUjSFSNuwxQCj4gvU38scHGwRWjkqh0trw+/+JFueR5ezxtYl2C+EMoCK?=
 =?us-ascii?Q?YrKk0N/4V6BhoFSZrHl+PYv/z8X64KRn1837b2nNq/rv9ioJaG5A15Tssx8D?=
 =?us-ascii?Q?bU5SjPoy2L66GRah6E/dn+srJ2ffBQH/kqNZnhctgtisv4vjN21Hn3ZskAqg?=
 =?us-ascii?Q?7ekZbpQ/OqQRFnAjdFb16NvAWPCOgCDIGCkJ/g2R8eiEMKN1Yan0NwShQMWA?=
 =?us-ascii?Q?pbQQH+/qa6ypbh9cUxSyFTqQqS+s8rHdTiV/u/LO07P6o6LB8V4TV8upGI/2?=
 =?us-ascii?Q?tmB+Lr0iZr0Y7KMVhyL4fjq2QcfyZ6JoTT/zyRYIDcu45UyESbLDfSMQrqqk?=
 =?us-ascii?Q?llWtDAqYdNEGQHA9LtBDLgML5zDQ6naeEz+4UtsCdDCy8vDtrUkZHkd/7oVS?=
 =?us-ascii?Q?GIXGckLP9q60qMgZztK+0Hdd5rMWuUS2NIsmTJi2rlrUayEnycO+ZcKpW/XM?=
 =?us-ascii?Q?3tOwgcKksQPGvwSwR7bcyjN+d0AT34/DJ3qJQNhlpiFyVtcg0nQPvfegaY6w?=
 =?us-ascii?Q?JHJX9GdU0KdVg+g0zGPHy4vMdIA3ar10+pI9cpmXrfMjF9EymMh5a85cwQLg?=
 =?us-ascii?Q?Wu30Q/lot9sglG0Mrwz2t3bhBZQKouCUK4bcbg6Kp1XHs0CsWUjoL6JfoH/x?=
 =?us-ascii?Q?Pa4K0HtkAcXNGWOmFGzhkDQwElW3TlNi2CUJADAA0ZzFeEjh9tILHQZPlEYi?=
 =?us-ascii?Q?ZqPwgz6IKSieBpf1R4WJlajgqdlaQD64HlVpJv5XW/SIbIXdfEin7qtVXdYh?=
 =?us-ascii?Q?faJdaujk/cn/Me4/ZJBIoyIM0Y6CSDG2DY3M0qLfq/FKaKlrId73SHxgSsMf?=
 =?us-ascii?Q?+wuDlrltC8xMKVNpOTBJMMYNkkQEJ/otrcjidpxu8NkKpCpzikO6tJxkUKPI?=
 =?us-ascii?Q?IGW4fFSQqB68QCbKbm8iTkx0R92BhUV1gO+Ma3ulFr+o8pY5VikC98W+cYm0?=
 =?us-ascii?Q?kTb7bg5d4Wg79UoDrnuqFlXM41/7Q0XDQd+CMjRmVcxldLQtHjFUxjJyLEoR?=
 =?us-ascii?Q?tMZSjXYssxs7TDUGAimqnYsIJmL/EA7M0HXMznIlwEepyLqwQg4kYopWP39D?=
 =?us-ascii?Q?lKT57VLwHqqYi9dA6+2+QZojQfQ6L+vxB6YAIhdh/r7WAVTqx9Eg3CdQrvrJ?=
 =?us-ascii?Q?vKI+5V/BDfdQy4BkxvaJl3OEUIIrBDfjZIe2wAIOepL0D3lyBxWpsubdlD4k?=
 =?us-ascii?Q?DXTmk2C1Z73T/uuAGWOCc7J3RKaYz/QDbEe2U9NaN5gaPGBKkXf/YghqUacn?=
 =?us-ascii?Q?KY6sk+sWE4zVnOdBgIBTm79zdvgFkv9ErCu3PHuxaqzOjmno8EYqmJ1H6vfe?=
 =?us-ascii?Q?01MeRS0U15aYSD/mVFbEi53qn2qWZW8arcOw84jN1E9z963PcWQxNRggwuk8?=
 =?us-ascii?Q?2VtljqEJdvQCeXtGTN4wFzON21q4u7gDQjZ8xgKItwuPxZz22jusqbOqOSA3?=
 =?us-ascii?Q?+bYxQV/vaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e45027-ea87-44b7-1ff7-08da279ce277
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 15:53:19.7791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BLCQ00Sa8Nazr1NwL6j7Sb0LvexgOpP1vNrnLPmymsLpaVjcybOcOfZu1K24+RM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 07:58:59AM +0000, Wang, Zhi A wrote:
> Hi folks:
> 
> Here is the pull of gvt-next which fixs the compilation error when i915 debug
> is open after the GVT-g refactor patches.
> 
> Thanks so much for the efforts.
> 
> Thanks,
> Zhi.
> 
> The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b749366b5:
> 
>   vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26
> 
> for you to fetch changes up to 2da299cee780ea797b3f72558687868072cf5eb5:
> 
>   drm/i915/gvt: Add missing export of symbols. (2022-04-25 18:03:04 -0400)
> 
> gvt-next-2022-04-26
> 
> - Add two missing exports of symbols when i915 debug is enabled.
> 
> Zhi Wang (1):
>       drm/i915/gvt: Add missing export of symbols.
> 
>  drivers/gpu/drm/i915/intel_gvt.c | 2 ++
>  1 file changed, 2 insertions(+)

This still has another compile problem:

ERROR: modpost: "intel_runtime_pm_put" [vmlinux] is a static EXPORT_SYMBOL_GPL

Because:

#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
void intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref);
#else
static inline void
intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref)
{
        intel_runtime_pm_put_unchecked(rpm);
}
#endif

Looks like it happens if CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n

I think you probably want to #ifdef the export in the same way:

--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -309,7 +309,9 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
+#endif
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);

Jason
