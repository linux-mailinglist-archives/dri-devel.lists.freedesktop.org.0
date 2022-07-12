Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D10571EA9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6D418A9ED;
	Tue, 12 Jul 2022 15:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5685B18AC61;
 Tue, 12 Jul 2022 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=am0gmqQyNygY5BLpbzG6Derj/neEKA1GPQ3HA4CdOe4=; b=F0gAS0gF8LRDGc5jHcJthIccAQ
 KTsM1eXkDVN8HLymInpPGXr/aNquJvsa5Fr/akHmYDlVA0lrhBZVVYMKceE43FO4Kv31bjb7Bfi7q
 RCBBVSSnFPvTM7NMUOP4JRKjqrNksxe5nFPDstZ4s2/eKfQujdwzB40JpsBrv/qlscpIVBUZbAhrr
 FAVrkiIGJKCa2KfdEc1L9FSnR9xWBnSwpVZ0TesTlsR2KLVtD9b63kxLyt4gs3WaU6kAuN+3A6VsS
 4DvLhXEkt3NMdz81qEqgbJxvBs5IlO9S5UNXT49BYLOEHNM0pvTriPsN6bT1qELJjxM3x605g1av0
 8V68h0JA==;
Received: from [177.139.47.106] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oBHb2-00DhU5-Pm; Tue, 12 Jul 2022 17:14:45 +0200
Message-ID: <21df71a6-44d4-48a6-17d2-d463174a10c7@igalia.com>
Date: Tue, 12 Jul 2022 12:14:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] drm/amdgpu: double free error and freeing
 uninitialized null pointer
Content-Language: en-US
To: Sebin Sebastian <mailmesebin00@gmail.com>
References: <20220710132911.399325-1-mailmesebin00@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220710132911.399325-1-mailmesebin00@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebin,

Às 10:29 de 10/07/22, Sebin Sebastian escreveu:
> Fix two coverity warning's double free and and an uninitialized pointer
> read. Both tmp and new are pointing at same address and both are freed
> which leads to double free. Freeing tmp in the condition after new is
> assigned with new address fixes the double free issue. new is not
> initialized to null which also leads to a free on an uninitialized
> pointer.
> Coverity issue: 1518665 (uninitialized pointer read)
> 		1518679 (double free)

What are those numbers?

> 
> Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index f3b3c688e4e7..d82fe0e1b06b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1660,7 +1660,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>  {
>  	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
>  	char reg_offset[11];
> -	uint32_t *new, *tmp = NULL;
> +	uint32_t *new = NULL, *tmp = NULL;
>  	int ret, i = 0, len = 0;
>  
>  	do {
> @@ -1692,17 +1692,19 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>  		goto error_free;
>  	}

If the `if (!new) {` above this line is true, will be tmp freed?

>  	ret = down_write_killable(&adev->reset_domain->sem);
> -	if (ret)
> +	if (ret) {
> +		kfree(tmp);
>  		goto error_free;
> +	}
>  
>  	swap(adev->reset_dump_reg_list, tmp);
>  	swap(adev->reset_dump_reg_value, new);
>  	adev->num_regs = i;
>  	up_write(&adev->reset_domain->sem);
> +	kfree(tmp);
>  	ret = size;
>  
>  error_free:
> -	kfree(tmp);
>  	kfree(new);
>  	return ret;
>  }
