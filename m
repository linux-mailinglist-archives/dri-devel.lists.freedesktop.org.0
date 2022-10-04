Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0145F4C3A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1032710E2B9;
	Tue,  4 Oct 2022 22:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F80910E2B9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664923962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xT8jK4ncWfpvFsYgIEzvsC4Ct3LaK0iDPxvQa05vrLA=;
 b=AVGzmgZKzRMZZ8V1JP2kIw9okUlKN5IF3NUXvyiuFYp44XLnSysGdL9HkXFBzOIRhP5jYQ
 BsPPETOIt0+rhlLuVRefL2JusxXG/TqALsiSyvPmN0EioYpafjM7xeqVkfVv1bKvaESKQF
 cYs+nGUKog4m2gbFzuWAf1XVYPCj4/Q=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357--AYxDcHsMke9yrxLhcAT4g-1; Tue, 04 Oct 2022 18:52:41 -0400
X-MC-Unique: -AYxDcHsMke9yrxLhcAT4g-1
Received: by mail-io1-f71.google.com with SMTP id
 l84-20020a6b3e57000000b006a3fe90910cso10024921ioa.16
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xT8jK4ncWfpvFsYgIEzvsC4Ct3LaK0iDPxvQa05vrLA=;
 b=Ku+8q2ICVZQpH79mj82Pa/qtWrJu5OawUvWAV8cgZfPDkBNwSK5/211o7yL4c7SY+F
 xFgpgiUstC4obWj3YLcHBOyMm/90gQvIJxl7PsM7oUFq+oSR7MmzpFDLrsdozpPubEuL
 rl6QzEWNXDbyRhLw23IPBOshIZW8DNpfhn5XpQUETCoBDpDfomer/FR/f8I6j8D8gQ4f
 HA3ZdydbK++ObhRztywWuqkg8LvF/bHVyfRhdFxRw+9loNEx0YT+ZMkJF/qr1oOuxqzQ
 GUM4+vLOfSnl0n5SuMqI8kKAXQ4lorRQfLw8gb+/0VbfgePTAXYTrnq6PqFb9UO3v+lA
 zbNA==
X-Gm-Message-State: ACrzQf13siBaa67YbM9Uo2rC+ZV00IzyxZYHIsCfmDAcgoz+CPY8eunU
 Nn7Lb4tgdNTMzJ3G7Gf8z5Vls7mZPcW2ecdzf0xBI+PKdbuw6QX1krnCcIffyaK0iYqCVD/V/UQ
 /rf2FMtyYtPfZVKYpZTEcw8+jFGPh
X-Received: by 2002:a02:94ab:0:b0:35a:d1b9:c71c with SMTP id
 x40-20020a0294ab000000b0035ad1b9c71cmr13538075jah.310.1664923958559; 
 Tue, 04 Oct 2022 15:52:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40+NtHLQibfW8/7361BufMO9dI+y0DDV5cDikOlA1gWPvU4i5Man1wGB1jOj6NJV/mzonIOA==
X-Received: by 2002:a02:94ab:0:b0:35a:d1b9:c71c with SMTP id
 x40-20020a0294ab000000b0035ad1b9c71cmr13538070jah.310.1664923958409; 
 Tue, 04 Oct 2022 15:52:38 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 x71-20020a0294cd000000b0035b1b597290sm5702556jah.162.2022.10.04.15.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:52:37 -0700 (PDT)
Message-ID: <235faee2-4c8b-568f-9eb0-13f520f5afa5@redhat.com>
Date: Wed, 5 Oct 2022 00:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 14/16] drm/udl: Add register constants for video locks
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-15-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-15-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Add register constants for the video lock. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

