Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB6867B92
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9F10E791;
	Mon, 26 Feb 2024 16:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="adSIVx7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619CF10E791
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708964308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1S0lH6zOZMDYwND9naCAWhyeEnlAjHLP5XxPLKPf5To=;
 b=adSIVx7VJ/c/FgnxQlbAWtJ9CtLe6V8E/Qz0aesL6sWDEewc17xtEm+EYHXgx/UpAEvnWb
 smroN0wjnctnMHU8DYUtenoOM1j/+5nnoqTGMFdyB/Ddr3dYszRPc/gLuCUoSjFZJ+EUWr
 YHvXtvTHYvo6zo1nLCNKX6FndYeCdws=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-obzjT6TvO8y3dobXqUuENg-1; Mon, 26 Feb 2024 11:18:25 -0500
X-MC-Unique: obzjT6TvO8y3dobXqUuENg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a357c92f241so158646466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964304; x=1709569104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1S0lH6zOZMDYwND9naCAWhyeEnlAjHLP5XxPLKPf5To=;
 b=ofZyYuiuu4MVmsgQE+UO44uek9a5foM5ojiT0qAyaV0EcY80zUE6iULjZfLpYqsggR
 WDZsLcHPQppaU7sbmwlQnKm0DhQPLqfuwh9RPO/cpLBS7dYxSiVObeMLHcnQlyd1c7K/
 MwAaVkiOCDM0PT0s831MYSNeZg+x58TxXLs4d9q3XrqOi7iXs//FtFGYEXyYGl88oKIK
 ft6RUgOjOd1oNGTnT0xOyCLi974snWRIFsk/stsm/tjxgmHu7GPSz0UU3xWJQq2h6gN9
 E3Qi41IRoCv5Rl3Lhw5mjH7YnfxJ18v6c5jyn4kc15UnS45vJe2EmmcctyBltntVHkQ6
 gIcw==
X-Gm-Message-State: AOJu0YzUH3ekeBvbRQDU1pOkeOV8HNSu1jxyruftNgJtO57I/FBPxy/y
 VJWa/Vp/CUrxQ7OXyi/GRTXSo9dIo3cfnYCwE3yjupad+vKePcfbWwl82Xc3ifAK96KZuaFHxC0
 owkk2k0+YLLec7FpgHB8nEhIlm5yoUMjEB4N982+NOfc4INQpxSqZMORRbm4c48XY7mUHE7BAhk
 l/LjqiGONrCHU2st4djj3KBSSX67n3SV0jKKfqzJ4e
X-Received: by 2002:a17:906:2bcc:b0:a3e:e84b:232 with SMTP id
 n12-20020a1709062bcc00b00a3ee84b0232mr4809116ejg.75.1708964304612; 
 Mon, 26 Feb 2024 08:18:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHS3TdTbfN7f2VSklZF9YE/FoHgas4zj5RSFSNgjiKJRnntqMO2SRfiyqoAhPbols0Md1Au4tNZffmtBHAzHCI=
X-Received: by 2002:a17:906:2bcc:b0:a3e:e84b:232 with SMTP id
 n12-20020a1709062bcc00b00a3ee84b0232mr4809103ejg.75.1708964304324; Mon, 26
 Feb 2024 08:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20240226152123.131406-1-mripard@kernel.org>
 <871q8zp6yf.fsf@minerva.mail-host-address-is-not-set>
 <mbrgva4wfyh4jsbqtzwc3czixfj2cu7r7crt4csjkyhd7nmoep@enn7fmyfnnc2>
In-Reply-To: <mbrgva4wfyh4jsbqtzwc3czixfj2cu7r7crt4csjkyhd7nmoep@enn7fmyfnnc2>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Mon, 26 Feb 2024 17:18:13 +0100
Message-ID: <CAFOAJEenEQrA4gi4i8xt7hWp6wjXjPrRS9C7LaeUwvC1UmvVcw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm.git URL
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Daniel Stone <daniels@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Mon, Feb 26, 2024 at 5:13=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Mon, Feb 26, 2024 at 04:43:04PM +0100, Javier Martinez Canillas wrote:
> > Maxime Ripard <mripard@kernel.org> writes:
> >
> > Hello Maxime,
> >
> > > Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINER=
S
> > > git trees to reflect the location change.
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> >
> > Are you planning to post another patch to change the entries that point=
 to
> > the git://anongit.freedesktop.org/drm/drm-misc tree ?
>
> Yes, by the time the drm-misc migration will happen (ie, mid-march)
>

Got it, thanks for the information.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

