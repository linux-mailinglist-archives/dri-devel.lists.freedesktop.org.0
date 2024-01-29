Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDE8403DB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B508110F6FE;
	Mon, 29 Jan 2024 11:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E4A10F6FE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706527811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAQHhgY3bhk3lCCm6pW4wBVOcijj8B+AfYWYuBRpPy8=;
 b=ddI5tWUz716QNPEVQHWG8fUi/vn5Jg08byfzbU78GyyUGD1AwVN0mNPXRgqJYee0sK68WJ
 wKquw3jBcccgOC8hZtJHd6bzvqZBna780+JxkL+8bCIxl1vzHhobUD36lql6F79J5fEBoo
 EWHEHYX7Oxg5KWvERv94CpvBSwLA+Dg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-yS2hbXECNqqo_794QoJZow-1; Mon, 29 Jan 2024 06:30:09 -0500
X-MC-Unique: yS2hbXECNqqo_794QoJZow-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33af3a64df6so214524f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706527808; x=1707132608;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAQHhgY3bhk3lCCm6pW4wBVOcijj8B+AfYWYuBRpPy8=;
 b=SxLUX34xs5yyNxAqZnUPF6I3P6jh0cic/DkaiBNroesNv6RU+3vfFaXpXy5nZFnw7f
 kbgW/Tpg/jBV5OiTMTgsJtp0ZS046ze8zGb1TTSxQQYxHrG7mQE/FYxZDCzhGiGVjUQK
 Nrn77b7fvhajMV45myezxWmoCmGvZ0IvQJTZn4KExmsJP9BLqPAZUFxZxQ38MzE8RsSq
 1FLNlzPdPIE1hU3bzru0tRP2eHIabRF3K0pFzT6o1ZfhJ6y7Qid111kH/HwqNHXZxNO6
 b+F9UKwrpNMN0Pa8kuTOcwAZL4K3gOuB8zAfY4ifz+FMaz6o8q4qNLwe+j3aoaJt5H1i
 by3Q==
X-Gm-Message-State: AOJu0Yype8KB+myMN1gTG/oIeE+mZ5sFd3VA1BBpzJ9j+o1QQIgpzYvC
 5dHrYkdl5nAL6kmH7OY0qKvEKYePSmCSekC9o6MEpdQKed1Koz+4nJ5oUs1YBTBW+zcE9Kgb3Ma
 QKY9rZ3UGPeR9s9JxwZu/hn3EK1gIe3lVI8kwwGzkD8yGuWcL/JSTbPVdGhl9b/4evw==
X-Received: by 2002:adf:e40b:0:b0:338:8892:fbdd with SMTP id
 g11-20020adfe40b000000b003388892fbddmr5290361wrm.4.1706527808695; 
 Mon, 29 Jan 2024 03:30:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQbw5w4a/4TyAcBBeYk/Pe3VyTIMvNtN6tYlEqip81Ik/6OpW6GBciAT0rhHoSWh//+3YkiA==
X-Received: by 2002:adf:e40b:0:b0:338:8892:fbdd with SMTP id
 g11-20020adfe40b000000b003388892fbddmr5290338wrm.4.1706527808366; 
 Mon, 29 Jan 2024 03:30:08 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600016cf00b0033aedfc5581sm2291652wrf.32.2024.01.29.03.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:30:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 4/8] fbdev/efifb: Remove PM for parent device
In-Reply-To: <20240117125527.23324-5-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-5-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:30:05 +0100
Message-ID: <87o7d4v0le.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The EFI device has the correct parent device set. This allows Linux
> to handle the power management internally. Hence, remove the manual
> PM management for the parent device from efifb.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

