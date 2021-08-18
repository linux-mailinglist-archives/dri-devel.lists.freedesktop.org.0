Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD63EFADF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8D289F6D;
	Wed, 18 Aug 2021 06:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EBA6E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:05:55 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id j1so1923864pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+ejbkcqZbFXmITuXlL7CDyZypzmre+l3eRsA92DuBs=;
 b=L0akKXK1kGy5WH++Js4ID4keOQyLjU4nvMwtS4cqGsjwS1xFU9Y8zURE3dmo5F8V05
 KIsW1RPt4T0R/W281PDW0H0fLfSOQuYUBawn1F1dPLAhZ37UhSTyialAAe7HbhBBWbsu
 f/DFvbhPjRGc+B3F90LL457312QDPssIXH+XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+ejbkcqZbFXmITuXlL7CDyZypzmre+l3eRsA92DuBs=;
 b=Pzw2KESsfsfFpyFwrRJvF6pmgPhcgInBo7jWMLuB/iqr4RkrOdG/A+FROSM3TxA83J
 lf7Wx9woLka/mBCPwnTCYTA6XgJbtnQk5NVus3tM2Rb8T4MmuwNTG6q8il17cXQxIW1T
 95ZR4N8fH8iLUa8zl1FOApCrgB/567azKBWPYcGVvepBtvsqQxi47tdHMBggjqUqxeei
 d0w4n0jIAO/+8eKwdei9CdJX2CdYQpl90H4dNtnUPN1NFDQVTOxJMAaSTp5KbVIBYXzS
 /EL7+Ek2LwcVlfnDV+CJjwShIns6MW0uGlkh7GGUEix2ma0Y9o/lWAaW5aQ42HLaywMF
 aQDw==
X-Gm-Message-State: AOAM5304t3zXHUZipZaUfRI6umfeUT0xktqGO53FRzjI4m/WVsMU+u91
 0Vfl9neQRbkt6jyiOOk/0N1iVQ==
X-Google-Smtp-Source: ABdhPJygr1g/bi1zRYFaNXMg6waYnoKPl9E3e4Tfp/TWXQO+BinSpm8T001OPFMZUDUxgc42WizUMA==
X-Received: by 2002:a17:90b:3442:: with SMTP id
 lj2mr7420058pjb.81.1629266755106; 
 Tue, 17 Aug 2021 23:05:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b20sm4633796pfl.9.2021.08.17.23.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Keith Packard <keithp@keithp.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Dan Williams <dan.j.williams@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 05/63] stddef: Introduce struct_group() helper macro
Date: Tue, 17 Aug 2021 23:04:35 -0700
Message-Id: <20210818060533.3569517-6-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8609; h=from:subject;
 bh=8Qg6O9rjkiwOKAeKIVGdgdvKDjqINmqyRAtZrlXXnIA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMeD0CHW+uuEt76ResWyKF8pbMpqH18BMp8/Pj9
 U4ZtvnmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjHgAKCRCJcvTf3G3AJqb/D/
 93GZOK8t0sjGW1TI4a1tTQBtjO+BfS5KTMQeA3a7Uce4PVwGGMi8plmIGq+Rfhww6bDSGUR3D5Tq8i
 C/Jxt4JuoLgnD9VoTjkw5H7tFIpQ44zNRI+8ZDaxmiu1VD47VHbY1vE6wOYdGHBrNCSHNYWUAi2vaS
 E4fN8LuFsXWsMK8sLlZGt8eIxJGzmRPQOsOb31OTMfNyRY6gvuiRFsc+CYTgT/2Rwwg8x5TnOqMHLR
 8LQNRHT7vu6QbAeAziCQskZWLxnFAg1+Wjkn7rq24wRdar7ztcqG5+psYuIvRugHU+Igp+JYFpGAxS
 512FKT2Yno2+cAIO9/aKyo48MArIW0R0nMBtN9AeeF3y6C5I1GEiDLvBoWZrcmpSmxR/UPgex5+W50
 5YzAGHXmLPDsRHR0GuHHnxgbjUWdMHHwN9EmP/KnqmG7v9csbjgCpZm8dBQu9viUOpVGFWXfMFRoAQ
 umTD8Z//E8AM9XTfe490LNcpHh/WNq93DLwwP5q3HrUb3G113UWGJx+nuf91GKOllfV3S/sJrASX23
 sEQ2nIoj+nqPPAU77dYdz6kJa/SnPmKWce5NU111vhOoPjmDoZYruwnsDc3WCGZAmidp5Naz1aYPpb
 qsNP1TeGqq2MhskDz580+XWS+9E9gVOtBY6COlRwGVpPKMX4dGct/QGB5r4A==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel code has a regular need to describe groups of members within a
structure usually when they need to be copied or initialized separately
from the rest of the surrounding structure. The generally accepted design
pattern in C is to use a named sub-struct:

	struct foo {
		int one;
		struct {
			int two;
			int three, four;
		} thing;
		int five;
	};

This would allow for traditional references and sizing:

	memcpy(&dst.thing, &src.thing, sizeof(dst.thing));

However, doing this would mean that referencing struct members enclosed
by such named structs would always require including the sub-struct name
in identifiers:

	do_something(dst.thing.three);

This has tended to be quite inflexible, especially when such groupings
need to be added to established code which causes huge naming churn.
Three workarounds exist in the kernel for this problem, and each have
other negative properties.

To avoid the naming churn, there is a design pattern of adding macro
aliases for the named struct:

	#define f_three thing.three

This ends up polluting the global namespace, and makes it difficult to
search for identifiers.

Another common work-around in kernel code avoids the pollution by avoiding
the named struct entirely, instead identifying the group's boundaries using
either a pair of empty anonymous structs of a pair of zero-element arrays:

	struct foo {
		int one;
		struct { } start;
		int two;
		int three, four;
		struct { } finish;
		int five;
	};

	struct foo {
		int one;
		int start[0];
		int two;
		int three, four;
		int finish[0];
		int five;
	};

This allows code to avoid needing to use a sub-struct named for member
references within the surrounding structure, but loses the benefits of
being able to actually use such a struct, making it rather fragile. Using
these requires open-coded calculation of sizes and offsets. The efforts
made to avoid common mistakes include lots of comments, or adding various
BUILD_BUG_ON()s. Such code is left with no way for the compiler to reason
about the boundaries (e.g. the "start" object looks like it's 0 bytes
in length), making bounds checking depend on open-coded calculations:

	if (length > offsetof(struct foo, finish) -
		     offsetof(struct foo, start))
		return -EINVAL;
	memcpy(&dst.start, &src.start, offsetof(struct foo, finish) -
				       offsetof(struct foo, start));

However, the vast majority of places in the kernel that operate on
groups of members do so without any identification of the grouping,
relying either on comments or implicit knowledge of the struct contents,
which is even harder for the compiler to reason about, and results in
even more fragile manual sizing, usually depending on member locations
outside of the region (e.g. to copy "two" and "three", use the start of
"four" to find the size):

	BUILD_BUG_ON((offsetof(struct foo, four) <
		      offsetof(struct foo, two)) ||
		     (offsetof(struct foo, four) <
		      offsetof(struct foo, three));
	if (length > offsetof(struct foo, four) -
		     offsetof(struct foo, two))
		return -EINVAL;
	memcpy(&dst.two, &src.two, length);

In order to have a regular programmatic way to describe a struct
region that can be used for references and sizing, can be examined for
bounds checking, avoids forcing the use of intermediate identifiers,
and avoids polluting the global namespace, introduce the struct_group()
macro. This macro wraps the member declarations to create an anonymous
union of an anonymous struct (no intermediate name) and a named struct
(for references and sizing):

	struct foo {
		int one;
		struct_group(thing,
			int two;
			int three, four;
		);
		int five;
	};

	if (length > sizeof(src.thing))
		return -EINVAL;
	memcpy(&dst.thing, &src.thing, length);
	do_something(dst.three);

There are some rare cases where the resulting struct_group() needs
attributes added, so struct_group_attr() is also introduced to allow
for specifying struct attributes (e.g. __align(x) or __packed).
Additionally, there are places where such declarations would like to
have the struct be typed, so struct_group_typed() is added.

Given there is a need for a handful of UAPI uses too, the underlying
__struct_group() macro has been defined in UAPI so it can be used there
too.

Co-developed-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Link: https://lore.kernel.org/lkml/20210728023217.GC35706@embeddedor
Enhanced-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Link: https://lore.kernel.org/lkml/41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk
Enhanced-by: Dan Williams <dan.j.williams@intel.com>
Link: https://lore.kernel.org/lkml/1d9a2e6df2a9a35b2cdd50a9a68cac5991e7e5f0.camel@intel.com
Enhanced-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://lore.kernel.org/lkml/YQKa76A6XuFqgM03@phenom.ffwll.local
---
 include/linux/stddef.h      | 47 +++++++++++++++++++++++++++++++++++++
 include/uapi/linux/stddef.h | 21 +++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/linux/stddef.h b/include/linux/stddef.h
index 998a4ba28eba..f2aefdb22d1d 100644
--- a/include/linux/stddef.h
+++ b/include/linux/stddef.h
@@ -36,4 +36,51 @@ enum {
 #define offsetofend(TYPE, MEMBER) \
 	(offsetof(TYPE, MEMBER)	+ sizeof_field(TYPE, MEMBER))
 
+/**
+ * struct_group(NAME, MEMBERS)
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members.
+ *
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @MEMBERS: The member declarations for the mirrored structs
+ */
+#define struct_group(NAME, MEMBERS...)	\
+	__struct_group(/* no tag */, NAME, /* no attrs */, MEMBERS)
+
+/**
+ * struct_group_attr(NAME, ATTRS, MEMBERS)
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members. Includes structure attributes argument.
+ *
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @ATTRS: Any struct attributes
+ * @MEMBERS: The member declarations for the mirrored structs
+ */
+#define struct_group_attr(NAME, ATTRS, MEMBERS...) \
+	__struct_group(/* no tag */, NAME, ATTRS, MEMBERS)
+
+/**
+ * struct_group_tagged(TAG, NAME, MEMBERS)
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members. Includes struct tag argument for the named copy.
+ *
+ * @TAG: The tag name for the named sub-struct
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @MEMBERS: The member declarations for the mirrored structs
+ */
+#define struct_group_tagged(TAG, NAME, MEMBERS...) \
+	__struct_group(TAG, NAME, /* no attrs */, MEMBERS)
+
 #endif
diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
index ee8220f8dcf5..0fbdf2f711aa 100644
--- a/include/uapi/linux/stddef.h
+++ b/include/uapi/linux/stddef.h
@@ -4,3 +4,24 @@
 #ifndef __always_inline
 #define __always_inline inline
 #endif
+
+/**
+ * __struct_group(TAG, NAME, ATTRS, MEMBERS)
+ *
+ * Used to create an anonymous union of two structs with identical layout
+ * and size: one anonymous and one named. The former's members can be used
+ * normally without sub-struct naming, and the latter can be used to
+ * reason about the start, end, and size of the group of struct members.
+ * The named struct can also be explicitly tagged, as well as both having
+ * struct attributes.
+ *
+ * @TAG: The tag name for the named sub-struct (usually empty)
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @ATTRS: Any struct attributes (usually empty)
+ * @MEMBERS: The member declarations for the mirrored structs
+ */
+#define __struct_group(TAG, NAME, ATTRS, MEMBERS...) \
+	union { \
+		struct { MEMBERS } ATTRS; \
+		struct TAG { MEMBERS } ATTRS NAME; \
+	}
-- 
2.30.2

