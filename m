Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB77BED8C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C95410E2FB;
	Mon,  9 Oct 2023 21:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA50510E1F1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696888058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ol7U8OKowEqtq5uPO63v6h+CJlOTYPJm/cIb2Hh14MU=;
 b=Iy2uXyRmCbjituJWgw71UB16DN9WN7QOy8geqTk4xvDMnX8pDU04cqoTzRm9O9wXlH1iLf
 tS54Vmw36d7Xw0qm2xuhNnCCpXLoNdxlkrr1f5+Mnd/COrcUOVf3H9AVqup25bn7+vj65k
 i5YNp8nYl/HBWJGeJSbtoxk/mdHKX/8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-bP3Jb5vQM-qmU5yl7MrZ0A-1; Mon, 09 Oct 2023 17:47:36 -0400
X-MC-Unique: bP3Jb5vQM-qmU5yl7MrZ0A-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66216e7385fso60744816d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696888056; x=1697492856;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ol7U8OKowEqtq5uPO63v6h+CJlOTYPJm/cIb2Hh14MU=;
 b=qiFa342tvr04DFpntDaowo+MzOiZYoRpB5YyjFGnByg0VKhFRoKOhrP/nEvApiHh2x
 5+G4uqFOzQXhUbm4th98pXS3Y+HH+srI7qJwbaU0kl/foeZ2vrXisGKpgQ32lrSnRci1
 gjYZJTtKfE63YvbDe0QdHBp4ttP8GdJh+IJnad/ajr5do/M/Pyg0Dyg7+U4bE7hhjtAw
 th18ffpZAHFswfO/gbxQWjxLFQ144Q/Tingrk+NDTmsGjOSN5i/T5+gnrDpvgxI6BRUt
 ZsKArPHhNEBk3gTTzNHr9wr7YnN5mojvzkff1sGEKBcje2xQc248uvBknRlRaz+J64FC
 7FXw==
X-Gm-Message-State: AOJu0Yy11WPschy0o2YsHal3Z3/00mvy8W1imrfIiuNGia3N+qFgGXhZ
 cBZ3qKRryjV2eZJzjzzMtNn/ml2mYOsDyxtMA2aSGmE1hwEhziYWBpIo0h7rKfzCmP7CUUjMzYl
 1AywHfQaPyU5ttoJ4J9lZD1Nhw9va
X-Received: by 2002:a0c:dd87:0:b0:658:a043:376b with SMTP id
 v7-20020a0cdd87000000b00658a043376bmr17087609qvk.8.1696888056282; 
 Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOke8zf4DZ25JuBWmIWAQ89mvWVhG4qPWk2Q0cT+WH8YONLgZ9WVcabvZ/wTXpE0AjungOEQ==
X-Received: by 2002:a0c:dd87:0:b0:658:a043:376b with SMTP id
 v7-20020a0cdd87000000b00658a043376bmr17087594qvk.8.1696888056012; 
 Mon, 09 Oct 2023 14:47:36 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a0cda93000000b0065b31dfdf70sm4173364qvj.11.2023.10.09.14.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:47:35 -0700 (PDT)
Message-ID: <e494d9fe7efd72ca3588710388411e98c82ff3f7.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: exec: fix ioctl kernel-doc warning
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 09 Oct 2023 17:47:35 -0400
In-Reply-To: <20231007005518.32015-1-rdunlap@infradead.org>
References: <20231007005518.32015-1-rdunlap@infradead.org>
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
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2023-10-06 at 17:55 -0700, Randy Dunlap wrote:
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU=
_GETPARAM_EXEC_PUSH_MAX
>  on line 49 - I thought it was a doc line
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
> ---
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

