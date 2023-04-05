Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250006D76FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6C710E87A;
	Wed,  5 Apr 2023 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CBB10E87F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:31:41 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E4551BF20E;
 Wed,  5 Apr 2023 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680683498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfpX8n3KjmDuOMM79pUj2UNu0NextAFw1gDVBnHMLw4=;
 b=bCcuC7sWRQhfy48p+yKdWbEIRlhTIKVTe01b/RtLxDpwYXkNTNSsthBgWlrM5AyYCFAD9V
 bPZAeDNTSMUdLU6TH3O9/wHuQedepqeKZFAePw42KIr3UlWGLsObQHIx8FRA/Yzo/Hpwas
 1oMfM22Ru1auoLd8ys6PHjyeEs1k+RTPAgcCt6EDnt1ohR6x/rMuXDzlORw7UkENAYfwpS
 Bgqu7CtMjURcHeXgjEMd0FKRfuuPeaa635UVKIvKX9q7NrF+b0gicCAXGtd9tGp3oRRUos
 YgHaBQkht/RyoSHfYHY0w8lMSHHsAAkY1nM7AiJntPvjMh+FRmG6op0Q0JlDlQ==
Date: Wed, 5 Apr 2023 10:31:34 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Message-ID: <20230405103134.2ae10766@booty>
In-Reply-To: <20230405023048.GD9915@pendragon.ideasonboard.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
 <20230404161251.272cc78b@booty>
 <20230405023048.GD9915@pendragon.ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, 5 Apr 2023 05:30:48 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Luca,
> 
> On Tue, Apr 04, 2023 at 04:12:51PM +0200, Luca Ceresoli wrote:
> > On Wed, 29 Mar 2023 13:16:22 +0200 Hans Verkuil wrote:
> >   
> > > Hi Luca,
> > > 
> > > I finally found the time to test this series. It looks OK, except for this patch.  
> > 
> > Thank you very much for taking the time!
> >   
> > > The list of supported formats really has to be the intersection of what the tegra
> > > supports and what the sensor supports.
> > > 
> > > Otherwise you would advertise pixelformats that cannot be used, and the application
> > > would have no way of knowing that.  
> > 
> > As far as I understand, I think we should rather make this driver fully
> > behave as an MC-centric device. It is already using MC quite
> > successfully after all.
> > 
> > Do you think this is correct?  
> 
> Given the use cases for this driver, I agree.

Ok, thanks for the feedback. I will send a v5 with this change.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
