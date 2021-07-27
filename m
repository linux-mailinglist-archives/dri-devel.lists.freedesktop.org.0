Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8D3D7FBF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05BE6E7D3;
	Tue, 27 Jul 2021 20:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CB76E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so6604280pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=niMj9CXz4ejnw+kzGNZe1+bUFXSbgDhe9sFS3VQ9miI=;
 b=a+dkLFxyeSBPiOFmgASKI3HBPzumVIOC5mH0NfPZ4G0u9HE21lIwFBBWBONzwmMQDo
 Efqix/y2SZ0MmC2V1Ld9XBh4ywoKeS0o00fNfBm4e5u9ZpK6ODN3+AjOzFOZhZhaYDHx
 uzL0y45E1gPOLULzFld6xboGrx4XSCubE7bFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=niMj9CXz4ejnw+kzGNZe1+bUFXSbgDhe9sFS3VQ9miI=;
 b=YsvgkMvmRvFZXEHLzXL247f8N56SH7W6/8zSN/qisYaNjiIaOFTVIN5It6xkHDokLa
 srRVKsUt6ElIkKFtSCEOO+UJCScNWIaz/BqXHsR4s/wYwrTyFPXh5QNIRyXLw6AHMBjp
 iB9/tyx3IHDjrosmXg1muwSp2lqw6WW+00ObvIJheRcLSN3iKtGcqdfRqUjFNnQNH58Q
 7SAt8z7X1+h2OpkBjJJlGjndrIr3tVFqyYpv+R9ZfpRW+L4VmnX8JhhQVtibCGKvBd3/
 ThGLU2hahy6teAki09S9hLJeBH90/d+UnLzySsTtkTSkSd2MAd7Jl2LuHFkz44zLT2cx
 8KxQ==
X-Gm-Message-State: AOAM531zsCc3vuYFF2qST4U2KxOgl6TLCZ+RjPho1mfs52h7p6C0MCS8
 dG1PYB7STzlndCC8EDQMtgWpBdDn9nDSPUoj
X-Google-Smtp-Source: ABdhPJzH1DT4GrYsm4Wp3fQD5rhWKkENYYazYbCfE0KpJ6DHpEI/MRvOUuvJv6GD7saGx6RnZcVO6Q==
X-Received: by 2002:a63:2586:: with SMTP id l128mr26012275pgl.68.1627419551372; 
 Tue, 27 Jul 2021 13:59:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j13sm5025493pgp.29.2021.07.27.13.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 15/64] ipw2x00: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:06 -0700
Message-Id: <20210727205855.411487-16-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3321; h=from:subject;
 bh=0Nhl+lV3cEcT5lOU4zXDLwJTWM/l7DZ+/5ez9PThfHU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHODmdLOpeLBo/X7lz0zzh+JJDwEkaDN00Z8kMzv
 sILJmNmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgwAKCRCJcvTf3G3AJqu3EA
 CgffJsGtT8m9lsKheu7s+yA1eAMukcAQ13t72QJcc8A2IdLK2lwV9x8QVh9uUd3041NW91qDNI+Czs
 3k2PBePcLrqYo+rdGa4Fs/X3zYzBDuEQKSmIYIkoJBe2xr+niqqh7xhFf/5ghdEYzaVZ0zGolFf8it
 26bmcWDMOOoHxklGwf6NXQYQfYTg0hdDkG2BM1l7UXEbXz2oREhTB+LtbTnn0Hj4OfW7ZiO0CPrkhI
 lKRNotmC8/XbWEzRldEuybAi7+tknghi8uuLE+9GIz7AC4Fe6UXopDTqzxyP6j+beO0cI5K8QQPYQl
 42woosmLzvhziq8Gj3/SzeQTJF9WacNXul30sJfOMm0mwZMl3y9Z2UvHeW2Q1tzzCZvtSChEQJMlJv
 VPnGbrapT0zmmokAsquizS99ri3WqvRQ4aa/1HPQLQxPLdEV0mfXlCZyBdS9Di0az/9jo4GTt6+4dk
 xw6s52TxDhSNMdH0X/j3Rd4x2bK4G+3/LG6bbP73GrzRSX/7cr5SQeJiichuQ2tAPPZLG3xktu+SBj
 GylM+395+DNTumAg5AwAJownhHXWSpyplcyTrQ9IxdGJW3YqhHop4Auz1mygoryurP3HSPSQoF2pzP
 k0+9FvuNGVyc4wPzxm3gvya7bZvJas+dThlg4d+oB8lbja/QIUDEBiG3BoIw==
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
field array bounds checking for memcpy(), memmove(), and memset(),
avoid intentionally writing across neighboring fields.

Use struct_group() in struct libipw_qos_information_element around
members qui, qui_type, qui_subtype, version, and ac_info, so they can be
referenced together. This will allow memcpy() and sizeof() to more easily
reason about sizes, improve readability, and avoid future warnings about
writing beyond the end of qui.

"pahole" shows no size nor member offset changes to struct
libipw_qos_information_element.

Additionally corrects the size in libipw_read_qos_param_element() as
it was testing the wrong structure size (it should have been struct
libipw_qos_information_element, not struct libipw_qos_parameter_info).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/ipw2x00/libipw.h    | 12 +++++++-----
 drivers/net/wireless/intel/ipw2x00/libipw_rx.c |  8 ++++----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw.h b/drivers/net/wireless/intel/ipw2x00/libipw.h
index 7964ef7d15f0..4006a0db2eea 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw.h
+++ b/drivers/net/wireless/intel/ipw2x00/libipw.h
@@ -537,11 +537,13 @@ struct libipw_txb {
 struct libipw_qos_information_element {
 	u8 elementID;
 	u8 length;
-	u8 qui[QOS_OUI_LEN];
-	u8 qui_type;
-	u8 qui_subtype;
-	u8 version;
-	u8 ac_info;
+	struct_group(data,
+		u8 qui[QOS_OUI_LEN];
+		u8 qui_type;
+		u8 qui_subtype;
+		u8 version;
+		u8 ac_info;
+	);
 } __packed;
 
 struct libipw_qos_ac_parameter {
diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_rx.c b/drivers/net/wireless/intel/ipw2x00/libipw_rx.c
index 5a2a723e480b..75cc3cab4992 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_rx.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_rx.c
@@ -948,13 +948,13 @@ static int libipw_read_qos_param_element(struct libipw_qos_parameter_info
 					    *info_element)
 {
 	int ret = 0;
-	u16 size = sizeof(struct libipw_qos_parameter_info) - 2;
+	u16 size = sizeof(element_param->info_element.data);
 
 	if ((info_element == NULL) || (element_param == NULL))
 		return -1;
 
 	if (info_element->id == QOS_ELEMENT_ID && info_element->len == size) {
-		memcpy(element_param->info_element.qui, info_element->data,
+		memcpy(&element_param->info_element.data, info_element->data,
 		       info_element->len);
 		element_param->info_element.elementID = info_element->id;
 		element_param->info_element.length = info_element->len;
@@ -975,7 +975,7 @@ static int libipw_read_qos_info_element(struct
 					   *info_element)
 {
 	int ret = 0;
-	u16 size = sizeof(struct libipw_qos_information_element) - 2;
+	u16 size = sizeof(element_info->data);
 
 	if (element_info == NULL)
 		return -1;
@@ -983,7 +983,7 @@ static int libipw_read_qos_info_element(struct
 		return -1;
 
 	if ((info_element->id == QOS_ELEMENT_ID) && (info_element->len == size)) {
-		memcpy(element_info->qui, info_element->data,
+		memcpy(&element_info->data, info_element->data,
 		       info_element->len);
 		element_info->elementID = info_element->id;
 		element_info->length = info_element->len;
-- 
2.30.2

