Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEA9148F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348A810E3F3;
	Mon, 24 Jun 2024 11:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="z12JmP+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D508110E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719229170;
 bh=fuRM2vMjOFTGZvJt6BQhN14oz7/DD21tgiWVcRhZnwQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z12JmP+DEFy/c4DVs425RWZKPpZNi1AFGBEyjSLqV0fRBPxuXG9bRU422JZU99Id6
 ge9c3r5lsA8i0Ewi/BcfFmgvelihbvm/mRu7Frpt50Wi1+xIpPXzWb87erKI1UiFWe
 TuGMqXq2A7qyU78h2P2R07EoSdCc5LX2OGa4+/XFT/hk09shU7gtbKDwNcka7Ddm9F
 IVUXSAHi/5Ibrj/Vo5O/MJ9+Uw7C0Bu4g6SJxAWniy6FpRGm9e1kAKTzTyMua4uhq/
 3wP0xA3pMLXg9l3gtG33tQ3avnMZmQ7+QvNN4Napn2Ap6VMAwDoktH5DidgF2xG8ZB
 lGBOW8iltaV1A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7AAD937804C6;
 Mon, 24 Jun 2024 11:39:29 +0000 (UTC)
Message-ID: <5eda88da-ec50-48ff-8ed0-f4d3b8df5a3d@collabora.com>
Date: Mon, 24 Jun 2024 13:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: mediatek: cmdq: Add cmdq_pkt_logic_command to
 support math operation
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
 <20240525230810.24623-4-jason-jh.lin@mediatek.com>
 <cd15d9c5-f7a8-45fd-b0e1-011a9832d023@collabora.com>
 <f26efcca21b9954a0137d391ca78ba9870afd2f9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f26efcca21b9954a0137d391ca78ba9870afd2f9.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/05/24 17:52, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo,
> 
> On Tue, 2024-05-28 at 12:24 +0200, AngeloGioacchino Del Regno wrote:
>> Il 26/05/24 01:08, Jason-JH.Lin ha scritto:
>>> Add cmdq_pkt_logic_command to support math operation.
>>>
>>> cmdq_pkt_logic_command can append logic command to the CMDQ packet,
>>> ask GCE to execute a arithmetic calculate instruction,
>>> such as add, subtract, multiply, AND, OR and NOT, etc.
>>>
>>> Note that all arithmetic instructions are unsigned calculations.
>>> If there are any overflows, GCE will sent the invalid IRQ to notify
>>> CMDQ driver.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-cmdq-helper.c | 36
>>> ++++++++++++++++++++++
>>>    include/linux/soc/mediatek/mtk-cmdq.h  | 42
>>> ++++++++++++++++++++++++++
>>>    2 files changed, 78 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index 046522664dc1..42fae05f61a8 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -15,10 +15,19 @@
>>>    /* dedicate the last GPR_R15 to assign the register address to be
>>> poll */
>>>    #define CMDQ_POLL_ADDR_GPR	(15)
>>>    #define CMDQ_EOC_IRQ_EN		BIT(0)
>>> +#define CMDQ_IMMEDIATE_VALUE	0
>>>    #define CMDQ_REG_TYPE		1
>>>    #define CMDQ_JUMP_RELATIVE	0
>>>    #define CMDQ_JUMP_ABSOLUTE	1
>>>    
>>> +#define CMDQ_OPERAND_GET_IDX_VALUE(operand) \
>>> +	({ \
>>> +		struct cmdq_operand *op = operand; \
>>> +		op->reg ? op->idx : op->value; \
>>> +	})
>>
>> I think this CMDQ_OPERAND_GET_IDX_VALUE would be better expressed as
>> a (inline?)
>> function instead...
>>
> 
> Yes, I can change them to static inline function to pass their type
> directly.
> 
>> static inline u16 cmdq_operand_get_idx_value(struct cmdq_operand *op)
>> {
>> 	return op->reg ? op->idx : op->value;
>> }
>>
>> and maybe the same for the other definition too..
>>
>> static inline u16 cmdq_operand_type(struct cmdq_operand *op)
>> {
>> 	return op->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE;
>> }
>>
>> but definitely the first one is what I don't like much, the second
>> one can pass.
>>
> 
> You mean '#define CMDQ_OPERAND_GET_IDX_VALUE()' is the first one or
> 'static inline u16 cmdq_operand_get_idx_value()' is the first one?
> 

I'm sorry, your reply slipped through for some reason and I've read it just now.

I mean I don't like the macros (#define CMDQ_OPERAND_GET_IDX_VALUE(..) and
CMDQ_OPERAND_TYPE(..)) :-)

Please use static inline functions and resend; if you can do that this week, I
can pick the commit before I send the PR.

P.S.: And you're right, re-reading my own reply, it was a bit ambiguous, so
I'm again sorry for that, will be clearer next time.

Thanks,
Angelo

> Regards,
> Jason-JH.Lin
> 
>> Cheers,
>> Angelo
>>
>>> +#define CMDQ_OPERAND_TYPE(operand) \
>>> +	((operand)->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE)
>>> +
>>>    struct cmdq_instruction {
>>>    	union {
>>>    		u32 value;
>>> @@ -461,6 +470,33 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt,
>>> dma_addr_t addr, u32 value, u32 mas
>>>    }
>>>    EXPORT_SYMBOL(cmdq_pkt_poll_addr);
>>>    
>>> +int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16
>>> result_reg_idx,
>>> +			   struct cmdq_operand *left_operand,
>>> +			   enum cmdq_logic_op s_op,
>>> +			   struct cmdq_operand *right_operand)
>>> +{
>>> +	struct cmdq_instruction inst = { {0} };
>>> +	u32 left_idx_value;
>>> +	u32 right_idx_value;
>>> +
>>> +	if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	left_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(left_operand);
>>> +	right_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(right_operand);
>>> +	inst.op = CMDQ_CODE_LOGIC;
>>> +	inst.dst_t = CMDQ_REG_TYPE;
>>> +	inst.src_t = CMDQ_OPERAND_TYPE(left_operand);
>>> +	inst.arg_c_t = CMDQ_OPERAND_TYPE(right_operand);
>>> +	inst.sop = s_op;
>>> +	inst.reg_dst = result_reg_idx;
>>> +	inst.src_reg = left_idx_value;
>>> +	inst.arg_c = right_idx_value;
>>> +
>>> +	return cmdq_pkt_append_command(pkt, inst);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_logic_command);
>>> +
>>>    int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>>>    {
>>>    	struct cmdq_instruction inst = {};
>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h
>>> b/include/linux/soc/mediatek/mtk-cmdq.h
>>> index d4a8e34505e6..5bee6f7fc400 100644
>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
>>> @@ -25,6 +25,31 @@
>>>    
>>>    struct cmdq_pkt;
>>>    
>>> +enum cmdq_logic_op {
>>> +	CMDQ_LOGIC_ASSIGN = 0,
>>> +	CMDQ_LOGIC_ADD = 1,
>>> +	CMDQ_LOGIC_SUBTRACT = 2,
>>> +	CMDQ_LOGIC_MULTIPLY = 3,
>>> +	CMDQ_LOGIC_XOR = 8,
>>> +	CMDQ_LOGIC_NOT = 9,
>>> +	CMDQ_LOGIC_OR = 10,
>>> +	CMDQ_LOGIC_AND = 11,
>>> +	CMDQ_LOGIC_LEFT_SHIFT = 12,
>>> +	CMDQ_LOGIC_RIGHT_SHIFT = 13,
>>> +	CMDQ_LOGIC_MAX,
>>> +};
>>> +
>>> +struct cmdq_operand {
>>> +	/* register type */
>>> +	bool reg;
>>> +	union {
>>> +		/* index */
>>> +		u16 idx;
>>> +		/* value */
>>> +		u16 value;
>>> +	};
>>> +};
>>> +
>>>    struct cmdq_client_reg {
>>>    	u8 subsys;
>>>    	u16 offset;
>>> @@ -272,6 +297,23 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8
>>> subsys,
>>>    int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>    		       u16 offset, u32 value, u32 mask);
>>>    
>>> +/**
>>> + * cmdq_pkt_logic_command() - Append logic command to the CMDQ
>>> packet, ask GCE to
>>> + *		          execute an instruction that store the result
>>> of logic operation
>>> + *		          with left and right operand into
>>> result_reg_idx.
>>> + * @pkt:		the CMDQ packet
>>> + * @result_reg_idx:	SPR index that store operation result
>>> of left_operand and right_operand
>>> + * @left_operand:	left operand
>>> + * @s_op:		the logic operator enum
>>> + * @right_operand:	right operand
>>> + *
>>> + * Return: 0 for success; else the error code is returned
>>> + */
>>> +int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16
>>> result_reg_idx,
>>> +			   struct cmdq_operand *left_operand,
>>> +			   enum cmdq_logic_op s_op,
>>> +			   struct cmdq_operand *right_operand);
>>> +
>>>    /**
>>>     * cmdq_pkt_assign() - Append logic assign command to the CMDQ
>>> packet, ask GCE
>>>     *		       to execute an instruction that set a
>>> constant value into
>>
>>
>>
>>


