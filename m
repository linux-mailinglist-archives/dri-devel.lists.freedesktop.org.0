Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E75E83AC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00D10E978;
	Fri, 23 Sep 2022 20:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71A910E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d11so1160849pll.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9WHW9dcNJ7USo93XbepCTz52gEB8RJhZFTCAgOxjaWE=;
 b=MCrThrcpHBXTtrPTMUDahiOxJ8D8ml0adnc2b/ZnUpLhKCWbzkicjK7DVQ0Out5WOD
 FREFmdsJO4H0m9nZW5aGp3kZr8NyuDEg+cjmHSd2PFaU5B93FD7J4xKRdTkOt4VgUbKn
 UMInxMGoGT3uNhBnpORcuWbRNV0aijKsC637c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9WHW9dcNJ7USo93XbepCTz52gEB8RJhZFTCAgOxjaWE=;
 b=aCIogsnpZei62NzPDP7NJH1qJOSzvId3p/6NDpB4r4YJxHHSiCHFZ3VnGnkYgNN1hL
 j0YAfOMTMBaNrk/L/gjpjdXfsCPXhm5CamtFooPyFekjksWWy9SWgzdZf4fij+7oJ+L4
 DRSFi3wqzAEz7FRpcZipu4cKWV9lXTyoTO/ijSdcpFd8gvozCPlkJrtAkQ91NCvTCAnY
 oF87aLdcQ5R2cuYF/v2fP4q+NZz+OUx8bde0YIT+wYMonYx3b9UPytN8MNcbQpsiScW1
 4ERNEQa5s4uuYinWb/0ITwzrNJ3fGgB6pVNvo9qJ5GNPZwiLWrBeBHkkjcfCLrSHUhW/
 SDYg==
X-Gm-Message-State: ACrzQf3506N8dZm7WcHLGTzFnUE0+++ATDZbeX5NZ/QN/axhtQ1zvqH7
 jJhdvD6/1NPFaua8fx1N/xkQLA==
X-Google-Smtp-Source: AMsMyM5oK9MYI8mIo+EhF+H1NGRpmeDN3XTs1GMolX8M2ezSAV2Ua89sZ12ya0mBIXqqAy1a/ohl1A==
X-Received: by 2002:a17:902:ce85:b0:178:2402:1f7d with SMTP id
 f5-20020a170902ce8500b0017824021f7dmr10208022plg.81.1663964912148; 
 Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b00174d9bbeda4sm6514749plc.197.2022.09.23.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 08/16] dma-buf: Proactively round up to kmalloc bucket size
Date: Fri, 23 Sep 2022 13:28:14 -0700
Message-Id: <20220923202822.2667581-9-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; h=from:subject;
 bh=1k9cluqwH+m+5FA9iHjyZRl7ltBBZL1qz3WU+O4eJDg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbkkQMIyxW+p5Yq+8oZ2wcfayyBNx+y5dQbw2fi
 AE/i2oWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJs+QD/
 sFhRuVLRx0nMn49LZ3LgzAUGJu/OCv8HKw/plbSsv+vpxeMZ5Y4Z2yz+8pOjvg3cX6lD5EGOFnhfDh
 AkybvgBPzOD3UBEmc2+orSVNWeDOnYXG/2dyEL7KYashVN5HVyJ+SxZeRk177uhTjBzjbNRkAQ/SVs
 Oxp1fa8tJlAzSNr4khPvRqKxudlyHIfws9eHam1m+xu9Yx4IaRjlpv73TPFSCF3B4R61s5d9qdqmI6
 QtxsboSAw9VmMnwtQ92JY/zE3XF4HhRRzOwCGtrvQkJf7xWir9bHo5kODtv29MGnYSHOD7MNuLNHvy
 yT9yMlcMCSUI01Gqw83MyXuzCvvbGT8fRIxDuE0OLV8AuytMSMYtLLvmi8aqicaaH1P85zLrbxJ7VQ
 ibgpFBaDwYITAulUo26Uezs0cpbObE4vDsRPIMUwW8KNHI4PXEY3ej4CfYwEi05WAoQDnHjsKiI3mw
 NgRo1Knltm0LSiFomNDPAPC2bLhoNZ5ap0NV7jcfaCdq1s+e8i6UWoxTNuvUmvNZIO/WymKW5MaK0w
 VFLb8zJYoMtYLSQQRa1twKC/oiHyzfBWzmy0upGh1vD2LcXJMTsecq1f9iPUzq0AYRDLPe3zIIPTo5
 8qm3uJJ1hdyE1VeTF4mKkOhP+oujwwLKoB9fQmxF1d5+YH73zekSnLGtymEw==
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
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma-buf/dma-resv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 205acb2c744d..5b0a4b8830ff 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -98,12 +98,17 @@ static void dma_resv_list_set(struct dma_resv_list *list,
 static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
 {
 	struct dma_resv_list *list;
+	size_t size;
 
-	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
+	/* Round up to the next kmalloc bucket size. */
+	size = kmalloc_size_roundup(struct_size(list, table, max_fences));
+
+	list = kmalloc(size, GFP_KERNEL);
 	if (!list)
 		return NULL;
 
-	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
+	/* Given the resulting bucket size, recalculated max_fences. */
+	list->max_fences = (size - offsetof(typeof(*list), table)) /
 		sizeof(*list->table);
 
 	return list;
-- 
2.34.1

