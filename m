Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA17B58E0A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 07:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E0010E658;
	Tue, 16 Sep 2025 05:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QAJasDui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC210E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 05:46:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45f2c4c3853so9095105e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 22:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758001588; x=1758606388; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hRpDCRaw7BEKyikqEm/KEgdpxjmtpKt/Hv/Bxs3qVwM=;
 b=QAJasDui71IEygAUF9KRn07EC8PtyPb/PpnGjPxqFNCV78u0ZXojO0RUCIPv6iYKok
 NrOA66FWdFdOuA48wtHqI1+CoVdmUIJVCgIleV8xZuRfvCU6OLBP7w9uedce09VD3s3f
 GfQyUOfOpjiH1byiTTBRQlB1iIkHyLEOUl1yVvUx6KnTw97iTd1rMmC6YgIIctuURmqN
 42wV1FzqG3UUZPhGUMLMr1L2zjAUoaGyPeFB4whKWdsA/EXoPIf7UEzDg4kCVm6f25T6
 nm6MUA3qPOMZzOqc88xD5+/00ggTxeRAwu0KV+Ps89z59wU2THxzYORNemPwIAtDqc8n
 AvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758001588; x=1758606388;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hRpDCRaw7BEKyikqEm/KEgdpxjmtpKt/Hv/Bxs3qVwM=;
 b=NgUowdiFFDwJSRLaKwucySBWeO65F1HX8Bgvpmrkllrsn9cFNDzaslZnZ8ABFndn/L
 nPTX6hOYSKMDpWZsYXpCst+Nx344U4Ja3poM9yNKLW7K15E196UwJ4FYJoMixR9xAVIC
 nHtCPEavEtGATNJMuPt+KFePuDT/2l305bXqYDVag8joHncNbTdX95WWHntZVIakMT0X
 k7KI/sc9ck83zz6oigGyF7jbcfzLHNdPwjkP5THMhI68MvxUPbIlzbK7fSkS7Y9OeHzL
 h6a0oSvAGqsRNPY0zJir90hod9NTGPJHv4YP9W0XugdlTwQScZJk2kn8jmpLdvd/IeCO
 GhSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqjyI2NEX60GFMLfdMPzpc1np+lZdBqHdCMYi4BJAS0u/Wdn5TwXHgA3vOe4vcocJsWb+qN/pz1R8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3pumUDFSEkiuO//yjg2Sf1Po4Nv7WvAjXBsqqxHSY3xlC9zqR
 TAIi6mQ8P76/+p67fCQ5Ml3rva+mv/H2q0VQBPf8V/FOReMaLtCAHP2lYKtlSljvmD8=
X-Gm-Gg: ASbGncvNUMROQOqQKTffhU2HUEVYuo8ZUlZNV2BLGKaNlnz4JFYovIctR72N3zR9vGG
 k8WLEWehETua1KmOu65rChgYtTQcprjRG42SWvwpGHB7e2+GQtNV9BF8uV9rA/dHfEUtdLVay2j
 QdWYFYCOQ2X3WA1GSE67n4qy9FVUw0jVd+BzaJfxsx7C/QLCHpuOChwaiQIALCfXM2j3bTfznQ4
 wHlbzT7Re8Kh/Phff168/JzV9IlwW6tQpn7YLsJf9Jr8WucQNjS60Q5Oyj5BrvZdGVDbFek+rn2
 dYXx+JfzCU1QIphWSnc5WnijzvEZj0XtXT00LlXJkt/1mLTgT7LMLVh/4ehL0LGaWgYnIxAubqA
 QnsCBd1f4EfnDxUedHW+LF9ni2K5p9CqziTvBEg==
X-Google-Smtp-Source: AGHT+IEJMjy+qyIk5xqFocYpNMUmqI1onZLmshq/sOyCOw+IB161XWLjgacwRGHQYXdmBTmZ8cwD6Q==
X-Received: by 2002:a05:600c:58d8:b0:45b:868e:7f7f with SMTP id
 5b1f17b1804b1-45f211f856fmr120265875e9.17.1758001588267; 
 Mon, 15 Sep 2025 22:46:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3e95b111b68sm10476481f8f.32.2025.09.15.22.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 22:46:27 -0700 (PDT)
Date: Tue, 16 Sep 2025 08:46:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, John Ripple <john.ripple@keysight.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, blake.vermeer@keysight.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matt_laubhan@keysight.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Message-ID: <202509161344.FPfsjq01-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910183353.2045339-1-john.ripple@keysight.com>
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

Hi John,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250911-023707/John-Ripple/drm-bridge-ti-sn65dsi86-break-probe-dependency-loop/20250820-235209
base:   linus/master
patch link:    https://lore.kernel.org/r/20250910183353.2045339-1-john.ripple%40keysight.com
patch subject: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161344.FPfsjq01-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509161344.FPfsjq01-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi86.c:1385 ti_sn_bridge_interrupt() error: uninitialized symbol 'status'.

vim +/status +1385 drivers/gpu/drm/bridge/ti-sn65dsi86.c

b8670cf7e6a41b John Ripple  2025-09-10  1365  static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
b8670cf7e6a41b John Ripple  2025-09-10  1366  {
b8670cf7e6a41b John Ripple  2025-09-10  1367  	struct ti_sn65dsi86 *pdata = private;
b8670cf7e6a41b John Ripple  2025-09-10  1368  	struct drm_device *dev = pdata->bridge.dev;
b8670cf7e6a41b John Ripple  2025-09-10  1369  	u8 status;
b8670cf7e6a41b John Ripple  2025-09-10  1370  	int ret;
b8670cf7e6a41b John Ripple  2025-09-10  1371  	bool hpd_event = false;
b8670cf7e6a41b John Ripple  2025-09-10  1372  
b8670cf7e6a41b John Ripple  2025-09-10  1373  	mutex_lock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1374  	if (!pdata->hpd_enabled) {
b8670cf7e6a41b John Ripple  2025-09-10  1375  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1376  		return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1377  	}
b8670cf7e6a41b John Ripple  2025-09-10  1378  
b8670cf7e6a41b John Ripple  2025-09-10  1379  	ret = ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
b8670cf7e6a41b John Ripple  2025-09-10  1380  	if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1381  		pr_err("Failed to read IRQ status: %d\n", ret);

status isn't initialized on error.

b8670cf7e6a41b John Ripple  2025-09-10  1382  	else
b8670cf7e6a41b John Ripple  2025-09-10  1383  		hpd_event = status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS);
b8670cf7e6a41b John Ripple  2025-09-10  1384  
b8670cf7e6a41b John Ripple  2025-09-10 @1385  	if (status) {
                                                    ^^^^^^
warning

b8670cf7e6a41b John Ripple  2025-09-10  1386  		drm_dbg(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
b8670cf7e6a41b John Ripple  2025-09-10  1387  		ret = regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
b8670cf7e6a41b John Ripple  2025-09-10  1388  		if (ret)
b8670cf7e6a41b John Ripple  2025-09-10  1389  			pr_err("Failed to clear IRQ status: %d\n", ret);
b8670cf7e6a41b John Ripple  2025-09-10  1390  	} else {
b8670cf7e6a41b John Ripple  2025-09-10  1391  		mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1392  		return IRQ_NONE;
b8670cf7e6a41b John Ripple  2025-09-10  1393  	}
b8670cf7e6a41b John Ripple  2025-09-10  1394  
b8670cf7e6a41b John Ripple  2025-09-10  1395  	/* Only send the HPD event if we are bound with a device. */
b8670cf7e6a41b John Ripple  2025-09-10  1396  	if (dev && hpd_event)
b8670cf7e6a41b John Ripple  2025-09-10  1397  		drm_kms_helper_hotplug_event(dev);
b8670cf7e6a41b John Ripple  2025-09-10  1398  	mutex_unlock(&pdata->hpd_mutex);
b8670cf7e6a41b John Ripple  2025-09-10  1399  
b8670cf7e6a41b John Ripple  2025-09-10  1400  	return IRQ_HANDLED;
b8670cf7e6a41b John Ripple  2025-09-10  1401  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

