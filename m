Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E298C9D52AF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C8F10EA22;
	Thu, 21 Nov 2024 18:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ig6nyI6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CD910EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:44:25 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539f84907caso1336551e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732214663; x=1732819463; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TZyh5R6Jjbt7oN7KVsZQw9ZFXBRvyZ4Sk/f6o54iZsw=;
 b=ig6nyI6gtHUCxE+brUtfZLb0sPdoAHOL2fv1G4okKEI/1F3M0gmpqkrEn/6+kXlQvX
 wGa6CQ4AoW5mdz3a1h/aAZpeOjPecIh6cQtnXA7kAqdsAk9F2/AKChD7vyEdvJAnnOmZ
 WMm/UeH61wugPfDuZiHPnZjRYngwC9Mv/eJzlafGeOdHwKX9N0qlXpRrCUnROt+REYKN
 0hci1ZREy/1zpOia6k52xd9TtiYM0Fd1+u+yqbcRON4cDzFKSEzg8BMjEpcy9HPRr0YE
 WRA84CUdxzNVP/v9L1ZQilKADGpM566AmBsCKOTEbTNjgbON7qhIjsUeV35Hf06tKOpL
 VGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732214663; x=1732819463;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZyh5R6Jjbt7oN7KVsZQw9ZFXBRvyZ4Sk/f6o54iZsw=;
 b=EcAEM5mF0EPgu4/3VfwSZi3udleprjl+Qfj8VfuVp3KYp3m77pOsRKIm3tZNKV5Ozw
 //xIlOwa6KuNsOYFLiiDRkwjzhP3CTtIZq0CdQ5/3Z6zQ4XFD9c96JdbwVEmb/ob9Hsu
 7WZNWpFj8tEMd+5lDvLQDjAGx8j8ePcIkPUMPu1Twxtyqr0sbCFZegGddIRRWPK1BIFl
 swqrhu22oZ2zlN7eNBTlf1los4K96A+lNw1+2PbP9z/NpJ1OJDmmnf+NgepEar9ZUWhn
 4do9OU0h/fkMV7KtPJZrCuqDGbIoKWmkjy2MgRdOvU/SHIKVBF7W31EQ21uU6YZr6cja
 wAMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqpLFSa6MnJpx57RRlDu3CP7pTsUj17AvbEhdsf2a/1+JcUvXt21Wj4ZJs+QmW8GCBX3RkNCsXS2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX3LpxJDie2tkWzJpUv/v0tPHM7vgyAhAQS0mPKBk3tKiEcN6b
 b694oyYwU9wo8LWWonHpgGjbnPlh7LqGRmGmz29HmGBnMxKhY8bD7hGeCE3j5Oo=
X-Gm-Gg: ASbGncsiMTm1DXcUsEnD29Zh0pMzTkA5q6i1NYTcCun2rzQwt1nLK9ti484oWR4wCug
 Kg2GTEk//EB/cdSrHTte4uYVpVmhlQv60wILBXiiWzGPzD37dGXI8Q5/Q++J2VLTffYPrISbVNW
 3ifmwu+cmrF6VsDW19WFhJgW8q541N46QlC5qp6tXE41uooiRst8vo5zpHwvIbMqpc6LMF4Y+RP
 rpwyDyv9l0EwXTUFxeNCYW1r3y6esAp6qnG04jLUWgolNCvs7xAOlpqNOcD7CDUx8rtOOOag3oq
 Bfihkoa01hYZOZQZD5uA6UZNK08Yug==
X-Google-Smtp-Source: AGHT+IG7nxOfbTTnTu4v1sr9zkOK5csQupd0P6YOCsdv1of5Sqk8kO39dWTULCj7D8rgDzFjdACzwA==
X-Received: by 2002:ac2:430a:0:b0:539:adb0:b91 with SMTP id
 2adb3069b0e04-53dc138a1ffmr3344284e87.57.1732214663097; 
 Thu, 21 Nov 2024 10:44:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2496a37sm43307e87.234.2024.11.21.10.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 10:44:21 -0800 (PST)
Date: Thu, 21 Nov 2024 20:44:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
Message-ID: <dtt6d427u5yep3i3b3zxxef7uh572aeu3vtatmjvpbqfpjbvjc@epkkr7oumncn>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
 <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
 <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
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

On Wed, Nov 20, 2024 at 10:54:24AM -0800, Rob Clark wrote:
> On Wed, Nov 20, 2024 at 3:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> > > Now the features defines have the right name, introduce a features
> > > bitfield and move the features defines in it, fixing all code checking
> > > for them.
> > >
> > > No functional changes intended.
> >
> > I think it might be better to squahs this patch into the previous one,
> > it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
> > .features for ADRENO_FEAT_bar.
> >
> 
> IMHO better to keep this separated

If they are separated, it is easy to overlook presense of a statement
checking .quirks against ADRENO_FEAT_bar.

> 
> But we don't have _that_ many features/quirks so I don't find
> combining them all that problematic
> 

-- 
With best wishes
Dmitry
