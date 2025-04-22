Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD41A979BB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9610E3C6;
	Tue, 22 Apr 2025 21:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O8ztjYqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644D010E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745358662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1/IDzJNwKu9ird3fpx4gSzjCeLeBaq8w8B6OkdB/Zw=;
 b=O8ztjYqZn7Dq/MsV7gop/W+m8c0MZ/ikFT9yZ0ZTpETKITzYruj7B9Vls4Mo2Yb3uSespD
 ofc85YFLGH6i+/2aR+HKj2EGWkgu4+Kzqel5XN6H+SaH/dk/6qmAcChASVsSa2LnaQkJlk
 6jDVq+/I4WHdyw0z4EceMTt+sLmfvo4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-dp5n48eQNBSnuqDeZrp2Sg-1; Tue, 22 Apr 2025 17:51:00 -0400
X-MC-Unique: dp5n48eQNBSnuqDeZrp2Sg-1
X-Mimecast-MFC-AGG-ID: dp5n48eQNBSnuqDeZrp2Sg_1745358660
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912e4e2033so1741568f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 14:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745358659; x=1745963459;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1/IDzJNwKu9ird3fpx4gSzjCeLeBaq8w8B6OkdB/Zw=;
 b=R7DpUDv8OFMY70m0E4CKOek+K737J5e3B8VhyzpObKWiLjku2Epi5JYGex9CaoOc6C
 bFKixHlGLjfBUWH6kioLMcjUwDOfEeRxmiQHBdiMPnkUOyi458vAIoIx3WmZAOl7P45X
 sPLg1khvCFse+ljizEqE307qVnr9unEczeeNtMEnyK7B8UXP94QuF9Pc/JvFUvzMZ04d
 GpFnsLVcSP+ufJJw8k+m9KuDLTBb+xHurY3KWs2wxgpUn6u4v/mxR+SLuUtjj/oEjtsk
 l54GkglxUDyqCm78Wjo5m14zYrHFfD0/QYMduhUB6b6c3ENOmNvRcKxZwgUlx+TPNyq/
 sBTg==
X-Gm-Message-State: AOJu0YzFCOw0Wz9j/y6tg3/WXbNqLA0MeSdeN+UkNBO5XfVa+KWeP0t0
 d0ANDUiVct/5I/vz0pUJEPWLpqhDyBKaK47FEDJYceWD3kc4BOMm26TVYaR96pd1XeXWI+EhnjU
 zJR+xfwihu8iRSzmcDZI4QJakmQpHUA/nC8x+FIQcWL+lzfkMTEceCSC7puQqKJpdmA==
X-Gm-Gg: ASbGncsYG9i+ztO8DdjztkO7ExbgwxEfGaHu5Fm0vvEIIKrKUy1co1wD/soBUiVE8bj
 1REZ5ySx8YQHfa/Q3wJEk+cYzPFGfgOx8tAipcCD6WC5eAVuNzs2/x2dIm1+Pq7eYrAEGYDQags
 ghdlH/ScgHT2n7X3ohJIY85CEO6XTITtC04bz7z9PcML/ZNtPw+cUoHHDlZvEyGhihlIPs0d0nc
 1W81Mwom4Aj0ggntVk0F1vmv3gAhSSkJ3QmpB10eZ+S2tFSfY25A/USZa1ijKMfDyu7mP/CrzNn
 eTAbwWLa42VglrHXreISSBpCH/fc182THWTHQwtWtiI9HWDrobuU8Oeyj9ub0o/E/wVU1Q==
X-Received: by 2002:a05:6000:4310:b0:391:4189:d28d with SMTP id
 ffacd0b85a97d-39efba6c0d3mr11525093f8f.34.1745358659706; 
 Tue, 22 Apr 2025 14:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvQa7VnBYSPz5ieTPf8xaFFrtEIeqU3LTi5lgcJyNHMvngJBWDCobliaFl6EizYRrF/Sw9Ww==
X-Received: by 2002:a05:6000:4310:b0:391:4189:d28d with SMTP id
 ffacd0b85a97d-39efba6c0d3mr11525085f8f.34.1745358659393; 
 Tue, 22 Apr 2025 14:50:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4d67sm16699401f8f.94.2025.04.22.14.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 14:50:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, iivanov@suse.de
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org, "open list:PCI
 SUBSYSTEM" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] video: screen_info: Update framebuffers behind PCI bridges
In-Reply-To: <527b7ebd-0a34-4fe0-82fb-9cdd6126e38e@suse.de>
References: <20250417072751.10125-1-tzimmermann@suse.de>
 <527b7ebd-0a34-4fe0-82fb-9cdd6126e38e@suse.de>
Date: Tue, 22 Apr 2025 23:50:57 +0200
Message-ID: <87ikmvc1by.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KDBW8tsc6SwR_w5tNY7cSO_LG88oacT5G1ePXv_k7JM_1745358660
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> cc'ing PCI devs
>
> Am 17.04.25 um 09:27 schrieb Thomas Zimmermann:
>> Apply bridge window offsets to screen_info framebuffers during
>> relocation. Fixes invalid access to I/O memory.
>>
>> Resources behind a PCI bridge can be located at a certain offset
>> in the kernel's I/O range. The framebuffer memory range stored in
>> screen_info refers to the offset as seen during boot (essentialy 0).
>> During boot up, the kernel may assign a different memory offset to
>> the bridge device and thereby relocating the framebuffer address of
>> the PCI graphics device as seen by the kernel. The information in
>> screen_info must be updated as well.
>>
>> The helper pcibios_bus_to_resource() performs the relocation of
>> the screen_info resource. The result now matches the I/O-memory
>> resource of the PCI graphics device. As before, we store away the
>> information necessary to update the information in screen_info.
>>
>> Commit 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated
>> EFI framebuffers") added the code for updating screen_info. It is
>> based on similar functionality that pre-existed in efifb. But efifb
>> did not handle bridges correctly, so the problem presumably exists
>> only on newer systems.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
>> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696
>> Tested-by: Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
>> Fixes: 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated EFI framebuffers")
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.9+
>> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

