Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B227A5803F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 02:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01B510E1AE;
	Sun,  9 Mar 2025 01:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="dRhEpMvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EC110E1AE
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741484773; x=1742089573; i=deller@gmx.de;
 bh=BI+qFGKtyIKj2XHGpJ0zmu5JOmyf8lpR4zpYb1MG7yg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dRhEpMvzlsvN8EUdWNfoQ8UEpjcOZnJvJHNHTL+6nmH5Ihly02u5rC9A+3Y1JoVU
 ko5vSQGkS8lUIld84nj2iG9Mo0wkTMGfRIJ9793c3KPYDzB/IKnUi5D1M/HAolFUJ
 B/ipQAA6Ev83f2LHAiD+p+6xN/FO1CRmj2L5FwEfv/FTget9PdGWy7GGqkIqZRy45
 mHZuCoj2NgvEinERKiOK39fjr4+jgnMOkHdiswLhix8ddI9IM+6bBTEwwZtSNfgyv
 AMyTt8CG2dEWjDoyaDzhLMAVWqOlRxXEMerS0LvjYaUqeDLEPmN97xGB0vAw4n8ua
 mX19BOk+rUuwIU3v4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt79F-1syAm40Tkn-00rplv; Sun, 09
 Mar 2025 02:46:13 +0100
Message-ID: <9fb4e2f9-fa28-4dc2-b4db-6f7594ddc5ae@gmx.de>
Date: Sun, 9 Mar 2025 02:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
To: Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250225164436.56654-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9dglOuAzJm0drNeh5CbFS+IxFTXpgGKs+ST9+pGvu4P8N5rSbIK
 ShIYORdShc1eOUg0QXHYFbvKLdcjfuwCP08TkHNSAK03dobC5314tPzVfk5zvaJaEO6G16P
 yIgqGDwy9M+6A/On2rsMayV5Vl4oMr4CRUjE3Z2qWkJ6NOJWAfkz/blCjDuP3xJKddI7Lnk
 vzLrN/ofLVXyjVQErO6cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ez3AJunTXxk=;dELhG1u3d+RMqaGdFvO2I+oDRI0
 vM9s3SEzGwd7rTgH5EWZaWWoHZpJiv0HbbKbtKj4DoYHm1kX4atZZizFT26+0YFHfJLLVt8pN
 HIiTdu7LGQ0vrsmO0TITl7ZUUWsnpbSPPYUMqSNTr2AEgspO1fiQVRUxJqGziOqsHGS4EZB5j
 kB0h/CsSOo8nWs2KgX0fUkA8Aj4r/UhPZPth4F2sgqR8cxFO6PqGH1bddcMxWWjFFSxsfzSWt
 /cGqMHEkhGWOeKhexbBqsNZTTWJXLDnzgixci7SIU2rjHbWaeVjtMyBcma7wEbZeh7gX8yFzf
 Dzm+6XJjHmrzUcOwoREkXIFJ0GThIAJJ9wsmC9FrGjyouc8TuKYPy9MmEDLB8njuAZLnYkx49
 WkoaMyjincR6N2CwNcMhWxlvZM/HY/JiCskJm03onmDSXfMEIeStJcptDcP8hmUmqiRET4jhK
 QrVwWBSioEUQp/4mR6UQozcVDG6b9zgaPOcIa2Ag9t0RKgGcfAlYHXKLj5ngSwOrGCHU54ARq
 6b8L4eriFWJibpMVWq8VcR6i+7S2BlNycScKng6A8mDZiZNxRrEutq+Ikt3/bR84AVLwR8vTi
 e/e/ktWXgc253JaH1NkLbYWRELBp2lRFNHM7i+wHEWRntu2jemq/mZdF9DUEwSXgsrEQ+Rrjf
 E5EG+nYME06vj8Hv/I6BTIWy4eb54qk++vVLXYyMatZq/Sau9icr6Eu6E0MFXUkvu3KsKCh18
 5dtuXIaG1RI1C+6v8SpTaoM+BQ0OCAPviDfmlx/YNhlvhRjQVLT40093b0AOwmnUbHiH/pmm7
 IRYWCWlOjNVipxsQ+EYmSMFAojJePNIfDkyW9JFnAT4devi0+gf2YJ8JQ3slbn2DmobokWQ4H
 7QNIObPuRrF4E75mMIcVCTwfWTSRXmLA6K7imtFSq4ZN4AOtOmGW875/KKviBSg4fhBjCHDnt
 Xt9CeYaepO4wugTbI2U5CM+yYhU3Os6Qzndtj7svpeVLwIWAWDgdMcj/QUXRkXOBgbZ5mq1nE
 PX6J+8YYhSspEC2Xz3BKy3IPDE2zAZjSgvml4pAvGFqu+ypzjxB5hW8sm4OEriTk/1bag5+KY
 x4yFfcbBKClgqxOrMVWBrEAopDPalt3hdT5risVv4RGpC4QGuEHbcE2Fs/q7S28CX1a5k0OkN
 2l/3Mp4ZAW054HQpAoI4AE4bp09aH+yTmsC1rHRHDnQgF0gRfj+6KOtkYGo6TC+qhyTPvaAX/
 VfNpvIOJSddjPWjwVFgXgvNhammGMkw1HXq4VYY3aRKXoOZh/TFMiL2nO9wR/VTNCWix/GAGU
 15VR7biuSohCLvaPkhSg8hqGQ6kKp9s7OGvnkZJ/DGQHUQC+pt6GNA2sP0w7kWtIP8x2KBgNK
 CV2PIjNxXphDq+X4RvtUwUfD+sfLD88hfIS2tiXcbH8N9nesqzw8IhRZdD
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

On 2/25/25 17:44, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Dummycon is used as a fallback conswitchp for vgacon and fbcon
> in the VT code, and there are no references to it if all three
> are disabled, so just leave it out of the kernel image for
> configurations without those.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/video/console/Kconfig | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)


whole series applied to fbdev git tree.

Thanks!
Helge
