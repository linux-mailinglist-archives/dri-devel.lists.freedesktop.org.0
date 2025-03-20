Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFEA6ADCD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF96310E6E8;
	Thu, 20 Mar 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R/T5O/Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F9F10E6C6;
 Thu, 20 Mar 2025 18:54:07 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-85b38fb692fso2300339f.2; 
 Thu, 20 Mar 2025 11:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496847; x=1743101647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
 b=R/T5O/Hpxo6kLkT3CoShBzQsCvGEMBYfW5upYEUjxlmK6STdfvgDcq3Sbnl65XQFir
 GJWTmDU5x4qbMFusP4lXIQ28BqBUNOf2P5oGqNE6P4w1qFVGZD2GHXLmEkCbaAQkI7ge
 sQakXiIQy9nxwTRdUNJ5vFGshjJeA1w87d+vTvYL0bwx2+dXjyslNtTIp9mYmudrbuNj
 Rvf1RatD/44Rr7DIf7G7Z4RLkn4JR8NCdwdNkmOfd5af8vx/77EVUXkDgDdHpM961vEQ
 3lB4sPe8xA2Mdi99KNkRNYTX+H1Do9fbh1UqAjl9H3kuFGTRix5msGZ7MHGjvo/TIhj5
 RwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496847; x=1743101647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NT2KOV5clgY+fvBVb0kMabH8vqyg2O7PfGhDz8vOzc=;
 b=Z3gwJwQVdRBb6iIRxa1b9rRA3xttfSywHL261hopwmvuPcaKHrRVkY+C5XNj2I8ZzE
 5ha7uHnceBsgPe52Ys+VP6/UOo+NYVUOvQLqkB3siht7jHj5FbwTiL5MaSsWa3FgXtKy
 zy10izEoDq8gUWpviUkPr2H2MbqURjJ8aprlteZMjS2UcUpYdX5DdN1/6Eu300MxuY6T
 BZ00qr46Cy9N9m8tCfoxJ6ilb1KVlaKW3HGF8rvx60FhN4kPHnURtzGMEG7Q0US6r7oM
 9dBg13wX6/+IQVEGX9Bsd81qyaGO/P1pprWSvp6FxLIpSI+XwRYfmhkZ3RBDRXfP8eRE
 hEbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0WUOLTJu+e2OsHCGlpyFrGuyt9QiBWy4vBdv7ZT5Y6erlUcFp9jisXiqEkjspaBsCf6Oe5629QzH3yn6LOg==@lists.freedesktop.org,
 AJvYcCUCIxS2mQVosfnevBdcWFTzG6m6ZNNIMh1apSwcvymhsNBu4BApagtm2vUe3bntGLkrGkKVo9b7crll@lists.freedesktop.org,
 AJvYcCWI61Ov1nTwDAr3ydFaoGDJx1/sf7oOJzsKa97T1FIVoGHrhzOMh2HAUwElETttZzRdENoOx8h6vdvN@lists.freedesktop.org,
 AJvYcCXXs6Ca00LekR8OtQyL/ctlo/JbaOCQ+NF7qs4tIDvWGzXHKkYDT4PTEuG95SC1gcve6ShFT3h/3Nd+EYRbtNDuLw==@lists.freedesktop.org,
 AJvYcCXY7InOr5hpLa6GhPrtniUslQJ5pKGMEIzf8UW4LFgwoFyDo1muUQg5PgEarGh9fOSqC93NiGUa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq2+1OO2Fmzbia6B3A5DdgXw6Z7xer4Tk2S2/voTSgQdM4TeV2
 I4IHdlYl7pdrtItvpXHP1EZr0sbuZAKAAKE6E4Rb+G9hI5B+KF54
X-Gm-Gg: ASbGncveutL3IEOEDzWOPQaQnPl+sMncom4s7MbgYW+v3eL3ZDkm74lVoANwKrGB4J0
 DbiSfTviD2+Eud8/XrLG9EDZD4VGjGPwVaXl3JQfTP3gtBtqfypIKhkq4mNPOG1S1V6GEAGYfy0
 lps2DUhjdTWHF9VRi7EPuY8/T9leNvujD1yMz2qOuyGgBymMhkTB3dylH6j7DVqGrniwFCafzTH
 p40u45KUbuq26e9YcYeCzAs+OC19MkYVYZ7Leav4U9iUyO9h+gKQVq4xDBkXw5P82ND4owcV/HU
 TZeh/oG5uiMEjkcwJ5CBv5QP5QCS55E7IXp0PRoReGzT8fRL0/rihBr+9JptJJZQu5wOVHvCOA0
 b0xOW/HGgs7Tk
X-Google-Smtp-Source: AGHT+IEOoWWyXvNdTlGTPuLwOnrnKkh3QWCuBEv1RJzjp71NeU4mRZKpFk54KaxFPetJO0ADitvIXw==
X-Received: by 2002:a05:6602:360b:b0:85b:538e:1fad with SMTP id
 ca18e2360f4ac-85e2ca335ffmr49889339f.6.1742496846919; 
 Thu, 20 Mar 2025 11:54:06 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 55/59] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Thu, 20 Mar 2025 12:52:33 -0600
Message-ID: <20250320185238.447458-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cb405771d6e2..3843c0e47169 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.49.0

