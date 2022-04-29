Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD61514356
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870EE10FCDF;
	Fri, 29 Apr 2022 07:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276CA10FCD7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651217645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcIvWzPcJnww0zTz6xq/G3xwoPRJB4jNoVaJfsinXWU=;
 b=DS/DWeDoqY5YrXeKtSP9PopafGEoEeQI5/qEzc0trPVNjA8inhZrFZ/aIXbWrYuAMZZ25u
 A8NmsgnxfLE7zXOWPFCbWEOuYezLKPEXcdGyG4HQzWE/mUqanFELIGJwU8dTCs4MoVwjpK
 +0DFcsNxOnpipWZPDNOHLgwxxj0j2DA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-wrhP_jBTOj2Kn5Yel_KSIw-1; Fri, 29 Apr 2022 03:34:03 -0400
X-MC-Unique: wrhP_jBTOj2Kn5Yel_KSIw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s8-20020adf9788000000b0020adb01dc25so2735119wrb.20
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OcIvWzPcJnww0zTz6xq/G3xwoPRJB4jNoVaJfsinXWU=;
 b=WR4rgl6qAcZ9FPF00BfvVnGJOBXYGBxOj3T/pI/fCyP88QsJSmODMY1ukd8QeaJOew
 t6/D7/XXuoMzJ4GUMIWIMATjwd0Vm0I4nlv8QWN4VEqo0k7GJNBOroJL1zYeVvLsRGoq
 9kNI/qJvtVe7OdIXA0DtnzXqoeP33Xe1cOcDs4FjGhDSeVRxikBuSCdUOtjcgawE35qq
 ojw3QuEPrKPNgyDDcHbxJ11jt8z03V3Geff12rJJPsFuxR61JdQp1vUW2w+NqM5HcIIj
 D7YDvaBhAT3dyM1b/gXnOlYtGqLf8o5iWADlRv3Ne4RclJKWWC/xah7SJ0/4l8dWNhxX
 vq3g==
X-Gm-Message-State: AOAM5300dUrRqfge2zDHi0dYd+8ASvqKj/85HdNzkawbvt5G0n8uoYPN
 gSYCic0VBcx/vTFulJmNlRsroG7vgMXQtuXFNEX2MSlqHyFll5exUThgsMftZ5A7N3ivKrkkGHP
 ZcglTX8OZwMVkS7TQ9kjGSizR+uyd
X-Received: by 2002:adf:d1c9:0:b0:203:c225:d042 with SMTP id
 b9-20020adfd1c9000000b00203c225d042mr29168273wrd.630.1651217642692; 
 Fri, 29 Apr 2022 00:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKeChGxDtUOIOIVUKYT/bPfzc5CwFC1QoimsKjIsxsaE/PpQ3Tz6m0jAjbCqtV0ydl1Zka6A==
X-Received: by 2002:adf:d1c9:0:b0:203:c225:d042 with SMTP id
 b9-20020adfd1c9000000b00203c225d042mr29168261wrd.630.1651217642460; 
 Fri, 29 Apr 2022 00:34:02 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020aa79d55b5sm2001749wrb.35.2022.04.29.00.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 00:34:02 -0700 (PDT)
Message-ID: <00a89131-9cb6-4022-b7fd-7531c980ec32@redhat.com>
Date: Fri, 29 Apr 2022 09:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 5/5] fbdev: Use pageref offset for deferred-I/O
 writeback
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com
References: <20220426120359.17437-1-tzimmermann@suse.de>
 <20220426120359.17437-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220426120359.17437-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/22 14:03, Thomas Zimmermann wrote:
> Use pageref->offset instead of page->index for deferred-I/O writeback
> where appropriate. Distinguishes between file-mapping offset and video-
> memory offset. While at it, also remove unnecessary references to
> struct page.
> 
> Fbdev's deferred-I/O code uses the two related page->index and
> pageref->offset. The former is the page offset in the mapped file,
> the latter is the byte offset in the video memory (or fbdev screen
> buffer). It's the same value for fbdev drivers, but for DRM the values
> can be different. Because GEM buffer objects are mapped at an offset
> in the DRM device file, page->index has this offset added to it as well.
> We currently don't hit this case in DRM, because all affected mappings
> of GEM memory are performed with an internal, intermediate shadow buffer.
> 
> The value of page->index is required by page_mkclean(), which we
> call to reset the mappings during the writeback phase of the deferred
> I/O. The value of pageref->offset is for conveniently getting an offset
> into video memory in fb helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Thanks for including this patch.

[snip]

>  	list_for_each_entry(pageref, pagereflist, list) {
> -		struct page *page = pageref->page;
> -		start = page->index << PAGE_SHIFT;
> +		start = pageref->offset;

It also has the side effect that makes the code easier to read and as you
said in the change description, eliminates the references to struct page.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

