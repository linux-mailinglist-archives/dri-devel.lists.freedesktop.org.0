Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E56D3E138E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7716E97B;
	Thu,  5 Aug 2021 11:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2134.outbound.protection.outlook.com [40.107.220.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192D6E97B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7LuPFWigN1ko3Km68+Vw91o6tAqDUXJY3vwzvUE6QZFvr3quq4HLB1BA1nOYNwWZH3xVQEIRpFO4c/44UJvE2j/nHc8Zb0ijuUxeYICQQ32BtwYbU8vFLXSFm6MZowYgr+K8xM/D27jMyPwmHnCuVsH0I271acjDREk3+9tXftp6rvl1HR0Nt2E/zvztv0fihXoR64y1jI6zki5RrPEuBeHYeDx629StUW2gubu+MK1ofy7qQYcbqetNA4tUXbfvzBlZHxRBB3izj1ew2iLEAKGpGDPCrbcax7YJmnsg+mFPes0SxGRmyeaFsuBEUbW9CpoVigVXNeLd+4wQVcvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=h22I+m67UgG2Nb86rpCV+DrGGhevu8usqLutkid96HldKX74U2TacgaAl73m/cewmOnxXfBG9LqOwzuF7LD1KEa4TAvM/jdqP+b47XaVepevlh+TxG6xK0QllACa4mYo4wAxZ2nwPA3Spf8+nXhbhFiUcapBaK0EZhNqrTigaVKKfkGFlHxxjKadXk7EjVNwfhw59Ty8m6e/5iZRdaWIZnjbdvhV60KTTkizSts4nF+15xNbDZ+pgjI+QE+UnKSJDDGP2EEZ504H/1kU1LshMejD5+MDcpbmogvBjQxRdrp8wZ0MUoPXu5VukT6Fo2JaUVHv/1nmK5ITCuT/VPeqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmraAaRPuL+Dm2SJmUQIYDKd0zUAZM+B/rE9xFjvJw=;
 b=VgMXFAP9jfwLsWKuvgxAhHCKaPhZnpi38RoDtsFziaiwMwQaz3uNjFp8z34aS8//1bupjRwHGG+QaeAtuj2XufU5ODIC6KFRfA2mE8gx35bE8cfPt15i9A/E3QxeyA6XQUZCLz/psDrhiC+0aMUkuRZUxswK5Y6d44RZh6hnSv8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4901.namprd04.prod.outlook.com (2603:10b6:a03:4f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Thu, 5 Aug
 2021 11:09:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 11:09:22 +0000
Date: Thu, 5 Aug 2021 19:09:16 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sheng Pan <span@analogixsemi.com>, Bernie Liang <bliang@analogixsemi.com>,
 Zhen Li <zhenli@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v11 2/4] drm/bridge: anx7625: fix not correct return value
Message-ID: <14407ca8fd8627ebd41e6f37b22a8f4fae3fedc6.1628161369.git.xji@analogixsemi.com>
References: <cover.1628161369.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1628161369.git.xji@analogixsemi.com>
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK0PR01CA0071.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 11:09:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b086f3fa-c935-4b40-c822-08d9580179ff
X-MS-TrafficTypeDiagnostic: BYAPR04MB4901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4901715FC3CD86045FFD4BFEC7F29@BYAPR04MB4901.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WX3Xp9It9lhzo+pKFYgzrm+PQTw18A7SkxKI2ascZ0A/F8Slq4V+LcSdD7WHc4qv/vuslgQ6yGJHMaKOmUifK4K0VS6M3C8mcEMh4qwzJuNVksuukS4b2XgG5In4r3Gl6jCMNPenOtoBhR3g/nua/fm4/DATOnT38jDBCqfUcLZtl8Yr51sFxSYzHedg8VxeP7wcHA3cr83kbSW2L9FVPLv/+5KnA+p2raJP0kJ2XURL/NOT4SR2CrwrX2/nAG7Ff3ksqlYH4iOfFTyttM24srHIXx+B6VML22d+zXRpVu74x7Uy9mtI/2iKF8dVhWsdC8pNsAHpdBoVoEi/C9MobrlEs2lUIp//DSt2TsPo9BucEZEOnHN2ojX5SigDpM2V5Ah77YZwyF77hAbg1ybT7cQ085SaKLWwQ1myUsYiBJEHA2Gn/8aN6//iUsQKY2aOIMYHPLXhkBfb8E0sMLEhVmZ1f9vrpUBGIBR6FcdGUxB5TUEqBeFcl2qmXW1AebwZkmfY8M/D6b8/AQYJD2cUsQDXf9Onn3Y/0W38i/Ax2m0KVw+mgASrka8YXQ0O3iy5NOIsU6eOMsom2d+i0ZTm8UyH8AG2p3mXWCPnWUckIAmjj7b00kl11iFjyOqa4vXURfox+8GI0zIkNLGwBseTwnWDERhf4acFDwhKFhPx1gH13BhNdGjmsLfrYBD0raYBB8XoyYf8f1Og6tBc5jz5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(86362001)(4326008)(4744005)(36756003)(2616005)(26005)(55236004)(6486002)(956004)(38100700002)(38350700002)(52116002)(83380400001)(6496006)(54906003)(8676002)(2906002)(8936002)(5660300002)(316002)(66556008)(7416002)(6666004)(478600001)(186003)(66476007)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5Liwjtt2tENNm6aMc6W6DApS9ASp+j/RYfXX0paloEoMSK8a74PLEZPLK77?=
 =?us-ascii?Q?ODA+RaPKbzXkYQzU2r9NNpvsU/n54nj4xluLd5vNFTj2fTSAWCQH7y5nZCHw?=
 =?us-ascii?Q?oVkfXKzqN39VDGKSgbB7swtEoZPWFcelPqrJh+68kurh+pXCo50M4Ma+rFMV?=
 =?us-ascii?Q?Gq6YzJK+WcyFsK9oPMkKwytypaP5m2T7yDKhu3YRSmU7JMSh92gNO1mksh+3?=
 =?us-ascii?Q?VoEVtnPnnLSZPOrCl/m9k2ZyzzgIP8Zw/x0fPO7LP1Wd2mLMmO5S1T8qpCsl?=
 =?us-ascii?Q?9NMzCBeIUguP0ttRnHF0kz171BLnkMZeWKm1VOVpk5PwHzkYBeYKp5V6e18P?=
 =?us-ascii?Q?+XMstozrUg7l3a8PypZ14HWtcmr19EP42UqdNVwC+BolY2t396zU48jPpej4?=
 =?us-ascii?Q?j5uJDxJ1q7SVRm/iReWynY7AUjfXePmBNpBSercYtYu+lnDrO1atawSK6AJ5?=
 =?us-ascii?Q?j+McqPKTyrXhflge54eHbPXOdsZRD6uPfOdUjYoPoiI3GcATrCKucGxEFLNZ?=
 =?us-ascii?Q?UshVOZmaxYHRJIgHCJeenxwFtTRjW4uOpz3RbeOLvH067I4XeyF6Q64retZu?=
 =?us-ascii?Q?9CBVoe7O2/BjeW1XZCuNZTb0RhrqLRVZOv9r1tyo9C0Qrv9+BdKMPHcyMnOG?=
 =?us-ascii?Q?bdBatHHIl1zRggBs4FjUYHAzf8LeatIceJ2U91pWpTDTNBZohL0utARbBNkw?=
 =?us-ascii?Q?RoTbIjlCLunhozWUiiIiHpOS2JAOOePDQPsSvXHonf7NqFCHoat1FAN4zqJH?=
 =?us-ascii?Q?QbWD/ASgcVhrtmQytiFLjUYByRz1II1kSHhdUCjUzWTqh1jmp4C8XCa16YHV?=
 =?us-ascii?Q?kSk0gUPLGUxoPtQrBZ4+kbLf57ewOyjpI3vEI4SwVN4LV5NCTwYJctZuqqxy?=
 =?us-ascii?Q?og0gUPBsymaD1GTkF7xZBbjLi8nJEIwQ+2/ajmLJc/7Xr0Vli/HVrLAb+RfK?=
 =?us-ascii?Q?I4LZluBwoCl82qATMcrXmZ0kt9A0WTpXlDbfXo6KdqlNwhTmk9TGFedbs4d5?=
 =?us-ascii?Q?9yXZycRmkKzo08aSWNVAUDcFxPppGk4fX9UXVmlIODmaj7v4T9zO5qzP94ZD?=
 =?us-ascii?Q?NWmQaaDqi0hlDJeIh5T81IF54IjYpS4YPTSk435yvcsK/6f4JBZ64G0qjPjf?=
 =?us-ascii?Q?dGEe3pBZM5PmK8UfZeE3GdQDWttKD2gYdZbQ3Y4RcyYVRD0KIo7NFC3OXNWZ?=
 =?us-ascii?Q?nV6gk0eQPTmcofakJIV5B5eb+PcjBXAjkn86J++7MqZTNHv+pb32u/CoeaG2?=
 =?us-ascii?Q?1Ik8TG2WxDJ4lh54aqawPrtjTSDoBZ7F61/CNXNlsftHywpAmesX12IeWJQv?=
 =?us-ascii?Q?l+ruHzdE8exU7w0ZnrwnW+QN?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b086f3fa-c935-4b40-c822-08d9580179ff
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 11:09:22.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjRl5SU0YL65IFg/DIAQQfnuTgX6h3JxFKOH4uNGYWGj3I71tik5B3A7+tk2kvH2VLuCy8wky7gas6N2xd7T4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4901
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

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..3fc6b7ce7fc7 100644
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

