Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1787CE436
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF2310E406;
	Wed, 18 Oct 2023 17:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B689810E406
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 17:17:29 +0000 (UTC)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B5ACB6606F85;
 Wed, 18 Oct 2023 18:17:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697649448;
 bh=WY+pP9OlyuP26BNqelRDLjbXmJfbzAuEd5bSDqflsdk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DENCtEsM9YjjdWpYINoMtR/NkP2I0g0I7UUYOv5mLWrx3d6Vv/1LlCtWa0uuoz8tq
 NtO/3ORwLldzKUw4ensm3iEjAA12uufitJCJviRmbuHL0r9IDM0Kw5qIRrTuNKMDBg
 VfjLsg8WPPwGCUIyUK0dcRPmnUbVNgn0xCEDnER+Tmzw4jT7zJJ80mFYlnXKG2pQcx
 uef8h2z4jsZke3YeHffdmRzmy77LLXtTBDvfVIsKVhg6oH0MhdYRtfVyEE2KNcZJ/R
 XBTcP6moNUkyQxSXeNQEgjXFdXsAFkhGumo5csK5vUbgQKVTyPNs99s2Mrs2CqyEY/
 1TBK2nTUMFskg==
Message-ID: <e6438c8b-bf13-baa2-f1d5-3a6c2a6aa106@collabora.com>
Date: Wed, 18 Oct 2023 20:17:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] drm/uapi: add explicit virtgpu context debug name
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20231018170425.564-1-gurchetansingh@chromium.org>
 <20231018170425.564-2-gurchetansingh@chromium.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231018170425.564-2-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/23 20:04, Gurchetan Singh wrote:
> +
> +			ret = strncpy_from_user(vfpriv->debug_name,
> +						u64_to_user_ptr(value),
> +						DEBUG_NAME_MAX_LEN);
> +
> +			if (ret < 0) {
> +				ret = -EFAULT;
> +				goto out_unlock;
> +			}
> +
> +			/*
> +			 * strncpy_from_user doesn't copy the NULL terminator when
> +			 * DEBUG_NAME_MAX_LEN bytes is copied. Fix that here.
> +			 */
> +			if (ret == DEBUG_NAME_MAX_LEN)
> +				vfpriv->debug_name[DEBUG_NAME_MAX_LEN - 1] = '\0';

If you'll copy DEBUG_NAME_MAX_LEN-1 bytes, then string will be always
NULL-terminated. It is a standard practice for strncpy usage to do it
like this:

	ret = strncpy_from_user(vfpriv->debug_name,
				u64_to_user_ptr(value),
				DEBUG_NAME_MAX_LEN - 1);
-- 
Best regards,
Dmitry

