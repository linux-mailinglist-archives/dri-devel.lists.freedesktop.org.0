Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22432FAC13
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0526A6E5A4;
	Mon, 18 Jan 2021 21:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A236E59F;
 Mon, 18 Jan 2021 21:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpEViCvYz/30yjfnFvdyZoWWV8ZiQQMlmSkfBdbiq5KKqvL5BOlQsGA7ZIqx9NxR2yOQJDzK3JrAOljCuQ+Vx4iIDpgxvwW7n+S0mlq9mxmles0jXXxI0Ee1Q+CjTjlssfYTkAAyHUYo//5/Nauu+Z2+kQ01Gume+tj4N1sEgA8BY3YTqHqmVlJduxATuTGiBKuOOtgGy8WJGF6NY9qJiCouQACajYzd3jhd1vyOBu+XBGTz048nRolffkg9mvlJzYhFke7Ryv2/Ibj2vLfoU4pqxAwa9Qkl+3fN1sDhgtC0nzAtx9UCYCBzYhFEqoykcSbDXRCOA08KZwqQurFQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNxQ6p8R5S29VKWbdWbRF0nw4BHEli44FYyNd4XyeIY=;
 b=Mev1K7Vi5d17D+yYC1sOI1+m1Yq04zyFJMO23tnPKZSYQ71GXVWlhSpKAkuNF9B4FWninx6oiHB2HCTAmCBafhB6l0LNRp/NB7R5W3KWVvOgRkUY3TO1v0WT83PkNjtpqci9GOdBxvO3mMyDIRf13Dm6J+B5OOy5btlmdhVmTm/OyH6LOYKq2sDctO9sGAVF8OU7TuPqgPGvrYBx8q3M9mtKeOQrNw+hjtVlirv1jaZBqSYkXDpjXXSO5ShRNsMzRcqlBZNUVvZJXOy4H7lah02WasObCf7T23aA8CDyR6dL2tEg84K+et4tv8aCwtKVMKG8wQQgBMFKVfrDj5aEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNxQ6p8R5S29VKWbdWbRF0nw4BHEli44FYyNd4XyeIY=;
 b=S8ia0NMzEWAyoF8wwOgu9fV2bBnEYSJcKJb0P/4jfOcZgACiq5GWilmf9K5uJVWahSs/DoNOEpycTBeSIeqQWNKQehHUykbXxZM8F1HLcuQ5Pq18PudrHPHQLVSs3gg0nMzZFflkz1MrztUdCFR5tERezAfpuiE7LT4LMgcbutg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:25 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:25 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 03/14] drm/ttm: Expose ttm_tt_unpopulate for driver use
Date: Mon, 18 Jan 2021 16:01:12 -0500
Message-Id: <1611003683-3534-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddca2c0f-6aa6-4485-bbf4-08d8bbf45b5b
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB476752EE92AA275F4C4AF71EEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7o4qajIy8c324wU4n0ykWvApMdu17hP1bAaB17n0kirJmHA15+n8rHlVAPA6LPkOSjuGH2Qf2Cg61vVksNmi76B4d6S8+v9eN8qm2PPggQzShA/lNtBtx0WcKjAhRGClf3O2TTmDwI1laqehmpbxBIQ0zrLooodJuBJs/gP7g2zRwp2dA4JjlI44BSu0zdDkYt5b9O8WTkPcZqI8M5QQnF0CoZ3T3ITw14sFeAnBX/dRJyGioljYAKH0vSqPcuQF797qeqbrrMi/2Z0VU7fpd5m7FKXgFrtLzmNDEi1PEGoMY15kLFfyRgqj73JBYyjOxXGC7QzF5duUabz/zxMiVF7qD5RTI1kWXyyTpxq7nH3Sl9vYDv9kzSXgU9qzC8vcuTdamYLbPe5YJAj7RmfEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(4744005)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r/9CbIsv7CsJlaQvY5AhwZ0gujoJM7nuJy/gM4Furvq0fnA/5TXSoQpuY2CX?=
 =?us-ascii?Q?xxgpS9GRcsA4PeLTw7PfMS1oQdancBfl+0YuasXQtO/F6Bl4XgBw9NxRXSFi?=
 =?us-ascii?Q?fSejlkVaBfOkoHHtnIqVgzpuXtHfZR2aa/x8Ee2n8nzVZOyhMeDiWnNC2uCO?=
 =?us-ascii?Q?k9o1V7J65R4ZgTbhGXYsWtKKKbX1UXiJhNXRFdjr4zReZ4i07P3FHLcgKMe0?=
 =?us-ascii?Q?xn5VIir1v9PqGSOfWpMPEI0qDXSJYAtXSHcDQ3USo2Zy1zOlEL91+qAms98T?=
 =?us-ascii?Q?maGglsnTD2tJzAaSSvTTaJn+anqU4aGOxY1H2qrXVbDy/2jeIktRgRSKMwYS?=
 =?us-ascii?Q?S7GOp1Pm9SYTLwVH6vwlBoFejslCsqrp4w4775piaNt7dArLgIRYf6jBqWSZ?=
 =?us-ascii?Q?zyOOixh4DKumYTRj/S4td0vhPgAytjl2IlP3lZYkNY2Zba0XUHlV66e5Yu3o?=
 =?us-ascii?Q?l1y+aBxgiZCjLE3uKrPzZJNEPK51aea1Y7xVXhNebbTKjn0gY5FKeGIg2tJG?=
 =?us-ascii?Q?UD8eiptmp7tdutoryJnVH7pRjdAH6Hyx0kDh4t3sCO7oIwBZTStLjXjwNYTa?=
 =?us-ascii?Q?hEit3fjLPyJFOdsmkT+554BLJ+tEBZGcRcEdJw/IYyvO9roQsFo1gNfvB6nP?=
 =?us-ascii?Q?y6oKPWDreHQOladWWYFHg7OkPjAatN7rZU8FDIO9bnKG3CpDcpko3eiKOTzy?=
 =?us-ascii?Q?/J0q6es4P1cO67agyXWAPjk70fSB3YOjd4LOSfmTbqm22XaJh8O7t8n9GGsS?=
 =?us-ascii?Q?07tEgP0ZfukSt+k1y70Urey86idzOPw+EkVSD43KueKFFQeOgrXePHQ4cIqr?=
 =?us-ascii?Q?bwuDp/PhvzTSH+eqI8Eb5DVpgEyxl+NPQWXUFE01kqUNVd76It+3xV4qxS+m?=
 =?us-ascii?Q?gny+SXadtDo7w+aTYkahYGEtARm6cGF+/L9uLIimLvLQ6o6ehrvF9iBpG/dY?=
 =?us-ascii?Q?8DyNPMUX4VpOZt2f2aeVWzMXyVbYx9NG36yuriDZA9T9/SId8j81p9aeNExp?=
 =?us-ascii?Q?42pHEnAmdDvaKSeXu7WOMIBveCnZ8OGvtSbJ6O7P8EJnGVk3SDd68zAx1xA9?=
 =?us-ascii?Q?pkN0fGTlF04sq8kZI425/FcvroTzrC5wM5JoVpZPeCLRG87/+YpR+pqivioZ?=
 =?us-ascii?Q?Ml8pyl/o63Ua?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddca2c0f-6aa6-4485-bbf4-08d8bbf45b5b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:25.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: namgSRCff0nEWyUEVyWfECjmukZvS+2qzhX4La+hqqff/h0lyg7ybX1SEMRK0FLBQhPgC8+b01g4fLGx8zMa6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's needed to drop iommu backed pages on device unplug
before device's IOMMU group is released.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 7f75a13..f9e0b0d 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -341,3 +341,4 @@ void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 		ttm_pool_free(&bdev->pool, ttm);
 	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
+EXPORT_SYMBOL(ttm_tt_unpopulate);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
