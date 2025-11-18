Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD6C6AB85
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 17:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206710E053;
	Tue, 18 Nov 2025 16:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="e/HzbwCE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GHkfuahz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D44B10E053
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:47:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d9rBq4PNXz9tkc;
 Tue, 18 Nov 2025 17:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763484467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RvB2sl0Ug/r6GqiA0V1FoFIi23iiOpJYn0tCLClgME=;
 b=e/HzbwCE7BIgVHn08e7bvHanK21uBWNQgaOjFK27nX1M0YEP19nbL6v8XyCCWbSeYKs5yh
 bS5VanqMxuXJSYHbAWGqpyF0XZN9AvfpV4DEIutEqVzYL82h9pAFtu26+U0Ra/5OiMQ6yG
 2X+yjO8UdX/lRz3JK2yZ0wfUoUndjdxKCt8qF6f9EsxsVGBhjTPt6fEmPzg5MbJlL5V40g
 nnD8rt9p7kU3I/yl5hKFqqrSv4NUCZAeh6UdvTOWVcijs1KcLMqv4DOjfSBpP/t3ZSlnax
 9rxLFsJKuq4rjyWWG3oGFGyiinhLNSahPOdS7jiJCvNji4Uz9iYbQfdvACsS5A==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GHkfuahz;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <126de82c-b301-4785-8ad8-7e6d018ce12f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763484465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RvB2sl0Ug/r6GqiA0V1FoFIi23iiOpJYn0tCLClgME=;
 b=GHkfuahzDtKGo4kXOZABA52/mtLZvbkl5cGD1CHr9tBNuuc+33/L11vyQbQos5nVN4bbot
 qAy27xpda1SRPmIX7FTj5GhY4BuQLs8bHTm2F1y9Xii9TZkTyhMigtcs/HaafiOSpS5oF6
 9Hs0NjlZEgwGdmNO/kF3hnVE4FtVrkhACE1iZKwmmM36Rl5iFLgRK441/UccIhxxIg56yC
 UnPmZYtY595Qd+1a45eEzO2U6ibbDuzxIpjZqHcWeTemm9X9vOj9hijEn9/5BpQniuC0Fq
 4aiLLcaPvAIo8guVIlVdsCvdDObnKlD5i7mQ13QvP5644c46AbNUnsov17URsg==
Date: Tue, 18 Nov 2025 17:47:40 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Stefan Hansson
 <newbyte@postmarketos.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
 <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
 <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
 <CACRpkdbtySSfCiV-6Dqy--D+J0vcnyvcFiASLYGauNHSK9TCjw@mail.gmail.com>
 <8256d054-a946-4aff-9953-03b29a4d01c5@ideasonboard.com>
 <CACRpkdaCyqESKyhfmBpnnto8MTFLVLfZxv496Kgy7KpW_rRXLA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CACRpkdaCyqESKyhfmBpnnto8MTFLVLfZxv496Kgy7KpW_rRXLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: db8b95a2dbe5c550cc6
X-MBO-RS-META: m8af5g94w57ttga3uzjscw7aisfsdkyk
X-Rspamd-Queue-Id: 4d9rBq4PNXz9tkc
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

On 11/18/25 3:31 PM, Linus Walleij wrote:
> On Tue, Nov 18, 2025 at 2:54 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> The questions I have:
>>
>> - Should we 1) keep the current upstream sequence as default, and
>> specific drivers can opt to use new helpers that make sure the crtc is
>> enabled early (like your patch), or 2) revert the sequence changes from
>> Aradhya, restoring the crtc-enabled-first style, and add new helpers
>> that handle the sequence in the new way, as it is currently in upstream.
> 
> I'm opting toward (1) given that:
> 
> - The new sequence order is natural, a sensible default
> 
> - Only mine and Mareks systems appear to be affected despite the
>    patch has been upstream for a while.
I might have had a revert in tree for a while, revert which I forgot 
about, sorry.
