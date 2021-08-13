Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4493EB0D5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65036E53C;
	Fri, 13 Aug 2021 06:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3212389CFA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 06:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGvJf4kHmEE9ORVUg5aus7soYyBHqZvmy+Mo1Rg7iK39+Dgj+0mgsV33k0SHJw6sMF+iDGacXOMPZOfxOWBNpo0+nidXMpvaqTxEeHroLnxbsRicyYs5gdo1Zu+rZaHwoYTRcQS6Ws63ebL4aFxF98i7LTXKnaL1GHMYBvLxevgvDAo6J2DO1kxPxXWH4bgPSwtv1oMzT6hy8kEImg1rlvehhNEmhTUCIwDF8YvhH3G3WBF+HDpu56AFcS2AVXTKmznSsxZBlDdtvF3YcJbQNi4+qSHqzvbHdzFKURwcAbsKnkynDeQbnQsKidXdqHNnpbOwB1uaHXRmTmh0dNfEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju51WA1pXCrlmyJq81DY2scEE5T92Wxu9ch8PKCuG9Q=;
 b=InUwBlxoOraDqLCeSFUAp1i0uIXnW5D22Ox1H9zr3QODLlZCp9AyvwsoKNTVp94d7Qzkh63+4RfWut0OtvTEayUvp2efv3wAS1R9tJEnPShZ8bJTI/qaO+MWkSKY7iNq6uCi1XZS/fejD/AaOfkVzsdPYZShdruj922RGzW2UG/fbY2BQoLuTtHBhl/uVm7uZ6xA0M6qkPes6vyCAVbJSi91d9h9N1+Cwnmpl3UgjD2G825yAN93WH4rcCFPnXBGA/YX2jiOvTRDbDHIZOnjRwlHzhX01ul0AVpAos8yMu3U+YKt188VtP2ZqFDiSAWsWY3Wyz+h9e+spdfcm4ikkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju51WA1pXCrlmyJq81DY2scEE5T92Wxu9ch8PKCuG9Q=;
 b=KwQPcOvR+Vj8pp4pyuCd3/b1G6skT4cwCnOqJZlv1nUCbd61lIPyLEIJ6n3M7+JPF0es12GdKTS33kq3b8hM5QIB9rPc2uCxvjoEGhPirLJ62YSGe1ZK7JD/nlXwoFZYrrfrOzQirdqryERCa0UQ/8uRYWSIvHo6j8CqndKTocQ=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kococonnector.com;
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by AM0PR09MB3299.eurprd09.prod.outlook.com (2603:10a6:208:16c::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:27:20 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:27:20 +0000
From: Oliver Graute <oliver.graute@kococonnector.com>
To: gregkh@linuxfoundation.org
Cc: oliver.graute@gmail.com, Oliver Graute <oliver.graute@kococonnector.com>,
 Carlis <zhangxuezhi1@yulong.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Date: Fri, 13 Aug 2021 08:25:10 +0200
Message-Id: <20210813062511.14537-1-oliver.graute@kococonnector.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::11) To AM9PR09MB4884.eurprd09.prod.outlook.com
 (2603:10a6:20b:281::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2.207.138.2) by
 AM9P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:27:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef8700f8-573c-4097-9f08-08d95e236784
X-MS-TrafficTypeDiagnostic: AM0PR09MB3299:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR09MB3299AAEE4903319036D9D75CEBFA9@AM0PR09MB3299.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2Fx6N+M4AQJ/vZeHWLV54D+VqpFWq76p7bnCU2kDW1dOQVhu/e6rDbh/Rbxx+gRjCZ4bHTlKuuVNFZ1nDi87sxqJQXXtbfKGWhYAWfwyTB4MC7j+1VGadV5AowLKxQpKyYJMiFadaEgYSwNQ7N0oWN+21Dmsys04xYtL64/oewpTZ2dtuxKXLiSrpIvzf5fpLgoNfBmSUSitnxZEH7yjdSObogzp11Qo6/6+h6+39dKe8VDAZir5WxvtXu3q7tfZ+/IGnmU0lq6xS0UUfTmWRfyvnuJ4edKFAeP7scd4KYUa/L7Zmll3T7py1B8CoC++wFF5w9Ou6AtrMv8PLQVxIEKL2WXQyM7WS133MQpH3ZrnCOtieOhhnXcliHIXMgz25T/YajITWGgRvrGYwTpRg95dinBl8iveOoNcYY8kRjscJCkF+pcyZ/69Ns6L4VtxCQ1lp84/VyrDfULiXlPVetH3ZVeZmvVKtbo6Q9HRQAIchG+WygyM+KN8sp1CWLf7YVF6tSbdpBecBYMvvOqYv2WtMAd2acuo+dpLfLkiJwyU3ICiDQ7eUbYJfk/zIGxKBqdUusvCGdw4N/5+L4wzH7NwyV3bbifDY8rsfoeTrcGZnJSoN3wOVe7t+7bsLy+CXPFAJXEVX0rfGOjGtFqjmqv5bMdmjkglSmsEBFhvzHfSKuoVv/FnlQ2FL5npFVPdqElEqyRHCc/9/Y3DOhalA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR09MB4884.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(396003)(39830400003)(366004)(2616005)(66556008)(38100700002)(44832011)(66476007)(4744005)(38350700002)(8676002)(316002)(6666004)(54906003)(1076003)(5660300002)(26005)(956004)(66946007)(86362001)(6496006)(52116002)(6916009)(8936002)(36756003)(6486002)(186003)(508600001)(2906002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jp2C2m5vN5MMYsdVlUW6d6rc4Oiq25mnH/qFlGCw63cxqq+BH46bsP4vDUyj?=
 =?us-ascii?Q?lA8qpoocD39WpHPbl3Caq2VMCw8vjTTKTOdxB1yRAr99x+2yNxY7Gr22Sw7z?=
 =?us-ascii?Q?KeDUFkqu2CAhtifrTyGi36jF2Yogg8hrR218AOggQPGjosqfWK+Y5XqQFmVY?=
 =?us-ascii?Q?Pwxoo4OS3FHrkszTSQlsuCDoDGpI41y2NNKsnDk1fNG8XlylIIhw4/5iavDD?=
 =?us-ascii?Q?NklMVCZV5dgJnSWq9Zwk3iEAUH3PaHO8XNcGEoSSp5N1OZlxkLibrKhVheLA?=
 =?us-ascii?Q?+1hKeOmDK83GpuSZlgfIf0GwRYcjYVkyxNOuAV7bAO6SbAJ2I8ukhZJkFdk1?=
 =?us-ascii?Q?hEIjW07iuNPznGozTy2qW3T6jIcIZy+UUjA6h9xWdOPiaeLBovttlaJIr+OI?=
 =?us-ascii?Q?gbTqQghng6pPq66dWLbpm5f0aftmmJ+w5GvRocD4DUL5aVqwRrPHjaEj8IWe?=
 =?us-ascii?Q?LBpfLwlHlQVZrMCnxHaJYADBxNqaUik2Pats6469b5gFEPPuHxLcJF5EltHq?=
 =?us-ascii?Q?MdbW7ZKEiwkuDJvGG6u4dg15boDii9j8dbUmTvIif8Mzt3iUDvgAjM4KgoEt?=
 =?us-ascii?Q?svPbaozM/RW/QgLUkaYbIzsrAdwZQL2Fgp2Wl9FwAg8BJ/s2BIw9BPO7/Lix?=
 =?us-ascii?Q?TXyzPV5Of1YztjjKBHqBg5FCpsVc+lwAOFjmJDHtB6RXHCt8Oq7kcEI/8XpK?=
 =?us-ascii?Q?fVTSk8uCLE8BZ9OJeeiyS0GnzG0B5mebcEa45F1YDCNv//no7hU6ud2w9lOW?=
 =?us-ascii?Q?qoG9r3xb9PlmmBBdWo4blkJJpeaLYisZAsAtFs3KUwHccoMbRLEo6YaOBE9j?=
 =?us-ascii?Q?ExE8+o72LsezTWKR72fH8/zlWgnEmjBZ+N5WyV99P/EF7VxI5Ay17vJdaE9E?=
 =?us-ascii?Q?gbi2VvEHQQv7O11Dc7xksSRPSk1e62Jh/MfEBrBwv2PELPCz6nSn+QX0P42Z?=
 =?us-ascii?Q?9d/4k+z6Bp9lMjPPwKWr0Xa24l6G2U0O20WMQbZZPSMhtzbOm1QexP+ZBMzc?=
 =?us-ascii?Q?PMSkY/Ri3Qcfp4PVtmW8fvk4Cb407E6OxJ6cZYIHuJADj7k9t1N6diaT+b06?=
 =?us-ascii?Q?yGFAhzur3+uYSMaBd4z6Dds5tF4pZFvUFfuXtgzCrkpa1RwoGiIaYvvVEGf7?=
 =?us-ascii?Q?7gw/xAWWAOzTspkoZySRrwOlS2XjQG4T52wMTOkK8HpC14muJRoEM12SyE9E?=
 =?us-ascii?Q?dCF63xKaOAlJFJeCQKLqtTR5GvgWH9IeuRqfLFokymEp377i8mh9kHTFJSJO?=
 =?us-ascii?Q?1Irq8Yhj6gMpVGr9BO7VMgRSNlDKLKSZxaUrcWKnG3TNtdu+H3RP8GtFDrxr?=
 =?us-ascii?Q?nRqYnuMMA48eYTnBWZt5NcWl?=
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8700f8-573c-4097-9f08-08d95e236784
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:27:20.4640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UP1208Cs6Vg1UrM6oFUmK/YRwHIhinjJ+gIno57u00qjAGqKUCx4EmdrbJ7VRvAgrCSF26PafKbyAcdG2VkhBhbN+up/0vy5qOeMXdbcnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3299
X-Mailman-Approved-At: Fri, 13 Aug 2021 06:58:01 +0000
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

staging: fbtft: fb_st7789v: reset display before initialization

In rare cases the display is flipped or mirrored. This was observed more
often in a low temperature environment. A clean reset on init_display()
should help to get registers in a sane state.

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc1892c..0a2dbed9ffc7 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -82,6 +82,8 @@ enum st7789v_command {
 {
 	int rc;

+	par->fbtftops.reset(par);
+
 	rc = init_tearing_effect_line(par);
 	if (rc)
 		return rc;
-- 
2.17.1

