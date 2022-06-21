Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F68955288C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 02:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D96896A3;
	Tue, 21 Jun 2022 00:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C80896A3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655770558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=am4ljrsE7Ufjfmqsop2MzHsqSlEXrA5rSRIM1yT2FYE=;
 b=P5dRtsSKvV3QKbbOdEXRRj7ZY4MqanQrTt19Kdz7fCwkp/Xfa2FZdSX39CLp3blWQkHW3d
 7KY+FW18aC6fDGOA32qw5O1iep3JWnx0YZ8wdS3Fj4/vAqkTRsJNnuDPKMPmw7aI/Gq+Gt
 V2CVktJp25Zw/rUIIP/SJX0H/dqG4lM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-lwqOtcfxNmKn_C9kyZ8oyw-1; Mon, 20 Jun 2022 20:15:57 -0400
X-MC-Unique: lwqOtcfxNmKn_C9kyZ8oyw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u18-20020adfb212000000b0021855847651so2813191wra.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 17:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=am4ljrsE7Ufjfmqsop2MzHsqSlEXrA5rSRIM1yT2FYE=;
 b=rFNv46SRsjrHrub5RQFD0ll41mX5dxzNUU5FG5inW5XxA8f73UbiOUFbwHOX89ULOE
 J2EhWWSbL0b0nTuFJVSiwocliNWAPx3cfTwGMX8QJ/SrJoJrCHCqIhO7GNOLlubMSDtW
 ogOdYKeqj4ye0z3u+W5aU5RjlWiZJVQm7kt5RYlnO6gvjdfArEg0I41oPItUB4r26p02
 OW17wIw46/2EO0HoS0qdE+itJgGknYA+588pCDErgNPwGhKbAKY3wMOofmsIeTtvUwS/
 DNBvoN824RXROSFtbA8emLz2Xb9uXAe8+eS5gHeUGx7u3rAuln4hizhqr67WioHGgwC7
 U/6A==
X-Gm-Message-State: AOAM531qkYxWNQObJ7Q+sEb/MBPTvHTDk7M6UVpJdgaoEOLhlVLbsQ3m
 6e82MJuqnsszXYFxP3aSxwM2/F90ckQN+vc0NHbXW4pGqS14ixgwuFuw1eQ+YruD11EDIF3MSvw
 yL8ATQ5zltasUarTHLdrtimf1NByB
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id
 m5-20020a05600c3b0500b0039754ce0896mr37343016wms.3.1655770556334; 
 Mon, 20 Jun 2022 17:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuF9L1be7ni3J1YmYNIb9c4ZabGtFSUgGjCv0tSabp2R2QRhWX6wNq50I5/oKWe6fZHu9qDw==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id
 m5-20020a05600c3b0500b0039754ce0896mr37343003wms.3.1655770556103; 
 Mon, 20 Jun 2022 17:15:56 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e13-20020adfe7cd000000b0021b89181863sm7340790wrn.41.2022.06.20.17.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 17:15:55 -0700 (PDT)
Message-ID: <e6306933-45c4-f38a-bae1-3ad149d67e1b@redhat.com>
Date: Tue, 21 Jun 2022 02:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] vfio/pci: Remove console drivers
To: Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541193265.1955826.8778757616438743090.stgit@omen>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <165541193265.1955826.8778757616438743090.stgit@omen>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alex,

On 6/16/22 22:38, Alex Williamson wrote:
> Console drivers can create conflicts with PCI resources resulting in
> userspace getting mmap failures to memory BARs.  This is especially
> evident when trying to re-use the system primary console for userspace
> drivers.  Use the aperture helpers to remove these conflicts.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---

Patch looks good to me. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

