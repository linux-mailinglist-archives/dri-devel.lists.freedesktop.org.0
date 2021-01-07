Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B72EE737
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03C56E51C;
	Thu,  7 Jan 2021 20:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61406E513;
 Thu,  7 Jan 2021 20:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEMLzeyvYugrzzz6Gjor5q2Ed+JGqiB1wYOJamt1j66h+W3+GTxSCtAdBu1re5WHxljqfRZaAzW0GvULt4swz5eWh5qvaLwgBEK4nAHU7tG3q/GNQRO4sZo767z8LmjtDDMGJ5dSS01SzaXjEqrBlPgzLRQJXTdHyRRUEa9SgsB5kEiPpAkjb2c0p/XVAjBHx9DeTFGj64/3sCeZoMuZPmHgXPm8BNgUSD/xMlRsQiKoAZHpXLy21wGcz88xAsBbsF2wakDvgnJzbJMsDtfAPxQ/b/OVkyqY460X1ZqWHtqawH5v7eq8SHfp6+mazrLjgXjt4ye6fTAxEd0gl/Yvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvmcB8uDveyFne9AHAwJJXk+TQWtKph3eezQRBX5JFk=;
 b=iN97+RI7YfsVhf9x5chzPVxDlQ+x2U6OgnphAXVdtS312hppqU6DI0xrMfkhkDllAj7NBomzINqxdCpCp0ODfeqlu/J1fgrskzzBJpCOUeeLiLqPHWySM94enqp30LEvB9m2KgsJJQxU303dmsX+JSDuMO3pYhMkPmbiMUR44ShCIl5rISnwL31Q2GQFx5DTLlR7x3sSMYG57MBlrNGUNGtoyOKI7aqGNpE+R/PgHzPzxLR8SdAXdYTAvEOmTWcSj56siXJK4eMTzzNXb4XF286U5HXXvCuVmNlvxyLhsbfEAQ2yftUgXUBeXzSwomMtdR+ByJywT1GderHNpFAqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvmcB8uDveyFne9AHAwJJXk+TQWtKph3eezQRBX5JFk=;
 b=zqwcUTWzS7VDTPabizOY/8JUlKTyUFeSZ5YzAcOVlk3OancSrGnXiu31x6Jn62m2XBVtjpvWdBnbCff344xaSzRYGz3F1tQ23Mn3l822LmGFb8KFCZxYs5eNyqrr9TmgeIAZBrYBDc2zZDO/MiRZwMhDFDPS1VnNo4deRl90OUs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3595.namprd12.prod.outlook.com (2603:10b6:5:118::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 20:53:38 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 20:53:38 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Revert "drm/amd/display: Expose new CRC window property"
 and changes associated with this commit
Date: Thu,  7 Jan 2021 15:53:18 -0500
Message-Id: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3]
X-ClientProxiedBy: BN9PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:408:fc::9) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3)
 by BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 20:53:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2cf8031-5167-4c7e-50d2-08d8b34e4eeb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35954D4CF5ACEFF3E6585E0698AF0@DM6PR12MB3595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfVWAZ94sZkIRw1Aqf4RP4Eb7fPA7MNp9rKkk6wJ7WmfQlZ81+XqlxlabuGgf6kYkTM91ibco3FSMaMJltmgIFFzjPbsFF9k/0aqzbFSUf7poN0vDjge5WQ7vJMNyFySSkkt9/eycNifOslIj0vloyvAdMyYpCozjNksOO6vZyVybothaF36BLWvkTvMANKrCOsYh4KKGQe/1PfLrBTnXzbXv6Z7oR/rbh6jYOLYUGv/aC3csF1AcRZ5tBQCUU33a77BnWbgkgfEGwvVEbx/FUZLBCOS7BiC9qv9q/AeJp/3DgvIgr/jfxAYj8vFWtrJPDd5/gadQmNQu0Ry7Y1rgY3C2K0ztTRNb9YhMmqACyrbmACHwRjrZ2qwM/4wp+M8iCeGGbZoEEIDddQzUMLMXi1O1Oq43sjvU7l8J+ZLvvCvXEnHa8pwsyJeeL2yiR78MQLOEeU1tLIA/4c/R5kFlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(86362001)(6512007)(6666004)(478600001)(4326008)(8676002)(54906003)(5660300002)(66946007)(2616005)(66556008)(66476007)(1076003)(83380400001)(186003)(6486002)(16526019)(52116002)(8936002)(966005)(316002)(6506007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3ebCvlZaqBxSX3A/Mufg68gZWNLpLfx4a1ocFe7IxxiOJfTho3kzp2dEyUsq?=
 =?us-ascii?Q?cS76Snspg4FqMckoAhnsBIGynXwPxNjyJFsSvrXLLlZ+vc3m0mxzJz2NVIVU?=
 =?us-ascii?Q?17Tq//QZAI+wMfI/gO05SKW3+fiHW/Dsi1oW+dRXi+cv3uUeJWcEP2nulokS?=
 =?us-ascii?Q?BouacqtRsS6ORxxTCVg3547hVDZbNRveHF3TTjdZyEAHEQXYsZoHsO02XK47?=
 =?us-ascii?Q?H8jZWGTi48UXeJc57WyEy+qNg0J0jtgaKC+6w27kZ4Y3vTv7UehP2v6MqRlS?=
 =?us-ascii?Q?VxZjfS7Vy8VkiXRKrZCRSsyBVKxEK/73w001z/dn7z/0DfdjjO5UpCZLNA9r?=
 =?us-ascii?Q?vzASQ3LrbIQWP3OwR7gpH3uEjknNvP2kDgdn7MCU5/aD6Y+BIIATd8MhB3np?=
 =?us-ascii?Q?Q3YtzI1M2mPPyKzqPbbSUqCVumeHEBayhieMobKkrnQkgCyK0lAJNBcT0A2c?=
 =?us-ascii?Q?3YRMN9xe+cx6A/M9H+K2y0DC4YaYI9P6BpwC74kANjW66My0ZW7jRJm2hbJz?=
 =?us-ascii?Q?52ClYGQDsM/DIfVZWAqUXKn7ERE+a8fhWvr6aZ75wsn6k04XRUGiHClFSKB6?=
 =?us-ascii?Q?PBRSzh3vmGXAiTaga+dA2MiJ2kAo+TThu6pq60HEytTW+OuxJoKcPfdb8ADK?=
 =?us-ascii?Q?gmPtAsTzkML2Ool92JS75IkAxcCMxc2TsxtfZB7hvzeR5nPt8xns6Xee3zUY?=
 =?us-ascii?Q?HTRlsE1SpIgjD2phddzjd+X2DoMtNEFhwEEq/U80hIUfxn7AynpGccUGy80F?=
 =?us-ascii?Q?8ZQ69ZzDG9ejdrkv6slFgcpnihtplRi7eWnNQ22lm+BTbSjC2ZqX8AYJ5bCo?=
 =?us-ascii?Q?zWg5bWr+TkULBHXKqUWdD1xDEyuGv2gVaebFtfeMKSJLpswel8WijBV/bCwa?=
 =?us-ascii?Q?fPCAyxnrNN2xiNwfZW6rML2HQJY/YZW+NdDlZaSlW8EgbTJ9bwMNZ3Xn5kQ2?=
 =?us-ascii?Q?Q3ePwb3tnAqmlqnKkWz0QRyQ4OTY3bdRRqIw5jOvXOGC0RRVy9fqctftbue0?=
 =?us-ascii?Q?m42W6Du9W4NfA25h1WBSC/IoT4pmo0fKoUFovUveLgO8Ul+X8G5v6VbsReil?=
 =?us-ascii?Q?wfyH4qmT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 20:53:38.4511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cf8031-5167-4c7e-50d2-08d8b34e4eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mks76EgOA0s5bxN5SKeayRNL5jHF7bCMdi/qt41l4D583z6FzBgDGaCTJbRS9QHd7aXfA5HcJ3qRwtyLzhC0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3595
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

A couple of weeks ago, Daniel highlighted  [1] some issue related to a
patch entitle "drm/amd/display: Expose new CRC window property". After
discussion, we realize that we can revert that patch because we will
need to create a debugfs or full UAPI for CRC soon, which will make this
code obsolete. We got two other patches related to this same code; for
this reason, this patchset reverts all changes associated with that
specific commit.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

1. https://www.spinics.net/lists/dri-devel/msg283767.html 

Thanks

Rodrigo Siqueira (3):
  Revert "drm/amd/display: Fix unused variable warning"
  Revert "drm/amdgpu/disply: fix documentation warnings in display
    manager"
  Revert "drm/amd/display: Expose new CRC window property"

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |   2 +
 5 files changed, 14 insertions(+), 229 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
