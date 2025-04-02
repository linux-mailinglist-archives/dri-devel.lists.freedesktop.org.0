Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE6A78F64
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DEA10E1B0;
	Wed,  2 Apr 2025 13:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QA1+O/zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4810E1B0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvo80CG4FA1YCvciZpbGZg+hgkod/FpmfZWxQCdGlPAHZKntIl3/IhivF6UFMFgUft34VmJcG7eYwJswbPyIMO1sL0cdBgkNMt8PPW2OcP4r5KJnC95+UViGruC1lQAg3vtJ25cfY3NfQG+NfJ4oGnPI8WZwO12uWGs0bXgUG5oZYr1M6hj8+fb60R+NkcuOtcDCG5fKOV7oLw3CLWv5BewQaLspGYmgBb3XXxyNxT6ywt3UnshgGSefT2Kd4FVlGsbT4ZNSADxhXMsMlpWl+fTfPIQg/GyXr6Xdee4fahIhQGxYMJZIaHfAdUqduQ3BsnTU5GjbnE5R3wTy8+x9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uf2JAgx4Ng8nbjykWqFO44lrjMBPqzVHZx0feH1NeA=;
 b=yzljavRDAGWYoPf6zsGnxuKjS3ik89kdx40jbAG5kQiUoDQUb7XlJZSK8gc2zU0THH+2Y10ZDZlTZEJBBzxclu5NXzRLcYBfiYTw6BuDvSH5vqGMWK55Ybwj3lQc7sYf1/BVGGHYpzCSbPt/4PzbsrdTdFut203HeAl86Al1QLq4vjs7SroG/eQ1XpP+5tRgNkYbAXHGVxqIFcDtPtKNYgsCICPizL++xjQ8lE5cdqju9AWgecZGGbMMu7ADBBiI5d+LVxhF/sTwnM58yiGjMssaiTOW0fVUzk29NKcK9ooDpk/bTabBWyhU9GaSMLJlZoa/zAdWjX1a+6WJ8qBdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uf2JAgx4Ng8nbjykWqFO44lrjMBPqzVHZx0feH1NeA=;
 b=QA1+O/zDN3Rl3KxBqC3EJ/32wM/eHHNxwSKZCV1tnjo1JvaI1vfALVpwrlTs1xrdDRrGNThaU7VgVOI2Yr+a2XdBieCmZaqh3BmcU4yMkF0ebWdwwIrWlety32IOZdKeIftX/ZCWakINW22znv3cngrrjWHJoTZPpaNLgJKW5oELsdyiahKGv050i6CqTay3p2mKwyn4hOY+9S4F8lTDzlKcw/MaH4jl14ArpeA7L+V88IJRIIlUPVKfuqPyPRSYp2+A0NHfl36OGVPSnxs4aZrSzGKPlB56PdoqPuCZ1hm6fq+/OmeKPhi0cVyAJUfDIM5Gu6rhdud18dEz6gx6Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BN7PPF9C6E5285F.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 13:03:49 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 13:03:49 +0000
Date: Wed, 2 Apr 2025 10:03:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <20250402130347.GB342109@nvidia.com>
References: <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com> <87v7rm203e.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7rm203e.fsf@intel.com>
X-ClientProxiedBy: BN9PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:408:f8::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BN7PPF9C6E5285F:EE_
X-MS-Office365-Filtering-Correlation-Id: fbab84a5-69b2-4e3a-6d5e-08dd71e6cf27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ehWcYp4L6OzW9jHlUswJZ8KU7nMB03mLFBJyVAVDpPt029Vtb5n3wVsj1pdn?=
 =?us-ascii?Q?+vDcbUmZO6Bqmy30B2w07BpLAcrdMEDpHR9ZVfRZ/oua9kcTSBqkakRN0rIw?=
 =?us-ascii?Q?2wfOgcjwZWruC4+7hZ616rmgC54t7HsIrkdqPRGkPaaO5sIO3+Xy4HM0lhj9?=
 =?us-ascii?Q?GDtUVIiVhqXWW7EKngzxeq3hrOMJ5o3HhBMF7rbBgZ1HTqpq3APFnMFi3rKu?=
 =?us-ascii?Q?8TTAuTq7CuhGDQ9ab65Ng/+of8dWvLaDvpnuYXyS4S+PyIOFeBionE6xPDaf?=
 =?us-ascii?Q?DdQLznr37lNfCzFa0P9ScHCpIsNRU/giHwwayYmW38qUcQfbP7QTTtZ/h9C4?=
 =?us-ascii?Q?4Un0eL3MFMFnf6D589TByXltmeyYFZOHWRg7O1oUchEtBpCmgMDmJXP44HfV?=
 =?us-ascii?Q?AJhJfdjMfZAFLSlbSqAoNcMEwHEdqfdRUIHvQ6Nn1u5eZX8jZsb+XLs7qce6?=
 =?us-ascii?Q?AJRsoWDwxmHIRltLMtd28j66tdfY6xEG30u/iKZlnjsxw0vBQzv0T3PKGpC/?=
 =?us-ascii?Q?Vl7UT8rAQmwg3mzz8sxE54nh3THuENrhqo+wlnPwszl79AunNGqOuFOUXPLC?=
 =?us-ascii?Q?au6+QgtZciLVejT5FbCAjhcGXKmidEKBwpxmTY++c6kc/bHUWbTid8Z6P8vU?=
 =?us-ascii?Q?9JWHVPL4Au2Y8YxypqQrqvrXCtFDY/aqdounuepQVN15bT0XPob/7B1HtDBa?=
 =?us-ascii?Q?fA77k5R16oAn0FKp7tSTvISy7lN+cPRvL0lcvs0G3ISXDdnB3JNqQ9Qqfh+h?=
 =?us-ascii?Q?4XiohStUVgPhCQr1TSglAiNqNGFgnBi+RXLo4Nn7K57JbeY54QDmnyFA46lv?=
 =?us-ascii?Q?COf/VDU9BsvW/Qv/Hd05EDqpOoc+Q5Tv98ASMhiFsmFoAH4uoAonL+z6U767?=
 =?us-ascii?Q?Ys4s3mfYxk6vvGBoqFflBs6mnf9JaMZaCgGfGKFypTsKdtICr9rM8fBHgLiq?=
 =?us-ascii?Q?r7H9giLasu5CkrQv9hPaNE7uR8oD80TADyx9zzQ+Y1mPZ2FHVIZWAAHDNTE6?=
 =?us-ascii?Q?Fd+6P+Mgc6FNVs9g+tT4ZFzv53lcDjF9weYEC87NtKWoDpNCGBeWaGOUJ2Ux?=
 =?us-ascii?Q?anpK8ghTjnXuJCMANYhrLNyEjh4L9LWG2Ym1MVW8p1anPj44CdPct+BmtZlS?=
 =?us-ascii?Q?+3/nETdaxyNm2Z5xeSf9Q6hOuhUP2m+IhCt4Kcva6+xvnKK5KDyGJkozeaZW?=
 =?us-ascii?Q?PR1vOa753Lg8GRXahFCbsFNICbZjrOYYpRRFCMjsojg8b73TKn+XXA9285gY?=
 =?us-ascii?Q?DVtuhc9uVvesrGoLsheiX3ZmPy4zuB/zM01J595q0l4qCGb0xHrjP/Fm1U09?=
 =?us-ascii?Q?xMd9BD0cCyHJGWmcNbipTenhNWrcp6ZUY4TR55ijXvKalpb+fBd55sT3iF3d?=
 =?us-ascii?Q?fAam/hTnFj+tilsS93fnKgx70FnoVcY2h+lF98kiXDuL2ch6J8UMVETNMwu/?=
 =?us-ascii?Q?F5CDgn4oXvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9TlVJkp5602+MBFcoquH/6sUDX3UiUP5Vfn+VBjTzu7YmzMvrJ8AnYiOK+x3?=
 =?us-ascii?Q?xXQFZuarJiZqag9+pEYOeJagErci6u9kj7tNy/Se6E6GIyCkXgN9pdBg7csr?=
 =?us-ascii?Q?dSWD4UtlOOhsTB4NHvvdKKX2Lg8SgBAhULH1yyW397EP9btYFu6psECijlB3?=
 =?us-ascii?Q?b6EGL8zFS5uHzAM/TdPGCK7Z6YTJbnxswph4q6g0l3UXk5HzQccUy0l33n9D?=
 =?us-ascii?Q?OdjumoPrPWJgarae2/XJy1aUAgXdRYei85QHjj3DomvsmSwKERgUhc/d/uUn?=
 =?us-ascii?Q?2ppNqfHzw1ftESV8IAauEBwYFBYKRLbOPbdYcMPnCfv9IaZU37s7oTLQjsnF?=
 =?us-ascii?Q?tt7Ad2X6jtbb89E85KcMt95gZ1uJJ6D3kxrmaaQr1K3NAbxtLdsi0bWIUDAE?=
 =?us-ascii?Q?KJOFZ/GYfMhVj/KHvET/tHpGxtmuyFaAIPydoiUG1+GsGSRscV0VbNO4sQKu?=
 =?us-ascii?Q?+gMll0ZVd92OR8JzXleTugl52VFA9tW09u8izGOJj0jV+xVLdjeZLejrxr+s?=
 =?us-ascii?Q?QZzo+2D5mz6oHymzVx9fUtd3T/vdEP7wtAUYjAaI7lMX7p9TiitMABZQdvUB?=
 =?us-ascii?Q?8sSrXXePwPvaNL/zEyxoHumjINco6eoNZeSeS0S8f5xAyigwbdMWNaBKlGJW?=
 =?us-ascii?Q?m7nxiEECJi2MMBFOFXZUw690vpBYYnhbRXNruvB7IM4BVPiDJ4KxAG6ZoBTq?=
 =?us-ascii?Q?6ZeNZWwPyFG1FoHSqpLLc1ZHiXpUd4Tj1CYDKsKUlbPMbsXPl+Kbz0OepwUJ?=
 =?us-ascii?Q?HuIfkVZrEO4q4fKkg5dtQvyNCgV4cZRI+amJZz1cdVtU9HZCOXb8ueW9V7An?=
 =?us-ascii?Q?ZV230xywFjlLCGxAXlLxWuy8MBXpYVaB6UuTEgShqsa3l70xmenNYtW1wW1g?=
 =?us-ascii?Q?59ZdInuvsh0mUoZ0fiV1R8fVPqWUaV3YAnuYv0Bwyhf4ffwA2BeMCCP+7ymE?=
 =?us-ascii?Q?SxX4TUpYnHzq1Cc+APLf/cmGbULSFNljzFlijrP6O3FibPLmvRLbrRXY14Un?=
 =?us-ascii?Q?9rM3Jc177hcC5b+I9OEGvPafAwhXd5eIshEQJdVamSVGihOh7mHlC0FZCT5z?=
 =?us-ascii?Q?k419V6ax3uUHcZVx2KL02hinYcb88nePLWzFkfTXtKxujNgi0XK8swBCYUhv?=
 =?us-ascii?Q?fLmCXTKbLvP0yYLGuDxZ1VLkO8EtHFdtm7GqWiDh8xjQLKHU2SWc/nFgimnG?=
 =?us-ascii?Q?+ITmqwvzWxsqxMhX8lA82O4gD6cqLoxACFLZTj7aKbKCZkOLlhJ2kt+sjgAt?=
 =?us-ascii?Q?F4OaF2JLDfc+rBbRRtwQegPMHSCh56IK9s8u5yTHBgy0MHdZV95zBjG/SSXv?=
 =?us-ascii?Q?3P4kxFxHsKsaAgqQRSknqStSEPdXZW0e2er4/n9DvciKPlo2OmI2K4WGWHpX?=
 =?us-ascii?Q?Evt0s2lMxOM7BpjOwitWxT9zesHYkuUqw4aV7IMfbi27Ol+u2tBabxMg+Kuz?=
 =?us-ascii?Q?vC2RxWNO8UauNQB8Wxdi1JVJcpMMgJ1CuWxaYPG+QjfmtoCwXROFK8C9wXVd?=
 =?us-ascii?Q?CV+qJJe9IVDZtByvZaemiaSqjprPdGzwwLHgMJ72s56k3izXRNnsdA4PDxzr?=
 =?us-ascii?Q?x/qgIu+lAt8xv52FbN407hSFsspGuTzf2K6Mx3Gj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbab84a5-69b2-4e3a-6d5e-08dd71e6cf27
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:03:48.9856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kP9+Ck51QF6VOwd6v8cOb3GLg4YtJCT0PWXtaGknqdx+/f8ORbhiE7OgcbkHudwb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9C6E5285F
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

On Wed, Apr 02, 2025 at 03:56:37PM +0300, Jani Nikula wrote:
> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> > So, I'd suggest a better way to run this is first build the kernel,
> >> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> >> > generate a list of headers that are actually part of the build, then
> >> > only test those. That eliminates all the kconfig problems. Opt out any
> >> > special headers that really have a good reason not to be stand alone.
> >> 
> >> I think we'd want the drm headers pass the checks independent of configs
> >> (apart from CONFIG_DRM). One size doesn't fit all.
> >
> > Why? That demand is just making it impossible to make shared
> > infrastructure, and I don't think DRM should go off and build its own
> > stuff just for DRM in a way that nobody else can use it.
> >
> > If you really, really, care then you can have your makefile codegen an
> > "allheaders.c" that #includes drm/*.h and compile that.
> 
> The v2 series [1] generalizes the header checks and it's no longer in
> any way dependent on DRM. For starters, each subsystem/driver needs to
> decide for themselves which headers are to be checked.

Yuk. The idea at the top of this email is alot better. Why don't you
implement it?

> This can be expanded with more clever ways to choose the headers to
> check. But we have to start *somewhere*.

Bah, that argument only works if nobody has better ideas. There are
meaningful technical problems with your approach, and proposed
solutions here.

Jason
