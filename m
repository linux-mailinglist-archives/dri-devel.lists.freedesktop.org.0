Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20B290D10
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 23:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4976EE95;
	Fri, 16 Oct 2020 21:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD2C6EE95
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602882113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AlYX5xPuDw6omzg+v7l+b09FvuVO2K9RV0esx9PcxE4=;
 b=OF5ul9//VtPFlYXKeDlo78aqM5oesRiSlvkGl9jVj4pPNxErmZHX0CWYtx83t68pYy06te
 ophvoYpEF0MxwbtLQd3I03c/Pp61BtH4DZOuPiwsdlHB5Pdn3Kzt17TeCdLzGzILVb/mF/
 y+SeL4lq5k7wmNHBQJxZYQ5DXnan6KQ=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-SFHWzOs-Nq-FL3K2yJsofg-1; Fri, 16 Oct 2020 17:01:50 -0400
X-MC-Unique: SFHWzOs-Nq-FL3K2yJsofg-1
Received: by mail-oo1-f69.google.com with SMTP id p42so1600376ooi.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 14:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AlYX5xPuDw6omzg+v7l+b09FvuVO2K9RV0esx9PcxE4=;
 b=CLKYP0A2amHVKaoNoXb1wNNYu7UdT5UTk2qYspTWp+lBUaQ9BItw9kW1WCiYrlLEOl
 YpMAKJVgmHNR1sWXsBTJYBfKIit85jhG/HxIUArt8DnHNkyja+Y9prOG7lpzJwwYFX6/
 AFcWuSQw/rhdzTD1ExScxlou5AzV6PBgsLxKuIlQJUMlw2lncZVW0Lj3uIQ75NoA+rHy
 QX7kHIPh9iOdokvdlMk9iO3pewKgi2bzdprZwxXX1EEAYBto5JqgPfeW1BHOQ4VBV0lw
 SkciY8yCwYqwCJIIgoTNUbCoMwavoI8l+Sf14wPVvc241MpSvLIWqO2d9zIkOAwfS2ZN
 kVoA==
X-Gm-Message-State: AOAM530n60VLN/xMttSrRKTaF9vgUd3x5ogd3YKNQ5MNqmtBSonVn4X8
 JZRtPoFmOu+bKB5oeb2eGQZ3QC4P52Q8XKKhd/VMlQ4qyKBbcszOtF3nZ/Fr6BLek4d+UaWgXo7
 JNroGHPzaEm+HuWb6p2EFqlqA43PmWvzqX89Ij0y7+vCB
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr4196220otp.232.1602882110026; 
 Fri, 16 Oct 2020 14:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTtX44Wbe1X9NlP8rqoiKthOe9dn0QEXn0w9wcgulPqgv6O3zptr2EP6jNNjiqIH9roJhLDvgpytfRGGeCSZ0=
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr4196208otp.232.1602882109817; 
 Fri, 16 Oct 2020 14:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
From: David Airlie <airlied@redhat.com>
Date: Sat, 17 Oct 2020 07:01:38 +1000
Message-ID: <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is
 disabled
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
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
Cc: jenmin_yuan@aspeedtech.com, eich@suse.com, arc_sung@aspeedtech.com,
 dri-devel <dri-devel@lists.freedesktop.org>, tommy_huang@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 6:03 PM KuoHsiang Chou
<kuohsiang_chou@aspeedtech.com> wrote:
>
> The patch is upstreamed
> 1. For RHEL7.x, because its native kernel is suggested to update
>    from 3.10 to 4.9 on 2 ODM's platform.
> 2. For AST2600.
> 3. For ASTDP.
> 4. v1.11

Hi,

I've cc'ed Thomas who is maintaining this upstream, but this patch in
it's current form isn't acceptable, Maybe Thomas can provide more
detailed info, but the basic rules are

One patch should do one thing.
Patches should be bisectable so any issues can be tracked down easier.
Fixes should be separated from new code.
New features and chip support should be separate.

https://www.kernel.org/doc/html/v5.9/process/submitting-patches.html

Please maybe work with Thomas on having a better upstream development
process for ast chipsets.

Thanks,
Dave.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
