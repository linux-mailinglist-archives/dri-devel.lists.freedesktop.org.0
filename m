Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e0COFpiGrWkn4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1279230A7B
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD9910E452;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="G8bJxBMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2026 19:41:39 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561610E05E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 19:41:39 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 909B5240027
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1772825727; bh=+x9zlggoJflBpUoGpzg4FrVsX2wDF7j7U01e+Exq+UQ=;
 h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
 b=G8bJxBMjdkMWtNKJKVTMIWgNupQinhjorFXb6l57k6tyDhv64AhPAN4TCMcVJd3kK
 niFrkjhPZgSlehgm7U+I5AIf+ChRCmyZrdTrclIrSFCon6AC1NB09O8/ErolkhMWQt
 DeoG7pYDddmLHki+HmuWOGFy0X+ULiS7ytTC//qt81ZmhE6RVCc6kjIU3Lq4+pJX/i
 /SnGF29N28wQHu7oZ1J/73WJ4R3seuhJgIFjKV7KxVaa7Qaz78Bf67XiOTj17kYDB/
 HSA1af5gU73zBep4r6mLt0spPnh0r2ieIya1zM1np/hk8PXZPzwmCEO0LD9Dxck53b
 QbxqhnT3EUneA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4fSGpM6hYSz9rxF;
 Fri,  6 Mar 2026 20:35:23 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH v2 0/4] rust: add basic serial device bus abstractions
Date: Fri, 06 Mar 2026 19:35:26 +0000
Message-Id: <20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYsq2kC/1XMywrCMBCF4VcpszaSGXKprvoeUkSa0WbTlCQGp
 eTdjcWNy//A+TZIHD0nOHcbRC4++bC0oEMH03xbHiy8aw0kSSOhFfGZ8rWdHBfBrFWPfJK9nqA
 91sh3/9q1y9h69imH+N7xgt/155D8cwoKKVgpo7Q11hAOa0iZw9ExjLXWD6X1GMSmAAAA
X-Change-ID: 20251217-rust_serdev-ee5481e9085c
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Kari Argillander <kari.argillander@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=xpWbvmX/68bsH1i658qcmKhe/9CQa5oJlgpDVyhNyN4=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpqyxvaOkYQEc9V0YDz9t8adWRGTpFrcIU6vZn6
 VT/4086CUKJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaassbxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9JmGRAAqzrcVe1vztX6oTQKAE8f7fKWohYJrqa
 iwfZGAkUiSWY5N3CT4GziJYcDnPoRUx5PPBrQ4MkwPEqGAU+DIV8jEojke6w/CzdW3OfYqc3wQA
 QXPzQ223YBuQljDGehM+MQBtU2t7KVLhw7PFO/LLC84qaW+d7N43BjYJy+5O4caP898wx9kNfT7
 k3mG2yctS7Lig8xVhi7jCG81sw5d/FvaHw55xFL5bKC0EoKB349Plr7HlnIef8mHfOA12V9i7f1
 iQbm8XuskxGWgEYFur9gn7WgWTbJDuYg1YqiHvDhYz1Js9ZsAP7D+H2gBBzIMTqewTMb42B1FuZ
 0JVcHFoNYqnqlO0zFa5jyQDNDhqHuibTb05yyjUKgy4Fr3D3whGZ0u/YCQ05LLNoEWXSn8SATUy
 2ReH9WPetkPkdfLtLejkGNnOQ5uxLO9giahswZZDiUnxZiaCw4Ce89umO3fh3NgITUQtgnmszB4
 39L1JEPqRLvgT2yn6cusO13LiZzH9yXLzbNlx0yEbIgdppnRjzfNXACrnK/yfty06DpAvwikPOJ
 EHcxRN+zqKLZyRXM63THKFcOuGY7/1BWBhpnGKTz0HukDJ3iv+YktyK8G3n0U6Tr4vrSVLktCuP
 Ak+Vx36bt1FZNP5syJ7lHGVXUx/jaZTvJDxlgAqnyMR7xznbFXBo=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=xsFNBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93qReNLkO
 WguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVAm76Ww+
 /pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt9k5JA
 RhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbmfAja
 oT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwTjRQ
 xBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1J+
 FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN6
 OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJC
 XCeMe4BO4iaxUQARAQABzRdtYXJrdXMucHJvYnN0QHBvc3Rlby5kZcLBkQQTAQgAOxYhBIJ0GMT0
 rFjncjDEczR2H/jnrUPSBQJog714AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEDR2
 H/jnrUPSgdkQAISaTk2D345ehXEkn5z2yUEjaVjHIE7ziqRaOgn/QanCgeTUinIv6L6QXUFvvIfH
 1OLPwQ1hfvEg9NnNLyFezWSy6jvoVBTIPqicD/r3FkithnQ1IDkdSjrarPMxJkvuh3l7XZHo49GV
 HQ8i5zh5w4YISrcEtE99lJisvni2Jqx7we5tey9voQFDyM8jxlSWv3pmoUTCtBkX/eKHJXosgsuS
 B4TGDCVPOjla/emI5c9MhMG7O4WEEmoSdPbmraPw66YZD6uLyhV4DPHbiDWRzXWnClHSyjB9rky9
 lausFxogvu4l9H+KDsXIadNDWdLdu1/enS/wDd9zh5S78rY2jeXaG4mnf4seEKamZ7KQ6FIHrcyP
 ezdDzssPQcTQcGRMQzCn6wP3tlGk7rsfmyHMlFqdRoNNv+ZER/OkmZFPW655zRfbMi0vtrqK2Awm
 9ggobb1oktfd9PPNXMUY+DNVlgR2G7jLnenSoQausLUm0pHoNE8TWFv851Y6SOYnvn488sP1Tki5
 F3rKwclawQFHUXTCQw+QSh9ay8xgnNZfH+u9NY7w3gPoeKBOAFcBc2BtzcgekeWS8qgEmm2/oNFV
 G0ivPQbRx8FjRKbuF7g3YhgNZZ0ac8FneuUtJ2PkSIFTZhaAiC0utvxk0ndmWFiW4acEkMZGrLaM
 L2zWNjrqwsD2zsFNBGiDvXgBEADCXQy1n7wjRxG12DOVADawjghKcG+5LtEf31WftHKLFbp/HArj
 BhkT6mj+CCI1ClqY+FYU5CK/s0ScMfLxRGLZ0Ktzawb78vOgBVFT3yB1yWBTewsAXdqNqRooaUNo
 8cG/NNJLjhccH/7PO/FWX5qftOVUJ/AIsAhKQJ18Tc8Ik73v427EDxuKb9mTAnYQFA3Ev3hAiVbO
 6Rv39amVOfJ8sqwiSUGidj2Fctg2aB5JbeMln0KCUbTD1LhEFepeKypfofAXQbGwaCjAhmkWy/q3
 IT1mUrPxOngbxdRoOx1tGUC0HCMUW1sFaJgQPMmDcR0JGPOpgsKnitsSnN7ShcCr1buel7vLnUMD
 +TAZ5opdoF6HjAvAnBQaijtK6minkrM0seNXnCg0KkV8xhMNa6zCs1rq4GgjNLJue2EmuyHooHA4
 7JMoLVHcxVeuNTp6K2+XRx0Pk4e2Lj8IVy9yEYyrywEOC5XRW37KJjsiOAsumi1rkvM7QREWgUDe
 Xs0+RpxI3QrrANh71fLMRo7LKRF3Gvw13NVCCC9ea20P4PwhgWKStkwO2NO+YJsAoS1QycMi/vKu
 0EHhknYXamaSV50oZzHKmX56vEeJHTcngrM8R1SwJCYopCx9gkz90bTVYlitJa5hloWTYeMD7FNj
 Y6jfVSzgM/K4gMgUNDW/PPGeMwARAQABwsF2BBgBCAAgFiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IF
 AmiDvXgCGwwACgkQNHYf+OetQ9LHDBAAhk+ab8+WrbS/b1/gYW3q1KDiXU719nCtfkUVXKidW5Ec
 Idlr5HGt8ilLoxSWT2Zi368iHCXS0WenGgPwlv8ifvB7TOZiiTDZROZkXjEBmU4nYjJ7GymawpWv
 oQwjMsPuq6ysbzWtOZ7eILx7cI0FjQeJ/Q2baRJub0uAZNwBOxCkAS6lpk5Fntd2u8CWmDQo4SYp
 xeuQ+pwkp0yEP30RhN2BO2DXiBEGSZSYh+ioGbCHQPIV3iVj0h6lcCPOqopZqyeCfigeacBI0nvN
 jHWz/spzF3+4OS+3RJvoHtAQmProxyGib8iVsTxgZO3UUi4TSODeEt0i0kHSPY4sCciOyXfAyYoD
 DFqhRjOEwBBxhr+scU4C1T2AflozvDwq3VSONjrKJUkhd8+WsdXxMdPFgBQuiKKwUy11mz6KQfcR
 wmDehF3UaUoxa+YIhWPbKmycxuX/D8SvnqavzAeAL1OcRbEI/HsoroVlEFbBRNBZLJUlnTPs8ZcU
 4+8rq5YX1GUrJL3jf6SAfSgO7UdkEET3PdcKFYtS+ruV1Cp5V0q4kCfI5jk25iiz8grM2wOzVSsc
 l1mEkhiEPH87HP0whhb544iioSnumd3HJKL7dzhRegsMizatupp8D65A2JziW0WKopa1iw9fti3A
 aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc;
 preference=encrypt
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: D1279230A7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[42];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:kari.argillander@gmail.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:boqun@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:markus.probst@posteo.de,m:kariargillander@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,linaro.org,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[posteo.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This patch series adds the serdev device bus rust abstraction into the
kernel.

This abstraction will be used by a driver,
which targets the MCU devices in Synology devices.

Kari Argillander also messaged me, stating that he wants to write a
watchdog driver with this abstraction (needing initial device data).

@Rob: Are you willing to maintain these rust abstractions yourself,
as you are the expert on this subsystem, otherwise I would take care of
it with a "SERIAL DEVICE BUS [RUST]" section in the MAINTAINERS file. In
the second case, I assume you are going to pick those patches as-is into
your tree, after they have been reviewed?

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Changes in v2:
- fix documentation in `serdev::Driver::write` and
  `serdev::Driver::write_all`
- remove use of `dev_info` in probe from the sample
- remove `properties_parse` from the sample
- add optional `baudrate` property to the sample
- remove 1. patch
- remove `TryFrom<&device::Device<Ctx>> for &serdev::Device<Ctx>`
  implementation
- fix import style
- add patch to return reference in `devres::register` to fix safety
  issue
- add patch to add private data to serdev_device, to fix
  `Device.drvdata()` from failing
- simplify abstraction by removing ability to receive the initial
  transmission. It may be added later in a separate patch series if
  needed.
- Link to v1: https://lore.kernel.org/r/20251220-rust_serdev-v1-0-e44645767621@posteo.de

---
Markus Probst (4):
      rust: devres: return reference in `devres::register`
      serdev: add private data to serdev_device
      rust: add basic serial device bus abstractions
      samples: rust: add Rust serial device bus sample device driver

 include/linux/serdev.h             |  14 +-
 rust/bindings/bindings_helper.h    |   1 +
 rust/helpers/helpers.c             |   1 +
 rust/helpers/serdev.c              |  22 ++
 rust/kernel/cpufreq.rs             |   3 +-
 rust/kernel/devres.rs              |  15 +-
 rust/kernel/drm/driver.rs          |   3 +-
 rust/kernel/lib.rs                 |   2 +
 rust/kernel/serdev.rs              | 533 +++++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig               |  11 +
 samples/rust/Makefile              |   1 +
 samples/rust/rust_driver_serdev.rs |  86 ++++++
 12 files changed, 682 insertions(+), 10 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20251217-rust_serdev-ee5481e9085c

