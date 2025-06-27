Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540BAEB3AA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB710E9A2;
	Fri, 27 Jun 2025 10:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H2ULDXco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E939D10E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751018564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JruzEJIRQhce3mYeDqfrw5tsAk7gf7uEqexFvMHB+aQ=;
 b=H2ULDXcoYSxzfJDMT8q1mbApcDdV0OWNeLXRc8szkZvDqTyBaT6/NInzcMtySWjDRJ/5/H
 yoUzmkzoRD63b40sutekOFEGrk47See9ObBrms7WUqhjNroymBH+P49okx954IXzp9G7eZ
 sFdhXD3+QwyFIcapiPRnD0sGQuqSrrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-x_wvfY-nNo2KuU0eT3Y0xw-1; Fri, 27 Jun 2025 06:02:43 -0400
X-MC-Unique: x_wvfY-nNo2KuU0eT3Y0xw-1
X-Mimecast-MFC-AGG-ID: x_wvfY-nNo2KuU0eT3Y0xw_1751018562
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4530ec2c87cso9214745e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751018562; x=1751623362;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JruzEJIRQhce3mYeDqfrw5tsAk7gf7uEqexFvMHB+aQ=;
 b=XHiMwcnCt1GwAlB6q546YgTuG1UbbqaKQ2WoLB4oa63PRi+zElWBNQpcsSDnEsHkT4
 57BEVoynSVIhiFyRo9x4ykNciOnHg04bliiRblkU+DCmDg+CIsEecnbkvM+UFjUqxupL
 eZVW/MQU9VZbDQ4RVsGIXafE4Y2e8UsFksXm8cMjim29K+eSkdQ2k4c1wwAVDSpPOD8c
 yoVF5+yY28zGc5ypkMlkm/RWu2r6B2K0GI0shzPNeTC5I0ZCillVFlGbkFSHlLnaO/ii
 HYxUfcBUb4hKfzpCcbkb88hyqyGqWtNVHifDjMTbyAacEld8W43ghzuQkSZD/Bh026qb
 1DnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7C90iqT3xr0Q/k0wO0qtsuxcEmBHFMsd6maZyqtX5If5iR6lEQCFw5tA9HX1NoFHvl0AXgad0XeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Lzk2wfEv+GoN9vT56j+k82osZq7nT7UF2FYxb9uYAuvbcrOd
 860gGvoZz0dJy7tJOAUnuDzO6dbw6kdtjXPdiOxCH5c40wR7QutbiEYVEf4zUhFaV+KIO+Stpha
 38c1hak5YOARsn2tB/MXge5pl1NFsqwiapwRyXTbTSS4C2OrMUqRoN7hG9ewDG8plEusUMg==
X-Gm-Gg: ASbGncutqr8Y24b1PfSiLpDe87pm5lpZt6EOgFO4xpokoaVbHkfmlBGngBH49iNtvap
 mngzFvXyk0SCdhMFGzLDPW1BmFctgIvjFJqAmzyYjh/UNpD+snoarNB8SzvXxBzmjIda6GAwR3r
 NB+15fs5nfkHB+thWjVoyGvTpPPD5QQzDbakuCYxG/7UQSO0ICogY5brkeuXx+TZeOIXp5hKBW0
 nVF9LzlzuZKTUkZIwcWhMBjLf8+ARoyQPoX0+tofw1juHL+IdNZBKuSj/xF70W4YfYlgvzr0abZ
 51kd5+A3cpefKnReSDM18GmqwxbtbBJpceCKsjBMm5UElLw8HGHyNLQNGrenqJtVj1Fz+550aEi
 hhA+G
X-Received: by 2002:a05:600c:1388:b0:453:6146:1182 with SMTP id
 5b1f17b1804b1-4538ee81e72mr24527125e9.32.1751018561964; 
 Fri, 27 Jun 2025 03:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwb9GAheZs7CdFHttEfxVdyFchwFX9maJhmXPPUtAcTAKpVIiwYykxGlnMkLxlaLZoZwT/uQ==
X-Received: by 2002:a05:600c:1388:b0:453:6146:1182 with SMTP id
 5b1f17b1804b1-4538ee81e72mr24526645e9.32.1751018561487; 
 Fri, 27 Jun 2025 03:02:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe0efsm45121195e9.24.2025.06.27.03.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:02:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev/simplefb: Add support for interconnect paths
In-Reply-To: <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-5-f69b86cd3d7d@fairphone.com>
 <87ldpdd3dn.fsf@minerva.mail-host-address-is-not-set>
 <DAX814DZF6AT.31N8TZWL5LMDT@fairphone.com>
Date: Fri, 27 Jun 2025 12:02:38 +0200
Message-ID: <87qzz5biyp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vnOipJx_kJeremLEsBDZu59JwedR3VjnhWCejIFrTxA_1751018562
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> On Fri Jun 27, 2025 at 9:56 AM CEST, Javier Martinez Canillas wrote:

[...]

>> These two functions contain the same logic that you are using in the
>> simpledrm driver. I wonder if could be made helpers so that the code
>> isn't duplicated in both drivers.
>
> I believe most resource handling code (clocks, regulators,
> power-domains, plus now interconnect) should be pretty generic between
> the two.
>

Yeah.

>>
>> But in any case it could be a follow-up of your series I think.
>
> To be fair, I don't think I'll work on this, I've got plenty of Qualcomm
> SoC-specific bits to work on :)
>

That's OK :) It was just a drive by comment, but as said I don't think
that this code duplication should be a blocker for this patch series.
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

