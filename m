Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E44C6F43
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 15:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACEA10E60F;
	Mon, 28 Feb 2022 14:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2139.outbound.protection.outlook.com [40.107.255.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5B110E60F;
 Mon, 28 Feb 2022 14:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+gOllht2qKrm1XLLOHu8gxqlL/gOqBFKVgjmTruYJ9VGwn3FnY/Gy4hONYQSuOj9Z7J50CvkH7GRO3qAL980mVxbyKCRBe/Eum+38VG+aN3tX0uWs61l6CzUOkcFxl0yqrXNC+ZWqlBd7p0rEEBtRfGGe9O8TJXW5srWY8mxb63AP4brwLj0K0xgaMnVlxPXE8r/i0LJMyaKhvKDxPjU8igPCaS2zXNPg/kUtEprLWe/WNZP1SwYmvhd83ahNoWX9SCYiE/FWx+30HDqn2CCiSS/G4kojhjSGlpCiMQyD2VVszOrXtc+BDSzeqn3sY4+uNGUX50G+mBT6GvWpbBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEZ0auUTedp77GAT72BUUWABD00QiV1dQHhxE47xXDI=;
 b=QWag8EBybgAP4LZGVZKsbvkdoK7VUUGCW26kNuTZoQY/pJo68ukUMt8wdTk/Z+rIYgvP8OrZ9XMJObQdZrnhao0t+/O8CrQWC1kXtZ6DidZFRRI2ZEq84QJhPl/xWrejX08MTyGCZfTn4gwO7kSoD/VlfmAvHoMVDU8DWCGiEAVEtXhcwdQLlgAbXkYiNzf7ghV5VqCs1KHaNkR5UId59QMcMSfD9w24ztwoe8Raww0PsgSqgGNH/Mwar1BtFhWgEpDPkew+1z+cM7iU5Djzh+I22I0OLYiTsgPY9XUSDMyix3pdn1snEQLQb9gPiJiEEmntIH60dYuY6vrxs2ICjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEZ0auUTedp77GAT72BUUWABD00QiV1dQHhxE47xXDI=;
 b=bM3hbOu/6TIMfc7LPB9GRZ7ltEDEl5BSDrheKq7dO9ciynaLa4Y7FKVNHK0VtGcw/LSGH/fAVu6dIK7oiXk0OxuQLikvWYJJ0vrB47iNgpz1KTeNFle+VNMHqmQj2Hc0w8VelDg2sIxxXHzE0O5D1PJdCb18SLigXe0lQk5ynew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by KL1PR0601MB3832.apcprd06.prod.outlook.com (2603:1096:820:1a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 14:24:06 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::d924:a610:681d:6d59]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::d924:a610:681d:6d59%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 14:24:06 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Guo Zhengkui <guozhengkui@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/nouveau/instmem: fix uninitialized_var.cocci warning
Date: Mon, 28 Feb 2022 22:23:50 +0800
Message-Id: <20220228142352.18006-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b0653f5-1705-4752-baf1-08d9fac5f9e8
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3832:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3832B2B3EB38C45783DD5D01C7019@KL1PR0601MB3832.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /WMNfhz42ODCRUXP36Zq5/Ae2cy/nBYe9yk9TRIxWGfnVQFW0hdz0pYI8vatlU26Ng8/VONK217P1YgCmKDFB2fZAGEoGVCaFqA7b5sK0RpVFG0PqsLNeeIzuCHr97e2q1QrtwT+o2Qw+sqm5L423W9TIPztjAnXaodu3iIEp0aIRjK/hprD3dFu9Zl3SVFGI4baD3+U4fERyAjnUtKyXN/crVAYD+8D4bS/V/z3lbepbjerAekKiNbwNvAaw/C/mez0lSwEL1zw6tBLcKxIGfU/JhNHLsH2lmYc5cWDdTPmlPrxTZ61OyaMHj0pVGO6qFQRHPmGSHY2zzIZicp4pfuY/tZokaM5+oYZ2uZvAfQmZC9EVL7LI98GBGvKiK6Afcd5SDxd3Z7+gYmH7q0N1+gKmTtpMTk9eI8HerNk0ISuAO2qel0I9BsWlXtXn1peyufqJ8zQZDIBIHZG+hUyk02DlWwTI3gBQuTHIN2MIw79BnQzy2sorhkKmBtv9E8rlqltoRk/YaLCtt3ztrXWwRjSBEqrTABAGs+JAlNC95KtSH74K9uKx1DwN7eeeOS89u649j+yN9pGcKVYGqY8eROdb8tizj9A362YXtdhUjou/s/35XD7ZDNmiIMjwZ2VVF9L7f+cJTMT4M12lE2/oTsv7eP2ba2vwNxgLMPGf807+W3AgBFshxlzUfiVyhfXTab/CJbT2nExBRnm43EmE3YN0w4w+v/jAvfjnpG6+5pios6aTSaiCGaFlVfwzwUeJWF/VTf2sWppfhTGB1o33h4O5BYn+gD6IddtkLXXzvDcXJSkwkroQzlSkGna0vEJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(52116002)(38100700002)(38350700002)(2616005)(921005)(316002)(36756003)(1076003)(6512007)(6486002)(8936002)(110136005)(508600001)(5660300002)(66476007)(66946007)(66556008)(966005)(86362001)(6506007)(6666004)(83380400001)(8676002)(7416002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncgtufGDOvLrHE1JmH7YZ+jqLTWEq1lj8fSfU7p2G1plP6/cDugk6JFHvL6a?=
 =?us-ascii?Q?CMxWQzTXLGgGPkuw7w91P0KytyMAPNP2jbsgIHYu8QWwrS7luTQ/0V7ahXeX?=
 =?us-ascii?Q?F6oMEqA+tBpwbELJKHg44DcYmvyuX7PyLtaAdhOpmWETJ8PQyRX5mlvUWccG?=
 =?us-ascii?Q?dmgxq5y351vXM4YbUyehG5YBsVExJwi53hTF2l7g+OfpnH+JapDDNCiOm3YP?=
 =?us-ascii?Q?Yktzf+cpZAM4iSMxRubJh3VqtL1ORGViKPfDvB4b7aMCys8dLFbMrib2FFv4?=
 =?us-ascii?Q?6aF08tovC0Pj+17l3WTnGnJTC17HeNf5O6a/FptjhRbMZXpkj+g3r2gmnsQV?=
 =?us-ascii?Q?WHtDBNRfR8dG+zkyYYjW22ym1h1hGnrdzhw+cjdHDm2SV6H/3DTPth35IRUt?=
 =?us-ascii?Q?x50wn5kLy0pL0EijPK30CUNzk1+1vAD5Od8m37ReD2TPP6Se4Aa8TJ+rpW38?=
 =?us-ascii?Q?AOd7OmpszszqzmUJxqlXIskb5XH+G6JOm0U/fCrWCrvBi6rhBQHBUN8C4Isp?=
 =?us-ascii?Q?EJvEMduH4JI+UIJGhKoWmEUDsju7N4q27uNj1FT/TRlLD7sWcsHEFFAO/xsj?=
 =?us-ascii?Q?7dbVw5QDK04X6Sx2hF9PzdPZRvlm6dvjKSF1wnJh4HYY7sGJl9EIcD+/UXeI?=
 =?us-ascii?Q?EZLzYAivwnlY9nGtlUXBFxbmCo14aY/+Rj6YKYrWJLXFDctmpvDPKWM1F7Xu?=
 =?us-ascii?Q?9AGnsNYFTFR81QV12VJxsn+UB2OMUIERuo2kjfkpsQAP/O0nQ/htb01aIScO?=
 =?us-ascii?Q?K8KZHrznrftp383PKHbpw6ceTMgpHmQPH6Fas22+Y9s0nSue/nDiHKZVFI+H?=
 =?us-ascii?Q?CFXUAicD/PsSWF6d6IXtzHCH+OEorioFJpSekhKYaoqmPb5GhzIraUEP2cpR?=
 =?us-ascii?Q?YoQdOMO0yAZZmRvnHNTIIhaMnp4ujQEX4v9sNASHyTT8dfzxjQt+NaWGJwJ/?=
 =?us-ascii?Q?8pGbAOlMGcHp8AycDJi37+fz2bHgd7NuRI31ckhhU8apxo4oQQM/AjrwSwvP?=
 =?us-ascii?Q?FH7gv/8NXexugPfS/g/iEZCclmGMknDImRN17d7QMYnNq+sIi5tINOxS4UeO?=
 =?us-ascii?Q?IE+aqgk1WgzQ6FyG9BhnBLFGhMV3yoFQ7vsMcOmBqES4TgCkZE5JFah+IS7S?=
 =?us-ascii?Q?S+MT5EAP3t9NBL8oN+J3AR0Dv/nIw1Gp8Jr1VOEboA60D1viRTR0aOye/eZH?=
 =?us-ascii?Q?/DdDmnI8QXs3E2i4ZkRccCNfbql82kB8qhLOXjYWV0RMAC+4FGC35BicQ5tn?=
 =?us-ascii?Q?Trx+vmX8PkNC5QEKzD4VcncaqRVMLtcVDevC7kW6k8U5ryhYGlUyMM/psx7r?=
 =?us-ascii?Q?pnO4qNvEw3naW3QujugCx70vGUEBlrMuUHZ3mJM1iQrCtLS3lmOZjABV39PZ?=
 =?us-ascii?Q?G6HxjyX+qxdm+wi0Eu5o/tFjlVzBVFu6BG1mJpvE6RFkzrJWEEt26lZtIiNa?=
 =?us-ascii?Q?vQKvrt6lRR5usmkbF0TcVVK93wzx0PtQd1NQN4ZSFDr8RXGrJ3A9PDVlAHE4?=
 =?us-ascii?Q?faUb9Kp237VdDH+f/IgLD8imYieeIrP7qkdUlW4pnCSPeYcktL0KSweLplCQ?=
 =?us-ascii?Q?rRM96WMQW5iU2KyD6tf7EkLCzmfK37z4XG+WcLm13S2AgfRDCIdH6NVmYECh?=
 =?us-ascii?Q?141Shxtpaxm2+uNx7JRYm3k=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0653f5-1705-4752-baf1-08d9fac5f9e8
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 14:24:05.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty1WW32Fa5MR/ljIUXuYPZo7mIJjTKKkLrYb1txj1rPf8eNUB5rEzXK0EUTG7jyuGg0dI80A3+vzz3+Iid9pEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3832
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following coccicheck warning:
drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:316:11-12:
WARNING this kind of initialization is deprecated.

`void *map = map` has the same form of
uninitialized_var() macro. I remove the redundant assignement. It has
been tested with gcc (Debian 8.3.0-6) 8.3.0.

The patch which removed uninitialized_var() is:
https://lore.kernel.org/all/20121028102007.GA7547@gmail.com/
And there is very few "/* GCC */" comments in the Linux kernel code now.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 96aca0edfa3c..c51bac76174c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -313,7 +313,7 @@ nv50_instobj_dtor(struct nvkm_memory *memory)
 	struct nv50_instobj *iobj = nv50_instobj(memory);
 	struct nvkm_instmem *imem = &iobj->imem->base;
 	struct nvkm_vma *bar;
-	void *map = map;
+	void *map;
 
 	mutex_lock(&imem->mutex);
 	if (likely(iobj->lru.next))
-- 
2.20.1

