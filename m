Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56B86CC87
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE8210E49C;
	Thu, 29 Feb 2024 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lUwFmXuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A136E10E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:26:55 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so7735851fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709198813; x=1709803613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MUGoQKrYI+CUGIzYiMWNWVHuIqGWUhSm1DPKxOOJHWY=;
 b=lUwFmXuzxwxye6fNMUNPpeyrsDOhzzG2cTE2HHbanDxX9t5LsEqZ1iBii/w3/+z+kn
 iPadQSL/fxTn5xn4j+fIjzFYPW2oWqmLmjBzOkI7o6P9/jmFRU1Zva+NW+8RGL5AFopx
 SKbbGxxhOWUlnwPrF1YWo4JZuz8tHl84oZ5u8JtyYh5/ikhJk89vlnaonR2ZZl8mAUWA
 FG2DR5JEGk+/yu4M1nHhilxdDx9SBB4De+a+U8+V7nIXFT6b06oFTqsobyrQtmtrTe/4
 fO0yMZAXEzZH188awUbRcbJOXyCsIqIylWuODi1dLwyz5BHIkZWWTpkyt1+4kHdNGLty
 Scrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709198813; x=1709803613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUGoQKrYI+CUGIzYiMWNWVHuIqGWUhSm1DPKxOOJHWY=;
 b=OJea1d5EwSZ0GuogycA+c4q+26sYLirANNb+LL42n/lbS+ZNiy099XJxiEQgArj9LO
 MR3gNrFmsrROsCWENjdlwDbx53qedLIRKA08lQ3LulqzO56RgUsO2YxavgjWIuA3jpIp
 kDev1iH6ut9jG3nF9qop2poNX2twn41KxOGnJEWEktImLPHWQmEaK3D+2gBIg3n9Cc7l
 foEG3ovMRtVNiL61UYKoN7jA+Vft/3nIu4JSa9gVCpAuzVhPnWt1avK/tSmRAQkuO2ax
 Qv0y9TaD349JA6MiDL28MUMwyMOTxdf1j7NMM7uNHwujXnlDlfmC65Z4SgHz4yQcS3I0
 E2wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZiVg+cj43I02TwL69NbZm1V7wqC8Lg4JW2cw2b7evSksBLsgjbF/iU6ORIb/cFfWd8qRUHKf67P8rCSESOXmlt9TbBw3liWsZtXcxqrjs
X-Gm-Message-State: AOJu0YxYSvBGZIahL6PmESBmlA2lB0Uv0j/QHJG+18tunVKBSUbvSeEN
 6UTY3fNpbjP0mmTZ4i9rIkqyk7g136loNuLDe9KAhv6mENlyCLg1
X-Google-Smtp-Source: AGHT+IEQQGvEUUUJJE0Q32Q1dWpicjPYOMb4ktp8tTjoWEWQsJczQ+GYRu123pV36LqzQ6iLRlTmxA==
X-Received: by 2002:a2e:9496:0:b0:2d2:e704:77a8 with SMTP id
 c22-20020a2e9496000000b002d2e70477a8mr987605ljh.3.1709198813316; 
 Thu, 29 Feb 2024 01:26:53 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 v2-20020a2e9902000000b002d0f905ddf9sm151234lji.18.2024.02.29.01.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:26:53 -0800 (PST)
Message-ID: <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
Date: Thu, 29 Feb 2024 11:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Helen Koike <helen.koike@collabora.com>
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240228230725.GF1659@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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

On 2/29/24 01:07, Laurent Pinchart wrote:
> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
>> **Join Our Slack Channel:**
>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>> Feel free to join and contribute to the conversation. The KernelCI team has
>> weekly calls where we also discuss the GitLab-CI pipeline.
> 
> Could we communicate using free software please ? Furthermore, it's not
> possible to create an account on that slack instance unless you have an
> e-mail address affiliated with a small number of companies
> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> for me.

Yes, it's not ideal that we use closed-source software for communication, but 
FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with 
a Google account, I'd be able to see and approve your attempt too.

Otherwise, our video meetings are generally open to everyone and run in Jitsi.

Nick
