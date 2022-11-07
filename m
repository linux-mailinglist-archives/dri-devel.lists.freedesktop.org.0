Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156C61F3CB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2910E309;
	Mon,  7 Nov 2022 12:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47D10E308
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKn4Ek8bTuEeoq5GH/75I+CILCp1mVJPDIxnD0tSNt1MDlCbWDKJzJzTafje0KjKz3F9kRCqTFHMfBnKYrVmqgT3g50njpvt9wJWu7lSa3vSPeT6eDH9vjGrBB0gulC5k6uuGEK/gBUYzo25ixaVY/Rp8n/gRzfc3UBcxukbnR1v4CXcuWpcD0QaQOGXjTMH/oDImY2psNwtQ5VJeZbpjpmgb3jhnVLWgPyxW+w2fDa8uIiMaInNkYhX1HCgjlM+gCy8AnzJ0fLlqUWcSNqOcod4HPDvKWg1LRO9UzB4AtMsGCh6oBTVcEKuTR68Z+kHz3bUvcihgCiAocFxf8rUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAgn3zVWLdlP03Eg/9KFD+rIXZWtNE3QBsDLAWSYeZk=;
 b=Q/31KqBq1Q939PWKa6EnnwkdjgbXVErQ3u1nAxiWNZkWu/viqk3d8FoVvOGc601UHB62RFCNrMV346Hv5753FVyu6OGIue8it1QmRsP+6qn10iFHLFSJ1vBKq3zSkfUOzyvvd9QtvelOFoWBWmXxBSqoKKbJX9yRnzIvyK0QHldlJhzupCitcJzdJ1WPJqqAZgc8yLUw4b7vwp+J2vZONk/HtllLW7LXcIJVLVglzDs1rXyc4zBzP4LDue3e5Mjjt8bdI1HJFl+Uho3BsNDu8MIWL0Uw4AjfUJ88pYDuUg0ufR2BjchKmzO/xsF0dYbQoSYLMJGk0gVT8w89Jrc75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAgn3zVWLdlP03Eg/9KFD+rIXZWtNE3QBsDLAWSYeZk=;
 b=YBTkVAphjZh0d3lB7mUkncvOzXt6VdDoreJjIAXWtL50ep60Bh557Zf+fa9O/gvGn97/JB/r9tHIj8mehBpUFEJlFHRiU4FRh6O/3GEo2SYdFV/hAEAuoecadmAq+xANnJPbCoCA1SyaNeQ8OKhgKGXXEGkJJ5ydIPJ4jMOFeCbwelaildTIqXW3OK5xC66lIz9XmMAVPPU0TskWCCJyrRk5O2BCOC7vQy8vnyA/AuJKWhORuiBX9cBC51RsdS7ZuCsbTm0G1NNtsbfPRCJIEt1u80oc1LBC+rrN1/+hgkRmnVr7JbJNNXYYLmVEOQFBWMG+0F4FJPBVs86PsSInhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 12:56:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 12:56:17 +0000
Date: Mon, 7 Nov 2022 08:56:16 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Message-ID: <Y2kAcCu4z2LUMN7u@nvidia.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6e3214-adbf-4ab6-eb68-08dac0bf7593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MXh7VlySWAuRz0qD/b9pM4hhoVBg2jS2rouzP8kNE3Gh/N2v5mRdtyK1lJmsq5hgFZBMpZuKWSVLmpKLIu40EiKmb/hmxc3+CN9VTC5nRQADkw3871Fs3GEao2EnaCVl4Hu07xeRl1tIAHklDNwMrAIjHe4VX1hET/yE36BTGhIEC+xUzssChIg0QrFjbO8oIPOq4FBkBZYFFolc7vf1kqJbt+l32/HY6P4kGCcRbfE2TS2BKsr1n0TPVu52cfMH9LYIrWkSCk1KoCzmuyMTINfI9v91Wuc4jQ4WKKkh5wozK4Jznz2j1cgJZImrBqZi7F6OJdp8YM6N/pr8UUCO0kYVrnKzBVWGG8o7L5pNyhL1rWEuTrHjIFUm14HmONufwTqpTaL6ZTdwgKetr+PqrCYAMyWJ9M0ZjSxoW5Krvy7cqK0lou+IL0PM6/na7yRilcqa1EYMw3GIEVeQ89bSLo96T4FLisLSzRLfnqdKMAZEwGm03KvGNoGOfY3W2gy2rRNWHnXhxuqTtFGzetByUwbZYaBGEOcJ3mO55i6gmlE+3X2hRUx6HuEPwp1sUzqSxt/ZXmFjN/pJYGp/jvnqXTmyaraiGj7Ky7nBXphA+nsNyJSP9g0r7FmHN0imaxZPsb6WNryYj6Rrba1cQkqg1kVfrJ3qonm6U5ZN2zgV8c4XTU0EySldyUBROGRZg8+X40h02E7KdCNoNRUlFjD9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(5660300002)(8936002)(38100700002)(7416002)(41300700001)(8676002)(4326008)(66946007)(66476007)(66556008)(2906002)(83380400001)(316002)(36756003)(6916009)(86362001)(54906003)(478600001)(53546011)(26005)(6512007)(6506007)(6486002)(2616005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sVgXKt+CrtvbWqrgNUaUYQFN1pN88g5czUrmppHIDMOB5tzIC9wGa1pCrnta?=
 =?us-ascii?Q?sOsq5avPN33SeT6PlopFqjpt0wCLErYlVD1FAPur4SlsDmjHdVdDa57cilaV?=
 =?us-ascii?Q?omkNzior6G+aj0pgpkyqWIBzs2EowmGsRj0Q8jruVK5D/E0Xd6YpEozIkIfU?=
 =?us-ascii?Q?X8VczBLWoaDOn0Qz9SmzJcj9fhbZeOLJ8uF4ncPlez2JIcNeUgStDNiBLojR?=
 =?us-ascii?Q?Tn7sO16JbNyRlZojSkTYtkr+dByU0HIsaHHVIkwqL/5vRUx+BFSZ8rH9ZyNM?=
 =?us-ascii?Q?fLCRahARmoxXhx2HPegipDtU2HNYwvO7gEtVByYhxpXIYWYM6HRUiBejYlXF?=
 =?us-ascii?Q?l1YO8RiRadHhsmooyNocx7STcyaah2sCViQMdD0FkBaIxPC/bnNqnQwJFOGe?=
 =?us-ascii?Q?/+IIlGOkTkpebyLrQobGcyJKz6INeCyf2ac8CjAfoPmfrAk1uzHoPDtxeAmI?=
 =?us-ascii?Q?HYaJetZTdpnO7J6nMtRkXmD+i9pALmB3AoGR1xqtfZw9AlqdOJz+w2EX6eiq?=
 =?us-ascii?Q?sxLixqJUjCEDFsEUk2t7GGRYiHJE8omluA4q8tru5vrM4VQSJLDei+iIZA84?=
 =?us-ascii?Q?DbBMQNoJWXmPaWpgOCD5aRjo/WMYseg9BD3tnXMA9dYgw4rMG+eHwwaIcqKI?=
 =?us-ascii?Q?Xs4dPGe6HQWjaDYa5ktP5MiCcr+Aganq2jpeJkQC1m9aQoMiwpWsFsWGRjMd?=
 =?us-ascii?Q?JiKRxMQn0siwV0rWaWa//+10K8BDS4wzqSOismoLi5qVZl+IczXcQyNBxl/n?=
 =?us-ascii?Q?qMPHMHlQ1aAI23Besudic3I3McutQzhHgypkqSYCCCGbBnrtqthVYGPL6a4H?=
 =?us-ascii?Q?pB358BKuZ2pBgJKE51ZslQSSHSyKOH817dzPXiwhhwrOepYkw4jJ1iyMUJDG?=
 =?us-ascii?Q?b4DLIyiL9jxPttoYVRTzWIpzI0YjOg2qtOnU56g5FQR/CvK2WAySP0hR5kt+?=
 =?us-ascii?Q?vlptGqVUJg+Kq6ZSpOeQNtxMSpCFcX+HtyTy+sYEcdhV38nXvOieuSJsm4JX?=
 =?us-ascii?Q?uB5D8JQhRcQFRTvlJqVQC/KzdYC4JRW05L525onj+84fGGacLsv+ViUuabgH?=
 =?us-ascii?Q?gOR2IxntykaYtrd+cBg5Oqha+yl42V8WmlHY73xDEjNJHLShp2yMhZZQKA7F?=
 =?us-ascii?Q?Pz5zqjEPepLDTaB/gNnsSSyJ4ZAAfsVxqjwaslqyFCWPgADw9hF8KXXsTg/o?=
 =?us-ascii?Q?Sr4Q32rDFNZZ5SkEhIMc9DdIUEWlUU6+Neb6CEEk3XeG9MgRy1rbX8DCA/4h?=
 =?us-ascii?Q?43QK1xShsZQJNOAyb1hWNPqXnChXirkjKLMXYGYn9/v7wFYMfyY8tlLP8jIP?=
 =?us-ascii?Q?0iIwvem1w4QVGP9L0MU9iuFyXal21RJgMwv3zbfETYqxn53Q7pAbYQQjC5if?=
 =?us-ascii?Q?S8GBxyWDWgp4u9BYTxB1bMnqZZ73qsOq6EX9ETUkRcN/PJCA3rmz8uzJPzow?=
 =?us-ascii?Q?B0vBc/isY0d6tzncAfCAhEVhVgfqzGSMqrFG9J4vVsvrnQbC2dq/FDEXBbJO?=
 =?us-ascii?Q?G+sE9SCneVfUCCWbHFWuEIKydClbejiYMSKTLSyNqJBiRpb7qEGKi40g4MVx?=
 =?us-ascii?Q?xhKzctWlxi6IldUQYMftP9bjkqQjbtQHqptUM2th?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6e3214-adbf-4ab6-eb68-08dac0bf7593
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 12:56:17.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ef0KuyMsIMxv5MKNgjtYxVnqnwAEKqlYPZibh6qN1zyJquFZ/YTSfMvkP4BzNyHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 10:39:36PM +0200, Oded Gabbay wrote:
> On Thu, Nov 3, 2022 at 3:31 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > On Thu, Nov 3, 2022 at 2:31 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Nov 02, 2022 at 10:34:03PM +0200, Oded Gabbay wrote:
> > > > --- /dev/null
> > > > +++ b/drivers/accel/Kconfig
> > > > @@ -0,0 +1,24 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +# Compute Acceleration device configuration
> > > > +#
> > > > +# This framework provides support for compute acceleration devices, such
> > > > +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> > > > +# devices
> > > > +#
> > > > +menuconfig ACCEL
> > > > +     tristate "Compute Acceleration Framework"
> > > > +     depends on DRM
> > > > +     help
> > > > +       Framework for device drivers of compute acceleration devices, such
> > > > +       as, but not limited to, Machine-Learning and Deep-Learning
> > > > +       acceleration devices.
> > > > +       If you say Y here, you need to select the module that's right for
> > > > +       your acceleration device from the list below.
> > > > +       This framework is integrated with the DRM subsystem as compute
> > > > +       accelerators and GPUs share a lot in common and can use almost the
> > > > +       same infrastructure code.
> > > > +       Having said that, acceleration devices will have a different
> > > > +       major number than GPUs, and will be exposed to user-space using
> > > > +       different device files, called accel/accel* (in /dev, sysfs
> > > > +       and debugfs)
> > >
> > > Module name if "M" is chosen?
> > Will add
> So, unfortunately, the path of doing accel as a kernel module won't
> work cleanly (Thanks stanislaw for pointing this out to me).
> The reason is the circular dependency between drm and accel. drm calls
> accel exported symbols during init and when devices are registering
> (all the minor handling), and accel calls drm exported symbols because
> I don't want to duplicate the entire drm core code.

I really don't think this is the right way to integrate with
DRM. Accel should be a layer over top of DRM, not have these wakky
co-dependencies.

The fact you are running into stuff like this already smells really
bad.

Jason
