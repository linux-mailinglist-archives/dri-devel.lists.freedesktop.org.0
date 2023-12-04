Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCE802E57
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05FB10E310;
	Mon,  4 Dec 2023 09:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AFD10E31A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701681434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVUqyeH/hhJqCTCVnx9jg21J9DGkx6d319y5o3VQXDE=;
 b=YFyNuMZYPz4NbMrOii2rrf8xp1Yg7iSoQOMzMDqpAwG1TJxS/AkxYyL6Rw39gpvjo7gHJh
 0GKeQoh6bMSdw2dxKeRLNUWwIdCD6NWX/m+MlO20FBWb82PooEpdTuMoPS0vu6mEjdmkUh
 tdENw36m/V/JM6rO6s2ITXEpAtLraE0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-vUbpPenTPau9XvhQ1n7whQ-1; Mon, 04 Dec 2023 04:17:12 -0500
X-MC-Unique: vUbpPenTPau9XvhQ1n7whQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50beec1480bso949436e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 01:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701681430; x=1702286230;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVUqyeH/hhJqCTCVnx9jg21J9DGkx6d319y5o3VQXDE=;
 b=kOiy/aWxQHrN+dvdAwAEk+nMBtidMawoyjgYz4b/DYCt63V7Oz7MK6OJs0Fy5q01f8
 3UhIqQxU0ev837aIOr/wihRn3P8cuYh0K1f3AJuMNIBJDIXR7JPMJjejEk4uBRDzE4JJ
 suS2xHb3luaB04wRxRL8OZvrMTnVlI/evcu1A28FyWJjKcYHcoeIiHjzbZ8+g34kGa6m
 MFyFg0hEVsWCxNamggIGw8U3ffSF3HED33mcMwDVKdhmrnrLMhk7NcOOmS1h2jBTnKtA
 kNCicEnOCK8lU6FB71RlAyPzVgnyxnOThBWzzN7STf/9rRPZCqH2nk6/2OOJw8nBRI/w
 p9jA==
X-Gm-Message-State: AOJu0Yxybd0A3DLV7JIB1ZWUOGx0xyYLeFrr2oZPHeA+DQVfjAf160E3
 fBJoAFNNOAuejiaug3+YpWxILf02v416WeMxnfHUcMop+Dh/t3nIyPnxVQ+KC8jEeofKebVlkj4
 zq5GzO4yTS193tUZdakaCyhBVJWvr
X-Received: by 2002:a05:6512:15c:b0:50b:fd82:8998 with SMTP id
 m28-20020a056512015c00b0050bfd828998mr183092lfo.28.1701681430811; 
 Mon, 04 Dec 2023 01:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzjMjZN6cLv07PRQZ2ojaXg94icdbG+1QZ0CaD/aYYcq8mlzQDzyXWFyzSxSXzXqQQuIcgGA==
X-Received: by 2002:a05:6512:15c:b0:50b:fd82:8998 with SMTP id
 m28-20020a056512015c00b0050bfd828998mr183087lfo.28.1701681430481; 
 Mon, 04 Dec 2023 01:17:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cp6-20020a056000400600b003334520e49bsm3314789wrb.53.2023.12.04.01.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:17:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jean Delvare <jdelvare@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
In-Reply-To: <20231202213218.7af5ec77@endymion.delvare>
References: <20231202213218.7af5ec77@endymion.delvare>
Date: Mon, 04 Dec 2023 10:17:09 +0100
Message-ID: <87cyvmxr6y.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jean Delvare <jdelvare@suse.de> writes:

Hello Jean,

> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

