Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABFACDDB8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3240910E0EE;
	Wed,  4 Jun 2025 12:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q8iXRUlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D81210E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749039474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r4JFYZJ+eGP+Jjx7gL7++d9D9bzVW/u2sg2wAgJZ/KQ=;
 b=Q8iXRUljDcjTN3amWKqU/QVxWdoraCknkac0Kml5FJQW3zHX9Vsde4h61rXuhpVNeN3TB/
 /r6M43cUBNgao8qE5FPKtRnDXVSkh7xIS+I/VCLNBOL/qV0+yV3DfT/PgWixMTImukelEW
 jhsDuLR3HaDXYFUqrd3H7tYG+owm4HY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-bJw8g2bUO7WjnXq7X7HxbA-1; Wed, 04 Jun 2025 08:17:53 -0400
X-MC-Unique: bJw8g2bUO7WjnXq7X7HxbA-1
X-Mimecast-MFC-AGG-ID: bJw8g2bUO7WjnXq7X7HxbA_1749039472
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450d9f96f61so41421195e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 05:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749039472; x=1749644272;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4JFYZJ+eGP+Jjx7gL7++d9D9bzVW/u2sg2wAgJZ/KQ=;
 b=BZmsb23QVDeEj2TMEoAhzmWB5MqMJgTksYtQ8VRbymqkbw3dfK6NEhGcXcq4E62OSb
 ckGsevlTy6S+TQkM7cl/3OnNN7yH+wcg94g3BovDaegjosb+f1Qk8Pvw5pfgAuMRB2oS
 DN6e+CAY5NQu4wLpHAniFcBu4YCyb/xbgjgQdE3lQmuAB0oCBzvDAKvVpCjtUGkqWf/3
 kaKUWd3iybwP2/DsJCrqWWZ7IQA/HqrtQvaLgnFoFPWR+9V9WvVG7ebpu2GKo6Ki4qrC
 HTF9GbHpotvW31rerFIVQwC2RdQ/KRDAMiVtm1AtoCXiWrrOXQvXnkfKceSlXoPLxZpM
 GLJw==
X-Gm-Message-State: AOJu0YzRMEX/BvXhNEElCm6ACjq7bCyhsd0Wo3k39nH5L1/AOVgefLgX
 J81IDqNvUYTza2cMvVmEHXO1iXkllpiToly909GJSWLwrxt2xrTbQza5QN7fabA6ge9+InFHUIW
 uc66O/6fz1ym1XzPCo8HQ3GqguLu45SxrtXXYXuqDTHtulp4LSxU2UHe6UlbEEdC/u70olw==
X-Gm-Gg: ASbGnctoS5zbTD6VBEUPCtHy1teQPlRrmiR5eiSMQoJWghaYH5mzVvcWj+gHiK3MONV
 aJ7U05OhYE4pt7sEarA4IXN213wNi9EP+hK0GqpAoky6CalvI9ac7aOACQQM8L2bjOxv79b7Klw
 NKEiiRTxNqAHJeVG76wJXxxxXk3HfFhjUHOkowyY93Z2gshJWrF/qSivkwG/nGb8+Z+tw7CjeQ2
 j9sPaFHnJ9qfdNH/wmbyE5VVLAQ8gC9cBHk6MDcYI2ZmqOyWLHrP3far+ZnYR6KFHyeLWGD00xg
 KHTlSpiC2IKa3nJmIP/Hyx7KkI4jATYSSm5LB2AaEVkLQFAJ5U/fDeoA6u3+c7wJLzqf5Q==
X-Received: by 2002:a05:600c:3b9d:b0:43c:f8fc:f6a6 with SMTP id
 5b1f17b1804b1-451f0a75ccamr23279625e9.9.1749039471990; 
 Wed, 04 Jun 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyAY+FvfEBTsxFIWcn0kZ4K5Z6vfe47K2WXR6uUWM9NHYUcL2zpFehWTBJQkrF/THrJgajow==
X-Received: by 2002:a05:600c:3b9d:b0:43c:f8fc:f6a6 with SMTP id
 5b1f17b1804b1-451f0a75ccamr23279365e9.9.1749039471554; 
 Wed, 04 Jun 2025 05:17:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa23f4sm205570065e9.14.2025.06.04.05.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 05:17:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/format-helper: Normalize BT.601 factors to 256
In-Reply-To: <20250603161158.423962-1-tzimmermann@suse.de>
References: <20250603161158.423962-1-tzimmermann@suse.de>
Date: Wed, 04 Jun 2025 14:17:49 +0200
Message-ID: <8734cfaefm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EAdDwFtMXjhwigXv3GVh5bitBHzHs-kNk5ClFpNkeLA_1749039472
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

> BT.601 weights RGB components by certain factors to convert the
> color to grayscale. Normalize the constants to 256 instead of 10.
> Allows for slightly more precise rounding. The division by 256 can
> be compiled as an 8-bit shift, which might be faster on some hardware.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Makes sense.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

