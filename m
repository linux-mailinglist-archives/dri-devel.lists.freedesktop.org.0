Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF67C4525
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 00:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4F610E3F8;
	Tue, 10 Oct 2023 22:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2E10E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 22:59:30 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c8a1541232so28641165ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696978770; x=1697583570; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=/ES8C0x5ZuDNWr0HT9HpTOQqsYOU0+uKuBS01OB1ZoI=;
 b=gRmz6sbN4QCXwSswRQzXKzH2YNQPikJeBVX/mu2qgotFNhs366rtMCv/AFYnQDvd20
 QXwf3uVKzraXwztcGKo5ReZolwRzshO4FzQT4JNoOn8qscnBDWuyCZaDldFgyxJMEi8d
 YncmVtcJ8VfWJcLfLqoD7gs42fPnVWA8JumKnEzKMRTHVKWvAEB/pNzahukqyhnNE1LI
 TRO2GsO/25OMtJOc9FljZbHJ+HhbPi4QO1c+qCo7UcvfbdSjfXnqqn5Wxr1nowCSCjwx
 p99brpERbRo/gVK3u7T8XfTzh3oatL1nfZ0c5uVnUHvxxnJy9Jc2xk7LnnqxNEpxwESL
 9v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696978770; x=1697583570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:sender:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/ES8C0x5ZuDNWr0HT9HpTOQqsYOU0+uKuBS01OB1ZoI=;
 b=KL0uk1JKGZuPo7CiDEe4lpTr2psLXfuE1oZMGS9gt03ovCqv3Qek8Xmi9HJZQt3enN
 2MU5X2fXQTbRWdWyS6/gpVQOG2zQJ+fA50beSpSFI+pO91Pks+iotwabKewHQNaiUZ8B
 vGXZ7w//23kcbYlXft7CGWxCc+LKEu2NhKEJsjBnyR+F0TD0W5EKhgIg0NJx4ZTJeDZ8
 FJyY5CBCCgXs6+T/+w+X3KX9OYaEnyHxO9Pic6Bl8qfwpBwYFCW5Ok/2OOVaK9YrODlv
 meMBQjS+gltOv1WJkW7kHTrT/EdibpejESbSsjyUDu4aQYt7r0hmotxJokM9KRcqejVK
 PCrg==
X-Gm-Message-State: AOJu0YxZxgHQW60Bs9EMPHBjJIaz9PYpGuzEyey/xYRpgEcqQLcFEDzx
 KQITM1VRHZdq7o2z3uTcjOU=
X-Google-Smtp-Source: AGHT+IEtF2lTqZZ7UjLFlrsQ5S9tyJm76ONM8BvApkxciRNKIFFX8vAoR8+YfD2KoSXBJPg85G0uIg==
X-Received: by 2002:a17:903:228f:b0:1c7:1fbc:b9e7 with SMTP id
 b15-20020a170903228f00b001c71fbcb9e7mr22885106plh.43.1696978770109; 
 Tue, 10 Oct 2023 15:59:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a170902d3c700b001c42d4b3675sm12216597plb.309.2023.10.10.15.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 15:59:29 -0700 (PDT)
Date: Tue, 10 Oct 2023 15:59:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
 eajames@linux.ibm.com, ninad@linux.ibm.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
 <ZSWevlHzu6kVcGWA@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSWevlHzu6kVcGWA@shikoro>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 08:58:06PM +0200, Wolfram Sang wrote:
> Hi Guenter,
> 
> > > > Reference to Andrew's previous proposal:
> > > > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
> > > 
> > > I do totally agree with Guenter's comment[1], though. This just affects
> > > a few drivers and this patch is way too intrusive for the I2C core. The
> > > later suggested prepare_device() callback[2] sounds better to me. I
> > > still haven't fully understood why this all cannot be handled in the
> > > driver's probe. Could someone give me a small summary about that?
> > > 
> > 
> > Lots of PMBus devices have the same problem, we have always handled
> > it in PMBus drivers by implementing local wait code, and your references
> > point that out.
> 
> I am confused now. Reading your reply:
> 
> "I am not sure if an implementation in the i2c core is desirable. It
> looks quite invasive to me, and it won't solve the problem for all
> devices since it isn't always a simple "wait <n> microseconds between
> accesses". For example, some devices may require a wait after a write
> but not after a read, or a wait only after certain commands (such as
> commands writing to an EEPROM)."
> 
> I get the impression you don't prefer to have a generic mechanism in the
> I2C core. This I share. Your response now sounds like you do support
> that idea now?
> 

I didn't (want to) say that. I am perfectly happy with driver specific
code, and I would personally still very much prefer it. I only wanted to
suggest that _if_ a generic solution is implemented, it should cover all
existing use cases and not just this one. But, really, I'd rather leave
that alone and not risk introducing regressions to existing drivers.

> > What other summary are you looking for ?
> 
> What the actual problem is with these devices. The cover letter only
> mentions "issues with small command turn-around times". More details
> would be nice. Is it between transfers? Or even between messages within
> one transfer? Has it been tried to lower the bus frequency? Stuff like
> this.
> 

I don't know about this device, but in general the problem is that the
devices need some delay between some or all transfers or otherwise react
badly in one way or another. The problem is not always the same.
Lower bus frequencies don't help, at least not for the devices where
I have seen to problem myself. The issue is not bus speed, but time between
transfers. Typically the underlying problem is that there is some
microcontroller on the affected chips, and the microcode is less than
perfect. For example, the microcode may not poll its I2C interface
while it is busy writing into the chip's internal EEPROM or while it is
updating some internal parameters as result of a previous I2C transfer.

> > On a side note, if anyone plans to implement the prepare_device() callback,
> > please make sure that it covers all requirements. It would be unfortunate
> > if such a callback was implemented if that would still require per-driver
> > code (besides the callback).
> 
> Is there a list of that somewhere? Or does it mean going through all the
> drivers and see what they currently do?
> 

The latter. I never bothered trying to write up a list. Typically the behavior
is not documented and needs to be tweaked a couple of times, and it may be
different across chips supported by the same driver, or even across chip
revisions. Any list trying to keep track of the various details would
be difficult to maintain and notoriously be outdated.

Guenter
