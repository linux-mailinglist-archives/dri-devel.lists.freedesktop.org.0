Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439BA7FB9DB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5A210E4F3;
	Tue, 28 Nov 2023 12:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1FB10E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701173158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L29QgGwjvdfNyT695GVt3JRiDUaabKqIQtEMfmzN4Y8=;
 b=jI1+J0b0Kd0ItWZbbpZMnYxhaVcK5zayA/Eg30B0KCoY+1MIXLPwFYKzAtSsAUsdD+9JlK
 7xEs7NKu76X1HCr/oobxHpsUgmP7mvjf+HxLJ0s1A4XGnZkL3Mpp1UWjSLV5GJLzwWm4iR
 6WoDbzXp2Kku7cLfPCl73EtK/awanhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-h2KUf3CmMbCo_LIAqvVdrQ-1; Tue, 28 Nov 2023 07:05:57 -0500
X-MC-Unique: h2KUf3CmMbCo_LIAqvVdrQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-332f91f43d0so2326341f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 04:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701173156; x=1701777956;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L29QgGwjvdfNyT695GVt3JRiDUaabKqIQtEMfmzN4Y8=;
 b=pp+GcfYzSXTqycKix34hmPKcO0w1qY1EKg8+bx9daewtLt+EtGZmPicjrRvAdG4G7r
 NOJZTzyEx9eRDph9gSW2HGx1M3T4Ek/v7tTMvFyQp8FPqSwd0addSV8Rc5q//gjbmLgv
 Bj6eTmpgdAgPswkuXWSh2zku23rWo8k/CwJPfeA9gdyiLlOgRf9+0tEGTRqsmsMx4hA5
 Rr5QVQpORf5Bj/cEzHZ6x6VLvC85i5bY2vrlNVrJnySRhz/fGAiIU0aASKLg7K//FcX2
 60dUjs6VtyVz8suCtOgnqsQsXw6UuNQlzRSYxItTYFx0OsVMQ/hitwMKb0Ndxnxmq/dD
 ODvQ==
X-Gm-Message-State: AOJu0YwQwBr7ZdWAtTMpeY/f6tvT1X9nAwNSJfqzcV7d2BTTkglPZtWw
 GpunszW/nrsazc6SreRjKGxt7mYkjpqEj4xHcxTWJMDK7WX1bC4KutWwBHWvoZwhRW6OKb72vfS
 oVlKMmSFppo+ZedrCQwwiLHA8LAbv
X-Received: by 2002:a05:6000:11c7:b0:332:d413:b453 with SMTP id
 i7-20020a05600011c700b00332d413b453mr9824931wrx.18.1701173156220; 
 Tue, 28 Nov 2023 04:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4E30b3yLIua79mw2Ny9rPA/606yDaFC+NJBY/hqMCE8tASwICAyywTAdKk1ENohBbnUxhBw==
X-Received: by 2002:a05:6000:11c7:b0:332:d413:b453 with SMTP id
 i7-20020a05600011c700b00332d413b453mr9824915wrx.18.1701173155897; 
 Tue, 28 Nov 2023 04:05:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6c65000000b00332f6202b82sm9267781wrz.9.2023.11.28.04.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 04:05:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dipam Turkar <dipamt1729@gmail.com>, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v2] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
In-Reply-To: <20231110192452.734925-1-dipamt1729@gmail.com>
References: <20231110192452.734925-1-dipamt1729@gmail.com>
Date: Tue, 28 Nov 2023 13:05:55 +0100
Message-ID: <8734wqccbg.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dipam Turkar <dipamt1729@gmail.com> writes:

Hello Dipam,

> Introduce unit tests for the drm_mode_create_dvi_i_properties() function to ensure
> the proper creation of DVI-I specific connector properties.
>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>

The test looks good to me but I would like Maxime to review before is merged.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

