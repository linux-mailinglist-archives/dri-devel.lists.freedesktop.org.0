Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3004BA7E8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD71710E276;
	Thu, 17 Feb 2022 18:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA63F10E276
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645121710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lw65IT6woOOnKwvpLZONIHgkA9Rr/Weslhh0Lx0llw=;
 b=C1PnykD6V87Q0Z/IKH2lrM3E2LRDiTVxxtsG6E6roYGCVEGDPrwTudg3vZdpaipaC2tPC2
 WpXbT4a2uj7kUhgOPRH2ralOOSUwiliOp31odqPBrwzS5G+i9Anki/jyneDLEfOeEcANAl
 tIVZTh/ep6dqTecahoUzJznj0QXfjuQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-OQ5qlLD7MvOq66KPcyv5Aw-1; Thu, 17 Feb 2022 13:15:07 -0500
X-MC-Unique: OQ5qlLD7MvOq66KPcyv5Aw-1
Received: by mail-qk1-f197.google.com with SMTP id
 i26-20020a05620a075a00b0047ec29823c0so4937184qki.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=9lw65IT6woOOnKwvpLZONIHgkA9Rr/Weslhh0Lx0llw=;
 b=VOk+0/okcSUD3FJozWYghYCXMJgdpEHKSgMcXGHBQJzXHU4NVsdZk3NbeXqNGV0GVj
 H8ib2fwJW+9z66/9orWPp+KOi5BiEpAktS2AD4NsqlDFbKvQT7qv15oQExe3x9aPf0w+
 l1jmhmaW67pZoouXsA1PTPZ6TNeJvb5nwRFURInhwXg248HQAg172zsgC8JDAxTedJwZ
 w+eG9pSdafHyJ3fb2K5mzA5vzZep2+U6br2/SSm20klKbPmqh0gE9CP2s3Dq/WMMfqzF
 Fw5MVVZudkMXOirG42d0Wy3aWxfk+60MHMQpf3bbr8poXljug48eYHjS61WnE8CpEtr9
 AHUQ==
X-Gm-Message-State: AOAM532LW3JnDATsvja+TjNjIR0OEozXmT6ONGkcjYMxg1cJzjsKTDkw
 6ZPEtxNxBBZD9JVp5E8g/0Dt9uwBBPYZZdSMeMxEkNIRE1SASTykq20ESabCGXqPml0G1/ACAUy
 0xPWzCRiiYM/FALzoS9jUI2xaLfXI
X-Received: by 2002:ae9:f702:0:b0:47e:caa8:a12 with SMTP id
 s2-20020ae9f702000000b0047ecaa80a12mr2465587qkg.198.1645121707188; 
 Thu, 17 Feb 2022 10:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrjtIaXRXa+eQCD7hNHEGZYJjnN8CZOFf4IYAAhUOeUnDD9HAGqP8PTMsMwgCPGC63Q5bL8g==
X-Received: by 2002:ae9:f702:0:b0:47e:caa8:a12 with SMTP id
 s2-20020ae9f702000000b0047ecaa80a12mr2465580qkg.198.1645121706980; 
 Thu, 17 Feb 2022 10:15:06 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id j15sm19409552qkp.88.2022.02.17.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 10:15:06 -0800 (PST)
Message-ID: <302fe05b0ef4739a131fd6cc7d33272014d4b6bd.camel@redhat.com>
Subject: Re: [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr
 0x4b0 for 1 bytes NAKed
From: Lyude Paul <lyude@redhat.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, Jocelyn
 Falempe <jfalempe@redhat.com>
Date: Thu, 17 Feb 2022 13:15:05 -0500
In-Reply-To: <4c5c5325-3e6d-d1a7-bc4d-c38ad769701a@mailbox.org>
References: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
 <4c5c5325-3e6d-d1a7-bc4d-c38ad769701a@mailbox.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Richard Hughes <rhughes@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! Sorry for the late reply, I had to take some time off work unexpectedly.
This is normal (although not great TBH, I'm not sure we should be printing an
error message for that), it's the result of fwupd trying to probe the MST hub
to see if it's a specific Dell dock that can receive updates over DP aux, but
it's not smart enough to know it doesn't need to poke the DP aux ranges of
downstream branches or non-MST ports in general.

Would definitely accept patches to make this a non-error, or at least make
this a non-error when the read/writes come from userspace

On Thu, 2022-02-17 at 16:54 +0100, Michel Dänzer wrote:
> On 2022-02-16 15:39, Jocelyn Falempe wrote:
> > Hi,
> > 
> > When using a Lenovo dock, I often get this error message on dmesg:
> > 
> > [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr 0x4b0 for 1
> > bytes NAKed
> > 
> > It's caused by fwupd which tries to read from /dev/drm_dp_aux4
> > 
> > I opened an issue on fwupd:
> > https://github.com/fwupd/fwupd/issues/4284
> > 
> > But it turns out, it's probably an issue in the drm mst code instead.
> > 
> > When I connect my Dock (Lenovo Thinkpad Thunderbold 3 Gen 2), I get 3
> > drm_dp_aux[] created:
> > 
> > /dev/drm_dp_aux[456]
> > 
> > Reading from this devices at any address will always get the NAKed error
> > above, unless there is an actual DP monitor connected (HDMI monitor or
> > nothing connected gives a NAK)
> > 
> > Each time I connect or disconnect a monitor on the dock, this 3
> > /dev/drm_dp_aux[] are destroyed and recreated.
> > 
> > So I think the device /dev/drm_dp_aux[] should be created only if there is
> > an actual monitor connected that can reply to it.
> > What's the purpose of providing userspace a device which can't be read or
> > written ? (or maybe just fail the open() call, like Mario suggested on the
> > fwupd issue, so the devices are still there with the same numbering)
> > 
> > On the other hand, we can also consider that it's expected to get NAck in
> > drm_dp_send_dpcd_read() and replace drm_err() with drm_dbg()
> > 
> > what do you think ?
> > 
> 
> Adding Lyude, AFAIK she's looked into this before.
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

