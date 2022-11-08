Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F262109E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC15310E414;
	Tue,  8 Nov 2022 12:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A32710E414
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:28:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFgCSUKiVYGJNysFBLeyES47UO99Hf1k5hyRLtIa7bh8a9jLNS3kQshEhlOH2xmZhYT6eq3yn4wGm9aYFlYaxg6t3dUkpKHCMHBfRu782qj+lhWYqFIYKa2eaQUM2il0jPtVP5otL+kOXjg0u+SMnMU5VPJPbxJclNe2+/b8aJ7lF3b3s3p4k8TkX/V3doV7f/Y8hBOXZv6nI/P/RRvfKu7wRmCrjLor1rZdlbiaoGA5MD7XXRyfAnWjv6br/j9ywSCnbbzsKYFZbi5r009Kc73LNtR61Twppk1x1y9WkoQEDCiTSttHAzvPeeo9qMF69wW8t2+M3cbNXcXKDHJfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuCZhbb4oAgPTHoUxQ0OIEDitvfYuIuveVoEMHYR5l0=;
 b=npfx2V35grw7cl91Il6V6RYJ4HMeTrh9nAPDxwCYtDVAFe3WaxCs2+qUj2eA5612QkrwP3ddSEXegFn7IMriPdToVoSjikeu4gQrfIKSIN5hXt9oQAIDn0+N7JSG9Vvwkxh5uXv9UYnwrQjn2oOr+CjWIcCTJOUZDczxZlEHS+gt5wIqGoKEz925uLcFBlYSRM024D0j7pmYGjgmjIYq/8jJA6FlxPNqmg0LfCwc0y7MWNDjbLymWBt7lvrEFRlCXsX1BKw4h8iBDNFK+YCtnU9O0hTmWenfgajqDZU0b3WURY0rYjCjWabpGSNSQFfA0fuAk4RrPNg6d/nGRZN/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuCZhbb4oAgPTHoUxQ0OIEDitvfYuIuveVoEMHYR5l0=;
 b=PMy/LxfsMtc0ntgJoa5aOPjO3ocES8CR6R8uoErYOWJggsF+n7yUqNG8qAbYJrXZbhvPNxDg9n+UwLyXnS8UN6hJvP4tGdqZxF/OvW97AMldOllT79E0sZAbTUPZtWfxldIv2MJ6ohqx34gJooH1Tfg2vEb8rRBwdA48NQUJGoMdUp17osihXI7u2mF4YDwwSF3oyYIMO/KpTQstUxWIz5LmumDAiSBkp29LCTFfzfjfk33x+3JxF6lIPCZkK8/a6kvOnlRdLhwW7srgt+8MB5b5dzjBjO7Dqe6Ht0eOLTEzOVHUBSLJtQp2CnvX7vlaagkqDmqRWJiCCOd9xg+Rtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB5020.namprd12.prod.outlook.com (2603:10b6:610:65::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 12:28:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 12:28:21 +0000
Date: Tue, 8 Nov 2022 08:28:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2pLYxW8p0QeiV+3@nvidia.com>
References: <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
 <Y2kRvyR8VrZrO/1H@nvidia.com>
 <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
 <Y2kyvswuCsO0x1/2@nvidia.com>
 <CAPM=9twxu3v4voSukrkror1BrajShRLY9CFxYWpL2rwK7fMiKQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twxu3v4voSukrkror1BrajShRLY9CFxYWpL2rwK7fMiKQ@mail.gmail.com>
X-ClientProxiedBy: BLAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:208:335::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e220df-ecce-4768-7347-08dac184b8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFPyaw9yhSHIXTyyXrU2cTRKzlPfHygoQWNRh0qmqymfQA1ckPLVw7MloUazaLgN3Pb8R22ZDTLHgNj0CMOT/wfKdgqTL8WuVl8BZNP/QM6E0NYMXF6V1dx4MKKS/UkdVPY9zA3oaJ/HjmFvEjkMW4/6IZM1fKujKgAst1kehHyeqR9+Vhh0TSoM9CVVIiJynRgWZvgqk8zaCbieoz5G+1pr6Mp93c7gQbsfPmDoVOcMVix9B698FUO/jAayy864SZusX7+Zp31Ir4vrlqD6mzeBPMXDZgN0PWPZcLDEX7GYGPy6s9MThipH4umPOy6xq/O2B1sWwNHdWvQN6ZCpFSPd4+rcStPrOHHZ6wLU5DEyk8cCSR7zwH8au+7cEdcLkMeptvsYydQJIjfIoND+pyDhjIBxZMDt9fAw20cSwuM1+exhWzSg2ey1+CV21w+ljIzqX2leeAD4mkdgvHBxOtGwGE03W9tybOaaFfg1B9J7JTwOwLzmIIR89FdyWLenzjPshxSPvbE6raP17UVIPq1Q7RvLG80tB//3/SY6rXPGpfySCad6mq0Ac9y6YQLuTZdaSQ4NQsZo2h+NomxTrZjvJJgCqJZauImaB6J6fU2unhIZFt3z7QKdhT1UpoCzHJ8JHjM7rvsrMMJi4EzEZ+Fsg+N6oCEMuAkFieLchN/u/h7sq/scAsZeqyQXFx654SP4a8heBMpOXWKOE3ywZq2aytGHnynqFWN3CyvlhJiwYUiV0yD+EO6fc05Ebki8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(86362001)(36756003)(2906002)(7416002)(5660300002)(2616005)(186003)(26005)(6512007)(6506007)(38100700002)(66476007)(66946007)(66556008)(316002)(6486002)(6916009)(54906003)(4326008)(8936002)(8676002)(41300700001)(478600001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t4NwnxKPoqLBVWjpsdI9TymBAdbQ0hhqRWjfHB2tTW9VIy+CV5DZXusKf4kq?=
 =?us-ascii?Q?xdxjrrSFh3xbuVSUy9653fyAfMWFSOUZe6JqsNeD1rugSvu7ee72MX0XUp3z?=
 =?us-ascii?Q?r04jQaFPDRsU/SeAcqt17bTLis2fzaTrmna+xfO1vo7kOQniNIMryflQRgpn?=
 =?us-ascii?Q?+UvYYxTsFqn+E2lV8Qcdbm6vGMZNgeuF1XX3yRFdazDiLAdzgwzTajct+UND?=
 =?us-ascii?Q?9K7KRXkhC7HRrEKQLtT4xq+js6DMIp98KFg8502nudymGdzB+O2nidcycQDj?=
 =?us-ascii?Q?Tf6Fovq1vA4+d/NY7FbGxDFKgdmA0GMUpreDf4joqcG7GxGKN1kD+fw22IHL?=
 =?us-ascii?Q?Zb5EQJvQOus6dOvgGhEdPyuylgJc7hhgo2Ox3v9dJORGY72K8blGtmedkP7g?=
 =?us-ascii?Q?fzPng8AQ81E+lyMvh+x+N+Ojc+d3EPvudIM0TeiGQcumbquYY0NSkdrvDPMw?=
 =?us-ascii?Q?nhLEfFNL6/nIELoQ+K2R6GemCW+h814aAe+OCTOQmViYuUyMZSGBxeDHFrKq?=
 =?us-ascii?Q?DAZqnzqojufKsvQfoibKfW3LQOueNrsXiuFcMhLguXaQBRJMWG4W51ahM4Hd?=
 =?us-ascii?Q?i+XDRbACAISwCXZWLI4WBtucyGb3TZfK+KreituGYLdHHCt/Qu2d72R+8ROe?=
 =?us-ascii?Q?Mh+bCCzPgFdX/1h3+uiCAlpPJs2NPstB7mtpByyn1vk6ReeLKhJqvZvGvdXe?=
 =?us-ascii?Q?62DvGayQutn9SkzTCbuDH/CnRK9/0O3qgRr/EkY9/h5KfRhL0emrynmbD8bf?=
 =?us-ascii?Q?vYAIgu+xFzTbOTaoXxywQIGl2YCgpB52ZQrdUddPzGEnC30JMDMp+LXb58ro?=
 =?us-ascii?Q?R0QT/L58dvKSfUK7bc+NyZZshb53JC0GAeg4aKOOCEnHviaiSUfJsZSZHJQo?=
 =?us-ascii?Q?52kIu8ki498msUnQIZZyJ+atVzlkITW0k8LAhwLuwn6C0WP2p8Mdf7AiV3yA?=
 =?us-ascii?Q?9qAyKn3qmgLIF45kRbUPDnucXiwzaASL/UHlFtR+MQq3M1AE08kow062m6Vn?=
 =?us-ascii?Q?RrnJj+kCE3KUNYySH1ago7b4ggi/WZ8yfC183VyiCLvJeUu8fo4h3TKVTDBT?=
 =?us-ascii?Q?nYYRPLPX4oyWAVp005VbvDZ+Ef1YU1bdptcHTDefpDB7XrgwoI89I5ENtwpD?=
 =?us-ascii?Q?3//zA/kZpdFK22UvddwZToWTZ7x+y/MCtq/muqy2UOW3ABN2f8V8bFQ/9UnR?=
 =?us-ascii?Q?XailBEnd1vhidFKMn/eHb1t7/bfezhrfhb/Cl+gEgiDrtEvDN0jNU5g/LV0k?=
 =?us-ascii?Q?kpFmN16ZYlHWjtZl0knQNMzcEtS1lTmbvpHbDODnhvKpeFS5J/CwE0PokZgU?=
 =?us-ascii?Q?wVvd7JcKS5q5uJ2dbWqYbWE0HSWrF8winnpgkjzURo93GZDfaRM90fe1k2/u?=
 =?us-ascii?Q?ot5o4/Rr0E+/VPCg3v1R9DPU7PpIzzEH7Vn0lilPM4Q2zMPPOX29WbPUHQxA?=
 =?us-ascii?Q?lbYWE6jolTVUGI6ybw35Ba1YUOvkByeIxKSxV2w57FSXv0+jEVPTnb1i866u?=
 =?us-ascii?Q?GZx2zKwxPxHzbyMOKXfLcEi5mKTDxJmhxxzv9y52mnt2YU0P4wvvELthQ8ZO?=
 =?us-ascii?Q?N7F2jVMoeMc1ftEgPKs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e220df-ecce-4768-7347-08dac184b8f3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 12:28:21.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E5+/mKNjaa71k1CK9MVolbnYRcf/rZ04XLyFvoN1Fxzr0m/bi/1gUyswhLa3sHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5020
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 06:33:23AM +1000, Dave Airlie wrote:

> At plumbers we decided a direction, I think the direction is good, if
> there is refactoring to be done, I'd rather it was done in tree with a
> clear direction.
> 
> Coming in now and saying we should go down a different path isn't
> really helpful. We need to get rolling on this, we have drivers that
> want to land somewhere now, which means we need to just get a
> framework in place, leveraging drm code is the way to do it.

It is not a different path, at plumbers we decided accel should try to
re-use parts of DRM that make sense. I think that should be done by
making those DRM parts into libraries that can be re-used, not by
trying to twist DRM into something weird.

If this thing needs special major/minor numbers, it's own class, its
own debufs, sysfs, etc, then it should not be abusing the DRM struct
device infrastructure to create that very basic kernel infrastructure.

Somehow we ended up with the worst of both worlds. If you want to to
be DRM then it should just be DRM and we shouldn't see all this core
infrastructue code for debugfs/sysfs/cdevs/etc in thes patches at all.

Jason
