Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89A449B84
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 19:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99768999E;
	Mon,  8 Nov 2021 18:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B58999E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 18:16:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bu18so38357146lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ayfVWyvCKWObtEefpUK8XiDUodN1RBTjoIq7oKL3uI8=;
 b=psSuSdjeBh18x7/UZOLKYBZ050xV58E8myXKgo3MzqnBgaLSlTfDeB/Ih/DhJOKXCK
 JY/VGKOm85LNgvzMOlB/NITTvk00vhg+Zs+EYtYOL8gPxCdC/DqHzeCy59PWmR/5BwS5
 EKQhxhOcmMYxZhAKG7ebJd81iZclDmD6aKsbW/LiR/7faDuaOyUNLO40+1fTUuTWnpIa
 cKACbu7rch+9+KBFhUPBmCS6DMAesFG5gmdZgS/dKgdCMMvaWI2XnvcRDZ5WawOP12Ku
 lVL1daDvmHqKvdDnI4C8a8JA2aRSxZtoxJzRZZrrtZZ1H7QYFRKKDOzai4CsXjdNm/4G
 3/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ayfVWyvCKWObtEefpUK8XiDUodN1RBTjoIq7oKL3uI8=;
 b=fB1THYaNKP3NxKsXRlk6aq/2epFp5qp6SUmaKXjFzWTDGu8eVMClE59UTvT1EiXtWJ
 iAAyFAuys496YUIEYNEDuhPc6PbU2h1XAgaU0kRIrMSTGip1bg5h9lerG8NFaI6RJLoE
 oIF6/ZpRRYlyOQTGdJwfRertJmLYEcKarKIsvNR4pzZhgmmHuuD5inxJg5bDDIru2KzH
 qbTF7GuN1xD0DLzlB30iHNok383m+L2sPGBvVODDc/xFjigP34p65UtpMorsiXI4b3Tj
 VTvIkVNNhsp8pqhcCcmpO/W7w9SoLX+HCHwYBChWcoDyvjAF400vf0pqAMkRqM3vdTys
 62IQ==
X-Gm-Message-State: AOAM533k44ifE7418bVyQU1fdYLU9cGIP7xn3SXaq9EYOkwZPl8T9bTG
 yRgMMqni/CuJ5CZsatZ3tzU=
X-Google-Smtp-Source: ABdhPJyw6zaSueLH/5aKdZcN/z/zoQiQgNJHp6iKp8Ju3dgdqhN1PM6gmF8jtVPvRuuqQbclaHls8g==
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr1106096lfk.517.1636395368730; 
 Mon, 08 Nov 2021 10:16:08 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id g10sm318910lfv.113.2021.11.08.10.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 10:16:08 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Thomas Graichen
 <thomas.graichen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
Date: Mon, 8 Nov 2021 21:16:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYk/jfcceun/Qleq@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

08.11.2021 18:17, Daniel Vetter пишет:
> On Mon, Nov 08, 2021 at 02:08:21AM +0300, Dmitry Osipenko wrote:
>> Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
>> adapter separately from the character device. This fixes broken display
>> panel driver of Acer Chromebook CB5-311 that fails to probe starting with
>> v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
>> is never probed now using the new registration order because tegra-output
>> always fails with -EPROBE_DEFER due to missing display panel that requires
>> DP AUX DDC to be registered first. The offending commit made DDC to be
>> registered after SOR's output, which can't ever happen. Use new helpers
>> to restore the registration order and revive display panel.
> 
> This feels a bit backward, I think the clean solution would be to untangle
> the SOR loading from the panel driver loading, and then only block
> registering the overall drm_device on both drivers having loaded.

Sounds impossible.

1. DRM device can be created only when all components are ready, panel
is one of the components.

2. SOR driver is controlling panel and programs h/w based on panel presence.

3. Panel can't become ready until DP AUX DDC is created.

4. DP AUX DDC can't be created until DRM device is created.

5. Go to 1.

Even if there is an option to somehow rewrite Tegra DRM driver to
accommodate it to the desired driver model, it won't be something
portable to stable kernels.

> This here at least feels like a game of whack-a-mole, if like every driver
> needs its own careful staging of everything.

That is inevitable because each hardware design is individual.
