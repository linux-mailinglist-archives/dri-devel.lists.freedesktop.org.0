Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5562385B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 01:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146E897FB;
	Thu, 10 Nov 2022 00:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52609897FB;
 Thu, 10 Nov 2022 00:46:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86C9361D2F;
 Thu, 10 Nov 2022 00:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217D6C433C1;
 Thu, 10 Nov 2022 00:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668041176;
 bh=/64DKl5JdKWddMfBNEuX/xFnhy13CGDoKSQEmv62YSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvmkcUfMz4B//VNfTGKsBLlpHdgRo1r2zRcyXw15gAdVdmld25bq0CeGZtf3Aq0OO
 vc+Q7tUaNHS8JJ8lvhJfHvZJhgWm6s9BG25WEgo6KWIita+OVnnwQl4onTXFOGQr8T
 2zWMfUxQ/EhsbRxDTQyzQgeP5uI8vDvdOtwkwhkoUVgJK2AbAfsfjof22KPgclo3g+
 /un7N1jlaLS+jlLnV4ZQb013JuQfFeaJz5TbrsggEY/mAxScjH4F7CcIb6O3IzYbr2
 zCsWJdDjmOHxbGk+qdlNdhUZFfIHGcS645/YEuBiDhsAYc+aC6W48HaZ8rZljwDlhR
 iTw0ttHW7R5Qg==
Date: Wed, 9 Nov 2022 18:45:57 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Subject: Re: [RFC] Approaches to deal with a struct with multiple fake
 flexible arrays members
Message-ID: <Y2xJxUnDnesWYckj@work>
References: <Y2siZmiTD40mTYpJ@mail.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2siZmiTD40mTYpJ@mail.google.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 04:45:42PM +1300, Paulo Miguel Almeida wrote:

Adding Alex, Christian and DRM lists to the thread.

> Hi KSPP community,
> 
> I've been working on replacing 1-element arrays with flex array members
> on the drm/amdgpu files. I came across one insteresting case which I
> may need to pick your brains to find a solution for it.
> 
> The structure below has two fake flexible arrays but I would get an
> error if I try make them both FAM. How should/could I deal with the
> asRegIndexBuf in this case? In theory, DECLARE_FLEX_ARRAY would "work"
> but that doesn't seem to be its intended usage as far I've searched.
> (unless I got it wrong, if that's the case, feel free to set me straight)
> 
> Any ideas? 
> 
> struct _ATOM_INIT_REG_BLOCK {
> 	USHORT                     usRegIndexTblSize;    /*     0     2 */
> 	USHORT                     usRegDataBlkSize;     /*     2     2 */
> 	ATOM_INIT_REG_INDEX_FORMAT asRegIndexBuf[1];     /*     4     3 */
> 	ATOM_MEMORY_SETTING_DATA_BLOCK asRegDataBuf[1];  /*     7     8 */

I didn't find evidence that asRegDataBuf is used anywhere in the
codebase[1].

> 
> 	/* size: 15, cachelines: 1, members: 4 */
> 	/* last cacheline: 15 bytes */
> } __attribute__((__packed__));

Alex, Christian,

It looks like this structure is only being used as a template to populate
instances of struct atom_mc_reg_table[2] and that these[3] are the only
places where asRegIndexBuf[] is being used. Apparently, this array is only
being used to retrieve it's address so that a pointer can jump[4] in chucks
of size sizeof(ATOM_INIT_REG_INDEX_FORMAT):

drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1461:
1461:	format = (ATOM_INIT_REG_INDEX_FORMAT *)
1462:		((u8 *)format + sizeof(ATOM_INIT_REG_INDEX_FORMAT));

up to (VBIOS_MC_REGISTER_ARRAY_SIZE * sizeof(ATOM_INIT_REG_INDEX_FORMAT))[5],

As I pointed out above, I don't see asRegDataBuf[] being used in the
codebase (of course it may describe firmware memory layout). Instead,
there is this jump to a block of data past asRegIndexBuf[]:

drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1444:
1444:	ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
1445:		(ATOM_MEMORY_SETTING_DATA_BLOCK *)
1446:		((u8 *)reg_block + (2 * sizeof(u16)) +
1447:			 le16_to_cpu(reg_block->usRegIndexTblSize));

So, it seems the one relevant array, from the kernel side, is
asRegIndexBuf[]. I wonder if we really need asRegDataBuf[] in that
structure... or if we could try modifying that struct and only have
asRegIndexBuf[] as last member? and then we can transform it into a
flex-array member.

If for any strong reasong we cannot remove asRegDataBuf[] then I think we
could give it a try and use DECLARE_FLEX_ARRAY() to declare both arrays
in the structure.

But first, of course, Alex, Christian, it'd be really great if we can
have your input and feedback. :)

Thanks!
--
Gustavo

[1] https://elixir.bootlin.com/linux/latest/C/ident/asRegDataBuf
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c#L1441
[3] https://elixir.bootlin.com/linux/latest/C/ident/asRegIndexBuf

