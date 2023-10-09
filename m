Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6457BED71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB98710E143;
	Mon,  9 Oct 2023 21:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B30810E143
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696887453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wiHOUxiajjnHeBrQroPQKoRKotH3a/t84SnD4V8y6c=;
 b=V0k7MmFbJdglzFU7yoGQZyinRzc4Nj0fL5W7HA0TuIdLxrCbMjrmT7PedTuh1oHpapGRdN
 0BLTu8Ggs41KW1lLBWAv0K+v/h4z7R9lP+QjeJweSAl2HX7Z6cyWKldu/Ln2WejoVS2aXC
 GqdpTxYZm5uLvRR2nykg88mGF1FPgag=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-rluCzkYIPNuGe8ZJmzn1mw-1; Mon, 09 Oct 2023 17:37:12 -0400
X-MC-Unique: rluCzkYIPNuGe8ZJmzn1mw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-77586b4ae08so937747485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 14:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696887431; x=1697492231;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wiHOUxiajjnHeBrQroPQKoRKotH3a/t84SnD4V8y6c=;
 b=QII3pezI8h7LWXGUV+Kao4X4N4PQ+NDJc4AEOu0n5lT/y8LarHeq1SPYu+tWOkvb+9
 nfGJJ5qLJbb40v9xAS6GwClnDvK9zhj9P88EPgmu6tCcBJTyVNnfGkiPn5RJplPGgSzB
 XKOV+HBcEQJLAEeCiLAHyAw9d4HTlZgXixGZtv6tP8YaTeX2RF/JUIl5KNuAa0uFhuqy
 RdySXHCiqhUbarmp1L5wnpx+XVVLgIca8i8tuKh5LaECFUAW2i5Y90L3v2+Nl48wFuRw
 vZQBVcmtqL+rxHAmA5/BrJovHzIwPwg0kK7bpciKCoiJp5iySrVtQH4gSpZfxJ3N50Xy
 IhvQ==
X-Gm-Message-State: AOJu0Yyx2vC3JsKzzgmThpB3KAr4faMTIKhQN/6JvAmxi08uy2bKs26T
 0Cs0XH7rKYgfqe5lNLHtuT/zP58vnZ4z8Xetdbcbc796zidS/oyNsEg09s/bS8Psav16Cjzpsqs
 Ppb93UWEFndAh91vTMXQPzyUfI5tB
X-Received: by 2002:a05:620a:c45:b0:76c:b7f0:2bc9 with SMTP id
 u5-20020a05620a0c4500b0076cb7f02bc9mr18775861qki.16.1696887431193; 
 Mon, 09 Oct 2023 14:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1/DJrTyEIdfkS2nqcDd8qD8ykOPTlndQuH0p6ATWLeJ7BelfGg5ljaHhfNFoJXY4wO+aR8w==
X-Received: by 2002:a05:620a:c45:b0:76c:b7f0:2bc9 with SMTP id
 u5-20020a05620a0c4500b0076cb7f02bc9mr18775847qki.16.1696887430939; 
 Mon, 09 Oct 2023 14:37:10 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a05620a123600b0077423f849c3sm3804814qkj.24.2023.10.09.14.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:37:10 -0700 (PDT)
Message-ID: <a53adb9e7c598119a490dca20305644d6d7f312a.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: exec: fix ioctl kernel-doc warning
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 09 Oct 2023 17:37:09 -0400
In-Reply-To: <20231008140231.17921-1-rdunlap@infradead.org>
References: <20231008140231.17921-1-rdunlap@infradead.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2023-10-08 at 07:02 -0700, Randy Dunlap wrote:
> kernel-doc emits a warning:
>=20
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU=
_GETPARAM_EXEC_PUSH_MAX
>  on line 49 - I thought it was a doc line
>=20
> We don't have a way to document a macro value via kernel-doc, so
> change the "/**" kernel-doc marker to a C comment and format the comment
> more like a kernel-doc comment for consistency.
>=20
> Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getpara=
m")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
> v2: update commit text; somehow I sent a version of the patch before
>     adding the full text.
> v1: https://lore.kernel.org/lkml/20231007005518.32015-1-rdunlap@infradead=
.org/
>=20
>  include/uapi/drm/nouveau_drm.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -45,8 +45,8 @@ extern "C" {
>  #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>  #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
> =20
> -/**
> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> +/*
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
>   *
>   * Query the maximum amount of IBs that can be pushed through a single
>   * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXE=
C
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

