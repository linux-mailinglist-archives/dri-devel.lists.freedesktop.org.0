Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FA44FDAA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 04:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AB689CF9;
	Mon, 15 Nov 2021 03:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300121.outbound.protection.outlook.com [40.107.130.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4491189CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 03:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XejEjo4G7taYJLpI7VmIl0L5yIZefLFD7yMP6k3O34FINIt6gZbmy6jBhsKqG4RoZXXaN0BIfBYqio2dnr+LysCeeFa7JJyAUe9nft8Pn3ukcfxLGtYMPV1cTGo/itcEUJ0SQydC9FXkV/FFWApTdyqSIjFmkGw4l7D2H70eJhSLqhGSoWxV1FlKV/2bFPGbX0gFui02jN7xcy/SvvI8KAKc4Hrgh5tQ1fs8GEe+O1n9+gC3C3fAeAXpFv1a+hmBnBmtIVQOck4mHxzmd3++boTie7FWsZFL00wkJ0Ud+vnCQ+04hbvxo/aStjkwZYnm9yiRNHf5wRJqgvNUv4TxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6tXfdxfySNkxFS2uSS5Bbm+E7RmyTX8PsfIxYZSWwk=;
 b=U4JHpSrajWxe0NXbKbcz2e0lIRF6VakWUc4GoudrLjePCC3f29CIXq9ZSLz+snssZp7gJyO+406blDOdNp+Wjbo7kdCsaGcXHHSd0WrcnbSNBs2wSW13jqPE8xzLsqdvTsbKBNC4iW8EPVZgUTdQZ+WBSt0v/xJAq4QtYU7J8aDo5OJmVo1HPIcxQLdThNIw+lXAexOwAS0gi3MTWcCImnd06ZHPezj33tIGLIyzmylYfg69xoHA1uM+tj8ta8tzXff5rY0/I38UCzGaasOWyV///rTWLC5uCRlwf13hff/qm7IJ4zVzWFqCCHc1wa1/36+8LQiUH2uMtk20qWSy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6tXfdxfySNkxFS2uSS5Bbm+E7RmyTX8PsfIxYZSWwk=;
 b=XvLr3dlsUAjU8Kx4vMSZHL7adO+Ce/k0h8HPU5g9T2FGs1x3Bxm/zFN+KjyNwZxahOyAh1N3k+xDfC/k8U4RYv6MZVtlC4Ugo8E8NbO5bVphD8Dm+PWD5CjkWRd1r7pC8s9ajqL4PYFTPInjNidFifNXbZJX/jvb940RbulmlQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4311.apcprd06.prod.outlook.com (2603:1096:301:81::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Mon, 15 Nov
 2021 03:45:22 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 03:45:22 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xen: fix potential memleak in error branch
Date: Sun, 14 Nov 2021 19:45:03 -0800
Message-Id: <20211115034504.4993-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.16 via Frontend Transport; Mon, 15 Nov 2021 03:45:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22c8cce4-7549-44ce-6396-08d9a7ea59d4
X-MS-TrafficTypeDiagnostic: PSAPR06MB4311:
X-Microsoft-Antispam-PRVS: <PSAPR06MB43115980B7005847F18B682CDF989@PSAPR06MB4311.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hf00m0xBSHTiEOwFwIhHEVeJZGrC54oXIB9H+HeyaiaIuIRuxYcDRWg11S6c3i+OtlPpfr3SVsoiVVpikdIGdmYpLT4IvdhEOP9arRAt2FFx1s0yJK/7J1Wr7qfk6VWTMhKBtulcUHM4p3jX8GeV9VagRQlptpLTvsnWsQvi15jSxX6l+vnQCYE1/yTGaqlnduhy0eOhKQ+qnLRArALAAH8Cr2fcxob1kQMyvdll80xqlSXcib4+2kxws3WJyXyRUrmHABhNSB6qa2QAO3kObpL29cYGki1d6NJNGBUSAtf8co0hHY3H1WYTUWGGHFOPciilBHDdGkAjQ7FYI/EGlOJsJ7P020KSFiedXfqYXU8aBz3NzSKxTBxUf03LYiaszXHILAfAoqEfFfH4cnc6DjTJrkCTnnLXKbYHSQBDAydLUQjQUAamNS+wcVArGGny/6/SrEpzhoiwMEdDJ4IGwely/C6lihNMvm7DG7Pl3m5PK0WhWhCUD45JZX3C634Kag0s3d4/eCGT/2+BQbsE7ovcw0x7mAbpp/Jy81vUfek+Q2J+gfRF88pyV7O26qBZXISQl/G1mpX3meAkbNtcQYy0HbXyJ6rPK2Z5XSeV4EIZ5nqYd9oieA1U/HfepkvArQhwqhMqtnubnTmkpGw9MApLYkvZg5nZDnjRebTh+eG/3tWPoT/srDGvny1rqGdBu1i0Df5tdRRnutZxwqlJ/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(110136005)(66946007)(6486002)(1076003)(38350700002)(66476007)(66556008)(4326008)(8676002)(107886003)(6506007)(5660300002)(6512007)(6666004)(83380400001)(316002)(2616005)(26005)(8936002)(52116002)(86362001)(956004)(2906002)(36756003)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y+4XRGWKmtBYwDtpF/WrRip0oJbSVlKLtIFmpQoY8mXkAtq1DuheOo5ifgFg?=
 =?us-ascii?Q?60uO6fPDzyqXN3lsavI9hmgJPLBSzNzutRVsxzV1FqRrgoM764DLcYvEqF2Q?=
 =?us-ascii?Q?j41N63oUl69Ju1LIvMF8PUCDOThUCFvgl4rBpskVMjGwyJBneTnoKrrm1svT?=
 =?us-ascii?Q?09enKCp+JXN/A8ohiW3Vd4qaB4G6kEdvfhJXOcsP+U0qkhFtBfr4RyFn2Ixk?=
 =?us-ascii?Q?/xf0CSpUNPZeUizgPgs2qk9MskUtQwL+/khiuZqn55hH/w8nVfkOezPo7O8a?=
 =?us-ascii?Q?vHqBcibqfSfp28oPebVsPqHKLbJsAwTPiXHAap0vyrrOy4h5Z9EjSeOKjzgx?=
 =?us-ascii?Q?ddZFnX5wpKNf49cbdZ4kopjEivZUW3SNu2KIQXpFYuXZ81lBipmaAEdLrWdg?=
 =?us-ascii?Q?j3iBFOt743nMMxbKTme6XykIWC9UVEwykHKJX0/z6jNXSA1GIJF7H9/ild6s?=
 =?us-ascii?Q?uU8tE1dpkRcU+WU3ZNPyesT/mUMkR9/428L8r5XGu40g/juOxN9hLyydf9YO?=
 =?us-ascii?Q?4KbGXOFA6QlL2Y0+gB8VEUydxlcgISKsW6JzwbmW0kk0XNBH+ASElLtUcllP?=
 =?us-ascii?Q?yFKC30Y5dp9duWS6V209fjYhYKZ0VM/J/zcC03dpL2enj8HkkAwPzFDISlrp?=
 =?us-ascii?Q?9i7R3cfhBZpwxTUrbONFwhOjQ6VIGKhSvGATK6LhBaJ3OThvqKfq//5x3VRj?=
 =?us-ascii?Q?WimCbUyB+pi2oNvpssiKgYhEnucxPhSQGnnvatwY/NeBGTb/ingmKJcI2Hql?=
 =?us-ascii?Q?YZq6/bzTlYxLnnV3Caj4LCsxkhEgiHZppFXeOVq0DUSxSIk7GZ5zyF5g/Qlm?=
 =?us-ascii?Q?U5JMorPIMXqrllnLNNuFaixoXAl8HHVPRP6vvzJ7SZLsDKrcrfmM4JMws8gz?=
 =?us-ascii?Q?3f79Ssn/9AqjjIyCh7qTT5+o1YwcM4ldtS20z108ZJmgGhko3NXWa55DPhaz?=
 =?us-ascii?Q?G/vcYlpRgVNSWExZDXPwo9iJLGNPMTmomhx6v8bp02vM/7waQYQ9tBX5+gf6?=
 =?us-ascii?Q?tVDwbIoMWSKLZQB2O2BJFSKxW6lt035Em+pVYAyWHBgHl62Bpj9OzSLXSre+?=
 =?us-ascii?Q?FNPmVD9nj7XoIqTtWzj9A5ceDITGALZMh2IL11vVOYwU3VVDNc0sy6FR+HQe?=
 =?us-ascii?Q?mgyHJdoV+nW4PA5Xj9pFvu5oQJYHyjEZgKs2F7q7dmqGxYbti4ylej2TRNeJ?=
 =?us-ascii?Q?AVQ81NJJPxAHTTO5t8H197xFah1EZ+35pPPbJGw9byQHGcHZBfmpHj+wbKbs?=
 =?us-ascii?Q?Zz2p+zcxck+CR1iNAPZzUtSmgWLGe10m9F1CEG32jndNehm6SP68CyESzvxU?=
 =?us-ascii?Q?o430PC1wyNz7eJCEQSonbqZNPr6iNz4FDBF62tBASVeKEYyXWo5yXOQnBk0l?=
 =?us-ascii?Q?WlhXRTA8Wv228FfE1AExd2V+CjuBwl0jAXaEj/uSLJ4AXlOylDDpYsjE6c5I?=
 =?us-ascii?Q?xe1d6hn6ovyA/eMKgKmX/EPLa0YQ3+v2JGBeOA6o269BUXCx2Dbs3CDPm9RL?=
 =?us-ascii?Q?VjWQk7HpsqOiSIMTqs+ciu1DJNDlKG3sC1+v6szc8NsPZJbK5OAEl2+dP6Up?=
 =?us-ascii?Q?eCdCH0YWaDWriKgbJr4MTijibfOANgP39MecdOWLzLDAL2zcBdME8o5mcVUd?=
 =?us-ascii?Q?yQbbk6CKUf5xC6NaAdkD1is=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c8cce4-7549-44ce-6396-08d9a7ea59d4
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 03:45:22.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2Z64cDvLYrQC05OYDq4Lxvf27U3rbLOC0x1EDJaFp6GTKAPV7VXyndtPlTbuDcGweskFoT0liqYjCAUEFRP+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4311
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function xen_drm_front_gem_import_sg_table, if in error branch,
there maybe potential memleak if not call gem_free_pages_array.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index b293c67230ef..732c3eec0666 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -222,15 +222,19 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 
 	ret = drm_prime_sg_to_page_array(sgt, xen_obj->pages,
 					 xen_obj->num_pages);
-	if (ret < 0)
+	if (ret < 0) {
+		gem_free_pages_array(xen_obj);
 		return ERR_PTR(ret);
+	}
 
 	ret = xen_drm_front_dbuf_create(drm_info->front_info,
 					xen_drm_front_dbuf_to_cookie(&xen_obj->base),
 					0, 0, 0, size, sgt->sgl->offset,
 					xen_obj->pages);
-	if (ret < 0)
+	if (ret < 0) {
+		gem_free_pages_array(xen_obj);
 		return ERR_PTR(ret);
+	}
 
 	DRM_DEBUG("Imported buffer of size %zu with nents %u\n",
 		  size, sgt->orig_nents);
-- 
2.33.1

