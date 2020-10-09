Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB9289A81
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 23:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58B6EE19;
	Fri,  9 Oct 2020 21:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350BA6EE19
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 21:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMZJGvwSwjdpkbW66i9P53tl0m+fk853S0ibn2JsEJLZrTUjmPVOOiRfivKQryAwmhhi2s5zWg+mVUMny42EC1WmgtOYXP6B1BovIewox/uP/SVKLLNATdnDGwNO9RD+zBsPoq0OUZSjtRei23uSYduzb5qUQOE5aZGrgOPYWkUSSXhic3fPL5xRl3F9yMpQ4pYthNDIHDWj5YyP4mmBEzT0hw7P+PX2qk0AKL9NCz4seNPBnPU59y/Xzr5S/inztXc2VMW+JaTApzzYlbZls9NmIPqzGdNuSMO/paWjYQxbRzigrkjDK6tXGzBM7h36d5N6JfwbTb1NjQgNgxN/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivaM9BGSrRgeXksOFcT2SidFFN0HhecYmJEsWnXy5dY=;
 b=odjjcp5WUQGXyW8A39cfzyI/wWy2Gv6urYR6i6CKnHRVn53H6wSQLYVAEPkV+PCphPq3sYhJ+oM9xBni3eajcW4HR0mZAFxxiimW1CEUJJa5ZNYP6/L/4HBrB8hoADYL3WCNlBVA9X1GC1O2fKxdK1zaksUoIIvrFsJqZqIVthw7G0gCTMO4qRcKtM4+PAFduhVrP6VrFuTvRdfv5HRxswF0LJ0EJ3QIIY7J5qvVlMIMfr0BtNLTksuMDF96UT2B/eTZFkDcQoFJKPGAK0gII+s6pCrOuWB179AHXQwMRsGF9eOJ5g6uptdWIn4edvLGiJlFtNqGnpyOEz7fuBaLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivaM9BGSrRgeXksOFcT2SidFFN0HhecYmJEsWnXy5dY=;
 b=Q4g0HEYuSMD7Mh2CzI1CSS/gZTHD1n+j990uF3/PEcaWb0TzKOHZBm8RB32ht+26mJ7Ng3no88mT9Ok5qwJAo8K7/7jDQLgP2jpOkDiARcl7e0auTjgs++oyOcPh0YegAK2TgEisHB3zgSLn0oA4ELDAeB+U8OxFIeRTRnlCDP4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB2889.namprd12.prod.outlook.com (2603:10b6:5:18a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 21:18:22 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%7]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 21:18:22 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix module load hangs when connected to an
 eDP
Date: Fri,  9 Oct 2020 17:17:59 -0400
Message-Id: <20201009211759.2106060-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60:fa59:ed82:d489:7fd1]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:fa59:ed82:d489:7fd1)
 by YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Fri, 9 Oct 2020 21:18:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49a10134-6bfc-4033-c374-08d86c98da41
X-MS-TrafficTypeDiagnostic: DM6PR12MB2889:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2889747293761117B265B30098080@DM6PR12MB2889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Guu0OxUbH5TWDH6pn0gDlRgcq4WD5YQlC0X8jHL4f/CNAKzYAyS93fefqGKoJhi1iM3RNnCv9E1J53mOsqUjeWtBE8TEQ3I8ey1Liqpz9D4phkT1NH9ZgbHmS5BsFQ7u3cq2FChLJftJXo0L78KCqvBOPkoHtum9+YPv5b3w3DtzfHVixyzTvlkKUODAVvHKXhZG2a5n+k4dRmeZ0wDeYjpJQq42WbrQG0puFpR5kFizUIgKg7VzVMAJQO4UY9dUeUd9Vt3jP8voCi52oFEM1QBzkWZAqbqE7EDWrWh14er8A7qc1xnqYCr/FwmIxmAYkv+NaHF0mdChf8oOKRiiNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(4326008)(83380400001)(52116002)(478600001)(316002)(1076003)(36756003)(6486002)(6512007)(54906003)(8676002)(8936002)(66476007)(6916009)(5660300002)(66556008)(66946007)(2906002)(86362001)(6506007)(186003)(16526019)(2616005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9D3WsH4RrBZFwSrGIHVpdzPIUGj7IQNmnhbP+OHqn3U96JW8sgM2dd0t/p98cOGUfXiYTEspq4HUIzjS/lChnMGcrGuq8Le+aXag6qNcz/r26YELg9Rh9r0XdHWOCS6dtwvp9RCHGANpd84ERQF5hsvkUJ3LNdc2qy7WRKY7LPhA3eoSl/KQmmD7IQaxFkxGPl8oFTS7aZsd0om89ML8BrC+4KMSR+hV6qBeLo2GGmpC5XhFi3AALsDhCbuuhmDzg0GVPJt2yhYXl3GUI4ESUCnK03tLGwpi+4+nSgAWTDrgQJaOjd6UPQflOsOhoW9qpDkLvdzhmePB3nYiDX0BZahUOUye9SxWA9PJ/gZbbfs9pSCfBT9dPUjlUr7fIXHDITRfMtCEAQJRNzHcGbQ0wGymTby8Tj2HnsFcE4MrVbx8rIIUpQFEvo0SUQcF5EYB9cn8DX9d7XNFEb2RA9gUP7pq8C+cEJ8zDEQTZbmdif9z0VX5e1bTrpTN4jTDuSlr02hWmH5/D3jY/sPfxYe6AA2tTkFfW9Jo2hCxmRHMB72JKsa88yt7H4vtjTJaD+xlGN18yKqRqa+qNy3WKBKHC9mGdVvY1SxphU10XZeFW+N1T93fJMTrBbuRaPHFChFCuYo8rf27rN+IhMvokAf4ftkAQZtKdyaIL5xu5PF4Tozvk+esjP6D9qDeq84K9oYb5zkpjrbqJZpJE1p3rYW9UA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a10134-6bfc-4033-c374-08d86c98da41
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 21:18:22.7677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8VzucPCdn5Fm6qnDNv4+xqcMGNWV6Ob6xNrg8ZWvCf0YXTS/IoHY0l8SNw60+dFkpHWZcAu8rAYqKZztH6KRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2889
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Roman.Li@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was recently introduced a change that enables driver to disable
streams if pixel clock changes. Consequently, the code path executed in
the disable vbios function expanded to an encoder verification part.
The encoder loop is nested inside the pipe count loop, and both loops
share the 'i' variable in control of their flow. This situation may lead
to an infinite loop because the encoder loop constantly updates the `i`
variable, making the first loop always positive. As a result, we can see
a soft hang during the module load (modprobe amdgpu) and a series of
dmesg log that looks like this:

kernel:[  124.538727] watchdog: BUG: soft lockup - CPU#2 stuck for 22s!
[modprobe:1000]
RSP: 0018:ffffabbf419bf0e8 EFLAGS: 00000282
RAX: ffffffffc0809de0 RBX: ffff93b35ccc0000 RCX: ffff93b366c21800
RDX: 0000000000000000 RSI: 0000000000000141 RDI: ffff93b35ccc0000
RBP: ffffabbf419bf108 R08: ffffabbf419bf164 R09: 0000000000000001
R10: 0000000000000003 R11: 0000000000000003 R12: 0000000008677d40
R13: 0000000000000141 R14: ffff93b35cfc0000 R15: ffff93b35abc0000
FS:  00007f1400717540(0000) GS:ffff93b37f680000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005649b66b0968 CR3: 00000003e0fec000 CR4: 0000000000350ee0

Call Trace:
 amdgpu_device_rreg+0x17/0x20 [amdgpu]
 amdgpu_cgs_read_register+0x14/0x20 [amdgpu]
 dm_read_reg_func+0x3a/0xb0 [amdgpu]
 get_pixel_clk_frequency_100hz+0x30/0x50 [amdgpu]
 dc_commit_state+0x8f1/0xae0 [amdgpu]
 ? drm_calc_timestamping_constants+0x101/0x160 [drm]
 amdgpu_dm_atomic_commit_tail+0x39d/0x21a0 [amdgpu]
 ? dcn21_validate_bandwidth+0xe5/0x290 [amdgpu]
 ? kfree+0xc3/0x390
 ? dcn21_validate_bandwidth+0xe5/0x290 [amdgpu]
...
RSP: 002b:00007fff26009bd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055a8025bea50 RCX: 00007f140085c89d
RDX: 0000000000000000 RSI: 000055a8025b8290 RDI: 000000000000000c
RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000000c R11: 0000000000000246 R12: 000055a8025b8290
R13: 0000000000000000 R14: 000055a8025bead0 R15: 000055a8025bea50

This issue was fixed by introducing a second variable for the internal
loop.

Fixes: 32933ac6ec3a ("drm/amd/display: disable stream if pixel clock changed with link active")
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8d96ef157987..3f7d04b8956a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -848,7 +848,7 @@ static void disable_vbios_mode_if_required(
 		struct dc *dc,
 		struct dc_state *context)
 {
-	unsigned int i;
+	unsigned int i, j;
 
 	/* check if timing_changed, disable stream*/
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
@@ -872,10 +872,10 @@ static void disable_vbios_mode_if_required(
 
 			enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 			if (enc_inst != ENGINE_ID_UNKNOWN) {
-				for (i = 0; i < dc->res_pool->stream_enc_count; i++) {
-					if (dc->res_pool->stream_enc[i]->id == enc_inst) {
-						tg_inst = dc->res_pool->stream_enc[i]->funcs->dig_source_otg(
-							dc->res_pool->stream_enc[i]);
+				for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
+					if (dc->res_pool->stream_enc[j]->id == enc_inst) {
+						tg_inst = dc->res_pool->stream_enc[j]->funcs->dig_source_otg(
+							dc->res_pool->stream_enc[j]);
 						break;
 					}
 				}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
