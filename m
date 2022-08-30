Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFB5A5CF3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10810E7BB;
	Tue, 30 Aug 2022 07:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2676210E7BB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661844722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOVt4IExjzgPDgf7VEi0MGTcB1ysxhPeqK70kuHJ9WU=;
 b=PgbZ21vyZAoNTKi8Sm/aK8OuoLL375xcukdxwB1q/CiSfBeNVCqARyni+ZMyhfcZ1tZU7Q
 CSu/SQgw0+T61cLCJpmiCDIN5mLNUEog7BbvZYiAE1A+1FyhlVxyGc2LoXavi5dEFTC+ec
 vbpkyFx4kdkzllo1JCNPQEOPB1HLE/k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-k1E9FBg1MoqyHbg5fkWXow-1; Tue, 30 Aug 2022 03:31:57 -0400
X-MC-Unique: k1E9FBg1MoqyHbg5fkWXow-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb14-20020a1709076d8e00b0073d48a10e10so3475086ejc.16
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 00:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=OOVt4IExjzgPDgf7VEi0MGTcB1ysxhPeqK70kuHJ9WU=;
 b=1Qx3VuWQSAvwgNrPlxdRTmQigWbwK5lQFn0P7HUQTeeAlrWWxqDhDwouHmMaJlf+RP
 Rv2PzJi69WIwpyD1inO5pubbeH7ax/QGKKq65EsqVTOJmwp5V9b+KBV//9/8uFgvsLtf
 Ajhi6GEAMG/w6tkTbQiT7ElptMGxUqyeYfgWkTNJZypq6LGrQCbE11MW1CrUSJoPR92k
 XSOG6rv0kMwf4WOb9p6knocnLhDDTSOtWPDsENKwSXmmfjYojO7wcEDKXR2uRv//biRw
 wZwkHyxMGLiR77UeynIMS67lApjql3xZu3/6Osi9uySORpaZYSHW+nBTj/BTIkD9dTIY
 fYUA==
X-Gm-Message-State: ACgBeo22oOroZYGuaelQO6siPUzdLnJFqqWMYedliSdEW4Alilra8zsg
 bRFaRZzj/NJBE5ARZhGJhjXmDYYfbMWwU1tI51jg+Bh3yXZsvR/oy+hKyWXt6HPaNmv/2Q9Xx0p
 eHsfBLjxoRJpnOTHVLhoflKz4Sjgk
X-Received: by 2002:a05:6402:40c3:b0:442:d798:48ad with SMTP id
 z3-20020a05640240c300b00442d79848admr19117001edb.154.1661844716127; 
 Tue, 30 Aug 2022 00:31:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5geuesvzHhVoqBxInKeA8loMmBCSHKoxr3j6EnwNKzcho7wEaeR3bBW9svuet4LzxXa/fI2w==
X-Received: by 2002:a05:6402:40c3:b0:442:d798:48ad with SMTP id
 z3-20020a05640240c300b00442d79848admr19116988edb.154.1661844715957; 
 Tue, 30 Aug 2022 00:31:55 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709061ba100b00731745a7e62sm5367557ejg.28.2022.08.30.00.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 00:31:55 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v3 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to
 pci_ids.h
In-Reply-To: <20220829171508.GA8481@bhelgaas>
References: <20220829171508.GA8481@bhelgaas>
Date: Tue, 30 Aug 2022 09:31:54 +0200
Message-ID: <875yiauqz9.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bjorn Helgaas <helgaas@kernel.org> writes:

> On Sat, Aug 27, 2022 at 03:03:43PM +0200, Vitaly Kuznetsov wrote:
>> There are already three places in kernel which define PCI_VENDOR_ID_MICROSOFT
>> and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
>> from core Vmbus code. Move the defines where they belong.
>
> It's a minor annoyance that the above is 81 characters long when "git
> log" adds its 4-character indent, so it wraps in a default terminal.
>
> It'd be nice if we could settle on a conventional spelling of "Vmbus",
> too.  "Vmbus" looks to be in the minority:
>
>   $ git grep Vmbus | wc -l; git grep VMbus | wc -l; git grep VMBus | wc -l
>   4
>   82
>   62
>
> FWIW, one published microsoft.com doc uses "VMBus":
> https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-architecture

Makes sense,

Wei,

assuming there are no other concerns about these patches, would you be
able to tweak the commit message here when queueing or would you like me
to send v4 instead? 

Thanks!

-- 
Vitaly

