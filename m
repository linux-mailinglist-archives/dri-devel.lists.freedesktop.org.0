Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C939B8F9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 14:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFCF6E3DF;
	Fri,  4 Jun 2021 12:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748D96E3DF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622809506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=T1WL3P0Jah1FRVj8EdxTUun4/hVMeybsNLS0++AfbT0=;
 b=VFdX7czRrNw/CMJOni6iqJ7eauGJRFM+p4UIVatuwyOUllo6p+RD6de27C0gQWDUqdI3Vi
 O7I6VcsrrBfA7Mlmb/9FFLZNhdPgp5O/5LxU9WfB8lD0G3ouvcCCQ/DduFn/7sDEkMVFhk
 yKvc7fQCPvdnKDKw2JXZ86LTSICec9Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-WgKXIK8ANWivPk6kZlQigw-1; Fri, 04 Jun 2021 08:25:04 -0400
X-MC-Unique: WgKXIK8ANWivPk6kZlQigw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v18-20020a0564023492b029038d5ad7c8a8so4911741edc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 05:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=T1WL3P0Jah1FRVj8EdxTUun4/hVMeybsNLS0++AfbT0=;
 b=KwJf0CUSWwAMwn/3pWYxbGTHBnjRO2meX/Qzmu2t/EwBM6hP4mkj09/RW6SNp6iCf2
 MZmbJfF54zsgmQSpCTSMFLd1S20ZVBFxPtXiIccO4h8EDIyCWrrNbFNWlYAK8ckB9RVD
 mlteynJWba7gqu13spBek+p5qxwlPXTSOaVKvIehMM1vhfrKu1llV4aTUOPfEtgUCDqX
 /xNUaHPHrSIOwIatf+mK4coGRIh8yHvaxlZ8uoCfSajJvHDTSsdZwXSdy6FAlo0UBtYC
 6lR32wDdVZOPC57VIpS1Maj53FqkixdAP2tMneQ94le2IFC034+LyoQ2ih9BkDGwpk/a
 UchQ==
X-Gm-Message-State: AOAM530EhS5JdWquryGL44yIxSmSMWv9TiL7qC5yDBLu7OWKZheLe6C6
 aqLk0HfBCtZs0JGUpjrfCnVxmDP8vqFJKX+B1Xw+mca+cpXdeG1NJjsNC1zi60iod6sjqvA+CmG
 0kN/SdwbF+LMh1lpplQVCKDqych2k
X-Received: by 2002:a17:906:a294:: with SMTP id
 i20mr3970590ejz.330.1622809503414; 
 Fri, 04 Jun 2021 05:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfBZrM0jIbqGlvYiCojcZlu9rkqXCZiG0w6fufb5vpo1LYyrvNtiveJmLUv90tBUtvyXi0ew==
X-Received: by 2002:a17:906:a294:: with SMTP id
 i20mr3970577ejz.330.1622809503266; 
 Fri, 04 Jun 2021 05:25:03 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id e22sm3207492edv.57.2021.06.04.05.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 05:25:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Matthew Wilcox (Oracle) <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Date: Fri, 04 Jun 2021 14:25:01 +0200
Message-ID: <87v96tzujm.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
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
Cc: wei.liu@kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Commit ccf953d8f3d6 ("fb_defio: Remove custom address_space_operations")
seems to be breaking Hyper-V framebuffer
(drivers/video/fbdev/hyperv_fb.c) driver for me: Hyper-V guest boots
well and plymouth even works but when I try starting Gnome, virtual
screen just goes black. Reverting the above mentioned commit on top of
5.13-rc4 saves the day. The behavior is 100% reproducible. I'm using
Gen2 guest runing on Hyper-V 2019. It was also reported that Gen1 guests
are equally broken.

Is this something known?

-- 
Vitaly

