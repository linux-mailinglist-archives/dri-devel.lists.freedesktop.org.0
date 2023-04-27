Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0906F00E7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 08:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72D10EAB1;
	Thu, 27 Apr 2023 06:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66F310EAB1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682577574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rV68s8Ghk0ipKJv1Rz35anMpfLxEl8Ezggs9Z0zp/4=;
 b=bdEhXK0sPUM29Vr8CBmCDPPW7oOn2tp80DYUm7Ckib+RBnxutmaLXD92M5aSI/FwUanve+
 YBVlaNf8CrD5q0FtkcAV3bfvZAlqYIY/jn+4UrKPBa+Gnmxtxip1GyluWDnicnnIaqrh0j
 VJ/suSxg2meOje8g/lg/yyAF5uUY5mk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-tF_nHsOSOSmM6dJ7_REJ5A-1; Thu, 27 Apr 2023 02:39:33 -0400
X-MC-Unique: tF_nHsOSOSmM6dJ7_REJ5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f175ad3429so13608165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 23:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682577571; x=1685169571;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPgT1XWD9d2y5CAUKsljbODvEs9Jrlwdja8eU+CRgw4=;
 b=h0okUOsz1OxkUP2nWo0LfBNSzuYXfwOA53FYvqN+uQS5R7MmrJqdM28qizEb1ZBQhO
 DspHfFz2DNkaUDxyzgWcEDS0OHGG6h7DTnYX8uLSoET+u4eo6s+ogM8C28q5lxiGpEIm
 rqkPIUkt2kxWJYW3yk/XDUhAywf5leaq26CaHlqitaNJibIFccOtNU4DG8lGoFog15t7
 d0P0FgsqryYhcrZd/YbpKY4nyMtOMOGpogWbKZ3h1Kwh1czcELmO0WDGivCNuEygqGjG
 Cp34S4JrwxDHY49hYFSZQ9a8QbVN8ixagedOXTnMW9LfraLdLlhlWpHzDJtqm7OsTMAj
 jtTw==
X-Gm-Message-State: AC+VfDzyyV7la1M8ayEATkibqHJsYkwRfVW3nFUaSfv/6ao9V6eXiqpM
 6qHTViuFud82IxQfJOt/3ueRxPtjSl07hxFpqZzD7kpJqO7ZD5VDC0W+VrAXqaFFdkzfvyLxzep
 9v8LD7YnPKMsmf47sPpx5yQ5M+a1ca32t9Ud1
X-Received: by 2002:a05:600c:3542:b0:3f1:727f:1967 with SMTP id
 i2-20020a05600c354200b003f1727f1967mr562860wmq.4.1682577571772; 
 Wed, 26 Apr 2023 23:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5nfw/gigju/G5+W4XvHrkkofOyr4OClCYOMyOx1Xwo8l5UX2w+C9oIum9isKIt2hEzyr23Ug==
X-Received: by 2002:a05:600c:3542:b0:3f1:727f:1967 with SMTP id
 i2-20020a05600c354200b003f1727f1967mr562846wmq.4.1682577571460; 
 Wed, 26 Apr 2023 23:39:31 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-243-21.dyn.eolo.it.
 [146.241.243.21]) by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b003eddc6aa5fasm19760644wmb.39.2023.04.26.23.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 23:39:30 -0700 (PDT)
Message-ID: <9f678eac46332679ea3457ba71e82cf6e96b991d.camel@redhat.com>
Subject: Re: [PATCH v2 net-next 0/6] Brcm ASP 2.0 Ethernet controller
From: Paolo Abeni <pabeni@redhat.com>
To: Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com
Date: Thu, 27 Apr 2023 08:39:23 +0200
In-Reply-To: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-04-26 at 11:54 -0700, Justin Chen wrote:
> v2
> =09- Updates to yaml dt documentation
> =09- Replace a couple functions with helper functions
> =09- Minor formatting fixes
> =09- Fix a few WoL issues
>=20
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165.
>=20
> Add support for 74165 10/100 integrated Ethernet PHY which also uses
> the ASP 2.0 Ethernet controller.

Note that the changelog should be located after the cover letter
itself. Changelog in the individual patches should be more helpful,
too. In that case, it should be located after the tags and a '---'
separator.

## Form letter - net-next-closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after May 8th.

RFC patches sent for review only are obviously welcome at any time.
--=20
pw-bot: defer


