Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF1D82885A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 15:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AACA10E432;
	Tue,  9 Jan 2024 14:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D631B10E432
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 14:40:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 35C01B81B1B;
 Tue,  9 Jan 2024 14:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D1BC433F1;
 Tue,  9 Jan 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704811246;
 bh=JtUnKmh82+8hl9yHpHolXJPlKOMneCk3xUxEKY3Bryo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qJ4139m1Mz2HSk++A9C0OnpR8xxIJ5Hv4D+nuIC4WdWPYWKTLRzJmLPIm8PzfR/ES
 vvfwGNdlyjG+Fv0yOSgbvFWQs6IeGNMNpkdX/2sTRxTN96ECzc+LkmmED6xXXg2gBa
 7d/oC/UGNvKLGfZqmzZ1/9KALPVhtpVf+LyMgtkMt0y9zFAVBD3aF7qdYPYYrVAW4u
 vUxCYGVOhwUAjTDo/aZuE5KaVfGGz4gEI6XQ5y7DnG3+/8kEwx9LgYPR5FGUnytng/
 Q5UqNu3f9pfG4zd0PSPj45hFn6HnoGnRsiEZFGLEOb3Z12NNEfqvpQqLgrdS8iZRIC
 Kw00w7LHDdL/w==
Message-ID: <b8e02569-1bd3-4a04-857e-e7209b493d97@kernel.org>
Date: Tue, 9 Jan 2024 16:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] accel/habanalabs: remove redundant assignment to
 pointer 'input'
To: Colin Ian King <colin.i.king@gmail.com>, Ofir Bitton <obitton@habana.ai>, 
 Benjamin Dotan <bdotan@habana.ai>, dri-devel@lists.freedesktop.org
References: <20240106124213.51392-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Oded Gabbay <ogabbay@kernel.org>
In-Reply-To: <20240106124213.51392-1-colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/01/2024 14:42, Colin Ian King wrote:
> From: Colin Ian King <colin.i.king@intel.com>
> 
> The pointer input is assigned a value that is not read, it is
> being re-assigned again later with the same value. Resolve this
> by moving the declaration to input into the if block.
> 
> Cleans up clang scan build warning:
> warning: Value stored to 'input' during its initialization is never
> read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@intel.com>
> ---
>   drivers/accel/habanalabs/goya/goya_coresight.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
> index 41cae5fd843b..3827ea4c02f7 100644
> --- a/drivers/accel/habanalabs/goya/goya_coresight.c
> +++ b/drivers/accel/habanalabs/goya/goya_coresight.c
> @@ -576,7 +576,6 @@ static int goya_config_spmu(struct hl_device *hdev,
>   		struct hl_debug_params *params)
>   {
>   	u64 base_reg;
> -	struct hl_debug_params_spmu *input = params->input;
>   	u64 *output;
>   	u32 output_arr_len;
>   	u32 events_num;
> @@ -592,7 +591,7 @@ static int goya_config_spmu(struct hl_device *hdev,
>   	base_reg = debug_spmu_regs[params->reg_idx] - CFG_BASE;
>   
>   	if (params->enable) {
> -		input = params->input;
> +		struct hl_debug_params_spmu *input = params->input;
>   
>   		if (!input)
>   			return -EINVAL;
Thanks for the patch.
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Oded
