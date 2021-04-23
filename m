Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF8368F8D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 11:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436196E092;
	Fri, 23 Apr 2021 09:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9C6E092
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdiFvePu3rx3dfK0jfLhy/ZcDAo9bOmfuGi/urFETkIbYsE9M+yTzp7dVHY8OewSD403/cEJyCwG35qubIt+iPip8lxrFFLe41VnWuos1a1pLnl2r91fbWFFnfToZXILunhZHrB109nWiqznlbIngMAqXsyZAiXNiiVQsbBAtQnv91CtqfTrqzuEqdYytP61AVuOGEVg33OuWVwudyVjrZSPOMM5cvTLc04uX69KWnl6VN6d4AcEgdFP6W0BZ6cblsiZ6C/h9nsPeaUCjmLHTRWvYhy0QAUjqHsOyD7/bVEKDh692J3TuhQhRsBoydhO8bwjiY3sJkAgzjxakhaqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+IaxuRhEBVQQVaWEuD+SVsNqwly5TA66Ux2gYGXZdo=;
 b=YU8wWVezeSraNAGIFwqWuQKKEodYrkTobLkeQ73SK4Ws+RbvVrbKixUgldGer/5wNgn+foDH8Pyi4iTZ+106Rp08P3kokFdYn/w+jb4yyrmiWt8qK5gEB8m2dBkVe2Ph3KAHupYhXEygIH5UMiwU5ua5eMWL8cznfbrNaNnGWB9Fguk0bB41CUhndzQSiBlOKl5/vqh6FIYrKmuldKcWjxe+zSM3bjGG+KglFPAGje6FFFHqqICzTsi1WI/g850LH6LEua1TdecGSTeu+wgmjlQB7EkKdgjT57Fgl0tTmq7Lfo0Uq20zf8gc/Pvx+N9to0JYvYoFgVdcSNvJBR6TVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+IaxuRhEBVQQVaWEuD+SVsNqwly5TA66Ux2gYGXZdo=;
 b=C4zH4wTuBSkP7UjEVv1mkiehOobnxQI1xRcnL29uaqULzPdN93dcyUHhZzDkDN0lxhp0RKeov0w2G1NiQYEkKSJKwCat8BniyIPmw9+g9wI90X1GkW9M0fNaEzoBuovM3EimkVW6Cmsc+qycg/OGyNZ0oqKiqS/DeJu0OikWyQE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 09:42:21 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 09:42:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY
 ready in ->mode_set()
Date: Fri, 23 Apr 2021 17:26:40 +0800
Message-Id: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 09:42:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed90f88-2167-42b3-830a-08d9063c1749
X-MS-TrafficTypeDiagnostic: VI1PR04MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6992F4301B852A5E17D7752398459@VI1PR04MB6992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0h1Wqkll548Ey84SbPS5b74dt+fqPpbj38u6h9RoU2oVLnt4bd43CHWMxCS1PFqwZE/V4McTNBta2ALgSxBanzeWBipFNX5p7m3OVhWQWVVNqJClJ0dH4w4sRI5B7MJbzJtK0SiFbDfHX1XCjLaLgULnxjtVPShaZl5kjlUXHUkWMOYyg50CDBFjpczgt4B6O2PkQCrOnsz+Y78v+3SDFFasALeoDEPc3Zb0b693p5WtokFkZg6g5tC2YIjJmEtInzRpQhr7KI4RZyK6kMW7DWZtR7t5B2J4F+G5m+ajD5IxFRjekBKMbtjA5Dd0SduD/vFU647Pc2aym/0j+oA1UT3w1Bh7RE6cq7e0VzUFgJYL7nI1bzNZMR8b06CqK0VEmm80BcQSYUnPLeCukhIA35ZTbtqiM0ygkU+ktjWXoQglvO8+dVd0FR4StjRZ2OYntVD4D1YsfuZdUENcSbYty72I7I1L6F25v+wL7CH5AExRUxYbSnIXeNCvNs1gUWsCRth9MUk4EvqIVSJ3SwBD9U645lcFSvAPNTFmW0UCDYPIz462GWhDNzoUTefz3MAvvRpjt5hPdRUFf75q+a7cTFG1dF3DYuRbumiMZz7rBrvcPt7KvWnDiDyL9iKBstNdkmQIX08hsKWRPw7WKq587lOuVl/DvXbsCZ8D0EoRwR3DLUQzkjJY6XNrFIJwchpR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(478600001)(66556008)(66476007)(38350700002)(6512007)(66946007)(8676002)(38100700002)(52116002)(16526019)(7416002)(6666004)(83380400001)(5660300002)(86362001)(6916009)(6506007)(26005)(186003)(2616005)(8936002)(36756003)(6486002)(956004)(316002)(2906002)(4326008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2w9mgtA9jBvEWuKLXURAyUmMtm8Tr8yv9HgaZTHMOJdgcXv0aA6obYVVDXng?=
 =?us-ascii?Q?GrLlktrQPgQ6J4BlmCwolBa5tYANTCAVLvHqN+CFI08LtcGqJcFey7YVchLl?=
 =?us-ascii?Q?X2k2YbHOqHvhw1/jAsnre9GyO8zUIwoAnhDhpsSgzxuqIaNRZSVDpv0w/lFG?=
 =?us-ascii?Q?v7WYRhX8qN2zm/5UNw/bCCv5DDyjdd04W0aWXG8C0un/vND4F8pVrEMEX1Jj?=
 =?us-ascii?Q?55gQ5l5LgCdGFs3FkiFwrfuVkHKD/QFfmNSHhYmR38NYoyul6qYBgXiyPhDW?=
 =?us-ascii?Q?ezPn+qofdfQRcUUKvgXjmIZhh8BfY2gzP5qLDX6UWsDWz9NNvcTYcIE8RDZP?=
 =?us-ascii?Q?OgfJqzzWvPitgu4bBTPAjTQ5NvowUE2Pqnz1WW690W9lUOxa0n7hzHvVe+zk?=
 =?us-ascii?Q?mDGiVapjhw49umG6RpfiQnWffyF/akDKoesEdMJj35ZYYbqdaBu7tjSualpS?=
 =?us-ascii?Q?ZNWKS2sqJj842DVcXFFp6zkqijOPtus9i781PLf875At2IwMwub1Gj9pZfHf?=
 =?us-ascii?Q?+XSgSn0VTFusRae9PUVAF5fVzqigQMQa+eAAxcAfFXEMVo4DyTwYtCExMRzz?=
 =?us-ascii?Q?OiPkRoItDlZG/yPiS1OlLYnNhQmU3n8okWXAuPWM8rm88mrcbFCKpJoY1ebM?=
 =?us-ascii?Q?yhTKsNEy1jRbn0X81chXG+5wDIBqcQBd3vyUcB30ttbOcM+LHk9Vvn85le+1?=
 =?us-ascii?Q?orzi2/88fE9Ox25Ze3QkPxuar3egl1/eMuBZA6uJ+P/cBd1x+QRUOPtg+tJz?=
 =?us-ascii?Q?qsKnYY7djDnM5Gc2N3vo/cxhsPeqxayfx+KfD8P+0DRf1/rPTfDYFSkYue/d?=
 =?us-ascii?Q?o7W7UtPioE3RCmK4MNm2HhwD3jjMsSWAd6K6VK1eXx5X4gR287l2Xp8Hgu9+?=
 =?us-ascii?Q?m6sfV6v9eF2ZSZKZF2YiZJPNzb5eMYDM033IOPSjnZzlS85+wWvwVPN40qL+?=
 =?us-ascii?Q?0TZhfzIcgi4D/ABmHTyxZVuYF6CPsDgoHAj0qsbBVnd+V69rm1fSPAR2cFPo?=
 =?us-ascii?Q?4n1lTAPaHxw72yo44Evvtl2T+zfUwz5qW08Tf9zYc8EhpnxFOSPKyOudyJOI?=
 =?us-ascii?Q?GMAWN4rc4IumLvBrbcRWOc0wpaCz/C9u5CiOD3eBFu/kQdNrkNvQRrG/lwZ8?=
 =?us-ascii?Q?3ismLUxcHEfRb0qGV9kAJYcXxTfVIgcNM6zEumoHI84vLHg4KEB9XxHYZQq4?=
 =?us-ascii?Q?3Sx1V8KcF5iTrjAde83H0MuLwfkNh19xOrByXE1HgCrWdlqf/8QCdtr76s2S?=
 =?us-ascii?Q?Z1yTXra9mck64gnezB5L2FeWMf2/KyxRNdrMD4w+1b8kgk2wdpKwuu1ID+M9?=
 =?us-ascii?Q?og1PFhNZBs8s1+oee2SmWUJr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed90f88-2167-42b3-830a-08d9063c1749
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:42:20.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osZ7gTA0SiND2HwIP3C15Oj5i/z2QG2cnsSdOOz41E2yGz2swVpmHmtOy0DjerhXHw41s+ThQMz/IQ9CR7L16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie, agx@sigxcpu.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to make the nwl-dsi bridge be able to connect with
more MIPI DSI panels.  Some MIPI DSI panel drivers like 'raydium,rm68200'
send MIPI_DCS_SET_DISPLAY_ON commands in panel_funcs->prepare(), which
requires the MIPI DSI controller and PHY to be ready beforehand.
However, the existing nwl-dsi driver gets the MIPI DSI controller and
PHY ready in bridge_funcs->pre_enable(), which happens after the
panel_funcs->prepare().  So, this series shifts the bridge operation
ealier from bridge_funcs->pre_enable() to bridge_funcs->mode_set().

Patch 3/3 does the essential bridge operation shift.

Patch 1/3 and 2/3 are split from the original single patch in v2 and
are needed by patch 3/3.  This split-up helps clarify changes better.
The split-up is done in this way:

1) Patch 1/3 forces a full modeset when crtc_state->active is changed to
   be true(which implies only connector's DPMS is brought out of "Off"
   status, though not necessarily).  This makes sure ->mode_set() and
   ->atomic_disable() will be called in pairs.
2) Patch 2/3 removes a check on unchanged HS clock rate from ->mode_set(),
   to make sure MIPI DSI controller and PHY are brought up and taken down
   in pairs.
3) Patch 3/3 shifts the bridge operation as the last step.


v2->v3:
* Split the single patch in v2 into 3 patches. (Neil)

v1->v2:
* Fix a typo in commit message - s/unchange/unchanged/


Liu Ying (3):
  drm/bridge: nwl-dsi: Force a full modeset when crtc_state->active is
    changed to be true
  drm/bridge: nwl-dsi: Remove a check on unchanged HS clock rate from
    ->mode_set()
  drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY ready in
    ->mode_set()

 drivers/gpu/drm/bridge/nwl-dsi.c | 86 +++++++++++++++++---------------
 1 file changed, 46 insertions(+), 40 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
