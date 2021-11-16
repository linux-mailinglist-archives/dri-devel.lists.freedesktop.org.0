Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9AD453B8A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 22:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC96F89DD2;
	Tue, 16 Nov 2021 21:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D053089D58
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 21:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637097480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4ttEiULMGdMkhTFpGiltGiBnhVT9018p53mbEP4OWA=;
 b=J81VOHKyenB+e/rWLuv+VBa+6X6OxB9SZg1cno/QHPSIUcfr8uUz45UpKB2OnMwYXWB9sW
 gsfDZyWH8yMznxFOjRrx+gxN/o+ABsmLPYx4jjHitFeCrHUaRc8/kA6+AzJ5cVoyrYjl46
 5MrR46M40xE6r5k9PtHEvRWxJjXjPpk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-nJvN6jSSO-CTRk0bLrkbEg-1; Tue, 16 Nov 2021 16:17:59 -0500
X-MC-Unique: nJvN6jSSO-CTRk0bLrkbEg-1
Received: by mail-qt1-f200.google.com with SMTP id
 100-20020aed30ed000000b002a6b3dc6465so371315qtf.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 13:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=z4ttEiULMGdMkhTFpGiltGiBnhVT9018p53mbEP4OWA=;
 b=CXtLqCle0IgwOENKCAsz6JkC9vE03pMBSARe2aDIrOVbSbFPekOdHSvIzWst3gIA1n
 ROLhZA8nUPSd994qwgrDCp9nPpHABDtAvvG7nv+bzlnLla23M1apv96VfKyTGymlGoRQ
 5sSbp/15mq+QvDE5UG5BPbOf1Os2BM9TtukQG5lsKdCWUuTRGGdIIyEKcCztfGOjmMRR
 jecKiDgVMGpAvpK2Ek7dk3pQYI5eNLm1LMiSYgVuwqJg76Fm71ux1pH/QGZMvS5N6esW
 XDlGWLGDkN/mTO4XMuIi2I+ZzbQD53YmZvR4FvUgoHlekaE+gubQumO7JaoJav1zW+OV
 G9ew==
X-Gm-Message-State: AOAM532UcjoiqxwNOdBaKpZ9OUJPZ4XHtWlyVr5rcoYzxITrtNt6FkJi
 YmiYqvKEfJQ/haNhZQrbHYVLw0c6LAF01G84ScviaiJlBnEWu/nsezVD2f6aB9YYh5/Irl3eDut
 vW2QZ3bwyv9fZD522RVGpnWI1HeX6
X-Received: by 2002:a37:9d8b:: with SMTP id g133mr8461205qke.180.1637097478674; 
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz62Hg/kjKrougWFbpHWD2ssL0dJuk/qAO5ctquOWFbZqBzjVoR9pGuski9Qq326P5ilEvfEA==
X-Received: by 2002:a37:9d8b:: with SMTP id g133mr8461185qke.180.1637097478494; 
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id y16sm9564415qtm.12.2021.11.16.13.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
Message-ID: <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
Subject: Re: [PATCH] In function nvkm_ioctl_map(), the variable "type" could
 be uninitialized if "nvkm_object_map()" returns error code, however, it
 does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
From: Lyude Paul <lyude@redhat.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 16 Nov 2021 16:17:56 -0500
In-Reply-To: <20211116070708.429432-1-yzhai003@ucr.edu>
References: <20211116070708.429432-1-yzhai003@ucr.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a very long patch name, it should probably be shorter and the
details in the patch title moved into the actual commit description
instead. Also a couple of things aren't formatted correctly:

* Cc tag for stable is missing, see
  https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
* Fixes tag isn't formatted properly

I generally recommend using `dim fixes` from
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
in order to get the correct stable kernel CC tag and Fixes: tag (you can
drop any of the Ccs it gives you beyond the one to stable at vger dot
kernel dot org.

Also, if you could try to Cc: me on the next version - will help me
respond faster :).

On Mon, 2021-11-15 at 23:07 -0800, Yizhuo Zhai wrote:
> Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
> be passed to map function")
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index 735cb6816f10..4264d9d79783 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

