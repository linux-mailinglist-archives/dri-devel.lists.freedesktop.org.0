Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA1B068F5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A9310E0BF;
	Tue, 15 Jul 2025 22:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fnT6mzsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453D10E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752616863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLAwa3dvkrMO6tqYCU+aUo3W6TsJmM1uaesMjUYNHF8=;
 b=fnT6mzsv34iKi5PckdhaSQUeIYqMDP4xF0Ya/qqoJ8KlFq0H5llioxa6PrLBUBayBO0uIS
 mTHCpgtwHgBTYqFPw5wksnBsgzHncKN8mdKhaLWYSAbcGSYZ1B8+a8qmcaOyzKuFtr2VMv
 YEKmxMW6/zI7/3PyCjar+QB0tKoNv40=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-puqreruzObKPR5KSM8Mgnw-1; Tue, 15 Jul 2025 18:01:02 -0400
X-MC-Unique: puqreruzObKPR5KSM8Mgnw-1
X-Mimecast-MFC-AGG-ID: puqreruzObKPR5KSM8Mgnw_1752616861
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4fabcafecso2904820f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752616861; x=1753221661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kLAwa3dvkrMO6tqYCU+aUo3W6TsJmM1uaesMjUYNHF8=;
 b=Y5wRxRBRICydvcdfQH6xWJtePTf+kDdrjiDdUNpQjlLBE0FneJ4mChfB4ThNMjMFR7
 rnpaxE5QBpLX/7rllnfh2LVK6SdXrBKPjByzHauXxkbnKhJCB2J8adjKJPJaUMDPRi9+
 0OQSaB0EhC7jT5oXIfARb7kAW7wSmrzPOPb9c5xJqENaQwoM6yJigSJimtQK6tBSTX4b
 R8hbZKFCYAkTqdtRLR0EQuY+PB9MOpyyrRqpDK96+PVW6D1l8eaAcKVTbPnfYZ65juQL
 UHDb0IfK8T126ybirj/N6KmaEoce3ffbEFTJ1gl8N8YYszvr6rvCto+AoRUEgnWDN2mv
 H9kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpEy8++sWPED+fAGWMJxlOVgg2tqbfCsPhgNiz9BIgii+xDVBp9O9ThaG/M47nBlhcmSkxgzR8/jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXI+F0Z4/bRBjCxK86sLj7xlzdNmieXmYe7hst31b8AUJNJrgB
 MitbpJKf1N2zyql5HDzAdWvvnu03n6uabKlNpiIryrIi99sAM0w2y3TNn/qqLRfHKqlLzm7qki/
 sFcSzdVR3jEpD8R+34f5qoS43DjP+bVgBatLBBLvg4FBvjfEr+DFhi7sTLwpYgaTOIRTKGQ==
X-Gm-Gg: ASbGncvZU4dPTt/I4mSB0xWm40U1Bc4cbnnIcg2gbVnrHk2Sz9CWowSKzydnFTG88M+
 mt5kadcqHKNFJq8syFvRNseu6MDO3hZcGhIb9jH9JsKe64cGiqR0z2Baf3SL7AvB7X+n1B3ncD4
 1xzbKMfWwZnt1bue25Iq0HIXYbrTAr2b8VU8qbeK9XRx6KanLjfxWEmKUseIKsf+/3y20miuyPa
 f0DtqxgJt5/APJzGyaBsbJNiuWUrlwTFzmaNrfY6Cz4zrjG6EpcUxsaupQHX4ore0gPtpkCTdti
 /+UTqrf//f7L2RwQ9/T7SSZs2jVx33l1RH/KAzY7jos5vpJu2r5b0oAzCBO1YbMoGMEgfQUOT5/
 Y
X-Received: by 2002:a5d:5d0c:0:b0:3a8:30b8:cb93 with SMTP id
 ffacd0b85a97d-3b60dd95a75mr555278f8f.32.1752616860703; 
 Tue, 15 Jul 2025 15:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLDHsg8OR9x/gIzmibOJxTfaj3TRrHrpjR78a3np6L7t4fAQSv39mTDqr+YfaxcUEbilL4qw==
X-Received: by 2002:a5d:5d0c:0:b0:3a8:30b8:cb93 with SMTP id
 ffacd0b85a97d-3b60dd95a75mr555234f8f.32.1752616860168; 
 Tue, 15 Jul 2025 15:01:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:5b4d:4594:545c:dd8?
 ([2a01:e0a:c:37e0:5b4d:4594:545c:dd8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26c97sm16368518f8f.90.2025.07.15.15.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 15:00:59 -0700 (PDT)
Message-ID: <05c40a0a-d2b0-4f55-981f-6da3765eebb2@redhat.com>
Date: Wed, 16 Jul 2025 00:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Askar Safin <safinaskar@zohomail.com>
Cc: ryasuoka <ryasuoka@redhat.com>, airlied <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kraxel <kraxel@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, simona <simona@ffwll.ch>,
 tzimmermann <tzimmermann@suse.de>,
 virtualization <virtualization@lists.linux.dev>
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <20250714000456.14-1-safinaskar@zohomail.com>
 <1961897d-cf42-4495-aec7-f4c20dfe7566@redhat.com>
 <1980fcccefe.10a7c92b36705.2744765212931179004@zohomail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1980fcccefe.10a7c92b36705.2744765212931179004@zohomail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rmNvYRdsUHdtOoDXKqn02UPV8fpj7OC42iL9-mEmKRU_1752616861
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2025 22:35, Askar Safin wrote:
>   ---- On Tue, 15 Jul 2025 12:57:04 +0400  Jocelyn Falempe <jfalempe@redhat.com> wrote ---
>   > "Normal panics", is just the console logs through fbcon. The problem is
> 
> Thank you for answer! Is this possible to configure system such that fbcon works normally,
> VTs work normally (i. e. via framebuffer), but when panic happens, it is displayed via drm_panic? This seems to
> be solution to the problem.

Yes, that's the default if you use a drm driver like bochs with fbdev 
emulation enabled. (Of course you can't have DRM panic on a pure fbdev 
driver).

There was a concurrency problem between fbcon and DRM panic, and I've 
solved it a year ago with:
https://patchwork.freedesktop.org/series/136182/

So make sure you have the following in your .config:

CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_PANIC=y
CONFIG_DRM_PANIC_SCREEN="kmsg"

Best regards,

-- 

Jocelyn

> 
> --
> Askar Safin
> https://types.pl/@safinaskar
> 

