Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD3AB31CF
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664D10E163;
	Mon, 12 May 2025 08:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wl5itApO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FF10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747039095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PP89qRhPkoWIIYcgVm1wnfv4RdTsHvtgvKByma5wHQw=;
 b=Wl5itApOT7ehTHiIH68ZUuw8sCu+r19RMvANRQzNvALKWZDl+gsry38pjUjLQlqiZc7FXX
 Kbit1myxhdh4dJGyudNaXUepUFvOoQhHHC5Q7c8tFL64d2kOoow3gSoU1Nb3I759cZSKRF
 fWDjK2yyWBeTDbt8Z3IKwukYm7F0idk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-S6ZP_09nOLSRlLMtAQw63Q-1; Mon, 12 May 2025 04:38:12 -0400
X-MC-Unique: S6ZP_09nOLSRlLMtAQw63Q-1
X-Mimecast-MFC-AGG-ID: S6ZP_09nOLSRlLMtAQw63Q_1747039091
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c53e316734so749161085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 01:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747039091; x=1747643891;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PP89qRhPkoWIIYcgVm1wnfv4RdTsHvtgvKByma5wHQw=;
 b=RR2A/Q+D93cLG+PEwgb9XqyNKONBJ8hSIYqf4hPR6cdnOkbEULUfjlIO4CZCSG9CF2
 VH/Z/7zpGOj3DYOJI2VK0V29HO6O8OzqhF0z6PMZ6bLPmK8vAMqLdZVpfI17kpad17c/
 4J7x4c41FT/JxivDqXi3Ms/H8PBLULn68PH+n5ZaPQvCr8x7kwageje/uLXWYPEZBjVf
 2XkK1JXkK95jOHjgmmVA/pQb5pDvGnD06N8T95HyCci1D9fQYIMPhajx3/nRV7x+Pnnd
 fw0ZuW37Fi3qt8wyesK0Tp7PZPWhs1CMMI50F/aFqWmwFq0YSIj1uJIY6vshz3yjwNBX
 lvCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9uBHEVex7JC0VCmeteqsM2f+kJoL8s49AOaen7gixFTiUbLaSYW4/CqqNm74hJPd/Nr3iVkxo6hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2X/g2HShqpyuCNlzHcoqwM5I0X5IZ9yvOsLrejbJUVqnhZ35Y
 y1kqxFdPn0QG+I3RJ6ytfzTBqA89geXonQ0aCvdV7hnfxpBNT3cMayDzybWgftKcMKeZK5Hoz/K
 yuv/dvNdDEvJ6YnhilcZ23X3njWb20BE9EGtU3Mk0n6qhHaT+rxupu5impBjISaHscg==
X-Gm-Gg: ASbGncsBwaVojigLi3UERU3wy3ei8YITIJJDe1V6vLQVaRYy82Ua8MlAqKC7BbG9G7l
 0Sd6+hM1izjNmdk6zIaO5qmLU6UztExRg2LRpy7xk63DLd5oQa3vqAwyG2n9/o1LqFoZqqUAIGD
 j63ON9yv2xoKmv8Txa1AUAdkQrVpvwg0mV1CFVwzUlkdU43CsSrIBX/CnSCRVVwfOt15Z1hgaJu
 lbQ0t244o3yx/7DvyRwHVw0K740eZ8tD+K/R4c8wzXvCMr7/ZwWfpw3NnNkrRCm8ysLN10pxb/U
 0TIqkFlQ3MLYHbcYbIwiruLnLf8YYh5z0uEQPYlLfg==
X-Received: by 2002:a05:620a:28d2:b0:7ca:f04b:3fa2 with SMTP id
 af79cd13be357-7cd0114ef36mr1842632885a.38.1747039091454; 
 Mon, 12 May 2025 01:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXjH17/jNl/oMK1ZTPoobma2pz5XZPziKyHswuWD5nTF/iKW1+p6YuEGPTvLqK5Yg5zg9BQ==
X-Received: by 2002:a05:620a:28d2:b0:7ca:f04b:3fa2 with SMTP id
 af79cd13be357-7cd0114ef36mr1842630785a.38.1747039091183; 
 Mon, 12 May 2025 01:38:11 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd00f63a63sm527858985a.37.2025.05.12.01.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 01:38:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <8c717f94-5b7f-476a-895a-c5b0969eb208@suse.de>
References: <20250512-sitronix-v3-1-bbf6cc413698@gmail.com>
 <8c717f94-5b7f-476a-895a-c5b0969eb208@suse.de>
Date: Mon, 12 May 2025 10:38:08 +0200
Message-ID: <87h61qp6kv.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K0DBidmLw_o3AOKM9xjZ07cEDs0dKq4Ux0gdpNv5AmA_1747039091
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

Hello Marcus,

> Am 12.05.25 um 09:15 schrieb Marcus Folkesson:
>> We start to have support many Sitronix displays in the tiny directory,
>> and we expect more to come.
>>
>> Move them to their own subdirectory.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

