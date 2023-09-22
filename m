Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E777AB7B6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE85610E6CE;
	Fri, 22 Sep 2023 17:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000A410E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:25 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690fa0eea3cso2231880b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403945; x=1696008745;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aju3+JSf6eGUIv+LcbKwNlrE4eQbXi+VM+zVoGclrt0=;
 b=e4+e/tKeWGWpdYDhYN/XlTrTar+Gyx6VnQigqNn22LrPvRAFkVD40On8LsQriZ4bGe
 3rp+p+0eHYCuGCVK3NWbiZWNh0S2xF1zSeAimkXwE8trfYGbk3oH8xgBKvluklPog2De
 WxC0cX5Mj5npE4Hu7Gp+5mZXlozR+vTaVaz4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403945; x=1696008745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aju3+JSf6eGUIv+LcbKwNlrE4eQbXi+VM+zVoGclrt0=;
 b=xMJsDCjgTxTIlUAYUIFSpKoX7MYznkGZjrsX/sQ0Gg7IRv8j4fV7dmUQtAziHDoXG1
 Q7EO+vSOpUYwbisTlENyguu7Rlbng0PnC4dBOtHclieZcbF+3XivUy0NhGlOdipyIEiP
 QgUV3S098IS4OxLxTbebcuQoF8ockzzbXZolta/wG5og7qBvUVI5VGXvcOo/C32tACPu
 7lsbb1+AQzJEuu4GIFfbDSMYUJZN9LiNINNBsBOkgsLCJoho+/tWUkZ5dGuq7vV9PBrT
 LkzjKnLeHwtashmNWC63hCYF8yYbkKNCdr/ojko+eUB3h8Siqp/yF4rpC59RqqSWIfdG
 0ptA==
X-Gm-Message-State: AOJu0YwVDip0Me3KJPnKnzcFE2QY/SBZlq1P+wspjW7Ti3d7aa7CIYIU
 HOOrzLWGJ2HZwZkUguj27lKomg==
X-Google-Smtp-Source: AGHT+IHgT/bhDe7l/fJSBw+bewXNYr1woAQ273HxnwMMW/1b4ePjBTtMzVLx9TJ9ssFNw7g8YFAmqQ==
X-Received: by 2002:a05:6a20:3d8b:b0:137:74f8:62ee with SMTP id
 s11-20020a056a203d8b00b0013774f862eemr269550pzi.18.1695403945599; 
 Fri, 22 Sep 2023 10:32:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 z27-20020a637e1b000000b00563e1ef0491sm3423207pgc.8.2023.09.22.10.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with
 __counted_by
Date: Fri, 22 Sep 2023 10:32:13 -0700
Message-Id: <20230922173216.3823169-8-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=keescook@chromium.org; 
 h=from:subject;
 bh=arqXb+Ta6Sc7/P6cgbiuTW33qm7tl3AbrpWLIpWMOrs=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+eMheJSZWlkxEjVkQYSxOb48cD+nN4OVb7V
 LKQ+3uUqo6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JrX8D/4u4mGTNY0H31raYIAy39e0MQyr+8F7lCaJtmz2p55bHTGxLREiFkYdiEpuailORE0wwsW
 BdlQDhRjLTf2KU9T7kldf6gcsBqFx5GS03UQDFirRowApSq5fh8IhxpEuGCuARDeUQrxNtmKCN0
 kN+bcH9BoSyxbEJQzpBBCbp5RMSt4XXDDkDi3oSsbZuZRkPmbszcp8iXrqUoFv7S/Vb8X5tGSRw
 nMO+fGglPvpNerLuaODEVbqAcj6XsI5FnEUPAbqIRdOyr/vAf4ZrHXXTeukSN6uOcb1w6XAw9GC
 4wnO7W4eW8CaLB6Kn2OhET6y8+h69ft05VnFFrnCTVxxJScjLTXrSCCsV544YFnE9eWFcjVivpW
 F3KuWexvi43Nc986ga140ka16uCaP//Thnt3s311iQsr5hvWJH4fkl32zdBPXWCwGX4ceRWSch2
 JEogxta26Yvy5CIJRHdU1z5humCdNzFVvMxbgMwQIRSKyKG1M7mMT/nBOIMfytjgY8S0vaBALVu
 EciVOC1nl86GXTm1b+MB9R8ZKZyOZPrX7vK8PyRCASDUnCN/37sg23Cq5Aqn4UUJ+sZeFPAF+11
 o0r5FyrPrmPW3O3hQUprUGrQsd68XMRpXTFcnKOPsEaG9G23VqHiDSPPILF+sczZ20HKQ+LMyhP
 63vfZbPCZqHgx8g==
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Kees Cook <keescook@chromium.org>,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct vmw_surface_dirty.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5db403ee8261..2d1d857f99ae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -77,7 +77,7 @@ struct vmw_surface_offset {
 struct vmw_surface_dirty {
 	struct vmw_surface_cache cache;
 	u32 num_subres;
-	SVGA3dBox boxes[];
+	SVGA3dBox boxes[] __counted_by(num_subres);
 };
 
 static void vmw_user_surface_free(struct vmw_resource *res);
-- 
2.34.1

