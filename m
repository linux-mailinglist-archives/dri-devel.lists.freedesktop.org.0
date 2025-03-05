Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F1A5065B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 18:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251710E817;
	Wed,  5 Mar 2025 17:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="cvyNvSK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3062910E817
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741195738; x=1741800538; i=markus.elfring@web.de;
 bh=xtiQKLe0sh2b/5K2i8jzCLuSRfvmaqQV+l/0T1lc8Vc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cvyNvSK7JhyaAmdAq1JK1chrv4QprDbNH6hoqgkxFk1feZ5vTk43BevHf+2nHg9K
 P4A513oALEtWPNcM3qu0e+nvbllCfGkM7nebEo11in/gQk5yLIn+NVp5qqkHJtEd3
 hk9ioe+QSojqxyncq4aHYOYrl3EaoDE4jfcicoQfL0pdV3YgRDf4c55XFOOBMS5aV
 lyISBbosBh22FBqi1F6rcie9MbLYF3PvEaZ92+SsyuHRLQjKkx0CCFE4AqyFPfsJA
 EdU8wM87Mpsr6zG/0BTbnPAJ3zjjCkoewSbCk8EZjOxz1mLDRuKQweZgtro9kpZwR
 Lc+/PXeAze2DjqKTwA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M91Po-1tvx5b3WNS-00H6a9; Wed, 05
 Mar 2025 18:28:57 +0100
Message-ID: <e9372f7e-cefb-4f8a-9dbd-b26baceb0d3a@web.de>
Date: Wed, 5 Mar 2025 18:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: video: au1100fb: Move a variable assignment behind a null pointer
 check in au1100fb_setmode()
To: Helge Deller <deller@gmx.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Antonino Daplas <adaplas@pol.net>, Thomas Zimmermann
 <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
 <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
 <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
 <9d042e6a-6d93-4ae4-8373-28b9dec21867@web.de>
 <81a620bb-205f-45f7-9036-e8e44a8e7be9@gmx.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <81a620bb-205f-45f7-9036-e8e44a8e7be9@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yWGWNO6K9aUNn3g3Qc5ZNkQf3WSZXFZx/7sAlXKN2G2OkmRvkTM
 OOorb9nBJRzzmErR9eJErw6GmksCApLqzMDcyKGuL3v4Qalgpp5Oo9wJ3hULjiXC7J/bBVT
 BDd3SQO+O0DWCKxnpPQhgtzzOvZVrnHen1F1NTITC3WjdS1jKPIEEhHglUQ5+uuk2CmrSEC
 oWIV86XuELAY2ecrMErmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UByq28hN30c=;zVhcrG6+Sh75YoWB+H09FcqgW8Z
 bgunNY71oawVGm5ys86Bfzfb67540oJ+u7DAgmYRadi+0yDuVnhsBjFqkBXS9yWJESCsOSZfU
 4xgJJrykXQYALn4/eCVlRvVAoYzpKDR0SGzMpZFWdB+hFqSpAO7yrjX3O3Y9qUHmGkMPJZCOn
 cTFIhVVjD21fVeX2V2oZ4NbofQkCoa9OX0/KtqN1O7Bj90dOdP7Rhs5955TPCw57vqxdIZINT
 EDxDN7hucnIllSj4HktdwGfvRVzgciVCR/nnoUSB7OeeYt+Qqe9MZEKv8OLs48GVCT2yVXeX2
 +DoXgPQDJlQfvSnXLcULgMhRhpAMRdbT9rw9T49pS3OdLxxzTi5FbYpan4orQAAObc/4Gam+G
 Ck/fSxbbd8JBEAdpATuUUwJr1RRXLv37TQl/9bqMJH+wLx/IauUHcfAQ3ziqYcnSki2F9ziyL
 Q1E4abj3MTZihySUQ4yPtvuNhnQBWWW44B2EiygAOmZaWQIPka5WebAJ7Sjy1T3mrYWjHeFPo
 8CskaPVmU4QL8uazhS0gNgFAcRT0Vi6yjHr5fN7AIktIoGoMgfNaorFcZOUoHWrM8LCsIQBB/
 jfi0OhDkRJMzOo382MpJHfpGv4sF0IDGdXlzlizhUcyT6MISK2mVuDtW2rORZJpYDz8a6Rckl
 +4exgw40+U+PoIQn+Z9XSUokVxe6OlUiROGCTAGJbdpTjWIbLXHDDXg5dvfAUkXlVq9Fv+nVP
 0mSbtQtRFOKIB0qiFYM4bOtxQTqYN3tuPVXu9deUZoo7K5vCP/FWPIPvPxzkLJQNxq3utAaXY
 wy9PW371DMmOIsHCUHKsDtdOGfw2H1lDvs6PB6l8fYLhBVU4dDlPGLgh59oEHyhkFBwPXuW5w
 3DonwIC2P/zQ4cG6tm7VZtlFzxdZ+ye5k9UO0VUYwjYPiNCx8WNRPPjfmSKXhKWFgi3p6N7g5
 IqJNj/mDysSDG7RMaM39tVrMPrcwWZ8z6oGHThg3E5KmK82dUi5vxGn6jZUhz3yu4Fc8XXkof
 x6ZwtZzdVSYWDdsBr/SyXlQ8i+cfKJ6LiyG1jn8hNyWoneUdnXcqWbXMWRD0/s/IIUFN4feVO
 I+Bf45nMJvdMnn/o7rH1XpipM/SL74qzSqCXvBmn8Us6B8Ldb+aijiIzoTFfCBXAwLGwzMSp9
 Zt2uJqzqSrKjv17g8ph2Ngy58lhUGkeMwNdZg+ECbRjvBmqa4iqqoy/GVwljXXF9MS3G9asd1
 55uKhfWqWAIurDzhp96ZZq6/p8+TCaWltkV6C1rkxi2OY29xF/DgPnppVH43MTVtZQy3LFpVK
 5sEG80yWxY2f9zBsaV4bzd2XXY4aGsbDjy4kz00PAAtDOJcQQCeAgHB79klC6ohFF0vUFZueU
 6sovH08njwKsHLeJNlo49Z1ac79ph2nit6SBuAOrxGbke7PLx+ynScb3jmLZWWyWKcHw1i9ni
 heWvOeA==
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

> No crash or anything can or will happen here.
>
> Markus, maybe you missed the "&" in front of "&fbdev->info" ?
Would you get into the mood to adjust development views
if you would take any feedback and further background information
(by David Svoboda for example) better into account?
https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+=
null+pointers?focusedCommentId=3D405504139#comment-405504139

Regards,
Markus
