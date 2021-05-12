Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45437C021
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F7F6EC28;
	Wed, 12 May 2021 14:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB666EC1C;
 Wed, 12 May 2021 14:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxzF+XeNdq06tnZ2Kw6krWA1gSxrJv2whU9aZFTp+bSP1P81htYKGZpVdClNBFLctcIarQt6NdujxY/9KVT9segJHv/hqJmmu7RRZ9tSU45Zd4KgOMELNesHCFj9fBi70axl4Y1pMbm1jk8029bJ/6yU7RwtnHGMWoYCTfX6DlcHNdfkO9as64d+JGjXmARc0YIKvcMovw2wK6LFUJ1fYcht3AaDp7EQAxGkOEUBzsTF0ECSfMFXJpCjnK7cmLU6xjxR81iHfm7fbsxfXesprykSEJj+XXSfjF8mXEWD5V5OHpKPMoK3g65Nu68vNHmInw5SfH/KFmN9vlXgDfwf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2srJ+addgQ1ntwlTW/iL8rlklYo9LRnsGnuD5iu8B0=;
 b=i7yEjEm1a03GPLfzkaevAyTwzYg8dbPR6cD70PTA8pF1yDEznC/Pm48HLzGxMSLcn0mxrxKBWgYXAW6HPcaZgF7WUPSepj6lWb+6O/37O9LI/l5gaXgJhuBI0BAnO3XlTBFxwHStzAiGi4QILFK/V6GxdB08lSLxnE5QeDB8E2Cd7d/eiWOpE98AGeyj8YUKQc0MwU8KZc75CSd94GGGyaRcC9lEdXKx9LQoYkRDh0xAYJZD9gzL/ViZOqfhw2RfA/W8M5S1fnaxkrW4ArAwFwkPV9yRhiXdQ5ulrupIhegA29f2z2TZFldsjcggOFT+YCGAuCvokeByld66m2+vsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2srJ+addgQ1ntwlTW/iL8rlklYo9LRnsGnuD5iu8B0=;
 b=pSvLr/I+1ySGS2SduquKV6Yu/H4URcEOGoSvN04c0ZhPyMoyOnqqtw33DMUpKlhXv3L07k0gHXJvcCNQdfbr/WBqgbdLlmK29TkBLg2TRCKbDB6DCzKjrT3f0939wqLbLdA458zKl0WFWW9YzomRs9Gw/1SyQ+njAQ0idrw5oNA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2655.namprd12.prod.outlook.com (2603:10b6:805:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:40 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:40 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 14/16] drm/amd/display: Remove superfluous
 drm_mode_config_cleanup
Date: Wed, 12 May 2021 10:26:46 -0400
Message-Id: <20210512142648.666476-15-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6754147-f416-4ddd-9536-08d91552192f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2655D8397E11B55C682AEE0CEA529@SN6PR12MB2655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:25;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2yi6jAlKUlFql6CfwdEP2W84RtF2Go0lO3q/6qGRxQ4LBjLtI0c1u2ObHCl+3JzaKnfcMib6Nlh3HfL29Q6lyZirIwwVWbr1E+/tRCe8ot7gBAQHZNFQ1bpNp6ddJpMrxdyUxCQSku4e6HaXgWhy0m12hf5YVCatuALMc0uRzpFZTIf9QGTVex6hjcOai2l/FdKPlk9qoNRAsYLlXuEp6HaGI1CEqXfGv7CorQSos0wgMY/Ms3E8pBUjDNtfwR77cCk7/A7vjKklOc+xmdNGDw3fd8u308IBiPtJKe69M7M2/g/r0sGYwunXSAtuA/xvPm1qZdtEvZzYbAoSNcBscu1ZgtTgGBJpJ5PwFeRcWUCZ0VpVDezEl6O2MvCgPdD92CRs7Lrx/u0Fyav5FTaCGdPVvxHVcp19AsuLHOdyD/lscpya8cCzEtQeXilIvJ5G1nNw5Po4aP9TVK01dG6MoPkjUv/JfYST+XEj3Y9mtZ24n2+QDaHd3bZoq2fnCiqpBd2BqkPSpYq3sHKdw3UDkkj+kUPNH7534ZF9lipwQkaJU5tTtx+OO1BG5lffXZbE3Gz3Q1NiAoKPhLV2xP+8k2tAE/KCQ5Ls+AFsaXrqzfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(316002)(186003)(16526019)(66476007)(1076003)(4744005)(6486002)(36756003)(52116002)(2906002)(5660300002)(8676002)(6666004)(6636002)(478600001)(6512007)(38100700002)(54906003)(66556008)(66946007)(4326008)(8936002)(6506007)(44832011)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rZ8XKE3UzDLyBeOlFfHbEYfhvYHYpaH3C7kQZp2wbhrwsnwN34o4SvKFYgkO?=
 =?us-ascii?Q?Oi559GNtuTV+vhJPEcEmFnnJmLhu+xquqTcKyKm9+5DXnogVt0EHXArbcIjh?=
 =?us-ascii?Q?6IOHhi5d+JiwsSUon2dQsTOhfj5oVbBOGHIc3JlrmXsWXqQyBr0HeQsgK74j?=
 =?us-ascii?Q?OXeGgX4K43BKyfaeznisTfTz6GVEP9Gtix/SmBAUP4f68GRIOLPD+2VvY1Fh?=
 =?us-ascii?Q?ms3F08UgWm/m9W6xCxXlTWvfJDVKzgZflEkTbP06jMaoydFhhvG7E/pUF5PK?=
 =?us-ascii?Q?Y35J+tdYzJTMSgDvbwcoVDdCsLtSdZ/hm3P5iOKgnxSWaQBKs7Jym7rLLlYL?=
 =?us-ascii?Q?OP1vBF20zmNHTXezoUru2Iz4dCG4Ro+h2p1u75vmTAQzOsmXTA12i5MXxJ7i?=
 =?us-ascii?Q?j5DKZf8hOofw5ptBAm4IdVLUQ2HLh6A9Mdvqw+LvtO0uUwnXfPQkKgDrTO34?=
 =?us-ascii?Q?ZZ6KnKX9d7G4hiFGnaKTRuSaxNNiKQLtfTCGiBYFm4ReDBMhxP0vm5B+5ER8?=
 =?us-ascii?Q?mTmd1L3GOHsqwoh4BBOE1hU4eavdqa3gMM51foASGF4moJIqL3L4bgQKfE27?=
 =?us-ascii?Q?znuhn3peeN6cRUJcLx/4kAct3DETtbivl46kx8NXYfLImAcXSRiIpT1zhESn?=
 =?us-ascii?Q?KNabdakwh234khoCEKIgcjYAp8Ry5JtIxNywZo6L03xuYIdfnSQ1kbNsark0?=
 =?us-ascii?Q?T1LQV+5QUVfBqjs0cplVTgIiHdOOQ31KDYlGSEpehaCdErlDio/Ba6M2vCnY?=
 =?us-ascii?Q?a9EmSaS+h6Y0VuZkS1K6CJuMjNm4KenP5ZXWKHz0KGEd4YziYA6sdFjwGlOo?=
 =?us-ascii?Q?k7jIzGcJkp5m2vnpx6+TxxFELfS74ers9I2r3T+MQxDDSulzOaxVwCYV4v5Q?=
 =?us-ascii?Q?lZPSQGYKvT46iZLvcNGc5NSFNQu1auBLu79rWygx1UpNWa6o0Auw691bFrFf?=
 =?us-ascii?Q?mKvR0BlSYUU9TBcc6XU3XRGtTMb2WfQjB3RXIZNjYyAfBupIqtYU0QUAOohU?=
 =?us-ascii?Q?IhrAmHErkAg06043vbIUs10I0CIFqlbGrVr/+l+qrXcuTZBrDoaUa+tXcxyN?=
 =?us-ascii?Q?BlTpUzAd1nU+EIzHxcLHLKut5S4flM78NS1iiEx66z/UbVGTDG/WDfUsRU9E?=
 =?us-ascii?Q?anb/FlD9bH3zC7NL25FgxyAYgUedICNeDKHy6OYkuG38WsVBqJ8BcusA8UuD?=
 =?us-ascii?Q?b9P/Bt5YAXIluuTzCmW49eWzAuSGCb+Y3NLFIj+BQCYxEhEl47zDIxbQXTBW?=
 =?us-ascii?Q?CJpKmsVc5GwmGjtHTnEzZ6Px7yjXwqaV/ClsrCIvg6rgiv/OrZEd6DtMN28x?=
 =?us-ascii?Q?VzCR18RcLN0vCOmXW6yMl8K/45Q/9da3wK71YPgKRDny8B+yG51yOOc2GJAJ?=
 =?us-ascii?Q?yAjYKG9qMlo4F9JQDYjIIZjE9FqL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6754147-f416-4ddd-9536-08d91552192f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:40.6434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZrQGXi+q/WwCCl5y6fU7M4fdDPHb/gVUlhT0PjfQDDyWdx20d84WAvvAASa2NgtP9L7qfXZawZERDPpDQ8d4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2655
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's already being released by DRM core through devm

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6c2c6a51ce6c..9728a0158bcb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3757,7 +3757,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm)
 {
-	drm_mode_config_cleanup(dm->ddev);
 	drm_atomic_private_obj_fini(&dm->atomic_obj);
 	return;
 }
-- 
2.25.1

