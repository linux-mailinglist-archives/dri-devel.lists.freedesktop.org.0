Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC198D31
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5B6EA76;
	Thu, 22 Aug 2019 08:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EAF6E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 19:09:12 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id h192so844912vka.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRr5misk3qFyDi7M5W2djJTMovYjjhN/k10TN+Z5Wkw=;
 b=LJmotab57BglMP+DIu0ftK/qkLl1qytrminaktKH1azXXoxoZDqmp4QrgJd+hnSyCY
 c/AqS8dhqxRi09oah4xe7aJ1kq1sk3rwE8TJh/Va6Y8faJqmxMlLwwvtzk546lwSRtHJ
 ybvFQNxbXLTAbVtN5MYcEWDAh08KSOKV/OMRgQ8dYMpe9mCvjolgzm5zA4tqonTJU7Kc
 fA6DOgdwvYG/JZ4lwSfXvFSNXWwX4dycv7ceI4ywMwffklwXzBXbxVybQW1uJBHXIjvh
 5qcVw574UsAChmjnjTFqUN5pRbPR3+yGrEc+VOWP3Wghsdm0GOA0CemzpbZfobK2bZKq
 qX7Q==
X-Gm-Message-State: APjAAAX5qoQvCHcCL1ah+AhLczVot3uUeiz4GSK+Ml3u+9YSgUpvFh+R
 V17KPpe69gMWEEm5y900bAJlyGcFHogPondoSqCnWA==
X-Google-Smtp-Source: APXvYqz1xulKDRW7dRZ3jvapw34PyBv1LuSf8l6aT6Z9A06N7T23621pQr7cQTw04jQMpVm0NsTYIfm+XfsupbBcCsE=
X-Received: by 2002:a1f:fc0a:: with SMTP id a10mr13143546vki.21.1566414551072; 
 Wed, 21 Aug 2019 12:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190325202250.212801-1-yuzhao@google.com>
In-Reply-To: <20190325202250.212801-1-yuzhao@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 21 Aug 2019 13:09:00 -0600
Message-ID: <CAOUHufZLPbrsNOK2P0jG55rA9z4wPkaEkiQjHiUq6cyVJnaAxw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: properly unmap dma page upon failure
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Junwei Zhang <Jerry.Zhang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HRr5misk3qFyDi7M5W2djJTMovYjjhN/k10TN+Z5Wkw=;
 b=qxsJyE2RseatZKJsj8JAc7LdSC0GrqQOqW/Wh/bLKIgsByDPsZXjoftQqHXQRobDQ3
 fq6bdKI9nfGLOjnJrxKQJNrMPOW17jpDZpjxLfXNNn1RgyUhkUgn6ynHPICoqWwCY4Nb
 W1uFCYzLB2CgLUnyxiWKgE69BTxxKExn470B5Tb75QRFjZoiX688oZ7bzTxGlVrsSylN
 tj90wWgup4r2ViROjITurGMrUMdMsgMV9r/CLSSlgPmE3zL3/mc+isW84sX/vB0dBgmE
 /D7wwKB7MIti2BIgEuU6kENnsV7acuwGI6atuA3kz3PUHF2DgCDiLyU59UXau7wsQenF
 Hl+A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2125580254=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2125580254==
Content-Type: multipart/alternative; boundary="000000000000e3ba0c0590a54e7e"

--000000000000e3ba0c0590a54e7e
Content-Type: text/plain; charset="UTF-8"

Probably my previous emails went into the spam folder. Another friendly
reminder using web version of my Gmail. Thank you.

On Mon, Mar 25, 2019 at 2:22 PM Yu Zhao <yuzhao@google.com> wrote:

> dma_unmap_page() must be called with exactly the same dma address
> and size returned by dma_map_page(). Otherwise, the function may
> fail.
>
> This is at least the case for debug_dma_unmap_page() and AMD iommu
> unmap_page callback.
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  drivers/gpu/drm/ttm/ttm_page_alloc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> index f841accc2c00..c1636595f63c 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> @@ -1118,10 +1118,19 @@ int ttm_populate_and_map_pages(struct device *dev,
> struct ttm_dma_tt *tt,
>                                                   0, num_pages * PAGE_SIZE,
>                                                   DMA_BIDIRECTIONAL);
>                 if (dma_mapping_error(dev, tt->dma_address[i])) {
> +                       num_pages = 1;
>                         while (i--) {
> +                               if (i && tt->ttm.pages[i] -
> +                                        tt->ttm.pages[i - 1] == 1) {
> +                                       tt->dma_address[i] = 0;
> +                                       num_pages++;
> +                                       continue;
> +                               }
>                                 dma_unmap_page(dev, tt->dma_address[i],
> -                                              PAGE_SIZE,
> DMA_BIDIRECTIONAL);
> +                                              num_pages * PAGE_SIZE,
> +                                              DMA_BIDIRECTIONAL);
>                                 tt->dma_address[i] = 0;
> +                               num_pages = 1;
>                         }
>                         ttm_pool_unpopulate(&tt->ttm);
>                         return -EFAULT;
> --
> 2.21.0.392.gf8f6787159e-goog
>
>

--000000000000e3ba0c0590a54e7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5Qcm9iYWJseSBteSBwcmV2aW91cyBlbWFpbHMgd2VudCBpbnRv
IHRoZSBzcGFtIGZvbGRlci4gQW5vdGhlciBmcmllbmRseTwvZGl2PjxkaXY+cmVtaW5kZXIgdXNp
bmcgd2ViIHZlcnNpb24gb2YgbXkgR21haWwuIFRoYW5rIHlvdS7CoDwvZGl2Pjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1v
biwgTWFyIDI1LCAyMDE5IGF0IDI6MjIgUE0gWXUgWmhhbyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnl1
emhhb0Bnb29nbGUuY29tIj55dXpoYW9AZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+ZG1hX3VubWFwX3BhZ2UoKSBtdXN0IGJlIGNhbGxlZCB3aXRoIGV4YWN0bHkgdGhl
IHNhbWUgZG1hIGFkZHJlc3M8YnI+DQphbmQgc2l6ZSByZXR1cm5lZCBieSBkbWFfbWFwX3BhZ2Uo
KS4gT3RoZXJ3aXNlLCB0aGUgZnVuY3Rpb24gbWF5PGJyPg0KZmFpbC48YnI+DQo8YnI+DQpUaGlz
IGlzIGF0IGxlYXN0IHRoZSBjYXNlIGZvciBkZWJ1Z19kbWFfdW5tYXBfcGFnZSgpIGFuZCBBTUQg
aW9tbXU8YnI+DQp1bm1hcF9wYWdlIGNhbGxiYWNrLjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6
IFl1IFpoYW8gJmx0OzxhIGhyZWY9Im1haWx0bzp5dXpoYW9AZ29vZ2xlLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnl1emhhb0Bnb29nbGUuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYyB8IDExICsrKysrKysrKystPGJyPg0KwqAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKTxicj4NCjxicj4NCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmM8YnI+DQppbmRleCBmODQxYWNjYzJjMDAuLmMx
NjM2NTk1ZjYzYyAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdl
X2FsbG9jLmM8YnI+DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmM8
YnI+DQpAQCAtMTExOCwxMCArMTExOCwxOSBAQCBpbnQgdHRtX3BvcHVsYXRlX2FuZF9tYXBfcGFn
ZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdHRtX2RtYV90dCAqdHQsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgMCwgbnVtX3BhZ2VzICogUEFHRV9TSVpFLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIERNQV9CSURJUkVDVElPTkFMKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAo
ZG1hX21hcHBpbmdfZXJyb3IoZGV2LCB0dC0mZ3Q7ZG1hX2FkZHJlc3NbaV0pKSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnVtX3BhZ2VzID0gMTs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3aGlsZSAoaS0tKSB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGkgJmFtcDsmYW1w
OyB0dC0mZ3Q7dHRtLnBhZ2VzW2ldIC08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHQtJmd0O3R0bS5wYWdlc1tpIC0gMV0g
PT0gMSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHR0LSZndDtkbWFfYWRkcmVzc1tpXSA9IDA7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnVtX3Bh
Z2VzKys7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29udGludWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGRtYV91bm1hcF9wYWdlKGRldiwgdHQtJmd0O2RtYV9hZGRyZXNz
W2ldLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBQQUdFX1NJWkUsIERNQV9CSURJUkVDVElPTkFMKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgbnVtX3BhZ2VzICogUEFHRV9TSVpFLDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBE
TUFfQklESVJFQ1RJT05BTCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgdHQtJmd0O2RtYV9hZGRyZXNzW2ldID0gMDs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudW1fcGFnZXMgPSAxOzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0dG1fcG9vbF91bnBvcHVsYXRlKCZhbXA7dHQtJmd0O3R0
bSk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIC1FRkFV
TFQ7PGJyPg0KLS0gPGJyPg0KMi4yMS4wLjM5Mi5nZjhmNjc4NzE1OWUtZ29vZzxicj4NCjxicj4N
CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--000000000000e3ba0c0590a54e7e--

--===============2125580254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2125580254==--
