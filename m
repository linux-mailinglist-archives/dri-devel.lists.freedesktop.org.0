Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54D1BA7A7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 17:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBBE6E30F;
	Mon, 27 Apr 2020 15:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2F96E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588000536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSpYzJ8vruskzw1ixWuPTFKODIOCb1DdC0Y5Ypx1fB0=;
 b=Ixjl1U9ZxAd7CT3hUfVBj4OC3cNpxodUZOfnDT/R+PiEaqt/AILrKzUj5Eo/rzHioy9Oln
 cvJLzIAKJ6wHxC5CCF4L4yKtPq/EaBFl8TJ9vWTotACZe3HuIK/3lALMrWYOMCjppl2WFY
 7T3/PCaVB0U3AZ/R1FovAdsEF10h418=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-EyiQJoq8Md-Jue4dQW31Hw-1; Mon, 27 Apr 2020 11:15:34 -0400
X-MC-Unique: EyiQJoq8Md-Jue4dQW31Hw-1
Received: by mail-wm1-f70.google.com with SMTP id f128so10984wmf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSpYzJ8vruskzw1ixWuPTFKODIOCb1DdC0Y5Ypx1fB0=;
 b=RiR0lRLvy45cJ/73NXKxlIxuicSfeERk+5YRSKjybzZV4QJCoK+SpFO/vRMrt9olMB
 NOwqmhSRgGOo2o71F0fAIy4kBBraV3qm3hPtYAvduUYnM5cNM6xvaZPUOp2kenyh00Bt
 8RSeaJG4RiKgubfKAmeP6/55jvZOeGacBWqXcM9OZBwSCSdVq3YN7qvvM3jQnqJW/AwS
 VoGMsVUSNCdrSnzJbc1DjOPvaoMjhrXN3SLbg224ybiI1gwguIid4srCvHY2eK3jLz8P
 x0Ods9wwbQ4mCjP2MtzIbLB+qsYiTNGkMtuAA5UZc2oL3lt8pu2xihGOHScZ0LmZA9EK
 ZAog==
X-Gm-Message-State: AGi0PuYlPZo3uZw9gsx3JmcJlniTXJ5vNgURloCFAhILxl551YGficC8
 cjtb7r9SvXbfwGJ7sXRaLUs2PXR524o3pgr1Ip4jSyX88X5h0uB7eraN4LzZt9PQXa1+lMjdZG8
 6tpc28g5R4AqfZH7x192Ip6fAH4lk
X-Received: by 2002:a5d:670d:: with SMTP id o13mr29924472wru.29.1588000533360; 
 Mon, 27 Apr 2020 08:15:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+T+6Aj+dLlxq4HhKDwXzdqmOqUdriVVov3jgAPiPujwYcHZ4fNtTJwlwzd9NWqPh44afp5Q==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr29924444wru.29.1588000533150; 
 Mon, 27 Apr 2020 08:15:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac19:d1fb:3f5f:d54f?
 ([2001:b07:6468:f312:ac19:d1fb:3f5f:d54f])
 by smtp.gmail.com with ESMTPSA id n6sm23226378wrs.81.2020.04.27.08.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 08:15:32 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] debugfs: switch to simplefs inode creation API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-fsdevel@vger.kernel.org
References: <20200421135119.30007-1-eesposit@redhat.com>
 <20200421135741.30657-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <167ebece-2e50-5186-3a42-2fa491fcb8a5@redhat.com>
Date: Mon, 27 Apr 2020 17:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200421135741.30657-4-eesposit@redhat.com>
Content-Language: en-US
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/20 15:57, Emanuele Giuseppe Esposito wrote:
> -	inode = debugfs_get_inode(dentry->d_sb);

You're not removing debugfs_get_inode so I think you're going to get a
warning (same in tracefs)?

You can wait a few more days for reviews and/or Acked-bys (especially
for patches 6 and 7) and then post v3.

Since the touch-everything patch (#2) has already been reviewed, and
it's mechanical and not introducing any semantic change, you can
probably reduce the To/Cc list to filesystem, debugfs and tracefs
maintainers.

Thanks,

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
