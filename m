Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3765E12FE74
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 22:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EE0890FF;
	Fri,  3 Jan 2020 21:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB8D890FF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578088223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2E9jZbURUijwaE1tA6jFTdg/cQa33pnXiVlz2CG9nkU=;
 b=D2g/3aJrpz/I8dvKZNA8iQHoDGS/wusI5QqUzw10zWSsUeplhhqt8fD+zjM3OezS7zHvWx
 J4PhGEEb3ojwV5lkTsLuXWGKz9e4TkdlIH1rCPe6mYUTWAEuFByQntKQcP8xqrdD+Bf3fq
 lV4wDnqcKUhVt5Fvuy+D3O8UnDkzTyo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-6uSz9B8NN-ODXT86Q9wbaQ-1; Fri, 03 Jan 2020 16:50:21 -0500
Received: by mail-qv1-f69.google.com with SMTP id p3so3972699qvt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 13:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2E9jZbURUijwaE1tA6jFTdg/cQa33pnXiVlz2CG9nkU=;
 b=dSXzDXkV4RDEaT0ZjQbqiMDVlRQ1dqS0skzQ5a76D2LIHUoEA04Q2HmLY6WYIQ63kJ
 Ncs1i7G1cn/4v2a+/EJXCU+6rJzpQJ5SRC98BUReK5Aoee+yGWnROiU3+7BMl60npNbb
 t/UqZEXJrASrvoFB7tPpmUodZJLjwZIJBHUE3gCihhIQQPu8bp+c77se+etWDhp4D5Ri
 zHeZx+1YBk90L6X5jQWssoZXUeZE9f5f8PYf7eiUc6CLCIMzI25SCFDXrbGluZLoY+VT
 tOY03iglyD9y6Xzi5Z3NbZSFzEiOH3+j2kEhtbQcb7X1hlmI/Gd36RpIPcBJJL+H7rB+
 UlVQ==
X-Gm-Message-State: APjAAAUDoTaMjCduYukVr+u9b+QBcC2oJ5lGZ7CHFdjPaYa153qKPAWh
 jQ88uAlL/+CNLIyHBSC/7y4brrKTpTmpxtVgXEpbHEmRLwC1x+MgutI6VlF3BkferzJGaS4O0kR
 pqeuwUwG48/Lli4R2ZEi8lkiebn+C
X-Received: by 2002:ad4:5487:: with SMTP id q7mr71109961qvy.19.1578088221270; 
 Fri, 03 Jan 2020 13:50:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzljP0z5w+OcexEMra3Da+CizoTHREMRArrOSpe2REftTWBrwKU6VuGvcxFXejz+7Ac3I1QA==
X-Received: by 2002:ad4:5487:: with SMTP id q7mr71109951qvy.19.1578088221027; 
 Fri, 03 Jan 2020 13:50:21 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 16sm17167452qkj.77.2020.01.03.13.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 13:50:20 -0800 (PST)
Message-ID: <c163a9c8e2f8d71f265a624a1915636acce96b30.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 03 Jan 2020 16:50:19 -0500
In-Reply-To: <20200103055001.10287-1-Wayne.Lin@amd.com>
References: <20200103055001.10287-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: 6uSz9B8NN-ODXT86Q9wbaQ-1
X-Mimecast-Spam-Score: 0
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for all of the contributions you've made as of late! I will go ahead
and push this into drm-misc-fixes

On Fri, 2020-01-03 at 13:50 +0800, Wayne Lin wrote:
> [Why]
> According to DP spec, it should shift left 4 digits for NO_STOP_BIT
> in REMOTE_I2C_READ message. Not 5 digits.
> 
> In current code, NO_STOP_BIT is always set to zero which means I2C
> master is always generating a I2C stop at the end of each I2C write
> transaction while handling REMOTE_I2C_READ sideband message. This issue
> might have the generated I2C signal not meeting the requirement. Take
> random read in I2C for instance, I2C master should generate a repeat
> start to start to read data after writing the read address. This issue
> will cause the I2C master to generate a stop-start rather than a
> re-start which is not expected in I2C random read.
> 
> [How]
> Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
> drm_dp_encode_sideband_req().
> 
> Changes since v1:(https://patchwork.kernel.org/patch/11312667/)
> * Add more descriptions in commit and cc to stable
> 
> Fixes: ad7f8a1f9ce (drm/helper: add Displayport multi-stream helper (v0.6))
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1cf5f8b8bbb8..9d24c98bece1 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct
> drm_dp_sideband_msg_req_body *req,
>  			memcpy(&buf[idx], req-
> >u.i2c_read.transactions[i].bytes, req-
> >u.i2c_read.transactions[i].num_bytes);
>  			idx += req->u.i2c_read.transactions[i].num_bytes;
>  
> -			buf[idx] = (req-
> >u.i2c_read.transactions[i].no_stop_bit & 0x1) << 5;
> +			buf[idx] = (req-
> >u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
>  			buf[idx] |= (req-
> >u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
>  			idx++;
>  		}
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
