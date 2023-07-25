Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CF7609C4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 07:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE2A10E2D2;
	Tue, 25 Jul 2023 05:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D188410E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 05:51:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso51329315e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690264313; x=1690869113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
 b=Fm732xFUENH32uKlXGBO66pTUcan0hi8UvbXIOsmsajrmKgF65+VKuAsgwl0h2rEvm
 8bVGJCXxJ7Lo3CDTY397Y4mxix0VJtW/pkEXHkkLKO800NxhaPqfFFKex6vpdJLCOa4w
 CmI8aGs1OSFpz1ZKdyfS0I94dx6bSwxKd8BBKpUZIt+arN+GsWHCduZZv9YOaAYpEwDJ
 Kpqga4FAeLkxMrOnhuZRX4J7HcS3KeKVchXAMmblYLn9CvHnXCAxAdBbWFocNGUcqeMO
 Tu3SmXJtzR2hdcpIZzcJs/EIeI/+pl0EtvFzM5PA5rL69dp57n8daVKEcMuVDnfOpImi
 zo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690264313; x=1690869113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDa0fqzt30Ptcdn+Rp2moDt3uwTqaLbOBTSNBvQHsow=;
 b=M0ckoDmknxZy0FqJyLcNZVE82Qr29zVaRRvDMlCt8mxt3AV68vPj1zRS2OxYf4qjIK
 iXeohe8rW0pH/PM46flD2bPafr3w7klDTq/qhjdUJrVFmUOEgcX/R2zRBhz9gSzLqS1C
 t94V2p69IWGx1+Pw3yzKmKhpFLpfVvzQF7hDTBc9XaAWKUXrVr2tc78fUJ66FeQfvmCB
 wCzmg0BRAz1EGAsCMHbEwhdB/I6EEcLbaqVxY20haPghQEZtSx7/Z0KhDGw7M3JiwBmP
 tGAaibYQ3YQQuffZyM4W/my7o4yqrCakHC2UfArnbRVs8R9LVlv7OEaduHVcFCw/F1V6
 Mm3w==
X-Gm-Message-State: ABy/qLbGG6adJn76ELYndO5hY1ClVsakCYra+bsVtxKVvRf/UH9nRk/H
 q0QvZTfLQU6ylJOnT9aLaHYtcg==
X-Google-Smtp-Source: APBJJlFxsS3y+cMdX48jiFbTMmksWQoLUG07CWaL93WGXpO5sZmPQJoOQhas8KWkVrn1RtL/72a08g==
X-Received: by 2002:a05:600c:152:b0:3fb:e200:b2b3 with SMTP id
 w18-20020a05600c015200b003fbe200b2b3mr9548144wmm.37.1690264313064; 
 Mon, 24 Jul 2023 22:51:53 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w9-20020adfd4c9000000b0031423a8f4f7sm15243623wrk.56.2023.07.24.22.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 22:51:52 -0700 (PDT)
Date: Tue, 25 Jul 2023 08:51:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
References: <ZL62X3/CnsJcWWU4@ashyti-mobl2.lan>
 <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352f7c10-3592-4a18-abdc-ab554a992d10@nfschina.com>
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
Cc: mripard@kernel.org, tvrtko.ursulin@linux.intel.com,
 kernel-janitors@vger.kernel.org, llvm@lists.linux.dev, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reason why the first five attempts had bugs is because we are
trying to write it in the most complicated way possible, shifting by
logical not what?

regards,
dan carpenter

diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 36b479b46b60..6997b6cb1df2 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -988,7 +988,13 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
 		      const struct tv_mode *tv_mode,
 		      int clock)
 {
-	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
+	int div = tv_mode->oversample;
+
+	if (!tv_mode->progressive)
+		div >>= 1;
+	if (div == 0)
+		div = 1;
+	mode->clock = clock / div;
 
 	/*
 	 * tv_mode horizontal timings:
@@ -1135,6 +1141,8 @@ intel_tv_get_config(struct intel_encoder *encoder,
 		break;
 	default:
 		tv_mode.oversample = 1;
+		WARN_ON_ONCE(!tv_mode.progressive);
+		tv_mode.progressive = true;
 		break;
 	}
 

