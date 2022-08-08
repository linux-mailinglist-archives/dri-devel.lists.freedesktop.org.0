Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79E58CC20
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6D10FE3F;
	Mon,  8 Aug 2022 16:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13DF10F203
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZfN2gWQN2ocTFFqo9HaLjBSkJxVJ6x7XwcJn1SUwPt7nr+7A9UrEWCdwlgHY+wKV2vnOukIFdJLAzasbexBNFbNtqQteaIwQHMyt8aH6OFOFxOYLcvT/nnHL8YKF+NeRSHnNMGih0RMhqNxcH8dxxqnhaUBgxT9K8TUe2ayOgKD/CD/3hCtAvrif5SY7lbPf9MXhy3wCOUnW9UJ7H/LUaSoIqLbdHGh/8fzpzYXBoKm112dzaTJLS64+9PotA24zgOzNT5zmjGDfXfSno6LcdXaO2DO/x7aA/cyB9itSLXaCw9cJjzUwExKJXrFYJulpqJlbJ0+kH2/+FGDg4sbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK80iMTGd1eIHomFhsjpcRaZdqfqiEx88Ue6AouhtXg=;
 b=iv8Dqble4/bypz8gceYgjzhbo5GeX3Fh7IcNBsxYiIWNwqhI5uw8iRSGh6HPscOc3thvTxsudfjv5YL3LgRHayRkwVkJy74pIuYTPVm5zVMtdFt3Whrnitlxu3OMw9ZdmT2KuDmiZZh/KRq4uBd4PoIu3mzKW+dGGD0kmMZ3feSxe6bO4BbaGxy2jJREMEr5UZlzSCvEk9oG2YH7Tk/IOE8F2h3AP3AZYFrbXpZcIC4FwO/2sVFVKvElZ9XOj+wazi2NvrzH3tBDUuKzroI58bLvaQwBunKZHXqmt/7hltJwRv/dwYY9RYyF1g9yp63vMzWuuvN0KQzhzklWFVIKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK80iMTGd1eIHomFhsjpcRaZdqfqiEx88Ue6AouhtXg=;
 b=Ugdv0H1v1a3AYZWXnUZz2y/Vq8j+JiibbA+j8ICNClWq+WTWA+K1mVMr1axDsKWUq8XNMlruzXhgLrBunSkrz4oSahulrBwdCKmsvwrBrH7vMXb6V/xB7PxL8nq86lJTcb7apgwgtHVBvO/XMSRJhKqUYIBITLOVqkRRL57Jskc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB6389.namprd03.prod.outlook.com (2603:10b6:a03:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 16:28:42 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 16:28:42 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
Date: Tue,  9 Aug 2022 00:27:50 +0800
Message-Id: <20220808162750.828001-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808162750.828001-1-randy.li@synaptics.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38bdbed9-a945-4adc-1855-08da795b0edb
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6389:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vb5VzMVn8fZpnWsJbmODZLq5ypMQJCUP7Bq8e5Il+iq7me9DT/k/ArfwRVY/MDXD3LS6qOgmCh+JNLxg2KatoOwFQgN76I8EajQi8C5liOEj2QQQP3riRkW92JC4VRZyp7MUSSuWSAJNG5ARWEZd3LTatprpZGWoehzPT/edMHImFu6l8E25TUC7esOVhfrn2RPwKtt71VX8u5HUms5N6o7EQaXvXjksdEgO1gYc/SDv/pTjDriXToU/kafqVVlPup1OpIkX2lvhHFTZY154GO8SnnsyGk5zxB9cMlk4EWm0BKQNDnrmJ6ujjoGNYI/B/qfh28W0YLucIlRAQBYBAv3OIxlyhFcMkoMfIfq+R0QkWD0uLysf++Sj5EIwN35Kn3WftYX1vtArM2R9lMjex94I2v1jCTGdWRaPcT72flc9dlS5tBD2H4VbAEUoLEkXOcAhtodX8b3zIwFfqUT36GKde7MzZkJLEFW+CikcNXojiq06BBkramr5BTtptbUu7ejQmAvhq+ev8YgTI2EJwE1vDeUujyEiek0xEeCLFMWx7mrM5bbu/fOWVCnp6uRx7PkgGkF+gIq6XztEsjLHQWNRolFnfTFy3sbEdxdPbPKq3m9qIL7+JHxODJKdz75IoKKobUzpUBJY2PzSjVdE5RWpJWyGbX/rJKnCFZlCC5R8aR2DZviJN88LpmfLE6CoAJDN7IC+nhfvOmojPafnVj36yUoJlFXYvlGXCoOArXcDVVwI7HhvxH7e9ClbSqqM5NvJxQuhxz1roEvjW+H+CFNPmTHtu8ydgrBA4LQ/nSXdkLcW2zEjNKioLrDjMGNL/LsWhOn+Eonaf39AinbU6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(396003)(39860400002)(346002)(376002)(5660300002)(36756003)(6916009)(7416002)(38100700002)(38350700002)(66946007)(4326008)(66476007)(8676002)(66556008)(6666004)(316002)(478600001)(6486002)(41300700001)(966005)(8936002)(1076003)(6512007)(186003)(26005)(107886003)(2906002)(52116002)(2616005)(6506007)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4OFjWOpbKQTMDPxd/58hojKNE/c45X8xHCXAJDyHdS8nCzFL5Q9a+VpQm1Zy?=
 =?us-ascii?Q?9LMT6pv1HPNuNkn1ffFapFKMVjiN+eEcKNqTLMSOo9V/Vxwq5Cvct5o+4tya?=
 =?us-ascii?Q?qpv6MK1PsH7rjCIdsT+D/F1FQsi9IEGHQ/Deb1haGtwIKtV54Ivxh8FXmFpb?=
 =?us-ascii?Q?UIJymhcXQyfBwRqc9pa0Zkty0UfLfx8U8MfhxCWpWme/ueX+W3fztvNKNtPG?=
 =?us-ascii?Q?ggfPiNI2V0xdrzfeXe6DsVEziIsirCd4nri2YXryI5p62/po0WvXz4G91uci?=
 =?us-ascii?Q?JvOsBz9C5dBvqvFwaLuvrQCDuYL0os7szNH0yfY8GJH4/ZhQzV8OLFvDOi3Z?=
 =?us-ascii?Q?2S4F+os71ulazbvu6+dZz4o6Fy59onHiAgqbO3ckuukm4TEVJ4QvQgEv4itc?=
 =?us-ascii?Q?B7Va4NXbUd8/tGM/K93ySTO2wp07+Tt2fZnc//ZfiVwEkOCYLJO3UAdFI5xU?=
 =?us-ascii?Q?3v6MmPIMlr+/v90gKw7snTft7DTjgpjWXKxraS4lnTQxf2pUAuiPjlxGs9+C?=
 =?us-ascii?Q?wO0ZiHXActiB48Lyt8EK+kIYK3LexZX6kEcNAEL/hqqmEoObDTOiaYIgBmv4?=
 =?us-ascii?Q?871aPMcIoS0lh+uyYVMFX3WjmAv4nEtQO2O/auMHnkqbbtD1ixCRQQMOmeOn?=
 =?us-ascii?Q?oj8A0kxgpv6s60nBWZWjKMM4sxBDA977okpFedaz+BdxnSc4LHyW84jyZreJ?=
 =?us-ascii?Q?mtUdI9VfMkloHJRGLeFNS02E2rdg4KDAbleIGdRq+iRG+cF0LzdV0GaFPLMq?=
 =?us-ascii?Q?R4ymgFbpMYyXPC7tFDE0JjfAbOdEsBjmKQQhXH4yngnyeTdCbufCoyaYoaPg?=
 =?us-ascii?Q?BcU1f+jhuwjt+h0T+X55vREtNhSX1d+TYKGZfVqsZ3Z3iKwtB8Be5/rBrXqp?=
 =?us-ascii?Q?ZwQteLxxODlTpJAuJmSIL9hM+CE9g4GZMnq3lGOQZhtOQBJeiYSlbu4GPzAs?=
 =?us-ascii?Q?6E4vqtSiKqjs1qEnXU1R0qz/bYoX8Ej3+oSnfZQJLkOls5bDMehr5fojZw/W?=
 =?us-ascii?Q?9IeH+6nmHV5dqfmGTgIRagNMGYwLwjb+w4twyrpxa8BMkOM/geR0Do6V6zEG?=
 =?us-ascii?Q?mN4aDVOhJz1EJPahUFXlTvQD6yNeJbE3WF/qxxcFG/Y2cRsghWgvyKy8jmae?=
 =?us-ascii?Q?o/3RWmioNAuuRA2BLi5j52EZh9YTcpE4qwfbqmR5vhRgUX/rsiKmq5fx68sH?=
 =?us-ascii?Q?d0acYk4wSPUUmip5ueGGpz9pfNBV2bm0/H+LtEueNN0bwlxp9bRjWSDMk4mJ?=
 =?us-ascii?Q?edgDykzeMwTz0QwQU94Q90Njcz5eowfvAa2OTAf9D9X7aPQ7GNBLUTieOIGx?=
 =?us-ascii?Q?77nNB+QSTh5Hb/WyMxcJBX2WOVQRV7ZHzqkoEZlwa8JLXIQDYd2yscsyvbC1?=
 =?us-ascii?Q?/OAVQck1EeI8fJj36tdA2kTDOeKBVNLaHVQpBeVtBvXxm2xCZ9U7U5Ag4yol?=
 =?us-ascii?Q?EpUP+ke3yqh7sNLKZ7rs9rpOgyogX61blJQVMXOpmDtRtlQQjgZb6d4gS4DX?=
 =?us-ascii?Q?983BqVGEz0eXUHmdE9KtWqf8P68r+LWN1RZIqmj4VGgcko7/8H/Ps/m9eAn+?=
 =?us-ascii?Q?NoHelkk+TatcquApAy4gczwTpAJx8bccCN/rA/ds?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bdbed9-a945-4adc-1855-08da795b0edb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 16:28:42.8476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icVMVvVaXxM05VJ64pVTJf91fEHo7gllzP66rpbZn2ewd/01P9afiwcjU7m1qROZ89LHx3UbQhQNAnUNhO4DrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6389
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 tzimmermann@suse.de, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, jszhang@kernel.org,
 ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

The most of detail has been written in the drm.
Please notice that the tiled formats here request
one more plane for storing the motion vector metadata.
This buffer won't be compressed, so you can't append
it to luma or chroma plane.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
 include/uapi/linux/videodev2.h        | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e0fbe6ba4b6c..f645278b3055 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 5, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .block_w = { 128, 128 }, .block_h = { 128, 128 } },
 	};
 	unsigned int i;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index e6fd355a2e92..8f65964aff08 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
+		case V4L2_PIX_FMT_NV12M_V4H1C:	descr = "Synaptics Compressed 8-bit tiled Format";break;
+		case V4L2_PIX_FMT_NV12M_10_V4H3P8C:	descr = "Synaptics Compressed 10-bit tiled Format";break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 01e630f2ec78..7e928cb69e7c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -661,6 +661,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /* 12  Y/CbCr 4:2:0 tiles */
+#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
-- 
2.17.1

