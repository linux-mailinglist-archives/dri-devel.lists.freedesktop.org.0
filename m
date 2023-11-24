Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CDE7F722A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE0910E1B2;
	Fri, 24 Nov 2023 10:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CFC10E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700823412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lIC23ZyZLJj/oYUj3wwJ9PbugdSurQXfcrH9U9VfYw=;
 b=OtaneNor0KEiKSIy0gGECuAr86lH3kIDEiwtiWH6r/AT1XTPzxBbrqlRzhn8v87Mcwf+s8
 N+YjhIrxz5W1B1r9tDg1pWvYhkNF+vD6iVD2Qa860VacCssxNDI/BlOxtode288hCf+com
 T2i72F1Le7BSTzzmNhSP8iVUVkGeeCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-_ofvF5cMPPCzsjBQGqE11w-1; Fri, 24 Nov 2023 05:56:49 -0500
X-MC-Unique: _ofvF5cMPPCzsjBQGqE11w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b2c20d2a4so10923405e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 02:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700823408; x=1701428208;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4lIC23ZyZLJj/oYUj3wwJ9PbugdSurQXfcrH9U9VfYw=;
 b=JguzMTrYT0quKz8ZL3MMtXztlkqjxj/vVTzmavtpIpZceTF6GKniviZ0xAAqR1Hm31
 uOWTCnjTmdaWyWgTPx36yVoRJDkuUqO3pHEJp9mBmHddfiaMgup0J4KbTNLzVa+CCAwY
 xOeDRfto08nN2YjLUFaPw5np/WNz0iRs84pSAlIOqdKdsvr+TBgbP9O4aPiESVYIL2Q4
 G+T4E4MlrzAU0qJ3or+v1cyu+kQLMEaHwO+Ep04W1Fn/HUq856OQg1LQHMQFPqGXwjhY
 GA7Nh36++diDz9LqX77dNkAznKIEl+xe/T9jfAKLla6GHozFhbf4RdHCML5aBFfZxlF8
 JiOQ==
X-Gm-Message-State: AOJu0YxJWgAC79r7WWot380GjQZoJQOtqKlb0xDgeMQ+zPEoGTOh3rmU
 J/oXngYkEunKppEwlxaaFYEXFBWZmeW7WHwMxz8hh8/vd0nizSZNrrVFCW5Uhtzb56QaeptkYPD
 ziMXBqRgTggAynKSyKemUkJ5IMOFz
X-Received: by 2002:adf:b1d5:0:b0:32d:aa11:221d with SMTP id
 r21-20020adfb1d5000000b0032daa11221dmr1609067wra.27.1700823408229; 
 Fri, 24 Nov 2023 02:56:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8B1Z5Xh4NJM4v+jFXHb5dS3jyH1zOINaNv+9ttW9vntLWVjkhOG5VMvKimijwhgUpy+ZIgA==
X-Received: by 2002:adf:b1d5:0:b0:32d:aa11:221d with SMTP id
 r21-20020adfb1d5000000b0032daa11221dmr1609038wra.27.1700823407919; 
 Fri, 24 Nov 2023 02:56:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b00327de0173f6sm4052394wrr.115.2023.11.24.02.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:56:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
In-Reply-To: <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
 <87y1eqc5qk.fsf@minerva.mail-host-address-is-not-set>
 <xUgaKXv4lqgCEWWlB4KRGx-yLXefTg-uXEdXaTqAhOTxC4G7bCILTK9SH6ymdmMMBLooAl3_Kdvl5JXeUA8Hofg9PcCMBhPWhVhnCoxvgqA=@emersion.fr>
Date: Fri, 24 Nov 2023 11:56:46 +0100
Message-ID: <87leanctch.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Albert Esteve <aesteve@redhat.com>, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com, banackm@vmware.com,
 spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simon Ser <contact@emersion.fr> writes:

Hello Simon,

> On Wednesday, November 22nd, 2023 at 13:49, Javier Martinez Canillas <javierm@redhat.com> wrote:
>
>> Any objections to merge the series ?
>
> No objections from me :)
>

Perfect, I'll merge this series then to unblock the mutter MR. Thanks again!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

