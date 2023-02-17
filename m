Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FA169AC4F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9E10EFC6;
	Fri, 17 Feb 2023 13:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893AC10EFC6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHTTkQIInijQsBo6Tyb0eix7J7CwbxOKluNp4037RtQ=;
 b=UHOtLgFrfqBL8Pe3JbR1Q7rYpXSd7TRTYS6y7b2dJmGDh7F00ZGAVyagorRWmHyLrF1jPx
 Hpqc3rRVQYvw9La6ciiK8ulrz73tWo/c2h15L5/hoL4x7Xao+cqq5MJGMQxvqbF6DTaU4Q
 8ptKJRWsO1WzDT5gl1CZJT5HkkpEmBA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-k90e1A0pMbq2I_isD4DJBA-1; Fri, 17 Feb 2023 08:22:46 -0500
X-MC-Unique: k90e1A0pMbq2I_isD4DJBA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l36-20020a05600c1d2400b003dfe4bae099so634247wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dHTTkQIInijQsBo6Tyb0eix7J7CwbxOKluNp4037RtQ=;
 b=ZasUyZK/iKuts4lloH0ECHqGUkcx9XfcFA6VRo2YpkjXU4K2momw9MLOfSH9IKLxOs
 7sBv2j7nestVy4HDIMA9WrKFmzAQI6c9lPgMt5w//HFKXBf2Br0XCleeqes/VViaowYv
 t9qJFsVAmZ3TxhAPkm8lMdurWE6GwIZRjBQWwgoAsjj2malDOT74StP+Vm9gEMHvIbTB
 7A1wa+LR+jsLc+QqU4ms5iPewX9eOfDn11n+jxRkZ9R2ywiIzNiP+A4M4nf2R8AIAE4Y
 Hl9za0rw31Qsf2ILmKCillQITra203W9FgS8HKIWAXOnjTI/ihmfrkvZmZz37txDe9Hh
 rPIg==
X-Gm-Message-State: AO0yUKVn1souxQGyNhtHe4XgdlrSKSksKhB5wk39rc8Xaa/IRYQapNai
 EGilBFBtRUOtyWU8odvx8d76IAkWUES8sDPhP4S2KrGvTlU0ICbQbD+ztgHfdzFstaFdvDgfGDu
 +lA8P655hHunmVQ51eVLyRgB9a5Eh
X-Received: by 2002:a5d:4903:0:b0:2c5:595a:1c91 with SMTP id
 x3-20020a5d4903000000b002c5595a1c91mr334775wrq.7.1676640165857; 
 Fri, 17 Feb 2023 05:22:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZkyrsQKOT4eHEjIOqu4hxBu+1IF4tfiX2oc9TPDEIt13mMc/s4nIQ5pQ5Y/UBRU5MWNEEbA==
X-Received: by 2002:a5d:4903:0:b0:2c5:595a:1c91 with SMTP id
 x3-20020a5d4903000000b002c5595a1c91mr334764wrq.7.1676640165604; 
 Fri, 17 Feb 2023 05:22:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m2-20020adffe42000000b002c5d3f0f737sm2142806wrs.30.2023.02.17.05.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:22:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi, tomba@kernel.org
Subject: Re: [PATCH 1/6] drm/atomic-helper: Add atomic_enable plane-helper
 callback
In-Reply-To: <20230209154107.30680-2-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-2-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 14:22:44 +0100
Message-ID: <87r0uoifyz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add atomic_enable to struct drm_plane_helper_funcs. It enables a
> plane independently from updating the plane's content. As such, it is
> the inverse of the atomic_disable plane helper. Useful for hardware
> where plane enable state is independent from plane content.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks a lot for adding this. I remember wanting a plane .atomic_enable in
the past, and due not having one ended adding the enable/disable logic in
the encoder .atomic_{en,dis}able callbacks instead.

From my understanding of the atomic state helpers the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

