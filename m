Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066E52B32F
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3D510E2CF;
	Wed, 18 May 2022 07:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F48C10E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 07:24:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso2636831wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4huS1qwBfiQNftZ7pKsoc9bDCoDHvonAE+NZgu2h6c=;
 b=mycV6ZeRycT/wvEF8CfEOMQzj0VfQb3FGo7c12/Ep8ZqxNC4W2svH+pgfN95xKMgYn
 ufrTLl0vwd5hh4bNSD4f6D/Vz+7AxvTj30OA+7XweZrp2C4RhRSterHoxVAZWAJYBhgY
 rsjDHCcMqzCUYWv0q8ULwqSsrXHSySBgleLvoys/Zl7q1FfRHe9N/w10jsIcdG4Vws/V
 usqVnzRcc63YChfLUXpXTGnKI2/WeOSz7iVMTsJ+wQv0Qn4gXepNahyFUMLCI7JH1gKo
 hx4TIbFBZpbcUvE50tpbuJ55KIBSpddZfxc5LNrl+9ghRAqus9Ps4s8HHdyDXgTa3ht5
 DZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4huS1qwBfiQNftZ7pKsoc9bDCoDHvonAE+NZgu2h6c=;
 b=NKftq7OouQQAapewRof9V9fylhYwN71UwqvucK77uq2kMDkqus1eJ2lTlQosVnBbZw
 IUyqU19AGYH71hDwah+CKlXk72R2+Ro1Um+OkV5I4659aL3lEPeutH76FNNsDSXHbygq
 t3AK+XvaGYAHOhlrvHndzSMVP4g3jrGCP3JByX0j1MMKPX/nh6zMlEHaHVCmEvFaS21T
 R3YmDjA/J2hOXDll7dcmwwqsgYRPc1LnSaXunenEq+SVC9cq6EfGnXFlOHEcbJIc6vcH
 /7lmaMwaDSshyfNNMGiFHsaloMIDn5qLYc5Rx5ksWNaU8F3fGujnPv89IPgxHgKgtXLu
 oBCQ==
X-Gm-Message-State: AOAM532pHt3qgBDBjmwU3JN3s14Zc6LCxtAeyBSVtfQVnJEFPO3NMonl
 Z3BqgmPUhyPjsobdWPz3Mn9bag==
X-Google-Smtp-Source: ABdhPJxFJIKOj6RpfneFWB//eZ12oKA+Q0wI6It3Ms/9Bkk+MKHxerFLHNbKUh8rG8+aOHrrGwmJ9A==
X-Received: by 2002:a1c:4b14:0:b0:394:2ece:c049 with SMTP id
 y20-20020a1c4b14000000b003942ecec049mr36055344wma.158.1652858638809; 
 Wed, 18 May 2022 00:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:dea9:338d:d500:c574])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020d0b2de858sm1112113wrd.33.2022.05.18.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:23:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Wed, 18 May 2022 09:23:54 +0200
Message-Id: <165285860562.1281822.5287516325245345657.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
References: <20220511054052.51981-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 11 May 2022 09:40:51 +0400, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7381076809586528e2a812a709e2758916318a99

-- 
Neil
