Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92686F472
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5C210F974;
	Sun,  3 Mar 2024 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cbm6CHY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A79810F00B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 14:21:20 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-68fb7928970so9335716d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709302879; x=1709907679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DoAmmdskcDEXNaQow37B4LW3k1Xhhw94dVezbr43csY=;
 b=Cbm6CHY1kf1RT8nfKlIX9HrhDs8Q21FL6uprpGDeQADofA9iM6WoFXoQzQWN/Fg0D5
 HiKvFZnxAcKcmmoGvDI8rMc+QH1di1rkUMhJHlPZFPfOmBPU1EJl0OyPNlQAB1azjtJ6
 t8HZGE7fjRYApchuIC5IEp39jhOhT8jRebbh2wmyJdI0CZRxD2p8Kb/HwDYRLWKqmPlL
 aOXWn2uoaYoRPbi39u28wpaYdQjxBsnPpZXOidnIg6+aGZLznAJdLbKD1vNuSo0PzCXx
 GP6tRVHitmh6k33/3LV8IFHnxTEcEtwg892c2sqqjRzBB0X+/hDiR5LMZ7lUya6vXlFX
 KnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709302879; x=1709907679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoAmmdskcDEXNaQow37B4LW3k1Xhhw94dVezbr43csY=;
 b=YfAwpdiUOM+5vwaTeeAnthr/1Y9x4xnlvMGKujd+ratq6WpIhnrzoUeZP6lm5aE5th
 1tVa3p+x/pToIulaP5IISwHiFSv+GQqCDAxSk/bcucaTwih/h3dp2lDkGmt3hF2gxOWi
 +YO8/5YXhUVV9tCiqFYa5diM+w0lIHGb1GN4oFD3CchTbbdjyC/lPXlphnnnV/OjGjgh
 JAfVsSsZ87WSxrqib0zZeQlzNkfvtJTdcWtmof/hJA3frVvcaY8HH5dqucecXHGQmUDh
 c5JxqtDJ1fGCoMDZbMJRPYGdXNC1WDeeu4bvkJfhTazVyz65B13At2jLfZGVR6B0+ted
 Tkcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqL+HFiwlYdhELEuYoHN1pd66kZwroBEN/DQ5PgVSzzQBOYC0IqFbTlcGmGwF8qE7yDEjtKbbI+SulH90NRXwr3DDE5DGM+ut0VcNtI68Z
X-Gm-Message-State: AOJu0Yylzk88SnDEiTEoDQV0H4J1yJNY2aOFJap+s6KniyaMxYEruEQQ
 c8mV/5BQme0NH0SI227N4G12MS6G4iiTYAIIxKi/Anp+t80k7+YZ
X-Google-Smtp-Source: AGHT+IGUka20RbGSTdt31weLyZD5CrTDkIoL5pB4A7Y1ldsaQGmBLLgCExV8/nV3WHdz4i56V+bA9Q==
X-Received: by 2002:ad4:44a7:0:b0:68f:3dbd:466f with SMTP id
 n7-20020ad444a7000000b0068f3dbd466fmr1814520qvt.39.1709302879223; 
 Fri, 01 Mar 2024 06:21:19 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 em19-20020ad44f93000000b0068fdb03a3a3sm1900825qvb.95.2024.03.01.06.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 06:21:18 -0800 (PST)
Message-ID: <f8d45e8f-81ca-432f-9494-441e9a44b390@gmail.com>
Date: Fri, 1 Mar 2024 16:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
 <9183479f-eea8-493e-9a56-9f3f778e3034@sirena.org.uk>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <9183479f-eea8-493e-9a56-9f3f778e3034@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 3/1/24 4:07 PM, Mark Brown wrote:
> On Fri, Mar 01, 2024 at 12:27:13PM +0200, Nikolai Kondrashov wrote:
>> On 2/29/24 10:21 PM, Linus Torvalds wrote:
>>> I would suggest the CI project be separate from the kernel.
> 
>> It is possible to have a GitLab CI setup with the YAML files in a separate
>> repository. And we can start with that. However, ultimately I think it's
>> better to have it in the same repo with the code being tested. This way you
>> could submit code changes together with the required tweaks to the CI to keep
>> it passing, making development smoother and faster.
> 
>> With that in mind, and if you agree, where else would you say we could put it?
>> Under "scripts"? Or "Documentation"? And where it would be best for the
>> various subsystems to put theirs? Or could we have the top-level "ci" dir and
>> pile all the different setups there? Or would you like to wait and see how
>> adoption goes, and then decide?
> 
> If we were going to put bits of this in tree how about something like
> tools/testing/forges?  I'd hope that things could be shared by multiple
> services, if not we could always have subdirs I guess.  We could put
> glue bits like defining how to run kunit, checkpatch or whatever with
> these systems in there so people can share figuring that bit out.
> Individual trees or CI systems using these forge based systems could
> then reference these files when defining what specific tests they want
> to run when which seems more like where the differences will be.
> 
> I'm not super familiar with this stuff, the above is based on it looking
> like there's an OK degree of separation between the "what to run" and
> "how to run" bits.  I might be misreading things, and it's not clear to
> me how often it'll be useful to be able to update things in tree.

Yes, facilitating reuse and collaboration between CI setups, even if they're 
largely different, is another good reason to have it inside the kernel repo.

Nick
