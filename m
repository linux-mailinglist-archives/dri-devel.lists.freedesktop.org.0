Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8CB11009
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003210E9B1;
	Thu, 24 Jul 2025 16:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="CUCOpCMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Thu, 24 Jul 2025 16:58:50 UTC
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8D210E9A4;
 Thu, 24 Jul 2025 16:58:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1753375955; x=1753980755; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=cUm2b5zlmI1vrx3Kzu7QTDrrIx+kJks4DdJW3FmOvko=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding; 
 b=CUCOpCMlDRC/MJ/Y2+qfLo3et/DpuwjX2cueqT7Fg6UC2j0o49V3I/f3Ab+Viyp7HwgygUgJ9nf/NUYrWjfLDVffe2/hYbHKTi+jcuM9CK3L/KuTG2C1aBUpVf8CRDp5R9VgSnntpFk2d3/2s3DX9Xqb0B8OQSokirPnJJDLbF22qaBNvIYJ8DGKJVnDUKQSTnAUL/IQbkZfVFjy7/du/uB2h4B54/h8vvEYNZTNuBalHw6m9ieY3HAuwGm9fiouVPtuqKqqXBDLUZEWF6DBdCr6NiigGpMOGWnv+wGQ0CeyJeywpVKhEHqVpkTrYNCgJU5qlukkccdoOWdmfvUBYQ==
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202507241852340796; Thu, 24 Jul 2025 18:52:34 +0200
Received: from daenzer by kaveri with local (Exim 4.98.2)
 (envelope-from <michel@daenzer.net>) id 1uezBI-00000004zLw-1vXg;
 Thu, 24 Jul 2025 18:52:32 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Shankar@kaveri.local,
 Uma <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 victoria@system76.com, David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Add atomic commit HW done event & deadline property
Date: Thu, 24 Jul 2025 18:40:27 +0200
Message-ID: <20250724165220.1189129-1-michel@daenzer.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This work came out of a discussion at the Display Next hackfest in Toronto, see
https://hwentland.github.io/work/2025hackfest-notes.html#scheduling-atomic-commits .

In contrast to David's suggestion in the last paragraph there, I went for a
separate property for the deadline, mainly for these reasons:

1. Communicating the deadline via events would require sending one event
   per CRTC, which I'd rather avoid due to the experience with page flip
   events.
2. I'm assuming the property value doesn't need to change between modesets.
   If this turns out to be wrong for some hardware, may need to reconsider.

libdrm MR: https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/426
mutter MR: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540
