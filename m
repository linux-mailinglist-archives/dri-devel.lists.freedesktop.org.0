Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175792A153
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 00:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150A6E118;
	Fri, 24 May 2019 22:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CD6E118;
 Fri, 24 May 2019 22:32:29 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g57so1497153edc.12;
 Fri, 24 May 2019 15:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oHWqURW4CUWaZnmeogCJ1KtdIdnFykBBroGmr7/yAPM=;
 b=GzsdRQv6OlZKA/3uLBEC838BqThr/mdELFHdNWZ57DJ93BdxJG7bUjiKSuWvK74xFo
 rg5/HnD//YRyLzKVxBYrgjihZCzRMhuJaZPHv7zyxNKfX7oZzsrVwla0QQJzLl8t7010
 hTxItnA8C+0bl6rs1X7GxNirD0dCcjpFY6gwcqMxWucjpkDSRQNBs6Pmy0AX+TObrjFe
 Xu6TIOzvKEDnJwmz6lx478jNBZkT+eunXhTNU6qQKw6Y3vidszu67D2AyH+XVrN7Z672
 9nxMwz2qMvsQJVdSzbZH9AQtPf7ipSpCz8E9lCQmjPrprT2R25R8afh20ntn4T18dTP7
 hSzw==
X-Gm-Message-State: APjAAAWNQF8g0402HZjyEQDhTxOlaDbDCW0ZHs0L4OVS7r+hNYUXFe+3
 cq/baNfdF6Fvqd0tlFbVrSBW2jHPlll69GGeYaM=
X-Google-Smtp-Source: APXvYqzTMSStCHdV8ZpXiDPzAJeZD+lH4y5qDmv4argKbo3ap4ZpS6OgFnwwoBRIgbCx9iId20Ls5K9Ow7Mp9+FSnCs=
X-Received: by 2002:a17:906:32db:: with SMTP id
 k27mr810381ejk.258.1558737147932; 
 Fri, 24 May 2019 15:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190524173231.5040-1-sean@poorly.run>
 <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
In-Reply-To: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 May 2019 15:32:15 -0700
Message-ID: <CAF6AEGuZB897EBqdoam721-BHe-zu2cYPE0n_vSQKKBnjeidEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize
 debugfs
To: Stephen Boyd <swboyd@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oHWqURW4CUWaZnmeogCJ1KtdIdnFykBBroGmr7/yAPM=;
 b=nkQrhcQ3KCaOkVk631LAHTIBFTuuVDoFZ8BQ3W232OjjQLLQnxOdRESWdNbzUqe+Je
 Z+KZG5kPR9i1mXurmr0VjukqmHYOoNwa1qG8E0L3XP9oNE9pricJFuSsSEUAh3it7SFe
 nYOJuzhZNCT7hW6Xal09mR2zQ//J3YFue2lnrFbk5WKRzM0ee5qcEFEjOVQyzMsBi7v2
 uO6V4lYA9QU0HkaEn3y6Id+KTSmaKEcnWz/0rPgE6j+b4DqsjLJLqHAlpybjSNcw7iYA
 J/VVgY/nzawLgVjEzu6F3FOI5LHQ+Z7Rq4F51sieSeGAZtJ0rUhxNZ9axZGzNvhz5wZ3
 cHlA==
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
Cc: Sean Paul <seanpaul@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTo0MyBQTSBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBTZWFuIFBhdWwgKDIwMTktMDUtMjQgMTA6MzI6
MTgpCj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBJ
bnN0ZWFkIG9mIHJlYWNoaW5nIGludG8gZGV2LT5wcmltYXJ5IGZvciBkZWJ1Z2ZzX3Jvb3QsIHVz
ZSB0aGUgbWlub3IKPiA+IHBhc3NlZCBpbnRvIGRlYnVnZnNfaW5pdC4KPiA+Cj4gPiBUaGlzIGF2
b2lkcyBjcmVhdGluZyB0aGUgZGVidWcgZGlyZWN0b3J5IHVuZGVyIC9zeXMva2VybmVsL2RlYnVn
LyBhbmQKPiA+IGluc3RlYWQgY3JlYXRlcyB0aGUgZGlyZWN0b3J5IHVuZGVyIHRoZSBjb3JyZWN0
IG5vZGUgaW4KPiA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS88bm9kZT4vCj4KPiBTbyBkb2VzIHRo
aXMgbWFrZSBpdCBiZWNvbWUgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxub2RlPi9kZWJ1Zz8KPgo+
IEkgd29uZGVyIHdoeSBpdCBjYW4ndCBhbGwgYmUgY3JlYXRlZCB1bmRlciAvc3lzL2tlcm5lbC9k
ZWJ1Zy9kcmkvPG5vZGU+Cj4gYW5kIHRoZW4gYXZvaWQgdGhlIGV4dHJhICJkZWJ1ZyIgZGlyZWN0
b3J5IHRoYXQgaXNuJ3QgYWRkaW5nIGFueSB2YWx1ZT8KPgoKRnJvbSB0aGUgbG9va3Mgb2YgaXQs
IGl0IHdpbGwgc3RpbGwgY3JlYXRlIHRoZSAnZGVidWcnIGRpciwgYnV0IGF0CmxlYXN0IHVuZGVy
IHRoZSBjb3JyZWN0IDxub2RlPi4uCgpmb3IgdGhlIHJlY29yZCwgSSdtIGFsbCBmb3IgZ2V0dGlu
ZyByaWQgb2YgdGhlIGV4dHJhICdkZWJ1ZycKZGlyZWN0b3J5LCBpdCBzYXZlcyBtZSBzb21lIGV4
dHJhIHR5cGluZyA7LSkKCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
