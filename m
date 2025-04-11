Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A016A8567D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77810EB2B;
	Fri, 11 Apr 2025 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cR9ymHRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E9510EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744360012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00Q0S17WmRjZl0Npwk/8K6zLHrHsysPjv1qRjdhJKjc=;
 b=cR9ymHRMRfCmHRPoLq5UVb3r/sUX2l4uQBCPgllmB6dPlhK5g4c52nyNaUsh/jfK+aUzqO
 C5CNJ4jzakB9H5KePyHoTHrXOhJTXXcyVijpe09tZJBw0BuWK6BuTKQQ2JHcR5hKL9LSCG
 dyQkSNwRK8ZwYJRyonJqgD2Vm4UKnWI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Z96byawcMUadrm1q4X9n4A-1; Fri, 11 Apr 2025 04:26:51 -0400
X-MC-Unique: Z96byawcMUadrm1q4X9n4A-1
X-Mimecast-MFC-AGG-ID: Z96byawcMUadrm1q4X9n4A_1744360010
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so11439025e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 01:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744360010; x=1744964810;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00Q0S17WmRjZl0Npwk/8K6zLHrHsysPjv1qRjdhJKjc=;
 b=MHNe3RuzURyPohT8zDYCKZvTAcrYSmBXCUE1tT6p/zXQ7hAhjI8SPGxKF6m/ojv9yX
 l2i7YD6OeyC9aD2EuRd/xU9OWG56SAvvN3/zJrcsHjLc4FEGtKMuP4EutF9KDKmdh4vl
 FfKDhTXygGJGAnJkSbbyP5Cfx8vOnXEFZbIFiL+A/jjpMFD0tkF0gsZxmsm1ZEThqKaD
 sBxL3biXLHjdyeQ3cP0S5HztEAlxkwX7Y7pv5i7NCGO0Qsu3kO2kK8JFDWpyE/8P3ccc
 Up3FLaneoczPEQCUwAx7+JneOKgg/ThAs39DeubTpUfYWS6O3NAdFxfx/abUsB0kMLft
 8U5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+ARLayKDqDY4+GclXmPUFQTwOWj+2e5uRgY00nQHB5t6hkt/yyAw5BAbVr3uI5M0UbT2obHwtiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywqp6GNoPoA+uVWZ7Kp5iGUq7zFy0dFZ9p6SQfNKyY4g4Uam653
 Aek0k0dBFy7PpaHVELwd8a2APIPtaJ32ChRKgCigF+wQRsBTxnJQe93rzJZZbJss7RBWX60hw1z
 Ho5U+AAeUMabRZHFmrFLv4reSNjwiHDm7guHPS8rUoSXzjuT/bX9n2DV2o9ATCMt9fw==
X-Gm-Gg: ASbGnctVwmpigF0Mz83DYPa2yYBZTxeAYb/7kHznoD9iH3blAcuJ4Sc1j1T+HtB/ae7
 pq9xx8ImHHDfE180sbjs3pa4CkFVZX68xub8M79DVvKSmARJIY+buhDObzwZ6CqP4ukrWdojBdi
 Fyt+hETef1S4cFR4PwAAmH1dHVETAzv000z4VvMRDe/Is52KMqTDkQJqlJg2ZZggCVKTlbrPOXi
 xYRmIi68dnC4eN+Fj5+QmFsMlgNDjU9VhVjZGfQatQaCK9FVL+3zDY4a9VIctu5cM/NmYTVQzzX
 Iyb3hDBHEKdIRRyPvukV1tvKfzq0b+COhHoAIVD/TqlA9QR0YSLR/zoBtYQq7Zileqyv0Q==
X-Received: by 2002:a05:600c:698c:b0:43d:49eb:963f with SMTP id
 5b1f17b1804b1-43f3a9a70aemr14225995e9.24.1744360010169; 
 Fri, 11 Apr 2025 01:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZKb6d7+fqXZ7A3CJpuhmceu1xTasq+foZTV7ndHM9hXVFEaFi7ujrGUL6mhaYAsYNAIUYKA==
X-Received: by 2002:a05:600c:698c:b0:43d:49eb:963f with SMTP id
 5b1f17b1804b1-43f3a9a70aemr14225655e9.24.1744360009817; 
 Fri, 11 Apr 2025 01:26:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c49f7sm74871495e9.17.2025.04.11.01.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 01:26:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <Z_iwspuiYAhARS6Y@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
Date: Fri, 11 Apr 2025 10:26:47 +0200
Message-ID: <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eDRfHkZUxciXDnzjvDdEGgpAFKMNr2OFnvPnY92C3Yo_1744360010
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

Hello Marcus,

[...]

>> static const struct of_device_id st7571_of_match[] = {
>> 	/* monochrome displays */
>> 	{
>> 		.compatible = "sinocrystal,sc128128012-v01",
>> 		.data = monochrome_formats,
>> 	},
>> ...
>>         /* grayscale displays */
>> 	{
>> 		.compatible = "foo,bar",
>> 		.data = grayscale_formats,
>> 	},
>> };
>
> A comment for v4:
>
> I think I will go for a property in the device tree. I've implemented
> board entries as above, but I'm not satisfied for two reasons:
>
> 1. All other properties like display size and resolution are already
>    specified in the device tree. If I add entries for specific boards,
>    these properties will be somehow redundant and not as generic.
>
> 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
>    product.

Sure, that makes sense to me.

Can I ask if you could still add reasonable default values that could be set
in the device ID .data fields ?

As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
just drop that and use your driver, since AFAICT the expected display data
RAM format is exactly the same than when using monochrome for the ST7571.

But due the ST7567 only supporting R1, it would be silly to always have to
define a property in the DT node given that does not support other format.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

