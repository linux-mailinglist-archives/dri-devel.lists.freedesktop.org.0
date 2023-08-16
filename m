Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A777EDC1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 01:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157110E3DB;
	Wed, 16 Aug 2023 23:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A010E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692227909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e27Prao+8w59knGJmOWj+3FndpKc2qgsbyaKBRsKylU=;
 b=cOr4+CLaNVRyIwly00TxfGOca2HTrvUAzMT7ZjC/tdSoBczqZVb95RHv9foCVWWVvBKzX2
 nP42+fjnG/iJPgfGBf3Kiq/B2RSmQBLmNeHq0LKRy9TSISPEJklYP8tX+AQ9Z4h+t1j+tJ
 2wbN2/THEruTzsAj2mAzxvm+WKSfBog=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-r5KMO74sOvSfcRHo3aw2FQ-1; Wed, 16 Aug 2023 19:18:25 -0400
X-MC-Unique: r5KMO74sOvSfcRHo3aw2FQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe5c8e8a47so1420607e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692227904; x=1692832704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e27Prao+8w59knGJmOWj+3FndpKc2qgsbyaKBRsKylU=;
 b=Bq9KCSqeCD900+xQvVq9gtZy+l+dmioHWYLInVcz/r8Lcqou5oz4jY+Vp2IzM05Rlw
 +sCDHBfQiQ6/xu25wDFUFvxrCpMgM6II5NjbKkLdFcUXVues6Fm3eRnt00jVLOXwj6iz
 AQH5Aku+9AN04/kQsYxPlJY6UIdbbvjnZMYVAk0RIrZT5d75MjOfxlLK1mNbqFeOD3zH
 BgGLoVjEYxrkLL5qVRczUZgn/N70WJcmRxM3/bTHuxmd0qCFGg9f+iIHQ2cRj4ikahuU
 4WukZpBcyNeKRcbq+IbexZvGl07URgRtIg5b4Kr68FCIcCQzKUo87ZbNsdmOAJ1zvP0d
 URCw==
X-Gm-Message-State: AOJu0YzcIFHz8bTgPN9TlrLO9WH29oko6JpwLDtDGZPDcjeSiZP9aGEv
 5Kin+Ulu5laA91vCj2l2UVPUKq2IVdge3STkrOzGlmKaylcyK2w+MtKqB3ohB5dzZmRvfKPvKvc
 5Yynf/DR5tMJxsqwGldpShsQRpv7YLFuPjDbfoiXQsGNk
X-Received: by 2002:a2e:535d:0:b0:2b6:af68:6803 with SMTP id
 t29-20020a2e535d000000b002b6af686803mr2442421ljd.4.1692227904015; 
 Wed, 16 Aug 2023 16:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1K6kBGziG4deNuHLAraS88W59a/Ay7fpQlOgwaRtMAQHHcJu47CsepbxS6R+gOkE0cHNdxbWZY06UjdNnDbI=
X-Received: by 2002:a2e:535d:0:b0:2b6:af68:6803 with SMTP id
 t29-20020a2e535d000000b002b6af686803mr2442415ljd.4.1692227903720; Wed, 16 Aug
 2023 16:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
In-Reply-To: <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 17 Aug 2023 01:18:12 +0200
Message-ID: <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling of
 nouveau_connector_create
To: Borislav Petkov <bp@alien8.de>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 12:14=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Wed, Aug 16, 2023 at 11:27:05PM +0200, Karol Herbst wrote:
> > that GPU has only a `DMS-59` connector, is that right?
>
> No clue. How do I figure that out?
>

do you have one of these? https://en.wikipedia.org/wiki/DMS-59

> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

