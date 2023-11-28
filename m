Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49377FC9C6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05C110E35A;
	Tue, 28 Nov 2023 22:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9468310E35A;
 Tue, 28 Nov 2023 22:44:35 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id BD9BF323;
 Tue, 28 Nov 2023 23:44:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1701211473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMdaszjmHghx02rDq1Oy91uT9YTXeu24D5SoecBFShI=;
 b=Bz6rbpsRlDLXQu7iPJGh4cDpMtvt9UH/JNiuHy0U5yvZwAec30mWSQjEnLdr+GG9ILGZHM
 Y+6/gZPCexw9YqoS+PALoNMdmVZNDDh8ytuMPxB9Zbf8e+JAQ0joYWk4JsbCSAsPFoCNvF
 4DY10E9QotmRPLrodIIigVD9YPSxHSfdhVVxYP/Yyqfk/4zNGh0jwPdW9jyucCephWpZ43
 6Wz3hG86neR4QQqKDc6J2gebUy7Ym9n69678zrQAdsL38S4QWCNFte+XE5ZmTVmodR6/FZ
 pKZm2XUmNApgbnyFJRioes5y9Dgl/8Oo2RvUr1YO8gQSLrgOT/3/6qNdbhHBGg==
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 23:44:33 +0100
From: Michael Walle <michael@walle.cc>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
In-Reply-To: <CAA8EJppAhfm4FK4z_B=h9+o7LScjCyUD0XvdzQCe6tjrRx5KbA@mail.gmail.com>
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
 <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
 <dce76a6e1321a6374ad39125bead56b3@kernel.org>
 <CAA8EJpr9PDgSrTpP2-joQ09fxmJKZB1B+ESbDbMjkLNiqZ1m3A@mail.gmail.com>
 <14D9F495-425D-47FA-AD0D-F7299285936F@walle.cc>
 <CAA8EJpoYkH-0onMmNRk1iO5YeLN+5hpZMsfvtNo-7p6y2mjZwg@mail.gmail.com>
 <5eeade839ad3f71e8976965ce6cf3ed2@walle.cc>
 <CAA8EJppAhfm4FK4z_B=h9+o7LScjCyUD0XvdzQCe6tjrRx5KbA@mail.gmail.com>
Message-ID: <634164b4a8085770bd06134c1d328d8b@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: Michael Walle <mwalle@kernel.org>, tony@atomide.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 marijn.suijten@somainline.org, marex@denx.de, rfoss@kernel.org,
 dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com,
 alexander.stein@ew.tq-group.com, quic_jesszhan@quicinc.com, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, dianders@chromium.org,
 konrad.dybcio@linaro.org, tzimmermann@suse.de, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> I'm facing similar issues with the tc358775 bridge. This bridge needs
>> to release its reset while both clock and data lanes are in LP-11
>> mode.
>> But then it needs to be configured (via I2C) while the clock lane is
>> in enabled (HS mode), but the data lanes are still in LP-11 mode.
> 
> This is quite an interesting requirement. For example, I'm not 100%
> sure whether we can get that done on our (msm) hosts. I need to double
> check that.
> What frequency is expected on the CLK lane? Can it be an arbitrary
> frequency or it should be the same freq as the one used later for the
> video transfer?

I presume it has to be the same frequency as the video stream later.
That's a least what I have successfully tested.
The datasheet doesn't mention if a frequency switch is allowed on the
clock lane (which would need a brief switch to LP mode, I presume). I'd 
say
it's not allowed/supported as the bridge is very picky regarding the 
init
sequence in general.

I'm using the Mediatek DSI host, where that sequence is possible. I.e. 
you
just enable the clock and data lanes in continuous clock mode, but don't
enable the video stream, which should leave the data lanes in LP-11 
mode.

Sometimes you also have a command mode (instead of a video mode). And if
you don't send any commands, the data lanes are in LP-11 mode, too.

-michael

>> Therefore, for the correct init sequence is:
>> (1) dsi host enables lanes, that is clock and data are in lp-11
>> (2) dsi bridge driver releases reset of the bridge
>> (3) dsi host enables clock lane, leaves data lanes in lp-11
>> (4) dsi bridge driver configures the bridge
>> (5) dsi host enables the video stream
>> (6) dsi bridge enables the output port of the bridge
