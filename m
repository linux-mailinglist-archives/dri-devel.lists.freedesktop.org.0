Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C726AE267
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C1E10E4BD;
	Tue,  7 Mar 2023 14:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A6F10E4BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 9773D4261B;
 Tue,  7 Mar 2023 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199320;
 bh=IHBFh1p5NyHgt8gvoelp3FjaqhLt2Kb0Z3qVKYeXOdA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=h2srMFberg2ar42BciBp2T7cZs0r5shq2P0JO3QjUsxOSin6WJjNGQt8O9BFC3Mm9
 RmOByQ5GjAayiskLq3j6O537VbLpqEpJECfmqh7HVRN3loyCsyMrUheWI9qWm9s1Eo
 jT61rZQD7uUbslS2NbKDSA8O2Q7jgY0T7o0VSfs7OEqbf/cEUP9KBk2b2aB0UwOX5r
 TUgy/AjztHbk1UKMJq34coDNE/EPadHFGI118XgAMrbdBK5FIdzyiVtudxfbhPtgUv
 L7b8YoB/MD/NkNCpHht09obReHlsuwunHAv/PZUBC1XXY/6YkLymjrCX8tmvTyqpE6
 wvZlhqdR8YD9g==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:41 +0900
Subject: [PATCH RFC 16/18] rust: bindings: Bind the Asahi DRM UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-16-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199192; l=634;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=IHBFh1p5NyHgt8gvoelp3FjaqhLt2Kb0Z3qVKYeXOdA=;
 b=wkeUw1/4v9Ab0PfwNo+jl9En/WC72prGsQJCMySNRiL0kR7MponwPpCU1MUn2TIUBmAy343h5
 5r7eQI3fZzOChdQd3fPBlNVcvU1ltpg4wdV0XFkDAdRHwRgurJDACCZ
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the Asahi UAPI to bindings_helper.h so Rust code can use it.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/bindings/bindings_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index dc01be08676e..e21c87e6d317 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -35,6 +35,7 @@
 #include <linux/sysctl.h>
 #include <linux/timekeeping.h>
 #include <linux/xarray.h>
+#include <uapi/drm/asahi_drm.h>
 #include <uapi/drm/drm.h>
 
 /* `bindgen` gets confused at certain things. */

-- 
2.35.1

