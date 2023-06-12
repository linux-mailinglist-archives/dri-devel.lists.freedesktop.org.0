Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6AE72B865
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A2A10E008;
	Mon, 12 Jun 2023 07:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2109.outbound.protection.outlook.com [40.107.255.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981F910E164;
 Mon, 12 Jun 2023 07:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLxwGKkrY4F8vDei9sZyUMEQVpTbDjE78R59PWV1ZznTKPYef3VXAA0AkPyyQYiNggO/dHGsNwCM6HdKTS8VNt9zkA7Ec0TQJxQRVlMuXcRf5u/m7ohSP+RtSD0dMP67yeFK9ys+XS4eHLGZ4dDWCD1pu6IkyiUa3XIyF4vH1B+ojqGSuRSQSfWavLXWEXBsygXpTxa0WwqqxjzLSP3LDBE5WLV4/ZEdBgIQmrEZB5+yg53Fw+NTO5uzt5KY7DRIev8FxQTS/T38coTHfxXdGewpHpKUgjELaa5EtbBn/fVlr8RPL6uSlUdh7KHTyJcr9Pr9JfndIyETYgimBNQE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPVJrFtbhZ63iKZ+rMIRF4jllvNfNH2iq/xI5D6TAEA=;
 b=AEPiOFmjXQRYiIBYOz0HuqGSWAMSoEWbSnUChQMOZedVOCh2VXWyJ+5V+fIrLeKfQ9YqI/xDgnxNb5KfSCryLj2u1kqn86tZpTRzgcexxneQ5PuadBATO27dUHEr38+UL2+34qevenviRe/fGe2FjSA0NEhdnB4AR772dtxpRDPB0V1vtL/rRUN85+NyAu3cb627nZm1VTnxK0xmmUioNSNg66u7vPmOndr3DpOklamnaLrq/OTYbzoaGXKnx5xtv6oN26tL9Rdipg877HaprceHoZzxP4Qipnw1q3Rtf23xSG7Oa0ZOObBmCt1hxCeJM6I0iHKsZdye3eEfU+drMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPVJrFtbhZ63iKZ+rMIRF4jllvNfNH2iq/xI5D6TAEA=;
 b=U4K9Z2l6TQ0gG8Dxn4fKEPDdSwyH7Ewi6hqxT1XFYwEvsVz598b74pUbslyr5h9952cCy7tHc0BbD5CPCZcU+gkf7o2+eCFvJZIOCLUd9bNcK7xuR+YFdu9MSMYmk4kh3crdGcFyM4D2mhhqc4RQVb+s6bSFVa5xjsNDQn3jLrWzs6M7JcuF7jXuTRj9/kAxvhc8+bsImO5lvVmTTeUgFE1ZkirHs6LDQi8vCCKq6C5TY70xj6LuOtepLkXDR8M8YfSk0TNkTpAYidflgQJj8pq0d5/lCq+nYCTrZGYnwc7Ut9dP2DviTPdCyCKQzWJQANN69E4erfgqZUJWPwJLIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by KL1PR0601MB4081.apcprd06.prod.outlook.com (2603:1096:820:2e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 07:00:07 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 07:00:07 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD KFD),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: drm/amd: Fix the bug in list_for_each_entry() loops
Date: Mon, 12 Jun 2023 14:59:54 +0800
Message-Id: <20230612065954.24014-1-luhongfei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6697:EE_|KL1PR0601MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6341cf40-4fa9-462d-6912-08db6b12a7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uXFljPKZkJQyRq7zLb3ARZ9+lm67RFXM0wZkffHmtY7jsZZTK6zf7TNsifP+8HDNxQWPRdUxJ5UV2v7wHHewyVNIDruzXC4ZqFAD3e9PKqdYf1qB3O/9CaOme9Fam6aq7aNWaHkRPReDjIsPqnywK2lJc2e0AWuXocDsFGXXuHF097V+Rl6sIZb0ubWfju4TlE2evh9NnTHjLzI8u/ipaO3ysQa3docBYKvUzsdiKMez7jKf0O7gfLIJXfyyCIzm7rU/k6BuGW+gH5SUiCwrSeoMIhi8YwUsi7FWAFGl0WHobv98xY6R4jvLJABCp/awWuEHOK7ZObDWH3W7yigvB/fvmH1KwihNeSrvtsqUiXJXi14bt2Rl98/wLb5pG5/tZ+bb8jlrfl+sCJ7zWMhlaSg4JqCQd4l6sQmwWJbn0ROa5a3XMCiAeWLD87iK4BQU0T+n7Hg6e2YxyWcaellPGmE0/KtCoPmbu18tehcffRC8RgHP5Z/1/hdnfK+qP0py3Gka94A5+CcJTJBJqILjveTs+g3UZimcN9S5Vtf6f+f7WrUAlL3a2vPjx3wWLJRWWJQ74zcU1lSzXZmdtSmQdWEaDWUcS8dLwN6iIMXCasDTBXuDKoESD0Kk94EbGhAL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6697.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(2616005)(83380400001)(921005)(38100700002)(86362001)(38350700002)(36756003)(478600001)(110136005)(4326008)(6486002)(6666004)(8936002)(8676002)(4744005)(2906002)(5660300002)(52116002)(66556008)(66946007)(66476007)(41300700001)(316002)(186003)(107886003)(6506007)(6512007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPgANkFV8H+khGHfBIRG6Z4FTesLLp6VTtRecNVA2zFflEcE99YkavHpVCOd?=
 =?us-ascii?Q?GGo6UAPE1V7b3Rpbb9kv4RleEiiY9ps2VrQTS6cjjoV73mT4rRJl3nUce/TJ?=
 =?us-ascii?Q?wtos1C7ne8qDu/HYk1sszT0v2ElFXpf9hQr0InObe21dFl5f1g3mmF+lyt7Q?=
 =?us-ascii?Q?uvmU0ZJ2+q5rMxc6YsCWhtX4ERLXGX+igpqKespDEzbzAGpOj3hSz/3AxQNu?=
 =?us-ascii?Q?hBkzjv2mCDE6z2m3jbCfoBziPauMkmfg/js/xs/yKdFms1cVSX5LK4bu8FTM?=
 =?us-ascii?Q?eJh0gPag+gjBNE7eQUD3KTvg1e4OVqf9B206tQS6e2uJ/hQT6g8/ayek+LIG?=
 =?us-ascii?Q?w9m2aJvJRVLgdbwsZqa6giniQooooW266yCujNy7w+3qnaKyt3x4UzNEUpIj?=
 =?us-ascii?Q?j1er2pSEfbzbMrh6HnaPTgyV36X703QGi2u/KWgoZLdk1O8QHPGoRkIbbLbi?=
 =?us-ascii?Q?E5f05GVPwMgRYjYvFx2DRmhPEc7B+DY2hanvqkmUuVc4tqgDKTO3hRXiLUjz?=
 =?us-ascii?Q?m3+pGYLZJqiQ+y4BurQQSgHBmW3GkUs0z7qWv2VWYaPV6WKi7tLqmyzYSUgp?=
 =?us-ascii?Q?orcoZYTks4u0fbNMaqb2c5wRh27tzPMW/vVHMEOCZRwDVedaj73kZpdntSqA?=
 =?us-ascii?Q?bWlF/esFpVd8tCG/3L8m6zXvo0A97jrZzNF6lKo5A4sQvSqe9F+mw/bGCJpQ?=
 =?us-ascii?Q?fcQw5upzOJDkEbY+cjLHkZfcExo3EB2qYTKTRTnfF4LMFakca2CUqt88MTMW?=
 =?us-ascii?Q?gVN5PQf0/DODyv9WOCic2wD0O/LUC37Orixy/luxzrm60fsFGKP6w+5izZXO?=
 =?us-ascii?Q?N49nR26afKCqMggwljdzSILSTEO7mhuFZD3jpkFO93RXgEJuGpvxEpUI1yWA?=
 =?us-ascii?Q?wqXqBQ1KlpfpnrRc3JxRzb+MBjcD0J2nkbNY1zg80+lmS6l9otIdioyQba/Y?=
 =?us-ascii?Q?1yHemUGqVeF3S617k1b1Ck08BqzO3cVLy71OzsT5DIU0v/8DPM1ZZ9UuO9y1?=
 =?us-ascii?Q?d/7zIt+lY05CgKpMmOrNaWurbTZWyJjqpDBX9VMnBPtOAeCYX6scJvLNUQrk?=
 =?us-ascii?Q?gI1hasdo0Uov7MIOCaOWH+T2W1xACJxdiY+puXPvpnywchhW8g0jGrjA+7lz?=
 =?us-ascii?Q?4IBCoSOvDJv7mks9BuA/QTPtMt1/ZKr2aYbhkssrPIz14i+3g3qk9h9yl6IW?=
 =?us-ascii?Q?KPAVd8yylcBb5SxdZltFQlTd5pabc7NrGJEoZbUjaI7e5TUoZb2P7q4QLS1X?=
 =?us-ascii?Q?/ke4dr8Z7D2nzyt9ZUM24czVyzPy0hEkufjP/PLunqqjxTqQHETfDqoCMQwT?=
 =?us-ascii?Q?B8uWoRhD1QkLxmKgUcCmkvWHe/5sNBLoqRV9AMDrsJKYKkR13sjoVyvQsBKH?=
 =?us-ascii?Q?VfKJRh9qPedg7g4+YxKjdVifC0RnwvRiGDd4uqfJ+qJ3MDmZS4G0taw0FTfE?=
 =?us-ascii?Q?ScwPRjxkJ2+kay4VxwRIAz3nEJnyu5lOPq32VSAOv9v4uO7qdj7GMH/k5NRG?=
 =?us-ascii?Q?XIwHPcLi7svLIjwxLhT68P8wuLqJeudoo8Km7aaMV38tDPOXtH7HeIQwqDfu?=
 =?us-ascii?Q?bIoneCZfkuKgRTCKp1rlvZdQGkJXmgHAeTlGdEuL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6341cf40-4fa9-462d-6912-08db6b12a7ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:00:07.4261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7co9VpFAzS9U5Of9XH0o1hOJOSOfKFiOFi3pez65ISIAMjw91/CIHFR0zO1aXV54ETrn1pesNF9bpLl0rJilWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4081
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pqn bound in list_for_each_entry loop will not be null, so there is
no need to check whether pqn is NULL or not.
We could remove this check.

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index cd34e7aaead4..10d0cef844f0
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -1097,9 +1097,6 @@ void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 
 	pqm = &target->pqm;
 	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
-		if (!pqn)
-			continue;
-
 		found_mask |= pqn->q->properties.exception_status;
 	}
 
-- 
2.39.0

