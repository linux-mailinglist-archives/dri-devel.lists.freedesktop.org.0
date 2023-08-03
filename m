Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659276F3E7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313B310E108;
	Thu,  3 Aug 2023 20:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0477C10E0E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhHY99pW7VYrZZyW6U4h9OU3b69zJO5HtclnqTfvU9DKbu+gzQlu6Dl/ARNCRbvPzEotHANbdlNBP/JNxPnyuixOwJRrj9e5bB1qQQMgynpaCoFRQIFv+uLh+0ll/0QpLAbCK5F+GzLdXJHSAjRN08ZYha9rbOPetV6oDIY0IaNS3kfolfd8JRmCNK92jknm7LG62u413UJn5VzZEi/IW830V3tt174uFq/R0XePTlVqJBhRbcL3xzB+p7pCkjHzKErAhP2zCIAMQ6gWaUvDULZqCUicQm+/Y/8NKwIxS2QGIDVMSyU9tW4sctcWN5dF3qBpTcSDUU6wY0jmN80FiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvPI1iVYMBth950TZCNYwnLFEwJbwbjyRIULNsaab90=;
 b=YVir59KkfWY63+XyGvJdcd/79LC6Ydkl60Y5XJOPqC8BfmvFTI+hI9uurqDDylA+Dn0umxaSsBiNMmh1DND6xUzyVexhqOwStsER3iGk95JjP8cAxNb0Ko9Y6WkdzkhJJVpF/dib26hYb4FPwG5YOl9KgsLaPNrs9J+Wt6MrSXSiCA6vGJQJNkXc3qGBuFvQpZMqQeHDI8hte4EKnqMXWYvMbyYG4ZzH1ISM9/6u0ndJOU5n2egM5oEgybbUUEGGYFa4b43XcRGTs7bcfwtHuwR6YIgfm+0RUXzjPA+VrrVt3cl4zddABWI9bkYfMc3Z3HP6nh/ABCw/slYc11hyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvPI1iVYMBth950TZCNYwnLFEwJbwbjyRIULNsaab90=;
 b=XcigGzstWzRYhM7ArMZu8Y3DKN216a5DPmctnKLbEvd1m2Sa4td/PzzNtXcVpImuaZ1+GGEEbh0DrK3KIIthNRAMQ2Dqlt8O8paA9Sf3p9OCPj+hb7MEjUoOA6/G8usJ4DfuaH8QNYv/9pbPPRgwzSkXLsDqHmP62ECbT7hYHJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:14:00 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:14:00 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v2 0/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Date: Thu, 03 Aug 2023 22:13:47 +0200
Message-Id: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsKzGQC/3WOwQ6DIBAFf8XsudsAGtGe+h+NB4S1khhsAGkbw
 7+X2nOPM8nLvB0CeUsBLtUOnpINdnUFxKkCPSt3J7SmMAgmaiZ5hxOpuHnCEKXs+oSNYVrolkQ
 jeiirUQXC0Sun57Jz27IU+fA02deRuQ2FZxvi6t9HNfGv/R9IHBnK1rRa9WPNTXd9rsv0e3p2F
 GHIOX8A3PxQTMgAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691093639; l=1301;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=pWS+L59LeT6fJyyBipZIrBzSA/Dcwys16bLwyZu4IFk=;
 b=AlqMDVYr17+Vgj7VhkHdvX8dkPOXPfvPHfRToBjmtmXV1eTYo7/CRo6ROGSsUDPUG+GrbcREF
 iUUShZGW2QEAWx71hZFXhtNJ75JaQt7lAbOYVMxLCybp5/0M2hX01dF
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8fd2fb-ccd4-42af-636c-08db945e2cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psCM1qn3g1sutO+8naop3YyVtLSsIIrlbvSc8QreDEMRgSeF/xGCaTUS08xMVzAXuam6IxnlDuNL5hwLUw9gapOrCWkn0U6aw0QF5fJC7CFYoYfYSYoolfUgJ64nSs/DFRsetuyBSe81CDY1uFuWeOF+Wotwlq9mjVLVYvvflS+fPD5oDy8FwkOPmbAnoA2zHJYWVAyo+Go7QxZp3iNUJF1nALdpAjIFDKFK0d4X5KkPXIgf9Wjh1dqwcxgK2trvPwgCKHAoPK3LVcfyKfHHZQNa+WA624+TDs3vnPSlRvvguyP+LmRjhNqdb4+OIZC7vI9YsKyPGNPde2UsCuTaUHuBklS7JIMbpInV9vd2oC13DdmR8iAkHrAls9jqYUqNpf1GTSroykYqjtjbdaXDYNWHC5pxhUeFw7FNMDQ4uDVKPhbDbCK2oLF1OgycCBt6JCqm7nqVYlB5Y8zJHGLYzfZSJLt5A96VIEPEqGj3shYWdg6fAREzZ/KbSNxC9rrkhyi+Z/9FKupPPUp1dG1NqytgMcEV2OnG39Z4oD9abj8BNLiLOdu3l7UGJamEoBO/E/3JSAgUDHHh2v+tFEDjqXFbzP30hRyxmoCVp+vHAEWZRZxdJDz3d5RDWSvTAB2+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(451199021)(2616005)(6506007)(186003)(8676002)(83380400001)(26005)(66476007)(2906002)(316002)(66556008)(6636002)(4326008)(66946007)(5660300002)(7416002)(44832011)(8936002)(41300700001)(966005)(6666004)(6486002)(6512007)(54906003)(52116002)(110136005)(478600001)(38350700002)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmgrMWZhc3p2N2plaVlLb01lSjREeHE0UHJWSktEZnBQQS81cGlvUnJYa2Nn?=
 =?utf-8?B?U2xXTW5jUjlvNkVmWkJ2MnFwRjZwNEdvZ1JvZ2UzcUFxbjRpM3J5ckJwZmpR?=
 =?utf-8?B?WXNNT2xRQUNNS2pSZXk0bnJ2TWpaOWtiZGFkUEdydy9GY1gvNHgvb21QdGpp?=
 =?utf-8?B?U2JFRFVRUkpXRmZCa2dYcS80cGhNcGtjekdOTVhpWmdXRmZHVVBaVkQyeXlr?=
 =?utf-8?B?VnlXd1laNTdod0tRWEpIcVNYcldIT04yUnZxTDZnakVPdzZPc0RZaEVtYlFj?=
 =?utf-8?B?MkxMNW5XcmRmVUFEMS9QamxQUE1mMldub3lSbVUrQ3dtRHh4a3UvT09DbVdI?=
 =?utf-8?B?OUZhQkV2UVBSazlNTHpwUUg2ck56aVQrRENuQ051ci9LNnBWejBPUWJ2R2pr?=
 =?utf-8?B?Uzl1VHhKTG96N2VKbnpOWFFQUnVTNXF0N0pLSmFFKy9hUTdpWlV5NktVZkZt?=
 =?utf-8?B?ZkYwVkxVUXQwdDhIMWFPeFErU2twdS9FenFNYnlBSW1IeUM0NlRqalhZNk43?=
 =?utf-8?B?TU0vYUwyWk1pakJYQnllS21qU1NxUTI4MW1oMnVFc3ZxKzRWdkl2c3d4Rytl?=
 =?utf-8?B?bzUwaGV0VnpKVExOVFVWZ08zOGVJUDhhZUdVcE81QmdQZERRRDVUUWhpUm9k?=
 =?utf-8?B?cGcyYjJIZGZyRjhqOFhzN1VvVkkvbytvYUQ0T1I5Zzd3ZmFBZ2cwRzB6MjlP?=
 =?utf-8?B?bWRQQml4ZU9GTkt4cUFyUFpiMjBwTlRvb0s2akE2RnArdVhRbFo4RVY2UDFy?=
 =?utf-8?B?VVJYRGwwMEp6RzRVWFV6MXQyR0l3TVlMc28weElwTk5zUFI2N2FoK3lLRGlF?=
 =?utf-8?B?UGp2OFIyWTArUmdIQUpPUTM4UUdvMUVoTnZScG51OXpiVnRZNzBITUVGcmVx?=
 =?utf-8?B?Y3JlNVBqWlVsOHJSd0MwRERnaHVMWTFvTTdUeHRaWjdxRjZnNU12cEFoM1c0?=
 =?utf-8?B?Ynl0WFZ2elRYYXYwODVPL0o2OGREU2tFbDg3NkpsZFNnNmd4enR6alZrRHBJ?=
 =?utf-8?B?SFp5TUhUSDRWVkxrZzBYcnE3ZUZDS3lpNTcwNFJOK0x4bmx2d0NOVmRndU9w?=
 =?utf-8?B?SWsxU3IyWmVueHhsZUJ0WDNaQUhCSUtaOHlxYkdvVkFMTmJxclQ1VTFEZm5n?=
 =?utf-8?B?aVYvUmR0QU5uY1c3bkYrUlkrU1pNMEIrUitTVXJlTjRmaDFUaFYwNVhMcE1N?=
 =?utf-8?B?MGJ2dnlnNEJSbWRoQjZkMzRycHQyZk1NVlN5bllZUTVmVDNCbjRmRERyMmF0?=
 =?utf-8?B?QXg1amdsbnhyZWg3Z3lRVWpKK0xiMU5BWEFTQ1lxN3JQN0VFM3RMTlNSOHdp?=
 =?utf-8?B?T3VkR2tNemhsODlkWUViaWkzdGVjMjM5N2NZU1JPTWFyTEYvbW1NQ0xITGtp?=
 =?utf-8?B?eEJETFVxUVg1VEdvNkZVam1mRENzNllQUkxZNklBL0ltcnFGWGpObU1mN1pM?=
 =?utf-8?B?WnB3dXZkemErOTZIUTNQR1NvYjdPNks2K3NObEgyQnJodEwzR0FqRG14UmtO?=
 =?utf-8?B?YVhXaThmSXI2S1VSZXh1cVVUczVpb1pLZU9KbzhuOUtsU2xTWkRTMnpsVjAw?=
 =?utf-8?B?Wlh0SWJTbTNuUVpZSVZhVko5QUQyYWE3cDNWV0lDd2EweG82bkdrN1o3NDhl?=
 =?utf-8?B?VWZ6NnZ6SE5TaVUxVHdzYUJXenZrTlphSEF1ZmRrTmVxdkovY29Xak1Cb2dK?=
 =?utf-8?B?ZTBDa0lpUDlncy9aYTVRbkI2ZjNpaWdXOUtiRXJkWXl2VUNXdTBJY09jZ0Nw?=
 =?utf-8?B?Vmx3V0QyUHYyRnZXWWIyOVlSYkJSeWRoTjF4VUdISmFKMGpZSWtIVldVVU42?=
 =?utf-8?B?dmZmdXIycEVqeVNydmRvNURxQ25ueE9VYlVnQnFCMzBkZnJ5RlhCeEtmSTRJ?=
 =?utf-8?B?TEduWXpibTFYYjBLTkdPSkFCNVViblozc05BeFVWYnF6b3g4RzBKNHFmWGNy?=
 =?utf-8?B?ZTZPVkU1MUp1YWlXMDY3WDlKS01sMUlRVzdNTjZpdnpkc3h2N09OcTFtZjBL?=
 =?utf-8?B?WWFZY1daZzgyQ0l3TGFwTVo1bXVGejc5aFhkTkIyVWZYSjRMcEZmdkNIdVFN?=
 =?utf-8?B?S0MyTXVFS3RlUmUvYlBFc2NlNC9RWmRSMVlnV0pxZlo5QksrREVacjdIQ2tp?=
 =?utf-8?B?T1JCV1l1RE1PVnR4VklXRkx0aW1qK2U1b1ZhOGl3eFA2T3cxNzZrK25PcW5G?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8fd2fb-ccd4-42af-636c-08db945e2cb4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:14:00.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLuTDEiwZfKyqxV4WbrQ8ItnYFHm03GzbpTvnDd0sV2K21GXpDfYtzQDPR1bKKF9N9rNv/0tP8k3d/JZo/KAoI3iu4gbch0mDbWQCe78Tzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for orientation specification in the device
tree to the Sitronix ST7789V panel driver. 

This is can be seen as reduced version of [0] (some things of [0] have
been implemented in more general fashion in the scope of [1], other
things have been rejected).

Looking forward to your comments!

[0] https://lore.kernel.org/lkml/20230314115644.3775169-1-gerald.loacker@wolfvision.net/
[1] https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/

---
Changes in v2:
- Move indentation fix to separate patch (as suggested by Neil)
- Link to v1: https://lore.kernel.org/r/20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net

---
Michael Riesch (3):
      drm/panel: sitronix-st7789v: fix indentation in drm_panel_funcs
      drm/panel: sitronix-st7789v: add panel orientation support
      dt-bindings: display: add rotation property to sitronix,st7789v

 .../bindings/display/panel/sitronix,st7789v.yaml   |  2 ++
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 28 ++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230718-feature-st7789v-4d0c2c6e2429

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

