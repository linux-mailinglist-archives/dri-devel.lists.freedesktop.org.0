Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B670619C86
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 17:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9DA10E8CE;
	Fri,  4 Nov 2022 16:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2041.outbound.protection.outlook.com [40.92.98.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096C10E8CE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 16:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bbh6U9XHZsCBZcAEmKFfPicrmoZ3BFtWZ4B/HuoXPzQE4JN4zvISmU/2iG5BHi0I/SSB8IXyl8EhRAS5us2k6xTnHzQtrz4rNYLA0LY3ZsISkZ5djjGlRIs8G/AfQHB3gwjbv7O55bxe+YxGKCYF03eLo3w4/KEum58fMVO8qnemW2GOIZTHz6ZU4BVKUntbEYfQLDrF59GobCKg8wYGRuTkgG3W41CIopZYD1EWT20YBRVpBvRI0dY6FWT7njiOnckAAJ3CuNVbyd3BpVphuurbhOeOTlKg4Q1WXxCzMSkoPa8rB9g56lmfqfgjOleY32w01IzkVYLRholPQr0cgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAausU8rFK0NzdqFnWtnDeOC1n9wuoalCC5vsr0tk60=;
 b=XRmUT06Zb10OBTGPTbLBJSVUfqc3S97PgJXxy6Qo/OJyVF+pGA5it0DhcrRLtRjAML94skEvg/QI53WJXCTFWnqjtvWg3YjojjDfM895amxFBq6HKmODMIVBGf9JzK+OxDQS/+U5hdsOyn7rOiNeEswzlCFUOkyc0tTyk7dEK44lTGXtRmJW02vIPVoIAvNC6YVc9FcDBHaj7jZVRxYzdt6U37zGWxQnYnZo4BoKFXr9ZAezPwWRioRR2yzfac/PKPkzJ3ywSwrcoFNzMRjWvWAZAx2Lp7K366BFnuYSj5nOUs3zgFI+JqwX6SATiVA5bVejWR/bXQRCgQ6KsPgutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAausU8rFK0NzdqFnWtnDeOC1n9wuoalCC5vsr0tk60=;
 b=kpu6IZvykMTFZzZP6X/TCqTL6ABOODX3ncl87qO7x+CaZUqKCwxJGn/QLFk11+PHmJ2O0m7jQ9MzKOSaP3sNpIJOqnKe0xr0xCeNfOoMUBX3Rvr/VDuNGGyyX6w1aCeHt4xEB0i7w8b4VCYhKSQRr04UUiisfXzKRNiXgfb+V+oIllDIxfYUu1I3LcG9RjUNoyzipxJ2j9KnVMHayGwISKJ8wwdfN5xdUD3AgX1RuniQhckGPwuwmNlFmYASwSuT1PSAjgppWAAsSsewDxolsFo7zzx21guBusAoThX6rSSIcMleRBDe5J8P5iAFYW50ZB3xoXwqR5HwBGXD37VyQg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYWP286MB3223.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Fri, 4 Nov
 2022 16:06:00 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5%9]) with mapi id 15.20.5791.024; Fri, 4 Nov 2022
 16:06:00 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
Date: Sat,  5 Nov 2022 00:05:36 +0800
Message-ID: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [+1ZKHlzTD/1HMwxkcwagGc0cFaIxQTFu]
X-ClientProxiedBy: TY2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:404:a6::29) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221104160536.4123-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYWP286MB3223:EE_
X-MS-Office365-Filtering-Correlation-Id: 4522d9fd-dda1-4cb9-4da5-08dabe7e776c
X-MS-Exchange-SLBlob-MailProps: hmxDvsT8QC9IPEq7hVSzi8CjtgIfWrB0P2xvIfdtuKc/0tqlgZnU4lfB0vqmy+0SL8Go1P/nWJhrujpcmWhOviI2CQy5eczzf2P6QlNViAm0524ANVYEC6dqDKm6kJ2AxhuAAXi8sBhW7jYXR2BMn4vuab7PL/w4E7XL9CdzT2f3WtvQprRWeukP6A9/0eP9IX2D59tO/tJSyc4ljYdxd0jMSAjOm3KL70dUpfxR0aGNb/z0xxtn7kQSFVZZnzUSRh4BM3JzRgJF5Z06rHY6CEriSsei6U6B/VR9eF5gestn+qOWSBYM3hbVoSTwzY3NkCssF6QS5Y/WGYGTCVMtOW3xjTQ9tRo8pfp+cAIHB1QxyYS4k/GzNThlc6o/EpqB3TUmL8iSrShs5CH3lfOY5pSQUZAQwxfQMWeUrICw/pnfC3aB+9wqhsub/Pp0S9736UOwHQpDeaF8FMJIP41VoCz0fGDvGbsU6G5wnOmElvHfyjfz8Z1t/49VmY7LBtH+qdiMKGvxRVuO0Vxjr37cqKvh5mSM3U7msGy4BslsAhARaKyuVHSfWOrWuFnmh9+o6TiPUA78SsgBjbX+Q5YEzJ/bBlHpHIgUAfNkDPtzzel9bYH219+U4GiAz91R48UDoMiw+T/OHXwUxvMcA1/Fet8F3NL+FmBOG5YyaQje3iTPcIYAJ3irhwkV9nO3kPnAMTySEiN5C3NRE6jBnhpKvbjbf3JaVOtaerMMR+6zjiI9I9nvaPvNbFqDY0+ecDISfOgLVHveGXA0x766KJafj4DoQXnazHrDDgeDLo+zuRjbzZDoqVAADg==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nu7IBIHOlDPhMuaYrdBnvYVRRF0dfixRQuPzejFZIGmybqC9VP66uAHfos7T6MC6Qhnuzou4CoXKofwA3V09fk2XI4kZ9B7Dll8Ou1aOzFIkdTO1P0G9ZLJtNSBTQsVP067Vy7bNHlgP8f2BdQUKMfBOdJiMf0VdkYO1NJbil1dCJGpTRUBpUPVw/btiGNkxNs+d0RZlcAhHEB8/5aP5a7QjO/XcHRnSLqLkC9Ab5IT43/3LVDUAdOL5rvvqfeLZ1XbWA3VxQOtTnQF6HJA71HpxVG9Ei6r/94wk4qeivp4AIMK0rO9jXnWFMwGA1lmbyHjxLRT/0cmDYi09Pg/pnXxxeKhYI6tuTWhi/sdu5uU/d6CM+tbqFO++b6oWGf3AUdRMzMGiT1peaEijDHEP7nD6ztuGD36Bb15cDxul4tL8l8K2YtmKVXHc0vrGPtCLi1qLJUxx7eBf8mOcVg5xhJTv2EdtXZdULozpOVvY7jgU8tGTRP+NzP3X+DEHZ2XzvFB8fw+xjg7fddHRzqResYYJyRTd5FSOR+DRfseHP3ZFL2VfRaeN7b/iR9sR09DMY52mZBmcmaXrReYBlL+13ZAxscjJr6Pz2/0IpZeiy5FrZ6wpTlPPOINzlGIg8c7r22VDocqZ7yraUHk7d+zherd5sRCasIbDoHI8C76XgeuUgFMQch66nzpb4lULetZP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ImzAWx0EIQC9SbCxcmZTO3K7PeKDTSWsUrClVGni2cSBGE3GBYoy+M5R31Sn?=
 =?us-ascii?Q?RRxzypqSm+UjCmNA0+M7fui9ySQFqyCgWBF853lhP9wZbwMivzSL5j2eXzpI?=
 =?us-ascii?Q?b13NOcYMuTXL3TJy7lbPnoGvTmT13V7MbU0/LS/x+Cmf9nDzu8/pzFTfF77+?=
 =?us-ascii?Q?hElAP70uef6Iw9hU4zFlAXT8IYrIINWXivXDeM6rulMqc172mlCnmts8dGi4?=
 =?us-ascii?Q?JWIwsY0sqk8aD+cjMBQ40tsbshZoy3VoVqClHzNRcHXw7tyYD+7TBNHI0Rj6?=
 =?us-ascii?Q?UXDMtP57nhWpYv+Knqs9WQshm/DkzVMHBzf58KzjTN1VOoXyMesd6As3oJH8?=
 =?us-ascii?Q?pG+b5hIppMCM8Ns1FChhOQ/UsgWvj341uwJxoBT6KJ0rFjQ1VFshugHHrNZl?=
 =?us-ascii?Q?eTYSgAXwpVa+nW702C0zCctNnvlcjwUyWEfukn8+EX8oj3Lf7lsiq0yr5sWy?=
 =?us-ascii?Q?RruKdiUfqv46fseXtdEP0WeYecCqxmCxDxY0hfJFonipMRCqpG5Z/g+E+Ilm?=
 =?us-ascii?Q?eFSg4kFPq8XzOZaTzdQGwGExxSZMSgE/yJDSvyFEbl0ioNGsdkBpuLhRCIUX?=
 =?us-ascii?Q?25m994dZV3gSV60uVf0kLJKNLFC72KiFA/CaZ6BiKl2sa/z5GvJbQtqcPT57?=
 =?us-ascii?Q?UmM7PJHuY4Mir1VfgTgf3PE9psEWCyhfjbY6UHTCI3hqXwnIV4BKBJ7HH+E1?=
 =?us-ascii?Q?AGerJR6Pbd1LdNkSqJyspWzD1o8zqyrfdqEle/B0pWcyO+4L8ACW98eqT3je?=
 =?us-ascii?Q?MBu20tGD6ar4Wx5tKucVPQ5Ke76oA8lUdPkuAz38fYlsU7OqBsiqfxvhQWqd?=
 =?us-ascii?Q?m1J/uoVwPGo1cmM1xeWlKQ7vUGJZIXneVR/XQEtaPWTOwIQuBJIZsP8M9tfK?=
 =?us-ascii?Q?w+aYi2oZdcrw57bWCyTwSTzgjFbqoFBwHNeYVDOpn2QhtyAtd/kkt2E9pEX/?=
 =?us-ascii?Q?/7nTN/DDqAzvLVWKWQxOOK4tSqem+lJJPmU4y50YiTt3XKRIWX5mK7eKAJvw?=
 =?us-ascii?Q?0Cmgf0kATUL2o/FgsM2Iow/vYt5BmBEz0JZcFTwR7IQh4FDG8fXeRjJnztDN?=
 =?us-ascii?Q?qYE8FCKndlf+kMdfD6LdMIFWI+Ozw1XGFIPSwdVnoZtBNFy8d2aPhODAE45J?=
 =?us-ascii?Q?TeGPIG1UoknJBj4zxafkqGAoOb6TJGYYCVywoM9tPiBOkyrZVO8NrQrxDQBd?=
 =?us-ascii?Q?Hwo7wLQowCYbznHMqRreVabdA84rLdh57v08HGEEWpNw7wL9dWJQCFPxClJw?=
 =?us-ascii?Q?/kDMulpcX9w/YVDvB1XOm9Gh1PIH8nlCFJBVtN1Ajw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4522d9fd-dda1-4cb9-4da5-08dabe7e776c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:06:00.7589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3223
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, afd@ti.com, Dawei Li <set_pte_at@outlook.com>,
 labbott@redhat.com, sspatil@android.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Racing conflict could be:
task A                 task B
list_for_each_entry
strcmp(h->name))
                       list_for_each_entry
                       strcmp(h->name)
kzalloc                kzalloc
......                 .....
device_create          device_create
list_add
                       list_add

The root cause is that task B has no idea about the fact someone
else(A) has inserted heap with same name when it calls list_add,
so a potential collision occurs.

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
v1->v2: Narrow down locking scope, check the existence of heap before
insertion, as suggested by Andrew Davis.
v2->v3: Remove double checking.
v3->v4: Minor coding style and patch formatting adjustment.
---
 drivers/dma-buf/dma-heap.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..59d158873f4c 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		return ERR_PTR(-EINVAL);
 	}
 
-	/* check the name is unique */
-	mutex_lock(&heap_list_lock);
-	list_for_each_entry(h, &heap_list, list) {
-		if (!strcmp(h->name, exp_info->name)) {
-			mutex_unlock(&heap_list_lock);
-			pr_err("dma_heap: Already registered heap named %s\n",
-			       exp_info->name);
-			return ERR_PTR(-EINVAL);
-		}
-	}
-	mutex_unlock(&heap_list_lock);
-
 	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
 	if (!heap)
 		return ERR_PTR(-ENOMEM);
@@ -283,13 +271,27 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		err_ret = ERR_CAST(dev_ret);
 		goto err2;
 	}
-	/* Add heap to the list */
+
 	mutex_lock(&heap_list_lock);
+	/* check the name is unique */
+	list_for_each_entry(h, &heap_list, list) {
+		if (!strcmp(h->name, exp_info->name)) {
+			mutex_unlock(&heap_list_lock);
+			pr_err("dma_heap: Already registered heap named %s\n",
+			       exp_info->name);
+			err_ret = ERR_PTR(-EINVAL);
+			goto err3;
+		}
+	}
+
+	/* Add heap to the list */
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
 
 	return heap;
 
+err3:
+	device_destroy(dma_heap_class, heap->heap_devt);
 err2:
 	cdev_del(&heap->heap_cdev);
 err1:
-- 
2.25.1

