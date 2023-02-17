Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1145369AC5D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA4110EFD2;
	Fri, 17 Feb 2023 13:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA0210EFC9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5nN2pkIUHBFG+z0Sr8B2N6bHF0HcFQb8tp1F8SWBhnM=;
 b=HZEf8S+9oISDo7MhvSxsbU/M6CNthhRyjifSN5oTGsbXVtSF/XVAFy5ZHeUiVDVwewKotD
 UgjtuYhZ6kr+wbmfUHZ1WnsEZ4+BkvNYrvtpb/JmQtItT/fARt+9Ql7Ca0+iQ6K64Bzo2c
 HeV+hsrmg5EOFLiTskl1s5Mby88aMZM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-MJ0-jWr9PiWHeIhAd1VyjA-1; Fri, 17 Feb 2023 08:26:56 -0500
X-MC-Unique: MJ0-jWr9PiWHeIhAd1VyjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p30-20020a05600c1d9e00b003dffc7343c3so631404wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5nN2pkIUHBFG+z0Sr8B2N6bHF0HcFQb8tp1F8SWBhnM=;
 b=KlGp5R0KqdhlVYHJD1kTf0DTI7uVxFB86K0lyjTv+NTTxDI1WA6Wg78mlG96iWiaOJ
 NihFoxVzYNrFX/qQdGc3/6EmsQDiYY9nIkpyr/FEixTRW1vy18PtkiNRSm8ZB/6wXxLk
 4D207o7q1aUwguhKw3CjoD67hog3DUnPcBXVljbV2MveyUQR4n5FsmQo7Oaq+NZKZo7M
 Y4p0uIvNn8+GvO+vL+4HuscnIBOQeIRVnG53Xvpzx1WJt2FzD52c0qASKUFeUj14avNS
 m4yP42EvBpb2PMNsOoemk8zA019Ojk8ExgtqcHdvIPGYRgnQa6NMjdABEeQr4n/ugB3X
 9Sow==
X-Gm-Message-State: AO0yUKVuvJMqZpDaubLRoSDpimjKWoIHpZsGNjggdxx69ZfttX1slPpl
 q4T/MP/1PLx/NQqnfXZhdfjSmNlfNghii6t19fAwwuic/VA9ir6bjkHnom/4NaXGvZ/fU5TZyQJ
 SfmwZM+1qmO/63Gf5pTlu3/X6cPSQ
X-Received: by 2002:a05:600c:1608:b0:3e0:1a9:b1d7 with SMTP id
 m8-20020a05600c160800b003e001a9b1d7mr151871wmn.19.1676640415273; 
 Fri, 17 Feb 2023 05:26:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/xiSQHkn/wKuseNGy+j7gGtHia4oH1m+Y30p9/1pNyNDLTd+QhqkC++XtaD4OrqQoP23zKag==
X-Received: by 2002:a05:600c:1608:b0:3e0:1a9:b1d7 with SMTP id
 m8-20020a05600c160800b003e001a9b1d7mr151862wmn.19.1676640415042; 
 Fri, 17 Feb 2023 05:26:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c214600b003dfe549da4fsm669469wml.18.2023.02.17.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:26:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi, tomba@kernel.org
Subject: Re: [PATCH 4/6] drm/mgag200: Implement struct
 drm_plane_helper_funcs.atomic_enable
In-Reply-To: <20230209154107.30680-5-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-5-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 14:26:54 +0100
Message-ID: <87ilg0ifs1.fsf@minerva.mail-host-address-is-not-set>
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

> Enable the primary plane for mgag200 hardware via atomic_enable.
> Atomic helpers invoke this callback only when the plane becomes
> active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

