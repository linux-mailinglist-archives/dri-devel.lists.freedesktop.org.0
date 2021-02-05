Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB2310D2D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C176E088;
	Fri,  5 Feb 2021 15:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E176E088;
 Fri,  5 Feb 2021 15:32:01 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 19so7243891qkh.3;
 Fri, 05 Feb 2021 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fyZHi+qNcCJFhy3f12cLYE4u8DUIJvZ551G3y8KcPgQ=;
 b=oOcqz9sQcA4+vwEinnFCNUxLwxvmuqJZ3sHLgQdbD+TR9pIaAJUwFv21C5X0Ia9UW8
 zvkRXc6MmPy5rBPC2+afgNbSvfQTloAc2jr5muoRI8W1XoRnlB9So1j0zt6jn0Pn3Mhf
 ybioSruJQ+8ftb9fVvAoL/vi3KSLRTvpNUgf36UG7qlULBgyMNSg8KEMegLkMICCm8n7
 XSZW6DZ4MkWeT2Dfb8Xarkht2Bc6aM2ZjfdQAGRzsjvhqWmOmQz73EyBJiDwR0+y9lwu
 f1fIpGQ1PDqIl6VnaWRGNuv/OT1XPfR2TCqwRmH8Xg6HiwyyjTh8y6VO4bppBuXStePQ
 Feag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fyZHi+qNcCJFhy3f12cLYE4u8DUIJvZ551G3y8KcPgQ=;
 b=Ah1OVyzxKx9orH58KQYcyyI3mJiUkyFuB54Vpx19n3EouHGkAm5cSUPTfomdh51ZNi
 CzKlqtTOSEzhPRqrYiBknonQ2cva9XJKtLxq/SIQ52nIuJ9SHtqYZL1R+psDCz9hU+aS
 DMP4ZVqYDmBV89pw72chttD52INcLe5XtrxKebo1xDXx00aI1fRuhvyxS5tJk96d5h32
 SIIt47g6tkXLczx5RcpCiHVBgsoDKCiVNgzn+Qkoc1xCxkRdLSzNSaxhEokK3GAg6vGg
 tOKM8EJa7oKcjvyzMYJSqbzUGM4cYJdGhov/2VahZ0dlJW2mQsqPJ7GYD6Nh/x4cYaiN
 NZ2w==
X-Gm-Message-State: AOAM53348RiIrj/xJUdBMNLbZosToUNE12rhaHdkEB7cl/73jA05g4s7
 sn0Dzr7hjnSfCjNxQOwT4KSXCoWSY1scCg==
X-Google-Smtp-Source: ABdhPJx+vXVYz+w8d1jPUuepDy67zXnbL7pNZG0nXJb8Lux9Rhopwszg/P5svbt7vQhYoPPshoMESg==
X-Received: by 2002:a05:620a:15d0:: with SMTP id
 o16mr5180121qkm.222.1612539120730; 
 Fri, 05 Feb 2021 07:32:00 -0800 (PST)
Received: from ?IPv6:2601:5c0:c200:27c6:4172:c957:b7de:3481?
 ([2601:5c0:c200:27c6:4172:c957:b7de:3481])
 by smtp.gmail.com with ESMTPSA id q6sm9477022qkq.34.2021.02.05.07.31.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:32:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] drm/qxl: do not run release if qxl failed to init
From: Tong Zhang <ztong0001@gmail.com>
In-Reply-To: <20210205074330.zsb2lg5umgkxh2p3@sirius.home.kraxel.org>
Date: Fri, 5 Feb 2021 10:31:58 -0500
Message-Id: <BCB24CD0-FD0F-4202-AD93-02A7EDC229C9@gmail.com>
References: <20210204163050.1232756-1-ztong0001@gmail.com>
 <20210205074330.zsb2lg5umgkxh2p3@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Feb 5, 2021, at 2:43 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> On Thu, Feb 04, 2021 at 11:30:50AM -0500, Tong Zhang wrote:
>> if qxl_device_init() fail, drm device will not be registered,
>> in this case, do not run qxl_drm_release()
> 
> How do you trigger this?
> 

This can be triggered by changing the QXL VGA rom magic value.

In the QEMU source code ./hw/display/qxl.c
or change the QXL_ROM_MAGIC in spice header file

- Tong

> take care,
>  Gerd
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
