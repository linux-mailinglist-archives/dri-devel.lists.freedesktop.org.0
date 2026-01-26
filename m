Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJDwFBdbd2maeQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:16:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C781A8817C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2BE10E409;
	Mon, 26 Jan 2026 12:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="WsagZu0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0F610E409
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769429763; x=1770034563; i=markus.elfring@web.de;
 bh=1gZISCACAYDc0aciYMD7qHGpPgunwQ/7z9T8c/Crick=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WsagZu0tqUJLup6gLhGl/P97FbK92QRoIpEtqAgfLeIFo74Lns2QduWusX+eb9oR
 /CSNX9Qp7Rd49y8MBjUWGhpHi97q56hLK6Wr88Q6+ARlVrSLBnNFtBsstCLbLH+n7
 UObcRPNJEStQNIsmnZqZTrr0HjcEhev5+bajmnee2s+Tk9yBPiY/21kyr5G2oWT5u
 4Bs5zclW+HdgNTHFNWEz/954DazpZaXBDBLa+w/0uBlNfHKXLNYASSAEkSmDVD5sY
 xqAVB4ze0JoxlWr8u1AgKoUffxFlUcCQLOQzc/nl42nH76WXnt0OCr7h3tyI5eTAj
 DwvXk2KIIEWtSgNlYw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.253]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8T7E-1vfvfP2Tdw-004S3B; Mon, 26
 Jan 2026 13:16:03 +0100
Message-ID: <823322b3-d82d-4706-9c06-8d3ba898f618@web.de>
Date: Mon, 26 Jan 2026 13:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Jianhao Xu <jianhao.xu@seu.edu.cn>,
 Simona Vetter <simona.vetter@ffwll.ch>, Zilin Guan <zilin@seu.edu.cn>
References: <20260125122339.2008087-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] intel-gtt: fix an error handle in i810_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260125122339.2008087-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oqKjJzh3Dv72u/+bNtxRFosF/WOEJC73e6vC14GiOXrOzNPrUwW
 7pYJtdtz4jWNB2oFFNbGKpnDpyhLrv1tWOnhoTypchOsA+SzhS6p7MmfJY4/lTw0lOxlqnw
 rhd9siIMD8hVVkaes275GsQ3zY94e/D3NLheOz8w94aA9GGkOTlITlV+Ua1vDoboyeFhqFi
 s+g2yGyh8mg1NlIGZJHSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:79G1jx26aLs=;gIVYWzugBftnbHIxH+woGu3Trpj
 nfib4LfP5UuWoP5zvpGm1tu5QMHK4kw8RWyxnvhRdembghqrRM0m+eMgrUieJYZpod7vr0RUq
 nH0RayPoAPAugmovnSf2BMTRf/PL/Y+z2iapUHC3CqroydaQOf7vfJB7BLk6533hvQPf8QHWT
 dM+4aA9BKos9Mn+ygsGv8IikQ50defkuaw7WCiwNmymSb6dsPWBiIi3SRSKhAvszJbNrXzS9h
 VT/1qnoLTuLooh60/CF7a3KpDJc+UJZQsaqcYMaKVsI4njQizyW4MVO7q2kn15raSfMIadF4x
 w4Zm33TtE3izj9F4hXq4yZf4KsAXrN53X4/zBk1QS0CqAZmUW1bXj8FML+QFD74oxoVPhSEM5
 zNWJvT27oUyz/iDSmKO5Cc2rEJHAz8qg1BVZNnere5K5NOAmg9Ot7Cqc6cUFpW51LDqnakfTh
 iHuQLAj0dutVnhSgCwjRxI8hWQ+Hi/XXeRzBZntBr4x6HUyUjPbkzPs7ZG8gKSgD2BZTVSY7f
 gbafmlLHeq8+TlnnZ2BNlA/XwAL1mhMkYLLAaoSE09GKcOVkhU5SUJsMjMI4Lj4aePDbVx0K2
 Kg0Tg+sb+cKu3Q+/9d1lgd0lYq0OuFXDWQFIEtV5oziob8FPYU9W3aXsUkYPU6a6JCmJUZfrd
 nf9uL+3SKah9L7H2RjJB5RMo8VT9Q5dGrkQ5PuiHvzUQtnVSUbhCOxvppEx3UpyBUrh+YOGsb
 N8izbla0B1KItf0d6PQYWeWnURWNNPjPYRwD8IHOkd4eim8qYZJ1CkMv1HloutxVp/e36b0sk
 rnq4vQFLB7T8FSSfOId6ZFYcasQ84NBma3caXBpyWgwSKW5npbRevpiFFitxBs8rPGokbwibN
 YAu5+cqGuEHmYVzcGI7Z8qNBgtxt0YdLfe8NY6K1xa0Ox8PBEiWvJXk9E/NDA1fJOPWheAG87
 /b6JdpZJpvkdufoGKC+CC8WgKFvyFfqJpvYGInUov6CeS4HxwN1DWqiuECt8+oDS/CRHxbSaa
 jpf/U/GyGme3SfQDM0+XBw8f3pjGVi43vmn7aMNiBg4C7XKM+0sEQoHJUtWPfQneHveFKE9gO
 WywK6jQHsG5n88O/+TvpjNjtU8HnF0RrlY1btdKp2bbYVhytOlnC0ObAnX72p4D4opglSPJ0U
 F7qUAa2t89ubxD8RLHQqnVsHCwrk18aPSSzxiIQyODYXxS5JYF+HjcEd1wS6FJUQqmquNwppK
 DEZYKlOrQEjfH/szjZ1brtZjOFNw+baIkU2ZfPiTLmsWR3kC+DHtz1CSSRNAEmBPwaBeW+49Y
 qgRzfbgZNckmn1a/tgDUofxrO0/vPFf1q7Y9iER8ssgJaAe+5yaw2ncgNAbLD9FBaPPa+yrSq
 8tyzdvnSkTgGnZwJSwqHXjPeiKMyFFiF4rYm7GjrY5D+NVcIYFjffdiXEuF0gzUFgautg9vYm
 8xLHBay9a/CcDMJFWToov9U33mQ8C2+vKWW7QV+3DSXX2MQRBZFLAOjAQaCsRHdxsOZw1rR3z
 uyB8cQhJ4ma4sFYHqXeXNNmZ2N5Q5Q/zbtrr3TljvZ5iWPbw1sM8LRxGK41iV9BUBE8mblHF9
 yMDFX6zqzFCKtXEPGS/HP39beqPlhnXYhif776nMwbFauVrL7g7b+U37a5HQUPTurils78RpP
 F87X/DTB7H3EZ7aXYxP3r02PocOICaVUit+ZDY+vnES7C4dcEZD94J1HDuyHrKdcsLxwgx63g
 h/GbJ+N1rIoWyGVzzvYNBAIKQqyI/HLDGsSDVE0oEUeVk9//e2ZcLSSuQZXZst7Sw0IQFTiVB
 v1WtpN6b4M+/4E2exSCqEbnajhkHIx7eFNL1dfLNbtjTScs1fhsKxhz8HY8NP7n8RtrRiBVF5
 7vLh1meQsMIwHvByI+fNFtRoVyZXuG8E1fsY9udWDSaVFPQaM4RU0xaMm97DzgWokH6x9ZaJj
 VtIZF5ZJH/OjI7ojpj+DgbMCOBjENixLLK44sEX1sdXp42jLBiNT/Gw5hy2UTYcLtgPQk2Zbi
 llAc+IFYHI21ZakIJjW0dsR2nzMWh++TBUbFkR1nhY4E2OYTKyCcRXorEvl38f5VgKZ6Z+ZtF
 h8nk/AUxcsk1+D25K5CxzaKe1PoJiVWKyxVcVfK5cyTe7kA+cd5NldVsWpkHy2UqzgobTfzwL
 STY9I0VKlUQ7rsdKBEdCjIezm0HpfGUHgxGlPXboKEioYDb47xaEq0chc2Preysce73UUyWLT
 dUFY5DuE9Q8ppG+3D4Eo20JFM/T+eIue06sbXUj4+uCw0WEFxBRq97JUQqlPY+bTKDs4VKPKp
 SMeN6mQmt/0WJoir3Kwjqkn6QLXbJwcwgdz1IuC2CvNcnE4jq1h0b24cUqeeGnoWCb+gTLA83
 31D8TT1UgHpgLIjwGAPo4atjv9noce0m+X2dJowqPgnfhfa1R+YKBy9Mv3UzG99jZEwKv9lvS
 zzpBMlI3cjYv4oMBARFL2wkEFQ3FKmf3s2njG5rrU7Ig/5kJ5OfMJYDYA1mGH9zkbqse37u4W
 5kaQsLGesyhLS2aqGJLFjuWz80abHI0MBE75bTHHlOIBgLEvia71OSItclOnlqQF/HtOO+QDi
 FPHsdG4P/AC3gPKgMe9dgKvzuwb8v7EUjoigj3+EklrNII92rwDwh88aT1ZTqxSWH9ZrbKWSX
 +hgOjq0jp26C43a1KB2i7dOIjLfWa95M/uNWKYacUA62j0Ja+4CeKUbdfCbY33MbAXKR3vQtz
 vda077FCE6oZlYG0rU61nZwiNJmWt43moD65TzbSpS7mAnRQEXzBDIp3mN2CxeIkIeLccW/cX
 KdMZLJvGFAUrePEBsyH3hbvrAAdIEyyIeXIoCc2Zs9pIupMoa1S8XupIc48Nrz7UOk2M1wLs2
 f1jNpoO8SmIasHTS2FzKd/wqpPCODJ03B1kTYcRBw9Lam7gDRY5HCW+U8HKFMsE8UA89m7HgV
 LH921SBuwGD/nyzClqBiXcKoQ3xgQBDafh0RZv3Tr2/cDGu7uav8ZmdaCEE/SSyQetH5CjrgS
 03dgz5j0Om1MtYAb/tAAs2vCoaYSEqRHeGc3NZm9W438QJ6Y3CtRzRWMn4KV44OHvWwkITWCr
 92j/Sry3TEXamABqVlQ2v1BWclGvVe8p0KDh6hhWwWMhMFqk3yIdO48nb5AcpKyDyBmq8l4TF
 kaL6Hz0mthE6D0TE24TJtRpbHQ+xJZ8GizSsTyb1boo3UX4biNR/PkHc5UmVHyTsoiEugR8SH
 eW6jtjpDc+vZxSuNmOvhpW6ORvkWYv8KRP0tkTkS7x89/MGZEeuCAxYZyMP3A77tQnWDPamOY
 5hWvdMi8rdZddHxeVhtn9mE/4a8Eonqfx6b/L/e+CHLAAdYHoFZdIwmDEkrK/cHTic+YPGEc+
 D0bIL3C3h3d1lLqwtvo/BtA0T+q1GisWa5zWTxr0r4GpODuPhoq7QNuWjB15bYReqF+nOdjIe
 0bZRSQ7If2iI2VomV3vcvY6tSGleTjhxQADb14eUxflKF1VztTKzHf7uPn5Qjjya+o66eKkC8
 UF3J5zWoepgLVgABsL1OYYGVCFvisuY1iHFUd+HukkMA9HZUaacbJZ9VbNMrnxj1QbgYTmi37
 yoI19br3ACpME9UJNUkwRdKwvWFoejL20Wz8HKwVCld4s8kJarExIIUZKHNlwxtOWo0jJSkPf
 vqpOXY1FRnlSaZBzAUKX5qt7egAQqoX37yBSC/5nZIZplexnZVfI1yLlItQE0xlu8JWxM403U
 Djiqi+LLRd9Cf16pTDHiQar/9BgO2u2/aH20u1WpObdfUB49x2zy2weEnPXmxXaCjUXxBgk4b
 FlR3gzryNmuHHL2N+3ZsrHU2vWcznWAoaSRkfNxkT0NbGvvSZ5VPg2ujSsOK+uJhKQ30C6r5p
 y0bdudGRwS6qcqGu8BcArNxBkqRkmNqUoTKDS6O9fq4+5znIIXL6j9i6/T7jciIjvqo8ftnUJ
 /JAjmPYTGjeGvIJsDC28war0pPEZchTUMYyEwqDzuVdDm//NhqdWZ1P/ggj64kvl8yTTYaAzW
 qanBFhQH757UFDueEcxWH9k/YGkeijh7C4+Ec3ZEB5IHZf1wM/6R6li8t4uU7GGflSkiEqVL5
 9maGLuH4DXqu7jZfP8S/DyiJgnRl3riSpzO1jp8SbT837EH6qxgr3ZqfEexJK9YQUdPtGAgrf
 uthDtB0qAJ4MoWo+saVd2f8Zy7f6tUfy17AyJBN9EO82EgRfl7Qc4y3m3nVlwodIiSMcDSvgU
 s9+ZXq2i4nOLwpvNCLAUt8qbhmW7cNF2FQJzj281d8yBx0VS+iwv7kAK3vgactEoBwrhEUV5q
 HyHC8ibY3f+p122Kc4s5EU5tT8YekT8nqrw7FvDzYQ6xifK+RBOGsj39RKt4rMpZ5kVt6kNZm
 tbe9fRHyfWYkpZTCiaLWUIWq0Y09rE3T4jbpkNrVr6T5zL5JgbbQB/YadUVGdZ0BqWrvH0bPH
 I1l7I09Qp87Pl/snGWiqnAfYmwD/OgdwP9Rym/GyTH0cgbGc6sW6oGphW+Q3DDrzZJCseXOiE
 cQUUeQBL7iO3BG2FYD7MTj9ItSv8vvHdipOHfm7CsUrwrc2LO7OOTGWIk5qaEb2qfgL/2xOv1
 NXLjVtcvf4GKWcrxr48d21oLsx2RfqVsRfPYSI7RQbr0qKqGJYCBk+IUkjSnfi3lUYrm9i5Xa
 xFFS5wMsyhfh091w8J4JQVy/Ljju/kMPqQ6KitAW3mqLDDf23hpheU9zDWX4InBFVruvOQ+lA
 RkfRSeFqzTIjRPSgFbOt9NTPo1lMZwX3a2JAFUvNbUAlvY98ccPYqD4s0xBz+17DiT8uX3f8E
 xEDF/zqVoC8KtwDVee09QHkdUnPRpHop8vDwezbXJ/OuIOf7r69t4FwVU25qOP0ljHvhi3o4d
 zROLxQFVBgrEVI/QxxXEF/MqAjZgkSyl9xTUmeNEczxZXom1Luyt6ac5z8R/5Z087Fq5c1/ry
 ZrVTt5EsZ/PlPvvya8Drm4BwD6hg8nyCr4CvkskM0Qan/vN0EITRnehjhmZtu5svgga5UTwhC
 5wqd6bWoJ/OO/8fJdrrgzqmbHDLxFyXZrOjcyzdpnL6M4+mfn5kIVZAwpaT64VgYWtxqZZHuO
 vEMOb/gKg50gVlOrSluZjNhA69bu93buS0hRD9/cpWldLmbG3Qy1FTohBzTcXVmUPnTpFyFe4
 IG7Vqd7MeyAc/t+2lyTAIzaiFFD8v
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:airlied@redhat.com,m:jianhao.xu@seu.edu.cn,m:simona.vetter@ffwll.ch,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C781A8817C
X-Rspamd-Action: no action

> In i810_setup(), if ioremap() fails, the memory allocated
> by alloc_gatt_pages() should be freed. Add free_gatt_pages()
> to do so.

* Were any source code analysis tools involved here?

* Would the term =E2=80=9Cexception handling=E2=80=9D be more appropriate =
than =E2=80=9Can error handle=E2=80=9D?


Regards,
Markus
