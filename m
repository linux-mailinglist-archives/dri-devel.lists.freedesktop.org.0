Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16AD9548B8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303D610E511;
	Fri, 16 Aug 2024 12:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qk/kjwq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B521410E4DB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:30:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53301d46c54so2681297e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723811409; x=1724416209;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w96eQaH+JFVwUc2NHdKcq4o8sWhYVnxpQd6m10yEznM=;
 b=Qk/kjwq/EO1on53z+qyDO6+XK+Lgr8hig8wTss4VR8JN1BGrHArX9zaj/1ZrgUz0iY
 moLyXh0G4Emx6kWSrlGD5ImN/yFgNptwgsNMT0JU0sU45kctp+IdgdknHM4/qMPjLSjT
 mczNJaiT3vArDowhMGzezCbsuWHCpI8dv+nfxam5X0HcBXr8fevRMyzekRD2jsjFh6bz
 OmCKneb/4LkyZ1P1Hg6X5He7WxaYNf84NaQxbr46zT05MTGlUBeG8QqxM8RGOwgFwM0N
 WTvoTUTQSu1SpjZpa1sajOBW7TtGFMoaGyn7TjLQIaYUPeD5JNxsSl2h3LculuSOEArT
 7UVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723811409; x=1724416209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w96eQaH+JFVwUc2NHdKcq4o8sWhYVnxpQd6m10yEznM=;
 b=FgiSaFaGZMQK0jQ5K1fU2TVpkbXpedjnHHzgmM5dB1y4QnRcgqxLyCfIRiT4YA7R8u
 sm97BFh0IWeKVnvFOA/Ws4bfUZZ2KSyOAzkXxEO6vhe/jZ7uJeYsQE9QYBYu1nCs9o+V
 IrD518LyjCK/S9YU9WlrzfKm52XHy9aE4b7GxghjQFy3e5g5nD+RDS8jiKG+EADfe4bY
 popybBdZE0qLi8muWqojZdg74/WdM6qTAIy1/ZunxXQLzDCc+XsZ96QG2WkHOpcOenLh
 g0xmMeWYz2u/ZF8agzTJJuA6UtLAr/CJOBSv9XcZ9rxm3CTzodxM8WjVannYp8FwErfq
 FbZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS86No/BJTG5/qGVyoCntiP6ESQzaPDOBC99K6rsxOnN6bH8Kc1Cfr64nX6bU6f9wT77YD/9J1LjL7CVmGL5tvn8crQb7F5u0cHIt1O6+U
X-Gm-Message-State: AOJu0YxQEy7jePB7kOkXQCKeQeOXKOFJ1UDDyV7Bh0fYAQIn5Wu0dJPa
 Sc1lcVRwciN7jsid6xmH/fwTsvUFggn3WQLOCMg4QphTr/hj0zykBLf5gV9C7/lXKjYHpr4Tu0P
 2hc6jE61pzwINIgR8Ow1pC8d9fpmxDVI65Sxzzg==
X-Google-Smtp-Source: AGHT+IFZaK4vjw4Aem+81rYMCtAGdtY0O6D4wq9Y8v3rCLdzZcg4Vb5soplVtVkp/6l3JtM6+jGW1KtRA1lR1iP6gzQ=
X-Received: by 2002:a05:6512:3dab:b0:52c:c5c4:43d4 with SMTP id
 2adb3069b0e04-5331c6f0065mr1560017e87.53.1723811408941; Fri, 16 Aug 2024
 05:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240816102345.16481-1-brgl@bgdev.pl>
 <c0af2eec-c289-4147-aca2-aac438451f5e@kernel.org>
In-Reply-To: <c0af2eec-c289-4147-aca2-aac438451f5e@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 14:29:56 +0200
Message-ID: <CAMRc=MdmgcRUfYGo25spPOKqjpebiaZUP34B7PuuoAxMAupAYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: misc: qcom,
 fastrpc: document new domain ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 16, 2024 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/08/2024 12:23, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add "cdsp1" as the new supported label for the CDSP1 fastrpc domain.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b=
/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > index c27a8f33d8d7..2a5b18982804 100644
> > --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> > @@ -26,6 +26,7 @@ properties:
> >        - mdsp
> >        - sdsp
> >        - cdsp
> > +      - cdsp1
>
> Are there more than one cdsp domains? Why adding suffixes? Driver source
> code does not have "cdsp1" domain, so this is confusing.
>
> Best regards,
> Krzysztof
>

It does, Srini picked up this patch earlier today. I'm not an expert
in fast RPC but it looks like the domain ID number matters here.

Bart

[1] https://lore.kernel.org/all/20240805-topic-sa8775p-iot-remoteproc-v4-4-=
86affdc72c04@linaro.org/
