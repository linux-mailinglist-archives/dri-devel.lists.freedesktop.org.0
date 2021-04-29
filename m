Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77D36F277
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 00:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583946F4CC;
	Thu, 29 Apr 2021 22:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6B6F4CC;
 Thu, 29 Apr 2021 22:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX4ogwrGESEJXyp3aWA9UZALKYmAsHKxv58EbSMrLZ3da38bfg8szedC68ib5dWpI2R7xq9ajIu4evSlMAB5Av8RcSTlw/BSacHeEeGK+JR4TNF1+IgU/ayyVHxTS+T38zY0QuYlLnE2qUAdkzhb1sp5EAK+HE2WlYj9dwXqRIhyCdmuLQX5p9ww63raJmsl3CGFDQgHYvc+ni0UoT+hPRPWK80+BMiOXEQYijrbqfNT+7/ofZkrZTBGBU75v7RkOM+EGr7vp7XeVL0CBakGawj9+lwsCkqERNQe67DwvCf6nD498kmGy/SD0Vx5QMgVxdtSZiDVxNFyT+7EeIUDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IofKcHb/oxaf2P9zb7JVVmZAcyLJFWp03VrdPr4++SI=;
 b=N3cTphWzVwSsUjjmxQYwQIWFPg7hmkvWafnLijvMAQd14el+BY8AJxw1OJMxM5tiaUMS6zJYQETZB83nIpUsELg3GOCCYsXWBDa0c059+bjbujo7fsoazhngQ3eplXJ+OPqK4ZrOy6kOLXzfdRs0MErmnWbEKz1Mp/SfKTCoFl/NDT6DmHzKqKsKy1TOlFS8Km4NyHKzLhVClJag0OO6DSOkWqC4HwDwgiwot59kyeLr0sRojvkEEuVtb/YCWz0OfP/ipGSszhD4a6R7u81/pZjqX7lja6bSVhGNnAAZaYBw9pQVurchli2i+9SFUj+LjzbrRxSAa/2Tv+jDq8+X+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IofKcHb/oxaf2P9zb7JVVmZAcyLJFWp03VrdPr4++SI=;
 b=Ng7494fko3Bw6Aabr9VhcUvMqwxmTXkDHZEK0GOHIx+NCeLkd/+UyCEISPDAuDzfwyf9gRhmqoPerBJKN3TADZrwvY9pzJbQVVCJgbV44x7g4L8n1pMN5Cv2DpTywJeIsLKCE7kGPto7CSoxCbHbzyLXh7DBoQx4Lv1KkZ+6nak=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB2987.namprd12.prod.outlook.com (2603:10b6:5:3b::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Thu, 29 Apr 2021 22:12:02 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 22:12:02 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v10 0/1] drm/drm_mst: Use Extended Base Receiver Capability
Date: Thu, 29 Apr 2021 18:11:50 -0400
Message-Id: <20210429221151.22020-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 22:12:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb703056-3893-4812-38b9-08d90b5bd0ec
X-MS-TrafficTypeDiagnostic: DM6PR12MB2987:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29871CF586ED1E3EBD4B951CEE5F9@DM6PR12MB2987.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfcgid9ut263+a/dGJikVo6K5IN0Hc5zKbxM+7iRHPYUEYnM+nijZwcOmUQ5s6Sh33lp2+sz50YjxPACHbQTn5rOfaoZCQEivDP0yirYfXrZa1IypZlHfGGySLMHn1dTwJPmHvdq4Y4bDUYMkousz6kSjqglJlpMir3jOHyqfs9Y6SyD2g+wyr05RSd2Wl9665sRaYsNXIqepi/rJZSIg3DuzS8xtBgayP7eLtojG2cPzme6HmQ9jvBVwndvLPMX4GRK98Is7jAuAe1jpTZRBR9QciILhOatlaefeKFR9GNPQ7HyyMw2fr117CEpJWw9icnVYnfVsGYh3apgBkVTE18b1bQC1SJETI0lRzr4sEH1pPPhMuVMmytKRTslQRmC6sFNiDDR0a4YXUH3qcRqbg+L5/1KJo1GENdB8xY+QW3qQHpb+9+oyWOmAqCjXSJKLcVn+6BBs6tWFRI6SCJkxrZCaQ5XguzmbhzY9fnp9g8pRnoJWWxOyWWy6GLWlhGFl6kt6Lg9sMNMB9Ia00lKq1/EpSywUYvpJyu/NaPC8J5hAia95pl3a4UugnJ5pvH8WTAb974KVvjqL0MGG1TnISDhQRoO8S/YJoiYPHd/x0CPFLP0Rqt0r41ART1n0QxoYsMGjlTcdiCMBcRu1euXxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(38350700002)(6916009)(6666004)(36756003)(38100700002)(86362001)(16526019)(5660300002)(2616005)(6512007)(83380400001)(26005)(2906002)(52116002)(66946007)(478600001)(956004)(6486002)(316002)(186003)(44832011)(6506007)(4326008)(66556008)(8936002)(8676002)(66476007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bVOplCgh4u1PIZLVBhyd77XwiTRJKCwvbaUZJo9C+yk6qqk6Lj4EYlK4Jz+d?=
 =?us-ascii?Q?1ZaSloNoo5x3mwQ5sSSPkd9XLLvd2dHbYG+5X6yCIxY888H2LTor5PSaEZP5?=
 =?us-ascii?Q?rEhS2anPcup/EN9j+lXyHHyLBZIjvGY13xHIsyB5aYOMrpp4bZZQUAioaI7f?=
 =?us-ascii?Q?5ENRoVGQ4o7xqGGtm4FuivF62UN/sne9NnvAMRb/EUd2q+NI0xLdJAlz5zn4?=
 =?us-ascii?Q?eZRHVPBQvLjvEwqL71M3GQb0U2k5zQAJ86gTDUoA79B2fJ8W+ICXoTiT5Vi6?=
 =?us-ascii?Q?x4SonDPn0Vlq7/VnuAcZvowwrhx1IXVbqiyYXX7b2OQ4ZbreAmiM42X9TV4H?=
 =?us-ascii?Q?HipmqmpxD9P97L9/+yJ7UfZW9SgL3Ytcb5k+4Uhl6Phbq/CKXHeqMibGRYW/?=
 =?us-ascii?Q?9Ej4ODGaC3RK1iyxT4NJaUkBNeXbfA3G/sAhLXjRC1Ix1ivSFmN5/Jj8/Fil?=
 =?us-ascii?Q?aBonVPTYRLVn4BGorm5Oqh15LwIIQaKbtCpQIgVDKQM1FeQkrHU41koaM4na?=
 =?us-ascii?Q?P9e5nzFlbrG2YUa4WPTU0waZPdIic2vLXRKsDE2R/u8ZdLXfAgwwaZfdQqZH?=
 =?us-ascii?Q?mi/Sn5ZaOinurMGldg0e2EuXbq3N9ytqyaeBIt6aAv/Hcq79h8e80O/3FX1m?=
 =?us-ascii?Q?U0l4YrszIEX1bCg+D7Rxcg6WXdkzXOwtkhgueJUVYW1yJDIXIDx2Z7Nthcz8?=
 =?us-ascii?Q?OS8Pt9LXAaItNJK7+Cm+m4DBqmupg8R+Sh6rogh097Hr9QAfGsRR0R8qzfOv?=
 =?us-ascii?Q?sHSL2LG619yN5hAYOFGnCdSE4II34uK+1v0ZlPcsZydfF1pxcw2eLRTv4GvL?=
 =?us-ascii?Q?LltqLhG3QhJcgWAZ9aWL2tFMLSpwc1mCBZ3kKkV3rdcFoYU1RnN8I54jKLJ3?=
 =?us-ascii?Q?rDWIfH7QmlgfVBewqhgJHP+VjVcdXPS1/crkUsd8gKR0/gIClLMy6WlTa2Wt?=
 =?us-ascii?Q?VxGPGaV7xW4OsE/dT8JKgj0iVHuuxvuRl8m7AY1rCejkJxhb5/hjs4mTzhny?=
 =?us-ascii?Q?BkL7ayp2rqdpdn9+CQ4LBC02EY/VDxkVztm7ZwyyXJxsyWJA0ynjtwUcm++2?=
 =?us-ascii?Q?iOz1S/ThnXq+A1ZR/wHA86cb1hWf3KNONGKmEob2lW2G+uqrzxznpWb/QtGo?=
 =?us-ascii?Q?OH3bmW2TB3lVnQkAqhwmCyU7Z+0Oml6s/yGlspkF+pxZm+hvVSBDDChD5YIj?=
 =?us-ascii?Q?Qz9EwP2qb2/4gvmAKJwVyVFPZcfn1e3OLbpKQfUqe1k5B7aPSt6dEMq9Xgtl?=
 =?us-ascii?Q?q99l5f7bAQFRrfU9lJjJpZxeUxhemGjLP/MeY+8W9kkZqwz7lkA7aSLHHa3O?=
 =?us-ascii?Q?QgSB0kyCFFcTyLyU/4s90SXZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb703056-3893-4812-38b9-08d90b5bd0ec
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 22:12:02.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ7EDXkQhJT+Emc+u3HAxWefSMaeSFh5pM0srXY38t5YW0kyQTxaL0SrE0FLNqzvoNBVMw6Fc1hJFu8ol0Xvmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2987
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

v10:
 - Removed mistakenly added temporary file

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
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 8 files changed, 71 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
