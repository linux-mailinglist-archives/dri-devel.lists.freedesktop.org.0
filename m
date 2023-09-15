Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907B7A26D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 21:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26F610E677;
	Fri, 15 Sep 2023 19:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 15 Sep 2023 19:02:47 UTC
Received: from omta34.uswest2.a.cloudfilter.net
 (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F610E679
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 19:02:47 +0000 (UTC)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
 by cmsmtp with ESMTP
 id hCX9q9Jf1OzKlhDydqHQ1a; Fri, 15 Sep 2023 18:55:39 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id hDycqYBWxnxNghDydq273q; Fri, 15 Sep 2023 18:55:39 +0000
X-Authority-Analysis: v=2.4 cv=PrSA0iA3 c=1 sm=1 tr=0 ts=6504a8ab
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=nsourIgpG9fxkvA2dtoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+yyGAcG5aiTScB77D4ddFEWmEpNCxP+1ch2FK/sWkJ0=; b=ETgwp8I05RAqPuPQc4BXIeQdas
 poD6RrPDUERgRHEOLDgnob4I/CZHf87fcXS2PHWfcOv6GWIEq0hRNLD0su8PhviEzdydO04TDjONT
 fXqTcLkECnqQi/9V5EQBbCkiqR7b6zjbYxT2a/uGOSjDLj+nXfzvJ/SSBnPGI8UMJlQy8VUJXzQuQ
 +OwM82uOjao5Gq2BsIdBlWwZ1m+OZ3uZmDVpzy2iviGrj+QZBj2VwiI685vz9nbvMlXIQby4qKEpL
 Y+sEOnH9sbROA11BaxVG38uZvqgV7AJQtVCGvv95r3b2k1HN6/wyIz13XFMuVNXvgqmd5dRrpOhnc
 ojOPuljw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:55148
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gustavo@embeddedor.com>) id 1qhDyc-000xBv-07;
 Fri, 15 Sep 2023 13:55:38 -0500
Message-ID: <df8f30c2-7a94-110d-cc99-876979ec28c3@embeddedor.com>
Date: Fri, 15 Sep 2023 12:56:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][next] drm/gud: Use size_add() in call to struct_size()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <ZQSlyHKPdw/zsy4c@work> <202309151150.74DBDCA039@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202309151150.74DBDCA039@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhDyc-000xBv-07
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
 [187.162.21.192]:55148
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCjD+GRfpwfJBFmjF15c/Lzqwj9gzId6CaFkd+2IRBtri77MG6Gcf8xxgrxL6mIYarbDNECv0lE8fN9el0bInl+PRKenGGfIA6WVxYTsUkqPVfe8tvi1
 BHrzr+KTvY65VxIOP1RZcxyfeKXpGIUxkkmgwK/NKLQ7eeWbT0Keax5nU/bItuw3gN50jbWKraPLXoczdJDYPSqMwrU3cHPCCNoh8+HzNs/LQo3dqZmyOoaR
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-hardening@vger.kernel.org, Peter Stuge <peter@stuge.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/15/23 12:52, Kees Cook wrote:
> On Fri, Sep 15, 2023 at 12:43:20PM -0600, Gustavo A. R. Silva wrote:
>> If, for any reason, the open-coded arithmetic causes a wraparound, the
>> protection that `struct_size()` adds against potential integer overflows
>> is defeated. Fix this by hardening call to `struct_size()` with `size_add()`.
>>
>> Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
>> index d2f199ea3c11..a02f75be81f0 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -503,7 +503,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>>   		return -ENOENT;
>>   
>>   	len = struct_size(req, properties,
>> -			  GUD_PROPERTIES_MAX_NUM + GUD_CONNECTOR_PROPERTIES_MAX_NUM);
>> +			  size_add(GUD_PROPERTIES_MAX_NUM, GUD_CONNECTOR_PROPERTIES_MAX_NUM));
> 
> There are both constant expressions, so there's not too much value in
> wrapping them with size_add(), but for maintaining a common coding style
> for dealing with allocation sizes, I can be convinced of the change. :)

Yep; I've found a mix of constant expressions and variables doing open-coded arithmetic
in `struct_size()`, so I'm sending them all.

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!
--
Gustavo

> 
> 
>>   	req = kzalloc(len, GFP_KERNEL);
>>   	if (!req)
>>   		return -ENOMEM;
>> -- 
>> 2.34.1
>>
> 
