Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1E118D2F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 17:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A226E136;
	Tue, 10 Dec 2019 16:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D4B6E136
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 16:03:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04D42B156;
 Tue, 10 Dec 2019 15:45:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH for-5.6 0/2] drm/bridge: dw-hdmi: PCM API updates
Date: Tue, 10 Dec 2019 16:45:34 +0100
Message-Id: <20191210154536.29819-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is a patch set for updating ALSA PCM API usages in dw-hdmi
driver.  I already tried to "fix" the driver some time ago but it was
utterly wrong.  So this is a combination of the revised patch and
another cleanup patch.

The first one is to change the buffer allocation mechanism in the
driver to the manual allocation of the h/w buffer and the automatic
allocation of PCM stream buffers via the new standard API.  The
significant change is that size of the h/w buffer isn't no longer
controlled via ALSA preallocation proc file but rather via the new
module option (if any).

The second one is a oneliner patch just to remove the superfluous PCM
ops.

Both need the ALSA PCM core changes in 5.5-rc1, so please apply them
on top of 5.5-rc1 or later.  Or, just let me know if I should apply
them through sound git tree.


thanks,

Takashi

===

Takashi Iwai (2):
  drm/bridge: dw-hdmi: Follow the standard ALSA memalloc way
  drm/bridge: dw-hdmi: Drop superfluous ioctl PCM ops

 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    | 49 ++++++++++++----------
 1 file changed, 26 insertions(+), 23 deletions(-)

-- 
2.16.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
