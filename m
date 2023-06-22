Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86573A0EC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F7810E1AB;
	Thu, 22 Jun 2023 12:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A5F10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687437050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stc8evGnDDpmXjdbQdBrRjBtyPvD68x7ziZzLCZcBJs=;
 b=Fotf6dZdJVY0xMyw0NLZdpDKa7A/fulzJrM6YgFPdPqRV6nKDOI4FocbHO1q1+pVFXk9wG
 H4Mx+nZ+8Lf+eYs5X4oz01mroQtzsZSNGTsc3/F2q+mq4onY1o3z7v8nTJi/6T3wNej1j+
 /a5FtHVh5PDC7hp5Kd/GFCcxTf0RmZ4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-JQF2tWQfNXy57r-i9_6MGQ-1; Thu, 22 Jun 2023 08:30:48 -0400
X-MC-Unique: JQF2tWQfNXy57r-i9_6MGQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f86d450b01so3876259e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 05:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687437047; x=1690029047;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=stc8evGnDDpmXjdbQdBrRjBtyPvD68x7ziZzLCZcBJs=;
 b=K/w5PmTEd+XIWp9ySBLc08ErkyW/34wOKLz24EfcIeqxec8EdymTiMs8ZAKR+lDGY2
 pAead2cpxkV+FfC1Lz76EDyaTXjjgzMFqnUtIvrseGdENT3HmfMLyms+rLNzHewLKDri
 QOfzVdiDgZRPOqj0Yo5CiaG2wVgjcJZ0Z58ry3PlDgih3PcvK9BXQLA6FVu9BTHFfngU
 4gtYG170bHk0AK4+DN+MOtLI9iKynMZRS2AbXb+DYi9W66FWjotfQ9N03ZpOYMIGNsJR
 imNmlHCIi1jeeuZbuGgDjgLJdWMci3drNjvb498pV3OV2jdPHaTSGKed+hkKSeK//H9a
 uj+g==
X-Gm-Message-State: AC+VfDx0yfnZ8Zq8x+izjWBBz2uadCLyrKYb2PESlIZpGe9dCDswH3/t
 J7xgH4CrCBgrWgHhBhJq8mqvtmvbm/ZxTCk6370mCL2z7T93OQL/gl+8mlhL9pCJ6oaf2BTj6tG
 2wf0iHjONedMHdZSfbuaNyaa1p6Hn
X-Received: by 2002:a19:5e41:0:b0:4f8:49a7:2deb with SMTP id
 z1-20020a195e41000000b004f849a72debmr10149668lfi.8.1687437047149; 
 Thu, 22 Jun 2023 05:30:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7biiNx9ILW7ILK23qr0T8GMiDK1wNbm4GZ3fgXl387sQPGqC4MxiUus7jFn4U2cw9kCo72bw==
X-Received: by 2002:a19:5e41:0:b0:4f8:49a7:2deb with SMTP id
 z1-20020a195e41000000b004f849a72debmr10149647lfi.8.1687437046661; 
 Thu, 22 Jun 2023 05:30:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adff6ca000000b0030f9c3219aasm6910388wrp.47.2023.06.22.05.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 05:30:46 -0700 (PDT)
Message-ID: <bc82a1d3-07cd-53b0-7f1d-0f71850cdb14@redhat.com>
Date: Thu, 22 Jun 2023 14:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for mgag200 and ast
 drivers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
References: <20230530142615.57014-1-jfalempe@redhat.com>
 <9fdd63d2-12c6-d589-8b24-3c9333ed98da@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <9fdd63d2-12c6-d589-8b24-3c9333ed98da@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 09:08, Thomas Zimmermann wrote:
> Hi
> 
> Am 30.05.23 um 16:26 schrieb Jocelyn Falempe:
>> I've contributed to these two drivers, fixing bugs and performance
>> issues.
> 
> Thanks for the work you're doing.
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 


Applied to drm-misc-next

-- 

Jocelyn

