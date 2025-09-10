Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44527B514F4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59BF10E8D2;
	Wed, 10 Sep 2025 11:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JYONtoEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453AB10E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757502568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEfKAAgF77B0N35cHlVCZR8H3qoPVBq2FQNy2mJIamk=;
 b=JYONtoEZ9+9kfTQXg5T9LNFeOUV5afuSWSIja66oCJoSl0HwnqC2MPn4sq5tZYkGCMcAw0
 kkLwD5fhfCxrAGFVNZHJZFW3/9DrDo0gyUyOb+HZ3pChFiz7pgQ1WRt82VBlD/CV8rX3Ai
 Ziq9RWwsE1+vICG+0ChuskRzGElGJaE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-rdH1pjooMEOlScaUyykdyg-1; Wed, 10 Sep 2025 07:09:24 -0400
X-MC-Unique: rdH1pjooMEOlScaUyykdyg-1
X-Mimecast-MFC-AGG-ID: rdH1pjooMEOlScaUyykdyg_1757502563
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so48285685e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757502563; x=1758107363;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEfKAAgF77B0N35cHlVCZR8H3qoPVBq2FQNy2mJIamk=;
 b=P5CkAtaAnyrDPzCHEgRNkywCgPAi9UY4cenraRt9j2RBwlLGKtCMzmnpaKwZY/6PzY
 xz3CwqFoLfCWQKFGpkj0cSOnZMK0M7aypKF3dS+WL+CTgWVWpaUpXILRaTN67ycDpbnX
 YyJFWQOShS/Id+Yc0WgeDVvR95KFYfAGeRuumo2ah15dzK3DUfnhurt0qdv3T1IOZHXZ
 6vqgvStqamPfXsIhGXTG9mwGUzF9q2TJ+jKJpSDnIP+wVJJg2UwEIHc/HUOz+I3Xj+44
 lZkbsvQ5P0ojoiEsBQtT+q3L5JYJfa84z1KKO6f1PBuP8mZ+/rfKnOmnifOCeesGD/hH
 QitA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuGJh+JDJpJ6MQ4pJOHT462h7X0FzMVuFzMdDd78KncLFlcQ6OFbrqe+rUvumzoTMd1ELDkBbKdjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7IS4JwUZA/lvmyCjWhu37fzSse/+qKT8bUfDKfy8hIYoWtsrk
 rxq6bHphRDVu0X+HWImr2Exhsr658j/RmqpfHcrw8PTD1mkMAxnY5HTaYuR59hJF1jbDw9LQ73r
 w8HzHNMb2T6zVb5+X2beeN/kf53R/AgKmSCcnGGxFqH82euR5wdyDw+7/EUvGPNSS7m96+w==
X-Gm-Gg: ASbGncs9JFz70Lpoc0p+05tEHsA0XBTzNAdu47p/cECXfqqIuxtcnFv/AgEdfogCRkC
 v+x8qlF2h7/otnr/PMR1A2VTzS3wdVrH5GQWKzV5B0CmQxDOgSB+/LmPlYvB0XaDQf1pvpr2H4X
 d4nma0ZmIQY2kA+qoQevvc02z66QGqkRmPDD9kzjbYAFJ8FhDKdAlIzXdfC+c0nWAsAhO1z35EQ
 MYlL0/NJ0/Hh2YunQM/4+ziSZDiGYfPWKljLfzPEk9f+B9Muea1KSjfILDGKDHpAay0YQixNguc
 RxKf3BuC277g9onGfz8dAZN56el6M1eF9AvMpJxObCNJ/ujEoaefZ0QGUSW4ln30mYdRdli7spz
 lJM31IyJ3EY0I5Hb0QuTPqw==
X-Received: by 2002:a05:6000:2889:b0:3e5:50:e044 with SMTP id
 ffacd0b85a97d-3e643555859mr13543080f8f.45.1757502563475; 
 Wed, 10 Sep 2025 04:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtsE6TP99LwCM9DefOr4NgVBIR7vSn0IU371t63+HnR3UaFYs5LDu32sAvz1H1Dto10pgN1g==
X-Received: by 2002:a05:6000:2889:b0:3e5:50:e044 with SMTP id
 ffacd0b85a97d-3e643555859mr13543046f8f.45.1757502563021; 
 Wed, 10 Sep 2025 04:09:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df1ba282dsm26332925e9.5.2025.09.10.04.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:09:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brett A C Sheffield <bacs@librecast.net>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, Helge
 Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones
 <lee@kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>, Yongzhen
 Zhang <zhangyongzhen@kylinos.cn>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
In-Reply-To: <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
 <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
 <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
Date: Wed, 10 Sep 2025 13:09:20 +0200
Message-ID: <87cy7yef8f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LZQcn-rNRhQk-jbiNbcAdA9h8BEG5u2jq-mpt0XQwoU_1757502563
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Brett A C Sheffield <bacs@librecast.net> writes:

> On 2025-09-10 12:46, Javier Martinez Canillas wrote:
>> Brett A C Sheffield <bacs@librecast.net> writes:
>> 
>> Hello Brett,
>> 
>> > This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
>> >
>> > Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
>> > removing conflicting FBs") was backported to 5.15.y LTS. This causes a
>> > regression where all virtual consoles stop responding during boot at:
>> >
>> > "Populating /dev with existing devices through uevents ..."
>> >
>> > Reverting the commit fixes the regression.
>> >
>> > Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
>> > ---
>> 
>> In the other email you said:
>> 
>> > Newer stable kernels with this
>> > patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.
>> 
>> But are you proposing to revert the mentioned commit in mainline too
>> or just in the 5.15.y LTS tree ?
>
> Only the 5.15.y tree. Sorry - that could have been clearer.  There's no
> regression anywhere else. Mainline and other stable kernels are all ok.
>

That's what I thought but just wanted to confirm that was the case. Thanks!

> Cheers,
>
>
> Brett
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

