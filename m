Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F790749D02
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4032710E07B;
	Thu,  6 Jul 2023 13:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61110E07B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688648873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LeNjy3+keWlsOvLTTvuNBq4v2wzKbZwn++nVg8XqFBY=;
 b=W0uAdGEHqr3A7gcb3jUbe7QuIK2MVuGJu05DIrSmbcPMIcZD0i5lGX711susCm5xqIHBNz
 7z3U7RRxbkeVGFjSkSTgL4XrSCOWq1YZyvtVcizXdfBfeEm+AFd3nfWdtCcEt0BbMer2yN
 zMe0hPWMEQOeKToHNEuJMEeBUjP6yHc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-dZIU_tRmNESRy7DmDTheqg-1; Thu, 06 Jul 2023 09:07:52 -0400
X-MC-Unique: dZIU_tRmNESRy7DmDTheqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fb40ec952bso4060965e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 06:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688648871; x=1691240871;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LeNjy3+keWlsOvLTTvuNBq4v2wzKbZwn++nVg8XqFBY=;
 b=IIiXE1UqV/ZPFkLuBXJCdOSfEjGyc66TDsTlba8hgiQ4mH2YqLwuCPjXc3MFpbpV4U
 iDE+yQ0xPVT23Vqm8eetiCcYIjLrmwgxwVMwV120pr6lvbMzcFh28VomZOS/oFWx9c56
 FLVvz9wSIExZefJHKlOBojrMo79s5nGICSNAll4+pD70vzmX6SAI4suUiNXKuKz2xxHz
 aeyqg7nQwVOnrquwc2JzKTuhWfSBaOr/uX56mk1PWtJfjbRty7rTe5TW0/c4mgO3wYQT
 DF2XwaN+tPCxgeaDMbfb31enkt/bRi42PmNyeW3t2PCPkjNAnMDMTEezBofZLgOKzNAN
 jLzA==
X-Gm-Message-State: ABy/qLaDzpvAJ/RWfA6Xn9DQKXMlZIdrGzzbRsBx2jnH862ymSNPzkac
 fW8akH6r0H5hNglSriiBUUjZb39nz3TiTxNxN+n3yjLb2JpbcyhnjM5IOXlY5LZRww7LCIPw9Gp
 ccTGdW9bOWgqVvCqg7RJv6X9SNQTS
X-Received: by 2002:adf:f805:0:b0:314:4c78:8b84 with SMTP id
 s5-20020adff805000000b003144c788b84mr1326692wrp.17.1688648871140; 
 Thu, 06 Jul 2023 06:07:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEaxocSJQPDHbM+Bf8WPoQwbvLcXg68bXBbqp/OOFiEKQL+7RK5UP/6wE2wZ9Vp1LmHB/VY4Q==
X-Received: by 2002:adf:f805:0:b0:314:4c78:8b84 with SMTP id
 s5-20020adff805000000b003144c788b84mr1326675wrp.17.1688648870795; 
 Thu, 06 Jul 2023 06:07:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d4807000000b003143aa0ca8asm1885374wrq.13.2023.07.06.06.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 06:07:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH v2 11/11] fbdev: Harmonize some comments in <linux/fb.h>
In-Reply-To: <20230706124905.15134-12-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <20230706124905.15134-12-tzimmermann@suse.de>
Date: Thu, 06 Jul 2023 15:07:37 +0200
Message-ID: <87sfa1xk6e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Make the comments for I/O, system and DMA memory say the same.
> Makes the header file's structure more obvious.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Looks good to me. Thanks!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

