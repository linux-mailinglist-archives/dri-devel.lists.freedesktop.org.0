Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3874B59D0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 19:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEBC10E277;
	Mon, 14 Feb 2022 18:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C29610E258
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644862959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6KphgiHwgRe3NkAsq1kWFGjvzJI/mlc7nnNKh2wAjkA=;
 b=MsCTMAsBDJjGSIiaY6Qb5XA+53MFnQETk+IwAv1tF+ooFwE5UsvDm4TRfqKx89jJ2dew1j
 6Tz31TrEKuHER+T8eV/fDD9hMKxPm/GgVyKUaa6XLtctt6PuG76oddRSC+ySUgu7PJ4eEd
 p37wgW183+QBuC/Y8/xnSt0/Q/wKyBk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-3ZU4TTE_NSWiXiwY3-u_9w-1; Mon, 14 Feb 2022 13:22:38 -0500
X-MC-Unique: 3ZU4TTE_NSWiXiwY3-u_9w-1
Received: by mail-ot1-f69.google.com with SMTP id
 l1-20020a9d7341000000b0059c2046f9edso10838492otk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KphgiHwgRe3NkAsq1kWFGjvzJI/mlc7nnNKh2wAjkA=;
 b=WlTJh4jvbluVzP3222+jwfJiVWeXz/yUTBdxIeGSrOxzVEuwzN9qs/OTgLf1/TaZMz
 cBax9AhDxN7JGYFwTXqpBs2LmFoUZC22rA9LtevMSSCxkCVmjPeYLU8defRsEbYAVlHl
 g2FOPjIwdF49Cml/ahyZFotZYqbYmp34ayoWnKh0t0bSvNIY8/soV9mBENqAMpEkkJJd
 8BRTu0T7GfTN/N5IogKVGdf+HdC5/rdhF1TCIpge/389IN/cLJhc/MSDC62UugAlfSWb
 BrmOsOlz8ydGhvvOXid+l37oztzLlZLiLTE+vSgMyRG9XmgRM6hVt4xLdZAm6zlQ3xSH
 uIpw==
X-Gm-Message-State: AOAM532DG302aGWaH7hEktT7hLMaU+w5s5iQxmNAFUJmXROfgxigM3t8
 tHz4iMT+4of8R2N2GC4yosnPis+oI4fxGnMWxBtHpE3FxFZNyW2B6gh3CEgHfyzuQQl1wdfO4OO
 Oy3HV/n4ZRTihzeJnMS4EJbyryYg9
X-Received: by 2002:a05:6808:2227:: with SMTP id
 bd39mr64714oib.142.1644862956383; 
 Mon, 14 Feb 2022 10:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVpfes2LLHqPuaIsi0+RkM/zs2xkzYjID6G+ExdR/vMlhePhV1G0FpY7aHAfq8EanEFOo3Eg==
X-Received: by 2002:a05:6808:2227:: with SMTP id
 bd39mr64640oib.142.1644862954708; 
 Mon, 14 Feb 2022 10:22:34 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id j6sm12673419otq.76.2022.02.14.10.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 10:22:34 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, luben.tuikov@amd.com, david.nieto@amd.com,
 nirmoy.das@amd.com, Ken.Xue@amd.com, Roy.Sun@amd.com, evan.quan@amd.com
Subject: [PATCH] drm/amdgpu: check return status before using stable_pstate
Date: Mon, 14 Feb 2022 10:22:24 -0800
Message-Id: <20220214182224.2906060-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
amdgpu_ctx.c:616:26: warning: Assigned value is garbage
  or undefined
  args->out.pstate.flags = stable_pstate;
                         ^ ~~~~~~~~~~~~~
amdgpu_ctx_stable_pstate can fail without setting
stable_pstate.  So check.

Fixes: 8cda7a4f96e4 ("drm/amdgpu/UAPI: add new CTX OP to get/set stable pstates")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 1c72f6095f08..f522b52725e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -613,7 +613,8 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
 		if (args->in.flags)
 			return -EINVAL;
 		r = amdgpu_ctx_stable_pstate(adev, fpriv, id, false, &stable_pstate);
-		args->out.pstate.flags = stable_pstate;
+		if (!r)
+			args->out.pstate.flags = stable_pstate;
 		break;
 	case AMDGPU_CTX_OP_SET_STABLE_PSTATE:
 		if (args->in.flags & ~AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK)
-- 
2.26.3

