Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622E380BD5
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD36EE98;
	Fri, 14 May 2021 14:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC91F6EE93
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:31:10 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOpIn080853;
 Fri, 14 May 2021 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SHT0PNis77lwJziP68IpS6MihhAlEZSQsq7f8r7VjeI=;
 b=Q037oNWTDoerh9iGbDLb93xKlDTPSX8nxmwJGlAC2MO4JdsN7PAxgvebwT0A4Sd7//Us
 BiA5nUj/yE0jnVnDk3mJzz83bIDKeLiwPKJy4zF/wFzADbNZqW3GbmO9SMtA2AEwCwRc
 V/ctl2+COLT9WUdvpzXqflWQx6sgv1WhLPkclA3f1MYcKXm5sugU5QDo3S9ZCcNu/gN3
 IuCYWdf1jHGJmQx97kvnwJrjhTnVjYtatZbIkQM9t6G8cXn22xz/oPBqH4SUiG0y2k/t
 p2duRpMiAoP62rATB8AoZsizqfnqiJm47uVgStv+BE25HHl2AweZ5OlR5/CpAIJuV7D9 kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38gpnumg1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:31:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOtBG167927;
 Fri, 14 May 2021 14:31:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38gpped2fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:31:03 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EES4Wn008604;
 Fri, 14 May 2021 14:31:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38gpped2er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:31:03 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14EEV1FT004327;
 Fri, 14 May 2021 14:31:01 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 May 2021 07:31:00 -0700
Date: Fri, 14 May 2021 17:30:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/vmwgfx: Fix memory leak of object fifo on
 error return
Message-ID: <20210514143053.GB1955@kadam>
References: <20210512195609.298326-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512195609.298326-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: KkvVC5LyMeuY8x-z0ORunh1kRJP3BOoA
X-Proofpoint-GUID: KkvVC5LyMeuY8x-z0ORunh1kRJP3BOoA
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140117
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 08:56:09PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where fifo->static_buffer fails to be allocated the
> error return path neglects to kfree the fifo object. Fix this by
> adding in the missing kfree.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> index 027d7d504e78..e5fa210f589e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> @@ -107,8 +107,10 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
>  	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);

This needs an:

	if (!fifo)
		return -ENOMEM;

>  	fifo->static_buffer_size = VMWGFX_FIFO_STATIC_SIZE;
>  	fifo->static_buffer = vmalloc(fifo->static_buffer_size);
> -	if (unlikely(fifo->static_buffer == NULL))
> +	if (unlikely(fifo->static_buffer == NULL)) {
> +		kfree(fifo);
>  		return ERR_PTR(-ENOMEM);
> +	}

regards,
dan carpenter

