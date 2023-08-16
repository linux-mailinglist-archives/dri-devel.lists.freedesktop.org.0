Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A977E64E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC17110E37F;
	Wed, 16 Aug 2023 16:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12B510E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHOBmnv+3JheD0RKD2gQpJk4TrC+w7WAI2Po1+2VFNxwWvvFwRgAwGYv2F2byl4qaLexnQTS0x4W5Ik8pjY6vo33/LWppRoKcr+3uXCuvAwtI7UETt+U+lDj6lxhxg9Dsq3awy5ppIp8hTkPOTh6JEG13lozHOd9/4Vi2w729e1Y+ySkGJtouQLL/BFc/xt8Yb+y8W4L4fswHztE6AcKHTIxfZYzhLzEsj98hi/TK7M7w+sSVsreCrhuF1YoEfAlGAO9G5U2F9XHE6niCfSSxukG6OAbW98FF05dgnNmvs42tzHmTEXh4K6xpquAtC6Xn0gAQRlWOf92b6hrBnF0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz/1agcGpifijGLBT3kdTSrg1zXgDqfrcGyLTH2/jYY=;
 b=T3+1Ej3qWmkw5i/domKae60WbopQh7uv8kwU7SvaF1BeEr8Ot4fEZWpQmnaSIP685ZOObnghhpVjLqWEYIzR4UfaRpefu3PL/ZFaJU8UVRAtFg3HFmGatYGi+SuB6qGdIDwSeU0B0qQpmCqA/fQeTgHRM02yXWQIhX+TzvFKz5MJHKwE/fL+3No1aTrrKC/zp0lE/9FGIJL2/8ohVn5Nq+fLL8Xcx95kYnztCN8jFo4QXx2XnA9mBSP3LZWeDuaYJe6DIC5MeQggs0iZErEcZcaxqe0MXT7eHW3YotsNDoBhtaxzdxRdxyP8uwxkVZ3E0fbBJKWFN99xBlulc9bvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz/1agcGpifijGLBT3kdTSrg1zXgDqfrcGyLTH2/jYY=;
 b=biow7DVO3wJSTJjmLDA3dzue1ki/b6pLX5CrGSGM+tZXoaKqlZQILiHu9fz4odSrwjWv13H4mvIqZo0X0Cvdku/oXAwAeykLRiJYKLcb4z0/YGDSLIpX8epHmBTnVC8WSvH5Ox+9e+hFlZtK5WpAAmE/oBgwKsDN7KO+QuB4sFx9dVIYBCUjxHG48WB0sqQJzyLVcUnPXfy+RtYoxIAU1zrZYHRh51dfgvCUeWfDkJFk1zW0V3okrS9xfbiP+U5fDldxQTc7T7GZQbtpPAkPDKRStT7EWG+6UxslZGkCUFUfsKw6afsyw8bq3Bxfe/5AGD620vyljJVxBZeaff6OPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 16:26:08 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 16:26:08 +0000
Message-ID: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
Date: Wed, 16 Aug 2023 09:26:05 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 273f0f8e-246c-4412-d5f7-08db9e757f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4R4bc4b+fsZ7iblN2CjRpLcfPDVAuBqWPY04bO0yQzvzNRHLtkbrwW9xfajEMSu+uI+IhE49Qw9S7bCebZlfY0hifEnDa54GNOhcxCuhjIwdaPnrX2Efw8vWyyOmW+n4WY+XUsG/N97jItQKM3pHhU8PYIqYwVcvlHJS2WJrTpTHQuKUk/Oi2DC7WiVNnwxNsMTjIChc+LS37RskFg/Ru/utPPYYB1IIkTTRHOd00FOKd7oMsoZxnDStSjNQUTsTPQVdfrpB5r4yH5qLI/ePz3ZUOU1ZUd2Bh/M4OGrnFF+4ffhoTetIjmLt5qdtKIfh8JjD1lHS/X51i+38go11ZizYMcWIAQJ9B8g3pLwX+9/HkP6Pur0HKbc5Yj3YuGm5t87Hx1wxOjJX7VPy1BDbf3qHiWOaMF/z/CY9YJ9IjdjIrcYz5ggXjcm7n968rG7bTWDCAF4CP/nWwsH8Se5KmRKQFnvgxd9WZejV2a+r4IjOGUDziE+AXFJk0nUl71eSfRVv5skmhElFgSO2Odq6YMYz5oGEaODslU0M2E89y6jK8LeGh3eo4Mk3Y2BA/iynNU93CNKtsMfnMwrH90hBSPODMQ7Dy8COfGEgzzdbCR2DjOiMi18RKuaF540MMRw2VdXPfUPenCxdrEZHSxGQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFN6bnBFZVZhS00xdFBiaWFCTDRLVXA5eDU5Q2haa1dZRGxsNzkzWGN6b2lr?=
 =?utf-8?B?UUxOUWFFV1BXWmV2ZUNZckZkZjNVL2REeGdnZE1KR0xUREtNamZDMm5uM2dY?=
 =?utf-8?B?OXA3K2VpNmNTOThWdksrR3ErcHptQ0JUQlB3VmF6TE1iNy9EWWZzNHorL3E1?=
 =?utf-8?B?MWhkdHdlZlNsbTAwMmZMVnlzalVRVFpndFJ1RFc2RFFhdnpBQWFLT3dzUlQr?=
 =?utf-8?B?SkkvN1JOdmUvZlhMbGltMTRiSkh1UUdMaitrTko4MUNJRGR5eE9GeXBBKzU0?=
 =?utf-8?B?UWRHK1oxNWh1YnJRMnZqN2Fzb3NLZlZ5YmJIcTVtMnRzb0s3c01JcE5FM2p0?=
 =?utf-8?B?ZGo3SnN4TTNWWVZYVllQaVBEUm1sbUVPK0txbEdFMFNiT0RsZWZGU0tUbWI4?=
 =?utf-8?B?V0RHaTFXK1A4aVowcGJwdmU4aWZ2R1lVbnRJL0JiQUUvMzNXNVA1S0l2ZXFp?=
 =?utf-8?B?SmRuZkd4N1NXVTFqTnFwa2RsYTJiL3RjWFkzQ1ZXQ3hjWEF4T01INE5nYWp1?=
 =?utf-8?B?MGRKbWpIVTh6OUNLdnFoaHJRdE5FSGVMVTBtd09INWV1d0pxejN2RS8wcHFw?=
 =?utf-8?B?REZ0bEVucmoyOVZpVmJZT1ZyNk1qS0V6YWRncnR1bWEzU1RzWkVGSEs2c20z?=
 =?utf-8?B?VTczN2dXMldYWWZTekhDbE9aM0FkZHAyZnp6ZkhoZVo5V2NveHRUaDE4QmEx?=
 =?utf-8?B?ZXdKeStaOVpjSnZGK1JTbWxPd0dwOTVPTEF2RytHSGlvU3VIYXg3bVhUeW5P?=
 =?utf-8?B?elVCSTUrOUxNY0RJSkdMeEMzSkJiMFlhMUI3OFdFNzhFOWhSOW1JMDlYcEdQ?=
 =?utf-8?B?NlA2bnNuWWxOOWM3eW5NOGtKY3pFQ1FrUDl6dTFSdXNmdFFrVmFIM2VMRVo3?=
 =?utf-8?B?bFNPM2RaS2dmVHhjK20zVU9kZmNPcGlLMkxjcXEvRGV1Uk5GVHpLS01KSHZE?=
 =?utf-8?B?eWUyWjNlVEhKL1IyWEM5eElvZlJnVkVUUVcydmV4TVdXK1pBQndqZzZxRXJz?=
 =?utf-8?B?dEVFQ3ZXdjB5THUyZlBxbmtwOVB4dkRLVmV1bEo2RUZnMk9yeVNzT2ZLaGRh?=
 =?utf-8?B?a0wxTXBmb1ZmZXdSNlUzSHhMK2ZteXRKQW82d3g3ZldISS9lKzNmeHVxUmFE?=
 =?utf-8?B?Vmp4dFVIMG5UME9yVGRYdEV3TXE3UkdaNTBJVWZCMmlSK2l1VnFJNktpaHFK?=
 =?utf-8?B?dGRtR3phbDZWNUtYdnNvQ3FBOXFVMmxQOWZJc0tKcWFBaEs0ditRR1pDZ1RE?=
 =?utf-8?B?UEZqS3d4WUV3ajNYS0xyYnhtUjRMS1JsMkxFRXNYSi9zeTJBOFptRkFmR2Nr?=
 =?utf-8?B?bzducnJMSEQvVVRxTWovVVptYjVNaDhzUWRBVytPRU1rMG1oaHdlVmhRMWNY?=
 =?utf-8?B?VUJKMGxEeW9nb1NGVlF4czRmcS9iSGQ5L0RLTGFKY1BrNFBZRHByMFlIb3pj?=
 =?utf-8?B?Rmd1Ull4TTVxZDE3SUJNMm51V1JJQmxKMmphaG05L3MzRUNteS9UdWZ1eEpr?=
 =?utf-8?B?MzVldXZuaGk5N3ZGeUcyWGVtbzhrK3JMQ1E0Nm9SdjMxQ0x6bGtpTnBMbkhI?=
 =?utf-8?B?SHhNejVlTzZVNlQzSnFCYXF2N3lDdmFyZzV0WXc3U3IrU2pxYUppWGRsTGhH?=
 =?utf-8?B?T25SK3g4ZVQrOWJ5TWpuTGNCcmQzUUQ2Y1FZQ2VJMXREb2VKOHlXdDBOVGFH?=
 =?utf-8?B?NGE0bGYyamhOSkVVaERUOGZKZEZxaFI4cjYxWFZRdktYaGhSN01tanpVTzZr?=
 =?utf-8?B?WnZmZ1ovY1JVNzVXNUhBaUlhNVBwV2k0R3hKUU5taGtHRHo3dVNyQ1lJdDRB?=
 =?utf-8?B?UllJWmxOYjhaWWptbEpRY0tnem5NMk9JRC9iQkxWQi9wL25pOUszUVl0VktM?=
 =?utf-8?B?S01ISDU5NW85SWhmVm5ZSEtCU3Zwc0Z6L1BCaTNUOEQ0S3RHbVZpNGNzQXBo?=
 =?utf-8?B?ZkY5ZVFJSXNScllVbll6bUovMzhGN1RGOEIxT3g4NlIzTnQvU3MvaGs1Snlm?=
 =?utf-8?B?cGl4WHkwMlZGeDVKVFJMQlAxUnV2VUlDUnk0ZmpBVXNMbVdMQ2ZOdThsSHor?=
 =?utf-8?B?Um8vKzJrUlhaZFBSZjhPcXI2ZE1aTjRqckIvaWEvdVQ1SloxZGEyMUNPY0VG?=
 =?utf-8?Q?0SrLVbIlNJjaa5H5K8aN6q3OS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273f0f8e-246c-4412-d5f7-08db9e757f34
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 16:26:08.7061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2MvqFkotumZdWUk065bm6ZxjDZyQ4cGIiPjb9PkYn4yZ/QeObzUy/v1FWEqor0ZBX5alo4eQId8ct//RZH4iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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
Cc: david1.zhou@amd.com, faith@gfxstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT is invoked with the
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag set but no fence has yet been
submitted for the given timeline point the call will fail immediately
with EINVAL. This does not match the intended behavior where the call
should wait until the fence has been submitted (or the timeout expires).

The following small example program illustrates the issue. It should
wait for 5 seconds and then print ETIME, but instead it terminates right
away after printing EINVAL.

  #include <stdio.h>
  #include <fcntl.h>
  #include <time.h>
  #include <errno.h>
  #include <xf86drm.h>
  int main(void)
  {
      int fd = open("/dev/dri/card0", O_RDWR);
      uint32_t syncobj;
      drmSyncobjCreate(fd, 0, &syncobj);
      struct timespec ts;
      clock_gettime(CLOCK_MONOTONIC, &ts);
      uint64_t point = 1;
      if (drmSyncobjTimelineWait(fd, &syncobj, &point, 1,
                                 ts.tv_sec * 1000000000 + ts.tv_nsec + 5000000000, // 5s
                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE, NULL)) {
          printf("drmSyncobjTimelineWait failed %d\n", errno);
      }
  }

Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Reviewed by: Simon Ser <contact@emersion.fd>
---
 drivers/gpu/drm/drm_syncobj.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index add45001e939..a8e6b61a188c 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1087,7 +1087,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		fence = drm_syncobj_fence_get(syncobjs[i]);
 		if (!fence || dma_fence_chain_find_seqno(&fence, points[i])) {
 			dma_fence_put(fence);
-			if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
+			if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
 				continue;
 			} else {
 				timeout = -EINVAL;
-- 
2.41.0


