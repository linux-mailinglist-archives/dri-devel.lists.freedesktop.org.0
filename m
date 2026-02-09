Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBP6BWW2iWlLBAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 11:26:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB810E257
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 11:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386810E3C0;
	Mon,  9 Feb 2026 10:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="d5DsauVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4818110E3C0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 10:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770632797; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=neQq5w3AnZ64MfWEVur+/+3rhJcTuoRJ5x41uDSsoFvPH9W+/neaPVNDSzjpyslmAg0B6da3Iz8GnL6gt5NCitA3EvTuSsTNPt97biNx312IkNeVctPoHZfE2uJ4AkMUhaaaxM1W3z17YaXOfhrbACvAjcKoPhB5lvjkHCaWpuQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770632797;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=02x/gdLJRHUwH7t9cIF1l9xm1RoF2vSTUxxVE4M4YRo=; 
 b=HI/AqjLYhWa0zWbLnxFHk7PCwTGbyeLAlCItmWQ+VnvfkJw0UVt8kbWKNK49mRqa1X8EPPErcLroZHew5kBcXPOhE/we9zHY88jPqsIaOjzaByfmsn5+MVZ0CPq85XikvO8u6v1E53N2SLdD8+wY9GbNz074ov7+z2FRJftCYq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770632797; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=02x/gdLJRHUwH7t9cIF1l9xm1RoF2vSTUxxVE4M4YRo=;
 b=d5DsauVDqiURPEkq1w+1gF3Fxc0SBAf9xoSM1AQunifOHtT1UeaPkoWYy7T8/KRr
 zY3s9G6+tjE4uj0KnpOkRn0a2tmL4KqzLXwfUR9Gb7kq9b2CyyNbGaboI2eSGUJAh2l
 Zua+DFmG03OYPWTSwJ8WILUmd6upVLl9zS10NYmg=
Received: by mx.zohomail.com with SMTPS id 1770632794764537.317878633785;
 Mon, 9 Feb 2026 02:26:34 -0800 (PST)
Message-ID: <87ce7c1f-99b0-4bbd-9b65-6ef541c60ab3@collabora.com>
Date: Mon, 9 Feb 2026 11:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>
References: <20260208224718.57199-1-contact@emersion.fr>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20260208224718.57199-1-contact@emersion.fr>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robert.mader@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:contact@emersion.fr,m:daniels@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robert.mader@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emersion.fr:email]
X-Rspamd-Queue-Id: 4BBB810E257
X-Rspamd-Action: no action

Ouch, god catch, thanks!

I *think* I copy-pasted from DRM_FORMAT_Q401 instead of DRM_FORMAT_Q410 
by mistake. Anyway,

Reviewed-by: Robert Mader <robert.mader@collabora.com>

On 08.02.26 23:47, Simon Ser wrote:
> The short comments had the correct order, but the long comments
> had the planes reversed.
>
> Fixes: 2271e0a20ef7 ("drm: drm_fourcc: add 10/12/16bit software decoder YCbCr formats")
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Cc: Robert Mader <robert.mader@collabora.com>
> ---
>   include/uapi/drm/drm_fourcc.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index ea91aa8afde9..2be461c764f4 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -401,8 +401,8 @@ extern "C" {
>    * implementation can multiply the values by 2^6=64. For that reason the padding
>    * must only contain zeros.
>    * index 0 = Y plane, [15:0] z:Y [6:10] little endian
> - * index 1 = Cr plane, [15:0] z:Cr [6:10] little endian
> - * index 2 = Cb plane, [15:0] z:Cb [6:10] little endian
> + * index 1 = Cb plane, [15:0] z:Cb [6:10] little endian
> + * index 2 = Cr plane, [15:0] z:Cr [6:10] little endian
>    */
>   #define DRM_FORMAT_S010	fourcc_code('S', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>   #define DRM_FORMAT_S210	fourcc_code('S', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
> @@ -414,8 +414,8 @@ extern "C" {
>    * implementation can multiply the values by 2^4=16. For that reason the padding
>    * must only contain zeros.
>    * index 0 = Y plane, [15:0] z:Y [4:12] little endian
> - * index 1 = Cr plane, [15:0] z:Cr [4:12] little endian
> - * index 2 = Cb plane, [15:0] z:Cb [4:12] little endian
> + * index 1 = Cb plane, [15:0] z:Cb [4:12] little endian
> + * index 2 = Cr plane, [15:0] z:Cr [4:12] little endian
>    */
>   #define DRM_FORMAT_S012	fourcc_code('S', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>   #define DRM_FORMAT_S212	fourcc_code('S', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
> @@ -424,8 +424,8 @@ extern "C" {
>   /*
>    * 3 plane YCbCr
>    * index 0 = Y plane, [15:0] Y little endian
> - * index 1 = Cr plane, [15:0] Cr little endian
> - * index 2 = Cb plane, [15:0] Cb little endian
> + * index 1 = Cb plane, [15:0] Cb little endian
> + * index 2 = Cr plane, [15:0] Cr little endian
>    */
>   #define DRM_FORMAT_S016	fourcc_code('S', '0', '1', '6') /* 2x2 subsampled Cb (1) and Cr (2) planes 16 bits per channel */
>   #define DRM_FORMAT_S216	fourcc_code('S', '2', '1', '6') /* 2x1 subsampled Cb (1) and Cr (2) planes 16 bits per channel */

-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

