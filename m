Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80B8C915D
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 15:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F1D10E0D2;
	Sat, 18 May 2024 13:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="S66wiEfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF89410E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 13:21:24 +0000 (UTC)
X-Envelope-To: dianders@chromium.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716038482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+XZkADxoXZ0DB7eXEnh8J7Qynp6Huw6DX79kn85yPs=;
 b=S66wiEfvqu+Giau5N20Bp+EzLh/9Y40AGsIcGADEZGBt7DQeJIL8QaoHPqIfqUQ9dom6cz
 isvbfaoC4axdfx3QKGAdjkziRQGgihnQqMSOYvsiC/D1FAa/l1sHSZCe1MSenL/M/gC/ZL
 v+HdEJaDAUqD6CfwqKmDRyPiADR+MS4=
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: macromorgan@hotmail.com
X-Envelope-To: yuran.pereira@hotmail.com
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: sam@ravnborg.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <d06f2708-9700-4ca9-8d3b-aba5f1765181@linux.dev>
Date: Sat, 18 May 2024 21:20:52 +0800
MIME-Version: 1.0
Subject: Re: [RFT,v2,26/48] drm/panel: simple: Stop tracking prepared/enabled
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240503143327.RFT.v2.26.I865be97dd393d6ae3c3a3cd1358c95fdbca0fe83@changeid>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240503143327.RFT.v2.26.I865be97dd393d6ae3c3a3cd1358c95fdbca0fe83@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 2024/5/4 05:33, Douglas Anderson wrote:
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.


I think you are right, as I see drm_panel already has embed
the 'prepared' and 'enabled' as members, remove them from
the derived structure could probably save memory footprint.
Reducing boilerplate is also a side benefit.


> Signed-off-by: Douglas Anderson <dianders@chromium.org>


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


-- 
Best regards,
Sui

