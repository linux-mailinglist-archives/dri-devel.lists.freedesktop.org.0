Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08E6BABB6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424910E97E;
	Wed, 15 Mar 2023 09:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2610E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:10:03 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r18so16618608wrx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871402;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7puLWjaNKxxHkmZMPs3rGGP8G3q/ZvxMzkPfypERJM=;
 b=QlRTxYWiisHphqfKIOiHko2c8h2lD9GHUUhG70cOnj5Xa6lnBJOQT7eeX0h9gN/DhP
 CFn29otV1WW/SXeD4ROOefDyzekEc5wPtapJ29wWdikuBvflWWwA+yzcuXIZEtkvr8bi
 VqZTfI5qNLemmpvC6KaV2MCcIjelpnH76T2au0wI+MQaeZj8t79EBYLm7pYbWM/qgLgb
 mp2yNXpkOLJytYHQHuR7jl/jqbghO5KS2mPQFs8m88FS8NgG2HYOEE/OcveXoRNhXFV8
 v+K+oDyhZ+P2xnb21HfL56iFo3z+/f1OONJ8Mr0t1kaP5ppql3MtNaFp2gi0FsJu5D4n
 xBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871402;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7puLWjaNKxxHkmZMPs3rGGP8G3q/ZvxMzkPfypERJM=;
 b=iwqav44dDlBwH3fGgjP5kavINdZwOAJWS5xih7ySGtiZlENam73GEtUpsNxGeqoLNE
 /rtFtAQKFGO4RGWSZFDOTr79iW98Evj0OVFtl33ssPFe0R9/gCWUwrmyvn82pX9RveJ/
 IhrOccsLWqZXFZwNdrEQleEp9F8JHt4aaea/O0/vGUIOb3PiFEwd/D8IlMuGXcMM+N7p
 3inzkaiitWOT55V+n6Pwg7qnPoN0AErXojysuObcqQ9u+I0rNrn1lcM4iOQ2pRqhQ3Ea
 5X2seKMprRPYQfl/pXzortPNCxu+XJKzCnfvWWDovgEDHmJA8dUPZrtRIDmZpWmU7Wdd
 taDQ==
X-Gm-Message-State: AO0yUKXWFbxsKIzleY26Ulx4IRpj9HbrbXJ69EKmXNYn6SSsvjfBl8RS
 fqRL0gBzYKh1cVddo2EfsRnb1w==
X-Google-Smtp-Source: AK7set8n83f5Svzc5S+4zKm6dyc5e2ulRKNeqSJsXmr187cK7f3EWES/FpE2heLi5ar+WKfMU+dzkA==
X-Received: by 2002:a5d:4f91:0:b0:2d0:a74a:2b15 with SMTP id
 d17-20020a5d4f91000000b002d0a74a2b15mr429014wru.37.1678871402112; 
 Wed, 15 Mar 2023 02:10:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d55c2000000b002c53f6c7599sm4017953wrw.29.2023.03.15.02.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:10:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Message-Id: <167887140130.2153628.1837993177267622343.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:10:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 09 Mar 2023 16:24:46 +0100, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() returns -ENODEV if requested
> optional regulator is not present. Adjust code for that, because in the
> 67d0a30128c9 I've incorrectly assumed that it also returns 0 when
> regulator is not present.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion again
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4028cbf867f70a3c599c9b0c9509334c56ed97d7

-- 
Neil

