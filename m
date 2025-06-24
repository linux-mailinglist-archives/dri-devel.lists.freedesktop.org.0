Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72951AE678E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69A310E0A7;
	Tue, 24 Jun 2025 13:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HB8c8NIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01010E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:58:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so5251888f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750773488; x=1751378288;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
 b=HB8c8NIAhcNCF7uCNiYHPMlV8DP4HHJJsQcFOyCLQ4+bGDmfYEOxtY4mmpJdiHvl4W
 1ne7/aByQLgncR8wqHFbiMahLNAHWjRpBNh+FgGrqjoowBAs1F1JVdWMqGye5REzCBiI
 HF5TfIsDgg6QpNIixFp/h0wdO/Yv1LKKSgbfDLBF/dfj4IbtHy25Cy2k1v0R0n4U77Rj
 LsrZE0B/JPfrBegrJWiY5yJs667b/VbSTfgaWnNR42hLUIJEuFgFHPV0LXtgUrADHXIj
 hd1Ym8o6nChqqE0sW7eFVdNCXXHh2VwFr5Wsjo+SVKC4n8kbxpIhUqnH0EPuinC1DWOl
 AEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750773488; x=1751378288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yfdwBnmwXKVxo4fI9YpCbPX/DuxoUKCmsus+7StatJk=;
 b=VXsOjPs+Iuk18+xhcCihPfd8krEGIODG7PJPraImtXJIl9Wv5CH0O5IAXbac+Zxfso
 wOkCC3+NQ1a/c5bRshIli5wph2YdW11c2ASdiXJ5TBS7KZiA+qvsl0GO7Mdn1qcPOu4q
 Dz0HxmXJq/6je5dY56KBB+7mjLFV7Jpq34y/xXe428nZfTOG6LeGbdPE+r6vtWdPf5Y6
 VA8vbGVfYTlJgTBIaQcXqmJf2qC5y6kGdPNDQcZfafEIR4Z8OO8MI5l+LkuCOTXjVXDa
 D0Z0Z1gWht+qQvwLQidz5/1azFsNZV3wFR8tJWj+iNj2MoZoIkc9cOep2Xfpo998O0Ck
 nsxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULu6KETDxbV9z8zqvfXttweHcyyMS7ldSdluvItWjCG1Pxbc+3yV0d+ycKnaJR2ucAmTns/fQkKpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKABxDRrBY0KG+qwf59ZwSaMqH7opaKQNU5XwYuPUyJgG0Phvg
 DQ9NF8hCd38whgY3SnL85BDjUGph5Mvvn+eXvi6RfglWgin+C0kBkceGFkZNts9xlyo=
X-Gm-Gg: ASbGncsb6GapwjrBRx52FJWPyKZMDe0UBZabAp5m10CitIYAS4nwQi25C1yc6WTASty
 IDr9dv4t4sC/oynbVOkWa7SL6Q6t9QPx6nj7XAwUEaEgJ/gsq4F6k8i5yvkQC1GEjiR0HIaB/2n
 uJ/aevC334B0fzmLoKoaihevv0eq6Y8hOL+uvzi8G8x0R5Ld4kPcwVYS2AmtoBwtZKqFc5xb8Bl
 pbOOgPn4T6ajAUsjVgbKrHXy191eeIoPDgkHgXWQ7TEQTteTfBXORTTD2E4SU/UBSkWR/yEeG6m
 +sLI4y9O9fIw8rZi8B5d9uOfU/v61xOclUNoxyZCW6zIOOV27lbCyIkmbp9V/g==
X-Google-Smtp-Source: AGHT+IE2FNywqz+cFb7euMKYbolnteHJlkDlULxTNl06mbXFoTDBF9qk9BsatavRg5P2dnisXCo5bg==
X-Received: by 2002:a05:6000:4109:b0:3a4:f892:de7f with SMTP id
 ffacd0b85a97d-3a6d13071e8mr12590091f8f.36.1750773487721; 
 Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e811724bsm1966761f8f.100.2025.06.24.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 06:58:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/8] Add TH1520 GPU support with power
 sequencing
Date: Tue, 24 Jun 2025 15:58:03 +0200
Message-ID: <175077347940.80530.12388970181360361507.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 13:42:38 +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> [...]

Applied, thanks!

[1/8] power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
      https://git.kernel.org/brgl/linux/c/d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
