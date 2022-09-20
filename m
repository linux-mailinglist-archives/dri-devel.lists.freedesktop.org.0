Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A695BE1C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1A510E15D;
	Tue, 20 Sep 2022 09:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AD210E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:21:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c11so3178442wrp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vNQe2GtbiEbNlyf2XnFRT7jFM6dqwBbNb6DV8g2UnnE=;
 b=D7/EMxpeYN6SPsHGRc8F2hFpJxBQAg/IykN2uBhVB9perr+IAjGrXbGSmKU7FZGEcO
 axEyuJbqExONBLYsx6gqpk8nor4dbJ5Ti755Ggse1oe+G53iFq99Y0guwdkNjN/zmOFN
 81N1UdkZ6lnTvQBhluQOHrVifo1i4K5CUZgfsKeh3Jg5bN+f47dBkYGvOANDUcXYMysM
 4xVlvnY+VXxFqG9UNzDTPalIUP3YyfsJFuqivvGP1scON1OmkCulgfhk57l3FzotXePv
 4mRsRBEyB1LOGPSqNOEDDpf4IS7qRQNTViuJrFvLqxxXzIh/KPvaQWNBrI5Mr6pKteim
 Fo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vNQe2GtbiEbNlyf2XnFRT7jFM6dqwBbNb6DV8g2UnnE=;
 b=vS9n05MSQ6Om/+MGOAxjxDrmKor9SlkS7TeSEUVuIvQDuyNiJCIGF12Q4y4b7jcWtb
 Dz4ygR5OWhFwe4/VffOa2VfqqTbHPV6zE2J0m6n9kGHykppcK1cuwfUl0lo0Z82IzoIc
 +rzLyYmYWXclIUpw89V021fD19ei0GbwAb3Dg1GYo54eVIbHYwqZECH5tXhoaYKC8X7a
 +T6SjcjAv/pbQd0+IzLQ7sFkY0XkraM9er79a4js/I0zKzwhsTvcbIR9y/WbF4PpVEzI
 wfwl+Zh9cpVx/E6nEaLJDi1T1jf0N+OQQOhDM9IVNib/zvI+VvvS0Y+m9hTq0tR7etlA
 R8Tw==
X-Gm-Message-State: ACrzQf3/bNF/z4gVDKpRdNv3/mtuWxlWB6dn9GnPstIg3CwE8SeWu3NA
 VYpDBVlLOS2CQ87v1PeSydzvpw==
X-Google-Smtp-Source: AMsMyM4gXAKw4BsWYZM4GahwvUJElzZY87R7sO9Q/AEA/+PDUm7seHM2obUaC4y0w0grBuuBguRA7g==
X-Received: by 2002:adf:d1ec:0:b0:228:d9ea:cbd2 with SMTP id
 g12-20020adfd1ec000000b00228d9eacbd2mr13347043wrd.609.1663665658829; 
 Tue, 20 Sep 2022 02:20:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b0022a297950cesm1063507wrt.23.2022.09.20.02.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 02:20:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: cgel.zte@gmail.com,
	andrzej.hajda@intel.com
Subject: Re: [PATCH] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more
 robust and safer
Date: Tue, 20 Sep 2022 09:20:56 +0000
Message-Id: <166366564178.3256514.17123212725949451194.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919030401.211331-1-chi.minghao@zte.com.cn>
References: <20220919030401.211331-1-chi.minghao@zte.com.cn>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 19 Sep 2022 03:04:01 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> The implementation of strscpy() is more robust and safer.
> 
> That's now the recommended way to copy NUL terminated strings.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge/dw-hdmi-ahb-audio: use strscpy() is more robust and safer
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=110ae8a21bbe779a133c1672a1463105c9d50590

-- 
Neil
