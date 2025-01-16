Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E9A136F5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C1710E91A;
	Thu, 16 Jan 2025 09:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DCNxeUdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12410E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737021045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2QBcPOL+yHMfg2AXT/qQcpRo+j7cAx0BnePH8/E/d/s=;
 b=DCNxeUdj7r1FSHzo3z9r202YRLkpP8RSt/o82fCKWJxSSzNC9e7ZRiQHlrr2AtpuAATK8B
 DzLzg4I3+kbBMOYspRMDt2xbkH0SKWg9sEPsd5eyQ0swcqJ8D5SSYbJFeo10rJV0xJJ9Ku
 y4A2ZQ0tAEoxs4eF7/HLcECC47x4uN4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-6XEoWVM7MteDPc1i_YbIIA-1; Thu, 16 Jan 2025 04:50:43 -0500
X-MC-Unique: 6XEoWVM7MteDPc1i_YbIIA-1
X-Mimecast-MFC-AGG-ID: 6XEoWVM7MteDPc1i_YbIIA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4362b9c15d8so2992255e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737021042; x=1737625842;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2QBcPOL+yHMfg2AXT/qQcpRo+j7cAx0BnePH8/E/d/s=;
 b=KkwNqsBNDikUnoG3cy9Cr8ZMRV6zHWsWpgWr6MsuNJXPRum88Vf4DzM7K9YTXyfRhl
 yM98m3o+y6IzN8V14TcNmK+XABfWLMyCLVQlTyX1cFE6bqn7hZvd3wEVP+/Wd4vmXRa+
 qOBGFPnR2QIoY+tPKdIf7rZcKi3/VjbF8gWgpZIl/WOBXcSyWm2nLT7kBdDOf5K4KnY5
 a1XlVo0rJP6C4hz6zbcCsUps1YzStCaScM7UolDjmn4acTT0Fgc4AYxuviA4QrHV4fnM
 nDkFKrDPi6U5trOfCNEHujMuHhPbZ7uU2w6wZ5NuscXlbzW3QbcVyFA1IHixHudYdyAo
 rWSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaVN3zFifGKNqtCxvC9xkVu4eXPJIhI3UCEL0pf459T0XM4o37R+7gVXKHoi3ySCWB6o1/IYyUI+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL+7seu9LHvR6BCr0ydDwJoHnflJ5t79GkuICpVf+M99sLSJpr
 DVrBhpX72zUEa2YJ6PtzRlPf4zZVLHE3jJl+caYW09KvhlLSXH0D2Z9oAUzqb+rZewWksyikem6
 VOq5NuCdTE4MZLsY24BWc+HOu1OjYkGfhW2P+yscbQwGensHpGQ61YIbpInHvftWOqw==
X-Gm-Gg: ASbGncvuZ+g+Gl9DY8Bu5b26zHYcGtRlfp3A1HQgY7AdNVVvKL0+BKOIhO7/jtTkGsO
 +w3sKXH5Ga3abgEUmKBGqaA2AQYuRwUekQxqdRACApbbq0xe/QlhncMm8w/TqBskVY7m/XM988k
 T4r2SCX4InkmG4f2af3qPqnEsV0zo8nVtE85IRDkGjHxH9031TH1IpNWNgDnGFGTZWXerw1AqqV
 TDJ34pGAEz8miXnPt5fVVZF+OtWrwUGkAROV98IvkYMXQA22tUpMNFsXB3s6aVRyUj/vTIo7oi1
 OX1zbJGVR/t32SAGWOwBe4DhqG+kQHrQqT0vUP0GOYBNreOY7FR3py92IQ==
X-Received: by 2002:a05:600c:1c88:b0:434:a350:207c with SMTP id
 5b1f17b1804b1-436e26e5533mr276992405e9.23.1737021042571; 
 Thu, 16 Jan 2025 01:50:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5t4CRMPGl3U2QYy1MRj8PDDngNqn9nAonrQyLMQZhr62g/12N6EKw6OKR2BA0KNR+REVluA==
X-Received: by 2002:a05:600c:1c88:b0:434:a350:207c with SMTP id
 5b1f17b1804b1-436e26e5533mr276992245e9.23.1737021042237; 
 Thu, 16 Jan 2025 01:50:42 -0800 (PST)
Received: from localhost (203.red-217-125-100.staticip.rima-tde.net.
 [217.125.100.203]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c6799sm53740205e9.24.2025.01.16.01.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 01:50:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/ssd130x: some small ssd132x fixes
In-Reply-To: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
References: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
Date: Thu, 16 Jan 2025 10:50:40 +0100
Message-ID: <87tt9zulxr.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fmHkRYXPDmSTjamkEGU296Eq94gENAphSgRXa0g0i1M_1737021043
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

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

> Two small fixes for ssd132x family chips in the ssd130x driver.
>
> Since v1:
> - One patch is dropped as it turns out not to be needed
> - Both remaining patches have typo fixes in the commit messages and
>   added trailers
>
> John Keeping (2):
>   drm/ssd130x: fix ssd132x encoding
>   drm/ssd130x: ensure ssd132x pitch is correct
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

