Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9035A9D74A
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 04:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3031310E18E;
	Sat, 26 Apr 2025 02:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sb5grXXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F7E10E18E;
 Sat, 26 Apr 2025 02:39:16 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-736c1cf75e4so2570860b3a.2; 
 Fri, 25 Apr 2025 19:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745635151; x=1746239951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpplSP/dFAaY6jk9LLlgcDCITdJ17ib1uCJw3e53Eew=;
 b=Sb5grXXQpuPw/YrH2RcgVhquJjPVoFrhe3iVDVx+s/cFPeEM/XOFBrWEJgJmAW0GmN
 7/EEWGCU4sjkglH2w9oeBj5dMJoEXKBrEUcxejB8ydpeLmoyt7wpZh9e5Ymhe647W2Kg
 tM/rXu5iAO//l3Cdf2ITd4+LGpCsuLzr8KJ+L8H8KPBbYl1w/gkfaXsbW2xh/LxbtkFU
 vHO0j65Q8KSeuny+xzeSL4BhDv31PctXUpquRNkcuGOJVyTQKeM47FPmrhJZaier9P8z
 VEZuq8Yl5GCG2+Z0uUm3WImF32oXZmCCioLAJtTNHiWGU7vjgkZX8Oqe+4B4vIzzVHJY
 365g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745635151; x=1746239951;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JpplSP/dFAaY6jk9LLlgcDCITdJ17ib1uCJw3e53Eew=;
 b=n4BLCxY1WBmEHCra8KIM+TCB995mcql8f2cP6+4NMCHh5KvW83SEAYLvO6jieI/V96
 cttpaZEGZ9fO2FesdJrKv7ILzMEoxMpizFkYv7ff1DIlBt7o2voaCj1qTJI9Rcfsd92L
 YIea4roI77Y2yTnKmV3AmdKofoPRJldI3Ix7Ua00Mwdq6KS599RlKw1jawAup76wXsw3
 5B5l7We/CEMlRHi1iylWwu307x6kJ4KAnh/PsJdZ3RZ9k7nsGQpA68BJaX2uqFmm2hIL
 j1Q2/6UHYOMIo5Nt9gO5DBG/Af2jv4P7FgUdz5MafbLfPYEUzqcxZx5YgSUQMdRkiu43
 TPSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9UjWwO3oIdsXf2yJns03Vlgg4AqIcfLSUCuE7IeFBE6DiX5cisCjGZmYYq1fdXutY92K5/DkrSUOd@lists.freedesktop.org,
 AJvYcCXR27JRtcSspcY/6cdOwXzl+/Xt1kk4+Dy4WAcTeq921enllVRuDGd9NWKWEBD2A/xZSqQVXC68P5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNZvy/dHqy4FjX4FeBPYHizj2ZOtha1nUaAzQsLnvONTwTrtgD
 Du2he8QM+Sff+6HykAS1sI9cvWINupVKWw3TJXri0OXlNowgfp/NisvIOu8HURs=
X-Gm-Gg: ASbGncvGym7rjeYVSUauWYpVlwyWGwE4rfgudfeZJZFFbY+TCntnw7fcbAMWkmrMfiw
 PjlZ8Wm5nld+TF7ScEPjq8c/NsV+ui/mrAOUdiUSAf92pKPybQ2G1MrgiDgQe0K/0RjZwVT23j4
 tbzu5BaV0opC0ItQg5xBLj8AqePjYA0ApBV90qRoEzrYEXUNqVBrpyX4REZ0Eyj0c6ML/LzbgX4
 aTPxUhZtdHGJPSn7JZvjYk6GYc6/fMEZSEHzGGUmgW1TrZRn7L+DCND6qdBeNd0Nf8Vyrtra5U3
 5y4AGzdMRYfut6kxfr+GgLn+LkTGPvQYV2GxkTQby9btQ9tqK6ithFPZuFGkSfhQwqZ6W6ylG2P
 gUf9VNZYRP74=
X-Google-Smtp-Source: AGHT+IE44KmkhgPN/y1Z+QQtUhDR0Rj3E1Ytzqt5IZB/2pxGjM8oeA/JwKOp+X642fQ81dh589yQ+w==
X-Received: by 2002:a05:6a20:7f90:b0:1f5:7353:c303 with SMTP id
 adf61e73a8af0-2045b6f5372mr6075481637.11.1745635151397; 
 Fri, 25 Apr 2025 19:39:11 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6a133sm4016961b3a.90.2025.04.25.19.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 19:39:11 -0700 (PDT)
Message-ID: <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
Date: Sat, 26 Apr 2025 11:39:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, masahiroy@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de,
 mchehab+huawei@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
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

Hi Andy,

Responding to Mauro's cover-letter of v4 at:

    https://lore.kernel.org/cover.1745453655.git.mchehab+huawei@kernel.org/

, which did not CC'd to you.

On Thu, 24 Apr 2025 08:16:20 +0800, Mauro Carvalho Chehab wrote:
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
> 
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> This series contain 4 patches:
> 
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

I see Jon has merged them all, but responding here anyway.

In https://lore.kernel.org/Z_zYXAJcTD-c3xTe@black.fi.intel.com/, you said:

> This started well, until it becomes a scripts/lib/kdoc.
> So, it makes the `make O=...` builds dirty *). Please make sure this doesn't leave
> "disgusting turd" )as said by Linus) in the clean tree.
>
>*) it creates that __pycache__ disaster. And no, .gitignore IS NOT a solution.w

Andy, I don't agree with your words "__pycache__ disaster" and 
".gitignore IS NOT a solution".

Running "find . -name ".gitignore" -exec grep -nH --null -F -e ".pyc" \{\} +"
under today's Linus master returns this:

-------------------------------------------------------------
./scripts/gdb/linux/.gitignore:2:*.pyc
./drivers/comedi/drivers/ni_routing/tools/.gitignore:3:*.pyc
./tools/perf/.gitignore:32:*.pyc
./tools/testing/selftests/tc-testing/.gitignore:3:*.pyc
./Documentation/.gitignore:3:*.pyc
-------------------------------------------------------------

, and they have been working perfectly.

Having seen your response at https://lore.kernel.org/aAoERIArkvj497ns@smile.fi.intel.com/ :

> I tried before, but I admit, that I have missed something. It was a mess
> in that case. Now I probably can't repeat as I don't remember what was
> the environment and settings I had that time. I'm really glad to see it
> is working this way!

, I'm guessing you had a traumatic experience caused by python's bytecode
caching in the past.  Do you still believe ".gitignore IS NOT a solution"?

From my viewpoint, applying only 4/4 of this series is the right thing to do.

Bothering with might-become-incompatilbe-in-the-future python environment
variables in kernel Makefiles looks over-engineering to me.
Also, as Mauro says in 3/4, it is incomplete in that it does not cover
the cases where those scripts are invoked outside of kernel build.
And it will interfere with existing developers who want the benefit of
bytecode caching.

I'm not precluding the possibility of incoherent bytecode cache; for example
by using a shared kernel source tree among several developers, and only
one of them (owner) has a write permission of it.  In that case, said
owner might update the tree without running relevant python scripts.

I don't know if python can notice outdated cache and disregard it.

In such a situation, setting PYTHONPYCACHEPREFIX as an environment
variable should help, for sure, but only in such special cases.

Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?

Regards,
Akira

