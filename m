Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B14C611B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 03:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E2210E213;
	Mon, 28 Feb 2022 02:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2113.outbound.protection.outlook.com [40.107.215.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856B710E213
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 02:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzJYiONssilTCdYIIcQyIFSiXxiilmEuA1QtTtM82DjkfEC0RE3GfvISydwtlbNVFc4oxfvpnCxAV4XDoNWaya06X05b2/nabFB5tWjr+eOLh0KJBM6lmSHIoeuKiOdCcXqoyaMLaIvXMJxzsY+oHUzFiFS8txYzxd5uqkN35cTFs4bMKQLr/+BKxEDx0sL9g9flCtmpGENlNJy7Ip2B0OkYhGjhzrzr8s0yQvak2GO4poEOZwpPhCBRMSL3jQkCNgQCcsBVPbtiPl/RESPvLZW37viQsnRtIr2UGGySd8SywknHlRQpFyF8H7eaSm3UaRoGqrYnHeIcoBsUoUo9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKv0U6Acy0aI46kXOkHsZfrVXxABM8qkyTHVkvKkjpA=;
 b=a7yEQi5vEjAxnkscVkYMtK/AwoYZ5JbLX9AqwwjaVr1n8WF9k2Mrw00INyKUZOe5psOPiuIkqTlFxwsn7e8F8PnxI3jsnWdEF9bQ2tCdS9gzsjRkvqldoB3J81vtAuyRyzPCmRQqpEVCaq76U/gJsDgo5iIedLVEk5V5HB9vnQ+Qf1mpzUoCzfy9+4/tJbIDjvM288sI8wYnw1te0cb/WWIej87lj2I/tuYOgg1ANGUBOvdoa7Av2KMUKD9a4PcnSSRRfBy0alTLuIA/Pccgptn6kQwZ2a0JiqN5gPmPvElLbPhx5sQybK+qKBAj2MWVXW04krBrUFOQeLsuhA4q/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKv0U6Acy0aI46kXOkHsZfrVXxABM8qkyTHVkvKkjpA=;
 b=OJ1Yy5D2D3JDoErH+joeO0qriywkPdxiFYrnvNO1rOap/i3KCkzNbYxPl8Urz7g0ozd8ay469vWca7V5ZF3V7VMVi8ac544ARAH7ayPzNrMseUkpsEnDAPDJSwbZEte3pi59Ru5Md745auCksCcnYHgYWDaisZ9PvJ0stJYjE4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PSAPR06MB4007.apcprd06.prod.outlook.com (2603:1096:301:3d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 02:30:37 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::9d3f:ff3b:1948:d732]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::9d3f:ff3b:1948:d732%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 02:30:36 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix 'make htmldocs' error in vgaarbiter.rst
Date: Mon, 28 Feb 2022 10:30:02 +0800
Message-Id: <20220228023003.1653402-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0239.apcprd06.prod.outlook.com
 (2603:1096:4:ac::23) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b21057c-585a-431a-236a-08d9fa624ce3
X-MS-TrafficTypeDiagnostic: PSAPR06MB4007:EE_
X-Microsoft-Antispam-PRVS: <PSAPR06MB4007894BF1E93C4AE5A8C0D0AB019@PSAPR06MB4007.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/HAw0HeoLtYuLIiZZpUlgdUWmggmRc9jYrZ1x3ocvZ0sYFUBI5HRqta0rwhPdhiKosmBL5Yojy6TJV0lNL7HOLBjHJDMrryMUrBXXIqcKajm9+EdQW0GtzAE4pnpk1Gl0uWOil5IAAuzc9Xtn5yn9CkFBCQDCs2d9eg+ftHfMaoHciBDZfn5rienlol0sJjTBRI4Gl1eOzjitalM98bXY/M8BYPFfYvVQXRI5vFfPaY2iKuIbqHXjW2ckPhRPkU3mJxQNwsnFkKQyR/rl0A0ThVS10gdo4fJiXqXQtevtgBKaliyY5DEOJqDt0SnnJJ/ZzXYt8ThcN2BjXBhdmx2wAU/YQfjgbaqAPyLUcBU1I87GI5fbdDI9RrUAlWVJYLx0zDPGQDTpNjBTmooES24xwqiEc+1CKokgL3+dPcSo/ies7hIyMLUSZwgCbaDDjnKGfwYuFGsfClzLo3kOb85Bk09mg6Vqi3ihHYzI3vSYU3PKJ2Kv2GBDsJszXFihB7R7eVTbcY8wnlf6GKdXKlqxzW/oCtIw1nOfLUYAiX0CaZ6/AKIdgxxJe8mtpSevhNKno1A55aBrKGO635ITNvN+KyiEnXfLqhsHEetkggX4ckl3X1AE6vDjSRIA7IIw/zKcO737JxtdJ/P9TvHW6M0zqxVgNqng/ikBOgb7l+7nOHojueuOqRcRiFvZGjMuo063MUAzvKXZsaCTxWWGhUSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(921005)(6486002)(66556008)(110136005)(83380400001)(66476007)(2616005)(26005)(1076003)(36756003)(186003)(86362001)(5660300002)(107886003)(66946007)(316002)(38100700002)(52116002)(38350700002)(6506007)(8676002)(4326008)(6512007)(8936002)(6666004)(2906002)(4744005)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+hzXsqKDOWTw1vO2aGoZphkHoI9Q3dhO2Wat08U1UOis5JeZOxoQzSy2mIO?=
 =?us-ascii?Q?MTxXtDau3GDW82hAvaY/3iHMIMod7ufnEgWupAZ0ZD8+EtDMfBlUhCa5cuP7?=
 =?us-ascii?Q?lOjXMAeXC4AihNsUdxZGK3MKtX615EKT+80J6fRG0XrvR0yDpn1KqXIc4sWz?=
 =?us-ascii?Q?hAwZZViD527T64U6ubyypjTy4HkRoXSordzoyUD3cobxyQvznU9H6ZJI8mvv?=
 =?us-ascii?Q?mxaBN83fNyZ3mMizoWvr9Ia/XBaybEDodxdwxWCPUHj9XruXlO/5l1FVRTDX?=
 =?us-ascii?Q?yq4K7GoMA8BaHisZNyuRHkg7QQXTixHAcKIdCzSactozdlRWvRLdArmJhSr0?=
 =?us-ascii?Q?E1MW34umVTHwHMWYIq0pgymNvkJmF5AW1c29oLDll+700wnsuy5IPYu+42Mr?=
 =?us-ascii?Q?2xO6rhQRK0hMA42BQmiaWwV9WMtAkVt/P++yqAfYgaMqQgNWgeZcA8mf12bu?=
 =?us-ascii?Q?g1ahvNEZ3Gj/XweCFoFzowYGOPlfJFgDChFHBOL/qruWBGKFld27wkrfYMqD?=
 =?us-ascii?Q?y+TfWE2Muo0AwmEcxhECYfyZh54d4D415Gc+6fFErEhnxj1N3J9mCVkOxjfX?=
 =?us-ascii?Q?QEKFaPbVLT6VAsy4wOgoBF2wTNjZ51yBUgd1t9koEC85hGgp48bdgpWDus6y?=
 =?us-ascii?Q?Wf3UDOCPw211qnoLiLf2no1c48Qk8feyEpctFiTWEnt5ZtSNgbWIcwRT7fek?=
 =?us-ascii?Q?j9lpj9vvZUZX1vkmIkdQ0xH//Obv50lCPWpcxq3xnqHZ10eyTr81uLcpIDuO?=
 =?us-ascii?Q?gH2Un7lEptF+8cyD0G96xyHqDXb6cjd+OAXpGwPq6eE6D6t6Ff9zT3Zw0C8y?=
 =?us-ascii?Q?2qjLomknvj+L+Ds9PlloDqco1jtamze3yntDyud/UTHs2sYKdM3tgm6qajk8?=
 =?us-ascii?Q?hn2xFWlQmdU1dGp2g7hQBchAVWLuJBS/zjnWh8hllHZ2Y28P9mS5BEBd+cN+?=
 =?us-ascii?Q?MTLsgUHEL0rNpzGtZ3TF7+G3Fu7LeSvZKXrIcIYbkeihj8T3Erw0CzAIN1qd?=
 =?us-ascii?Q?pAMC/pe2ZijKSjWTv4rzWOxuC9zRwmiSaGTYVfnfdqsAX3U9lYpj5Bfvhm6i?=
 =?us-ascii?Q?Qx57vtPt0QSv5ZAwHPKNo5Nv3IfxXelARI/DJF6R+va9Ur1zPc/Zoz1DTTGF?=
 =?us-ascii?Q?5xfg6/aPZMAyOS2nmyi+lRqRH27oz449wComU8SXSgg7CeccDb+SPkJjNqgW?=
 =?us-ascii?Q?PIED4Xnv+6wEFTGs5AsF7ZXwx1Lakbd7Q9Y39Lb4SLO4ys1Prey8TCHDhNmD?=
 =?us-ascii?Q?/kBWQbZHcPOm6kkK6MbCKKAcLtpjuSjFHb3AH/kCR2W99S8nRtb9aDVVGpdw?=
 =?us-ascii?Q?6stirez7EMiraK3B/EBk9BTCY57JO42tBVX+a5dMS4cMdqfQ5R/XhiL7qmVm?=
 =?us-ascii?Q?OuWSPVx8plHoh8Oa3VEdAFQ3OYC/1fH9UbeAfLhJBg0W41WsFgN1hfZjLVyd?=
 =?us-ascii?Q?wxEKcPhBRlu/Ly1hryEq32kH1UzA388sbMmIvzrN+nJzxQjzFIxm3H9UxfiO?=
 =?us-ascii?Q?BA7kJnGJAqoPEe6vCvAhqk8A4x3HmNM6fLsp5Pzt7BNZ4t295q5dnQeLmLGJ?=
 =?us-ascii?Q?KC6NdZt7HJ4uopFd4Ngew2cojwSCVia488m1HhXERSSQimBiVEQBWAGk+DI7?=
 =?us-ascii?Q?Lx8qvQsZzXdmUUTyEQ1w9NY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b21057c-585a-431a-236a-08d9fa624ce3
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 02:30:36.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Niz6xBj2MNXXbiPobxKYbkoxwe1vLDzHSqZqtFeiDatqC4fkBAAi5i/WIS4f1P+wt4Q1JZo5OTwXIrsENnNUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4007
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
Cc: jiabing.wan@qq.com, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following 'make htmldocs' error:
Error: Cannot open file ./drivers/gpu/vga/vgaarb.c
Error: Cannot open file ./drivers/gpu/vga/vgaarb.c
WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version
2.4.4 -export ./drivers/gpu/vga/vgaarb.c' failed with return code 2

Fixes: d6e1898bfa5b ("PCI/VGA: Move vgaarb to drivers/pci")
Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 Documentation/gpu/vgaarbiter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index 339ed5fecd2e..bde3c0afb059 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -100,7 +100,7 @@ In-kernel interface
 .. kernel-doc:: include/linux/vgaarb.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/vga/vgaarb.c
+.. kernel-doc:: drivers/pci/vgaarb.c
    :export:
 
 libpciaccess
-- 
2.35.1

