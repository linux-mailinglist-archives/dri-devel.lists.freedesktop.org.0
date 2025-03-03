Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBA7A4C0F6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636910E407;
	Mon,  3 Mar 2025 12:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="qilV5SWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E4C10E407
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741006105; x=1741610905; i=markus.elfring@web.de;
 bh=gqKAvU34fJc3/7+256tAvca+dZqwxT9FoB+Y/pUL0JA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qilV5SWcI/niSBpj5G75O5iTuDg/+Cb6KbdV2T0WQCshsFiqyiqkzRDE9gPKkSW1
 6jOH7qZxOuoAGBBcp6Jn9JfvZ7dQmpYUczsO43MOXRva3c9WYIoKEeF0npdGBTYTA
 9ep884/FmR82+HHgx1MLmVU9zBxzexzIAAUqN/51xCSxybbiAB+dCQMuVFO+BbA7c
 16bdmYjCqnLvIqcyq1x02jzj2WWnEFeprQ5TvFhjo+RHw4Q7keyZgQba/KDvBeFli
 RWRUKN6Xt21EX9vQrMB/AZMKYHpO0OXk5KpnwXeTZFZ5gmbsYjzFiwH35OESxp5qm
 7Mrtbdt2rqr3JhVXiQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Md6tr-1tG1aE02d9-00lOxD; Mon, 03
 Mar 2025 13:48:25 +0100
Message-ID: <6ce29de5-7b94-483e-973e-0c3834609281@web.de>
Date: Mon, 3 Mar 2025 13:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND] drm/mm: Adjust input parameter validation in
 DECLARE_NEXT_HOLE_ADDR()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <a3329002-827e-d53b-8a4e-860342eb18f7@web.de>
Content-Language: en-GB
In-Reply-To: <a3329002-827e-d53b-8a4e-860342eb18f7@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D38SucaZNBKs7tEQhlDqhSG7xYr9j5tje3qi3M1lHirwvz9lNK/
 EEaa206Azua6NNlfPGrZrEiGp4siO0BjKscbAtEyG2Hady6vziJAZ7ob0J9lqT6pMmJe6Te
 KsYjsHlNRoLULY+K3S85k1qsd9tWyzDM1iEsd3FgOeP4UAr7s1RLdhipjJ1IWeQLoL6QE7d
 tUDSD3PRGWFQ08mJXUOeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eVhm+A3HKkY=;fxGNwlYvbjWv7R7tyd29xzeVelY
 t//nfjhtpE/AURKbpEmGeGRBM+ezia+BS/KlGiuhTRgB3f6MqSg7qLTdOWAi7hplisfv0ATkU
 cGEGdvjDzYmpy7ZLrQlNDCIfpZ9eiOP5qT5BHbnG7YVsKA4gOOj3UIF4xNJZRpoB9yvyLP4rj
 15IvO9UjwCqnnCRtBAw8BhuuptiphgX86ByR277M2ZizjFabGCCbY39M7aZO+rQaSlw4MbsER
 27vJ9RcCMFTH8yZuTutuIMJCLxMJWC9uQFKbDhUZbre1QWst100ZcY7B1X7jDxEkUGeOh7Ba7
 EG0NsEDeaH0coNrnYrad54qo8RvJNTX9ET9vNWkE36QQX006W3k89CNYpg479EJO0OFHtmm4P
 o3TWINb1F5DcxAziX/K9OD8QSoZEmuY/brcinjxJ/l7QQwsleAVFDHVvU9eNfCK2zHsuwjY07
 LOHjgEOWrjqsrAldaYI8RrqN+ti9+uTO6+leW8TDlren4KttSAeHxXqJbBAtpuSSJv+TPpMzh
 /JqvcL+YzQUv56pUWSUAgiGBp64Y9oulq/Q0GquNl/1qA5ohyKsnas00M/dGWbWh7mOOvBwUd
 eHofm6uZiJPXZv2kqbf/3edzoP53TGodOjI0LtGU0A+eIhym6ebpRL1/OmyDfGsVXd/DQMl3P
 /Vs6m9afMLCB002iqWTT2EqdenHKb/DzrtZfVhe9WD7Z0Hs4Z1vTKUtTHx1ZKmu/jivOFxmrL
 8UfWA07NDbfdFW8voUiP5J7POoBcmUjpxaO8PabCe51n87JjcDWC3YkGV+VJBwkmZeUi2arGY
 gNsupFFoCLOpP5glv453kPx3i9onBH12QY6yRDPWEW5YHkrm9H+xkSl3eOE3Ic/RTtb1v8Ctp
 dCvndEjhaWA6yBDLFlYh0DjmEbnXn2xHJrSu1GArIeSjXmnw2SypWAvqIgvSL1SWOlSpZ9y6a
 ocHx18s2fIRb3g6vnG7kwlg0kcQFn4M9fzTbAgjdeQ8JagsgdnKgtG0fJBWSeCAplVWES+5JD
 ayNzLvavZHZtC8IusgX9PMYLBXM9yNBJJIxLTP7yBvgnRhxObIqcA3ESE216KwD7ze2ODprGl
 w1b6OaLvG8CfKWHEjNME/4cI7l7YbU90Zl8Op6nspYhnYVKS+/P7AV+y7Tohl0QVsEbzBpBh+
 LxBNK8F5iQ20o0WCNz/OCUwp89oDzsqSlrBLCWxHnY9JH6I6JlYTir+WZHJk2af7Pt154JZUM
 KBunt+7j482Ia26x80efTJpP6Ouzc+O/QlLPE00YVJCrL6LXVXKxdBWD6gxK1qKIXVD7Vwbuv
 N07rRm+vyAKDb2i+6VEfmU9YWYIftbtxw2GqOe92B5QnEMkmX7tVryr+cqP/KYqoNxnGMq42a
 Mnh3oA+mJpSasCf704f9zdBCjkqED+vyrk+h1sOQsqd2veBVbl5QokTh8O1/0p+83Gt0k/I6P
 25+970WbwPWrgsaUW3kOQXhWir4g=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Apr 2023 11:26:34 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the macro =E2=80=9CDECLARE_NEXT_HOLE_ADDR=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cnode=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: 5fad79fd66ff ("drm/mm: cleanup and improve next_hole_*_addr()")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/drm_mm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..95c316aa36e5 100644
=2D-- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -389,9 +389,13 @@ first_hole(struct drm_mm *mm,
 #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
 static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
 {									\
-	struct rb_node *parent, *node =3D &entry->rb_hole_addr;		\
+	struct rb_node *parent, *node;					\
 									\
-	if (!entry || RB_EMPTY_NODE(node))				\
+	if (!entry)							\
+		return NULL;						\
+									\
+	node =3D &entry->rb_hole_addr;					\
+	if (RB_EMPTY_NODE(node))					\
 		return NULL;						\
 									\
 	if (usable_hole_addr(node->first, size)) {			\
=2D-
2.40.0

