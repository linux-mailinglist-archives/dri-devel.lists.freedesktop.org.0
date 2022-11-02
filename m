Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4F6166B3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AA310E4D6;
	Wed,  2 Nov 2022 15:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2074.outbound.protection.outlook.com [40.92.99.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8C10E4D7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 15:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8zx23gSFiKXhU9W7qBQf44Tj0qxEZXpqPzqHhky0l4wCoHzvH44jaUy67zRohyCV3LHUZvc3zxTnmQzzf77PJjPnpuSdSlD4W9j/8ivpQU7bKGYiVySh9ypB6+7ZTtJuSp35ngSnLLIQUOvpGiLh9z4JmVme3vsrEB7w4v7SnFBn8zdjDIMyb2uN56va8TKA/lGbnd8xbdQHVUMBec/kjAWDT8p1fNXUUjHCu6w7v4UFAfgVEHWXrmvXzowy4syMkzZZkCA7J+bTQOGcqtxD4qzDswTPmCVmrJGq5hNDY/KUqzA4JW2Rznor1vhIdmk/w3bOmRGn6uh3I9Ca9tNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xQxRB+vXWAaN6lf7I9+zqAqmt3lidWLUa0xSH7X+hw=;
 b=kJIaBC99mT7RxyQu5XkVZoPPxjvkIikZMOkPCGsVf3Tstvm08VUGtgalp5WcNmXFdrSeP5i8EnhV1gQlR57+qdCCiDrcfV2n97qzvnu8VtLpLNauvGtqoFhIAqy2yrEUUDkGxB9apRO2Pc+qhxYlsXXQZe9Qb51cwd9G8JcB+YxLJEwiDIX3ttT0cjNXzZ1mRyFgjpU6GreKwSiQIstw1fjL7ZPppjsXjmlCNtbS3WIIMvye3Skckk108MTfi0+W6VtKgsDXr6JCqy3r9cu9F4vgODlqq3qB47indn2eNX/NqOYLtSfpKZ5mhin1DnJolBeqwmBpU7BYIYA0cohQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xQxRB+vXWAaN6lf7I9+zqAqmt3lidWLUa0xSH7X+hw=;
 b=YWpC3q2UCJljzO5os7oRs2r1qTqlhvWxP9WKS/Icy5RVAL/T4cVID/nsnUdvD9jIxTlx66D4LOGMCKfGFt7rHMy4LKvJ1YVBPA8HieAJVq/Usuf3WrdSkZI4ElpxnnmQSyn5NXIty44Un3ihQev+El4NKh5O/fyzvrKNwu7irdyWTRzQnE8mAqmYZBFLdXOt/pC/wQdiss/pD78C2WjjA6bfWqjk51PTpViflsU/FlUCXxr3hd0TPZXHYqPAcQub0ATjm7YjwADjSdxsmU8+Wcvg/TsOFGOTiR4Kjg6UOPfc8V0jcvvSpkGYw0O9zCx6vJnokPReil2Jl0vOEu1ULQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OS3P286MB2422.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 15:58:42 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5%9]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 15:58:42 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH v3] dma-buf: fix racing conflict of dma_heap_add()
Date: Wed,  2 Nov 2022 23:58:23 +0800
Message-ID: <TYCP286MB2323D71DEC1D008BEA6F7ABBCA399@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Hb13McbHy8iya2slT4EkVubLNUyTNzO/]
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221102155823.406044-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OS3P286MB2422:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dd0f8a-61d7-4684-9574-08dabceb1d59
X-MS-Exchange-SLBlob-MailProps: ZLYX9kf+sFZrWcqlYuxsQ4SinJ0dkCiqXcsavXO7jaSL3FwrSbAMOCLBPddQdbgOgPvnX69oxlNgKJ13hRvJznrLWDHsVacx/W3igzW+0IarXyvR90JSYQOssUT4M9UQ9pn45aEYld6rL6Z7thebJwH4CTCPdVsI8sOSlhCLLx7EkaIJV1CVvk3qPXrGFGxqhyQH70hgYXtXNCAx/ZbqE5GzvwcM23aX2CfS34ueYVW06gNOy/1Xk5AqIc3hemdUfECHrkBoNspWEhHy6blrgUjbi/a5dJxqgIqGIjTRktm9zTFXH13YIGDwLThb+rxl3jSzeeYOqJxZkp2wZ9X3tF5CKL1a4K792NeH0deN+nHJ+Vmc6ZFZmzb/ccXfZdTwEAjUKbBd9KW7MQx6apt2OKbaD4juwuREzkziQs2SWcr6heVQbMkrL2TbDAQpVyMyEE3JAPK3FqXjTTJkI9qWYdlVTBTTwl1iVSIcCr0eRCNOyt+GIYVr9n827wU2ZzbmpgDh8/rCTtSKTljLlSQTJ0YcO61dUo3OFoi1ZsX+1xppMIcvFqo+HceSmjRCVq9vaYd/DF0uUAhYSStRRNKfeB1Zaed/7iC7aNy6lCnfkQ+GMl8vXFcxlCxBNZW8XbIQpYh/vBN6Gn0+0gXyKyhSvSO6zyQr01qUar4rlh2bzz9AdPwaIwkuWEjZ373L7Dnn5bJbEnQvIl7QXI1JTy4I7j9L8DqoPYDgqUINEpSmCK1tQGfl2FUgwgbP+u8MHzj/BtV3uP/ggMeXHCNxyRnWLU0QQrb7RTT2guMROYrqzStA/zMSrFyZOA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yBYn2OGZXdgfuBEJGo+7riIFDC5SgdaYSlouJwrH0jR9JzJADrhs9ziS3SSjIVaQsHL0bXHXBxRoNfluDm77FenEagX4z/uqrJ3pfuFD0Q+G1Q6bDOTwKutM5bNEknezWABkbKSuW+1hfXNErVCmv1KmjAgTQwzNSnlinusp88TcDcMiNKt3/Bau/04hdcPN31r5DbAEnoRdjhmQeu+wsgYTvTxH8FfPi7klhQ298uqxW+u6LYhbjqrgDDKRY9kt8QaRH+3mvRhYf2RGgm5xhBNVPE+GSSf5RXChKVb1Ev57RUhAbPNN/1XZRnjm3uLaL+IUwR8JPnNHtOoqKp3iIC1+txKP9cjvnRROtaECkpPxkGZnnCCaTmwYxfaTGkOhTv4t8CGlAH/TSlOCiwlI02u//jR9xcQUU7IdMJJzTSOrZI0O16YCiopHABEzH17rRwmhMXmtWuLVE5OE6B0z28qVFjtSMBXiWJktUO64MdJFCZWUNeILnnko7ZFf9IQ6UgxpENQFm4P8zNUgdOJr77H+W8d6jphoTX5fTsMTgcbF36CgKl9vg+UazqlfWPv21luXXYXoQqMZc21+rcNnqRKXx0EY6d3Vz7ZgbYfzlMxw4AOae6hBQdAjFGK5nI0l0mpAzeXXrClo2pePF8tMjGxYscrnjmSCf96y5pM0rG1ZE1f8YdV+bErkxOF+8cY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h48OKdY6rzvSrL0/xp2r3+NSu0oqJ1WsAou+sGycyCUnWj0VQ42s/Y1gGzRd?=
 =?us-ascii?Q?fx4KblE7IYeIyxh4w630lQqQf+0Xnm+0jdtJaE0c2pKo+VbcyR28iGyMS8v0?=
 =?us-ascii?Q?bXra7Lo8FU/7q+BTigC8UIC1O2mXm9BOUewQhlPmSOdDx7kSEBlZio4mMB4U?=
 =?us-ascii?Q?kT97IBMeCcgu5I/wzHsSvakqN8B4a82aIeFYchHWIUDTL71a2COW6/b+jKEd?=
 =?us-ascii?Q?X22cOKHNILP8fmpoSGqIWp4Oxam6YrhfT8Y29b5RXVA1+Sy1srI+e+UuyNnN?=
 =?us-ascii?Q?rgJuVSAjZJffyE4AHroYtD3NBfh8sVY9AN2vj48rRuD+at73mCNNlWAgHa2Q?=
 =?us-ascii?Q?mz109Wul3129ZIZOg2iS8TnJBIjLGlu7rq+X7T5l5fZx4qzYvI3WkexDtqn5?=
 =?us-ascii?Q?z+9mnrm5pE8uXHq4kCqNABImC0hFTcWmajX02/JHn+8afOU6u+Uyy1l29pJ4?=
 =?us-ascii?Q?5xyXsoJgLiBOzRyhrX1RMnvM5DvGqDspNfHrTfoTQP+gFcCWKf1oaBzuM+gK?=
 =?us-ascii?Q?q3txn1GIMl62W8hSGdVYroR6ktKI1TiW85/EarQwfQb0u2HdPv3coPTIRhFp?=
 =?us-ascii?Q?0Yg046d8cVrHSL2Ygwjcj2YbrJkrSNQLnJrr0GQdwr/zX2fRPWs7uM6oFnVP?=
 =?us-ascii?Q?Yc7siO8aMrqE7pAx1QW+x9uL+dXPDMUeRqWJSFfB8R3P3az8yVe1f+axpj/b?=
 =?us-ascii?Q?550JKweCDWNvbK/lvI+UpmZalM/z5Jlr0Y26oWtk0ukDulUkgVnSv3QJucQe?=
 =?us-ascii?Q?g+yuj00mtYdJ26XXKDEn1yfTaSdcx8PKlqEF3YIn7TSx106xeoH/lTCPnIYH?=
 =?us-ascii?Q?CCsYsTYxJvsg5G1xJIuMVIWlY4gbgmrvxi3vLKVenP6jR30DoiyAIlo3YR0a?=
 =?us-ascii?Q?amHS2o8cDkS+JSnyBcUmiewYsCnFTIDUSEvEJhYSN8FRze7oyzWaiZIf/OyY?=
 =?us-ascii?Q?iJXKyVr3Jr98WZGxMRMHhmytiNjNPKxFH1MsElspo05o1ng2bB5kh3F5lUFU?=
 =?us-ascii?Q?1KlivwVX1ObOVLufGwKcIVWLOs18sRMx7D2S/MPq4ItzhvGwY/WQZ+u3cf7s?=
 =?us-ascii?Q?5p0Fr7opWXBYPDxSm2CXvMD3VSi3aqTWAM5SH+R0f2aCHY0n/3bxmF96+GuA?=
 =?us-ascii?Q?IuXYNyfFUp4eSjb5QR1Y/dMe/ZOzwpSbPfej/KURGStKVnUzRCuelRFKRH/O?=
 =?us-ascii?Q?5wZNsUUCSU4SHy4Z0XpToj6WYx10poST0xChP4VxIt/pIXWU9VyYqNfuCedU?=
 =?us-ascii?Q?FdBPByMplf8LyG/5vG4RVWgsT/dJYaA20Q0zAx8y3Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dd0f8a-61d7-4684-9574-08dabceb1d59
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 15:58:42.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2422
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

v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/

v1->v2: Narrow down locking scope, check the existence of heap before
insertion, as suggested by Andrew Davis.

v2->v3: Remove double checking.

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")

base-commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/dma-buf/dma-heap.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..7a25e98259ea 100644
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
@@ -283,13 +271,26 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
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
-
+err3:
+	device_destroy(dma_heap_class, heap->heap_devt);
 err2:
 	cdev_del(&heap->heap_cdev);
 err1:
-- 
2.25.1

