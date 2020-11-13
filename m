Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841032B2211
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA2E6E5A0;
	Fri, 13 Nov 2020 17:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487DD6E59B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 17:21:43 +0000 (UTC)
Date: Fri, 13 Nov 2020 17:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605288100;
 bh=D60csVvyZkJMwUAF2Xl2ltkvMiW0+tALBjS2O0sVEqA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=VI9SmC8dplLBuKXo9E3i50An0di5CDiBPc1IKtZy0A9hW0FXK1v+cVUoHFX6Zce9E
 o41fX9OyCGiM3TtXbUy2udhYrjJ+EKqwRz7PDKnGg4HnXiERoBpceshKftSLhc0TTG
 9pNKlb7PU5NPO9dUXdpqF+hUK5wm7XDsElYjTo6f7N34l7kAqO0fbRN2D1txA1iiuf
 BiWvbiQVhlt89zRcab2+Q/1bNgemzUDwk5uORZt6nIS1FtnPMJuVJYUNtiDbuHLKYb
 vNbIorY+0RZoTG/Ubz0tnckIUM3Y51ke1IHEdSUriQjG5WXvTc14gr5jKWS1wx8V3T
 ktao3+b8GeyIA==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/fourcc: add table describing AMD modifiers bit layout
Message-ID: <0gLrKmUEE4VjN5rdf6dUiejliU1GhjCBvH7RFMQYY@cp7-web-044.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The table describes how each bit in the u64 value is used. Explicitly
state which values a field can take if we have defines for them. Also
add a note when a field isn't always populated.

Forcing people to update the table when changing the bit layout should
make it more obvious when there's a mistake, I hope.

If we get to the point where the bit layout gets more complicated, it
might be worth it to split the table into multiple tables (e.g. one for
GFX8, one for GFX9+, and so on).

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---

This already contains the fix in [1].

[1]: https://lists.freedesktop.org/archives/amd-gfx/2020-November/056073.html

 include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index ca48ed0e6bc1..253386b7bc6a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1114,6 +1114,25 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  *
  * For multi-plane formats the above surfaces get merged into one plane for
  * each format plane, based on the required alignment only.
+ *
+ * Bits  Parameter                Notes
+ * ----- ------------------------ ---------------------------------------------
+ *
+ *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
+ *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
+ *    13 DCC
+ *    14 DCC_RETILE
+ *    15 DCC_PIPE_ALIGN
+ *    16 DCC_INDEPENDENT_64B
+ *    17 DCC_INDEPENDENT_128B
+ * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
+ *    20 DCC_CONSTANT_ENCODE
+ * 23:21 PIPE_XOR_BITS            Only for some chips
+ * 26:24 BANK_XOR_BITS            Only for some chips
+ * 29:27 PACKERS                  Only for some chips
+ * 32:30 RB                       Only for some chips
+ * 35:33 PIPE                     Only for some chips
+ * 55:36 -                        Reserved for future use, must be zero
  */
 #define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
 
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
