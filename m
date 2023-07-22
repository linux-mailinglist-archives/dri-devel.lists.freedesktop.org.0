Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FA75D80E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 02:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767DA10E050;
	Sat, 22 Jul 2023 00:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D69B10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 00:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689984800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zAUVsITJjQgJMe+wUauASsmwQ/Teft8FD3ucSilGuQ=;
 b=EC2FjVcYajejlMjQg1CMiQdZIco+eJ9yTWQDgQFqcTeAOQlErW7tU9n8vGRXM2kUWDC/x5
 OLz3tVDzH5uhWhGWg+jcaaEcgEP2U6WGne+5CbqJAg+CWaI9gM2JItfVm1iDUKDchqu0LM
 Z3f8MJhp5GbmaIveE5dkJLifqvmYzjU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592--IXWjepuPgWFgUtmcsrsNg-1; Fri, 21 Jul 2023 20:13:18 -0400
X-MC-Unique: -IXWjepuPgWFgUtmcsrsNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso1294987f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 17:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689984797; x=1690589597;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zAUVsITJjQgJMe+wUauASsmwQ/Teft8FD3ucSilGuQ=;
 b=LP5qiSZpeMr2oz2xm7Xa3yDmdc+kgIkHlWHo8xYIuMFhnZ6pYOcTNoiUbR9eDYGdri
 +v/o2VkiAsde3o4bdiZoNuCF9ivJ13eQUn27/Bvvw1P1f5ITvQzmfzWbdy7KXrN5fEqK
 DADMBXjfY9IUJBwqnOVQMVokJLrx+8+jl1HdQhO64xATLp7EA+/1klqOwi3lagIYToNj
 cLmzDk4JxUMxsuslpJHmEsjlQgRAb5E4XLs6QgdRmFXNqM7K8IkjJqDXPZHmljtetnS5
 1r/hI8okNdlD00qsnO7myNM0SQeWhUZN52DQvNqtXHXIUdgWKoqz6eNB1IVhJn0O1Ri0
 MhyQ==
X-Gm-Message-State: ABy/qLY9GroL5uCcc7ncXWhMXKduCIG32SnFZ1pmU4d9UFYmfY4C+CjV
 b0oPcFv/FwYCD7qtX1trSfjlTz9C+lm1uAUOTgvy9ilR8W6ON9umWLnUm1rot73Z9vNi/v3EM58
 qRaSUzwldwtZ2sB93mKXS8lmnwYmj
X-Received: by 2002:a05:600c:20d1:b0:3fd:1daf:abd8 with SMTP id
 y17-20020a05600c20d100b003fd1dafabd8mr2089748wmm.40.1689984797570; 
 Fri, 21 Jul 2023 17:13:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXRkyrt5UhsSX2MfCaQiSDHQSKHbh/kU/IrA6UfVzAbLX+sn0IQirVDLsddlSuFOcFPpbQDw==
X-Received: by 2002:a05:600c:20d1:b0:3fd:1daf:abd8 with SMTP id
 y17-20020a05600c20d100b003fd1dafabd8mr2089733wmm.40.1689984797253; 
 Fri, 21 Jul 2023 17:13:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c210900b003fbcdba1a52sm6920280wml.3.2023.07.21.17.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 17:13:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v6 1/4] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
References: <20230719081544.741051-1-javierm@redhat.com>
 <20230719081544.741051-2-javierm@redhat.com>
 <87sf9gublz.fsf@minerva.mail-host-address-is-not-set>
 <CANiq72=A3PLGGPGnwL=gjX7LFsQL9N8W__ojxmVpj2uCAKvhQA@mail.gmail.com>
Date: Sat, 22 Jul 2023 02:13:16 +0200
Message-ID: <87mszou7kz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-fbdev@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

Hello Miguel,

> On Sat, Jul 22, 2023 at 12:46=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Javier Martinez Canillas <javierm@redhat.com> writes:
>>
>> [adding Miguel Ojeda who was not in the Cc list]
>>
>> Hello Miguel, could you please ack this patch so that I can take the who=
le
>> patch-set through the drm-misc tree?
>
> A note below...
>
>> > The drivers in this subsystem are for character-based LCD displays, wh=
ich
>> > can fall into the same category of the DRM/KMS and fbdev drivers that =
are
>> > located under the "Graphics support" menu. Add auxdisplay there as wel=
l.
>
> Nit: this is not exactly true, e.g. ks0108/cfag12864b (which were the
> first in the subsystem) were not character-based but a very simple
> black-or-white 128x64 grid, so we should probably reword slightly
> this.
>

Oh, interesting. I wonder why that couldn't had been a fbdev driver then
using FB_VISUAL_MONO01? I'll reword then the commit message before apply
to the following instead:

"The drivers in this subsystem are for either character-based or monochrome
LCD controllers, which can fall into the same category of the DRM/KMS and
fbdev drivers, that are located under the "Graphics support" menu.

Add the auxdisplay drivers there as well to have all display drivers under
the same menu."

> In any case, if Helge thinks these may belong in the "Graphics
> support" menu, then I am fine with it:
>
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
>

Perfect, thanks!

> Thanks!
>
> Cheers,
> Miguel
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

