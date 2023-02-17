Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090269A7B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8E710EF1E;
	Fri, 17 Feb 2023 09:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CF10EF1E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iX/V/ayuIBSrZtIRFg5DW3vDK9omTeaZk0P2mOKN4MI=;
 b=A75Ov2ugRSzbTB+LWJPVoBDX3VE1OW/obTJ1JclzTYYpgq+kmyvldT4BAJXU5Q/vNYyjsh
 sltXBVjPYqbmwuQJSER/DxB+4tDaq2oi94GacZ2A1jIEKDaxD/x8k43fZNeQeDGX+eczsj
 ELXw8Rxov+wRT5r4RXpgxlMDzNxfSUw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-XiY0iQ1uMuGk7wyyRqGHwA-1; Fri, 17 Feb 2023 04:01:56 -0500
X-MC-Unique: XiY0iQ1uMuGk7wyyRqGHwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p42-20020a05600c1daa00b003e00be23a70so349672wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iX/V/ayuIBSrZtIRFg5DW3vDK9omTeaZk0P2mOKN4MI=;
 b=aqbGul2Y+dXNBp3TLCYHHB3WxbbvV+bse5tsJg+WxHw3q/PtyuCgZdcvFXzezdhkhi
 Jzw/m+s+jViVttXlvYbLK9/qlyuh96E64ZaEKdTntyjFjYzZ6tdENHaIhEpgfjEa+FjL
 5L1ZH0N6DqwK30hdhX5PR7OkRjANN1xGjZRRf+PEbzMcBj10roYV077LMFq08NdheJmp
 rdLCa3lByiCVUKTGRXMkrDpEiBBlFx2tzKWtJdWSBp1EDq0msA3q/Jm6UNgWAUCZqWIA
 qYlUnvdQRPNWEnAduLkubvVplqP3R5FhdBJ7Dim8UQge4RZaEZKjQLN8TXI9hQZb+TrR
 xkCA==
X-Gm-Message-State: AO0yUKXTiTQAWvCAOKmm4XwIJ26/H5tvF6i3cJ9DpJae3+k//gKrwMLc
 xtmUPDADYBeRArvihYWhZiK0NVO4/WUg7m877imVszjQBw990pqwLBxVygASL+cYeIfqSSFARK5
 ttrTIrGs0qXq0qJdb8BnRS8GqEk3I
X-Received: by 2002:a05:600c:1656:b0:3e0:c75:7071 with SMTP id
 o22-20020a05600c165600b003e00c757071mr607294wmn.5.1676624515354; 
 Fri, 17 Feb 2023 01:01:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/6LO81+kz9vV6QLUhodmDEJr26PzK9QZHVy10kd0C6ka1mmiRMz10jyhAUjwG0w24sNhK/BQ==
X-Received: by 2002:a05:600c:1656:b0:3e0:c75:7071 with SMTP id
 o22-20020a05600c165600b003e00c757071mr607280wmn.5.1676624515102; 
 Fri, 17 Feb 2023 01:01:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c190-20020a1c35c7000000b003e21558ee9dsm3933693wma.2.2023.02.17.01.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:01:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 09/11] driver/ps3: Include <video/cmdline.h> for mode
 parsing
In-Reply-To: <20230209135509.7786-10-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-10-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:01:53 +0100
Message-ID: <87mt5cwtq6.fsf@minerva.mail-host-address-is-not-set>
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

> Include <video/cmdline.h> in ps3av.c to get video_get_options() and
> avoid the dependency on <linux/fb.h>. The replaced function
> fb_get_options() is just a tiny wrapper around video_get_opions(). No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

