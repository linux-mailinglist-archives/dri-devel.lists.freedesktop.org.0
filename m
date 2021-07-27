Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E313D7FB8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC28E6E5D3;
	Tue, 27 Jul 2021 20:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3686E111
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:03 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so4088271pjn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nuFdIglNEHNCZJ4OURvNLaS8oKexf2Xbsw8tAobRMI=;
 b=fXdIa5xzPdxqW9JkE+8PrL7R3HOjzt/uPGhXwllYH14fLZCAy6MK5N+Aom2hlW1RLu
 LzaLP/I2bdBUasKo/LWt7kuMLca0bx1GK2a8LA0g1v3rpw0p8gJnsxnOKfkunXhaof5t
 +9cGUtaq4+nJifYIALqVfSUNMPZBcUPcyBLJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nuFdIglNEHNCZJ4OURvNLaS8oKexf2Xbsw8tAobRMI=;
 b=b3k512V7UdjbYW/tNBvDiOrhtElIoKajkqoWBstt4fN8wlddkMSXcZC60Z40oKrXCX
 ci9ElHJt2/AKzCCoQAl0cVGSlKHhhvme9YOmXh94HhAmOywWCfUniINZJkFn87sz8+C1
 He/QozU956LhJUxZ7eCTViCjc8iJyc13sTNpsv8u/3C7DtTU8SlQo2HKfZqkBXr7VqT2
 89tXu1JzLM7AXig5ozn41/sbKFfXRlz/FacYxrc/2wqfn4hkVwDvm17uyYAqw4y1PhnB
 pKhkRDQmb07rUowscJOHQRowCwLNaQejyc+YIXqnvfNKFVfa75oRJX8DVgeFAIVdjIib
 ksrA==
X-Gm-Message-State: AOAM533zc0mbSPlaOZpNk7S/DSEgbzcy/ssJ2YUhaJBOPNHcc6zQVTyW
 DbR7cTgI5UE82J47gST4FJfULA==
X-Google-Smtp-Source: ABdhPJxucZUfEOCwFmOc5wsWAybtREO6GX9yQ3Vd7QeNwkxYfGm08yYOn/RWC1L2rMGwaMab2R+i4g==
X-Received: by 2002:a17:90a:af8c:: with SMTP id
 w12mr12989398pjq.109.1627419543028; 
 Tue, 27 Jul 2021 13:59:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i1sm3849350pjs.31.2021.07.27.13.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 01/64] media: omap3isp: Extract struct group for memcpy()
 region
Date: Tue, 27 Jul 2021 13:57:52 -0700
Message-Id: <20210727205855.411487-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4703; h=from:subject;
 bh=LCf4h7e2PK4sOgvQBd73gWCkmhRKJC4tH4kH78fVevA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOAJSAPyozNrKWpqJWAzYod2fmvBM+4l2MwYKWh
 O4ocQxiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgAAKCRCJcvTf3G3AJoP0D/
 9KTuhNSJSjVRPOJFWeuepSlknmUmM/K2t4MDDXqOX/kDkR2wcXh6ttU5lVNW0YgBjHXAF5eWLYpPt5
 XHm/KeoOX2MLhuXazp4Ti4YBKlziUsZTs5O6dl8oGQF8vvSOgQVD4x549qIJAaUMy/Q9HqWzVqq85p
 yP3Plkr/yT7Fr9RDFQxzPqOdsDFBoD1ZLcppau6vdTB0PZWIhyCpFYq2uKiDluWvj75Xhxrp9micdg
 U2R1bGYEEaNcOOSkguLQYe0+7XbhyY11oRTvhbZEZRUrrqPf99XF/yF1XvvLi6e8z/hVvbVGsEd8Mv
 Qiu6hKrvxmLG/6Gu1PUewl4RyNN90iXJ3Rh3zLatEPwPBHAFaGnBpr5RP4Ntn7iSsskKZBwlebvul7
 dZxKtji4NE+xbeZup0zNKAjAcLeI8QVdmPiAbeqCybdrJc75zf4LhhuDwRXTdbrsXCooEGGuiMw3/v
 x+EUAxYAP0mwGpMCMNzDB9dpyGAKbRXmGfGhZu9JSilm3k8JsxQ47nQ3+PU4JxTEAGP/RA6CAwR6zV
 7KB5mLzU0yyN2b7Az2uKl0RkeneD9qcEy0xqorM/qFH7O+d020ljiEXSwPXdgJdOF7fiAdpmoeK2uM
 3RKFyedkYhLmnhtvfdEg6qb1tMNiC33AbBzVnm8LJMBkL2upkdQjzlsDvzsA==
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.  Wrap the target region
in a common named structure. This additionally fixes a theoretical
misalignment of the copy (since the size of "buf" changes between 64-bit
and 32-bit, but this is likely never built for 64-bit).

FWIW, I think this code is totally broken on 64-bit (which appears to
not be a "real" build configuration): it would either always fail (with
an uninitialized data->buf_size) or would cause corruption in userspace
due to the copy_to_user() in the call path against an uninitialized
data->buf value:

omap3isp_stat_request_statistics_time32(...)
    struct omap3isp_stat_data data64;
    ...
    omap3isp_stat_request_statistics(stat, &data64);

int omap3isp_stat_request_statistics(struct ispstat *stat,
                                     struct omap3isp_stat_data *data)
    ...
    buf = isp_stat_buf_get(stat, data);

static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
                                               struct omap3isp_stat_data *data)
...
    if (buf->buf_size > data->buf_size) {
            ...
            return ERR_PTR(-EINVAL);
    }
    ...
    rval = copy_to_user(data->buf,
                        buf->virt_addr,
                        buf->buf_size);

Regardless, additionally initialize data64 to be zero-filled to avoid
undefined behavior.

Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/media/platform/omap3isp/ispstat.c |  5 +--
 include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
index 5b9b57f4d9bf..ea8222fed38e 100644
--- a/drivers/media/platform/omap3isp/ispstat.c
+++ b/drivers/media/platform/omap3isp/ispstat.c
@@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
 int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
 					struct omap3isp_stat_data_time32 *data)
 {
-	struct omap3isp_stat_data data64;
+	struct omap3isp_stat_data data64 = { };
 	int ret;
 
 	ret = omap3isp_stat_request_statistics(stat, &data64);
@@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
 
 	data->ts.tv_sec = data64.ts.tv_sec;
 	data->ts.tv_usec = data64.ts.tv_usec;
-	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
+	data->buf = (uintptr_t)data64.buf;
+	memcpy(&data->frame, &data64.buf, sizeof(data->frame));
 
 	return 0;
 }
diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp.h
index 87b55755f4ff..0a16af91621f 100644
--- a/include/uapi/linux/omap3isp.h
+++ b/include/uapi/linux/omap3isp.h
@@ -159,13 +159,25 @@ struct omap3isp_h3a_aewb_config {
 };
 
 /**
- * struct omap3isp_stat_data - Statistic data sent to or received from user
- * @ts: Timestamp of returned framestats.
- * @buf: Pointer to pass to user.
+ * struct omap3isp_stat_frame - Statistic data without timestamp nor pointer.
+ * @buf_size: Size of buffer.
  * @frame_number: Frame number of requested stats.
  * @cur_frame: Current frame number being processed.
  * @config_counter: Number of the configuration associated with the data.
  */
+struct omap3isp_stat_frame {
+	__u32 buf_size;
+	__u16 frame_number;
+	__u16 cur_frame;
+	__u16 config_counter;
+};
+
+/**
+ * struct omap3isp_stat_data - Statistic data sent to or received from user
+ * @ts: Timestamp of returned framestats.
+ * @buf: Pointer to pass to user.
+ * @frame: Statistic data for frame.
+ */
 struct omap3isp_stat_data {
 #ifdef __KERNEL__
 	struct {
@@ -176,10 +188,15 @@ struct omap3isp_stat_data {
 	struct timeval ts;
 #endif
 	void __user *buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	union {
+		struct {
+			__u32 buf_size;
+			__u16 frame_number;
+			__u16 cur_frame;
+			__u16 config_counter;
+		};
+		struct omap3isp_stat_frame frame;
+	};
 };
 
 #ifdef __KERNEL__
@@ -189,10 +206,15 @@ struct omap3isp_stat_data_time32 {
 		__s32	tv_usec;
 	} ts;
 	__u32 buf;
-	__u32 buf_size;
-	__u16 frame_number;
-	__u16 cur_frame;
-	__u16 config_counter;
+	union {
+		struct {
+			__u32 buf_size;
+			__u16 frame_number;
+			__u16 cur_frame;
+			__u16 config_counter;
+		};
+		struct omap3isp_stat_frame frame;
+	};
 };
 #endif
 
-- 
2.30.2

