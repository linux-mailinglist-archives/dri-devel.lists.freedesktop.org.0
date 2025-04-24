Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBCA99EA1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224B10E137;
	Thu, 24 Apr 2025 02:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F0ZKoJFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4097310E137;
 Thu, 24 Apr 2025 02:07:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2295d78b433so5100615ad.2; 
 Wed, 23 Apr 2025 19:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745460431; x=1746065231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQNbrZUbkkakbD9h0kzAkS4WI87+xA7QvTn2xWNikNQ=;
 b=F0ZKoJFZlVZbJV6yHDd3EKZa9JNE6ak54Ye/yQfrgfHf9yMrR6dXqdsqP3szqhVVxl
 Vhd9awjImgQsT2+lJyKRrfers4IGPn6DsnycNHqzAckWjhHdQuP4TiiEJGeHOlG6TN93
 Ui0M0f7Zom5DylGbrn3Ck4LkWlgGaXReCgRqpGxonRLXSdopQq+0FmUEzxWe+9CDkxV9
 bbIHS9NPoS80AOU0YT7vVrCCG+nrAqj/DyCJeggHGITUpngIG17Mb38VludDXw6jEHqh
 tdsupd1LYBrczwi/5ENGLEQGwFT/3sGohM0upFX0hYxHOU3G92cyzNJeF7ITvqXqebiJ
 NdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745460431; x=1746065231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQNbrZUbkkakbD9h0kzAkS4WI87+xA7QvTn2xWNikNQ=;
 b=gdp/ctlteVO/+QsAQz1jBdBkrja0K44A25OxRtzhrSMOR4kHxkYQ6X/qYw0dXhVMX6
 lHBqmKUoDuOx6nGwhZHjlnscyGSI+zRgu/SNF/HF2H7o3oijQ0+LxnBg7VlvSExPzhM0
 wxGJfB1D/DON6El2bNY0wAyVyelJCkbrbczLzOwm3zYSCfe7ODdf4QkWq9UVRRE0I+IS
 SxmwMkoayZgvjkk4q+8u/GUJnrn8a5JEZHY44HTuylvi5vcupf+d8ybrPCPfksHJ87Dl
 ftJvOwHf4ElXb1fcTkdD2kNJh4e48pinR8B5RQtb5++n+z7VPSeq/9nVtQ9XerJ4o+Om
 hCSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5+iRZ3dy4sRKOau1jiGrUBM5ijiVLpQ8lxS2BS8rH3NIqGpp8O9tLtoHeQY7r7hT+nqqRfrS/Ph8u@lists.freedesktop.org,
 AJvYcCXhCb4po/SOqD7g3ILavSZDYUNrW6wpOvYZArblODAyXc49zFzUxkQslXP70BOWBB4OTfCgfB3BXDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS1HtvCUbUIRuyBfHcqg1bfYSZVlyyEYlToT4WG0ndWInaxaie
 ALGeeVGGrlWZU6UA/fPCu5S/vlaoz4rLqJvvAhk6uLbaSFLMJsge
X-Gm-Gg: ASbGncuwpiIfReWaEB2aVD6wGdHSDCPLeicmNCPMHjfC+6qyi5MGeQLyXpq9Ozz2dyj
 EYWiYWpD6Kfai7g18F+9yeYumE6jKIxxRhzh4EQNS73uDnGwgxHAIyEh1A+E8jLUoBFoAd7PrY0
 Pni+8NyMm6dOGFnsX8OLEZfuqunotfTzW5h+VFEUmSJbzK11wad0tw4ELRV4/Pi7ntq835cXKEh
 Bi6E1FhOrwB3XQFShhRxJAKHhUYH5kINoonLw3uCKsq7+RYOZRedKPmwKwDzA5mKg6YPxXgbAQs
 /JQiKUftE5jYFL88JHFR64fF10wdtVvxFbcfU2AFUs4Br1pqgVG/4zgrmhinI/fZvQTY396M3ry
 slH4Hzt0qV+A=
X-Google-Smtp-Source: AGHT+IFick/RvCWrsUpCfBaatj0rWffF+kCXlQbfG2Ln6b4jn4SMp+K32TykDwB6VaXqRnxR49uiTQ==
X-Received: by 2002:a17:902:d4c2:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-22db3c0e5d8mr12065925ad.25.1745460430909; 
 Wed, 23 Apr 2025 19:07:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db5102548sm1589505ad.168.2025.04.23.19.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 19:07:10 -0700 (PDT)
Message-ID: <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
Date: Thu, 24 Apr 2025 11:07:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
 <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
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

On Wed, 23 Apr 2025 19:31:36 +0300, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:
>> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
>>> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
> 
> [...]
> 
>>>>> Would it be possible to properly support O= and create pyc / pycache
>>>>> inside the object/output dir?
>>>>
>>>> I have to confess, I've been wondering if we should be treating the .pyc
>>>> files like we treat .o files or other intermediate products.  Rather
>>>> than trying to avoid their creation entirely, perhaps we should just be
>>>> sure they end up in the right place and are properly cleaned up...?
>>>>
>>>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
>>>> should do the trick?
>>>
>>> It's not so easy. The Python is written in a way that it thinks it will never
>>> runs object files separately from the source. Hence that variable sets only
>>> the folder per script as _home_ for the cache. It's completely unusable. They
>>> took it wrong. It still can be _painfully_ used, but it will make Makefiles
>>> uglier.
>>
>> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
>>
>> For example, try:
>>
>>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
>>
>> Wouldn't it be good enough for you?
> 
> Of course not. We have _many_ scripts in python in kernel and having a cache
> there for _all_ of them is simply WRONG. You never know what clashes can be
> there with two complicated enough scripts which may have same module names,
> etc.
> 

Interesting...

I'm suspecting you replied without having tried the setting...

FYI, this is an excerpt from list of .pyc files under __pycache__ after
building defconfig kernel and "make htmldocs"; and running

$ find . -name *.pyc" -print" under ~/.cache/__pycache__
---------------------------------------------------------------------
./home/.../git/linux/scripts/lib/kdoc/kdoc_files.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_parser.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_re.cpython-312.pyc
./home/.../git/linux/scripts/lib/kdoc/kdoc_output.cpython-312.pyc
[...]
./usr/lib/python3.12/xml/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/parsers/expat.cpython-312.pyc
./usr/lib/python3.12/xml/parsers/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/etree/ElementPath.cpython-312.pyc
./usr/lib/python3.12/xml/etree/__init__.cpython-312.pyc
./usr/lib/python3.12/xml/etree/cElementTree.cpython-312.pyc
./usr/lib/python3.12/xml/etree/ElementTree.cpython-312.pyc
./usr/lib/python3.12/mimetypes.cpython-312.pyc
[...]
./usr/lib/python3/dist-packages/sphinx/deprecation.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/highlighting.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/ast.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/__init__.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/pycode/parser.cpython-312.pyc
./usr/lib/python3/dist-packages/sphinx/config.cpython-312.pyc
[...]
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/deprecation.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/highlighting.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/ast.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/__init__.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/parser.cpython-312.pyc
./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/config.cpython-312.pyc
[...]
-------------------------------------------------------------------------

As you see, each of them are stored at a path corresponding to its original
.py file.  The final part of the excerpt came from me running in-development
Sphinx in a python venv with the same PYTHONPYCACHEPREFIX setting.

I don't see any possibility of clashes as you mentioned above, quoting again:

>                We have _many_ scripts in python in kernel and having a cache
> there for _all_ of them is simply WRONG. You never know what clashes can be
> there with two complicated enough scripts which may have same module names,
> etc.

Or my imagination might be too limited to see your point ...

Regards,
Akira

