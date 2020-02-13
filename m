Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC615CD69
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BAE6F883;
	Thu, 13 Feb 2020 21:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A946F883
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581630093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozCvUDTVPNZ7QDljyHE6xSIMNJnN5yu3Ah+4BAbtOio=;
 b=ghCAiveQgjlKZF1ou2VzV0Ruo+ZGnfeCY6hT6z+cOI6BwB1yjfqIaM8qW6DAk4HCjeSerw
 t4RzuXDQqt7wWY0pbwg3a60txA3/PD9fDoT+0HXOznDvcDEYARRmA5vOS9VlAyxpuDS7F3
 31heCWtsEPBN4gTUZBgeuS97Dhzoopc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-W_wvhzGLOUKHo_QnT8pKuA-1; Thu, 13 Feb 2020 16:41:31 -0500
Received: by mail-wm1-f72.google.com with SMTP id u11so2529221wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozCvUDTVPNZ7QDljyHE6xSIMNJnN5yu3Ah+4BAbtOio=;
 b=GADWvs9YO2JvlOl+UtHh4VwTxcjUvPEdwjxbI/V5Kt2WbgY5utBQ60h99gS1P+51NG
 ArlzqJVjWObnVTkghJGhJoV64EyEUh59+BxJPFVOgXTrehY+IQUxrKAbiDFOtoG3zjvU
 tpIJmMZZbJcKC9u/NmQFYV1eHYgUiOKunHUl1GaftLmFYxasdAUJ+Q0itMpwFXX9g0tS
 NtJuG+mr0sCrKvIus+0cpdvwOFryNqKfkRN54YkQoWSNDwSTtXC1Hla9xPvymX1M1/7W
 /4xj3haiBAUJkYXcWMLT0u+ahvjEjz2Gfkm4TnK5hoFME+NzwnrDBMIoZib8q5PIbntf
 5kPw==
X-Gm-Message-State: APjAAAXp4PU5hxBTPa+ZrXpMEzP607Y5epUn0VWwTBXg3k5AeUrwRsfE
 m+NYI9LrWZBRfEJOyZMi7NyVmuzKYQ8jkPqAL1L3lFYU2N8xbWgOE4tFZmzaHifWbS1HV3uuL8S
 xd1ez3JBTKbtFvgkZD0+pMNQO99gn
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr102309wme.82.1581630090229;
 Thu, 13 Feb 2020 13:41:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoGaODEDjTgNSrF2Dl5MKA+8k86WkBbel//MguKGv7NqlvB5CQXk+9Te0+p5k/nahHMsXr3Q==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr102293wme.82.1581630089993;
 Thu, 13 Feb 2020 13:41:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:8914:ecfc:1674:2d77?
 ([2001:b07:6468:f312:8914:ecfc:1674:2d77])
 by smtp.gmail.com with ESMTPSA id w7sm4211312wmi.9.2020.02.13.13.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 13:41:29 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Chia-I Wu <olvaffe@gmail.com>, kvm@vger.kernel.org
References: <20200213213036.207625-1-olvaffe@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
Date: Thu, 13 Feb 2020 22:41:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200213213036.207625-1-olvaffe@gmail.com>
Content-Language: en-US
X-MC-Unique: W_wvhzGLOUKHo_QnT8pKuA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: wanpengli@tencent.com, joro@8bytes.org, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com, vkuznets@redhat.com,
 jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/20 22:30, Chia-I Wu wrote:
> Hi,
> 
> Host GPU drivers like to give userspace WC mapping.  When the userspace makes
> the mapping available to a guest, it also tells the guest to create a WC
> mapping.  However, even when the guest kernel picks the correct memory type,
> it gets ignored because of VMX_EPT_IPAT_BIT on Intel.
> 
> This series adds a new flag to KVM_SET_USER_MEMORY_REGION, which tells the
> host kernel to honor the guest memory type for the memslot.  An alternative
> fix is for KVM to unconditionally honor the guest memory type (unless it is
> MMIO, to avoid MCEs on Intel).  I believe the alternative fix is how things
> are on ARM, and probably also how things are on AMD.
> 
> I am new to KVM and HW virtualization technologies.  This series is meant as
> an RFC.
> 

When we tried to do this in the past, we got machine checks everywhere
unfortunately due to the same address being mapped with different memory
types.  Unfortunately I cannot find the entry anymore in bugzilla, but
this was not fixed as far as I know.

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
