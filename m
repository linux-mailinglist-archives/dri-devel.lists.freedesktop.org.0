Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B692ED07DBD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92810E81A;
	Fri,  9 Jan 2026 08:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Z9zrRtGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550410E81A;
 Fri,  9 Jan 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1767947902; x=1768552702; i=markus.elfring@web.de;
 bh=wBLE+Q/eI31VMmf58y6FTCPFYwybMbrpRy7SEvxUB/w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Z9zrRtGV7/Fg4Dd7e7wXRv/9LQNoA0yrPTNef0bNYwWB8oweEdj+UfECDlrJYJCU
 eGNF5RPhpRghFLagni0iBEt0l9Il5mC0zTRBnLT35HjaTMfGRcVxdsMuYHhLj/UpD
 XROYsog03GRQe3GWV0Ldy+oPXw7fSdMXeFjMxZVxdkFxz8n5DrYddwvTSdUt6ujqN
 zQsPLabhplYOEi1KilJEGSBSkrdQSfRctmiHBFaTpWVRYthGVrffcrAQ0FmBsA8xA
 fjQFnAi4IEeS5dQw4eaBX/aHCRM88j1/8TWHnO8PeVimvhZ/qhv/ZsIpMrX1VM+NR
 7+C74sWrX5KYtCp8eQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.182]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mf3qK-1wKJJU1hWs-00qEG4; Fri, 09
 Jan 2026 09:38:22 +0100
Message-ID: <e76fc27b-0742-4685-96e6-f6000bd62fa8@web.de>
Date: Fri, 9 Jan 2026 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/amdkfd: fix a memory leak in device_queue_manager_init()
To: =?UTF-8?Q?Felix_K=C3=BChling?= <felix.kuehling@amd.com>,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
 <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
 <cc24a955-f5b2-43e6-a4fd-ff446d699fce@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cc24a955-f5b2-43e6-a4fd-ff446d699fce@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cWejsUk3C9iAgCaj5Bc1cLzfeORWS0ZJfJXrQJP0IHLeSADUth7
 JyQtl2pc2rEmUUCcWLRdTpNXwVqDtewf1oh0RxFzZHCSl6lrVC44wk/Pk9yAmC7x2Ca3cYC
 Jr+LogUzD7DxrJCRdtIQy9wzAqlNkcFrlKStpEDG9Z5SJZO+6qGbUgBXizCsabft283oOic
 2YUj29eP+IQVIAxP6DDRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RB3GDoPLNl4=;HBh0eWzJ87c4AHmzbG+3RIbq5Qu
 0bX7ZLswHr8ptbtYqq4KzbtmhykgLyxv+RhvnYqaKeG3yELAdrYJMTWXMZJ1iETaS3j3j5jN5
 1dIaS13W6GxyJMh+tBQJMMiSrXxGeG5TVVoyOcZaM28nM08dS7hqdBEJOJoXmMG6kk4R1DaM5
 hnR/hldH/KkzwIWyHP34+Bbh47SIrQ7kQ8fyHdwsZk0y7eV3jt8kUAdTNZV8RzPhuafVL0sDa
 NW72k4LDiLBoISHtE40PG7yT8efTJohrBNATPmXPfqvydT2jS0xjT2QFUyPhLIxDBJgW7+oVL
 OBXfIlytcqPhs8S1jPP20Lpm//pGoe62On2ZVErPV3rVd1Mp25qMzm0vGlebeHNvTxc/TBHKZ
 zY3iBuaDUOJ+77p0AsSZi1uYKFXk9gqZ6+lmivWQmI1Bwjm7QTS8Kih95J6i/DXxPFTO0nBv0
 yprPjFqDufh50DWXs4h+6toJIwqTBOMAeRGLugUtRUNOxCx85nKh7SxFVJ9NTDSf8v0hGZP1D
 MxX5WDOebP7R46jL2gxUFfO2WtwKw1IxEwa1wrMZFlbhYvLPeR0QS6dslgZhOmF7KvF5gW1Hl
 +LwsSNkWlX8yBNmmywZ8A7hYxq/Oly5QO80e6LrTLd2T3i1NVtFqAaZVEEoD1eMUiHHuCu4pp
 rrZGc64l6jCfErT6p4K074nOoeY6cOYqzB/m4pYRH38hYH4yBxjx+r2Wgv8whbEAlrAU+s9bC
 uLXcgxhoSJmnT0YbdTgY9IVDVv3StnN5i8eyVRhWr/RdtbzVcdgQbUX5DPeXppFg/8LSAKHSn
 HJ1gpCHhIMlVcWbf58g0F8Ek0CByKhu1hLkENZVIKPZ8Fn4c0O7PRT//Qg7no9+94BcBo8LZ6
 7FjvDb6zWq+YQ4Dd9aXfEVRE78EwRuNTXxofX4MU9joIzUppp5kSFZBJSKMR3Vo0Kl2vpRGU3
 YgOCdYs0jqyZPw5TB2kdkRbLJeMbIZx+iWF3rmGut92FRTaTQMC3JnL1md6GF5XPzatqO4I+S
 k3/XszgAM+KVV/M8IPWOqzwOVGM4tDF7uysQj+PdvEhEfrrGXLyZjs3WWOh5fPwBpAbmpAkLe
 soohmekX0NHIMXUKTfm0610P156rcfduJdTUlVkiaX0M7WkiR0GJCzu5s9hveKhvj8TZc9NA/
 WweQs/1p4y9Lt1dCjZG0WKYvJGVfHnkZTJHIb+1pGmEPEIF1XxbQgC58B59x+sc1RpUHS6I6O
 yuTLs98TIN1FlmV5ET/D88mEfJS7O6SnqtBYR7PJsrv3k0YSIO9aPPycbOlLHeIWhZ/5xRkxO
 Aq/DVWNgJJUY6TMBclGAztVbgJ58K2dad01982BNiOmTUoMgzd2Df32yxZ9UTmm9I0NDs61B5
 dNnr/K5Rmd7WBlgoDK/6dqYmuEWe77EC11r9oeQ10AlW/Xlv85dXTTksmmS/YErc6VCms7c2R
 j9TPrJ+sOZEdN+ouEEbFPpoHylZ6HUyuEo1WRwsNY7tZY7VMcKFu9S9KKLiY0YdOWZnnz3PUg
 8Hbj9bzEwNl4bPRCeSWs/1MW6OokUKYyS/UndWMoRbXGvRwva0GTxHx9k38nm/VSuXZPsOkB6
 Y3J4Rt69beuNpejzD6js+ZieVRL4k1VuI6aMl+D9EW6BHypWaIXqVYb0Okk7Fyfw3U2rNDvNa
 Jbrq7AigRM7IDaILPxSlfKqnbXn46zLauNX8M5DPPZJ8Ia3wqSmYgzCt9yGIwWL7KwsNaGekK
 hmpMq1JTq2jxa1QwUHWIWUqBvWLpqkpC8sxsC16y6G6pNRtUMe13AEU1u+zvtAB8GEn6dclsR
 RWLxfHQqmpsTQLWe0lxFaXmtgzvS+IIc0S8ILReYrYveBXVwa880su2jYS06XFVtYhN41TSn0
 58EUgFbxREUFT1Gu7eMLmf0x9eWMdnLzdIg2c8JEDDPZBOiPzqlQfniLMMhsbr0ykqmlyp86V
 PV4sJG53DgDSPv+36CBqP3JJ/4Znj8dR1idakDvlsbqJNcDsjJ1fGhIUBqZNhs6WfkcE5cZZW
 k9pngW9F8PzCSRyhhtLOmNYHmfHhgR8TEly+zwPqKx3aGNxtr44a5wnOYcB0lfMzviz03B/JU
 z455H9bXUkODqjj95lOyUUTTsS1s6BcFJAKvG49HtKVkQF8iPK0wH1YMTh2t783Z83kWg7hw9
 v3MDEPyyOM5Fqe73Ui7yXIdJ5Wz9+EZhCGxfgaj2zZ1fT8NGNptG0fdMGpx7OKUz3WqFI+2lU
 0O3rqctUBvU8ECEhDqtdHpv2rOpk2jWtiAZalVT+HJEDzQ+YMOpQzAaHuReX9kS29dOIgOP8j
 KtnHuQsz+mrylnYzVcnp+LByu2ZRvh3qJwQqfnRurcDjgoVTajgeXPJHDR0aTV//DjbOZExbL
 w2GXjxQvh0cqCGgTNOxyoGkZ0bQ+XYUh58sogUyE6VeK86xn/ADAYRWdmjQLQE5u7QMDkUpIe
 PtUSidNEJbpZKQxPF1IdCq0sM3qqqQYE+uwrAxdApEnvxP7pPG6p+J83zqEJMV6OpBY847+Xm
 nzJ5QTjtd2iIWB0pCVL0eaefRvlUG+pYGxOAeQ2Bceu2MCoXVpjQRKLq8PNopItscFBJLhWN+
 11gB1B/PunA2AM8gTvfk3qsyTDSLKIWTL9ztZbYFwlzoP/RNKbsNaM8DGpjzqNCTW0aKhy1bX
 0NUlLoq8PkJprpoYYyzKDeK75+XmsZNHnCtL1zz6oGygiAt5dEkX1lLWOf0ukfmZ5GP1dMWEQ
 f7sbaR5X6OIsW+ObtB88ZtBti3Jamn+5MluctT8/1p2fOvc0ARdwwoNy7Z0kzKjHJwL0bP0FG
 zE0vpjjvwoKVVeXwD4kE1NZdNcIPICiDK7UE5Y0O2QhOS3VNGbmFQw6N7UkfCsAaDvKn/92EJ
 zQPiU2OSgSkNcGi/N8aQVe6lAmYpIIv2IqBg0uJccY8TGb2zWaL1GpwY+64G3IUSY9Kgm+Gjw
 +4Eb0qLkbf5Gta5BF3D3Y+pQqpNT6JmJfL//hVZ5Y1h1auAfffw5l+4cAvxv/k+HUBLMMCjWH
 QtFmH0PFMiVIo1WrQqnhiUpE6bjdkTeffRpq1hlfdZNeqtL4Ri4HYiheBPTLWc+PGiRuAp56A
 o9fTZLsQziuZ6bEUUsVu+mOh0av6MgToRSkYM89Jj9L3/l+FcINEaPKG3a8IgF9t7aKoeCa7T
 2EuQGv/FF1UjTM5XGnC6AInMlGpA3v3oA97Lv95+zpkyNWzOcPiQvUGFmAOh4oYepK05eDaqW
 3gDDA4smoTADXjAchhu2ivc50gcOIIJqaB+/DjzCtO3gN8FNbeNZ06meZ/CidXb2KO6rueJ08
 V5aE5UYrXkSKP2+aojEzeiu5zCZsRVR9GCUFv769p1qdxRysr3JEHPoK1UUdBfdfOg0cfHrgH
 pIBOSh+T0Z8HKTcMMzaMS7gFjFAG5mnnQdOPnfwVCZdg75E1dXC0zbTmV76zsSKc8sY/k/xW+
 EnMyvp9/OS9Qsh7C/TlNVj2KZsyChYSlqBj2BiKebjVu3CHahq+iBuQkeDpw7R0zDa6JamPd0
 IlnjPBXhAjO56ZyM3tHfM37LUhVz/UMX+SBJXu8BqSZ8Y6SBQlJ1xeNzqiQ/rARUoCpTP7sVa
 H+Rf26JlllzHjUTPgIx12jhVba2p/6N+Mzp+k1EBmBWT/srWaRDYjVOCbi2xj8uHkKv/P1BA8
 nmyqvliD2Ystm7fv4hs1cl/D8kLHRGJ8HkFpJXIWWCSIXWV6chZ4orsJnjKGI60RyL2S8dRCX
 L4S7BI1Cox8v14KtrfKyxi0cF1CvXo4m0AgciHey5kyxq8kolRqFzE6jmBrYRLWfEvIKQlJBf
 rFLJeYxlTmnmV5WdMySSuntGyZcxBvOC5XgrfN+k/+smyLRmiBKOMVWAmmwEfoWyA1ZdFoO/+
 R7ohzpASZJjCvyVXalkxEAbJc/CibpL5DiqgTncyhY9vUzCeCIHtC+GxeWnGV49fLd6WUFs8m
 vGjf3UaI/rcYujvMfials7AZqRpsCV3tffwIndhJE/HXIKMpU2y5o6dlFvHvoRGfn7ZP+7VHk
 y0qlyAfq0S4V12O26YotE/j5je7bTvOi/9vuZkHBbrwvC+uGGZTLvqZWXd69rzuC2CGHinY8w
 0Qdx5AwfEY1JGh/p2hzrxmZuQr303kJByqq4xRwtLZ4QqxYgTGFiE1dODzsvfi2QsSqtb/1jj
 IqgUoLKuHhHwCe31StLS7EnRZU5LmGdOu1UTALYCFevAqiRIFKEnj1SSdDMnTtVRebxo0xh3A
 O6M9ywLrJfFBi0eKlnheFF1drSKAo4hpJ3mB3XcKhM7p5MVTYKp/UJSA0egD7ovtvW7oHAgU2
 ofkgc71H5VhZLCDAr8e9vxmcFVBfJrtIDoIHWdJWAS+Fseas+yzb7VZpDfWX1AtzgQv9RArgv
 SNh5bbSN/O6azYpxFOS32nPZ4KRNins16m7IfdCvItMvoagq5NJncNOY7A1nPsVJAs6SIywIc
 C5ThYj1+TVdfbdAwbZjVKGxjBKfD1JgIIKznMFEuxrfmjZoXtBewdNjHiQoNgGZvXKbyvlTfX
 CE6v3aaaQXprRGKv9HWEj4b0Ajnn4W6bgPqgs32dVeC4AeI3JBEsBs4oBZ+ISxGWEoZuq7ly/
 GDAT+4O1PY3SWWmW5z2xkdglQ+0tX5LalbH5JiB1oDvxqk/Iyt22DNXRbXdXg/wM3W5tzJMW/
 o07f9++6ccGv7i2JIhIm5dnAHp+oxG75gSSSkweh6rRT4/AqNNwJ+u6I0tskRIYFF/M6APr12
 ehHTt/rrvBqkS+0VdoD/twmagwoEaCSVPS5nshg5adfVSo4TtJQ1KFRs/+ENcOPrpPnNXI2c+
 9ZRz0McPGLAGli17U+16Mx/DiAhNQ5A5JSukifhu1XjIg3Ih5BapDfVH7rFBUnKqCwJ8oVOta
 V70n4QbYhafBT9WQX83/qzm8vx8PZHNVHKxi2x1SWeRIKXPjUZjV/S4ht0bAw+M+W0YzF1b5Z
 zdnQzLHl2T1jtb6EXOcovUDvYMuEeCh3meNw6EpNfM8mnO8ej2ilDiQmP0oUnzOwuKQX05AEb
 F3qIAV2+pvf+3oN6UArE1TvEdfdHPDmgXoixaxziApTpDIVqxye7Al0obau62iEe/NXHSDbEA
 mORhxNIIj7yjMsTlp7VdR3RS7azlPoaCqAx+WlNJjCGtVx98hcQzT9bmhnlw==
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

> My conclusion is that this WARN is just unnecessary.

Would you like to omit such a questionable macro call then?


> But it's also harmless.

How do you think about to avoid special development concerns here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.19-rc4#n1242

Regards,
Markus
