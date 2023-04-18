Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E66E663D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F1510E3E0;
	Tue, 18 Apr 2023 13:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5529E10E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:45:32 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id v9so8550744ybm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1681825531; x=1684417531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iw0pHTic2tW94ZkuGps3C8vbdSZjQKizHrhkm7zWTDs=;
 b=dLBYhmDmoKDLazYXJrRf8QbDAhyYTFLDU8BKl8/U2nYaNMZ+ov4EzT7Y7pKahjqJii
 cdVJis+gjm6fI//o1iiZYVQ1ReoG9uURpMpggxfUDYDAg89y35W1RNEmCwDPRcN+DxGo
 Pm/5kGC5cdqY/fGt4NZPfbPE4t06YBPbx2/dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681825531; x=1684417531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iw0pHTic2tW94ZkuGps3C8vbdSZjQKizHrhkm7zWTDs=;
 b=N0Jhmv3j2UNfYzFd5z3+2o4f+nVuSxzgrRMAivm9DybcVH5jsk1zIlRbJCI1u9pt49
 QVmsMNzG3RqcYWdZ95HIWklJoF5qJDNOrJQPjXylY1S0tZpXdE91oWossWqYwdMTeF9P
 8KUMdwTFOh0ijXKtUDRL3XRx1YrkeAizU9/MORZJ2ITJwLjLUh5UHrHQhtEKTLwXr/Hp
 LlqYoL/APXk4o0jyuu7zx8Rq/sKRRL6d+pI8qwNfeKA87cJwH5vu9sWGN7c/u8B1ogsD
 N/lL4zywUa3JzPgUJelCUlj9AmdfemFFrcdFYZSrlMTyDZpnZrPYAoCZY3XBsKubJPbQ
 tiYA==
X-Gm-Message-State: AAQBX9f6Xk26BFrvAMVZGhxWz/MlWTn6cqJjEVckniz9uuDNq7jrtqOp
 iiIOXK9H7ipaazhHSJ0khQZuyAxmWJqcnJDEHRDbyw==
X-Google-Smtp-Source: AKy350ZFQVWuMM/xJZ0R5M0CEOlKwEf+tOJfTPrLjorFoG+TI8iDAPhhbtrs7L2IUr/xCKRWOZkiHrwk6d+j9YLdzoQ=
X-Received: by 2002:a25:718a:0:b0:b8b:f61e:65ff with SMTP id
 m132-20020a25718a000000b00b8bf61e65ffmr11875056ybc.5.1681825531239; Tue, 18
 Apr 2023 06:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230414181641.8868-1-hymmsx.yu@gmail.com>
In-Reply-To: <20230414181641.8868-1-hymmsx.yu@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Apr 2023 19:15:19 +0530
Message-ID: <CAMty3ZD=SVZg=EQO9-mxPp9TZzu2hOpZ8qDP5asE276zbTJ7Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:Fix the panic problem caused by
 bridge->funcs->attach
To: "logic.yu" <hymmsx.yu@gmail.com>
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 12:52=E2=80=AFPM logic.yu <hymmsx.yu@gmail.com> wro=
te:
>
> When the code is executed to bridge->funcs->attach,bridge->funcs is NULL.
> Although the function entry checks whether the bridge pointer is NULL,it
> does not detect whether the bridge->funcs is NULL, so a panic error
> occurs.
>
> Signed-off-by: logic.yu <hymmsx.yu@gmail.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79..f3dd67fb3f1d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -302,7 +302,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
>  {
>         int ret;
>
> -       if (!encoder || !bridge)
> +       if (!encoder || !bridge || !bridge->funcs)

Would you please share the use case log where you found panic? I think
checking bridge->funcs during funcs-> trigger later in this function
would be a valid check (assume if an issue) as some drivers use the
bridge to handle downstream bridge w/o using any bridge functions.

Jagan.
