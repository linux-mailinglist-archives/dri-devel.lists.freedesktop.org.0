Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35867FDBA6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABD210E617;
	Wed, 29 Nov 2023 15:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30A10E617
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:38:18 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT7iVSE005101; Wed, 29 Nov 2023 15:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=lLFsOvkKmxDtBKbOb3NiQ+Y8QVm1ttvGTTKY8VVv5AU=; b=WEj
 2qOB/pTFntF62WEJzTtEwk9Cgo+gaBgv/pt8W6w2GDn1ujgAO/QeHUDHpMChZ7wS
 VlFaQA06twLa35c2J6Vo+8mq8G9ETwvTa5xiIA6Si2Bze8yA8YdfZSYbuxhq6mQo
 InsYgvm1KmmQcOcsY8NzvE1LDviW7AIUi9hbyo7M9mB3yaamKKG8eFYO//CmNVlU
 lmG2s0OizRMFPjR6nI6Vutl0GQst/mLkKArNcsJ8aSrMGAUSlaRqdELsELb+gIAx
 fek7Z4iVUbOfDYCqlwJTHD7eU7+cNOGvDNx+9FohtgR5D9Zl3sCUlhMGynHkUsfN
 brJXQF8HI4DB3pV8Npw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3unvcq8fgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 15:38:04 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 15:38:04 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 15:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeZjnsZd2d2FysoqtvvKo4YhlhqjYVuAvNBqroe/86QSsay0oeC4970AKX5oWzCgjQhzyAox07NUEHtldPGSxAy+SkCnVYCfghJep0tMNmCjAIcfAbgFE6xbypBZB5VuWdscTYmrrSty1jcz1nrss5mEGwPBJV5cjA9iLu57FX9R4Sc80URe0e8JEl5kBT89R/j0zctVFs8RJqQKlWgieq9oBGqrG9TnwpqZj0q3Vkz3kZ5L7ApsPUy0cNT5SH78lVdC3R0J3crDEeTrhsmZb0+EPQJTNFHJ0qzf7DHUQyAmE4ajEBeX0eBl4WcpZMznFwZRDGqzjtBa0Vmp30LfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLFsOvkKmxDtBKbOb3NiQ+Y8QVm1ttvGTTKY8VVv5AU=;
 b=MjOOUgip7XzuYWga1hkDrwEGc9F0qxxQSFiSOTaZi7Qh0a4lr/K0jDEMfbJoU3O3CZUAKPFxnxrAjiiIAur5sJdfXi2m9PQ8SQmWheRmTMwPyra+EEV5MvICPxOOe5Conx5IGKJEItY4svUbMQfK2d3PJ1HYOOfC3DmNm8dXVC5hl3rBlHaVQ/hr9gn2MkV5xxk1g70ZHWFk+18KhD3uGcP2fUqYIky9WvHcisUqwLG7w5k/TXcByQL1+My5VCiPPNBLOSR8r2Ttf5sggUoa+aR/fV9FvpxS98onunbxEMuPbfKq8rVgTowPzXfcLhKATX3G6bb2TrP3E15/mJ+Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLFsOvkKmxDtBKbOb3NiQ+Y8QVm1ttvGTTKY8VVv5AU=;
 b=QyUrjqnsNYe0i/UAvDdSbTbrb1rCZVA5yYf6c7XgQo40Thg5SJs/2XJJsac/9JPUKLutR/3vNdW/4WJHSQImV1Yvd0cQ0HwUewLRN8X+XigzU6KyinntgF+z9noHqb8MK8ew2kPv4xVlQgRNOkEuqm7A8hIBPzt0PY3z+mc7XyQ=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB5951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 15:38:01 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 15:38:01 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] drm/imagination: pvr_device_process_active_queues now
 static
Date: Wed, 29 Nov 2023 15:37:01 +0000
Message-Id: <20231129153703.162642-3-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129153703.162642-1-donald.robson@imgtec.com>
References: <20231129153703.162642-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b436d2d-70dd-442d-6a35-08dbf0f12b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TClCkwVJ9bYjAm/KRprxRLcR9509NSiCKbDTgOAmgaPBqBT53cAzayERto/4BqMsmGAIIs5De5g56voXg+00EZhGlka9I6vPkL62qq3tKn8s+ujb4jCjO1oGuHZvIdSHfZii/gPKeqXQclrpYofDio/8t5hHIHylexbRBhMyixjij0KQZnDzVAX8jUWAnX2LwRwZXXjxu0NCxChhFnIjO8IyuFet5c2sELATjFfQmGkfjQqEz4wOkxGDrzcqbEcoOjOGBS/ceM55Y7DPYNMieiwEtt/qAffEpbU8AxEASIBlWJYm0J+EMrPbECMVId7wz0+qO0p+h2iapJmgieztMwEZLb56XTPvjlziY6kNZQlRE6UnKA1tn5wy8DkPPreLPyKthqSlZCPDoPU1EA8Oq06RAQ1Szwht2y8FD2o/2fwDJBWwLLmg0Se9SJmsI5ykwlSumW6nNYDyttT1a0gJr/6ax4EulolzENm881JBnJpT10aqPCbtv359PAF8cuu0BI35BfdR5Ct03cMFwOw5Ql0s/V2c5twdu9bMUHhmn0ocyBsOHjZawxLmh4HV0P17qAJkvkMOOpFD6lCyo4/TcNpvDW9hh5viQnyruTzAJA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(1076003)(26005)(8936002)(8676002)(4326008)(7416002)(6486002)(478600001)(44832011)(86362001)(54906003)(966005)(66946007)(66476007)(66556008)(38100700002)(83380400001)(316002)(5660300002)(6506007)(6512007)(38350700005)(41300700001)(2906002)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPsW8MD2EtXdyYKoy7hYzEDl+DcHdTSDXuSx1wFvvckA3fHZprnRPYpTySqg?=
 =?us-ascii?Q?M5xZn+/DRDopsNqh+osqqdrknQfGSheBOICX1oeu2jCcF/iJdaHKxpYNbHzr?=
 =?us-ascii?Q?dn2ep8XxW42X2EspBuvOjM7mzZH0XLGpLVGmSD3sF3QMVf5c0KlusG18ugoy?=
 =?us-ascii?Q?y+a6+eAwIGv9tJPy5BqeS2nBbd5LyrkLMZW8cmBXuZrV5/0Cca1OwWrfXDtI?=
 =?us-ascii?Q?0B7HV9CnsYlAR1MfU/SVY48BEOjXOdj3amPTxcznaxZ3FBcwsw48YAfHOCnG?=
 =?us-ascii?Q?8N267zv5W8k/QL4YtFOWJFafTEiy/f3d/qYxJYI0QfnOhRUZOYLUC5lQsQmj?=
 =?us-ascii?Q?fMB0J2PD83JEu1mSHitdDBeoj6yy0FRVXLyFGDsmc+Z5OZlmnKPNSzDo9oa4?=
 =?us-ascii?Q?cN3mDQR+YxQoLKIKRS3bS6jECrUWJRuPpMYl4pvJrbPhvxhRESD1wNXoNFFw?=
 =?us-ascii?Q?t2Wq918n8GOTKr8zGfEwaV4q2gu6memZ+/uGlBAuvhEO5U7MhLJaGCWsJ8zH?=
 =?us-ascii?Q?KpjJNzEe8ZYzHcfhTfLrF4IszvDvJCeUk51e2VMtoHRXhI/3oihj/fl7UuGD?=
 =?us-ascii?Q?gUBF5M7eCQ3386jiYk+NLiP/Kw1EljoqOfnGWYzVKnvpj1GXQWsftkBZwj8t?=
 =?us-ascii?Q?cQW82N+N1mqFAbZS2kATcxG8fGzLJyFK1rsFUQBUxj2tguswmNG7rCReboxj?=
 =?us-ascii?Q?LXkrJq6zeQ3VBMXkE1wGVD7iPq+T1Eo211+coVNTU5Nh58VZ1nprv9dymrSb?=
 =?us-ascii?Q?lPVLr9nQkif/zfgrPlum+q3AUWI3pgfYREB7hfzujplmWsWlGjHUYU2fqZLX?=
 =?us-ascii?Q?jRF6RvQtgYCY4VRDKAtF3AxoBzZFFFSr/R8Gsq9Qz6yYGvYsiNJT/gvck56E?=
 =?us-ascii?Q?FTvTKRcmF7xcKBXgvPH0KAobsBcswu+gJ61wU/Yz1K3Px9EiBDzV17t9b3GN?=
 =?us-ascii?Q?oBMRu6Uglig4szK11osYRyISppAy+AXBHcXMETOqOh/cDsz+VGolNJIJhaVG?=
 =?us-ascii?Q?fHffHDKoLxwCOmcM20wxLIXegFuFUgDHjDvgcEr9TMxwQFbVm+qRNwlNJjaW?=
 =?us-ascii?Q?0T10gBAt9Pz1+oW0tCx7GOsVKDeie6HPIuWIy6lQ9E4K/nR31PFvkeFO19Qg?=
 =?us-ascii?Q?sF7Ijul4fTbFre4hSSt/IfvtFymu9CXCXY/xDn5K+i4PMAfwjWLD21+E6eZM?=
 =?us-ascii?Q?/qpsNVNtLk3VYHMwDY5Hysi8vDUVaP5nS/tIJz5nzzGTqhRqJOuR9LdmQbjt?=
 =?us-ascii?Q?LorsQb8EgXnxSQSF56Fp32ziFnYfE09j/OcLJcyJEBbkv1wjgaD6rBNZMv8R?=
 =?us-ascii?Q?ybEEECqbTgrZh99qe5QHKQYGayEbeMVzR9kdS+bFTAuWKBd3hsc6dlclWxVd?=
 =?us-ascii?Q?xhg0cdc8UpjunkdRt11Za8PwTeNoe2EG7u5o4qub13thbyuZBLmLRV2iP064?=
 =?us-ascii?Q?vxK5LHPYKL2hiJWxNcigKGXH+KpPp448/9L0Df+yP3tnCygdyvWs3fcfE7O0?=
 =?us-ascii?Q?SjfuWl2+SWT42Bqkj/+y7RuHnKmklYRawVx8iRreet8UnuWEQUCtv0PR6IS/?=
 =?us-ascii?Q?r8fMOOhjs426QTiwxgf7FnU1cLHNaoIkkaV3LUwmVy6FYP1h5WDWxLd1kyrv?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b436d2d-70dd-442d-6a35-08dbf0f12b88
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:38:01.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbDqHNcQ6AITDgGmFFZkFUkY91dANjdR16A005xwuLbvmTahmwN69uWv99lLGWG4d/iC7irCz19SrQFLILKdcHPCYTEyenBcHl2cXvlYEhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5951
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RpjcjnaCDT1PflljiKQZUpsAtN5Y0K4p
X-Proofpoint-ORIG-GUID: RpjcjnaCDT1PflljiKQZUpsAtN5Y0K4p
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/
Fixes: c98dab7a5f5f ("drm/imagination: Implement job submission and scheduling")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..048eba776cf2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -127,7 +127,7 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
  * This is called any time we receive a FW event. It iterates over all
  * active queues and calls pvr_queue_process() on them.
  */
-void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
+static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
 {
 	struct pvr_queue *queue, *tmp_queue;
 	LIST_HEAD(active_queues);
-- 
2.25.1

