Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DB7F4D8A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D3E10E0C1;
	Wed, 22 Nov 2023 16:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1274 seconds by postgrey-1.36 at gabe;
 Wed, 22 Nov 2023 16:56:53 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB110E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AM7kZhg006720; Wed, 22 Nov 2023 16:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=VcTZzRS87l/H8tP3ckp60h9mtsAe2UTSbAIQrqe0Wbg=; b=JOK
 UnQHXqlxK8pEvbdl6sOFvXLb/6jGL67LTfzKojTZQnx34BZQbxdxLV2v1Vr5w3hY
 lcgx+NITpAuvVxo1bKKlNnKlHeKDY+TK9FVE8M0z2ZV0UI//CzmI+42hX9nRX71q
 +eBHrVtOqO+26fiGe1algJqFSr6SLibyCHwoHWSF3JR6LzyKE7ENIq0mlSO8cOzr
 7AVorx1YVru+rawu6D9qz6LjataYqXE+p4rQKqqAKjb2zlNEsJyYTpEtyX8ijvCw
 ZiL/PaPhzh6NsD+vlDhznSYQjwwwZBBXXjQYNcdy8XTh7ZgjHhZu0UU3b5ZXxfqn
 J0Khvx4sKQKXpcVC4uA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99gsf30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Nov 2023 16:35:05 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:04 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGucCVn9pp9hlIGNm83VmxGCxdRy1UNPEzArUHJe7KMga8F6DpAOFGgUN/3QbA+Vgc1alRkTbT8WE23aUUbSSpu6+dCA4YiEPYZby/NzMiB8Z9orsHmAAPlsNGsFT1YlTzT2BjJIZTyR68amu4p05/9kRhRGRvIiSi2csndNyJFMedINCMgfJGv8LGulFQ6dS5JLU06/rz2ZS+22mzN9vaVLYIJ037kTgm0vPaRMdPD0AfoeJbFaSiY14SnB/3AlSHqh8nNXkrF8Jni5xZVQ8jM8lJ9Ajlu33iILMT+XypK/lxE/QaZx6SrQ9DAWEob+ycV6r0onCkobXhkmWFX2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcTZzRS87l/H8tP3ckp60h9mtsAe2UTSbAIQrqe0Wbg=;
 b=AY6Iov9B9azG0v7nPQnpFezqt+exB+GlflrTjQ8AQsgJRftIT12Ziq8+zayeGfwKxJD/PbByIESb22TakH44B0k/EtZjgzoyts4i3ddg1DrJaMMAqSS6r2Cq/arGXeW1uM1vCRjrvFGqoG53hu7H8XvcKfBxq8YkXZ+TYUx3R33r56Dhd8lF1owstidX2rCTUTZq9yPLdoxcP35NsCNrNjD9pLwe2M6Q8fYiQMXWaQfa7klhsPdcEg6IZUePQqKZcYQGtEXEjczyk66KwfeWnYf2gt6qzlHq/8MGs9Lz/7D8Zrcy7auuwi0+cGYA3m9gUSNHH+fQAPNnXHIDbJNMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcTZzRS87l/H8tP3ckp60h9mtsAe2UTSbAIQrqe0Wbg=;
 b=eTZRVFLwviV+B+DuZGme75S6sE/eYHzGBu7FZjZ5mNyE/E8/Th7oO9qEPL23nbHKfPVRSBS7IoXFvc9aaBHIqZ6ua40sEEP2zbaNTmPWuZh+A/JF04e8DR7y6FJqlXX1rw25eVGO4p3Pr8FZiQbwsYOu/jzdhKrhDZ++tYNOuUE=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB5329.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 16:35:02 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:02 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 01/20] sizes.h: Add entries between SZ_32G and SZ_64T
Date: Wed, 22 Nov 2023 16:34:22 +0000
Message-Id: <58b227d96f27859b453caf0ceaaac81a6616304b.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|CWLP265MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b798722-4392-4e1a-a997-08dbeb78fa01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /eNCm6ZYh9LflsKWt7tLEHtwurGV2EO8yGdhgiVyCANjAj7bLEk0jo6TWK0mV6OgiK4K3TPsncFt4lnffDgFF+o+JVUGFxssWbl8q8uwA8uDxIfvhAmXdFSQ9XzHZXh4rjthoLZ0HyEU/BW/vDhaeOtfjRCkBNwSwdh4kJ3xaIHdRAUvKEvhD/9A2sLqErmKQbMv7cZXxcO3HFKvWmhUBLDopmFj0Eo5XTbZfcgjhWEDvCmTKxfYRwQdwfegl1Lehs0+j7K3hSFZk1ErefLLUJ2/pxkRMHBIUTdIFHuF7VRCzjMtsp2aCxqiO7Baaqi0kVs5WjQSNt7bnr+nerzpZGfExUk+ndWIkak8mOdozG0KNny0ypSUwXoT3zKlO4+QcW15gK7JVWn/S1dPVNU41LHv4miJ9Y4OyIGLrpQI5tPXa1pFsRzMSep/eiX0jFyXK9UHA8Nkb6o4EXTuOU/ts4+8OkVNNo0VKEp9OG1FcJ00xp5TjButVOk8EmEuTSYzOtOkCR9pWMnm9+f7HYrOFFKkDqQf2yZEqxWnoeROs8kj0/g7Q4oHGct+TgHZmv17OjnGeiUAapGyAYy7Krs4tXMiKyfXrHAC6DzUwp0jqPTNAQdX5JBJbpkuDx98ffJw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(52116002)(6506007)(6666004)(2616005)(6512007)(6486002)(44832011)(5660300002)(4326008)(8676002)(41300700001)(8936002)(7416002)(2906002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(38100700002)(36756003)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e3IsmUhsAV++i4EhtqwxiheG8oEZheWe6726Ewy8cB2Xnf5kSYNgl9l+PPL5?=
 =?us-ascii?Q?RwsBvyDrzeBT7eY/dEgZ0VFXbZbDJ90ySOJ87N6pVoZO6hvPuOZ0D1karY23?=
 =?us-ascii?Q?5AJlgkExrGr4C9zzscDaC7oSmFJ0hMange+SigiCbsPrZA9S54ZolJsLOYjR?=
 =?us-ascii?Q?08lIQFFIoL+WVgPHq+PdOZLjH8lo2IhjQipX0F2ZRz+CcdpoziBUinjKPJ/Z?=
 =?us-ascii?Q?8ignKspISja+lbLm4ZrVnzU4M2Hof3HTgGamxX5Cm/+MJmjzIVchkHHyUdAY?=
 =?us-ascii?Q?MasU6kxJASoworFwElR4dX//BTAMh0/spRXxrN3z2E0kYVzr87ta0gHxJnbU?=
 =?us-ascii?Q?XRMekhCgJZbN5zeGFRibh5AbaaApaWeNfVQvvYnlIxC/5pGPS9kSzWFaMyzp?=
 =?us-ascii?Q?qjVzybWOs3HLi4ZXBmZYyVf1flIH960d0RPs5ws4fJQk4M86YzMHfxnsbl9E?=
 =?us-ascii?Q?vWbZuHhztesDe1bmCQXFo0EwxFolJwFK18Yb82cZiURejVpJR5wuOr8RoIt3?=
 =?us-ascii?Q?TVp1B/PC1zXyR/Fjz5dT/SNc/yMO5/X8nntNbzorw9+k7z4WZ3Ysl8e1IE05?=
 =?us-ascii?Q?2xTvbxMQeL7mF/9Z6sX0MrPvIs827+2OreQzWn0Dacyii/1Xb+WSE1ZvGvzn?=
 =?us-ascii?Q?CNY6YW/TYYb9tfbhNZz51ltfY2Qv5ZqxH9z38bo0iPB2E4ZKo0Gd13N9q+Hx?=
 =?us-ascii?Q?6lFQclEN4uvbumZY8AF8KY06zkSCtYGWgD+MCtDrEpAd2hghkw3sQZtYtaOy?=
 =?us-ascii?Q?GKWLW3cgu5PTJ6aQYCuicWMFhZz0Gq8QxSpZsL0T00FGxHx30YCyf2EXfXQr?=
 =?us-ascii?Q?sTil3p4TzoQloAwahlfzmJr2iZqOuejbzNSyiCdgf4LyQV/qpawBRzZgNlsV?=
 =?us-ascii?Q?P6GhpXOKHCTYGjIo1IEDyTXuvatLWEiuItjHRpLIFiBOn7hSYLE2G8sjDHkG?=
 =?us-ascii?Q?+ZSzG1mDV2pK7WYSnbl/IjjvY3bE1N7RPGEpeUkZz8PdxrZMGqmnJQfy0Hj5?=
 =?us-ascii?Q?4oTwQhlBrvEnnf+b5Fme24lDsWJvAgGHbyDlafCfgWX0nx050oqrs23odjLb?=
 =?us-ascii?Q?mSLHxtE0jtYeJyH4qeBNC4dvCKNk4vN473+Z+FF+L0EetGr791Hl/oWxIG7N?=
 =?us-ascii?Q?1uR9VkqD781gkppy4wu2G266NuaRPeMgN2Q71mnmdwRdnYoszcbFK90+SKH+?=
 =?us-ascii?Q?j1rNUMgKSAwI3yQdZ3ncff+MzR/f76Svkbu3Bvzf9KRtteJ3pxv5TTe+jPV3?=
 =?us-ascii?Q?ssxzGyqfuTBuWHeVY4PiRCiP1QEzRDHBMu/BJmq02zaPsn2MmhTElpefVaNW?=
 =?us-ascii?Q?DtH1Y074lpe7XT5dgyk7FVxmOtbdDYbitPyUXutEuq4cWAAbqzOKOhIHP1Tv?=
 =?us-ascii?Q?gyuMCoaTHkGD4PfEkBBW5VwO6rx5o+blWSBewQcflU2HsbLYte/s3xjkt6rF?=
 =?us-ascii?Q?TymKIWxx/X968PNbZxAK13+jouFaS8OIytQ3s18WaZmIEDtnMk/Fc0/fBYsG?=
 =?us-ascii?Q?IOaDQn91z1heTnHWMrQj/uq7dL3/2jsTYKOAqRnPIQwBhUswzcUt5GYbD31p?=
 =?us-ascii?Q?RCBAoGA3iW2bjW3THQGbh07LXiW4+YDJrdx0w3g+l12Y+AD4m0YcQIgkph6W?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b798722-4392-4e1a-a997-08dbeb78fa01
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:02.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //wQwP5fAIjvAhiWZ7rKPuvZWMrfi/gtbU27eccpy/6D4llqk5t+Aic+d5rFhP+KIwGiCj+HUuhY+IZi9H+ODyKhOdcQn/ouR8YnNjdEYQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5329
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: PqteWj2Qr0dQbSAab5FGMUlzgltzlg7L
X-Proofpoint-ORIG-GUID: PqteWj2Qr0dQbSAab5FGMUlzgltzlg7L
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Coster <matt.coster@imgtec.com>

sizes.h has a gap in defines between SZ_32G and SZ_64T. Add the missing
defines so they can be used in drivers.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/sizes.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 84aa448d8bb3..c3a00b967d18 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,8 +47,17 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_64G				_AC(0x1000000000, ULL)
+#define SZ_128G				_AC(0x2000000000, ULL)
+#define SZ_256G				_AC(0x4000000000, ULL)
+#define SZ_512G				_AC(0x8000000000, ULL)
 
 #define SZ_1T				_AC(0x10000000000, ULL)
+#define SZ_2T				_AC(0x20000000000, ULL)
+#define SZ_4T				_AC(0x40000000000, ULL)
+#define SZ_8T				_AC(0x80000000000, ULL)
+#define SZ_16T				_AC(0x100000000000, ULL)
+#define SZ_32T				_AC(0x200000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.25.1

