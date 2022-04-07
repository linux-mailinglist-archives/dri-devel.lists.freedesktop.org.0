Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0344F7B15
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47210E76E;
	Thu,  7 Apr 2022 09:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93E810E763
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649322659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgXF00+JuF+RWxEt+WQf0O5z5H+vsdEWkFDyAJB6Ijw=;
 b=gxy6kKpXy3XGbeb3Qr/0e4sxyug6nIAxQfqp6h8aSaegrW4GhkHxQQW8mCTQaZFXPbHjXE
 e8svLa63gVDrVLORVvmP4qrFK2fjYKvGaxLjHJjFau0JbHDMQXnaDhI3DeGsZjCr8iLjJ3
 kk+XoKvdDR1xv3KaUEHiHvKB9zPSNuw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-KfeHcsR_PmCA5XGxiZyqzQ-1; Thu, 07 Apr 2022 05:10:58 -0400
X-MC-Unique: KfeHcsR_PmCA5XGxiZyqzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h16-20020adfaa90000000b002061894030bso1069660wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FgXF00+JuF+RWxEt+WQf0O5z5H+vsdEWkFDyAJB6Ijw=;
 b=2GWGGo/AqZavHI6EVuyy2RHf4O4ZWtIJ/D5OWzhMoNbr62Gsr9WU3eV8OiZjbAUeqd
 VnjbtCYORePyO8XcBCOi9r0xg8AF4D5xLxM/47UiQG4CfROAq+MDMNmMYu4hy75CPZDW
 YPax6jx1iIK6JFMOwfIuJbWNTWW9NbFOnncmD3XE24R5klJdUZKFKmtmX19oZaNJ7wQd
 K5AKS4Eofl0Scb1gnq5ROP+0YiLm3i8/p+ovyZhYyuRPE9cJmG5pLe05NwJFI7k4a24w
 XycleHFEq4jxt0mKYt3uSOZLjYicoFG+dpOXtx4ZWoXJeRn3uZ38X/cxVoOC7gXFSdFh
 jMUA==
X-Gm-Message-State: AOAM5309n2SnjAN45MBg7RcX1eK8okkFQdRQZ4O8OmPlVgGr4kdCAfzi
 EclbU3ZSHgbEtVOL77NRrHZ4aRc0KvZlFe3C5caeB5fdGO4TAHC8m8Tjf/sCqjLxeDLu62/ck+b
 vPZPPNxFipdZAuquPO7nXOYO1XuuT
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr11521058wmj.195.1649322657133; 
 Thu, 07 Apr 2022 02:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw26/RKx41KOWBhiaIeMjzf0jMWUg3ym+Vw/w0y8Kg/lKx4S5ltqf5t2m1WmWmgCTWCtfXB+Q==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr11521042wmj.195.1649322656937; 
 Thu, 07 Apr 2022 02:10:56 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm18903341wrs.73.2022.04.07.02.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:10:56 -0700 (PDT)
Message-ID: <a3cb05a6-20c7-47af-3cca-ae225f56be85@redhat.com>
Date: Thu, 7 Apr 2022 11:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND RFC PATCH 2/5] firmware: sysfb: Add helpers to unregister
 a pdev and disable registration
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-3-javierm@redhat.com>
 <Yk6plGLa+uOb0ZyJ@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yk6plGLa+uOb0ZyJ@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 11:06, Daniel Vetter wrote:
> On Wed, Apr 06, 2022 at 11:39:16PM +0200, Javier Martinez Canillas wrote:

[snip]

>> +}
>> +EXPORT_SYMBOL_GPL(sysfb_try_unregister);
> 
> Kerneldoc for these plus adding that to
> Documentation/firmware/other_interfaces.rst would be really neat.
> 
> With that added Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>

I will, thanks for pointing this out.
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

