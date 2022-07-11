Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF12570026
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6DA8D80A;
	Mon, 11 Jul 2022 11:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4F8D812
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657538504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EA1fN116GiBeZpsIBZbEwfZ8hmNEURQAPP+h9KqfA64=;
 b=hYgLnbRGM+DSZxcZiXOJanzmRPxrs13zoRrVS1xd7bEml02HsPaI+k9FHidcyMaCYUwfZP
 UfRYRptUEt2Vd4wGjvy6fOwXgp91oEANXz1Fs4vRIgMXk4aJg56K3wXYEj2MVFcoRBDhF/
 ONBNV3hEFb7lMRsYH83xz+Eei9XEK6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-M_9-vMDoPZ-lffpXnZ8DOg-1; Mon, 11 Jul 2022 07:21:43 -0400
X-MC-Unique: M_9-vMDoPZ-lffpXnZ8DOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so2539686wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EA1fN116GiBeZpsIBZbEwfZ8hmNEURQAPP+h9KqfA64=;
 b=XsswcLcZugc1p2rdorjcEJ/9ToASyyQ9hGD5++EE79tCf34tkK55YVbfSNQnqxTeqm
 CJmBbOpKrFRFwDQ9AGYHHnzsumPpsHo/s7HDcDFF1Y46XxS+h9MblfbMZFlnZ3Ra0P5g
 SZPCyc49BGZz7ewQlCveCO3JgCZEtulTm0R520C3RKY78lPvlCfX4DnLV2rhmyPm5KB7
 N/R8opCbZHUZQXnslzAT8ekJ1DjGk5DkRCtwhAki3pLuIBX8g9zT5Q3/fH/3okmNfAsO
 7oDI52AX8ToqG+UunykcpnPLZyyp0eTUK8bGi8sptNOWYohvwccPV3InHzGfMheFd/Mm
 79rQ==
X-Gm-Message-State: AJIora+x+jPf+JmCZMi5TR110Cz+/6booHSwFmr8vZ+e4fzdp63RRgTm
 +1Xq+5+NGdXWGjtsOsnFqUdgnlq7icy212/JKFeoAydZud8Jeay2PgsS+MaIgqqsjRPAP3TgmiZ
 RAudXB88dt8vdN8oS38lZkBcdw2k0
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr16718308wrp.86.1657538501994; 
 Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vViTnrccYUQiM5dtYGiMoQe3XlJipDQ2tJJSnuKHUKFgjkwhFFyBuMGkA64X7e1vg9JvJxGg==
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr16718296wrp.86.1657538501845; 
 Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c2ca600b0039c63f4bce0sm9837768wmc.12.2022.07.11.04.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
Message-ID: <00efc10a-a033-02c0-d5b3-95a5a1494c5a@redhat.com>
Date: Mon, 11 Jul 2022 13:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/11] video: Provide constants for VGA I/O range
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-9-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Provide VGA_FB_ constants for the VGA framebuffer I/O range and convert
> fbdev code.
>

I would probably mention in the commit message to that you are renaming
s/VGA_FB_PHYS/VGA_FB_PHYS_BASE and s/VGA_FB_PHYS_LEN/VGA_FB_PHYS_SIZE.

I do agree with the rename and think that makes it much more readable,
but think that's worth to mention the rationale for that change too.
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

