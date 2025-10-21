Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CCBF5143
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164210E594;
	Tue, 21 Oct 2025 07:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DPiBy/9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C05710E58A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761033070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1h6fa2qbHoy++SvDQf77xOSpwekaCSKBmi7FZ2f1xQY=;
 b=DPiBy/9iPpWv6wJZ2mYKnhsjh8DUYZ0F9ZxMwNS++1NJk0MrWJiBMwU1QXw8jhmLWAUFUW
 gQlxlj7KhzVNeaFvSyPrDEHlRnQ1anjl/aabQz7EHMX4CiLQHeet29/F9p1fRY27AgcBs0
 1mv+3NQmZbTEcT1daTwptvnMc07q9YY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-vyiNjPKtNoyy-6swWb4Y_g-1; Tue, 21 Oct 2025 03:51:08 -0400
X-MC-Unique: vyiNjPKtNoyy-6swWb4Y_g-1
X-Mimecast-MFC-AGG-ID: vyiNjPKtNoyy-6swWb4Y_g_1761033067
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-426d4f59cbcso3300645f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033067; x=1761637867;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1h6fa2qbHoy++SvDQf77xOSpwekaCSKBmi7FZ2f1xQY=;
 b=TCTSXCE8wXZET/ZkFV7m2IO7RBJSV/hFyd250J2d9lqr48+TdKWbyyYz+sMQr+wQHP
 6TRn7vPQctZWyueaM9IJALQ5VBVTHK2EJyLC1bkVuu4JUcTdAwnmLGOqV2mKSLicN7lv
 6qqLhIuTlqq/Dw1xtvPbAiVL0ElZequbxKAeFR88qPzI3g7z8gflTbbaBsXAjI9tSn1i
 G/SYydEwNkzZKGFAdlAJtORdH1ukSrot3UcgDY2wq2Kh7z3yXWxsqmE8CUTcin6ban6U
 Knx6OhKLyvVksAOkHaTK3VCw4GF9TdFuzTh6FUxiFpAPIIbbQN2rw2rbzZ3dZrjyHzBM
 wqMQ==
X-Gm-Message-State: AOJu0Yz6cqhue/f4DinCuRJKEylKU9FGcQt6Qt8SDAThG5eGrwuJEwaQ
 H8BnVS6ThdIvRFkA0tudOo5CzdsFKg2zSBFDsiBysFHN2w6yG3cAHkaKWp8jmAqAYM5vA34jHO1
 U4bgjA9yVonUZ7yiOfrig+Il3yPR6UnMtXHEz6u3KrmwCmQkdqW23q7ieli834PfoVZ4h0A==
X-Gm-Gg: ASbGnctFzQbA9KiYsWH+NYxFruhAnPoAogcdLpZlyMxavdUyHC3v+ujFIpbPVYC9hVL
 DUHp1VOWKzwjqy8eDYIZky8jdVrHbXMOesDoVYTIRRyDL18Gtp5AVCNEHvDSuB8jMjMe9aROdf5
 Kk9DRPLcqGKCzBPg28CLlR317C2pROqHcmcywssJWLTBmY0GPIxn6ilv4SqNHM2z16MWbNHtUC5
 7pI+w7rRNdvx0DejSwTG4Ik1z7F5aAQpSY0Lr+hjx1FRPK9Ob6U6M5v1TB2C7KduOQGdoTvUf6a
 yYrCimv02kU2O30eAiNaMeYeuQoecWbS3ER1TpLWs7fsHbJZCyQkD8FFVqh4bn4YFrkok7MgedQ
 KGyDC8zSIcPE7pDJvE+UxEsWL0GUNvwfksnHsCQQ61jrbhJEpM0OokIth2w==
X-Received: by 2002:a5d:64e7:0:b0:3e7:428f:d33 with SMTP id
 ffacd0b85a97d-42704bc0e86mr14036918f8f.16.1761033067211; 
 Tue, 21 Oct 2025 00:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8/veJYRT8JadPcK7SQ32pn8LgrM+ivv/Y11OS7FOCN/IU1aUPsxB4lxzjs+wdp1rzZtnZQ==
X-Received: by 2002:a5d:64e7:0:b0:3e7:428f:d33 with SMTP id
 ffacd0b85a97d-42704bc0e86mr14036895f8f.16.1761033066816; 
 Tue, 21 Oct 2025 00:51:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427e1be5d6csm18888806f8f.0.2025.10.21.00.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 00:51:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
 <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
Date: Tue, 21 Oct 2025 09:51:05 +0200
Message-ID: <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wKEYJtjWNcFwHQzDEZG1U-b7YR59Zs7Ru2YjSErXMDI_1761033067
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

Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> writes:

Hello Mehdi,

> On 10/20/25 9:56 PM, Shuah Khan wrote:

[...]

>>> I have a raspberrypi zero 2 wh that i'm using in combination with the 
>>> ssd1306 OLED panel via I2C to test it's rendering and it's working 
>>> properly by using modetest and seeing no regressions or warnings in 
>>> dmesg.
>>>
>> 
>> Send v2 with all these details and why this change is needed
>> in the first place.
>> 
> Okay, I will do that as soon as possible.> When and how does this 
> potential problem trigger? Is this a
>> theoretical or does this happen in this code path and how?
>> Next time include all of these details people understand the
>> problem better.
>> 
> We'll do in the next iteration.Thanks
>

A similar patch was posted by another developer a couple of weeks
ago and is now queued already in the drm-misc-next branch:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

