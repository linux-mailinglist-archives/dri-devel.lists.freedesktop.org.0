Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42C4CDD51
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 20:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9D891D6;
	Fri,  4 Mar 2022 19:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B8D1133BE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 19:29:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a8so19459199ejc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 11:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2feTJ8tP3DC/YFFoVPPzvKdizBU6tg9lhj95h2BK0Uk=;
 b=M6uJy3jiqnYZQ0PUmcG9NFo1HLo/wJenMcAEDj8OcYlR9/RQqdhxHfSkm6Iz8Hh9j+
 S2tVbOzWmTyNQWI7IehtdN0/doGOGBH+9z4AYvxiIUBQtm/oGDsIMDl/58jnglUsqcs6
 4PG/NyJteifuVuoi41+Wbf2iHgHbzRXtxdFTI3sszlV8I+N/veBbFrR16u6uKEZzWuWT
 YB8aIEu9GUS8lTNfvcjZ9yuYi6h33a3rVUp5BRkgiLUbna+Tq5TxZEFS5VJG9e5t2vUC
 BsUnwJ8dXcPJk8VIQXlJjC6sYe8z8GsVkL68X9QTAQjrlf6qV+IkO1ovVHYW7UYuq3cp
 wDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2feTJ8tP3DC/YFFoVPPzvKdizBU6tg9lhj95h2BK0Uk=;
 b=rw+L5PWAm+V1ICGd82fl60t3SpBrRh/FfGNe9Tb9HTay9EmzoGRF12/OZcnHpImCt5
 +kx4B0ocYofcN4NaR05WQ6qumroVfDNRwzvaawJQ+bKY6IWXGadE+ReDHwFT1xFauIzO
 ZRE3sH/Fkb9fuQOmFCkQKIbYujRQjnklK+VRG7XPufV74DEzdDb7RpK+FeD3kNJW05Ya
 GLxaGwBE9iPhc2I1+j65BxON8JdbxIHiKrgdGqtwwsJkMcsKOm70dNtm4n3vlEYIkBmw
 3ixIsfeuka1Uh/a3OaqZYJ7RfqZLhTcK72Ousqukht8+L3bd4SRJ5Vdp0cwZSpOMYt0g
 jAPg==
X-Gm-Message-State: AOAM533vdfRwlRKuQW9o8qU1fsvCu72viqep9ydRCLWxFofbn2NtSwzd
 GzWnJj2bnezr3XLQaqqb/Ac=
X-Google-Smtp-Source: ABdhPJxDMYpnJkvbS4DeRXy/SlQQziXOQnVycA9teF/oaohkBhHHeN4VqtYX3TuB4i8JAUwVxLhqXg==
X-Received: by 2002:a17:907:334c:b0:6cd:76b7:3948 with SMTP id
 yr12-20020a170907334c00b006cd76b73948mr262340ejb.55.1646422143286; 
 Fri, 04 Mar 2022 11:29:03 -0800 (PST)
Received: from [192.168.1.103] ([178.176.72.82])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056402520f00b00415e50f8ce1sm2242179edd.54.2022.03.04.11.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 11:29:02 -0800 (PST)
Subject: Re: [PATCH v4 16/24] locking/lockdep, cpu/hotplus: Use a weaker
 annotation in AP thread
To: Byungchul Park <byungchul.park@lge.com>, torvalds@linux-foundation.org
References: <1646377603-19730-1-git-send-email-byungchul.park@lge.com>
 <1646377603-19730-17-git-send-email-byungchul.park@lge.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <aac81d30-ccc6-b351-729a-7265e8b6ec2c@gmail.com>
Date: Fri, 4 Mar 2022 22:28:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1646377603-19730-17-git-send-email-byungchul.park@lge.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/4/22 10:06 AM, Byungchul Park wrote:

> cb92173d1f0 (locking/lockdep, cpu/hotplug: Annotate AP thread) was

   You need to enclose the commit summary in (""), not just (). :-)

> introduced to make lockdep_assert_cpus_held() work in AP thread.
> 
> However, the annotation is too strong for that purpose. We don't have to
> use more than try lock annotation for that.
> 
> Furthermore, now that Dept was introduced, false positive alarms was
> reported by that. Replaced it with try lock annotation.
> 
> Signed-off-by: Byungchul Park <byungchul.park@lge.com>
[...]

MBR, Sergey
