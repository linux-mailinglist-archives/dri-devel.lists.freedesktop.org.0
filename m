Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00E9568E7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5810E228;
	Mon, 19 Aug 2024 11:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZtFojIbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAFB10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:05:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f040733086so40571371fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 04:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724065524; x=1724670324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GKKm+dU6SVHkBgoCKr/zV4NwcivBJUY+FtPwZzVSqw=;
 b=ZtFojIbZVQJjRYmNjgG3FLQhkztX9kHV2g9mqJ7tGRZ32SBxj8R7e3YAph08Sia7IT
 AtAM3ngDiq2YuXseJl5r4gUaBpM4SVLZ1LR26CXizItyh++FWTwpHrvj4CqURE1eAdsf
 9Ma6YBRSaUMvSKYBr+XQmwPYT97tjl0ujzQMcUnFOEDDJHUULteyGrrmhvaP0+IA8zLX
 7THTO3uftezMlNVymLldkvvCocbUy0cYSLBD7K39PcNzjc1/wVnnwIzuhGLjPBE9RnpV
 AoYUU9mZURByfGvsqGElTjVAPwgwJivT/OAp6dP2RzgBfIYfl5ei5FPuQ4risrHDBv+D
 4ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724065524; x=1724670324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GKKm+dU6SVHkBgoCKr/zV4NwcivBJUY+FtPwZzVSqw=;
 b=vYmUpSySe2o1CMPIfkzKpTMyl+IayuiWPpI+pX3k9gIU6UNVvHutKsQ08j1NosuLiY
 5+twRoHaPxjQKr16IrnG43UkFEf42nmBtKog0mQdCnS2+n5axzWuZCkMOIYADi+gDXbq
 rcWGHnaJTItIRtsGYz/voDypqjTAdbCZnbcrx99f8ygvGNiMWkOMTYqRkAfN/ytrlaO2
 bwxcc4P1w8P2RnKVVDDHga011NKdNAcO01S/aJr+61BzvOK9qaV6m84JrAXpq58iV3Tb
 bKHfrAYDOd/CEZ7+u7M1COU4dd6kVPd8g0hvoGWrbUKzgDNJFJwM187lo1aiy1gsgkfb
 LiQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHhS+SUBYCWOe4o/yRm9ee8r3jMOTD1dQABrXPwgbld2qa6ZF4PQisgPlvZ3Dd6ALlhK0T7osCnPacNG6GQL5bm4A7Af3NG+Q1NymTbnT8
X-Gm-Message-State: AOJu0YzCInqt+XQq7V6Yd38zQZzXFxd/68AFmbv3qQfyVvSTfZohH5iQ
 /nRLnLSJ9C7bBXbh933LTtiCPwIXqi2Po+u3h6XUp6UDai8yCNbnh7TwtByuEe8=
X-Google-Smtp-Source: AGHT+IGf2FkI4PTf0HI3qQ0GTFLUvKflNup23gG8mIVq5KoTneAB/KvoRymkEJG8OegkKgg1MMQtuA==
X-Received: by 2002:a2e:70a:0:b0:2ef:2f77:e577 with SMTP id
 38308e7fff4ca-2f3be597704mr62660931fa.27.1724065523674; 
 Mon, 19 Aug 2024 04:05:23 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::676e? ([2a02:8109:aa0d:be00::676e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7fa52sm5482545a12.73.2024.08.19.04.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 04:05:23 -0700 (PDT)
Message-ID: <ed270718-63ef-4484-9856-0ff488e01b98@linaro.org>
Date: Mon, 19 Aug 2024 13:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Add support for multiple PD from one
 process
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
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

Hi Ekansh,

On 08/08/2024 12:42, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.

A test tool to validate this fix and prevent it regressing in the future 
would be a good addition here.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>    - Reformatted commit text.
>    - Moved from ida to idr.
>    - Changed dsp_pgid data type.
>    - Resolved memory leak.
> Changes in v3:
>    - Modified commit text.
>    - Removed idr implementation.
>    - Using session index for client id.
> 
>   drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..0ce1eedcb2c3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,6 +38,7 @@
>   #define FASTRPC_INIT_HANDLE	1
>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>   #define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CLIENTID_MASK (16)
>   #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>   #define INIT_FILE_NAMELEN_MAX (128)
>   #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -298,7 +299,7 @@ struct fastrpc_user {
>   	struct fastrpc_session_ctx *sctx;
>   	struct fastrpc_buf *init_mem;
>   
> -	int tgid;
> +	int client_id;
>   	int pd;
>   	bool is_secure_dev;
>   	/* Lock for lists */
> @@ -613,7 +614,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>   	ctx->sc = sc;
>   	ctx->retval = -1;
>   	ctx->pid = current->pid;
> -	ctx->tgid = user->tgid;
> +	ctx->tgid = user->client_id;
>   	ctx->cctx = cctx;
>   	init_completion(&ctx->work);
>   	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
> @@ -1111,7 +1112,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>   	int ret;
>   
>   	cctx = fl->cctx;
> -	msg->pid = fl->tgid;
> +	msg->pid = fl->client_id;
>   	msg->tid = current->pid;
>   
>   	if (kernel)
> @@ -1294,7 +1295,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   		}
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = init.namelen;
>   	inbuf.pageslen = 0;
>   	fl->pd = USER_PD;
> @@ -1396,7 +1397,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   		goto err;
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = strlen(current->comm) + 1;
>   	inbuf.filelen = init.filelen;
>   	inbuf.pageslen = 1;
> @@ -1470,8 +1471,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   }
>   
>   static struct fastrpc_session_ctx *fastrpc_session_alloc(
> -					struct fastrpc_channel_ctx *cctx)
> +					struct fastrpc_user *fl)
>   {
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>   	struct fastrpc_session_ctx *session = NULL;
>   	unsigned long flags;
>   	int i;
> @@ -1481,6 +1483,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>   		if (!cctx->session[i].used && cctx->session[i].valid) {
>   			cctx->session[i].used = true;
>   			session = &cctx->session[i];
> +			fl->client_id = FASTRPC_CLIENTID_MASK | i;
>   			break;
>   		}
>   	}
> @@ -1505,7 +1508,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>   	int tgid = 0;
>   	u32 sc;
>   
> -	tgid = fl->tgid;
> +	tgid = fl->client_id;
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
>   	args[0].length = sizeof(tgid);
>   	args[0].fd = -1;
> @@ -1580,11 +1583,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	INIT_LIST_HEAD(&fl->maps);
>   	INIT_LIST_HEAD(&fl->mmaps);
>   	INIT_LIST_HEAD(&fl->user);
> -	fl->tgid = current->tgid;
>   	fl->cctx = cctx;
>   	fl->is_secure_dev = fdevice->secure;
>   
> -	fl->sctx = fastrpc_session_alloc(cctx);
> +	fl->sctx = fastrpc_session_alloc(fl);
>   	if (!fl->sctx) {
>   		dev_err(&cctx->rpdev->dev, "No session available\n");
>   		mutex_destroy(&fl->mutex);
> @@ -1648,7 +1650,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   {
>   	struct fastrpc_invoke_args args[1];
> -	int tgid = fl->tgid;
> +	int tgid = fl->client_id;
>   	u32 sc;
>   
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
> @@ -1804,7 +1806,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>   	int err;
>   	u32 sc;
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.size = buf->size;
>   	req_msg.vaddr = buf->raddr;
>   
> @@ -1890,7 +1892,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.flags = req.flags;
>   	req_msg.vaddr = req.vaddrin;
>   	req_msg.num = sizeof(pages);
> @@ -1980,7 +1982,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>   		return -EINVAL;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.len = map->len;
>   	req_msg.vaddrin = map->raddr;
>   	req_msg.fd = map->fd;
> @@ -2033,7 +2035,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.fd = req.fd;
>   	req_msg.offset = req.offset;
>   	req_msg.vaddrin = req.vaddrin;

-- 
// Caleb (they/them)
