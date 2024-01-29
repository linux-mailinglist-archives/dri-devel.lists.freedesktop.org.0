Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85384036C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8CF112850;
	Mon, 29 Jan 2024 11:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8DB112850
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706526277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUxFR3bcXHTta+1PBg8XyG/gXzeG2AKh0T4pCbNWzhk=;
 b=bmTD+OEcWUf4OA/4Zu6zuhw3epjnQqs8bQefwIwRVSuyt7FcHSH6JYWT8tVNihyS4020Bi
 BVbmsFfKi/HvUiWi6Ml2Qoo6/uBD4Awjo8YKm/IhsBBpffNk+69314YNIYG9o7CPX8vR2L
 xCcJgmMra3CSe5V1B7wlUQEqLjx7dlY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-ud75roNZMb62sNnCxEpmHg-1; Mon, 29 Jan 2024 06:04:35 -0500
X-MC-Unique: ud75roNZMb62sNnCxEpmHg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2cf3a168098so26766931fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706526274; x=1707131074;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUxFR3bcXHTta+1PBg8XyG/gXzeG2AKh0T4pCbNWzhk=;
 b=lI8fnhX6mHgcko9dUBToUdggqrcUxs8nluIOwbrJaxJRbGYn7FxPRqK+zxGX6hG+Ai
 0s2MJIY0ofDpM0vWOYu/eLD+eTxoZRSQJTfY+LPXWBitMBJY4KFjBgckBGuyDAknorQq
 KfhcuyahwbO09vh0l6H6TZyT5nRBHgqftY32rWvkevjVH9RBdraySx9S6t29lpV8SZ4j
 gchI26r3qfR0Ddgfz9+ugytMcGQsxFLfym5F3YWHwFoMn3sWUOwukXgddpLymKXYIM/J
 ZoDxTqwFUDkRxahdS9vPUU+EqteXytBM+6DsaVSKkqq7IawFKIHA4cuwXVt4D6ar2WhN
 uXFg==
X-Gm-Message-State: AOJu0YwJsrcTzRHhZuXA2cMHFSKJoLNBzTFiXYD7w4cgbWc3f7EoWlss
 dud9xUcS5Hi5eppDqeYQNQoygSSO5ZOE4YJPHkDRSUn6/+H1VKSeepk0ObpD7653U9R0cLIwvQd
 f8FT8kUs4EScrxLcjX7JBuo6oPcfqes6MMEtCeP6eOWR4GAhOsCPxLQPD3r4HzAmSxA==
X-Received: by 2002:ac2:42c1:0:b0:50e:b8d3:143e with SMTP id
 n1-20020ac242c1000000b0050eb8d3143emr3378876lfl.51.1706526274519; 
 Mon, 29 Jan 2024 03:04:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+YRm9cnARxFv2Yk7TeaTF10Mp/qci6lPx2SZJuQwn7WAL5ifGgR2MNzRpI9RYU7JyB4YVlA==
X-Received: by 2002:ac2:42c1:0:b0:50e:b8d3:143e with SMTP id
 n1-20020ac242c1000000b0050eb8d3143emr3378864lfl.51.1706526274194; 
 Mon, 29 Jan 2024 03:04:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bw11-20020a0560001f8b00b00337af95c1d2sm710380wrb.14.2024.01.29.03.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:04:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
In-Reply-To: <20240117125527.23324-3-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-3-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:04:33 +0100
Message-ID: <87ttmwv1ry.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add screen_info_get_pci_dev() to find the PCI device of an instance
> of screen_info. Does nothing on systems without PCI bus.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
> +{
> +	struct resource res[SCREEN_INFO_MAX_RESOURCES];
> +	size_t i, numres;
> +	int ret;
> +
> +	ret = screen_info_resources(si, res, ARRAY_SIZE(res));
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +	numres = ret;
> +

I would just drop the ret variable and assign the screen_info_resources()
return value to numres. I think that makes the code easier to follow.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

