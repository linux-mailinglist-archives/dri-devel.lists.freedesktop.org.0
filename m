Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D402A6EE20A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 14:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319D610E72C;
	Tue, 25 Apr 2023 12:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0D910E72B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 12:42:40 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-316d901b2ecso68425ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682426559; x=1685018559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0R1shJ74GFraG54ZrBarpqRCUuus8sKdN1oUXtaP84=;
 b=Txr1tOrk3lncYAjQ+XMeFFNMCc+1J+OALg7JKpiQBoGjaklUAoF7naIJRGimpawtAT
 sBwfNg3ShbonS7fAYTnDKd8acfn0g/kxsYXUTGtlCL1Qy6BR5MBLMh0HlczwgLCPU2UM
 hxqOojx9hcV2PtMT9EIJLQ0BoQlNx1RJRftyusZek6lsTVIinhBDP/0Zxi1jPHE5QdnY
 QoEQNPmaJTOFlqVpP3501bAnYvcxZ2DD1GTLGJP/h5vMhnexw+5uaUIRpWAf51qdrBCJ
 9aLV2IvA5Lwlnxp9mJM1IvB38YgGaO/bvvaTwj9D7rbiJpNsaOyKEFreNarahBZxQ7x9
 KjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682426559; x=1685018559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0R1shJ74GFraG54ZrBarpqRCUuus8sKdN1oUXtaP84=;
 b=Tn1+g63iT7uXKJzD5efjHpfbRXj/709hxWRVwSGSgnn77ZoOMmJmq9IZVRd7Svkr2t
 4pnYOT3U+fFXkyOM+a8l4FtyxFlW7jHMCHkjWIyHpMuy0jwfHqysgfKNN0jUdScLmK52
 HWGGDNT3zoc1cWh0z8XxQ/0hGGHmObHTOWbR8Qc7nMiTAUsi9E/b+EqDfQFJaWPTxTkb
 U/6jnLnaa6UpMWWk8RFqi/o34jLhyEHLSQtkZQNejsqdJPJoaPxzjcvpiDoyvGbSqQBO
 NLHgHZBVknLW0dnmL4r6N7p3gygmsG8274mqmYF3pCYNL5QE5Who/AIxcuHmfCbguB5f
 QEFA==
X-Gm-Message-State: AC+VfDylUqPEfDuZ9NUvIaYfKwHDpQPtB8OJTRCUEV+RrnfPxoBLgkZz
 xDjIqrxPHfzDBIGJlFtQ8rWEMyvXzS0CGtWdfGRLYg==
X-Google-Smtp-Source: ACHHUZ4GKysEbVSQRjtwRSfZ4ZLt12ToKr+xCMJTS781tmsqaX3mnDD1C2HU71jSpdl2+drmKJQM6Rb/08AWXEtz4SE=
X-Received: by 2002:a05:6e02:1aaf:b0:313:93c8:e71f with SMTP id
 l15-20020a056e021aaf00b0031393c8e71fmr174325ilv.19.1682426558867; Tue, 25 Apr
 2023 05:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
 <20230224-track_gt-v8-2-4b6517e61be6@intel.com>
In-Reply-To: <20230224-track_gt-v8-2-4b6517e61be6@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 25 Apr 2023 14:42:27 +0200
Message-ID: <CANn89i+yGztnfz-ZMwcpPTVrQ_bxvmKC5wrJ70WUZvwAAJqJzg@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] lib/ref_tracker: improve printing stats
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:06=E2=80=AFAM Andrzej Hajda <andrzej.hajda@intel=
.com> wrote:
>
> In case the library is tracking busy subsystem, simply
> printing stack for every active reference will spam log
> with long, hard to read, redundant stack traces. To improve
> readabilty following changes have been made:
> - reports are printed per stack_handle - log is more compact,
> - added display name for ref_tracker_dir - it will differentiate
>   multiple subsystems,
> - stack trace is printed indented, in the same printk call,
> - info about dropped references is printed as well.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
