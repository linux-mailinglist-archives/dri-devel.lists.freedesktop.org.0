Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B823A62FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73989C99;
	Mon, 14 Jun 2021 11:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019BB89C1E;
 Mon, 14 Jun 2021 11:05:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EB0uA7119570;
 Mon, 14 Jun 2021 11:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MaJD5A9B6xeqausunSXEyuWpEgwpBA34kUvbiOfSD0A=;
 b=bouDj7kyVf0wmFl0SS7oYH/oy95UuUIYTIHIjOjmnCka3K84wap6I+ORoY6BTsRDi9im
 IU+EJFMc7/Rn8zdtXH+QHgsIS0utMoWStun7rYS1kRUPpi2vC/r2ryI2JYXRfA45LWHz
 Nj6Fpmgkh8YheaqoHBqh18liWsORcGmkZND7tAiT93vKoWsUV/gWL8yta4pKxWENIoUv
 Wf5JKzT/qAvJ8X90HNWP95d+f9S+6A3paL33DqtuT/yeozFlDTA9kY7Jx1DFTeLdhrA4
 ILIVgOmwUPB6Z0qL4SYciP4GG8XjXx9zr4EdW2NSXT8HpUhS2/JRLESjdTvHjtGE8uz6 uQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 394njnu25s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 11:05:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15EB0jMk071987;
 Mon, 14 Jun 2021 11:05:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 394j1t0k7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 11:05:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15EB2D8P075106;
 Mon, 14 Jun 2021 11:05:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 394j1t0k70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 11:05:28 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15EB5RA5027350;
 Mon, 14 Jun 2021 11:05:27 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Jun 2021 04:05:27 -0700
Date: Mon, 14 Jun 2021 14:05:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH] drm/nouveau/core/object: fix double free on error in
 nvkm_ioctl_new()
Message-ID: <20210614110520.GJ10983@kadam>
References: <YMcyzyVyI4N6anBo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMcyzyVyI4N6anBo@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: rFpb49e6eNIG4VY3LLN4MaSY1-lzDWI-
X-Proofpoint-ORIG-GUID: rFpb49e6eNIG4VY3LLN4MaSY1-lzDWI-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10014
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140078
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 01:43:27PM +0300, Dan Carpenter wrote:
> If nvkm_object_init() fails then we should not call nvkm_object_fini()
> because it results in calling object->func->fini(object, suspend) twice.
> Once inside the nvkm_object_init() function and once inside the
> nvkm_object_fini() function.
> 
> Fixes: fbd58ebda9c8 ("drm/nouveau/object: merge with handle")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is something that I spotted while looking for reference counting
> bugs.  I have tried running it, but it does not fix my crashes.  My
> system is basically unusable.  It's something to do with the new version
> of Firefox which triggers the refcount_t underflow, but switching to
> Epiphany doesn't solve the issue either.
> 
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index d777df5a64e6..87c761fb475a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -134,8 +134,8 @@ nvkm_ioctl_new(struct nvkm_client *client,
>  				return 0;
>  			}
>  			ret = -EEXIST;
> +			nvkm_object_fini(object, false);
>  		}
> -		nvkm_object_fini(object, false);
>  	}

Hm...  There is probably another bug here.

drivers/gpu/drm/nouveau/nvkm/core/ioctl.c 
   118          } while (oclass.base.oclass != args->v0.oclass);
   119  
   120          if (oclass.engine) {
   121                  oclass.engine = nvkm_engine_ref(oclass.engine);
   122                  if (IS_ERR(oclass.engine))
   123                          return PTR_ERR(oclass.engine);
   124          }
   125  
   126          ret = oclass.ctor(&oclass, data, size, &object);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   127          nvkm_engine_unref(&oclass.engine);
   128          if (ret == 0) {
   129                  ret = nvkm_object_init(object);
   130                  if (ret == 0) {
   131                          list_add(&object->head, &parent->tree);
   132                          if (nvkm_object_insert(object)) {
   133                                  client->data = object;
   134                                  return 0;
   135                          }
   136                          ret = -EEXIST;
   137                          nvkm_object_fini(object, false);
   138                  }
   139          }
   140  
   141          nvkm_object_del(&object);

This calls .dtor() whether or not .ctor succeeded.

This error handling is written sort of unconventionally, where it checks
for success and has nested success blocks but it's more normal to use
gotos and keep the success path at indent level 1.

	a = alloc();
	if (fail)
		return ret;

	b = alloc();
	if (fail)
		goto free_a;

	c = alloc();
	if (fail)
		goto free_b;

	return 0;

free_b:
	free(b);
free_a:
	free(a);

	return ret;

It looks sort of like this if you highlight the success path vs the
fail path:

	success
	success
		fail
	success
	success
		fail
		fail
	success

Then if you want to read what the function does in the ideal case,
you just read the 1 tab indented code.  Otherwise here we'd have to
add another indent level.

No, wait, we can actually just move the nvkm_object_del() into the curly
braces...  I'll test that out and send the patch if it works.  Probably
I'll send the patch regardless of whether it works or not because I
think it's the right thing to do.  ;)

regards,
dan carpenter



