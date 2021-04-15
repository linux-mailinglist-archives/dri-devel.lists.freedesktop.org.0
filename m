Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574135FF77
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDA56E9C5;
	Thu, 15 Apr 2021 01:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626FE6E9A4;
 Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVA8bKahmj7mN3wsUWAOA6RcKL1YiKGwVvVpfCtEPXeZkzPHb4VJXFXhKweOlKxp1SD307yG1+Riw1kJk6JjZD+h+KE3pIoVGkRLT/3fc6IBJ5LBTXgj3uSBg0hCTHcgQmeeljiiWsETKhCTfW4vAGdFbUkDXnUsCqzRNYjMlLO/yJN0MDzStEutJgygQ1/ZlT0XzDBiN7I+GRBe3qRVxYUr7VQ3vysPaw5aTjj4AyqioHcuSnjwRCapgjOyZgySG1ow5T9Jo7ynHIvAaUiov4mB4QkWaHjvlnURFSTd9SEhzx8pGVSisxE3FFnj7HTif+8vgTvWjUg8oZ4jnZaS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdF+YgynDmnl5JLNG+qcY1rVFQrSkEpQxLZbdb9v2Hs=;
 b=Bs04dXVpW6YcnaAKYml6pDSsxTZm/m9s0yHFtI9bKSN6JaD2AN6zfuBHqEYIU3VyM2p/i9G3aqe/bU5Wp7ysYf5D4Y5NhTQoKFH3XOoyYugM7qgFjnWIdrUj0z33aCc4LjLFNznbatvMxraE6QYUdDp6MN/GZb5F6XEJXo7GlMs4eh7MlqsUxGei7PV99eQzc7UhwvUvLwfthFI5GrTKuM2JecfWRa7N4TfOFErGGBnTSngK7R6cIbpWr1nhai4SeWEgU/UV2uF5OvjSGJPOmuuawFZZkC8S585Xys4vzoK+blIh0mqCvtuXXPUt7Q6z6mwaGrtWCkWAOgW03zek/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdF+YgynDmnl5JLNG+qcY1rVFQrSkEpQxLZbdb9v2Hs=;
 b=Neie9GqBCTJbl1H0AKH+xVdtHKl/Zm6knaU4C0lENN/4kUp1Ul5sxpi7cWcceBEbiUgUwRRpIOgD3QVQOBpRUQk+ib1qPUphJOaMNa53yFujCVF03bFDKVeVdcprNVIhiPSRbJbWXMsz9ktOmRHZAKm3oXRxOpNXHs9vnCFNXPo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:06 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:06 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/34] drm/amdgpu: enable 48-bit IH timestamp counter
Date: Wed, 14 Apr 2021 21:23:25 -0400
Message-Id: <20210415012337.1755-23-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e8acbb7-657d-4c06-768f-08d8ffad28b5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42083CD61E72764316E436E9924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AX/B3OYiBqoDQnTjxxiywTARKlyKx871zUuKQcXiN+mX9lqgGYGGFtFHWpl/rKI8k62ki45uH2eLbtaTAMXW9X8GHUCDaiFM6Nu9IggJ5MDFqQP8sO6xgssKyRP6q+RT6gb/6PkiNBVltlYejd5jJ+95I5hgJvBW8shmvSqbDMKonBN8BIF2lep6Tq+qgSn6VLD4cTaxnHjjojt8sQ1GuM/NFbobjuBEc0Dy6a7xyrpSFE5FNVwSLvX1L2nNXxa7VcYXn0IEqJ4GOFs9pvpHErR9DUOnpWVIZ08Ev6CzAJCg08iCJNJ5FdWD2o7RegHtLu7XZlEZpxJcIT6LWo2rsjJzJNZNdgNI3k2Hcs0kG6PcSkImOEtni9wBteN1Fe4E0a1wlnzRoIbbEJP/pXWqUpfr6RMjIDWKIIy1ZTpP7cxuVmi8Wd8DuWCbVbnwryOtZNm7/0SzI9SaLPJOO2cp+3jbXGECLg1FRnwM2W3KRxJybvPhnkuQCYOpQNvprUrpBBNU3kmaFWyVZa6hfr51b1VQ1fNMBk9zEWms/QE/9+Kzfd5yxGGZ78i6VUdboqLsFiXe2SprvzaMcJOg8rv69S8mQPrBtFSVB+jQZ28OfuX15EZaglAl20M33ggl9DCs7PbgWhaxeaSkln6nSLpRqjc9NRKMYONbtAEwO2nlpdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(4744005)(54906003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PNhfhaTUV83qGhDqJn097zcd2k6QHIw71VwD7Ip2GeUvAE3boEtAtVYv5HGA?=
 =?us-ascii?Q?gtK4S9wpYGpsY1UDZHrzgP1DHGnvZj3fUROT4s8lTJ+pVZML+UKZTsS6JwSB?=
 =?us-ascii?Q?0sQ4KKWmgVLFKNxgCIBhQaXrWndJ2ofguVR98vr8Ouce8wEE8OofwWQRoUPF?=
 =?us-ascii?Q?qyFtt9HnFaZhNQNC1pSt1KXIqI7blFbRZzkdqnuSwWhabQO0ocF6g9HqyjgT?=
 =?us-ascii?Q?RsvFqPQPhxv2DXPinkw0oH5UYk1+m43BjMbvpG6VUy2Id32QiRmXsXLTagBi?=
 =?us-ascii?Q?T2EklJnR3sKDAi4o0swW1jMmOORzOFBBcfjjxBJJyyaudRwLPyrRA3zDszWu?=
 =?us-ascii?Q?U0lu6MdvHyjVWSsujD3QKcsmWE5U53n2QLZ1WivdXRYiCGoQv1mgvNSXlCRl?=
 =?us-ascii?Q?25qF7LReP8n7Kb7dgfBifdK7pfDOxsXYTsa+1juzUQT6RuGm0ELkAXUCQWri?=
 =?us-ascii?Q?GyWT/BlVX6q1Zmny71PuvmEttWWknp9beLrernRL88g1AihiZiKAP2DoDJL/?=
 =?us-ascii?Q?jGw9wB+l6zF8fXGr1y85BTxuQ5Yfiu4biKCjnmtSLoLeDwFb7b/GA91XtzCE?=
 =?us-ascii?Q?acK90laeRvUM/8+hB8Ht9P9JkLhlG2/oCQrmy4ChwNL9Eam645lnPmOqZXha?=
 =?us-ascii?Q?1tpvqAdoh5wa2vU848S2FP2EPww+9Zz0Gp5C0sklkZOj06UNJqtApbRJv3Pi?=
 =?us-ascii?Q?olQFaw2lB0f1vYkmj+vWT6WkW+myckMp28zcGC03jl3dAkMY+1fzYVzHjqZO?=
 =?us-ascii?Q?ulvyGTVnYwKwWbJqDlIUH460zp8i971ItWTbnBfgYuoAU9ErW9AIRg4bGMcc?=
 =?us-ascii?Q?cmOCuabecRorSZNya1GybMdsAncmQIUsiK2f/SOH82yMD/VedJLHEVjHU2Nk?=
 =?us-ascii?Q?36YSDLvP246TtWMx4yuf90AjSxYZxhbgmITCw44g96ePCsDMuNZmSF7+Yxvw?=
 =?us-ascii?Q?xvet9W76X4hxiD2gOCOD6s5Wxw5x9w/MmhIWepvEK+McO3Nvo6BwyzQPC+EE?=
 =?us-ascii?Q?QVduw1gwhyZ7EJDkLaxKCA8syOOSgKwRNJThKRNZxikKwl/lJpGB1Snc1wW4?=
 =?us-ascii?Q?6UsqcAfUohP2Y7BAy9/b9Wx/38UabUBAulyVtWSPh399tBSjOogRSSJVqSsZ?=
 =?us-ascii?Q?58tMrs9XlnGBCTAoBo2agNhrGlI4y1IzfY04rDa5rqsVlrNDhwChIMxpV/Uv?=
 =?us-ascii?Q?7r/6a/zreQXus2zwCr3aYlYIsdSI338nuhZoTFHDAvGMBK3ki6xDd54nlFss?=
 =?us-ascii?Q?Ap42f7U8mjLknHtpNxkqvoBbH1jFyQnfO4VpKkfPS9GeEj5k25FH6/CgX6pt?=
 =?us-ascii?Q?6EqK+utH7rFps+EB1vpCvYid?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8acbb7-657d-4c06-768f-08d8ffad28b5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:05.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiRHcGYiOP1zIJCCrQK38kKiFscrs6nEaM6K4QvLgdxeNyawOoihn5b00vPlH0lBUEWDt1CLgIo7Jd4hR3IYQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

By default this timestamp is 32 bit counter. It gets
overflowed in around 10 minutes.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index ca8efa5c6978..2f17c8a57015 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -104,6 +104,7 @@ static int vega10_ih_toggle_ring_interrupts(struct amdgpu_device *adev,
 
 	tmp = RREG32(ih_regs->ih_rb_cntl);
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_ENABLE, (enable ? 1 : 0));
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_GPU_TS_ENABLE, 1);
 	/* enable_intr field is only valid in ring0 */
 	if (ih == &adev->irq.ih)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, ENABLE_INTR, (enable ? 1 : 0));
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
