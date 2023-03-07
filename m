Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554B6AD8A2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 09:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B410E368;
	Tue,  7 Mar 2023 08:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1FA10E368
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 08:01:06 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id w23so13487589qtn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 00:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678176065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G6v56biJISo0k1NX6M3k2oB4vNanTMqcuoG+TH0gcNY=;
 b=zax7hK0GTBc2UKmFfGcwU+/1lN6K13ex+747zDA/J/otS/MCXcrYEGS/YY+aNd3lnX
 usLSu7YzdxZibJXFaYS/cF73REpiTsNi8ab0pRYATmoEz7NTn22L+kMR0fkOFJEPleH9
 VFf23TUBXw6tPfqTR/K9rir3ElUuinPJlImsB4SvRKxj/0MoBz7lcHe8tc1KKACB3yWv
 f2Fd5ao/1n/btNxduR5gFFFutSbfhmiLz86lU6t0UJP2Fj/dg5bvv4vunspk1GCZuodI
 ffqtbXqALX2n4M4k/CnYhRKyK6stUBdkT8as9dRJUX4hALAbUj2X+c0EAzCcC+v60Zw4
 Grfg==
X-Gm-Message-State: AO0yUKURytYjjzYZBML9uQpYa8+CAi7xhoj0OjXDRz1HZe2uHV6j9WE6
 4qoWDd+eDvOlJSFEvH8BMImbVAFyHIKKEg==
X-Google-Smtp-Source: AK7set8mb5GLa9BszOIfeK+/79wAb9uZzuc06mfkOuDOT1b/hj0q9la5Nzyrm8WyNt4iPMoubxzbjg==
X-Received: by 2002:a05:622a:1482:b0:3b2:365c:9a9e with SMTP id
 t2-20020a05622a148200b003b2365c9a9emr20729405qtx.61.1678176065094; 
 Tue, 07 Mar 2023 00:01:05 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 5-20020ac85605000000b003b0766cd169sm9243220qtr.2.2023.03.07.00.01.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 00:01:04 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-53d277c1834so55125627b3.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 00:01:04 -0800 (PST)
X-Received: by 2002:a81:b61d:0:b0:52e:f66d:b70f with SMTP id
 u29-20020a81b61d000000b0052ef66db70fmr8277658ywh.5.1678175630175; Mon, 06 Mar
 2023 23:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20230306160016.4459-1-tzimmermann@suse.de>
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2023 08:53:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
Message-ID: <CAMuHMdU5AwE0pK=ppip4J81ByEye+jmvff1s8saeEuWZWZiqPw@mail.gmail.com>
Subject: Re: [PATCH 00/99] fbdev: Fix memory leak in option parsing
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Mar 6, 2023 at 5:00=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Introduce struct option_iter and helpers to parse command-line
> options with comma-separated key-value pairs. Then convert fbdev
> drivers to the new interface. Fixes a memory leak in the parsing of
> the video=3D option.
>
> Before commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to
> caller; clarify ownership"), a call to fb_get_options() either
> returned an internal string or a duplicated string; hence ownership of
> the string's memory buffer was not well defined, but depended on how
> users specified the video=3D option on the kernel command line. For
> global settings, the caller owned the returned memory and for per-driver
> settings, fb_get_options() owned the memory. As calling drivers were
> unable to detect the case, the memory was leaked.
>
> Commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to caller;
> clarify ownership") changed sematics to caller-owned strings. Drivers
> still leaked the memory, but at least ownership was clear.
>
> This patchset fixes the memory leak and changes string ownership back
> to fb_get_options(). Patch 1 introduces struct option_iter and a few
> helpers. The interface takes an option string, such as video=3D, in the
> common form value1,key2:value2,value3 etc and returns the individial
> comma-separated pairs. Various modules use this pattern, so the code
> is located under lib/.
>
> Patches 2 to 98 go through fbdev drivers and convert them to the new
> interface. This often requires a number of cleanups. A driver would
> typically refer to the option string's video mode. Such strings are now
> copied to driver-allocated memory so that drivers don't refer directly
> to the option string's memory. The option iterator then replaces manual
> parsing loops based on strsep(",").

Thanks for your series!

Unfortunately I cannot say I'm thrilled about this: you are replacing
a single small dynamic memory leak by 36 larger static memory leaks.
Am I missing something?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
