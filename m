Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD908BC7DC
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F101610EDFF;
	Mon,  6 May 2024 06:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="HVgPopCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB6510E544
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:52:58 +0000 (UTC)
Received: from fedor-21d0 (unknown [5.228.116.47])
 by mail.ispras.ru (Postfix) with ESMTPSA id D128840769D5;
 Mon,  6 May 2024 06:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru D128840769D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1714978376;
 bh=EwcyDJdNTrTep2VJgQcoEYJczFdF5PJ0OxkRi2D2QSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVgPopCzwZafYnLSZgHdpcikZS1YufZHSp084ZfpvrRSz4N6jayBI6+FhTaWcSN+E
 AGxhcMK1YH0vOee3JKJz/Csl+7M7TfPY/sgIz9v8rPyrUK9K7NCp67ksSwakGaPmP+
 Or7pT76bA9Yg9g7jus8fRotbxXPHuXR46nskXj4w=
Date: Mon, 6 May 2024 09:52:50 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 lvc-project@linuxtesting.org, dri-devel@lists.freedesktop.org, 
 "T.J. Mercier" <tjmercier@google.com>,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com, 
 linux-fsdevel@vger.kernel.org, Zhiguo Jiang <justinjiang@vivo.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Subject: Re: [lvc-project] [PATCH] [RFC] dma-buf: fix race condition between
 poll and close
Message-ID: <20240506-6128db77520dbf887927bd4d-pchelkin@ispras.ru>
References: <20240423191310.19437-1-dmantipov@yandex.ru>
 <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
 <3a7d0f38-13b9-4e98-a5fa-9a0d775bcf81@yandex.ru>
 <72f5f1b8-ca5b-4207-9ac9-95b60c607f3a@amd.com>
 <d5866bd9-299c-45be-93ac-98960de1c91e@yandex.ru>
 <a87d7ef8-2c59-4dc5-ba0a-b821d1effc72@amd.com>
 <5c8345ee-011a-4fa7-8326-84f40daf2f2c@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c8345ee-011a-4fa7-8326-84f40daf2f2c@yandex.ru>
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

On Fri, 03. May 14:08, Dmitry Antipov wrote:
> On 5/3/24 11:18 AM, Christian König wrote:
> 
> > Attached is a compile only tested patch, please verify if it fixes your problem.
> 
> LGTM, and this is similar to get_file() in __pollwait() and fput() in
> free_poll_entry() used in implementation of poll(). Please resubmit to
> linux-fsdevel@ including the following:
> 
> Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5d4cb6b4409edfd18646
> Tested-by: Dmitry Antipov <dmantipov@yandex.ru>

I guess the problem is addressed by commit 4efaa5acf0a1 ("epoll: be better
about file lifetimes") which was pushed upstream just before v6.9-rc7.

Link: https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
