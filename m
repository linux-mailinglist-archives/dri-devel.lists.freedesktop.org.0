Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0293D557
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 16:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394B310E9C3;
	Fri, 26 Jul 2024 14:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dn9z+AHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151C10E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 14:49:59 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5d5846f7970so620058eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722005398; x=1722610198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYw5cml/fOZ5DmE2TFdKPM7OvcGgOZ2eWXn7juyqvGg=;
 b=Dn9z+AHt+LBw5IZXjke2QUTua6aA0I7KVqLJ6B03aI+IwG/ucWO8CX65wJPH8eHlnK
 4uKQFCXIJINPjQEdZZLTJ1Jt03J4ecAqANUQGmtYnCk+c2sbA/AyZrO6J1OUZ9elSEFJ
 dhaw0GGWz9pKA3FedlaREwieuyyIJ4HYkqrOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722005398; x=1722610198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYw5cml/fOZ5DmE2TFdKPM7OvcGgOZ2eWXn7juyqvGg=;
 b=mdd/sZWdylxKwQHN7rCWLZJmfsQcj/E5gSg/tem8qZaCTOQ3cMPLKPiUoFfLKsaw4G
 B4AU24QS3IiAM6gWIOheZ2qEwizyyos/+ZJ7/F48uj9vwo+EDq5ric7G9Z4HaRo88QoE
 GApTvWdv1rWtnr3sx+pUWOAyAck91L1IOkrPDR93U54TlWT/bPN5OwsUsmnlMuASkBTo
 Kl4t4m7EPnchLPKHufAHdkK3ndxfIxQBHr89/OqfxWOxgMYGugYnDBZpl4j25KQ1OHYQ
 cMIkHq0TDnD5f30effUUUNj5xKSTcnLXal8wgm8RdfO43LROfelse9YG9b2wPdcFHhbl
 sG+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDI3425/N6T8nvEojW+aWDAZc4AQn1A3Uxu4pUBmIGBCEwP3Q+P+uMOL8ZcM8Qeq86jz63kwH+4e25WXuJz2Ncx2FH/izz2ma2+E0vfcnh
X-Gm-Message-State: AOJu0Ywig7I/RRB2oeLl4BkHRScS1IaqsT7ikTY8iq8jmDhaWz501H5a
 Ai9Z/F2f0UgxI26WRAio3oh9TOms5QFbwiAWWwmYHFVFgm+mgAHKDU+JPb+E6u+F1+oXMtWayYc
 S6A==
X-Google-Smtp-Source: AGHT+IFui2SnMfbyAEAn4DhymRQ0z9DEyhFzBFYt9NM1EXLAjhtHJEZrmI3o2Kz88pSzbeuHG8KoDw==
X-Received: by 2002:a05:6358:78b:b0:1ad:5ba:97dd with SMTP id
 e5c5f4694b2df-1ad05ba9a87mr329061755d.10.1722005398090; 
 Fri, 26 Jul 2024 07:49:58 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fac3b21sm17254536d6.114.2024.07.26.07.49.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 07:49:56 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-44fdc70e695so281241cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:49:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVErg7r5lARpqVVY6xCcY98fLTs5VB1rPvQMjY1//QcrEOZwcrc7R0Mhus/Buh8zV65g5ZOF7SYLwklnBXMLvJjK7iHZdTpAeoLjANdaKV
X-Received: by 2002:ac8:7dc4:0:b0:447:dd54:2cd4 with SMTP id
 d75a77b69052e-44ff3b37e00mr3262241cf.22.1722005394734; Fri, 26 Jul 2024
 07:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-3-tejasvipin76@gmail.com> <877cdakdq9.fsf@intel.com>
 <20240725-psychedelic-benevolent-muskrat-c7fd57@houat>
 <CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com>
 <20240726-cerise-civet-of-reverence-ebeb9d@houat>
In-Reply-To: <20240726-cerise-civet-of-reverence-ebeb9d@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jul 2024 07:49:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuupCmLPLkjAQrxr0JOngegoZpoXkR6GjnFem=WnPvGQ@mail.gmail.com>
Message-ID: <CAD=FV=WuupCmLPLkjAQrxr0JOngegoZpoXkR6GjnFem=WnPvGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet
 member of mipi_dsi_multi_context
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, Jul 26, 2024 at 2:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> > c) Declare that, since there are no known cases where we want to
> > suppress the error printouts, that suppressing the error printouts is
> > a "tomorrow" problem. We transition everyone to _multi but don't
> > provide a way to suppress the printouts.
>
> That's my preferred solution.

OK, fair enough. So I guess the transition plan would be:

1. Add a wrapper like we're doing today.

2. Transition everyone to the _multi variant.

3. Delete the non-multi variant which will cause us to delete the wrapper.


-Doug
