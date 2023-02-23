Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0306A1000
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 20:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4299010E04C;
	Thu, 23 Feb 2023 19:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA06110E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 19:02:14 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 80A10C8008D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 20:02:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lLGKANEEnV_r for <dri-devel@lists.freedesktop.org>;
 Thu, 23 Feb 2023 20:02:13 +0100 (CET)
Received: from [192.168.176.165] (host-88-217-226-44.customer.m-online.net
 [88.217.226.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 41D95C8008A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 20:02:13 +0100 (CET)
Message-ID: <28a3a285-7f42-1d3c-068e-2ead0c18ea23@tuxedocomputers.com>
Date: Thu, 23 Feb 2023 20:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
 <9b0e29f15f3e8799256c425f06b36a70ec04522f.camel@intel.com>
 <52f48cb2-ce54-854f-3bec-44c40c6ad07f@tuxedocomputers.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <52f48cb2-ce54-854f-3bec-44c40c6ad07f@tuxedocomputers.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 23.02.23 um 19:56 schrieb Werner Sembach:
>
> Am 23.02.23 um 19:26 schrieb Hogander, Jouni:
>> On Wed, 2023-02-22 at 15:17 +0100, Werner Sembach wrote:
>>> On these Barebones PSR 2 is recognized as supported but is very
>>> buggy:
>>> - Upper third of screen does sometimes not updated, resulting in
>>> disappearing cursors or ghosts of already closed Windows saying
>>> behind.
>>> - Approximately 40 px from the bottom edge a 3 pixel wide strip of
>>> randomly
>>> colored pixels is flickering.
>>>
>>> PSR 1 is working fine however.
>>>
>>> This patchset introduces a new quirk to disable PSR 2 specifically on
>>> known
>>> buggy devices and applies it to the Tongfang PHxTxX1 and PHxTQx1
>>> barebones.
>> I've been thinking something similar as there is still at least one
>> issue which seems to be like panel side issue:
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/7836
>>
>> Did you considered dpcd_quirk_list in drivers/gpu/drm/drm_dp_helper.c?
>>
>> I'm not sure which one is more correct though...
> Imho, since the proper fix lies within the Intel driver the quirk should also 
> lie within the Intel driver, because even if the panel has the same problem 
> combined with an AMD or NVIDIA card the proper fix for them will most likely 
> be land in the same kernel version. So there could be a period where you no 
> longer want the quirk for devices combining the panel with an Intel gpu but 
> still with an AMD GPU or vice versa.
*the proper fix for them will most likely not be in the same kernel version.
>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Cc: <stable@vger.kernel.org>
>>>
>>>
