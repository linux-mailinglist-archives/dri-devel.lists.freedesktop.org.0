Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48012397B0F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AAD6EAD9;
	Tue,  1 Jun 2021 20:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7C6EAD8;
 Tue,  1 Jun 2021 20:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znqlz5/0wwyb5hA35fM7NbQGzyfprzGg/hIipm/WrE4q0bjG61JGuy7uCRnnXQ6JBy9kc5efoKROGdnuH62TlauiJpX5S0OVS5xx5DF/Ro8bhyVeTl7vHsq8dTYOowFhxnptQJ2D4sZeP5KPO93BW2FgrajY86uvmt3YMjjIQG7M45ztVGAFWwomk8RDRU0heSyhTI2cvy8XDKqE1pa5uvsZaD2DDFNjuDe86dpU5IPaxfsAyNFBU4aYmkl45KFaqGF0KA8F7/5iS6UpEKubLmM0DlE8a+DMq/6E4Cm/nog4/1pN0WzaKBHYW3bVMH8vixNojloolYaBd2i21PFCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7MFCuf1zmFK8C/TNyzhF/UjAKdU4+f0JvcWVCAacEU=;
 b=Vqurde4BTx+6+0w10rPbRF9YaFiw3ry+Oe5TGVI/oQnf6JIR8aLdBPhw9fowEUK5uJHm0WOvdNgEmZqsd8po4OP+w7dqa5+xUehf/ErBNGGYrEsumWhGUb/Dm0iUUDnA7Z/qLfsyBY2jtId7pdPe4sGFLmUGCT4GE6clUuoOb6HC8zzmbfoZTsSaVXBZsVR963GSNMVCyd/1P3Hi1z7JG8GO+7Y9qEeUlGR28aTSjVxjf2THPNZ8oXw+PhQVOKZNGhrqe1h4ovtrR7FEGkuyvvBjFb6vyM0PESnNbS2Eqb0sqLFk9i5WzVxGaGrVT5UyNmNrdIMniIqH9IaeQGmoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7MFCuf1zmFK8C/TNyzhF/UjAKdU4+f0JvcWVCAacEU=;
 b=qBAJ1D0jpWALhJOfN9rehj1wNNSrfos256RhFVJS2pEsGsQ7cgZSZkgbxFhja1MR975rOtOl+cu2vl8KDY/RcE0OBwxoy1R0l6Tq7RUMiRgQzvlDYn0/DkXdRCvxlNBXoUTB072c2Rq17yU8EpOQt7DOPZUyEZcFJrYyJN6BrR4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 20:17:21 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 20:17:21 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] xf86drm: Add function to retrieve char device path
Date: Tue,  1 Jun 2021 16:16:57 -0400
Message-Id: <20210601201702.23316-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5b64:13a3:c94c:964b]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5b64:13a3:c94c:964b) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24 via Frontend
 Transport; Tue, 1 Jun 2021 20:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97826204-8dbb-4aed-99d3-08d9253a4331
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27027EEA94319B6E886B7685EA3E9@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvfte7NeyZeDATtIlA4A0TXy6P7kcHfvBOtZoJn8uDEPMGOGdDaanoL7TOwtmhefqC4nJXyVwYo9GL0CYvJj9NO8yEFRNapYX6taU3ln1iHl7qXqLhigtPoj6HzcN5cozSvrwpTgXY1OsyhuWx1Tf1SKHmtbwWU7AW+ujsbuixFVdU2kBR9A/IS0xDqCv/XqyAoIkP2UpHeMdCEsIIY85txMgtZxCd8uWHQnIJ46h+cLaaHG6eC3jitKuFh48CX++npLgi8juDJ7lbJ2Dz35a6WbDE0U+f/aCnlmnOgrr4yUB9TpSvdD5tcJ359E3L1AUoy2Dxw/mTTNnOvNU5hOXTLi19ghChz6JZ0kwCogArYaaAm6nL4z7BCv64e1jVX0XCohH0Mzy63WHoEP+bOeTdI/Jcf637YqHhhxJ+v0krPN/z7w99xTkbicMOf5P2ptVcCGC9ZMDxykk9AVoT0Y75MU0vmQKFXYC7NeUoKJGgX4XQxL1XxU4fSbaP3VvOSgdourKxOslHvJELy1fYhbO+RlhmLPnmOr4ZhLdwS0wFKpQhcqd2xtgIdhaQ0cDjuQ3+dLDBezE8hBTttq3Fbu4eKs76BvICnR86yEXw59j7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(16526019)(6506007)(2616005)(38100700002)(1076003)(6512007)(5660300002)(83380400001)(52116002)(478600001)(186003)(6486002)(316002)(66946007)(8936002)(8676002)(2906002)(66556008)(66476007)(6666004)(86362001)(44832011)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aB6CWKIeVIzw/BfDyitGhWKHKdHYwWduvF7yi4OzJJyzpC5whafD7iMlnYub?=
 =?us-ascii?Q?75v+4CC/68F+bU4VVGistlaqgFZ+lgKmn0sqQU8fUKDDtG24aVWho75NgJxh?=
 =?us-ascii?Q?8DwfPPl4bAvSclIJUkRoB/2WzO/NxthV/wAOx50kgTSQrQdHR/7ZtkajEVnD?=
 =?us-ascii?Q?UhqA/SEl3IotRprzAlHmnurLB5GtMDhtf+H0WcHF7GxJKBlXwF8bFii4hPFl?=
 =?us-ascii?Q?cUNyS+zsxu55TGKwJnyMbvWVn5zUQJuGWaqFbC3YZQcWk5eI4tQ+fIFBl06b?=
 =?us-ascii?Q?Q0HEH4KbfwtT1YleW9Orlpbol9UVRVSk8/HG5PJuiybuqgxM8rfUKbRGOX8s?=
 =?us-ascii?Q?DKJEHKH6Nzqq3SOEud3DNpxidCBIyF12BSNmdj4mIqTZM90hBy3uIOO9iWT5?=
 =?us-ascii?Q?oLmyRmu9+yBx/r5VQrnjKEVBN8dZpZs5HOwe5UX9ad485JRmD0Z8uccToZej?=
 =?us-ascii?Q?8aFvdJVVMIUqu2rIbJw7eSidBA7SO3C6g/hceknOTEus3twS7vnd/yF535cy?=
 =?us-ascii?Q?QJCw20jBfP0nLLhaPgXXNS7itVGib1cdNfO5bhnHdcnFrAZU6ZgvYgoJhcNE?=
 =?us-ascii?Q?U/m2wYQlUZxyH11mMGD1Xea7gXs1NZ9l6TKAuIn8UdEGBdmOK6V9V/rKPoes?=
 =?us-ascii?Q?+ZbiBYSnMNuP8tTga1ueeuI81yr8iMqxNwESuXKOcHLO5slrLQflK4zxZw5T?=
 =?us-ascii?Q?yjt/9LI5Yz5ks2Z6BEIZdEbSXsNx+LKOtLNbbayuowubCgpaOMSQux1Mjatd?=
 =?us-ascii?Q?ioVeUEVCSAqQWBmwpR5lFnSmzy/McJmqfeXCSuubrT5erMfhZckFpDE5f4X1?=
 =?us-ascii?Q?gLtA9BgzolslA1oJoT7M6FoS7v+yUS0uDD4IQBQPXbccfw9G8AxFe0nWdPBd?=
 =?us-ascii?Q?6WbtMObO5xjPWVkGqt4gc9PNx0XzNy/NzePOyK9n/rv5zBxlCarA++3tnpNF?=
 =?us-ascii?Q?Mw0AdpCOny3yMTIZDQxnwCB3xKwJ2rvXjbn7oTRmhiIkZG10qmO2BTlMo56z?=
 =?us-ascii?Q?TxF8h7PgXygmu1LDRfwiqoXbo7rEOkfhGIaGeOtmxobfJIxIrq0f9ySDc2WG?=
 =?us-ascii?Q?0pM1JVYY3OvA5HJmc7PklsNLzFn7o/IFg1GGAjZ9+6SrD/6Us3vBxdLaBXoQ?=
 =?us-ascii?Q?8AIkiAx8RXp6m/LLUgysE8sr+UnZ4hwCHphVYbpCzwbcapiYchfUqskb4HI8?=
 =?us-ascii?Q?7nHHKuf/RMatmdFAdJtLDPyb9WTO3g/O5BfRI4RzhP7R87yDf5IvAXMYu2hu?=
 =?us-ascii?Q?Nq0dszNHTg4/zE8GV2mk0ixKc6RjGkq9WbOtHZAkGAP6K+egfwx5igSG/zts?=
 =?us-ascii?Q?XVVv7D8fFSgwUS3asvWJASt2PLj3qRi+Nc9VQlml/C45+JYWDmmbczmCmvu3?=
 =?us-ascii?Q?VBEtdwKI5vEtrr4qjBXxJILHDkBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97826204-8dbb-4aed-99d3-08d9253a4331
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 20:17:21.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrLC2qbf67LnhoYsMT0+0fzAG+qOQ88V3XFfw/lQ5+1iL3Q87Y8CV0BXwJm1EPmBBPrg3odEwIxNEqlORx+BSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Used to access device controls

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 xf86drm.c | 23 +++++++++++++++++++++++
 xf86drm.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/xf86drm.c b/xf86drm.c
index edfeb347..a5ecd323 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -4361,6 +4361,29 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
 #endif
 }
 
+drm_public char *drmGetCharDeviceFromFd(int fd)
+{
+#ifdef __linux__
+    struct stat sbuf;
+    char path[PATH_MAX + 1];
+    unsigned int maj, min;
+
+    if (fstat(fd, &sbuf))
+        return NULL;
+
+    maj = major(sbuf.st_rdev);
+    min = minor(sbuf.st_rdev);
+
+    if (!drmNodeIsDRM(maj, min) || !S_ISCHR(sbuf.st_mode))
+        return NULL;
+
+    snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", maj, min);
+    return strdup(path);
+#else
+    return NULL;
+#endif
+}
+
 drm_public int drmSyncobjCreate(int fd, uint32_t flags, uint32_t *handle)
 {
     struct drm_syncobj_create args;
diff --git a/xf86drm.h b/xf86drm.h
index 9fc06ab8..c172dbc1 100644
--- a/xf86drm.h
+++ b/xf86drm.h
@@ -812,6 +812,7 @@ extern char *drmGetDeviceNameFromFd(int fd);
  */
 extern char *drmGetDeviceNameFromFd2(int fd);
 extern int drmGetNodeTypeFromFd(int fd);
+extern char *drmGetCharDeviceFromFd(int fd);
 
 /* Convert between GEM handles and DMA-BUF file descriptors.
  *
-- 
2.25.1

