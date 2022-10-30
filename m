Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606C612A5F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 12:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125610E038;
	Sun, 30 Oct 2022 11:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2046.outbound.protection.outlook.com [40.92.98.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9510E038
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 11:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuTBaEmzOCxjLSJWXzLCCJkrgduIhexB/CjDrjGN4IcDzGO4EQsa6hPlzqXyKIfwDOB4EjY8ALWLvkdIksEzKEU1dEwNhl+mKvm/Oz3uOSbomC+EeXvdweGPmpWnyxOFbAFM25rpQwRnJUZ6yiXJNfg3obVNVX0ESbP/+3F0lssnC8gs8DtprlClQ2vx5ERiER2xWPY9S6fz/EB/4vtAJIm9LrGBcPurOX0+usKII0g4shsBjwj/fUtou9AcTPKTUR4vK/+DVAzzp0ZU/9Chr7Hnx289r9H4oIMYEVSPeyKZNx0tuJRAwMIvjW5khZCOytc7OufNr1DrrS/jic8o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svsL4S9jfk3q5oc4G6+CXyigCp88sv9APcA7xWoQvzk=;
 b=fVIAlrOXPdSef1NDonDUPfCAVVmFTQAC7FeBD0abt2pGz29C6YOJbbuRFR727HaUUEsDrY7J9DJUjayc+dexDpvdhkr7rkOnWkICf+VUr8eUMkR1KOufXaR7UlTnhha3HfxZIiGffveoXcXIJIL9k6MEnDkYADVRma2M1YmIEx+9Y3Zhn65mTnrit3OVBci/xBCDSi9uHtdNv65OJYlpdGMnH+Q3+Fq1o7CWIevlKuU9cMy97U2wkIurcVDofX9MlS/rq5+Xh227BxE9cIGb+kVNjOmF7XFyEZ5vOadBzZxUGsk0CycAt6FtfiGAXWd1cilfqgym667tar9KR5hGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svsL4S9jfk3q5oc4G6+CXyigCp88sv9APcA7xWoQvzk=;
 b=dD6Cda0KIGFIL+Rpuh60/dgKbd/WmEZ9DF2ULWpJGXK99mUl4HHGEnJKnScSalvcK2bpVXXw96HnePe0i7qIAmHYvg7ivGCAU2on91qH1kVbnBNd6ntIkwfabAKeCOLF4895avFat2jzXLihTiQqgOuHbn7bn6rlL67eTaVQ8lz15TL0oT/ZBsxATdl+c4JXQWL/o3Ln9XiHfHpYbXh2jCWd72XGzTXawGNHcIw/SBRkBDMFJimM2jrKsg7Z3JWQIOeJ/bx6kCRMU3RU9AGhaQfDY2nAYSC+FqF3dp5YOyaEaytDzHPDqC4st29IZPilKZYkjW33XmaqN532BXUZBQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OS3P286MB2709.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sun, 30 Oct
 2022 11:37:12 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5%7]) with mapi id 15.20.5769.018; Sun, 30 Oct 2022
 11:37:12 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH] dma-buf: fix racing conflict of dma_heap_add()
Date: Sun, 30 Oct 2022 19:37:00 +0800
Message-ID: <TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Um6xlQbCyYoT19WyxqearVE+xI9G5zJia2KmZRKIW1k=]
X-ClientProxiedBy: TY1PR01CA0184.jpnprd01.prod.outlook.com (2603:1096:403::14)
 To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221030113700.3300-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OS3P286MB2709:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdf1d64-4620-4054-bfbc-08daba6b15da
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mv1OqsmyvwVkO5pclI01FVpovJWLvgsAQ8XASbU4UOFaqFZL/PS2XbnOslcIt6Wz0uOSrOC9MGcWkJXC3bdrn+h519oQNbJEaL8MJvXBIOdsh89jAQfeDMMTP5LypWXzKXsx8nlrc/aMGMQfzEhe+Ws6WwLSAnvj0I7dCqywraaYzSvSCw7SxCd733Zr9JOCQPxgKAUs/6Rksg2iItWHErYYFlyGYezzUOKi/inmm0bxARf2o2Rz1/E47PEK37FbCpY8CJBfgqDPLx4nEfEhT6s3t7MW5sfqrS9qJc3wlFMRsDElf355N0PuFG0d/lsg1dFBeTDwXYGm1BcjdCgdBdkmWpgtd0EMxd5T2EXL6/FRB6dfaubfQXoceHEbgRoklqTeOddYl/42zOjEyROZcfZZN254tsOJB7MTyH/XHU0eOTZ1I0d92ANjy92T/UapdclR/SN6T/PgYMRv0XFcB7YQg3Ss/PF6yWMioH/qaCcJrBHqa3nSovpVSlk7Frm8qyvrI7/A+Ip0rSY2JKSJEh4NvycrQVplHqVj8S+/JCMacYgvCJpZSWUp5S3N8UYQuLXjvau2u+gQ5oS1PwXUXEnjdTAjpAkpt/8yPjvh1dQFO+SkAgDDulz9f29ZCremVJX4ghP/k0aF41fQin0jP/tSku/H0mD4TnUKxi8RwwrmnZYdmmf65bPaAFRvfkba30wCx2OhTJvrMcQkN45LyatOaO55nrsaF7w8Xqmb7DOfg==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npwPx69ixe1sxoMNDYfYUA7fZtfrSfxK62GQHUd5RopMghybxACdtqy/AS5vsojqtR0RiXMKW4dSNVaRf+QcmHCM3b/acDmxYIdCb9bOhFSyRGRVMJRiCDTdPvBzONPFtKmjE72Q0+PvofWBbuq7+D7o4Fxu1TXsqsWU8ER158ucWBZqR8njxcJOssosbuX7eqZYGKaRXob+PjlSJSFVEvMimh4xh2tPuCblIE1JVqO2mWEg6wkJqH+iOJFJUKbe5/5UFVDFVYrntdhnS1Vj9AXcp2bLLmzjQDWs6jYtO/dTukU67NJkGKPKNZAs30FTW6DYpsn2/wAPuGMHYPWJ1tPOvJwBPq0ZCO5puoKtSzYuPm8EWzZJu/2/plLVh6kwZY5BvRYav9jAaP+8IPZ7cqdvNbm0W6WYCCePbND3wVb7NOCTfSfedOJumn619c8Q9A+0/PfUDY8iKEPTjXp6dc+5nvCkwg/pgEzDY/ZePJNoEPTiHkoJMbtZhwOVnhCl848M2HT6Iow+8C+dUFgB7MiYbeScJHPidJbG8vVZE1YLfcz8ZcNsfaTCiUJrOcfavi/UFVSp7ti4XhDdgzsaa3v1O/uEh3GBo3wr55cqThARCOXpSdAO3mlm5korTby3aHo1zzf/QZfHchiTM2O/N3019oO7Ql+FHV8US4L8xutCFi9hsintRYFe6LxYXSAk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGvSjUt3TnD/upyIr0DnlNx3FB7ZyABhagnJeFMh71SgKZpSUggnwRJhkfPq?=
 =?us-ascii?Q?3Ax+VfCKY96Rr/rXjby1YpcrReqtb+VkQ/rQHoTSSrQKGdFfRSp9usQCI/1f?=
 =?us-ascii?Q?456r4J9uD1yrVWmVK7vlKjgp4XgeZ8PWDoTEVMMwZuo+xAC4uSS0LsW/ICke?=
 =?us-ascii?Q?XDDVgO9FROsVV+wXi2W8Narz2BkkA06QklqdO0GetlhQop3QYOOuOdqzsGqN?=
 =?us-ascii?Q?DySISNa+RGk5trBSOxxnpTiPRjAURoRYw/hs4ybOgygfj7FrR0bkxFeIUs5P?=
 =?us-ascii?Q?JfzE6k1r09xuNQp1XAK6gdRc/uVC0XdDmTqrPuc16k4/SKNzliJmxI/tDfUP?=
 =?us-ascii?Q?z2eVHc4NBufi2AsQfNpJ2slzf3ePbMnN/hCbvtpcYcDwap9X2mTvkx8icXog?=
 =?us-ascii?Q?pKMPtHt2Ib5kfQrFJtCgcINLpwHf+IHbE54TBfMl8twtxdSLfMguNfzAoOmg?=
 =?us-ascii?Q?HIkxfujkdhIqO5cf7xfuXwkisj4qVaJxIGP5UHwaimFYZ6zYBk9bvdEwTwEe?=
 =?us-ascii?Q?f15XX6Vy0Cbp7pX4io4iyc03gAKyUwzdzoCnurJZX46EZ7eemptmm7A7UnZX?=
 =?us-ascii?Q?d/n8J0I5xW6bE6ogYkOJxGQlt1+LHip7f5YkQ6QM9NXKjPzRILShuYArvwP8?=
 =?us-ascii?Q?k7HHXUwRHeMFjvRgLYpLYRABTIVUvf0LWPWNHvb7SuV23PXUQduoHkrbpefx?=
 =?us-ascii?Q?IC4OjrMEGdbYAjTHSGEe7kPT0HgJ1lv9Ay67mhUZPHU3oR6BPgyFoG6WJZEN?=
 =?us-ascii?Q?gqAEySlKIIBURtw4gtVMyOcbP3TF6R5Dm5EYWypwOdrK+N9Am0Kz/hXJepRV?=
 =?us-ascii?Q?bFFxBrU7cnWBkXZ2grgxo3kYngX6QpIIVfJ48xloeBE+JuLOPE3xwCaRtepn?=
 =?us-ascii?Q?yMIAhAXSgMjuZjUBnF4nYsOoahxl85YS2t5andR48zZrlRQRX9vSrF5K1RpQ?=
 =?us-ascii?Q?R8MPl6ivSS4DUg85IcG9RUiU77YvoxFKt1h0hyQG8fl6XfA5rWOtGNxSaynx?=
 =?us-ascii?Q?+rNwmrsJE6igCwpWQ1Z4RgLvoEoL0S+MIDVKVa2O10uUaGWq4Cm1LMALyeVc?=
 =?us-ascii?Q?J0Ex7n9S2XXXLdis0NI48In9Dhb+qC+gS0/JOoz7WeRq56KLw0uI/TsXEuPt?=
 =?us-ascii?Q?VtUlkT3ZFPYMIBqNwLA0q84nfjeME6v4d9DrfF8GTyWUuvQHtc/7G9Tk0iR0?=
 =?us-ascii?Q?gMFN/SivhOHCsTQlKLtqGpPl0anElXMf+ZurA70b3sqwhXjs0LVB+1EX3lRn?=
 =?us-ascii?Q?Tuktl+UcbfH6YqawdQnV61zricy62yny3tSL+39j8A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdf1d64-4620-4054-bfbc-08daba6b15da
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 11:37:12.0082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2709
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
 lmark@codeaurora.org, afd@ti.com, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, dri-devel@lists.freedesktop.org, sspatil@android.com,
 Dawei Li <set_pte_at@outlook.com>, labbott@redhat.com,
 linux-media@vger.kernel.org
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

base-commit: 447fb14bf07905b880c9ed1ea92c53d6dd0649d7

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/dma-buf/dma-heap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 8f5848aa144f..ff44c2777b04 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -243,11 +243,12 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 			return ERR_PTR(-EINVAL);
 		}
 	}
-	mutex_unlock(&heap_list_lock);
 
 	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
-	if (!heap)
+	if (!heap) {
+		mutex_unlock(&heap_list_lock);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	heap->name = exp_info->name;
 	heap->ops = exp_info->ops;
@@ -284,7 +285,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err2;
 	}
 	/* Add heap to the list */
-	mutex_lock(&heap_list_lock);
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
 
@@ -296,6 +296,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	xa_erase(&dma_heap_minors, minor);
 err0:
 	kfree(heap);
+	mutex_unlock(&heap_list_lock);
 	return err_ret;
 }
 
-- 
2.25.1

