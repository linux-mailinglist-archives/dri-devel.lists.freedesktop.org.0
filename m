Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43024FB664
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 10:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153310EE73;
	Mon, 11 Apr 2022 08:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C91A10F2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649667168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3vF22tUUU5mQz2MMbsVAqGRpsABBDO2J9NhzUkzJrNw=;
 b=et7ZbtjZQjxgp9FVCHUPbhXQvJtNoC1PMLUOowtjAM8t2mGQFFX6WMwY2IXpx8KKn7ujkz
 lFAehmYF00kfHagBc8GvORlwfN3XKytn85lWMJOyw+OjcMo/+I7/p33CsW1o7QXQMEEScm
 +EQeNDHBOgxAC6cAjhG6m24Wz/oCSyk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-faPDYB43P7eVS7WFe-vdLA-1; Mon, 11 Apr 2022 04:52:44 -0400
X-MC-Unique: faPDYB43P7eVS7WFe-vdLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso8566096edt.20
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 01:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:from:subject:content-transfer-encoding;
 bh=3vF22tUUU5mQz2MMbsVAqGRpsABBDO2J9NhzUkzJrNw=;
 b=tCaWxe2cj5IxWp4eqCn0ymP0sehALSbYSYurdsujB1QbtJWy74kJpkaKndsTNCJ768
 VcPF5oYvZ/Xnv2+qDt7RPYeGllssGdPPAniIEpDD5jT95XJRawXfbveHTS9yEwjC9X4M
 /kdvd77xAJbU4mbptW6EsyFZsmE4k16wkTZgVBjawglpmqUlmwJA5mW5byTySfeUlRY7
 j9VpDba4J1UHkG9Rsn7BtnDItosfSOhPnxVzsGVWc0CKiN18EaNHg2rNMA2b6j5Lohae
 zphXSLsfx4mTHUG7FIFVBfoxR7kKBLDDXiGSN0Ja83+k0IxQhd9NEBtGxEhnz8G4PTNI
 kq2w==
X-Gm-Message-State: AOAM530k4ukx7fuA/HEYkNi+w/4VprIJdAdBQ1m3jU2hTbqwvuOJ2Za7
 B1MeLIox4fJekr8T2p8rLA/3YCTEZrvXMmEPK4sdj2c3b6g/S0p/OgwMPLD/kURrGc58CP9INTh
 mNexxWQI0axsR8odFK4xULXNCmcaC
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id
 u3-20020aa7d543000000b0041613eb6fecmr32613452edr.348.1649667163803; 
 Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk6gMCM8hNzyJd6iz1CEcJcPZ6bA4l4Q1eoDTZQZEir4whNxpF03iCABMMNp4xK8HhmQnN8w==
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id
 u3-20020aa7d543000000b0041613eb6fecmr32613436edr.348.1649667163483; 
 Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a05640240d500b0041d7f66a9cesm1055757edb.41.2022.04.11.01.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 01:52:43 -0700 (PDT)
Message-ID: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
Date: Mon, 11 Apr 2022 10:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: regressions@lists.linux.dev,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: 5.18 vmwgfx seems to break booting VirtualBox VMs
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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

Hi All,

Fedora has received a bug report here:

https://bugzilla.redhat.com/show_bug.cgi?id=2072556

That Fedora rawhide VMs no longer boot under the VirtualBox hypervisor
after the VM has been updated to a 5.18-rc# kernel.

Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA fixes
this, so this seems to be a vmwgfx driver regression.

Note I've not investigated/reproduced this myself due to -ENOTIME.

Regards,

Hans

