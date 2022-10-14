Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD085FF3E5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 20:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5376810E03B;
	Fri, 14 Oct 2022 18:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64A610E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 18:58:51 +0000 (UTC)
Received: from [IPV6:2804:431:c7c2:614d:1e72:1ebe:1da0:adb9] (unknown
 [IPv6:2804:431:c7c2:614d:1e72:1ebe:1da0:adb9])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADA086602374;
 Fri, 14 Oct 2022 19:58:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1665773930;
 bh=w5tCG0PCgpm5rqkO5qJrYz3YWsrGRktxZ3+TQEPwUak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UYu4GLSSuy4BnwFuENkS+CvxAS0BiLA5kCbW/jeORGNJ2/KjM1UVpfdHXC8b40lNn
 TjLGqckcUc2dEgEmfMvllEfZAtgLY63//eeJRG99CtJWGa31ngkQBvSU2mAPckLrNX
 B4AoWgTF0gnsliKBrAHIbgdZN6Znt1RIwWCppplk7WaCR4pjGxDjYB3Q7G9daa7OtO
 ayAJUMQAqSaZfVXsR1qsyWa29+tPdbYZz6xGPLFO121z/BZZqC0gK1ALlgidiaXdEq
 FbHL8iqbaN84MeXzeT64Y6Z1k03QnDLG/ROE9kaYf0OOPgEzfIKXTX0J4kEskJvOaF
 k/WUnUxtFqJiw==
Message-ID: <de4738ec-5362-aa8c-1d4f-a08a4ab3cfc2@collabora.com>
Date: Fri, 14 Oct 2022 15:58:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH v5] media: mediatek: vcodec: support stateless AV1
 decoder
Content-Language: en-US
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20221001012915.8974-1-xiaoyong.lu@mediatek.com>
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20221001012915.8974-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xiaoyong!

I have tested this and arrived at the same Fluster score:

173/239 - AOM
11/13 - Chromium 8bit

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
