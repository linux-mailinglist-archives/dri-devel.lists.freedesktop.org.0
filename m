Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B02C054B8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D7710EA03;
	Fri, 24 Oct 2025 09:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AYobzKrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1D10EA03
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761297581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gjlhKf1lSLezGbueO5hgy+8/2iDTdqmHQ6e26A+MZvI=;
 b=AYobzKrN9yVSMU1MoUKeMqkWGLsiaiZF0hYaVjycq8fGQORSDAEGGMio2OXyVlTj2mZeol
 3ewu/TuJb9QFZ3TeHQD2obrt7Fo4vOMXWvmJQHrcFOojusC4oDGdOdF2AOJAL1/Hbsb+hX
 xBS5YZJaykdH39RRwgDdA4H3P1MB1OA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-7s-uWVF4OIyk-36shl9JNQ-1; Fri, 24 Oct 2025 05:19:39 -0400
X-MC-Unique: 7s-uWVF4OIyk-36shl9JNQ-1
X-Mimecast-MFC-AGG-ID: 7s-uWVF4OIyk-36shl9JNQ_1761297578
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46eee58d405so10691715e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761297578; x=1761902378;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjlhKf1lSLezGbueO5hgy+8/2iDTdqmHQ6e26A+MZvI=;
 b=CKq0iiHXyLBl7P5MeLaFVviJfb5k7P7JM7LvWWiafSCZE0odLTpGZjQRO3XzNjbUti
 hxVfsFdeTfq2kvHgNt82DpgNSrEt5LNwQNEZmBHEWqD/2OaCzH2o9vujR1KmrX+9YmU7
 NPb73gxu5DGm9eYyIkRg/8IocxVUO8r4hhwJ+jRiqICE+pi2nFI42CkkqK+sK8GOh300
 8T1PRjIif1dpKHk/7BR1DJ6kmTDOrbri8hpoHQDwZRuS6lhcnc25iaX+YoQt9pIJ93Zt
 77n7lir/qxL1G/SLxi1BEE9/ET2ZgUiuSVFYewREkV7sN6wpGGptABpHtT8WgLTYT/jw
 5StA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyz+b8yePLSjbuecvXg7TM/heWoBePDU2FEjcLFDsqTJWNxyCIhxIR9eHPPDNi7P4oWCh8iVaY4S0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTaI8K8nATcMw17gQyqdY8BQrtmcv0583SjQz9Z1gH8PbRrgOP
 1SIiRfZLXZHk+wEO9PrqHG6/9NxOkZfbKoiI0tGiB+4rXWgox0l4jKm2nJOW2HT0liikvw12bi0
 xXtcPW0JcTu7mUCTN5y7uaRPCepro6/UvEuIQRhCKdfUWvvt2d8xRDlx0uvbcxwDHUos0hA==
X-Gm-Gg: ASbGnctnTSaVxbAOCM3C8uBxxDHecPK5zynfyLCxxMQgMNxCT4jlHSbyEPT0ab5D+Vu
 0vebdxT3SS7w0Q3wHm7BKWggzsYtnKCzK9/ZBylAhqldPOILPfCYZmwy0/ibG4zZpirkpJWeFrN
 G2XKuERHUYx1LcNSDo2L7bOdkfZarGSXn3xtbWaK8bD2W6w/kc3aQ4TdkKO3ejCCJI4UaiF/tER
 xE+38YWdfyd0OKW65Ay+y9yM/PFDSHIBHzI/WoKhcK43OKF9FAgr1cSlAcE0xCF9WjpEkB1UcMy
 nejLdpAPtfBF30ANelC+nZaEui7ZYNt/lmlIJqMSJPCjXtnQqTMB8tQF902vaw6wPrhaI0L611O
 Z7Yv9OMkPhRAEg211BWfnEi9kOSHAVtn8xJChjsSYQ2G56FNuCcaMVDHgmw==
X-Received: by 2002:a05:600c:820b:b0:471:1717:40a with SMTP id
 5b1f17b1804b1-471178a8245mr197432835e9.18.1761297578558; 
 Fri, 24 Oct 2025 02:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPRojaApcfmKLinZI5+an6nxl1x1LRwFmTf1gBlrYMQPX1+RmkaC4nUCtM8shmyfMR6tCbSQ==
X-Received: by 2002:a05:600c:820b:b0:471:1717:40a with SMTP id
 5b1f17b1804b1-471178a8245mr197432615e9.18.1761297578143; 
 Fri, 24 Oct 2025 02:19:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949df22csm84324805e9.0.2025.10.24.02.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:19:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org, jonathan@marek.ca
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] efi: Fix trailing whitespace in header file
In-Reply-To: <20251015160816.525825-2-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <20251015160816.525825-2-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:19:36 +0200
Message-ID: <87zf9g8xnb.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IdQMObkxj3xWGkQfUmSlRB61jC84RuVH1vIrLz4CWQg_1761297578
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

> Resolve an issue with the coding style.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

