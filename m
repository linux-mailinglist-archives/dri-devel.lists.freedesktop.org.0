Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5C4EE526
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3F510E41F;
	Fri,  1 Apr 2022 00:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08olkn2020.outbound.protection.outlook.com [40.92.46.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9C310E41F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 00:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmeSs/fjoElj+5sRCzN8cCZCU3TtjG8xeVZM9tSQ9XRLyS0/UD0R1oyqrSWabA1Vm3suEWnBJDtpTBd7f7ZF7Isb2t2j9eKpb6KL1NYlZr6IcTWh2J7eZW4szRh5oLV4ht630b829mJ9UrIyQaysK9d/Bi+3dkxy5uiF8Civ/w5Dq3Dh4Ftg7kAksqR2fxPgSt1vqml/l1c2ADFkPTSlnFseDvtdLYXbzDUNMvGW+Ovo81pluuKdAhMjR3c6KiJsZSfQ2tujZS6vAaUg+ZACfMAAzX5lKcv9YNJNE+p2ce/7EerVTVRSc/SJC2e3h/GJLDz6LZyxlypRBSn9XACQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzQXKBfYcDy7r5ggQhgb6FY5CoUf+8zmG22PyzGZa3s=;
 b=JMMJGXoP/CoMqYIRvdr4QGgZLceN4B9XApMQ/x3NPUwsvl4Sq2BP+OkFrcMwlqKVl1vxVuXktfup1Opvjf3CLz9FzTVQyWdw/eT7jKYpvH79I9G2yKK1DEJUUXpLZoiH1bQ5SIUDl9qDhbnqRco9E6uw8oJcDwfJ5oR/3cnGxDMB5ZWspzrmHVJ/+/Gi0M/QxVaiEcIKzghhMdlShTueQhrtZGl1Cib0rSr3ejifZXH221Zyl2I9C4lLE10oOLrvby1cpe79evihHk3ZgMPXFXB1Smfp8NQAvPi+g9VIn8e3a1XACNYXyey2NnNXtgvr6N+K+iCKqvlwySogcANJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB4892.namprd02.prod.outlook.com (2603:10b6:5:12::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Fri, 1 Apr
 2022 00:18:50 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 00:18:50 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/3] drm/panel: nt36672a: add backlight support
Date: Fri,  1 Apr 2022 05:48:07 +0530
Message-ID: <BY5PR02MB7009FBF8DC8BD5C055DB41AED9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [TUKS7Jx8SlI5uNSfe57+hAIfLWI0zDo6epeBAJhio5vH3MzcV6N6EpNQ/mYdgULk]
X-ClientProxiedBy: BM1PR0101CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::17) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220401001810.81507-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d4a71c6-3681-4e54-e084-08da137531e4
X-MS-TrafficTypeDiagnostic: DM6PR02MB4892:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7k6h+/Ft+XKAoZeKvzeNKB5kae2X+Q8vfNUM0G6tyAVBZg9eJKGarYuLQ/px0Opc50W2f4YS4GGEvFu6/uo097EeexYwvi37a73lm78kEf5Tpm8hTrfkXvDLfOuIFA/5MWc7Dcp3x0KDaeI4eTVy2jURLdGoSQ59SJKBpcUtDAwpIQwYVKwt+fd4i8bPbnOVq4Oz3Z5Bn67avH7TcSefxTUCJ2+bp0xlw9iZU5euJl177SBCRhIvsb2Q1QgruMEnUyKmSJlT6oVEpHK/diMfttE4rBOZ7+G+MMZK3Q4buyZ44U+usacuy8v+i1tYYYRM2cFXSLoqXQg2rdOBwilmXYmVHj2cGg6E+bYtfe8ALdJ9qhK3FQfeb/y1lxXCxXRwzIDbPts9NynG75ALy9AbeQ0DsvrJQtNXOxFHbFglekkJQQwbV5XZ5RU3Imgyuqm+sQnIYzm2i53HapghtKeTiDYUgEtGJvEjgw0O+ga/Gl0s69n+FVlhb2RErS1HODC5x4Pq7VuQ3XvJ8zqGAt8XaK19MtQN+v2WH53okaoyat0XeLVh+jiChXoq+lo8pkORmdoFFvvkqvWKbhj9kjc3aA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bc9sBfIpFHct7vGj2lDKqJoSjDcGE2m1Bc4HDBtH5w86HrOGtIcOSHANF8fV?=
 =?us-ascii?Q?CFSUS22y+FY4W/u5MFnctAl5tpB+ZEAHSdBoQbN9ij9zfXPOh8xd04U9ZE2D?=
 =?us-ascii?Q?YNnAO8ejOluJc7qA+qVqhPTNzZXcNiVBpivi+Z2z6cIdZNN/2RcwkoZmSm/t?=
 =?us-ascii?Q?i51z1GSAjMMa+BTaaX7omPLnIhg9DlGIZxW6nX+Abmaombyoif2iogkJY6eq?=
 =?us-ascii?Q?/AHIcXl/KdmUfPEg6zQsbZYsEr64RkuIMt53YMlxs9jimpHKGNjL/g/AS+Yg?=
 =?us-ascii?Q?2Gn7kRf/5IzmfUgoRYT/DKS1tV3klmCMcRgr/pYoqIXsOh31tyAOtP1Xqv3r?=
 =?us-ascii?Q?mr+epFhIQ6dXk4+pdpoe0W46vldOAnQ+yDBYerB6wnOqsc41hsuZLma6kyaJ?=
 =?us-ascii?Q?7lJ2xZNVACJ7hP2snnqhMiN/GZjKzc0OEMR8h2Wt2NA89/X2Z9WIg5eh/IID?=
 =?us-ascii?Q?ePdwrPH0qHWJzlGZ9wNOXoxAzVoWOsCM8rxJu7iCZD6ymWulyzL8XkPCGA86?=
 =?us-ascii?Q?nIo2oWITAytctR3X0vbWj4bSrs1zxFsHPNSIx7ryy5c2uTdTEJxMKIP0alIn?=
 =?us-ascii?Q?DpIiySq/OMMN0+BkuUYk/wDvyLGnWVsejKxEbatnOSh15k899SFyg8iFD2ZZ?=
 =?us-ascii?Q?dmIZRBdJJAindAtJVSz4JIJK28jgM/3h+SP15EaWZrhDW/PR/lp7ebfZh4tW?=
 =?us-ascii?Q?HeZkQGfYCgz7OnNRaItPiYYx2ekTtXvmxOd5hO1+4NxywDiJsH5shhnmj67N?=
 =?us-ascii?Q?5wWZ7i7ofQ931Fr3hdMYEjq3+P353ZjBc05VIv/EpgR8koyPX6qiD9/Qhfqf?=
 =?us-ascii?Q?TpZOY4g7LPcZWNgm0Z7t3rV2JXN5v/RT7e8513jtczBuGPmDC/gfa7jpHsAZ?=
 =?us-ascii?Q?wTTA7FULIQsqsSmWPgMSf+VfHxsgmXwIzsdikbvLx4c9GylR/ekx+O8aaclu?=
 =?us-ascii?Q?CkofAyPgXwzLK4wzcgsl0YipxairRkwhCm8QspiUQVPGQhU2HT1f+aQ7NnER?=
 =?us-ascii?Q?K9dBpBt+R925Q+v1pFW45THslqk3+4s/OK5zISR6et+WF56z43vP4MGmorMz?=
 =?us-ascii?Q?+o9jpdM+78zugLWONzXpgfmMJZ8LfbH+z1dIQGDxUhTMiJYhooBAwJuG7o6S?=
 =?us-ascii?Q?BlbXhCd7KXwbk0yl4akQpOnkKJuCpv3m8ZttNtVwzINDYqzZUf7Lg5Ktxm5O?=
 =?us-ascii?Q?ltnRwQBIcIge02VAYq/R1lK0Kf27P1novGyTsvO2sRfLaRLwyuQKYj000vk4?=
 =?us-ascii?Q?ty0adt3xo9wAiGzV/IVcHKVonQ9KmDaXLWa/saIw0WsJbpiM8BRInzjkHH35?=
 =?us-ascii?Q?qcXmS+heA6P3HU2ViJSL8yYv1hLNsu7fM2mgX7nAjKh5N4Z3iTRYjD6vDvMI?=
 =?us-ascii?Q?DqzwG6m0vTJuLM0bgwcmWwghLBNCYqPKXHLUN4zWXiWeB9mjNqffLiA4fPS4?=
 =?us-ascii?Q?9ueqFvFMVXKD93KtIRogpnVN0oTza3mUc4ZbHTFYpKtforXc7xpaRg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4a71c6-3681-4e54-e084-08da137531e4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 00:18:50.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4892
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in v2:
 - Remove qcom,enabled-strings property as either it or qcom,num-strings
   should be present. qcom,num-strings is specified and sufficient.
   (Marijn Suijten's Suggestion)

Joel Selvaraj (3):
  drm/panel: nt36672a: add backlight support
  dt-bindings: display: novatek,nt36672a: add backlight property
  arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled backlight
    and link to panel

 .../bindings/display/panel/novatek,nt36672a.yaml     |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 12 ++++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c       |  4 ++++
 3 files changed, 18 insertions(+)

-- 
2.35.1

