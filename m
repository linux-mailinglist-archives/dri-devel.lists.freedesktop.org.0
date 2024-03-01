Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF586F476
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CE610F97A;
	Sun,  3 Mar 2024 10:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A+lg2b0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602C10EAC0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 20:10:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso4120016a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709323853; x=1709928653;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
 b=A+lg2b0Vh66iF7z4A4O/XW2lIhy/5CWGnmUQsGeCwv/ZdceCovA7kV3A1GROhIyXLu
 o3/V7anNrtcjcOUny8MPFemxJZWyuBJ6Pcef0cLA4fS2GlniCria2pgGFNmtgOlFQhXu
 +bJGoolWM+gh5b2aLHcI/U2P3Kdm+Jy1mV5gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709323853; x=1709928653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GjHlLe8ifOuwGHIPhGu9Px14t+AYIlwm+A28Gp3fNW8=;
 b=S9ToMPqvE7jxavSeHN02Szx9Cg+BDgjaCPQODiRwe/IV9nUn84PeV8G2jOFKuhmUum
 qz41mUmp/ZJPK8YfVOWpJ4dPggBZjwpv2NlklWQf43VvkiIb+WwQTGEV7YjrYD402Qxm
 EJwnmLSi3pPCU3dDkECa0u37qtIqsGspbrHJ7sdFkiHhCoLKGs2Jo9lbQei3oKSG2aCH
 EoJlXqW3NTy/DBjtHYLu5/hm2IqFEg0SIeLtQU/KGmGc1zXBKm37LxQv22i75AKgsZZ7
 8aHjntQjjHwxzyiw+bGfWD06vP2Epf09vsPH9csGr33cwRfBtv8LRSRLxBqanFxkfDMx
 zuOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfeEWP19D0hv3OxKDFiU97THlJY3EOibaBaTthtRMAuVr8HO+LK0zFLK0Wcf2WuJvRuwhdG851RrqWAQLejJdtxP6GSkfllSzRO6I6KjU2
X-Gm-Message-State: AOJu0YzY/Ghvf6NchwJWhRosEjme1B4X8ShDCuZJ79l4xKW0nbpLVDre
 PVkcAgAeFMNwSHb9d5XVN8Ale8xygvRsMrVvJmonbaqsKHe0nVkUIh749L/TQpT6+Q0ZocsOQwi
 OD+b3Lg==
X-Google-Smtp-Source: AGHT+IGcHgh0dUnJ1OTlf6zEVzmJl6+essAS+vvWtc/i2PKQJYpEXBB6LozgUgUmAMUHPAfucbyAuw==
X-Received: by 2002:a17:906:3b8f:b0:a43:4654:f739 with SMTP id
 u15-20020a1709063b8f00b00a434654f739mr2033984ejf.33.1709323853155; 
 Fri, 01 Mar 2024 12:10:53 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 cu5-20020a170906ba8500b00a440ec600e3sm1987823ejd.121.2024.03.01.12.10.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 12:10:52 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so3766559a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 12:10:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVH/X3rXD+bjUUc1lCT3HHYMpEY98v+k50L5wOTbaAHH0FH2vVHesn1FPHmVmtZXFfcwe1jRDzoVtrsM6/tfg3t7DTCjCpPSYufnZmTlQNv
X-Received: by 2002:a17:906:e08d:b0:a44:731c:bace with SMTP id
 gh13-20020a170906e08d00b00a44731cbacemr2324717ejb.35.1709323852310; Fri, 01
 Mar 2024 12:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
In-Reply-To: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 1 Mar 2024 12:10:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Message-ID: <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Mar 2024 10:45:57 +0000
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

On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
> should be done. Still, we would like to help people, who are interested in
> this kind of thing, to set it up. How about we reframe this contribution as a
> sort of template, or a reference for people to start their setup with,
> assuming that most maintainers would want to tweak it? We would also be glad
> to stand by for questions and help, as people try to use it.

Ack. I think seeing it as a library for various gitlab CI models would
be a lot more palatable. Particularly if you can then show that yes,
it is also relevant to our currently existing drm case.

So I'm not objecting to having (for example) some kind of CI helper
templates - I think a logical place would be in tools/ci/ which is
kind of alongside our tools/testing subdirectory.

(And then perhaps have a 'gitlab' directory under that. I'm not sure
whether - and how much - commonality there might be between the
different CI models of different hosts).

Just to clarify: when I say "a logical place", I very much want to
emphasize the "a" - maybe there are better places, and I'm not saying
that is the only possible place. But it sounds more logical to me than
some.

            Linus
