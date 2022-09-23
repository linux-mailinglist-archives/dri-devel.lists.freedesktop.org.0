Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD65E83A7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2107F10E975;
	Fri, 23 Sep 2022 20:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4815610E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:32 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id b23so1162336pfp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=X/Yo0q+LJh3/rts6UXiCkFsErG60vpqgZ/L53wodJpE=;
 b=ZUb4dJcl9kyY0JCMIbSxhNelqg+q4A2wjd4CgDikdt5aQnXIoCAm64UQW+1n3wlzIC
 pAnpD7T83tfvNJ+uFbkJeFi1y8cQ0gxyzoEmIemLuV7nFZspJ2KQU5mmAB4gcKBwfFdP
 Er1yFNuC2cHt2der8y8JOYqcnXvTsxoObkuAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=X/Yo0q+LJh3/rts6UXiCkFsErG60vpqgZ/L53wodJpE=;
 b=XD4upJq0UzDeMlV4oC0YG8IMWS/qG7hP+9v4BwKVkqvVZPGeR1Vb7WC+VmumQ4946N
 GKyISxGZpfh10I6aFN0SMa5DjUABQKEUKJtAIpzCUaBc6EOySmgRZcNIepwftsG02feA
 X4zh/ugPuxxMArtVTUm97G+r3XGsxqXIaP9DNK2PgkjdC+s1ZSzzMvJIdPRAs9emkWfI
 yUKN3bSh2SnBLA9mr1sSm2Ljwpw3Bdd0GDI5h78Zq8Ub4M3pYQVyLSdZ7TOgDdTDExU8
 PWGZiXD7j+TNwEF4V4phVLFeKEKTJQ7jbIJ5jlHoFCzllFt2nujjUsuqCs8AdifcINPl
 tbWA==
X-Gm-Message-State: ACrzQf2ZHyRWEhu+D6oO0dG9kfkaiy+QHAtPirqdnES9d5dQmfhE9/HR
 iHXEb+GqYnXdiPuX/ep9ED2hqw==
X-Google-Smtp-Source: AMsMyM56PrOnj3O75SoOzdxaUyKZ0YbIXH0yPGDqg6UOnADEm1wpBRmS/rl1dQfty4+94PufpVyEyg==
X-Received: by 2002:a63:4b1d:0:b0:439:e6a4:e902 with SMTP id
 y29-20020a634b1d000000b00439e6a4e902mr9335669pga.212.1663964911544; 
 Fri, 23 Sep 2022 13:28:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090a0d5600b001ef81574355sm2000341pju.12.2022.09.23.13.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 10/16] openvswitch: Use kmalloc_size_roundup() to match
 ksize() usage
Date: Fri, 23 Sep 2022 13:28:16 -0700
Message-Id: <20220923202822.2667581-11-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; h=from:subject;
 bh=34QBkIPlID/8bnVmUZjxBAD5CQnxKEZULyryTOgjniU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhblCci+wGv8iOvuMA8kL10auMgCdSAnR8YUMoXu
 podrrfKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5QAKCRCJcvTf3G3AJqB8D/
 4wCq8GoLp593BnoMNdwJoYvf4etLZwZGsXZQsb2VBiy0skIZlwiVr3PlOgTBYZgIzLvlvUxdUJ5nlX
 Bi7PnNee9K0Li5LxtO1cZdKiafC2g2Bwno2il0Lo40rZNh8zuXtHkOL9Ch6MatzIqZvHirzYXgdFYa
 kL+5yKCw2OQwWbSzxN2JM/vbJJUQqWo3IuvGbHZNr3neCmsRvYQL9SENnZqNlmEN0oWzba5MOArXOo
 /gL8NjrYcXMqpUjBsVYY3y9nJYmkYPHuf/2GpJoU3H8aNnc9kL8Pnb6DwPQil/tk64OQkt0b7ZcjrC
 G0P1WN75ngaL4hyDGzvdTSyhbfeaPY233mJqTfNH5oCljXV1jN8j7JHWKIlijEpvh+rgmsD8oUU7cT
 LaZlaPifCbnZzop1KYF9cjTfQ6B1FwHfcaDukW/X9RDudAeKfjA6FDVNBvMvz6dQzkfSaJU4YlVLat
 mUOaeTfq4RLXR/1FfCnYLeQzvwlAmM6D2JIyw+FADeIZXNcc0kh8AWEtFVPrlaFoC7ofIyB/PaclI7
 AeUp4jht1HTcepzxMUGZ3tJxRqUFmKdqW/dmu2F5hihUeoxfrDraNFqeBygde5JGfInhtRyFE314eo
 nj0zrS6Q1+iCwTFGvr/2/6qclufX48XSB7HUF/kPBPaTwX4S6IGvnRi92exg==
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Pravin B Shelar <pshelar@ovn.org>, intel-wired-lan@lists.osuosl.org,
 David Rientjes <rientjes@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Round up allocations with kmalloc_size_roundup() so that openvswitch's
use of ksize() is always accurate and no special handling of the memory
is needed by KASAN, UBSAN_BOUNDS, nor FORTIFY_SOURCE.

Cc: Pravin B Shelar <pshelar@ovn.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: dev@openvswitch.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/openvswitch/flow_netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/openvswitch/flow_netlink.c b/net/openvswitch/flow_netlink.c
index 4c09cf8a0ab2..6621873abde2 100644
--- a/net/openvswitch/flow_netlink.c
+++ b/net/openvswitch/flow_netlink.c
@@ -2309,7 +2309,7 @@ static struct sw_flow_actions *nla_alloc_flow_actions(int size)
 
 	WARN_ON_ONCE(size > MAX_ACTIONS_BUFSIZE);
 
-	sfa = kmalloc(sizeof(*sfa) + size, GFP_KERNEL);
+	sfa = kmalloc(kmalloc_size_roundup(sizeof(*sfa) + size), GFP_KERNEL);
 	if (!sfa)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.34.1

