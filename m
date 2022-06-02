Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293753B16C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 04:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0195F10E4F5;
	Thu,  2 Jun 2022 02:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1810E2A8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 02:05:28 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id e11so3514667pfj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=URF0KJqcnQJdafYkmvxoqi27tjApzf9mIKrv77oxeQo=;
 b=HWmRbjlLQ1At9RTtfbPnIPFy0hNqycG0lZrF5Ak3Q8KUkiDskbb/KLuehLJU5avohJ
 2p/OABhcbIbLJdV+CMAiuBhLA+Ch9qTwHloA0p6mTIibuELCUQ52Xl3ZSaljSTWuELY6
 dmp+zoDPUJLlPQJyp4fIjWHBwIBIDClveK8BJpCnO/Op4Vt7jQ8Qh2Nz6Pxc6/CWUXmC
 4pzg3qbAyFSzi7oINSo85H8buI8nAH47PBAtoJdGbsqzs670sJJAy0c3pOmtIgVtd/yy
 7upHoZiA8/RsTkTLvpXPQzEmdK8+8LzVX2yPaTdv2pc1quLQ9/Ff4seFydguwHsam9fn
 qjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=URF0KJqcnQJdafYkmvxoqi27tjApzf9mIKrv77oxeQo=;
 b=TGL6Gdw3gmkHPzAU0uXOAkxcIZr8iGsrRSfamkX9pjozOPcbRSYVrkY8zsB5wWoeGZ
 RHLgKNfEjnK9k7ymA0mhVkG/k+EBp1Q7u9UYl45q0GK8wdRdVfNcqFy2LHb3Zv6BEptk
 BCZXAUmq0/XUF4wI0WR6AUzJTEFOtmUhkkquhtum0oU4H+bPs2HUid7z3+90rrNs73D/
 NEVIstWr4GjUahCzJA6eVcIxOUssi2/W1p64UCpUQvI7J8H9o6rdj8irc2vn2HzxTmKN
 H+CS5zT7UFKluexCipszcqerNbqKNriCyoTc0dHDspQHql3ni+wtshg8iioQMr9fcAlA
 gSxA==
X-Gm-Message-State: AOAM531LkQt+4iwQWaAPt2AlAo3r4UH9Cl7t9G2WscFP0CtwGtCm6DbR
 r4DzL+erjvcH3V/jbQGmJ9wAgfBY6skodYjn
X-Google-Smtp-Source: ABdhPJwQEE3C13gQMFEFQ5DJFjmLka2jZUHIOR9JwKjObBQkkgDiO/DDLTm3pxoQH3/DS7QZ8dty2g==
X-Received: by 2002:a63:104a:0:b0:3fa:d1ea:54d7 with SMTP id
 10-20020a63104a000000b003fad1ea54d7mr2081134pgq.124.1654135528265; 
 Wed, 01 Jun 2022 19:05:28 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.146.177])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a17090a740c00b001e2b19e6cfesm4613629pjg.12.2022.06.01.19.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 19:05:27 -0700 (PDT)
Message-ID: <59ea53d6-2856-fedd-3a5e-6ad5bdcd4a20@gmail.com>
Date: Thu, 2 Jun 2022 10:05:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220601122050.1822-1-linmq006@gmail.com>
 <YpdpCWW9+igsVydr@phenom.ffwll.local>
 <55d99105-8492-e020-bed6-82e52b5fc8a1@gmail.com> <Ypd76wmrBsIgeE3O@orome>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <Ypd76wmrBsIgeE3O@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thierry

On 2022/6/1 22:47, Thierry Reding wrote:
> On Wed, Jun 01, 2022 at 09:55:02PM +0800, Miaoqian Lin wrote:
>> Hi, Daniel
>>
>> On 2022/6/1 21:26, Daniel Vetter wrote:
>>> On Wed, Jun 01, 2022 at 04:20:50PM +0400, Miaoqian Lin wrote:
>>>> The pm_runtime_enable will increase power disable depth.
>>>> If the probe fails, we should use pm_runtime_disable() to balance
>>>> pm_runtime_enable().
>>>> Also call disable function in remove function.
>>>>
>>>> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
>>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>>> ---
>>>> Changes in v3:
>>>> - call pm_runtime_disable() in v3d_platform_drm_remove
>>>> - update commit message
>>>>
>>>> Changes in v2
>>>> - put pm_runtime_disable before dma_free_wc
>>>> - rename dma_free to pm_disable
>>>>
>>>> v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
>>>> v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com
>>> Maybe a bit late since we're at v3 already, but are there no devm_
>>> functions here that would dtrt automatically? 
>> Sorry I don't see one, or we can use devm_add_action_or_reset() to add handling
>>
>> action. something like disp_cc_sm8250_probe() in drivers/clk/qcom/dispcc-sm8250.c
>>
>> How do you think?
> Looks like there's a devm_pm_runtime_enable() helper that does exactly
> that. See commit b3636a3a2c51 ("PM: runtime: add devm_pm_runtime_enable
> helper"). I haven't seen any large janitorial series yet for that, so
> perhaps it's just not widely known yet.

Great, very helpful. Thanks for your kind reminder.

> Thierry
