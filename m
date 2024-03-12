Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E18797ED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145B810F233;
	Tue, 12 Mar 2024 15:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Agw4u9fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197FC10F233
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710258468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C03ZzqydLhwftyx/8OV079lEb5JdweH7XCPi8d8sS0U=;
 b=Agw4u9fqCEfwuJL+/waWeW/2cbPZxKLlkTmu4Vu6pwXgqTv75o9gQgkekOqN3Q7WuATcSG
 8w5dNkqJhhyl1758KIcRVY07gBBf8xGxQ3ZntqXToz8ZkYrrQYShmx7+RTksF59sqEMOEM
 P3LMvFWXyM8Q25rR/5bdr5HuV5W4y0s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-OIQzQxVUNXeidhF2oEXYzw-1; Tue, 12 Mar 2024 11:47:44 -0400
X-MC-Unique: OIQzQxVUNXeidhF2oEXYzw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33d51bb9353so1990078f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710258463; x=1710863263;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C03ZzqydLhwftyx/8OV079lEb5JdweH7XCPi8d8sS0U=;
 b=i72kvY7mSgdiP63UvTs4CGD58fmSF7AoNX8I+N9HxXH8N4kd52tXk1sGQ8OmqXx8ai
 9T0Jto3KdQbTmLsr5bXuE2V2N4MVC+5zM5lFgRFsKBHE7KLlHdU+NXlWT+jXq++vzubB
 27Tzdr+ogflcPVMVGIJKZJZYl6F04r1kkRJRRn1oNmmMYUK7VdITMO860H3U+leKwSJ4
 ILRbVNRAiXvXepNxUZlE6TVBytNt7ZSWNdHLVbLk+I82gjBJNpCamKAk+RSSXUhrP9N6
 WBChgak62BR+ppeV+I1/+4R4H2I+6J3QXxHghzwo2ItpRg0TOEkSax9mATlMAsbIxy59
 ksDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV98stQJcHfLcX4h6tYpy1PQWusbT9JVUZ8ZM9Nf3K6n2M8O+33gSXeoUEbMe1p1lcpWyb1/7spl1LVZarC3/l2wI9roauqoX4FUeDw9d/u
X-Gm-Message-State: AOJu0YxPqOcXEminWVglaFZiUdjMCF8mNRVEJQH4BMf8AoqlHlWo2gnU
 zI17EahpGDsYCiob1p0Y34AeFr6KtEmwvJvgqx9yosp3zv3nPoJ8Gly79Y1cTTm2hf3OjP+FIDx
 KN7x0XPxJhHkQTpmn2Q1zbj6wVskc+X+A21oiT2VDf+SeKO/q6t+KfdQR//2Gu2R5Tw==
X-Received: by 2002:a5d:5288:0:b0:33e:7ae7:accc with SMTP id
 c8-20020a5d5288000000b0033e7ae7acccmr5781981wrv.45.1710258463658; 
 Tue, 12 Mar 2024 08:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDsApizg7abXDxnCPbaYlKdHgY8nGSh+z+TqlHOoR5D3BylQMjUqTJGZ6234DJDk41455U3g==
X-Received: by 2002:a5d:5288:0:b0:33e:7ae7:accc with SMTP id
 c8-20020a5d5288000000b0033e7ae7acccmr5781967wrv.45.1710258463239; 
 Tue, 12 Mar 2024 08:47:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p18-20020adf9d92000000b0033e17341ebesm9404825wre.117.2024.03.12.08.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 08:47:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tzimmermann@suse.de,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] drm/shmem-helper: Remove duplicate include
In-Reply-To: <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
References: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
 <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 12 Mar 2024 16:47:41 +0100
Message-ID: <87wmq7310i.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:
>
>> ./drivers/gpu/drm/drm_gem_shmem_helper.c: linux/module.h is included more than once.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4567
>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

