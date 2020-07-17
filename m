Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EA2235B4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4196ED10;
	Fri, 17 Jul 2020 07:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700064.outbound.protection.outlook.com [40.107.70.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE236ECE0;
 Fri, 17 Jul 2020 06:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ycrziu/tu6zm4491+SHMSxVgtIvvpvLFn/66nU3Dz0DmdznxtJpw+3uteg/dlAuZtRDu+xtD108HHXy0SAW1blYpw4EyrytuyPjKgmR4PujqpbhWYwLorRgTUxaPE59gaKxl0AM5nyKI03FgnT/VEpYzCFNSWwL1Cyl9oMaDdybS/2s5L/9/EfXi38lhdZJ141AWDEzEzaPuqQ0PuYxoYs8XY6YVtk3YqjdYGKRLNYvZj1Ctduj6KDV/h7QCsX91ljCNJ8Mx/SxXFIhUlU8OsyhepIAb6blpXEslPsAH40e7Vftt9QwAKVMcdppPG/2iwj82CQYMbwifuF3ezdflMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj+GMt0lTj5sBZBbcb7yrCc2xF77yuP+AooJWV+0LaQ=;
 b=FA70UdR2vOtvLlPAYfSgEXQAh0mPeDaEYrLMthEfx/ZYxjpRFpmyvIAx5kWMixpFhVHvlM+JZ1+aDp5lo7KivelrskmhQqSgR1hJjipTMKFhrUZ91tsanMIxp40BFB/S6K2rUHArQ8BKd2XPgWCpPj+L470Hi6VuPCnyTaGzvAhy4tTcGE27PNasvv0WCM2/TkFCOREjQP8MCOpOpL3erxoyVK5mln3rtiLdUtlQJtChl8SH1+gNctQ/XQVhGemwNbe/6S5fjHzFbkKRtRed83fwsmlJQIgEoBIPI8BJVG59R1clhUjD7JVkk0zhNzxCL615NfoV8WF3TQ5TCa4R8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj+GMt0lTj5sBZBbcb7yrCc2xF77yuP+AooJWV+0LaQ=;
 b=hC9dG0Z3LLMRsG8VrCvtMtnyc+6nbp4CB8MROMcJSCp2hr0jGBQOi6o1v6yu+4X58cHN2NX+0bDFcTytZfcwGEONMVcMmKXNA86/ojybZQOWQZ9h6TjkUZ6lNmh9peTgfnFzFIw8ZnDsfPCJfHUO3eEWNZSvosBEJL3jXVmRI0I=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BYAPR03MB3573.namprd03.prod.outlook.com (2603:10b6:a02:ae::15)
 by BYAPR03MB3576.namprd03.prod.outlook.com (2603:10b6:a02:b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 06:11:54 +0000
Received: from BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c]) by BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c%4]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 06:11:54 +0000
Date: Fri, 17 Jul 2020 14:11:38 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Don't force IOSF_MBI
Message-ID: <20200717141138.4a4289ac@xhacker.debian>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TYCPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:405::19)
 To BYAPR03MB3573.namprd03.prod.outlook.com
 (2603:10b6:a02:ae::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TYCPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:405::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Fri, 17 Jul 2020 06:11:51 +0000
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45efa254-dc19-4e49-3b7f-08d82a184d50
X-MS-TrafficTypeDiagnostic: BYAPR03MB3576:
X-Microsoft-Antispam-PRVS: <BYAPR03MB357673F838F711E52C034653ED7C0@BYAPR03MB3576.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6C0spUt0lBSj1j8KvWH4Eu0sd5LEyXfQ6vWQEt3+7FaWAHzhOqeCvxXnpiBh1wVZa7o0RdVKI5/cck2SDBkDhiDrlsD7BQDBJN0/Z++TUwmdqVRhBMbfTiWssV+QB+HEOSbKGep9RxnP1YZiCjE31yngOT996ZQd8ZiZjXgZm0izYHJaZe8QnCtuQuCYb7mqpognhHdtzddAwiFQGHgm+Alklf3H61AbaGykhcqgHNF33w7Hksn8WwInGcPG/GU0200sLInG+vkTnTj+8t8ZXcoB5jFVRMeETFyEVPY70i/AZSJULvbJey2Anq2tx/Lr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3573.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(5660300002)(26005)(8936002)(8676002)(186003)(16526019)(4744005)(2906002)(66946007)(66556008)(66476007)(4326008)(83380400001)(52116002)(498600001)(6506007)(86362001)(9686003)(7696005)(956004)(110136005)(55016002)(1076003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4eOlGmbsE2F+YazQX9X6IvWxR2lwYK3IQc21fWcBOdiQdjwx7BT61XO8yMYbuT+fl6513V6hnTfb1/UD73MjTmp8h7NbUNbNVxwU3h2qm0S8lb1jkG0Ec78dd70RqAV8gz6WGqqye8GaXjildYss7uZTwp/J9m03UZjuIjoUr2tOj7pSyzzQWVHykwJPPULENjDVR/pa9BnrEQzOjR5bATkHyeOYEehMysOR61tDpr9s1cisFhCHsFRIDFpkV2+M4V6ERDhu68AqIX5Szz+PqI0vz0rNzJSMgMizjkQdS2IHfYgKwIlMV/bQ2K7DJdvYDT5MxWkFcDGgHJ7DfbJqtScrY019F/Fg3CiPsiGflr69jeA/fMNtiU0qVgZp4oNQ2sbBLgUcpPxZNqyQ9s6WJ+7tRgNu9Su2FcwcM3sZMH+6S6prr9FGxmkjWvKHK0JIAflC17h6YeqIeceprbDA3BPo85lgydWgWeeOBfE4Pysr8l/bLjShJPWZ82PfU0lE
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45efa254-dc19-4e49-3b7f-08d82a184d50
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3573.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 06:11:54.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY0vHVPZdUFRTf7KEBxtYs0y1C2DtfgZZmH9RaMkipU8LJWP7rLWQXDeAJ2AzxiSJceE6UMAXEY+Wk3yYpgrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3576
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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

The i915 doesn't depend on IOSF_MBI, asm/iosf_mbi.h already defines
isof_mbi_* APIs when ISOF_MBI is disabled.

Don't force IOSF_MBI to allow disabling IOSF_MBI for non SoC platforms.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 9afa5c4a6bf0..b76874989292 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -21,7 +21,6 @@ config DRM_I915
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
-	select IOSF_MBI
 	select CRC32
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
-- 
2.28.0.rc0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
