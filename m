Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F157F2823
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579D10E2A4;
	Tue, 21 Nov 2023 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Mon, 20 Nov 2023 21:38:38 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F48E10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1700516314; x=1701121114; i=spasswolf@web.de;
 bh=oX4SBh8ZKC6nzb8fjZjeQX69/WkptEXFBXk9lFP+3g8=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=XxNz6aMU7qWtpkSbOlzxFdmRzn6sFreZDDuAkc7rQVa1ncqipOJfSgKy5gLr7jXa
 vQWgWds3r85kh3grLczMl17P1N715ZqzBOkmTvxjqlOtBQFCeU+qvOwD/WKwveeQn
 V87uSLvYw5OwfWdwpUKBXOc08i87dMMp1DtclaUjo6cNRZdW9T06Bhvihy3UnGzGu
 TkuGpa6Gz9GsFK/DIwpdaeql0CjZGzMFcrmUnp66sw5D+xRBFGjf6iN0gF8Z4wxpC
 CjoHDoyUafAUSJC6UhqJGocZEFZZ3P8W2cXVgt31sT4y190j8XF1nISeVeUzUB6Er
 Cd80RZw8o3DSTbV1dg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqIFD-1rhqUe2F6J-00nKdV; Mon, 20
 Nov 2023 22:33:27 +0100
Message-ID: <265248b7b718e057ca97f4e7ad167da6e690f699.camel@web.de>
Subject: commit f3123c2590005 causes deadlocks
From: Bert Karwatzki <spasswolf@web.de>
To: dri-devel@lists.freedesktop.org
Date: Mon, 20 Nov 2023 22:33:26 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:trhv9RqaJSv+ecmmZpViSrTqGJdl8u7Yzug4B7OTQBiKBq2aIQO
 wFSibjKVheiJ3Uvynq+CUUakSm4c6qDPUcIjnVUyVKGHBgyqq9uYlTGs5ukAvY7Zxq55+Tq
 jYKOlcWUAKlKdhyZDIDaMv56jQi+UTkIUqX3UvVqh9v6zvgV62Az2XGj7PP2+XLAl6LZVWP
 u5sU11NQjQtd2F6HQ3j0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gaaqlhjYhyI=;iZecyiEl/297I42bwNUQjwUaBDF
 baRlGUJoePalIqUEEoJs5FN+1ZXvlBxRL6CPHeMFw9lSOsYWzjSWAI41d5JyPGiqh6gQTRS+p
 EL6w0Ks6zxZqFoujW8R0ifeHGwELyf37fWHN6QqP8cLawuzjk6J9BE1Cc6fcunwbT5X8/hZ/y
 USbe4lwASsLvo+5nD8sYOPnRH6lLNZ452VRsgSTzlpMqgCJ/k7MAuvehbagetD+HReKeMimYg
 jw11gCAULs6PtsGxOh2rhJdQBZUSLy1E42Fe8jJ8PANAr99tHJ3+vTcecPfHe/uurU+2RwShk
 HYCVAg+Rs/3Fz5be3w1/Y7yeDuNXZleUa4JCixKLLv+fh97dh/DZpYf00W9HpF+iXSkVTkF19
 d33tKUPIrymG12ozHXlc1HZ28LwwRG5dZHXr/pu2UwfitEytjr552cPe8121Ph5/lghuRu+Kf
 r0qTyCdkUjLXH0JW8VGmhuNr3O78LCnidA/VlfT/Y5GPsztZbLTj1y74Cm4C9Gc8dGus0S3SE
 0T5ftHfmgZLnXNmK7N15ysK3ksJe8AjsZDKxA9l4Bd7O7pbfQCjwCWZLhnH8OZtGEoHMmcksl
 U63wiF3FgEjagmIzgRYLTHSU1MTYearvKcgqTg0AwL2AnkHDIwl91t/nhTd58VvxjMHaxLeCp
 0IclLFTo37PIm9GSBZDoBIBhstv1II2ibg9Ddueu343Wr+j8+Ji3844UBNcaZ7ba7d/gWhO/L
 BjeCiTR3LmsxHDSMiDpQlrSNu7c3jKPQcP2R57ncud57hgR14TnrJCPIr/lr5+9qw9S0hWVJ9
 Z5p8q5XJ0fzmpMy089fI/n7cnpG3QrFUCo8vBDDbMmt/jOBNa7N+wNk5xh6YzA8AUEnlDlqEK
 ioXZtV+OafcgwqTZgy76yOyQt2FdeDZaxGm1TDZXysaY2UIqwfRYdteh3bj6bkucK014AekjJ
 3zc2gg==
X-Mailman-Approved-At: Tue, 21 Nov 2023 08:54:58 +0000
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
Cc: Danilo Krummrich <dakr@redhat.com>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since linux-next-20231115 my linux system (debian sid on msi alpha 15 lapt=
op)
suffers from random deadlocks which can occur after  30 - 180min of usage.=
 These
deadlocks can be actively provoked by creating high system load (usually b=
y
compiling a kernel with make -j NRCPUS) and the opening instances of libre=
office
=2D-writer until the system GUI locks (the mouse cursor can still be moved=
 but the
screen is frozen). In this state ssh'ing into the machine is still possibl=
e and
at least sometimes log messages about hung tasks appear in /var/log/kern.l=
og.

More info can be found here:
https://gitlab.freedesktop.org/drm/amd/-/issues/2994

Using the method described to trigger the bug I bisected the problem in th=
e
linux-next and drm-misc trees to give commit f3123c2590005 as the problem.
As this simple patch fixes the problem

diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..25b97db1b623 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
                      struct drm_sched_entity *entity)
 {
-       if (drm_sched_entity_is_ready(entity))
-               if (drm_sched_can_queue(sched, entity))
-                       drm_sched_run_job_queue(sched);
+       if (drm_sched_can_queue(sched, entity))
+               drm_sched_run_job_queue(sched);
 }

 /**

there might be in the entity->dependency branch of drm_sched_entity_is_rea=
dy
(some kind of circular dependencies ...).

Bert Karwatzki
