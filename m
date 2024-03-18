Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4987EE51
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF7E10EAA4;
	Mon, 18 Mar 2024 17:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XTNx+MaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17E10EAA4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710781400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B7uD9tCcL5UMzFWwVdaPHucWFHqjdQjWPl2cOgnahzc=;
 b=XTNx+MaBwACNAT3Balt1r36KeOlc5NZrKzuRwi5fGFFgVB3Utt1B1ooGNlit/m/YDr+lFj
 xGJ6DYrb68Uf2hmif76rz5hEXaUFAGXrGMpL+UcCcA/Z0+pMpcfdH2xXdElljoXaEb9CA0
 r8wz6BDEpdaezVcAQJhA8F2bL3DO2Cw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-KgPw-K9kPfapptEnpsUqdg-1; Mon, 18 Mar 2024 13:03:18 -0400
X-MC-Unique: KgPw-K9kPfapptEnpsUqdg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-34172041676so696108f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710781397; x=1711386197;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B7uD9tCcL5UMzFWwVdaPHucWFHqjdQjWPl2cOgnahzc=;
 b=CpAPbABnBZACwrYr++gCRXI/kflhgCuKwB5GWI7GYp7FLSk/FMj23iFFKvfEuKDbo7
 MBPoWC72cEm3xTPdX+MZFrlvZlVCcwGitbBdiXQCSe6p68p4v/dQQkWZ9bwj5Ci9jlYa
 MOtibro+VKSkJoQ2/RWy8D28xjcjzWtnAdejrKnW056s/ef+J9P1pojOqFVXlSH2TFWi
 03jY9IVffe4g91srnUchyhYI1rtURKHk4CEzBnSAduYMas0J8UNU8AcDo8aV2yelABXz
 IQkWmA1f5eQhBODLRfL+g/HymuB3MRogKPJgdG3u6OrpuU+VxH7+IRLWaARNDBcJT8rJ
 QYcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMGf60JSjVC8YFukqe1E02osG7SnaGesgt/TSfB5BrgSax1ii7JEjKU4512a31LsIRnnRlTEEWQ0sWfkUqJs4CiQ8Nj8ldu2i9N9ZBVdjR
X-Gm-Message-State: AOJu0YzpRtHWNSPXRV3F6GzY4ntuI6AeB7GlMQJrSH9WOUDyOBbUMIxL
 0DphQZhLQJ4lTtiflMhioE5ZPKIvaejniduSpI0AtBTTYcW1OW9pqpVy2StzWOPT1N6rI5EX160
 zds5+XI43mtsoHIWEUkhGHvvOZ10lAHwM8+89iLq++tNYdqhq6khDSBoTfLyx4bVZLQ==
X-Received: by 2002:a05:6000:c82:b0:33e:d20:651c with SMTP id
 dp2-20020a0560000c8200b0033e0d20651cmr159707wrb.17.1710781397715; 
 Mon, 18 Mar 2024 10:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8jsZcNWZc618FelFUJ5coAJsNdV/LuwV54MiWjO1BnXgoHyTKmi2EC3uPOAtP61yHsDM4/A==
X-Received: by 2002:a05:6000:c82:b0:33e:d20:651c with SMTP id
 dp2-20020a0560000c8200b0033e0d20651cmr159684wrb.17.1710781397299; 
 Mon, 18 Mar 2024 10:03:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm10223961wrp.30.2024.03.18.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 10:03:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/43] fbdev/deferred-io: Test smem_start for I/O memory
In-Reply-To: <20240312154834.26178-6-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-6-tzimmermann@suse.de>
Date: Mon, 18 Mar 2024 18:03:16 +0100
Message-ID: <87plvrfp63.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Test smem_start before looking up pages from its value. Return
> NULL if it is unset. This will result in a SIGBUS signal.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

