Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12D75D191
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82910E6F0;
	Fri, 21 Jul 2023 18:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB310E6EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6iswrPG0B9ffJq8OMEfndLF7/beDuENivIcfCNxqjeLhqJpDq3YsQSK7CoJgVxKVtqwlSk1Lsuq9oDcPdwxiIA2Aer1kgm9QTJYyYT77G+PyiYEP//2wY2HD21N66G/PcnREk0n9R3+eRgoSqh3bOnP2fTjLIBdO6/SXmwjxH0db5c4eJDWU0r6gk9a0rRmwmBoycdNHun5tjR5xsVM0fJ6LN+SZMgw38EDK54Nr6mnbBQICgg4POFjhjTy7lZU7RUDJqXNw+kXhJuWByoS2vTYr8HFzrhsqhJmgHONUUbKizdA2eE7nL9ad7OGvh/aO8dZmKpDAmpGx0VvgQxmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzeX4Y8hi++URc5/OcqkqMtFqp5K8UNRaOoS5irfmpo=;
 b=AomuxISSlEwqK+ibDk0302TaRs96mDod0AZgqlk763cSedWugpIBYr8IdZ/Dd23CuJXTy1pIAu26u8YNhS20fiZuqyybMOgDd0YqkUd8jAkC4a3w+5mEaTE4kFr6PrYACn00g5gdHs73goVQ2OvAz0ZPnV1gyHloJvtyd2oiuWceil0jXkf5kC/+lrvrYDPGoB31f6fXOob4aRFHLaCLbPcbAAwLZgUgSRd5yJkrzoK4+22DdGeTJYl6RYwUpyNIdzQwCE+9I6K3QXUVgNoYoNIvXGDYWQLk/YxcldIGEMVG/OARNdVrlacMqtY43Xc+OqDVcA8BnR47rsIopwchdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzeX4Y8hi++URc5/OcqkqMtFqp5K8UNRaOoS5irfmpo=;
 b=U1Kem5n998qh0tTnpLgX5Kv3YLKnmraIWDBzIHhweLBJe6Dg163tQQCjSVC2kUcmvEjBQNs0TO8NzSphAzqW/JIyYQeZe1c+uiANtj7LMcCXeCPbKBNhqq56o4EWD2gB5ptQRKO9t0AENOtmNcCRNy582hymsPm8EnDV9i/QFe/XhrabZMTTufMWsOwn+GtEobGivFiQQ+WZ9xY/IyTQieiJlsJKi7GLnnhQBXl+9bSsf0SjuP0R3Ja8m5TnypPAMqH/1rtRc3Abf+06DExNK7+HBNsHBnhVk+H8BndnZKq41fjDLnYh/0s8lHpzbMDDheQaHEMW5yeFsI2SHbYjRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by SJ0PR12MB5502.namprd12.prod.outlook.com (2603:10b6:a03:300::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 18:50:03 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 18:50:03 +0000
Message-ID: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
Date: Fri, 21 Jul 2023 11:50:00 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH v3] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::28) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|SJ0PR12MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: dee93a59-2999-4b93-56d9-08db8a1b4ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+emWClzBUIvxSnMjIUJFbXRLqL8P4DnYJwg9DhUg8pTR5Nx+M55DZBoGlr5h9Fwpynuw/QJJR4Gjux5S3IAE6J/uitjjVVwYNROOg2Feidn3UDOxaIvRtB+bVGo6qsjRpCQYGPbYdYvSA6GB7ywH8XjovCSzX86h67duF3ktGdXknx6hiOfzkWuzZcH7/wryQRb8Kw786L2kl14f5HW/oY4cjIRf5RSoKI98OaCSIFrrc7ZZM7m9mZbT7CN46eb99FZCmzlNvMcYwoBGxHOPUEJJsNXLUdbwQeQSJaEjRNisS6NtA8LntNCgZbCTsKKciR4y5QFXYoNwsUMz/pC0DcX0uHKCkzqRig07BgatLjzUJSuOCyHeONppfdbIOygLf3CACjPR9VwXddZuy2i6HuzAVUjjuKHoDQwwKkjyzBIEVHy3RH5S+BBlVbpuh7W5Uf/Dknp0jjGgAJCkcYcqsLGoXtnyQCRojG7h+qsNMr+edkaxScSHdvL+lOrBxJw5LlFIhu49m2Qy6Q9TAGvDJ6yuhM5FmXD4V/b0hrsueqWWCthMVwVVkwY2lwk5DxKPZEX1ypVl5DldfObQYGB6kt8/jSKt8TW0DIRVvpEBdNcFklCdxy7GPHHJQkAeitvVDRpk+Nv8nFMoCfvoGiASwS+cTRATio82jeFKxYl/I9f9jNKDb+AdGRflwbdjr4z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(478600001)(86362001)(83380400001)(186003)(38100700002)(41300700001)(26005)(31696002)(31686004)(54906003)(6916009)(8676002)(8936002)(316002)(66476007)(66556008)(2906002)(4326008)(66946007)(966005)(6512007)(107886003)(6486002)(6506007)(2616005)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEdnQUpBSTR3dmFwWTlGYVlmYitxaUY1NmhYdTBxK3lqVGJPcE83U1o2WHhn?=
 =?utf-8?B?NFc1bVRSVUwyQkIzSHhXenpiTnc0TmdQRWZOTzMyajE4dHlnMDBTUUpObE8y?=
 =?utf-8?B?amwvMFFJL2RFMDd2Zm50S2FDTTZPa3VZWENrV3BlMWJpNjYrK0ljZGlMSDBp?=
 =?utf-8?B?ZkxDMFdBQklsazNhQXgvQVY2bmNjZVpLSFpkL0ZqYmU0eTNmbW10aDRjdTZU?=
 =?utf-8?B?akY4SG81d2ZTSGJ0V1RGZHg1U2NSYVp2RmgyWEROK3ZjY21ka01xcDlwcTk1?=
 =?utf-8?B?Sm9IdURuRkJVMGFMWVNCc3NUclV5U1pUV1lvc0hOK2JWRUJsS1FpWkN0aGlX?=
 =?utf-8?B?R2tmVjh1b2MvR3ROVTB1MUZnRlQvQld6RW05S29Zd28xcHI0QjZmOVdBc1BB?=
 =?utf-8?B?NEl1WnNVTU5FWkRJN2c1Rm9tVnBQM3lZTUF0cjVrdHREMFROTGpNV2d4cWlG?=
 =?utf-8?B?YVhDVWVBSUVZSUhKOGp2VHJ2Rk9jdlQ5ZzZWelJwWWlpUmlVNzI3ZFp6Y0dt?=
 =?utf-8?B?T043bmJHZHRRYnhQblNWbFc5aHdxdVVpcjc2T09LVzg3Y0NaVnUrek9Id0g4?=
 =?utf-8?B?aVU5YWQ0Q25lMm9mUGdLK09aNFlmVnI3NmQ2aTdUMFRIUWJ6dXZYT1RzN1hq?=
 =?utf-8?B?WEQwTnVtQzF4eStFSUZVNHJyOWIxa2QvMUkrWXpJYlFxYk5hZDJCdklURlNV?=
 =?utf-8?B?ZDh5OWFzamFKM3M3M1JqVjJhT2ZQV25DVUR2MGNPcjFHb0hOYTk4VTRvNXZs?=
 =?utf-8?B?VGN3cnQ3dEdFcEp4enU0WmtXYjBEK0ZFb0g1RkVHT0t4RUpCcXg1QlFRSGxE?=
 =?utf-8?B?TmE0WkV4RDd3V2c2d0NmSWZpaGJ6b3FlSUV4VmFPNnNxL3RiMHcrT21INk9r?=
 =?utf-8?B?ZjlkTFZlSWFhQ0pFNlFONVRpdi9GZkZkWkFUdCt3bnJQVmZHU01peHpvbTFX?=
 =?utf-8?B?enpTRXdwMnRIc0c0Y2FqNmFhUlovLytxeVhmVk1YM2NnSWxaaTBWN2o4a1BI?=
 =?utf-8?B?VTVDZHEyUUtwWThndjFBU0ZFNFV1cTd3K255ekl2RDFGS3ltWXZlajk3RTZV?=
 =?utf-8?B?ZStIOCtQditFZGpWWGhxb0VibktaaXMvMlVsUkFlRUM1azNOc2FabXlBY2pm?=
 =?utf-8?B?R2JQTEoxTi9tMnB1dlU5MzlxaDdiZ3VxNUlkZGhoQzRGQVUzazJBTzlEQU5X?=
 =?utf-8?B?ODY4VHc3ckphSU1kc3dmb25JWkhSYmc1ODdRUnZmTFFURWdGOTVBUXRyOTFv?=
 =?utf-8?B?TExNbmRBd0pIdzIrc2FVb3E1aUZBZXRLUi9jRlNFb3crWjlhdVl6dmNpUVJO?=
 =?utf-8?B?aDRWZzk3UktRc2FlTTRyZ0lkMW42TFh0bnZ5aEhZSUJVSVdOUzgzNno4cHIz?=
 =?utf-8?B?bHpiOXQ4bDNNQnc1Q2RJd3lzbjFRc0hrWFRSNFM1U0ZPOTNmUmt3TVlEdkhu?=
 =?utf-8?B?Y3RaNEYxaFpsa20vT3NVVGM3S1AxVHJqVzZVYk40dHYzNWR4Uzc4YU5VazVS?=
 =?utf-8?B?cm9wTzBCTG1TZEhZRFpYcjJiNzhxczQ2OC9LOVhtK251Z252MWZMWnFlbmdC?=
 =?utf-8?B?WlFDcWxOVlJ6YmVicnpaRExSOVNvNXRQSndUb0o5NForZUpuU1R2UUtLeVdy?=
 =?utf-8?B?cnVEZjByZ3VSaWNTMGI1U1B5Y1RDNTlPaTFmTTE4Q1RuNTZNUTRlZE5GSW9l?=
 =?utf-8?B?eUVCQnhKcHFCMEFGT0tET2hJeHdJNzJXbUY4ZCtaU1VLakRjZWtWTElHMFhu?=
 =?utf-8?B?eEVaMjJPbDhkTHNITCsyYzlydDhpSFVNQ2pwRzhRa2owVExGYzRPeUlFckJS?=
 =?utf-8?B?MmFxMWM3SW51K3ZQL2w2RlZoTHpYSnpqYVRiV3VERThqZW44SU9VWWdpK1Zl?=
 =?utf-8?B?OTdobHJmQTZSeFRRWlVWZHdGdW1uM1dDaEdtYk85R2R6Z3ExSkExUlRLNkZN?=
 =?utf-8?B?b2ZuVVY0VUM1NnVpaFdwUTJrV2ptTWZKWUN4UjR5L3BPT0l6NFZ6NTVkWWpl?=
 =?utf-8?B?aVk2bkFRRWZhK0dqMk9XbHFldG1IbkQ4bCtCMnE2MDZMaWgzRVBua3Byck56?=
 =?utf-8?B?dkcvMTA3bmRhR054QWx5WG9NdHhNaHIvMlBoNGloeWxja2V3Y0tSenN4OTRC?=
 =?utf-8?Q?wrsehTA7lOUu+WGrWjwblLWDl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee93a59-2999-4b93-56d9-08db8a1b4ae9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 18:50:03.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe0wdTKv/mAr3NZuuiZJnnIqBP5N38s7TSJsntpMpUCpAvjPAMoMHYXzep91Yr6pzeZuKtJqgkx0K0L5lG5DCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5502
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
Cc: Austin Shafer <ashafer@nvidia.com>, James Jones <jajones@nvidia.com>
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

V2 -> V3:
add missing comma (whoops)

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
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
index be3e8787d207..ee87707e7587 100644
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
+							  args->handle,
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


