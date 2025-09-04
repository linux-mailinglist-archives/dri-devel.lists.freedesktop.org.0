Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334AB44755
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1863E10EAD4;
	Thu,  4 Sep 2025 20:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4NhnZ4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D610EAD4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:31:33 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-71d603b674aso13972687b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757017893; x=1757622693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G44qT3ppm0NrZKxqg/zbbhuYOayOg+q8MSz2CLb5bks=;
 b=J4NhnZ4pdzEcmTGmGXLcIjlKFHAYbVclIJsW9sx6blsazyxxunCWgAP0Hr7f+MQitT
 SwQ9FnhkM9V2kg4cmFFR9FV2buWnZwi1W4/EA+wo0dZz0IcaIGpWqcH5uLmhoUvnuQdp
 YaSa4HXiQT53CCJFzVhKZneyKC1Ab4ZCs42lS6IIbHnb348ePQZY8kFfO7Nxx5Bhb4lh
 X7ehTY9tvCwm/NZ5NPCBk5cHfm8qiY7PGdLh0ULDNFkGS6ummrdolC8wtAY9JlFTP6hB
 TTTyqZHQP866krexVTijXAXqh9FCjjWcEhNVXv3f5B2iJ0JhgL3W4Hq3Qkozf2W7lxxw
 mF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757017893; x=1757622693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G44qT3ppm0NrZKxqg/zbbhuYOayOg+q8MSz2CLb5bks=;
 b=aOC3SPHfZVdZW/h/rNZt6xU9fndToClheaWlsXpqkOsxBJUNAW6YfaJ3P9ppuF8+Ol
 Jz9RnYmSC0Wvvi42b0Ayim+ATXXiaurQdeEHaCHtUj5E5S+l8GaF3Y1CsGGF2b7k5PlO
 Z139FHKZSN8JGMsnqqortCv4pp3hOBr1rQr2+fZN1/8HqGTVe/EPoKZfJQmDqoeMImrx
 Ni4R/nXnGx7UP9xqIj9VpozJEuwABFX4l8RWz4sJ/YPqMjJK8bHGknHLryhRJj3NlMmW
 W6vkX2v7Yg7yKRNrAJWgTi9vwhnq7hIHsluaH4OHPoGeQ6Kns4jjPlZI8T8B/ldvWIXM
 dWGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6AcZPcLSw1arxhSHkqzWaY7ZW/2M0xzAHh6KsWW/bEZ1JEbn1GNnm6GEfOqIK4pHZvYOiSlqc27M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIO0DTdWMaL5APEBgyEiYz7gCz7OUB9ELTVnS3PeTt7x7Vaugj
 JKNtPBAVZqMyZdCETLeiOCMw/umm7UICBn5t7QzHpWS/FSIuLUHhSxaNwsOte1zdoz4nJrnYpZP
 jA/8TK636396/DEzpDg6N4TGqOmSnEBI=
X-Gm-Gg: ASbGncvk2vNr1S4dky4BCO9cleoVDw7brrItBkGcuTJQJgYI4I/zf8B0ujixnX1s0Lw
 mee2KH7Pg+kIqnWEWUdNWnEYFq6Tczy839G4q4l+FZ+CoLT+7wiFCU7/yTchDjTz/KrI2wGEeBh
 1IYI/DEUvdzVfGwL3yMGI8eXqwrFP/6yIGEXyic6jHixo4s+50IzOVDC+E44F+9WiWdpa6qXWqY
 vz1On5kaf5g5AYsN/I74+0negMFNY0x1aMS4R0uJITs58fHmx7vnPrGNRhLmVBbeTvbo/nn
X-Google-Smtp-Source: AGHT+IFZZhEHQ2i0PMUPdNUhuJd8vApgTrRB6dKWPtsXXKNyP2QHk/29i5uL4JCCIaB/197BciHOQ0zwuy7aQHiDCkg=
X-Received: by 2002:a05:690c:6803:b0:720:73:1a11 with SMTP id
 00721157ae682-722764fe1a4mr194168877b3.34.1757017892676; Thu, 04 Sep 2025
 13:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-2-olvaffe@gmail.com>
 <20250904-practical-dazzling-quail-f1bebb@kuoka>
In-Reply-To: <20250904-practical-dazzling-quail-f1bebb@kuoka>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 13:31:21 -0700
X-Gm-Features: Ac12FXyq4YSAlCgSb1X4fgGqu2j04uBunN9ulHXu5oWCguf8BsghjVTucyWzm4M
Message-ID: <CAPaKu7TDQxJZW0b8hR7S=tAX7G+S2oGTeB5h0+2Qp1joqLPo2g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 4, 2025 at 2:30=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Sep 03, 2025 at 03:55:03PM -0700, Chia-I Wu wrote:
> > MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
> > panthor.
>
> What is panthor? Please describe here hardware or provide some
> explanations of not-that-known hardware names (if panthos is that).
Panthor is the DRM panthor driver (drivers/gpu/drm/panthor).  It
gained support for Mali-G925-Immortalis a few weeks ago.

>
> Best regards,
> Krzysztof
>
