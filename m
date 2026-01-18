Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF79D39818
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 17:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353610E1E7;
	Sun, 18 Jan 2026 16:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FvgeImeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4710E1E7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 16:48:13 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a0bae9aca3so23748155ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768754893; x=1769359693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X0twtbtNGNQIp4HwkKCyjxkTPom6wsw2QrSPQrsy5co=;
 b=FvgeImeEsz2oEwUn0U3VrYWJ/86KMVPZp1OBFWcq4U8pY3A3B+Iap3xOLNrCtCFxLf
 VgvzObwZUu0W6FQa/Q/iP8/BRUzoHxu3philqH1FO+DhmsU+zVkPY9DQFdLjt8bwuQAe
 yfoLEkzQzadi6oXir7P/52yJkuJfMNRcu3suqwepanlMZCWMqFZqju5yTDCb5gawbmIz
 yqjFjakRyiYEsJq2t6tvceYynzusH4qcN6p1waUm+NRDzsgLMrPBKSesozghYLL4kGCO
 n9yL+qLCA9Yubnr7p/QEgeeFMA1w6lNLwP3zoTrBheysrqDQKNdOq+y7bbrjAWNZyUOi
 Xc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768754893; x=1769359693;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X0twtbtNGNQIp4HwkKCyjxkTPom6wsw2QrSPQrsy5co=;
 b=T1nPjBkGLTmFBz63fMupIyAD0Ve2QKufdyibhoh/P7X8UJ2msWWzcjBrj/rAiptc/6
 4nGe3FblYvwPxT4Dk7x+tuZo0DXO+9MjYqawyQyQeHWVbpVCRfpG1dVNr4c6/7gV3Zt+
 9J80yjc4VmBC+dyZqbkRc3OfjjFT2fyfJMnnembSRqX0g3W3kr09M5u3Jciqu+eX+EAb
 NrXz8dJtmNMGrUAE3suaRP4JdW93NA/HJKh+d0fLV2YzeXljiVFxJpfYtJSWd/1jz0YY
 HrSJEdqXKhwKp6Lt9XNhxd0hOBh1G77LMZuUnwxC5cNGyxzHxKKGyMnKnjo3IZLh8GId
 s1pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZyCKgHywJgZmWV3XnIGPTjHj4mPmwgREQndVxnISchl+DBdVALMRW0YvbS4gBRc3GjkQVi+nVvSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUkT+W5y6j/sS3kqbGCrfptSZXSxnwj/zwrvDPP8i3mkaTyokP
 SB4Hk5AGZi5TK9kvgI19wBpOXIjGc3oinRHF/L/bxSNJLNf9tE1aiiLX
X-Gm-Gg: AY/fxX6V7417qwhVl8ojb+YbId5A3tSYYBJd6CSO6ed++iMeSEb5d3+iZOZzC0dSowo
 VVPOOf6zQUZK5P3HTGDkEdRSojW6f3PAzbZeNW5svkT3UZTMp9K+Wx7FZGUq2dxurwzMKSuz0uO
 srRQO13LF4GbqPFK5PW3bg81oDJ/tWm0KntmaZrsUuuezZFZTSug+xPZrbPY/rGjMHgKT17B80L
 DfbwJYKx6f7FRaXcqfrABLUtXeKVTQkZxvWPi7acCzcXV7WuXKDJcK1SYCe0wErxrLZV/MdZA9P
 tUAcdhnjEze8OUpH90afpYOVL3oG2/C+WlpxVDf8/2bHUcJRh3LrYioA4Xg+X4lOH2LCJISg72s
 ksv6d6ePcF+JWLc3upvcvhukHRDG4Y1XtCx2+7etoH2CFXJ37+CIbntwguaUlxzEQS6O36IAKdd
 iwa1MqbnmqEcDIAl3AAsnoHOZXU5gjYd9jFNE=
X-Received: by 2002:a17:903:124d:b0:29e:76b8:41e5 with SMTP id
 d9443c01a7336-2a7175be718mr92063215ad.30.1768754892810; 
 Sun, 18 Jan 2026 08:48:12 -0800 (PST)
Received: from [192.168.31.239] ([167.103.54.94])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dbbf5sm70904105ad.47.2026.01.18.08.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 08:48:12 -0800 (PST)
Message-ID: <95a49665-f379-48a7-a2b5-d288cdfdc0a8@gmail.com>
Date: Sun, 18 Jan 2026 22:18:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan> <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
 <aWe7_hFpmO0E2sJe@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aWe7_hFpmO0E2sJe@aspen.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14-01-2026 21:23, Daniel Thompson wrote:
> On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 05-01-2026 15:25, Daniel Thompson wrote:
>>> On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
>>>> Update the gpio-backlight binding to support configurations that require
>>>> more than one GPIO for enabling/disabling the backlight.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> index 584030b6b0b9..1483ce4a3480 100644
>>>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>>> @@ -17,7 +17,8 @@ properties:
>>>>
>>>>    gpios:
>>>>      description: The gpio that is used for enabling/disabling the backlight.
>>>> -    maxItems: 1
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>
>>> Why 2?
>>>
>>
>> In the current design, the LVDS panel has a single backlight that
>> is controlled by two GPIOs. Initially, It described as two separate
>> backlight devices using the same gpio-backlight driver, since the
>> existing driver supports only one GPIO per instance.
>>
>> So the maintainer suggested to extend the gpio-backlight driver
>> and bindings to support multiple GPIOs.
>> https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/
> 
> Right. So, once we support multiple GPIOs then why limit it to 2?
> 

Okay, got the point. I'm removing the maxItems constraint entirely 
to allow any number of GPIOs as below:

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 1483ce4a3480..82698519daff 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -16,9 +16,11 @@ properties:
     const: gpio-backlight

   gpios:
-    description: The gpio that is used for enabling/disabling the backlight.
+    description: |
+      The gpio that is used for enabling/disabling the backlight.
+      Multiple GPIOs can be specified for panels that require several
+      enable signals.
     minItems: 1
-    maxItems: 2

   default-on:
     description: enable the backlight at boot.

Does this approach work for you?
> 
> Daniel.

