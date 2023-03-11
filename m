Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0D6B5BF9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 13:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E776510E1B1;
	Sat, 11 Mar 2023 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D9B10E196
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 12:51:56 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PYjVN2MCDzDqPd;
 Sat, 11 Mar 2023 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678539116; bh=bEb5LZGqEggoLJOpDV69ZnUAL53OPfcvEE2guod7O5E=;
 h=From:To:Cc:Subject:Date:From;
 b=KI7cgb5uYU0E2Qt8SMLlq3EjVINV5tQSI/DoHns1EVa+38/+C1USYf5MnpQM+3rt2
 ufYgWX67HCHg7b1cv5zXl+6wglXR+AYviMoxOeTX86gc3NA+JqdSRPQN59vxXqq7KX
 U5vmJ1LI38q/w69DKilRsoaJAm0YCMzzH2lO5MU8=
X-Riseup-User-ID: EFB5BE8CF46FC6BEB438CB15B14A13FDA57363C176715DE27564920FCDC610EA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4PYjVK3t7xz5w5d;
 Sat, 11 Mar 2023 12:51:53 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Date: Sat, 11 Mar 2023 09:51:39 -0300
Message-Id: <20230311125141.564801-1-arthurgrillo@riseup.net>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, tzimmermann@suse.de, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to insert a unit test for the conversion from
XRGB8888 to monochromatic.

Previously this was a single patch, but as the changes grew from v1 to
v2, I thought it would be better to split it in two.

Thanks for reviewing!

Best regards,
~Arthur Grillo

---

v1->v2: https://lore.kernel.org/all/20230302200131.754154-1-arthurgrillo@riseup.net/
- Remove extra helper an use the existing one that Javier patched [1].
- Make the expected results more intuitive by using the BIT macro.
- Change the "destination_pitch" test case colors.

v2->v3: https://lore.kernel.org/all/20230310200901.216971-1-arthurgrillo@riseup.net/
- Use binary constants instead of the BIT macros, to suppress a
  warning pointed out by the kernel bot and still maintain the
  intuitive intention.

---

[1]: https://lore.kernel.org/all/20230307215039.346863-1-javierm@redhat.com/

---

Arthur Grillo (2):
  drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
  drm/format-helper: Make "destination_pitch" test case usable for the
    monochrome case

 .../gpu/drm/tests/drm_format_helper_test.c    | 134 +++++++++++++-----
 1 file changed, 98 insertions(+), 36 deletions(-)

-- 
2.39.2

