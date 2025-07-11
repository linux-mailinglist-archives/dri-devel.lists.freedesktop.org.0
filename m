Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F5AB01B40
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1758110EA25;
	Fri, 11 Jul 2025 11:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HJXeJhWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216610EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752234956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MwuzFDSNF1XYSxCrBDHROUVPqlZ8SYRES8PPNOw+5xU=;
 b=HJXeJhWlOrUMl7LgoN61BAdf9P3jFH59TO5oJr9TYd/Vr6JFn8L31fUr8c90LzMMu95wAq
 hb/6NW6ScEEYTVsrDEfh46w7g7y3gOrUyp0pCL4dmibcc3h52usnH5JXnVzLGLWVHOh0ZE
 KsAWgtomRNgEDh9rwaJPCEPM4I0lTS0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-IV_Q_J5hPpGhvVdEFfIr2A-1; Fri, 11 Jul 2025 07:55:55 -0400
X-MC-Unique: IV_Q_J5hPpGhvVdEFfIr2A-1
X-Mimecast-MFC-AGG-ID: IV_Q_J5hPpGhvVdEFfIr2A_1752234954
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450d290d542so12137325e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752234954; x=1752839754;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MwuzFDSNF1XYSxCrBDHROUVPqlZ8SYRES8PPNOw+5xU=;
 b=MDiId0hHdm9eQ9wUvyEd+tfRH3KD9ny5NCkwTqtJh5/jN/MWktCS6hCy7iC0nWnxrm
 /Ve7RzGkkkf4/LMBeK8Jr2Ke6ib0D3F0GyvpCeyy+jqOXJ/Zxbnokb2nqq+gQyzUU5Tu
 jscq/B46w5FcbQ8z6Aq/4SxegZGn8Dg7XjKimALv12jzPpXZudZ19V6HA/3hFxlSV/f1
 B8LiXl15PN6e06zFnaJQViqaZ4RYMxmtbCK4LdKz3oTiA10abgY5zZ0FvjKmSZVeiNa9
 L93MXKbnSo1D9zMqON8LScEFaWomluLsplSNJ64zcAlN9gHVP9tAuuh+fjgPggBX0wgS
 pmHQ==
X-Gm-Message-State: AOJu0Yyf0lB8RNdoGEsHkgCQcNVVLEEcj+Zy8vBZrt5dhjhQpygKruHi
 KCOPaaRQy2+P24uWfx8ypUCvcbOEMqzYiNca2IpNekJZ9yRY7wMFLgymUrCM4VuaPeOHU1Nj0JC
 26+RBlZfN53S3eVuI6sTUV1MZAk0NXwcDpMm2nuUcSK7X5mugD3xAZrntu17oUwdVmUW64A==
X-Gm-Gg: ASbGncvPR/WpPVVMIefk1BTUgNLtk+GRBrnsh4naoSN+2GSB8rwPcJStAB7B0/u/uDS
 WUuS6cRsqGbKJeCDEqfxETv2Cuax6sTkF4Ja4V7zqPdQkt8fCTcokNwL+dvRKxW9edGSzEDCW8/
 10YXSFTuzwbSnE2N+WSSkcWdkdukBhxrENOiAN3+LeOFQ9zuR+YelPxnWx44OyMwuIGv+tK6+7x
 2JOls02Ta9k8OB+C8K2LOx8jOAHttfK49VG7i2Nlibn16W4L0d7YvH2txM9ewxuEtzJj+BXn5VA
 /dQtSB1sz02rBQVstARyatjkjWVzYWRPSZX7LsCIssLmJKwUrNNRS3ZPIFBq1yAYYb/vCLV0fba
 OWB/PSvrKxFpDxSUbjMTojg==
X-Received: by 2002:a05:600c:3d8f:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-45565edca7emr17731765e9.28.1752234954464; 
 Fri, 11 Jul 2025 04:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzaH4Mc4qsh8Dto2Y7Me+u0vKHxTstkuDaONIhpZMLNN3nBy6yysYk1uddceGpm8T6pqUcPg==
X-Received: by 2002:a05:600c:3d8f:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-45565edca7emr17731555e9.28.1752234954067; 
 Fri, 11 Jul 2025 04:55:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e2703csm4257131f8f.97.2025.07.11.04.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:55:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/9] video: pixel_format: Add compare helpers
In-Reply-To: <20250617143649.143967-2-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-2-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 13:55:52 +0200
Message-ID: <871pqneybb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RX5v1wEVrkxDdvzWmQMi8BAilW9wGGT-M_vIw0Pi1y4_1752234954
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

> Add helpers that compare two pixel-format descriptions against
> each other.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/video/pixel_format.h | 58 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

