Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ADC2483C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 13:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44F89A9B;
	Tue, 18 Aug 2020 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AA389A9B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 11:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 85A4A298D0A
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add configurable handler to execute a compound action
Date: Tue, 18 Aug 2020 13:28:23 +0200
Message-Id: <20200818112825.6445-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-input@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jslaby@suse.com>,
 kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-up of this thread:

https://www.spinics.net/lists/linux-input/msg68446.html

It only touches DRM (dri-devel) in such a way that it changes the help
message of sysrq_drm_fb_helper_restore_op, otherwise it is unrelated to DRM.

Patch 2/2 adds a configurable handler to execute a compound action.

Userland might want to execute e.g. 'w' (show blocked tasks), followed
by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
upon a single magic SysRq. Or one might want to execute the famous "Raising
Elephants Is So Utterly Boring" action. This patch adds a configurable
handler, triggered with 'C', for this exact purpose. The user specifies the
composition of the compound action using syntax similar to getopt, where
each letter corresponds to an individual action and a colon followed by a
number corresponds to a delay of that many milliseconds, e.g.:

ws:1000c

or

r:100eis:1000ub

An example of userspace that wants to perform a compound action is
Chrome OS, where SysRq-X (pressed for the second time within a certain
time period from the first time) causes showing the locked tasks, syncing,
waiting a 1000 ms delay and crashing the system.

Since all the slots in the sysrq_key_table[] are already taken or reserved,
patch 1/2 extends it to cover also capital letter versions.

v2..v3:
- eliminated compile error in !CONFIG_INPUT case (kernel test robot)

v1..v2:
- used toupper() instead of opencoding it (Jiri Slaby)
- updated help message of sysrq_drm_fb_helper_restore_op (Jiri Slaby)
- used unsigned int for specifying delays (Jiri Slaby)
- improved printed messages formatting (Jiri Slaby)

Andrzej Pietrasiewicz (2):
  tty/sysrq: Extend the sysrq_key_table to cover capital letters
  tty/sysrq: Add configurable handler to execute a compound action

 Documentation/admin-guide/sysrq.rst |  11 +++
 drivers/gpu/drm/drm_fb_helper.c     |   2 +-
 drivers/tty/sysrq.c                 | 129 +++++++++++++++++++++++++++-
 include/linux/sysrq.h               |   1 +
 4 files changed, 140 insertions(+), 3 deletions(-)


base-commit: 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
