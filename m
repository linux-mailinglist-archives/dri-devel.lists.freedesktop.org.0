Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E756103C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 06:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627FD10F075;
	Thu, 30 Jun 2022 04:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FB910F075
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:33:45 +0000 (UTC)
Received: from fsav412.sakura.ne.jp (fsav412.sakura.ne.jp [133.242.250.111])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25U4Xha2029827;
 Thu, 30 Jun 2022 13:33:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav412.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp);
 Thu, 30 Jun 2022 13:33:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25U4Xgbr029821
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 13:33:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <532c6f15-93ff-7cee-7c2d-01cac3aec32e@I-love.SAKURA.ne.jp>
Date: Thu, 30 Jun 2022 13:33:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] gpu/drm/bridge/cadence: avoid flush_scheduled_work()
 usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <d87fdfd0-71d0-09e0-a5ea-652edd50dfdd@I-love.SAKURA.ne.jp>
 <e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp>
 <943273cb-c2ec-24e3-5edb-64eacc6e2d30@I-love.SAKURA.ne.jp>
In-Reply-To: <943273cb-c2ec-24e3-5edb-64eacc6e2d30@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
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
Cc: DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping?

On 2022/06/13 22:57, Tetsuo Handa wrote:
> Thus, how do we want to handle this race window?
> 
>   flush_delayed_work(&mhdp->hdcp.check_work) followed by
>   flush_work(&mhdp->hdcp.prop_work) (i.e. flush as much as possible) ?
> 
>   cancel_delayed_work_sync(&mhdp->hdcp.check_work) followed by
>   cancel_work_sync(&mhdp->hdcp.prop_work) (i.e. cancel as much as possible) ?
> 
>   do nothing (i.e. no need to flush or cancel mhdp->hdcp.check_work and mhdp->hdcp.prop_work) ?
> 

