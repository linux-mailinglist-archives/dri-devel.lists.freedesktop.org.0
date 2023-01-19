Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C796C673C4A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB97A10E971;
	Thu, 19 Jan 2023 14:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE8610E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj+75FXRCjwFx9HkyLoSytfSbiB+Ilu07E8EhSdB07IM9YXvdH/EJYuvfJ/4nFXY2wruAmbs0xKDNgCAa8C12UWMZ4ei0gtoHdOcqCkxXXwxQbmypnLqA4Uj315DWSbH34Y0MyVPr0neNSAeM1hDc8JXN7yj4sSHs/UNQawJDa+XhgXwVep4GjK0KkeRQY2gVkrcNC04zE49zlaV2sw3yEDUUY1KQAE+SickklK3JYwIELRnJoozdaVHRLmxk+AGVRxBc94yGOjpLOexB1G8C5kcNN7YCd+7g6AwW/i3NOIsDJ3/G77laviZl0KxFHy+ZCia66sEJxkAWmQWttcUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkmzXP433g36lmVGSWk0FObt+14496EMVIh7i4RMKLA=;
 b=jp+OHkxvaXKRE6sYQDo7pfItEEUawfk9zGk2/0jYqKEuis1PWEYQHSW/XMaX34fvrZ5Bu/gZ+KbxFP0KD3ipWzG/HMEgFhsSFa95OQrgxKqws9kHs1ybv1/4QS9CLyaJHiwLO3HJuExBJ+WNZXEEzzvLrycff9zIf6pHmr1yencaWiVep9+pZm+nZqdfIBzGtN6o6kSMJgDdg7p4Df38zs5/4Lsbr8CV/QNf/STSUwe5z+Xa0V2+KfabH8ULMeC81InZRCtzjKSdIcKmNxRpaQ2LJyNvaBkb2+alKINnh0vd78AUx4+Lo473hKXb7p+glgf+olZ5sGJEy0C4xLVH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkmzXP433g36lmVGSWk0FObt+14496EMVIh7i4RMKLA=;
 b=lffbv7IvJJ0pFhIdUqN4vpxl3s3uRGHWwBNUMFYsTj6ZhE5ttMZB7whm5a8ycHsQyK+Fg9QXlWmmjZUGiSjzrFpbcxpcDFSWvaW/yMm2pyGDU5ENdxJg8PEBereK1pzcyWsnL5+cev4iCHj5qI+jj0r7vgcPxsJ7EvFIzP0kANI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:25 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:25 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/rockchip: vop2: initialize possible_crtcs properly
Date: Thu, 19 Jan 2023 15:39:06 +0100
Message-Id: <20230119143911.3793654-2-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: e307a077-75a8-4286-8e62-08dafa2af64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pLIOIWTeCLGBbDJ3hBddCSGBttpzzT89GMkFepDXZ7ciDvjsnYRVN1rjN3pV/JQk4q0Fobe90+df+x3h5Ak/BHrJxcpnnz09DEm7o8DmFiSYAjAyuwSbuuKFGuX+EuYcVYnr4oPbMVXd2v47qgTPlbbCRrholk1KJzXGminnwp6FNLcPhX6Wxh2zyS1fRKbnT+HRdijV5kOwkM6zJup1/mUgnuJHXrk4nwHB2H+57F57tsoXkqTCPlGPrIl+E0aB6rM/+8i2BZyNnGWoC7miKusyfDxIap6odBKFwHXM+0uNtUMnzDZxTvw1BygE0lRNqAmuJ8W7t/6VlQ2c249Di4+cgKe6erbTH/oS9QtSAEiQEGNsFbrh2Ckvx+OI96TkHU20TMlSyZSwwbhBF+PIgaRM4+Dn/N9rvbhpjeDRqJBi+bprlKcV/wukl2bQ0ndtDuFZ5NvQ2YLr0ii9Su3Gre+aX5T2aLC6B9cQ5nv4+aemV5015eZWMX/IH3N+So7exnIyHhExELyL63FsDv3n6fuJUzcUKA3BZB5iOB+NcKdPDgpRFkc+yB2eGaHR6T90f0LCMjLDaKzq/zv6cSRr6JAzjP+toaa4Q0wJah298VtHvR7actCKbMbJGTHatriZw0Ud0maDf77IaGxs+JJ3nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0lPkwXv+0eEWl9DI7JUrW8QFFLdYUgC0deK0Xvli06M/fhULcHjh2JIlafZ9?=
 =?us-ascii?Q?7NSyqLQRkvuopuRPaYBZEPz7OY0NbpfwEl95hbQdZSZVwEBC2+swUEqW03nm?=
 =?us-ascii?Q?YNVwCyyGPmY1//C0vw/j/+nLE85larCeWPLJFhpzW5qrZdZrbEFxEkeF7Lqh?=
 =?us-ascii?Q?ck1JOnmzgeYklWEuKCgRab/WonUfv+k93+h5rSfN5Pex/V3e9BadBB1JVNQi?=
 =?us-ascii?Q?A9IEyWEpce3XYj3ImGzUotSogizC/UvI3Tloph87HZA7Co7seuBAgRdQAULL?=
 =?us-ascii?Q?L7S9Qo1Xh1bwpA8xJGxPJo/zTu8iUWjn6IB6q+CL6cNXVNIH6cp2KvfLZODs?=
 =?us-ascii?Q?AG6mD9OZbm8k8FFOXXD+BbpmGMfrtogBpbDDguDO8lrUPPoXWpPqeM+rBSlx?=
 =?us-ascii?Q?g4zWTWFZnJaT/eD/C4GRjFmNvxn2Q0AW+rYMRQIzTQxp4gzTuYkAP6zs0j8Y?=
 =?us-ascii?Q?VCrbMS/uEfb8EJQ1QKCekBbgKk6F96ZxWxD1cSqXbwED+9ZMdNFilMFctVJL?=
 =?us-ascii?Q?NdVXbSvUzN6IaZx6PxjYQAnwGhi5d3o2s4PcyhK5vybemrQkEtTX0T8h2KLk?=
 =?us-ascii?Q?imfDlZ5O3WV6Hzo0Iih6CETg5BbS/TlBwiIjlCtGcTPwHBT/NmTBn21XqDl4?=
 =?us-ascii?Q?2CIkGc0zOcixC/AjRluHqJ1/tiazZn3DE3nRuQE7QSbkUKQkMiUwSXsM/lD1?=
 =?us-ascii?Q?JYn+DV801YgIOfklZrIDxOyTo9Eg2UBE6gsg/p+asasa/hShJpuxGfD+rtxw?=
 =?us-ascii?Q?0M9HxgoDi1XL4zts+Lh6n21SzlyCvyUPeI9Gw5xPIfvgwJA1/ONDvROqQ7hU?=
 =?us-ascii?Q?+K9goA2AlCBl/aOKcmTcQOxG1GZmiBYO7Ii8LgSbB9hMjaI19YZRVGK8d57A?=
 =?us-ascii?Q?fwqUz25bLaOb82D/799xyS7otyFkZVX6aPDSuUEvXwV76ahrazNz7/sjyKa3?=
 =?us-ascii?Q?etMkROEtUDPyotWbPn4PKTwcviTwGSP9z4M5L4cKoLm+mL4M/T2Ol0oY0OmL?=
 =?us-ascii?Q?KGgFcReLoV1fhlh0Cj5olVu809VnVLMX1VpvwG4dor89QfiYSgBgmXBmrG1H?=
 =?us-ascii?Q?XiTafyAZXM/b0fvEHBdKJHputMfVI2yaj8Urz6J4DBR20MFtp1NrZ6R6AYaP?=
 =?us-ascii?Q?RRMCdR1VUqCUYG6l/rYugvRimOm57ujAky7g9pXM2u7EtxUaToeYaxIQvXtm?=
 =?us-ascii?Q?i4jlksrf5ad9VS+goc2e/Rkqut1hBeRHCyf/9b9fyJzNhG3FhIjO+E1VeaXM?=
 =?us-ascii?Q?opDVfMZzyheoZIeK4mHNK2u28rBgMDTEJDqBIWRuPNsbc4Kv2wdoue/TxXQy?=
 =?us-ascii?Q?6eW789sx5bhzmTvms1y8ZJpI108ujvv5x1R/LkkKDzBVdgMShDRF8MJS8afC?=
 =?us-ascii?Q?AxrXrQAXbxcfFO00g4a9zoxAFD9Zr0tNIksriLP7gqOiwc9XzyfvoL00O4qq?=
 =?us-ascii?Q?B++ZsvflrDcCuw2jp7GK5dj67AFBS/5KeK62SlKGQQgw7c2ALBxilCfFLD3N?=
 =?us-ascii?Q?0Yy3DbcL5ffUIBL+5wBgVp8DKCurhIHiqYRUSZQ/oDPYBS5py/7+FnN7Kfxr?=
 =?us-ascii?Q?JW4oelYU/imhsd1hE27JxLt0cUvFYU2DFB/RGBfsaP6lgSgW7crlRrhKs8OI?=
 =?us-ascii?Q?PE7v6kEbBjXp0mA75+dPPpjvhpyIbUe1YMqng4QyU+7bUduJ+us9Jssn7MtU?=
 =?us-ascii?Q?eYb3SB/Ig+/yNcpMDOJ6UzNJ9/o=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e307a077-75a8-4286-8e62-08dafa2af64d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:25.5600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev9n9lWn28ZvX4uLV7i+Q06HoBohrCitVJcOOUf75H63iqXjwkYFyXtooNJn58uGW+gfqyYi18kne+n6gEjVq4jeQLk9VZslfbN4toRxO+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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
Cc: Dan Carpenter <error27@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable possible_crtcs is only initialized for primary and
overlay planes. Since the VOP2 driver only supports these plane
types at the moment, the current code is safe. However, in order
to provide a future-proof solution, fix the initialization of
the variable.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v2:
 - new patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8cecf81a5ae0..374ef821b453 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2322,10 +2322,11 @@ static int vop2_create_crtc(struct vop2 *vop2)
 				/* change the unused primary window to overlay window */
 				win->type = DRM_PLANE_TYPE_OVERLAY;
 			}
-		}
-
-		if (win->type == DRM_PLANE_TYPE_OVERLAY)
+		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
 			possible_crtcs = (1 << nvps) - 1;
+		} else {
+			possible_crtcs = 0;
+		}
 
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
-- 
2.30.2

