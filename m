Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A358C7E50BF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9003110E08B;
	Wed,  8 Nov 2023 07:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE88B10E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 07:01:37 +0000 (UTC)
X-UUID: f01e601fb4b84927ae82925b5d0e2746-20231108
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3105ce2c-d7aa-402a-9325-870ee63153c4, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:1
X-CID-INFO: VERSION:1.1.32, REQID:3105ce2c-d7aa-402a-9325-870ee63153c4, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-META: VersionHash:5f78ec9, CLOUDID:cff82595-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:23110815012661IPV5TK,BulkQuantity:0,Recheck:0,SF:64|66|38|24|17|19|4
 3|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: f01e601fb4b84927ae82925b5d0e2746-20231108
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>) (Generic MTA)
 with ESMTP id 160686842; Wed, 08 Nov 2023 15:01:26 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 49842E0080FF;
 Wed,  8 Nov 2023 15:01:26 +0800 (CST)
X-ns-mid: postfix-654B3246-232842373
Received: from [172.20.12.156] (unknown [172.20.12.156])
 by mail.kylinos.cn (NSMail) with ESMTPA id 80813E0080FF;
 Wed,  8 Nov 2023 15:01:25 +0800 (CST)
Message-ID: <d2321ef9-9de4-4276-8ea8-63e5995b1b11@kylinos.cn>
Date: Wed, 8 Nov 2023 15:01:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/qxl: prevent memory leak
To: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>
References: <20230322085847.3385930-1-zhouzongmin@kylinos.cn>
 <CAPM=9ty9h1_XS47tbFHVppnWQJkGntQwv0Zc0YUZmAQODh5MGA@mail.gmail.com>
 <4k4x5grw7tjgzvwlyxxnqt67cfxfggwc4iimrz5hrcond2fhug@phbquwgukj3g>
Content-Language: en-US
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
In-Reply-To: <4k4x5grw7tjgzvwlyxxnqt67cfxfggwc4iimrz5hrcond2fhug@phbquwgukj3g>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your reply.

Best regards!

On 2023/11/6 17:49, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 01, 2023 at 12:58:17PM +1000, Dave Airlie wrote:
>> On Wed, 22 Mar 2023 at 19:04, Zongmin Zhou <zhouzongmin@kylinos.cn> wrote:
>>> The allocated memory for qdev->dumb_heads should be released
>>> in qxl_destroy_monitors_object before qxl suspend.
>>> otherwise,qxl_create_monitors_object will be called to
>>> reallocate memory for qdev->dumb_heads after qxl resume,
>>> it will cause memory leak.
>>>
>>> Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
>> Sorry for nobody picking up on this, qxl isn't really well staffed,
>>
>> Reviewed-by: Dave Airlie <airlied@redhat.com>
>>
>> Could one of the misc maintainers pick this up?
> I just applied it to drm-misc-fixes
>
> Maxime
