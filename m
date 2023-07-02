Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD87452F6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 00:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2907510E02C;
	Sun,  2 Jul 2023 22:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A8510E02C;
 Sun,  2 Jul 2023 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h63n3TGFz//UZsyuKJqTNmhbmzkY3RFuUbFl5dnSDO4=; b=oIvZ9HmNAc52cl+P5YD2iA1kDo
 ZqFgIeKxO62GQYCTsJIvci99rwDXWEYFAmuqTZp7ekewoGc5uvQ71xDOUHupaiZwCSJG0FOJNt0DX
 a+2m2gxTF2KwOFufD0zMKuh1vgy65xkObesL/yW2PHtc42kZE9nI9LBATRTPjgKSxn29FXAOwdA/B
 +5QySboEnkUrHtv1Cea/kKfCo/5eDRAgehreNqJoGzIWZr7d/8HbxQK/CMhPkdBizESjJrbe0LarJ
 rmo68F+TIBpHUFx86GMGVJYmg1W23I6N4R1XslPS0WSlDhBigyaDAzJ+01d81V63s3xfnA5pn8F2O
 5Yc+j6aQ==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qG5Zx-007IRG-UZ; Mon, 03 Jul 2023 00:30:02 +0200
Message-ID: <75cdded3-4ae3-43dd-4a0c-ad77a5b793e7@igalia.com>
Date: Sun, 2 Jul 2023 19:29:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230702164407.6547-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 cristian.ciocaltea@collabora.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guilherme,

Em 02/07/2023 13:44, Guilherme G. Piccoli escreveu:
> This reverts commit 06c3a652a787efc960af7c8816036d25c4227c6c.
> 
> After this commit, the Steam Deck cannot boot with graphics anymore;
> the following message is observed on dmesg:
> 
> "[drm] ERROR [CRTC:67:crtc-0] flip_done timed out"
> 
> No other error is observed, it just stays like that. After bisecting
> amd-staging-drm-next, we narrowed it down to this commit. Seems it
> makes sense to revert it to have the tree bootable until a proper
> solution is worked.

Thank you for your patch, I confirm the exactly same behavior on my 
Steam Deck.

> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 

Reviewed-by: André Almeida <andrealmeid@igalia.com>
