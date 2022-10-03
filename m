Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3F5F2803
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 06:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028F810E0AA;
	Mon,  3 Oct 2022 04:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FA310E0AA;
 Mon,  3 Oct 2022 04:37:09 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id b23so5768963qtr.13;
 Sun, 02 Oct 2022 21:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BvAlvanR3o7fXwx9KEh86a8oE8coV41tHMYXTm6mxvI=;
 b=nsLU8NdaXsSd/W61Jc2+eOY0OKIQkyGMKj5oGWlPAndHS2M+HF6uBSe+oPNyQAjvk9
 v2rq7d39Q6KucH1zaGV+ejvoiyvCOTleSkmyMGoWyBjf3wRAnud/vntV05OErzo+Aw34
 1fsfaIiY+LLEBxMvl1+MlIVloqgjN6dgfXXl6koB1gOFzDOfWHgjlTSC5pND/POUOnUv
 K9YpuSBUZww4m3pIv+9oXOUQIVkzdHjsK6OpDNSacCmCHirrQKFWjIDudyLWEdunpaut
 g82Np1YobhWhU4nucWrwTSOfji/dHvZ9mzb4iLSUaASXhv+HsVytsg4CvLdWRDRCCrws
 vWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BvAlvanR3o7fXwx9KEh86a8oE8coV41tHMYXTm6mxvI=;
 b=xFAkJ/YXOTabnOIKwJvUcOatTjSpqbnxCWXIgVC3SpbUX5PqM/MGySVMEYfEjjmCF3
 2reqT70TdzhauKIq2IkLzNWLpEayuhxZvTMrIrqlN5l/FqMkHJU9Y9D/VkPGtnqw0xlG
 /4YIHn88pI6lqX9F9TauxtfuKzdIl2Mqykk5MrIvvhpCLnSWb8VCi85kKnpN4SxS4v02
 j5XJjJBNLxEzJ1QdzDnvsR+nifQlVzBxF3BTWjGsmTpEctHqQZv34WDD9WpVi3GTT9cU
 WbQLU8GTfynu9lCBNToxYqTmojTHDd6OoRsNgy2T/N9bDm7GWFwuNsFXYOnX2mix+6cT
 v3UQ==
X-Gm-Message-State: ACrzQf2c+8a18kYJtDZO474k1z8OqfQAHGqgRn4lWkZ7C93DTNsnPhGX
 B0Mw7Rwk4Zz8p0Wy3r4Tlza92pc3wxMckGXRA1g=
X-Google-Smtp-Source: AMsMyM5Ztt/VxNlvaOYQvQLHOHvlYqVhf5VigvFxWXmC81iKMpkY36bXzW3+VfKnu23HeokGiLuY8vwWw6k+VZtsIvA=
X-Received: by 2002:ac8:7d14:0:b0:35c:bdbe:5b97 with SMTP id
 g20-20020ac87d14000000b0035cbdbe5b97mr15029892qtb.272.1664771828453; Sun, 02
 Oct 2022 21:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJedcCzjWw6v5Nt42jsCStdpwHuz13D+q-CD=6ycVWBczY+4mg@mail.gmail.com>
 <20220928033340.1063949-1-zyytlz.wz@163.com> <Yzmds3DXu32EeSO5@kroah.com>
In-Reply-To: <Yzmds3DXu32EeSO5@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 3 Oct 2022 12:36:56 +0800
Message-ID: <CAJedcCy5TbdskDVK5Z2-Bm9gTG+sbo1KkFn3_2n65Sno7xG+ag@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: alex000young@gmail.com, security@kernel.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> That is a horrible way to make an api (and it should be a bool too.)
> Now every time you see this call in the code, you have to go look up
> what the last parameter means.  Just make 2 functions, one that does the
> "is error" thing, and one that does not, and that will be much easier to
> maintain and understand for the next 10+ years.

Got it. I'll figure out anothr way. :)

Thanks,
Zheng Wang
