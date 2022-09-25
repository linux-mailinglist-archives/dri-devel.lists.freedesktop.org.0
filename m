Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA005E942D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5C410E2AD;
	Sun, 25 Sep 2022 16:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71810E150
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 13:30:54 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so10087225pjq.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=OXxSODFo5RK1OPiZcfwmMGXOMnQSVIgwzDG1rWTmuVw=;
 b=C9bQCUb+Y41Skk2wQZQ1Xed0T91ahIyTlOmiDqwrtxQyInznN/QNI9VGaJCWgeerIQ
 zdjXSFs26RRdYQS7d2UmUBIA7JeoLdMqKyIa7zkFlgutlPL6RIR5fkDya8manVG5f7hd
 czjgnnKI8TFLNnhIwYtZhPr3U08JIcQZK3rqafMojUHFhAmZYMo0H/uooORKeyMjyWPD
 xGPt2itEmWZkhfN0U+z278z1ppxdHQMXK/MyY/Iu0/1mhGRkpzBiktLYZNFgc23I7YC6
 9346WoALD4FhHWHWEyEKUVvGIeMpfZfmPzF6UewfRu2lRx+sL6FsU0wlGJbSN8wtgGtQ
 mErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=OXxSODFo5RK1OPiZcfwmMGXOMnQSVIgwzDG1rWTmuVw=;
 b=0OmNNrRRl2BZmf1sHHzIMII+ImYvNt/B0ZmRYeBPkL3PEx31ZuyZh+p4JcTPLa5LTQ
 rDD1XHtd9pD0MKAFW07u0t7R8BothqY1mrK6gfsPfVTTD8YGdk8AigEAmTYWr+r1jKSs
 qvhTeMDNmwESo8UUuW+c/kG+8FZTaP1nx9fxUdjAFQ1eAUlWy+0Yuq4pgkMrlX4UoLVn
 z718AxoOkoua/eiYxV8KbJAs1HAKRknSFpcqtMCx7R40uRpNdR8+/0reHD1tZTyt7d0+
 uodwXgcH2c8NuFSvhwEspBCysGejw0xalcnJuKLmj23ABbpN5OQMVmo3H6zG9i7LD+tp
 ztGw==
X-Gm-Message-State: ACrzQf0wO/ETz6VoZccP6S/O2thOgjpNXIuKKaD3bnzLyjhJ/OGSlyVa
 FFJimeafJJ2LadF8VVO3Q5g=
X-Google-Smtp-Source: AMsMyM7oesfI6+F4qbnHvAbqem7Bln+U6g36IhQpAQbnJfCp61ufSpIr7/ydcq0VdtR7DY7H8uQpBg==
X-Received: by 2002:a17:90b:380e:b0:202:d747:a044 with SMTP id
 mq14-20020a17090b380e00b00202d747a044mr20134917pjb.170.1664112654027; 
 Sun, 25 Sep 2022 06:30:54 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 p9-20020a654909000000b0043bf861008fsm3161855pgs.90.2022.09.25.06.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:30:53 -0700 (PDT)
Date: Sun, 25 Sep 2022 06:30:49 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Message-ID: <20220925133049.GA383810@ubuntu>
References: <20220925123253.GA381917@ubuntu>
 <3eedfafb-f0ea-2d94-ae6e-fcf827e17378@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eedfafb-f0ea-2d94-ae6e-fcf827e17378@gmx.de>
X-Mailman-Approved-At: Sun, 25 Sep 2022 16:02:49 +0000
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
 dri-devel@lists.freedesktop.org, imv4bel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 25, 2022 at 03:09:47PM +0200, Helge Deller wrote:
> it seems user and console don't need to be protected by the lock.
> Does it make sense to move them out of the lock?

you're right. Since both variables are not related to a race condition, 
it is better to get them out of the lock.

I will submit a v3 patch.


Best Regards,
Hyunwoo Kim.
