Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2D36E214
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 01:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD346EC9D;
	Wed, 28 Apr 2021 23:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C206EC60;
 Wed, 28 Apr 2021 23:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVwHAiQQ3D6p5EmDpgn8NOanxChVc0lrUZsMxE6zIyQXzwbl3/h1AzhndkN12va+AkVER50ts52CPwnVCmP1EGxtuLU4x1vYRc3pnIMdVaMSpzoJryEgtA8BiuVc9chl5nVfuB/N68rIEAfZgkWopJzg7HTy5FmspEsN8cUsDwBpTATpMexo4dX4FO/TIo71YSJBsG1AdVLgXj+Lpeq24BrwgLEm5RokrjYxDaxYDD0dhxhWDw8Lmy8mpxCRYrYJT1ckzjPJleXriCxJcr6N1OjJbiNB545SsdgPQ9AMxSpsf91YwEFJAuroI0HwaVCkisnG18y2MobuNEyQ/dppnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XtQIOdqvXSnio/vIBs1g540hfNJR381hfvYKLj8jFo=;
 b=F+FLhWrGbUzPt8TGl8vZ4zgpLKfiG/um7Z8Nno/ou3RzqO8BIiC31v2YzJLuMGNUtNvj59m0QOg2z+9ejFDOL5EYUWaQBtLMfIbbvRgjJqVXbkjd5cTttxOwqlZ72CJAid1/BrfMam38ELfO4wYWivhbFgXSlQMDGSWT6AeuT+jLJxeiNZekGGr9XoLyn9GtstF110oy9C369CklnuysdPAAq443Zpxf5sGSlzt31Xlc86mTgSC9p+DbAsXZ7xJycl6RBrKRwkXeBEOsMUS9yii9aITzoHD5KCrh/3/UZaW9FQjiLLk6N9mP+eVym/tIXSsh8F+fVFgBr/gqIp6bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XtQIOdqvXSnio/vIBs1g540hfNJR381hfvYKLj8jFo=;
 b=jENSSkofKa3GbCsG+TKfEe7OxxC5GamjdFkShRB1Yy3mTh1WIfhATuRuw96mqkq7FDf/vfqIMr2TwRA2Mj6TXdL4eu/QEiJzc190IfmxKIGTNZtXyt3NDJ9jLHPA9ra0PmNdMdmZqQGqg/K4jAEjMu0HcyfFrw5etSNvae91BMU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Wed, 28 Apr 2021 23:18:42 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 23:18:41 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/1] drm/drm_mst: Use Extended Base Receiver Capability
Date: Wed, 28 Apr 2021 19:18:25 -0400
Message-Id: <20210428231826.1071368-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24 via Frontend Transport; Wed, 28 Apr 2021 23:18:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f231067-6c23-4a1e-1855-08d90a9bf626
X-MS-TrafficTypeDiagnostic: DM6PR12MB4959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4959117DC21A75DBB81BA06CEE409@DM6PR12MB4959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2I1o70HVO2+lq5qa4wPl94FVYQqKJfUchbgLUFeD9Nm8oduvtfr4KDx8FXGvBmBJ7k9RrKqrZlb8P0AT8fofub4zYqNMcdwsn6KbXbWPuuuy1Oh7ZZ8ROQexr//DhnarCf5BEm9QdEziny3mtlYAhh3dMGrqFIjJ5i0q/rru5Zp60aJuMPmzWyKV7E6Jj+qX6wUNVypNHeH7BOrUQyeI9CX9qFlXtfzJeb2PPIjYs9Pet79knfYo3na69/B/0g4CG7KfyuHB+9TnMeEjXSW/FQBA+SC9qn3YrMe+CydxEQO5d7U+EtDO2qSQfDLr6VPh10yXV8KODqOtBwx7XtdTn0ztNluypqB+m1gJbxhb9j2BD7WVaiJwWWHY4k8/35IjaQelEUfTw/6BNIrLTL2ZxsSYUk4bKxpSJYW0XmkqqEDfIcyYCd94Z0LV8Ntv9gXe5P8RWgc5W8UV31RRIRtFO8/pfY3SpIVLrU+7drhPUeW8t0TBxm/VtsOiZQpjfBnXWtFlvl9LzcCOzchq/BsCe9YauO4U+tw9QHROEQaF8Z9JRJfH+RGJVt8WKDwUpJRGhcoVq4cpauMzNbLS9VK3qjqbDHsQZoPJBWmbXBG5LM7vCo1C0YAqZMZP713CaZ23fiVFAlmQjV8zJO4hr8Eq9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(5660300002)(86362001)(8676002)(36756003)(52116002)(478600001)(83380400001)(8936002)(2616005)(4326008)(316002)(6486002)(38100700002)(6916009)(2906002)(38350700002)(6666004)(1076003)(4744005)(66946007)(186003)(956004)(66556008)(26005)(6512007)(6506007)(44832011)(16526019)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d0/+6jq3ssoYpH9G6ZtLeG8CD5bjI1nA+pZYx9tTCLwswwUPfBRn+fy4QGz1?=
 =?us-ascii?Q?OWKRCsbyr/mbCDkYJ3DlCzXjYjLqVst5Gpi7/eU8MDs0UYjKG5Yo31o0tSsT?=
 =?us-ascii?Q?sW2Y0+zDq2tfojo706SsUBG5FEI66vNLCfy5p0T2WUPcPQL3zYYAvlWggqgp?=
 =?us-ascii?Q?/GV+3DypalrB8wPmmyaIvg3wRauNuAX9Z5UxqEqRFRTK63HBKzwMjR5DKjZa?=
 =?us-ascii?Q?YPuPfQHE9vTzwwKPh508KJQzC7o+IDbPFKKACsrMhy5WcvOWNdKQ+dcFZjau?=
 =?us-ascii?Q?MtK0bWjWF2IaDM6VMLg2HnGxIfH/IrOocFfotqoSu/t+Oi1flF+hTB/PFe84?=
 =?us-ascii?Q?7oaXDGTAo+HJPsGidlZJ3PjqTZZMHUM6QCHVHj34wEd654scpGzs80Wi+uF1?=
 =?us-ascii?Q?EcXCU0+A//acNW/GLrzUjzqdrc5zShlgj7GjfaJCjqOR4OQNSK8O3MlELcmF?=
 =?us-ascii?Q?ctjeD1QD2bUvvw9H9GlxK+BUCFYHAoOl32Yy77NWNfNeW2i3KC7JxCKpCyew?=
 =?us-ascii?Q?unfba9gECb/eOemqt2Z7ht0MinkeD+O3siVah4KbLMz4j2aglEibvrjXHpDw?=
 =?us-ascii?Q?4SvbCfUiV7UkuKh3Q/HemTQjyPjp6E3VOUy/+iC3EcRCGsPd311m4VRdLRgD?=
 =?us-ascii?Q?F+L1jn+KnS0fv17yHn/HwxdbELLqinhRQziVEOc/xquhgy6B3Yd7/13cTRX+?=
 =?us-ascii?Q?78+lmjjzCtNyggKndn07PlDMML8au3N16mcYbvoUCtQkvmJOk6Mzu1aPq10O?=
 =?us-ascii?Q?25kt1jZPloM0Ykxkw5aGkYHdxuvh7EQWiXBSS237F8kW1tgKyqSu4tmZLjIM?=
 =?us-ascii?Q?cdS/WCKbr7VzFiJGNT/ftV+puP7dlu8tEW36oDC28xjGQ/BV+cOGnjAfWUtf?=
 =?us-ascii?Q?+qNNEhJtHeherhC49gfv184bvQTaqvYhl852vCazR6vKI7bJwaNflKxikEHo?=
 =?us-ascii?Q?bFi1dkaIdBQZorqdcndh9vUmGtoDVQ7c/SqOcjEs6sks55nLQ1uJhvwILYs2?=
 =?us-ascii?Q?0PEsG88qmjuY1/LO6N0jswVWWtyC1O/qaH8pi0b4otfumOUIZL9FZRJP+UEB?=
 =?us-ascii?Q?2EL3CtIlPp6VJrH1E3EkXmqZMagRcqgh62EulOL5FVtes/XV6n70nS/iOFtV?=
 =?us-ascii?Q?Nea42LdH0+A1Xk7p1YJzJwK+Qa4JSs3ab4dPr4t5tlfYdjyQrCIV6P509vzG?=
 =?us-ascii?Q?4TJgvwJpdnJh/6bQ6a0JhEVjVPRBO0ctJ+NNa4yhxLAALmyoZqN2CCdVGWyS?=
 =?us-ascii?Q?89YQg3c49sAqDzX8/BPr172K+1SaHWuSzU7NRIiqh01XaFeRTy9fsMxcaXBN?=
 =?us-ascii?Q?tiz9cebjBXEBpmG1EZqM+K8t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f231067-6c23-4a1e-1855-08d90a9bf626
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 23:18:41.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUEG3MheQI1gTFNldPpjY8DbWO1BeBu6z0zE+KgBUYMhOd6k/yKwPrQRNuI9HGX/7XDW0KcQStssa23nZ/fU9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
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
v7:
 - Fixed formatting in drm_dp_mst_topology.c
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
