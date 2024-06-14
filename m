Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCC909368
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B5110EE60;
	Fri, 14 Jun 2024 20:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="g2CK6bOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C810EE64
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 20:30:08 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5bad66c6e27so1101896eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718397007; x=1719001807;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xJhJt3J2nxJAuqKZHd0QwEciJsDRhZULynwju7SQhhA=;
 b=g2CK6bOPSbo4MCbwwckzdIuiDDM1lQ0crxfC0gFVOeXR/dZlVx4f+9OmgtJWvAyOrL
 vY0b4+P3upQPwTJuINP+MqceI4vqgo6LfZ1kEF01bMZOzO8kQGZB5XktU2E7xXIYBz4T
 ENd8Fm8GjgvLrRTgNrV5iJUZI4vz5nQ5LwOyfD8ppca2ZJj+vpJ1L4pMBBRfEyW5yUCD
 cZN2fOX5v936Xb9kOdAE0RVnEDWF8NVXZwnIZG1cGzZLLJhQepbDn6lLGT96utcUwJ7o
 jQwo9GY60NWr3d8+jUZP+QJNuGpKCYh3Erd8KqaTx8/jUtMjmP0Qdd4kSgangmauIk5O
 uWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718397007; x=1719001807;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xJhJt3J2nxJAuqKZHd0QwEciJsDRhZULynwju7SQhhA=;
 b=cgTIx7STVV2vAWLahdjCUwaKBeBCSK0twwE9tNci/mV3DZ0yybjOjWfttQhIZMcBrK
 v/6jBGV1BJfoqfPHwFnCZhYPGeyjgA82ZHhH4VTE+cPpvYPL0IVdLLJCNlcbEw/qCTCo
 AjJSj/O+ChPXpX6Uf5CnMj41u2u9dXoScii2IPjDdZjTKwoSELjWvFgFVBUY4+45obs2
 W+fBbNXOTbtvYqBcWT8XzdUfzKYlyB0i+EK2tfY0cOzDtFWXuqBRl3gf81sCuiz2TkOt
 ENbA6AtB2oaPMvksE4ww33rfFZbdVST0GMjeEYGHzk9I/yrzYn8cjIUgCeSfCGhT1Lft
 35aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf7DY5GI2QyknMMyFks3qCDy5lVaM2FtcWvwPeq3VCiffxR7ozH6nhXpRa74OiKSSUXIKjlmvSZJzwvnNrI35dkwjkKjfYpv3xBrKxkZLW
X-Gm-Message-State: AOJu0Yy0A+OBy7UzAbIp0nds4l2jIbu5u22vdwpiZqFxyPljIf0HvJrs
 gAqJZ/Rs2qOMZQiViQ9U8Q+ynk6UOVYY09vwfZP4M1gDk8/Vh786CZR8mj9zDUI=
X-Google-Smtp-Source: AGHT+IF4C0ydFkr3IsNAr6Blq5SSboC1En/cdpILPHYan7A2ZMTQYSAcMnFNnwq4qkuN3PHcllTO7w==
X-Received: by 2002:a05:6358:9103:b0:19f:5317:49a1 with SMTP id
 e5c5f4694b2df-19fb51658f7mr465229255d.28.1718397007051; 
 Fri, 14 Jun 2024 13:30:07 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca.
 [66.171.169.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5efc23asm22245446d6.126.2024.06.14.13.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 13:30:06 -0700 (PDT)
Message-ID: <0faecb255d7e1e67153321d9009f9fc8c0810cd7.camel@ndufresne.ca>
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>,  Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Philipp
 Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Fri, 14 Jun 2024 16:30:04 -0400
In-Reply-To: <8f93c724-3c86-c0f4-3a84-8a72817e684c@quicinc.com>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
 <8f93c724-3c86-c0f4-3a84-8a72817e684c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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

Hi,

Le vendredi 14 juin 2024 =C3=A0 10:16 -0600, Jeffrey Hugo a =C3=A9crit=C2=
=A0:
> > +	version =3D rocket_read(core, REG_PC_VERSION) + (rocket_read(core, RE=
G_PC_VERSION_NUM) & 0xffff);
> > +	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index=
, version);
>=20
> A properly working driver should be silent by default.

This is not universally accepted statement. Most drivers do have a one line
"probed/detected" kind of report.

Nicolas
