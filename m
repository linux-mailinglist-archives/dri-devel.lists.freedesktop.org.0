Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6D75CF61
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F3610E6CB;
	Fri, 21 Jul 2023 16:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216710E6CB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 16:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpHb+vXrgI1Vyf/NjDaqSHSYdQwRizZrvl3GmuTZgKPl3B5wiiKB0RZQc+isYMjOCQf3JqP4yClxTEd/ye1CIwD4yxhheldVMxawPD4U87YyO6Cl5WqGegtwEK6E5yplHCBhkcMaq2i8v5JoAammstn88V2I4Nt3/AxOHD7ELd4ggVDX1RFhAmCaQHcrGwqmTXAyafVgxdHdNCKd6lMVRjHwE8HT0YtmIWgeQx4O/FXJo3755xWSNONNjAvRe8hCrY4fieEtMP5wy8Wb4K7GMJarbA7dzebULfXJrHrgPCg69n/5kja9pvWMdBZz8YnuAhvt5r1bbS7Nu9RyhAv+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFEp2thsve45V1dhLVXGseNqBe4WUz3kwchcJjFz+oY=;
 b=TUhlA+L0um1+kVW76LGJyVjTwt6qe17z0r0ZaG7h1qUMVK21XnV9JE2hnaItrTybDPfo3vz/vaUtYRLYXSRuoFc0QmSJxcH03U/DLSojTi4Yo0tFOO2+X6PueNYKC47Ln2u0ehwg2WsiYC+BzEFBUk7qhhu0I47tYp+XCzvuaHC9/URKd28HpaYpzS/J+P69Q04meQuCaBX2VhRjYcvF/Gbjs4Ppt6ywizgq+qUPl38+zrlLa8ps5755aZmQgudXleVXEMmYkVMBqQ9iTRTeBBpX11cgR/zVqruqWcNOXuPRFiJIukFHlsUfY2fXCVrpRKQZwDd+SE7Hk0AMzYNA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFEp2thsve45V1dhLVXGseNqBe4WUz3kwchcJjFz+oY=;
 b=IkYmIq/rV/QYJsEwEz32yRqwG3tmgu90LtVJO94VNXP+QnTy3i9QePP9sLjVRO6v7wpfSNUMQ909wgSm0JInvMdoVLxd2tIx5asVvbdB4lVroioKN/qxCO7Iz9bjodOy/+aSwblaWoEXPfPI3Ici2XqHcXW0D8C2R7KXp1zKtaQF7kL5a1f/pROamiA3L7GxGD0YvH//UU0l9gf4mB2d5husq3sTHgpgBD4yT2Uw6XzxaaXZB2J2NRZJ3EoEAkAoj5hK7BpX7tN2XtT9Dmurk6ycnaHjxubIZn8UHFfP7vYKYCJVviM20kSjID4m7aeCIBqC2Qm4inxpR3LzpfGCzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 16:32:09 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:32:09 +0000
Message-ID: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
Date: Fri, 21 Jul 2023 09:32:06 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH v2] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:510:23c::25) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: f8039805-2af6-4c8f-bf3f-08db8a08078f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRNVOHOL492R+JHgBfB9X6D4luTnfx6Hj13EUifPqhuRDubmkFvzMRgooe4ZV8Tspu/I1gU9r5upIBRIPFxRtMNJvYHeLbgyWBMPmNJXURQvHMTSKJEH+qzckkjBvd4UW6htAGBNEEo2qPa4WHLLJCXeMKMIw6N85hVGvIiKdh7bqroAnCSWyp8vdcbOE0MvytI7a5sK1X1n4SxiBC0U03WEAuzWy+Ktps7Mu/8qcwfmoMDmXDe79O3JYzd/hdo4fkzSYFe3wGzopnGjeAPICQ9/+Cj4u1fISvtpG1YgwULU99612zSFjAPu5zm6vRrJuAeeHiVWjEgNvjjPYWgbxnze1mSd5NAxIZ6QVwSi6Ff5CiAlEGdmc/Q+SHLPnUuxaX7JD2w+7tseUzufTA64/X/cTmVW4Zn1NT8B2jRaAZmfRfl76wASyWw27/G9qiVDGaP+isyuJfWDEPXU2GVq2yjaXWtAOdCLY54hXRTRhkRo88YBvojatz/UpVeLkpizyZt4RrpRN3Z22Wnnm5MelKEzOtiZsMG+5vaCWewYL3P4TO8NcCkbm7yVFirecUw/lGalj3m2Sv3l/nM7RV1yrZ8ak/69dWNEMyB4cX9VC1/S7wOFIBkA17EFQCTghK4a4ZggY9FNen+XcPnU0+2AOOl2vrVVh01tfLON7e7hOSEkJ7FjI4RIcOauBS6eLmrZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(478600001)(36756003)(31696002)(86362001)(31686004)(6666004)(6512007)(966005)(6486002)(4326008)(6916009)(66556008)(66946007)(66476007)(316002)(107886003)(38100700002)(41300700001)(6506007)(186003)(5660300002)(26005)(8936002)(54906003)(8676002)(2616005)(2906002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hscTlIMVdCQVBtc1gzQXZqMDRzcG40N1dkTVdKWFpuVzFlZUdndkJCOXBG?=
 =?utf-8?B?ZnNyTWxha1MvYVhOZWRZMFQxYWh1ekxWODMzU0hSTTc3a0tFeU00RlVMNmxa?=
 =?utf-8?B?VXVvL0txZnVWYWZNSElhRVdSV2Mrb2JoS2VLNkoyK0pLQ0plci9aekExOFdY?=
 =?utf-8?B?clIwR1pCOW5KejBYOU0wQ2w1Q3gzM0VLM3M0c0VZQ1VOQzFhWGJsVFVFSjdK?=
 =?utf-8?B?SExrU0NZWEMzWTFNNG9VNUJpend2bjg5N2dHc25CQ1JJSm1uRHF3eER6NXcv?=
 =?utf-8?B?a3hxNkFTY0svdEwyZ3F1KzRqekQrVlh0eXFzVWc5Y0hHS3lOQUVBYnB3MjNN?=
 =?utf-8?B?ZFFCVmpuR05kOEt5THVPMnJxVU9oSUpqenh3U3NsK3dDM1lhZFdvVFJwVWhH?=
 =?utf-8?B?ZE1iczU1emJNOWhYdzVpbFd5dUVNNzJWVGh2S0hqY095VkprV1ZQdk9kcENO?=
 =?utf-8?B?eHNzMlRkbU9oMjF5Skt2L092d1lGdGJCdnNTTzZ3VXgvemU2cXR0OEI2SW9U?=
 =?utf-8?B?RzVTZ2lnVDJEMXJyM1dDdmlxWUpyRmIvSXk2cWxkU3dLSGNUNGEvL09PaEV0?=
 =?utf-8?B?QmZKSkR6ZE1HUjBTei9ZRzVrcUNUdmpKV0FrV1FncjdKdW5ELzYxd0hic1ZM?=
 =?utf-8?B?T01KbzQ1ZjA1Z3Q2M20wL1hUK1Jib2hyTCt6M1pKZkE4T2xpUjJWSU54VUZU?=
 =?utf-8?B?QUtKaWtsaWxEYUZqYjY4dllMUjBVa2RHKzJvcTZrd1hlU0s3SGJNZUNoV0Fi?=
 =?utf-8?B?akJUM3VnMm9iYUdEdml2NTJhVzA2UmU0M3NXZG1ZdGVqQ3lUQVlmQVYzNUNM?=
 =?utf-8?B?UE5hVzE4U0pnMnNJMUhqTlR4WTdLUWtKNHR0MzBCOEl3YWE0YklZRUNVY0k1?=
 =?utf-8?B?aS9teWEzRzhxZnVTTU8xTlNzNVZXRTlLa3VheXZNYTZPNEthd3FIOEViVVdk?=
 =?utf-8?B?WWtmdTZFWnNhUC9vNWZqNWJPUzJvRHpnTnNNZEpHdE1oVUFTclhvTmk3MGxX?=
 =?utf-8?B?a0J3dmh6cXY3ZDZsUGMwYVhFamVkcDVBbmFJZWRVS3BOclJGcjVRbHBkOFN6?=
 =?utf-8?B?NFlCQmJ3Q3E1UmUwM09aZDkveU5ZVkRVVUN4blEwcHlYd0w4TWIvNEtQamFm?=
 =?utf-8?B?d0JvNzlpai9icHhJVE92dlhaNUk2TlppMXcwUE1DdWcraGtHd1dmRmhubC9n?=
 =?utf-8?B?ZzZrb2hxSENYR0xrT0Z2TktFR2g1NEYwZFVvTjJnM3UvMmhFd21GSVRyUVA5?=
 =?utf-8?B?MVd3eGd2b0UyUUtJcFlKZTBsWFMxRU5VOVFCRlZSLy9tMHFEcSt6R1IwTEdK?=
 =?utf-8?B?Q2RrOU93VEtrbzEwb2ppZ3VaNEtvbHNtaStpOHE0Z2M4T1BrQ3NRRFpTbVVm?=
 =?utf-8?B?eXd6Rlh0M3p3MlZEdWJrMzBaUVMrdU9BTE5PQ3dCYW9OT1hQOGY1elNFeDcw?=
 =?utf-8?B?WXIvRVJ6SVEvVE9sQ2RPNlhBWUpsdnpPM3o3TVp1UjlJcE5TL3IrME0yZ3kz?=
 =?utf-8?B?Qjg0N00vV1RiZnFkT3g4ZW55a29QdFBYbUJWWUVQZmc3U2JuL3Q1Q3MyRW1u?=
 =?utf-8?B?cXNnL1NvWURISWNPaVdjeUFTVUhxOCtaWGVYWThWR3lITW5qU20xVFJNQ0VX?=
 =?utf-8?B?SWNLdXliQktHREZHWk5RNktjSEY2c2RkNGhNckIzaWhmN2JlbTQ2dWMycDBM?=
 =?utf-8?B?aTQyc2ZTenpzcmhiZCt6MGFFcHAvSjVZcEpKeUI5VmpIZ2tsN3FKRkJMc1JD?=
 =?utf-8?B?ZGZUTC8vMmdlVnpJM1Q2cG9HUW5kdGxVbFI3aFRvWGFQM3lJTzE5dDNaR2RZ?=
 =?utf-8?B?S1NvMXVUNE5MeWJVV3VTZWVKamxFUDhqK2FRaVZpSWhCMk94YWVFM0JwMER0?=
 =?utf-8?B?UytEZUszdDlZNmdzSE10WWcxT0FtTWhvNnlabkVKMk8wbEkxcGgzdVh2Q1g4?=
 =?utf-8?B?Y0lPVTg3OFV1MHE4N2VTMVhib29nWm5zaFFLTHcvSlk5bUl3MVp3Q2xtTzJx?=
 =?utf-8?B?bDBNYk9UVUhFTmltWUdxUU4wendjd3hHNmZCRndXRnIzbnAwRERNVkp6a2Vo?=
 =?utf-8?B?WWdFRTNUS3ZOMWgvK3g3RE9CTXU4ZDU5eHJUcDBQNzUrYjUxN1NPS3RjYyt4?=
 =?utf-8?Q?67rT/knHhvJIonBrdnnlPPy0G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8039805-2af6-4c8f-bf3f-08db8a08078f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:32:09.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V2uecL8hsVqXOF7O5JaWd2XoAE8fq0VmWBT9y13AjKE8TxCKUelcIvTsiV8gi1Xm81IpUnYB/xpUfK7NMKW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536
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
IGT: https://gitlab.freedesktop.org/ekurzinger/igt-gpu-tools/-/commit/e6f5c81bf893010411f1b471d68bb493ed36af67
libdrm: https://gitlab.freedesktop.org/ekurzinger/drm/-/commit/22180768f85f1cce36ff34bbef34956b8803d6aa

V1 -> V2:
fixed conflict with DRM_IOCTL_MODE_GETFB2
re-ordered arguments of drm_syncobj_import_sync_file_fence

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  4 +++
 drivers/gpu/drm/drm_syncobj.c  | 62 ++++++++++++++++++++++++++++++----
 include/uapi/drm/drm.h         |  8 +++++
 4 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index ba12acd55139..903731937595 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -255,6 +255,10 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
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
index f03ffbacfe9b..92d6da811afd 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -711,6 +711,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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
index be3e8787d207..ca77a265a1ff 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -185,6 +185,13 @@
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
@@ -736,10 +743,11 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 }
 
 static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
-					      int fd, int handle)
+					      int fd, int handle, u64 point)
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
@@ -750,14 +758,23 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
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
@@ -767,7 +784,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	if (fd < 0)
 		return fd;
 
-	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
+	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
 	if (ret)
 		goto err_put_fd;
 
@@ -877,7 +894,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
 		return drm_syncobj_export_sync_file(file_private, args->handle,
-						    &args->fd);
+						    0 /* binary */, &args->fd);
 
 	return drm_syncobj_handle_to_fd(file_private, args->handle,
 					&args->fd);
@@ -902,7 +919,8 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 		return drm_syncobj_import_sync_file_fence(file_private,
 							  args->fd,
-							  args->handle);
+							  args->handle
+							  0 /* binary */);
 
 	return drm_syncobj_fd_to_handle(file_private, args->fd,
 					&args->handle);
@@ -1651,3 +1669,33 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 
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
+						  args->handle,
+						  args->point);
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
index 863e47200911..3a00eaa7cc33 100644
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
@@ -1191,6 +1197,8 @@ extern "C" {
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
 #define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCF, struct drm_syncobj_eventfd)
+#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE	DRM_IOWR(0xD0, struct drm_syncobj_sync_file)
+#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE	DRM_IOWR(0xD1, struct drm_syncobj_sync_file)
 
 /*
  * Device specific ioctls should only be in their respective headers
-- 
2.41.0


