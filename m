Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D751757E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7E810EFFC;
	Mon,  2 May 2022 17:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021023.outbound.protection.outlook.com [52.101.62.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AB310EFFC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXeGM/Yn3vTkGXEVZbgoDbXVS453XKfofvLl0ME6CjFWshperRku/Gymuk1OLfJ2vjvE2n4JGUAXRMcXL/8k47osJoYLHpWvOYdRi8EZxx0MnxkyxmqeaXR9ckDg5R0J0In3UF4iiPRiw6xvxuC62rpEmxxcImKAchLmI2R1Q4rKQZPuLqHUr2oVP7weyozrBCxvIbpwdL0o8GGZsVDgqM9DAcQ3e+rz9a9fIvPVSFPw4fLCrav8LLopB0dFlFICH99rCRDT7w7N2FYYMEVvEkEHTtC+jwftoWAffMy2IP582FrLY+NHcW7gRQU36xH/E21as8PbHHnaETiNtaD0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytivPx2Fi0zh0pzgjLEVsEvdq2udsv2fA2ABb9V+3gg=;
 b=dvTcIO8rd9GKEXHDn9ofFNScctEl+WtzgU8S95+YDB9ktdYjkNvJgSrONT6WwAIDuI/20SqZrtJiDcwAyymB5carPKE4rdOMvPfYT8iy3q40qpnChwWBmNvtv2kknajKeehMdXP/5YQi5Wl/avvWk9mypBrSJyZVjYxLOvggRqz2gWt7GQzo9A/XNl2Y3q0lunrTKfEhQt/YQKJ+zqildPByqt1mNMRzvzbWGKVVgP+8NIMQuJIx8g1GRdZHPt/RUMZqmWZcngFS0oQflWZtrv74ll69bY5qwU7qSbfcFXPVVNDFrgLbzrAKjOGD6FsmTDZnZU4gjy2Pk4tp+alQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytivPx2Fi0zh0pzgjLEVsEvdq2udsv2fA2ABb9V+3gg=;
 b=SeJ8197/258+ocVAEyT8vXZUqOu1OcYDazXcTPC7Pwy8YYTMJXpP+fENjZgbtpFaTV2Q225wmgArcBHO9W08U8sVYK0D4JFxYdmteKCSqrd1WHD3eFycPrgLAsfDSUG1Gd4PbGRenOhZetjhZzdRb3dzm0fe31dbuVA6EUIZeOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1370.namprd21.prod.outlook.com (2603:10b6:5:16b::28)
 by DM6PR21MB1180.namprd21.prod.outlook.com (2603:10b6:5:161::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4; Mon, 2 May
 2022 16:37:05 +0000
Received: from DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372]) by DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372%4]) with mapi id 15.20.5250.004; Mon, 2 May 2022
 16:37:05 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, vkuznets@redhat.com, decui@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jejb@linux.ibm.com, martin.petersen@oracle.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 2/4] scsi: storvsc: Remove support for Hyper-V 2008 and
 2008R2/Win7
Date: Mon,  2 May 2022 09:36:29 -0700
Message-Id: <1651509391-2058-3-git-send-email-mikelley@microsoft.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3c6e24e8-c2d8-489e-304a-08da2c59fdd4
X-MS-TrafficTypeDiagnostic: DM6PR21MB1180:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR21MB11809B154B4ED923D918FF92D7C19@DM6PR21MB1180.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTvmrdHQGx3RMtd4HtuYkPx5sXDZ1Qaq+SD+c94b7FWIhailGpaFV48bR8M9354B8VdXVIT0aRmQp7rOwQhd0hlcOYzD+mtV6upDpOf5MkgR9B3L5HKW8KcbwRM+/0iVDqHA+FPFOzJDIgI1c0v3cRwGZTLv4BMccMKX4BxC2WhRGIO9OeceM7Y/7wgRdYnQKbP9IgZmeQ49JE5hglokcM3qx1abr6vHs0YntHJl60bejyFkXASAcqXM2l0RuytiimzM+fQ/RQbGUzTC6RDEZHliSyNsr743n6RVqRJPb93ojN7KTaCEnTIoNbqun/cK25uMltg5CtEST23YkYVim27rUvAyJ4yADm6vFB5SBTjRXFrqCAt5wA90aSx9Yc/+xtmpG7YLoD97jtm0Y8ugV8ASXX43jFaVMKiBOIUJM8gFQrCPa8k/1mBF1vXORS1nEwvoS3/ZOYO3213ocV0xPuO9FB2OfRLHxCoL+QTtdg6CCDJ+zdz0/T8HQ0R9MPOVnox/FVrt7xn2RLnrkBHgTl10InKBtsbEhGYzDqQdjj6diOLsPtH3a/n8jK2jZljkKAtOc6L5fIYEg/PsfOb+W55YR26NEOVTHxW6RASgDEjGANo65HmnNx/q+PHQBjv/h8+nYmlEhTk3oi3BSfpe6Sjb5P8YvehsUCQGNWy2W5LufHTik/F6mNghJcrMqbZ6chZp9ZUSAJMAGZy3E4Vz08St1KHJ3akFv7cxJ0NRaK2RfOXV9X1O//AJHwejGglCK6CrUDnSxTyFL/wFNIi3Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1370.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(7416002)(10290500003)(66946007)(6486002)(66556008)(66476007)(2616005)(107886003)(6512007)(26005)(921005)(5660300002)(6506007)(83380400001)(508600001)(82960400001)(86362001)(6666004)(316002)(8936002)(38350700002)(38100700002)(186003)(52116002)(4326008)(36756003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lWqkYgYyAUvuOCS9EBSIqtK2nYtEmnrzJmq/gHmhNP6uO/bgxzQJIUtaay/s?=
 =?us-ascii?Q?/fbUdOICFmLKS4po6ftYGXfj7iHjtmdinW07CV3XOxLWS6XT67ASGeaiDa9s?=
 =?us-ascii?Q?vzTM0RbXqphYefnU0SFC4oF9bKOt5fbngf+oq4Khku8WN9nsHkf+hKFtcdho?=
 =?us-ascii?Q?ESlK6lm7d3UL7h7JJ6nIVUtzR0wBeD8lD7hFTAlCd3xaEB8F/ehjBPNSkPk9?=
 =?us-ascii?Q?hV8lAB9o7PgjyqTK9L/3y8O6TNeGjCxuG4mHORvIDFHlbPK6BBUEl8Z7S++E?=
 =?us-ascii?Q?hGuUrfNaHYRNLTyZOVV7f4JsDJSLLLuE4QBHmNzP4i++gmazcwt24qxA5ZoX?=
 =?us-ascii?Q?ORxRUM/Uho76Bgdb4G2CuAJw443vdod1UWLYDQy27vC2NBlH6ZG0MTsO5obZ?=
 =?us-ascii?Q?9HanZpIqz93pd++xR85Pu0cpjfjKB3Ih3uc3/7a7K96vLzkWFFDJMrFFQx7u?=
 =?us-ascii?Q?A+vJfH/gkSWk9ndismBksTajPG2cVfnVuNNlKeoSF9W0cbnpKuqlfpF9tS5E?=
 =?us-ascii?Q?T27hX+bt5xlrsrOZ9oVeySGrx0xyEUo3i8Cim59Y1XiGymREKdvUnL8HF8hl?=
 =?us-ascii?Q?htFNAPGg9+NM+9WAHsqiEdKqfPlGYxSgsI8nV+c9AXy4P59ZYA79A+Zm+DVV?=
 =?us-ascii?Q?duZcgp/JPIa6FNe5L3MRKtwdqQWAZvR9+R1pcmTHFOutjEe/qtxjEL6ZPvW9?=
 =?us-ascii?Q?iJ7dt5gzzJbx7mi/t55ah043yKQKdegx2AQNoEYHJ5gtDX7WC4AXqC2KWP3U?=
 =?us-ascii?Q?jXnl5E9LnkUz0hEJYZMoPa6iDDw6NPyC7giIC1IuhUvX+jLipt0dp+cZIUYZ?=
 =?us-ascii?Q?kBTK8uHac+8YFtraNNqgmFYpyT/PzSF1gjsV8xtkjRItVHOTiTP4s0hp8BB3?=
 =?us-ascii?Q?MKwOV9/K+O8R+L7L2x6jKkkv55GiGyGfAvZ+mhKgrTMzSvSGDkY9Gs+Sv3ss?=
 =?us-ascii?Q?OKx3Sl48faLWnIcbbVoj2IwzdaSza0NnzbOuLY26k14JJjgxn433rC+5Cbae?=
 =?us-ascii?Q?GLTg4qNftGPsW/97PLosZi0Xj3Hz2M48bRbOkTTJ5iajom/idMZl+yTi1+w9?=
 =?us-ascii?Q?a84mbrw+haoXwwtCacIg5jSUxIqsd+Ih2rgKrTlFBjN6nCqRozFvTAyVy1xt?=
 =?us-ascii?Q?QHOA6nYAftSZm8ccO0s3W7xMMUcmYpkwxZkU/yoITRFkx291ZSv8HueYXH13?=
 =?us-ascii?Q?JVJiL1ucRWldKV5xgprIj5YSd7G0r1LuXHEQ/kNUBPIpNbcMsM0+atMPSG//?=
 =?us-ascii?Q?oskYCKNJS/6SNFus8VjTrwdXOcHvKqWiB7kPDbjOjpwTXu6hUH4N8z0/ppAR?=
 =?us-ascii?Q?RC2s1L73KF/iUtzhjsYJ694WLqoTIGqZWQyrhAWHQuGVzn+Wf8VsKWJKAFwd?=
 =?us-ascii?Q?3LK/INN57doWDzyNHTOepJ3+I+SJK9inrWoE8+byR1e9d18LyVb8PG+n72rr?=
 =?us-ascii?Q?Lx1dHiBxgqBn+0du9SHq4blgPpSjLprEttN3w2io0MMICYiziR1botTKZ4wU?=
 =?us-ascii?Q?luohHvWOhM+ywgMMvLxF+I2fu+LTF+wHvJnbnbrALGHJpOIJkDZpqSyz4H3L?=
 =?us-ascii?Q?d9xTAmJ5auZsANdI1AMDRLJQa6JIfythvCYBzh5thbGP4mjYFAgaPIbO0MQ7?=
 =?us-ascii?Q?15/RW3r5jGns6oRadjmoPar+14OqePfuma9Tq1N9PmYLtRwti5rV9ytD86O6?=
 =?us-ascii?Q?ebC15KwegYkn/4ZW56ygvKWVK2zCWMvK7ida9kJ9wTxBtmpvIgejMgZRPcpA?=
 =?us-ascii?Q?6+SlSbz0s2xv1r4bCPT/xpjOcGnS6DM=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6e24e8-c2d8-489e-304a-08da2c59fdd4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:37:04.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfNVCpaU+l66aGCc36zamzFKraHVbFxuDEQDiM8tFmNGBuSSZRMgiWaW1UktYjmUsg39h9Rlksd0588MMXFY6A==
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

The storvsc driver has special case code for running on the first released
versions of Hyper-V: 2008 and 2008 R2/Windows 7.  These versions are now
out of support (except for extended security updates) and lack support
for performance features like multiple VMbus channels that are needed for
effective production usage of Linux guests.

The negotiation of the VMbus protocol versions required by these old
Hyper-V versions has been removed from the VMbus driver.  So now remove
the handling of these VMbus protocol versions from the storvsc driver.

Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/scsi/storvsc_drv.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 9a0bba5..5585e9d 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -1966,34 +1966,16 @@ static int storvsc_probe(struct hv_device *device,
 	bool is_fc = ((dev_id->driver_data == SFC_GUID) ? true : false);
 	int target = 0;
 	struct storvsc_device *stor_device;
-	int max_luns_per_target;
-	int max_targets;
-	int max_channels;
 	int max_sub_channels = 0;
 
 	/*
-	 * Based on the windows host we are running on,
-	 * set state to properly communicate with the host.
+	 * We support sub-channels for storage on SCSI and FC controllers.
+	 * The number of sub-channels offerred is based on the number of
+	 * VCPUs in the guest.
 	 */
-
-	if (vmbus_proto_version < VERSION_WIN8) {
-		max_luns_per_target = STORVSC_IDE_MAX_LUNS_PER_TARGET;
-		max_targets = STORVSC_IDE_MAX_TARGETS;
-		max_channels = STORVSC_IDE_MAX_CHANNELS;
-	} else {
-		max_luns_per_target = STORVSC_MAX_LUNS_PER_TARGET;
-		max_targets = STORVSC_MAX_TARGETS;
-		max_channels = STORVSC_MAX_CHANNELS;
-		/*
-		 * On Windows8 and above, we support sub-channels for storage
-		 * on SCSI and FC controllers.
-		 * The number of sub-channels offerred is based on the number of
-		 * VCPUs in the guest.
-		 */
-		if (!dev_is_ide)
-			max_sub_channels =
-				(num_cpus - 1) / storvsc_vcpus_per_sub_channel;
-	}
+	if (!dev_is_ide)
+		max_sub_channels =
+			(num_cpus - 1) / storvsc_vcpus_per_sub_channel;
 
 	scsi_driver.can_queue = max_outstanding_req_per_channel *
 				(max_sub_channels + 1) *
@@ -2046,9 +2028,9 @@ static int storvsc_probe(struct hv_device *device,
 		break;
 
 	case SCSI_GUID:
-		host->max_lun = max_luns_per_target;
-		host->max_id = max_targets;
-		host->max_channel = max_channels - 1;
+		host->max_lun = STORVSC_MAX_LUNS_PER_TARGET;
+		host->max_id = STORVSC_MAX_TARGETS;
+		host->max_channel = STORVSC_MAX_CHANNELS - 1;
 		break;
 
 	default:
-- 
1.8.3.1

