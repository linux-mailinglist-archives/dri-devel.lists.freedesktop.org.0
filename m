Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C946288FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E80610E2FB;
	Mon, 14 Nov 2022 19:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8618F10E2FB;
 Mon, 14 Nov 2022 19:15:52 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id b21so10941557plc.9;
 Mon, 14 Nov 2022 11:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=36v5gUBpLgcJSUQwqRiwLsp80Jc3uoS+E8w6Xxeu30A=;
 b=Lrq1SGsh/h58DcJ11Hw1HOf0hbKqOEcqq8+wNMBXe4s2lYB/Kg31XMTaPFCFKc5aQB
 mzKRTsTGzCUXsb3dGiFhjWLInKi8TjgiyQB1ejK5k+jWj7+Gb+4iqY4yvslZL6j5cA/5
 G3kUrThX86oevlypswDZ6GD7XNF+YPxPG7h6C1kf8td+DZlE7X+n+idVkexUksjD3MH+
 UV2CINhcjBNH1p7HkdUeXZEh9bgJajppw8x+VUngopg5zJxVaG3pZWlX5Psd+CzAsfMm
 CROhYczvRvN2FMe14wZaL7v7yx5MA6E2uGrcAZ1HlNAgiMPqVXNvOB067JdDfm4Ov1Aa
 +hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36v5gUBpLgcJSUQwqRiwLsp80Jc3uoS+E8w6Xxeu30A=;
 b=rhcZLTgFJ7sAy3VwkDeItnbmGTnOH5BbfvfJHfzbercUBf0TJfZsVPhiEXPxlI5TeE
 azexAIhsJ7k7BSIkxid743xe4VSanZm6scSl/k4HkPiYxcs0I3fY2D5Z0lx5KOFwgj4j
 jyP8U7XBXeZqvcI9v99ap+nEdr+spnIIBTGACH6t1rDnDFaRQLFeRB+/X/kAir1Q/vHj
 8r2bE8K1fwM2LyBlVOioZkAiVW7usaI/yn7/gfiDFW3ejzNkrDuHJtERk2WCKKy27Lvl
 GeZbWW1xWVUMrtOmhxefnGRkslvLgoKrZfwN3op6aom1iAchVZUFn8iZV8lO7uqNdypc
 xqkw==
X-Gm-Message-State: ANoB5plFNuHN+rttbF/qYpW0HU//bYIEamFEYqMrkAynNq1h7zUKvTFc
 nHb3aKCGEvI4yHlAE26tyxVxAVpffn6Jp4xo2k4=
X-Google-Smtp-Source: AA0mqf6HcqmbOriLzooDOJRI/wFT8MKO0/1BkR9i+ilXDZI1f8IfqeRx2lE5fCdClkvOV2A7x79j/kh6t+2r/nxz1kI=
X-Received: by 2002:a17:90a:8990:b0:212:dc2f:7ee7 with SMTP id
 v16-20020a17090a899000b00212dc2f7ee7mr14696996pjn.172.1668453352083; Mon, 14
 Nov 2022 11:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
 <20221114162207.62559-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221114162207.62559-2-andriy.shevchenko@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Nov 2022 16:15:35 -0300
Message-ID: <CAOMZO5CJvuMUNwPQ7GUQh0dinYSfQ5TTLMawUt7hMVKJD4S3GQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: gadget: hid: Convert to use list_count()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jakob Koschel <jakobkoschel@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 1:22 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The list API now provides the list_count() to help with counting
> existing nodes in the list. Uilise it.

s/Uilise/Utilise
