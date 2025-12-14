Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEECBB9F6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 12:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6710E47C;
	Sun, 14 Dec 2025 11:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NHbYJCb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9510E47C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765710916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HM9Bj5gVe5n7neihIXzVD4g+m63oqfEqz8iTN/QMnbA=;
 b=NHbYJCb64yxEI4r6qrvymwZevX3Y1DmILhlGm0quCVr7p4CZfizawLgqnFaBhDtfQICcAj
 TXD0umcQJkLfWNNtsrEMfDB6K2QUsuWMWs3yajl/XXSgTBHDw/0ckxIdjnDc4QA6fL2OKG
 m4SFJgFgS61mW0zDqRUj1UDTy4T0V8Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-TS_Iuuz9NliA12blh_YqmQ-1; Sun, 14 Dec 2025 06:15:14 -0500
X-MC-Unique: TS_Iuuz9NliA12blh_YqmQ-1
X-Mimecast-MFC-AGG-ID: TS_Iuuz9NliA12blh_YqmQ_1765710913
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430fcf10287so1420f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 03:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765710913; x=1766315713;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HM9Bj5gVe5n7neihIXzVD4g+m63oqfEqz8iTN/QMnbA=;
 b=BzU5YN+2NIHiDgqgbVL/oedcYDbkGo3/e3Z9ijk0znQHAzvMktQpeHCs6SzAzzTFpT
 X3dD8wDQK/CwbTErumChM+/XBb+o7PjQAXWcue63k68ta6c+vGfpDYx3aeMk48kTwUlr
 wHOJe9rgpnzSLmPIJ0e+nt7h9rvcEc0QON/DOkzSuo+3ISsL+ko2CigNJD+iTifoEj8+
 Wdm+cypCAaEg/zaynguYzWN87aVvREZQVxnlc/5NOCFSb9IcJYu+Uj3R1ch+ebQw8XDJ
 wnCp2KdrR9+YARg0BmvGPEXGFhdEZjvbKOrexBHFeT3Cd7XX01Lqz6yE+zlQEVNNWIZJ
 8bLQ==
X-Gm-Message-State: AOJu0YzACXSWZxIFkbBj7QNutG64no3WPYb4sngYPe1VX3kHgAbaHaSV
 b7qvWe11pJh45wJgPBy++2uaiEh2TlYgynzLGEWdLv4WynLVL5iLAMfOFcijtu2jaDcC7lswn4O
 m4z2jDMK+947KWzYISUv0m6wTFKxOyVuEG2Ix8cVddimA9RYpo9P03L+qOaoJix63eHYnbw==
X-Gm-Gg: AY/fxX77YjQwWm3pOliJ5u/sAiX0Wpk4x0t1dLQQlWo9vatH0cYivFDXLdNlwjv9tSv
 5c4DZi4Of6h673yKgQYyJTfMy+lEwQSeVvhlrihq9Lsxle+0kcjNS7q9JwDC9I0UGnFww5vx8IJ
 q0kF/90RrR2j0gotjlq8MCnFpy/b9dC06SIw6ggCoExtxS2kL/+T9jOmb2qm/pipIinUsNn0Oiz
 RAj6JSN+d63i4pCtBdjt4Z1lzlBUXaZkFJX2IZKgOitWwg1Z3FnBf6/juMHBTcb7Jp/+QOxQ3Z1
 P2F3L15i+0UIblR5qMMmq6WS/XDDN8afwnWqFNur0vdZ1zk4zk9/NX5AKU7FGmvn/s+KkKex8YP
 Qdq/AzbUibEb0549zwV+9Z5AHSjRLBB0nSUbm9Cuj7Zte1eWb2qPG9lBKQCF9umGX+cUj
X-Received: by 2002:a05:6000:420e:b0:430:f241:a11f with SMTP id
 ffacd0b85a97d-430f241a3cfmr4542736f8f.30.1765710913204; 
 Sun, 14 Dec 2025 03:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEccOIxj6bJQVaKeIXudzEUyO5fjCoMLU5kgewneRlqJQ7lcxen44vg4FWvCzFcJiRrS1bdAg==
X-Received: by 2002:a05:6000:420e:b0:430:f241:a11f with SMTP id
 ffacd0b85a97d-430f241a3cfmr4542714f8f.30.1765710912826; 
 Sun, 14 Dec 2025 03:15:12 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430fa7d19fasm2110602f8f.30.2025.12.14.03.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 03:15:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 2/6] drm/sitronix/st7571-i2c: add 'struct
 device' to st7571_device
In-Reply-To: <20251202-st7571-split-v2-2-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-2-1e537a09e92f@gmail.com>
Date: Sun, 14 Dec 2025 12:15:11 +0100
Message-ID: <87bjk1l3gg.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZurIUBLqxUE2rZ1IVNm47ndO5kXCE0sQ-RIKtkZcKAc_1765710913
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Keep a copy of the device structure instead of referring to i2c_client.
> This is a preparation step to separate the generic part from all i2c
> stuff.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

