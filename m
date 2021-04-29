Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B836F1F8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 23:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57836F4C6;
	Thu, 29 Apr 2021 21:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0BC6F4D6;
 Thu, 29 Apr 2021 21:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRxGzcGGEu3yT1v1hzX4HPTDB4/cbyqZfWwOk6Qv/QbU5P6ufc+mo3kVF8p/o3BduD/4izsapqvjOdEIRG11/7so5cA8Uz071QQ/7F0s1pDNQNfICh2Y6jpQ49Gy9p0yhIHJJf349zzUAkhDIOtd8Cc7L4NJ+dTaePGmqBbFcYdsHyNHJ7AvM6UWueIY+7ZfiVyIH4JmTjpdNylAfHWCCuvQxFQ0Rh84EPVpqyqmzQoGeqyVCboXUUAZVhUJHZs+j17boIld3XS8zsFN1CyrpHVYPPYe2GtWtNgu10Et+PUokyeJGg/9Dg8aV1enrHOcZlxHTRPoRyEo62PY0twC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTypNYsXUcOYYtMP7KqtdHax2ENZdMVPgxsEVbg76dY=;
 b=Y0nlGkFEyAyG80BvojWxz4p0mW66DGoc2os9ZU3NAaQmXcBymO9mPhWHnPWmr/KKXzlqMTNnMiy8JR3KHsokjoJs0Otp8isu7eNg2TnHGa3GResu7QMi8gk8yzwxkpjHBJmRH3KxnYoaHuLjYV46lzE7LG+Ya6SmVFBGYJroPOK7zdhzfFlyg+85eS2GciKB1my36/O/KQ071oQkO31DfLSYJMH9u2/niARYpLb37jK95LsmICb6WLUN9ahJH5XE4eovBv6tyFyq7VA045Xft4dKkvEdieOFPnD9K2dFb2/CJ0QmSuPyNldaRfqbwiMLKb5HJpqSO6WZ7e4jOybMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTypNYsXUcOYYtMP7KqtdHax2ENZdMVPgxsEVbg76dY=;
 b=QLUpOw/+QLID/IduovVbHaXUjF2Tx5QjMyOUbmUjRBB+BglamDIMjEsr+pT6NEevAUBqEJ4qj+a0mGb6zCA9Jny8onZ/3LpuYgwObf6eydFfQG1kXrJVqg1DT/ZEIy/80sNKpxwJVt76z6SppzxTqCY2Xd7orTIrcpof8fx95kY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR1201MB0219.namprd12.prod.outlook.com (2603:10b6:4:56::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Thu, 29 Apr 2021 21:25:19 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 21:25:19 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v9 0/1] drm/drm_mst: Use Extended Base Receiver Capability
Date: Thu, 29 Apr 2021 17:25:02 -0400
Message-Id: <20210429212503.21355-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Thu, 29 Apr 2021 21:25:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a319b66-b5a5-4ec1-5ac0-08d90b554a3b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02196E7DE6F3D94ED700C534EE5F9@DM5PR1201MB0219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13Eh547VAOzB3B+grCC9D936sqwd3TZ94xlxbstShputLqC1cE9ioxJ1o0RiXwI9+Spupbhd6NzIro3fsA+cNY7i16dtMaYmzai198lX82k4UcXxkhWyDtw1lGGgYNq3L82J92omskgIUBqT1J3grDrErEBQUgmsXfBMQ1rFBQFccJrcSZCRaNGXomVNaNeoGMxsKoW5YVXxOmrmJ0mmoAzk0jBWmKVk3EA8vr++3dHXLOTyVfvQuUINy3AFrqeI2W70UKvWO6fO7LllnaOXW694XBfSYNTmukBtG3CWKC50f6Fjtm95loU7sgTLKvty0QRG3CmmFmDgXZUPMMbuthWXmkmoZWNw8soLMsCgZVGeNrz1W6JNqYmY0DJTrWFdfTwdJZfzLxjMGYuzCZBq7H6RRUapoCNBE9NzO7lPiNHL57w2aaL4NrJ3gX4I9GXJCnaxjcQ2R/cWYLABqCchvyJfdoClMssUKn8l5TSX1WlfA9g3LFpp9QYXmXxlqlSzYoDB2OL6k2EjlJKvtYfYZYw2gvQwCG+rLDR/PNjHNEWif5KgwdKRb+u0jdtgwnEDtkYwrRAYmHEUmajgmsD0t+gPYGQmN2FNrFIMkhEj263H0DvS3d4Y6dcRq+aFXYMBdH42vH2wY345EokRvTyf/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(36756003)(66556008)(5660300002)(26005)(6486002)(2906002)(956004)(8936002)(2616005)(478600001)(1076003)(4326008)(316002)(38350700002)(6506007)(86362001)(6512007)(6666004)(66476007)(6916009)(186003)(38100700002)(66946007)(16526019)(8676002)(44832011)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RFB6NJ5T38EiO8bJHxTk1ZFEOlk2kAj5Iv9emF4wJXSKQZR7VnUc8xby3emT?=
 =?us-ascii?Q?ni8NtVWkmh13AFzfXoLcTJmLf8XoFbwOCOfYL/zL9aeQRhaFcsIsey9xnqlk?=
 =?us-ascii?Q?ld7Cd7hVe2iz0jSUf8WNVJ8ipCC+I7TA9Ws1IkzACt0R48ICa77uSumRyWnN?=
 =?us-ascii?Q?25hnz9vIRYzbxDMpBARYOarxC4v+UY9i/o7JeWRwxko7jl/fFBZYADRKyrAK?=
 =?us-ascii?Q?wAOFI5ZM89MMWaQGzklb/X6RAiXG7GKVuW+voTwDTLQ2YaJHIqUwXEFHvAuH?=
 =?us-ascii?Q?NrxKDLUCeCsk4AZ/0a8LyXAyHg1z82zuCWeASTPmOousZFlnzYTbROxMAZiJ?=
 =?us-ascii?Q?YcC/VsiDAGwkMRdjyP4eHMeSkmWK4jm8eyEjSZ+zIKZSjYUW7gK8v/7Sju71?=
 =?us-ascii?Q?akrX/ByBT45og3ju1ZPXU4aybRycbUIyXOcrg4X6scT0ZOweTAB05Rxq69co?=
 =?us-ascii?Q?dGl2NayRCzwhgKmCJ0oX3wQHKZbU/wKS0ub4Dm31o7jYUABYiLrspAir0JGj?=
 =?us-ascii?Q?/wldn7S/Jr5HnMzp+lopH85USujaLFSf9Dms24CgNxbEXKl10xuATTNINkTS?=
 =?us-ascii?Q?Uy5UY0il7YmXHzxYXjAnTUTdtFu7DFVbxRgh3MLWZ/qzG1qjesPnIqzxw3i5?=
 =?us-ascii?Q?89vB4K0Z9rZftNBOOdR6ALXwRIk/LHSjLh2/TYTePq484t+M1DTxw1TzK1rC?=
 =?us-ascii?Q?gaLfUfswgoyYLOHa4u97srfiv5zaLgZcPdfim8eRlvpU4acnlFKTJvfkSHu7?=
 =?us-ascii?Q?vOZ2KLcU9ScP5bJiehzZQn+Vt4xPHDguDG6LWA9ZI+s0JKZnhcnQA5DSmZSs?=
 =?us-ascii?Q?AbF7vJSltwcS0BKPFqkn6K1dwhE29sziI90SilNlyjvW9FFQAKjguBVLQgAZ?=
 =?us-ascii?Q?mDuRPIyB6QI8JJ982eu3AZ46DVNNQom+apYlJNTbV3erCiIb2skpRrnuXDAG?=
 =?us-ascii?Q?/VQoUD4tJqVtIRrAebPn4glsthI0lOroR/ziYYqVuA07002PtyoKvLACxk+q?=
 =?us-ascii?Q?mfqyxzzhvanVYNYM3QxOXbGjBklah5ZOMNP71LSYv3yDv97rVmKCIpIrmpHV?=
 =?us-ascii?Q?fo0ZWXU4cbxjASGJoXep84/Y+LDCVGOv1nYM5mVVV8+KNkdJANiUQyHU2Mec?=
 =?us-ascii?Q?5Ue3jco+QQI2LSJA6xCu+/VODn5ksLYvAcVaztQs/G46OImbn/Du3XqT9+UX?=
 =?us-ascii?Q?0o7HPPWzj4s0xy3IEfDsi8hPSjtgrK9EcTLJ0MC4l95K8rGzC47HqNmTf5+q?=
 =?us-ascii?Q?4cF5gUTP3PMt5YOjSwSUtJjpnMZ8Az6YWx+iS97NI6SiXi7MRSaG8OgUoFXl?=
 =?us-ascii?Q?Mmqriux5/KkQfWHJrUu+maHx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a319b66-b5a5-4ec1-5ac0-08d90b554a3b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 21:25:19.6904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYnQKo+/WbeiPoeFUP+jx1/fjTvv1fyDYPsDXxOQc0hKTtBy/EemNMpRnlpgjPH1Yk8pSMS6B2BzCXnRhOuNGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0219
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change history:

v9:
 - Actually send the changes under v8 below (missed to commit
   before sending v8)

v8:
 - Chaged link lanes and rate parameters to u8
 
v7:
 - Fixed formatting
 - Fixed 'unused variable' compile warning
 - Fixed comment format
 
v6:
 - Submited from (hopefully) the correct repo to fix build error

v5:
 - Fixed min_t() macro arguments

v4:
 - Fixed drm/radeon/ lane count and rate

v3:
 - Fixed check-patch errors

v2:
 - No changes, this was my mistaken reply to my patch

v1:
 - Initial revision

Nikola Cornij (1):
  drm/drm_mst: Use Extended Base Receiver Capability DPCD space

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 18 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 33 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++++
 f.txt                                         |  6 ++++
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 9 files changed, 77 insertions(+), 15 deletions(-)
 create mode 100644 f.txt

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
