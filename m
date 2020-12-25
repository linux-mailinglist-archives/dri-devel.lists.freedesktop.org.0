Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1528E2E35C1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E5D89834;
	Mon, 28 Dec 2020 10:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969B89728
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=UwrOzTtTA0vBGuw7CE/CEj6w/tDyk2z40HHGiCNPM9k=; b=sHT+y4xXRxKQ2IJ8aWrfHE0ffb
 NggIhCWly1shnbaXyXPdMFLHcDxHw4OTGeLqPbxWHYpbhvqZU7FqbqT12rFsgRHOMOIihQtoDbNOJ
 GTGJ6Dz77AcYTc/DQOv+VGSdfBEI7odWHzZeyzIrs3LCVG2Wz9t4mMTGBbhDRf9y7+QmLLDg9LhCf
 HrE05/3matkGXSxDR36V1OQE+zAHWP3MKaShhIWap1fWofmltX9sCgIoReBd6YT9hXp57ZIl203KD
 +kaT+BnlfqpvNJMfsZfjmfcGrCJaxqin3sM82JUvD4TLvKqQS4Ud3Fy+GxxRzzLOS02eI/ylBpI1s
 PI7X6lag==;
Received: from [2601:1c0:6280:3f0::64ea]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksqFS-0003Er-Lc; Fri, 25 Dec 2020 16:47:26 +0000
Subject: Re: [PATCH 2/2] drivers/gpu/drm/ast: Fix infinite loop if read fails
To: Defang Bo <bodefang@126.com>, airlied@linux.ie, daniel@ffwll.ch
References: <1608884014-2327765-1-git-send-email-bodefang@126.com>
 <1608884014-2327765-2-git-send-email-bodefang@126.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ecb98c83-3906-6111-712d-ddfdeac1607f@infradead.org>
Date: Fri, 25 Dec 2020 08:47:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1608884014-2327765-2-git-send-email-bodefang@126.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/25/20 12:13 AM, Defang Bo wrote:
> [Why] Similar to commit <298360af3> ast_init_dram_reg() configures a window in order to access BMC memory.
> A BMC register can be configured to disallow this, and if so, causes
> an infinite loop in the ast driver which renders the system unusable.
> [How]
> Fix this by erroring out if an error is detected.

Hm, it appears that all this patch does is change spaces to tabs...


> Signed-off-by: Defang Bo <bodefang@126.com>
> ---
>  drivers/gpu/drm/ast/ast_post.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index ef19c70..86e4d23 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -302,13 +302,13 @@ static void ast_init_dram_reg(struct drm_device *dev)
>  			ast_write32(ast, 0x12000, 0x1688A8A8);
>  			do {
>  				if (pci_channel_offline(dev->pdev))
> -                                        return -EIO;
> +					return -EIO;
>  			} while (ast_read32(ast, 0x12000) != 0x01);
>  
>  			ast_write32(ast, 0x10000, 0xfc600309);
>  			do {
>  				if (pci_channel_offline(dev->pdev))
> -                                        return -EIO;
> +					return -EIO;
>  			} while (ast_read32(ast, 0x10000) != 0x01);
>  		}
>  
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
