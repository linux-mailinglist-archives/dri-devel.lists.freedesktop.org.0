Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AD7DFDFC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 03:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B8410E369;
	Fri,  3 Nov 2023 02:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2410E369;
 Fri,  3 Nov 2023 02:32:02 +0000 (UTC)
X-UUID: 2a7ddf9ad16b4c9eb7720d5cde1990ae-20231103
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:0b01e04e-72d4-4eac-9ac1-23a9e2c0b857, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-5
X-CID-INFO: VERSION:1.1.32, REQID:0b01e04e-72d4-4eac-9ac1-23a9e2c0b857, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5f78ec9, CLOUDID:a3e018fc-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:231102193258W1UEKU65,BulkQuantity:6,Recheck:0,SF:44|64|66|38|24|17|1
 9|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
 COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 2a7ddf9ad16b4c9eb7720d5cde1990ae-20231103
X-User: chentao@kylinos.cn
Received: from [172.21.13.26] [(116.128.244.171)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 219426355; Fri, 03 Nov 2023 10:31:51 +0800
Message-ID: <4ca799cb-25d1-4b2a-9555-08fd6d8eaf66@kylinos.cn>
Date: Fri, 3 Nov 2023 10:31:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Fix potential spectre vulnerability
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, daniel@ffwll.ch,
 andi.shyti@linux.intel.com, robdclark@chromium.org,
 jonathan.cavitt@intel.com, andrzej.hajda@intel.com,
 chris.p.wilson@intel.com, alan.previn.teres.alexis@intel.com
References: <20231102101642.52988-1-chentao@kylinos.cn>
 <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <d300506c-ab82-4cc1-b750-61e54ec2ad9e@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,
Thank you very much for your kind suggestion, I have modified it in 
accordance with your suggestion.

On 2023/11/2 19:32, Tvrtko Ursulin wrote:
> 
> On 02/11/2023 10:16, chentao wrote:
>> Fix smatch warning:
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:847 set_proto_ctx_sseu()
>> warn: potential spectre issue 'pc->user_engines' [r] (local cap)
>>
>> Signed-off-by: chentao <chentao@kylinos.cn>
> 
> I don't know if this is actually exploitable given the time deltas 
> between the index is read from userspace and acted upon here, which is 
> at least two ioctls apart. But I suppose no harm in fixing and for 
> safety so we need to add:
> 
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle 
> create parameters (v5)")
> Cc: <stable@vger.kernel.org> # v5.15+
> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index 9a9ff84c90d7..b2fdfc7ca4de 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -843,7 +843,7 @@ static int set_proto_ctx_sseu(struct 
>> drm_i915_file_private *fpriv,
>>           if (idx >= pc->num_user_engines)
>>               return -EINVAL;
>> -
> 
> Just please refrain from random whitespace modifications like this blank 
> line removal. If you resend without that you can add my r-b.
> 
> Regards,
> 
> Tvrtko
> 
>> +        idx = array_index_nospec(idx, pc->num_user_engines);
>>           pe = &pc->user_engines[idx];
>>           /* Only render engine supports RPCS configuration. */
