Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962CE83AFB7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AE010F786;
	Wed, 24 Jan 2024 17:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8F810F786
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:25:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso680249f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706117047; x=1706721847; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=84hQubybZvoHS0mUrUXrKWieYpnepVChvkMJ3NXWaC8=;
 b=EFzSrQlfoSmbrS3Wl0bgfCPsA4C9mSGjM7wDkUVpf2ENnk7ZXh0IKj+/DqNEV82ACW
 xmm4xdWAyzzs7NHN98EnnOtS3za5zTpFVQ1+n+cmKTvDsXue4CY91Up/eUANnq0uaV7N
 uWeXHFUbcD7CAlbAV/FjCtr+ExYrr2fMeWzO2y7JZ4U0mj5NMGfuTUiFMMv22jftyEc3
 AH6MOOBVufrO9JSMTyKb9YyxBfZAo3qp7VcuHJXjROt1yWd0dUXtuDZDxbrlV8Mvne1w
 eG1bONh/EEzKA02c3SUvqlFPe3X5UMigCTUt81hOT/VW0XJ1nQ/rJhyUSVp9/QCdSKaI
 ReXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706117047; x=1706721847;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84hQubybZvoHS0mUrUXrKWieYpnepVChvkMJ3NXWaC8=;
 b=Z/tEcF4MLKsC/8humxGium9S1RQ3Io6x46r/YYEfJr7nVC+eDeEeOZVsbZLEWRoDx3
 rcq5Xb3b4kwIPO8sSaXjfO1DpD6vl7woYHVkIX+vTxmJVFvy+CH47fGLZB8F0wPI2Z9a
 U/lVZmL8tNrxm5ZxU1BnNNArwbXaoEpQvMee8cQBR/Ey7u0KP3vrsGaoSkBA64MndKfq
 s+VUWDlX/FYrjeSN0/c0gxc+Cj/dCf/5DuDzMN+O51RvPwSKdKtI5pABzFq7wiBB4D8x
 9qGvek7zeIUAVu0UyV/wOZdq3HcHU+h4AZqBLQEKckKT7fhYjuZQ8k1FDDAAWSHEP0gl
 mjag==
X-Gm-Message-State: AOJu0YyZzpxldgfeOLDdLUET+1B+QMLSIFeoD0Bq4U/CGFhx48+SR3Tg
 4kaJItIuXEI2DsGF3i5aytmccpVGW0he4c5/8GDXK8gPWUi4CMi1qEj5f3aE4Ik=
X-Google-Smtp-Source: AGHT+IGy6q1uZqnQR6FI8b7VYbGDPfXt1pitVJGLsnDj4e3SXBqZHBNvvYPKioX8VWyL3ysKZeRqoQ==
X-Received: by 2002:adf:f4cf:0:b0:337:d6c8:1af5 with SMTP id
 h15-20020adff4cf000000b00337d6c81af5mr735025wrp.53.1706117047102; 
 Wed, 24 Jan 2024 09:24:07 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600010cd00b003392c1f40acsm10493581wrx.28.2024.01.24.09.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:24:06 -0800 (PST)
Date: Wed, 24 Jan 2024 17:24:05 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 3/4] backlight: hx8357: Make use of dev_err_probe()
Message-ID: <20240124172405.GA15881@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114152759.1040563-4-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 05:25:10PM +0200, Andy Shevchenko wrote:
> Simplify the error handling in probe function by switching from
> dev_err() to dev_err_probe().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
