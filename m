Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25111EF1DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710266E850;
	Fri,  5 Jun 2020 07:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2093.outbound.protection.outlook.com [40.107.92.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7206E2A9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 07:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7p39a6ZqLm0sgbfA5xadfztYn6CfFZAD2WmB2iiiTMlLRj74HZ8gTcohbOMyBV/vA5CvdwhibJZhOgYWSdyDbuyUXwNzv0XNrPLFXBQu8LutEamQPVpU0f1T9geTMdKeOvEM1o8bf5tWFy2T8bmSYfSil3/DaW5e9mzHMYVjhGQWy7SnrxhRHq5/7LpLgDL5w5WuM5eyhVBPqHhYxXGRSw/xzp1GFtNqzc6l7OFMwdKHpxFYNO+tXwRA4am7xTtQLVgfSRRPlOkSMxKeA7McHV8YwHD0vFJWI7KTdXpxjDPLCW+RAhRDKmjIk/aj++4YT05RZRaUBt2DsszNvdtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdm5plml07C0uZac9+Fbpl0XXWSBxQLZPmZbtB5yeGo=;
 b=BPv5kQM4Qa7yUe8IOVuZNwdrY5NkFgOZs8Avy+m7ez3j8THXCRoOqK8tbM94z4YNf0KJq/YaIFqVUL7G0ySZlPQ8ukwBNzy21UngLOIWtZ0TNhLKka9bvg4iRFx0LCTsPKHVTzg/+5awW4xa5VGQhpco+AbQ56OqzAMH/y8FW0YQsQYcZKtZ+MsbVG2r9z0Y0ahxVnAj4BfhNedTsZ1wkHRi2uU/Sf4NKC0FO1KJrlEin3I8A7m8skhFE/UCooPG6yFfdIydoTvlu3jtS0FMgg2U/8Smeza97cRbOePeQG/eIvuUxxHCUNjP5rG9sFv2n9hPuX+kIMb8JxXygbcCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdm5plml07C0uZac9+Fbpl0XXWSBxQLZPmZbtB5yeGo=;
 b=yy+g7kqIeEQROxzogquM9OJphW/OZQDF+JlbvZ4AHjNAp9OC6bxW0gth7GcRDUCSwc+UtgbumglyRNzIsIIGZV04/OsVtPk5197goqSxj0edPWPWWIiIxG1FLy35xeEHfxBkW7R4lctwEIinUey0NLGUoa89zHSEIgUg+l33x/4=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6690.namprd04.prod.outlook.com (2603:10b6:a03:22c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 4 Jun
 2020 07:55:05 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%7]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 07:55:05 +0000
Date: Thu, 4 Jun 2020 15:54:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v12 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1591253353.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 07:55:04 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0376919-be1d-40c4-de16-08d8085c9808
X-MS-TrafficTypeDiagnostic: BY5PR04MB6690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB669045FD5A9908FD838670DBC7890@BY5PR04MB6690.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcmINC0rPzYCfYHnFlzdgxIMi71FTYreeZpMqiqXjYIk4NWHiDftlzV5q0QnCHBQ22kALrs1czZ3gcGoWqNdea2h3Zagfux19xoI5fVQJJCG1Da+Bxcojc0gTzqGCcNB1v18gjf4cxfxXzk22Djn6iIQX0IKhg1rC/UciPFcymDdXQFg0/ETo8xbf/o8I+uIkjbKAP5BdZc6wlodDTELowOGMSzCqeCGrIeDAunCvCxARXoWP05CliBr0nmc9zRYqIP5IM+ISoKUc/IClKFMuoijtcNI1GfNasAXw0S/kvDWKu4gBB6Aw4U0pO5aNuUY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39840400004)(136003)(346002)(366004)(396003)(5660300002)(2906002)(54906003)(8936002)(110136005)(7416002)(6486002)(6666004)(316002)(2616005)(956004)(8676002)(36756003)(478600001)(66556008)(6496006)(66476007)(86362001)(52116002)(26005)(4326008)(107886003)(83380400001)(16526019)(66946007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: h+0aw1A74LcBx4GBJhMHqqcTkOzXLksUdxFfaqvCcErXz8c5J3PDKryJz2FHrzPSw9K+NliAd1vKYUDHez8ek+iwwEZO9e660HIqMKIL0BmOVqmuQpU2kH7Z3ynQxIokb6TV73kil1jTZzrIihqhj6X57tTnnHvb+Nc+9tPqWYX71WfpUMfUVaTthOnEYhLJmBCQqm0FLVOFd/E4QLC7PrmtICJhSgT5yvLhCebhjAJMyN84Aviq0W5jGN9FBVfc+Z9BcLHnaMcdfLe0UCmJr1209wOpxmlp2zW4My7U+ifv8XNw4tI1QgDl8GsPWH9QLCYoYeADD0O359X3tJmM0Kmor6GXkgp80jAMI7XKfdsbiZMNb6qoBPGL7hGQluAOcsXmv4Pkv+x2r4AXud1TfQqR3Tv8rj2tdApj1rpTZbXW0gS8IsKf6xzK+A6yMOtTCIQELfY12Q4M9vZc0avAnPbP9sv5AVsZAxIwurlPfPgP+zUigsp5k7z1N+GgEMd9
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0376919-be1d-40c4-de16-08d8085c9808
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 07:55:05.5677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3aleOva4vAbuTUVlMtRDho85cWrCJC8ZbSF8CudqSQy03mW9r2GdqF7m/Hh3wPEFpDxCBJEFjVjtyW8V5itqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6690
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v12 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v12: Fix comments from Hsin-Yi Wang
 - Rebase the code on kernel 5.7, fix DRM interface not match issue.

v11: Fix comments from Rob Herring
 - Update commit message.
 - Remove unused label.

v10: Fix comments from Rob Herring, Daniel.
 - Fix dt_binding_check warning.
 - Update description.

v9: Fix comments from Sam, Nicolas, Daniel
 - Remove extcon interface.
 - Remove DPI support.
 - Fix dt_binding_check complains.
 - Code clean up and update description.

v8: Fix comments from Nicolas.
 - Fix several coding format.
 - Update description.

v7:
 - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
   enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.

Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1961 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  397 ++++
 5 files changed, 2463 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
