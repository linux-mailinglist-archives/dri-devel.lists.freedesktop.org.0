Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F47F46CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB8310E61E;
	Wed, 22 Nov 2023 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8721610E620
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700657401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7CwGgnA5jX9Ulr8vRs5/VIijolfgnKW6FNaANq6NMw=;
 b=gcxroOl14nvBSF2D5etEdZDNqcGuTBbdP3WbmkwXvC20EjEuLjhNN1sooDn401VQyO61c5
 ecObnTfb8WecqpT3udKFbx/igcRD+Hfz2SnlWyQPwPYIzzzWqrck7ho9hxDb3VV4NSzZAX
 I7lrD5Z36R1TW+nY4Hd4sAIcUCaZYk0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-AaddhP3zOruwieBZuIcY0Q-1; Wed, 22 Nov 2023 07:49:58 -0500
X-MC-Unique: AaddhP3zOruwieBZuIcY0Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c876d239e6so38371011fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 04:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700657397; x=1701262197;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7CwGgnA5jX9Ulr8vRs5/VIijolfgnKW6FNaANq6NMw=;
 b=sbWKyEKhdd9IegilRsAV31id/RXb1VHVSckAYzo0nrJsu2eVZGlP566kqG164/OU1v
 GkYjkP2k05fRyRBzkYpAW7cmJgh2ykSfgBawsr8dTaE5IWdptAtC5wvtXnKXd4lJzA54
 XeABwacyITAQK6mvB7Kf6W9iLam5VM7GaE5JeJ5ueNt8p769LlTuqdbXxifqQ0TgU5ee
 HF7PomBFuvGHC96dB5wKslbCJTR9MMwc4Hb++nBNV7bei1GBCygoq/yU/Fw20qw0yVMK
 FFbPVwYT/qjZ8/rga/KwqSVNowgY1+dd2po/JJ+CPiZ18KF7KI0i47+NefD6kG2Fr5b7
 8Zcg==
X-Gm-Message-State: AOJu0Yxs1G6gVlVavFGD8st+9J5IXShk14G7SXaZ//igcGN6d0BJloyt
 sJKTXyG9F8pee6+7uluZ1/sCnewZC/ED3RnJP3OKOpaAxjzZNCs9w4glBhrn6keiLaC8+h5GzJQ
 U96q5yagsnwg8ogkZnF57BoP0IHWw
X-Received: by 2002:a2e:98c2:0:b0:2c5:2132:24f6 with SMTP id
 s2-20020a2e98c2000000b002c5213224f6mr1644897ljj.12.1700657397040; 
 Wed, 22 Nov 2023 04:49:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjsqJ2SuGehTUxt/XdTWeav04muk69t7/+AFuoFYCMhKZg56Vp4jkvGQpcnN18Ay8LgHfnHQ==
X-Received: by 2002:a2e:98c2:0:b0:2c5:2132:24f6 with SMTP id
 s2-20020a2e98c2000000b002c5213224f6mr1644863ljj.12.1700657396682; 
 Wed, 22 Nov 2023 04:49:56 -0800 (PST)
Received: from localhost ([90.167.94.248]) by smtp.gmail.com with ESMTPSA id
 bg36-20020a05600c3ca400b0040775501256sm2103506wmb.16.2023.11.22.04.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 04:49:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
In-Reply-To: <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
Date: Wed, 22 Nov 2023 13:49:55 +0100
Message-ID: <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-doc@vger.kernel.org, qemu-devel@nongnu.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Albert Esteve <aesteve@redhat.com> writes:

Hello,

[...]

>
>> > Mutter patch:
>> > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>>
>> Seems like this link is same as IGT? Copy-pasta fail maybe?
>>
>>
> Ah yes, my bad, this is the correct link:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3337

The mutter chages are already in good shape and the MR has even be
approved by a mutter developer. Any objections to merge the series ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

