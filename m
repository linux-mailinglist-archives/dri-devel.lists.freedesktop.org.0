Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF5E4C5146
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C079B10EABB;
	Fri, 25 Feb 2022 22:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADCE10EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645827088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3VxtWAMog8m5ArNU/BgenbWuy7FcGC+lz0O8q97Sw8=;
 b=Rewd7viwx0OkgPiaqXpobyInoqsiuuerWpBNC106v713Afn/XHSb2peqa4G1s3kaTv7N6p
 uSakCapbVyrMYHknpbg1mpS28HKX2h8xwOz7vET0YP5VWbMG6veipUI+zK7QcfhtqEYJ1l
 8fB44oX7A2E9yFzHgkxII8ap0CAhzNI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-jagw6mkdNhOu6vozBpUChg-1; Fri, 25 Feb 2022 17:11:27 -0500
X-MC-Unique: jagw6mkdNhOu6vozBpUChg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so1990238wms.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j3VxtWAMog8m5ArNU/BgenbWuy7FcGC+lz0O8q97Sw8=;
 b=1iJx68dVkAFWJGD54xrBYeR7LDAjcel2BkvEbLE7uz1zm1fuYVtJjaqkNxWYpGFC1Y
 9FIT9Yxgw7QXZZVmNe4jjSus32mabsSVXkYkstQZGFzC27MOcM7zpuOAujqAv8RRRj7V
 ++5ptNKrL1q7BlAjd9B8pVDTbNiJI8s4gWkI/rFCFUfAoYvXz3Q14+1qpQhv7GTR8Uin
 VXQovKoZtKk07jsbKMD1/DUK+cAPwe88fVPShze25BHNQbJ+fwUINCzFdeBStKZ1q/0B
 pf3RzB/mnGl1MvEFZZ83Hz1hpsXd/+4i4ghNPyMJz7c63Rt4Gr3xraViBAsQ1vGvD5WE
 dgAw==
X-Gm-Message-State: AOAM533m7yRJBnIWuuHFxQVdOxvoF3KPpMOB2D7lXzQt0NDNTcJ5sIHm
 7jpIgPPyHkDfaAss80iOFeHbc6HH6nIhB5SCg9B1WLZ8rjwpi3d8prfv9nBcNmFzAg5B1TY9Ln+
 iPoAfTRCH1NAEyT/zJaOLMcTnQy4h
X-Received: by 2002:adf:e3d0:0:b0:1ea:9be0:3162 with SMTP id
 k16-20020adfe3d0000000b001ea9be03162mr7706155wrm.205.1645827086222; 
 Fri, 25 Feb 2022 14:11:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpYbnDqQh/prWaTqz6c8tOt2xrJUKB8Clt1MsSwRkjB7ijhcF6OjzqFxBwoqAxNJNzJXwD4g==
X-Received: by 2002:adf:e3d0:0:b0:1ea:9be0:3162 with SMTP id
 k16-20020adfe3d0000000b001ea9be03162mr7706135wrm.205.1645827086036; 
 Fri, 25 Feb 2022 14:11:26 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b00380def7d3desm3652202wms.17.2022.02.25.14.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:11:25 -0800 (PST)
Message-ID: <272b6278-b153-1e12-a542-0f9706c592a6@redhat.com>
Date: Fri, 25 Feb 2022 23:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/3] efifb: Remove redundant efifb_setup_from_dmi stub
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
 <7416c439d68e9e96068ea5c77e05c99c7df41750.1645822213.git.msuchanek@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <7416c439d68e9e96068ea5c77e05c99c7df41750.1645822213.git.msuchanek@suse.de>
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
Cc: x86@kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Martin Mares <mj@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-video@atrey.karlin.mff.cuni.cz,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/22 21:51, Michal Suchanek wrote:
> efifb is the only user of efifb_setup_from_dmi which is provided by
> sysfb which is selected by efifb. That makes the stub redundant.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

