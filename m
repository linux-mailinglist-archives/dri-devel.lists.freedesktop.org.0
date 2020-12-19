Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A32DF528
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4706E160;
	Sun, 20 Dec 2020 11:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A1A89A1E;
 Sat, 19 Dec 2020 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1608400567;
 bh=GxNJHx4zlacY2ZglW3kgLSpBfcaXQIJ9k86DyICNOf4=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=E8P9NaYXfsw0G9Df3XHwNNTc9zCyq3JLy6jkFymLNsn6iGSzXw8tIJSnpv5+qaUGy
 qLtpbS87THjYrlsw9cqRQTjwX9xrjg1P27CmErCqiXXxi9cx14OVOVkDiFjPGTWj+/
 oVgl3bGP6YZjwrG/QlKNUANLB/8jO2h60MkLqmiI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.88.127]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0yiR-1jwVSM0boV-00v7iH; Sat, 19
 Dec 2020 18:48:37 +0100
Subject: [PATCH 2/2] drm/amd/display: Use common error handling code in
 dc_create()
From: Markus Elfring <Markus.Elfring@web.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
References: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Message-ID: <b86545ee-1008-db3e-271b-23d576902ece@web.de>
Date: Sat, 19 Dec 2020 18:48:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Content-Language: en-GB
X-Provags-ID: V03:K1:9rclrif6IcSAa65raZ/NV9T3dLClOm5i0WIMsTEQ8nJHZPj2vJA
 Fhv8fZ8z3REApGfXOSw4pXpYYvaIOznvHOW+rMx+znc8YSG0Guo/TiCvRzXKx2vUfElub7c
 Tur9kX6/qeVb/+N12pLlEoNJBdngVxh3g2xNC1MKoVCIx+YaCnkkyTEb3iQRBGD5NEei3Kb
 DEHMhIueWuBfdmgi9dW2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zqgGCMhpsaY=:Z3LQCCqq0txtlVaG+307l4
 BfZTUcll3uh28vZnJknhkfTujGGXsbxHJjJ281F9rjgm3D3GvxIaweMg8Wl7uHfuTpt3C9gke
 q7d5VyHpZW2mmRoq7miyLwODl6RFcRej8BIm4/YcewCZOCb/rGNapEmNrrLROCwFDWNqtelll
 EJxx6YPm/I88fVeZcbM8FXMkclm2LDIIwr7Qr8FD5I6hPFDozthlb7CyDB7wmdjsqxHbO5ohF
 6BE3RXtaNhYO+bLd1SmzmDE01F8Ksteh9Rphs30W2ulB8DzT2XVKoAKW+I9Cv8hTcY4AHt8Md
 Sy7lYuC1pr8ZDTv+nwnlDT2UhYJz/wuBAPFDVxbFnZpxUNvpvjGxXyj5Q1Sfse0LFhwXOdxVt
 oNO5reRKdBil25m0a3JcEU9VmzVB5peKsQ9DlaH0GMHOHIiwRd0N80g5UpJS1T7casasFJKqL
 oDbJ8NB5cPZXgY1GPnjcqmb1ZDwwok2jA8D7I6PCsb4kFPQfQ3cZnVRONpuCUFht9neqxoExJ
 vGBHOOqXmH+oNGF1Da9950p5JfETk0o1XinDDstXZyQrjCNISU5k751FPCKV+NhciekS0yzo5
 QnCYRQtybDLJsYljfwFVqOFGv4MW77QPqfHGnUNHDxRu3ukJlTc1q+xtE8Z58atl+AK/LLvqV
 L5MSzpyxYIIolFbputk10hKB+SCoLuesY0jd1OcXO0hR0P5Ks3WfWFVTXcr/r49w2xft6Glk1
 Cge/ombWjiTIAiEZSKwhiGTaLMVj/e6xYgXh55B11zXikCHvwnNcYwc7dOmJNqLnW4Mhv8oGo
 WEuWaYW/7YB5/3aXz42H/obB9qegkYDzHwqvJM5JaehZZ0HvAxP3LWvYzb5lqEVltjCBZtZSd
 +xt+Z/aQUs0baVKuopeA==
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2020 18:18:59 +0100

Adjust a jump target so that a bit of exception handling can be better
reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index e35fbfcb4d0e..64344c054c93 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -968,15 +968,11 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 		return NULL;

 	if (init_params->dce_environment == DCE_ENV_VIRTUAL_HW) {
-		if (false == dc_construct_ctx(dc, init_params)) {
-			dc_destruct(dc);
-			goto construct_fail;
-		}
+		if (!dc_construct_ctx(dc, init_params))
+			goto destruct_dc;
 	} else {
-		if (false == dc_construct(dc, init_params)) {
-			dc_destruct(dc);
-			goto construct_fail;
-		}
+		if (!dc_construct(dc, init_params))
+			goto destruct_dc;

 		full_pipe_count = dc->res_pool->pipe_count;
 		if (dc->res_pool->underlay_pipe_index != NO_UNDERLAY_PIPE)
@@ -1007,7 +1003,8 @@ struct dc *dc_create(const struct dc_init_data *init_params)

 	return dc;

-construct_fail:
+destruct_dc:
+	dc_destruct(dc);
 	kfree(dc);
 	return NULL;
 }
--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
