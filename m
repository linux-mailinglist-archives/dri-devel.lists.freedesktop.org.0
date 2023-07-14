Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7F753D3B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2D510E897;
	Fri, 14 Jul 2023 14:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2110E897
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:26:34 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBU217000769; Fri, 14 Jul 2023 15:26:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-type
 :content-transfer-encoding:mime-version; s=dk201812; bh=WWwK9/uP
 ihoz42NWy2MabiUPjP4EdPdHXHq6V0amyyo=; b=Ui6JE5BT+n6E0gh1/wWeF/YO
 NEfiGXgQvkam4FWgojAy1JdvD5fVdeu8e9JsL1Ydg2Cf/5me6oAqj7EG86ro0gp+
 nN0rmEphjtraEchp7eakhSNuL73Mup/5u/Nmw9vOq+ZwgZx5KjnI+Q7CQg0mqPH4
 NivDcai3HXgv2IuuzIbqlV4WPu1uZmB/I9kaD6wdc5Hgq+rhrkbSAnMN3g+iooZ/
 xru7RGIwPp5V7upleaml3eZCs3K4STXW7W2Ac/CiHKTMJR5bHGWAbxy6R+ew3M4d
 SyB8REIcM7rmE0qtzQ00bUKH9mCPHq6XgN92aTRQPgl/bwODzJj9x1rmDmnE/Q==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gmbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 15:26:16 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 15:26:15 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.52) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 15:26:15 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFH+/XKKXuDBLK9w4Fzz4R/HFQLLRP906F60s6LNTGoASFZXq9NVOtbVM3OznS6hZJo7cqIHot+ApH7tH93jtdEQg1khqa8vSHg+2kroOwupNAm2+eRM42yP1hfgrkru97IEJuH9h5RQr0FQ4qebStpSpNmqQSXHvJ2jy7M++iG2NexHZ/FfAmwo/aDSrRF/ikSSFQIvIVRDN0Mh94jbafQvS3ujQp3Z5F2xSOuI9VVkhD6UzTlZfFM73qgzYU3MoEBeqBxwEEEZwa4Qn3tbqvr5W/e3MMvZHRjV1td+awq2DPPtt3YDXlbSlDS9J++a8LWhjK4P3zEbBORrpU6a2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWwK9/uPihoz42NWy2MabiUPjP4EdPdHXHq6V0amyyo=;
 b=Dy6UD+pYjB0DgjyZpz2r6lpzvE01xGc5ugtf1HZm087mQkKpDpzJM3KxHwGkCPcM2ANs8pJd9uE/JTKb4DypjvD1jNRzmDLMREg4lBlU6GNOwsEir23SZfSpg0R51+pd67P9yBTb+EDeqVJXZa9LNYYjvCK3ObFWnImdRfI/ObTx1Gda2qks4lh+Z77rqBm2NSWvXbfEQiIyQMkiUAkryr60EE3fUzPmKYWHRd+DJaRmCUzBlqTWy7JGfU/3IKlkzXcI+DvFLrHFmyRlwQcFBiSPo+MmsOUoGs8Y5AY6COyemGofaBpOksOlnt+LtruIsEVP8GhzLm9Q7JZugXn7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWwK9/uPihoz42NWy2MabiUPjP4EdPdHXHq6V0amyyo=;
 b=ijPM/A+WxOd3tJp0hu7rg47v3AwUEPB6iX0E47mAyYDICVF3hvDFhuXt847hgZz28ALFFswgXH1mqAkdDgHIiKPYOHLvA2v+hXXwA25umr6Nc8Ycx2K+ejnaR83tijUw4VajygqyaG0Ms/NtjZMMwh2Oh41RCJpZz7oboClq1gY=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LOYP265MB2077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:26:13 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f042:5122:eb28:4131%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:26:13 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 04/17] drm/imagination: Add skeleton PowerVR driver
Date: Fri, 14 Jul 2023 15:26:02 +0100
Message-Id: <20230714142602.111681-1-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::17) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LOYP265MB2077:EE_
X-MS-Office365-Filtering-Correlation-Id: 0532a367-8a63-40cb-f329-08db847646e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eM++NkWoHxRIG/oSeoBtkaFwYfpHyRTXttohKTdbmpie83LjyEchEfBJFFq693LNprTFOj02kKAhXISMsKs49qp8i7UVYcFNMs/LckiywtOScJhd85KiqvRPtgnkMKGJfRt28Iva0zQ8js6CQFn7WJPA3GwcrzyLzQMNCOscCeqnZWgf8gdtSvV9vFS38myjqlM3t16NXvEH+LShl5q2+QtAFrQ+j/t0SzMRh/2lzR3A247VZZ9G5Jwgtck41Au+VkD4yVazn5IFqaMTTsnKMZLYFJkhRUXZPEYK2Qg7l2xCAjnGidw406jAB5rX3/z1nHJWbDwT5M9z/TF6RuifZqB1e72RADwpm5iyp5pE1pPsRb/n95BbKGWs1MglchIP13p0X574Sob5iFDdZ6xs4x9s2wWhpRXCibeO7Z9+xMWYCe33AnCDD47vJ47+r7sfETTXGqILR0PfGq/5ZPU+G6swjykMcLp4ZsrvwNG61gmvmn0or1nwL1MdXUluuwwXzNF88Bs0qfvY8T0Mqte4i+AE6Gbi9oXoGlat/rVcR56feA+YtC9BxGL0rVWF4Iaw6/Bj2e1GTnPbxdX5/dmX0BAs6kZb0qtrYgSAjUH4SgpeaTAo9lyMRcCgjRqbZnyx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199021)(41300700001)(44832011)(66476007)(7416002)(4326008)(66946007)(66556008)(6916009)(478600001)(30864003)(5660300002)(2906002)(316002)(8936002)(8676002)(6666004)(6486002)(52116002)(6512007)(86362001)(1076003)(26005)(6506007)(186003)(83380400001)(36756003)(38350700002)(2616005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGJ2TEFpNXdFdDdDT2pOVHVpb200RWFaMnR5YXJzK2xENVNENFo5VkJFekdT?=
 =?utf-8?B?ZDNjTFJNU0kxM3ZNY1V5cEdWTXZJTzNDcy9ZNXNETlpuWkx5MUZXODQvOEdy?=
 =?utf-8?B?V1NON2JzTmtZTzRObkdDckhsVHdxZjFWMFFjN3pKRUdnZCtGVkZPUkdoNG9w?=
 =?utf-8?B?cXZHNElNRU45b1F1cEZBSVQ0VUtwMEpQYzZvQU9SZnJtUXVoakdvV3orTS8z?=
 =?utf-8?B?OENzcGNvOFpGRWlIS1RJd2FZbFE1K096Z0YrY3lMalF2MHlvZlpnSldOR1pY?=
 =?utf-8?B?WnIwbmFxWTJuVTFQQStZMTYzZS9kNkZQdHFSRjhWUWtMN3Q4SkFwcTRZRHE1?=
 =?utf-8?B?MXF0UFdMVEcwaTZOdHhWbDMvZVh0bUhLS3U5MnlDcEZrbUh5di85bjV2R0lF?=
 =?utf-8?B?RXVVVWRzMVhQbE42RTNUVDM0d0lCelROOGkwZ3U3T3hFWTlZeGJ1MWxMU051?=
 =?utf-8?B?QnAxTUtpdUozRjNUTFNlbG5vVk5iV1ZyTEIwQnNBZFNCNVA1Ly9vWnJ5SVFv?=
 =?utf-8?B?d24zcWlkTnBhNU9nYTFYN01PRERaczFmYmY1V1I5VU9RNlI1aWxXcTZUc2oz?=
 =?utf-8?B?aXRoSENXS014REp0R01BMjlCNnJoK2k0ZThUNlQ4aTZZb2xqMTFMNC82YVRz?=
 =?utf-8?B?T0tQN0g2bWJXUjlhakFRVU9QSWtWVTk1WVZWRXZjTkdxYkd5a3lpMURwNUZx?=
 =?utf-8?B?N0RVNWhXYXBZb01VT2I1ejdCUWZRd3FpbU1PYkxUT1pjRThrOVUwREJEQUxH?=
 =?utf-8?B?QzZYek9icFJoZ1k3TkZSUXlWSWhMd2lyd2JJQ2gwaDlMMVBGRTZSeVhROGhL?=
 =?utf-8?B?QzM4alRlNjJodmp3L0x4Y0VtaWRDZHFRYUxHZCtWWTNWTHVETytLL3V4dVp2?=
 =?utf-8?B?NFlWYTZMeEkxRUlOQ2VlempjSWlKUjhkdDFPYWlieHRzaVpZL3ZpdXBEZ004?=
 =?utf-8?B?U1NqZEJLNENvbkRwZ296aWFJSjB1U3U1Q0srZjM0MFlVUEkrU1ZTeVJ3UzVB?=
 =?utf-8?B?eGxNV3QzVlM3V3Q0dUJhcmhHcjFteHdJYWtrWGlYQXZjcnBrV3lQQmFjT1VK?=
 =?utf-8?B?d2llZGV1NGlRa1BoMW9XcENtWGUyd3d6Z1J6Wnk1emlDeWlTOTNCeG9HbFJB?=
 =?utf-8?B?NS95SHNPMlFIOEgrTzBDclFXazFwL2pGbUU2QklXVVRiRCtYampnaGw4SzFy?=
 =?utf-8?B?K1ExNDljZkxrWmdXZkNZVEp1OStEeFJ4elZ0STRPVHJEemZyZDJhbGsrUldn?=
 =?utf-8?B?blBsZ0xVZlVCUnM3eEovOFMwWHozcm9Velk4aWRoUmxjd3M3WEdlM2R0WlFo?=
 =?utf-8?B?cjdKOWFuVUVSb2dJNGMrcHFSMkZLWW0wWXNWTGIyS0s4RlNHekVOMWpZNFY1?=
 =?utf-8?B?VFhlL2JBb3VNRzlqdWZMU3Mwb2h5ajAzMG9nVTg0WG9wMXBuM1JRaHF0dXh0?=
 =?utf-8?B?Y214eGplaEU3YTFzMWY4UkVBQjdWUExBUGlUc3ZXTWVCQlNWc05XMVFKS0xU?=
 =?utf-8?B?OFNJL0xFd3cwc2RpZzd2cmhPYm1yRFFhcmdlZHpBTnFwbFB6N3V4MTY4TnJz?=
 =?utf-8?B?ak1HNnhpR1lWL1JhbEUrV3lKdFFTbTc1R0RDaXh3Y25YOEY2MFRsY0I1SEV1?=
 =?utf-8?B?YjZadU1LQlZLVFlDS092dXc0V2hFWTFmZWNuMVF3cHdrclFudllmMWtjU3JK?=
 =?utf-8?B?NE1weUVpbWhrcGUwdDN1TGhjTXQ2TUJoSlpQZFBUcXo3OHBZUVROdkNoTGpt?=
 =?utf-8?B?TnJ3dzFDd3NXNXNNYWpOK256T0dVR2xIdnd3OHNBSWtYSXY1QlZSdWx3VURK?=
 =?utf-8?B?MzN4SVQ5VjFCSFhvYnNhMU1VdWxzZHQxK1JuVWJlWjlmejA2STllbks2Z1Zz?=
 =?utf-8?B?TEwyRENpazAyQ2t1Q1hqViszVXplanNHWGRJVmNZNkp0Yk1EeU0xWkdBN21R?=
 =?utf-8?B?Z1lPR1o5TVBXeGthR0pkcHJseE8yaEdPVlhTekFTZTIveWMyOExRZXNkTENr?=
 =?utf-8?B?UUw1Zk92MmZuTGoyNFVzS2J3NTBCYVlUeHY5Z0ovbytSZG1TYkI5eVcva0Ju?=
 =?utf-8?B?dEtKY0g2MDJWeEUvRkt4aFJ0b3Q1S3grQzRkcjRHRFFpWG85VjZIYmN0OUpT?=
 =?utf-8?B?WXlUMXVwN3Q4K0ZhWkFzTjdwU3JuYm9xWmZmelR6WitHcldTOUJ2MlRpb2xR?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0532a367-8a63-40cb-f329-08db847646e1
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:26:13.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qelzo0yGnhVqe826uwPfsBP+lWNPoNGhxAcPXX4qlTaRvPlH0oSqd6vf4S0f2uXTzIztO4WGwM6r5d0+310EMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2077
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Lfu3jCYZbBos-VkX49cSYTNdWAewkBl6
X-Proofpoint-ORIG-GUID: Lfu3jCYZbBos-VkX49cSYTNdWAewkBl6
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the basic skeleton of the driver. The driver registers
itself with DRM on probe. Ioctl handlers are currently implemented
as stubs.

Changes since v3:
- Clarify supported GPU generations in driver description
- Use drm_dev_unplug() when removing device
- Change from_* and to_* functions to macros
- Fix IS_PTR/PTR_ERR confusion in pvr_probe()
- Remove err_out labels in favour of direct returning
- Remove specific am62 compatible match string
- Drop MODULE_FIRMWARE()

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 MAINTAINERS                              |   1 +
 drivers/gpu/drm/Kconfig                  |   2 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/imagination/Kconfig      |  15 +
 drivers/gpu/drm/imagination/Makefile     |   9 +
 drivers/gpu/drm/imagination/pvr_device.h | 153 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c    | 510 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.h    |  22 +
 8 files changed, 713 insertions(+)
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c3bcc68f152..9371dc92e6b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10105,6 +10105,7 @@ M:	Sarah Walker <sarah.walker@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
 IMON SOUNDGRAPH USB IR RECEIVER
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..603a57bb2596 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -363,6 +363,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/imagination/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2fcaff2e378b..7fe29ba2e769 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -195,3 +195,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_POWERVR) += imagination/
diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
new file mode 100644
index 000000000000..15efe67f13e1
--- /dev/null
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0 OR MIT
+# Copyright (c) 2022 Imagination Technologies Ltd.
+
+config DRM_POWERVR
+	tristate "Imagination Technologies PowerVR Graphics (Series 6 and later)"
+	depends on ARM64
+	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_SCHED
+	select FW_LOADER
+	help
+	  Choose this option if you have a system that has an Imagination
+	  Technologies PowerVR GPU (Series 6 or later).
+
+	  If "M" is selected, the module will be called powervr.
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
new file mode 100644
index 000000000000..62ccf0ccbd51
--- /dev/null
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0 OR MIT
+# Copyright (c) 2022 Imagination Technologies Ltd.
+
+subdir-ccflags-y := -I$(srctree)/$(src)
+
+powervr-y := \
+	pvr_drv.o \
+
+obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
new file mode 100644
index 000000000000..42224b5247df
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_DEVICE_H
+#define PVR_DEVICE_H
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_mm.h>
+
+#include <linux/bits.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+/**
+ * struct pvr_device - powervr-specific wrapper for &struct drm_device
+ */
+struct pvr_device {
+	/**
+	 * @base: The underlying &struct drm_device.
+	 *
+	 * Do not access this member directly, instead call
+	 * from_pvr_device().
+	 */
+	struct drm_device base;
+};
+
+/**
+ * struct pvr_file - powervr-specific data to be assigned to &struct
+ * drm_file.driver_priv
+ */
+struct pvr_file {
+	/**
+	 * @file: A reference to the parent &struct drm_file.
+	 *
+	 * Do not access this member directly, instead call from_pvr_file().
+	 */
+	struct drm_file *file;
+
+	/**
+	 * @pvr_dev: A reference to the powervr-specific wrapper for the
+	 *           associated device. Saves on repeated calls to
+	 *           to_pvr_device().
+	 */
+	struct pvr_device *pvr_dev;
+};
+
+#define from_pvr_device(pvr_dev) (&pvr_dev->base)
+
+#define to_pvr_device(drm_dev) container_of_const(drm_dev, struct pvr_device, base)
+
+#define from_pvr_file(pvr_file) (pvr_file->file)
+
+#define to_pvr_file(file) (file->driver_priv)
+
+/**
+ * DOC: IOCTL validation helpers
+ *
+ * To validate the constraints imposed on IOCTL argument structs, a collection
+ * of macros and helper functions exist in ``pvr_device.h``.
+ *
+ * Of the current helpers, it should only be necessary to call
+ * PVR_IOCTL_UNION_PADDING_CHECK() directly. This macro should be used once in
+ * every code path which extracts a union member from a struct passed from
+ * userspace.
+ */
+
+/**
+ * pvr_ioctl_union_padding_check() - Validate that the implicit padding between
+ * the end of a union member and the end of the union itself is zeroed.
+ * @instance: Pointer to the instance of the struct to validate.
+ * @union_offset: Offset into the type of @instance of the target union. Must
+ * be 64-bit aligned.
+ * @union_size: Size of the target union in the type of @instance. Must be
+ * 64-bit aligned.
+ * @member_size: Size of the target member in the target union specified by
+ * @union_offset and @union_size. It is assumed that the offset of the target
+ * member is zero relative to @union_offset. Must be 64-bit aligned.
+ *
+ * You probably want to use PVR_IOCTL_UNION_PADDING_CHECK() instead of calling
+ * this function directly, since that macro abstracts away much of the setup,
+ * and also provides some static validation. See its docs for details.
+ *
+ * Return:
+ *  * %true if every byte between the end of the used member of the union and
+ *    the end of that union is zeroed, or
+ *  * %false otherwise.
+ */
+static __always_inline bool
+pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
+			      size_t union_size, size_t member_size)
+{
+	/*
+	 * void pointer arithmetic is technically illegal - cast to a byte
+	 * pointer so this addition works safely.
+	 */
+	void *padding_start = ((u8 *)instance) + union_offset + member_size;
+	size_t padding_size = union_size - member_size;
+
+	return !memchr_inv(padding_start, 0, padding_size);
+}
+
+/**
+ * PVR_STATIC_ASSERT_64BIT_ALIGNED() - Inline assertion for 64-bit alignment.
+ * @static_expr_: Target expression to evaluate.
+ *
+ * If @static_expr_ does not evaluate to a constant integer which would be a
+ * 64-bit aligned address (i.e. a multiple of 8), compilation will fail.
+ *
+ * Return:
+ * The value of @static_expr_.
+ */
+#define PVR_STATIC_ASSERT_64BIT_ALIGNED(static_expr_)                     \
+	({                                                                \
+		static_assert(((static_expr_) & (sizeof(u64) - 1)) == 0); \
+		(static_expr_);                                           \
+	})
+
+/**
+ * PVR_IOCTL_UNION_PADDING_CHECK() - Validate that the implicit padding between
+ * the end of a union member and the end of the union itself is zeroed.
+ * @struct_instance_: An expression which evaluates to a pointer to a UAPI data
+ * struct.
+ * @union_: The name of the union member of @struct_instance_ to check. If the
+ * union member is nested within the type of @struct_instance_, this may
+ * contain the member access operator (".").
+ * @member_: The name of the member of @union_ to assess.
+ *
+ * This is a wrapper around pvr_ioctl_union_padding_check() which performs
+ * alignment checks and simplifies things for the caller.
+ *
+ * Return:
+ *  * %true if every byte in @struct_instance_ between the end of @member_ and
+ *    the end of @union_ is zeroed, or
+ *  * %false otherwise.
+ */
+#define PVR_IOCTL_UNION_PADDING_CHECK(struct_instance_, union_, member_)     \
+	({                                                                   \
+		typeof(struct_instance_) __instance = (struct_instance_);    \
+		size_t __union_offset = PVR_STATIC_ASSERT_64BIT_ALIGNED(     \
+			offsetof(typeof(*__instance), union_));              \
+		size_t __union_size = PVR_STATIC_ASSERT_64BIT_ALIGNED(       \
+			sizeof(__instance->union_));                         \
+		size_t __member_size = PVR_STATIC_ASSERT_64BIT_ALIGNED(      \
+			sizeof(__instance->union_.member_));                 \
+		pvr_ioctl_union_padding_check(__instance, __union_offset,    \
+					      __union_size, __member_size);  \
+	})
+
+#endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
new file mode 100644
index 000000000000..2035131e6177
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_drv.h"
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+/**
+ * DOC: PowerVR (Series 6 and later) Graphics Driver
+ *
+ * This driver supports the following PowerVR graphics cores from Imagination
+ * Technologies:
+ *
+ * * AXE-1-16M (found in Texas Instruments AM62)
+ */
+
+/**
+ * pvr_ioctl_create_bo() - IOCTL to create a GEM buffer object.
+ * @drm_dev: [IN] Target DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ * &struct drm_pvr_ioctl_create_bo_args.
+ * @file: [IN] DRM file-private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_BO.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if the value of &drm_pvr_ioctl_create_bo_args.size is zero
+ *    or wider than &typedef size_t,
+ *  * -%EINVAL if any bits in &drm_pvr_ioctl_create_bo_args.flags that are
+ *    reserved or undefined are set,
+ *  * -%EINVAL if any padding fields in &drm_pvr_ioctl_create_bo_args are not
+ *    zero,
+ *  * Any error encountered while creating the object (see
+ *    pvr_gem_object_create()), or
+ *  * Any error encountered while transferring ownership of the object into a
+ *    userspace-accessible handle (see pvr_gem_object_into_handle()).
+ */
+static int
+pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
+		    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_get_bo_mmap_offset() - IOCTL to generate a "fake" offset to be
+ * used when calling mmap() from userspace to map the given GEM buffer object
+ * @drm_dev: [IN] DRM device (unused).
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_get_bo_mmap_offset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET.
+ *
+ * This IOCTL does *not* perform an mmap. See the docs on
+ * &struct drm_pvr_ioctl_get_bo_mmap_offset_args for details.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%ENOENT if the handle does not reference a valid GEM buffer object,
+ *  * -%EINVAL if any padding fields in &struct
+ *    drm_pvr_ioctl_get_bo_mmap_offset_args are not zero, or
+ *  * Any error returned by drm_gem_create_mmap_offset().
+ */
+static int
+pvr_ioctl_get_bo_mmap_offset(__always_unused struct drm_device *drm_dev,
+			     void *raw_args, struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_dev_query() - IOCTL to copy information about a device
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_dev_query_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DEV_QUERY.
+ * If the given receiving struct pointer is NULL, or the indicated size is too
+ * small, the expected size of the struct type will be returned in the size
+ * argument field.
+ *
+ * Return:
+ *  * 0 on success or when fetching the size with args->pointer == NULL, or
+ *  * -%E2BIG if the indicated size of the receiving struct is less than is
+ *    required to contain the copied data, or
+ *  * -%EINVAL if the indicated struct type is unknown, or
+ *  * -%ENOMEM if local memory could not be allocated, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
+		    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_context() - IOCTL to create a context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if provided arguments are invalid, or
+ *  * -%EFAULT if arguments can't be copied from userspace, or
+ *  * Any error returned by pvr_create_render_context().
+ */
+static int
+pvr_ioctl_create_context(struct drm_device *drm_dev, void *raw_args,
+			 struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_context() - IOCTL to destroy a context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_destroy_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if context not in context list.
+ */
+static int
+pvr_ioctl_destroy_context(struct drm_device *drm_dev, void *raw_args,
+			  struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_free_list() - IOCTL to create a free list
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_free_list_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_FREE_LIST.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_free_list_create().
+ */
+static int
+pvr_ioctl_create_free_list(struct drm_device *drm_dev, void *raw_args,
+			   struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_free_list() - IOCTL to destroy a free list
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_destroy_free_list_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_FREE_LIST.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if free list not in object list.
+ */
+static int
+pvr_ioctl_destroy_free_list(struct drm_device *drm_dev, void *raw_args,
+			    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_hwrt_dataset() - IOCTL to create a HWRT dataset
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_hwrt_dataset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_HWRT_DATASET.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_hwrt_dataset_create().
+ */
+static int
+pvr_ioctl_create_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
+			      struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_hwrt_dataset() - IOCTL to destroy a HWRT dataset
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_destroy_hwrt_dataset_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if HWRT dataset not in object list.
+ */
+static int
+pvr_ioctl_destroy_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
+			       struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_create_vm_context() - IOCTL to create a VM context
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN/OUT] Arguments passed to this IOCTL. This must be of type
+ *                     &struct drm_pvr_ioctl_create_vm_context_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_CREATE_VM_CONTEXT.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_vm_create_context().
+ */
+static int
+pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
+			    struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_destroy_vm_context() - IOCTL to destroy a VM context
+￼* @drm_dev: [IN] DRM device.
+￼* @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+￼*                 &struct drm_pvr_ioctl_destroy_vm_context_args.
+￼* @file: [IN] DRM file private data.
+￼*
+￼* Called from userspace with %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT.
+￼*
+￼* Return:
+￼*  * 0 on success, or
+￼*  * -%EINVAL if object not in object list.
+ */
+static int
+pvr_ioctl_destroy_vm_context(struct drm_device *drm_dev, void *raw_args,
+			     struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_vm_map() - IOCTL to map buffer to GPU address space.
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_vm_map_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_VM_MAP.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if &drm_pvr_ioctl_vm_op_map_args.flags is not zero,
+ *  * -%EINVAL if the bounds specified by &drm_pvr_ioctl_vm_op_map_args.offset
+ *    and &drm_pvr_ioctl_vm_op_map_args.size are not valid or do not fall
+ *    within the buffer object specified by
+ *    &drm_pvr_ioctl_vm_op_map_args.handle,
+ *  * -%EINVAL if the bounds specified by
+ *    &drm_pvr_ioctl_vm_op_map_args.device_addr and
+ *    &drm_pvr_ioctl_vm_op_map_args.size do not form a valid device-virtual
+ *    address range which falls entirely within a single heap, or
+ *  * -%ENOENT if &drm_pvr_ioctl_vm_op_map_args.handle does not refer to a
+ *    valid PowerVR buffer object.
+ */
+static int
+pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
+		 struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/**
+ * pvr_ioctl_vm_unmap() - IOCTL to unmap buffer from GPU address space.
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_vm_unmap_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_VM_UNMAP.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if &drm_pvr_ioctl_vm_op_unmap_args.device_addr is not a valid
+ *    device page-aligned device-virtual address, or
+ *  * -%ENOENT if there is currently no PowerVR buffer object mapped at
+ *    &drm_pvr_ioctl_vm_op_unmap_args.device_addr.
+ */
+static int
+pvr_ioctl_vm_unmap(struct drm_device *drm_dev, void *raw_args,
+		   struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+/*
+ * pvr_ioctl_submit_job() - IOCTL to submit a job to the GPU
+ * @drm_dev: [IN] DRM device.
+ * @raw_args: [IN] Arguments passed to this IOCTL. This must be of type
+ *                 &struct drm_pvr_ioctl_submit_job_args.
+ * @file: [IN] DRM file private data.
+ *
+ * Called from userspace with %DRM_IOCTL_PVR_SUBMIT_JOB.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if arguments are invalid.
+ */
+static int
+pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
+		      struct drm_file *file)
+{
+	return -ENOTTY;
+}
+
+#define DRM_PVR_IOCTL(_name, _func, _flags) \
+	DRM_IOCTL_DEF_DRV(PVR_##_name, pvr_ioctl_##_func, _flags)
+
+/* clang-format off */
+
+static const struct drm_ioctl_desc pvr_drm_driver_ioctls[] = {
+	DRM_PVR_IOCTL(DEV_QUERY, dev_query, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_BO, create_bo, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(GET_BO_MMAP_OFFSET, get_bo_mmap_offset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_VM_CONTEXT, create_vm_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_VM_CONTEXT, destroy_vm_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(VM_MAP, vm_map, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(VM_UNMAP, vm_unmap, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_CONTEXT, create_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_CONTEXT, destroy_context, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_FREE_LIST, create_free_list, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_FREE_LIST, destroy_free_list, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(CREATE_HWRT_DATASET, create_hwrt_dataset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(DESTROY_HWRT_DATASET, destroy_hwrt_dataset, DRM_RENDER_ALLOW),
+	DRM_PVR_IOCTL(SUBMIT_JOBS, submit_jobs, DRM_RENDER_ALLOW),
+};
+
+/* clang-format on */
+
+#undef DRM_PVR_IOCTL
+
+/**
+ * pvr_drm_driver_open() - Driver callback when a new &struct drm_file is opened
+ * @drm_dev: [IN] DRM device.
+ * @file: [IN] DRM file private data.
+ *
+ * Allocates powervr-specific file private data (&struct pvr_file).
+ *
+ * Registered in &pvr_drm_driver.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%ENOMEM if the allocation of a &struct ipvr_file fails, or
+ *  * Any error returned by pvr_memory_context_init().
+ */
+static int
+pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file;
+
+	pvr_file = kzalloc(sizeof(*pvr_file), GFP_KERNEL);
+	if (!pvr_file)
+		return -ENOMEM;
+
+	/*
+	 * Store reference to base DRM file private data for use by
+	 * from_pvr_file.
+	 */
+	pvr_file->file = file;
+
+	/*
+	 * Store reference to powervr-specific outer device struct in file
+	 * private data for convenient access.
+	 */
+	pvr_file->pvr_dev = pvr_dev;
+
+	/*
+	 * Store reference to powervr-specific file private data in DRM file
+	 * private data.
+	 */
+	file->driver_priv = pvr_file;
+
+	return 0;
+}
+
+/**
+ * pvr_drm_driver_postclose() - One of the driver callbacks when a &struct
+ * drm_file is closed.
+ * @drm_dev: [IN] DRM device (unused).
+ * @file: [IN] DRM file private data.
+ *
+ * Frees powervr-specific file private data (&struct pvr_file).
+ *
+ * Registered in &pvr_drm_driver.
+ */
+static void
+pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
+			 struct drm_file *file)
+{
+	struct pvr_file *pvr_file = to_pvr_file(file);
+
+	kfree(pvr_file);
+	file->driver_priv = NULL;
+}
+
+DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
+
+static struct drm_driver pvr_drm_driver = {
+	.driver_features = DRIVER_RENDER,
+	.open = pvr_drm_driver_open,
+	.postclose = pvr_drm_driver_postclose,
+	.ioctls = pvr_drm_driver_ioctls,
+	.num_ioctls = ARRAY_SIZE(pvr_drm_driver_ioctls),
+	.fops = &pvr_drm_driver_fops,
+
+	.name = PVR_DRIVER_NAME,
+	.desc = PVR_DRIVER_DESC,
+	.date = PVR_DRIVER_DATE,
+	.major = PVR_DRIVER_MAJOR,
+	.minor = PVR_DRIVER_MINOR,
+	.patchlevel = PVR_DRIVER_PATCHLEVEL,
+
+};
+
+static int
+pvr_probe(struct platform_device *plat_dev)
+{
+	struct pvr_device *pvr_dev;
+	struct drm_device *drm_dev;
+
+	pvr_dev = devm_drm_dev_alloc(&plat_dev->dev, &pvr_drm_driver,
+				     struct pvr_device, base);
+	if (IS_ERR(pvr_dev))
+		return PTR_ERR(pvr_dev);
+
+	drm_dev = &pvr_dev->base;
+
+	platform_set_drvdata(plat_dev, drm_dev);
+
+	return drm_dev_register(drm_dev, 0);
+}
+
+static int
+pvr_remove(struct platform_device *plat_dev)
+{
+	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
+
+	drm_dev_unplug(drm_dev);
+
+	return 0;
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,powervr-seriesaxe", .data = NULL },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dt_match);
+
+static struct platform_driver pvr_driver = {
+	.probe = pvr_probe,
+	.remove = pvr_remove,
+	.driver = {
+		.name = PVR_DRIVER_NAME,
+		.of_match_table = dt_match,
+	},
+};
+module_platform_driver(pvr_driver);
+
+MODULE_AUTHOR("Imagination Technologies Ltd.");
+MODULE_DESCRIPTION(PVR_DRIVER_DESC);
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
new file mode 100644
index 000000000000..55e9b4ad608d
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_drv.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2022 Imagination Technologies Ltd. */
+
+#ifndef PVR_DRV_H
+#define PVR_DRV_H
+
+#include "linux/compiler_attributes.h"
+#include <uapi/drm/pvr_drm.h>
+
+#define PVR_DRIVER_NAME "powervr"
+#define PVR_DRIVER_DESC "Imagination PowerVR Graphics (Series 6 and later)"
+#define PVR_DRIVER_DATE "20220211"
+
+/*
+ * Driver interface version:
+ *  - 1.0: Initial interface
+ */
+#define PVR_DRIVER_MAJOR 1
+#define PVR_DRIVER_MINOR 0
+#define PVR_DRIVER_PATCHLEVEL 0
+
+#endif /* PVR_DRV_H */
-- 
2.41.0

