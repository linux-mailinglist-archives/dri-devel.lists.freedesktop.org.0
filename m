Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FC2EA986
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E976E0D1;
	Tue,  5 Jan 2021 11:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BD66E0D1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af/5VTcl0gU5Di6Eyyd3ZjYbG6xPriuArfpau0ybFCYTdMlUOsfSpdtL9nI5dlG8JnUnLBhUVQVWlx6YieiOVtbqVsHK53bpT9lZ/7nJaZ+huyvlQeUkJrXe+rWk5s08nYeNYFdnIQbb20kAQ33ypeWWuvuY3/IVLj3SdVfrfp2eQUZDcpdr2Hsg3swwJ4z+ors127o+Bbwib3oG6MK7olQIoiVhV+rAEMTHVF9fsJxYja22BLJgfNhW0NL8lWgeVP8jfMCjxQ7X5QSOd6f4UcB9PHwpYIC3GyyUVLl68TQvoN3EBtTbjkfY4UuDekHrKeOaZPHRcwRIWJBXSebj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCFPUKXGVCpfreiwVH5HebKsUBWw9EK0lifnlmnJ3S4=;
 b=RDalMuKwWhgm8PaEchPcQtRw6pNrwgXP11uVUexw0sVKO3fsOWkMYGzWuS5lyPjWh/CplOowdMehx4RrY8kQOJtlUt11J7x/mYqiqF7P+L6pokWn6r4K/ILt6WFy+Nw8PUQSm+qR70D7e/qU4vAP3duOPusIz90rlk0pcqR/Kbh44oiJdoc9ftXFht4riDtesbwLhr84cpjfbuUsZmoZtR9yHewvUY6+OoTAhnl/XN8Sif5345AcUJGFecrfS4xwVolw4x5kx2RJcdU1M41LBWTcbQku5Y+TrDNrs7WGAhbVKj0wuA65arlFzvYsKqFgls2X5osYs2QX7I/FRqjC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCFPUKXGVCpfreiwVH5HebKsUBWw9EK0lifnlmnJ3S4=;
 b=sukuwK2P+kwe+JnCabtc/lraqCBu0OTfZsmKqrJBU4bmsLD9cLajWr0fWHuTh1Lk/Q3HH6rGEQ1IQJNSOriTvhRpOheW7Ti39obVai19PlG8LQGG2emdDNjLHfxgvUeS9+NWzsOXf+Tu8UYiYCfdkFjTgnzwIIW1S3WiKirz0xo=
Authentication-Results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0176.namprd12.prod.outlook.com (2603:10b6:301:59::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 11:09:01 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 11:09:00 +0000
Date: Tue, 5 Jan 2021 19:08:52 +0800
From: Huang Rui <ray.huang@amd.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210105110852.GA1052081@hr-amd>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
 <20210105103138.GB28649@zn.tnic>
Content-Disposition: inline
In-Reply-To: <20210105103138.GB28649@zn.tnic>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HKAPR03CA0034.apcprd03.prod.outlook.com
 (2603:1096:203:c9::21) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HKAPR03CA0034.apcprd03.prod.outlook.com (2603:1096:203:c9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.4 via Frontend Transport; Tue, 5 Jan 2021 11:08:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb170490-2da4-4a42-87e3-08d8b16a4e1d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0176:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0176FB82FE7E580CD067D00DECD10@MWHPR1201MB0176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UobGQ+kGMxAyARv06rlrJYSoNrIq0ub9TrGlPalZyATYQ9c2OQxv9/n9Pkpsk+U3G49h6F1p9Iqae1JXPh90rwwzhWcGpkrrangbA38BQ3BpWJLVLf5LDdSTr0Mul622Qkq6bUqvQyEzmSvaRNoONlE2MF68GpHEYqHtQ8Ksj8dqtDfAvaaWWFG8wOA48TWlrutp+JIgEEq5iv4aJT7YoeVG6RrBizPE32Dm/SuCcP6cQuzgTj+YSYLpvQowInv/WmqOyhvatAi4J1lMg5qvwIJC60BLBBwhxl6ZWqKU3UyByBNHsC0Gy+3+pf1oH1LCxGSmKejvQJwqR8xhaqItUx3hc7/39jAqFYKsHfyUwydZBqJ43Tla8GCS/KcFh9ctrcvyxQ7k94T50liA9hbHmyXa1X8wP1RF3AF+HwhZp//nqZi1KUsJ8vc7uCWHIR3zxIGDMoEl06/BQKy48tf9RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(86362001)(55016002)(4326008)(8936002)(6666004)(478600001)(9686003)(54906003)(66946007)(956004)(186003)(16526019)(45080400002)(1076003)(5660300002)(26005)(316002)(2906002)(66476007)(33716001)(8676002)(6916009)(33656002)(66556008)(83380400001)(966005)(52116002)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?27L0NjoymqBCL6OpeWUf6xe2D6TAzV+RlYyG9z1L0D/lYQ55iG45clySS0ef?=
 =?us-ascii?Q?KssfpviVyZ2r6teSKZtJmj9467y8lRQE/hx9asdsBZKCT6UFBENSamfAMbRl?=
 =?us-ascii?Q?qwcm9OU5kEmBlMoTY1LIfJYhEiTn7mTeyUC36CUTHKn3eZwU44tEznpOtakY?=
 =?us-ascii?Q?WlXKAe5zzM39pV+4vdLe/2523dx3+JGBIEqKMFW+p5FVDM+Kxe0BTBW8so9B?=
 =?us-ascii?Q?zYz+yxu8ltmh4iYzNvbgZgC1zBUXFVMR59MBcXQKD6WYZP0n+VKX1P0tmTeO?=
 =?us-ascii?Q?seDc1gDLIjtYMqKCwADvJNq5xaM/OHJd3zxYBdBoNu/iKc71unYOkuKSd44W?=
 =?us-ascii?Q?47AbO7mmYQVTRlEnZi7QsN7sF8wFUbRoaxm4zIfIzxIYn0mn2zP589KJYkOT?=
 =?us-ascii?Q?obamsrU3VbL7gGPANzHYTXrzSZJHSQRrOr630khvMdXNIBTnpFYzaH0rAfwh?=
 =?us-ascii?Q?ZmiZfletXGETc6bL+tBOJTzuCwcKIEnMjolYxzHctdzNlYmT8tr8NhYsVx/I?=
 =?us-ascii?Q?S+v6GHzuooXKx/1Ik17x7JVGOOoMbrS9sEFyBl8GUZa6U0BU4K2njGve2yLP?=
 =?us-ascii?Q?sFCASLEtXdP4BYYFwaKGiuy4n4G/lhA5qIArknEopGcGzbzmhXiNH9+ocQGj?=
 =?us-ascii?Q?TsuXDodvq9aPWXoRfM6p8sf/TvGC198npq92ZxktNxlZ84ugCTxT0RCITW3v?=
 =?us-ascii?Q?tsAlBKQfK1scEhM9dR+RdTfVtPyzS6GwDGHoY+ZWkvt6PGFM5ZyWx67/bu+M?=
 =?us-ascii?Q?ZYrinp9YeEkohBFOFfvBTI8Jsc0Cox6k/8k/bZZLP6mUjihjKX2XKKBxvz17?=
 =?us-ascii?Q?MbtTEkAtMGYObPQHyG1AolgrnBe7bhDgu2BqkAIOt6GjQvq62fV5p5XfJC23?=
 =?us-ascii?Q?2LRauk/FKYUGS2YZp4uzgJUFOxbnovzxyV91/6+9uVxrRwe75xZx/JVAMZ52?=
 =?us-ascii?Q?NbcWeQciuM++F4ZDnyccVVQTGTQXTpPx2pF0pRBOmly9v/yuutJh14g/Dho3?=
 =?us-ascii?Q?qsln?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 11:09:00.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: eb170490-2da4-4a42-87e3-08d8b16a4e1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dlTDHwJmqsNsSXvcXb0Dci5VISME+siNMI/SpFgNWTS0UKPAWL1N79BcMcM5Suiwa0yQuQkkU8nCZ20h+vM6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0176
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 06:31:38PM +0800, Borislav Petkov wrote:
> Hi,
> 
> On Tue, Jan 05, 2021 at 12:12:13PM +0800, Huang Rui wrote:
> > I am reproducing this issue as well, are you using a Raven board?
> 
> I have no clue what Raven is. The workstation I triggered it once on, has:
> 
> [    7.563968] [drm] radeon kernel modesetting enabled.
> [    7.581417] [drm] initializing kernel modesetting (CAICOS 0x1002:0x6779 0x174B:0xE164 0x00).

Ah, this asic is a bit old and still use radeon driver. So we didn't
reproduce it on amdgpu driver. I don't have such the old asic in my hand.
May we know whether this issue can be duplicated after SI which is used
amdgpu module (not sure whether you have recent APU or GPU)?

Thanks,
Ray

> [    7.609217] [drm] Detected VRAM RAM=2048M, BAR=256M
> [    7.614031] [drm] RAM width 64bits DDR
> [    7.639665] [drm] radeon: 2048M of VRAM memory ready
> [    7.644557] [drm] radeon: 1024M of GTT memory ready.
> [    7.649451] [drm] Loading CAICOS Microcode
> [    7.653548] [drm] Internal thermal controller without fan control
> [    7.661221] [drm] radeon: dpm initialized
> [    7.665227] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [    7.671821] [drm] enabling PCIE gen 2 link speeds, disable with radeon.pcie_gen2=0
> [    7.703858] [drm] PCIE GART of 1024M enabled (table at 0x0000000000162000).
> [    7.749689] [drm] radeon: irq initialized.
> [    7.769826] [drm] ring test on 0 succeeded in 1 usecs
> [    7.774797] [drm] ring test on 3 succeeded in 3 usecs
> [    7.955500] [drm] ring test on 5 succeeded in 1 usecs
> [    7.960468] [drm] UVD initialized successfully.
> [    7.965047] [drm] ib test on ring 0 succeeded in 0 usecs
> [    7.970316] [drm] ib test on ring 3 succeeded in 0 usecs
> [    8.626877] [drm] ib test on ring 5 succeeded
> [    8.631376] [drm] Radeon Display Connectors
> [    8.635496] [drm] Connector 0:
> [    8.638503] [drm]   HDMI-A-1
> [    8.641339] [drm]   HPD2
> [    8.643835] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
> [    8.651102] [drm]   Encoders:
> [    8.654022] [drm]     DFP1: INTERNAL_UNIPHY1
> [    8.658224] [drm] Connector 1:
> [    8.661232] [drm]   DVI-D-1
> [    8.663982] [drm]   HPD4
> [    8.666479] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646c 0x646c
> [    8.673745] [drm]   Encoders:
> [    8.676665] [drm]     DFP2: INTERNAL_UNIPHY
> [    8.680782] [drm] Connector 2:
> [    8.683789] [drm]   VGA-1
> [    8.686369] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643c 0x643c
> [    8.693636] [drm]   Encoders:
> [    8.696555] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
> [    8.788923] [drm] fb mappable at 0xE0363000
> [    8.793036] [drm] vram apper at 0xE0000000
> [    8.797064] [drm] size 9216000
> [    8.800071] [drm] fb depth is 24
> [    8.803249] [drm]    pitch is 7680
> [    8.807106] fbcon: radeondrmfb (fb0) is primary device
> [    8.918927] radeon 0000:1d:00.0: [drm] fb0: radeondrmfb frame buffer device
> [    8.938461] [drm] Initialized radeon 2.50.0 20080528 for 0000:1d:00.0 on minor 0
> 
> HTH.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpeople.kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;data=04%7C01%7Cray.huang%40amd.com%7C31b8dcd4040e4a49380e08d8b16517ad%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637454395066317813%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=al4lLGA%2BCdHK4HzO8M5VJthY8Iv71xQ0TsDGwJpgs1A%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
