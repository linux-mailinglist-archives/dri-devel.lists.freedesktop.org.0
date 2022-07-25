Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1765800F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 16:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9457BCDD7;
	Mon, 25 Jul 2022 14:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9A6BCDD7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658760519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrIFLSXgxumLrr5N+Xm5tSy/MudCUAu7YLr1DhCbnqM=;
 b=CKvRxYy2ZmshwR8XQ5M4MSV7hkM/R7qMl3gfku7c+4+zEhTzOJ5XhNMebLoGGuRL0eKGFL
 5lklxz+lvnrQWw2KarDImL7dks66XxCQdVrklYSVBGfcPk6mLFTjzfpqaJKFclkPVriJJb
 FTxYLApYdDmKnY5U3LBWJGozFNv+T5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-i_aw-uAcNX6W5woqmzRppw-1; Mon, 25 Jul 2022 10:48:38 -0400
X-MC-Unique: i_aw-uAcNX6W5woqmzRppw-1
Received: by mail-wm1-f71.google.com with SMTP id
 az39-20020a05600c602700b003a321d33238so6297948wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 07:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MrIFLSXgxumLrr5N+Xm5tSy/MudCUAu7YLr1DhCbnqM=;
 b=rMVF1jzCGoV2EcwMbVJ1I0Gh3Ft/ROZZ8thxu0hXDSgXmwLN1muc5eZoT/skCkgxwn
 B3rl4Bj72knyfCki8/+AgQecOtxW7fKCzgcDX0KDdDWkWg4ou27TDx1F2JBnm4qX1+zd
 ketDayEmzSk3BtXbpiNXOjicqSfz26yacbSLEaOvIsn6c+xubtU8Hec8Av0P41S8pAnb
 7Oxk7ottg3Lazh6T+TOHsgXsGsbnbSZGdVsyDFlMP+3TeOlTVYCdzB9mpDwJW4aIjOe9
 wR/2c0mizOmZLgjglWkXVIoesIl8miDDyp1moXo8bGgUoSD8MiFe9DnsQhsy7L98OHxD
 wNRw==
X-Gm-Message-State: AJIora+UkpGEXSiDqchdtuUco4/2GKvuzh2k3d0V/pJ0cUCUAmBx3UTj
 xm4Ik57HPoNwVF3DqhoemTT0fPxZbmks9qTvql8o9JStQyteSQ7j2sX907zoOq3Oq8xuWP5KGVD
 I8P8gthQ8xWdfvP7HplVAoey1Ts54
X-Received: by 2002:a05:600c:a188:b0:3a3:1802:e327 with SMTP id
 id8-20020a05600ca18800b003a31802e327mr8922438wmb.41.1658760516686; 
 Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnzVVUGDwiw4pcTWx5MAYSq6VOtiToiDObHgJ6Zic+31l2117wCx4rJ9QK42iIFmUvvV3/4Q==
X-Received: by 2002:a05:600c:a188:b0:3a3:1802:e327 with SMTP id
 id8-20020a05600ca18800b003a31802e327mr8922426wmb.41.1658760516510; 
 Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b0021e6277bc50sm10775122wrw.36.2022.07.25.07.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
Message-ID: <faad4b2a-c3dc-e6b8-ee2b-7aa920db3c0d@redhat.com>
Date: Mon, 25 Jul 2022 16:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/10] drm/simpledrm: Remove mem field from device
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Remove the unused mem field from struct simpledrm_device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

