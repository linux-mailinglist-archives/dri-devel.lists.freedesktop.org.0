Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1337FA5C1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5910E097;
	Mon, 27 Nov 2023 16:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F45A10E097
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1701101423; x=1701706223; i=spasswolf@web.de;
 bh=v69e0NN8QuLMJHbHd33vhcu/7dHByHjNt77Tzz0SvME=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=NIaFKxnZMM5x9nYWKQkEVpfNOg9yvmtHluGY4SAxwM7MUZ9cZvbvuhfhr+rZWgxs
 KOl8XxIezubR6V0AkMLTqxIhOUklOQ0prkm/hki43w0TfStzwVnZRJcRZrVKvRzz1
 TDRA7XcA9kJ/4O3/o2tLjPcw0qzjkaqvIpBw9gs07oq0L81C29mpl+k1IwijDTwMx
 pF1xhaG3baoTsrmAMqb1soWEutK4mwQAUTLtUpAsa+pCaT3OxgXHK7HnyozmWWchX
 DT9cidvZh7pnbrsyVPuV7gMOjdI2MwfDuh7URBOqsrsESITHMi6/qMCO/98v435oZ
 rptBv5OLp10hz4oxVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa.home ([84.119.92.193]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MiMEW-1rkXBB0mec-00fP5g; Mon, 27
 Nov 2023 17:10:23 +0100
From: Bert Karwatzki <spasswolf@web.de>
To: ltuikov89@gmail.com
Subject: [PATCH] drm/sched: Partial revert of "Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()"
Date: Mon, 27 Nov 2023 17:09:55 +0100
Message-ID: <20231127160955.87879-1-spasswolf@web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
References: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XBxeukHpt5FvMtRBVVC8cI9/u0dzQoEAtEOU/PlWMXvQd2Xjsc+
 Tim6ORjeV2CTuXe6nNQ+THPkOgQCSgJVTPdCsZoMpJvMBgA5Pr82kR3pD2JAdUa+8wePNsi
 eOU6Us/j78IBRenYrl1PtiyptIYJLzn85WoIt7mpktV3RR17Q8OGGOJT1WT6SwLMDcuUNs1
 3BF/i1neIvEuNwdWFUp0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sAGJA6frhGY=;uXwbfxkvaG52C5hWT58O1HYgEnf
 HIWhtgYxnzvOdNVy1oXhaFMsXAZzhFNQinUEMMMYg0hiJeXN1mXi4nqXHGfdX1Cgs3lwhLon6
 m5v0wVhlNcuYtjNMDwjA9WQO5+fRR5Z3kx/0jLp+ZTL6Y8g4fYN93fRTtN2NPiizzCPdRj2Sb
 mq5E2p70E1sF91b6LpBzfVv21O+jhf2hHONczu1AWxcLAjmBUXCleGo3L3tAeJ0g0EnFBZ8EY
 PYBdHnsVn2bT+jBChCdiKn/bhHWzGavGSAFogxkyB8CBUoXH/L0PdoApzaqnb0Os7IebFfUgs
 bqqrWzj/e3bMLuzoAQsMPK9eQeXtgk9g5pQpMwn5XEHNsQE9I1UrWNCz0ewza1x4Oe16IXeFL
 bzhYOd0aglIL1YXPItLv3AVzUTASQGKDip7WQR6oWy4bPYBJOO3S5sKtjztYvl8tnJQm4zPMe
 QtCtRq8I2MrPY90ZVD9POdtrtbJV8Jgapatzl1ERXOWVFNgCvhI5RH5I8fhzSgGCppYXj2deu
 IwdpKu/99U1aDlxQb/scuZfZIZIox6azoUCBJRWCUyXjdF7U+86z1GwzN2THkFh/19d34a97U
 /mYsTtpnIC42Hq78UCD7le7DrG8BVO55TxzWbEJ8wS6xohiHocm+z3+Ajw8tC/c2dtqSHRBWy
 hXkHONv3LUW652ffbns+FvI63GKrX+feJg/13KqU0rOekNmaP2DrogFNsxRlqG7jEH6iq95hH
 ARipt5Dc1j57yfC32GlWX3PISaGkPaloyqSBx6jVWkGm/kvh10zuKLkIKhD9OZy3RjQb9sqec
 h2M4NU+9lsJri7qQ3H/sRyTd1AN3TXNt/dQ04mp92A6wY1F1cqZ32w0pzjfrSMaXXPttUojOC
 11SFKO2fYVEvmXtMYioTwbOeUNVU97OhRTnVe9ySKX1t8S6l0DdeusLKmrvVnYTqY1c8Y20vo
 hUkdhBhejgvAU5sUAMGJOdFqlB4=
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 dri-devel@lists.freedesktop.org, dakr@redhat.com, spasswolf@web.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f3123c2590005c, in combination with the use of work queues by the G=
PU
scheduler, leads to random lock-ups of the GUI.

This is a partial revert of of commit f3123c2590005c since drm_sched_wakeu=
p() still
needs its entity argument to pass it to drm_sched_can_queue().

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2994
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/43160=
6.html
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched=
_entity_is_ready()")

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sche=
duler/sched_main.c
index 682aebe96db7..550492a7a031 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_entity_is_ready(entity))
-		if (drm_sched_can_queue(sched, entity))
-			drm_sched_run_job_queue(sched);
+	if (drm_sched_can_queue(sched, entity))
+		drm_sched_run_job_queue(sched);
 }

 /**
=2D-
2.43.0

