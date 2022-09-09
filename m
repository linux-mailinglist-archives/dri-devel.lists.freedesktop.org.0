Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B95B3511
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892610EC60;
	Fri,  9 Sep 2022 10:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068E810EC60
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662719037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PliGuUj74sP8JfL2MRLUfYQAEkphl8IjEzBKMk8R5iw=;
 b=CBm/r7B4FYCORV+P+wEM5TlkZiFtK5dKCVqR7wdqkkXLJrSsvwN055J4JJKolykiLk5V/x
 XMLN/9cFk/dRsUOoNoJyFw33pupPYDSygHuD8QOiF4o8p57SATOECLtzgHaLrR9rnt7Rnn
 5iFSdZwbFFQcTuewLB9otMCysMg4730=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-H10onr2pN8m2T3DD_yC2pQ-1; Fri, 09 Sep 2022 06:23:56 -0400
X-MC-Unique: H10onr2pN8m2T3DD_yC2pQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz16-20020a0564021d5000b004489f04cc2cso950337edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=PliGuUj74sP8JfL2MRLUfYQAEkphl8IjEzBKMk8R5iw=;
 b=jGEet2xoNWUbybf4MPa5FHpuVckR12eGV79GVzvi4VsEoRC880XNRZ1IJ74prZdoVG
 LA+xfeeMb1bARa0TgsBRgvfRrxvQ+LPtbO/eJvCF+Om+/LROccxXnJYlfeSBRYvYWG4B
 82n6nBg7rkKDHaRQACpXf52Kc/mMzpCoR41dugaVnM1RbrL560aEXHRzA7ZMWbnTdL/0
 E0pulsOYFUWM3qvapdQVb9vClDiVepo1yn5DIyqB4r1QfvVt/3XEdcpcn+w3m0Uu84LS
 4Taxipvi+WVhNlAYGBhLmU4N9a5v/fPYOq3OLSkdZonmfxIv+NxOgSlpIcz3nam54yce
 HQUw==
X-Gm-Message-State: ACgBeo1t9y/IQkbQhOnA6/6dgqE0adJgu5j0Qp4E9ijlRptuFXa61d44
 FMcNL39N6nDk0GkPA0DOQJs+vMNkKDT+F4WZzIoavTg5O5Rp/Of1u9MCDVNUqj4UyIh4DdMIHUJ
 Jvwo5RydREeTO/CKWViaA500YxxV0V0igBkjZyS/UY/Dc/Ts+5tDx63a+EvP4a//1MLpR2oxI/J
 a1AjFv
X-Received: by 2002:a17:907:7208:b0:73d:7097:ac6f with SMTP id
 dr8-20020a170907720800b0073d7097ac6fmr9579216ejc.388.1662719034925; 
 Fri, 09 Sep 2022 03:23:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+V/LlV87YoWiKEAEirk/xMqodqEb5Uux0PDYpmfGm8OeIXnJokLso2Npo+9jZpLAStxXGUw==
X-Received: by 2002:a17:907:7208:b0:73d:7097:ac6f with SMTP id
 dr8-20020a170907720800b0073d7097ac6fmr9579205ejc.388.1662719034704; 
 Fri, 09 Sep 2022 03:23:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056402040d00b004511b4779f0sm114625edv.30.2022.09.09.03.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 03:23:54 -0700 (PDT)
Message-ID: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
Date: Fri, 9 Sep 2022 12:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Meeting (BOF) at Plumbers Dublin to discuss backlight brightness as
 connector object property RFC?
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I will be at Plumbers Dublin next week and I was wondering if
anyone interested in this wants to get together for a quick
discussion / birds of a feather session about this?

I have just posted version 2 of the RFC:
https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/T/#u

If you are interested in meeting up please send me
an email off-list (no need to spam the list further with this)
also please let me know if there are any times which do not
work for you, and/or times which have your preference.

I don't have a specific room/time for this yet, but if people
are interested I will try to get a room from the organization
and if that does not work out I'm sure we will figure something
out.

One of the things which I would like to discuss is using
the backlight brightness as connector object property vs
external (not part of the compositor) tools to control the
brightness like e.g. xbacklight, quoting from the RFC:

"people using
non fully integrated desktop environments like e.g. sway often use custom
scripts binded to hotkeys to get functionality like the brightness
up/down keyboard hotkeys changing the brightness. This typically involves
e.g. the xbacklight utility.

Even if the xbacklight utility is ported to use kms with the new connector
object brightness properties then this still will not work because
changing the properties will require drm-master rights and e.g. sway will
already hold those."

Note one obvious solution here would be for these use-cases to keep
using the old /sys/class/backlight interface for this, with the downside
that we will then be stuck to that interface for ever...

Regards,

Hans

