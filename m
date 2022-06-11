Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABC0547624
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A853810E90A;
	Sat, 11 Jun 2022 15:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321EB10E550
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654961694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wm9Fv9jtkblZY0ynNauc7tBPw2HroUUJfIN+zfKtoIA=;
 b=VnLuVPzlnuGjQjo1gK0a1Ixotot7bX7MQzqOP0UiJ5hNmgvaJ5LSvP1VmBtAc073AYMBAm
 Hj4Om7oclZfI4Sc9s9k21HhndVjIc2YgCA/60Xop6wKPIGTeS19Vfl9/SKivJE8XJ6QCmq
 rwDn8+t0wOcHzyIq8admf3B9fe3d7eI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-eXsBvKt_ML-OvJaZWXOmdA-1; Sat, 11 Jun 2022 11:34:53 -0400
X-MC-Unique: eXsBvKt_ML-OvJaZWXOmdA-1
Received: by mail-ed1-f69.google.com with SMTP id
 g7-20020a056402424700b0042dee9d11d0so1462649edb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wm9Fv9jtkblZY0ynNauc7tBPw2HroUUJfIN+zfKtoIA=;
 b=vzwJladB84l+hUyz9CJrZZe5B9WQgJMybPxQkK7lBZYjglTl2n+jYPzSjchbYQoi7h
 Pb1t/UNJ2Hkc2J7hN0IPQnpaWchf5F2Kigte4fCr0liP2CTCUX/tB4weV9p8N9OohYrw
 xXxofVe2ybmE23rKyzfsG3ABiGsAZWN4L92L35CJOw/yQAPz65h7L3iX1hskDLkPw+AA
 w+jj/QtNn9Y/Rin3LLwsM5u/6PZQvqsDV+HItFG0STgkyoRkwDYOlonLpza41BIcJSKB
 nO4f0Yabtr5REBru/zKEyl+u0VHFieEl3UIQegLO0t1MZeGW1Wnm1p/x9yfvDregRNwa
 FxyA==
X-Gm-Message-State: AOAM5316354DeOIneaRISEKnjlSDvdoqwL/xhfQsRqE9z9P/2AxLXipP
 oGbjdr/G99U2dpI9XhO0JVCgxyVqGseT8mhMRSx8MaIGxDRTJe1p+sP/UX95yAhft86J0AqIeut
 guQJhOIayfJ6EitMy54dLUSKbvpIi
X-Received: by 2002:a05:6402:26ce:b0:431:52c9:5a9 with SMTP id
 x14-20020a05640226ce00b0043152c905a9mr37877938edd.61.1654961692498; 
 Sat, 11 Jun 2022 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAVX6GH7mYJGJyUFOXpMfqDlRSgpkOBdGEgA67cVoK+2X6toSG/icPyR27b1t2ZEOxYWcSTQ==
X-Received: by 2002:a05:6402:26ce:b0:431:52c9:5a9 with SMTP id
 x14-20020a05640226ce00b0043152c905a9mr37877910edd.61.1654961692230; 
 Sat, 11 Jun 2022 08:34:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a1709060f5000b00711d0b41bcfsm1202908ejj.0.2022.06.11.08.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 08:34:51 -0700 (PDT)
Message-ID: <efdc6bb7-d088-467d-b843-a6e579263c61@redhat.com>
Date: Sat, 11 Jun 2022 17:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
To: Simon Ser <contact@emersion.fr>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
 <YqMTk9C8/g1buL+8@phenom.ffwll.local>
 <20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org>
 <_D4uOTfLqaVCoV94kNfeXYvOph3EjOL80mbzeJNHm1EPqranCclhnAjS2dj40X32-wE8Nux_QM-m-LBXHSHLkXu0P5oypBYLLK3_MWK4STg=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <_D4uOTfLqaVCoV94kNfeXYvOph3EjOL80mbzeJNHm1EPqranCclhnAjS2dj40X32-wE8Nux_QM-m-LBXHSHLkXu0P5oypBYLLK3_MWK4STg=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 krastevm@vmware.com, Pekka Paalanen <ppaalanen@gmail.com>,
 mombasawalam@vmware.com, wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/10/22 14:53, Simon Ser wrote:
> On Friday, June 10th, 2022 at 14:36, Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>> Hi,
>>
>>>> As Pekka mentionned, I'd also like to have a conversation of how far we want to
>>>> push virtualized driver features. I think KMS support is a good feature to have
>>>> to spin up a VM and have all of the basics working. However I don't think it's
>>>> a good idea to try to plumb an ever-growing list of fancy features
>>>> (seamless integration of guest windows into the host, HiDPI, multi-monitor,
>>>> etc) into KMS. You'd just end up re-inventing Wayland or RDP on top of KMS.
>>>> Instead of re-inventing these, just use RDP or waypipe or X11 forwarding
>>>> directly.
>>
>>>> So I think we need to draw a line somewhere, and decide e.g. that virtualized
>>>> cursors are fine to add in KMS, but HiDPI is not.
>>
>>
>> What is the problem with HiDPI? qemu generates standard edid blobs,
>> there should be no need to special-case virtualized drivers in any way.
>>
>> What is the problem with multi-monitor? That isn't much different than
>> physical multi-monitor either.
>>
>> One little thing though: On physical hardware you just don't know which
>> monitor is left and which is right until the user tells you. In case of
>> a virtual multi-monitor setup we know how the two windows for the two
>> virtual monitors are arranged on the host and can pass that as hint to
>> the guest (not sure whenever that is the purpose of the
>> suggested_{x,y} properties).
> 
> The problem with suggested_x/y is described here:
> https://lore.kernel.org/dri-devel/20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org/T/#m119cfbbf736e43831c3105f0c91bd790da2d58fb
> 
> HiDPI would need a way to propagate the scale factor back-and-forth:
> the VM viewer needs to advertise the preferred scale to the guest
> compositor, and the guest compositor needs to indicate the scale it
> renders with to the VM viewer.
> 
> Sounds familiar? Yup, that's exactly the Wayland protocol. Do we really
> want to replicate the Wayland protocol in KMS? I'm not so sure.
> 
>>> It's getting a bit far off-topic, but google cros team has an out-of-tree
>>> (at least I think it's not merged yet) wayland-virtio driver for exactly
>>> this use-case. Trying to move towards something like that for fancy
>>> virtualized setups sounds like the better approach indeed, with kms just
>>> as the bare-bones fallback option.
>>
>> virtio-gpu got the ability to attach uuids to objects, to allow them
>> being identified on the host side. So it could be that wayland-virtio
>> still uses kms for framebuffers (disclaimer: don't know how
>> wayland-virtio works in detail). But, yes, all the scanout + cursor
>> handling would be out of the way, virtio-gpu would "only" handle fast
>> buffer sharing.
> 
> wayland-virtio is not used with KMS. wayland-virtio proxies the Wayland
> protocol between the host and the guest, so the guest doesn't use KMS
> in that case.

It would be more correct to say: wayland clients inside the guest
don't talk to a compositor inside the guest (but rather one
outside the guest) and thus also don't depend (indirectly) on\
having kms inside the guest.

But the guest likely still needs kms for e.g. the kernel console
to e.g. debug boot failures. Note this could be done over a serial
console too, so in some cases whatever "video-card" emulation
the guest has could theoretically go away. But it is also completely
possible for a guest to have both some emulated video-card which
offers a kms API to userspace as well as wayland-virtio.

Regards,

Hans

