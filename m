Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4F3070EC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA86E90D;
	Thu, 28 Jan 2021 08:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770105.outbound.protection.outlook.com [40.107.77.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2789B9F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lin9xUDv6PBeV3waMMKQPF1h0IzPUaZ/3AOlfTx1pkZdeZKEwBwb7bg60v1ESuYccFgrpN+On3lmORuaOaiQ/XBqNJSYK9yN4dbnkziMo9/LxfMItKSTn07Z494gvtQl9QX0axbt0nAD2g2KsgKnjqRW5IXFGG3rOJmFTp52ynwa67lCfLh+gHIl2/RxOPACclQPCjmUQMYgJXWuVYBL8NqWISAQf62aAjCKPu/VHlr8nB3YyVA4zThbPDMBffksXwcXHdwDjYZ5tynjWUClz006OuqE3NMnNQekvDfHj1Nshf7ae2zztFUhKnvY6pdR7yEDNc19+sYMI5QuUlFodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxJSPytLTGbJfuVaYKZUvuN+jvubAhBytBbcyAoj2zg=;
 b=HW7tAZtf7DsFTxwJ8fGgKRxTwbgByquIsdUDsXXI9P42roOqVm7Vd/qwdhUPUOApe0NHx0oA54Wlm1p3L4zQ/aKlVfYO4MCxvzDBLKaI7skgjnPgsv4vj5Y+rW1N1EqxB32eorhUnlKAKfyOiA4spnKKr5fXOeSb8l9zciPHKTrh4s8KxgQZfiAxUeYHlBxiCWLpsWgnwpp+WH8pU4q5ARzDLwWoSPClKhhQ/ioXRVD908XfG0Ad/gkFHSL38evy8QYJGXbtorZM6hsDLqjfjjMP+h9pr/O6FCB3ucmsuBglyHKTnIkE1La6IMnmQUj6Lj8yInByVNwmh8jePdPvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxJSPytLTGbJfuVaYKZUvuN+jvubAhBytBbcyAoj2zg=;
 b=QDxV3nXD1VBW6wBjWJFDrN5hqg9r6Gk5NvO/bjonmtHcVdUt67L7P5oHTgW1ggfbWF1D6gJ9BZGAASclzb/VtkAjKJXuKcbGawCxNddD47ehSv46+4lbOBwOS0TwYbtJDOpNL0x3AZlgc11JrbBfHx2kalXK24tmWhsTgAgaL7g=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7504.namprd04.prod.outlook.com (2603:10b6:a03:32e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Thu, 28 Jan
 2021 03:09:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.019; Thu, 28 Jan 2021
 03:09:59 +0000
Date: Thu, 28 Jan 2021 11:09:23 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 2/3] drm/bridge: anx7625: fix not correct return value
Message-ID: <23b62a447364a9047f0b1b144557e8d95f6ad7f7.1611802321.git.xji@analogixsemi.com>
References: <cover.1611802321.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1611802321.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 03:09:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877921f2-2cd9-40a2-d339-08d8c33a321f
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7504924B06D34117995DAF2FC7BA9@SJ0PR04MB7504.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eO5w1EZMD7IpFSaKwcVDLFzePV+wVGEafrc7POz2l8GLj6Bg2eWt2MGpghPVumeoCqgn4n6w5xkl6qzmkO903u3FmAFtpVmxIqL9jgXyzPBWq7OZtNbR/HPuaJU71jxgTguppUzl3bm0ZyDinwikUxaCOEST9cx1fsz6qISCbvy21aAbAjU8/X32QUSFRJNWLRW612vd9VpzOmmGAvPsoBBiAJAVhOjuQL7lafziil+jX4G3qflH0eKJj3lq5wsTFSg7B7Vjg40JhAxkYTs/PVWZ23h0k0hg3D7yQpf8DdALijb2auKQocX4FqtbkkFzpUb83n9Gmjap1P8Pj42XLl0s44w5mhTIyr4Fs4WVJ3HdbJpBvja81LonrwGgZUsGRJvdIit1+yNVTUMLscuP029d1ZxkN4gulGcsmZR8IGhg0Vc5Y/sLpY1bn8hTkCyx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(396003)(136003)(366004)(478600001)(7416002)(956004)(8936002)(6666004)(6486002)(5660300002)(186003)(36756003)(4744005)(8676002)(6496006)(110136005)(316002)(52116002)(4326008)(83380400001)(66476007)(16526019)(86362001)(66946007)(26005)(2906002)(54906003)(66556008)(2616005)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H1mC1wWol54gQ+Nu/1v1sjBMaP6Kg2drmcpva2AyZxopEmdqey/CE5/0nU4I?=
 =?us-ascii?Q?ogErnc8JHgN50n0LLbIG4kutzB81pZi150o0+vpRNBzjH32fLDmun1Ksc2c8?=
 =?us-ascii?Q?6pD3rHYhCFm8mphitx5RFqznTdXEz0EcJacBVXErujh1B0kKoDEKiUtIu1nH?=
 =?us-ascii?Q?QEevrbtls9hzWlvZWxNGxdjm4CMG6/76SpI5Wyv2TEoKbt005ognMTfYakY6?=
 =?us-ascii?Q?AZIXYdYU6kz6TNCHoVKmIm/wYINTEDT+hOWd65ujSCGmayt97LLestRiOPb0?=
 =?us-ascii?Q?HkwClIY07q39N3EX28xBn4AEgPw5+g+3X7KESRdQ72jwKc8JlgDDIBlI88aC?=
 =?us-ascii?Q?YeyIbqzHozPZo3vsXhvCK1FtETVTeeZEdwDj5V91XFhzUTK0ZkKSIkzX/Nv2?=
 =?us-ascii?Q?OlbUdsJADmUOg9DdMOV6n9Sbb4797lkjlbQ8eBCUX5vjIVIJ55dIsK9YGQW7?=
 =?us-ascii?Q?YHNy4ErzTjCuMkmVyZgnMYpaknWwK5rHWzaM4KL8mgXeof55CUBfvZ62XqTb?=
 =?us-ascii?Q?1Lhsgppj93nQyiloGCWEarxwqtnPlrf9hgjCuflLcSvUQBMKK8zp+cJWU1Ag?=
 =?us-ascii?Q?e9MecgYtSfqiLHnnCNV1r511aA/Frlnm5UsVHFt1Ojsb1KI6T3eBa/Q6wtBE?=
 =?us-ascii?Q?ivS8XdIfBDSYlW0UrHqRTqvyjZEl7MLQ8z6sXiERtqVaY1dyjjPJF1Lcln+1?=
 =?us-ascii?Q?YKPodZJwnATmF8R3yt/fyAOvAqUFyD6S6p1uQNkCFzArN+wtNcwrauKvaRcp?=
 =?us-ascii?Q?4IpngItq5CsIpGWOkiz2mYgB8KuvOX3fnzBQtktx9jdDWlKh5YIj0FgIquJM?=
 =?us-ascii?Q?BA/CqSpjE2gWrsAJmpPNnU2cMeeOlty/qeQs6yX4WtNbBfkHHqzjNxXq3N/7?=
 =?us-ascii?Q?OuQ1EO/OPhg45mZpgxNxJ/5BASYuj+NIucLPeRteeOtH6cpPoS/vz+C1idt1?=
 =?us-ascii?Q?Qvrcbm1lXevzfkwjHFYgjw3rZxYPjlBt4mYqlSvDoiXYRKxjZnFYXSnmkQ9d?=
 =?us-ascii?Q?UeaXqbZMweG5piqyoSqa+ELrgYMu7fhDz+AnaWHIuIwH0JF1Ylg+7pDXrT0I?=
 =?us-ascii?Q?b4g9deBA?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877921f2-2cd9-40a2-d339-08d8c33a321f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 03:09:59.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxAqlWQIr1eWcjV4tRYH6xqnK9XqeI/Cvhb+9iJSegwFAeCF1SVb2nw+u+uIIBrvq+4QD3bPSfk+v6KvxhkHKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7504
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc059..04536cc 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -189,10 +189,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 			       AP_AUX_CTRL_STATUS);
 	if (val < 0 || (val & 0x0F)) {
 		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
-		val = -EIO;
+		return -EIO;
 	}
 
-	return val;
+	return 0;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
