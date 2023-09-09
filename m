Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29959799A1A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 18:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B646F10E2B0;
	Sat,  9 Sep 2023 16:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401710E2AF;
 Sat,  9 Sep 2023 16:55:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 621BA66071B8;
 Sat,  9 Sep 2023 17:55:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694278519;
 bh=dKtk73ZT0pcNGT6g3E7c30R7E3jSIaoFBSnUeTZpwm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b1O26PzGfPwbW1mpkfbRRFbH82IRcDrnH7mnXSkh1793vzHY7z6U2EuPSy66NWEBu
 tjkAjIOLzO4SWkeJoo1D+NKm2IRCkeKEm3jNI72Nnbm9pDmDxTDUwGUu1zLw3ZuylL
 RFNm+DT5jjW/gqjcUwJsSVBRHvbgvF40EgDZQMTEKvWFHGn1YJIReja1VvxtQySzUS
 HuIx+a+SJFo+fLrqNixO5WLhjdOPQi7jFXEcHUCZ0FEyes9c8tjFMExxFh7RS9cU5n
 LRKq4S08U0Wbj6lMGHrduFJYHz7UjlAdfh3RfVnHW2EsMlxaVgZh3MEsjtzc9mp8qg
 nYnfoZE+aPgYQ==
Date: Sat, 9 Sep 2023 17:55:17 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 8/8] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <dgo4x2tbdqvpfjf7cnspq2xvvkacc7pv2rdk5fesrqcv2xr3pi@mbwmqsg742hu>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-9-adrian.larumbe@collabora.com>
 <20230906101101.04f4e1a2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230906101101.04f4e1a2@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.09.2023 10:11, Boris Brezillon wrote:
>On Tue,  5 Sep 2023 19:45:24 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> The current implementation will try to pick the highest available size
>> display unit as soon as the BO size exceeds that of the previous
>> multiplier.
>> 
>> By selecting a higher threshold, we could show more accurate size numbers.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_file.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 762965e3d503..0b5fbd493e05 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -879,7 +879,7 @@ static void print_size(struct drm_printer *p, const char *stat,
>>  	unsigned u;
>>  
>>  	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> -		if (sz < SZ_1K)
>> +		if (sz < (SZ_1K * 10000))
>>  			break;
>
>This threshold looks a bit random. How about picking a unit that allows
>us to print the size with no precision loss?
>
>	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>		if (sz & (SZ_1K - 1))
>			break;
>	}

In this case I picked up on Rob Clark's suggestion of choosing a hard limit of
perhaps 10k or 100k times the current unit before moving on to the next one.
While this approach guarantees that we don't lose precision, it would render a
tad too long a number in KiB for BO's that aren't a multiple of a MiB.

>>  		sz = div_u64(sz, SZ_1K);
>>  	}
