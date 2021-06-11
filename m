Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C133A3ECF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D376E09A;
	Fri, 11 Jun 2021 09:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2097.outbound.protection.outlook.com [40.107.243.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2676E09A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5e6X9Zz8ztVLVzmB6xnspn5Ht1peHEb5t+7UfnHuReJ2zF1QF4BAjACRb9kBMGnL54XLx2pKGdKE8iiySKd1QBjLKFNb9J49ZNlI7bVTrXfaGjjY1l/kxdTBfi8gKLeHv16E+x4zQCDpmO7eUqC709mdBCV8ZjOv5hUWqhEm2+kB2wFVhaf39vfA0fgO+wQp8dQ8wqHVH0NPmJFz5wCsnNzkedgr5V1Wim+EAqN9oLyq4cgLThSJX0ZszXi4Y8Hwz62PWZJW0ndmPObO3XyaRGhFpZVZ3kzGNEQODYcnZ/KAeot2DXGhCfhygc4EKmMqVz0kvOJO/O56AHpYURvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+LBj0ddO9omGc64akNdzLD4clbX9FARvyE/dX2Z30=;
 b=hOcaAySV53VaSQrnCDzTdDDTHCSCyK9NoQFo+W1P1FRVn2Ai5BLTQx83Swtsy24UqzPZuYhTuYOYxSmfn9Y26hJlnVVVA16Qf0Vhhj3WIHxPzAJr/dHFTP7NAK1RArE9L1K5ywbOTJsyWyhq0wz0oRW3qhmKT+q3arJeD11PK4YNz+PBkLiecy97X886+AC3sepUC5X+omAomWtWhO2dZT3LUWFgDwVQaApHlX62mq6UrB7vP1gk9eBwybUQILwoUhOqRdEHCl6nm+3q/cCqRzduykHEyuQnsVKTuNpohZfaWDfLpMARKIUCSHB1SZ8LR02sGSicpWn6/nDdhfo3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+LBj0ddO9omGc64akNdzLD4clbX9FARvyE/dX2Z30=;
 b=nYmtZ3QEjSU/4HxPW2YyhKv536Ed/nKB/+kMEhXW/G1lwiac79nmPyZX6saqqWP3UA9qhbdoDamw1xaFKxmkR3dW6iV8N/2sx1qFwJ8+V/gexoQ/xFtFRu6vu12Mx2oUCf9XlEbMIFgDPZhbtxT+tKkq7GDVrdHb9wq0D3bgz7Y=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6615.namprd04.prod.outlook.com (2603:10b6:a03:1db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:12:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3%9]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 09:12:55 +0000
Date: Fri, 11 Jun 2021 17:12:49 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 2/4] drm/bridge: anx7625: fix not correct return value
Message-ID: <9c71344ad8036869231993585475c86b110ca3eb.1623402115.git.xji@analogixsemi.com>
References: <cover.1623402115.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623402115.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:202:2e::25) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:202:2e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 955a5746-1cc6-4af5-5ea6-08d92cb918ec
X-MS-TrafficTypeDiagnostic: BY5PR04MB6615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6615DC5E318BACA39FCF9249C7349@BY5PR04MB6615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uELQeHKCOy+hc5DfBa819GxY05z9mehgOssuCPzkTkvFW2pdxi1pPKhvQ46m/gQN0jY+ljVocL4Ej/s2OXfMBtdPpb8OjjgsiFJwSmtMf13+7QPpImZcoRTXGA5mKbZusr9dNSv/psTkkCbA+jJnYS5TvJ21SpuCMddYQbS9vi8HGh8Qn1rILV9nvEulqnJR5E7qZACmzRcE+YWl/yCOfGUZobjaG0+RoM+JqOVwC0hrP6E+cCdy3qJ61cDnN5Fx4SHr+qFKiDWlrz1IM7blQalQIk2YPc3Fuz0Gf9khgf4Njn/ye5TPd/66SQ9ZcRTz+B5h6YDsGOfxcDbp1PnZYmqoPXwrjwBFBzAtYV40Wk8ERluUyxdlmqX4pgZXa+YUmAcjeaHrOcqEZHGALqa67VX9zfk8XoUwyhNQPpczDejbL6h2vaYTqO2Rq4J9EDN4M+SuYjYb2BaatxjOubbSeWunerX/STr5t+A4h1KDi4BSKJSCL+vz92GC3y6RT81UHL3YCwwvO5ppJA/BkmA1+RUBeG8l74Ci5tt0ZnWyb4/yCc4zi14DiXbaVJblBBWZviIIpRNw3864V0jyp1sYSndb7IEZDFWCDfYkpiHMSyJNMm9vanANosZRxyasOUTCzCR3iq4BRSBgIKTrQFq25RvKPDRTF+nVo05OLNAW7gM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(136003)(346002)(396003)(55236004)(26005)(5660300002)(52116002)(86362001)(6496006)(6666004)(66476007)(6486002)(66556008)(66946007)(16526019)(186003)(316002)(7416002)(36756003)(83380400001)(956004)(8676002)(2616005)(4326008)(110136005)(4744005)(8936002)(478600001)(38350700002)(38100700002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4RhPNM5s/T+bfafg7aEBBLFwajhzlf4WePqO4C9woUf8JZdNgE+3QRP8zBJL?=
 =?us-ascii?Q?vcC1bXbUtR+2p33VX1JtktctvbqzUPUA3HCaFq7r55ZckLIY6bMPEeNIExms?=
 =?us-ascii?Q?Sillo2zExJDAJHPBxHMPz2FJq3QyarDbVMHeqjHD+QzEkCcz4zJUiylDFJae?=
 =?us-ascii?Q?DimiJsxM86y/nHrFl96XeGWw1lS5b2Yqx4Z3UpNkeqCce5hMaqnFCqww3SUe?=
 =?us-ascii?Q?zhRNgYvBFUfK/Z1vWUcGJ0i6X46OcfnztahtHMx00Lrz6vRPFLLa1VDAdWWF?=
 =?us-ascii?Q?pZdB5IIlHQZAuQByb+BeOKMj/13kLIxtzvLchw8BaCwixEaNhnrQZ4SGUZsM?=
 =?us-ascii?Q?hz/fS2gxMf+KiuhFPdljrpYyJRm6YbOP4bfx1WfC/w4SwGu8dq2ezLf4Ktji?=
 =?us-ascii?Q?QvIYC51SJdNp8VNsOJ58WOeiZWh0u82RwdjqAcThzZMsosWQdsX16Jg4pZXl?=
 =?us-ascii?Q?GU/ws9ymr9HrHYtezJ0o6S1EA3e6oXkbqsi5SisJuZ6xFMjruLGeCVHgutn+?=
 =?us-ascii?Q?Ty57SfT+FVSRiChXSuLj+YIaDa+zQP1W4Sqmg1K4L3PN4svpxjMlkuHbKvxq?=
 =?us-ascii?Q?9KSTwC9kMblTjl18JK71RqVm09SDgcMLjZs7ljL+jdmo99tibZCXGK8ypNnr?=
 =?us-ascii?Q?AeRKCmxofKnaxyaTcKyalsDuXzoYdgyi+dKCXeGh1zR5BZMuE/KgSAK+YVzH?=
 =?us-ascii?Q?W6i+vfUbRFiCbeKAJX2hvHtCgYu+DgY5oQ3kRLBSsUTuRhdrGuy48SCImX8/?=
 =?us-ascii?Q?1LdJnZsZI6O0SmNDHN3H6vBAIuFLUHmdaQ+V+swK97GDckUrW7M9oKk81TrK?=
 =?us-ascii?Q?U30bE0eHy/KqOMwPWyelnRJYM3RU/z67pNXvClHxty19Li5Jnfeaf8yYeDpA?=
 =?us-ascii?Q?fG6YCx3tSUhUxJKowzB1dHMPcDu89u3prvA1B3WUh+bb2ogUA491IGa3HrHV?=
 =?us-ascii?Q?Px+a2EP0J/rq9zlZaHNRkrRtKQ6NesT/t2fgYISyn9zffKKg29HypcNmXzfg?=
 =?us-ascii?Q?4la4O/N189LW04E4qGh8wSGjrAzzbMRHCXK/JlQptT4T0epqopcgQvF/W752?=
 =?us-ascii?Q?RuyNkgWnYbPO+JkIYFcfzygKNTbhJJqXDBU2tpinYB5QSd1FJqHFb4CuE9Zi?=
 =?us-ascii?Q?IMV9fGMe5X/k5RuNiosRd0d04mhzjMjXRsxkUapbxjG4rVfTP6qbwlaeEscn?=
 =?us-ascii?Q?etAH+XVuw6KRaP+TjiaRLl3gMDnVpHW0oda+xzzD2tjO8jrXp+abL6CBx4wK?=
 =?us-ascii?Q?MGuvX/of0yZtePnC0ZYRHDcnc0f0su5pa9DfrQOJsKNR9OAAlobgLbhdqxCG?=
 =?us-ascii?Q?bVXpjLl3msPeK8G4x5QS7Atd?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955a5746-1cc6-4af5-5ea6-08d92cb918ec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:12:55.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXwFC9+fy+gglxLgPIo2zo962EuOht/QVeoBMMGePVrser2ETJpSQ5L8iepwL9E2HX5U+8Trrp/WI+GDfh28cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6615
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
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7519b7a0f29d..048080e75016 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -191,10 +191,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
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
2.25.1

