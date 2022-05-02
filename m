Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8F51757C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6498F10EFD6;
	Mon,  2 May 2022 17:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8710EFCA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1jOZJ4WbNLczMyKCwjZ8MQI/UTjIeUYhI3SP5fbQ0QmgZEJgQTyypvIfdIwNuDY7mtMeYJI1cKkGeWCny7PMDmc/+Xqgf5EP7FMntor8oF0Rxvi/EL1w/offK3hlM3lKlrkIFKotfz+j2CM4FX9iHv+NtQ1b/VUESIq0m1zHymbDgaTPpkwv5GIpYoor/zaduh83/7LThCuhWUSqTFBSMlqjyE1H/ByXx2UPybJsdopbzyX20B7lAdS21nVCMm8ptXwA1XEF/9LZt1577FUemNQ97ZoZ23h2egCIq6iaxgBcySpyhgFpiLe2x63R3isK3RPJh5L4IbE9nfUKJOllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Q7CqmIrXWTJW6KP03YP2l7/pKl9BfEPheXtcb5nyg=;
 b=llmOkeiecwMECfdefLJroXHawJ+2Wo2FoM0hpFapIjvN+3WHG/CdbJ3r+/0gbMNeFspTADewjY9bECVbBQlbztlN0x+luZUo3YUFnH8O3ZBHgNyjwJiCadYyvmWzwcHAOZleAb6tK1pJR5ekKDarXfGSakblNaMM/g06PvlTKiEzas6vcCeYx43y/zxhh2yYMsiEoei1FV0Ujb+aTKzDmX8fgBQH0yyl6mY3sckiRZ7rdA+7XPeYoGCqfAAORRgG8kdTqNrTz6L7kcWw8CpuwSO7cTo8lYNidDlm9YrQekPNH8NHA4brC6hRov/ZLmWT9rR+SWngkEDlh8DRxT7+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/Q7CqmIrXWTJW6KP03YP2l7/pKl9BfEPheXtcb5nyg=;
 b=b7FgZ5tODXorjjwgImOSbf8W/pDixmeTH6GL6wMbwhkj0B2vvyqrEgC7b1bghHM1GlNJDXgNNvEMMKtHWT3UKFsA4FTYA0ysS2XPAVqwsFJz9iUncF6z1dEDocFBn8PxaXzRI0px5UKg+aRjGEPR/ZMNbU/zI/MPfyTlarTezTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1370.namprd21.prod.outlook.com (2603:10b6:5:16b::28)
 by DM6PR21MB1180.namprd21.prod.outlook.com (2603:10b6:5:161::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4; Mon, 2 May
 2022 16:37:07 +0000
Received: from DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372]) by DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372%4]) with mapi id 15.20.5250.004; Mon, 2 May 2022
 16:37:07 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, vkuznets@redhat.com, decui@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jejb@linux.ibm.com, martin.petersen@oracle.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 4/4] drm/hyperv: Remove support for Hyper-V 2008 and
 2008R2/Win7
Date: Mon,  2 May 2022 09:36:31 -0700
Message-Id: <1651509391-2058-5-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To DM6PR21MB1370.namprd21.prod.outlook.com
 (2603:10b6:5:16b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1684c8c-944d-4e0a-6444-08da2c59ff79
X-MS-TrafficTypeDiagnostic: DM6PR21MB1180:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR21MB1180E39CED978D6542A63E95D7C19@DM6PR21MB1180.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4pTyf8BzTuf4lgsgVJmsZzV1m06ZP0ZdtesfJjVp1HWkhK+FSmUfu1kIg2IT2e9IBEpyrvQ/Zh0Ar6ym09LVPDB3ePGmkX/xw4+doYYwVm2NiDtd25NpxTOmRgzncwuDA213QMhcBHZTiBc/LIwWLhyaq54619tDsKAMFQYT0a+dCgwqweRk4x/CNrCpVWQb8c4+AJ/rAV9ZvD+fi/PMeFQ8i17bW+O34VpmtbYDkhi6U/NYBtvMI3L3wsjkPD3GBO4qJ9fcD2xKSBqsrxl6GDirF+PUhDFkK//ZF5IM5MuMPzE+Le/KnYzSYf1fp6F0IujIO2pKnTdkramAoZT07kc0PKJhJ2KUYun9Hb+TdcPngtihrRyW4b+owdn2UQey8L+i8NCJyX2JbeQdKbyNpquwv4OC7pwaGVDDfQCXE8UDrmnvzJWClbMzHZaObLp55kJ41DVFkMyzYQDSghyp33DI1YNsE+I6lQsTuxz4bhmKSTN8PLcKaD4iHV95dGKZcCVQU4MmKYEhiv6cWjjVRvgbiYX2XGyHNx1nMm7J2dn+vGEnDLO9Hd8muNZSQWa94ahJ369FWp+OeydDlX6PXkGFRGh3j77zTX/p2jmfjMh1ETlrjUBNbTvgExyxRclsZEGUA6n5BRAI5kH4mJmGPYJTQ4RLBJ/xwZxUHUxzxiNnDkQtu8fwS9L7PEViw3oZyGsiehENoyVb1MD8WM3Y6bPLnwo08I3qaUDgC8/DdOmkJlYxYgoUlt/88uzRTDcViP1DvtAgd/DFU8gifqU2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1370.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(7416002)(10290500003)(66946007)(6486002)(66556008)(66476007)(2616005)(107886003)(6512007)(26005)(921005)(5660300002)(6506007)(83380400001)(508600001)(82960400001)(86362001)(6666004)(316002)(8936002)(38350700002)(38100700002)(186003)(52116002)(4326008)(36756003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQfFLCwxFkW77JGzTBl0d88VVAFHRINR1oXNL0fgV1eanIgaLCi+qirYUu5T?=
 =?us-ascii?Q?ryHluB20wy1ctFAJpx2llZP/pgM0GCr4iNVmEr9o/VoflAucBx/qin8IHBJP?=
 =?us-ascii?Q?9MhDQv3xEaT+PqxNF0myTyFsgxzYkRrPwTikj83QuzkyzEHp1MDMeAe5xs4R?=
 =?us-ascii?Q?oMFKrfQdhy/8BGU4Cwjoygb+SiPrCXRjbL3bwM1pvilPpeUe/T620gKAru6f?=
 =?us-ascii?Q?/cLA/JsBTey02tSgA8AsRc7wrW+gdJyM8H1OrI/Jrf94h4DDveSBA6hWBnLt?=
 =?us-ascii?Q?Pvvl6SZyYGcdP62obDKKIPGMSAT8dOhF8TQRak3M6oPsPKuLCljVCSE95Tkh?=
 =?us-ascii?Q?85knlKYKQi6W5gkVYC6rOSBpXVKlBX4gAHKLsuKthzirIDB+HAefTCJ2fDVO?=
 =?us-ascii?Q?pnnncVBRE/yqFvuel71g4zbRWNfV51L6VBsgrSAOdXEJ7m1yuTMrH4h/7aG3?=
 =?us-ascii?Q?A8W46EtG9OXKVIdYTjYsbJWPjZ/hPD43bmpIWDF2GdhtKrcR4lNR3Mc6iej0?=
 =?us-ascii?Q?re1+gCkxarTDlZIrmgJJfn8fx8oPQjvv0GNHMVMVJLi7NhyGHGulmpioC9PK?=
 =?us-ascii?Q?C1Zr2uRNmqHi+WgonNyQc7W9qGU4/vaT5dbaRMvRRLH3Z/iOYc+cuyhtmIs5?=
 =?us-ascii?Q?scfZgtqlm5DdsHugNLZWl5GnLIj0AcIzIUAhED88L/b1UqQvugZdeZMs8u1W?=
 =?us-ascii?Q?gapdwMu7PWAteKhmtGs6xVgfXmXV/hzBi8S97mCH/eFufOYJTq/rqx+2RLYp?=
 =?us-ascii?Q?9b+5zUPPkOWLX6ml9AwUGgv8bUpu2pZfBuWFRwRz+BMP5qLGJ8p75V5byN7h?=
 =?us-ascii?Q?1kJ9fpbQYv8QuUlQwDcHhMcWJQ7lr28HLDjtqF9jD+E7TWeqSK2ntQ5kaH5f?=
 =?us-ascii?Q?3Fu95Hvwzk6+k1QESqsMmtYQQE4xxgXNCy+8w5HWsvPKLoGYtxIJNFRgz8+l?=
 =?us-ascii?Q?heSfX9FAjypfCeGuin6xiNYACdN8AQdQvw8FFzYQTJcvMVQyqQjWtF+7aJLW?=
 =?us-ascii?Q?wTz8JLx8VUyHGJ8/kq33xbQW6qofofdQbQYEGlAN2GZ5VbVL3VWI9GvZun8c?=
 =?us-ascii?Q?pLtvyQzITiwvQ9mb43Lvmi1qw4cXBdhPRXvesJUILQHzxwxEasJBFp3Iq0Xb?=
 =?us-ascii?Q?ePbc1l2ELzMFwOm2Z50M5E/PPgh45bvScfjW0bAB+P8xMprVjPnhjuu3bivb?=
 =?us-ascii?Q?cfkf/mC1pb/jVtqdRsMOvn1JUcaPO9fWm4TWBkQTykiReizQFnB2DCp8La4F?=
 =?us-ascii?Q?UM6OP+B0aQoXVAo77A023nAcEQ9OP0kSKuYHLrL0agRQgssBQ11BD6T00ZL0?=
 =?us-ascii?Q?TO7svVbiQVfTa2P+TRydsgQwZXvKLKnrpjtfPmR9R3g/cpqgUveuhSw1WBPL?=
 =?us-ascii?Q?KglI3B3Yb2EGWixAgYEPtFRqHs9gXg76aZO/mKkUlDEJZrhi/ihaToJ4Bwli?=
 =?us-ascii?Q?YXOWqw330Q6bjNu0aCvptvhPBYEiMFHWAHo7x/EUMNLt+VVXUsirdBvZoA27?=
 =?us-ascii?Q?aykMpR4kX1vkMCdnq0IGs2f97Sifs7zdx21bthMlk3UeZ8CvQGT4fJhTaw9+?=
 =?us-ascii?Q?7x7JorSuF2CjglInCEmcii3abP+K4r66QuCC0UjjBCgtaFughXUCytPUI7Hp?=
 =?us-ascii?Q?zr4eZCpbtBShPcszrJG5jBhNOQ0RnLfzsFgAmtAePEee1rIUqWo8bGWWxV8n?=
 =?us-ascii?Q?/tJzl+nNpiYdQuCNu02kvLjXi3AnNmN1XHpysfJsGjtHUs/M/F+NFBFx6vWU?=
 =?us-ascii?Q?ilNlaL/gra2juxFZ3zHnQD1g/C0gEZY=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1684c8c-944d-4e0a-6444-08da2c59ff79
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:37:07.7353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UtRDPArWZI/KLjZXUlPUZJJ+16zbSJUY93iF+cjQpU28y4ixFVzvXHf6CPNZAV3qDsF4joL7bAUIWWD1PX4eg==
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

The DRM Hyper-V driver has special case code for running on the first
released versions of Hyper-V: 2008 and 2008 R2/Windows 7.  These versions
are now out of support (except for extended security updates) and lack
support for performance features that are needed for effective production
usage of Linux guests.

The negotiation of the VMbus protocol versions required by these old
Hyper-V versions has been removed from the VMbus driver.  So now remove
the handling of these VMbus protocol versions from the DRM Hyper-V
driver.

Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index c0155c6..76a182a 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -18,16 +18,16 @@
 #define SYNTHVID_VERSION(major, minor) ((minor) << 16 | (major))
 #define SYNTHVID_VER_GET_MAJOR(ver) (ver & 0x0000ffff)
 #define SYNTHVID_VER_GET_MINOR(ver) ((ver & 0xffff0000) >> 16)
+
+/* Support for VERSION_WIN7 is removed. #define is retained for reference. */
 #define SYNTHVID_VERSION_WIN7 SYNTHVID_VERSION(3, 0)
 #define SYNTHVID_VERSION_WIN8 SYNTHVID_VERSION(3, 2)
 #define SYNTHVID_VERSION_WIN10 SYNTHVID_VERSION(3, 5)
 
-#define SYNTHVID_DEPTH_WIN7 16
 #define SYNTHVID_DEPTH_WIN8 32
-#define SYNTHVID_FB_SIZE_WIN7 (4 * 1024 * 1024)
+#define SYNTHVID_WIDTH_WIN8 1600
+#define SYNTHVID_HEIGHT_WIN8 1200
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
-#define SYNTHVID_WIDTH_MAX_WIN7 1600
-#define SYNTHVID_HEIGHT_MAX_WIN7 1200
 
 enum pipe_msg_type {
 	PIPE_MSG_INVALID,
@@ -496,12 +496,6 @@ int hyperv_connect_vsp(struct hv_device *hdev)
 	case VERSION_WIN8:
 	case VERSION_WIN8_1:
 		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN8);
-		if (!ret)
-			break;
-		fallthrough;
-	case VERSION_WS2008:
-	case VERSION_WIN7:
-		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN7);
 		break;
 	default:
 		ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
@@ -513,18 +507,15 @@ int hyperv_connect_vsp(struct hv_device *hdev)
 		goto error;
 	}
 
-	if (hv->synthvid_version == SYNTHVID_VERSION_WIN7)
-		hv->screen_depth = SYNTHVID_DEPTH_WIN7;
-	else
-		hv->screen_depth = SYNTHVID_DEPTH_WIN8;
+	hv->screen_depth = SYNTHVID_DEPTH_WIN8;
 
 	if (hyperv_version_ge(hv->synthvid_version, SYNTHVID_VERSION_WIN10)) {
 		ret = hyperv_get_supported_resolution(hdev);
 		if (ret)
 			drm_err(dev, "Failed to get supported resolution from host, use default\n");
 	} else {
-		hv->screen_width_max = SYNTHVID_WIDTH_MAX_WIN7;
-		hv->screen_height_max = SYNTHVID_HEIGHT_MAX_WIN7;
+		hv->screen_width_max = SYNTHVID_WIDTH_WIN8;
+		hv->screen_height_max = SYNTHVID_HEIGHT_WIN8;
 	}
 
 	hv->mmio_megabytes = hdev->channel->offermsg.offer.mmio_megabytes;
-- 
1.8.3.1

