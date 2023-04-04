Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD236D64ED
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D546510E1C5;
	Tue,  4 Apr 2023 14:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2D10E6BB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 14:13:12 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D7E6100005;
 Tue,  4 Apr 2023 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680617587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zl7MLykOKA8UlNhyqu3tWD/vjZRODEGN3E9wOmRfmr8=;
 b=HERL1THee0w4ARcbmdqBbW9M2FrPt7M+4Zaeh/18I2OVyQ3MM0Usdk7NaPHFHD9vHrkI+I
 e6Rw2Qo8DqxzMLNRPH7tdMTM4sXVOKb3byVmNQw1hU9hyte98VxCkOevjiFKXUjndP7l0o
 fQXdMmYky22zAt7WMMTqJNETXimQFN7kaXSK2gu+vzkgvcXwnoMVA+S4byJsnO9o0TyEdL
 NTpBE/7o4qGE7Tm1KSr5epsIsp2X3gs1bhxOKwvfmoWs1fJ9uXdwMxKdp72zRd/W2yJ+BC
 2f5+NrOZt/WcDePLlFvQ+Cr+DbQfAOEuR513WeF4ixVoJRbe1FkVNLOkeaT62Q==
Date: Tue, 4 Apr 2023 16:12:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Message-ID: <20230404161251.272cc78b@booty>
In-Reply-To: <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On Wed, 29 Mar 2023 13:16:22 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Luca,
> 
> I finally found the time to test this series. It looks OK, except for this patch.

Thank you very much for taking the time!

> The list of supported formats really has to be the intersection of what the tegra
> supports and what the sensor supports.
> 
> Otherwise you would advertise pixelformats that cannot be used, and the application
> would have no way of knowing that.

As far as I understand, I think we should rather make this driver fully
behave as an MC-centric device. It is already using MC quite
successfully after all.

Do you think this is correct?

If you do, then I think the plan would be:

 - Add the V4L2_CAP_IO_MC flag
 - As the mbus_code in get_format appropriately
 - Leave the changes in this patch unmodified otherwise

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
