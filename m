Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF886CC83
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5DC10E476;
	Thu, 29 Feb 2024 15:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDBCBSfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405DA10E158
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 14:12:48 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5a0e45f34c9so366610eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709215967; x=1709820767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/6cP9W2AgQHJN8YU3o1XUoIxNAqqR6eg938KJPNmEGw=;
 b=UDBCBSfsvWKjNOv7GwVmwMVZl6Iw3/HZQNRgpP6Xn1ILn1ZHsdVDi0GVoDYYpaTxpK
 w03hlfL4nvvXtaSVl42eHqy8IjF1h+o8jpgNgeOfY3SSObWpUfQBAyzbkfvdSdVa2dhT
 gWB5lXTwsnsxKErKFS/G9kKTyeRidKGoS+J/OmFQ51mgwnkUUSJRfFNkLxWFLeECoqPu
 JkZPm1BKIbmTVOpBstzAqC9MSSdX0cgUrmRgwB5gWyEEdtK1h25qlaW+r2rJxmNfoVX6
 qsi3ibduFDATHjHk2IptZj9VMP/fmaOZesVHfalQcy29exgEXY3HCaWwYkCcEIhWbgWe
 t78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709215967; x=1709820767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/6cP9W2AgQHJN8YU3o1XUoIxNAqqR6eg938KJPNmEGw=;
 b=fi7OkCkzP+wUL5b0qFbQH9tzKWOCQd5Z8FycPmgxy3DlQd5Efp6bhfyZj0DJqhZocl
 Yg/L+JQ8Z+Vj+cLHaWObj4qS5JuBRgssoeMB99c3UnCfzsGS/QOcXa2RTrvfPXklmcnQ
 4ynUEwv9GY72egPsBcXBeH6PPFvyVf6gBvKfkYdNbpvr+zUhLjFbn+Jm5XT80febMeES
 QsWbWuLt2pII6z3uMcvlB8nyPuVQuVFnT1+9Uv43M96bxnaoEANsxTvI6WAx5WChEFn9
 Xc/pRNNbSt2C/O4G++aRyO+MIOrFLljIMqtLNbHeJk1sqKGrqKrZBPYi5SdqH63tXubp
 peYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWysHqfiNyA+dzmWGSQ6Q4tEyhzWO+lHwIiJMPVHArmb7XxyEGr74GLTnusWMSdJOzdWZiQ2A/eVfm05b7uqfPSSpj1eRiy6G2yd5DfupSA
X-Gm-Message-State: AOJu0YzmGJGbFz6CFjtmqqj5atnOgoLj4ZbfuR4qF3fF3Gjfg1XQDd/a
 cghF+oXtI+Xyr0ExMT/6eZHw3gg7XXgbasXdmnTaj9/qHEGeybeQ
X-Google-Smtp-Source: AGHT+IGoMVeonTVGpUMbSC6NyXoI8L+u+UnR4N1COBsmWbb1vlDZFi37tyMwzHjqwQeUiotKpDL52A==
X-Received: by 2002:a05:6358:428e:b0:17b:9e19:4fb9 with SMTP id
 s14-20020a056358428e00b0017b9e194fb9mr3273356rwc.22.1709215966734; 
 Thu, 29 Feb 2024 06:12:46 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05620a13f400b00788033be0f6sm136142qkl.58.2024.02.29.06.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:12:46 -0800 (PST)
Message-ID: <f9a3d871-dd51-453b-b510-d076ecf0fabd@gmail.com>
Date: Thu, 29 Feb 2024 16:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Guillaume Tucker <gtucker@gtucker.io>
Cc: Mark Brown <broonie@kernel.org>, Helen Koike <helen.koike@collabora.com>, 
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
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
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
 <20240229111919.GF30889@pendragon.ideasonboard.com>
 <a4fc23e1-5689-4f86-beb7-5b63a0d13359@sirena.org.uk>
 <b3fb89aa-56b4-4b3c-88f6-c6320bf5c489@gtucker.io>
 <20240229122040.GG30889@pendragon.ideasonboard.com>
 <20240229122503.GH30889@pendragon.ideasonboard.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240229122503.GH30889@pendragon.ideasonboard.com>
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

On 2/29/24 2:25 PM, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 02:20:41PM +0200, Laurent Pinchart wrote:
>> On Thu, Feb 29, 2024 at 12:53:38PM +0100, Guillaume Tucker wrote:
>>> On 29/02/2024 12:41, Mark Brown wrote:
>>>> On Thu, Feb 29, 2024 at 01:19:19PM +0200, Laurent Pinchart wrote:
>>>>> On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:
>>>>
>>>>>> Of course. You're also welcome to join the #kernelci channel on libera.chat.
>>>>
>>>>> Isn't that a bit pointless if it's no the main IM channel ?
>>>>
>>>> It *was* the original channel and still gets some usage (mostly started
>>>> by me admittedly since I've never joined slack for a bunch of reasons
>>>> that make it hassle), IIRC the Slack was started because there were some
>>>> interns who had trouble figuring out IRC and intermittent connectivity
>>>> but people seem to have migrated.
>>>
>>> In fact it was initially created for the members of the Linux
>>> Foundation project only, which is why registration is moderated
>>> for emails that don't have a domain linked to a member (BTW not
>>> any Google account will just work e.g. @gmail.com is moderated,
>>> only @google.com for Google employees isn't).
>>>
>>> And yes IRC is the "least common denominator" chat platform.
>>> Maybe having a bridge between the main Slack channel and IRC
>>> would help.
>>
>> If the gitlab CI pipeline proposal wants to be considered for inclusion
>> in the kernel, I think it needs to switch to a free software solution
>> for its *main* communication channels.
> 
> And to clarify, I didn't meant the kernel CI project, but only the
> gitlab CI pipeline for the Linux kernel project. I don't know how
> tightly integrated the two projects are though.

They're not tightly integrated so far. However, we're exploring the idea of 
letting GitLab CI submit jobs to KernelCI and get results as a part of the 
pipeline.

Helen already joined the #kernelci channel, and we will maintain a presence 
there for the GitLab CI project.

Nick
