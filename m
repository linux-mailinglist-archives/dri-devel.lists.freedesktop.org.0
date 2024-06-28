Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C607591C744
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE7410E02F;
	Fri, 28 Jun 2024 20:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jdB8PDrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687510E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:23:28 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6b4ff7cb429so4949996d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1719606207; x=1720211007;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
 b=jdB8PDrE8bxMTIiofrlC9NbpfPsFMdwZGRxepiH0c9bCKd3jK9Wv6UMpF6hud1fhD4
 W7nYT3jw5X6PFp2YsUqhKZ8X3tCGUIFou9h3CiWSH0UjWzJimXlGDT8x1aNrYXqz/9UP
 A2VTGTqbk5eGjtIwe57oTw51trPkpWsN4ePabRS7jxuMhnV1jenFBmhejASCSVjd4whs
 KNlsgzAmOEsh0PD5Tn90O3FKbthb7/HLZI1o3Wp03vFlw/5EAqoLB8eNMczkKmp812WB
 7EclVdzGcmQQaCwr9qYjbLeOwTBswq30dKtsUlRFW9/2NjymsEaVUUMMIo4Keo2MicCZ
 Q4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719606207; x=1720211007;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meF+jxyCw4OoAYyu1gwMI5pGdbLesBvTuciMbHzTey8=;
 b=XWWpGtA6NBWVGGU8e8VBTQzoj0uJfuxQ9XOR0y7C499maTTjkpigV4L2K8Q+DS6tb6
 qfnhxoYPELYts6LZm+7TdJAj5hygwAnriIKI9VKTVHTQCyNfOfWZMK49cb/UOA5WZOIV
 FjMd0S8OpsYYHz0MD7Unck66wiDiR8NdVNnFwEncQDTyBeO3cawgkjA2lLHmZpWTzd4l
 WmhByXX7XQNucdjxSWL0RPH3TOyuMmtWycZN6Bf4epqXdbMtGSklGa3AtkK/CXnVuHQO
 Gu/o0ojfV7pbF57WquasaaCg4nHt/ZXD/HEdudLGIOpTGONjbHEJhFTF84xQ+K1aCGvD
 5z3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZnbnIKxWDnY4PZaK5B5L/JQjJNXFHfF2j+0+b6tuxJV3yYxVCjO+EIP508G0Rx1wT4xPlr6kI+d5ZSjf/h8F8x7Jp4QOglRgrrN31mxe
X-Gm-Message-State: AOJu0YzuhsVgfqWTp/NMHeumITyjGZUpg0/Oj03jz9dQBEsOmGn2bDvP
 hPjkiLfnMmCHZ3ESb3q4PUJfYGHhXzUuhAgrgpPCs6BlDkpuO1kP2sFR3d8z+GE=
X-Google-Smtp-Source: AGHT+IHtfw7Xq3Cf0WFYd9L6i5fVpDUyYC/Xic5L6R5XMrTyAZAROOc6sOeuO8nND/pHTXuCm/Q3Pg==
X-Received: by 2002:a05:6214:27e9:b0:6b5:98aa:8b1b with SMTP id
 6a1803df08f44-6b598aa8c3amr67210986d6.50.1719606207610; 
 Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Received: from nicolas-tpx395.mtl.collabora.ca (mtl.collabora.ca.
 [66.171.169.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e6146bcsm10736956d6.120.2024.06.28.13.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:23:27 -0700 (PDT)
Message-ID: <ee405147d5e9826f1b2ad7d7c3bdb2fb745de420.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "mripard@kernel.org" <mripard@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, Youlin Pei
 =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Jianjiao Zeng
 =?UTF-8?Q?=28=E6=9B=BE=E5=81=A5=E5=A7=A3=29?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>,  "pavel@ucw.cz"
 <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tjmercier@google.com"
 <tjmercier@google.com>,  "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=
 <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Date: Fri, 28 Jun 2024 16:23:25 -0400
In-Reply-To: <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
References: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
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

Le jeudi 27 juin 2024 =C3=A0 16:40 +0200, mripard@kernel.org a =C3=A9crit=
=C2=A0:
> > You can trivially say during use hey this buffer is encrypted.
> >=20
> > At least that's my 10 mile high view, maybe I'm missing some extensive =
key
> > exchange or something like that.
>=20
> That doesn't work in all cases, unfortunately.
>=20
> If you're doing secure video playback, the firmware is typically in
> charge of the frame decryption/decoding, and you'd get dma-buf back that
> aren't accessible by the CPU (or at least, not at the execution level
> Linux runs with).
>=20
> So nobody can map that buffer, and the firmware driver is the one who
> knows that this buffer cannot be accessed by anyone. Putting this on the
> userspace to know would be pretty weird, and wouldn't solve the case
> where the kernel would try to map it.

Userspace will be the one calling into the CDM TF-A to get the bitstream bu=
ffer
to be decrypted, not the firmware. The encrypted buffers are not using
restricted memory. Userspace is also responsible for calling into the MTK
restricted heap to allocate the destination buffer (on other platform it co=
uld
be CMA heaps + TF-A call to restrict the allocated memory, I've seen some
discussions related to this, but its not possible on Mediatek HW).

I think its fair to assume that userspace always know which buffers are
restricted or not in the SVP process.

Nicolas
