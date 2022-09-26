Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C55E9882
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 06:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B91C10E1F6;
	Mon, 26 Sep 2022 04:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8377910E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 04:50:39 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id y11so5163163pjv.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 21:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=8PxZH0BmsyJu9+ITF6qQvrU+JnlICuP2MjpJbjhQ5y0=;
 b=qbqNGQfPQ6R0PH/uT+gONTWuOvI2r6XIk+/azya6UxU0kaTqdj1TeHfauyc0VUxp38
 Nn4EjGYs4BSgxrnLzx3D6+mw2aMjfcJ6jERcsyKkRqcD+vqN9ykKfqLw3pi46HkRyWi7
 hla2nbx8EZEFsTHssLouke52bR7gmv170RxLy0axkORVAr5Gep3mnOA1/wpmfAwUEwRU
 X+HEDZ9boS8/I2Y1c5U1X85KNSMD+/u7EDOLMXN1SwH3y1iu5eXhyyjp6dqxlacQXMdw
 bBUA5719DnSlCldxvvn9eFVNVmHhoARFlnstKOUaEWZyGIXuioEnES4s4zoOiIqerkdb
 AcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=8PxZH0BmsyJu9+ITF6qQvrU+JnlICuP2MjpJbjhQ5y0=;
 b=Njj5OP7fSqbE8lnWKsHl32d02oyBZ0OPwi9/UPe9ZoYyGyuhWhg+1k0PxHm/vnEvsP
 H0I9JHiieMbrkSIZQKearC2FLgsx4UwYElRU8MhajnbPhd2L7fQXiwgjtbRDudniIO+C
 PPjIBJz64B8IhZ3aw7jUqLzGTVoMXtyhb284Zy1eGxMlkQVPzrBYEnpglrkt4j3eEMgs
 HbBWRr0yD2bvORhBY7gbz2Rif8qqE6MOXDmdA/33twzsTeUM5Wydyb6JncJYurIZwaDH
 q081O05PvIShqGjhZ+4/59/SefLaw3bPSU4AoTy6dOzl8j32tWdtrnxfghQt56bzeFJy
 tLYg==
X-Gm-Message-State: ACrzQf0xsE3k9kcl4+W9/lIlHdoHaRAdy/QSoeseRWsoiEccnOw36lhH
 Cicp7fJjo+ghP0RJ/c5fWhA=
X-Google-Smtp-Source: AMsMyM5jidO7BxUcy2yILHGXx/VYbFmwekvVE4ZTO0Z8QXVqKQ2/5c22vSg3uhBvBz+bHdfRG2HEGw==
X-Received: by 2002:a17:902:ea11:b0:176:b283:9596 with SMTP id
 s17-20020a170902ea1100b00176b2839596mr19752292plg.69.1664167839026; 
 Sun, 25 Sep 2022 21:50:39 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 e9-20020a17090a280900b00203059fc75bsm5493653pjd.5.2022.09.25.21.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 21:50:38 -0700 (PDT)
Date: Sun, 25 Sep 2022 21:50:34 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Message-ID: <20220926045034.GA389532@ubuntu>
References: <20220925133243.GA383897@ubuntu>
 <37915429-7b4d-6e64-8ef7-a28bf8015fd5@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37915429-7b4d-6e64-8ef7-a28bf8015fd5@gmx.de>
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
Cc: steve.glendinning@shawell.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for your review.


Best Regards,
Hyunwoo Kim.
