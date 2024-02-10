Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671888504AA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 15:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BF710E7D1;
	Sat, 10 Feb 2024 14:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=erick.archer@gmx.com header.b="CLYuoMyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498F010EC11;
 Sat, 10 Feb 2024 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1707574768; x=1708179568; i=erick.archer@gmx.com;
 bh=QHEpmhKgjFPc76682sn4sIoMEGMcJgRjxAWR8n1DTeo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CLYuoMyR/RfpN1p89s4CKg+E1TB8++6l2iGF2gXvnfMLbE9b6PMz9cd5qyfXvSoM
 LPQHJpXWyckAizctYuZhkFyakdBMG/I7a9DmSRe0tF/0b7WNguKne88f7j/KCte3F
 K4MRd7LRL4DvnLGDvkTCU7TGBV1Q+yNcdO+R6BUancgCipkanPVP2A19nB/NiIflm
 bUXRyvr+amviLy1ui9nOtpmE/RS6NFzEkO7B5md3jJtsyhIHpgNcDbkixk+pmSOup
 gEzlkhqSoHn17evvCwaEg2zGlwXzpf8C4HelCdGUnEB6oZGlTB7H+fCyp4ONfFxw9
 sxlZMwMM86q9H6GQMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MtfJX-1qiDsO3GNL-00vA8E; Sat, 10 Feb 2024 15:19:27 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: Erick Archer <erick.archer@gmx.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/xe: Prefer struct_size over open coded arithmetic
Date: Sat, 10 Feb 2024 15:19:12 +0100
Message-Id: <20240210141913.6611-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eah5uIlmx1Oy3vyLT4zwqfiQ5COrJpSQE4f6/oguSrE2kY86hdo
 QIjW/Bs/9Xo0Qm3o7B3tEM/5G1hyC3HQsuMpWJx4b/bdceZiEsEWP/KmpQj1NKIEdPx0G5q
 2eeEy4B3+Csbkv9p9lnZCZE+bd2cADA4HhKSh3suTuHxjpueSp6JUsHY9VUhIBjRrnXfh3t
 5GbhzX0HiER7+MDJiic/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IhzvHcuJC+E=;GHJKGjSsCANS54bqCQNxN/44ifo
 9bqCvzBCyyIV5AAQy8U8INvWJk97jyY8ZGzj7mZTzjWOuOt7smSagbXITxKv4geCA3XJVu4vE
 0hYsfu3sWvy3fCNwJ6s6QkBNQb1BTMGw9mwy3poECc1wxqSWYuf3A2VVqwpBlj8slxgsPgQgq
 syX6sEZDY3swhYf/zAN3socKGOStAUxhxAug7nOsrWmzKpJw/DqVVTEYPq3zH0WRlmTtRHLGA
 40Rx8L9wLQSnLQyZHuiMAsCXu4LCM5C+S7xIKwZiYPp/sedY8TnWkTGhhUuamhFaP7mQWSAFx
 gWIZblydoT47nujdxItHU4Pchxv21B3hn7DV9t2jo/MFke0/tfxG/YgnjFzHxlTcWJgMK/eRj
 r39nXPlktMP/WGhU9CFgt4RQIjX7+M9oh25lh8MsQG6yLNm/lD/FNsUY7eZ10c1tQYRK9Av6e
 DTUK7/fyJ1mvHCwAGegKsvH4UjIIAw0cNeuXA5CKV1V24aCR94301qCEqn5Of6CSu+ZlCqx1e
 Hc8YLjCL6tR8k/xpWHgnbxdWAw+PQXqfj1BMY9G5Cec/Y8eNrTC31fwJne/V5i2C4u3+PpI/I
 y50J6IUjptVJVwlPulFqoOITs9Qy31YppK2J1pfXkAoC4rRNXMd0nmBFZmF8wP90h9gWAuh3F
 JIM9kAh9YMRL2r//CFBoB5tqqf7+66erb4WC+idlctJvqdFrqlKSYFdgq30bl5RIpAGiOeKUA
 Ns8GvXUrIin1O4SSgzRz2gaESJgvPZYFO+dlQOC78cvP5N7jlsHPru14iWXSwJsGTxUbh/AYI
 1Th85XbchPMIC00qz2yCW+fCe/5ZJux9ejnMRssskIR/0=
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

This is an effort to get rid of all multiplications from allocation
functions in order to prevent integer overflows [1].

As the "q" variable is a pointer to "struct xe_exec_queue" and this
structure ends in a flexible array:

struct xe_exec_queue {
	[...]
	struct xe_lrc lrc[];
};

the preferred way in the kernel is to use the struct_size() helper to
do the arithmetic instead of the argument "size + size * count" in the
kzalloc() function.

This way, the code is more readable and more safer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-=
coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/160 [2]
Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_ex=
ec_queue.c
index bcfc4127c7c5..f4e53cbccd04 100644
=2D-- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -44,7 +44,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(stru=
ct xe_device *xe,
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_F=
LAG_KERNEL));

-	q =3D kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
+	q =3D kzalloc(struct_size(q, lrc, width), GFP_KERNEL);
 	if (!q)
 		return ERR_PTR(-ENOMEM);

=2D-
2.25.1

