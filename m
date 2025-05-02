Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A504AA6C74
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 10:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984E10E169;
	Fri,  2 May 2025 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gO9I1VsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA5B10E385
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 08:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHsLVIyTVRtHNdfPNlKDc09lX1igvmyJn68tUV7zYf+BFpEI0pjWxpcUsyO02w1lKhqaGH9N3yzCvbuq1nUzQ+ozcrWJZ1icv3CDovBDX392AJ234KnmRRs/MyN4PM6BGUIsEHUhtqkiu5lDHOwyAnKkHfWws2GdBbqT2HPTIvqowBbCS6qhdzbVa9aoqPTRKJJlp0Mcvuz33ypmguBgTxfvEtzOJOKvxD6jzPvty69PixZxf28ROuBn7icRy7YbLVkyl10ygomQqeZGUPkG76MJfyoAFY5BAmZEvwikvBxfBzlsfPITFxORXI52wn3dFMm5ivj+Hi3jOidaEqt91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H7T9Fn4dSlAa4Jh+0K5LklvDifSwdLlZEx9BLjTUr4=;
 b=mp5kKbnt5dnfjV2uFJq+E8AwZJmppC8ZiuSBQH/9Q1Pdj/WW/RG4cuihRUN1G9YmzJqrZt5QDt9t1THhn3fwb71wQ5BfJweY7ZW7uECw8JXMSVLUxS1uyiVeGeCbiBgvEFohpwxRWNfzY5PvsuSsuxltdSuR+8MMWzfX+pLie3EnMp7ocqecygtZSN9WpBaKuX/5LooOpH9XYr6y+++TCA+wWNGwMvDoL7OhttUFqyN6wJJMlK/QIsxZNV7rIw95lh9cA4rHLhJaAz2WSrcwvg3oKHX+VkG1BQV+5llrQZRPvFEeAzSkxl6KeFw9apvVZO9jJy/3hf3ED09OwyGGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H7T9Fn4dSlAa4Jh+0K5LklvDifSwdLlZEx9BLjTUr4=;
 b=gO9I1VsSitJCaoM8849AbJqJzLo5iAp7qOCYOPowxTBuRMiOzBX0y38fW5ug7sz6k2hT3ri0dB3r9/5PmkctNujJYI4Coppv/KIgNhoo4VsWYrw/pg4M0xfAlnQF776zWX2MBI8gKNVyOoNW13qYQK2jlzTuX4+cQORasTYFa5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB14953.jpnprd01.prod.outlook.com (2603:1096:604:396::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 08:21:42 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 08:21:39 +0000
Date: Fri, 2 May 2025 10:21:21 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 0/9] media: renesas: vsp1: Add colorspace support
Message-ID: <aBSAgR15PoPVS9Ic@tom-desktop>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
X-ClientProxiedBy: FR5P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB14953:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ab7a7f-598c-430f-01b9-08dd89525c76
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OG4OynVrxqLbKOKIFIzK1vxL402RtBBPLFw+dDHZn6HqL/u+GarPejUZ49KR?=
 =?us-ascii?Q?iCEyQgwUj7+Agu42RwqbBiROjUg04WKLKGiTva6AFFWAQjxkr9+z5RlyIx5c?=
 =?us-ascii?Q?Yo9RwabqTqWW2ADILI1OlNuX5sRapgl3oa0p9O+Y24pbRGIV7Ycg5pthlJbL?=
 =?us-ascii?Q?npWluaw4qYdQoKzwPrElw2zNIsg0YYWKEZ647VaWekW92nSVZ3Q8ZIPRbRYl?=
 =?us-ascii?Q?phwCOwWCiNEfxV9lFVNFukee7pXjNIO860mZBB1bWgN6sRSYRLmevc70B2j8?=
 =?us-ascii?Q?cBw5IddCg4nMVvDxOF0Q7KBbLKHoyrTXf+kfU3mW/oC3/AvSps8cPu7Reflo?=
 =?us-ascii?Q?8zlevF4ioPnDagyJbFekuzTZCEyFSXbPgeniDNOcknruk70XxdZmUZnmE6wK?=
 =?us-ascii?Q?1nUnYi7XZ2Z9stzfmo8hYKivEMkYG5V4jQF2gQ7p7WkbI3hjV6DQaZF/BNwG?=
 =?us-ascii?Q?Bnla2GNO5Cu+M2N8iLBX7GAuJf1UnUbX5CumpOzJXJAgomXDyWjWpiDM2Wfh?=
 =?us-ascii?Q?eaDgToOsLHSxaFVKEMCiiF/sOgU5u6qXUVcnW231kJMHeCXl8EXSRbyNY6fO?=
 =?us-ascii?Q?j/heyRLUyexKEyedkP9pUdV9ept8mkIjGK+IVKf6Pp8htq99SGUGGunpDqHU?=
 =?us-ascii?Q?MTR7ttkbpIycc7uFvm5d3hTWYbvUPeU0NCBlir68gQ0GtXuJ+J5S0n9/u4Nw?=
 =?us-ascii?Q?2jSD4F4dL3wvhhCR3LL8QvqbzCzB/TkzOf35qB+348ZcLHuNc5LhDW8QKGFk?=
 =?us-ascii?Q?B2mdZvDtQYM20XtnwY0xxcga+DZf0CtAFa514BNfDOATPTXmZe9tFyBd8Xkz?=
 =?us-ascii?Q?0wmz8n2G7oSaRvTxaMQLOley4Vz2MvOoVc85tbujkP2tKiOoao1PvY2VbD0Z?=
 =?us-ascii?Q?dNl5v4FhcdyaGrTMP18VUuvmekZknWeplGuPVt/lWBrHhBIylYwjf/hsQ+9B?=
 =?us-ascii?Q?GoJ5T8uJ0piwDqeMQCcpBSsAgeV1Va/mPdOwZS+1eZdHP/nfxQGCoZNTch8e?=
 =?us-ascii?Q?JqtZ91bhs00zqFVzMRADvvYsOP/LApaO+qXB1DMiVjKQKGRBqDejuhA6+kmN?=
 =?us-ascii?Q?Jui8MM8fl9VkW8LlAqynIOq8x3LcNbMZK6c5uHq2JAQ85rHR0lF+NSSSm+Ph?=
 =?us-ascii?Q?VEehPeI0SeBmpIeJCNKJ8gF5TosKW68SRvyrqMQbwXSzeVLsdK5E7kW07WrR?=
 =?us-ascii?Q?+H7W22jRRonmRxmGtv4Mypa+hTXd57o7SGKlznAU/9DhRDs8gUrOJWSKE9ct?=
 =?us-ascii?Q?y0x2GXl9QYG1xpaVPlb/AM0qgLTibSA6hxbysGc5N8gIceTjW7/kir9pYO0z?=
 =?us-ascii?Q?lB787SGJASVxhbv6mvYve9j8QKJ3aZ6Gj54L0l/pQYFxVGmXT7Oj4S+anDuQ?=
 =?us-ascii?Q?eXDCnPudCGT9VbDj+7b5kOBBneT8BgrYXYDp5Po1S8+IDPh0IeeT3fmXsJiQ?=
 =?us-ascii?Q?m9ig7cI2Ans=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uk8XH+3dkd2Vt7TRG2q37VBJD0I8pm9wc7mZI14NWPbUPJHubCm8Nx3ININd?=
 =?us-ascii?Q?QkFb5KgXIy6VzyRMiqZ/VjlCR1MleqVzKIYyvhMWqgKo/vVb/7VnfEyS3pzl?=
 =?us-ascii?Q?pmKnRozCg73YxzJ1Czzlv880ILC/CBWq0KcsISU9gSAZiEMpyQenP4LEUtEL?=
 =?us-ascii?Q?JGk2dg+1wkux7aY6nWiXwrwMJVIHr3W7LcmrmbCN6eA5qWYD056yjWcYZT2W?=
 =?us-ascii?Q?66R+u/EQj4lMzi0g5OytSmebg8biEGvCPOM19gQkFjh/d7vBiPuArIWLFTp5?=
 =?us-ascii?Q?cV+aOfEAfQHbXpqV4kBdLbhSC6uUry7vGd3JD3s1zqL0PwgBB0429BIT0TjY?=
 =?us-ascii?Q?UuuT+Ga79vcJtzgw+yDvy9/ArcSwpuB2/erm5md8VM2SJ3kXJmkidX6KaW4o?=
 =?us-ascii?Q?i3E360kJqBXldDNe7ibopVcgjPcm4qzHuMA0GDL/clgcLBujSOhSD15xJMLk?=
 =?us-ascii?Q?p+Fo2uk7XsxJUYhNJ5RSYvGAYq6XMEGI5q4X3ypbqZ6sezDMeUF20rRv+H00?=
 =?us-ascii?Q?ZM+Y5CSKnZSkIRWbcJ+wwrBil+r3b+VIvgu6h7yjIMOIBc314IS2TMLvUSz7?=
 =?us-ascii?Q?ac1LEyaLj+IFPPoQeIiChBkKQULW73BFSGd2vSxEwbiWyc948gVLr8RI1+a2?=
 =?us-ascii?Q?atowO8r+yDWuaX5vR0gt8HsLDdemH4Y3Jx7+61zDTEzu8u8nPA/z9Blp7YUm?=
 =?us-ascii?Q?DJzPw0A/+cP/6jHAeuyXeeHB0/MpSo80lYrMDPh90CDgiK8qLXijYr9no2p9?=
 =?us-ascii?Q?hFRL5Zq7ILtJwgiPVJqnmV9OGqtMil3pigjs1kMRS8ySPg1fzipDf44R7cDk?=
 =?us-ascii?Q?JA05hsw9DeW6Za7py1yIjIQk55dc+7rrqPJpS1M18E3KFd0CWbttdH2tSnQq?=
 =?us-ascii?Q?1LDOM7Ifiwd5S4DZzKlIMRc1zk3W0UrcM0P4mlcG+J4nY8FKIKQeUlxqz8Ch?=
 =?us-ascii?Q?WqLi47fo1tfF7kY1FtSxlm1IMz4hbvXfsaVQ0JJKsyPVgDIWw+uhelQI1gms?=
 =?us-ascii?Q?P9EwGUsEGUanyZuIR5JBILDwItU7L4NjhWoAopc//EorHqfEpkamxBcD3jSR?=
 =?us-ascii?Q?CAr7976WuOfwBbEbWQpF9zdTAFH00sGbJT7VI+xxCPNDziEF/AvoJLGrNTWj?=
 =?us-ascii?Q?Zl6HFxPogMJVGesU64WZVip2SWaH0M2bfISFvUQ1zBeKekkGWct9SF9E+NgD?=
 =?us-ascii?Q?i/2ABlz9yyJWOnIRFrP9VNXgoRijHSlxelShoz4zyB0V4IH+4691VU8CdXQF?=
 =?us-ascii?Q?/bCjGj0sJPbez6H+Zwl+wV0JXEtBNWyk/MCendRhR4iT9vo9wy484aAFUSMa?=
 =?us-ascii?Q?cI5JOnl218plhBn3G4x2bQmsQBLNoZxHa9ybiT+eJ1/v98khIgN6kINyaKh+?=
 =?us-ascii?Q?C0P9JClmI7dDCBC9U9CE36rdMzDBjmgAPTvezwSaiwQu9GtNVCSzqLk6ZwWM?=
 =?us-ascii?Q?67AnKqo+B9VzVhdHxSyV7yYlIQ1U0v61V9MRbuppzy3kIUuApcmkY9+5shTI?=
 =?us-ascii?Q?eXD4qGo+owLyiIlTz12TsZm8xkC2Y/E9VYwn0ssF60XUpkKI46lui32P5phC?=
 =?us-ascii?Q?AbZRJZPzhUI0wlVphG0zLMbCFnERn+PXUjUSyDdfMfs1bLuu+zJmIEhZSQh8?=
 =?us-ascii?Q?KnmUKfnbiWq8lOodKxWlfyA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ab7a7f-598c-430f-01b9-08dd89525c76
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 08:21:39.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivESufTxOdj2Eco5Abq9puBeHTY1k9mCgMv9qxEFl6xJTTMt9kbjehCTIOSAETdV6nFF5Ks+N0CIUM/SkX0RRwE4FjZoplAkgVS97LFUusf3mDucIjtwRLAgt189Jy8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14953
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

Hi Laurent,
Thanks for this series.

On Wed, Apr 30, 2025 at 02:28:55AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series extends the VSP1 driver with colorspace support. It
> turns out that the VSP RPF and WPF entities can convert between RGB and
> YUV, a feature that we have failed to test so far. The hardware support
> BT.601 and BT.709, in both limited and full range. Proper configuration
> of colorspace is crucial for accurate image rendering.
> 
> Patch 1/9 starts by implementing pixel format enumeration in the driver,
> a feature that was surprisingly missing. Patch 2/9 then continues with
> another fix, restricting the creation of the HSI and HST entities to VSP
> instances that include them. Following with another fix, patch 4/9
> addresses format setting on the RPF and WPF source pad to disable HSV
> <-> { RGB, YUV } conversion, a feature *not* supported by the hardware.
> 
> After those initial fixes, patch 5/9 starts implementing colorspace
> support by reporting the related information to userspace. The driver
> currently hardcodes limited range BT.601 when programming the hardware,
> so that is the value that the patch reports to userspace for YUV
> formats. Patch 6/9 makes the YCbCr encoding and quantization
> configurable, finalizing colorspace support in the VSP driver.
> 
> The next three patches are new in this version. They proceed with
> exposing colorspace configurability in the API exposed to the DU DRM
> driver in patch 8/9 (with 7/9 performing a small refactoring first).
> Patch 9/9 then updates the DU driver accordingly, to create plane
> colorspace properties and wire them up to the VSP.
> 
> The series has been tested with the vsp-tests suite and the kms-tests
> suite. Patches that add CSC support to the vsp-tests suite have been
> posted in [1], and can be found in the vsp-tests git tree in [2].

I've tested this series with out of Tree patches with RZ/G3E.
Basically I've added the equivalent of:

 - drm: rcar-du: Create plane color properties

On drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c

Tested using modetest:

modetest -M rzg2l-du -s 48@46:800x600-60.32@YU16 -d -P 39@46:512x300+200+200@YU16

modetest -M rzg2l-du -w 32:COLOR_ENCODING:0
modetest -M rzg2l-du -w 32:COLOR_ENCODING:1

modetest -M rzg2l-du -w 32:COLOR_RANGE:0
modetest -M rzg2l-du -w 32:COLOR_RANGE:1

Where 32 is the id of the primary plane.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> Updates to media-ctl and yavta to support setting colorspace on video
> capture devices and on subdev source pads have been merged in the
> respective projects, make sure to use the latest master branch if you
> want to run the tests.
> 
> The series has also been tested with the latest v4l2-compliance. The bad
> news is that the test flags 56 errors when run on a Renesas Salvator-X
> 2nd version board based on r8a77965:
> 
> Grand Total for vsp1 device /dev/media1: 757, Succeeded: 701, Failed: 56, Warnings: 0
> 
> The good news is that none of those are regressions, quite the contrary:
> without this series applied, the total number of failures is 95, and the
> diff shows no new error. I will therefore address those issues
> separately.
> 
> I would like to get patch 1/9 to 8/9 merged in v6.16, to then merge 9/9
> in v6.17.
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20250409004758.11014-1-laurent.pinchart@ideasonboard.com
> [2] https://git.ideasonboard.com/renesas/vsp-tests.git/log/?h=csc
> 
> Laurent Pinchart (9):
>   media: renesas: vsp1: Implement pixel format enumeration
>   media: renesas: vsp1: Make HSI and HST modules optional
>   media: renesas: vsp1: Fix HSV format enumeration
>   media: renesas: vsp1: Fix media bus code setup on RWPF source pad
>   media: renesas: vsp1: Report colour space information to userspace
>   media: renesas: vsp1: Allow setting encoding and quantization
>   media: renesas: vsp1: Name nested structure in vsp1_drm
>   media: renesas: vsp1: Expose color space through the DRM API
>   drm: rcar-du: Create plane color properties
> 
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  15 ++
>  drivers/media/platform/renesas/vsp1/vsp1.h    |   1 +
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |   9 +-
>  .../media/platform/renesas/vsp1/vsp1_drm.c    |  22 +-
>  .../media/platform/renesas/vsp1/vsp1_drm.h    |   8 +-
>  .../media/platform/renesas/vsp1/vsp1_drv.c    |  59 +++---
>  .../media/platform/renesas/vsp1/vsp1_entity.c |  22 +-
>  .../media/platform/renesas/vsp1/vsp1_entity.h |   2 +
>  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  11 +-
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 188 ++++++++++++++++--
>  .../media/platform/renesas/vsp1/vsp1_pipe.h   |   5 +
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  29 ++-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  51 ++++-
>  .../media/platform/renesas/vsp1/vsp1_sru.c    |   9 +-
>  .../media/platform/renesas/vsp1/vsp1_uds.c    |   9 +-
>  .../media/platform/renesas/vsp1/vsp1_video.c  |  50 ++++-
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  29 ++-
>  include/media/vsp1.h                          |   4 +
>  18 files changed, 442 insertions(+), 81 deletions(-)
> 
> 
> base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
> -- 
> Regards,
> 
> Laurent Pinchart
> 
