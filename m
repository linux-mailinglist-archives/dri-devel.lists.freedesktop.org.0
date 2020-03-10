Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE217F1C2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7B66E84C;
	Tue, 10 Mar 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6116E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583826217;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Dn5GFcmLByBrDK1f5aOSRQMAAq+2DgMtrNwOlwS3U+8=;
 b=Ix8bv9vbO/k/wGkyZnq9sROYTopv6nQ2FLN/HtTd5SgpCVurDfUzKawo4ZFDdG86b/
 u1/QBBdIN7GraZ1XoKMGQCE4yYdKkVrCAkgpLkG1aLl2Sa+grHwChkrM2uBrjS5d/ZOr
 8tIn9AxqLIYCu5w/w8zu89O4/th6Fd2UoGEi7r7facKY/RdTVxYCFdg4oXDP59usMz2k
 Cfaz97tUwCBjrJK8rTAD7k6qNCh6AuuxLBiI6z58Zrmjsf1TRaE1eHD+7dxZsHMwF8BU
 OByLk7dQwxU1Bmgcob+HboG0b090WM88EUl+mn09Gkr+RZ8jtiV2jbRVY2weR0FBZdij
 b6sA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4GJ9t5w=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw2A7hJmUL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 10 Mar 2020 08:43:19 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel-simple: Fix dotclock for Ortustech COM37H3M
Date: Tue, 10 Mar 2020 08:43:19 +0100
Message-Id: <e63a0533ad5b5142373437ef758aedbdb716152d.1583826198.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, letux-kernel@openphoenux.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The currently listed dotclock disagrees with the currently
listed vrefresh rate. Change the dotclock to match the vrefresh.

There are two variants of the COM37H3M panel.
The older one's COM37H3M05DTC data sheet specifies:

                         MIN      TYP     MAX
CLK frequency    fCLK     --       22.4    26.3 MHz (in VGA mode)
VSYNC Frequency  fVSYNC   54       60      66   Hz
VSYNC cycle time tv       --      650      --   H
HSYNC frequency  fHSYNC   --       39.3    --   kHz
HSYNC cycle time th       --      570      --   CLK

The newer one's COM37H3M99DTC data sheet says:

                         MIN      TYP     MAX
CLK frequency    fCLK     18       19.8    27   MHz
VSYNC Frequency  fVSYNC   54       60      66   Hz
VSYNC cycle time tv      646      650     700   H
HSYNC frequency  fHSYNC  --        39.0    50.0 kHz
HSYNC cycle time th      504      508     630   CLK

So we choose a parameter set that lies within the specs
of both variants. We start at .vrefresh = 60,
choose .htotal = 570 and .vtotal = 650 and end up
in a clock of 22.230 MHz.

Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e14c14ac62b5..b4cb23d4898d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2390,15 +2390,15 @@ static const struct panel_desc ontat_yx700wv03 = {
 };
 
 static const struct drm_display_mode ortustech_com37h3m_mode  = {
-	.clock = 22153,
+	.clock = 22230,
 	.hdisplay = 480,
-	.hsync_start = 480 + 8,
-	.hsync_end = 480 + 8 + 10,
-	.htotal = 480 + 8 + 10 + 10,
+	.hsync_start = 480 + 40,
+	.hsync_end = 480 + 40 + 10,
+	.htotal = 480 + 40 + 10 + 40,
 	.vdisplay = 640,
 	.vsync_start = 640 + 4,
-	.vsync_end = 640 + 4 + 3,
-	.vtotal = 640 + 4 + 3 + 4,
+	.vsync_end = 640 + 4 + 2,
+	.vtotal = 640 + 4 + 2 + 4,
 	.vrefresh = 60,
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
