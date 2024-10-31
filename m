Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C09B8375
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123810E91C;
	Thu, 31 Oct 2024 19:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lHkDF9Ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8410E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:30:12 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso1287984e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730403010; x=1731007810; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=31snwxEgII8Vk6u+4+11z3gM5zDzJPBD0BIeCBrJcCw=;
 b=lHkDF9AiOWRYrBeueyWHhVYLK2EuL2V0chi+Iv0BfHI1Vc/eXJJIuW9vC3hmlqPPaW
 IdJAa9Tr8aV+kB7xEd6O+Ivg/W8N+3lTA26cVCZ522dISFryrBMVloNxOfH+vt1VbzO4
 foepuiNAxUAzuQwtZynTl0n/7G5acreUODwdlTRZzeAYhOR4B1mwADsW/pah08ukFC5H
 tLHdjgFzQOuQzZr5Ghb680zmPFt8Q6SSXps1wGB2yWX6BSkiZACMsg50Tk2E1yJ52UYb
 r52popMyPVKlValqTL00e0IlKvxkkRlhv7PHHLGJoKUi0f+B5RorjmqF2xj5Ke+XdkHb
 mJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730403010; x=1731007810;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31snwxEgII8Vk6u+4+11z3gM5zDzJPBD0BIeCBrJcCw=;
 b=fwwf90LpBzOWLxr0gl/Fae/HSgQiGQKRAwjcqwXmruYgo/GuF360C5jkd++KbSk99j
 eLvTjq+x2zgRckqhep27uXxfzDlXa2kdBsRBLpsStXmufLsDxtK1NbFRBq/uAyzdrYLz
 ZdATCKH5MTZXPR5TV9yxeN1ATaNVrzKi8+x1nm5ufiBm9GQIQlHdHwqk5pEz0CIs5pJC
 Tvg82Uadq9l66qARcqHb1p0YABiLE0FEpH5heWiba3RL6PFVIR73PHsqKKHzgEpkajJ7
 85kV4cTh4LYXlIdFiWGZ8KugYmkX6W/oq19kmlfh6Iey+SRiLMHw2nZXLckKWMkn6fWa
 cQ+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNNy843moDafJunxxT22FdNC5gT8qGYglrH49YhfrPHS+v+u9pGIpGOCVh8M9dNVdmsJyFy7IfWPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDZhAYco8xE22rQMvqe46ilvzh/M/mrLLTaWE5ueOhTU6CgiKp
 KHlb7W1isjIEo0UBcqUZtId7SDo3MxIbhmekjSlqcTt6zFLkl+nHKfkYWeWvR98=
X-Google-Smtp-Source: AGHT+IEXOiLypbvMGxd2hyzMiKYXFJFT2FTyEhMspQ58nB+nmG3OjYg+hM8a0VciWysPPE0vTAJ4cA==
X-Received: by 2002:a05:6512:2315:b0:536:a6c6:33f with SMTP id
 2adb3069b0e04-53d65df22e7mr753424e87.13.1730403010310; 
 Thu, 31 Oct 2024 12:30:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9bed5sm307283e87.74.2024.10.31.12.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:30:08 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:30:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, 
 swboyd@chromium.org, airlied@gmail.com, quic_jesszhan@quicinc.com,
 lyude@redhat.com, 
 simona@ffwll.ch, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child
 nodes
Message-ID: <mlpiuko7n6rp3x55z4qterdns2wzqnfwgjxikbshrvakrscsak@antl2vzla5bd>
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
 <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
 <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>
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

On Thu, Oct 31, 2024 at 11:45:53AM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/31/2024 11:23 AM, Dmitry Baryshkov wrote:
> > On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > of_i2c_register_devices() adds all child nodes of a given i2c bus
> > > however in certain device trees of_alias_from_compatible() and
> > > of_property_read_u32() can fail as the child nodes of the device
> > > might not be valid i2c client devices. One such example is the
> > > i2c aux device for the DRM MST toplogy manager which uses the
> > > display controller device node to add the i2c adaptor [1] leading
> > > to an error spam like below
> > > 
> > > i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > 
> > > Add protection against invalid child nodes before trying to register
> > > i2c devices for all child nodes.
> > > 
> > > [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/i2c/i2c-core-of.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > > index a6c407d36800..62a2603c3092 100644
> > > --- a/drivers/i2c/i2c-core-of.c
> > > +++ b/drivers/i2c/i2c-core-of.c
> > > @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> > >   {
> > >          struct device_node *bus, *node;
> > >          struct i2c_client *client;
> > > +       u32 addr;
> > > +       char temp[16];
> > > 
> > >          /* Only register child devices if the adapter has a node pointer set */
> > >          if (!adap->dev.of_node)
> > > @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> > >                  if (of_node_test_and_set_flag(node, OF_POPULATED))
> > >                          continue;
> > > 
> > > +               if (of_property_read_u32(node, "reg", &addr) ||
> > > +                   of_alias_from_compatible(node, temp, sizeof(temp)))
> > > +                       continue;
> > 
> > I think just of_property_read_u32() should be enough to skip
> > non-I2C-device children. If of_alias_from_compatible() fails, it is a
> > legit error.
> > 
> 
> Thanks for the review.
> 
> of_alias_from_compatible() looks for a compatible string but all child nodes
> such as ports will not have the compatible. Hence below error will still be
> seen:
> 
> i2c i2c-20: of_i2c: modalias failure on
> /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports

But ports node don't have a reg property too, so it should be skipped
based on that.

> 
> > > +
> > >                  client = of_i2c_register_device(adap, node);
> > >                  if (IS_ERR(client)) {
> > >                          dev_err(&adap->dev,
> > > --
> > > 2.34.1
> > > 
> > 
> > 

-- 
With best wishes
Dmitry
