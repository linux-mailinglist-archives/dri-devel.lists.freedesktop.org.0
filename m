Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F9355E2D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 23:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617A6E8CA;
	Tue,  6 Apr 2021 21:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0563B6E8C7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 21:47:44 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5DEF43F347;
 Tue,  6 Apr 2021 23:47:38 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH 0/3] drm/msm/mdp5: Emit vsync signal often enough
Date: Tue,  6 Apr 2021 23:47:23 +0200
Message-Id: <20210406214726.131534-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This set of patches corrects and improves VSync-related register setup
on the MDP5 block.  Values written to the registers were way too high
leading to the MDSS block counting way too many ticks on the vclk before
emitting a vsync interrupt, resulting in significant update issues on
command- and video-mode panels.  With lower values - that match those of
downstream kernels - the panels on Sony devices (Xperia X, XA2 Ultra,
and more) update at an acceptable rate without "pp_done" timeouts.

The Driver-IC in these panels is also able to drive an interrupt line
and a future patchset will enable the use of this "disp-te" GPIO beyond
acquiring it in dsi_host.  This fixes panel framerate the correct way
(instead of running at half the desired framerate), but these patches
are still needed to aid development now and shorten lockup times when
the TE interrupt misbehaves by not arriving at all.

AngeloGioacchino Del Regno (1):
  drm/msm/mdp5: Disable pingpong autorefresh at tearcheck init

Marijn Suijten (2):
  drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
  drm/msm/mdp5: Do not multiply vclk line count by 100

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
