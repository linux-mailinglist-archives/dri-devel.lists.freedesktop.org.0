Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610669A76A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189A910EF43;
	Fri, 17 Feb 2023 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D210EF38
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5eirPtt0bDDD0VC8/0ooXO+OVuOVuv6YKo88N359qI=;
 b=BFPfTRjML1QsNnXmGTcAA5o1JiEGNNm/q7wsvJM5kGxLZaMcb0dzbG8zZDYFJjut5kYQW3
 93MWPhBtqcwvePclFnU0qmZBGGTdnd8d7ypkG+tiCHv3ZFy1VSrO1DYLlpsvBUCGj6VHpN
 jerXrDNYr/P98TikW43ojdu77iHNMA4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-2Ap_dEpAPVSdltdsQmSmOQ-1; Fri, 17 Feb 2023 03:49:59 -0500
X-MC-Unique: 2Ap_dEpAPVSdltdsQmSmOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az3-20020a05600c600300b003e10bfcd160so285415wmb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V5eirPtt0bDDD0VC8/0ooXO+OVuOVuv6YKo88N359qI=;
 b=Uh3tTAdB2MielJ9w5Uir4ioKGkKek2AmpiAhS/+e2Na6DAUx8oTZHL4+Id8OGOiYAu
 UFWJhIe5AbsznByAhMe6eULZT6cfGQxOl1UNFEcp4QB2e9ykMqldU9la2vW1cByDFtV9
 9kv6qLY6SGm+xCvjqiS+c79jDpQ5cV82bb51jij4QgdYAze0rynAvdWVGNFQfSdv1slE
 evuMRZrlzngrqQn7O2YUjmaKk44f0Gc5461Sk4z3JmilFaIjLEiqOQUWTikUdwMJKlpT
 K0yoy83SM4nufTY/KoDjm+YuO3EL8fuyVCZ6QA+U1AOa8X8yRtUmUqlENsXPZ2XnvjoV
 SmAw==
X-Gm-Message-State: AO0yUKWaZVc30pcPY6b1krAZxpriftaXAhY+hSv2TeSCfnyAlHBV+yDU
 rKx++WlYnxykQOIyHs2Tx1pW66rjvxZb2FQbSP/r9uPBF7ml26fD5etfO9jJoHgH6vlbx9/RW9b
 GOO9niGFYAFa2d/SW5HugAlIZxhWW
X-Received: by 2002:a05:600c:501e:b0:3df:9858:c03a with SMTP id
 n30-20020a05600c501e00b003df9858c03amr4172536wmr.15.1676623798387; 
 Fri, 17 Feb 2023 00:49:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+LPMyLuPrvaxDmYOluBZLQqQ/47nuiPToFIH7LNFS05RQ23xFbpxkx+PNYRQo9LGrIf8ThLg==
X-Received: by 2002:a05:600c:501e:b0:3df:9858:c03a with SMTP id
 n30-20020a05600c501e00b003df9858c03amr4172516wmr.15.1676623798054; 
 Fri, 17 Feb 2023 00:49:58 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003e11ad0750csm4319732wmj.47.2023.02.17.00.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:49:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 07/11] fbdev: Move option-string lookup into helper
In-Reply-To: <20230209135509.7786-8-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-8-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:49:57 +0100
Message-ID: <87sff4wua2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move the lookup of the option string into an internal helper. No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

