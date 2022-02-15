Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECB4B6050
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7983210E3BE;
	Tue, 15 Feb 2022 01:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2100.outbound.protection.outlook.com [40.107.255.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FFA10E3C5;
 Tue, 15 Feb 2022 01:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzVJ1wgt2XfqVE9jlYnPwy9sZbneAHUgf+nIh12eurTbrKMdtAoKpl+nUCSrRxw8fhQfh2yhvGMdBl7bIOTdyJTDDV/gb3CihLz2CH1hfuX9xJUsimUJsnYBYpcH28KWLdveM7FILiTgXQ1lsDvILwGIQ7lcE28v/iKR7TLfnrC1sIPm307T8Oe8XFf30ax5wjtrITsO/MwbmvJhjjPghDKivwC+aFJt9ShtM4oI+GL4rmVZW9SHIUdW1bazJEe6dzeAiXtRZ8/b6Sio+mX5BHV8wcHge44zig3qFUokbO9bVb3l+QSegYK9D2Vx0aM2S7lpXvPSLXpo1zHLZbsYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZUJwShf2lcm2N/QCaj1MTobvEH4aRge/LsFZHd/sYI=;
 b=h49A1UpTgxVYzFDaujO3gPt2ofrw9iQAaxBAbkeApu0EZTSmB2NRfVzlAApfnaEgkz14UNHdXQz0dZBYylvxxOR8nLRPal1XGOb9yyx3+OlGx62wb+zoK7V2MDJVkmn3hjy0E6d5c9lRscmam/7yxnjCOw5iViudgu+Pmr1oUCLpEe4f9t2tr/KSMLwQHsKs7qnyWB+388aHVQvxvI7EYkRF0Mt8O4fNrNf1tpttk82hN3rtwMpAGIz5ES4QLSrlqs+FgireZXtEJZHcdNgRDKXkGSPi8dZwGYesf3EnmwMN+NUZBulpSAytpKg4zqy5fUm7QSeXH+bFsGIApFbO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZUJwShf2lcm2N/QCaj1MTobvEH4aRge/LsFZHd/sYI=;
 b=b3ld5n6uZA1gTknnE/iIyJApOQJ2CFr6SlaR67v5FVteLqWokfhLH1PS+J9efXvFBD/6r+VYC9qbVWziOToq5CsSWejnzjwCNk99QtfdidIRTDZmq+IQgWL9ZqgjibFdzGu+bUSAz5NkG52k0kPY5fnf3OrMNcmo0AKvA5CJFzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2767.apcprd06.prod.outlook.com (2603:1096:404:3b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:28 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:28 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V3 3/13] gpu: drm: i915: use time_is_after_jiffies() instead
 of open coding it
Date: Mon, 14 Feb 2022 17:55:40 -0800
Message-Id: <1644890154-64915-4-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 350c5fef-b405-474c-85dd-08d9f0266127
X-MS-TrafficTypeDiagnostic: TY2PR06MB2767:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2767CEA2486227939D0AC07EBD349@TY2PR06MB2767.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePSXhaPcXg4FCtC68F2lY8InSV29A9B0X7537mP4RBGWHZP5mXN708htS4S4u7wWqKMhSwagUCUhji/QcJ2mvFsxZEm/2pLfUvwFb8b3AKZJwlXAh5UPQIPL2fZ75nO1NxEBaQPqlmFXvngc53/CfB5o2pm5rl/xMvTVxPLK+4v8e1IdOnVmEDaD9lxdw43v9MBTu5b4oIS3prUue4WUwqwiNF2zoGo3VejapXFNxDPt1X2HQ/utN7+aRFJVz+nB4rI0dWys6BfO/JaT1uGVYDyhTnWC2tvI36H6NHU2Bjf3f7uFgEdaN8ZWcCqSKu0cAcksL8QDeDVlJU56i6Vz/LLqL6610jEIqsYwVYEXzM1EnKIKAnNx16JNoMsww0xBAhRwG2WO0VgNvPJXJ3CP/J4hndR7/WaSNYQUEdFQeNcDEYei3vFdEDuGW4BexNCsa8KPsUJ7o2ngxEcsVrCGxWgVBCLvsi8y3dVhDHO1ODvi9QJa9mFK5+MHgQHCdDcIL/vbNt9ALSS5CzoEHTArCcTnblAdRCEPkvWRlqj1w+QKxCgvMAEZWBoi8ygkPtETPoFbvNS9JGh/VIJZ2EoZaDSclGDFQS3MHmQp2Eon9Z0xRk34KkBfCwASiyyW68/uxjLyAQf4iZbxEXn+kjM9eOeeHiWTe7BrqPLtmjIxOQwUty26WwAfZPp5oloO94IY5HdO4tUsdbkpSy22+M7sLvlSq0k2Dtr/kq+JTu1sfL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(7406005)(7416002)(4744005)(110136005)(107886003)(921005)(316002)(26005)(186003)(2906002)(52116002)(5660300002)(8936002)(6506007)(2616005)(6512007)(6666004)(4326008)(508600001)(86362001)(83380400001)(36756003)(66476007)(66556008)(66946007)(6486002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BaK9tJZZgUm1KrBqZG1H+LXOYbJWVBMNHl3eqdFRkRBZtvWoWGVDQB0LHTcP?=
 =?us-ascii?Q?/vO4YjfcTYv3yBzT2DhJeOwVLJgtU4HkOV2NEL/GCzB0igWhnmNvADiBz0al?=
 =?us-ascii?Q?kPjYnD+4hZ24hQuDjTdPyTFq3th9Ch1WqMz3FJLrZadNlkX8etXdTDiN6ydK?=
 =?us-ascii?Q?cw81cetwlw9rCF8fTPY9YrJi5LjBCyeimc54nI0jauWuwKTZEo3MTt9AbVPw?=
 =?us-ascii?Q?aoWcy9tsE3NbknUJQlqIIZYSWTuY4Sk+jx8gzxO0oeSBaSfYyxADwBgOrbux?=
 =?us-ascii?Q?dyHB7XAk1zd1zdYkZFsRIA7MNwr75/e3d2iFUeOas4BgWLYmXAweKGVSjN+K?=
 =?us-ascii?Q?A3M41pRDd+77FeILsbxw0302PEYLs5Q2ibxkOHjivAV+ZyHyF09Jo908tKOg?=
 =?us-ascii?Q?w+CDMLH8kUAM1UYezrQ96nOZEzVvAOMcN+KhPKJ29ZVtK8bcPvCf5uFEuksb?=
 =?us-ascii?Q?2UH8jNDqHrLwg9EUh6IqYtY2ZXgFrssd20XQ1yvgRXVTHdDU6T+ngVtSUe6r?=
 =?us-ascii?Q?E54na1IRaVDQNv3xwFWr5ngEifny/G5xmH1oWMMLcdj2lguw3K35VVgVMYVf?=
 =?us-ascii?Q?84rU3ynyEU8ufYKi4OMdO7++HKAFXDa5VInWyMwkTpqchRJ/DeVZqObrZKPa?=
 =?us-ascii?Q?acUGADNZUJirsyY0QKVjUADNRxQgW0/3JhW7xahw0e8A5kLcS7DyZiO2kusn?=
 =?us-ascii?Q?szrkuao7lfYlKIQ+NyD/PdPNxE8p3GKv4in62yLwoHdVo/9rk9McVyQvqNLc?=
 =?us-ascii?Q?ZpsXnHk21VIcMDHHtwmLZP/IYCiI3fDUXbYHblM869HOzRbJamnssPYRms0J?=
 =?us-ascii?Q?jtG2fBogijS6aeRcQWEAIbRN/j0NdqHHBv2tmGZRhHl2kwm3EEXd0S4JO7jO?=
 =?us-ascii?Q?sWMTTzmkCI0toHbmXePzLnW93VmXzoAwa6JnLV8JL/tdlu81OUSnHyEU2asx?=
 =?us-ascii?Q?zbEjoXfFbEVedkE+us9ZHKuw59JkU4SRspI7U7/K3+sg96M7rmWS0Jk0EFuX?=
 =?us-ascii?Q?ldmoeyEJCME2RZvWzSrDmSlcT5wzybdIFV7+PC5H8ALkc6PiXtlFNCPyMt+4?=
 =?us-ascii?Q?ayz8RAE8IbAcQxuSwOU4GNC5cKU8FdE/Xt0vfIOWDenGo2p3m5SQ6RGCvksX?=
 =?us-ascii?Q?E8H/mQs3INUt8ra38KeMjQmJT1wBT0vd6IscFqLk0M9zUpgWUkBwkfgDhARr?=
 =?us-ascii?Q?o2PKQjbUmGfN8hi1xzgVr95IKLvFcJQzx9tpoIuJ7VOIGkd0R6x8g+uVbofu?=
 =?us-ascii?Q?/msxkTcPl+dg4qIvUptQ/R/cvEOm2eoeeKM0MVvxy0rwmyB4gOJRqGMmNTDA?=
 =?us-ascii?Q?NlOMBov3RAgqCov1ij6msEh0GFA/KlkAkOUkQu0nR8EGWmbS2dvT17/Dnc+H?=
 =?us-ascii?Q?s9Kzb9urW+kTfMbNadciL4cLn/blUhsOTjxwYYW/pvZWMZRk8YldPp63Vb2j?=
 =?us-ascii?Q?z4hVNXwRcKoXOfbQoixyk1R72BMo6K3lqYlH3oFlpLeDoz7TnWm5urzYKQYA?=
 =?us-ascii?Q?gIzqw0Nw/aUihezEGE599AA5XOxFV5LRnGf2ak5hTr2CsZj4wW1xkOnEKhGz?=
 =?us-ascii?Q?DouxcTwsbYr1m3U1uhAmFvb4r7MgTuZru+1Z+YtuM5jYn02V53iiNwycDPJp?=
 =?us-ascii?Q?XRgTXEvfBh9L5Zp7AwXEXU4=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350c5fef-b405-474c-85dd-08d9f0266127
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:28.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MesX6WPaJ56e7udwMc5quBO9Bo++SBp9oZSEvycwae7SZxjgXI1hb0rilNxKSpPKAc5JKBC38ib/K74jMaT0Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2767
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index 9db3dcb..b289abb
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -56,7 +56,7 @@ static bool pool_free_older_than(struct intel_gt_buffer_pool *pool, long keep)
 				node = list_entry(pos, typeof(*node), link);
 
 				age = READ_ONCE(node->age);
-				if (!age || jiffies - age < keep)
+				if (!age || time_is_after_jiffies(age + keep))
 					break;
 
 				/* Check we are the first to claim this node */
-- 
2.7.4

