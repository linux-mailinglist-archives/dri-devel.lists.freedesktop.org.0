Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD135ECDF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5BB6E440;
	Wed, 14 Apr 2021 06:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24226E440;
 Wed, 14 Apr 2021 06:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZZuov+ZxiCdkn2nJWr6RVD3X3IAcg3U0O8G6syvTQSiTTZmDjnxQekK3yoVPuZKkDWMIJYGBnlNSnEhmEHDlGAbiT11poGofbmSpfamqbnbtE5GjyKnlzsxwU6jV2fh33tVyLxsjqgJFeoUNoaBeJaKg8QolQIF+GLX/8W3LQlGeQiMcXO8ofuXvmOh1gT57kPMVOX3ccTUOnHIAck+uiYcyCngLZL+FoqpqBS0wza/jwHPuTryEDvMYoSMohcLZ046n4mQM3YefneDIvpPEgj+5KNDrK/vQ9+Eyir4z4z4HHz/1hD0g2X/m5szv0NMXUfSjB8YrVCZ4MnO0cX+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NaZ+OBOw4XrGwZl/LgyYrrtkIxaT/C/Y1MQLQpp5H4=;
 b=hxzJ0Lm7IC8ajyIKf1TyjNCm1GjzHQj2CYbmelQmweus29aiqTR+HGFxq3RDM4s7ErXT48G6480gv5Kn8DHlaOChOmSwQgUCKxFucxAb69D4Z6oraFa0My5r1eCIuCJpEsBf0oE4XR2RDyMyg1O4bkLs6CMroe9WSC6UtQ4z6d7jKA/T0LrXR11gj83TNq5w9jMKzLm+MqK1FLc/kJm3wNdxgiJYubO4agWdicrCjlKVCbhi+DCXjxAf/QYSP2RDvqY4AdYsD7zLq3VphUwJzGCgDpjNTO/UduTddwHdnaGh72DkZvXpfFR4cjJ19XI5t7+UW+Ek10XclLicCmTU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NaZ+OBOw4XrGwZl/LgyYrrtkIxaT/C/Y1MQLQpp5H4=;
 b=hJ1r4WRbiEySh7QSjoI9H94fo7FwpWH0UCgi//1imm3jDTdSC0DqTHejB/Io/u94JNPU1RK4bPGfnmRcNIPvZn+4UdHDah24lnqwjSOm88iu4z0pgyzozCa8K1HNXN6XdN47XMJtl5JD3UF00Fqlc6dQda9IJy4Bp4UHElCkqRs=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by SJ0PR03MB5664.namprd03.prod.outlook.com (2603:10b6:a03:28f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:06:57 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 06:06:57 +0000
Date: Wed, 14 Apr 2021 14:06:43 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jon
 Bloomfield <jon.bloomfield@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <20210414140643.620c3adb@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0053.namprd07.prod.outlook.com (2603:10b6:a03:60::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 06:06:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a55b30-f8dd-4079-154d-08d8ff0b8263
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5664:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5664AE8BE44D330C04564C40ED4E9@SJ0PR03MB5664.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8mpp/vIXYrzFtnQLtk7sLjHWdZZ3Lnv29tFf7S/f6/fBDxC9EaQYMddIasDSCHnkOAmhUBOqLDRvyIShhMPmCBjh9f8P4XoCyX+UguSDzZTo+MiHA95mgA5EiZK+Puv1TfnBLE0mj9cRtIl3opdYoB0npaIqkm6kG4Ok4M0ueavxiPKkm+jtl+44CRH92cl1yE8KRYTmMWVnQPmnDJY7cvRWX/YoX20uqUshn2xJUQHZ+DpkbxOwmTj1Y04jwiM7jD+0mqDbKqseBJNnOomwly4IXfrnNFIH5Z9SfTJKwTjOZ4JiR0LCkf6XnML9obMRInnBRo0HLX8PH2GKFXh0fAgoCSWmS1l0pf2HzMkWqSTt2GD9DjeZ/Pf3TH30zXBKHCXhmvPvQJ0Zj8u186JyuI1DOuQqaw71FJbqtQVekSELSumGXZjC92uHk4eFnjrTtRldtBfy2zF+hmVvAdwpxqWDywck5fCcfHDs6m7eU94iywdj8Q0nkitMyOyXzYnm87jtB3i0Z12ko+zMv88pYT+GAstrbRjziOQEc+mTMAtu/xgesP+9NV9lxm5iZNbKgQDCQhMlL6KHfySjMRLxqptydXWMkUQlcYiHSQTQWsRcHrDCJ717Y44I5L9IUQx2cV+esjS1Ka7GHwJozps27Ctf9nhR3N5yNYMz9WMoDXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(66946007)(316002)(7696005)(38100700002)(7416002)(16526019)(66556008)(8676002)(6666004)(2906002)(110136005)(5660300002)(66476007)(83380400001)(6506007)(1076003)(4326008)(52116002)(55016002)(86362001)(956004)(8936002)(26005)(186003)(478600001)(38350700002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uljiTkiWru+6kCn/hFevr4yONZo+OwmSJGGJn1RbyhoclIS5aHnBy8xIENVM?=
 =?us-ascii?Q?ETKl5xQSmQAK0hpU10LesviB34R1n3ZkwT3SrtBvXlCzVOo2oFuTud+IC/OC?=
 =?us-ascii?Q?W2Pu94TfEpY9CKSK6/QbxY8fOde3jrFQ5JkS3VLGvbSb8uuHy0RmwV/YVT/2?=
 =?us-ascii?Q?7DjUFp1Z/ml6r0LPNgIlOBKzKkHD3ZkjRrjDDolVO64L/su4dX2GkXKhYRoq?=
 =?us-ascii?Q?6/f68Z8SFBz5OL5IEU45s+nAxED5OHXka+af7RIoVC67pjsKN2zJ+fQyb7Z5?=
 =?us-ascii?Q?ctGt0Xp+ueaiJjgaMYRonGbtXeAAZqeSnFOSXuNe6UneA57oMEUCrdA0VCu5?=
 =?us-ascii?Q?6yrKBut89i3pjuFge3+HxBeCgEgV5Ln8KIW4jv1//VvpSNZ76naQqt5Rj1FD?=
 =?us-ascii?Q?Hye4UefIX4L2TnsmJcbhHTuK3JelUqSnv3WTG0qNNa1zkb2+suxcJkuzAI3e?=
 =?us-ascii?Q?XxcbKucOpokOcGgDuUp6HbvYk/JfnB6m2kQbOR+Ek/vRMSUg+SsWG3XziNt7?=
 =?us-ascii?Q?qO/FwE2ogWwzTOvUCUOtB5vzeNFAZ45hA9wAp8ekKBQAvFZI+uC4RbvdZlum?=
 =?us-ascii?Q?7NZZ6zqzGBxCbHFXRWIe4p58YwLCOt7n6GVBxJUo5vdVLkPh7VRgLlg9HyRq?=
 =?us-ascii?Q?Z2mV5LIlY3eMCjSCqbTb82BodbLYkUnBjtpQ8l/e0shXZ/5UrB9bgJxiLPoz?=
 =?us-ascii?Q?pCKKbLNLFFoxSrotG0SHYkNXGdMT1Jd7ziUqNgaBl3DTo3qfHOetQF5SDxXg?=
 =?us-ascii?Q?UhHRDtJniunfGvHDMqLtYLjU6mDugxyJ3ZFRzY2a+nXVnGX1Cbpc420xOxSI?=
 =?us-ascii?Q?zrPQPg8yPlFmmc4G8ngzMHQxSs4VSFvWx5molx7swrdCmu0gPifk7uT5GzPT?=
 =?us-ascii?Q?ktGAJChCUubDzv6w8En7MUAeWSjM2lDcdHcOjiww5Py+ibTGASNcst+lWUw4?=
 =?us-ascii?Q?9XAxn1HFzIX62MZ+Fb5q/1wkBb0D7/WVZ0isRkFx8pA6qiLIh9jDOZCv8c+N?=
 =?us-ascii?Q?55z1tMEBFdFSaw6hUbdt6JKBbLnwzf49Cqkr10126asjgrF2Idnq1x8F8f63?=
 =?us-ascii?Q?IKZ3zUxleUhmHcQtb+qJp7DhZTM9rF15gR5X95V3kObQCuVzG5ft5uigWxDp?=
 =?us-ascii?Q?nlk/yp3kNsOTTmDKl/+6D6dJXZHir7yvIVGJ46s8pTw9SlQOzfwqdd2cCOPM?=
 =?us-ascii?Q?mVrJ1mArU/+bT8l9Ygr7ZowqqIYfQRopszkPJ1MDX7tpC9PzBHrwCC7El9gm?=
 =?us-ascii?Q?lnAX/tuLeOLWM05UDTi9KMYv7u9kINaJ3xRFvUkeyOoTKgufiwu1JQhBBAvG?=
 =?us-ascii?Q?+dxmn+IcYfcOFom6C7USJ6Ub?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a55b30-f8dd-4079-154d-08d8ff0b8263
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:06:57.2161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4jUboh/N1Uh7mFLXJJdvabbSK6qqvNESNyjP8smhK1ZjaeCAbzpz3XP5UkHev2+8hJQsJt3SetZv+b0rtS4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I met below error during boot with i915 builtin if pass
"i915.mitigations=off":
[    0.015589] Booting kernel: `off' invalid for parameter `i915.mitigations'

The reason is slab subsystem isn't ready at that time, so kstrdup()
returns NULL. Fix this issue by using stack var instead of kstrdup().

Fixes: 984cadea032b ("drm/i915: Allow the sysadmin to override security mitigations")
Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
Since v1:
 - Ensure "str" is properly terminated. Thanks Ville for pointing this out.

 drivers/gpu/drm/i915/i915_mitigations.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i915/i915_mitigations.c
index 84f12598d145..231aad5ff46c 100644
--- a/drivers/gpu/drm/i915/i915_mitigations.c
+++ b/drivers/gpu/drm/i915/i915_mitigations.c
@@ -29,15 +29,14 @@ bool i915_mitigate_clear_residuals(void)
 static int mitigations_set(const char *val, const struct kernel_param *kp)
 {
 	unsigned long new = ~0UL;
-	char *str, *sep, *tok;
+	char str[64], *sep, *tok;
 	bool first = true;
 	int err = 0;
 
 	BUILD_BUG_ON(ARRAY_SIZE(names) >= BITS_PER_TYPE(mitigations));
 
-	str = kstrdup(val, GFP_KERNEL);
-	if (!str)
-		return -ENOMEM;
+	strncpy(str, val, sizeof(str) - 1);
+	str[sizeof(str) - 1] = '\0';
 
 	for (sep = str; (tok = strsep(&sep, ","));) {
 		bool enable = true;
@@ -86,7 +85,6 @@ static int mitigations_set(const char *val, const struct kernel_param *kp)
 			break;
 		}
 	}
-	kfree(str);
 	if (err)
 		return err;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
