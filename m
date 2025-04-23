Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BAA9858D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 11:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213410E0A6;
	Wed, 23 Apr 2025 09:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OwLPmdoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E15910E0A6;
 Wed, 23 Apr 2025 09:30:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22c33677183so72393345ad.2; 
 Wed, 23 Apr 2025 02:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745400653; x=1746005453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muxam2SUiy8I7jXTK3ORRV5V0hJy9KAAZUT8IGI2dzg=;
 b=OwLPmdoHjm38r/tnkXfBCxwpqDNCqNQJ98WIqiGugB7xHU3uXydN7J9IL94xsHCpeL
 lpuWQXuulcQtnrcEOBMuaD1ccH9zHQHxr5s+qtB6WDbRL8eMbVjPOmU2IqQZ/TDzJuPz
 wgAzxmESOtbRlZS16Fqz8wuIVUR58SpjBuywXNB8+cxRy0/+3+z5H3i9yYLdUeOZOIGI
 bORG39x7M7gH6xSxBMOay61osgAvu/wjiBouU/wx2xiCH9ZvOBgOcICBmgGXqQ7/BXWV
 vFtoRRb8M01ZKErSrdIn8t0qcSb+AMWNjsuaVReYRrY4/3g2JmXt9Q+p2BM+5j7R4Lm1
 BAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745400653; x=1746005453;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=muxam2SUiy8I7jXTK3ORRV5V0hJy9KAAZUT8IGI2dzg=;
 b=gEC5h10btRHLxHTQjMr8RDLQg0FSHqEukWKPUeN+oCUIVBtyb0X8AMD0S/AMi3++Sf
 xF7flhq56nhVGA/7LsxrMX81qhLtWY7VmIABbr8PczNVHivqgos82CYydmhEkvQ6Q7iD
 S0X/j8EVEuFlWzTvaX3GudiOFhYMtmRA82C3u0uS+fqFAnk0Chn4WAIO9Ey+1bsrnOyy
 HbFqwxPCkOzhAHTedfkufnQwgUaPietOlk3kshLsx+oE1yqP+CS8epLeSk/xw+08OPjQ
 A6oXGFCqx/RlEGWH74IAMbwBf23ViDFLACdvrAmsphZlSRYz/55MJHD7ENtdT+2WhcK0
 xpng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6+n3Sgz0SlxX/8g5W2hie5STtcppZuvba51vZC11cEWwcS6DGRWggj6WV/6m8d87gb7neZzCjKSb2@lists.freedesktop.org,
 AJvYcCXsQSDaH2s/A/VfX02YmTmpOQa4RT9aSJ0HnZTY6EFEfR1NesmCl87POXYA1KhWgTRw/weYJFF23/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxwv9JMsCqjmr6MOBIl94e8THJe9wJvBeTiXzjvCCELiA3h63uH
 rp02MZGBnF5LYHB732gJ58prQud7ZPPTglInMOq/ULDAeLIeBudu
X-Gm-Gg: ASbGncvljoxYSTMReyS1cZyuVtZBiZJs2UTMfoaUwwOGmMtWtob/Oc4yUWl/S8w+rRe
 IGIs/eq/lSNJxm65Zw7LGDjJ7tgIKAVb5ml81tggpMt0iZDH7bE1I6ELuxRSSPbbV7dhX9KXafq
 CvlmU/0CZ7gC4OGw2wpJHe9/LePXYcqsbGE3olFzND68Jb2iYgYv38943CSAM1203jene+sw3Ni
 mwIJpNToXKvBK9Lsdx6Cn5cRscf3XbzBhl4+urjYkDoguHD+3Dudf1wvTMEA4WOpm+o659yDIcx
 LO0KM5624SQ7+VVWB3dhP1/SZRSpcZdpYnzW4e/r+QjlyWtMCDIRfFw3TrGyuHgMpY1mNfhXoBL
 iYcoQIfnLgwA=
X-Google-Smtp-Source: AGHT+IG88n4B+Zz7jvsF/amnEc51F/XmSyRSZhLIy5SSMySrK3N+aaQMKVm7LW4VWbvpbZndJX7ocw==
X-Received: by 2002:a17:903:98c:b0:224:1780:c1ec with SMTP id
 d9443c01a7336-22c5360dc12mr325231335ad.35.1745400653408; 
 Wed, 23 Apr 2025 02:30:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb64fbsm99667675ad.158.2025.04.23.02.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 02:30:52 -0700 (PDT)
Message-ID: <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
Date: Wed, 23 Apr 2025 18:30:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andriy.shevchenko@intel.com
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
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

On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
[...]

>> > Would it be possible to properly support O= and create pyc / pycache
>> > inside the object/output dir?
>> 
>> I have to confess, I've been wondering if we should be treating the .pyc
>> files like we treat .o files or other intermediate products.  Rather
>> than trying to avoid their creation entirely, perhaps we should just be
>> sure they end up in the right place and are properly cleaned up...?
>> 
>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
>> should do the trick?
> 
> It's not so easy. The Python is written in a way that it thinks it will never
> runs object files separately from the source. Hence that variable sets only
> the folder per script as _home_ for the cache. It's completely unusable. They
> took it wrong. It still can be _painfully_ used, but it will make Makefiles
> uglier.

But, PYTHONPYCACHEPREFIX can be set as an environment variable.

For example, try:

    export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"

Wouldn't it be good enough for you?

Regards,
Akira

