Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35F305FFA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 16:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22C56E848;
	Wed, 27 Jan 2021 15:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76D706E848
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9ECEC2A6045;
 Wed, 27 Jan 2021 16:45:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HntMSI7mAJsm; Wed, 27 Jan 2021 16:45:29 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 120322A6016;
 Wed, 27 Jan 2021 16:45:29 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1l4n0Z-000reN-Uo; Wed, 27 Jan 2021 16:45:27 +0100
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ray.huang@amd.com, daniel@ffwll.ch
References: <20210113131325.223511-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
Message-ID: <480d0a20-d64b-0837-6571-5af08080aa2a@daenzer.net>
Date: Wed, 27 Jan 2021 16:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113131325.223511-1-christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="------------C1146B14D200CC12F17F2E47"
Content-Language: en-CA
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------C1146B14D200CC12F17F2E47
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2021-01-13 2:13 p.m., Christian König wrote:
> The only flag we really need is __GFP_NOMEMALLOC, highmem depends on
> dma32 and moveable/compound should never be set in the first place.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8cd776adc592..11e0313db0ea 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -79,12 +79,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   	struct page *p;
>   	void *vaddr;
>   
> -	if (order) {
> -		gfp_flags |= GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
> +	/* Don't set the __GFP_COMP flag for higher order allocations.
> +	 * Mapping pages directly into an userspace process and calling
> +	 * put_page() on a TTM allocated page is illegal.
> +	 */
> +	if (order)
> +		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY |
>   			__GFP_KSWAPD_RECLAIM;
> -		gfp_flags &= ~__GFP_MOVABLE;
> -		gfp_flags &= ~__GFP_COMP;
> -	}
>   
>   	if (!pool->use_dma_alloc) {
>   		p = alloc_pages(gfp_flags, order);
> 

I picked up this change today, and got the attached splat while running 
piglit.

scripts/faddr2line drivers/gpu/drm/ttm/ttm.ko ttm_pool_alloc+0x2e4/0x5e0

gives:

ttm_pool_alloc+0x2e4/0x5e0:
  alloc_pages at /home/daenzer/src/linux-git/linux/./include/linux/gfp.h:547

(inlined by) ttm_pool_alloc_page at 
/home/daenzer/src/linux-git/linux/drivers/gpu/drm//ttm/ttm_pool.c:91

(inlined by) ttm_pool_alloc at 
/home/daenzer/src/linux-git/linux/drivers/gpu/drm//ttm/ttm_pool.c:398



I suspect we need __GFP_NOWARN as well to avoid these splats.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer

--------------C1146B14D200CC12F17F2E47
Content-Type: text/plain; charset=UTF-8;
 name="splat.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="splat.txt"

WyA5NTU2LjcxMDI0MV0gY2xpbmZvOiBwYWdlIGFsbG9jYXRpb24gZmFpbHVyZTogb3JkZXI6
OSwgbW9kZToweDE5NGRjMihHRlBfSElHSFVTRVJ8X19HRlBfUkVUUllfTUFZRkFJTHxfX0dG
UF9OT1JFVFJZfF9fR0ZQX1pFUk98X19HRlBfTk9NRU1BTExPQyksIG5vZGVtYXNrPShudWxs
KSxjcHVzZXQ9dXNlci5zbGljZSxtZW1zX2FsbG93ZWQ9MApbIDk1NTYuNzEwMjU5XSBDUFU6
IDEgUElEOiA0NzA4MjEgQ29tbTogY2xpbmZvIFRhaW50ZWQ6IEcgICAgICAgICAgICBFICAg
ICA1LjEwLjEwKyAjNApbIDk1NTYuNzEwMjY0XSBIYXJkd2FyZSBuYW1lOiBNaWNyby1TdGFy
IEludGVybmF0aW9uYWwgQ28uLCBMdGQuIE1TLTdBMzQvQjM1MCBUT01BSEFXSyAoTVMtN0Ez
NCksIEJJT1MgMS5PUiAxMS8yOS8yMDE5ClsgOTU1Ni43MTAyNjhdIENhbGwgVHJhY2U6Clsg
OTU1Ni43MTAyODFdICBkdW1wX3N0YWNrKzB4NmIvMHg4MwpbIDk1NTYuNzEwMjg4XSAgd2Fy
bl9hbGxvYy5jb2xkKzB4N2IvMHhkZgpbIDk1NTYuNzEwMjk3XSAgPyBfX2FsbG9jX3BhZ2Vz
X2RpcmVjdF9jb21wYWN0KzB4MTM3LzB4MTUwClsgOTU1Ni43MTAzMDNdICBfX2FsbG9jX3Bh
Z2VzX3Nsb3dwYXRoLmNvbnN0cHJvcC4wKzB4YzFiLzB4YzUwClsgOTU1Ni43MTAzMTJdICBf
X2FsbG9jX3BhZ2VzX25vZGVtYXNrKzB4MmVjLzB4MzIwClsgOTU1Ni43MTAzMjVdICB0dG1f
cG9vbF9hbGxvYysweDJlNC8weDVlMCBbdHRtXQpbIDk1NTYuNzEwMzMyXSAgPyBrdm1hbGxv
Y19ub2RlKzB4NDYvMHg4MApbIDk1NTYuNzEwMzQxXSAgdHRtX3R0X3BvcHVsYXRlKzB4Mzcv
MHhlMCBbdHRtXQpbIDk1NTYuNzEwMzUwXSAgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbSsweDE0
Mi8weDE4MCBbdHRtXQpbIDk1NTYuNzEwMzU5XSAgdHRtX2JvX3ZhbGlkYXRlKzB4MTFkLzB4
MTkwIFt0dG1dClsgOTU1Ni43MTAzOTFdICA/IGRybV92bWFfb2Zmc2V0X2FkZCsweDJmLzB4
NjAgW2RybV0KWyA5NTU2LjcxMDM5OV0gIHR0bV9ib19pbml0X3Jlc2VydmVkKzB4MmE3LzB4
MzIwIFt0dG1dClsgOTU1Ni43MTA1MjldICBhbWRncHVfYm9fZG9fY3JlYXRlKzB4MWI4LzB4
NTAwIFthbWRncHVdClsgOTU1Ni43MTA2NTddICA/IGFtZGdwdV9ib19zdWJ0cmFjdF9waW5f
c2l6ZSsweDYwLzB4NjAgW2FtZGdwdV0KWyA5NTU2LjcxMDY2M10gID8gZ2V0X3BhZ2VfZnJv
bV9mcmVlbGlzdCsweDExZjkvMHgxNDUwClsgOTU1Ni43MTA3ODldICBhbWRncHVfYm9fY3Jl
YXRlKzB4NDAvMHgyNzAgW2FtZGdwdV0KWyA5NTU2LjcxMDc5N10gID8gX3Jhd19zcGluX3Vu
bG9jaysweDE2LzB4MzAKWyA5NTU2LjcxMDkyN10gIGFtZGdwdV9nZW1fY3JlYXRlX2lvY3Rs
KzB4MTIzLzB4MzEwIFthbWRncHVdClsgOTU1Ni43MTEwNjJdICA/IGFtZGdwdV9nZW1fZm9y
Y2VfcmVsZWFzZSsweDE1MC8weDE1MCBbYW1kZ3B1XQpbIDk1NTYuNzExMDk4XSAgZHJtX2lv
Y3RsX2tlcm5lbCsweGFhLzB4ZjAgW2RybV0KWyA5NTU2LjcxMTEzM10gIGRybV9pb2N0bCsw
eDIwZi8weDNhMCBbZHJtXQpbIDk1NTYuNzExMjY3XSAgPyBhbWRncHVfZ2VtX2ZvcmNlX3Jl
bGVhc2UrMHgxNTAvMHgxNTAgW2FtZGdwdV0KWyA5NTU2LjcxMTI3Nl0gID8gcHJlZW1wdF9j
b3VudF9zdWIrMHg5Yi8weGQwClsgOTU1Ni43MTE0MDRdICBhbWRncHVfZHJtX2lvY3RsKzB4
NDkvMHg4MCBbYW1kZ3B1XQpbIDk1NTYuNzExNDExXSAgX194NjRfc3lzX2lvY3RsKzB4ODMv
MHhiMApbIDk1NTYuNzExNDE3XSAgZG9fc3lzY2FsbF82NCsweDMzLzB4ODAKWyA5NTU2Ljcx
MTQyMV0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKWyA5NTU2
LjcxMTQyNl0gUklQOiAwMDMzOjB4N2YxNDIxN2JkY2M3ClsgOTU1Ni43MTE0MzFdIENvZGU6
IDAwIDAwIDAwIDQ4IDhiIDA1IGM5IDkxIDBjIDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAwIDQ4
IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4
IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIg
MGQgOTkgOTEgMGMgMDAgZjcgZDggNjQgODkgMDEgNDgKWyA5NTU2LjcxMTQzNF0gUlNQOiAw
MDJiOjAwMDA3ZmZkOTdiZmRjNjggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAw
MDAwMDAwMDAxMApbIDk1NTYuNzExNDM5XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAw
MDAwN2ZmZDk3YmZkY2MwIFJDWDogMDAwMDdmMTQyMTdiZGNjNwpbIDk1NTYuNzExNDQyXSBS
RFg6IDAwMDA3ZmZkOTdiZmRjYzAgUlNJOiAwMDAwMDAwMGMwMjA2NDQwIFJESTogMDAwMDAw
MDAwMDAwMDAwNgpbIDk1NTYuNzExNDQ1XSBSQlA6IDAwMDAwMDAwYzAyMDY0NDAgUjA4OiAw
MDAwMDAwMDAwMDAwMDA4IFIwOTogMDAwMDdmMTQyMTg4N2JlMApbIDk1NTYuNzExNDQ4XSBS
MTA6IDAwMDA3ZmZkOTdjOWUwODAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDU2
NGRhYjc2MmQyMApbIDk1NTYuNzExNDUwXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDYgUjE0OiAw
MDAwMDAwMDAwMjAwMDAwIFIxNTogMDAwMDAwMDAwMDIwMDAwMApbIDk1NTYuNzExNDg5XSBN
ZW0tSW5mbzoKWyA5NTU2LjcxMTQ5OV0gYWN0aXZlX2Fub246MzI1MyBpbmFjdGl2ZV9hbm9u
OjE0MTQ5NCBpc29sYXRlZF9hbm9uOjAKICAgICAgICAgICAgICAgIGFjdGl2ZV9maWxlOjE4
Nzg3ODAgaW5hY3RpdmVfZmlsZToxNTU4MDY0IGlzb2xhdGVkX2ZpbGU6MzIKICAgICAgICAg
ICAgICAgIHVuZXZpY3RhYmxlOjAgZGlydHk6NjU3MSB3cml0ZWJhY2s6MAogICAgICAgICAg
ICAgICAgc2xhYl9yZWNsYWltYWJsZToxMjM0MDcgc2xhYl91bnJlY2xhaW1hYmxlOjQwOTky
CiAgICAgICAgICAgICAgICBtYXBwZWQ6NjIwOTEgc2htZW06MzgyMSBwYWdldGFibGVzOjM4
MzcgYm91bmNlOjAKICAgICAgICAgICAgICAgIGZyZWU6MjkzNTk2IGZyZWVfcGNwOjY4NCBm
cmVlX2NtYTowClsgOTU1Ni43MTE1MTBdIE5vZGUgMCBhY3RpdmVfYW5vbjoxMzAxMmtCIGlu
YWN0aXZlX2Fub246NTY1OTc2a0IgYWN0aXZlX2ZpbGU6NzUxNTEyMGtCIGluYWN0aXZlX2Zp
bGU6NjIzMjI1NmtCIHVuZXZpY3RhYmxlOjBrQiBpc29sYXRlZChhbm9uKTowa0IgaXNvbGF0
ZWQoZmlsZSk6MTI4a0IgbWFwcGVkOjI0ODM2NGtCIGRpcnR5OjI2Mjg0a0Igd3JpdGViYWNr
OjBrQiBzaG1lbToxNTI4NGtCIHNobWVtX3RocDogMGtCIHNobWVtX3BtZG1hcHBlZDogMGtC
IGFub25fdGhwOiAxNzYxMjhrQiB3cml0ZWJhY2tfdG1wOjBrQiBrZXJuZWxfc3RhY2s6MTE0
NzJrQiBhbGxfdW5yZWNsYWltYWJsZT8gbm8KWyA5NTU2LjcxMTUxOF0gTm9kZSAwIERNQSBm
cmVlOjEzODM2a0IgbWluOjY0a0IgbG93Ojgwa0IgaGlnaDo5NmtCIHJlc2VydmVkX2hpZ2hh
dG9taWM6MEtCIGFjdGl2ZV9hbm9uOjBrQiBpbmFjdGl2ZV9hbm9uOjBrQiBhY3RpdmVfZmls
ZTowa0IgaW5hY3RpdmVfZmlsZTowa0IgdW5ldmljdGFibGU6MGtCIHdyaXRlcGVuZGluZzow
a0IgcHJlc2VudDoxNTk5NmtCIG1hbmFnZWQ6MTU4ODRrQiBtbG9ja2VkOjBrQiBwYWdldGFi
bGVzOjBrQiBib3VuY2U6MGtCIGZyZWVfcGNwOjBrQiBsb2NhbF9wY3A6MGtCIGZyZWVfY21h
OjBrQgpbIDk1NTYuNzExNTMwXSBsb3dtZW1fcmVzZXJ2ZVtdOiAwIDM0NTUgMTU5MTYgMTU5
MTYgMTU5MTYKWyA5NTU2LjcxMTU2MV0gTm9kZSAwIERNQTMyIGZyZWU6OTYwOTEya0IgbWlu
OjE0NjU2a0IgbG93OjE4MzIwa0IgaGlnaDoyMTk4NGtCIHJlc2VydmVkX2hpZ2hhdG9taWM6
MEtCIGFjdGl2ZV9hbm9uOjBrQiBpbmFjdGl2ZV9hbm9uOjQxMjhrQiBhY3RpdmVfZmlsZTox
NDc2OTg0a0IgaW5hY3RpdmVfZmlsZTo4ODU4ODRrQiB1bmV2aWN0YWJsZTowa0Igd3JpdGVw
ZW5kaW5nOjEwNzQ0a0IgcHJlc2VudDozNjE2NjEya0IgbWFuYWdlZDozNjE0Mjk2a0IgbWxv
Y2tlZDowa0IgcGFnZXRhYmxlczo5NjhrQiBib3VuY2U6MGtCIGZyZWVfcGNwOjM3MmtCIGxv
Y2FsX3BjcDo0a0IgZnJlZV9jbWE6MGtCClsgOTU1Ni43MTE1NzZdIGxvd21lbV9yZXNlcnZl
W106IDAgMCAxMjQ2MCAxMjQ2MCAxMjQ2MApbIDk1NTYuNzExNTg1XSBOb2RlIDAgTm9ybWFs
IGZyZWU6MTk5Mzg0a0IgbWluOjUyODU2a0IgbG93OjY2MDY4a0IgaGlnaDo3OTI4MGtCIHJl
c2VydmVkX2hpZ2hhdG9taWM6MEtCIGFjdGl2ZV9hbm9uOjEzMDEya0IgaW5hY3RpdmVfYW5v
bjo1NjE4NjhrQiBhY3RpdmVfZmlsZTo2MDM4MzQwa0IgaW5hY3RpdmVfZmlsZTo1MzQ2NTc2
a0IgdW5ldmljdGFibGU6MGtCIHdyaXRlcGVuZGluZzoxNTg0NGtCIHByZXNlbnQ6MTMwOTQ0
MDBrQiBtYW5hZ2VkOjEyNzY4NTU2a0IgbWxvY2tlZDowa0IgcGFnZXRhYmxlczoxNDM4MGtC
IGJvdW5jZTowa0IgZnJlZV9wY3A6MjY0MGtCIGxvY2FsX3BjcDoxMDQ0a0IgZnJlZV9jbWE6
MGtCClsgOTU1Ni43MTE1OTJdIGxvd21lbV9yZXNlcnZlW106IDAgMCAwIDAgMApbIDk1NTYu
NzExNjAwXSBOb2RlIDAgRE1BOiAzKjRrQiAoVSkgNCo4a0IgKFUpIDAqMTZrQiAxKjMya0Ig
KFUpIDMqNjRrQiAoVSkgMCoxMjhrQiAxKjI1NmtCIChVKSAwKjUxMmtCIDEqMTAyNGtCIChV
KSAyKjIwNDhrQiAoVU0pIDIqNDA5NmtCIChNKSA9IDEzODM2a0IKWyA5NTU2LjcxMTYzNl0g
Tm9kZSAwIERNQTMyOiA3MDgxKjRrQiAoVU1FKSAzOTI2KjhrQiAoVU1FKSAxOTMxKjE2a0Ig
KFVNRSkgMTExNTgqMzJrQiAoVU1FKSA1MTk4KjY0a0IgKFVNKSA2MjAqMTI4a0IgKFVNRSkg
MTE1KjI1NmtCIChNRSkgNjIqNTEya0IgKE0pIDQwKjEwMjRrQiAoTSkgMCoyMDQ4a0IgMCo0
MDk2a0IgPSA5NjE4NjBrQgpbIDk1NTYuNzExNjgwXSBOb2RlIDAgTm9ybWFsOiAzODEyKjRr
QiAoVU1FKSA4ODI3KjhrQiAoVU1FKSAyMTMxKjE2a0IgKFVNKSA0ODIqMzJrQiAoVU1FKSAy
MjIqNjRrQiAoVU1FKSAyNDIqMTI4a0IgKFVNKSAzMCoyNTZrQiAoVU0pIDE0KjUxMmtCIChN
KSA2KjEwMjRrQiAoVU0pIDAqMjA0OGtCIDAqNDA5NmtCID0gMjAxNTYwa0IKWyA5NTU2Ljcx
MTcyOV0gMzQ0MTE2MCB0b3RhbCBwYWdlY2FjaGUgcGFnZXMKWyA5NTU2LjcxMTczNF0gNTgy
IHBhZ2VzIGluIHN3YXAgY2FjaGUKWyA5NTU2LjcxMTczOF0gU3dhcCBjYWNoZSBzdGF0czog
YWRkIDkyNTQsIGRlbGV0ZSA4Njc0LCBmaW5kIDQxNS82NTYKWyA5NTU2LjcxMTc0Ml0gRnJl
ZSBzd2FwICA9IDc5ODEzMDhrQgpbIDk1NTYuNzExNzQ1XSBUb3RhbCBzd2FwID0gNzk5OTQ4
NGtCClsgOTU1Ni43MTE3NDhdIDQxODE3NTIgcGFnZXMgUkFNClsgOTU1Ni43MTE3NTJdIDAg
cGFnZXMgSGlnaE1lbS9Nb3ZhYmxlT25seQpbIDk1NTYuNzExNzU1XSA4MjA2OCBwYWdlcyBy
ZXNlcnZlZApbIDk1NTYuNzExNzU3XSAwIHBhZ2VzIGh3cG9pc29uZWQK
--------------C1146B14D200CC12F17F2E47
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------C1146B14D200CC12F17F2E47--
