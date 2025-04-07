Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A86A7E7E2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC34910E4BA;
	Mon,  7 Apr 2025 17:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pp1y04bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6B10E4B2;
 Mon,  7 Apr 2025 17:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiCz1F3uGWcVI+CcnurRkek1Avj5Iq8Xn3EQ/U2wquFa8ErMtjsJ+Hi9rXmsIN6Hq+hkeP5ZrLvJ9LLmSo42BxTDXac0zVhUBslZ1baLoH2cCESvlUCoMcdgCpLfN55+dsJLF1c/KnKD2CXOlGPDzcrdznGs6rNiV22847trOgpRwqNKe5NhAopC/65iZdAZiqItoZACbUraj6o0kc4nsypyqxsEeXG16Puchgbd9lRxUcILiQqO8zIFaQ74SZKuWYtKFBcaUCA3mlUldOFCnOt15STxR2G7+uk6rzmoJCCylHzkHnpWwtT7ZebEnGbUnNvxqUw7Zj24xQ/w2JSNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J01HHs5XYJEdNEiiGffIx9TTd/0fo3NtB91Oy2N8Ogg=;
 b=OBA2NnqjinwMQLwAXljE8KE12NckKWJN04QNtcXaIogvqACLBDzolPNp/Y/HCDjO2b51Jp51OuYNUMJteZ/KQV0Nt/5Fen+DBCzqOZ1QHZVASPirNE2VKfsClcBZQf7fx5dZxBb6YKanGxiaGc7nlMI8Slc80bun9fVuKZVCi+5wDsA6MEJyiINjP+OUC8fAG1vH1e+VSb2BwlGVfSSwskAXszsBzNfWawvm78DaEjhxOjQ66xtvH6+1NvvWlZLJrZKRYpkO3UrtWOBfpymNnA7ay9049iRokJQNnN5+rKaQKjSZ9mBCJbbKo3vjXMHh6gyOqvmPyBIldOuBZWU0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J01HHs5XYJEdNEiiGffIx9TTd/0fo3NtB91Oy2N8Ogg=;
 b=Pp1y04bh2P63aiDSgJAI6Nm4Asmu+l+DkF1JMIo3RopXFAJS+SIMF5XuBc2ZxGF3bpEDxtUmHopsVvqv55p5srxiQ6kpwzF++d4WrRsVHscXiMpMfEcgdCQRrVq0OdIV+aVbymTm0jXsxtENvZfh7XE5p/CAxd2O04+negzynyaj5cOWgVTE2xXpJAWnA3SFfAT8nXtiWkjPDDL/mh3jpHQaYgdBLxjaAEB/k5njpT+ReEQGwk/5AOjw0SNysED42+y2/cw+ZAFCtvo45wUULeGcLIBUfVkjQN0My1xfxklIQUBte89AKMeFlanm733sIdTVt0KNKt9+Y9R7kl907g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7416.namprd12.prod.outlook.com (2603:10b6:930:5c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 7 Apr
 2025 17:12:10 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 17:12:10 +0000
Date: Mon, 7 Apr 2025 14:12:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
Message-ID: <20250407171209.GJ1557073@nvidia.com>
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qoczbhn.fsf@intel.com>
X-ClientProxiedBy: BN0PR04CA0113.namprd04.prod.outlook.com
 (2603:10b6:408:ec::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e913cf4-b757-4bff-4c3f-08dd75f75538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R2z1MDYGFBKa8hBqJM5LpOFDVb4AEfQijMU0RWBcnQGb2S9cigmf8ZK09a1X?=
 =?us-ascii?Q?VijBw9t9q1jsd2CkMucsFPgVP6LxgBC33GQ7q6gVq3umFAeMgXglBNCIEyZt?=
 =?us-ascii?Q?ktw4b0fclKSFZ5aFWwtlCQBCSxPfeFJSjGnwevTncbB2bgY4hPF6O79cBON4?=
 =?us-ascii?Q?WCsklv9lBik0lSrRoQGmBF2DbLANVj7Hik8DFg6nDtxuZGdsg2XlI3AiU+U/?=
 =?us-ascii?Q?ro6azSBL6J4LxyQnhE8H3K++pk8HmwyqTF8LK9pxMqpTeOxOhuSDZ0Vf9ndd?=
 =?us-ascii?Q?M4YEWIbut75qWe/QLz2nYexZiHUfN9nlYx69HtrFDE1XV8rzaA19C8YVXiTd?=
 =?us-ascii?Q?pestEEJ+FP7jOdwWhrCwCw5KaLYkhRFa9D8I3ooWPjhkI/tV6IOtwdY55xL2?=
 =?us-ascii?Q?5GJatfHkAioCR9556UqJRqDZyAwlPPZeiy9AktXMUZn3Js9LogrGrd70P018?=
 =?us-ascii?Q?qHv3X1H7HW0emHmzMDXXrVCSiJ7aTd9eKKRhiZdDEGGguFYMv+1d8Lv85pvy?=
 =?us-ascii?Q?HA/MwUivlmgTu1Vn2nL1ydar9ikyy13maxZ4qGVKWrDING7j2Nkm5FeM1XPT?=
 =?us-ascii?Q?mK9ddU5VHemSXj8vKHKAsJEPQid+UrtVFurHr1KjoOPQaEe077GdYYedW/a5?=
 =?us-ascii?Q?awCm+LV6aw9QHs6YF674UTxnu5SDEVOfqDsnU1grw/RhO7mHn1066UazE89o?=
 =?us-ascii?Q?lOp+spiQCbN5G+G9hWnZ8s+8fwQojHbI6yJ2rhb7qVkIXqUEsE/tx4kTFVeb?=
 =?us-ascii?Q?DqCQbNxNk+e96E05o9/We3y5QbdQe6MYizrwnPiE4cIFqRL9lkFfFuo9wmOz?=
 =?us-ascii?Q?6khiaNqVa6kk6t5pVAOl1oLHri1dluE2IFDCEi7kybv2dbYy4d1OQExI3GEB?=
 =?us-ascii?Q?FGCIuHenYcKORw5tOQyp81SN9TOmbz+JRTMchxim8COxkLCJKgiQlcopwydT?=
 =?us-ascii?Q?yDEa8HZcaLDdlj3tJBJs3Cc1Wpi7LHp4X2Ob8k0tSEL8dmFpzi+hjTYX3xoh?=
 =?us-ascii?Q?c7VUudTnmKTIaheje89u4R7S4lzE74QW0+ma4yO81U9tv462n/TfWB7EFSi/?=
 =?us-ascii?Q?oYojqqhV4fHy7LYKKdRsgejw+9aVljvsdtJeaheWOj4W5O91U/plu/VLarm6?=
 =?us-ascii?Q?T44fjVlj9bBQ7yW4670KiWBlwAVUND+PugPFKgrBOpY0vGEb5OPP5lFxkLWQ?=
 =?us-ascii?Q?nD9LxOWtuDyzekv7PVMRqvMp4ePTDws9Fd92HMNhOPrEseG6oZLNI03s00uX?=
 =?us-ascii?Q?5NV9dStSlK0rgoxzSVj++THjafvMxQZfzG+ks9QiQGfQRtPHwN73tWgjqz0R?=
 =?us-ascii?Q?oUtPZgyziaeJLqOo3uUfgNPA7vex6dVuHlMdsEbbrSkUAl4r/2w8FJMSAqpJ?=
 =?us-ascii?Q?X8voSABAYZYZ5Xcecqu+sduSHiYcByXNsAtypmv5sJAuOOKo5TE9mEWZtITV?=
 =?us-ascii?Q?FFSyBKHWNz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulQhb0zeVRkni7qOhVo+clldN4ciXfBm91uigCQJQEFz9VEawQTFMClO2uFh?=
 =?us-ascii?Q?qRERyjL8v52rw44UBI95pFPAudhKPjubKbuGXqZHg+nWIp7Hf9XwrGkWPDm1?=
 =?us-ascii?Q?nPCNfXXFvokTpIQPkMYBbThFyPxLwdlWhY6h8BFndv6RmeBnJO81gVQ9c4IW?=
 =?us-ascii?Q?H0aJCbuYakPXY+esSc+CJfJKH6hseRbqB18z1edSOAI4N/x6neDYec8Ej/jm?=
 =?us-ascii?Q?fOyXxRnEOOhHPJR+/Iite02ciVr6fPyT2i2Lnnx9Mpv91N0/c7yfee75MgG2?=
 =?us-ascii?Q?+CzqrQ7dN0GaIV1IMl1Op7Up4OHQmM23nVj+pNo3x33inyzEcYNmpRm7oKRM?=
 =?us-ascii?Q?NHySgfAJI0X5M1d84EsPh37vEmhCWHDqUWdvLU7+/2oBk15vHa6bl3A/0VNU?=
 =?us-ascii?Q?CIKda5qbkc+OlNiIX+1oP1fhmxks+bVv78bk1fTvXNOR+VKfylxYKgbwDEAM?=
 =?us-ascii?Q?JJnbYCMEJ5XG/OwpzmOSkaDI18dufNaHtclfaF5zSj8p5l7ii2PfRflF8u9j?=
 =?us-ascii?Q?IBguaibTEVba573uq5ffR+u/GxaaCvrLuDbwIdWyWTneUCGKPgz5V6JJLI6l?=
 =?us-ascii?Q?12ZzzPBtkqKngHOqStJVR1g0h36pFQcs/1UsNBONDDu4O5zq6LwF6hVwD6Ge?=
 =?us-ascii?Q?glGoRppYf/2UqFQh8MTXm9R0Vbfp+chJoXJZ8Rsm5aOPYdoePokzZHbjMGvr?=
 =?us-ascii?Q?Z9M/2Zk7RfDtNqNEW7istZvLAvuOGCO4gV2/KDurqgD7xTD2lFLijEEzAks8?=
 =?us-ascii?Q?uFF5HfXdwKvuEee/LIv2dGongGzCmx0AkutBjJzIGk0AFfKSQXQp1OHuTioO?=
 =?us-ascii?Q?xL0fFAjBLu90NoOPRXuvCndMjglCiweacfc8fiTO0d9vc5SpVbZwhZwenPhc?=
 =?us-ascii?Q?MH8dxAl9vlqT6X+wnZOXqECn8hkfR+b9RHG5NoJja/weWb+Dg684oKQlq5+i?=
 =?us-ascii?Q?ox+698NULY7M+/wItEfOJeaMEYH8sNc1cr611p4xTNbY30CL1bl0IaqjSINJ?=
 =?us-ascii?Q?gkFGbM6xKCLBKMF0o2lq3O74vrr1R2o+dWdvN4rgmibskfpBtcdN7lIRXGog?=
 =?us-ascii?Q?Jwjh5kqY6ENPplifcmQOCxVCWkEJptwu42WuuG2IKJK17lL4QV2tulLhfifr?=
 =?us-ascii?Q?kofu+shBb2BbDM4yrByPRWpgMyhLWD7G2VoNFhCEZSQRxaKhKwHEioc9kNbQ?=
 =?us-ascii?Q?HBYJBUP2M3ePjy42VQqpP+8N2dnBDRDRhdBUrVSrHOsawLEK6h9gCuDcS1tT?=
 =?us-ascii?Q?oCidpHekhbmSgzcZr39Jjh7BIddGpsoUWPyV/n9LdfwM3l/E7qRPKKQda6IT?=
 =?us-ascii?Q?Nb6wkCrNdESofpqiceX36OtF2e4nQVT4ynR6a5Y/vLRM8ACc3GQtL6/GXvVN?=
 =?us-ascii?Q?S7hORi5o3femwKLaKHosuiVU4YAMcMIvJbXdf9irIEXXDEReOtm/EJFodwIB?=
 =?us-ascii?Q?nlEWuSIBl/s+UcqCs0cSJSuUnSlMQ6MICL0AVwYBtMDmHrp5upaY0LfPna5j?=
 =?us-ascii?Q?99eLZ5Nu/zy7KT5yrTfesZKBoZsIgvHGrmEgieX2kzvMI9vl52wKryVBpdNu?=
 =?us-ascii?Q?5gFZT+lHPpmZEOHIa60hR3m9VLOLXZWLg9i1WwKz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e913cf4-b757-4bff-4c3f-08dd75f75538
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 17:12:10.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiqZWPd8xRvavfkUorHa9UNaHpXPOGjX/+9gcKN1p07zrFuXEzgF6Mjol2KqtUtF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416
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

On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:

> Even with Jason's idea [1], you *still* have to start small and opt-in
> (i.e. the patch series at hand). You can't just start off by testing
> every header in one go, because it's a flag day switch. 

You'd add something like 'make header_check' that does not run
automatically. Making it run automatically after everything is fixed
to keep it fixed would be the flag day change. It is how we have
managed to introduce other warning levels in the past.

If you added the infrastructure there is a whole list of people on
kernel-janitors that would probably help with the trivial cleanups to
make it run clean.

> With this type of antagonistic rather than encouraging attitude towards
> contributions, there's just no way I can justify to myself (or my
> employer) spending more time on what looks like a wild goose chase. I
> have zero confidence that no matter what I do I'd get approval from you.

I think you've been given a clear direction on what would be accepted
and have the option to persue it. Claiming that is "antagonistic"
seems unnecessary.

> And this is the primary reason subsystems and drivers hack up stuff in
> their little corners of the kernel instead of sticking their necks out
> and trying to generalize anything.

Seems to me like this is the usual case of generalizing being actually
hard, you almost always have to actually do more work to succeed.

Jason
