Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A28160D09
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963A6E8AA;
	Mon, 17 Feb 2020 08:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C0D6E890
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 23:59:25 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z193so12450288iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 15:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1d6JlykbVicmjG0A2XUt4eGD3FJVfi/fh9TSeO7qCwM=;
 b=qoZ8bvp1ZKuu6goMKUjVMTPgR9GgeGjmljCOt3XjoV9fORvvcDsIAjo0g3xIbB5Ik7
 KdGkT5lt9iXWZ/z/MBilIsHWc1nzMp+g5gcU/hLP3vaaScigRfoYnnNQDPZ6vWCu/3rX
 3tNKdFZUQnZ2J6y90kTjadH6BTGSsLBoexQkRbptaj3XneVQq9+fqz0sEQZQtCyq4aPH
 EsqRQsZv57w2f+dNLbWlzBU4HQkLfnvHLaz+tjNhVSDD0ZhI0UAhcui0sTQ/IAblTagH
 68V0nNAsfXuA0agsT9wdDsreszDD+Ha/TE2LwH2nuoLj4yJ61g317518G0bMp5PPuA9w
 uoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1d6JlykbVicmjG0A2XUt4eGD3FJVfi/fh9TSeO7qCwM=;
 b=G01ZKj1WXU0ZkZiP1WtD/VbG53v1AFRBhDRqVDeQjh5oT4ld2USF+PyXQnWQggrpv+
 42vOZEZ7zmnLO0T/6A+Dp5aHwrrZjJp7BsbuBnUsyzKU9FjE1POxxhTV6p3OkuCvk1k5
 TnYddTu9VD6RScvskJ04blLvQ93/UZj3TV9xmvcMNsfGdWZg9h5PN7bNbKHzmJrGegZX
 5Zppqm+eIPhblWhDG0O/RvNecRyIaIhPvA/CfYDzD+tqTgNBoLp2eV+sWQzQbXl6tuNT
 ITvwX2DUn3DjLsqFZO4wSsucWkYW0bgahyc/NGh4fIhgFDGpzhFou2/xMSGRClkNxq0k
 Eqmw==
X-Gm-Message-State: APjAAAWO1OqAMnE5cHkTx4GZbDghzRHD/jogs71deTCbw/Zmt/sD7Vaf
 29yzxAiszaYOAGZqnohBhpAbLdLGkHbkpqb43eDD7w==
X-Google-Smtp-Source: APXvYqzCcV3CabKkAZK0b1p7Mn18+1jLNQikB9SRQht9Z9uo7mLVPhCQ74Zh2zqPN2EZXKwwi7uQIrNePZqAf4dxm7A=
X-Received: by 2002:a05:6638:538:: with SMTP id
 j24mr4421937jar.12.1581724764168; 
 Fri, 14 Feb 2020 15:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
 <1581669243.29925.13.camel@mtksdaap41>
In-Reply-To: <1581669243.29925.13.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 15 Feb 2020 07:59:13 +0800
Message-ID: <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Dylan Reid <dgreid@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 4:34 PM CK Hu <ck.hu@mediatek.com> wrote:
> It looks like that even though sound driver is removed, hdmi driver
> would still callback to sound core. This is so weird. After sound driver
> is removed, hdmi driver would callback with codec_dev which is invalid.
> I think this may cause some problem.

Will do some tests and get back to you.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
