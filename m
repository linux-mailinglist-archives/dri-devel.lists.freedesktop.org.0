Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F3216772
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125B66E5D2;
	Tue,  7 Jul 2020 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23AC6E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594079410; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NboD0HuCCOCTz3ZvzoSX9hS0Fzn/G2ArNDsjnk2M+qY=;
 b=gEAErzWQGyz4moVpKPHo4splZgegEadql6JwC2qaisrd0+qP+TPB2uI3F+nrFS7tqOgfAR
 MtIT8xWuXZn+f7qSfOMDFerYQy0QG8yZv9gR8Pf+u1KyyrmsfVEQS6PQh+vQvoioabP88Q
 RNGME1GfxlfaYnyFzs/iaQfnFYjzESg=
Date: Tue, 07 Jul 2020 01:49:59 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/dbi: Fix SPI Type 1 (9-bit) transfer
To: Noralf =?iso-8859-1?q?Tr=F8nnes?= <noralf@tronnes.org>
Message-Id: <BJN2DQ.10EODF78DAWA@crapouillou.net>
In-Reply-To: <0dda6b3f-ea8c-6a7e-5c7c-f26874b825c8@tronnes.org>
References: <20200703141341.1266263-1-paul@crapouillou.net>
 <0dda6b3f-ea8c-6a7e-5c7c-f26874b825c8@tronnes.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

Le dim. 5 juil. 2020 =E0 17:58, Noralf Tr=F8nnes <noralf@tronnes.org> a =

=E9crit :
> =

> =

> Den 03.07.2020 16.13, skrev Paul Cercueil:
>>  The function mipi_dbi_spi1_transfer() will transfer its payload as =

>> 9-bit
>>  data, the 9th (MSB) bit being the data/command bit. In order to do =

>> that,
>>  it unpacks the 8-bit values into 16-bit values, then sets the 9th =

>> bit if
>>  the byte corresponds to data, clears it otherwise. The 7 MSB are
>>  padding. The array of now 16-bit values is then passed to the SPI =

>> core
>>  for transfer.
>> =

>>  This function was broken since its introduction, as the length of =

>> the
>>  SPI transfer was set to the payload size before its conversion, but =

>> the
>>  payload doubled in size due to the 8-bit -> 16-bit conversion.
>> =

>>  Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
>>  Cc: <stable@vger.kernel.org> # 4.10
> =

> The code was moved to drm_mipi_dbi.c in 5.4 so this patch won't apply
> before that.

I believe I can submit a patch for pre-5.4 too.

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
> =

> Thanks for fixing this, clearly I didn't test this. Probably because =

> the
> aux spi ip block on the Raspberry Pi that can do 9 bit didn't have a
> driver at the time. Did you actually test this or was it spotted =

> reading
> the code?

I did test it on hardware, yes - that's how I spotted the bug.

-Paul

> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> =

>>   drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> =

>>  diff --git a/drivers/gpu/drm/drm_mipi_dbi.c =

>> b/drivers/gpu/drm/drm_mipi_dbi.c
>>  index bb27c82757f1..bf7888ad9ad4 100644
>>  --- a/drivers/gpu/drm/drm_mipi_dbi.c
>>  +++ b/drivers/gpu/drm/drm_mipi_dbi.c
>>  @@ -923,7 +923,7 @@ static int mipi_dbi_spi1_transfer(struct =

>> mipi_dbi *dbi, int dc,
>>   			}
>>   		}
>> =

>>  -		tr.len =3D chunk;
>>  +		tr.len =3D chunk * 2;
>>   		len -=3D chunk;
>> =

>>   		ret =3D spi_sync(spi, &m);
>> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
