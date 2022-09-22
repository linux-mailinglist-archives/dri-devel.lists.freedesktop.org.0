Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136995E5932
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D173810EA47;
	Thu, 22 Sep 2022 03:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3078810E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:28 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y136so7964812pfb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KtJQxM97YBw1ybtvuETSvn7dCGYbbNyL/TMT/+SzmmU=;
 b=FXq499jerICaOIudNJl9X9HvncqoZ26Rey2ZEcTHwfOsxqpZ88m1AcMNvabITl7ktf
 otabATcFdrn9uUfQaBz54ORv9CLq2BALyhNuHATyi853KWeUJJODBiaOX2We8TBvbr3R
 089SGfE8g5vUSB25WVvFLrng0+Ij1LNA8tvzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KtJQxM97YBw1ybtvuETSvn7dCGYbbNyL/TMT/+SzmmU=;
 b=hK51U1+KRnbChGk4zQ6CpUls0Mns3oOQz39fsZJEl0njm4j7sJ9IxYB01WqlDpFjlx
 wmthELyLgZskTzyaWt4+Yc/D/3vgbWX1Rix77uJXPeSnxzpWfJokeGUS+OisLVWKr+qr
 uKvrPIXbl+Zsjx4bm0JjosyKKQhck+Iavuuf5S56AgyuoEimOyM6qewc/QP+O1kNRtGE
 eurJorw/dbEJMCVcPXj2enV8h04/X3An0Wl7VXSECzG1hmf52TbRNynPXLjbHijOh4S6
 ix9deTfAdIV95BtkEaNzCcAhdar49JY7Jebc8EWZXoxQ4bby+uQ6xCegFBcOKTe7dx6X
 0UMg==
X-Gm-Message-State: ACrzQf0htXjg6SraP8Tox+hRPhZPF33StlektGqA3Pt3nH1ZRHgXvDlx
 wJykex4cjW8nrR4niRbNzSXRnQ==
X-Google-Smtp-Source: AMsMyM5DFDxK0WCMKFDuZxvtbntvdP6o5W4EoaVjl4WwV6+EDjakr1hsYDIL2vLeT0yZPL8CvbXBgA==
X-Received: by 2002:a05:6a00:174f:b0:537:6845:8b1a with SMTP id
 j15-20020a056a00174f00b0053768458b1amr1476359pfc.68.1663816227626; 
 Wed, 21 Sep 2022 20:10:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a17090a9b8200b002001c9bf22esm2650047pjp.8.2022.09.21.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 07/12] igb: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:08 -0700
Message-Id: <20220922031013.2150682-8-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; h=from:subject;
 bh=GnGo60Q8Ey4t/45rZVkHHXQYJiJECnGYVFTtoXWQ73Y=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ITjdxbzH7GftOj5prz+63FJ1nPbhwlH4IVeCtD
 8ED2tMyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEwAKCRCJcvTf3G3AJjCiD/
 wMJri5QLOOqouOEh6gNHJttRS42p0Og0uXHFXBpfBrQHVdMA/pZ7vM6aplEkCSzfpBRS9ns48N68wS
 jcAXVJGdtoRra0fSdkwT4D/eNkhKa/DLtxD0AIjix8HXBLfF0xblfFujjMTn2AcNU0TIoJNpYb7VgX
 k5ga7gxgqR6sqMlNaFb5qthk1BfSfBFjP5XdVSZtQjZHuc1xAXbYyBzlTYP5PHfAzBhZdVwZxDKAoh
 HLy++A+AphN0n4DVADlQ2Pn0+VZTZBXDRRAYBIKxn4mFfjNlexbTZx9K9vi+BB/QWW7WFQR851SPy2
 H0AIW6jGUmqOlFp42ZjG32ra+NQrzMdB3SHS0UCKvWrHcgGOij3jZloSaDZ9TqEk86JUA2eNTV8EsO
 H2dRnVfemfa8X8YeGg5PS19OLC7pnOJYipxZfBdX5FrqP2SnHC2IqAqpLlOfeapo5yjFQdZZY/QeMW
 aYDixd+87XW69dT3Y8AMCAHA74UZNFOpQ96K/S/nwAMoGRQVUKRicu3fOrBwssRCIoAd24pldFMqg3
 1lPT3qVVTF1IPhnR4vQ3RQJihuPUWjOP3S+3lH2U15ueKvZmGmjl7MCHI2RUE87+c+TqOb87PwG6fW
 eepaAJi+LmbVjbB1PG3ptYHjsDDSkTgUtQRqZ0fL/ZAxrsHf91M5rKLsQBig==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-hardening@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having a mismatch between the requested allocation size and
the actual kmalloc bucket size, which is examined later via ksize(),
round up proactively so the allocation is explicitly made for the full
size, allowing the compiler to correctly reason about the resulting size
of the buffer through the existing __alloc_size() hint.

Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/intel/igb/igb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index 2796e81d2726..4d70ee5b0f79 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -1196,6 +1196,7 @@ static int igb_alloc_q_vector(struct igb_adapter *adapter,
 
 	ring_count = txr_count + rxr_count;
 	size = struct_size(q_vector, ring, ring_count);
+	size = kmalloc_size_roundup(size);
 
 	/* allocate q_vector and rings */
 	q_vector = adapter->q_vector[v_idx];
-- 
2.34.1

