Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C627EE03F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963010E27C;
	Thu, 16 Nov 2023 11:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3BE10E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700135871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPqGFXVhoOJAOGmkOh+AVOaUjN8gAwNLcy8Vd+Rk03g=;
 b=B/IVzXD1tr+iHH6gWwlKyUF8JfRFqZIbmDLeSldaNXWAbnmBR1d3Gi/9mJP+kAyA1ZgI8l
 sVH/Yij0KmeQxsCqYG6l0CSuyF45RrlOd0ctLgAI3szZpOU39TbOatwSZ9r49/55XYBNpz
 inrHYT7+FsqjFFwbIL4frtvooH+JPbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-Y0r-6OHKMviqRdmZhWt1NQ-1; Thu, 16 Nov 2023 06:57:50 -0500
X-MC-Unique: Y0r-6OHKMviqRdmZhWt1NQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32f8371247fso353687f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700135868; x=1700740668;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPqGFXVhoOJAOGmkOh+AVOaUjN8gAwNLcy8Vd+Rk03g=;
 b=beLWEjsaE9SF7tgcNh/Oz32muBCwGowmyniib91nL63g8znh1cjZgtuLjNQqW3CYH3
 iKKMfDyg4K0ZwdXFqkgiyet7Y1vgOT2UTrTvhe4C40gXjC0RcvkzWqg6czi7KxO1SsKZ
 gJ8vrHhIrnmgs9AaxFHVgqTCIHO16Mwf2zJgfbLPOvnpo+gymY0TENdTdlb8N2xP26zD
 TvOo6/4sZ0ykhH/6kKvlqdcHVcQFYybngqCCwARjasNjQDWDBcN8VyQw93WWKyjlS0Kc
 Y/2GWisG64mGUxxJiLMXOnMYMr3EyUkCUbnKDMgbwKR6KBekcGWnt4RiyKFiDq5plAub
 wcmQ==
X-Gm-Message-State: AOJu0YwB+C/plWXyQ0HPLS2nuWX0AfNPb9jt9rbpd1Fo84MsrVmGayJ6
 vOBmMQO3u69c4JEOD9I2jAAI5try/PyFDaY4uaV/adEfiS2W62PSqZ6zWsStKrbIkvXxwBe7eGk
 ycpNoll5VB1AuC7h8HYlFp5UgODeHhXjwEXKj
X-Received: by 2002:a05:6000:2c1:b0:32f:7d50:267e with SMTP id
 o1-20020a05600002c100b0032f7d50267emr15968014wry.9.1700135868655; 
 Thu, 16 Nov 2023 03:57:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSgGBwWSGgKgB90lpexnyrsMqam+5f5ZdNROWqRD1U0tE9001rNzCx3BSnj2QBkH6SdjRCWw==
X-Received: by 2002:a05:6000:2c1:b0:32f:7d50:267e with SMTP id
 o1-20020a05600002c100b0032f7d50267emr15967998wry.9.1700135868352; 
 Thu, 16 Nov 2023 03:57:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e17-20020adfe391000000b0032fb7b4f191sm13384655wrm.91.2023.11.16.03.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:57:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 28/32] fbdev: Remove trailing whitespaces
In-Reply-To: <20231115102954.7102-29-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-29-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:57:47 +0100
Message-ID: <87edgp3o78.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

