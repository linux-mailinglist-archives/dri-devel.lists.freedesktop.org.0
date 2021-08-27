Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DAF3FA15C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 00:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00846E9E0;
	Fri, 27 Aug 2021 22:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB56E9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 22:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630101748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6xavDxclU2457G1Vw6lUkX39komt2IDfPFEDUjuZSY=;
 b=KHpD8/AqrOnWcZZctEqNWD2Uz7Ol4JBYzD9GEjE5UPT6iSj1mnh7FijBr1WXQ1vfW1cU0Z
 89AQftZEq1ldZEMUZNHE4tRKIyu4jbDAKAVhFBcQ/+Z8RFyugI9kwiiebctW3lVGjMfioh
 UpjfgG+MBQVZ/QpxdCNXsdbkME9539o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-kNZnvu9RPhmZYjUG2DntgQ-1; Fri, 27 Aug 2021 18:02:25 -0400
X-MC-Unique: kNZnvu9RPhmZYjUG2DntgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so619305wrm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 15:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6xavDxclU2457G1Vw6lUkX39komt2IDfPFEDUjuZSY=;
 b=QZcj9G5nAuxqxPVe/OUtFstyt+LImSPye3i5Pcc/ApEA+5tfjFbgsWSb0SyA6noXnq
 aJjiATscb8pyxJJy0qxXocpyXgbZdPa2zXFOIQManm3NMI7yIA9UzPmNgkqVcnSXcFAW
 M6WOMMhxtj+PyYKIhGeRq7X4F+5fulWx69oy0Qs+f+GQegFZ4cs82Q5TX9acoSZW0/TK
 KiCEao2WsrWzPrdTXYxO86G9pjz8XtsNPSMF6jV9/5wtAezY88NMDhbN4r0YpAhETboq
 f8pxBznuO7UxfcZGeRVhOFeUFvhxhIu1rXa8EvSojMuIkz8UoqZCAnBw/qe0pPy2IZeD
 cjqw==
X-Gm-Message-State: AOAM532/WlWJXE6/pbneJ2nkB1oK14tEElpHtNCYl06XHE0EZy0p/lkY
 CwJgd971vNZKoWUX6rvmBs778lkd/XfzGnI0z099TTgdWprVbMSjM8fvGHWKzlprBSpYL7QhXGh
 Zjo7sDgXZx+hC2E8ci/9IWElnpzov
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr11883613wra.245.1630101743845; 
 Fri, 27 Aug 2021 15:02:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0sjJPekqAFrzI+I21wArpuNqneRzwvRM7qmHiOpufcRJPM7zXryENkyja4nv3/Jn1chky2g==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr11883596wra.245.1630101743658; 
 Fri, 27 Aug 2021 15:02:23 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z126sm6853997wmc.11.2021.08.27.15.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 15:02:23 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
References: <20210827100027.1577561-1-javierm@redhat.com>
 <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
 <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <a7395626-f022-5c89-07cd-c30d0d52d3dd@redhat.com>
Date: Sat, 28 Aug 2021 00:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel and Thomas,

On 8/27/21 10:20 PM, Daniel Vetter wrote:
> On Fri, Aug 27, 2021 at 07:50:23PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 27.08.21 um 12:00 schrieb Javier Martinez Canillas:
>>> This patch series splits the fbdev core support in two different Kconfig
>>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>>> be disabled, while still using fbcon with the DRM fbdev emulation layer.
>>
>> I'm skeptical. DRM's fbdev emulation is not just the console emulation, it's
>> a full fbdev device. You can see the related device file as /dev/fb*.
>> Providing the file while having CONFIG_FB disabled doesn't make much sense
>> to me. I know it's not pretty, but it's consistent at least.
>>
>> If you want to remove fbdev, you could try to untangle fbdev and the console
>> emulation such that DRM can set up a console by itself. Old fbdev drives
>> would also set up the console individually.
> 
> Yeah given the horrendous security track record of all that code, and the
> maze of handover we have (stuff like flicker free boot and all that) I'm
> wondering whether typing a new drmcon wouldn't be faster and a lot more
> maintainable.
> 

We talked about a drmcon with Peter Robinson as well but then decided that a
way to disable CONFIG_FB but still having the DRM fbdev emulation could be a
intermediary step, hence these RFC patches.

But yes, I agree that a drmcon would be the proper approach for this, to not
need any fbdev support at all. We will just keep the explicit disable for the
fbdev drivers then in the meantime.

Thanks a lot for your feedback.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

