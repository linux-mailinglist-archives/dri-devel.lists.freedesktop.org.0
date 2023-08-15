Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8877D19D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 20:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D110E18B;
	Tue, 15 Aug 2023 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663A510E18B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 18:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6lBAnUAQ37cJIhorcZn+Ey4Z/DNAsxZndTdTpeoRcT1mGmveiGvKd0ZgTiEkSOQwbh7B3kvYAiM6QgvhpqUhJts0gC03Zzdjkaa2W3COpvNArGoyfsYO5M1LdLg2T30SV6MXkqGmRLyrfRbIjHdRfP/HzpfAtbTAaNd/aN72UHnbUIlyKiimkovX6+h4jGFbcXW1XFJhrS0sjGR7WIgTIJIRTGkXqF4vhov8IPBf29Hyk4PHqlktGcP7QS2XXerzE8vph/voSqHpku8Z00+HVE3MBhbZ3+UNB44kYM3pqaLv4EMe3sEjYTOuHKI072sphtLja6LPmYWjq2IAxsltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAgODko0oVrfgdE9FzthsHO1mpxK0GQ0QlZgkWuPDLI=;
 b=hIaExNVpf4gZXLDna9JhEPf59hVJYaHAOIqMy6l1X4nqb/38oTFP1AQ3Ac1hNoEni/db9FgNRJl24/YGs0eSGHMolmTzfWjnAz7YOAMOm5TXj55JK5vSPX0rNMQZcO19w4KONLYOCe3fuLNigSoIa3qSpfAv4kptlLOgujFsSq6xNlb4xZsL5mZ1dn/5O9duzWUFxk7Wj+bEI3JLtGkfesIHCicjdE4EGQPu7LEXcduFX4VfTQAXT77ktCgA997hJWM59dfwQebK/5iG/2WjEHAP0hKGi8kMjS87Y11lV+LveFDhXx1ODDrTc6cywlBQIGwr8BPrINtQkvDIrtrayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAgODko0oVrfgdE9FzthsHO1mpxK0GQ0QlZgkWuPDLI=;
 b=nkoKVX7LHLNx3G6+5hdYLmso21crvmptTbBtaAgZiOuOdNZZnUyPEJxuSz69J7fY39sPzbFWq/XafryAsfOJAwncE54lFJeeqi9fRHWnQzOEaY/YJTrzVNDRP7MpUBKJU8d36AOmZ6OaYs2QqfXQZct7lM558BKN9PoJ/9hTG4vzLEO1rC9z4jseH4lcTTb+KvBx+qQfYnzxxKb8BGvQe9u/k50Obc1WJHt1isWdCSfWKiUpSOPJ0l4gKvbE6YxhFua5/x5iMgOLWGmChsBU9aEZvVk8J118qC1QxaIPK383hP4b6hsfamS3gnCWenz8XZUJ+XTjjuW89JRErw046w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Tue, 15 Aug
 2023 18:19:23 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 18:19:23 +0000
Message-ID: <7121004b-65b5-691e-c73f-67bebacd6074@nvidia.com>
Date: Tue, 15 Aug 2023 11:19:20 -0700
User-Agent: Mozilla Thunderbird
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
To: dri-devel@lists.freedesktop.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|PH7PR12MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9aef29-13ae-4f11-d33c-08db9dbc269a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2OlUYpmE4H/yIeHOj50fg354eq8eS+DbLuTHZaR3I+3mMAIP7bIQmYPre+GAzdKM7QiQKVUaVCLN0OMriFjlhxedOdtdC8K8vVnGqwTwgyufIwEG9hAlAzz9AqOJK54traCtH600IBJpfe4BuLrillLpT+hcpCx4vASfYbSZ5XF0EBqfe4sHw/znT1TfgPfWMwibGNyZovBS7jkvv7eCCLVsWpxljw8xkPV1DL1Upeq/NYsg5lmKVJC+7/FypYev+a23mEBNGE9JWIpI7tK3pprdeCvSrRXd5tY56IGxhEmdW3D30OU1NOs1f2oYs8W1wI/kgY+RbhmGU/AlDCsSyNJImNaaPJ3a+p71SU9mbUy2Cd0jM1kI+2EevthTXwDJ9n5wvDF9J60T9eNTmIcNQcQGGPpk0egvozRWfP0bswBa2cMn9IKF0+FbkKKJt/UTxbo98elsi2AyivfKh1kNDtBoPVIF5Yt7sFqjlh5xgQWMm5QJg+6aZjIzAU3cjCmGlsE+vJZzTal5SP/ejqM6FA7WEz8TVwQSBiC8HvQza3Yz0AJS+NNzHuutrO5sNDRVHpBtxhQ0q/8lA+l7yJ0l+O6tIcnqfxAZA6oVntrzddQRZADnveWQzYzto2zotCUcPXSSrC3I8K0/4VuT356NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199024)(1800799009)(186009)(41300700001)(4326008)(6916009)(2616005)(478600001)(31686004)(38100700002)(6512007)(83380400001)(66946007)(26005)(66556008)(5660300002)(2906002)(31696002)(6506007)(36756003)(316002)(66476007)(86362001)(8676002)(8936002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3dUOGs3SGhyM09CeHFOM3pIZ0NsazJ0TlY4aUkvNHJGTEJycDZyM3NKeXdU?=
 =?utf-8?B?bU5QRVpKYzZYV2tNaUpsYncxdGpwZkJueGxSeFg0TG42SnUrdUhxRWdyYmsr?=
 =?utf-8?B?Y1kzbTNlUS8ybFBwWVZMYlpLS0tJRUFGcm1QOW1TTUxHT1g0ZVJabEozVUJ2?=
 =?utf-8?B?aUQ3b2xlaDdZMVZqWk9NOG5VQkhSeUp6M2RtUjA0NG9iVWlLdEVueTU0SU5H?=
 =?utf-8?B?YzdKS2grUWZud3B6c3N1OUtWNnI5d1FGMWpCakR2ZXpjazdHNjFLa0xrL3lr?=
 =?utf-8?B?YkFRdzRsb2Vkdm9NUWN4WVcrWlNLbmxuMkV3aWgwNzNlYWFleHk2enBaaDZ1?=
 =?utf-8?B?VGJnSlB4NjIvZmZ0bStiRXNkZCs0NCtoYnlqYlY1OUZma3ZWQzNsL1FNUndJ?=
 =?utf-8?B?QmJvU2xDeXBYOGVFWUxlLzNoRnZCNjM5R0ozcmhWTEF2WktuUmMwWWFBVUpL?=
 =?utf-8?B?dUJsVGNPZW5HNFlyUElQa3FPQnVESWk2T1dIYWxuVGQwYVZJMGVqelRjSFY5?=
 =?utf-8?B?TWJHZEowV3hXZXlPMXcxUUF2L3JZV0h4NVhNWGszVHZyV3QzYlNSRlFLVURo?=
 =?utf-8?B?aG9ydEprV1FvOGNzc1I1V2FkdktnQ2s2YkUvZElEMldHZWYrYVZDSUJTc3Uy?=
 =?utf-8?B?aTBzSm93UUwrWE4rWDR5cVpzYXZidWcvVlR0dWlTWmNHV0oxMkxlTWt4L1ll?=
 =?utf-8?B?R1NEV0tGVUVMdDlaTyt4VDFqbCtXSWp5YUNuN0o1RDV6ZnlXT3Zxak53V3Ro?=
 =?utf-8?B?ODVMdUdPL1NlbWpnTmJ2WFdtK3hkdytJWGRJN1g4TGV5bU5mZGYvbTZ5NDlS?=
 =?utf-8?B?eUVsUEVYMWlIem0rUTk4ekR4RFQ0ek9QUFFaWi9CSk9YRnA3ZERsNUE5SE9O?=
 =?utf-8?B?ejZmWnl3bHJvVnpKTlRMMlpFTHEzTUJhTjdKcTBDT1FBS21jYWUxU0tMYjVx?=
 =?utf-8?B?SDBhSExVdmZ4dWVCZjN1L3VLUVNWdWZMTGFWSjZrQkFHbmFONUV1UjhGZGxm?=
 =?utf-8?B?ODZ2Y1JBZm9mVDBEdDlqWFlmMnp1aTkxOUltYWtubHNkdGNxUVRBYlN4VjA3?=
 =?utf-8?B?N3VocStuNEJuZk1tbDdsU1FXbzF1WVZqSVA3TkJSbWJyL05YaFZ4VnliaERu?=
 =?utf-8?B?SU1hZnkzcWd5MTR6Umo1Y04xRE55dElhdERsbWhybXJibGttcFJYbHNpQTVX?=
 =?utf-8?B?OS9ranJIZ0NaeEt4WGdPME5iUWFEWlp2NGNyVDg1cDZBYk1GSmpHRmRHbmc5?=
 =?utf-8?B?WWFjcjlzYUxxODM4d1RFSVlPVmJXU1FwL2VCTzh3d05NWU55Q3FhUWdUaGpr?=
 =?utf-8?B?dG1NeHl2WWUzdjBOMXdJNXBKT0U2cHhNYTA5STQrWlNHd3dIRDN0U2VuNzVs?=
 =?utf-8?B?UU1ZQXBZSmF5M0RKNXpYa2EwK0ZRV1hLUlhXOXc0ajZ3RU5rWlFQOVVUQXR0?=
 =?utf-8?B?WHZNcEs0MGlzZUtXME1HSVlseDhNZlZtU3A3VmxKeWdUZllpTHlhUTluZ3A1?=
 =?utf-8?B?djZjcXdORGhiYmpBZnVScHJYQm1Xek1uYjJXSk44dTl0RkZpTlgwTm0zMWlE?=
 =?utf-8?B?eGovLzhKcHN6a0l4T1RXSlFWbnZOWEFxb3VZOFlXQndkRFk0ZmVuNjFod0hN?=
 =?utf-8?B?UkVBTnA4dXN4MDFmQ3VyVkdZV3BrVmh2SjZEY1Fkd3c1U0hNcDJjS3dwcko3?=
 =?utf-8?B?RGpFODNNRGc0MkxDRlJWaVBCN0pPRkpQZnBGQ2dadlZMQkhwZmF6UENIZWkx?=
 =?utf-8?B?YXJLT0lrb0dQb3E0dXVSRkNiL1BGdkVhVDZCS0JZT1pvY2VEakc2UVVLcjhL?=
 =?utf-8?B?em42WU5HNFhJYmRJR01nN0o1QU1yMnoxWks5eEZHc3pFMjY4MDhTZnFvUTRT?=
 =?utf-8?B?bzhTemxWcmlwRlExWGp6QzhDK1ZiYnl2MW82N29JTkN4T0tLVmZ2NHZoSVcx?=
 =?utf-8?B?ME84OEdwQU10SEMvQnkrcU9LK285VlV6NkhtbW15bStkVUFZV2xHNlZwVUFy?=
 =?utf-8?B?NHdtK3lEZ3FkdHp0V0diZTVNaVRKNHNMeU9NQkNtcWs2MytCTkVmeElMOTUr?=
 =?utf-8?B?Wm5Cd3NmUFVhTUZpMTFvMTNua1hOSXJWb2ZWQTgrY1A2NlhIWlJjbkhpbTZv?=
 =?utf-8?Q?qbbiN8sZ1wUb9Lrs9eBiZVr/E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9aef29-13ae-4f11-d33c-08db9dbc269a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:19:23.2299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUpyj/yIV6BycSZ3EzDSyCp5IrTGqBl1TkqoUWS7kLHHw6soTeQwIVTFmoDJb1QjRRJ105U7nT1higg4nhcAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106
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
Cc: faith@gfxstrand.net
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

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
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



