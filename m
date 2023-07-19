Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D4759BCB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 19:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8010E4D8;
	Wed, 19 Jul 2023 17:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565E910E104
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJF7p/qcC2A08DCPV44bgEqyillaO4O9Viug4adnyPQMEXdjSrfn7G5KIMurJpy1uhelRPQXXT+CsxlVozOkeCQDflRjVhD1YXAjqETUOmpBsU/4RyPUn+7fcBNn/tHbSdmUCygQNuNQ1R+lw0yZP/q91nAbqRw9cA6NSeqGlkZatWzumpVG/wuDUmRHKfQ2gUZDEm5cwA/i77OV3m3f4hku2XAHOdPh+EuDePlCj7MKqPBm5N1C3J853sw9gYj4W9R77NZyOCLEZ4soIV+JelUZz3m2yVkfrbs44UjCxI6V9eHMbJ4Jn0VUXpAMWYwLOdPotVVhLXPM1LwEOaa5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a65FOdpVgbakUi0u1iwXm9h13oJXjuX09zyOYOI5Efk=;
 b=CCuzzmTkNe/9sGBFQVpJdSQFiMstTxayw6tEQRtm6+KEFs8huo/h3Gs5KCuzDJYAxEDX9V2ogYGbpa5MhZyeguDI2gZJo9JhxNR78XIq/DQnJ4G6ARYQtG6VDOo6JzW5A0whdn4Eo65StAyxyRNEAvCJgc49Ez0xFUbf9Ov5WGmvfcuuWX+f0AejuxkT9Urc5F06N59px1FH3JTpYulpgQgUqZkY0ddb5Ano8fVOlh0v2hw9pFvy38TgPSPXyuki8Un/ZNjwxu5SJuhTz0u5W/XEOvYtymAcZvldTQ93X6HbsFaBZOd+J7vlOvPDtanmg+/Ddv8UgpXrR2BEBBavvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a65FOdpVgbakUi0u1iwXm9h13oJXjuX09zyOYOI5Efk=;
 b=A8o7Eu0ciFrISfy8Lbs9GK24XKojtoleZlojtOpg1lGUADCqDNfjml+4Vtamt4DgQGb88+vFcyTCWNxNxos77obQScH7lTDcUgr5PHXzMYgVnQqvcO2aaJmAVPpMVN+nwmyMAwWN1sYEtFzQp9WEsekRjh3FkY4t2cSCZTxD2CCNMGCg7nu00G1lVkcAyoEdC99E2E3e4P0bUodhsYibdxkz3fexLsBB66amdog6F1TeOgu32eHnd+HH2EmEqXAiBjtpYnCUVd6kCelDHyqXDcAmYnvYHFThtdfG+yOIDjkY0Pwj1LAtuOxAKorDoou2Am+QeXQd7tRKYPbbzdWCkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 17:05:09 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 17:05:09 +0000
Message-ID: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
Date: Wed, 19 Jul 2023 10:05:06 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:5::15) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: bba1d19b-57a4-4fb9-40e2-08db887a4ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qt1s60Ir4ueDKAddPnD619bPK6dMFiQigodNfMX5FxPk9e8ZTkrau9gIhk3t868epnxL+LQUJGJdoJy3NYJ7GASaI5wlKXph92pKi9Eu+ttXhL4DW3GaFyaoeJU708Iov9vj/qBUjjs0Ozvlfux3Xptb0NhIRLHs8JTei9Petl+fXlZHvEwtyKszbu5VgHkdXMUdl8B6H7FMjNV/tvKOFGNtYVS8D0tucyBZXdbfJF1uQ5H8eeW6ik7mgHjBOjaJCeVfDNPd9sz7ZXn51R69wWNvHI5df4uN0muvZh0x0xtnwrSJBreFLavbMFaGuWX17B9oRzgdMOvzHINWMjP/casdgKXx0jNEuRCKbvM5Wt5/mX6yxLv38y4LYt9MbWE1z5COKzAqSNM5r/lwxdcO2ds5tN2zM21hwhgAXjv3Urpp88FC6wRSir/gkbpZlIXNGQBoTAae3WPmnOv8mf25rW+cGwPH3+rFIF32LdGdDsk6eIzRKm1Ly94V8d9pGLbfJmkvOv71BTfCPIz8Z+GY97XYruSA2Vgw4Ml4nf7GLdkqAIU5sy6x6rUnQ22+DtadzP59Mv6F6HPLwM7WYSQohNxlngQM4LaLOqJEZtNiXbvJYdxjLek5U3ef4t0c3qb7VCmpwCHVs6/Ws1tnw2YNjIwI7njHPWsqYYS3JefzgQB5T25OU9AhIUpsd6jah6tC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(31686004)(478600001)(6666004)(6486002)(54906003)(2616005)(83380400001)(86362001)(36756003)(186003)(2906002)(966005)(6506007)(26005)(107886003)(31696002)(6512007)(66946007)(6916009)(38100700002)(4326008)(316002)(41300700001)(66476007)(5660300002)(66556008)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEpxOEZ6T1QzMzJQclp0NG1oeEVXV29KQzBsdGtzRWVyaGxhVWRKTlFhZ0xE?=
 =?utf-8?B?eFhqYmNHbkRqVTZteFA3dDJTdENKdnVvUjdOQlA5L2tBYXBEeXFqSGFFUjNx?=
 =?utf-8?B?WXloQ2piTDBpZFpIaXRCMUM0YU5EdStlZCt5bEt1dFArWnZaS0VSRk1xc2tm?=
 =?utf-8?B?RmJ3cFNNOUJnRXNsVFhKbFNoRktIQWNUMzJMdnJYc0xqeUVSNFNrM3pPYnBT?=
 =?utf-8?B?NWc0SzlhakRhVE9meWt1bnl2QjVqM1lsaUY0cGpMai9yc3N4N25KaW9wT1Bs?=
 =?utf-8?B?cWd1RUhkbWNLRTlZME9FS1ZSNElSZWltbHVDbUl0a3hja1VFYVRUWXByU1dt?=
 =?utf-8?B?RGhLQlg3U3Y2dUlIeVQxY0R0WHkwRmVFdndvQlBOT01zMVVRR1Ard2I5M09Q?=
 =?utf-8?B?QzI5UkZyN1VITWRaNWpCNFV0aWFkUlVWYjVxZEVVSXhpLzRBamMvNDRVdjli?=
 =?utf-8?B?bWVVMWtmU1oySGJqS2RKd1pudjdiMSs5UGVMWW4rcWx4OHQ3a2RZUk45UkhE?=
 =?utf-8?B?MlZqaU5LdmpzWW01QUpObmhrNUxqeGpwbmNWRVVCQUozcGErNzBud1lKeWlK?=
 =?utf-8?B?cHpvYjJBZXNuMVN1Q0h4ZVNCanNjWlI2TzZYNlNIQ3YxbHhadVZZOHhSbzZz?=
 =?utf-8?B?U1VYUk9XSTBwVm85SThPUGs3ejZ5TnhjaUFhdTRyRnBYbzlrR1cwNnNvc3pt?=
 =?utf-8?B?UXRGUXk2bW1XMVZ3eFBUQ1JWWnc1Wk92aW5IZGRHanE2WG42elJ3NzRQc0hV?=
 =?utf-8?B?RHlBUytuem5VcUVqTEtmWHhscHUvNlk5eXgrTkp2ckpJR1NEa0ZUVDBySE9u?=
 =?utf-8?B?NW9UWW12Z2ZaaXBURkhjOWIxZGEvbHROMmFoUkZrMFE0VjVkRHI1aFBFcDRz?=
 =?utf-8?B?Sjh6TmJucGZCN0J2R0lqU2o0dU5iUkYycWN4a08wWnJxOFc3YmYwUFNZV2gy?=
 =?utf-8?B?ZlRlQ25CZ2lnWHViVVpua21TZVBCZ2R2bmcyd01VSTJ4bGVNMGNsZWQzb1ZH?=
 =?utf-8?B?Z0ZuTGlzZmV5djRjblNCWXA0QXFmQ1U1RDJEQU1nRC92TW1MSmhER3ZoUjE1?=
 =?utf-8?B?Tm1PWjlwa0Vudys3WHJ1UHJ5YjlaVzFpOHdLRUoyVVA4TjY3KzZYOFhEajFB?=
 =?utf-8?B?TmtLb2JZOEE5L2JVbytqam8vTTRKNExVV1FweU5DTVNIN3IyUHYvT0tYd3lK?=
 =?utf-8?B?NWRYci9vWU00YUl0K3I1QTNYYklwNkJyYUs4Vy8raWFaUERtNUZVUUhuY25W?=
 =?utf-8?B?NWFmWkJnTUVtSU9zZzlKcmVDcTZrcDF3Uy9GdWRwK2lTOW9HNWpsNCs4cmc1?=
 =?utf-8?B?bklBN1FkSCtiVmx6VmpWdW53MVI2T2lwcXVHVWFud1cyalNQUm9wdnE1S3Jr?=
 =?utf-8?B?NXFiMnJVWkxHaTJUYk1QanlKeGVDNjR5WlRkQi9hekRYNHFNSngxZ1JzMWp4?=
 =?utf-8?B?bDNyd0QzTlNEcFI1MytsYitwd3BOYWE2UjdMNmUvRWc5TndNSm8rMUlocTdm?=
 =?utf-8?B?TVlpTDAvdEtSa3NNMGM0dVl4SGFaeFVlc1dYUGdXbE5UbVI0ZHkvVTFGRlNK?=
 =?utf-8?B?KzlXN2I3dE1sSGVDaVM3eWZ0clN6VEZkQlFIeTIvVmlza3hucGtBRVFJSEs5?=
 =?utf-8?B?bnphRk90N1pkSGN4V1BEaUhicVpRZmhyQ1REdXNGNWgwanVRS0I5b21lU2R4?=
 =?utf-8?B?QWFKQzVtN0JFWnNmTTRrcmZrMzNNMGw3WEw2bDczUmJCZ0RIWTR0YzlPb2VL?=
 =?utf-8?B?dkJkMnpDSG1kV3Q1cjZRVVVmbVVSK3BHY205MmZNV3VVUCtOc2kxUDFkMkJI?=
 =?utf-8?B?UnNENXJTekc2UnRMRjlBWmU0QXpWalQ4T0JweENxaE4xa2MvNGZpSjRwMXc2?=
 =?utf-8?B?Z0p6RHMrdWl5VjNPQXFvV0MvT29YRzljSDZKNjJ0OGZITGNPdGVwdHBXYlhp?=
 =?utf-8?B?SEZlemJhSnpOL2JKZ29yYTRlMEU2QUprV3JkUG55cjVrekljNWE5c0lyTmFW?=
 =?utf-8?B?MFR5cmF5eExROVdsYVZBOTB1Z2t1aWRyazkwaDI1UHowYzd2a0lteWlvMHVK?=
 =?utf-8?B?S2hyZEVIVTdwamZCcHAySXpyMUx1Z0IvYkMxSmJ2alJleGVZVTdvczBpOWlL?=
 =?utf-8?Q?dxuCNV3DRnWGSrm6kKpFiClkk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba1d19b-57a4-4fb9-40e2-08db887a4ead
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 17:05:09.2490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTfnbSwzvVRpB0WSioB8iZ+2yOMtLHPreKZrhLDhNFbauaS9Jygd0Ogwob5NC9m7/spgG0esv4cRd09hDSbrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These new ioctls perform a task similar to
DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD/FD_TO_HANDLE with the
IMPORT/EXPORT_SYNC_FILE flag set, except that they allow specifying the
timeline point to import or export the fence to or from on a timeline
syncobj.

This eliminates the need to use a temporary binary syncobj along with
DRM_IOCTL_SYNCOBJ_TRANSFER to achieve such a thing, which is the
technique userspace has had to employ up to this point. While that does
work, it is rather awkward from the programmer's perspective.  Since DRM
syncobjs have been proposed as the basis for display server explicit
synchronization protocols, e.g. [1] and [2], providing a more
streamlined interface now seems worthwhile.

[1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/90
[2] https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967

Accompanying userspace patches...
IGT: https://gitlab.freedesktop.org/ekurzinger/igt-gpu-tools/-/commit/241e7f379aeaa9b22a32277e77ad4011c8717a57
libdrm: https://gitlab.freedesktop.org/ekurzinger/drm/-/commit/b3961a592fc6f8b05f7e3a12413fb58eca2dbfa2

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  4 +++
 drivers/gpu/drm/drm_syncobj.c  | 60 ++++++++++++++++++++++++++++++----
 include/uapi/drm/drm.h         |  9 +++++
 4 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index d7e023bbb0d5..64a28ed26a16 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -253,6 +253,10 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_private);
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private);
+int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_private);
+int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_private);
 
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7c9d66ee917d..0344e8e447bc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -710,6 +710,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 		      DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
 		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE, drm_syncobj_import_sync_file_ioctl,
+		      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE, drm_syncobj_export_sync_file_ioctl,
+		      DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..bf0c1eae353a 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -181,6 +181,13 @@
  * Note that if you want to transfer a struct &dma_fence_chain from a given
  * point on a timeline syncobj from/into a binary syncobj, you can use the
  * point 0 to mean take/replace the fence in the syncobj.
+ *
+ * &DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE and &DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE
+ * let the client import or export the struct &dma_fence_chain of a syncobj
+ * at a particular timeline point from or to a sync file.
+ * These behave similarly to &DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE
+ * and &DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE described above, except
+ * that they accommodate timeline syncobjs in addition to binary syncobjs.
  */
 
 #include <linux/anon_inodes.h>
@@ -682,10 +689,11 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 }
 
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
-					      int fd, int handle)
+					      int fd, u64 point, int handle)
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
@@ -696,14 +704,23 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 		return -ENOENT;
 	}
 
-	drm_syncobj_replace_fence(syncobj, fence);
+	if (point == 0) {
+		drm_syncobj_replace_fence(syncobj, fence);
+	} else {
+		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+		if (chain) {
+			drm_syncobj_add_point(syncobj, chain, fence, point);
+		} else {
+			ret = -ENOMEM;
+		}
+	}
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
-	return 0;
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-					int handle, int *p_fd)
+					int handle, u64 point, int *p_fd)
 {
 	int ret;
 	struct dma_fence *fence;
@@ -713,7 +730,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -823,7 +840,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    &args->fd);
+						    0 /* binary */, &args->fd);
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
@@ -848,6 +865,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
+							  0 /* binary */,
 							  args->handle);
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
@@ -1515,3 +1533,33 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_private)
+{
+	struct drm_syncobj_sync_file *args = data;
+
+	if (!drm_core_check_feature(dev, args->point == 0 ?
+				    DRIVER_SYNCOBJ :
+				    DRIVER_SYNCOBJ_TIMELINE))
+		return -EOPNOTSUPP;
+
+	return drm_syncobj_import_sync_file_fence(file_private,
+						  args->fd,
+						  args->point,
+						  args->handle);
+}
+
+int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *data,
+				       struct drm_file *file_private)
+{
+	struct drm_syncobj_sync_file *args = data;
+
+	if (!drm_core_check_feature(dev, args->point == 0 ?
+				    DRIVER_SYNCOBJ :
+				    DRIVER_SYNCOBJ_TIMELINE))
+		return -EOPNOTSUPP;
+
+	return drm_syncobj_export_sync_file(file_private, args->handle,
+					    args->point, &args->fd);
+}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index a87bbbbca2d4..e1f045011c22 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -884,6 +884,12 @@ struct drm_syncobj_transfer {
 	__u32 pad;
 };
 
+struct drm_syncobj_sync_file {
+	__u32 handle;
+	__u32 fd;
+	__u64 point;
+};
+
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
@@ -1139,6 +1145,9 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE	DRM_IOWR(0xCE, struct drm_syncobj_sync_file)
+#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE	DRM_IOWR(0xCF, struct drm_syncobj_sync_file)
+
 /**
  * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
  *
-- 
2.41.0


