Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1C802FC2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA3510E2E7;
	Mon,  4 Dec 2023 10:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B5110E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701684722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KcPJY3fk2Cqzhcd9iVt/Hyoas1zD8DeJDoHpF/hqkco=;
 b=QkcKVj1NsLW+KYWydqkdWRooj8yVRI3FdXshgKzXXU7aV1HXmDhJxI7dN1fY7AomsGdOaA
 bCyOduQL2COMmxI25Rsi5xhKN91WPz3A//AXpccFTLwjAgF7sos/6K8zC+dAZo/Qt0oh9v
 6oeOmJi/Cne1ChXyv7138X1GPuJgH6w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-ZCI1wlfkMtiCbn1jXcmGVw-1; Mon, 04 Dec 2023 05:12:01 -0500
X-MC-Unique: ZCI1wlfkMtiCbn1jXcmGVw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-333503fd5bdso282300f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 02:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701684720; x=1702289520;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KcPJY3fk2Cqzhcd9iVt/Hyoas1zD8DeJDoHpF/hqkco=;
 b=DsatFL+b79fLunz5JJmoMvu4IiQ0Aj5blBZmifOt98cNKd7rpsYg1pqNX+my3Vhac2
 SXSGL+COcSuieGrQ/wXdmkrOanUkGWO2xwfEekoSM72bO+X3KJ2l4MhNp4z24MFYPO7l
 X380p3md+UNhBnUiBrV1qFcytqwi0E+oX0sS79aJztIEceBV0Ne6fyOEmhr/RHfpDP2n
 qPHy5fMsiQ40LZsq+a1oRlIxc1XKB3txI9nuhItkEKjTWsMenv3v101AFQoDNhAhjIgG
 FbkLgdlu4FhvA8seyOiBX1dDpyLft8f+6pj5nnr+LNGQM6/4MXUNfNicB1rHlyqpf4jj
 6ayg==
X-Gm-Message-State: AOJu0YzmETQSo0BKmTDEZbNGVoKx3Sqxsq7SawiNuI2ecZeLg4gG0bVu
 ytHYIsRu9gs80WFoMDH5PNk+7wnHqj+MrWsNZcBnQr7WJBaSiWcjRAJtMA41B+iZsk6+lLbWubP
 Z8p4esoXhxO8knc9di85uMZBdJZV0GyDmBw0y
X-Received: by 2002:a05:600c:4fc6:b0:40b:369b:2c53 with SMTP id
 o6-20020a05600c4fc600b0040b369b2c53mr2365236wmq.22.1701684720074; 
 Mon, 04 Dec 2023 02:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9RK5e8sTiOKlt5ijBSpWrEVrpzDNtBEaBzoFv2sXInz/cmdroUZ9QK4cV2M8/tXiUfxKMMQ==
X-Received: by 2002:a05:600c:4fc6:b0:40b:369b:2c53 with SMTP id
 o6-20020a05600c4fc600b0040b369b2c53mr2365231wmq.22.1701684719725; 
 Mon, 04 Dec 2023 02:11:59 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b0040b347d90d0sm17904252wmq.12.2023.12.04.02.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 02:11:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Eric Nelson <eric@nelint.com>, dri-devel@lists.freedesktop.org
Subject: Re: fbcon on one of multiple displays
In-Reply-To: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
References: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
Date: Mon, 04 Dec 2023 11:11:58 +0100
Message-ID: <8734wixonl.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eric Nelson <eric@nelint.com> writes:

Hello Eric,

> Hi all,
>
> Is there a way to configure a framebuffer console on a specific display 
> on a machine with multiple displays?
>

Have you looked at https://www.kernel.org/doc/Documentation/fb/fbcon.txt ?

There is a sysfb interface to bind / unbind fbdev devices to fbcon's VT
(/sys/class/vtconsole/vtcon1/bind) and also kernel command line parameter
to choose which fbdev driver is mapped to which VT console (fbcon=map:n).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

