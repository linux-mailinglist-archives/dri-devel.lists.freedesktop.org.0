Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF1421B09D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83546EB9D;
	Fri, 10 Jul 2020 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528C46E09F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 03:12:31 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id h17so3682018oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 20:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DnmHgWcom46+tP3PEnGuwAzr3b6gjMlwO5pxp3gapqY=;
 b=jSuGNfD45Izh3sRrOP0RiWYQ8FBRprrDa+5SeAyoMFHrIih0JrEYrIao53SPdJr1PQ
 3GJa5ghDh4Un0ZKpxmYVcpXrUhCd5S5Y+LGbTNJctLtOSD2HltDVx6fPF7AS987Gd6RQ
 7cVeLIO+rsqy7eipSmU+dT03/wVdJMCOuXgJl/4nwwnp17bNmM/XbtwipbD6iUPfvdY+
 g6muq6gAcDM4YTEJ22dAqJu4yWccecvcxZ2zk3DWjsq0aJ2RrkrePo1/ZozS9IviBZ2j
 /94+3ONa1eYD16bqCz5+ASzu/pzGSuq3Z6nii/bXBO1t97JjlMztquEzxvM+q3ONhlmG
 eqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DnmHgWcom46+tP3PEnGuwAzr3b6gjMlwO5pxp3gapqY=;
 b=dcd6tlj2VwTGqeYriW0GTDC1ZVnStgV4vzAwELCdknoSoyKaqqLpwdi7otNCfpRRKr
 7GZPpoPQ31VyA7YNV64o1vZs04y/GAtygPdpx48/3/rFfQ0UmE9XX2CGO0HpLX7oq1Of
 8H7RK85zxf9bjdV6CiOctyEL6pkcRWvml480leLjsrOemxydDas3BAV7F3wUHd1P+Tmv
 9RYjwY2mA3D8waK/7sxWRMGAF18/txXSZRh0DtXOT0fPxLDn5PO3blKOiluvyXrrTkfs
 N+E1CsHdSj616og9wpwlS6m0uFUxdjREbzIQ4hcjWhWFPU1JiAWI5rwwKyBm4W4mtt3P
 eeTg==
X-Gm-Message-State: AOAM532jEHIp09lFbQWMIIrJTIuuOux4HWqNjQvWY18BC+5fGt3zYISR
 8Mzs3JGpbOZ9kDBlGUsSty9nwQ==
X-Google-Smtp-Source: ABdhPJx2h1UeNaDOf3+qpVJW4onLPxgHKnYXVtTrb928wLj3IWfsG8Vr0loQvc2MTwx+pNOmAX9GqA==
X-Received: by 2002:aca:57c5:: with SMTP id l188mr2721479oib.154.1594350751200; 
 Thu, 09 Jul 2020 20:12:31 -0700 (PDT)
Received: from [192.168.11.9] (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id s4sm946821oom.15.2020.07.09.20.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 20:12:30 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Doug Anderson <dianders@chromium.org>
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
Date: Thu, 9 Jul 2020 22:12:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/9/20 9:14 PM, Doug Anderson wrote:
> Hi,
>
> On Thu, Jul 9, 2020 at 6:38 PM Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Thu, Jul 9, 2020 at 6:19 PM Steev Klimaszewski <steev@gentoo.org> wrote:
>>> Hi Doug,
>>>
>>> I've been testing 5.8 and linux-next on the Lenovo Yoga C630, and with this patch applied, there is really bad banding on the display.
>>>
>>> I'm really bad at explaining it, but you can see the differences in the following:
>>>
>>> 24bit (pre-5.8) - https://dev.gentoo.org/~steev/files/image0.jpg
>>>
>>> 18bit (5.8/linux-next) - https://dev.gentoo.org/~steev/files/image1.jpg
>> Presumably this means that your panel is defined improperly?  If the
>> panel reports that it's a 6 bits per pixel panel but it's actually an
>> 8 bits per pixel panel then you'll run into this problem.
>>
>> I would have to assume you have a bunch of out of tree patches to
>> support your hardware since I don't see any device trees in linuxnext
>> (other than cheza) that use this bridge chip.  Otherwise I could try
>> to check and confirm that was the problem.
> Ah, interesting.  Maybe you have the panel:
>
> boe,nv133fhm-n61
>
> As far as I can tell from the datasheet (I have the similar
> boe,nv133fhm-n62) this is a 6bpp panel.  ...but if you feed it 8bpp
> the banding goes away!  Maybe the panel itself knows how to dither???
> ...or maybe the datasheet / edid are wrong and this is actually an
> 8bpp panel.  Seems unlikely...
>
> In any case, one fix is to pick
> <https://lore.kernel.org/dri-devel/1593087419-903-1-git-send-email-kalyan_t@codeaurora.org/>,
> though right now that patch is only enabled for sc7180.  Maybe you
> could figure out how to apply it to your hardware?
>
> ...another fix would be to pretend that your panel is 8bpp even though
> it's actually 6bpp.  Ironically if anyone ever tried to configure BPP
> from the EDID they'd go back to 6bpp.  You can read the EDID of your
> panel with this:
>
> bus=$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
> i2cdump ${bus} 0x50 i
>
> When I do that and then decode it on the "boe,nv133fhm-n62" panel, I find:
>
> 6 bits per primary color channel
>
> -Doug


Hi Doug,

Decoding it does show be to boe,nv133fhm-n61 - and yeah it does say it's 
6-bit according to panelook's specs for it.


I'll take a look at the patch and see what I can come up with... at the 
moment, I'm forcing it to be 8bit and that does "work fine" but I'd like 
it to be fixed properly instead of my hack.

Thanks for your time and work!

-- Steev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
