Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E69B8038
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED2B10E2DD;
	Thu, 31 Oct 2024 16:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=metux@gmx.de header.b="oV989kEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8174010E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730286945; x=1730891745; i=metux@gmx.de;
 bh=mlDftfx0K4BOCP97UClfQEOO1aAHQKqEtrb3HZcbogc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oV989kEiNWeJh8gP21cTVDoFmxCiTpBKcteuNrFpD3JzsOYLqTWquNReAO7JXDVQ
 bkZ3MPce8pPgAhfADVFEJL9FKgxbrDc5yJ43s86N64sXLcwlq+YnaaOCjqnaTViY3
 kBITyvP0TEl0z4Q9D08feJUaFpsv8Yf12Fw9IXMWYeXH4u3LSwHcInzvocIuJR79v
 +enfEhcMlD5BKwtCntlEMyFYoFC0engUUEV8B/K78sCTexSVDh9QOEkYwOO0BA9fi
 EUZCCBznDJflQsg44b6oKhjb67KRqb+9kmgKo3oVp1RhZVVdtiZBz/0WsmL2dxv71
 vTjQhfnY+nrr5HZmHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.178] ([95.114.207.188]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1ttH783dA6-010bqc; Wed, 30
 Oct 2024 12:15:45 +0100
Message-ID: <35deac48-4220-4889-833d-1b57b417e968@gmx.de>
Date: Wed, 30 Oct 2024 12:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Requirements to merge new heaps in the kernel
To: Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
Content-Language: tl
From: metux <metux@gmx.de>
In-Reply-To: <20241022-macaw-of-spectacular-joy-8dcefa@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OXs7H1W+UFRu0PC7wfyzXJLH0EbhAYeRDPBvuzLGrQSDhISLPnc
 6WC52Fn3eaU5BOifJojQ5t94gaHu+qcA18UYcIpyEL8UepofSNlbxFDRp11lMQbDFgiV39Q
 Io0EklDI6cb1kgk464W+PyGSnP2NLEyYWE1Do/VIteND7LFfreTb+5i7upH9CA4v7jqqsoF
 bnawMxSDiyUs5pnwlo0RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H52CPmlmabM=;0t4AdGqQVW+nDR/Ok80kPjqEzjN
 QuuzM3Vi+5o+idAGY13wmHfnHzZSup/mnzbiCmHCVbO8P8Wde1B1Pz/Ua4nE2mVFt5egDIkNS
 LONeHuphdvVv3VbLQmU6Cr7NBAsRO6E7s3l41kJyE8h46n0vPAqzgIYOX5gYkfS/d0ksXfg9m
 lLNU5x3/VuYSgEc4jJNHM0nmUlLR9hukOKJvLs5exWCyYKwUZyvsl5VNAvxdFdzNp8JNhkK7H
 hw0IX+TXumArBdWNV7q3FkR9SkLTZJYVQw40MQDECd+jvVEgsUvxdU9sCYm4oOSWs7e+uBAb2
 9kENftMqlViJiW9iWD2tr3xgb62e7CiWM3LM/VaAQXaxTvy8obzv0rycQ1mtEQDderVW8Hf92
 Svhcrdwm10FEwpHV3OmuAkcFsxIgg2gXiY7IbZH8ap/Y+7CL/Fyi92Eav3MuziyBLshiqo8gY
 lKXOJaXT5cVRzg1K6sb/OquoLR4G8tTUNB1cYOr9sreWhdH2BrRkAGuIjGW/ElF9uV5aki7T7
 RVDSf4Ab0XQ/0YmEGz9eA+W7hscr3tVrIIGiQnsITW0ayMvlYbV2sqoiMCEb7v8qj5Jgd+n5H
 DcnKjcDbRD3D8E2klbPeRzRd1j/6qYzRKDS3EVLiXB5T1JxRYQzK4y00PLfrt+LyLcVAvkQZh
 QI3ig7AFdZ+9eFqDP7YIrT9b0wTViSoxFzcU0yaC9NkPuHaqYazGZiXyK82v8+j+b/qfeR3Yi
 zSmnj0ZtTrgumeNsiCqt3SVcZq70czr5rLPpPmft3gOTrXu1mdpahcWwDT8nF2k8uNTnwA3mS
 eYjxZzA5Aq9U+UR9jGjNSd86lyeQpt0GkF53wIPhNBotw=
X-Mailman-Approved-At: Thu, 31 Oct 2024 16:35:40 +0000
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

On 22.10.24 10:38, Maxime Ripard wrote:

Hi,

> I'm still interested in merging a carve-out driver[1], since it seems to=
 be
> in every vendor BSP and got asked again last week.
>
> I remember from our discussion that for new heap types to be merged, we
> needed a kernel use-case. Looking back, I'm not entirely sure how one
> can provide that given that heaps are essentially facilities for
> user-space.

For those who didn't follow your work, could you please give a short
intro what's that all about ?

If I understand you correctly, you'd like the infrastructure of
kmalloc() et al for things / memory regions that aren't the usual heap,
right ?

What's the practical use case ? GPU memory ? Shared memory between
nodes in a multi-CPU / cluster machine ?

Is it related to NUMA ?


thx
=2D-mtx
