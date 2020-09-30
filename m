Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F227E048
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 07:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A3B6E4D4;
	Wed, 30 Sep 2020 05:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982D46E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:26:55 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id nw23so950143ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 22:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Je2DNnA/FKfKTqizjipmzNv3owWScP9mvLVXfLsSsn0=;
 b=dUGvdKbShbQQCjbCdd8jfDO6XwUq4fxYOjado2aRQ4GpLAdco733si9lQCTLJ2p+cy
 LRhUXzDVReUOVIAfwXFSTGbsHasWmnBazhNu6c0xUfngvw6P81kPz7LMsUfe7SwamGhO
 lzdSMl5OV2xsNrR6hN8eOzTA0OgRmZzDlb3lbK2dggpd2Z6VfH00tTfnqb7bfci+uwtB
 0GtMs1Uo5NaFcv3eU0fZIEx9J9tvVWS2GUo91h4PNdQac7FtL5HD9DJ8ObwtxlYCdoZB
 2zN1eXbbvrurvSxJdbydLMifN2M/OkhpHdItA6nx5uX/+PmPO0gFLo/yD9BUUDea1flF
 Gx8Q==
X-Gm-Message-State: AOAM531ngL2GCTGEZy5o5jqjVmaSRqXMB10bCJQ1oC4nKhpZ1CS6f2o4
 W+1DkikskgzDfUFdfp65KRQ=
X-Google-Smtp-Source: ABdhPJxZWLUkyQs9Cnkhkk/mXboQK+ISYt9QsCL2oAivHTd7YbInKhTXYmmYx659HgrqEpkNaVZF/A==
X-Received: by 2002:a17:906:8559:: with SMTP id
 h25mr1076818ejy.536.1601443614199; 
 Tue, 29 Sep 2020 22:26:54 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id z16sm392636edr.56.2020.09.29.22.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 22:26:53 -0700 (PDT)
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
To: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN> <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
Date: Wed, 30 Sep 2020 07:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929123420.GA1143575@PWN>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29. 09. 20, 14:34, Peilin Ye wrote:
> the work in general? I couldn't think of how do we clean up subsystems
> one by one, while keeping a `console_font` in `struct vc_data`.

Hi,

feel free to change struct vc_data's content as you need, of course.
Only the UAPI _definitions_ have to be preserved (like struct console_font).

thanks,
-- 
js
suse labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
