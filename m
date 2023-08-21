Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008BF78241F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4A010E1F5;
	Mon, 21 Aug 2023 07:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0B10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 07:04:41 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id XyxoqoQ3VuWDMXyxoqWxoR; Mon, 21 Aug 2023 09:04:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1692601479;
 bh=omj5Cu2WnrhUZEiagPndlyI+KCEZ2ygnsWdsBFXoZkU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FaIiZCnPi+DVyWDLrR4bakN/8a69A89ZzRDO20POhotfGmeAUjpz4tNHBO6oYCjsh
 DbsInWWbowgaYYSU3i1+E4Hy5I5mqoEmD1qVvqoxIZSTpMKxU18Y/FgGM+Pvqc0Hh0
 T4O5RyOK1Sbmxr5knc/0NC0xUNLmfYv7zMa9KMG/hkRMXXzRQnA/tyn6Fz4R2Jj+RA
 V6b6/2CC/yj9OzG2XZnjWJC9d7imqBcfvhOu7C/IsLrTXEofczwErycukQ6b3Y/ExA
 R3vXVhlrawUvILzR1MlBs69kNOzV8qBmaYy2sGKdCWYmovfkrTah8O/we/IrEUwZrN
 RWo+2jpJpQJXQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 21 Aug 2023 09:04:39 +0200
X-ME-IP: 86.243.2.178
Message-ID: <38503377-ec27-09dd-dc6b-836a9ac0a5df@wanadoo.fr>
Date: Mon, 21 Aug 2023 09:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ast: Avoid possible NULL dereference
Content-Language: fr
To: Su Hui <suhui@nfschina.com>, airlied@redhat.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230821062159.198691-1-suhui@nfschina.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230821062159.198691-1-suhui@nfschina.com>
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
Cc: eich@suse.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 21/08/2023 à 08:22, Su Hui a écrit :
> smatch error:
> drivers/gpu/drm/ast/ast_dp501.c:227 ast_launch_m68k() error:
> we previously assumed 'ast->dp501_fw' could be null (see line 223)
> 
> when "!ast->dp501_fw" and "ast_load_dp501_microcode(dev) >= 0" is true,
> there will be a NULL dereference of 'ast->dp501_fw'.
> 
> Fixes: 12f8030e05c6 ("drm/ast: Actually load DP501 firmware when required")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 1bc35a992369..d9f3a0786a6f 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -224,8 +224,10 @@ static bool ast_launch_m68k(struct drm_device *dev)
>   			    ast_load_dp501_microcode(dev) < 0)
>   				return false;
>   
> -			fw_addr = (u8 *)ast->dp501_fw->data;
> -			len = ast->dp501_fw->size;
> +			if (ast->dp501_fw) {
> +				fw_addr = (u8 *)ast->dp501_fw->data;
> +				len = ast->dp501_fw->size;
> +			}
>   		}
>   		/* Get BootAddress */
>   		ast_moutdwm(ast, 0x1e6e2000, 0x1688a8a8);

Hi,

this looks like a false positive.

If "!ast->dp501_fw", and ast_load_dp501_microcode()>=0, then 
ast_load_dp501_microcode() will set a valid value in ast->dp501_fw.

CJ
