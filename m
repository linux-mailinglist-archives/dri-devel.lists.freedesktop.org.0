Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4D37D457
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 23:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158AB6E54C;
	Wed, 12 May 2021 21:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF066E53C;
 Wed, 12 May 2021 21:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNNaL6GJ9ApJDlTqAWw+GuAONGi4s7v7Xm/doZXo1va46P7GTjRinC+v4r5ih0Q97zeCAxQObfKOwFzoKPAV9tRP9ybj/NGePDScOpf6ugEmuMcSQC1D2erqgcaOauC5JaJUdWPashAvXB2PXMSiAekWe/Mq07XMoT3tgBipaUA5cc9AhfBwKI0LqU3ySmTPaCADQuH7ioL2WngExlzON1hwyg+Yc6asvLCWzvIEY7dTq1ju4Vdg/N+MESTJtga/KTZgQ8OHkUdacEwMGhi2WWylh4FFA3tm6llmZki+PWWe2PfMW2OIaKtqVATkFI3HAq8SfyO1QdXHJh3mNg6G+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8t4h6jVJDoOreWD+oRhj5uS2hECWUqv9fQ6Bj1frkI=;
 b=ew9g4alf8WXOgeBcO11FvAVeU4qM+kEI/Cs81M0RHnKfYzqqWLk/1+vARfOEls+uOb4GJ0Lx7H/QSgz4H8Yc3WcLwLKKdVkavNNdoAxGlaaMp1o9LjfrfkrMlV4lLVbFtR6pEf73C/X2JNc8I67tQE/2x4qJdWHUEAsMB80fz8TEgewKVnBiBEEKmD2NuUE4bTqVDzU4gHuk+32EVx3pyAI26J2MjutvDxlPw3iK+UG0BqM+cATF2H2WAUeDjBFRzRR+9wnbLoIY0GZTBT8WuGN2FcWOpy+ISuDArAKBwHwai84QYz6sqSZ9iPEgYIAWrbtBVg0ge4hpld1eZm3qDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8t4h6jVJDoOreWD+oRhj5uS2hECWUqv9fQ6Bj1frkI=;
 b=CZSR6HAbfMO/Mk/T54UemPUIDrQnPWXlOdgpB3n2MVugshIFwDqr7lKz4T0ABjmtLwj1xA1oURidtzECwOVqc1hvnVCupV67I90rigkQB/wr4K8MmE5EZE+Mg2buosydjUTZFUNvQBivjGhXo7+mLBFRurIO9Dms3HrU+YZgEtc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR12MB1834.namprd12.prod.outlook.com (2603:10b6:3:10a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.29; Wed, 12 May 2021 21:00:28 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::b5bc:c121:c4e9:d4ea]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::b5bc:c121:c4e9:d4ea%6]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 21:00:28 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/1] drm/dp_mst: Use kHz as link rate units when settig
 source max link caps at init
Date: Wed, 12 May 2021 17:00:10 -0400
Message-Id: <20210512210011.8425-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Wed, 12 May 2021 21:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a205e5dd-0e41-42ea-3529-08d91588f8ca
X-MS-TrafficTypeDiagnostic: DM5PR12MB1834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18347C8B8D6BC1B5194F5069EE529@DM5PR12MB1834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjOjb18RJbZTEkiBrXM3q4wHq7F4yLRIEKCb782TW0KEgRx4RxjJ4LVlAWBFyce9B6vKPgXImcbfed99LEEkXvC3ELk8wqIvu8Xiu+qetcWLWW23nsxkoB4EHsY62scBgsBlToT6u3Xott4H2FIvNr7eAgv2iq4pm1qXbB1JpDp45cgwlKcce6nv2yNlnhhNaC1FaUkc7Ki7H06B9RMarvk0lYBR5Z3aEL4CF/89S/XHMeKHtRS0DUSKq9J2Rzg8DWMV63jm1p0Yy6UeyP/xfk8EPB3k6c93GHMVOenVnbdeetufXNhAT0+xlsNEWvw3S1LJqiaJYx5bjgVpZ0Bm6YJ5Eu0UssZM44dpMcHIpCIrnTJuQeXb0+NWnRjq1b9FGxW4VeU1nYESmoDCrIGibvCdo+JQJW+Z+vr1/ipYDICDv+FmDuN6ADC6CZOId+RUJhf/IWzCsrN2SmFNe5g+sgR7xDtLI9zLtTfn9B7DYTDSKJ4UMj0sQ3zwB9kX2MhAOHKT+GPNzifewGAEY4bTlz6bYQy5NLFKAH0nH7KmdnXm6dFehr67NbcGeOGxHJQs6xE/9ZfF0myPHtjmGXtvkzQuI675+HjwxJvBoLPUuWSct5dBKxAQxs6DNL9VFXHO43EK8m3GOLz/WoW4+fGbQlG/WCP9ERLZA3NBHOa2r5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(66946007)(6512007)(4744005)(66556008)(54906003)(2906002)(83380400001)(66476007)(7416002)(44832011)(316002)(1076003)(86362001)(478600001)(36756003)(16526019)(4326008)(52116002)(186003)(38350700002)(6506007)(6916009)(38100700002)(8936002)(6666004)(956004)(8676002)(5660300002)(26005)(2616005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TVxVCnseYrGtiOCM0IslRUqg5F1+/e2GtjJ7raqsg2ZQkLqIMrDRy6OZzKq8?=
 =?us-ascii?Q?wVH4qVbTJD62OSaagf/vzvBUW+VKLxCdi/f854pXwDeAfrkTXpUlm6yw0dwZ?=
 =?us-ascii?Q?YC7ZIuzzzPSJhuYPPfUu+Sf8DAm4uIfuNGXUhnWKsradhxQ1a3HyF2lbSS06?=
 =?us-ascii?Q?yohSFpZuoSRm2/EcpO2K2FIb80qYx8qAIETSN3X/K8zkmCI8pXXsLVJTFfv+?=
 =?us-ascii?Q?Z9Cjv8Qj94vlzcbdb2gw4kyoX4ecs6l14KaL45SmVT/dAHZPqU1NTUo70FXk?=
 =?us-ascii?Q?7Hn7stQ0sxt+tPymmIQiUxb54s0nuJ+OpGNKh09J0SuzTN/zpP61FK4MdmEK?=
 =?us-ascii?Q?4QVTrDeOYH8lxeTRmyleWp/72N/SVDWwLImCFfeTZUW/haKRUqfsFq+czdry?=
 =?us-ascii?Q?0EB1O/AAvfPcQK4NcPYd5kX4L7NVr1Hf3tef+EmgdV+TK3sY+LATqjTIp4qy?=
 =?us-ascii?Q?QdeH2B3CLG91FAuuX04Qpg2Fes8ZsMX5Fj4w7O1Yy8U99YK1HEHPryc7ogBw?=
 =?us-ascii?Q?thgU1mBkY1Ahpglc02zsT7FsJJlqpHU3I407HVIst3MpblRCjI/Do5nickso?=
 =?us-ascii?Q?DLYwybZFlpnESoVbZJ2uQ5RZY8WnSKAQDK1h4LZf0/ROeEeUp2bB8X8iDkU6?=
 =?us-ascii?Q?doVlHmTeHi7SUUI3jOIKjaeZ1crtQMNx2BEV4QjQrJD0Ud6DF/j9R24Yos3U?=
 =?us-ascii?Q?EkxGjad23tHmT2NQdlDzFHGAblUXIyCXHd1uL4F0M6vFdK1q3i4nsWSJo6i4?=
 =?us-ascii?Q?DYiHS7H44p1gEe3QIeXDEZdg0QUtiq4gEklPq61WI+Ta6OazYf7UGKhJf5+q?=
 =?us-ascii?Q?9zZVCvu7/yzX6WEaxvIR7pu8w8JtHa5h5/HMDs08B4JQTNspid/MpCF2pz8b?=
 =?us-ascii?Q?8Ix2UyN65L10k10cEwE/zbcAND4RmCjvjErZC/rf3FQkHMfmwKCYupalPznn?=
 =?us-ascii?Q?zFCZCrWiRlEWTmvpZcqbgMoMNCizcqKP2hK92ztGbyaxOZzYnyjb4KMM9LEi?=
 =?us-ascii?Q?iKFzoil0x7vQ5qm5fF4S69wC6GaqV8xDcY2YQCNhYhFKSMTanRUWVkil7B1j?=
 =?us-ascii?Q?GR7U8kBWa96vJM4MOUTn6ircof6o4+zaFGdFKVTRMKx182SZ4ESjyN7DoiZF?=
 =?us-ascii?Q?SH1EYFLegRgm7eMAtfiC0Zs0TNREgcP2jiM6K4CXlDbTgnQZTQyAZlQODCzc?=
 =?us-ascii?Q?PX0I/T1FrwY6DKxhPyCtZQlyCzY+d1HxjXxzHzgp44eqItfNZKfnf/268Fb9?=
 =?us-ascii?Q?1tRZ4gOB8B0HBn/Eo5fYRoXjfuE41fOQjRLwTLCrEahX5frhC8eNveqXhu/d?=
 =?us-ascii?Q?PoCwxA+dWO0Pbs28J8QdG+Lw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a205e5dd-0e41-42ea-3529-08d91588f8ca
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 21:00:28.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8n+hg1jrrXq1zK84DciTWKwrOHrGsd55TYF15lwOBos9xU0bI5w/3ONx47KRp49sEiZP1THOs/WfUlSx/zZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1834
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 James Jones <jajones@nvidia.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Lee Shawn C <shawn.c.lee@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change log:
  v2:
  - Added 'Acked-by' to comment
  
  v1:
  - Initial

Nikola Cornij (1):
  drm/dp_mst: Use kHz as link rate units when settig source max link
    caps at init

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 4 ++--
 drivers/gpu/drm/drm_dp_mst_topology.c                     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c               | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 5 +++--
 drivers/gpu/drm/radeon/radeon_dp_mst.c                    | 2 +-
 include/drm/drm_dp_mst_helper.h                           | 8 ++++----
 6 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.25.1

