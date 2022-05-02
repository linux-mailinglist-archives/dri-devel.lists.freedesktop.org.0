Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F171551757A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8CF10EFD9;
	Mon,  2 May 2022 17:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654B110EE47
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvJRWPCwkiRDlcr5GBrsdqbTuG/65i5ctItRJL/QmteRS9tPBwSt7mDe6Jpduxr+juPyMI0QbTzincat1H+h4pX4oXPHMvF2i9qNI8n0zF5WPfr/KtOV2SQAnmWSc2QI0OYBWjT2bciTBPuU3mLihmXKAYY7uwkyPyTrClHRB8HWmReam65KT2Q5ZjpBkgobRcOzc9YrOLFMYf7EGGnCBX/YWSEGuQyqz3IcjIAHSSllmDTtQNbyXeKHdPylA13JpY4ejsDQgOhuXuwNQnFbV+yt3em8/JCMGNGVDb8WX23Jd/e1OhAMFPn3BWaUP3Fk/sdgAeLYVK430XE3yJpT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDEmLVK6oCHMQV761SGma4KHXpB+/6mD8OLMmo8di54=;
 b=OTTej6STFU5cGIYyQsSxe5Bb0mBPeoXOjZYUioipazuzh2r9juNo7LvJ97vBVVc0ysX8fupeWtjUelkCXEQRB60xl689hRRtkSehOvjZL0jU29yJuz5cugrkWNpWGNUwLmcTR0kr2/nHzxNIoKSmmiLUJ0oz4IY8XItZbZvbyRHkRJvSdeSFzopAln+i5HpoS0JZ2OqvlIHMD9LKETYh7WQ4gTj+quvhjehu+IoUT8N1vjMzT1HmCTGnOHiq6KX88aAa3EGd+JAX1x/CR11CsOld4Iq7Kpxp8UYT0F2K52psAQT79OlzDVDyKZZ1EG3zsGLE09Q+AHBFkzG3q7J6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDEmLVK6oCHMQV761SGma4KHXpB+/6mD8OLMmo8di54=;
 b=Siv1ayp4LTPBjLndJ76fbFlOLfAuMg9OE9hhVgjZeE1Rlorh5f2dQhuOlTt58/S95w2QykwzafOgEHE98jk3kaLqKSxC2N0w+qyC19IhMdJiIGmwvAA8/uynimR07kKCdDv5UbyZ8Fq97ur7Ml8n50YwZq1Du6p/Ca9s+GVdSnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1370.namprd21.prod.outlook.com (2603:10b6:5:16b::28)
 by DM6PR21MB1180.namprd21.prod.outlook.com (2603:10b6:5:161::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4; Mon, 2 May
 2022 16:37:02 +0000
Received: from DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372]) by DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372%4]) with mapi id 15.20.5250.004; Mon, 2 May 2022
 16:37:02 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, vkuznets@redhat.com, decui@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jejb@linux.ibm.com, martin.petersen@oracle.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Date: Mon,  2 May 2022 09:36:27 -0700
Message-Id: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To DM6PR21MB1370.namprd21.prod.outlook.com
 (2603:10b6:5:16b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88afdc49-77e2-4979-85f0-08da2c59fc36
X-MS-TrafficTypeDiagnostic: DM6PR21MB1180:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR21MB1180D93559687104B53B1BDED7C19@DM6PR21MB1180.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0e497YHycIrEJJSV7TXqHnsGCle71faQ4IsD+Ls6b1tCbXHQza7ktdjrdxbYbCLdAjqMPOaq9HAkpFoasEICACSQz/nf5P1P9qixKoq0oxFJ8ydCpLgz3AYhtr0xDzBB56oB9C2DspK2vwgS9y0g9xfpfOtZeUOCN8zV8KXdGN7YU0xNZTkzDiaKxVpRJ5ipWuqT4ofNmGeAZyAj6Ni0iebnlL5C8Fyd/atGnBVP6KbfyWE8dfKVrLEOWlHADqbJAdJFXMr+41p1CHffJmtkFUHPfYGX0BUw5zrl778s1gzsiWAbr6or32bsLlF1qRM2Y3DPxeR9PoCm38xflb6pACygoTTBgdnCoxmeHhgnOa+zczYeEtqq9WCV0mNUbdHArmOVKJNxLeaaJDvxG6GCwj49sFBLgYf80aIhfDTVmnd0FGGuOHV+cBMGfXXjDLhjPFsJzUdPQZ2ALxBi6y9y8XvxNOft6jDqWQXQPTx4dqo7BMB6om9vUlhgr1jrr+5xjAsHIJyRlkA/kECtWpwlp1p1NGHfE4NCqtfAkoSGUcnvGA75z6O4ls/6RnTgXrMm+VPBWDZTR8Cw31ifIolQdniwDMbiM+qaMJeVAeHwR4EAxTfwUD+KpVJ8G8NYuAg4SVPhJIcNny+TVeTY+cs+P7PBMEtgjBBIX2xvs8ETwPdRIzwjwHl3qFlZwCXwlH6F9MkTfhl/NCiZBjQhN1Qm0ovtPrQKtWpu3IBe9QwFeWFZTlzj0A8l6V03pkzDVE6+qqaEj72Jk9QWF8TvkeI/qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1370.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(7416002)(10290500003)(66946007)(6486002)(66556008)(66476007)(2616005)(107886003)(6512007)(26005)(921005)(5660300002)(6506007)(83380400001)(508600001)(82960400001)(86362001)(6666004)(316002)(8936002)(38350700002)(38100700002)(186003)(52116002)(4326008)(36756003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?65UUDA/L9Kssg3JMtYYtMEiKe81jiSqez50j07JWwwFoBvF0N4kk1x+7A25D?=
 =?us-ascii?Q?FOFuoH0eiOCJMgDKcu3n8UCynybpbeX2N2F160hYydckb4Ubvp+wr2dGKskm?=
 =?us-ascii?Q?VFcQf5bN080dK9qCHkYZAY0vDjjZrj2g5prL4qTbqDl6o7/hzed1pQ/tvbR3?=
 =?us-ascii?Q?dfZsSxOrAWL3D29kf6nUIcEHKMRLaWu3wmL5KwXugzmuZHGZXbhk5dB5ZN12?=
 =?us-ascii?Q?+B7pokiGF+xPeDNUJ3ml+EDGuxNiPsi2+LDz5qpgnwgxcMtsr5EdipgOv6LE?=
 =?us-ascii?Q?rG47kc4SWCllezBPSUOQov94hkBQ8e/CNsFv38pisLwhcI8Z8UrImHWSjIzQ?=
 =?us-ascii?Q?M57g+hwg2J5mnaL987nR0htoXeIolbUrEvAH2nc19xxdFw6SG59MgoCaxIqS?=
 =?us-ascii?Q?azj9z5s6fFdjsVoQ0QIIIMiJCm6abrRQQ5B6Cosi6pMIBAXddxIxTb5eyw5H?=
 =?us-ascii?Q?HVHEqkJ2tNum51L9essqX6k8/kOzk9ejHkt6V6bgTdVPNcnPF652CcvoYCZs?=
 =?us-ascii?Q?eNQQM5hEjLW9Kyghnnp9OvRFYrpMHKRx+ZsgqDx1EFeWLI5djly4kDt5+HZg?=
 =?us-ascii?Q?X4P6FtAhAyjhqtEdPQR+8mBuoZrYtpxs0HLSlIiQJJlDdWCBa6Au/ojdGoUF?=
 =?us-ascii?Q?ESNcO7PckRlH8Oq030KMJgiZDWGEpjPrwE9CB8ZB2ZfUWjTeZ/PM6zk9xhqO?=
 =?us-ascii?Q?c2UKkqhV2AxZkkpJGfRVLHa0pmUyjmnVe87lu8NpOWu3NN8wvipUZoCdmGB/?=
 =?us-ascii?Q?HF2PlwVIVaWLQ6/orQLmcihLIZtw7xUO4vaEWN+RZnKd4txzchulIvBQxDob?=
 =?us-ascii?Q?F3MrLYdUHFf8N2Lx+ITQQ/AJlCS+icBzVS2YPb4idTMVNac9AoSdFyiIWMQg?=
 =?us-ascii?Q?AER/qjzdvqEVS8VtkG8vLHr+++8h26tOBX832y2waPPO45OkwoUKkkA5A9uu?=
 =?us-ascii?Q?DmEIYsmxvEaB51o3REzdofBaw9skUN4FqP6JIjMCHPK2tgCDLg9gymNtxqiV?=
 =?us-ascii?Q?8K3VB01Go7GA0MkPLcA690B2mG5Sq1ILDVNVCFH5zzXT0tmjtZ6oVGY/a7T/?=
 =?us-ascii?Q?OVU2MhxXOZZYmopp3yKiEeoy/ezvpGh41iIlpoCwUCb46mdlgAIpaqTbk19l?=
 =?us-ascii?Q?bTodE+lallghjD+hsZzxJ+XB9lVweo4GCakV2iYu+Z0RchO6kYPKOMeRD+oK?=
 =?us-ascii?Q?6bV5H5Nn9m5bKKEw6DZQPfAsfpM68NUUMLC4JfzIYqmiNdqhC+rZkCy8qijJ?=
 =?us-ascii?Q?m/BBLzBhhGZmdVcGDrqQE/1BiMWIRM05cwlBGclvA5RMM36/JUhwOmzMrn4x?=
 =?us-ascii?Q?1+JeugyTAyewtnH9+Eh1lR46v1M52mP9b5cCyAVspgs0q59tsaxc7dniP6iN?=
 =?us-ascii?Q?xf4Hbc0hFcYRiEEqjF3F2x/UcvY0goscN733Q/N3nwWgvxfEfmFHjjeUFUeR?=
 =?us-ascii?Q?sKFJV/hAD7tCjzRph2+7AYQWKG1GlJiqqSmMFO6PvliiI/Fl+4WlOIA8Rnd1?=
 =?us-ascii?Q?3orQ+2LU3D65sPYHpRRYc2s6CPB8A87PekU+E3Ec3i/ICPGfI3KhIzLl71wr?=
 =?us-ascii?Q?Yp3cMcQLzyJYbbE5pikZvAHub3U1kyscEMZ7SX5Jt0v1PH0J4HkB4uDZ3kRt?=
 =?us-ascii?Q?SxfrzA1su5oYNOhI4wLJdfx8DzulBaxw5duu9G+XyZ2ewnUoGvHksnf8s266?=
 =?us-ascii?Q?QNib8iKAYxAza20ZQY9jEAeoM5TEzt8pAH9XFqSsw5nDcyL2Z0D52riOSiN/?=
 =?us-ascii?Q?N4mrK7JCA8mbAe+H+8/RRt6eNCManAg=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88afdc49-77e2-4979-85f0-08da2c59fc36
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:37:02.2389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEFTeKT6lhkz/0zj+qwOoshzmXXfPL7qCTwhsNJV5meVTA6tgcO00CQk7rPYpuGndn/mPlZxNKrQaUsGn3Chrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1180
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
Cc: mikelley@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux code for running as a Hyper-V guest includes special cases for the
first released versions of Hyper-V: 2008 and 2008R2/Windows 7. These
versions were very thinly used for running Linux guests when first
released more than 12 years ago, and they are now out of support
(except for extended security updates). As initial versions, they
lack the performance features needed for effective production usage
of Linux guests. In total, there's no need to continue to support
the latest Linux kernels on these versions of Hyper-V.

Simplify the code for running on Hyper-V by removing the special
cases. This includes removing the negotiation of the VMbus protocol
versions for 2008 and 2008R2, and the special case code based on
those VMbus protocol versions. Changes are in the core VMbus code and
several drivers for synthetic VMbus devices.

Some drivers have driver-specific protocols with the Hyper-V host and
may have versions of those protocols that are limited to 2008 and
2008R2. This patch set does the clean-up only for the top-level
VMbus protocol versions, and not the driver-specific protocols.
Cleaning up the driver-specific protocols can be done with
follow-on patches.

There's no specific urgency to removing the special case code for
2008 and 2008R2, so if the broader Linux kernel community surfaces
a reason why this clean-up should not be done now, we can wait.
But I think we want to eventually stop carrying around this extra
baggage, and based on discussions with the Hyper-V team within
Microsoft, we're already past the point that it has any value.

Michael Kelley (4):
  Drivers: hv: vmbus: Remove support for Hyper-V 2008 and Hyper-V
    2008R2/Win7
  scsi: storvsc: Remove support for Hyper-V 2008 and 2008R2/Win7
  video: hyperv_fb: Remove support for Hyper-V 2008 and 2008R2/Win7
  drm/hyperv: Remove support for Hyper-V 2008 and 2008R2/Win7

 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 23 ++++--------
 drivers/hv/channel_mgmt.c                 | 29 ++++++---------
 drivers/hv/connection.c                   |  6 ++--
 drivers/hv/vmbus_drv.c                    | 60 +++++++------------------------
 drivers/scsi/storvsc_drv.c                | 36 +++++--------------
 drivers/video/fbdev/hyperv_fb.c           | 23 ++----------
 include/linux/hyperv.h                    | 10 ++++--
 7 files changed, 52 insertions(+), 135 deletions(-)

-- 
1.8.3.1

